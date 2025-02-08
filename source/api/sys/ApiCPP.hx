package api.sys;

/**
 * c++ code borrowed/referenced from;
 * 
 * https://learn.microsoft.com/en-us/windows/apps/desktop/modernize/apply-windows-themes
 * https://github.com/Snirozu/Funkin-Psych-Online/blob/main/source/externs/WinAPI.hx
 * https://github.com/FNF-CNE-Devs/CodenameEngine/blob/main/source/funkin/backend/utils/native/Windows.hx
 * https://github.com/lunarcleint/Wednesdays-Infidelity/blob/master/source/data/WindowsData.hx
 */
@:buildXml('
<target id="haxe">
    <lib name="dwmapi.lib" if="windows" />
</target>
')
@:headerCode('
#include <Windows.h>
#include <cstdio>
#include <iostream>
#include <tchar.h>
#include <dwmapi.h>
#include <winuser.h>
')
class ApiCPP
{
	@:functionCode('
        int darkMode = mode;
        HWND window = GetActiveWindow();
        if (S_OK != DwmSetWindowAttribute(window, 19, &darkMode, sizeof(darkMode))) {
            DwmSetWindowAttribute(window, 20, &darkMode, sizeof(darkMode));
        }
        UpdateWindow(window);
    ')
	@:noCompletion
	public static function _setWindowColorMode(mode:Int)
	{
	}

	public static function setWindowColorMode(mode:WindowColorMode)
	{
		var darkMode:Int = cast(mode, Int);

		if (darkMode > 1 || darkMode < 0)
		{
			trace("WindowColorMode Not Found...");

			return;
		}

		_setWindowColorMode(darkMode);
	}

	@:functionCode("
		unsigned long long allocatedRAM = 0;
		GetPhysicallyInstalledSystemMemory(&allocatedRAM);

		return (allocatedRAM / 1024);
	")
	@:functionCode('
		FILE *meminfo = fopen("/proc/meminfo", "r");

    	if(meminfo == NULL)
			return -1;

    	char line[256];
    	while(fgets(line, sizeof(line), meminfo))
    	{
        	int ram;
        	if(sscanf(line, "MemTotal: %d kB", &ram) == 1)
        	{
            	fclose(meminfo);
            	return (ram / 1024);
        	}
    	}

    	fclose(meminfo);
    	return -1;
	')
	public static function obtainRAM()
	{
		return 0;
	}

	@:functionCode('
	HWND window = GetActiveWindow();
	SetWindowLong(window, GWL_EXSTYLE, GetWindowLong(window, GWL_EXSTYLE) ^ WS_EX_LAYERED);
	')
	@:noCompletion
	public static function _setWindowLayered()
	{
	}

	@:functionCode('
        HWND window = GetActiveWindow();

		float a = alpha;

		if (alpha > 1) {
			a = 1;
		} 
		if (alpha < 0) {
			a = 0;
		}

       	SetLayeredWindowAttributes(window, 0, (255 * (a * 100)) / 100, LWA_ALPHA);

    ')
	public static function setWindowAlpha(alpha:Float)
	{
		return alpha;
	}

	@:functionCode('
	return SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, (void*)path.c_str(), SPIF_UPDATEINIFILE);
	')
	public static function changeWallpaper(path:String):Bool
	{
		return false;
	}
	
	@:functionCode('
	 	HWND hwnd = GetActiveWindow();
	 	DWORD style = GetWindowLong(hwnd, GWL_STYLE);
	 	style &= ~WS_MINIMIZEBOX;
	 	style &= ~WS_MAXIMIZEBOX;
	 	SetWindowLong(hwnd, GWL_STYLE, style);
	 	SetWindowPos(hwnd, NULL, 0, 0, 0, 0, SWP_NOSIZE|SWP_NOMOVE|SWP_FRAMECHANGED);
	') 
	public static function removeMaximizeMinimizeButtons() {}

	@:functionCode('
		HWND hwnd = GetActiveWindow();
		DWORD style = GetWindowLong(hwnd, GWL_STYLE);
		style |= WS_MINIMIZEBOX;
		style |= WS_MAXIMIZEBOX;
		SetWindowLong(hwnd, GWL_STYLE, style);
		SetWindowPos(hwnd, NULL, 0, 0, 0, 0, SWP_NOSIZE|SWP_NOMOVE|SWP_FRAMECHANGED);
	') 
	public static function addMaximizeMinimizeButtons() {}
}

@:enum abstract WindowColorMode(Int)
{
	var DARK:WindowColorMode = 1;
	var LIGHT:WindowColorMode = 0;
}
