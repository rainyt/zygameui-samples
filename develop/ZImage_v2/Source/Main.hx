package;

import zygame.components.ZBuilderScene;
import openfl.geom.Rectangle;
import openfl.display.Bitmap;
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
		assets.loadTextures("assets/Frame9SpriteAtlas.png", "assets/Frame9SpriteAtlas.xml");
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
				img2.scaleWidth = img2.scaleHeight = 500;
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

				var bitmap:Bitmap = new Bitmap(assets.getBitmapData("img"));
				this.addChild(bitmap);
				bitmap.x = bitmap.y = 500;
				bitmap.scrollRect = new Rectangle(0, 0, 50, 50);
				trace("Current size:", bitmap.width, bitmap.height); // 50x50
				bitmap.scaleX = 2;
				bitmap.scaleY = 2;
				trace("Current size:", bitmap.width, bitmap.height); // 100x100
				bitmap.width = 200;
				bitmap.height = 200;
				trace("Current size:", bitmap.width, bitmap.height); // 200x200
				trace("Current scale:", bitmap.scaleX, bitmap.scaleY); // 4,4
				bitmap.scrollRect = new Rectangle(0, 0, 150, 150);
				trace("Current size:", bitmap.width, bitmap.height); // 600x600
				trace("Current scale:", bitmap.scaleX, bitmap.scaleY); // 4,4

				// 测试
				var s9scene = new ZBuilderScene("assets/S9FrameBg.xml");
				this.addChild(s9scene);
			}
		});
		ZBuilder.bindAssets(assets);
	}
}
