package game;

import flixel.FlxG;
import flixel.FlxSprite;
import twoB.Paths;

class Notes extends FlxSprite {

    var texture:Any = null;
    public function new(?x:Int, ?y:Int, ?texture:Any){
        super();
        this.x =x;
        this.y =y;
        this.texture = texture;

        loadGraphic(Paths.image(texture ?? 'images/notes/RGB.png'));
        // change this code to pull from a data string
    }
}