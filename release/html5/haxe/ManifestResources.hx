package;

import haxe.io.Bytes;
import haxe.io.Path;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

#if disable_preloader_assets
@:dox(hide) class ManifestResources {
	public static var preloadLibraries:Array<Dynamic>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;

	public static function init (config:Dynamic):Void {
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
	}
}
#else
@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

			if(!StringTools.endsWith (rootPath, "/")) {

				rootPath += "/";

			}

		}

		if (rootPath == null) {

			#if (ios || tvos || webassembly)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif (console || sys)
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_broshkill_otf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_novamono_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_pixel_otf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_vcr_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		data = '{"name":null,"assets":"aoy4:sizei2305311y4:typey5:MUSICy2:idy39:assets%2Fdata%2Fsongs%2Ftest%2Ftest.mp3y9:pathGroupaR4y39:assets%2Fdata%2Fsongs%2Ftest%2Ftest.ogghy7:preloadtgoR0i2333895R1R2R3R6R5aR4R6hgoR0i25804R1y4:FONTy9:classNamey35:__ASSET__assets_fonts_broshkill_otfR3y30:assets%2Ffonts%2FBroshKill.otfR7tgoR0i302380R1R8R9y34:__ASSET__assets_fonts_novamono_ttfR3y29:assets%2Ffonts%2FNovaMono.ttfR7tgoR0i14656R1R8R9y31:__ASSET__assets_fonts_pixel_otfR3y26:assets%2Ffonts%2Fpixel.otfR7tgoR0i75864R1R8R9y29:__ASSET__assets_fonts_vcr_ttfR3y24:assets%2Ffonts%2Fvcr.ttfR7tgoy4:pathy37:assets%2Fimages%2Fnotes%2Fhitcirc.pngR0i14884R1y5:IMAGER3R19R7tgoR18y33:assets%2Fimages%2Fnotes%2FRGB.pngR0i2249R1R20R3R21R7tgoR18y39:assets%2Fimages%2Fplay-warningarrow.pngR0i1275R1R20R3R22R7tgoR18y34:assets%2Fimages%2Fsection-fail.pngR0i13841R1R20R3R23R7tgoR18y34:assets%2Fimages%2Fsection-pass.pngR0i13704R1R20R3R24R7tgoR18y27:assets%2Fimages%2Fstart.pngR0i4258R1R20R3R25R7tgoR18y29:assets%2Fsystem%2FcrashBg.pngR0i877049R1R20R3R26R7tgoR18y26:assets%2Fsystem%2Ffuck.pngR0i364254R1R20R3R27R7tgoR18y32:assets%2Fsystem%2Fsmallerver.mp4R0i42396820R1y6:BINARYR3R28R7tgoR0i8220R1R2R3y26:flixel%2Fsounds%2Fbeep.mp3R5aR30y26:flixel%2Fsounds%2Fbeep.ogghR7tgoR0i39706R1R2R3y28:flixel%2Fsounds%2Fflixel.mp3R5aR32y28:flixel%2Fsounds%2Fflixel.ogghR7tgoR0i6840R1y5:SOUNDR3R31R5aR30R31hgoR0i33629R1R34R3R33R5aR32R33hgoR0i15744R1R8R9y35:__ASSET__flixel_fonts_nokiafc22_ttfR3y30:flixel%2Ffonts%2Fnokiafc22.ttfR7tgoR0i29724R1R8R9y36:__ASSET__flixel_fonts_monsterrat_ttfR3y31:flixel%2Ffonts%2Fmonsterrat.ttfR7tgoR18y33:flixel%2Fimages%2Fui%2Fbutton.pngR0i222R1R20R3R39R7tgoR18y36:flixel%2Fimages%2Flogo%2Fdefault.pngR0i484R1R20R3R40R7tgoR18y42:flixel%2Fimages%2Ftransitions%2Fcircle.pngR0i299R1R20R3R41R7tgoR18y53:flixel%2Fimages%2Ftransitions%2Fdiagonal_gradient.pngR0i730R1R20R3R42R7tgoR18y43:flixel%2Fimages%2Ftransitions%2Fdiamond.pngR0i236R1R20R3R43R7tgoR18y42:flixel%2Fimages%2Ftransitions%2Fsquare.pngR0i209R1R20R3R44R7tgoR18y34:flixel%2Fflixel-ui%2Fimg%2Fbox.pngR0i75R1R20R3R45R7tgoR18y37:flixel%2Fflixel-ui%2Fimg%2Fbutton.pngR0i211R1R20R3R46R7tgoR18y48:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_down.pngR0i216R1R20R3R47R7tgoR18y48:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_left.pngR0i222R1R20R3R48R7tgoR18y49:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_right.pngR0i238R1R20R3R49R7tgoR18y46:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_up.pngR0i227R1R20R3R50R7tgoR18y42:flixel%2Fflixel-ui%2Fimg%2Fbutton_thin.pngR0i118R1R20R3R51R7tgoR18y44:flixel%2Fflixel-ui%2Fimg%2Fbutton_toggle.pngR0i254R1R20R3R52R7tgoR18y40:flixel%2Fflixel-ui%2Fimg%2Fcheck_box.pngR0i101R1R20R3R53R7tgoR18y41:flixel%2Fflixel-ui%2Fimg%2Fcheck_mark.pngR0i97R1R20R3R54R7tgoR18y37:flixel%2Fflixel-ui%2Fimg%2Fchrome.pngR0i135R1R20R3R55R7tgoR18y42:flixel%2Fflixel-ui%2Fimg%2Fchrome_flat.pngR0i124R1R20R3R56R7tgoR18y43:flixel%2Fflixel-ui%2Fimg%2Fchrome_inset.pngR0i102R1R20R3R57R7tgoR18y43:flixel%2Fflixel-ui%2Fimg%2Fchrome_light.pngR0i118R1R20R3R58R7tgoR18y44:flixel%2Fflixel-ui%2Fimg%2Fdropdown_mark.pngR0i86R1R20R3R59R7tgoR18y41:flixel%2Fflixel-ui%2Fimg%2Ffinger_big.pngR0i1337R1R20R3R60R7tgoR18y43:flixel%2Fflixel-ui%2Fimg%2Ffinger_small.pngR0i157R1R20R3R61R7tgoR18y38:flixel%2Fflixel-ui%2Fimg%2Fhilight.pngR0i74R1R20R3R62R7tgoR18y36:flixel%2Fflixel-ui%2Fimg%2Finvis.pngR0i72R1R20R3R63R7tgoR18y41:flixel%2Fflixel-ui%2Fimg%2Fminus_mark.pngR0i77R1R20R3R64R7tgoR18y40:flixel%2Fflixel-ui%2Fimg%2Fplus_mark.pngR0i83R1R20R3R65R7tgoR18y36:flixel%2Fflixel-ui%2Fimg%2Fradio.pngR0i108R1R20R3R66R7tgoR18y40:flixel%2Fflixel-ui%2Fimg%2Fradio_dot.pngR0i81R1R20R3R67R7tgoR18y37:flixel%2Fflixel-ui%2Fimg%2Fswatch.pngR0i94R1R20R3R68R7tgoR18y34:flixel%2Fflixel-ui%2Fimg%2Ftab.pngR0i106R1R20R3R69R7tgoR18y39:flixel%2Fflixel-ui%2Fimg%2Ftab_back.pngR0i111R1R20R3R70R7tgoR18y44:flixel%2Fflixel-ui%2Fimg%2Ftooltip_arrow.pngR0i176R1R20R3R71R7tgoR18y39:flixel%2Fflixel-ui%2Fxml%2Fdefaults.xmlR0i1263R1y4:TEXTR3R72R7tgoR18y53:flixel%2Fflixel-ui%2Fxml%2Fdefault_loading_screen.xmlR0i1953R1R73R3R74R7tgoR18y44:flixel%2Fflixel-ui%2Fxml%2Fdefault_popup.xmlR0i1848R1R73R3R75R7tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

	}


}

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_test_test_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_test_test_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_broshkill_otf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_novamono_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_pixel_otf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_vcr_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_notes_hitcirc_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_notes_rgb_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_play_warningarrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_section_fail_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_section_pass_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_start_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_system_crashbg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_system_fuck_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_system_smallerver_mp4 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_circle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_diagonal_gradient_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_diamond_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_square_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/songs/test/test.mp3") @:noCompletion #if display private #end class __ASSET__assets_data_songs_test_test_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/data/songs/test/test.ogg") @:noCompletion #if display private #end class __ASSET__assets_data_songs_test_test_ogg extends haxe.io.Bytes {}
@:keep @:font("release/html5/obj/webfont/BroshKill.otf") @:noCompletion #if display private #end class __ASSET__assets_fonts_broshkill_otf extends lime.text.Font {}
@:keep @:font("release/html5/obj/webfont/NovaMono.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_novamono_ttf extends lime.text.Font {}
@:keep @:font("release/html5/obj/webfont/pixel.otf") @:noCompletion #if display private #end class __ASSET__assets_fonts_pixel_otf extends lime.text.Font {}
@:keep @:font("release/html5/obj/webfont/vcr.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_vcr_ttf extends lime.text.Font {}
@:keep @:image("assets/images/notes/hitcirc.png") @:noCompletion #if display private #end class __ASSET__assets_images_notes_hitcirc_png extends lime.graphics.Image {}
@:keep @:image("assets/images/notes/RGB.png") @:noCompletion #if display private #end class __ASSET__assets_images_notes_rgb_png extends lime.graphics.Image {}
@:keep @:image("assets/images/play-warningarrow.png") @:noCompletion #if display private #end class __ASSET__assets_images_play_warningarrow_png extends lime.graphics.Image {}
@:keep @:image("assets/images/section-fail.png") @:noCompletion #if display private #end class __ASSET__assets_images_section_fail_png extends lime.graphics.Image {}
@:keep @:image("assets/images/section-pass.png") @:noCompletion #if display private #end class __ASSET__assets_images_section_pass_png extends lime.graphics.Image {}
@:keep @:image("assets/images/start.png") @:noCompletion #if display private #end class __ASSET__assets_images_start_png extends lime.graphics.Image {}
@:keep @:image("engine/system/crashBg.png") @:noCompletion #if display private #end class __ASSET__assets_system_crashbg_png extends lime.graphics.Image {}
@:keep @:image("engine/system/fuck.png") @:noCompletion #if display private #end class __ASSET__assets_system_fuck_png extends lime.graphics.Image {}
@:keep @:file("engine/system/smallerver.mp4") @:noCompletion #if display private #end class __ASSET__assets_system_smallerver_mp4 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/6,0,0/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/6,0,0/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/6,0,0/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/6,0,0/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("release/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("release/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/6,0,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/6,0,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-addons/3,3,2/assets/images/transitions/circle.png") @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_circle_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-addons/3,3,2/assets/images/transitions/diagonal_gradient.png") @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_diagonal_gradient_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-addons/3,3,2/assets/images/transitions/diamond.png") @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_diamond_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-addons/3,3,2/assets/images/transitions/square.png") @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_square_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/box.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/button.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/button_arrow_down.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/button_arrow_left.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/button_arrow_right.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/button_arrow_up.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/button_thin.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/button_toggle.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/check_box.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/check_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/chrome.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/chrome_flat.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/chrome_inset.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/chrome_light.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/dropdown_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/finger_big.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/finger_small.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/hilight.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/invis.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/minus_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/plus_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/radio.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/radio_dot.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/swatch.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/tab.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/tab_back.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/tooltip_arrow.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends lime.graphics.Image {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/xml/defaults.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/xml/default_loading_screen.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/xml/default_popup.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends haxe.io.Bytes {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__assets_fonts_broshkill_otf') @:noCompletion #if display private #end class __ASSET__assets_fonts_broshkill_otf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/BroshKill"; #else ascender = 784; descender = -291; height = 1075; numGlyphs = 118; underlinePosition = 0; underlineThickness = 0; unitsPerEM = 1000; #end name = "BroshKill Regular"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_novamono_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_novamono_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/NovaMono"; #else ascender = 2215; descender = -639; height = 2854; numGlyphs = 1331; underlinePosition = -203; underlineThickness = 122; unitsPerEM = 2048; #end name = "NovaMono"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_pixel_otf') @:noCompletion #if display private #end class __ASSET__assets_fonts_pixel_otf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/pixel"; #else ascender = 1125; descender = -250; height = 1375; numGlyphs = 262; underlinePosition = -143; underlineThickness = 20; unitsPerEM = 1000; #end name = "Pixel Arial 11 Bold"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_vcr_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_vcr_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/vcr"; #else ascender = 1800; descender = 0; height = 2000; numGlyphs = 204; underlinePosition = -292; underlineThickness = 150; unitsPerEM = 2048; #end name = "VCR OSD Mono"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__assets_fonts_broshkill_otf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_broshkill_otf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_broshkill_otf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_novamono_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_novamono_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_novamono_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_pixel_otf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_pixel_otf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_pixel_otf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_vcr_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_vcr_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_vcr_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__assets_fonts_broshkill_otf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_broshkill_otf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_broshkill_otf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_novamono_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_novamono_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_novamono_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_pixel_otf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_pixel_otf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_pixel_otf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_vcr_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_vcr_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_vcr_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end