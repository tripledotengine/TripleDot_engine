package;

import flixel.FlxGame;
import openfl.display.Sprite;
import twoB.sys.Display;
import twoB.sys.TwoG;
import twoB.Ufunc;
import game.*;

import flixel.FlxG;
import flixel.FlxState;
import flixel.graphics.FlxGraphic;
import flixel.util.FlxColor;
import openfl.Assets;
import openfl.Lib;
import openfl.display.FPS;
import openfl.display.Sprite;
import openfl.display.StageScaleMode;
import openfl.events.Event;
import openfl.text.TextField;
import openfl.text.TextFormat;
import sys.thread.Thread;
import flixel.util.typeLimit.NextState;
class Main extends Sprite
{
	public static var fpsVar:Display;

	

	var game = {
		width: 640,
		height: 480,
		frameR: 60,
		noIntro: true,
		fScreen: false,
		initState: backend.DebugState
	};


	public static function main():Void
	{
		Lib.current.addChild(new Main());
	}
	
	public function new()
	{
		super();
		if (stage != null)
		{
			init();
		}
		else
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
	}

	private function init(?E:Event):Void
	{
		if (hasEventListener(Event.ADDED_TO_STAGE))
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}

		setupGame();
	}

	private function setupGame()
	{

		addChild(new TwoG(game.width, game.height, game.initState, game.frameR, game.frameR, game.noIntro, game.fScreen));
		fpsVar = new Display(5, 0.5);
		Lib.current.stage.align = "tl";

		Ufunc.setHeaderColor(128, 7, 7);
		Ufunc.headerFunc(true);
		cpp.NativeGc.enable(true);
		cpp.NativeGc.run(true);
		FlxG.autoPause = false;
		FlxG.mouse.visible = false;

		addChild(fpsVar);
	}
}
