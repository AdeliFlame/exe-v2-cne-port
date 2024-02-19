var daJumpscare:FlxSprite = new FlxSprite(0, 0);
function create()
{

defaultCamZoom = 1.0;
remove(dad);
remove(gf);
remove(combo);
remove(boyfriend);
var sSKY:FlxSprite = new FlxSprite(-222, -16 + 150).loadGraphic(Paths.image('stages/PolishedP1/SKY'));
sSKY.antialiasing = true;
sSKY.scrollFactor.set(1, 1);
sSKY.active = false;
add(sSKY);

var hills:FlxSprite = new FlxSprite(-264, -156 + 150).loadGraphic(Paths.image('stages/PolishedP1/HILLS'));
hills.antialiasing = true;
hills.scrollFactor.set(1.1, 1);
hills.active = false;

add(hills);

var bg2:FlxSprite = new FlxSprite(-345, -289 + 170).loadGraphic(Paths.image('stages/PolishedP1/FLOOR2'));
bg2.updateHitbox();
bg2.antialiasing = true;
bg2.scrollFactor.set(1.2, 1);
bg2.active = false;

add(bg2);

var bg:FlxSprite = new FlxSprite(-297, -246 + 150).loadGraphic(Paths.image('stages/PolishedP1/FLOOR1'));
bg.antialiasing = true;
bg.scrollFactor.set(1.3, 1);
bg.active = false;
add(bg);

var eggman:FlxSprite = new FlxSprite(-218, -219 + 150).loadGraphic(Paths.image('stages/PolishedP1/EGGMAN'));
eggman.updateHitbox();
eggman.antialiasing = true;
eggman.scrollFactor.set(1.32, 1);
eggman.active = false;

add(eggman);

var tail:FlxSprite = new FlxSprite(-199 - 150, -259 + 150).loadGraphic(Paths.image('stages/PolishedP1/TAIL'));
tail.updateHitbox();
tail.antialiasing = true;
tail.scrollFactor.set(1.34, 1);
tail.active = false;

add(tail);

var knuckle:FlxSprite = new FlxSprite(185 + 100, -350 + 150).loadGraphic(Paths.image('stages/PolishedP1/KNUCKLE'));
knuckle.updateHitbox();
knuckle.antialiasing = true;
knuckle.scrollFactor.set(1.36, 1);
knuckle.active = false;

add(knuckle);

var sticklol:FlxSprite = new FlxSprite(-100, 50);
sticklol.frames = Paths.getSparrowAtlas('stages/PolishedP1/TailsSpikeAnimated');
sticklol.animation.addByPrefix('a', 'Tails Spike Animated instance 1', 4, true);
sticklol.setGraphicSize(Std.int(sticklol.width * 1.2));
sticklol.updateHitbox();
sticklol.antialiasing = true;
sticklol.scrollFactor.set(1.37, 1);
sticklol.animation.play('a', true);
add(sticklol);

add(gf);
add(dad);
add(boyfriend);
gf.scrollFactor.set(1.37, 1);
boyfriend.y += 25;
dad.y = 150;
dad.x += 100;
dad.scale.x = 1.1;
dad.scale.y = 1.1;
dad.scrollFactor.set(1.37, 1);
boyfriend.scrollFactor.set(1.37, 1);

daJumpscare.frames = Paths.getSparrowAtlas('jumps/sonicJUMPSCARE');
daJumpscare.animation.addByPrefix('jump', 'sonicSPOOK', 24, false);
daJumpscare.alpha = 0.0000000000001;
daJumpscare.screenCenter();
daJumpscare.scale.x = 1.1;
daJumpscare.scale.y = 1.1;
daJumpscare.cameras = [camHUD];
daJumpscare.y += 370;
add(daJumpscare);
}
function doSimpleJump()
	{
		trace('SIMPLE JUMPSCARE');

		var simplejump:FlxSprite = new FlxSprite().loadGraphic(Paths.image('jumps/simplejump'));

		simplejump.setGraphicSize(FlxG.width, FlxG.height);

		simplejump.screenCenter();

		simplejump.cameras = [camHUD];

		FlxG.camera.shake(0.0025, 0.50);

		add(simplejump);

		FlxG.sound.play(Paths.sound('sppok'));

		new FlxTimer().start(0.2, function(tmr:FlxTimer)
		{
			trace('ended simple jump');
			remove(simplejump);
		});

		// now for static

		var daStatic:FlxSprite = new FlxSprite(0, 0);

		daStatic.frames = Paths.getSparrowAtlas('daSTAT');

		daStatic.setGraphicSize(FlxG.width, FlxG.height);

		daStatic.screenCenter();

		daStatic.cameras = [camHUD];

		daStatic.animation.addByPrefix('static', 'staticFLASH', 24, false);

		add(daStatic);

		FlxG.sound.play(Paths.sound('staticBUZZ'));

		if (daStatic.alpha != 0)
			daStatic.alpha = FlxG.random.float(0.1, 0.5);

		daStatic.animation.play('static');

		daStatic.animation.finishCallback = function(pog:String)
		{
			trace('ended static');
			remove(daStatic);
		}
	}
