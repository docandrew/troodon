// Window Vertex Shader
#version 130

attribute vec4 coord;
uniform   mat4 ortho;
varying   vec2 texcoord;

void main()
{
    // Transform vector from screen coords using ortho projection matrix
    gl_Position = ortho * vec4(coord.xy, 0.0, 1.0);
    texcoord = coord.zw;
}