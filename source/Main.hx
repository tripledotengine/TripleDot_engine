package;

import flixel.FlxGame;
import openfl.display.Sprite;
import twoB.sys.Display;
import twoB.sys.TwoG;
import twoB.Ufunc;
import game.*;
import backend.*;

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
		width: SaveData.app.get('appWidth'),
		height: SaveData.app.get('appHeight'),
		frameR: SaveData.app.get('baseFPS'),
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

		SaveData.save();
		if(SaveData.app.get('firstTime') == true)
			SaveData.app.set('firstTime', false);


		addChild(new TwoG(game.width, game.height, game.initState, game.frameR, game.frameR, game.noIntro, game.fScreen));
		fpsVar = new Display(5, 0.5);
		fpsVar.visible = SaveData.app.get('infoDisplay');
		Lib.current.stage.align = "tl";

		Ufunc.setHeaderColor(SaveData.app.get('hColorR'), SaveData.app.get('hColorG'), SaveData.app.get('hColorB'));
		Ufunc.headerFunc(true);
		cpp.NativeGc.enable(true);
		cpp.NativeGc.run(true);

		FlxG.game.focusLostFramerate = 60;
		FlxG.autoPause = false;

 		// lime.app.Application.current.window.transparent = true;

		Ufunc.setWinAlpha(0);

		addChild(fpsVar);
	}
}
