import motion.Actuate;
import openfl.events.MouseEvent;
import zygame.components.ZQuad;
import zygame.mini.MiniEngineScene;

/**
 * 热更新加载代码例子
 */
class Game1 extends MiniEngineScene {
	// 引入其他类型
	var img:ClassA;

	override function onInit() {
		super.onInit();
		trace("初始化完毕");
		img = new ClassA();

		this.addChild(img);
		img.dataProvider = this.assets.getBitmapData("img");
		img.x = this.getStageWidth() / 2;
		img.y = this.getStageHeight() / 2;
        
		// 引入已存在的类型
		var quad = new ZQuad(100, 100, 0xff0000);
		this.addChild(quad);
		quad.mouseEnabled = false;

		// 事件侦听
		this.stage.addEventListener(MouseEvent.MOUSE_MOVE, function(e) {
			quad.x = this.mouseX - quad.width / 2;
			quad.y = this.mouseY - quad.height / 2;
		});

		this.img.addEventListener(MouseEvent.CLICK, startAnimate);
	}

	public function startAnimate(e:MouseEvent):Void {
		img.x = this.getStageWidth() / 2;
		img.y = this.getStageHeight() / 2;
		Actuate.tween(img, 2, {y: 0});
	}
}
