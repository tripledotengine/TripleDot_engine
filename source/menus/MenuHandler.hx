package menus;
//just to rerout menus easier, because we're gonna be lazy!

import flixel.FlxState;
import flixel.FlxG;

class MenuHandler extends FlxState{
    public static var menMap:Map<String, FlxState> = [
        'beta' => new menus.BetaMenu(),
        'int' => new Init()
    ];
    public static function state(str:String):Void {
        FlxG.switchState(menMap.get(str));
    }
}