import flixel.text.FlxTextBorderStyle;
var woahmanstopspammin:Bool = true;
var whiteshit:FlxSprite;
var daValue:Int = 0;
var pcmValue:Int = 0;
var soundCooldown:Bool = true;
var funnymonke:Bool = true;
var incameo:Bool = false;
var cameoBg:FlxSprite;
var cameoImg:FlxSprite;
var cameoThanks:FlxSprite;
var pcmNO = new FlxText(FlxG.width / 6, FlxG.height / 2, 0, 'PCM  NO .', 23);
var daNO = new FlxText(FlxG.width * .6, FlxG.height / 2, 0, 'DA  NO .', 23);
var pcmNO_NUMBER = new FlxText(FlxG.width / 6, FlxG.height / 2, 0, '0', 23);
var daNO_NUMBER = new FlxText(FlxG.width / 6, FlxG.height / 2, 0, '0', 23);

function create()
{
	window.title = "Friday Night Funkin' Vs: Sonic.exe - Sound Test";
new FlxTimer().start(0.1, function(tmr:FlxTimer)
{
	FlxG.sound.playMusic(Paths.music('breakfast'));
});
whiteshit = new FlxSprite().makeGraphic(1280, 720, FlxColor.WHITE);
whiteshit.alpha = 0;

cameoBg = new FlxSprite();
cameoImg = new FlxSprite();
cameoThanks = new FlxSprite();

FlxG.sound.music.stop();

var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.image('meuns/SoundTest/backgroundST'));
bg.scrollFactor.x = 0;
bg.scrollFactor.y = 0;
bg.setGraphicSize(Std.int(bg.width * 1));
bg.updateHitbox();
bg.screenCenter();
bg.antialiasing = true;
add(bg);

var soundtesttext = new FlxText(0, 0, 0, 'SOUND TEST', 25);
soundtesttext.screenCenter();
soundtesttext.y -= 180;
soundtesttext.x -= 33;
soundtesttext.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 25, FlxColor.fromRGB(0, 163, 255));
add(soundtesttext);

pcmNO.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 23, FlxColor.fromRGB(174, 179, 251));
daNO.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 23, FlxColor.fromRGB(174, 179, 251));

pcmNO.y -= 70;
pcmNO.x += 100;
daNO.y -= 70;
add(pcmNO);
add(daNO);

pcmNO_NUMBER.y -= 70;
pcmNO_NUMBER.x += 270;
pcmNO_NUMBER.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 23, FlxColor.fromRGB(174, 179, 251));
add(pcmNO_NUMBER);

daNO_NUMBER.y -= 70;
daNO_NUMBER.x += daNO.x - 70;
daNO_NUMBER.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 23, FlxColor.fromRGB(174, 179, 251));
add(daNO_NUMBER);

cameoBg.visible = false;
add(cameoBg);

cameoThanks.visible = false;
add(cameoThanks);

cameoImg.visible = false;
add(cameoImg);

add(whiteshit);
}
function changeNumber(selection:Int) 
	{
		if (funnymonke)
		{
			pcmValue += selection;
			if (pcmValue < 0) pcmValue = 99;
			if (pcmValue > 99) pcmValue = 0;
		}
		else
		{
			daValue += selection;
			if (daValue < 0) daValue = 99;
			if (daValue > 99) daValue = 0;
		}
	}
