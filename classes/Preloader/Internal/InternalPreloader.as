package classes.Preloader.Internal 
{
	import classes.Preloader.BasePreloader;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.IOErrorEvent;
	import flash.utils.getDefinitionByName;
	import classes.Util.log;
	
	/**
	 * ...
	 * @author Gedan
	 */
	[SWF(wmode="direct")]
	public class InternalPreloader extends BasePreloader
	{
		
		public function InternalPreloader() 
		{
			
		}
		
		override public function beginLoad():void
		{
			addEventListener(Event.ENTER_FRAME, CheckFrames);
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgressUpdate);
			loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
		}
		
		private function onIOError(e:IOErrorEvent):void
		{
			log(e.text);
		}
		
		private function onProgressUpdate(e:ProgressEvent):void
		{
			displayLoadState(e.bytesLoaded, e.bytesTotal);
		}
		
		private function CheckFrames(e:Event):void
		{
			if (currentFrame == totalFrames)
			{
				loadComplete();
			}
		}
		
		override public function loadComplete():void
		{
			stop();
			stop();
			
			removeEventListener(Event.ENTER_FRAME, CheckFrames);
			loaderInfo.removeEventListener(ProgressEvent.PROGRESS, onProgressUpdate);
			loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);
			
			var rootClass:Class = getDefinitionByName("classes.TiTS") as Class;
			stage.addChild(new rootClass() as DisplayObject);
			
			if (parent is Loader)
			{
				parent.parent.removeChild(parent);
			}
			else
			{
				parent.removeChild(this);
			}

		}
		
	}

}