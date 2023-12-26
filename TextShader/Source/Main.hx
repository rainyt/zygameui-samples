package;

import zygame.components.data.MixColorData;
import zygame.utils.ColorUtils;
import zygame.components.ZLabel;
import zygame.core.Start;

class Main extends Start {
	public function new() {
		super(1920, 1080, false);
	}

	override function onInit() {
		super.onInit();
		// stage.color = 0x453964;
		// 代码初始化入口
		var text = new ZLabel();
		this.addChild(text);
		text.width = 1080;
		text.setFontSize(90);
		text.dataProvider = "可爱的人，这是渐变色";
		var c = new MixColorShader();
		var startColor = ColorUtils.toShaderColor("#fbea6c");
		var endColor = ColorUtils.toShaderColor("#fef8cc");
		c.u_startColor.value = [startColor.r, startColor.g, startColor.b, 1];
		c.u_endColor.value = [endColor.r, endColor.g, endColor.b, 1];
		text.shader = c;

		var text2 = new ZLabel();
		this.addChild(text2);
		text2.width = 1080;
		text2.height = 300;
		text2.setFontSize(90);
		text2.y = 200;
		// 描边
		text2.stroke(0x0, 4);
		// 渐变色
		text2.mixColor = new MixColorData(0xff0000, 0xffff00);
		text2.dataProvider = "可爱的人，这是渐变色";

		var text3 = new ZLabel();
		this.addChild(text3);
		text3.width = 1080;
		text3.height = 300;
		text3.setFontSize(90);
		text3.y = 500;
		// 描边
		text3.stroke(0x0, 5);
		text3.bold(2);
		// 渐变色
		text3.mixColor = new MixColorData(0xffffff, 0xefecb7);
		text3.dataProvider = "小金猪";

		var text3 = new ZLabel();
		this.addChild(text3);
		text3.width = 1080;
		text3.height = 300;
		text3.setFontSize(90);
		text3.y = 650;
		text3.x = 0;
		// 描边
		text3.stroke(0x0, 2);
		// 渐变色
		text3.mixColor = new MixColorData(0xffffff, 0xefecb7);
		text3.dataProvider = "小金猪";

		var text4 = new ZLabel();
		this.addChild(text4);
		text4.width = 1080;
		text4.height = 300;
		text4.setFontSize(90);
		text4.y = 500;
		text4.x = 500;
		text4.stroke(0x0, 2);
		text4.setFontColor(0xff00ff);
		text4.dataProvider = "紫色的字";
	}
}
