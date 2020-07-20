package js.fetch;
import js.Stream;
import js.lib.*;
import js.html.*;
typedef RequestInit = {
	var ?body : haxe.extern.EitherType<Blob,haxe.extern.EitherType<haxe.extern.EitherType<js.lib.ArrayBufferView,js.lib.ArrayBuffer>,haxe.extern.EitherType<FormData,haxe.extern.EitherType<URLSearchParams,haxe.extern.EitherType<String, ReadableStream>>>>>;
	var ?cache : RequestCache;
	var ?credentials : RequestCredentials;
	var ?headers : haxe.extern.EitherType<Headers,haxe.extern.EitherType<Array<Array<String>>,haxe.DynamicAccess<String>>>;
	var ?integrity : String;
	var ?method : String;
	var ?mode : RequestMode;
	var ?observe : haxe.extern.EitherType<FetchObserver -> Void, ObserverCallback>;
	var ?redirect : RequestRedirect;
	var ?referrer : String;
	var ?referrerPolicy : ReferrerPolicy;
	var ?signal : AbortSignal;
}
@:native("Request")
extern class Request {



    var body(default,null):ReadableStream;
	/**
		Contains the request's method (`GET`, `POST`, etc.)
	**/
	var method(default,null) : String;

	/**
		Contains the URL of the request.
	**/
	var url(default,null) : String;

	/**
		Contains the associated `Headers` object of the request.
	**/
	var headers(default,null) : Headers;

	/**
		Returns a string from the `RequestDestination` enum describing the request's destination. This is a string indicating the type of content being requested.
	**/
	var destination(default,null) : RequestDestination;

	/**
		Contains the referrer of the request (e.g., `client`).
	**/
	var referrer(default,null) : String;

	/**
		Contains the referrer policy of the request (e.g., `no-referrer`).
	**/
	var referrerPolicy(default,null) : ReferrerPolicy;

	/**
		Contains the mode of the request (e.g., `cors`, `no-cors`, `same-origin`, `navigate`.)
	**/
	var mode(default,null) : RequestMode;

	/**
		Contains the credentials of the request (e.g., `"omit"`, `"same-origin"`, `"include"`). The default is `"same-origin"`.
	**/
	var credentials(default,null) : RequestCredentials;

	/**
		Contains the cache mode of the request (e.g., `default`, `reload`, `no-cache`).
	**/
	var cache(default,null) : RequestCache;

	/**
		Contains the mode for how redirects are handled. It may be one of `follow`, `error`, or `manual`.
	**/
	var redirect(default,null) : RequestRedirect;

	/**
		Contains the subresource integrity value of the request (e.g., `sha256-BpfBw7ivV8q2jLiT13fxDYAe2tJllusRSZ273h2nFSE=`).
	**/
	var integrity(default,null) : String;
	var signal(default,null) : AbortSignal;
	var bodyUsed(default,null) : Bool;

	/** @throws DOMError */
	@:overload( function( input : String, ?init : RequestInit) : Request {} )
	function new( input : Request, ?init : RequestInit ) : Void;

	/**
		Creates a copy of the current `Request` object.
		@throws DOMError
	**/
	function clone() : Request;
	/** @throws DOMError */
	function arrayBuffer() : Promise<js.lib.ArrayBuffer>;
	/** @throws DOMError */
	function blob() : Promise<Blob>;
	/** @throws DOMError */
	function formData() : Promise<FormData>;
	/** @throws DOMError */
	function json() : Promise<Dynamic>;
	/** @throws DOMError */
	function text() : Promise<String>;
}