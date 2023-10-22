package;

import zygame.utils.Lib;
import zygame.components.ZLabel;
import zygame.core.Start;

class Main extends Start {
	public function new() {
		super(1920, 1080, false);
	}

	override function onInit() {
		super.onInit();
		// 代码初始化入口
		var time = Lib.getData("times", 0);
		time++;
		Lib.setData("times", time);
		var label = new ZLabel();
		this.addChild(label);
		label.width = getStageWidth();
		label.setFontSize(60);
		label.dataProvider = '这是你第${time}次打开页面';
		label.hAlign = CENTER;
		label.y = (getStageHeight() - label.height) / 2;
	}
}
