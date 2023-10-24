package;

import zygame.components.ZBuilder;
import zygame.commponts.ZImage_v2;
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
		assets.loadFile("assets/img.png");
		assets.loadTextures("assets/CommonAtlas.png", "assets/CommonAtlas.xml");
		assets.start((f) -> {
			if (f == 1) {
				// 普通图片
				var img = new ZImage_v2();
				this.addChild(img);
				img.dataProvider = "img";
				img.width = 400;
				// 精灵图
				var img2 = new ZImage_v2();
				this.addChild(img2);
				img2.y = 200;
				img2.width = 400;
				img2.dataProvider = "CommonAtlas:BiaoTiDi";
				trace("宽度：", img2.width);
				// 精灵图九图
				var img3 = new ZImage_v2();
				this.addChild(img3);
				img3.dataProvider = "CommonAtlas:s9_bg";
				img3.width = 700;
				img3.height = 800;
				img3.x = (getStageWidth() - img3.width) / 2;
				img3.y = (getStageHeight() - img3.height) / 2;
			}
		});
		ZBuilder.bindAssets(assets);
	}
}
