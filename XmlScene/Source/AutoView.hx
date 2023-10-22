import zygame.components.ZModel;
import zygame.components.ZBuilderScene;

/**
 * 自动构造
 */
@:build(zygame.macro.AutoBuilder.build("View"))
class AutoView extends ZBuilderScene {
	override function onBuilded() {
		super.onBuilded();
		this.button.clickEvent = () -> {
			ZModel.showTextModel("点击了按钮");
		}
	}
}
