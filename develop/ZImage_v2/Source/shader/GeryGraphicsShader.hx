package shader;

import glsl.OpenFLGraphicsShader;

class GeryGraphicsShader extends OpenFLGraphicsShader {
	override function fragment() {
		super.fragment();
		// 将当前颜色全部加起来，取平均数
		var mColor = 0.;
		mColor += gl_FragColor.r + gl_FragColor.g + gl_FragColor.b;
		mColor = mColor / 3.;
		// 得到灰度颜色
		gl_FragColor.rgb = new Vec3(mColor, mColor, mColor);
		gl_FragColor *= gl_openfl_Alphav;
	}
}
