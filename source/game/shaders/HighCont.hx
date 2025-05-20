package game.shaders;

import flixel.system.FlxAssets.FlxShader;

class HighCont{
    public var shader(default, null):High = new High();
	public var contrast(default, set):Float = 2.0; // Contrast multiplier

	public function new() {
		shader.contrast.value = [contrast];
	}

	function set_contrast(v:Float):Float {
		contrast = v;
		shader.contrast.value = [contrast];
		return v;
	}
}


class High extends FlxShader{	
    @:glFragmentSource('
		#pragma header

		uniform float contrast;

		void main() {
			vec4 color = flixel_texture2D(bitmap, openfl_TextureCoordv);
			color.rgb /= color.a + 0.00001; // Prevent divide by 0
			color.rgb = (color.rgb - 0.5) * contrast + 0.5;
			color.rgb *= color.a;
			gl_FragColor = color;
		}
	')

	public function new() {
		super();
	}
}