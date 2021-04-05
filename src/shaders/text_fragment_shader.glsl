// Text fragment shader
#version 130

varying vec2 texcoord;
uniform sampler2D tex;
uniform vec4 color;
uniform bool alphaOnly;

void main(void) {
    if(alphaOnly)
    {
        gl_FragColor = vec4(1, 1, 1, texture2D(tex, texcoord).a) * color;
    }
    else
    {
        gl_FragColor = texture2D(tex, texcoord);
    }
}