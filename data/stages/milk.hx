function create(){
	remove(dad);
	remove(gf);
	remove(combo);
	remove(boyfriend);
	defaultCamZoom = .9;

	var bg:FlxSprite = new FlxSprite(-306, -334.65).loadGraphic(Paths.image('stages/milk/SunkBG'));
	bg.setGraphicSize(Std.int(bg.width * 0.8));
	bg.antialiasing = true;
	bg.scrollFactor.set(.91, .91);
	bg.x -= 670;
	bg.y -= 260;
	bg.active = false;
	add(bg);

	add(gf);
	add(dad);
	add(boyfriend);

	dad.x = -180;
	dad.y = 200;
	boyfriend.x -= 100;
}