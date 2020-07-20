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
		asserts.assert( ({
			this.writable = new WritableStream({
				start: (controller)  ->{	
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
}