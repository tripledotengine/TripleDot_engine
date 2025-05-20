package backend;

import twoB.*;
import backend.*;
import melo.mc.MButton;
import melo.mc.ChatScript;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.ui.*;
import flixel.math.FlxMath;
import flixel.text.FlxText; 
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import haxe.Json;
import sys.io.File;
import flixel.input.mouse.FlxMouse;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;
import flixel.FlxObject;
import flixel.input.keyboard.FlxKeyboard;

import filters.*;
import openfl.Lib;
import openfl.filters.ShaderFilter;
import openfl.filters.BitmapFilter;

import game.shaders.PixelShader;
import game.shaders.OutlineShader;
import game.shaders.VHSShader;
import game.shaders.CRTShader;
import game.shaders.LightShader;
import game.shaders.HighCont;
import game.shaders.ToneShader;

import game.stages.MBTest;

class DebugState extends FlxState{
	var vhs = new VHSShader();
	var ctr = new CRTShader();
	var hct = new HighCont();
	var tone = new ToneShader('BLack', 'red');

	var filters:Array<BitmapFilter> = [];

	static var xScale = 0.4;
	static var mScale = 0;
	var _bg = new FlxSprite();
	var ui_txtBox:Array<FlxUIInputText> = [];
	var report:FlxText = new FlxText(10, 0, FlxG.width / 1.5);

	var dragOffset:FlxPoint;
	var _dragging:Bool = false;
	var _dragTarget:FlxObject;

	var hitStrum = new NoteSystem(300, 25);
	var _button = new FlxSprite();
	var _group = new FlxTypedGroup<FlxSprite>();
	var _noteCount = 0;

	var key:FlxKeyboard;

	var nuru = new FlxSprite(0, 0);

	var shaderCam:FlxCamera;
	
	var buttonXD:MButton;

	var chat = new ChatScript(260, FlxG.height);

	var guh:MBTest;

	override public function create()
	{
		// shaderCam = new FlxCamera();
		// shaderCam.bgColor.alpha = 0;
		// FlxG.cameras.add(shaderCam, false);
		// shaderCam.filters = new ShaderFilter(vhs);

		super.create();
		FlxG.sound.playMusic(Paths.sounds('data/music/TrollageFiles'));

		_bg.loadGraphic(Paths.image('system/crashBg.png'));
		_bg.scale.set(xScale,xScale);
		_bg.scrollFactor.set(.95, .95);
		_bg.screenCenter();
		add(_bg);


		nuru.frames = Paths.atlas('images/spr/NeuroSamaSprites.png','images/spr/NeuroSamaSprites');
		nuru.animation.addByPrefix('1', 'NeuroSamaIdle', 24, true);
		nuru.animation.play('1');
		nuru.scale.set(0.4,0.4);
		nuru.scrollFactor.set(.95, .95);
		nuru.screenCenter();
		nuru.x += 40;
		nuru.y += 20;
		nuru.shader = tone.shader;
		// add(nuru);

		add(chat);

		buttonXD = new MButton(200,400, 'I.. Am Steve');
		// add(buttonXD);

		guh = new MBTest();
		add(guh);
		guh.build();

		//filters.push(new ShaderFilter(tone.shader));
		//FlxG.camera.filters = filters;
		//FlxG.game.setFilters(filters);

        vhs.setTint(0.70, 0.70, 0.70, 0);
		// vhs.setTint(0.7, 0.1, 1.0, 0.2); // purple tint
        vhs.setDistortion(0);
        vhs.setAberration(0);
        vhs.setFlickerStrength(0);
        vhs.setScanlineStrength(0.06);
		trace(Sys.systemName() + Ufunc.getOSVer());
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);
        vhs.update(elapsed);
		guh.refresh(elapsed);
    }
}