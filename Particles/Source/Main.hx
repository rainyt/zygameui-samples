package;

import openfl.events.MouseEvent;
import openfl.utils.ByteArray;
import openfl.display.BitmapData;
import haxe.crypto.Base64;
import openfl.Assets;
import haxe.Json;
import zygame.components.ZBuilder;
import zygame.utils.ZAssets;
import zygame.components.ZParticles;
import zygame.core.Start;

class Main extends Start {
	public function new() {
		super(600, 1000, true);
	}

	override function onInit() {
		super.onInit();

		var assets = new ZAssets();
		ZBuilder.bindAssets(assets);
		assets.loadFile("assets/ceshi.json");
		assets.loadFile("assets/ceshi.png");
		assets.start((f) -> {
			if (f == 1) {
				// 解析图片内容
				// 创建例子
				var particles:ZParticles = new ZParticles();
				particles.dataProvider = "ceshi:ceshi";
				this.addChild(particles);
				particles.x = getStageWidth() / 2;
				particles.y = getStageHeight() / 2;
				// 开启动态跟随
				particles.gpuSystem.dynamicEmitPoint = true;
				stage.addEventListener(MouseEvent.MOUSE_MOVE, (e:MouseEvent) -> {
					// particles.x = this.mouseX;
					// particles.y = this.mouseY;
					particles.gpuSystem.x = this.mouseX;
					particles.gpuSystem.y = this.mouseY;
				});
			}
		});
		this.stage.color = 0x0;
	}
}
