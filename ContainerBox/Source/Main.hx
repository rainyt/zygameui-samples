package;

import zygame.components.ZQuad;
import zygame.components.ZBox;
import zygame.core.Start;

class Main extends Start {
	public function new() {
		super(1920, 1080, false);
	}

	override function onInit() {
		super.onInit();
		// 代码初始化入口
		// 9X9的格子渲染（这是原生的）
		var box = new ZBox();
		this.addChild(box);
		var vbox = new VBox();
		vbox.gap = 10;
		box.addChild(vbox);
		for (i in 0...9) {
			var hbox = new HBox();
			hbox.gap = 10;
			for (i in 0...9) {
				var quad = new ZQuad(80, 80, Std.random(0xffffff));
				hbox.addChild(quad);
			}
			vbox.addChild(hbox);
			hbox.updateLayout();
		}
		vbox.updateLayout();

		box.x = (getStageWidth() - box.width) / 2;
		box.y = (getStageHeight() - box.height) / 2;
	}
}
