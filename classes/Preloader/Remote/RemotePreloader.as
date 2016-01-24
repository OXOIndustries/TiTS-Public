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
			
			var targetURL:URLRequest = new URLRequest("https://www.fenoxo.com/play/latest_remote.php");
			
			stage.addChild(fileLoader);
			fileLoader.load(targetURL);
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