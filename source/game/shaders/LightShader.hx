package game.shaders;

import flixel.system.FlxAssets.FlxShader;

class LightShader {
    public var shader(default, null):Light = new Light();

    public function new() {
        shader.lightPos.value = [0.5, 0.5];          // Center of screen
        shader.lightRadius.value = [0.4];            // Light radius (0.0–1.0)
        shader.intensity.value = [1.0];              // Brightness (0–1)
        shader.lightColor.value = [1.0, 1.0, 1.0];    // White light
    }

    public function setLight(x:Float, y:Float, radius:Float, r:Float, g:Float, b:Float, intensity:Float = 1.0) {
        shader.lightPos.value = [x, y];
        shader.lightRadius.value = [radius];
        shader.lightColor.value = [r, g, b];
        shader.intensity.value = [intensity];
    }
}

class Light extends FlxShader {
    @:glFragmentSource('
        #pragma header

        uniform vec2 lightPos;      // Position of the light (normalized 0–1)
        uniform float lightRadius;  // Radius of the light
        uniform float intensity;    // Brightness of the light
        uniform vec3 lightColor;    // RGB light color

        void main() {
            vec2 uv = openfl_TextureCoordv;

            // Distance from light position
            float dist = distance(uv, lightPos);

            // Create smooth radial falloff
            float alpha = smoothstep(lightRadius, 0.0, dist) * intensity;

            // Sample the base texture
            vec4 base = texture2D(bitmap, uv);

            // Blend the light color with the texture
            vec3 result = mix(base.rgb, lightColor, alpha);

            gl_FragColor = vec4(result, base.a);
        }
    ')

    public function new() {
        super();
    }
}