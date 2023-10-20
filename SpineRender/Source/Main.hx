package;

import zygame.components.ZSpine;
import zygame.components.ZBuilder;
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
		assets.loadSpineTextAlats(["assets/slk.png"], "assets/slk.atlas");
		assets.loadFile("assets/slk.json");
		assets.start((f) -> {
			if (f == 1) {
				onAtlasRender();
			}
		});
		// 绑定资源管理器
		ZBuilder.bindAssets(assets);
	}

	private function onAtlasRender():Void {
		var spine = ZBuilder.createSpineSpriteSkeleton("slk", "slk");
		this.addChild(spine);
		spine.x = spine.y = 300;
		spine.play("idle");

		// 另外一种创建方式
		var zspine = new ZSpine("slk", "slk");
		this.addChild(zspine);
		zspine.action = "idle";
		zspine.x = 300;
		zspine.y = 600;
	}
}
