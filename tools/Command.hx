package tools;

import js.node.ChildProcess;

/**
 * 命令工具
 */
@:expose
class Command {
	static function main() {}

	/**
	 * 快捷执行命令
	 * @param cmd 
	 * @param cb 
	 */
	public static function cmd(cmd:String, cb:Dynamic->String->String->Void):Void {
		ChildProcess.exec(cmd, null, function(err, stdout, stderr) {
			cb(err, stdout, stderr);
		});
	}
}
