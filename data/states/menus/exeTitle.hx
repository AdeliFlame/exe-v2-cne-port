import funkin.backend.system.framerate.Framerate;
var canDoShit:Bool = true;
Framerate.fpsCounter.visible = false;
Framerate.memoryCounter.visible = false;
Framerate.codenameBuildField.visible = false;

function new() CoolUtil.playMenuSong();

static var initialized:Bool = false;

var blackScreen:FlxSprite;
var logoBl:FlxSprite;
var ngSpr:FlxSprite;
var code:Int = 0;
var wackyImage:FlxSprite;

var skippedIntro:Bool = false;

	function skipIntro():Void
	{
		if (!skippedIntro)
		{

			FlxG.sound.play(Paths.sound('showMoment'), .4);

			FlxG.camera.flash(FlxColor.RED, 2);
			skippedIntro = true;
		}
	}
function startIntro()
	{
		if (!initialized)
		{


			FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);

			FlxG.sound.music.fadeIn(5, 0, 0.7);
		}

		Conductor.changeBPM(190);
		persistentUpdate = true;

		bg = new FlxSprite(0, 0);
		bg.frames = Paths.getSparrowAtlas('NewTitleMenuBG');
		bg.animation.addByPrefix('idle', "TitleMenuSSBG instance 1", 24);
		bg.animation.play('idle');
		bg.alpha = .75;
		bg.scale.x = 3;
		bg.scale.y = 3;
		bg.antialiasing = true;
		bg.updateHitbox();
		bg.screenCenter();
		add(bg);

		logoBlBUMP = new FlxSprite(0, 0);
		logoBlBUMP.loadGraphic(Paths.image('Logo'));
		logoBlBUMP.antialiasing = true;

		logoBlBUMP.scale.x = .5;
		logoBlBUMP.scale.y = .5;

		logoBlBUMP.screenCenter();

		add(logoBlBUMP);

		gfDance = new FlxSprite(FlxG.width * 0.4, FlxG.height * 0.07);
		gfDance.frames = Paths.getSparrowAtlas('gfDanceTitle');
		gfDance.animation.addByIndices('danceLeft', 'gfDance', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
		gfDance.animation.addByIndices('danceRight', 'gfDance', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
		gfDance.antialiasing = true;
		add(gfDance);
		add(logoBl);

		titleText = new FlxSprite(0, 0);
		titleText.frames = Paths.getSparrowAtlas('titleEnterNEW');
		titleText.animation.addByPrefix('idle', "Press Enter to Begin instance 1", 24);
		titleText.animation.addByPrefix('press', "ENTER PRESSED instance 1", 24, false);
		titleText.antialiasing = true;
		titleText.animation.play('idle');
		titleText.updateHitbox();
		titleText.screenCenter();
		add(titleText);

		var logo:FlxSprite = new FlxSprite().loadGraphic(Paths.image('logo'));
		logo.screenCenter();
		logo.antialiasing = true;

        blackScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
        add(blackScreen);

		FlxG.mouse.visible = false;

		FlxG.sound.play(Paths.sound('TitleLaugh'), 1, false, null, false, function()
		{
			skipIntro();
            remove(blackScreen);
		});
	}


function create(){
    window.title = "Friday Night Funkin' Vs: Sonic.exe - Title Screen";
new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			startIntro();
		});
}
var transitioning:Bool = false;
function update(elapsed:Float)
	{
if (FlxG.keys.justPressed.F)
    {
        FlxG.fullscreen = !FlxG.fullscreen;
    }
    if (FlxG.keys.justPressed.UP)
        if (code == 0)
            code = 1;
        else
            code == 0;

    if (FlxG.keys.justPressed.DOWN)
        if (code == 1)
            code = 2;
        else
            code == 0;

    if (FlxG.keys.justPressed.LEFT)
        if (code == 2)
            code = 3;
        else
            code == 0;

    if (FlxG.keys.justPressed.RIGHT)
        if (code == 3)
            code = 4;
        else
            code == 0;
    if (controls.ACCEPT && !transitioning && skippedIntro)
		{
				titleText.animation.play('press');

			FlxG.camera.flash(FlxColor.RED, 0.2);
			FlxG.sound.play(Paths.sound('menumomentclick'));
			FlxG.sound.play(Paths.sound('menulaugh'));

			FlxTween.tween(bg, {alpha: 0}, 1);

			new FlxTimer().start(1, function(tmr:FlxTimer)
			{
				FlxTween.tween(logoBlBUMP, {alpha: 0}, 1);
                FlxTween.tween(titleText, {alpha: 0}, 1);
            });
            new FlxTimer().start(3, function(tmr:FlxTimer)
                {
                    FlxG.switchState(new MainMenuState());
                });
            transitioning = true;
        }
    } 