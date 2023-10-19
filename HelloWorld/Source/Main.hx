package;

import zygame.components.ZLabel;
import zygame.core.Start;

class Main extends Start {
	public function new() {
		super(1920, 1080, false);
	}

	override function onInit() {
		super.onInit();
		// 代码初始化入口
		var text = new ZLabel();
		text.setFontSize(60);
		text.hAlign = CENTER;
		text.vAlign = CENTER;
		text.width = 500;
        text.dataProvider = "Hello World";
		this.addChild(text);
		text.x = (getStageWidth() - text.width) / 2;
		text.y = (getStageHeight() - text.height) / 2;
	}
}
