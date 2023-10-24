package zygame.commponts;

import openfl.geom.Matrix;
import openfl.geom.Rectangle;
import openfl.Vector;
import zygame.utils.load.Frame;
import openfl.display.BitmapData;
import openfl.display.Sprite;

/**
 * 图片渲染器
 */
class ImageRender extends Sprite {
	private var __isS9Draw:Bool = false;

	private var __width:Null<Float> = null;

	private var __height:Null<Float> = null;

	private var __data:Dynamic;

	public function draw(data:Dynamic, width:Null<Float>, height:Null<Float>):Void {
		this.graphics.clear();
		__isS9Draw = false;
		__width = width;
		__height = height;
		__data = data;
		if (data is BitmapData) {
			var bitmap:BitmapData = data;
			this.graphics.beginBitmapFill(data, null, true, true);
			this.graphics.drawQuads(new Vector(4, false, [0., 0., bitmap.width, bitmap.height]));
		} else if (data is Frame) {
			this.scaleX = this.scaleY = 1;
			var frame:Frame = data;
			if (frame.scale9frames != null) {
				this.graphics.beginBitmapFill(frame.parent.getRootBitmapData(), null, true, false);
				__isS9Draw = true;
				// 九图渲染
				var quads:Vector<Float> = new Vector();
				var transform:Vector<Float> = new Vector();
				var m = new Matrix();
				var lefttop = frame.scale9frames[0];
				var righttop = frame.scale9frames[2];
				var leftbottom = frame.scale9frames[6];
				var rightbottom = frame.scale9frames[8];
				var center = frame.scale9frames[4];
				var wScale = (width - lefttop.width - righttop.width) / center.width;
				var hScale = (height - lefttop.height - leftbottom.height) / center.height;
				for (index => pFrame in frame.scale9frames) {
					switch index {
						case 0:
							quads.push(pFrame.x);
							quads.push(pFrame.y);
							quads.push(pFrame.width);
							quads.push(pFrame.height);
							// 左上
							transform.push(m.a);
							transform.push(m.b);
							transform.push(m.c);
							transform.push(m.d);
							transform.push(m.tx);
							transform.push(m.ty);
						case 1:
							quads.push(pFrame.x);
							quads.push(pFrame.y);
							quads.push(pFrame.width);
							quads.push(pFrame.height);
							// 中上
							m.scale(wScale, 1);
							transform.push(m.a);
							transform.push(m.b);
							transform.push(m.c);
							transform.push(m.d);
							transform.push(m.tx + lefttop.width);
							transform.push(m.ty);
						case 2:
							quads.push(pFrame.x);
							quads.push(pFrame.y);
							quads.push(pFrame.width);
							quads.push(pFrame.height);
							// 右上
							m.identity();
							transform.push(m.a);
							transform.push(m.b);
							transform.push(m.c);
							transform.push(m.d);
							transform.push(m.tx + (width - righttop.width));
							transform.push(m.ty);
						case 3:
							quads.push(pFrame.x);
							quads.push(pFrame.y);
							quads.push(pFrame.width);
							quads.push(pFrame.height);
							// 左中
							m.identity();
							m.scale(1, hScale);
							transform.push(m.a);
							transform.push(m.b);
							transform.push(m.c);
							transform.push(m.d);
							transform.push(m.tx);
							transform.push(m.ty + lefttop.height);
						case 4:
							quads.push(pFrame.x);
							quads.push(pFrame.y);
							quads.push(pFrame.width);
							quads.push(pFrame.height);
							// 居中
							m.identity();
							m.scale(wScale, hScale);
							transform.push(m.a);
							transform.push(m.b);
							transform.push(m.c);
							transform.push(m.d);
							transform.push(m.tx + lefttop.width);
							transform.push(m.ty + lefttop.height);
						case 5:
							// 右中
							quads.push(pFrame.x);
							quads.push(pFrame.y);
							quads.push(pFrame.width);
							quads.push(pFrame.height);
							// 左中
							m.identity();
							m.scale(1, hScale);
							transform.push(m.a);
							transform.push(m.b);
							transform.push(m.c);
							transform.push(m.d);
							transform.push(m.tx + width - righttop.width);
							transform.push(m.ty + lefttop.height);
						case 6:
							// 下左
							quads.push(pFrame.x);
							quads.push(pFrame.y);
							quads.push(pFrame.width);
							quads.push(pFrame.height);
							// 左上
							m.identity();
							transform.push(m.a);
							transform.push(m.b);
							transform.push(m.c);
							transform.push(m.d);
							transform.push(m.tx);
							transform.push(m.ty + height - leftbottom.height);
						case 7:
							// 下中
							quads.push(pFrame.x);
							quads.push(pFrame.y);
							quads.push(pFrame.width);
							quads.push(pFrame.height);
							// 左上
							m.identity();
							m.scale(wScale, 1);
							transform.push(m.a);
							transform.push(m.b);
							transform.push(m.c);
							transform.push(m.d);
							transform.push(m.tx + leftbottom.width);
							transform.push(m.ty + height - leftbottom.height);
						case 8:
							// 下左
							quads.push(pFrame.x);
							quads.push(pFrame.y);
							quads.push(pFrame.width);
							quads.push(pFrame.height);
							// 左上
							m.identity();
							transform.push(m.a);
							transform.push(m.b);
							transform.push(m.c);
							transform.push(m.d);
							transform.push(m.tx + width - rightbottom.width);
							transform.push(m.ty + height - leftbottom.height);
						default:
							break;
					}
				}
				this.graphics.drawQuads(quads, null, transform);
			} else {
				this.graphics.beginBitmapFill(frame.parent.getRootBitmapData(), null, true, true);
				var m = this.transform.matrix;
				this.graphics.drawQuads(new Vector(4, false, [frame.x, frame.y, frame.width, frame.height]), null,
					new Vector(6, false, [m.a, m.b, m.c, m.d, m.tx, m.ty]));
			}
		}
		this.graphics.endFill();
		if (!__isS9Draw) {
			if (width != null)
				super.width = width;
			if (height != null)
				super.height = height;
		}
	}

	override function set_width(value:Float):Float {
		if (__isS9Draw) {
			__width = value;
			draw(__data, __width, __height);
			return value;
		}
		return super.set_width(value);
	}

	override function set_height(value:Float):Float {
		if (__isS9Draw) {
			__height = value;
			draw(__data, __width, __height);
			return value;
		}
		return super.set_height(value);
	}
}
