package;

import openfl.Assets;
import openfl.display.Bitmap;
import zygame.core.Start;

class Main extends Start {
	public function new() {
		super(1920, 1080, false);
	}

	override function onInit() {
		super.onInit();
        stage.color = 0x0;
		// 代码初始化入口
		var bitmap = new Bitmap(Assets.getBitmapData("assets/img.png"));
		this.addChild(bitmap);
		bitmap.x = bitmap.y = 300;
		var shader = new BloomShader();
		bitmap.shader = shader;
	}
}
