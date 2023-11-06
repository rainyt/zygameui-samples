import VectorMath.step;
import VectorMath.vec4;
import glsl.OpenFLShader;

class BloomShader extends OpenFLShader {
	override function fragment() {
		super.fragment();
		var color2:Vec4 = this.color * step(this.color - vec4(0.8, 0.8, 0.8, 1), vec4(0.2));
		this.gl_FragColor = color2;
	}
}
