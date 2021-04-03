with Ada.Numerics.Elementary_Functions;
with Ada.Text_IO;
with Interfaces.C; use Interfaces.C;
with System;

with GL;
with GLext;
with Render.Shaders;
with Render.Util;

package body Render.Widgets is

    ---------------------------------------------------------------------------
    -- drawCircle
    ---------------------------------------------------------------------------
    procedure drawCircle (x       : Float;
                          y       : Float;
                          radius  : Float;
                          r       : Float;
                          g       : Float;
                          b       : Float;
                          a       : Float;
                          windowW : Float;
                          windowH : Float) is
        
        glErr : GL.GLuint;
        circleBox : Render.Util.Box2D;
        orthoM    : Render.Util.Mat4 := Render.Util.ortho (0.0, windowW, windowH, 0.0, -1.0, 1.0);
    begin
        -- Use our circle shader program
        GLext.glUseProgram (Render.Shaders.circleShaderProg);
        
        -- glErr := GL.glGetError;
        -- Ada.Text_IO.Put_Line ("drawCircle: glUseProgram error? " & glErr'Image);
        
        -- projection
        GLext.glUniformMatrix4fv (location  => Render.Shaders.circleUniformOrtho,
                                  count     => 1,
                                  transpose => GL.GL_TRUE,
                                  value     => orthoM(1)'Access);

        -- glErr := GL.glGetError;
        --Ada.Text_IO.Put_Line ("drawCircle: glUniformMatrix4fv error? " & glErr'Image);
        -- Set up fragment shader

        -- Circle color
        GLext.glUniform4f (location => Render.Shaders.circleUniformColor,
                           v0       => r,
                           v1       => g,
                           v2       => b,
                           v3       => a);

        -- glErr := GL.glGetError;
        --Ada.Text_IO.Put_Line ("drawCircle: glUniform4f error? " & glErr'Image);

        -- Not sure if we can re-use the coord from the vertex stage or not
        GLext.glUniform2f (location => Render.Shaders.circleUniformCenter,
                           v0       => x,
                           v1       => y);

        -- glErr := GL.glGetError;
        --Ada.Text_IO.Put_Line ("drawCircle: glUniform2f error? " & glErr'Image);

        GLext.glUniform1f (location => Render.Shaders.circleUniformScrH,
                           v0       => windowH);
        
        -- glErr := GL.glGetError;
        --Ada.Text_IO.Put_Line ("drawCircle: glUniform1f error? " & glErr'Image);

        GLext.glUniform1f (location => Render.Shaders.circleUniformRadius,
                           v0       => radius);
        
        -- glErr := GL.glGetError;
        --Ada.Text_IO.Put_Line ("drawCircle: glUniform1f error? " & glErr'Image);

        GL.glViewport (x      => 0,
                       y      => 0,
                       width  => GL.GLsizei(windowW),
                       height => GL.GLsizei(windowH));
        
        -- glErr := GL.glGetError;
        --Ada.Text_IO.Put_Line ("drawCircle: glViewport error? " & glErr'Image);

        -- Set up VBO
        GLext.glGenBuffers (1, Render.Shaders.circleVBO'Access);

        -- glErr := GL.glGetError;
        --Ada.Text_IO.Put_Line ("drawCircle: glGenBuffers error? " & glErr'Image);

        -- Set up vertex shader
        GLext.glEnableVertexAttribArray (GL.GLuint(Render.Shaders.circleAttribCoord));

        -- glErr := GL.glGetError;
        --Ada.Text_IO.Put_Line ("drawCircle: glEnableVertexAttribArray error? " & glErr'Image);
        
        GLext.glBindBuffer (target => GLext.GL_ARRAY_BUFFER,
                            buffer => Render.Shaders.circleVBO);

        -- glErr := GL.glGetError;
        --Ada.Text_IO.Put_Line ("drawCircle: glBindBuffer error? " & glErr'Image);

        -- center of the circle
        GLext.glVertexAttribPointer (index      => GL.GLuint(Render.Shaders.circleAttribCoord),
                                     size       => 2,
                                     c_type     => GL.GL_FLOAT,
                                     normalized => GL.GL_FALSE,
                                     stride     => 0,
                                     pointer    => System.Null_Address);

        -- glErr := GL.glGetError;
        --Ada.Text_IO.Put_Line ("drawCircle: glVertexAttrib error? " & glErr'Image);

        -- Four corners of the "square" containing our circle (texture coords not used yet)
        circleBox := (
            1 => (x - radius, y + radius),  -- bottom left
            2 => (x - radius, y - radius),  -- top left
            3 => (x + radius, y + radius),  -- bottom right
            4 => (x + radius, y - radius)   -- top right
        );

        GLext.glBufferData (target => GLext.GL_ARRAY_BUFFER,
                            size   => circleBox'Size / 8,
                            data   => circleBox'Address,
                            usage  => GLext.GL_DYNAMIC_DRAW);

        -- glErr := GL.glGetError;
        --Ada.Text_IO.Put_Line ("drawCircle: glBufferData error? " & glErr'Image);

        GL.glDrawArrays (mode  => GL.GL_TRIANGLE_STRIP,
                         first => 0,
                         count => Interfaces.C.int(circleBox'Last));

        -- glErr := GL.glGetError;
        --Ada.Text_IO.Put_Line ("drawCircle: glDrawArrays error? " & glErr'Image);

        GLext.glDisableVertexAttribArray (GL.GLuint(Render.Shaders.circleAttribCoord));
        GLext.glDeleteBuffers (1, Render.Shaders.circleVBO'Access);
        GLext.glUseProgram (0);
    end drawCircle;

    ---------------------------------------------------------------------------
    -- drawLine
    -- @TODO - might be a good idea to bundle up all these draw calls, esp. if
    -- a bunch of lines are being drawn.
    ---------------------------------------------------------------------------
    procedure drawLine (fromX     : Float;
                        fromY     : Float;
                        toX       : Float;
                        toY       : Float;
                        width     : Float;
                        r         : Float;
                        g         : Float;
                        b         : Float;
                        a         : Float;
                        windowW   : Float;
                        windowH   : Float;
                        antiAliased : Boolean := True) is

        use Ada.Numerics.Elementary_Functions; -- for ceil, sqrt

        glErr    : GL.GLuint;

        -- If antialiasing, we add a little thickness to the line and blend it in shader.
        newWidth : Float     := (if antiAliased then width + 2.0 else width);
        aaInt    : GL.GLint  := (if antiAliased then 1 else 0);
        
        line     : Render.Util.Line2D;
        orthoM   : Render.Util.Mat4 := Render.Util.ortho (0.0, windowW, windowH, 0.0, -1.0, 1.0);
    begin
        GLext.glUseProgram (Render.Shaders.lineShaderProg);

        -- need to set line width a bit wider than we requested for fragment shader to work
        -- From nVidia GPU Gems 22

        GL.glLineWidth (newWidth);

        line := (1 => (fromX, fromY), 2 => (toX, toY));

        GLext.glUniform1i (location => Render.Shaders.lineUniformAA,
                           v0       => aaInt);

        -- projection
        GLext.glUniformMatrix4fv (location  => Render.Shaders.lineUniformOrtho,
                                  count     => 1,
                                  transpose => GL.GL_TRUE,
                                  value     => orthoM(1)'Access);

        GLext.glUniform2f (location => Render.Shaders.lineUniformFrom,
                           v0       => fromX,
                           v1       => fromY);

        GLext.glUniform2f (location => Render.Shaders.lineUniformTo,
                           v0       => toX,
                           v1       => toY);

        GLext.glUniform1f (location => Render.Shaders.lineUniformWidth,
                           v0       => newWidth);

        GLext.glUniform4f (location => Render.Shaders.lineUniformColor,
                           v0       => r,
                           v1       => g,
                           v2       => b,
                           v3       => a);

        GLext.glUniform1f (location => Render.Shaders.lineUniformScrH,
                           v0       => windowH);

        GL.glViewport (x      => 0,
                       y      => 0,
                       width  => GL.GLsizei(windowW),
                       height => GL.GLsizei(windowH));

        -- Set up VBO
        GLext.glGenBuffers (1, Render.Shaders.lineVBO'Access);

        -- Set up vertex shader
        GLext.glEnableVertexAttribArray (GL.GLuint(Render.Shaders.lineAttribCoord));

        GLext.glBindBuffer (target => GLext.GL_ARRAY_BUFFER,
                            buffer => Render.Shaders.lineVBO);

        -- Pass 2-D coords for the line segment.
        GLext.glVertexAttribPointer (index      => GL.GLuint(Render.Shaders.lineAttribCoord),
                                     size       => 2,
                                     c_type     => GL.GL_FLOAT,
                                     normalized => GL.GL_FALSE,
                                     stride     => 0,
                                     pointer    => System.Null_Address);

        -- Four corners of the "square" containing our circle (texture coords not used yet)
        -- Ada.Text_IO.Put_Line ("Drawing line from (" & fromX'Image & "," & fromY'Image & ") to (" & toX'Image & "," & toY'Image & ")");

        GLext.glBufferData (target => GLext.GL_ARRAY_BUFFER,
                            size   => line'Size / 8,
                            data   => line'Address,
                            usage  => GLext.GL_DYNAMIC_DRAW);

        GL.glDrawArrays (mode  => GL.GL_LINES,
                         first => 0,
                         count => Interfaces.C.int(line'Last));

        GLext.glDisableVertexAttribArray (GL.GLuint(Render.Shaders.lineAttribCoord));
        GLext.glDeleteBuffers (1, Render.Shaders.lineVBO'Access);
        GLext.glUseProgram (0);
    end drawLine;

end Render.Widgets;
