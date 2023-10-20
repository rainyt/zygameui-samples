package;

import zygame.utils.FrameEngine;
import zygame.components.ZQuad;
import zygame.core.Start;

class Main extends Start {
	public function new() {
		super(1920, 1080, false);
	}

	private var _quad:ZQuad;

	private var _back:Bool = false;

	override function onInit() {
		super.onInit();
		// 代码初始化入口
		// 创建一个色块
		var quad:ZQuad = new ZQuad(100, 100, 0xff0000);
		this.addChild(quad);
		// 使用FrameEngine帧事件
		FrameEngine.create((f) -> {
			quad.x++;
			if (quad.x > 500) {
				f.stop();
			}
		});

		// 创建另外一个色块
		_quad = new ZQuad(100, 100, 0x00ff00);
		this.addChild(_quad);
		_quad.y = 100;

		// 开启当前类中的帧事件
		this.setFrameEvent(true);
	}

	/**
	 * 当使用setFrameEvent开启帧事件后，则重写该接口即可
	 */
	override function onFrame() {
		super.onFrame();
		_quad.x += _back ? -1 : 1;
		if (_quad.x >= 500 || _quad.x <= 0) {
			_back = !_back;
		}
	}
}
