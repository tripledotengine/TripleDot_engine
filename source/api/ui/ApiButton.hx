package api.ui;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

/**
 * Is used in this "api" as it's a custom coded sprite made for api.ApiDropDown's functions!                                 
 * (added for ease of use (I'm lazy))
 * 
 * @param txt     the text you want! default is ('a')
 * @param font    the text display font!
 * @param locked  if the button should be functional 
 * 
 */
class ApiButton extends FlxSpriteGroup
{
	var font = ApiPath.font('MC_Font.ttf');
	var _text = new FlxText();
	var _sprite = new FlxSprite();
	var _hitbox = new FlxSprite();
	var _i = '${ApiFunc._assetpath}button/';
	var _assets:String = 'static';
	var locked:Bool = false;
	var txt:String = ' ';

	public function new(?txt:String, ?font:String)
	{
		this.txt = txt;
		this.font = font;
		super();
		if (locked != false)
			_assets = 'disable';

		_sprite.loadGraphic(_i + _assets);
		_sprite.antialiasing = false;
		_sprite.scale.set(1.8, 1.8);
		_sprite.updateHitbox();

		_hitbox.alpha = 0.0001;
		_hitbox.makeGraphic(Std.int(_sprite.width), Std.int(_sprite.height));
		// _hitbox.scale.set(1.8, 1.8);
		_hitbox.updateHitbox();

		_text.text = txt;
		_text.setFormat(ApiPath.font(font), 33, FlxColor.WHITE);
		_text.setBorderStyle(OUTLINE, FlxColor.BLACK, 2);

		setPos(x, y);

		add(_sprite);
		add(_text);
		add(_hitbox);
	}

	public function setPos(_x:Float, _y:Float)
	{
		_sprite.x = _x;
		_sprite.y = _y;

		_hitbox.x = _x;
		_hitbox.y = _y;

		_text.x = _sprite.x + (_sprite.width - _text.width) / 2;
		_text.y = _sprite.y + 3.5;
	}

	override function update(elapsed:Float)
	{
		_sprite.loadGraphic(_i + _assets);

		if (FlxG.mouse.overlaps(_hitbox) && locked == false)
			_assets = 'select';
		else
			_assets = 'static';

		super.update(elapsed);
	}
}
