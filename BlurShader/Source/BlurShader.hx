import glsl.GLSL.float;
import VectorMath;
import glsl.GLSL.texture2D;
import glsl.OpenFLShader;

/**
 * 模糊着色器
 */
@:debug
class BlurShader extends OpenFLShader {
	@:uniform public var blurSize:Int;

	@:glsl
	public function blur(uv:Vec2):Vec4 {
		var color:Vec4 = vec4(0, 0, 0, 1);
		var uvSize:Vec2 = vec2(1, 1) / gl_openfl_TextureSize;
		var counts:Float = 1.;
		for (i in 0...255) {
			if (i > blurSize)
				break;
			counts++;
			var fi:Float = float(i);
			color = color + texture2D(gl_openfl_Texture, /*fract*/ (gl_openfl_TextureCoordv + vec2(fi * uvSize.x, 0))) * 0.25;
			color = color + texture2D(gl_openfl_Texture, /*fract*/ (gl_openfl_TextureCoordv - vec2(fi * uvSize.x, 0))) * 0.25;
			color = color + texture2D(gl_openfl_Texture, /*fract*/ (gl_openfl_TextureCoordv + vec2(0, fi * uvSize.y))) * 0.25;
			color = color + texture2D(gl_openfl_Texture, /*fract*/ (gl_openfl_TextureCoordv - vec2(0, fi * uvSize.y))) * 0.25;
			//
			counts++;
			color = color + texture2D(gl_openfl_Texture, /*fract*/ (gl_openfl_TextureCoordv + vec2(fi * uvSize.x, fi * uvSize.y))) * 0.25;
			color = color + texture2D(gl_openfl_Texture, /*fract*/ (gl_openfl_TextureCoordv - vec2(fi * uvSize.x, fi * uvSize.y))) * 0.25;
			color = color + texture2D(gl_openfl_Texture, /*fract*/ (gl_openfl_TextureCoordv + vec2(fi * uvSize.x, -fi * uvSize.y))) * 0.25;
			color = color + texture2D(gl_openfl_Texture, /*fract*/ (gl_openfl_TextureCoordv - vec2(fi * uvSize.x, -fi * uvSize.y))) * 0.25;
		}
		return color / counts;
	}

	override function fragment() {
		super.fragment();
		this.gl_FragColor = blur(gl_openfl_TextureCoordv);
	}
}
