package tools;

#if (sys || macro)
import sys.FileSystem;

class CreateExternalZip {
	static function main() {
		var dir = "./Export/html5/bin/assets/";
		if (!FileSystem.exists(dir)) {
			FileSystem.createDirectory(dir);
		}
		Sys.command('zip -r ${dir}External.zip ./External');
	}
}
#end
