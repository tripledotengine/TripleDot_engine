package menus;

import backend.*;

class BetaMenu  extends TBeatState{
    var _image = new FlxSprite();

    override function create():Void{
        _image.loadGraphic(Path.image('sillyjelly.png'));
        add(_image);
        super.create();
        // Sound.fromFile(Path.sound(''));
    }
}