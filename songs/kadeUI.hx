// Kade UI + some behavioral changes from Kade (not finished at all, but I'll get back to this from time to time/when it's pirority)

/*
    TODOS:
        - Kade sustain
        - Char immidately go to their idle animation after pressing/holding notes.
    :

    DONEs:
        - Char animation behavior after pressing/holding notes.
        - Disable note glow
        - icon bop? Not sure honestly
*/

public var kadeUI:Bool = FlxG.save.data.kadeUI;

import openfl.geom.Rectangle;
import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;
import flixel.ui.FlxBar;
import flixel.FlxG;

var timeBarBG:FlxSprite;
var timeBar:FlxBar;
var timeTxt:FlxText;
var hudTxt:FlxText;
var hudTxtTween:FlxTween;
var ratingFC:String = "FC";
var ratingStuff:Array<Dynamic> = [
    ['You Suck!', 0.2], //From 0% to 19%
    ['Shit', 0.4], //From 20% to 39%
    ['Bad', 0.5], //From 40% to 49%
    ['Bruh', 0.6], //From 50% to 59%
    ['Meh', 0.69], //From 60% to 68%
    ['Nice', 0.7], //69%
    ['Good', 0.8], //From 70% to 79%
    ['Great', 0.9], //From 80% to 89%
    ['Sick!', 1], //From 90% to 99%
    ['Perfect!!', 1] //The value on this one isn't used actually, since Perfect is always "1"
];

function getRating(accuracy:Float):String {
    if (accuracy < 0) {
        return "?";
    }
    for (rating in ratingStuff) {
        if (accuracy < rating[1]) {
            return rating[0];
        }
    }
    return ratingStuff[ratingStuff.length - 1][0];
}

function getRatingFC(accuracy:Float, misses:Int):String {
    // this sucks but idk how to make it better lol
    if (misses == 0) {
        if (accuracy == 1.0) ratingFC = "SFC";
        else if (accuracy >= 0.99) ratingFC = "GFC";
        else ratingFC = "FC";
    }
    if (misses > 0) {
        if (misses < 10) ratingFC = "SDCB";
        else if (misses >= 10) ratingFC = "Clear";
    }
}
function create() {
    if (kadeUI) {
    timeTxt = new FlxText(0, 19, 400, "X:XX", 32);
    timeTxt.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    timeTxt.scrollFactor.set();
    timeTxt.alpha = 0;
    timeTxt.borderColor = 0xFF000000;
    timeTxt.borderSize = 2;
    timeTxt.screenCenter(FlxAxes.X);

    hudTxt = new FlxText(0, 685, FlxG.width, "Score: 0 | Misses: 0 | Rating: ?");
    hudTxt.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    hudTxt.borderSize = 1.25;
    hudTxt.screenCenter(FlxAxes.X);

    timeBarBG = new FlxSprite();
    timeBarBG.x = timeTxt.x;
    timeBarBG.y = timeTxt.y + (timeTxt.height / 4);
    timeBarBG.alpha = 0;
    timeBarBG.scrollFactor.set();
    timeBarBG.color = FlxColor.BLACK;
    timeBarBG.loadGraphic(Paths.image("psychTimeBar"));

    timeBar = new FlxBar(timeBarBG.x + 4, timeBarBG.y + 4, FlxBar.FILL_LEFT_TO_RIGHT, Std.int(timeBarBG.width - 8), Std.int(timeBarBG.height - 8), Conductor, 'songPosition', 0, 1);
    timeBar.scrollFactor.set();
    timeBar.createFilledBar(0xFF000000,0xFFFFFFFF);
    timeBar.numDivisions = 400; //Toned it down to 400 to see what it would look like.
    timeBar.alpha = 0;
    timeBar.value = Conductor.songPosition / Conductor.songDuration;
    add(timeBarBG);
    add(timeBar);
    add(timeTxt);

    timeBarBG.x = timeBar.x - 4;
    timeBarBG.y = timeBar.y - 4;

    hudTxt.cameras = [camHUD];
    timeBar.cameras = [camHUD];
    timeBarBG.cameras = [camHUD];
    timeTxt.cameras = [camHUD];
 }
}
function onPlayerHit(note:Note) {
    if (kadeUI) {
    if(!note.isSustainNote){
        if(hudTxtTween != null) {
            hudTxtTween.cancel();
        }
        hudTxt.scale.x = 1.075;
        hudTxt.scale.y = 1.075;
        hudTxtTween = FlxTween.tween(hudTxt.scale, {x: 1, y: 1}, 0.2, {
            onComplete: function(twn:FlxTween) {
                hudTxtTween = null;
            }
        });
    
    }
 }
}
function onSongStart() {
    if (kadeUI) {
    if (timeBar != null) {
        FlxTween.tween(timeBar, {alpha: 1}, 0.5, {ease: FlxEase.circOut});
    }
    if (timeBarBG != null) {
        FlxTween.tween(timeBarBG, {alpha: 1}, 0.5, {ease: FlxEase.circOut});
    }
    if (timeTxt != null) {
    FlxTween.tween(timeTxt, {alpha: 1}, 0.5, {ease: FlxEase.circOut});
    }
 }
}

