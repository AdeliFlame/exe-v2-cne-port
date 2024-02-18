import funkin.backend.utils.DiscordUtil;
import funkin.backend.scripting.events.DiscordPresenceUpdateEvent;
import discord_rpc.DiscordRpc;
import funkin.backend.scripting.events.MenuChangeEvent;
import funkin.backend.scripting.events.NameEvent;
import funkin.backend.scripting.EventManager;
import funkin.menus.credits.CreditsMain;
import funkin.options.OptionsMenu;
import funkin.editors.EditorPicker;
import funkin.menus.ModSwitchMenu;
import flixel.effects.FlxFlicker;
import flixel.addons.display.FlxBackdrop;
import funkin.backend.utils.CoolUtil;
import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;

public static var firstStart:Bool = true;
public static var nightly:String = "";
public static var kadeEngineVer:String = "1.5.4" + nightly;
public static var gameVer:String = "0.2.7.1";
public static var finishedFunnyMove:Bool = false;
public var canAccessDebugMenus:Bool = true;

var cancelCameraMove:Bool = false;
var curSelected:Int = 0;
var xval:Int = 100;
var arrows:FlxSprite;
var canTween:Bool = true;
var canSelect:Bool = false;
var menuItems:FlxTypedGroup<FlxSprite>;
var menuItems = new FlxTypedGroup();
var soundCooldown:Bool = true;
var optionShit:Array<String> = ['story mode', 'freeplay', 'options'];
var newGaming:FlxText;
var newGaming2:FlxText;
var bgdesat:FlxSprite;
var camFollow:FlxObject;
var spikeUp:FlxSprite;
var spikeDown:FlxSprite;

function onCameraMove(e) if(cancelCameraMove) e.cancel();
function create(){
 if (FlxG.save.data.soundTestUnlocked) optionShit.push('sound test');
else optionShit.push('sound test locked');

var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.image('backgroundlool'));
bg.scrollFactor.x = 0;
bg.scrollFactor.y = 0;
bg.setGraphicSize(Std.int(bg.width * .5));
bg.updateHitbox();
bg.screenCenter();
bg.antialiasing = true;
add(bg);

bgdesat = new FlxSprite(-80).loadGraphic(Paths.image('backgroundlool2'));
bgdesat.scrollFactor.x = 0;
bgdesat.scrollFactor.y = 0;
bgdesat.setGraphicSize(Std.int(bgdesat.width * .5));
bgdesat.updateHitbox();
bgdesat.screenCenter();
bgdesat.visible = false;
bgdesat.antialiasing = true;
bgdesat.color = 0xFFfd719b;
add(bgdesat);

arrows = new FlxSprite(92, 182).loadGraphic(Paths.image('funniArrows'));
arrows.scrollFactor.set();
arrows.antialiasing = true;
arrows.updateHitbox();
add(arrows);
FlxTween.tween(arrows, {y: arrows.y - 50}, 1, {ease: FlxEase.quadInOut, type: 4});

spikeUp = new FlxSprite(0, -65).loadGraphic(Paths.image('spikeUp'));
spikeUp.scrollFactor.x = 0;
spikeUp.scrollFactor.y = 0;
spikeUp.updateHitbox();
spikeUp.antialiasing = true;
		
spikeDown = new FlxSprite(-60 , 630).loadGraphic(Paths.image('spikeDown'));
spikeDown.scrollFactor.x = 0;
spikeDown.scrollFactor.y = 0;
spikeDown.updateHitbox();
spikeDown.antialiasing = true;

if (!FlxG.sound.music.playing)
		{
			FlxG.sound.playMusic(Paths.music('MainMenuMusic'));
		}

		FlxG.sound.playMusic(Paths.music('MainMenuMusic'));

 add(menuItems);
 var tex = Paths.getSparrowAtlas('FNF_main_menu_assets');

		for (i in 0...optionShit.length)
		{
			var menuItem:FlxSprite = new FlxSprite(xval, 40 + (i * 140));
			if (i % 2 == 0) menuItem.x -= 600 + i * 400;
			else menuItem.x += 600 + i * 400;

			FlxG.log.add(menuItem.x);
			menuItem.frames = tex;
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			menuItems.add(menuItem);
			menuItem.scrollFactor.set();
			menuItem.antialiasing = true;
			if (firstStart)
				FlxTween.tween(menuItem,{x: xval},1 + (i * 0.25) ,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
					{ 
						if(i == optionShit.length - 1)
						{
							finishedFunnyMove = true; 
							changeItem();
                            canSelect = true;
						}
					}});
			else
				menuItem.x = xval;
            canSelect = true;

			xval = xval + 220;
		}

		add(spikeUp);
		add(spikeDown);

		firstStart = false;

        var dataerase = new FlxText(FlxG.width - 300, FlxG.height - 16 * 2, 300, "Hold DEL to erase ALL data (this doesn't include ALL options)", 3);
		dataerase.scrollFactor.set();
        dataerase.size = 13;
		dataerase.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE);
		add(dataerase);

     }
     
