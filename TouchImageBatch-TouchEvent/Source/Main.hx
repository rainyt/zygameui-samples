package;

import zygame.events.TileTouchEvent;
import motion.Actuate;
import openfl.events.MouseEvent;
import zygame.display.batch.BImage;
import zygame.components.ZModel;
import zygame.display.batch.BButton;
import zygame.display.batch.TouchImageBatchsContainer;
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
		var touchImageBatchs:TouchImageBatchsContainer = new TouchImageBatchsContainer(atlas);
		this.addChild(touchImageBatchs);

		var button:BButton = BButton.createButton(atlas, atlas.getBitmapDataFrame("img"));
		touchImageBatchs.getBatchs().addChild(button);
		button.clickEvent = () -> {
			ZModel.showTextModel("点击成功");
		}

		for (i in 0...5) {
			var img = new BImage(atlas.getBitmapDataFrame("img"));
			img.x = (img.width + 10) * (i + 1);
			touchImageBatchs.getBatchs().addChild(img);
		}

		// 1、通过currentTouchTile获得 侦听点击事件
		touchImageBatchs.addEventListener(MouseEvent.CLICK, onMouseClick);

		// 2、通过`TileTouchEvent`事件 侦听点击事件
		touchImageBatchs.addEventListener(TileTouchEvent.TOUCH_END_TILE, onTouchEndTile);
	}

	private function onTouchEndTile(e:TileTouchEvent):Void {
		if (e.tile is BButton) {
			return;
		}
		e.tile.y = 0;
		Actuate.tween(e.tile, 2, {
			y: 200
		});
	}

	private function onMouseClick(e:MouseEvent):Void {
		// 通过currentTouchTile获得
		var batchs:TouchImageBatchsContainer = e.target;
		if (batchs.currentTouchTile != null) {
			if (batchs.currentTouchTile is BButton) {
				return;
			}
			batchs.currentTouchTile.alpha = 0;
			Actuate.tween(batchs.currentTouchTile, 1, {
				alpha: 1
			});
		}
	}
}
