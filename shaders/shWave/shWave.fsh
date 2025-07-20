//
// Water distortion fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float pixelH;
uniform float pixelW;
uniform float pixelsprings[2000];
uniform float time;
uniform float springCount;

void main() {
    vec2 p = v_vTexcoord;
    float py = 1.0 - p.y;

    // Position horizontale en pixels
    float pixelsIn = (p.x / pixelW);

    // Index du ressort
    int chunk = int(floor(p.x * springCount));
    int nextChunk = int(min(float(chunk + 1), springCount - 1.0)); // clampé
    float chunkpercent = (p.x * springCount) - float(chunk);

    // Effets d’ondes sinusoïdales
    p.y += sin((pixelsIn * 0.1) + time) * (1.5 * pixelH) * py;
    p.y += sin((pixelsIn * 0.15) + time * 1.2) * (1.5 * pixelH) * py;

    // Interpolation entre deux ressorts
    p.y += mix(pixelsprings[chunk] * pixelW, pixelsprings[nextChunk] * pixelW, chunkpercent) * py;

    // Empêche les coords de sortir de la texture
    p.y = max(p.y, 0.0);

    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, p);
}
