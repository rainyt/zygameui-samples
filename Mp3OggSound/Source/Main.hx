package;

import zygame.components.ZBuilder;
import openfl.events.MouseEvent;
import zygame.components.ZLabel;
import zygame.utils.ZAssets;
import zygame.core.Start;

class Main extends Start {
	public function new() {
		super(1920, 1080, false);
	}

	var assets = new ZAssets();

	override function onInit() {
		super.onInit();
		// 代码初始化入口
		// 不管是加载mp3还是ogg，都应该以原始的mp3后缀来加载
		assets.loadFile("assets/sound.mp3");
		assets.start((f) -> {
			if (f == 1) {
				onSoundPlay();
			}
		});
		ZBuilder.bindAssets(assets);
	}

	private function onSoundPlay():Void {
		var label = new ZLabel();
		label.dataProvider = "请点击舞台播放音频";
		label.alignPivot();
		label.width = getStageWidth();
		label.y = (getStageHeight() - label.getTextHeight()) / 2;
		this.addChild(label);
		stage.addEventListener(MouseEvent.CLICK, (e) -> {
			assets.playSound("sound");
		});
	}
}
