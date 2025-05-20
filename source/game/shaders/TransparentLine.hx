package game.shaders;

import flixel.system.FlxAssets.FlxShader;

class TransparentLine {
	public var shader(default, null):TransLine = new TransLine();
    public var thickness(default, null):Float;

	public function new(){
		shader.rgbv.value = [0.00, 0.00, 0.00];
		shader.thickness.value = [1.7];
	}

    private function set_thickness(value:Float) {
		thickness = value;
		shader.thickness.value = [thickness];
		return thickness;
	}

	public function rgb(r:Float, g:Float, b:Float, ?_:Float){
		shader.rgbv.value[0] = r;
		shader.rgbv.value[1] = g;
		shader.rgbv.value[2] = b;

        set_thickness(_);
	}
}

class TransLine extends FlxShader {
	@:glFragmentSource('
		#pragma header

		uniform vec3 rgbv;
		uniform float thickness;

		void main() {
			vec4 color = texture2D(bitmap, openfl_TextureCoordv);
			float w = thickness / openfl_TextureSize.x;
			float h = thickness / openfl_TextureSize.y;

			if (color.a == 0.0) {
				bool edge = false;

				vec2 offsets[8];
				offsets[0] = vec2(-w, 0.0);     // left
				offsets[1] = vec2(w, 0.0);      // right
				offsets[2] = vec2(0.0, -h);     // up
				offsets[3] = vec2(0.0, h);      // down
				offsets[4] = vec2(-w, -h);      // top-left
				offsets[5] = vec2(w, -h);       // top-right
				offsets[6] = vec2(-w, h);       // bottom-left
				offsets[7] = vec2(w, h);        // bottom-right

				for (int i = 0; i < 8; ++i) {
					if (texture2D(bitmap, openfl_TextureCoordv + offsets[i]).a != 0.0) {
						edge = true;
						break;
					}
				}

				if (edge) {
					gl_FragColor = vec4(rgbv, 1.0);
					return;
				}
			}


		}
	')
	public function new() {
		super();
	}
}
