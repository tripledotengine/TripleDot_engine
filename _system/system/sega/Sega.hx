function test(){
    var spr = new FLxSprite();
    spr.frames = PathB.atlas('system/sonic');
    spr.animation.addByPrefix('1','sonicwait0001');
    spr.animation.play('1');
    spr.screenCenter();
    add(spr);
}