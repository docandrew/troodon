with Interfaces.C;

with GLX;
with xcb;
with xproto;
with Xlib;

-- with setup;
package Render is
    OpenGLException : Exception;
    -- function getVisualID return Interfaces.C.int;
    -- procedure setVisualID(id : Interfaces.C.int);

    type RenderBackend is (SOFTWARE, OPENGL);

    -- We bake shader files into our binary to make this distributable as
    --  a single executable. We could make them strings inside the Ada code
    --  but it's more convenient to be able to edit them within the source tree
    --  as separate files.
    type Symbol is (USELESS);
    
    -- ShaderFile_Sym_Start : Symbol with Import, External_Name => "shader_start";
    -- ShaderFile_Sym_End   : Symbol with Import, External_Name => "shader_end";
    -- ShaderFile_Sym_Size  : Symbol with Import, External_Name => "shader_size"

    -- Information about Renderers common to all windows.
    type Renderer (kind : RenderBackend := SOFTWARE) is record
        visualID : xproto.xcb_visualid_t;

        case kind is
            when SOFTWARE =>
                gcConfig : aliased xproto.xcb_create_gc_value_list_t;
            when OPENGL =>
                display  : not null access Xlib.Display;
                context  : GLX.GLXContext;
                fbConfig : GLX.GLXFBConfig;
                colormap : xproto.xcb_colormap_t;
        end case;
    end record;

    -- Information about the renderer specific to a particular window.
    type RenderingSurface (kind : RenderBackend := SOFTWARE) is record
        renderer : render.Renderer;

        case kind is
            when SOFTWARE =>
                gc       : xproto.xcb_gcontext_t;
            when OPENGL =>
                drawable : GLX.GLXWindow;
        end case;
    end record;

    ---------------------------------------------------------------------------
    -- getFBConfig
    -- Query the X Server for an acceptable framebuffer configuration.
    ---------------------------------------------------------------------------
    -- function getFBConfig (connection : not null access xcb.xcb_connection_t;
    --                       display    : not null access Xlib.Display) return GLX.GLXFBConfig;

    ---------------------------------------------------------------------------
    -- initRendering
    -- Set up the OpenGL Rendering backend
    ---------------------------------------------------------------------------
    function initRendering (connection : not null access xcb.xcb_connection_t;
                            display    : not null access Xlib.Display) return Renderer;
end render;