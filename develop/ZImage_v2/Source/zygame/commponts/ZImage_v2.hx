package zygame.commponts;

import zygame.components.ZBuilder;
import zygame.components.base.DataProviderBox;

/**
 * 图片显示对象
 */
class ZImage_v2 extends DataProviderBox {
	private var __render:ImageRender;

	public function new() {
		super();
		__render = new ImageRender();
		this.addChild(__render);
	}

	override function set_dataProvider(data:Dynamic):Dynamic {
		if (data is String) {
			data = ZBuilder.getBaseBitmapData(data);
		}
		__render.scaleX = __render.scaleY = 1;
		__render.x = __render.y = 0;
		__render.draw(data, this._setWidth ? this.width : null, this._setHeight ? this.height : null);
		return super.set_dataProvider(data);
	}

	override function set_width(value:Float):Float {
		__render.width = value;
		return super.set_width(value);
	}

	override function set_height(value:Float):Float {
		__render.height = value;
		return super.set_height(value);
	}
}
