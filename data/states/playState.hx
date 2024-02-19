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

function postUpdate() {
    switch(strumLines.members[curCameraTarget].characters[0].getAnimName()) {
        case "singLEFT": camFollow.x -= 15;
        case "singDOWN": camFollow.y += 15;
        case "singUP": camFollow.y -= 15;
        case "singRIGHT": camFollow.x += 15;
    }
}