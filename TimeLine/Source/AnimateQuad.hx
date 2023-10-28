import tweenxcore.Tools.Easing;
import zygame.components.data.TimelineData;
import zygame.components.ZQuad;

using tweenxcore.Tools;

class AnimateQuad extends ZQuad {
	/**
	 * 时间戳
	 */
	public var timeline:TimelineData = new TimelineData(60, 30);

	public function new(maxFrameLength:Int, fps:Int) {
		super(100, 100, 0xff0000);
		timeline.fps = fps;
		timeline.maxFrame = maxFrameLength;
	}

	override function onInit() {
		super.onInit();
	}

	override function onAddToStage() {
		super.onAddToStage();
		this.setFrameEvent(true);
	}

	override function onRemoveToStage() {
		super.onRemoveToStage();
		this.setFrameEvent(false);
	}

	override function onFrame() {
		super.onFrame();
		timeline.advanceTime(this.delay);
		this.y = timeline.currentFrameRate.yoyo(Easing.circOut).lerp(0, getStageHeight() - this.width);
	}
}
