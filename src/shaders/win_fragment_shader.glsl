// Win fragment shader
#version 130

varying vec2 texcoord;
uniform sampler2D tex;
uniform float alpha;

void main(void) {
    // Get texture of quad
    vec4 color = texture2D(tex, texcoord);
    color.a = color.a * alpha;
    gl_FragColor = color;
}