function update(elapsed:Float) {
    if (kadeUI) {
    if (inst != null && timeBar != null && timeBar.max != inst.length) {
        timeBar.setRange(0, Math.max(1, inst.length));
    }

    if (inst != null && timeTxt != null) {
        var timeRemaining = Std.int((inst.length - Conductor.songPosition) / 1000);
        var seconds = CoolUtil.addZeros(Std.string(timeRemaining % 60), 2);
        var minutes = Std.int(timeRemaining / 60);
        timeTxt.text = minutes + ":" + seconds;
    }
    var acc = FlxMath.roundDecimal(Math.max(accuracy, 0) * 100, 2);
    var rating:String = getRating(accuracy);
    getRatingFC(accuracy, misses);
    if (songScore > 0 || acc > 0 || misses > 0) {
        hudTxt.text = "Score: " + songScore + " | Misses: " + misses +  " | Rating: " + rating + " (" + acc + "%)" + " - " + ratingFC;
    } 
 }
}

function postCreate() {
    if (kadeUI) {
        for (i in strumLines.members)
            for (s in i.members)
                s.x -= 40;
        for (i in [missesTxt, accuracyTxt, scoreTxt]) {
            i.visible = false;
        }
        if (downscroll) {
            hudTxt.y = 605;
        } 
        add(hudTxt);
    }
}

function postUpdate(elapsed) {
    if (!kadeUI) disableScript();

    if (kadeUI) {
        // I don't remember this exactly but it's old-old icon bop that I happened to make when porting another mod
        iconP1.scale.set(lerp(iconP1.scale.x, 1, 0.33), lerp(iconP1.scale.y, 1, 0.33));
        iconP2.scale.set(lerp(iconP2.scale.x, 1, 0.33), lerp(iconP2.scale.y, 1, 0.33));
    }
}

function onDadHit(e) {
    if (kadeUI) e.preventStrumGlow();
}

function onPostNoteCreation(e) {
    if (kadeUI) {
        if (e.note.isSustainNote && e.note.animation.name == "holdend")
            e.note.scale.y -= 0.4; // Closest I could get with kade sustains
    }
}

function onPostStrumCreation(e) {
    if (kadeUI) {
        // More of a personal thing but bascially bigger frames for pressing notes to mimick botplay's sudden note presses
        // Will be changed later probably
        if (FlxG.save.data.fastPress) e.strum.animation.addByIndices("confirm", e.animPrefix + " confirm", [0, 1, 2, 3], "", 60, false);
        e.strum.animation.addByIndices("pressed", e.animPrefix + " press", [0, 1, 2, 3], "", 12, false); // 12 frames when pressing (pretty minor detail :shrug:)

        // Characters will immidately go to their idle animation after pressing/holding notes.
        boyfriend.holdTime = FlxG.random.int(1, 2);
        dad.holdTime = FlxG.random.int(2, 4);
    }
}