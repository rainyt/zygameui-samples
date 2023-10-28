package;

import motion.Actuate;
import zygame.components.ZQuad;
import zygame.components.data.TimelineData;
import zygame.core.Start;

using tweenxcore.Tools;

class Main extends Start {
	public function new() {
		super(1920, 1080, false);
	}

	var quad:ZQuad;

	override function onInit() {
		super.onInit();
		// 代码初始化入口

		// var a = new AnimateQuad(180,60);
		// this.addChild(a);
		// return;

		var fps = 15;
		for (i in 0...4) {
			var a = new AnimateQuad(180, (i + 1) * fps);
			this.addChild(a);
			a.x = i * 200;
			// 添加事件
			for (i in 0...5) {
				a.timeline.addFrameScript(Std.random(180), () -> {
					Actuate.tween(a, 1, {scaleX: 0.5 + Math.random(), scaleY: 0.5 + Math.random()});
				}, Std.random(180), () -> {
					Actuate.tween(a, 1, {scaleX: 0.5 + Math.random(), scaleY: 0.5 + Math.random()});
				}, Std.random(180), () -> {
					Actuate.tween(a, 1, {scaleX: 0.5 + Math.random(), scaleY: 0.5 + Math.random()});
				});
			}
		}

		for (i in 0...4) {
			var a = new AnimateQuad(180 * (i + 1), 60);
			this.addChild(a);
			a.x = (i + 5) * 200;
			// 添加事件
			for (i in 0...5) {
				a.timeline.addFrameScript(Std.random(180), () -> {
					Actuate.tween(a, 1, {scaleX: 0.5 + Math.random(), scaleY: 0.5 + Math.random()});
				}, Std.random(180), () -> {
					Actuate.tween(a, 1, {scaleX: 0.5 + Math.random(), scaleY: 0.5 + Math.random()});
				}, Std.random(180), () -> {
					Actuate.tween(a, 1, {scaleX: 0.5 + Math.random(), scaleY: 0.5 + Math.random()});
				});
			}
		}
	}
}
