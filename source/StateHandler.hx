package;

import flixel.FlxState;
import flixel.FlxG;

class StateHandler extends FlxState{

    public static var menMap:Map<String, FlxState> = [
        'debug' => new menus.DebugState(),
        'int' => new menus.DebugState(),
        'splash' => new menus.transitions.FlxSplash()
    ];
    public static function state(?stateString:String):Void {
        FlxG.switchState(menMap.get(stateString));
    }
}