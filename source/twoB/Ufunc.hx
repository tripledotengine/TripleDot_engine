package twoB;

import twoB.Utils;

/**
 * [UFunc]
 * @param UFunc extends @param Utils
 * when using CPP Functions please call from UFunc instead of Utils.
 * Utils holds all sort of code while UFunc is more streamlined.
 */
class Ufunc {

    // public static function getNDLLS(ndll:String, name:String, args:Int):Dynamic{
    //     Utils.getFunction(ndll, name, args);
    // }

	public static function getRAM(){
        return Utils.obtainRAM();}
	
	public static function setIcons(y_n:Bool) {
        if(y_n == true) Utils.delMinMax() else Utils.addMinMax();
    }


    public static function setWallpaper(path:String){
        Utils.changeWallpaper(path);
    }

	public static function showMsgBox(caption:String, message:String) {
        //Note-to-self: add custom icon support.
        Utils.showMessageBox(caption, message);
    }

	public static function setHeaderColor(r:Int, g:Int, b:Int, ?a:Int = 1){
        // Utils.setWindowBorderColor(r,g,b); : Utils.setWindowColorMode(a);
    }

	public static function setWinAlpha(alpha:Float = 1) {
        Utils.setWindowAlpha(alpha);
    }

    public static function getOSVer(){
        return Utils.getOSVersion();
    }

    public static function headerFunc(set:Bool){
        if (set == true )
            Utils.delMinMax();
        else
            Utils.addMinMax();
    }

	public static function getWinAlpha():Float{
        return Utils.getWindowAlpha();}

	public static function winScreenShot(path:String) {
       // Utils.windowsScreenShot(path);
       trace('nah gng');
    }

	public static function setTaskbar(hide:Bool) {
        Utils.hideTaskbar(hide);
    }

	public static function setWindowLayeredMode(numberMode:Int) {
        Utils.setWindowLayeredMode(numberMode);
    }
}