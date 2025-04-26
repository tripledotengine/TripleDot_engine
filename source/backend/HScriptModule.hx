package backend;

import crowplexus.iris.Iris;
import crowplexus.iris.IrisConfig;
import crowplexus.hscript.Expr.Error as IrisError;
import crowplexus.hscript.Printer;

class HScriptModule extends Iris{
    var hscript:String;
    var f:String;

    public var script:String;
    public var crash:Bool;

    /**
     * [Create and call new Hscript]()
     * @param script Name -> 'assets/scripts/' + ('true.hx' : 'honest/false.hx')
     * @param crash  If called from Crash (calling from crash builds the crash handler)
    **/
    
    override public function new(?script:String, ?crash:Bool){
        this.script = script;
        this.crash = crash;

        f = (crash ? Paths.hscript(script) : Paths.crashScript(script));
        hscript = File.getContent(f);

        super(hscript, new IrisConfig(script, false, false));

        setBasic();

		try {
			execute();
		} catch(e:IrisError) {
			this.destroy();
			throw e;
		}
    }
    
	override public function destroy(){
        super.destroy();
    }

    function setBasic(){
        set('Type', Type);
		set('File', File);
		set('FileSystem', FileSystem);
		set('FlxG', flixel.FlxG);
		set('FlxMath', flixel.math.FlxMath);
		set('FlxSprite', flixel.FlxSprite);
		set('FlxText', flixel.text.FlxText);
		set('FlxCamera', flixel.FlxCamera);
		set('FlxTimer', flixel.util.FlxTimer);
		set('FlxTween', flixel.tweens.FlxTween);
		set('FlxEase', flixel.tweens.FlxEase);
		set('Paths', twoB.PathB);// replace with dedicated path parser
    }
}