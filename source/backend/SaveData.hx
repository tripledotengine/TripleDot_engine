package backend;

import flixel.FlxG;
import flixel.util.FlxSave;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;

class SaveData{

    //[  '' => '',  ] //temp (I'm lazy stfu)

    public static var song:FlxSave = new FlxSave();//song score ig
    public static var win:FlxSave = new FlxSave();//Window/application
    public static var mods:FlxSave = new FlxSave();//mod settings

    public static var gameplay:Map<String, Dynamic> = [
           //used for gamplay settings - scroll speed, mid/downscroll, low quality, underlane
    ];
 
    public static var app:Map<String, Dynamic> = [
         //used for application settings
        'headerName' => 'Triple DOT!e',
        'hColorR' =>  128,
        'hColorG' =>    7,
        'hColorB' =>    7,
        'appWidth' => 640,
        'appHeight' => 480,
        'infoDisplay' => true,
        'baseFPS' => 60,
        'firstTime' => true
    ];
   
    public static var controls:Map<String, Dynamic> = [
        'muteK' => [FlxKey.ZERO, FlxKey.NUMPADZERO],
        'volDK' => [FlxKey.NUMPADMINUS, FlxKey.MINUS],
        'volUK' => [FlxKey.NUMPADPLUS, FlxKey.PLUS],
        'PvDfK' => [FlxKey.TAB]
    ];

    public static var songData:Map<String, Dynamic> = [
        //'songName +_+ Played difficulty' => [score as Int, Accuracy as Int, Final grade as String, date played (in american format) as String]
        //for 'songName' replace _ with -
        //VVVVVV example
        'tdot-test_hard' => [0, 100, 'SS', '4.11.2025']
    ];

    public static function save(){
        mods.bind('modsData','tEngine');
        //mod settings 
		song.bind('songData', 'tEngine');
        //specifically song data
        win.bind('tEngine_data', 'tEngine');
        //application + gameplay + controls
        FlxG.save.bind('game_data', 'tEngine');
        //anything that doesn't fit in the other two

        win.data.app = app;
        win.data.gameplay = gameplay;
        win.data.controls = controls;
	
		song.data.song_Data = songData;

        win.flush();
		song.flush();
        mods.flush();
        FlxG.save.flush();

        load();
    }

    public static function load(){
        if(win.data.app != null){
            var savedMap:Map<String, Dynamic> = win.data.app;
			for (name => value in savedMap){
				app.set(name, value);}}

        if(win.data.gameplay != null){
            var savedMap:Map<String, Dynamic> = win.data.gameplay;
			for (name => value in savedMap){
				gameplay.set(name, value);}}

        if(win.data.controls != null){
            var savedMap:Map<String, Dynamic> = win.data.controls;
			for (name => value in savedMap){
				controls.set(name, value);}}

        if(song.data.song_Data != null){
            var savedMap:Map<String, Dynamic> = song.data.song_Data;
			for (name => value in savedMap){
				songData.set(name, value);}}



		FlxG.sound.muteKeys = controls.get('muteK');
		FlxG.sound.volumeDownKeys = controls.get('volDK');
		FlxG.sound.volumeUpKeys = controls.get('volUK');
		FlxG.keys.preventDefaultKeys = controls.get('PvDfK');
    }

    public static function eraseData(?type:String){
        //will be expanded
        switch(type){
            case 'All': //deletes ALL save data (only use if needed)
                win.erase();
                song.erase();
                mods.erase();
                FlxG.save.erase();
        
                win.destroy();
                song.destroy();
                mods.destroy();
                FlxG.save.destroy();
            default:
                trace('Nothing was chosen.');
        }
    }
}