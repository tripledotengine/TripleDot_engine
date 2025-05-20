package game.shaders;

import flixel.system.FlxAssets.FlxShader;

class ToneShader {
	public var shader(default, null):TwoTone = new TwoTone();
	public var threshold(default, set):Float = 0;

	public function new(darkColor:String, lightColor:String) {
		shader.colorDark.value = GLSLColor.findColor(darkColor);
		shader.colorLight.value = GLSLColor.findColor(lightColor);
		shader.threshold.value = [threshold];
	}

	public function setColors(darkColor:String, lightColor:String) {
		shader.colorDark.value = GLSLColor.findColor(darkColor);
		shader.colorLight.value = GLSLColor.findColor(lightColor);
	}

	function set_threshold(val:Float):Float {
		threshold = val;
		shader.threshold.value = [threshold];
		return val;
	}
}

class TwoTone extends FlxShader {
	@:glFragmentSource('
		#pragma header

		uniform vec3 colorDark;
		uniform vec3 colorLight;
		uniform float threshold;

		void main() {
			vec4 color = flixel_texture2D(bitmap, openfl_TextureCoordv);
			float gray = dot(color.rgb, vec3(0.299, 0.587, 0.114));
			vec3 finalColor = (gray < threshold) ? colorDark : colorLight;
			gl_FragColor = vec4(finalColor, color.a);
		}
	')

	public function new() {
		super();
	}
}
