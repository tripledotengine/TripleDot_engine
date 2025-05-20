package melo.mc;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.util.FlxColor;
import flixel.text.FlxText;

class MButton extends FlxSpriteGroup
{
	var _sprite = new FlxSprite();
	var _hitbox = new FlxSprite();
	var _intern = new FlxSprite();
	var _text = new FlxText();

	var locked = false;
	var txt = ' ';

	public function new(x:Float, y:Float, ?txt:String, ?locked:Bool = false){
		this.txt = txt;
		this.locked = locked;
		super();

		_intern.makeGraphic(140, 20, FlxColor.GRAY);
		_intern.antialiasing = false;
		_intern.scale.set(1.8, 1.8);
		_intern.updateHitbox();


		_sprite.makeGraphic(145, 25, FlxColor.BLACK);
		_sprite.antialiasing = false;
		_sprite.scale.set(1.8, 1.8);
		_sprite.updateHitbox();

		_hitbox.makeGraphic(Std.int(_sprite.width), Std.int(_sprite.height));
		_hitbox.updateHitbox();
		_hitbox.alpha = 0.0001;


		_text.text = txt;
		_text.setFormat(Paths.font('Monocraft.ttf'), 33, FlxColor.WHITE);
		// _text.setBorderStyle(OUTLINE, FlxColor.BLACK, 2);

		setPos(x, y);

		_intern.scrollFactor.set();
		_sprite.scrollFactor.set();
		_hitbox.scrollFactor.set();
		_text.scrollFactor.set();

		
		add(_sprite);
		add(_intern);
		add(_text);
		// add(_hitbox);
	}

	public function setPos(_x:Float, _y:Float){
		_sprite.x = _x;
		_sprite.y = _y;

		_hitbox.x = _x;
		_hitbox.y = _y;

		_intern.x = _sprite.x + (_sprite.width - _intern.width) / 2;
		_intern.y = _sprite.y + (_sprite.height - _intern.height) / 2;

		_text.x = _sprite.x + (_sprite.width - _text.width) / 2;
		_text.y = _sprite.y + 1.5;
	}

	override function update(elapsed:Float){
		if (FlxG.mouse.overlaps(_sprite) && locked == false)
			_sprite.color = FlxColor.WHITE;
		else
			_sprite.color = FlxColor.BLACK;

		super.update(elapsed);
	}
}