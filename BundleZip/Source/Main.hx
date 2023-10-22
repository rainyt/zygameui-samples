package;

import zygame.components.ZBuilder;
import openfl.events.MouseEvent;
import zygame.components.ZImage;
import zygame.utils.ZAssets;
import zygame.core.Start;

class Main extends Start {
	public function new() {
		super(1920, 1080, false);
	}

	override function onInit() {
		super.onInit();
		// 代码初始化入口
		var assets = new ZAssets();
		assets.loadAssetsZip("assets/ZipAssets.zip");
		assets.start((f) -> {
			if (f == 1) {
				// 可以直接读取zip包中的img对象文件；
				var img = new ZImage();
				this.addChild(img);
				img.dataProvider = "img.png";
			}
		});
		// 绑定资源库
		ZBuilder.bindAssets(assets);
	}
}
