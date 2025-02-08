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

// class ApiDropDown extends FlxSpriteGroup
// {
// 	/*Is used in this "api" as it's a custom coded Drop down menu!    
// 	 * (I may have been a bit lazy...)
// 	 * 
// 	 * 
// 	 * 
// 	 */
// 	var _i = '${ApiFunc._assetpath}dropdown/';
// 	var _botton = new FlxSprite();
// 	var _top = new FlxSprite();
// 	var _open = false;
// 	var _drop = new ApiFrame();
// 	var _dropScale = 1.8;

// 	public function new()
// 	{
// 		super();

// 		_botton.loadGraphic(Paths.image(_i + 'bg'));
// 		_botton.antialiasing = false;

// 		_botton.updateHitbox();
// 		add(_botton);

// 		_top.loadGraphic(Paths.image(_i + 'top'));
// 		_top.antialiasing = false;
// 		_top.scale.set(1.8, 1.8);
// 		_top.updateHitbox();
// 		// add(_top);

// 		_drop.setPosition(_top.x + 80, _top.y + (_top.height - _drop.height) / 2);
// 		add(_drop);
// 	}

// 	override function update(elapsed:Float)
// 	{
// 		_botton.scale.set(1.8, _dropScale);

// 		if (FlxG.mouse.pressed)
// 			open();

// 		super.update(elapsed);
// 	}

// 	function open()
// 	{
// 		_open = true;
// 		_dropScale = 2.4;
// 	}

// 	function close()
// 	{
// 		_open = false;
// 		_botton.height -= 300;
// 	}
// }
