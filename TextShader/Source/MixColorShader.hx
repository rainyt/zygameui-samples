import VectorMath.mix;
import glsl.OpenFLShader;

class MixColorShader extends OpenFLShader {
	@:uniform
	public var startColor:Vec4;

	@:uniform
	public var endColor:Vec4;

	override function fragment() {
		super.fragment();
		this.gl_FragColor = mix(startColor, endColor, this.gl_openfl_TextureCoordv.y) * this.gl_FragColor.a;
	}
}
