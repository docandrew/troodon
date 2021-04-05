// Line fragment shader. Line thickness must also be set using glLineWidth
// in addition to setting the width uniform here. (maybe some way to get
// glLineWidth setting here?)
#version 130

uniform vec2  lineFrom;
uniform vec2  lineTo;
uniform float screenHeight; // in pixels
uniform float width;        // in pixels
uniform vec4  color;
uniform bool  antiAliased;

// h/t Nicol Bolas: 
// https://stackoverflow.com/questions/9246100/how-can-i-implement-the-distance-from-a-point-to-a-line-segment-in-glsl
float distToLine(vec2 from, vec2 to, vec2 pt)
{
    vec2 v1 = to - from;
    vec2 v2 = from - pt;
    vec2 v3 = vec2(v1.y, -v1.x);

    return abs(dot(normalize(v3), v2));
}

void main(void)
{

    if(antiAliased)
    {
        // Need to swizzle FragCoord to match our line coords, since gl_FragCoord = (0,0)
        //  is at the bottom left corner of the screen, but we refer to (0,0) at the top left for
        //  our lines.
        vec2 flippedCoord = vec2(gl_FragCoord.x, screenHeight - gl_FragCoord.y);

        // Calculate distance from center of line to current pixel being drawn
        float dist = distToLine(lineFrom, lineTo, flippedCoord);
        
        if(dist > (width / 2.0))
        {
            discard;
        }
        else
        {
            // This gives decent looking lines, though maybe not as advanced as
            // other methods. I add a few pixels to the width and then transition
            // to fully transparent as we near the edge.
            float delta = 2;
            float alpha = smoothstep(width / 2.0 - delta, width / 2.0, dist);
            gl_FragColor = vec4(color.rgb, 1.0 - alpha);
        }
    }
    else
    {
        gl_FragColor = color;
    }
}
