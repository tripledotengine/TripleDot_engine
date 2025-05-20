package game.stages;

import game.shaders.SpiralShader;
class MBTest extends Tstage{

    var spiral = new SpiralShader();

    var backG:FlxSprite;

    public function build(){
        backG = new FlxSprite().loadGraphic(graphic('images/test/waveyshi'));
        backG.scale.set(0.4,0.4);
        backG.screenCenter();
        backG.shader = spiral.shader;
        spiral.shader.iResolution.value = [backG.width, backG.height];
        add(backG);

        var backC = new FlxSprite().loadGraphic(graphic('images/test/lmaocircle'));
        backC.scale.set(0.4,0.4);
        backC.screenCenter();
        add(backC);
	}

    public function refresh(elapsed:Float){
        spiral.shader.iTime.value[0] += elapsed;
		spiral.shader.iResolution.value = [backG.width, backG.height];
        spiral.set_speed(6);
    }
}