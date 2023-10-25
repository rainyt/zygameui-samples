package zygame.shader;

import openfl.display.Shader;
import openfl.display.GraphicsShader;

class CloneGraphicsShader extends GraphicsShader {
	public function new(shader:Shader) {
		this.glFragmentSource = shader.glFragmentSource;
		this.glVertexSource = shader.glVertexSource;
		super();
	}
}
