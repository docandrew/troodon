with Ada.Text_IO;
with Ada.Exceptions; use Ada.Exceptions;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
with System.Address_Image;

with GL;
with GLext;

with Render;

package body Render.Shaders is

    type Symbol is (USELESS) with Size => 64;

    ---------------------------------------------------------------------------
    -- detectShaderVersion
    ---------------------------------------------------------------------------
    procedure detectShaderVersion is
        use Interfaces.C.Strings;

        glVerMajor : aliased GL.GLint;
        glVerMinor : aliased GL.GLint;
    begin
        Ada.Text_IO.Put_Line ("Troodon: (Shaders) Checking OpenGL and GLSL versions.");

        -- Check OpenGL version in use. If it's not high enough, we can't even
        -- bother detecting the GLSL version
        GL.glGetIntegerv (GLext.GL_MAJOR_VERSION, glVerMajor'Access);
        GL.glGetIntegerv (GLext.GL_MINOR_VERSION, glVerMinor'Access);

        Ada.Text_IO.Put_Line ("Troodon: (Shaders) Detected OpenGL version" & glVerMajor'Image & "." & glVerMinor'Image);

        if glVerMajor <= 2 then
            raise ShaderException with "Detected ancient version of OpenGL, too old to " &
                                       "run Troodon. Please upgrade your video drivers or Mesa, or turn on direct rendering " &
                                       "by setting the environment variable LIBGL_ALWAYS_INDIRECT to 0";
        end if;


        declare
            slVerChars : Interfaces.C.Strings.chars_ptr := GL.glGetString (GLext.GL_SHADING_LANGUAGE_VERSION);
        begin

            if slVerChars = Interfaces.C.Strings.Null_Ptr then
                raise ShaderException with "Troodon: (Shaders) Unable to detect GL Shader Language version available. " &
                                           "You may need to upgrade your video drivers, upgrade Mesa, or turn on direct rendering " &
                                           "by setting the environment variable LIBGL_ALWAYS_INDIRECT to 0";
            end if;

            -- Check GLSL version in use
            declare
                slVerStr   : String := Interfaces.C.Strings.Value (slVerChars);
                slMajorVer : Natural := Natural'Value (slVerStr(1..1));
                slMinorVer : Natural := Natural'Value (slVerStr(3..3));
            begin
                Ada.Text_IO.Put_Line ("Detected GLSL version " & slVerStr);

                -- Need GLSL 1.3 or better
                if slMajorVer <= 1 and slMinorVer < 3 then
                    raise ShaderException with "Your OpenGL version does not support the shader language version Troodon needs. " &
                                               "You may need to upgrade your video drivers, upgrade Mesa, or turn on direct rendering " &
                                               "by setting the environment variable LIBGL_ALWAYS_INDIRECT to 0";
                end if;
            end;
        end;
    end detectShaderVersion;

    ---------------------------------------------------------------------------
    -- printShaderErrors
    ---------------------------------------------------------------------------
    procedure printShaderErrors (obj : GL.GLUint) is
        logLen : aliased GL.GLint;
    begin
        if GLext.glIsShader (obj) = GL.GL_TRUE then
            GLext.glGetShaderiv (obj, GLext.GL_INFO_LOG_LENGTH, logLen'Access);
        elsif GLext.glIsProgram (obj) = GL.GL_TRUE then
            GLext.glGetProgramiv (obj, GLext.GL_INFO_LOG_LENGTH, logLen'Access);
        else
            Ada.Text_IO.Put_Line ("Troodon: attempted to print errors of a non-shader and non-program GL object");
            return;
        end if;

        if logLen = 0 then
            raise Program_Error with "Attempted to print shader/program errors, but no info log present.";
        end if;

        declare
            log : Interfaces.C.char_array(1 .. size_t(logLen));
        begin
            if GLext.glIsShader (obj) = GL.GL_TRUE then
                GLext.glGetShaderInfoLog  (shader  => obj, 
                                           bufSize => logLen,
                                           length  => null,
                                           infoLog => log);
            else
                GLext.glGetProgramInfoLog (program => obj,
                                           bufSize => logLen,
                                           length  => null,
                                           infoLog => log);
            end if;

            Ada.Text_IO.Put_Line (Interfaces.C.To_Ada (log));
        end;
    end printShaderErrors;

    ---------------------------------------------------------------------------
    -- createShaderProgram
    -- Given the addresses of vertex shader and fragment shader source code,
    -- and their respective sizes, compile and link these shaders into a shader
    -- program. Note that until there's a drawable window, this will fail.
    ---------------------------------------------------------------------------
    function createShaderProgram (vertSource : System.Address;
                                  vertSize   : Interfaces.C.size_t;
                                  fragSource : System.Address;
                                  fragSize   : Interfaces.C.size_t) return GL.GLuint is
        use ASCII;

        vertShaderChars : aliased constant Interfaces.C.char_array(1..vertSize) with
            Import, Address => vertSource;

        fragShaderChars : aliased constant Interfaces.C.char_array(1..fragSize) with
            Import, Address => fragSource;

        -- Just for printing to console
        vertShaderStr : String := To_Ada (vertShaderChars, True);
        fragShaderStr : String := To_Ada (fragShaderChars, True);

        vertShader    : GL.GLuint := GLext.glCreateShader (GLext.GL_VERTEX_SHADER);
        fragShader    : GL.GLuint := GLext.glCreateShader (GLext.GL_FRAGMENT_SHADER);

        -- Needed for compatibility w/ glShaderSource
        vertShaderArr : GLext.SourceArray := (1 => vertSource);
        fragShaderArr : GLext.SourceArray := (1 => fragSource);

        glErr         : GL.GLuint;
        compileStatus : aliased GL.GLint := GL.GL_FALSE;
        linkStatus    : aliased GL.GLint := GL.GL_FALSE;
        prog          : GL.GLuint := 0;
    begin
        -- Ada.Text_IO.Put_Line (" Vert Shader Size: " & vertSize'Image);
        -- Ada.Text_IO.Put_Line (" Vert Shader Addr: " & System.Address_Image(vertSource));
        -- Ada.Text_IO.Put_Line (" Loaded Vertex Shader: "   & LF & vertShaderStr & LF);

        -- Ada.Text_IO.Put_Line (" Frag Shader Size: " & fragSize'Image);
        -- Ada.Text_IO.Put_Line (" Frag Shader Addr: " & System.Address_Image(fragSource));
        -- Ada.Text_IO.Put_Line (" Loaded Fragment Shader: " & LF & fragShaderStr & LF);

        -- Set up Font shaders
        -- Easier to call multiple times than set up an array of C strings in Ada
        GLext.glShaderSource (shader => vertShader,
                              count  => 1, 
                              string => vertShaderArr,
                              length => null);

        GLext.glShaderSource (shader => fragShader,
                              count  => 1, 
                              string => fragShaderArr,
                              length => null);

        -- Compile shaders
        Ada.Text_IO.Put_Line (" Compiling Vertex Shader");
        GLext.glCompileShader (vertShader);
        GLext.glGetShaderiv (vertShader, GLext.GL_COMPILE_STATUS, compileStatus'Access);

        if compileStatus /= GL.GL_TRUE then
            Ada.Text_IO.Put_Line ("Troodon: vertex shader compile error, status: " & compileStatus'Image);
            printShaderErrors (vertShader);
        end if;

        Ada.Text_IO.Put_Line (" Compiling Fragment Shader");
        GLext.glCompileShader (fragShader);
        GLext.glGetShaderiv (fragShader, GLext.GL_COMPILE_STATUS, compileStatus'Access);

        if compileStatus /= GL.GL_TRUE then
            Ada.Text_IO.Put_Line ("Troodon: fragment shader compile error, status: " & compileStatus'Image);
            printShaderErrors (fragShader);
        end if;

        Ada.Text_IO.Put_Line (" Creating Shader Program");
        prog := GLext.glCreateProgram;

        if prog = 0 then
            glErr := GL.glGetError;
            return 0;
        end if;

        -- Attach shaders to program
        Ada.Text_IO.Put_Line (" Attaching Shaders");
        GLext.glAttachShader (prog, vertShader);
        GLext.glAttachShader (prog, fragShader);

        -- Link the program
        Ada.Text_IO.Put_Line (" Linking Shader Program");
        GLext.glLinkProgram (prog);
        GLext.glGetProgramiv (prog, GLext.GL_LINK_STATUS, linkStatus'Access);

        if linkStatus /= GL.GL_TRUE then
            Ada.Text_IO.Put_Line (" Shader link error, status: " & linkStatus'Image);
            printShaderErrors (prog);
            return 0;
        end if;

        GLext.glDeleteShader (vertShader);
        GLext.glDeleteShader (fragShader);

        return prog;
    end createShaderProgram;


    ---------------------------------------------------------------------------
    -- initTextShaders
    ---------------------------------------------------------------------------
    procedure initTextShaders is
        use ASCII;
        use Interfaces.C;

        ---------------------------------------------------------------------------
        -- Text Vertex Shader
        ---------------------------------------------------------------------------
        text_vertex_shader_start : Symbol with Import;
        text_vertex_shader_end   : Symbol with Import;
        text_vertex_shader_size  : Symbol with Import;

        textVertexShaderSize : Interfaces.C.size_t with
            Import, Address => text_vertex_shader_size'Address;

        ---------------------------------------------------------------------------
        -- Text Fragment Shader
        ---------------------------------------------------------------------------
        text_fragment_shader_start : Symbol with Import;
        text_fragment_shader_end   : Symbol with Import;
        text_fragment_shader_size  : Symbol with Import;

        textFragmentShaderSize : Interfaces.C.size_t with
            Import, Address => text_fragment_shader_size'Address;
       
    begin
        -- Ada.Text_IO.Put_Line ("text vert shader size: " & textVertexShaderSize'Image);
        -- Ada.Text_IO.Put_Line ("text vert shader addr: " & System.Address_Image(text_vertex_shader_start'Address));
        -- Ada.Text_IO.Put_Line ("text frag shader size: " & textFragmentShaderSize'Image);
        -- Ada.Text_IO.Put_Line ("text frag shader addr: " & System.Address_Image(text_fragment_shader_start'Address));

        textShaderProg := createShaderProgram (vertSource => text_vertex_shader_start'Address,
                                               vertSize   => textVertexShaderSize,
                                               fragSource => text_fragment_shader_start'Address,
                                               fragSize   => textFragmentShaderSize);
        if textShaderProg = 0 then
            raise ShaderException with "Unable to load text shaders";
        end if;

        Ada.Text_IO.Put_Line ("Troodon: Loaded Text Shaders");

        -- Get the uniform and attribs from our shaders
        textAttribCoord  := GLext.glGetAttribLocation  (program => textShaderProg,
                                                        name    => Interfaces.C.To_C ("coord"));
        textUniformTex   := GLext.glGetUniformLocation (program => textShaderProg,
                                                        name    => Interfaces.C.To_C ("tex"));
        textUniformColor := GLext.glGetUniformLocation (program => textShaderProg,
                                                        name    => Interfaces.C.To_C ("color"));
        textUniformOrtho := GLext.glGetUniformLocation (program => textShaderProg,
                                                        name    => Interfaces.C.To_C ("ortho"));
        textUniformAOnly := GLext.glGetUniformLocation (program => textShaderProg,
                                                        name    => Interfaces.C.To_C ("alphaOnly"));

        if textAttribCoord  = -1 or
           textUniformTex   = -1 or
           textUniformColor = -1 or
           textUniformOrtho = -1 or 
           textUniformAOnly = -1 then
             raise ShaderException with "Unable to get shader variables from text program.";
        end if;
    end initTextShaders;

    ---------------------------------------------------------------------------
    -- initCircleShaders
    ---------------------------------------------------------------------------
    procedure initCircleShaders is

        ---------------------------------------------------------------------------
        -- Circle Vertex Shader
        ---------------------------------------------------------------------------
        circle_vertex_shader_start : Symbol with Import;
        circle_vertex_shader_end   : Symbol with Import;
        circle_vertex_shader_size  : Symbol with Import;

        circleVertexShaderSize : Interfaces.C.size_t with
            Import, Address => circle_vertex_shader_size'Address;

        ---------------------------------------------------------------------------
        -- Circle Fragment Shader
        ---------------------------------------------------------------------------
        circle_fragment_shader_start : Symbol with Import;
        circle_fragment_shader_end   : Symbol with Import;
        circle_fragment_shader_size  : Symbol with Import;

        circleFragmentShaderSize : Interfaces.C.size_t with
            Import, Address => circle_fragment_shader_size'Address;

    begin
        circleShaderProg := createShaderProgram (vertSource => circle_vertex_shader_start'Address,
                                                 vertSize   => circleVertexShaderSize,
                                                 fragSource => circle_fragment_shader_start'Address,
                                                 fragSize   => circleFragmentShaderSize);

        if circleShaderProg = 0 then
            raise ShaderException with "Unable to load circle shaders";
        end if;

        Ada.Text_IO.Put_Line("Troodon: Loaded Circle Shaders");

        -- Get the uniform and attribs from our shaders
        circleAttribCoord   := GLext.glGetAttribLocation  (program => circleShaderProg,
                                                           name    => Interfaces.C.To_C ("coord"));
        circleUniformColor  := GLext.glGetUniformLocation (program => circleShaderProg,
                                                           name    => Interfaces.C.To_C ("color"));
        circleUniformCenter := GLext.glGetUniformLocation (program => circleShaderProg,
                                                           name    => Interfaces.C.To_C ("center"));
        circleUniformRadius := GLext.glGetUniformLocation (program => circleShaderProg,
                                                           name    => Interfaces.C.To_C ("radius"));
        circleUniformOrtho  := GLext.glGetUniformLocation (program => circleShaderProg,
                                                           name    => Interfaces.C.To_C ("ortho"));
        circleUniformScrH   := GLext.glGetUniformLocation (program => circleShaderProg,
                                                           name    => Interfaces.C.To_C ("screenHeight"));

        if circleAttribCoord   = -1 or
           circleUniformColor  = -1 or
           circleUniformCenter = -1 or
           circleUniformRadius = -1 or
           circleUniformOrtho  = -1 or
           circleUniformScrH   = -1 then
             raise ShaderException with "Unable to get shader variables from circle program.";
        end if;
    end initCircleShaders;

    ---------------------------------------------------------------------------
    -- initLineShaders
    ---------------------------------------------------------------------------
    procedure initLineShaders is

        line_vertex_shader_start : Symbol with Import;
        line_vertex_shader_end   : Symbol with Import;
        line_vertex_shader_size  : Symbol with Import;

        lineVertexShaderSize : Interfaces.C.size_t with
            Import, Address => line_vertex_shader_size'Address;

        line_fragment_shader_start : Symbol with Import;
        line_fragment_shader_end   : Symbol with Import;
        line_fragment_shader_size  : Symbol with Import;

        lineFragmentShaderSize : Interfaces.C.size_t with
            Import, Address => line_fragment_shader_size'Address;
    begin

        lineShaderProg := createShaderProgram (vertSource => line_vertex_shader_start'Address,
                                               vertSize   => lineVertexShaderSize,
                                               fragSource => line_fragment_shader_start'Address,
                                               fragSize   => lineFragmentShaderSize);

        if lineShaderProg = 0 then
            raise ShaderException with "Unable to load line shaders";
        end if;

        Ada.Text_IO.Put_Line("Troodon: Loaded Line Shaders");

        lineAttribCoord  := GLext.glGetAttribLocation  (program => lineShaderProg,
                                                        name    => Interfaces.C.To_C ("coord"));
        lineUniformOrtho := GLext.glGetUniformLocation (program => lineShaderProg,
                                                        name    => Interfaces.C.To_C ("ortho"));
        lineUniformFrom  := GLext.glGetUniformLocation (program => lineShaderProg,
                                                        name    => Interfaces.C.To_C ("lineFrom"));
        lineUniformTo    := GLext.glGetUniformLocation (program => lineShaderProg,
                                                        name    => Interfaces.C.To_C ("lineTo"));
        lineUniformWidth := GLext.glGetUniformLocation (program => lineShaderProg,
                                                        name    => Interfaces.C.To_C ("width"));
        lineUniformColor := GLext.glGetUniformLocation (program => lineShaderProg,
                                                        name    => Interfaces.C.To_C ("color"));
        lineUniformScrH  := GLext.glGetUniformLocation (program => lineShaderProg,
                                                        name    => Interfaces.C.To_C ("screenHeight"));
        lineUniformAA    := GLext.glGetUniformLocation (program => lineShaderProg,
                                                        name    => Interfaces.C.To_C ("antiAliased"));


        if lineAttribCoord  = -1 or
           lineUniformOrtho = -1 or
           lineUniformFrom  = -1 or
           lineUniformTo    = -1 or
           lineUniformWidth = -1 or
           lineUniformColor = -1 or
           lineUniformScrH  = -1 or 
           lineUniformAA    = -1 then
            raise ShaderException with "Unable to get shader variables from line program.";
        end if;

    end initLineShaders;

    ---------------------------------------------------------------------------
    -- initWinShaders
    ---------------------------------------------------------------------------
    procedure initWinShaders is

        win_vertex_shader_start : Symbol with Import;
        win_vertex_shader_end   : Symbol with Import;
        win_vertex_shader_size  : Symbol with Import;

        winVertexShaderSize : Interfaces.C.size_t with
            Import, Address => win_vertex_shader_size'Address;

        win_fragment_shader_start : Symbol with Import;
        win_fragment_shader_end   : Symbol with Import;
        win_fragment_shader_size  : Symbol with Import;

        winFragmentShaderSize : Interfaces.C.size_t with
            Import, Address => win_fragment_shader_size'Address;
    begin

        winShaderProg := createShaderProgram (vertSource => win_vertex_shader_start'Address,
                                               vertSize   => winVertexShaderSize,
                                               fragSource => win_fragment_shader_start'Address,
                                               fragSize   => winFragmentShaderSize);

        if winShaderProg = 0 then
            raise ShaderException with "Unable to load window shaders";
        end if;

        Ada.Text_IO.Put_Line("Troodon: Loaded Window Shaders");

        winAttribCoord  := GLext.glGetAttribLocation  (program => winShaderProg,
                                                        name    => Interfaces.C.To_C ("coord"));
        winUniformOrtho := GLext.glGetUniformLocation (program => winShaderProg,
                                                        name    => Interfaces.C.To_C ("ortho"));
        winUniformTex   := GLext.glGetUniformLocation (program => winShaderProg,
                                                        name    => Interfaces.C.To_C ("tex"));
        winUniformAlpha := GLext.glGetUniformLocation (program => winShaderProg,
                                                        name    => Interfaces.C.To_C ("alpha"));

        if winAttribCoord  = -1 or
           winUniformOrtho = -1 or
           winUniformTex   = -1 or
           winUniformAlpha = -1 then
            raise ShaderException with "Unable to get shader variables from win program.";
        end if;

    end initWinShaders;

    ---------------------------------------------------------------------------
    -- initShaders
    -- Load, compile and link the shaders used for OpenGL rendering
    ---------------------------------------------------------------------------
    procedure initShaders is
    begin
        detectShaderVersion;
        initTextShaders;
        initCircleShaders;
        initLineShaders;
        initWinShaders;
        -- initShadowShaders;
    end initShaders;

    procedure teardownShaders is
    begin
        GLext.glDeleteProgram (textShaderProg);
        GLext.glDeleteProgram (circleShaderProg);
        GLext.glDeleteProgram (lineShaderProg);
        GLext.glDeleteProgram (winShaderProg);
        -- GLext.glDeleteProgram (shadowShaderProg);
    end teardownShaders;

end Render.Shaders;