// shadow vertex shader
#version 130

attribute vec2 coord;
uniform   mat4 ortho;

void main()
{
    gl_Position = ortho * vec4(coord, 0.0, 1.0);
}