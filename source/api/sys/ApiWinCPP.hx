package api.sys;

import sys.FileSystem;

class ApiWinCPP
{
	public static function getRAM():Int
	{
		return ApiCPP.obtainRAM();
	}

	public static function winOppacity(a:Float)
	{
		ApiCPP.setWindowAlpha(a);
	}

	public static function winSetLayered()
	{
		ApiCPP._setWindowLayered();
	}

	public static function dark()
	{
		ApiCPP.setWindowColorMode(DARK);
	}

	public static function light()
	{
		ApiCPP.setWindowColorMode(LIGHT);
	}

	// public static function wallPaper(q:String)
	// {
	// 	ApiCPP.changeWallpaper();
	// }

	public static function killMinMax()
	{
		ApiCPP.removeMaximizeMinimizeButtons();
	}

	public static function addMinMax()
	{
		ApiCPP.addMaximizeMinimizeButtons();
	}
/*
	public static function killTaskbar()
	{
		ApiCPP.hideTaskbar();
	}

	public static function addTaskbar()
	{
		ApiCPP.restoreTaskbar();
	}

	public static function c()
	{
	}*/
}
