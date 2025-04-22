package game;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.FlxInput;
import flixel.input.keyboard.FlxKeyboard;
import flixel.text.FlxText;

class NoteSystem extends FlxSprite{
    ///strum line note
    var i:Any = null;
    var t:Any = null;

    /**
     * ## Hi!
     * - [Hit Detector]()
     * @param x X position
     * @param y Y position
     * @param t Alternate image
     * @param i sprite ID
     */
    public function new(x:Any, y:Any, ?t:Any, ?i:Any){
        super();

        this.x = x;
        this.y = y;
        this.i = i;
        this.t = t;

        loadGraphic(Paths.image(t ?? 'images/notes/hitcirc.png'));
    }
}