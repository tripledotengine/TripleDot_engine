package api.ui;

// import flixel.FlxG;
// import flixel.FlxSprite;
// import flixel.addons.text.FlxTypeText;
// import flixel.graphics.frames.FlxAtlasFrames;
// import flixel.group.FlxSpriteGroup;
// import flixel.input.FlxKeyManager;
// import flixel.text.FlxText;
// import flixel.util.FlxColor;
// import flixel.util.FlxTimer;

// /**
//  * Made for the drop down menu!
//  */
// class ApiFrame extends FlxSpriteGroup
// {
// 	var _sprite = new FlxSprite();
// 	var _hitbox = new FlxSprite();
// 	var _i = '${ApiFunc._assetpath}dropdown/';
// 	var _assets:String = 'static';

// 	public function new()
// 	{
// 		super();

// 		_sprite.loadGraphic(Paths.image(_i + _assets));
// 		_sprite.antialiasing = false;
// 		_sprite.scale.set(1.8, 1.8);
// 		_sprite.updateHitbox();

// 		_hitbox.alpha = 0.0001;
// 		_hitbox.makeGraphic(Std.int(_sprite.width), Std.int(_sprite.height));
// 		_hitbox.updateHitbox();

// 		add(_sprite);

// 		add(_hitbox);
// 	}

// 	override function update(elapsed:Float)
// 	{
// 		_sprite.loadGraphic(Paths.image(_i + _assets));

// 		if (FlxG.mouse.overlaps(_hitbox))
// 		{
// 			_assets = 'select';
// 			_sprite.alpha = 1;
// 		}
// 		else
// 		{
// 			_assets = 'static';
// 			_sprite.alpha = 0.7;
// 		}

// 		super.update(elapsed);
// 	}
// }
