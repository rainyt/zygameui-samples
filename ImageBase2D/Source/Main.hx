package;

import zygame.display.ImageBitmap;
import zygame.components.ZBuilder;
import zygame.utils.ZAssets;
import zygame.utils.load.TextureLoader.TextureAtlas;
import openfl.Assets;
import zygame.components.ZImage;
import zygame.core.Start;

class Main extends Start {
	public function new() {
		super(1920, 1080, false);
	}

	override function onInit() {
		super.onInit();
		// 代码初始化入口

		// 使用内嵌的BitmapData
		var img = new ZImage();
		img.dataProvider = Assets.getBitmapData("assets/img.png");
		this.addChild(img);

		// 异步BitmapData
		var img = new ZImage();
		img.dataProvider = "assets/img.png";
		this.addChild(img);
		img.x = 178;

		// 精灵图数据
		var atlas:TextureAtlas = new TextureAtlas(Assets.getBitmapData("assets/img.png"), Xml.parse('<TextureAtlas>
        <image name="subimg" x="0" y="0" width="89" height="89"/>
        <image name="subimg2" x="89" y="89" width="89" height="89"/>
        </TextureAtlas>'));

		// 使用精灵图数据
		var img = new ZImage();
		img.dataProvider = atlas.getBitmapDataFrame("subimg");
		this.addChild(img);
		img.x = 178 * 2;
		var img = new ZImage();
		img.dataProvider = atlas.getBitmapDataFrame("subimg2");
		this.addChild(img);
		img.x = 178 * 2 + 89;
		img.y = 89;

		// 绑定Assets后，获得精灵图数据
		var assets = new ZAssets();
		assets.putTextureAtlas("img", atlas);
		ZBuilder.bindAssets(assets);
		var img = new ZImage();
		img.dataProvider = "img:subimg2";
		this.addChild(img);
		img.x = 178 * 3;

		// 更原始的api
		var imageBitmap:ImageBitmap = new ImageBitmap();
		imageBitmap.dataProvider = "img:subimg";
		this.addChild(imageBitmap);
		imageBitmap.x = 178 * 3 + 89;
        imageBitmap.y = 89;
	}
}
