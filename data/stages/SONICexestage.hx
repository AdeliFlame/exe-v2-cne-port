var amongus:Bool = true;

function create(){
remove(dad);
remove(gf);
remove(combo);
remove(boyfriend);
defaultCamZoom = .9;
var sSKY:FlxSprite = new FlxSprite(-414, -440.8).loadGraphic(Paths.image('stages/SonicP2/sky'));
sSKY.antialiasing = true;
sSKY.scrollFactor.set(1, 1);
sSKY.active = false;
sSKY.scale.x = 1.4;
sSKY.scale.y = 1.4;
add(sSKY);

var trees:FlxSprite = new FlxSprite(-290.55, -298.3).loadGraphic(Paths.image('stages/SonicP2/backtrees'));
trees.antialiasing = true;
trees.scrollFactor.set(1.1, 1);
trees.active = false;
trees.scale.x = 1.2;
trees.scale.y = 1.2;
add(trees);

var bg2:FlxSprite = new FlxSprite(-306, -334.65).loadGraphic(Paths.image('stages/SonicP2/trees'));
bg2.updateHitbox();
bg2.antialiasing = true;
bg2.scrollFactor.set(1.2, 1);
bg2.active = false;
bg2.scale.x = 1.2;
bg2.scale.y = 1.2;
add(bg2);

var bg:FlxSprite = new FlxSprite(-309.95, -240.2).loadGraphic(Paths.image('stages/SonicP2/ground'));
bg.antialiasing = true;
bg.scrollFactor.set(1.3, 1);
bg.active = false;
bg.scale.x = 1.2;
bg.scale.y = 1.2;
add(bg);

bgspec = new FlxSprite(-428.5 + 50 + 700, -449.35 + 25 + 392 + 105 + 50).loadGraphic(Paths.image("stages/SonicP2/GreenHill"));
bgspec.antialiasing = false;
bgspec.scrollFactor.set(1, 1);
bgspec.active = false;
bgspec.visible = false;
bgspec.scale.x = 8;
bgspec.scale.y = 8;
add(bgspec);
add(gf);
add(dad);
add(boyfriend);
gf.scrollFactor.set(1.37, 1);
dad.y -= 125;

boyfriend.x = 1036 - 100;
boyfriend.y = -100;

dad.scrollFactor.set(1.37, 1);
boyfriend.scrollFactor.set(1.37, 1);

gf.x = 635.5 - 50 - 100;
gf.y = 265.1 - 250;
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

function stepHit(curStep)
{
var vg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('stages/SonicP2/RedVG'));
vg.alpha = 0;
vg.cameras = [camHUD];
add(vg);

var amongus:Bool = true;

switch (curStep) // haha laugh funny
{
case 128, 328, 1288:
    dad.playAnim('laugh', true);

case 130, 132, 134, 136, 138, 140, 330, 332, 334, 1290, 1292, 1294:
    dad.playAnim('laugh', true);
case 142, 336, 1296:
}

if (curStep == 528) // PIXEL MOMENT LAWLALWALAWL
{
doStaticSign(0, false);
boyfriend.x = 770;
boyfriend.y = 450;
boyfriend.setPosition(530 + 100, 170 + 200);
bgspec.visible = true;
dad.y = 170 + 300 - 50;
dad.x = 100;
gf.x = 400;
gf.y = -130;
}
else if (curStep == 784) // BACK TO NORMAL MF!!!
{

doStaticSign(0, false);
bgspec.visible = false;
gf.scrollFactor.set(1.37, 1);
dad.y = 0;

boyfriend.x = 1036 - 100;
boyfriend.y = -100;

dad.scrollFactor.set(1.37, 1);
boyfriend.scrollFactor.set(1.37, 1);

gf.x = 635.5 - 50 - 100;
gf.y = 265.1 - 250;
dad.x = 0;

}
else if (curStep == 521 && curStep == 1160)
{
camGame.shake(0.03, 1.5);
camHUD.shake(0.05, 1);
}
else if (curStep == 80 || curStep == 785) // MaliciousBunny did this
{
new FlxTimer().start(.085, function(sex:FlxTimer)
{
    if (curStep >= 528 && curStep <= 784)
        vg.visible = false;
    else
        vg.visible = true;

    if (!paused)
        vg.alpha += 0.1;
    if (vg.alpha < 1)
    {
        sex.reset();
    }
    if (vg.alpha == 1)
    {
        new FlxTimer().start(.085, function(sex2:FlxTimer)
        {
            if (!paused)
                vg.alpha -= 0.1;
            if (vg.alpha > 0)
            {
                sex2.reset();
            }
            if (vg.alpha == 0)
                sex.reset();
        });
    }
   });
  }
}