package twoB.sys;

import haxe.Timer;
import lime.app.Application;
import openfl.events.Event;
import openfl.system.System;
import openfl.text.TextField;
import openfl.text.TextFormat;
import flixel.FlxG;

using flixel.util.FlxStringUtil;

class Display extends TextField{
    var times:Array<Float> = [];
	var memPeak:UInt = 0;

	public static var debug:Bool = true;
	// display info

	public function new(x:Float, y:Float)
	{
		super();

		this.x = x;
		this.y = x;

		autoSize = LEFT;
		selectable = false;

		background = true;
		backgroundColor = 0x6C000000;


		defaultTextFormat = new TextFormat(Paths.font('BroshKill.otf'), 14, 0xFFFFFF);
		text = "";

		addEventListener(Event.ENTER_FRAME, update);
	}

	function update(_:Event)
	{
		var now:Float = Timer.stamp();
		times.push(now);
		while (times[0] < now - 1)
			times.shift();

		var mem = System.totalMemory;
		if (mem > memPeak)
			memPeak = mem;

		if (visible)
		{
			text = ''; 
			text += times.length + " FPS - ";
			text += 'MEMORY: ${FlxStringUtil.formatBytes(mem)} / ${FlxStringUtil.formatBytes(memPeak)}';
			text += '\nCommpilation Info\n(] ${Info.getGit()} [)';
			text += (debug ? '\n>State: ${Type.getClass(FlxG.state)}' : '');
			text += (debug ? '\n> Object Count: ${FlxG.state.members.length}' +
	        				'\n> Camera Count: ${FlxG.cameras.list.length}' +
            				'\n> Sounds Count: ${FlxG.sound.list.length}'+
		    				'\n> FlxG.game Childs Count: ${FlxG.game.numChildren}' +
							'\n> Game Size: ${FlxG.width}, ${FlxG.height}': '');
		}
		FlxG.mouse.visible = debug;
		FlxG.mouse.useSystemCursor = debug;
	}
}