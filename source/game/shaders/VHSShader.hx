package game.shaders;

import flixel.system.FlxAssets.FlxShader;

class VHSShader {
    public var shader(default, null):VHS = new VHS();

    public function new() {
        shader.time.value = [0.0];
        shader.resolution.value = [FlxG.width, FlxG.height];
        shader.aberration.value = [0.002];
        shader.distortion.value = [0.005];
        shader.glitchAmount.value = [0.1];
        shader.scanlineStrength.value = [0.04];
        shader.noiseAmount.value = [0.03];
        shader.flickerStrength.value = [0.3];
        shader.tintColor.value = [0.8, 0.0, 1.0]; // purple
        shader.tintStrength.value = [0.15];
    }

    public function update(elapsed:Float) {
        shader.time.value[0] += elapsed;
    }

    // Optional setters
    public function setTint(r:Float, g:Float, b:Float, strength:Float) {
        shader.tintColor.value = [r, g, b];
        shader.tintStrength.value = [strength];
    }

    public function setAberration(v:Float)         shader.aberration.value = [v];
    public function setDistortion(v:Float)         shader.distortion.value = [v];
    public function setGlitchAmount(v:Float)       shader.glitchAmount.value = [v];
    public function setScanlineStrength(v:Float)   shader.scanlineStrength.value = [v];
    public function setNoiseAmount(v:Float)        shader.noiseAmount.value = [v];
    public function setFlickerStrength(v:Float)    shader.flickerStrength.value = [v];
}


class VHS extends FlxShader {
     @:glFragmentSource('
        #pragma header

        uniform float time;
        uniform vec2 resolution;

        uniform float aberration;
        uniform float distortion;
        uniform float glitchAmount;
        uniform float scanlineStrength;
        uniform float noiseAmount;
        uniform float flickerStrength;

        uniform vec3 tintColor;
        uniform float tintStrength;

        float rand(vec2 co) {
            return fract(sin(dot(co.xy, vec2(12.9898,78.233))) * 43758.5453);
        }

        void main() {
            vec2 uv = openfl_TextureCoordv;

            // Wavy distortion
            uv.y += sin(uv.x * 20.0 + time * 2.0) * distortion;

            // Glitch slice
            if (fract(time * 1.5) < glitchAmount) {
                float band = step(0.4, fract(uv.y * 10.0 + time * 5.0));
                uv.y += band * 0.05 * sin(time * 40.0);
            }

            // RGB Aberration (Split RGB)
            float rColor = texture2D(bitmap, uv + vec2(aberration, 0.0)).r;
            float gColor = texture2D(bitmap, uv).g;
            float bColor = texture2D(bitmap, uv - vec2(aberration, 0.0)).b;
            vec3 color = vec3(rColor, gColor, bColor);

            // Scanlines (horizontal stripes)
            float scanline = sin(uv.y * resolution.y * 1.5) * scanlineStrength;
            color -= scanline;

            // Flickering white bars
            float flicker = step(0.98, rand(vec2(time * 10.0, uv.y * 50.0)));
            color += flicker * flickerStrength;

            // Noise (grain)
            float noise = rand(vec2(uv.x * resolution.x, uv.y * time)) * noiseAmount;
            color += noise;

            // Tint overlay
            color = mix(color, tintColor, tintStrength);

            gl_FragColor = vec4(color, 1.0);
        }
    ')
    public function new() {
        super();
    }
}
