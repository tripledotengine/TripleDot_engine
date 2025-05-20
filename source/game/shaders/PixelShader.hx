package game.shaders;
import flixel.system.FlxAssets.FlxShader;

class PixelShader {
	public var shader(default, null):Pixel = new Pixel();
	public var pixSize(default, set):Float = .5;

    public function new(?_:Float){
        set_pixSize(_);
		shader.mult.value = [pixSize];
        shader.resolution.value = [FlxG.width, FlxG.height];
	}

    private function set_pixSize(value:Float) {
		pixSize = value;
		shader.mult.value = [pixSize];
		return pixSize;
	}
}

class Pixel extends FlxShader {
    @:glFragmentSource('
        #pragma header

        uniform float mult;
        uniform vec2 resolution;

        vec4 flixel_texture2DCustom(sampler2D bitmap, vec2 coord) {
            vec2 uv = coord / resolution;
            vec2 pixelSize = vec2(mult / resolution.x, mult / resolution.y);
            uv = uv - mod(uv, pixelSize);
            return texture2D(bitmap, uv);
        }

        void main() {
            gl_FragColor = flixel_texture2DCustom(bitmap, openfl_TextureCoordv * resolution);
        }
    ')

    public function new() {
        super();
    }
}
