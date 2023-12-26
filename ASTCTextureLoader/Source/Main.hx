package;

import zygame.loader.parser.ASTCBitmapDataParser.ASTCFormat;
import lime.utils.UInt8Array;
import openfl.display.BitmapData;
import openfl.events.MouseEvent;
import lime.graphics.opengl.GL;
import zygame.components.ZBuilder;
import zygame.components.ZImage;
import zygame.utils.ZAssets;
import zygame.core.Start;

class Main extends Start {
	public function new() {
		super(1920, 1080, false);
	}

	override function onInit() {
		super.onInit();
		// 代码初始化入口
		stage.color = 0x999999;
		var assets = new ZAssets();
		ZBuilder.bindAssets(assets);
		// 这是压缩后的ASTC纹理
		assets.loadFile("assets/texture_zilb.astc");
		assets.loadFile("assets/texture_zilb_cs.astc");
		// 加载ASTC压缩纹理
		assets.loadFile("assets/texture.astc");
		assets.loadFile("assets/texture_12x12.astc");
		assets.loadFile("assets/texture_6x6.astc");
		assets.loadFile("assets/texture_fast_4x4.astc");
		assets.loadFile("assets/c_4x4.astc");
		var img2:ZImage;
		assets.start(f -> {
			if (f == 1) {
				var img = new ZImage();
				img.dataProvider = "texture";
				this.addChild(img);

				img2 = new ZImage();
				img2.dataProvider = "texture_zilb";
				this.addChild(img2);
				img2.x = img.width / 2;

				var img2 = new ZImage();
				img2.dataProvider = "texture_zilb_cs";
				this.addChild(img2);
				img2.x = img.width / 2;
				img2.y = 300;
				
			}
		});
		this.addEventListener(MouseEvent.CLICK, (e) -> {
			var bitmapData:BitmapData = assets.getBitmapData("texture_zilb");
			var texture:Dynamic = @:privateAccess bitmapData.__texture.__textureID;
			var format:Dynamic = @:privateAccess bitmapData.__texture.__format;
			var buffer = GL.createFramebuffer();
			GL.bindFramebuffer(GL.FRAMEBUFFER, buffer);
			var status = GL.checkFramebufferStatus(GL.FRAMEBUFFER);
			trace("texture=", texture, status);
			GL.framebufferTexture2D(GL.FRAMEBUFFER, GL.COLOR_ATTACHMENT0, GL.TEXTURE_2D, texture, 0);
			var glPixelValues:UInt8Array = new UInt8Array(4);
			trace("test", Std.int(img2.mouseX), Std.int(img2.mouseY));

			// var altFormat = GL.getParameter(GL.IMPLEMENTATION_COLOR_READ_FORMAT);
			// var altType = GL.getParameter(GL.IMPLEMENTATION_COLOR_READ_TYPE);
			// trace("altFormat", altFormat, altType);
			trace("format=", format);
			GL.readPixelsWEBGL(Std.int(img2.mouseX), Std.int(img2.mouseY), 1, 1, GL.ALPHA, GL.UNSIGNED_BYTE, glPixelValues);
			GL.bindFramebuffer(GL.FRAMEBUFFER, null);
			trace("GL end", glPixelValues[0], glPixelValues[1], glPixelValues[2], glPixelValues[3]);
		});
	}
}
