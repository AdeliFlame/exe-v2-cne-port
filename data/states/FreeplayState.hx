//hiiiiiii!!!! it's me, bromaster819!!!! ur favorite guy!! anywho hope you enjoy snooping around my script!! stay safe! :3
import funkin.menus.FreeplayState;
import funkin.backend.chart.Chart;
import haxe.io.Path;
import openfl.text.TextField;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import funkin.game.HealthIcon;
import funkin.savedata.FunkinSave;
import haxe.Json;
import funkin.backend.system.Controls;
import flixel.FlxCamera;

var songL:FlxTypedGroup<FlxText> = [];
var bg:FlxSprite = null;
function postCreate() {
	canSelect = false;

	uiCamera = new FlxCamera(0, 0, 1280, 720);
	uiCamera.bgColor = FlxColor.TRANSPARENT;
	FlxG.cameras.add(uiCamera, false);
	bg = new FlxSprite(0,0,Paths.image('menus/backgroundlool'));
	bg.scrollFactor.set(0, 0);
	bg.scale.set(1280/4240, 720/2385);
	bg.screenCenter();
	bg.camera = uiCamera;
	add(bg);
	for (i in 0...songs.length)
		{
			var text = new FlxText();
			text.text = songs[i].displayName;
			text.color = FlxColor.CYAN;
			text.size = 32;
			text.screenCenter();
			text.x = (1280 * i) + 70;
			text.y = 50;
			text.cameras = [uiCamera];
			songL.push(text);
			var img = new FlxSprite(0,0,Paths.image('menus/freeplay/' + songs[i].displayName));
			img.camera = uiCamera;
			img.x = 1280 * i - 500;
			img.y = -720/2.5;
			add(img);
			var border = new FlxSprite(0,0,Paths.image('menus/freeplay/FreeBox'));
			border.camera = uiCamera;
			border.x = img.x;
			border.y = img.y;
			add(border);
			var rtext = new FlxText();
			rtext.text = songs[i].displayName;
			rtext.color = FlxColor.WHITE;
			rtext.size = 32;
			rtext.screenCenter();
			rtext.x = (1280 * i) + 70;
			rtext.y = 350;
			rtext.cameras = [uiCamera];
			add(rtext);
		}
	for (item in grpSongs.members)
		{
			item.alpha = 0;
		}

	for (i in 0...iconArray.length)
		{
			iconArray[i].alpha = 0;
		}
	curSelected = 0;
	var dataerase = new FlxText(FlxG.width - 300, FlxG.height - 18 * 2, 300, "Hold DEL to erase ALL data (this doesn't include ALL options)", 3);
        //dataerase.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.BLACK, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        dataerase.scrollFactor.set();
	dataerase.screenCenter();
        add(dataerase); 
}


function update() {
	if (controls.LEFT_P) {
		changeSelection(-1);
	}
	
	if (controls.RIGHT_P) {
		changeSelection(1);
	}

	for (i in 0...songL.length) {
		songL[i].alpha = 0.6;
		songL[curSelected].alpha = 1;
	}
	uiCamera.follow(songL[curSelected], 0.5);
}