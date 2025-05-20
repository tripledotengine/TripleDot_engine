package twoB;
import haxe.macro.Context;
import haxe.macro.Expr;
import lime.app.Application;
import lime.system.CFFI;
import lime.utils.Assets;
@:buildXml('
<target id="haxe">
    <lib name="dwmapi.lib" if="windows" />
</target>
')
@:cppFileCode('
#include <Windows.h>// 
#include <cstdio>
#include <iostream>
#include <tchar.h>
#include <dwmapi.h>
#include <winuser.h>
')
class Utils {
	// macro public static function generateReflectionLike(totalArguments:Int, funcName:String, argsName:String):Dynamic {
	// 	totalArguments++;

	// 	var funcCalls = [];
	// 	for(i in 0...totalArguments) {
	// 		var args = [
	// 			for(d in 0...i) macro $i{argsName}[$v{d}]
	// 		];

	// 		funcCalls.push(macro $i{funcName}($a{args}));
	//     }

	// 	var expr = {
	// 		pos: Context.currentPos(),
	// 		expr: ESwitch(
	// 			macro ($i{argsName}.length),
	// 			[
	// 				for(i in 0...totalArguments) {
	// 					values: [macro $v{i}],
	// 					expr: funcCalls[i],
	// 					guard: null,
	// 				}
	// 			],
	// 			macro throw "Too many arguments"
	// 		)
	// 	}

	// 	return expr;
	// }

	// public static macro function safeSet(variable:Null<Expr>, value:Null<Expr>):Null<Expr> {
	// 	return macro if (${value} != null) ${variable} = ${value};
	// }
	// public static macro function safeSetWrapper(variable:Null<Expr>, value:Null<Expr>, wrapper:Null<Expr>):Null<Expr> {
	// 	return macro if (${value} != null) ${variable} = ${wrapper}(${value});
	// }

	// public static macro function safeReflection(variable:Null<Expr>, value:Null<Expr>, field:Null<Expr>):Null<Expr> {
	// 	return macro if (Reflect.hasField(${value}, ${field})) ${variable} = Reflect.field(${value}, ${field});
	// }

    // 	/**
	//  * Returns an function from a Haxe NDLL.
	//  * Limited to 25 argument due to a limitation
	//  *
	//  * @param ndll Name of the NDLL.
	//  * @param name Name of the function.
	//  * @param args Number of arguments of that function.
	//  */
	// public static function getFunction(ndll:String, name:String, args:Int):Dynamic {
	// 	var func:Dynamic = getFunctionFromPath(ndllPath('$ndll'), name, args);

	// 	return Reflect.makeVarArgs(function(a:Array<Dynamic>) {
	// 		return generateReflectionLike(25, "func", "a");
	// 	});
	// }

	// public static function ndllPath(path:Any) {
	// 	return './assets/ndlls/$path.ndll';
	// }

	// public static function getFunctionFromPath(ndll:String, name:String, args:Int):Dynamic {
	// 	if (!Assets.exists(ndll)) {
	// 		return noop;
	// 	}
	// 	var func = lime.system.CFFI.load(Assets.getPath(ndll), name, args);

	// 	if (func == null) {
	// 		return noop;
	// 	}
	// 	return func;

	// }

	// @:dox(hide) @:noCompletion static function noop() {}

// :>>

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
	public static function delMinMax() {}

	@:functionCode('
		HWND hwnd = GetActiveWindow();
		DWORD style = GetWindowLong(hwnd, GWL_STYLE);
		style |= WS_MINIMIZEBOX;
		style |= WS_MAXIMIZEBOX;
		SetWindowLong(hwnd, GWL_STYLE, style);
		SetWindowPos(hwnd, NULL, 0, 0, 0, 0, SWP_NOSIZE|SWP_NOMOVE|SWP_FRAMECHANGED);
	') 
	public static function addMinMax() {}

	@:functionCode('
		HWND hwnd = GetActiveWindow();
		DWORD style = GetWindowLong(hwnd, GWL_STYLE);
		style |= WS_SYSMENU;
		SetWindowLong(hwnd, GWL_STYLE, style);
		SetWindowPos(hwnd, NULL, 0, 0, 0, 0, SWP_NOSIZE|SWP_NOMOVE|SWP_FRAMECHANGED);
	') 
	public static function addButtons() {}
	
	@:functionCode('
		HWND hwnd = GetActiveWindow();
		DWORD style = GetWindowLong(hwnd, GWL_STYLE);
		style |= ~WS_SYSMENU;
		SetWindowLong(hwnd, GWL_STYLE, style);
		SetWindowPos(hwnd, NULL, 0, 0, 0, 0, SWP_NOSIZE|SWP_NOMOVE|SWP_FRAMECHANGED);
	') 
	public static function delButtons() {}

    @:functionCode('
		MessageBox(GetActiveWindow(), message, caption, icon | MB_SETFOREGROUND);
	')
	public static function showMessageBox(caption:String, message:String, icon:Int = 1) {}


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

	@:functionCode('
        HWND window = GetActiveWindow();

		auto color = RGB(r, g, b);
		
        if (S_OK != DwmSetWindowAttribute(window, 35, &color, sizeof(COLORREF))) {
            DwmSetWindowAttribute(window, 35, &color, sizeof(COLORREF));
        }

		if (S_OK != DwmSetWindowAttribute(window, 34, &color, sizeof(COLORREF))) {
            DwmSetWindowAttribute(window, 34, &color, sizeof(COLORREF));
        }

        UpdateWindow(window);
    ')
	public static function setWindowBorderColor(r:Int, g:Int, b:Int){}

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
	public static function setWindowAlpha(alpha:Float) {}

	@functionCode('
   		// int osver= 0.0;

   		NTSTATUS(WINAPI *RtlGetVersion)(LPOSVERSIONINFOEXW);

  		OSVERSIONINFOEXW osInfo;

    	*(FARPROC*)&RtlGetVersion = GetProcAddress(GetModuleHandleA("ntdll"), "RtlGetVersion");

     	if (NULL != RtlGetVersion)
     	{
            osInfo.dwOSVersionInfoSize = sizeof(osInfo);
            RtlGetVersion(&osInfo);
            os_ = osInfo.dwMajorVersion;
			return os_;
      	}
	')

	public static function getOSVersion(?os_:Int){
		return os_;
	}

	@:functionCode('
		HWND hwnd = GetActiveWindow();

		DWORD exStyle = GetWindowLong(hwnd, GWL_EXSTYLE);
		BYTE alpha = 255;
		
		if (exStyle & WS_EX_LAYERED) {
			DWORD flags;
			GetLayeredWindowAttributes(hwnd, NULL, &alpha, &flags);
		}

		float alphaFloat = static_cast<float>(alpha) / 255.0f;

		return alphaFloat;
	')
	public static function getWindowAlpha():Float{
		return 0;
	}

	// @:functionCode('
	// 	int screenWidth = GetSystemMetrics(SM_CXSCREEN);
	// 	int screenHeight = GetSystemMetrics(SM_CYSCREEN);
	// 	screenCapture(0, 0, screenWidth, screenHeight, path);
	// ')
	// @:noCompletion
	// public static function windowsScreenShot(path:String = './assets/images/') {}

	@:functionCode('
		bool value = hide;
		HWND hwnd = FindWindowA("Shell_traywnd", nullptr);
		HWND hwnd2 = FindWindowA("Shell_SecondaryTrayWnd", nullptr);
	
		if (value == true) {
			ShowWindow(hwnd, SW_HIDE);
			ShowWindow(hwnd2, SW_HIDE);
		} else {
			ShowWindow(hwnd, SW_SHOW);
			ShowWindow(hwnd2, SW_SHOW);
		}
    ')
	public static function hideTaskbar(hide:Bool) {}

	@:functionCode('
		HWND window;
		HWND window2;

		switch (numberMode) {
			case 0:
				window = FindWindowW(L"Progman", L"Program Manager");
				window = GetWindow(window, GW_CHILD);
			case 1:
				window = FindWindowA("Shell_traywnd", nullptr);
				window2 = FindWindowA("Shell_SecondaryTrayWnd", nullptr);
		}

		if (numberMode != 1) {
			SetWindowLong(window, GWL_EXSTYLE, GetWindowLong(window, GWL_EXSTYLE) ^ WS_EX_LAYERED);
		}
		else {
			SetWindowLong(window, GWL_EXSTYLE, GetWindowLong(window, GWL_EXSTYLE) ^ WS_EX_LAYERED);
			SetWindowLong(window2, GWL_EXSTYLE, GetWindowLong(window2, GWL_EXSTYLE) ^ WS_EX_LAYERED);
		}
	')
	public static function setWindowLayeredMode(numberMode:Int) {}
}

enum abstract WindowColorMode(Int)
{
	var DARK:WindowColorMode = 1;
	var LIGHT:WindowColorMode = 0;
}
