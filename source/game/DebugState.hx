package menus;

import twoB.*;
import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.ui.*;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import haxe.Json;
import sys.io.File;
import flixel.input.mouse.FlxMouse;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;
import flixel.FlxObject;
class DebugState extends FlxState
{
	static var xScale = 0.4;
	static var mScale = 0;
	var _bg = new FlxSprite();
	var ui_txtBox:Array<FlxUIInputText> = [];
	var report:FlxText = new FlxText(0, 0, FlxG.width / 1.5);

	var dragOffset:FlxPoint;
	var _dragging:Bool = false;
	var _dragTarget:FlxObject;


	override public function create()
	{
		super.create();

		_bg.loadGraphic(Paths.image('system/crashBg.png'));
		_bg.scale.set(xScale,xScale);
		_bg.screenCenter();
		add(_bg);

		
		report.setFormat(Paths.font('vcr.ttf'), 32, 0xFFFFFFFF, CENTER, OUTLINE, 0xFF000000);
		report.screenCenter(XY);
		report.borderSize = 1.5;
		add(report);
	}

	override public function update(elapsed:Float){
		super.update(elapsed);

		if(FlxG.mouse.wheel != 0){
			mScale = FlxG.mouse.wheel;
			xScale += mScale / 10;
			_bg.scale.set(xScale,xScale);
		}
//Std.int('0.${FlxG.mouse.wheel}')
		report.text ='$xScale';
	}
}

