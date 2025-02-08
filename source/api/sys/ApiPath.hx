package api.sys;

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

class ApiPath
{
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
		bitmap = OpenFlAssets.getBitmapData(file);

		var newGraphic:FlxGraphic = FlxGraphic.fromBitmapData(bitmap, false, file);
		newGraphic.persist = true;
		newGraphic.destroyOnNoUse = false;
		return newGraphic;
	}

	inline static public function image(file:String, ?bitmap:BitmapData = null)
	{
		bitmap = OpenFlAssets.getBitmapData(file);

		var newBit = newBitmap(file, bitmap);

		return newBit;

	}

	inline static public function font(file:String)
	{
		return path('assets/api_assets/fonts/$file');
	}
}
