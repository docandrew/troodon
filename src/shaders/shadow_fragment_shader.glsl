// Shadow fragment shader
#version 130

uniform vec4 color;
uniform vec4 shadow;    // window/quad dimensions.
uniform float screenHeight;

float sdRoundedBox(in vec2 p, in vec2 b, in vec4 r) {
    r.xy = (p.x>0.0)?r.xy : r.zw;
    r.x  = (p.y>0.0)?r.x  : r.y;
    vec2 q = abs(p)-b+r.x;
    return min(max(q.x,q.y),0.0) + length(max(q,0.0)) - r.x;
}

void main(void) {
    // here, fragcoord is in _screen_ coordinates
    // get local-to-window coordinates
    vec2 coord = vec2(gl_FragCoord.x - shadow.x, (screenHeight - gl_FragCoord.y) - shadow.y);
    float width = shadow.z;
    float height = shadow.w;

    float localX = -1 + (2.0 * coord.x) / width;
    float localY = -1 + (2.0 * coord.y) / height;

    // normalize coordinates
    vec2 localCoord = vec2(localX, localY);
    
    vec2 p = localCoord;
    vec2 si = normalize(vec2(width, height)) - 0.2;
    vec4 ra = vec4(0.1, 0.1, 0.1, 0.1);
    
    float d = sdRoundedBox(p, si, ra);

    // vec2 r = abs(localCoord);
    // //float s = smoothstep(1.0, 0.6, max (r.x, r.y));
    float alpha = 1.0 - smoothstep(0.2, 0.7, d);
    alpha = mix(0.0, color.a, alpha);
    
    gl_FragColor = vec4(color.rgb, alpha);
}