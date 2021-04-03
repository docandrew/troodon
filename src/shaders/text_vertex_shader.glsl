// Text Vertex Shader
#version 130

attribute vec4 coord;
uniform mat4 ortho;         // Orthographic projection matrix
varying vec2 texcoord;

void main()
{
    // Transform vector from screen coords using ortho projection matrix
    // Texture coords will remain something like 1.0, 0.0, etc.
    
    gl_Position = ortho * vec4(coord.xy, 0.0, 1.0);
    texcoord = coord.zw;
}
