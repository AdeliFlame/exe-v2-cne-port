var ezbg:FlxSprite;
var sprDifficulty:FlxSprite;
var leftArrow:FlxSprite;
var rightArrow:FlxSprite;
var leftArrow2:FlxSprite;
var rightArrow2:FlxSprite;
var curdiff:Int = 2;
var real:Int = 0;
var oneclickpls:Bool = true;
var bfIDLELAWL:StoryModeMenuBFidle;
var redBOX:FlxSprite;
var selection:Bool = false;
var songArray = ['too-slow', 'you-cant-run', 'triple-trouble'];
var staticscreen:FlxSprite;
var portrait:FlxSprite;

function create()
{
FlxG.sound.playMusic(Paths.music('storymodemenumusic'));
var bg:FlxSprite;

bg = new FlxSprite(0, 0);
bg.frames = Paths.getSparrowAtlas('meuns/story/SMMStatic');
bg.animation.addByPrefix('idlexd', "damfstatic", 24);
bg.animation.play('idlexd');
bg.alpha = 1;
bg.antialiasing = true;
bg.setGraphicSize(Std.int(bg.width));
bg.updateHitbox();
add(bg);

var greyBOX:FlxSprite;
greyBOX = new FlxSprite(0, 0).loadGraphic(Paths.image('meuns/story/greybox'));
bg.alpha = 1;
greyBOX.antialiasing = true;
greyBOX.setGraphicSize(Std.int(bg.width));
greyBOX.updateHitbox();
add(greyBOX);

bf = new Character(0, 0, "BOYFRIEND", true);
bf.playAnim("idle");
bf.scale.x = .4;
bf.scale.y = .4;
bf.screenCenter();
bf.y -= 300;
bf.antialiasing = true;
add(bf);

portrait = new FlxSprite(450, 79).loadGraphic(Paths.image('fpstuff/too-slow'));
portrait.setGraphicSize(Std.int(portrait.width * 0.275));
portrait.antialiasing = true;
portrait.updateHitbox();
add(portrait);

staticscreen = new FlxSprite(450, 0);
staticscreen.frames = Paths.getSparrowAtlas('meuns/story/screenstatic');
staticscreen.animation.addByPrefix('screenstaticANIM', "screenSTATIC", 24);
staticscreen.animation.play('screenstaticANIM');
staticscreen.y += 79;
staticscreen.alpha = 0.3;
staticscreen.antialiasing = true;
staticscreen.setGraphicSize(Std.int(staticscreen.width * 0.275));
staticscreen.updateHitbox();
add(staticscreen);

var yellowBOX:FlxSprite;
yellowBOX = new FlxSprite(0, 0).loadGraphic(Paths.image('meuns/story/yellowbox'));
yellowBOX.alpha = 1;
yellowBOX.antialiasing = true;
yellowBOX.setGraphicSize(Std.int(bg.width));
yellowBOX.updateHitbox();
add(yellowBOX);

redBOX = new FlxSprite(0, 0).loadGraphic(Paths.image('meuns/story/redbox'));
redBOX.alpha = 1;
redBOX.antialiasing = true;
redBOX.setGraphicSize(Std.int(bg.width));
redBOX.updateHitbox();
add(redBOX);

sprDifficulty = new FlxSprite(550, 600);
		sprDifficulty.frames = Paths.getSparrowAtlas('meuns/story/campaign_menu_UI_assets');
		sprDifficulty.animation.addByPrefix('easy', 'EASY');
		sprDifficulty.animation.addByPrefix('normal', 'NORMAL');
		sprDifficulty.animation.addByPrefix('hard', 'HARD');
		sprDifficulty.animation.play('normal');
		add(sprDifficulty);

		leftArrow = new FlxSprite(sprDifficulty.x - 150, sprDifficulty.y);
		leftArrow.frames = Paths.getSparrowAtlas('meuns/story/campaign_menu_UI_assets');
		leftArrow.setGraphicSize(Std.int(leftArrow.width * 0.8));
		leftArrow.animation.addByPrefix('idle', "arrow left");
		leftArrow.animation.addByPrefix('press', "arrow push left");
		leftArrow.animation.play('idle');
		add(leftArrow);

		rightArrow = new FlxSprite(sprDifficulty.x + 230, sprDifficulty.y);
		rightArrow.frames = Paths.getSparrowAtlas('meuns/story/campaign_menu_UI_assets');
		rightArrow.setGraphicSize(Std.int(rightArrow.width * 0.8));
		rightArrow.animation.addByPrefix('idle', "arrow right");
		rightArrow.animation.addByPrefix('press', "arrow push right");
		rightArrow.animation.play('idle');
		add(rightArrow);

		leftArrow2 = new FlxSprite(325, 136 + 5);
		leftArrow2.frames = Paths.getSparrowAtlas('meuns/story/campaign_menu_UI_assets_alt');
		leftArrow2.setGraphicSize(Std.int(leftArrow2.width * 0.8));
		leftArrow2.animation.addByPrefix('idle', "arrow left");
		leftArrow2.animation.addByPrefix('press', "arrow push left");
		leftArrow2.animation.play('idle');
		add(leftArrow2);

		rightArrow2 = new FlxSprite(820, 136 + 5);
		rightArrow2.frames = Paths.getSparrowAtlas('meuns/story/campaign_menu_UI_assets_alt');
		rightArrow2.setGraphicSize(Std.int(rightArrow2.width * 0.8));
		rightArrow2.animation.addByPrefix('idle', "arrow right");
		rightArrow2.animation.addByPrefix('press', "arrow push right");
		rightArrow2.animation.play('idle');
		add(rightArrow2);

		sprDifficulty.offset.x = 70;
		sprDifficulty.y = leftArrow.y + 10;


}
function changediff(diff:Int = 1)
	{
		curdiff += diff;

		if (curdiff == 0)
			curdiff = 3;
		if (curdiff == 4)
			curdiff = 1;

		FlxG.sound.play(Paths.sound('scrollMenu'));

		switch (curdiff)
		{
			case 1:
				sprDifficulty.animation.play('easy');
				sprDifficulty.offset.x = 20;
			case 2:
				sprDifficulty.animation.play('normal');
				sprDifficulty.offset.x = 70;
			case 3:
				sprDifficulty.animation.play('hard');
				sprDifficulty.offset.x = 20;
		}
		sprDifficulty.alpha = 0;
		sprDifficulty.y = leftArrow.y - 15;
		FlxTween.tween(sprDifficulty, {y: leftArrow.y + 10, alpha: 1}, 0.07);
	}
