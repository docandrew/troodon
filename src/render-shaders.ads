with GL;

package Render.Shaders is

    ShaderException : Exception;

    ---------------------------------------------------------------------------
    -- Shader Variables. Consider moving these into their own record types
    ---------------------------------------------------------------------------

    -- Text shader
    textShaderProg     : GL.GLuint := 0;
    
    textAttribCoord    : GL.GLint;
    
    textUniformTex     : GL.GLint;
    textUniformColor   : GL.GLint;
    textUniformOrtho   : GL.GLint;
    textUniformAOnly   : GL.GLint;  -- if font texture is alpha channel only (monochrome fonts)
    textVBO            : aliased GL.GLuint;

    -- Circle shader
    circleShaderProg    : GL.GLuint := 0;
    
    circleAttribCoord   : GL.GLint;

    circleUniformColor  : GL.GLint;
    circleUniformCenter : GL.GLint;
    circleUniformRadius : GL.GLint;
    circleUniformOrtho  : GL.GLint;
    circleUniformScrH   : GL.GLint;
    circleVBO           : aliased GL.GLuint;

    -- Line shader
    lineShaderProg      : GL.GLuint := 0;

    lineAttribCoord     : GL.GLint;
    
    lineUniformOrtho    : GL.GLint;
    lineUniformFrom     : GL.GLint;
    lineUniformTo       : GL.GLint;
    lineUniformWidth    : GL.GLint;
    lineUniformColor    : GL.GLint;
    lineUniformScrH     : GL.GLint;
    lineUniformAA       : GL.GLint;
    lineVBO             : aliased GL.GLuint;

    -- Compositor/Window Shader
    winShaderProg       : GL.GLuint := 0;

    winAttribCoord      : GL.GLint;

    winUniformOrtho     : GL.GLint;
    winUniformTex       : GL.GLint;
    winVBO              : aliased GL.GLuint;

    ---------------------------------------------------------------------------
    -- Part of Troodon's philosophy is being distributed as a single
    -- executable. We bake shaders into the final binary and extract them
    -- here.
    ---------------------------------------------------------------------------
    procedure initShaders;
    procedure teardownShaders;

    procedure printShaderErrors (obj : GL.GLUint);

end Render.Shaders;