function doStaticSign(lestatic:Int = 0, leopa:Bool = true)
	{
		trace('static MOMENT HAHAHAH ' + lestatic);
		var daStatic:FlxSprite = new FlxSprite(0, 0);

		daStatic.frames = Paths.getSparrowAtlas('daSTAT');

		daStatic.setGraphicSize(FlxG.width, FlxG.height);

		daStatic.screenCenter();

		daStatic.cameras = [camHUD];

		switch (lestatic)
		{
			case 0:
				daStatic.animation.addByPrefix('static', 'staticFLASH', 24, false);
		}
		add(daStatic);

		FlxG.sound.play(Paths.sound('staticBUZZ'));

		if (leopa)
		{
			if (daStatic.alpha != 0)
				daStatic.alpha = FlxG.random.float(0.1, 0.5);
		}
		else
			daStatic.alpha = 1;

		daStatic.animation.play('static');

		daStatic.animation.finishCallback = function(pog:String)
		{
			trace('ended static');
			remove(daStatic);
		}
	}

function doJumpscare()
{
trace('JUMPSCARE aaaa');

FlxG.sound.play(Paths.sound('jumpscare'), 1);
FlxG.sound.play(Paths.sound('datOneSound'), 1);

daJumpscare.alpha = 1;
daJumpscare.animation.play('jump');
daJumpscare.animation.finishCallback = function(pog:String)
{

	trace('ended jump');
	daJumpscare.alpha = 0.000000000000001;
}
}
function createPost()
{}
function Postcreate()
{}
function stepHit(curStep)
	{
    switch (curStep)
			{
				case 27:
					doStaticSign(0);
				case 130:
					doStaticSign(0);
				case 265:
					doStaticSign(0);
				case 450:
					doStaticSign(0);
				case 645:
					doStaticSign(0);
				case 800:
					doStaticSign(0);
				case 855:
					doStaticSign(0);
				case 889:
					doStaticSign(0);
				case 921:
					doSimpleJump();
				case 938:
					doStaticSign(0);
				case 981:
					doStaticSign(0);
				case 1030:
					doStaticSign(0);
				case 1065:
					doStaticSign(0);
				case 1105:
					doStaticSign(0);
				case 1123:
					doStaticSign(0);
				case 1178:
					doSimpleJump();
				case 1245:
					doStaticSign(0);
				case 1305:	
					var objs = [
						// me lo robe de lunar
						healthBar,
						healthBarBG,
						iconP1,
						iconP2,
						scoreTxt,
						missesTxt,
						accuracyTxt
						
										 
					];
					cpuStrums.forEach(function(spr)
					{
						objs.push(spr);
					});
					playerStrums.forEach(function(spr)
					{
						objs.push(spr);
					});
					for (obj in objs)
					{
						FlxTween.tween(obj, {alpha: 0}, 1, {
							onComplete: function(twn)
							{
								obj.visible = false;
							}
						});
					}
					for (i in cpuStrums.members) 
						FlxTween.tween(i, {x: i.x - 9650}, .01, {ease: FlxEase.smootherStepInOut});
				case 1337:
					doSimpleJump();
				case 1345:
					doStaticSign(0);
				case 1432:
					doStaticSign(0);
					var objs = [
						// me lo robe de lunar
						healthBar,
						healthBarBG,
						iconP1,
						iconP2,
						scoreTxt,
						missesTxt,
						accuracyTxt
						
										 
					];
					cpuStrums.forEach(function(spr)
					{
						objs.push(spr);
					});
					playerStrums.forEach(function(spr)
					{
						objs.push(spr);
					});
					for (obj in objs)
					{
						FlxTween.tween(obj, {alpha: 1}, .1, {
							onComplete: function(twn)
							{
								for (i in cpuStrums.members) 
									FlxTween.tween(i, {x: i.x + 9650}, .01, {ease: FlxEase.smootherStepInOut});
								obj.visible = true;
							}
						});
					}
				case 1454:
					doStaticSign(0);
				case 1495:
					doStaticSign(0);
				case 1521:
					doStaticSign(0);
				case 1558:
					doStaticSign(0);
				case 1578:
					doStaticSign(0);
				case 1599:
					doStaticSign(0);
				case 1618:
					doStaticSign(0);
				case 1647:
					doStaticSign(0);
				case 1657:
					doStaticSign(0);
				case 1692:
					doStaticSign(0);
				case 1713:
					doStaticSign(0);
				case 1723:
					doJumpscare();
				case 1738:
					doStaticSign(0);
				case 1747:
					doStaticSign(0);
				case 1761:
					doStaticSign(0);
				case 1785:
					doStaticSign(0);
				case 1806:
					doStaticSign(0);
				case 1816:
					doStaticSign(0);
				case 1832:
					doStaticSign(0);
				case 1849:
					doStaticSign(0);
				case 1868:
					doStaticSign(0);
				case 1887:
					doStaticSign(0);
				case 1909:
					doStaticSign(0);
			}
    }