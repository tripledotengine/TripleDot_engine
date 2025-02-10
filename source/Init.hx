package;

import sys.thread.Thread;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.*;
import haxe.Json;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import sys.FileSystem;
import sys.io.File;
import lime.app.Application;
import openfl.Assets;
import backend.*;

class Init extends TBeatState
{
    public static var muteKeys:Array<FlxKey> = [FlxKey.ZERO];
	public static var volumeDownKeys:Array<FlxKey> = [FlxKey.NUMPADMINUS, FlxKey.MINUS];
	public static var volumeUpKeys:Array<FlxKey> = [FlxKey.NUMPADPLUS, FlxKey.PLUS];
    override function create(){
		FlxG.game.focusLostFramerate = 30;
		FlxG.sound.muteKeys = muteKeys;
		FlxG.sound.volumeDownKeys = volumeDownKeys;
		FlxG.sound.volumeUpKeys = volumeUpKeys;
		FlxG.keys.preventDefaultKeys = [TAB];
		FlxG.save.bind('tdotSave', 'tdotTeam');
        FlxG.mouse.visible = false;

        initialize();
    }

	function initialize(){
		menus.MenuHandler.state('beta');
    }

    private var sickBeats:Int = 0;
}