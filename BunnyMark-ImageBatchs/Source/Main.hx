package;

import zygame.core.Start;
import zygame.utils.load.TextureLoader.TextureAtlas;
import zygame.display.batch.ImageBatchs;
import lime.ui.Gamepad;
import lime.ui.GamepadButton;
import openfl.display.Tileset;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.utils.Assets;

class Main extends Start {
	private var addingBunnies:Bool;
	private var bunnies:Array<Bunny>;
	private var gravity:Float;
	private var minX:Int;
	private var minY:Int;
	private var maxX:Int;
	private var maxY:Int;
	private var tileset:Tileset;

	var tilemap:ImageBatchs;
	var atlas:TextureAtlas;

	public function new() {
		super(1920, 1080, false);

		bunnies = new Array();

		minX = 0;
		maxX = Std.int(getStageWidth());
		minY = 0;
		maxY = Std.int(getStageHeight());
		gravity = 0.5;

		var bitmapData = Assets.getBitmapData("assets/wabbit_alpha.png");

		atlas = TextureAtlas.createTextureAtlasByOne(bitmapData);
		tilemap = new ImageBatchs(atlas);
		this.addChild(tilemap);

		stage.addEventListener(MouseEvent.MOUSE_DOWN, stage_onMouseDown);
		stage.addEventListener(MouseEvent.MOUSE_UP, stage_onMouseUp);
		stage.addEventListener(Event.ENTER_FRAME, stage_onEnterFrame);
		stage.addEventListener(Event.RESIZE, stage_onResize);

		Gamepad.onConnect.add(gamepad_onConnect);

		for (gamepad in Gamepad.devices) {
			gamepad_onConnect(gamepad);
		}

		var count = #if bunnies Std.parseInt(haxe.macro.Compiler.getDefine("bunnies")) #else 100 #end;

		for (i in 0...count) {
			addBunny();
		}
	}

	private function addBunny():Void {
		var bunny = new Bunny();
		bunny.setFrame(atlas.getBitmapDataFrame("img"));
		bunny.x = 0;
		bunny.y = 0;
		bunny.speedX = Math.random() * 5;
		bunny.speedY = (Math.random() * 5) - 2.5;
		bunnies.push(bunny);
		tilemap.addChild(bunny);
	}

	// Event Handlers

	private function gamepad_onButtonDown(button:GamepadButton):Void {
		addingBunnies = true;
	}

	private function gamepad_onButtonUp(button:GamepadButton):Void {
		addingBunnies = false;
		trace(bunnies.length + " bunnies");
	}

	private function gamepad_onConnect(gamepad:Gamepad):Void {
		gamepad.onButtonDown.add(gamepad_onButtonDown);
		gamepad.onButtonUp.add(gamepad_onButtonUp);
	}

	private function stage_onEnterFrame(event:Event):Void {
		var bunny;

		for (i in 0...bunnies.length) {
			bunny = bunnies[i];

			bunny.x += bunny.speedX;
			bunny.y += bunny.speedY;
			bunny.speedY += gravity;

			if (bunny.x > maxX) {
				bunny.speedX *= -1;
				bunny.x = maxX;
			} else if (bunny.x < minX) {
				bunny.speedX *= -1;
				bunny.x = minX;
			}

			if (bunny.y > maxY) {
				bunny.speedY *= -0.8;
				bunny.y = maxY;

				if (Math.random() > 0.5) {
					bunny.speedY -= 3 + Math.random() * 4;
				}
			} else if (bunny.y < minY) {
				bunny.speedY = 0;
				bunny.y = minY;
			}
		}

		if (addingBunnies) {
			for (i in 0...300) {
				addBunny();
			}
		}
	}

	private function stage_onMouseDown(event:MouseEvent):Void {
		addingBunnies = true;
	}

	private function stage_onMouseUp(event:MouseEvent):Void {
		addingBunnies = false;
		trace(bunnies.length + " bunnies");
	}

	private function stage_onResize(event:Event):Void {
		maxX = Std.int(getStageWidth());
		maxY = Std.int(getStageHeight());
		tilemap.width = getStageWidth();
		tilemap.height = getStageHeight();
	}
}
