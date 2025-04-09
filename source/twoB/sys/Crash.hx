package twoB.sys;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import lime.app.Application;
import flixel.util.FlxTimer;

class Crash extends FlxState
{
	var _bg = new FlxSprite();

	public var error:String;
	public var errorName:String;
	public var report:FlxText = new FlxText(0, 0, FlxG.width / 1.5);


	public function new(prevState:FlxState, error:String, errorName:String):Void
	{
		this.error = error;
		this.errorName = errorName;

		super();
	}

	override public function create()
	{
		super.create();

		_bg.loadGraphic(Paths.image('system/crashBg.png'));
		_bg.scale.set(0.4,0.4);
		_bg.screenCenter();
		add(_bg);


		var msg:String = 'Whoops! Something went wrong...\n\n';
		var error:String = 'Error caught: ${errorName}\n\n${error}\n\nPlease message [melodiicam2b.vbs] if this issue persists!';

		report.text = msg + error;
		report.setFormat(Paths.font('NovaMono.ttf'), 16, 0xFFFFFFFF, CENTER, OUTLINE, 0xFF000000);
		report.screenCenter(XY);
		report.borderSize = 1.5;
		add(report);

		new FlxTimer().start(10.0, timer -> {endState();});
	}

	function endState() {
		//Sys.exit(1);
		report.text = 'CURSE OF THE TIME GOD';
	}
}
