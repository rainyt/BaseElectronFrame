// Generated by Haxe 4.1.5
(function ($hx_exports, $global) { "use strict";
$hx_exports["tools"] = $hx_exports["tools"] || {};
var haxe_iterators_ArrayIterator = function(array) {
	this.current = 0;
	this.array = array;
};
haxe_iterators_ArrayIterator.prototype = {
	hasNext: function() {
		return this.current < this.array.length;
	}
	,next: function() {
		return this.array[this.current++];
	}
};
var js_node_ChildProcess = require("child_process");
var js_node_KeyValue = {};
js_node_KeyValue.get_key = function(this1) {
	return this1[0];
};
js_node_KeyValue.get_value = function(this1) {
	return this1[1];
};
var js_node_stream_WritableNewOptionsAdapter = {};
js_node_stream_WritableNewOptionsAdapter.from = function(options) {
	if(!Object.prototype.hasOwnProperty.call(options,"final")) {
		Object.defineProperty(options,"final",{ get : function() {
			return options.final_;
		}});
	}
	return options;
};
var tools_Command = $hx_exports["tools"]["Command"] = function() { };
tools_Command.main = function() {
};
tools_Command.cmd = function(cmd,cb) {
	js_node_ChildProcess.exec(cmd,null,function(err,stdout,stderr) {
		cb(err,stdout,stderr);
	});
};
tools_Command.main();
})(typeof exports != "undefined" ? exports : typeof window != "undefined" ? window : typeof self != "undefined" ? self : this, {});