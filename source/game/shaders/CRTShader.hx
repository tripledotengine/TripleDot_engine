package game.shaders;

import flixel.system.FlxAssets.FlxShader;

class CRTShader {
    public var shader(default, null):CRT = new CRT();

    public function new() {
        shader.bevelStrength.value = [0.2];
        shader.resolution.value = [FlxG.width, FlxG.height];
    }

    public function setBevel(strength:Float) {
        shader.bevelStrength.value[0] = strength;
    }
}



class CRT extends FlxShader {
    @:glFragmentSource('
        #pragma header

        uniform float bevelStrength;
        uniform vec2 resolution;

        void main() {
            vec2 uv = openfl_TextureCoordv;

            // Correct for aspect ratio
            vec2 aspectCorrectedUV = uv;
            float aspectRatio = resolution.x / resolution.y;

            // Normalize UV coordinates (center the UV space)
            vec2 centeredUV = uv * 2.0 - 1.0; // -1 to 1 range

            // Calculate barrel distortion (CRT curvature)
            float r2 = dot(centeredUV, centeredUV); // Radius squared
            vec2 distortedUV = centeredUV * (1.0 + bevelStrength * r2);

            // Revert the UVs back to [0, 1] range
            uv = (distortedUV + 1.0) * 0.5;
            uv = clamp(uv, 0.0, 1.0);

            // Apply the distorted texture
            gl_FragColor = texture2D(bitmap, uv);
        }
    ')

    public function new() {
        super();
    }
}
