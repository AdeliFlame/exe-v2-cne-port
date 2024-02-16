function postUpdate() {
    switch(strumLines.members[curCameraTarget].characters[0].getAnimName()) {
        case "singLEFT": camFollow.x -= 15;
        case "singDOWN": camFollow.y += 15;
        case "singUP": camFollow.y -= 15;
        case "singRIGHT": camFollow.x += 15;
    }
}