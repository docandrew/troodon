; This is a bit hacky, but it's a way for us to include our shader files
; as sections within the final executable so we don't have to distribute
; them separately, without baking them into the source code, where we don't
; have nice features like GLSL language support in the editor.
bits 64

section .rodata

; -----------------------------------------------------------------------------
; Text Vertex Shader
; -----------------------------------------------------------------------------
global text_vertex_shader_start
global text_vertex_shader_end
global text_vertex_shader_size
text_vertex_shader_start: incbin "shaders/text_vertex_shader.glsl"
text_vertex_shader_end:   db 0
text_vertex_shader_size:  dq $ - text_vertex_shader_start

; -----------------------------------------------------------------------------
; Text Fragment Shader
; -----------------------------------------------------------------------------
global text_fragment_shader_start
global text_fragment_shader_end
global text_fragment_shader_size
text_fragment_shader_start: incbin "shaders/text_fragment_shader.glsl"
text_fragment_shader_end:   db 0
text_fragment_shader_size:  dq $ - text_fragment_shader_start

; -----------------------------------------------------------------------------
; Circle Vertex Shader
; -----------------------------------------------------------------------------
global circle_vertex_shader_start
global circle_vertex_shader_end
global circle_vertex_shader_size
circle_vertex_shader_start: incbin "shaders/circle_vertex_shader.glsl"
circle_vertex_shader_end:   db 0
circle_vertex_shader_size:  dq $ - circle_vertex_shader_start

; -----------------------------------------------------------------------------
; Circle Fragment Shader
; -----------------------------------------------------------------------------
global circle_fragment_shader_start
global circle_fragment_shader_end
global circle_fragment_shader_size
circle_fragment_shader_start: incbin "shaders/circle_fragment_shader.glsl"
circle_fragment_shader_end:   db 0
circle_fragment_shader_size:  dq $ - circle_fragment_shader_start

; -----------------------------------------------------------------------------
; Line Vertex Shader
; -----------------------------------------------------------------------------
global line_vertex_shader_start
global line_vertex_shader_end
global line_vertex_shader_size
line_vertex_shader_start: incbin "shaders/line_vertex_shader.glsl"
line_vertex_shader_end:   db 0
line_vertex_shader_size:  dq $ - line_vertex_shader_start

; -----------------------------------------------------------------------------
; Line Fragment Shader
; -----------------------------------------------------------------------------
global line_fragment_shader_start
global line_fragment_shader_end
global line_fragment_shader_size
line_fragment_shader_start: incbin "shaders/line_fragment_shader.glsl"
line_fragment_shader_end:   db 0
line_fragment_shader_size:  dq $ - line_fragment_shader_start

