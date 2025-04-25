package twoB.sys;

import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxState;
import flixel.util.typeLimit.NextState;
import flixel.system.FlxSplash;


class TwoG extends FlxGame
{
	private static function crashGame()
	{
		null
		.draw();
	}

	/**
	 * Used to instantiate the guts of the flixel game object once we have a valid reference to the root.
	 */
	override function create(_):Void
	{
		try
			super.create(_)
		catch (e)
			onCrash(e);
	}

	override function onFocus(_):Void
	{
		try
			super.onFocus(_)
		catch (e)
			onCrash(e);
	}

	override function onFocusLost(_):Void
	{
		try
			super.onFocusLost(_)
		catch (e)
			onCrash(e);
	}

	/**
	 * Handles the `onEnterFrame` call and figures out how many updates and draw calls to do.
	 */
	override function onEnterFrame(_):Void
	{
		try
			super.onEnterFrame(_)
		catch (e)
			onCrash(e);
	}

	/**
	 * This function is called by `step()` and updates the actual game state.
	 * May be called multiple times per "frame" or draw call.
	 */

	var pressed = false;
	override function update():Void
	{
		if (FlxG.keys.justPressed.F1)
			crashGame();	

		try
			super.update()
		catch (e)
			onCrash(e);
	}

	/**
	 * Goes through the game state and draws all the game objects and special effects.
	 */
	override function draw():Void
	{
		try
			super.draw()
		catch (e)
			onCrash(e);
	}

	private final function onCrash(e:haxe.Exception):Void
	{
		var emsg:String = "";
		for (stackItem in haxe.CallStack.exceptionStack(true))
		{
			switch (stackItem)
			{
				case FilePos(s, file, line, column):
					emsg += file + " (line " + line + ")\n";
				default:
					Sys.println(stackItem);
					trace(stackItem);
			}
		}

		FlxG.switchState(() -> new twoB.sys.Crash(FlxG.state, emsg, e.message));
	}
}