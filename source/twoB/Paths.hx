package twoB;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.frames.FlxFrame.FlxFrameAngle;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import haxe.Json;
import haxe.xml.Access;
import lime.utils.Assets;
import openfl.display.BitmapData;
import openfl.geom.Rectangle;
import openfl.media.Sound;
import openfl.system.System;
import openfl.utils.AssetType;
import openfl.utils.Assets as OpenFlAssets;
import sys.FileSystem;
import sys.io.File;

class Paths
{
	inline public static var SOUND_EXT = #if web "mp3" #else "ogg" #end;

	public static var trackSound:Map<String, Sound> = [];
	public static var trackImage:Map<String, FlxGraphic> = [];
	
	public static function path(path:String)
	{
		if (!FileSystem.exists(path))
		{
			return null;
			trace('could not find $path');
		}
		return path;
		trace('asset = $path');
	}

	public static function newBitmap(file:String, ?bitmap:BitmapData = null){
		bitmap.lock();
		bitmap.disposeImage();

		var bitGrap:FlxGraphic = FlxGraphic.fromBitmapData(bitmap, file);
		bitGrap.persist = true;
		bitGrap.destroyOnNoUse = false;
		return bitGrap;
	}

	inline static public function image(file:String, ?bitmap:BitmapData = null)
	{
		var newBit = newBitmap(path('assets/'+file ), OpenFlAssets.getBitmapData(path('assets/'+file )));
		trackImage.set(file, newBit);
		return trackImage.exists(file) ? trackImage.get(file) : newBit;
	}

	inline static public function font(file:String)
	{
		return path('assets/fonts/'+file);
	}

	inline static public function sounds(file:String)
	{
		trackSound.set(file, OpenFlAssets.getSound(path('assets/'+file+'.'+SOUND_EXT)));
		return trackSound.get(file);
	}
		
	inline static public function atlas(file:String, ?bitmap:BitmapData = null)
	{
		var r = ~/[pngjpg]+/g;
		return FlxAtlasFrames.fromSparrow(image(file),path('assets/'+r.split(file)+'xml'));
	}

	inline static public function hscript(file:String)
	{
			return path('assets/scripts/'+file+'.hx');
	}

	inline static public function crashScript(file:String)
	{
			return path('assets/system/'+file+'.hx');
	}
}

