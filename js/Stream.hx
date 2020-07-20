package js;
import js.*;
import js.lib.*;
typedef AbortSignal = {
	var aborted:Bool;
	function addEventListener(type:String, listener:Void->Void):Void;
	function removeEventListener(type:String, listener:Void->Void):Void;
};
@:native("ByteLengthQueuingStrategy")
extern class ByteLengthQueuingStrategy {
	function new(options:{var highWaterMark:Float;});
	function size(?chunk:js.lib.ArrayBufferView):Float;
}
@:native("CountQueuingStrategy")
extern class CountQueuingStrategy {
	function new(options:{var highWaterMark:Float;});
	function size(?chunk:js.lib.ArrayBufferView):Float;
}

typedef PipeOptions = {
	@:optional
	var preventAbort:Bool;
	@:optional
	var preventCancel:Bool;
	@:optional
	var preventClose:Bool;
	@:optional
	var signal:AbortSignal;
};

typedef QueuingStrategy = {
	@:optional
	function size(?chunk:js.lib.ArrayBufferView):Float;
};
@:native("ReadableByteStreamController")
extern class ReadableByteStreamController {
	var byobRequest(default, null):ReadableStreamBYOBRequest;
	var desiredSize(default, null):Null<Float>;
	function close():Void;
	function enqueue(chunk:ArrayBufferView):Void;
	function error(?e:Dynamic):Void;
}

typedef UnderlyingByteSource = {
    @:optional
	var start:ReadableByteStreamController->Promise<Void>;
	@:optional
	var pull:ReadableByteStreamController->Promise<Void>;
	@:optional
	var cancel:String->Promise<Void>;
	@:optional
	var type:String;
	@:optional
	var autoAllocateChunkSize:Float;
};

typedef UnderlyingSource = {
	@:optional
	var start:ReadableStreamDefaultController->Promise<Void>;
	@:optional
	var pull:ReadableStreamDefaultController->Promise<Void>;
	@:optional
	var cancel:String->Promise<Void>;
	@:optional
	var type:String;
};@:native("ReadableStream")
extern class ReadableStream {
	@:overload(function(?underlyingSource:UnderlyingSource, ?strategy:QueuingStrategy):Void {})
	function new(underlyingSource:UnderlyingByteSource, ?strategy:QueuingStrategy);

	var locked(default, null):Bool;
	function cancel(?reason:String):Promise<Void>;
	@:overload(function():ReadableStreamDefaultReader {})
	function getReader(?cfg:{var mode:String;}):ReadableStreamBYOBReader;
	function pipeThrough<T>(transform:ReadableWritablePair, ?options:PipeOptions):ReadableStream;
	function pipeTo(dest:WritableStream, ?options:PipeOptions):Promise<Void>;
	function tee():Array<ReadableStream>;
}

typedef ReadResult<T> = {value:T, done:Bool}
@:native("ReadableStreamBYOBReader")
extern class ReadableStreamBYOBReader {
	function new(stream:ReadableStream);

	var closed(default, null):Promise<Void>;
	function cancel(?reason:String):Promise<Void>;
	function read<T:(js.lib.ArrayBufferView)>(view:T):Promise<ReadResult<T>>;
	function releaseLock():Void;
}
@:native("ReadableStreamBYOBRequest")
extern class ReadableStreamBYOBRequest {
	var view(default, null):ArrayBufferView;
	function respond(bytesWritten:Float):Void;
	function respondWithNewView(view:ArrayBufferView):Void;
}
@:native("ReadableStreamDefaultController")
extern class ReadableStreamDefaultController {
	var desiredSize(default, null):Null<Float>;
	function close():Void;
	function enqueue(chunk:String):Void;
	function error(?e:String):Void;
}
@:native("ReadableStreamDefaultReader")
extern class ReadableStreamDefaultReader {
	function new(stream:ReadableStream);

	var closed(default, null):Promise<Void>;
	function cancel(?reason:String):Promise<Void>;
	function read():Promise<ReadResult<String>>;
	function releaseLock():Void;
}

typedef ReadableWritablePair = {
	var readable(default, null):ReadableStream;
	var writable(default, null):WritableStream;
};

typedef Transformer<I, O> = {
	@:optional
	var start:Void->Void;
	@:optional
	var transform:I->TransformStreamDefaultController<O>->Void;
	@:optional
	var flush:Void->Void;
	// @:optional
	// var readableType:Undefined;
	// @:optional
	// var writableType:Undefined;
};
@:native("TransformStream")
extern class TransformStream<I, O> {
	function new(?transformer:Transformer<I, O>, ?writableStrategy:QueuingStrategy, ?readableStrategy:QueuingStrategy);

	var readable(default, null):ReadableStream;
	var writable(default, null):WritableStream;
}
@:native("TransformStreamDefaultController")
extern class TransformStreamDefaultController<O> {
	var desiredSize(default, null):Null<Float>;
	function enqueue(chunk:O):Void;
	function error(?reason:String):Void;
	function terminate():Void;
}


typedef UnderlyingSink = {
	@:optional
	var start:WritableStreamDefaultController->Promise<Void>;
	@:optional
	var write:js.lib.ArrayBufferView->WritableStreamDefaultController->Promise<Void>;
	@:optional
	var close:WritableStreamDefaultController->Promise<Void>;
	@:optional
	var abort:String->Promise<Void>;
};
@:native("WritableStream")
extern class WritableStream {
	function new(?underlyingSink:UnderlyingSink, ?strategy:QueuingStrategy);

	var locked(default, null):Bool;
	function abort(?reason:String):Promise<Void>;
	function close():Promise<Void>;
	function getWriter():WritableStreamDefaultWriter;
}
@:native("WritableStreamDefaultController")
extern class WritableStreamDefaultController {
	function error(?e:String):Void;
}
@:native("WritableStreamDefaultWriter")
extern class WritableStreamDefaultWriter {
	function new(stream:WritableStream);

	var closed(default, null):Promise<Void>;
	var desiredSize(default, null):Null<Float>;
	var ready(default, null):Promise<Void>;
	function abort(?reason:String):Promise<Void>;
	function close():Promise<Void>;
	function releaseLock():Void;
	function write(chunk:js.lib.ArrayBufferView):Promise<Void>;
}
