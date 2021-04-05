with Ada.Characters.Conversions;
with Ada.Strings.UTF_Encoding;
with Ada.Strings.UTF_Encoding.Wide_Wide_Strings;
with Ada.Text_IO;
with Interfaces; use Interfaces;
with Interfaces.C; use Interfaces.C;
with System;

with Freetype;
with FTimage;
with GL;
with GLext;

with Render.Fonts;
with Render.Shaders;
with Render.Util;

package body Render.Text is

        -----------------------------------------------------------------------
        -- renderGLText
        -----------------------------------------------------------------------
        procedure renderGLText (s        : String;
                                x        : in out Float;
                                y        : in out Float;
                                windowW  : Float;
                                windowH  : Float;
                                fontFace : Freetype.FT_Face := Render.Fonts.face)
        is
            package UTF renames Ada.Strings.UTF_Encoding.Wide_Wide_Strings;

            textBox : Render.Util.Box;

            tex   : aliased GL.GLuint;
            glErr : GL.GLenum;

            -- Coord/Bounds of each letter
            xt : Float := x;
            yt : Float := y;
            wt : Float;
            ht : Float;

            g : Freetype.FT_GlyphSlot;

            -- Need a string of UTF-32 characters that Freetype can render.
            s32 : Wide_Wide_String := UTF.Decode (s);

            orthoM : Render.Util.Mat4 := Render.Util.ortho (0.0, windowW, windowH, 0.0, -1.0, 1.0);
        begin
            -- Use the text shader for this part.
            GLext.glUseProgram (Render.Shaders.textShaderProg);
            
            -- glErr := GL.glGetError;
            -- Ada.Text_IO.Put_Line ("glUseProgram GL error? " & glErr'Image);

            GL.glActiveTexture (texture  => GL.GL_TEXTURE0);

            -- glErr := GL.glGetError;
            -- Ada.Text_IO.Put_Line ("glActiveTexture error? " & glErr'Image);

            GL.glGenTextures (n        => 1,
                              textures => tex'Access);

            -- glErr := GL.glGetError;
            -- Ada.Text_IO.Put_Line ("glGenTextures error? " & glErr'Image);

            GL.glBindTexture (target   => GL.GL_TEXTURE_2D, 
                              texture  => tex);

            -- glErr := GL.glGetError;
            -- Ada.Text_IO.Put_Line ("glBindTexture error? " & glErr'Image);

            -- Set text color
            -- @TODO make this a function param
            GLext.glUniform4f (Render.Shaders.textUniformColor, 1.0, 1.0, 1.0, 1.0);

            -- glErr := GL.glGetError;
            -- Ada.Text_IO.Put_Line ("glUniform error? " & glErr'Image);

            -- Set text texture
            GLext.glUniform1i (location => Render.Shaders.textUniformTex,
                               v0       => 0);

            -- glErr := GL.glGetError;
            -- Ada.Text_IO.Put_Line ("glUniformi error? " & glErr'Image);

            -- Set the viewport to the proper window dimensions
            GL.glViewport (x      => 0,
                           y      => 0,
                           width  => GL.GLsizei(windowW),
                           height => GL.GLsizei(windowH));

            -- glErr := GL.glGetError;
            -- Ada.Text_IO.Put_Line ("glViewport error? " & glErr'Image);

            -- Send shader our orthographic projection
            -- GLSL matrices are column major, so need to transpose here.
            GLext.glUniformMatrix4fv (location  => Render.Shaders.textUniformOrtho,
                                      count     => 1,
                                      transpose => GL.GL_TRUE,
                                      value     => orthoM(1)'Access);

            -- glErr := GL.glGetError;
            -- Ada.Text_IO.Put_Line ("glUniformMatrix4fv error? " & glErr'Image);

            -- require 1-byte alignment for uploading texture data
            GL.glPixelStorei (pname     => GL.GL_UNPACK_ALIGNMENT,
                              param     => 1);

            -- glErr := GL.glGetError;
            -- Ada.Text_IO.Put_Line ("glPixelStorei error? " & glErr'Image);

            -- Clamp to edges to prevent scaling artifacts
            GL.glTexParameteri (target  => GL.GL_TEXTURE_2D,
                                pname   => GL.GL_TEXTURE_WRAP_S,
                                param   => GL.GL_CLAMP_TO_EDGE);

            -- glErr := GL.glGetError;
            -- Ada.Text_IO.Put_Line ("glTexParameteri error? " & glErr'Image);

            GL.glTexParameteri (target  => GL.GL_TEXTURE_2D,
                                pname   => GL.GL_TEXTURE_WRAP_T,
                                param   => GL.GL_CLAMP_TO_EDGE);                                

            -- glErr := GL.glGetError;
            -- Ada.Text_IO.Put_Line ("glTexParameteri 2 error? " & glErr'Image);

            -- Linear filtering
            GL.glTexParameteri (target  => GL.GL_TEXTURE_2D,
                                pname   => GL.GL_TEXTURE_MIN_FILTER,
                                param   => GL.GL_LINEAR);

            -- glErr := GL.glGetError;
            -- Ada.Text_IO.Put_Line ("glTexParameteri 3 error? " & glErr'Image);

            GL.glTexParameteri (target  => GL.GL_TEXTURE_2D,
                                pname   => GL.GL_TEXTURE_MAG_FILTER,
                                param   => GL.GL_LINEAR);

            -- glErr := GL.glGetError;
            -- Ada.Text_IO.Put_Line ("glTexParameteri 4 error? " & glErr'Image);

            --@TODO Don't know that we need to set this up every time we draw. Can probably re-use.
            GLext.glGenBuffers (1, Render.Shaders.textVBO'Access);
            -- glErr := GL.glGetError;
            -- Ada.Text_IO.Put_Line ("glGenBuffers error? " & glErr'Image);

            -- Set up VBO for our vertex data
            GLext.glEnableVertexAttribArray (GL.GLuint(Render.Shaders.textAttribCoord));

            -- glErr := GL.glGetError;
            -- Ada.Text_IO.Put_Line ("glEnableVertexAttribArray error? " & glErr'Image);

            GLext.glBindBuffer (target => GLext.GL_ARRAY_BUFFER,
                                buffer => Render.Shaders.textVBO);

            -- glErr := GL.glGetError;
            -- Ada.Text_IO.Put_Line ("glBindBuffer error? " & glErr'Image);

            GLext.glVertexAttribPointer (index      => GL.GLuint(Render.Shaders.textAttribCoord),
                                         size       => 4,
                                         c_type     => GL.GL_FLOAT,
                                         normalized => GL.GL_FALSE,
                                         stride     => 0,
                                         pointer    => System.Null_Address);

            -- glErr := GL.glGetError;
            -- Ada.Text_IO.Put_Line ("glVertexAttribPointer error? " & glErr'Image);

            -- Loop through each character of the string, drawing it.
            -- Ada.Text_IO.Put_Line ("s32'Length:" & Positive'Image(s32'Length));
            for c of s32 loop
                -- attempt to render the character, skip chars that aren't associated
                -- with a drawable glyph.
                if Render.Fonts.loadGlyph (c, fontFace) then
                    g := fontFace.glyph;

                    --Ada.Text_IO.Put_Line (" Glyph Pixel Mode: " & g.bitmap.pixel_mode'Image);

                    -- upload the bitmap
                    if g.bitmap.pixel_mode = FTimage.FT_Pixel_Mode'Pos(FTimage.FT_PIXEL_MODE_BGRA) then
                        -- Color font, probably emoji.

                        GLext.glUniform1i (location => Render.Shaders.textUniformAOnly,
                                           v0       => 0);

                        GL.glTexImage2D (target         => GL.GL_TEXTURE_2D,
                                         level          => 0,
                                         internalFormat => GL.GL_RGBA,
                                         width          => GL.GLsizei(g.bitmap.width),
                                         height         => GL.GLsizei(g.bitmap.rows),
                                         border         => 0,
                                         format         => GL.GL_BGRA,
                                         c_type         => GL.GL_UNSIGNED_BYTE,
                                         pixels         => g.bitmap.buffer);

                        -- Bitmap fonts don't respect Set_Pixel_Size like the vector
                        -- rendering does, so we need to use OpenGL to scale the quads.
                        -- There's probably more to it than this, but we just set the
                        -- height to the selected font size, and adjust width to keep
                        -- the original glyph's aspect ratio.
                        -- Looks just a little better if we bump up the font size here
                        declare
                            aspect : Float := Float(g.bitmap.width) / Float(g.bitmap.rows);
                            --(cols per row)
                        begin
                            ht := GL.GLFloat(Render.Fonts.FONT_SIZE + 4);
                            wt := GL.GLFloat(Render.Fonts.FONT_SIZE + 4) * aspect;

                        end;

                        -- Need to use top-left corner of the emoji here.
                        xt := x;
                        yt := y - ht;
                        -- xt := x - wt;
                        -- yt := y - ht;

                        -- Advance emojis horizontally only.
                        -- @TODO padding?
                        x := x + Float(wt);
                    else
                        -- monochrome font.
                        GLext.glUniform1i (location => Render.Shaders.textUniformAOnly,
                                           v0       => 1);

                        GL.glTexImage2D (target         => GL.GL_TEXTURE_2D,
                                         level          => 0,
                                         internalFormat => GL.GL_ALPHA,
                                         width          => GL.GLsizei(g.bitmap.width),
                                         height         => GL.GLsizei(g.bitmap.rows),
                                         border         => 0,
                                         format         => GL.GL_ALPHA,
                                         c_type         => GL.GL_UNSIGNED_BYTE,
                                         pixels         => g.bitmap.buffer);

                        -- Make adjustments for letter placement
                        xt := x + Float(g.bitmap_left);
                        yt := y - Float(g.bitmap_top);

                        -- Get width, height of letter
                        wt := GL.GLfloat(g.bitmap.width);
                        ht := GL.GLfloat(g.bitmap.rows);

                        -- Advance the coords to the next char
                        -- advance is in units of pixel/64
                        x := x + Float(g.advance.x) / 64.0;
                        y := y + Float(g.advance.y) / 64.0;
                    end if;

                    -- Use window coords for placement. Everything is "upside down"
                    -- since our origin (0,0) is at top-left of window.
                    textBox := (
                        1 => (xt,      yt + ht, 0.0, 1.0), -- bottom left
                        2 => (xt,      yt,      0.0, 0.0), -- top left
                        3 => (xt + wt, yt + ht, 1.0, 1.0), -- bottom right
                        4 => (xt + wt, yt,      1.0, 0.0)  -- top right
                    );

                    -- Ada.Text_IO.Put_Line ("Drawing " & c);
                    -- Ada.Text_IO.Put_Line (" Width: " & g.bitmap.width'Image);
                    -- Ada.Text_IO.Put_Line (" Rows:  " & g.bitmap.rows'Image);
                    -- Ada.Text_IO.Put_Line (" xt:    " & xt'Image);
                    -- Ada.Text_IO.Put_Line (" yt:    " & yt'Image);
                    -- Ada.Text_IO.Put_Line (" wt:    " & wt'Image);
                    -- Ada.Text_IO.Put_Line (" ht:    " & ht'Image);

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

                    -- glErr := GL.glGetError;
                    -- Ada.Text_IO.Put_Line ("glBufferData error? " & glErr'Image);

                    -- glErr := Interfaces.C.unsigned(textBox'Last);
                    -- Ada.Text_IO.Put_Line ("glDrawArrays count: " & glErr'Image);
                    GL.glDrawArrays (mode   => GL.GL_TRIANGLE_STRIP,
                                     first  => 0,
                                     count  => Interfaces.C.int(textBox'Last));

                    -- glErr := GL.glGetError;
                    -- Ada.Text_IO.Put_Line ("glDrawArrays error? " & glErr'Image);

                end if;
            end loop;

            GLext.glDisableVertexAttribArray (GL.GLuint(Render.Shaders.textAttribCoord));
            -- glErr := GL.glGetError;
            -- Ada.Text_IO.Put_Line ("glDisableVertexAttribArray error? " & glErr'Image);

            GL.glDeleteTextures (1, tex'Access);
            -- glErr := GL.glGetError;
            -- Ada.Text_IO.Put_Line ("glDeleteTextures error? " & glErr'Image);

            -- If we re-use the VBO can remove this line.
            GLext.glDeleteBuffers (1, Render.Shaders.textVBO'Access);
            -- glErr := GL.glGetError;
            -- Ada.Text_IO.Put_Line ("glDeleteBuffers error? " & glErr'Image);

            -- Stop using the text shader
            GLext.glUseProgram (0);

        end renderGLText;

end Render.Text;