package api.game;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;


/**
 * [Objects]
 * 
 * these have 2 states, hitbox, or interactible | I.E. doors, coin bricks, flags
 */
class Object extends FlxSpriteGroup {
	var _hitBox = new FlxSprite();

	var _sprite = new FlxSprite();

	public function new(x:Float, y:Float, image:Dynamic, ?hitbox:Bool = true, ?size:Float) {
		this.x = x;
		this.y = y;


		_sprite.loadGraphic(ApiPath.image(image));
		_sprite.antialiasing = Lvl.stageAntialiasing;

		_sprite.scale.set(size,size);

		_sprite.updateHitbox();

		add(_sprite);


		super();
	}
}