import funkin.backend.assets.ModsFolder;
import lime.graphics.Image;
import sys.io.File;

static var redirectStates:Map<FlxState, String> = [
    MainMenuState => "menus/exeMainMenu",
    StoryMenuState => "menus/exeStoryMenu"
];

function preStateSwitch() {
   
    for (redirectState in redirectStates.keys())
        if (FlxG.game._requestedState is redirectState)
            FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
}