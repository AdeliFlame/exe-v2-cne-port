import funkin.backend.assets.ModsFolder;
import lime.graphics.Image;
import sys.io.File;

static var redirectStates:Map<FlxState, String> = [
    MainMenuState => "menus/exeMainMenu",
    StoryMenuState => "menus/exeStoryMenu"
    TitleState => "menus/exeTitle"
];

function preStateSwitch() {
    window.title = "Friday Night Funkin' Vs: Sonic.exe";
    window.setIcon(Image.fromBytes(File.getBytes('mods/' + ModsFolder.currentModFolder + '/images/icon.png')));

    for (redirectState in redirectStates.keys())
        if (FlxG.game._requestedState is redirectState)
            FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
}
function new() {
    if (FlxG.save.data.kadeUI == null) FlxG.save.data.kadeUI = false;
    if (FlxG.save.data.fastPress == null) FlxG.save.data.fastPress = false;
    if (FlxG.save.data.oldLogo == null) FlxG.save.data.oldLogo = false;
}