package;

import zygame.mini.MiniEngine;
import zygame.core.Start;

class Main extends Start {
	public function new() {
		super(1920, 1080, false);
	}

	override function onInit() {
		super.onInit();
		// 代码初始化入口
		MiniEngine.loadHaxeApp("assets/External.zip", (assets) -> {
			assets.createApp(this, (build) -> {
				trace("构造成功");
			}, "Game1");
		});
	}
}