function update(elapsed:Float)
{
if (canTween)
		{
			canTween = false;
			FlxTween.tween(spikeUp, {x: spikeUp.x - 60}, 1, {
				onComplete: function(twn:FlxTween)
				{
					spikeUp.x = 0;
					canTween = true;
				}
			});
			FlxTween.tween(spikeDown, {x: spikeDown.x + 60}, 1, {
				onComplete: function(twn:FlxTween)
				{
					spikeDown.x = -60;
				}
			});
		}
        if (FlxG.keys.justPressed.R)
		{
            FlxG.save.data.soundTestUnlocked = true;
            canAccessDebugMenus = true;
			FlxG.switchState(new MainMenuState());
		}
        if (FlxG.keys.justPressed.ESCAPE) FlxG.switchState(new TitleState());
        if (FlxG.keys.justPressed.EIGHT) FlxG.switchState(new MainMenuState());
        if (FlxG.keys.justPressed.SEVEN) openSubState(new EditorPicker());

    

    if (controls.SWITCHMOD) {
        openSubState(new ModSwitchMenu());
        persistentUpdate = false;
        persistentDraw = true;
    }
        if (FlxG.keys.justPressed.DELETE)
		{
			var urmom = 0;
			new FlxTimer().start(0.1, function(hello:FlxTimer)
			{
				urmom += 1;
				if (urmom == 30)
				{
					FlxG.save.data.storyProgress = 0; // lol.
					FlxG.save.data.soundTestUnlocked = false;
					FlxG.save.data.songArray = [];
					FlxG.switchState(new MainMenuState());
				}
				if (FlxG.keys.pressed.DELETE)
				{
					hello.reset();
				}
			});
		}
        if (controls.UP_P && canSelect == true)
        {
            changeItem(-1);
            FlxG.sound.play(Paths.sound('scrollMenu'));
        }

        if (controls.DOWN_P && canSelect == true)
        {
            changeItem(1);
        FlxG.sound.play(Paths.sound('scrollMenu'));
        }
        if (controls.BACK && canSelect == true)
			{
				FlxG.switchState(new TitleState());

			}

     if (controls.ACCEPT && canSelect == true )
			{
				if (optionShit[curSelected] == 'donate')
				{
					fancyOpenURL("https://ninja-muffin24.itch.io/funkin");
				}
				else if (optionShit[curSelected] == 'sound test locked')
				{
					if (soundCooldown)
					{
						soundCooldown = false;
						FlxG.sound.play(Paths.sound('deniedMOMENT'));
						new FlxTimer().start(0.8, function(tmr:FlxTimer)
						{
							soundCooldown = true;
						});
					}
				}
				else
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));
					
					if (FlxG.save.data.flashing)
						FlxFlicker.flicker(bgdesat, 1.1, 0.15, false);

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							FlxTween.tween(spr, {alpha: 0}, .3, {
								ease: FlxEase.expoOut,
								onComplete: function(twn:FlxTween)
								{
									spr.kill();
								}
							});
						}
						else
						{
							//FlxTween.tween(spr, {x: 465, y: 280}, .4);
							FlxTween.tween(FlxG.camera, {zoom: 1.1}, 2, {ease: FlxEase.expoOut});
							if (FlxG.save.data.flashing)
							{
								FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
								{
									goToState();
								});	
							}
							else
							{
								new FlxTimer().start(1, function(tmr:FlxTimer)
								{
									goToState();
								});
							}
						}
					});
				}
			}
		}

function goToState()
	{
		var daChoice:String = optionShit[curSelected];
		switch (daChoice)
		{
			case 'story mode':
				FlxG.switchState(new StoryMenuState());
				trace("Story Menu Selected");

			case 'freeplay':
				//FlxG.switchState(new FreeplayState());
				trace("Freeplay Menu Selected");

			case 'options':
				FlxG.switchState(new OptionsMenu());
				trace("going to da options");

			case 'sound test':
                FlxG.switchState(new ModState("SoundTestMenu"));
				trace("going to da sound test menu");
		}
	}

	function changeItem(huh:Int = 0)
	{
		if (finishedFunnyMove)
		{
			curSelected += huh;

			if (curSelected >= menuItems.length)
				curSelected = 0;
			if (curSelected < 0)
				curSelected = menuItems.length - 1;
		}
		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');

	

			if (spr.ID == curSelected && finishedFunnyMove)
			{
				spr.animation.play('selected');
                cancelCameraMove = true;
			}

			spr.updateHitbox();
		});
	}

