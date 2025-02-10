package api;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import lime.app.Application;

class ApiCrash extends FlxState
{
	var funcTxt:FlxText;
	var _img1 = new FlxSprite();
	var _img2 = new FlxSprite();
	var _img3 = new FlxSprite();
	var _bg = new FlxSprite();

	public var error:String;
	public var errorName:String;

	public function new(prevState:FlxState, error:String, errorName:String):Void
	{
		this.error = error;
		this.errorName = errorName;

		ApiFunc.setMouse(true);
		ApiFunc.setHeader('Error caught: ${errorName}!', 'error');

		super();
	}

	override public function create()
	{
		super.create();

		_bg.loadGraphic(ApiPath.image(ApiFunc._assetpath + 'crash/bg'));
		_bg.setGraphicSize(Std.int(_bg.width * 1.175));
		_bg.screenCenter();
		_bg.alpha = 0.6;
		add(_bg);

		_img1.loadGraphic(ApiPath.image(ApiFunc._assetpath + 'crash/no'));
		_img1.setPosition(160, FlxG.height - 224);
		_img1.shader = new api.Outline();

		_img2.loadGraphic(ApiPath.image(ApiFunc._assetpath + 'crash/ok'));
		_img2.setPosition(940, FlxG.height - 224);
		_img2.shader = new api.Outline();

		add(_img1);
		add(_img2);


		var msg:String = 'probably fucked something up or what ever\n\n';
		var error:String = 'Error caught: ${errorName}\n\n${error}\n\nMy Fault Gang!';

		var report:FlxText = new FlxText(0, 0, FlxG.width / 1.5, msg + error);
		report.setFormat(ApiPath.font('vcr.ttf'), 32, 0xFFFFFFFF, CENTER, OUTLINE, 0xFF000000);
		report.screenCenter(XY);
		report.borderSize = 1.5;
		add(report);

		funcTxt = new FlxText(0, FlxG.height - 64, FlxG.width,
			"click 'middle finger' cat to close the game\nClick 'ok' cat to go to the menu screen\npress space to play a funny sound!");
		funcTxt.setFormat(ApiPath.font('vcr.ttf'), 24, 0xFFFFFFFF, CENTER, OUTLINE, 0xFF000000);
		funcTxt.y = FlxG.height - funcTxt.height - 16;
		funcTxt.borderSize = 1;
		funcTxt.screenCenter(X);
		add(funcTxt);
	}

	override function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (FlxG.mouse.overlaps(_img1))
		{
			if (FlxG.mouse.pressed)
			{
				Sys.exit(1);
			}
		}
	}
}
