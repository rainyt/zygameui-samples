package;

import motion.Actuate;
import openfl.Assets;
import openfl.display.Bitmap;
import zygame.core.Start;

class Main extends Start {
	public function new() {
		super(1920, 1080, false);
	}

	override function onInit() {
		super.onInit();
		// 代码初始化入口

		stage.color = 0x0;
		 
		// 不模糊的
		var bitmap:Bitmap = new Bitmap(Assets.getBitmapData("assets/img.png"));
		this.addChild(bitmap);
		bitmap.scaleX = bitmap.scaleY = 0.6;
		bitmap.x = (getStageWidth() - bitmap.width) / 2 - bitmap.width / 2;
		bitmap.y = (getStageHeight() - bitmap.height) / 2;

		// 模糊的
		var bitmap:Bitmap = new Bitmap(Assets.getBitmapData("assets/img.png"));
		this.addChild(bitmap);
		bitmap.scaleX = bitmap.scaleY = 0.6;
		bitmap.x = (getStageWidth() - bitmap.width) / 2 + bitmap.width / 2;
		bitmap.y = (getStageHeight() - bitmap.height) / 2;
		var shader = new BlurShader();
		shader.u_blurSize.value = [0];
		bitmap.shader = shader;

		function updateShader(f:Float):Void {
            shader.u_blurSize.value = [Std.int(f)];
            bitmap.invalidate();
        }

		Actuate.update(updateShader, 5, [0], [255]).reflect().repeat();
	}
}
