package api.sys;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

// change this shit!!! because it's dogshit rn!!
class ApiIPInfo extends FlxSpriteGroup {
	var font = ApiPath.font('MC_Font.ttf');
	var _text = new FlxText();
	var _sprite = new FlxSprite();
	var _i = '${ApiFunc._assetpath}dropdown/button/';
	var _assets:String = 'static.png';
	var locked:Bool = false;
	var txt:String = ' ';

	public function new(?font:String) {
		this.font = font;
		super();
		if (locked != false)
			_assets = 'disable';

		_sprite.loadGraphic(ApiPath.image(_i + _assets));
		_sprite.antialiasing = false;
		_sprite.scale.set(2.3, 2.3);
		_sprite.updateHitbox();

		_text.text = logIP();
		_text.setFormat(ApiPath.font(font), 33, FlxColor.WHITE);
		_text.setBorderStyle(OUTLINE, FlxColor.BLACK, 2);

		setPos(x, y);

		add(_sprite);
		add(_text);
	}

	public function setPos(_x:Float, _y:Float) {
		_sprite.x = _x;
		_sprite.y = _y;

		_text.x = _sprite.x + (_sprite.width - _text.width) / 2;
		_text.y = _sprite.y + 3.4;
	}

	public static function logIP() {
		var jip = new haxe.Http("https://ipinfo.io/json");
		var ip:String = '_';
		jip.onData = function(data:String) {
			var parj:Dynamic = haxe.Json.parse(data);
			ip = parj.ip;
		}
		jip.request();
		return $v{ip};
	}
}