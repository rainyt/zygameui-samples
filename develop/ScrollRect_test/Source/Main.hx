package;

import openfl.geom.Point;
import openfl.events.MouseEvent;
import zygame.components.ZBuilder;
import zygame.display.ImageBitmap;
import zygame.utils.ZAssets;
import zygame.core.Start;

class Main extends Start {
	public function new() {
		super(1920, 1080, false);
	}

	private var __img:ImageBitmap;

	override function onInit() {
		super.onInit();
		// 代码初始化入口
		var assets:ZAssets = new ZAssets();
		assets.loadTextures("assets/mouse_atlas.png", "assets/mouse_atlas.xml");
		assets.start((f) -> {
			if (f == 1) {
				var img:ImageBitmap = new ImageBitmap();
				img.dataProvider = "mouse_atlas:attack_03";
				this.addChild(img);
				stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouse);
				stage.addEventListener(MouseEvent.MOUSE_UP, onMouse);
				stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouse);
				__img = img;
				__img.scaleX = __img.scaleY = 3;
			}
		});
		ZBuilder.bindAssets(assets);
	}

	private var _lastPos = new Point();
	private var _lastImgPos = new Point();

	private var _down = false;

	public function onMouse(e:MouseEvent):Void {
		switch e.type {
			case MouseEvent.MOUSE_DOWN:
				_down = true;
				_lastPos.x = this.mouseX;
				_lastPos.y = this.mouseY;
				_lastImgPos.x = __img.x;
				_lastImgPos.y = __img.y;
			case MouseEvent.MOUSE_UP:
				_down = false;
			case MouseEvent.MOUSE_MOVE:
				if (_down) {
					__img.x = _lastImgPos.x - (_lastPos.x - this.mouseX);
					__img.y = _lastImgPos.y - (_lastPos.y - this.mouseY);
				}
		}
	}
}
