package;

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
        // 罗列需要加载的资源
		assets.loadFile("assets/img.png");
        // 开始加载
		assets.start((f) -> {
			if (f == 1) {
				trace("加载成功");
				var img = new ZImage();
				img.dataProvider
                 = assets.getBitmapData("img");
				this.addChild(img);
			}
		}, (error) -> {
			trace("加载失败");
		});
	}
}
