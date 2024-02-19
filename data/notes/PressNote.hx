var Static = new FlxSprite(0, 0);
function onPlayerHit(e) {
	switch (e.noteType) {
		case "PressNote":

	}
}

function create() {
//FlxG.sound.play(Paths.sound('hitStatic1'), 4);
Static.frames = Paths.getSparrowAtlas('hitStatic');
Static.animation.addByPrefix('idle', 'staticANIMATION');
Static.setGraphicSize(FlxG.width * 2, FlxG.height * 2);
Static.screenCenter();
Static.cameras = [camHUD];
Static.alpha = 0.00000000001;
add(Static);
}
function onNoteCreation(e) {
		switch (e.noteType) {
			case "PressNote":
			e.noteSprite = "game/notes/STATICNOTE_assets";
			e.noteScale = 0.73;
			e.mustHit = true;
			e.note.updateHitbox();
	}
}
function onPlayerMiss(e) {
	if (e.noteType == "PressNote") {
            FlxG.sound.play(Paths.sound('hitStatic1'), 4);
            health -= .3;
			Static.alpha = 1;
			Static.animation.play('idle');
			new FlxTimer().start(.3, function(sex:FlxTimer)
			{
				Static.alpha = 0;
			});	

	}
}