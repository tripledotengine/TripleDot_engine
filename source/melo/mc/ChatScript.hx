package melo.mc;

import flixel.group.FlxSpriteGroup;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.*;

class ChatScript extends FlxSpriteGroup{
    var _box = new FlxSprite(0,0);
    var _text = new FlxText();

    var sysN:String;
    var lastMsg:String;
    var r:Bool;

    var color1:FlxTextFormat = new FlxTextFormat(0xFFFFDD00, false, false, 0xFF000000);
    var color2:FlxTextFormat = new FlxTextFormat(0xFFFFFFFF, false, false, 0xFF000000);
    var nullColor:FlxTextFormatMarkerPair;
    var player:FlxTextFormatMarkerPair;
    var _responds:Map<String, String> = [
        'Hello' => 'err.type=null.hello',
        'Hi?' => 'err.type=null.hello',
        'Void'  => 'It\'s me.',
        'Who are you?'  => 'err.type=null.',
        'What do you want?'  => 'err.type=null.freedom',
        'Circuit'  => 'It was all his fault.',
        'Integrity'  => 'Deep down under the bedrock.',
        'Revuxor'  => 'Poor soul.',
        'clan_build'  => 'Home.',
        'Nothing is watching'  => 'A broken promise.',
        'Entity 303'  => 'Ended his own life.',
        'Steve'  => '[0.1]',
        'Herobrine'  => '',
        'How can I help you?'  => '[?][?][?]',
        'Can you see me?'  => 'Yes.',
        'Follow'  => 'Is behind you.',
        'null'  => 'The end is nigh',
        'xXram2dieXx'  => 'Rot in hell.'
    ];

    public function new(x:Float, y:Float, r:Bool = false){
        super();
        var nullColor = new FlxTextFormatMarkerPair(color1, "<_>");
        var player = new FlxTextFormatMarkerPair(color2, "<_>");

        sysN = user();

        this.x = x;
        this.y = y;
        this.r = r;
        _text.text = '';

        _box.makeGraphic(Std.int(x),Std.int(y), FlxColor.GRAY);
        _box.x = x;
		_box.updateHitbox();
        add(_box);
        _text.x = x + 10;
        _text.y = FlxG.height - 40;
        add(_text);
    }

    public function playerMessage(_:String){
        lastMsg = _;
        addNewText(_, r ? sysN : 'Steve');   
    }

    public function nullResponse(_:String){
        var _n = _responds.get(_.toLowerCase());
        addNewText(_n, 'Null');
    }

    public function addNewText(text:String, user:String){
        _text.applyMarkup("<_>"+user+"<_>" + text, [user == 'Null' ? nullColor : player]);
        FlxTween.tween(_text, {y: 50}, 0.5, { ease: FlxEase.quadInOut});
    }

    override public function update(elapsed:Float){
        super.update(elapsed);
        if(_responds.exists(lastMsg)){
            nullResponse(lastMsg);
        }
    }

    public function user(){
        return Sys.environment()["USERNAME"];
    }
}