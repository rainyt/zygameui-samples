package;

import openfl.display.Shape;
import openfl.display.Sprite;
import motion.Actuate;
import openfl.Assets;
import zygame.components.ZImage;
import openfl.display.Bitmap;
import zygame.core.Start;

class Main extends Start {
	public function new() {
		super(1920, 1080, false);
	}

	override function onInit() {
		super.onInit();

		this.stage.color = 0x0;

		// 矩形遮罩
		this.createRectMask();

		this.createRoundMask();
	}

	public function createRectMask():Void {
		// 代码初始化入口
		var img:ZImage = new ZImage();
		img.dataProvider = Assets.getBitmapData("assets/2.png");
		this.addChild(img);

		// 这是遮罩(矩形)
		var mask:ZImage = new ZImage();
		mask.dataProvider = Assets.getBitmapData("assets/2.png");
		this.addChild(mask);

		// 然后这是被遮罩
		var maskImg:ZImage = new ZImage();
		maskImg.dataProvider = Assets.getBitmapData("assets/3.png");
		maskImg.mask = mask;
		this.addChild(maskImg);

		// 启动动画
		maskImg.x = -maskImg.width;
		Actuate.tween(maskImg, 1.5, {
			x: img.width
		}).repeat();
	}

	/**
	 * 圆形矩阵
	 */
	public function createRoundMask():Void {
		// 代码初始化入口
		var img:ZImage = new ZImage();
		img.dataProvider = Assets.getBitmapData("assets/2.png");
		this.addChild(img);
		img.x = img.width + 50;

		// 这是遮罩(矩形)
		var shape = new Shape();
		shape.graphics.beginFill(0x0);
		shape.graphics.drawRoundRect(0, 0, img.width - 8, img.height - 8, 30, 30);
		shape.graphics.endFill();
		this.addChild(shape);
		shape.x = img.x + 4;
		shape.y = 4;

		// 然后这是被遮罩
		// var shape2 = new Shape();
		// shape2.graphics.beginFill(0xffff00);
		// shape2.graphics.drawRect(0, 0, 300, img.height);
		// shape2.graphics.endFill();
		// shape2.mask = shape;
		// this.addChild(shape2);

		// shape2.x = shape.x - shape2.width;
		// Actuate.tween(shape2, 1.5, {
		// 	x: shape.x + img.width
		// }).repeat();

		var maskImg:ZImage = new ZImage();
		maskImg.dataProvider = Assets.getBitmapData("assets/3.png");
		maskImg.mask = shape;
		this.addChild(maskImg);
		maskImg.x = shape.x;

		// 启动动画
		maskImg.x = shape.x - maskImg.width;
		Actuate.tween(maskImg, 1.5, {
			x: shape.x + img.width
		}).repeat();
	}
}
