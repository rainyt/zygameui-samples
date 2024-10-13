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
		assets.loadTextures("assets/DebugAtlas.png", " assets/DebugAtlas.xml");
		assets.loadFnt("assets/font-export.png", " assets/font-export.xml");
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

		var zbitmapLabel:ZBitmapLabel = new ZBitmapLabel(ZBuilder.getBaseTextureAtlas("font-export"));
		this.addChild(zbitmapLabel);
		zbitmapLabel.width = getStageWidth();
		zbitmapLabel.dataProvider = "ABCDE123456";
		zbitmapLabel.x = zbitmapLabel.y = 30;
		zbitmapLabel.y = 300;
	}
}
