package melo.mc;

import flixel.system.FlxAssets.FlxShader;

class OutlineShader {
	public var shader(default, null):Outline = new Outline();
    public var width(default, null):Float;

	public function new(){
		shader.rgbv.value = [0.00, 0.00, 0.00];
	}

    private function set_width(value:Float) {
		width = value;
		shader.width.value = [width];
		return width;
	}

	public function rgb(r:Float, g:Float, b:Float, ?_:Float = 2.7){
		shader.rgbv.value[0] = r;
		shader.rgbv.value[1] = g;
		shader.rgbv.value[2] = b;

        set_width(_);
	}
}

class Outline extends FlxShader {
	@:glFragmentSource('
		#pragma header

		uniform vec3 rgbv;
        uniform float width;

		void main() {
			vec4 color = texture2D(bitmap, openfl_TextureCoordv);
			const float BORDER_WIDTH = 3.7;
			float w = BORDER_WIDTH / openfl_TextureSize.x;
			float h = BORDER_WIDTH / openfl_TextureSize.y;

			if (color.a == 0.0) {
				bool edge = false;
				edge = edge || texture2D(bitmap, openfl_TextureCoordv + vec2(w, 0.0)).a != 0.0;
				edge = edge || texture2D(bitmap, openfl_TextureCoordv - vec2(w, 0.0)).a != 0.0;
				edge = edge || texture2D(bitmap, openfl_TextureCoordv + vec2(0.0, h)).a != 0.0;
				edge = edge || texture2D(bitmap, openfl_TextureCoordv - vec2(0.0, h)).a != 0.0;

				if (edge) {
					gl_FragColor = vec4(rgbv, 1.0);
					return;
				}
			}

			gl_FragColor = color;
		}
	')
	public function new() {
		super();
	}
}