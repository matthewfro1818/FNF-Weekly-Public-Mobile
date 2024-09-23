package meta.states.substate;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.util.FlxColor;
import meta.data.*;
import meta.states.*;
import gameObjects.*;

using StringTools;

class MarathonButtonsSubstate extends MusicBeatSubstate
{
	var bg:FlxSprite;
	var alphabetArray:Array<Alphabet> = [];
	var onYes:Bool = false;
	var yesText:Alphabet;
	var noText:Alphabet;

	public function new(what:Int)
	{
		super();

		bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0;
		bg.scrollFactor.set();
		add(bg);

		var text:Alphabet = new Alphabet(0, 180, "Reset all your", true);
		text.screenCenter(X);
		alphabetArray.push(text);
		text.alpha = 0;
		add(text);

		var text2:Alphabet = new Alphabet(0, 270, "marathon stats?", true);
		text2.screenCenter(X);
		alphabetArray.push(text2);
		text2.alpha = 0;
		add(text2);

		yesText = new Alphabet(0, text.y + 190, 'Yes', true);
		yesText.screenCenter(X);
		yesText.x -= 200;
		add(yesText);
		noText = new Alphabet(0, text.y + 190, 'No', true);
		noText.screenCenter(X);
		noText.x += 200;
		add(noText);
		#if mobile
		addVirtualPad(LEFT_RIGHT, A_B);
		#end
		updateOptions();
	}

	override function update(elapsed:Float)
	{
		bg.alpha += elapsed * 1.5;
		if(bg.alpha > 0.6) bg.alpha = 0.6;

		for (i in 0...alphabetArray.length) {
			var spr = alphabetArray[i];
			spr.alpha += elapsed * 2.5;
		}

		if(controls.UI_LEFT_P || controls.UI_RIGHT_P #if mobile || _virtualpad.buttonLeft.justPressed || _virtualpad.buttonRight.justPressed #end) {
			FlxG.sound.play(Paths.sound('scrollMenu'), 1);
			onYes = !onYes;
			updateOptions();
		}
		if(controls.BACK #if mobile || _virtualpad.buttonB.justPressed #end) {
			FlxG.sound.play(Paths.sound('cancelMenu'), 1);
			#if mobile
			closeSs();
                        #else
			close();
                        #end
		} else if(controls.ACCEPT #if mobile || _virtualpad.buttonA.justPressed #end) {
			if(onYes) {
				Highscore.resetMarathon();
			}
			FlxG.sound.play(Paths.sound('cancelMenu'), 1);
			#if mobile
			closeSs();
                        #else
			close();
                        #end
		}
		super.update(elapsed);
	}

	function updateOptions() {
		var scales:Array<Float> = [0.75, 1];
		var alphas:Array<Float> = [0.6, 1.25];
		var confirmInt:Int = onYes ? 1 : 0;

		yesText.alpha = alphas[confirmInt];
		yesText.scale.set(scales[confirmInt], scales[confirmInt]);
		noText.alpha = alphas[1 - confirmInt];
		noText.scale.set(scales[1 - confirmInt], scales[1 - confirmInt]);
	}
}
