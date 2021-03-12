package;

class ElectronSetup {
	public static var window:ElectronBrowserWindow;

	static function main() {
		ElectronApp.commandLine.appendSwitch('ignore-gpu-blacklist', 'true');

		var windows:Array<Dynamic> = [
			{
				allowHighDPI: false,
				alwaysOnTop: false,
				antialiasing: 0,
				background: 16777215,
				borderless: false,
				colorDepth: 32,
				depthBuffer: true,
				display: 0,
				fullscreen: false,
				hardware: true,
				height: 0,
				hidden: false,
				maximized: false,
				minimized: false,
				parameters: {},
				resizable: true,
				stencilBuffer: true,
				title: "BaseElectronFrame",
				vsync: false,
				width: 0,
				x: null,
				y: null
			}
		];

		for (i in 0...windows.length) {
			var window:OpenFLWindow = windows[i];
			var width:Int = window.width;
			var height:Int = window.height;
			if (width == 0)
				width = 1200;
			if (height == 0)
				height = 800;
			var frame:Bool = window.borderless == false;

			ElectronApp.commandLine.appendSwitch('--autoplay-policy', 'no-user-gesture-required');

			ElectronApp.on('ready', function(e) {
				var config:Dynamic = {
					webPreferences: {
						nodeIntegration: true,
						enableRemoteModule: true,
						devTools: true
					},
					fullscreen: window.fullscreen,
					frame: frame,
					resizable: window.resizable,
					alwaysOnTop: window.alwaysOnTop,
					width: width,
					height: height,
					webgl: window.hardware
				};
				ElectronSetup.window = new ElectronBrowserWindow(config);

				ElectronSetup.window.on('closed', function() {
					ElectronApp.quit();
				});

				ElectronSetup.window.loadURL('file://' + js.Node.__dirname + '/index.html');
				// var core = untyped require("./electron-core.js");
				// core.MainCore.window = ElectronSetup.window;
			});
		}
	}
}

typedef OpenFLWindow = {
	allowHighDPI:Bool,
	alwaysOnTop:Bool,
	antialiasing:Int,
	background:UInt,
	borderless:Bool,
	colorDepth:Int,
	depthBuffer:Bool,
	display:Dynamic,
	fullscreen:Bool,
	hardware:Dynamic,
	height:Int,
	hidden:Bool,
	maximized:Bool,
	minimized:Bool,
	parameters:Dynamic,
	resizable:Bool,
	stencilBuffer:Bool,
	title:String,
	vsync:Bool,
	width:Int,
	x:Int,
	y:Int
}

// Externs to compile without requiring hxelectron

@:jsRequire("electron", "app") extern class ElectronApp {
	public static var commandLine:Dynamic;
	public static function on(type:Dynamic, callback:Dynamic):Dynamic;
	public static function quit():Void;
}

@:jsRequire("electron", "BrowserWindow") extern class ElectronBrowserWindow {
	public var webContents:Dynamic;
	public function new(?options:Dynamic);
	public function loadURL(url:String, ?options:Dynamic):Dynamic;
	public function on(type:Dynamic, callback:Dynamic):Dynamic;
}
