//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float pixelW;
uniform float pixelH;

void main()
{
    // Sample the current pixel's alpha
    float baseAlpha = texture2D(gm_BaseTexture, v_vTexcoord).a;

    // If pixel is transparent, discard it (outside the sprite)
    if (baseAlpha <= 0.0) {
        discard;
    }

    // Define offsets to sample neighboring pixels
    vec2 offsetx = vec2(pixelW, 0.0);
    vec2 offsety = vec2(0.0, pixelH);

    // Check alpha of neighbors
    float aLeft  = texture2D(gm_BaseTexture, v_vTexcoord - offsetx).a;
    float aRight = texture2D(gm_BaseTexture, v_vTexcoord + offsetx).a;
    float aUp    = texture2D(gm_BaseTexture, v_vTexcoord - offsety).a;
    float aDown  = texture2D(gm_BaseTexture, v_vTexcoord + offsety).a;

    // If any neighbor is transparent, this pixel is at the border
    if (aLeft <= 0.0 || aRight <= 0.0 || aUp <= 0.0 || aDown <= 0.0) {
        // Inner red outline
		gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
        gl_FragColor.rgb = v_vColour.rgb;
    } else {
        // Fully inside: solid black
        gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);
    }
}
