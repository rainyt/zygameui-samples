package;

import zygame.shader.GeryShader;
import zygame.components.ZButton;
import shader.GeryGraphicsShader;
import zygame.components.ZImage;
import motion.Actuate;
import zygame.components.ZBuilder;
import zygame.components.ZImage_v2;
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
				// 精灵图九图
				var img3 = new ZImage_v2();
				this.addChild(img3);
				img3.dataProvider = "CommonAtlas:s9_bg";
				img3.fill = true;
				// 普通图片
				for (i in 0...200) {
					var img = new ZImage();
					this.addChild(img);
					img.dataProvider = "CommonAtlas:BiaoTiDi";
					img.width = 400;
					img.alignPivot();
					img.x = Math.random() * getStageWidth();
					img.y = Math.random() * getStageHeight();
					Actuate.tween(img, 10, {rotation: 360}).repeat();
				}
				// 精灵图
				var img2 = new ZImage_v2();
				this.addChild(img2);
				img2.y = 200;
				img2.width = 400;
				img2.dataProvider = "CommonAtlas:BiaoTiDi";
				// 网络资源图
				var webImg = new ZImage_v2();
				this.addChild(webImg);
				webImg.dataProvider = "assets/CommonAtlas.png";
				trace("宽度：", img2.width);

				// 缩放比图片
				var img2 = new ZImage_v2();
				this.addChild(img2);
				img2.y = 500;
				// img2.scaleWidth = img2.scaleHeight = 500;
				img2.dataProvider = "CommonAtlas:BiaoTiDi";
				img2.shader = GeryShader.shader;

				// 按钮
				var button:ZButton = ZButton.createButton("CommonAtlas:s9_bg");
				this.addChild(button);
				button.x = 300;
				button.y = 400;
				button.width = 300;
				button.height = 300;

				var img3 = new ZImage_v2();
				this.addChild(img3);
				img3.dataProvider = "CommonAtlas:s9_bg";
				img3.width = 900;
				img3.height = 100;
			}
		});
		ZBuilder.bindAssets(assets);
	}
}
