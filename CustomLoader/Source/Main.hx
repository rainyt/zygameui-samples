package;

import zygame.components.data.AnimationData;
import zygame.components.ZAnimation;
import zygame.components.ZImage;
import zygame.components.ZBuilder;
import zygame.loader.LoaderAssets;
import zygame.utils.ZAssets;
import zygame.core.Start;

class Main extends Start {
	public function new() {
		super(1920, 1080, false);
	}

	private var animate:ZAnimation;

	override function onInit() {
		super.onInit();
		// 代码初始化入口
		// 创建新的加载分析器
		LoaderAssets.fileparser.push(JSONTextureAtlas);
		var assets = new ZAssets();
		assets.loadFile(new JSONTextureAtlas({
			path: "assets/run_format_JSON.png",
			json: "assets/run_format_JSON.json"
		}));
		assets.start((f) -> {
			if (f == 1) {
				// 解析成功
				var img = new ZImage();
				img.dataProvider = "run_format_JSON:run0000";
				this.addChild(img);
				img.y = 300;

				// 帧动画处理
				animate = new ZAnimation();
				var data = new AnimationData(60);
				data.addFrames(assets.getTextureAtlas("run_format_JSON").getBitmapDataFrames("run"));
				animate.dataProvider = data;
				this.addChild(animate);
				animate.play(99999);
				animate.x = 300;
				animate.y = 300;
			}
		});
		ZBuilder.bindAssets(assets);

		this.setFrameEvent(true);
	}

	override function onFrame() {
		super.onFrame();
		if (animate != null)
			animate.x++;
	}
}
