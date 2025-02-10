package api.sys;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import lime.app.Application;
import lime.graphics.Image;
import openfl.system.Capabilities;
import sys.FileSystem;
import openfl.Lib;
import flixel.system.scaleModes.BaseScaleMode;
import flixel.math.FlxPoint;

class ApiFunc
{
	public static var _path = 'assets/images/api_assets/img/sonicisfuckingdeadlmao.png';

	public static var _assetpath = 'api_assets/';

	public static function sonic_Exist()
	{
		if (!FileSystem.exists(_path))
		{
			//Sys.exit(1);
		}
		return true;
	}

	public static function compData()
	{
		return Date.now().toString() /*+ ' | ' + Sys.environment()["USERNAME"].trim()*/;
	}

    //API specific save functions
	public static var curMap:Map<String, Dynamic> = [
		'debug1'=>'1',
		'appTitle'=>'Friday night Funkin!',
		'apiVer'=>'0.1.2'
	];
	public static var boolMap:Map<String, Bool> = [
		'fps' => true,
		'mem' => true,
		'ver' => true,
		'xtr' => true
	];
	// public static function save(){
	// 	FlxG.save.curMap = curMap;
	// 	FlxG.save.boolMap = boolMap;
	// }

	public static function setHeader(text:String, image:String)
	{
		Application.current.window.setIcon(Image.fromFile(''));
		Application.current.window.title = (text);
	}

	public static var preventClosing:Bool = true;
	public static var onClosing:Void->Void;

	static var __triedClosing:Bool = false;
	public static inline function resetClosing() __triedClosing = false;

	public static inline function init() {
		resetClosing();

		Lib.application.window.onClose.add(function () {
			if (preventClosing && !__triedClosing) {
				Lib.application.window.onClose.cancel();
				__triedClosing = true;
			}
			if (onClosing != null) onClosing();
		});
	}


	var windowTwn:FlxTween;

    var windowRes:FlxPoint;
    var windowPos:FlxPoint;
    var startTime:Float;

	function move(){
		FlxG.updateFramerate = 30; // Makes it smoother and consistant
	
		windowRes = FlxPoint.get(Lib.application.window.width, Lib.application.window.height);
		windowPos = getCenterWindowPoint();
		startTime = Sys.time();

		windowTwn = FlxTween.tween(windowRes, {x: 1280, y: 720}, 0.3 * 4, {ease: FlxEase.circInOut,  onComplete: function(twn:FlxTween)
			{
				completeWindowTwn();
			}
		});
	}
	function completeWindowTwn(){
		FlxG.updateFramerate = 60;
		var ogSize:FlxPoint = FlxPoint.get(1280, 720); // fuck you haxeflixel
		//i have no clue what thsi is suppose to be 
		var baseCamPos:FlxPoint = FlxPoint.get(0,0);

		FlxG.scaleMode = new flixel.system.scaleModes.RatioScaleMode();

		FlxG.resizeWindow(1280, 720);
		FlxG.resizeGame(1280, 720);
		centerWindowOnPoint(windowPos);

		windowPos.put(); windowPos.put(); baseCamPos.put();
	};

	public static inline function centerWindowOnPoint(?point:FlxPoint) {
        Lib.application.window.x = Std.int(point.x - (Lib.application.window.width / 2));
        Lib.application.window.y = Std.int(point.y - (Lib.application.window.height / 2));
    }

    public static inline function getCenterWindowPoint():FlxPoint {
        return FlxPoint.get(
            Lib.application.window.x + (Lib.application.window.width / 2),
            Lib.application.window.y + (Lib.application.window.height / 2)
        );
    }

	public static function setMouse(visable:Bool, ?image:String)
	{
		var mouse = new FlxSprite();
		FlxG.mouse.visible = visable;
		if (image != null)
		{
			mouse.loadGraphic(ApiPath.image('assets/images/${_assetpath}ui/$image'));
			FlxG.mouse.load(mouse.pixels);
		}
		else
			FlxG.mouse.useSystemCursor = true;
	}
}
//will be fixed
/*
onUpdate: (a:Dynamic){
			FlxG.resizeWindow(Std.int(windowRes.x), Std.int(windowRes.y));
			centerWindowOnPoint(windowPos);
			if ((Sys.time() - startTime) > 1.35) {
				windowTwn.cancel();
				completeWindowTwn();
			}
			return;
		},
*/