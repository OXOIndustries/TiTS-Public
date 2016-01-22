package classes.Preloader.Remote 
{
	import classes.Preloader.BasePreloader;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLVariables;
	import flash.net.URLRequestMethod;
	import flash.utils.ByteArray;
	import flash.system.Security;
	import classes.Util.log;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class RemotePreloader extends BasePreloader
	{
		
		public function RemotePreloader() 
		{
			Security.allowDomain("*");
		}
		
		private var fileLoader:Loader;
		
		override public function beginLoad():void
		{
			fileLoader = new Loader();
			fileLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgressUpdate);
			fileLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
			
			//var targetURL:URLRequest = new URLRequest("https://www.fenoxo.com/play/latest.php" /*?t=" + new Date().time*/);
			//var requestHeaders:URLRequestHeader = new URLRequestHeader("pragma", "no-cache");
			var request:URLRequest = new URLRequest("http://gedan.co.uk/tits/latest.php");
			//request.data = new URLVariables("cache=no+cache");
			//request.method = URLRequestMethod.POST;
			//request.requestHeaders.push(requestHeaders);
			
			stage.addChild(fileLoader);
			fileLoader.load(request);
		}
		
		private function onProgressUpdate(e:ProgressEvent):void
		{
			displayLoadState(e.bytesLoaded, e.bytesTotal);
		}
		
		private function onLoadComplete(e:Event):void
		{
			loadComplete();
		}
		
		override public function loadComplete():void
		{
			parent.removeChild(this);
		}
		
	}

}