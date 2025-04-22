package na;

// import flixel.FlxG;
// import flixel.FlxSprite;
// import flixel.FlxState;
// import flixel.input.FlxInput;
// import flixel.input.keyboard.FlxKeyboard;
// import flixel.text.FlxText;

// class InputSystem extends FlxState
// {
// 	var player:FlxSprite;
// 	var target:FlxSprite;
// 	var scoreText:FlxText;
// 	var score:Int = 0;
// 	var combo:Int = 0;
// 	var maxCombo:Int = 0;
// 	var accuracyThresholds:Array<Float> = [0.1, 0.2, 0.3];
// 	var accuracyNames:Array<String> = ["Perfect", "Great", "Good", "Miss"];
// 	var hitWindow:Float = 0.2;
// 	var key:FlxKeyboard;

// 	override public function create():Void
// 	{
// 		player = new FlxSprite(300, 400);
// 		player.loadGraphic('Default/' + Skins.noteIndicator, 'skins');
// 		add(player);

// 		target = new FlxSprite(300, -40);
// 		target.makeGraphic(40, 40, 0xffff0000);
// 		add(target);

// 		scoreText = new FlxText(10, 10, 200, "Score: 0");
// 		add(scoreText);

// 		key = FlxG.keys;

// 		FlxG.camera.flash(0xffffffff, 1);
// 	}

// 	override public function update(elapsed:Float):Void
// 	{
// 		super.update(elapsed);

// 		if (key.justPressed.SPACE)
// 		{
// 			var accuracy:Int = Math.abs(target.y - player.y);
// 			var judgment:Int = calculateJudgment(accuracy);
// 			if (judgment >= 0)
// 			{
// 				combo++;
// 				score += calculateScore(judgment);
// 				maxCombo = Math.max(maxCombo, combo);
// 				target.y = -40;
// 				scoreText.text = getScoreText();
// 			}
// 			else
// 			{
// 				combo = 0;
// 			}
// 		}

// 		if (target.y >= 480)
// 		{
// 			combo = 0;
// 			target.y = -40;
// 		}

// 		target.y += 2;
// 	}

// 	public function calculateJudgment(accuracy:Float):Int
// 	{
// 		for (i in 0...accuracyThresholds.length)
// 		{
// 			if (accuracy <= accuracyThresholds[i])
// 			{
// 				return i;
// 			}
// 		}
// 		return -1;
// 	}

// 	public function calculateScore(judgment:Int):Int
// 	{
// 		switch (judgment)
// 		{
// 			case 0:
// 				return 100; // Perfect
// 			case 1:
// 				return 50; // Great
// 			case 2:
// 				return 20; // Good
// 			default:
// 				return 0; // Miss
// 		}
// 	}

// 	public function getScoreText():String
// 	{
// 		return "Score: " + score + " Max Combo: " + maxCombo;
// 	}

// 	public function getJudgmentText(judgment:Int):String
// 	{
// 		if (judgment >= 0 && judgment < accuracyNames.length)
// 		{
// 			return accuracyNames[judgment];
// 		}
// 		return "Miss";
// 	}

// 	// Additional game setup and logic can be added here
// }
