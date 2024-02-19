public var camHUD2 = new FlxCamera();

function create()
{    
camHUD2 = new FlxCamera();
camHUD2.bgColor = 0;
camHUD2.alpha = 1;
FlxG.cameras.remove(camHUD, false);
FlxG.cameras.add(camHUD, false);
FlxG.cameras.add(camHUD2, false);
}