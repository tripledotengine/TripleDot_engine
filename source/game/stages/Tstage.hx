package game.stages;


import flixel.FlxBasic;
import flixel.FlxObject;
import flixel.FlxSubState;
import flixel.group.FlxGroup;

class Tstage extends FlxBasic{

	public function create() {}
	public function createPost() {}

    function add(object:FlxBasic) return FlxG.state.add(object);
	function remove(object:FlxBasic, splice:Bool = false) return FlxG.state.remove(object, splice);
	function insert(position:Int, object:FlxBasic) return FlxG.state.insert(position, object);
    
    function graphic(obj:String) return StagePath.image(obj+'.png');
    function atlas(obj:String) return StagePath.image(obj);
}