function flashyWashy(a:Bool)
	{
		if (a == true)
		{
			FlxG.sound.play(Paths.sound('confirmMenu'));
			FlxTween.tween(whiteshit, {alpha: 1}, 0.4);
		}
		else
			FlxTween.color(whiteshit, 0.1, FlxColor.WHITE, FlxColor.BLUE);
			FlxTween.tween(whiteshit, {alpha: 0}, 0.2);

	}
    function doTheThing(first:Int, second:Int) 
	{
		if (first == 12 && second == 25)
		{
			woahmanstopspammin = false;
			PlayStateChangeables.nocheese = false;
			PlayState.SONG = Song.loadFromJson('endless-hard', 'endless');
			PlayState.isFreeplay = false;
			PlayState.isStoryMode = false;
			PlayState.storyDifficulty = 2;
			PlayState.storyWeek = 1;
			FlxTransitionableState.skipNextTransIn = true;
			FlxTransitionableState.skipNextTransOut = true;
			flashyWashy(true);
			new FlxTimer().start(2, function(tmr:FlxTimer)
			{
				LoadingState.loadAndSwitchState(new PlayState());
			});
			if (!FlxG.save.data.songArray.contains('endless') && !FlxG.save.data.botplay) FlxG.save.data.songArray.push('endless');
		}
		if (first == 85 && second == 29)
			{
            
			woahmanstopspammin = false;
		
			flashyWashy(true);
			PlayState.loadWeek({
				name: "week1",
				id: "week1",
				sprite: null,
				chars: [null, null, null],
				songs: [for (song in ["you-cant-run"]) {name: song, hide: false}],
				difficulties: ['hard']
		    }, "hard");
			new FlxTimer().start(1, function() {FlxG.switchState(new PlayState());});

			}
			if (first == 66 && second == 6)
				{
				
				woahmanstopspammin = false;
			
				flashyWashy(true);
				PlayState.loadWeek({
					name: "week1",
					id: "week1",
					sprite: null,
					chars: [null, null, null],
					songs: [for (song in ["too-slow"]) {name: song, hide: false}],
					difficulties: ['hard']
				}, "hard");
				new FlxTimer().start(1, function() {FlxG.switchState(new PlayState());});
	
				}
		else if (first == 7 && second == 7)
			{
				woahmanstopspammin = false;
				PlayStateChangeables.nocheese = false;
				PlayState.isFreeplay = false;
				PlayState.SONG = Song.loadFromJson('cycles-hard', 'cycles');
				PlayState.isStoryMode = false;
				PlayState.storyDifficulty = 2;
				PlayState.storyWeek = 1;
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
				flashyWashy(true);
				new FlxTimer().start(2, function(tmr:FlxTimer)
				{
					LoadingState.loadAndSwitchState(new PlayState());
				});
				if (!FlxG.save.data.songArray.contains('cycles') && !FlxG.save.data.botplay) FlxG.save.data.songArray.push('cycles');
			}
		else if (first == 31 && second == 13)
			{
				woahmanstopspammin = false;
				PlayStateChangeables.nocheese = false;
				PlayState.isFreeplay = false;
				PlayState.storyPlaylist = ['faker', 'black-sun'];
				PlayState.SONG = Song.loadFromJson('faker-hard', 'faker');
				PlayState.isStoryMode = false;
				PlayState.isList = true;
				PlayState.storyDifficulty = 2;
				PlayState.storyWeek = 1;
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
				flashyWashy(true);
				new FlxTimer().start(2, function(tmr:FlxTimer)
				{
					LoadingState.loadAndSwitchState(new PlayState());
				});
				if (!FlxG.save.data.songArray.contains('faker') && !FlxG.save.data.botplay) FlxG.save.data.songArray.push('faker');
			}
		else if (first == 66 && second == 6)
			{
				woahmanstopspammin = false;
				PlayStateChangeables.nocheese = false;
				PlayState.isFreeplay = false;
				PlayState.SONG = Song.loadFromJson('sunshine', 'sunshine');
				PlayState.isStoryMode = false;
				PlayState.storyDifficulty = 2;
				PlayState.storyWeek = 1;
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
				flashyWashy(true);
				if (!FlxG.save.data.songArray.contains('sunshine') && !FlxG.save.data.botplay) FlxG.save.data.songArray.push('sunshine');
				new FlxTimer().start(2, function(tmr:FlxTimer)
				{
					LoadingState.loadAndSwitchState(new PlayState());
				});
			}
		else if (first == 8 && second == 21)
			{
				woahmanstopspammin = false;
				PlayStateChangeables.nocheese = false;
				PlayState.isFreeplay = false;
				PlayState.SONG = Song.loadFromJson('chaos-hard', 'chaos');
				PlayState.isStoryMode = false;
				PlayState.storyDifficulty = 2;
				PlayState.storyWeek = 1;
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
				flashyWashy(true);
				new FlxTimer().start(2, function(tmr:FlxTimer)
				{
					LoadingState.loadAndSwitchState(new PlayState());
				});
				if (!FlxG.save.data.songArray.contains('chaos') && !FlxG.save.data.botplay) FlxG.save.data.songArray.push('chaos');
			}
		else if (first == 0 && second == 0)
			{
				woahmanstopspammin = false;
				PlayStateChangeables.nocheese = false;
				PlayState.isFreeplay = false;
				PlayState.SONG = Song.loadFromJson('too-fest-hard', 'too-fest');
				PlayState.isStoryMode = false;
				PlayState.storyDifficulty = 2;
				PlayState.storyWeek = 1;
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
				flashyWashy(true);
				new FlxTimer().start(2, function(tmr:FlxTimer)
				{
					LoadingState.loadAndSwitchState(new PlayState());
				});
			}
		else if (first == 41 && second == 1) 
		{
			woahmanstopspammin = false;
			flashyWashy(true);
			new FlxTimer().start(2, function(tmr:FlxTimer)
			{
				cameoImg.visible = true;
				cameoImg.loadGraphic(Paths.image('cameostuff/Razencro'));
				cameoImg.setSize(1280, 720);
				flashyWashy(false);
				FlxG.sound.music.stop();

			});
			new FlxTimer().start(2.1, function(tmr:FlxTimer)
			{
				FlxG.sound.playMusic(Paths.music('cameostuff/Razencro'));	
				incameo = true;
			});
		}
		else if (first == 1 && second == 13) // This for you div, R.I.P
			{
				woahmanstopspammin = false;
				flashyWashy(true);
				new FlxTimer().start(2, function(tmr:FlxTimer)
				{
					cameoImg.visible = true;
					cameoImg.loadGraphic(Paths.image('cameostuff/divide'));
					cameoImg.setSize(1280, 720);
					flashyWashy(false);
					FlxG.sound.music.stop();
	
				});
				new FlxTimer().start(2.1, function(tmr:FlxTimer)
				{
					incameo = true;
				});
			}
		else if (first == 9 && second == 10) // This for you div, R.I.P
			{
				woahmanstopspammin = false;
				flashyWashy(true);
				new FlxTimer().start(2, function(tmr:FlxTimer)
				{
					cameoImg.visible = true;
					cameoImg.loadGraphic(Paths.image('cameostuff/Sunkeh'));
					cameoImg.setSize(1280, 720);
					flashyWashy(false);
					FlxG.sound.music.stop();
	
				});
				new FlxTimer().start(2.1, function(tmr:FlxTimer)
				{
					incameo = true;
				});
			}
		else if (first == 6 && second == 6) // This for you div, R.I.P
			{
				woahmanstopspammin = false;
				flashyWashy(true);
				new FlxTimer().start(2, function(tmr:FlxTimer)
				{
					cameoImg.visible = true;
					cameoImg.loadGraphic(Paths.image('cameostuff/GamerX'));
					cameoImg.setSize(1280, 720);
					flashyWashy(false);
					FlxG.sound.music.stop();
	
				});
				new FlxTimer().start(2.1, function(tmr:FlxTimer)
				{
					incameo = true;
				});
			}
		else if (first == 23 && second == 23) 
			{
				var video:MP4Handler = new MP4Handler();
				woahmanstopspammin = false;
				flashyWashy(true);
				new FlxTimer().start(2, function(tmr:FlxTimer)
				{
					flashyWashy(false);
					FlxG.sound.music.stop();
	
				});
				new FlxTimer().start(2.1, function(tmr:FlxTimer)
				{
                	video.playMP4(Paths.video('Keel'));
					incameo = true;
				});
			}
		else if (first == 12 && second == 34) 
			{
				var video:MP4Handler = new MP4Handler();
				woahmanstopspammin = false;
				flashyWashy(true);
				new FlxTimer().start(2, function(tmr:FlxTimer)
				{
					flashyWashy(false);
					FlxG.sound.music.stop();
	
				});
				new FlxTimer().start(2.1, function(tmr:FlxTimer)
				{
                	video.playMP4(Paths.video('Milky'));
					incameo = true;
				});
			}
		else if (first == 32 && second == 8) 
		{
			woahmanstopspammin = false;
			flashyWashy(true);
			new FlxTimer().start(2, function(tmr:FlxTimer)
			{
				cameoImg.visible = true;
				cameoImg.loadGraphic(Paths.image('cameostuff/Marstarbro'));
				cameoImg.setSize(1280, 720);
				flashyWashy(false);
				FlxG.sound.music.stop();

			});
			new FlxTimer().start(2.1, function(tmr:FlxTimer)
			{
				FlxG.sound.playMusic(Paths.music('cameostuff/Marstarbro'));	
				incameo = true;
			});
		}
		else
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
	}
