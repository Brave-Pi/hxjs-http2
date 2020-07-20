package;

import tink.unit.*;
import tink.testrunner.*;
import tink.CoreApi;
import js.Stream;

using Lambda;
using bp.test.Utils;

class RunTests {
	static function main() {
		Runner.run(TestBatch.make([new Test(),])).handle(Runner.exit);
	}
}

@:asserts
class Test {
	public function new() {}

	var writable:WritableStream;

	public function test_stream() {
		asserts.assert(({
			this.writable = new WritableStream({
				start: (controller) -> {
					null;
				},
				write: (chunk, controller) -> {
					null;
				},
				close: (controller) -> {
					null;
				},
				abort: (reason) -> {
					null;
				}
			});
		}).attempt());

		asserts.assert(this.writable != null);
		return asserts.done();
	}

	var response:Promise<js.fetch.Response>;

	public function test_fetch() {
		asserts.assert(({
			this.response = js.Fetch.fetch('https://nghttp2.org/httpbin/stream/100');
		}).attempt());
		asserts.assert(this.response != null);
		return asserts.done();
	}

	@:timeout(10000)
	public function test_body_stream() {
		response.next(r -> {
			asserts.assert(r.body != null);
			r;
		}).next(r -> {
			var reader = r.body.getReader();
			var promise:Promise<ReadResult<js.lib.Uint8Array>> = null;
			var result = "";
			function read() {
				promise = reader.read();
				return promise.next(v -> {
					
					if (v.done) {
						trace('done');
						result;
					}
					else {
						var val = haxe.io.Bytes.ofData(v.value.buffer).toString();
						trace('Got $val');
						result += val;
						read();
					}
				})
				.recover(e ->{
					trace(e);
					result;
				});
			}
			read();
		}).next(v -> {
			trace('Done, got: $v');
			asserts.done();
		}).recover(e -> {
			trace(e);
			asserts.done();
		}).eager();
		return asserts;
	}
}
