package api;

import haxe.Timer;
import lime.app.Application;
import meta.*;
import openfl.events.Event;
import openfl.system.System;
import openfl.text.TextField;
import openfl.text.TextFormat;

using flixel.util.FlxStringUtil;

/**
	Overlay that displays FPS and memory usage.

	Based on this tutorial:
	https://keyreal-code.github.io/haxecoder-tutorials/17_displaying_fps_and_memory_usage_using_openfl.html
**/
class ApiDisplay extends TextField
{
	var times:Array<Float> = [];
	var memPeak:UInt = 0;

	// display info
	public static var _fps = ApiFunc.boolMap.get('fps');
	public static var _mem = ApiFunc.boolMap.get('mem');
	public static var _ver = ApiFunc.boolMap.get('ver');
	public static var _xtr = ApiFunc.boolMap.get('xtr');

	public function new(x:Float, y:Float)
	{
		super();

		this.x = x;
		this.y = x;

		autoSize = LEFT;
		selectable = false;

		defaultTextFormat = new TextFormat(ApiPath.font('MC_Font.ttf'), 14, 0xFFFFFF);
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
			text += (_fps ? times.length + " FPS • " : '');
			text += (_mem ? '${FlxStringUtil.formatBytes(mem)} / ${FlxStringUtil.formatBytes(memPeak)} • ' : '');
			text += (_ver ? 'Triple DOT!e v${Application.current.meta.get('version')}|API v${ApiFunc.curMap.get('apiver')}' + " • " : '');
			text += (_xtr ? '' : '');
		}


	}

	public static function updateDisplayInfo(a:Bool, b:Bool, c:Bool, d:Bool)
	{
		_fps = a;
		_mem = b;
		_ver = c;
		_xtr = d;
	}
}
