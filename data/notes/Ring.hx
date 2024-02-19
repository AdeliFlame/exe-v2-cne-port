var poisoned:Bool = false;

// Credit to MAZ for basically everything here.

function onPlayerHit(e) {
    if (e.noteType == "Ring") {
			e.showSplash = false;
	
    }
}

function onPlayerMiss(e) {
	if (e.noteType == "Ring") {
		e.cancel();
		deleteNote(e.note);
	}
}

function onDadHit(e) {
	if (!e.player && e.noteType == "Ring") {
		e.cancel();
    }
}


function stopP() {poisoned = false;}

function onNoteCreation(e) {
		switch (e.noteType) {
			case "Ring":
			if (PlayState.opponentMode && e.strumLineID >= 1) e.note.wasGoodHit = true;

			if (!PlayState.opponentMode && e.strumLineID <= 0) e.note.wasGoodHit = true;
			e.noteSprite = "game/notes/Ring";
			e.noteScale = 0.73;
			e.mustHit = false;
			e.note.updateHitbox();
			e.note.earlyPressWindow = 0.1;
			e.note.latePressWindow = 0.2;
	}
}