package js;
import js.fetch.Request;
import js.fetch.Response;
import js.lib.Promise;
@:native('fetch') extern class Fetch {
	@:selfCall
	@:overload(function(input:String, ?init:RequestInit):Promise<Response> {})
	public static function fetch(input:Request, ?init:RequestInit):Promise<Response>;
}
