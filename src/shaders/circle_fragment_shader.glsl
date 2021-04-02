// Circle Fragment Shader
#version 130

// Redeclare w/ layout qualifier so coords are (0,0) in upper-left corner
//layout(origin_upper_left) in vec4 gl_FragCoord;

//attribute vec2  coord;      // in screen / pixel coords with (0,0) as upper-left corner.
uniform   vec2  center;
uniform   vec4  color;
uniform   float screenHeight;
uniform   float radius;    // in pixels

void main()
{
    // "translate" circle to origin for easier math.
    // need to subtract FragCoord from screen height to get screen coords for center.y.
    // i.e. if circle is at screen coord (20, 10) (top left corner w/ screen size 200x200), 
    // frag coord will be (20, 190) since frag (0, 0) is at bottom left corner.
    // to put the circle at the "origin" for calculating radius, we need 
    // (200 - 190) - 10
    float x = gl_FragCoord.x - center.x;
    float y = (screenHeight - gl_FragCoord.y) - center.y;

    // Distance from center of circle
    float dist = sqrt(x * x + y * y);

    if (dist > radius)
    {
        discard;
    }
    else
    {
        // add smoothstep alpha for antialiasing
        // smoothstep (a, b, x) if x <= a or x >= b it will be 0 or 1, respectively.
        // As we near the edge of the circle, increase transparency to make smooth edges.
        float delta = 2.0;
        float alpha = smoothstep(radius - delta, radius, dist);

        gl_FragColor = vec4(color.rgb, 1.0 - alpha);
    }
}
