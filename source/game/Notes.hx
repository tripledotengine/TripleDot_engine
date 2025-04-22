package game;

import flixel.FlxG;
import flixel.FlxSprite;
import twoB.Paths;

class Notes extends FlxSprite {

    var t:Any = null;

    /**
     * ## Hi!
     * - [Hit Detector]()
     * @param x X position
     * @param y Y position
     * @param t Alternate image
     */

    public function new(?x:Int, ?y:Int, ?t:Any){
        super();
        this.x = x;
        this.y = y;
        this.t = t;

        loadGraphic(Paths.image(t ?? 'images/notes/RGB.png'));
        // change this code to pull from a data string
    }
}