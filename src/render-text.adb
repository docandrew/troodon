with Ada.Text_IO;
with Interfaces; use Interfaces;
with Interfaces.C; use Interfaces.C;
with System;

with Freetype;
with GL;
with GLext;

with Render.Fonts;
with Render.Shaders;
with Render.Util;

package body Render.Text is

        -----------------------------------------------------------------------
        -- render a string to an OpenGL surface
        -- @param x, y top-left coordinate of the text.
        -----------------------------------------------------------------------
        procedure renderGLText (s       : String; 
                                x       : in out Float;
                                y       : in out Float;
                                windowW : Float;
                                windowH : Float)
        is
            
            textBox : Render.Util.Box;

            tex   : aliased GL.GLuint;
            glErr : GL.GLenum;

            -- Coord/Bounds of each letter
            xt : Float := x;
            yt : Float := y;
            wt : Float;
            ht : Float;

            g : Freetype.FT_GlyphSlot;

            orthoM : Render.Util.Mat4 := Render.Util.ortho (0.0, windowW, windowH, 0.0, -1.0, 1.0);
        begin
            -- Use the text shader for this part.
            GLext.glUseProgram (Render.Shaders.textShaderProg);
            
            glErr := GL.glGetError;
            Ada.Text_IO.Put_Line ("glUseProgram GL error? " & glErr'Image);

            GL.glActiveTexture (texture  => GL.GL_TEXTURE0);

            glErr := GL.glGetError;
            Ada.Text_IO.Put_Line ("glActiveTexture error? " & glErr'Image);

            GL.glGenTextures (n        => 1,
                              textures => tex'Access);

            glErr := GL.glGetError;
            Ada.Text_IO.Put_Line ("glGenTextures error? " & glErr'Image);

            GL.glBindTexture (target   => GL.GL_TEXTURE_2D, 
                              texture  => tex);

            glErr := GL.glGetError;
            Ada.Text_IO.Put_Line ("glBindTexture error? " & glErr'Image);

            -- Set text color
            GLext.glUniform4f (Render.Shaders.textUniformColor, 1.0, 1.0, 1.0, 1.0);

            glErr := GL.glGetError;
            Ada.Text_IO.Put_Line ("glUniform error? " & glErr'Image);

            -- Set text texture
            GLext.glUniform1i (location => Render.Shaders.textUniformTex,
                               v0       => 0);

            glErr := GL.glGetError;
            Ada.Text_IO.Put_Line ("glUniformi error? " & glErr'Image);

            -- Set the viewport to the proper window dimensions
            GL.glViewport (x      => 0,
                           y      => 0,
                           width  => GL.GLsizei(windowW),
                           height => GL.GLsizei(windowH));

            glErr := GL.glGetError;
            Ada.Text_IO.Put_Line ("glViewport error? " & glErr'Image);

            -- Send shader our orthographic projection
            -- GLSL matrices are column major, so need to transpose here.
            GLext.glUniformMatrix4fv (location  => Render.Shaders.textUniformOrtho,
                                      count     => 1,
                                      transpose => GL.GL_TRUE,
                                      value     => orthoM(1)'Access);

            glErr := GL.glGetError;
            Ada.Text_IO.Put_Line ("glUniformMatrix4fv error? " & glErr'Image);

            -- require 1-byte alignment for uploading texture data
            GL.glPixelStorei (pname     => GL.GL_UNPACK_ALIGNMENT,
                              param     => 1);

            glErr := GL.glGetError;
            Ada.Text_IO.Put_Line ("glPixelStorei error? " & glErr'Image);

            -- Clamp to edges to prevent scaling artifacts
            GL.glTexParameteri (target  => GL.GL_TEXTURE_2D,
                                pname   => GL.GL_TEXTURE_WRAP_S,
                                param   => GL.GL_CLAMP_TO_EDGE);

            glErr := GL.glGetError;
            Ada.Text_IO.Put_Line ("glTexParameteri error? " & glErr'Image);

            GL.glTexParameteri (target  => GL.GL_TEXTURE_2D,
                                pname   => GL.GL_TEXTURE_WRAP_T,
                                param   => GL.GL_CLAMP_TO_EDGE);                                

            glErr := GL.glGetError;
            Ada.Text_IO.Put_Line ("glTexParameteri 2 error? " & glErr'Image);

            -- Linear filtering
            GL.glTexParameteri (target  => GL.GL_TEXTURE_2D,
                                pname   => GL.GL_TEXTURE_MIN_FILTER,
                                param   => GL.GL_LINEAR);

            glErr := GL.glGetError;
            Ada.Text_IO.Put_Line ("glTexParameteri 3 error? " & glErr'Image);

            GL.glTexParameteri (target  => GL.GL_TEXTURE_2D,
                                pname   => GL.GL_TEXTURE_MAG_FILTER,
                                param   => GL.GL_LINEAR);

            glErr := GL.glGetError;
            Ada.Text_IO.Put_Line ("glTexParameteri 4 error? " & glErr'Image);

            --@TODO Don't know that we need to set this up every time we draw. Can probably re-use.
            GLext.glGenBuffers (1, Render.Shaders.textVBO'Access);
            glErr := GL.glGetError;
            Ada.Text_IO.Put_Line ("glGenBuffers error? " & glErr'Image);

            -- Set up VBO for our vertex data
            GLext.glEnableVertexAttribArray (GL.GLuint(Render.Shaders.textAttribCoord));

            glErr := GL.glGetError;
            Ada.Text_IO.Put_Line ("glEnableVertexAttribArray error? " & glErr'Image);

            GLext.glBindBuffer (target => GLext.GL_ARRAY_BUFFER,
                                buffer => Render.Shaders.textVBO);

            glErr := GL.glGetError;
            Ada.Text_IO.Put_Line ("glBindBuffer error? " & glErr'Image);

            GLext.glVertexAttribPointer (index      => GL.GLuint(Render.Shaders.textAttribCoord),
                                         size       => 4,
                                         c_type     => GL.GL_FLOAT,
                                         normalized => GL.GL_FALSE,
                                         stride     => 0,
                                         pointer    => System.Null_Address);

            glErr := GL.glGetError;
            Ada.Text_IO.Put_Line ("glVertexAttribPointer error? " & glErr'Image);

            -- Loop through each character of the string, drawing it.                                         
            for c of s loop
                -- attempt to render the character, skip chars that aren't associated
                -- with a drawable glyph.
                if Render.Fonts.loadGlyph(c) then
                    g := Render.Fonts.face.glyph;

                    -- upload the bitmap
                    GL.glTexImage2D (target          => GL.GL_TEXTURE_2D,
                                     level           => 0,
                                     internalFormat  => GL.GL_ALPHA,
                                     width           => GL.GLsizei(g.bitmap.width),
                                     height          => GL.GLsizei(g.bitmap.rows),
                                     border          => 0,
                                     format          => GL.GL_ALPHA,
                                     c_type          => GL.GL_UNSIGNED_BYTE,
                                     pixels          => g.bitmap.buffer);

                    glErr := GL.glGetError;
                    Ada.Text_IO.Put_Line ("glTexImage2D error? " & glErr'Image);

                    -- Make adjustments for letter placement
                    xt := x + Float(g.bitmap_left);
                    yt := y - Float(g.bitmap_top);

                    -- Get width, height of letter
                    wt := GL.GLfloat(g.bitmap.width);
                    ht := GL.GLfloat(g.bitmap.rows);

                    -- Use window coords for placement.
                    textBox := (
                        1 => (xt,      yt + ht, 0.0, 1.0), -- bottom left
                        2 => (xt,      yt,      0.0, 0.0), -- top left
                        3 => (xt + wt, yt + ht, 1.0, 1.0), -- bottom right
                        4 => (xt + wt, yt,      1.0, 0.0)  -- top right
                    );

                    Ada.Text_IO.Put_Line ("Drawing " & c);
                    Ada.Text_IO.Put_Line (" Width: " & g.bitmap.width'Image);
                    Ada.Text_IO.Put_Line (" Rows:  " & g.bitmap.rows'Image);
                    Ada.Text_IO.Put_Line (" xt:    " & xt'Image);
                    Ada.Text_IO.Put_Line (" yt:    " & yt'Image);
                    Ada.Text_IO.Put_Line (" wt:    " & wt'Image);
                    Ada.Text_IO.Put_Line (" ht:    " & ht'Image);

                    -- Ada.Text_IO.Put_Line ("Text Box: ");
                    -- Ada.Text_IO.Put_Line ("" & textBox(1)'Image);
                    -- Ada.Text_IO.Put_Line ("" & textBox(2)'Image);
                    -- Ada.Text_IO.Put_Line ("" & textBox(3)'Image);
                    -- Ada.Text_IO.Put_Line ("" & textBox(4)'Image);

                    -- Draw the character on the screen
                    GLext.glBufferData (target => GLext.GL_ARRAY_BUFFER,
                                        size   => textBox'Size / 8,
                                        data   => textBox'Address,
                                        usage  => GLext.GL_DYNAMIC_DRAW);

                    glErr := GL.glGetError;
                    Ada.Text_IO.Put_Line ("glBufferData error? " & glErr'Image);

                    -- glErr := Interfaces.C.unsigned(textBox'Last);
                    -- Ada.Text_IO.Put_Line ("glDrawArrays count: " & glErr'Image);
                    GL.glDrawArrays (mode   => GL.GL_TRIANGLE_STRIP,
                                     first  => 0,
                                     count  => Interfaces.C.int(textBox'Last));

                    glErr := GL.glGetError;
                    Ada.Text_IO.Put_Line ("glDrawArrays error? " & glErr'Image);

                    -- Advance the coords to the next char
                    -- advance is in units of pixel/64
                    x := x + Float(g.advance.x) / 64.0;
                    y := y + Float(g.advance.y) / 64.0;
                end if;
            end loop;

            GLext.glDisableVertexAttribArray (GL.GLuint(Render.Shaders.textAttribCoord));
            glErr := GL.glGetError;
            Ada.Text_IO.Put_Line ("glDisableVertexAttribArray error? " & glErr'Image);

            GL.glDeleteTextures (1, tex'Access);
            glErr := GL.glGetError;
            Ada.Text_IO.Put_Line ("glDeleteTextures error? " & glErr'Image);

            -- If we re-use the VBO can remove this line.
            GLext.glDeleteBuffers (1, Render.Shaders.textVBO'Access);
            glErr := GL.glGetError;
            Ada.Text_IO.Put_Line ("glDeleteBuffers error? " & glErr'Image);

            -- Stop using the text shader
            GLext.glUseProgram (0);

        end renderGLText;

end Render.Text;