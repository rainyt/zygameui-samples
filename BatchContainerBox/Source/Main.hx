package;

import zygame.display.batch.BImage;
import zygame.display.batch.BBox;
import zygame.display.batch.ImageBatchs;
import openfl.Assets;
import zygame.utils.load.TextureLoader.TextureAtlas;
import zygame.core.Start;

class Main extends Start {
	public function new() {
		super(1920, 1080, false);
	}

	override function onInit() {
		super.onInit();
		// 代码初始化入口
		var atlas = TextureAtlas.createTextureAtlasByOne(Assets.getBitmapData("assets/img.png"));
		var batchs = new ImageBatchs(atlas);
		this.addChild(batchs);
		// 9X9的格子渲染（这是批处理的）
		var box = new BBox();
		batchs.addChild(box);
		var vbox = new VBBox();
		vbox.gap = 10;
		box.addChild(vbox);
		for (i in 0...9) {
			var hbox = new HBBox();
			hbox.gap = 10;
			for (i in 0...9) {
				var img = new BImage(atlas.getBitmapDataFrame("img"));
                img.width = img.height = 80;
				hbox.addChild(img);
			}
			vbox.addChild(hbox);
			hbox.updateLayout();
		}
		vbox.updateLayout();

		box.x = (getStageWidth() - box.width) / 2;
		box.y = (getStageHeight() - box.height) / 2;
	}
}