function changeAct(diff:Int = 1)
	{
		if (FlxG.save.data.storyProgress != 0)
		{
			FlxG.sound.play(Paths.sound('scrollMenu'));

			real += diff;
			if (real < 0)
				real = songArray.length - 1;
			else if (real > songArray.length - 1)
				real = 0;

			portrait.loadGraphic(Paths.image('fpstuff/' + songArray[real]));

			FlxTween.cancelTweensOf(staticscreen);
			staticscreen.alpha = 1;
			FlxTween.tween(staticscreen, {alpha: 0.3}, 1);
		}
	}
    function changeSelec()
	{
		selection = !selection;

		if (selection)
		{
			leftArrow.setPosition(345, 145);
			rightArrow.setPosition(839, 145);
			leftArrow2.setPosition(550 - 160 - 5, 600 - 2);
			rightArrow2.setPosition(550 + 230 - 15, 600 - 2);
		}
		else
		{
			leftArrow2.setPosition(325, 136 + 5);
			rightArrow2.setPosition(820, 136 + 5);
			leftArrow.setPosition(550 - 150, 600);
			rightArrow.setPosition(550 + 230, 600);
		}
	}
 function update(elapsed:Float)
	{
        if (controls.LEFT && oneclickpls)
			leftArrow.animation.play('press');
		else
			leftArrow.animation.play('idle');

		if (controls.LEFT_P && oneclickpls)
		{
			if (selection)
				changeAct(-1);
			else
				changediff(-1);
		}

		if (controls.RIGHT && oneclickpls)
			rightArrow.animation.play('press');
		else
			rightArrow.animation.play('idle');

		if (controls.RIGHT_P && oneclickpls)
		{
			if (selection)
				changeAct(1);
			else
				changediff(1);
		}

		if ((controls.UP_P && oneclickpls) || (controls.DOWN_P && oneclickpls))
			changeSelec(); // i forgor how ifs work

		if (controls.BACK && oneclickpls)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			FlxG.switchState(new MainMenuState());
		}
        if (controls.ACCEPT)
		{
			if (oneclickpls)
			{
				oneclickpls = false;
				var curDifficulty = '';

				FlxG.sound.play(Paths.sound('confirmMenu'));

			
			if (FlxG.save.data.flashing)
			{
				FlxFlicker.flicker(redBOX, 1, 0.06, false, false, function(flick:FlxFlicker) {});
			}
		}
	}
}