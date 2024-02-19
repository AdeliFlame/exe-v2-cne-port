var daP3Static:FlxSprite = new FlxSprite(0, 0);
var balling:FlxSprite = new FlxSprite(0, 0);

function doP3Static()
	{
		trace('p3static XDXDXD');

		daP3Static.frames = Paths.getSparrowAtlas('Phase3Static');
		daP3Static.animation.addByPrefix('P3Static', 'Phase3Static instance 1', 24, false);

		daP3Static.screenCenter();

		daP3Static.scale.x = 4;
		daP3Static.scale.y = 4;
		daP3Static.alpha = 0.5;
        add(daP3Static);   
		daP3Static.cameras = [camHUD];


		daP3Static.animation.play('P3Static');

		daP3Static.animation.finishCallback = function(pog:String)
		{
			trace('ended p3static');
			daP3Static.alpha = 0;

			remove(daP3Static);
		}
	}
function create(){
remove(dad);
remove(gf);
remove(boyfriend);
remove(combo);
defaultCamZoom = .9;

var sSKY:FlxSprite = new FlxSprite(-621.1, -395.65).loadGraphic(Paths.image('stages/Phase3/Glitch'));
sSKY.antialiasing = true;
sSKY.scrollFactor.set(0.9, 1);
sSKY.active = false;
sSKY.scale.x = 1.2;
sSKY.scale.y = 1.2;
add(sSKY);

p3staticbg = new FlxSprite(0, 0);
p3staticbg.frames = Paths.getSparrowAtlas('NewTitleMenuBG');
p3staticbg.animation.addByPrefix('P3Static', 'TitleMenuSSBG instance 1', 24, true);
p3staticbg.animation.play('P3Static');
p3staticbg.screenCenter();
p3staticbg.scale.x = 4.5;
p3staticbg.scale.y = 4.5;
p3staticbg.visible = false;
add(p3staticbg);

var trees:FlxSprite = new FlxSprite(-607.35, -401.55).loadGraphic(Paths.image('stages/Phase3/Trees'));
trees.antialiasing = true;
trees.scrollFactor.set(0.95, 1);
trees.active = false;
trees.scale.x = 1.2;
trees.scale.y = 1.2;
add(trees);

var bg2:FlxSprite = new FlxSprite(-623.5, -410.4).loadGraphic(Paths.image('stages/Phase3/Trees2'));
bg2.updateHitbox();
bg2.antialiasing = true;
bg2.scrollFactor.set(1, 1);
bg2.active = false;
bg2.scale.x = 1.2;
bg2.scale.y = 1.2;
add(bg2);

var bg:FlxSprite = new FlxSprite(-630.4, -266).loadGraphic(Paths.image('stages/Phase3/Grass'));
bg.antialiasing = true;
bg.scrollFactor.set(1.1, 1);
bg.active = false;
bg.scale.x = 1.2;
bg.scale.y = 1.2;
add(bg);

bgspec = new FlxSprite(-428.5 + 50, -449.35 + 25).makeGraphic(2199, 1203, FlxColor.BLACK);
bgspec.antialiasing = true;
bgspec.scrollFactor.set(1, 1);
bgspec.active = false;
bgspec.visible = false;

bgspec.scale.x = 1.2;
bgspec.scale.y = 1.2;
add(bgspec);

add(dad);
add(boyfriend);
dad.scrollFactor.set(1.1, 1);
boyfriend.scrollFactor.set(1.1, 1);
boyfriend.x = 466.1;
boyfriend.y = -15.4;
dad.x = -43.65;
dad.y = 274.05 + 24;
add(combo);
} 
function doP3JumpTAILS()
	{
		trace('SIMPLE JUMPSCARE');
        var doP3JumpTAILS:FlxSprite = new FlxSprite().loadGraphic(Paths.image('jumps/Tails'));
		doP3JumpTAILS.setGraphicSize(FlxG.width, FlxG.height);

		doP3JumpTAILS.screenCenter();

		doP3JumpTAILS.cameras = [camHUD];

		FlxG.camera.shake(0.0025, 0.50);

        add(doP3JumpTAILS);
		FlxG.sound.play(Paths.sound('P3Jumps/TailsScreamLOL'), .1);

		new FlxTimer().start(0.2, function(tmr:FlxTimer)
		{
			trace('ended simple jump');
			remove(doP3JumpTAILS);
		});

		balling.frames = Paths.getSparrowAtlas('daSTAT');
		balling.animation.addByPrefix('static', 'staticFLASH', 24, false);

		balling.setGraphicSize(FlxG.width, FlxG.height);

		balling.screenCenter();

		balling.cameras = [camHUD];


		FlxG.sound.play(Paths.sound('staticBUZZ'));

		if (balling.alpha != 0)
			balling.alpha = FlxG.random.float(0.1, 0.5);

        add(balling);
		balling.animation.play('static');

		balling.animation.finishCallback = function(pog:String)
		{
			trace('ended static');
			remove(balling);
		}
	}
    function doP3JumpKNUCKLES()
        {
            trace('SIMPLE JUMPSCARE');
    
            var doP3JumpKNUCKLES:FlxSprite = new FlxSprite().loadGraphic(Paths.image('jumps/Knuckles'));
    
            doP3JumpKNUCKLES.setGraphicSize(FlxG.width, FlxG.height);
    
            doP3JumpKNUCKLES.screenCenter();
    
            doP3JumpKNUCKLES.cameras = [camHUD];
    
            FlxG.camera.shake(0.0025, 0.50);
    
            add(doP3JumpKNUCKLES);
    
            FlxG.sound.play(Paths.sound('P3Jumps/KnucklesScreamLOL'), .1);
    
            new FlxTimer().start(0.2, function(tmr:FlxTimer)
            {
                trace('ended simple jump');
                remove(doP3JumpKNUCKLES);
            });
    
            balling.frames = Paths.getSparrowAtlas('daSTAT');
    
            balling.setGraphicSize(FlxG.width, FlxG.height);
    
            balling.screenCenter();
    
            balling.cameras = [camHUD];
    
            balling.animation.addByPrefix('static', 'staticFLASH', 24, false);
    
            add(balling);
    
            FlxG.sound.play(Paths.sound('staticBUZZ'));
    
            if (balling.alpha != 0)
                balling.alpha = FlxG.random.float(0.1, 0.5);
    
            balling.animation.play('static');
    
            balling.animation.finishCallback = function(pog:String)
            {
                trace('ended static');
                remove(balling);
            }
        }
        function doP3JumpEGGMAN()
            {
                trace('SIMPLE JUMPSCARE');
        
                var doP3JumpEGGMAN:FlxSprite = new FlxSprite().loadGraphic(Paths.image('jumps/Eggman'));
        
                doP3JumpEGGMAN.setGraphicSize(FlxG.width, FlxG.height);
        
                doP3JumpEGGMAN.screenCenter();
        
                doP3JumpEGGMAN.cameras = [camHUD];
        
                FlxG.camera.shake(0.0025, 0.50);
        
                add(doP3JumpEGGMAN);
        
                FlxG.sound.play(Paths.sound('P3Jumps/EggmanScreamLOL'), .1);
        
                new FlxTimer().start(0.2, function(tmr:FlxTimer)
                {
                    trace('ended simple jump');
                    remove(doP3JumpEGGMAN);
                });
        
                balling.frames = Paths.getSparrowAtlas('daSTAT');
        
                balling.setGraphicSize(FlxG.width, FlxG.height);
        
                balling.screenCenter();
        
                balling.cameras = [camHUD];
        
                balling.animation.addByPrefix('static', 'staticFLASH', 24, false);
        
                add(balling);
        
                FlxG.sound.play(Paths.sound('staticBUZZ'));
        
                if (balling.alpha != 0)
                    balling.alpha = FlxG.random.float(0.1, 0.5);
        
                balling.animation.play('static');
        
                balling.animation.finishCallback = function(pog:String)
                {
                    trace('ended static');
                    remove(balling);
                }
            }
        
