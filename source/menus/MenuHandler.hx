//just to rerout menus easier, because we're gonna be lazy!
package menus;

import flixel.FlxState;
import flixel.FlxG;

class MenuHandler extends FlxState{
    public static var menMap:Map<String, FlxState> = [
        'int' => new menus.Init()
    ];
    public static function state(str:String):Void {
        FlxG.switchState(menMap.get(str));
    }
}