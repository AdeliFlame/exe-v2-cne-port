function create(){
	remove(dad);
	remove(gf);
	remove(combo);
	remove(boyfriend);
	defaultCamZoom = 0.95;

	var SKY:FlxSprite = new FlxSprite(-1900, -1006).loadGraphic(Paths.image('stages/LordXStage/sky'));
	SKY.setGraphicSize(Std.int(SKY.width * .5));
	add(SKY);

	var hills:FlxSprite = new FlxSprite(-1440, -806 + 200).loadGraphic(Paths.image('stages/LordXStage/hills1'));
	hills.setGraphicSize(Std.int(hills.width * .5));
	add(hills);

	var floor:FlxSprite = new FlxSprite(-1400, -496).loadGraphic(Paths.image('stages/LordXStage/floor'));
	floor.setGraphicSize(Std.int(floor.width * .55));
	add(floor);

	eyeflower = new FlxSprite(100 - 500, 100);
	eyeflower.frames = Paths.getSparrowAtlas('stages/LordXStage/WeirdAssFlower_Assets');
	eyeflower.animation.addByPrefix('flowerAnim', 'flower', 24, true);
	eyeflower.animation.play('flowerAnim');
	eyeflower.setGraphicSize(Std.int(eyeflower.width * 0.8));
	add(eyeflower);

	notknuckles = new FlxSprite(100 - 300, -400 + 25);
	notknuckles.frames = Paths.getSparrowAtlas('stages/LordXStage/NotKnuckles_Assets');
	notknuckles.animation.addByPrefix('NotknucklesAnim', 'Notknuckles', 24, true);
	notknuckles.animation.play('NotknucklesAnim');
	notknuckles.setGraphicSize(Std.int(notknuckles.width * .5));
	add(notknuckles);

	var smallflower:FlxSprite = new FlxSprite(-1500, -506).loadGraphic(Paths.image('stages/LordXStage/smallflower'));
	smallflower.setGraphicSize(Std.int(smallflower.width * .6));
	add(smallflower);

	var bfsmallflower:FlxSprite = new FlxSprite(-1500 + -300, -306 - 50).loadGraphic(Paths.image('stages/LordXStage/smallflower'));
	bfsmallflower.setGraphicSize(Std.int(smallflower.width * .6));
	add(bfsmallflower);

	var smallflower2:FlxSprite = new FlxSprite(-1500, -506 - 50).loadGraphic(Paths.image('stages/LordXStage/smallflowe2'));
	smallflower2.setGraphicSize(Std.int(smallflower.width * .6));
	add(smallflower2);

	var tree:FlxSprite = new FlxSprite(-1900 + 550 - 100, -1006 + 350).loadGraphic(Paths.image('stages/LordXStage/tree'));
	tree.setGraphicSize(Std.int(tree.width * .7));
	add(tree);

	add(dad);
	add(boyfriend);

	dad.x = -50;
	dad.y = 250;
	boyfriend.y = 250;
	boyfriend.x = 750;
}