function createPost()
{
combo.x = boyfriend.x;
combo.y = boyfriend.y;
}
function stepHit(curStep)
{
  switch (curStep) 
     {
        case 1:
            doP3Static(); // cool static
            FlxTween.tween(FlxG.camera, {zoom: 1.1}, 2, {ease: FlxEase.cubeOut});
            defaultCamZoom = 1.1;
        case 144:
            doP3JumpTAILS();
        case 1024, 1088, 1216, 1280, 2305, 2810, 3199, 4096:
            doP3Static();
        case 1040: // switch to sonic facing right

            FlxTween.tween(FlxG.camera, {zoom: 0.9}, 2, {ease: FlxEase.cubeOut});
            defaultCamZoom = 0.9;
            healthBar.createFilledBar(FlxColor.fromRGB(182, 0, 205), FlxColor.fromRGB(49, 176, 209));
            p3staticbg.visible = true;    
            dad.y = -10;
            dad.x = -250;
         case 1296: // switch to knuckles facing left facing right and bf facing right, and cool static

					FlxTween.tween(FlxG.camera, {zoom: 1.1}, 2, {ease: FlxEase.cubeOut});
					defaultCamZoom = 1.1;

					p3staticbg.visible = false;
                    boyfriend.x = 466.1;
                    boyfriend.x = 685.6 - 300;
                    dad.x = 1300 + 100 - 206;
                    dad.y = 260 + 44;
					healthBar.createFilledBar(FlxColor.fromRGB(150, 0, 0), FlxColor.fromRGB(49, 176, 209));


					cpuStrums.forEach(function(spr:FlxSprite)
					{
						
							FlxTween.tween(spr, {x: spr.x += 700, y: spr.y}, 5, {ease: FlxEase.quartOut});
						// spr.x += 700;
					});
					playerStrums.forEach(function(spr:FlxSprite)
					{
						
							FlxTween.tween(spr, {x: spr.x -= 600, y: spr.y}, 5, {ease: FlxEase.quartOut});
						// spr.x -= 600;
					});
                    doP3JumpKNUCKLES();
                case 2320:
					FlxTween.tween(FlxG.camera, {zoom: 0.9}, 2, {ease: FlxEase.cubeOut});
					defaultCamZoom = 0.9;

					p3staticbg.visible = true;
                   dad.x = 1300 - 250;
                   dad.y =-94.75 + 100;
                   case 2823:
					doP3JumpEGGMAN();

					FlxTween.tween(FlxG.camera, {zoom: 1}, 2, {ease: FlxEase.cubeOut});
					defaultCamZoom = 1;

				
                    healthBar.createFilledBar(FlxColor.fromRGB(194, 80, 0), FlxColor.fromRGB(49, 176, 209));
					p3staticbg.visible = false;
                    dad.flipX = false;
                    dad.x = 20 - 200;
                    dad.y = 30 + 200;
                    boyfriend.x = 466.1 + 200;
                    boyfriend.y = 685.6 - 550;
                    cpuStrums.forEach(function(spr:FlxSprite)
                        {
                            
                                FlxTween.tween(spr, {x: spr.x - 700, y: spr.y}, .1, {ease: FlxEase.quartOut});
                           
                        });
                        playerStrums.forEach(function(spr:FlxSprite)
                        {
                            if (!FlxG.save.data.midscroll)
                                FlxTween.tween(spr, {x: spr.x += 600, y: spr.y}, .1, {ease: FlxEase.quartOut});
                            // spr.x += 600;
                        });
                case 2887, 3015, 4039:
					dad.playAnim('laugh', true);
                case 4111:
                    healthBar.createFilledBar(FlxColor.fromRGB(182, 0, 205), FlxColor.fromRGB(49, 176, 209));
                    p3staticbg.visible = true;    
                    dad.y = -10;
                    dad.x = -250;
                    boyfriend.x = 466.1;
                    boyfriend.y = -15.4;
             

     }   
}     