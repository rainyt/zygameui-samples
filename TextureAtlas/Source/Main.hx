package;

import zygame.components.ZImage;
import zygame.components.ZBuilder;
import zygame.utils.ZAssets;
import zygame.core.Start;

class Main extends Start {
	public function new() {
		super(1920, 1080, false);
        stage.color = 0x0000ff;
	}

	override function onInit() {
		super.onInit();
		// 代码初始化入口
		var assets = new ZAssets();
		assets.loadTextures("assets/FetterDescAtlas.png", " asssets/FetterDescAtlas.xml");
		assets.start((f) -> {
			if (f == 1) {
				onAtlasRender();
			}
		});
		// 绑定资源管理器
		ZBuilder.bindAssets(assets);
	}

	private function onAtlasRender():Void {
		var img = new ZImage();
		// 指定精灵图
		img.dataProvider = "FetterDescAtlas:et1001";
		this.addChild(img);
	}
}