function update(elapsed:Float)
{
if (FlxG.keys.justPressed.ESCAPE) FlxG.switchState(new MainMenuState());
if (FlxG.keys.justPressed.RIGHT || FlxG.keys.justPressed.LEFT || FlxG.keys.justPressed.A || FlxG.keys.justPressed.D) if (woahmanstopspammin) funnymonke = !funnymonke;

			if (FlxG.keys.justPressed.DOWN || FlxG.keys.justPressed.S) if (woahmanstopspammin) changeNumber(1);

			if (FlxG.keys.justPressed.UP || FlxG.keys.justPressed.W) if (woahmanstopspammin) changeNumber(-1);

			if (FlxG.keys.justPressed.ENTER && woahmanstopspammin) doTheThing(pcmValue, daValue);

			if (FlxG.keys.justPressed.ENTER && !woahmanstopspammin && incameo) LoadingState.loadAndSwitchState(new SoundTestMenu());

			if (FlxG.keys.justPressed.ESCAPE && woahmanstopspammin && !incameo) LoadingState.loadAndSwitchState(new MainMenuState());

			if (funnymonke)
			{
                pcmNO.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 23, FlxColor.fromRGB(254, 174, 0));
		
                daNO.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 23, FlxColor.fromRGB(174, 179, 251));
			}
			else
			{
                pcmNO.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 23, FlxColor.fromRGB(174, 179, 251));
                
                 daNO.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 23, FlxColor.fromRGB(254, 174, 0));
			
			}
			
			if (pcmValue < 10)	pcmNO_NUMBER.text = '0' + Std.string(pcmValue);
			else pcmNO_NUMBER.text = Std.string(pcmValue);

			if (daValue < 10)	daNO_NUMBER.text = '0' + Std.string(daValue);
			else daNO_NUMBER.text = Std.string(daValue);

}
