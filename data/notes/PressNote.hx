function onPlayerHit(e) if (e.noteType == "Pressnote")

function create() {
//FlxG.sound.play(Paths.sound('hitStatic1'), 4);
var Static = new FlxSprite(0, 0);
Static.frames = Paths.getSparrowAtlas('hitStatic');
Static.animation.addByPrefix('idle', 'staticANIMATION');
Static.screenCenter();
Static.alpha = 1;
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
       
	}
}