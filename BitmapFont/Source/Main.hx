package;

import zygame.components.ZBitmapLabel;
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
		assets.loadTextures("assets/DebugAtlas.png", " asssets/DebugAtlas.xml");
		assets.start((f) -> {
			if (f == 1) {
				onAtlasRender();
			}
		});
		// 绑定资源管理器
		ZBuilder.bindAssets(assets);
	}

	private function onAtlasRender():Void {
		var zbitmapLabel:ZBitmapLabel = new ZBitmapLabel(ZBuilder.getBaseTextureAtlas("DebugAtlas"));
		this.addChild(zbitmapLabel);
		zbitmapLabel.setFontName("ttf");
		zbitmapLabel.width = getStageWidth();
		zbitmapLabel.dataProvider = "This is a BitmapFont render.\nYour luck number is 1234567890.";
		zbitmapLabel.x = zbitmapLabel.y = 30;
	}
}
