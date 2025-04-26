package backend;

import twoB.*;
import backend.*;
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
import flixel.input.keyboard.FlxKeyboard;

class DebugState extends FlxState
{
	static var xScale = 0.4;
	static var mScale = 0;
	var _bg = new FlxSprite();
	var ui_txtBox:Array<FlxUIInputText> = [];
	var report:FlxText = new FlxText(10, 0, FlxG.width / 1.5);

	var dragOffset:FlxPoint;
	var _dragging:Bool = false;
	var _dragTarget:FlxObject;

	var hitStrum = new NoteSystem(300, 25);
	var _button = new FlxSprite();
	var _group = new FlxTypedGroup<FlxSprite>();
	var _noteCount = 0;

	var key:FlxKeyboard;

	override public function create()
	{
		super.create();
		FlxG.sound.playMusic(Paths.sounds('data/songs/test/test'));

		_bg.loadGraphic(Paths.image('system/crashBg.png'));
		_bg.scale.set(xScale,xScale);
		_bg.screenCenter();
		add(_bg);

		
		report.setFormat(Paths.font('vcr.ttf'), 32, 0xFFFFFFFF, CENTER, OUTLINE, 0xFF000000);
		report.screenCenter(Y);
		report.borderSize = 1.5;
		add(report);

		_button.loadGraphic(Paths.image('images/start.png'));
		_button.screenCenter(Y);
		add(_button);

		add(hitStrum);
		add(_group);

		var script = new HScriptModule('sega/Sega', true);
	}

	override public function update(elapsed:Float){
		super.update(elapsed);

		_group.forEach(function(note:FlxSprite){

			note.y -= 25;
			
			if (note.y == 0)note.kill();
		});

		if(FlxG.mouse.wheel != 0){
			mScale = FlxG.mouse.wheel;
			xScale += mScale / 10;
			_bg.scale.set(xScale,xScale);
		}
		report.text ='$xScale';

		if (FlxG.keys.justPressed.SPACE){
			createNote(_noteCount += 1);}
	}

	function createNote(?id:Any){
		var note = new Notes(Std.int(hitStrum.x) , 700);
		note.ID = id;
		_group.add(note);
	}
}

