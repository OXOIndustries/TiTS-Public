package classes.Resources.ImagePack 
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Gedan
	 */
	public class ImageContainer extends MovieClip
	{
		protected var imageT:Class = null;
		public var bmp:Bitmap;
		private var bigI:BigImageContainer;
		
		public function ImageContainer() 
		{
			super();
			bmp = new imageT();
			bmp.smoothing = true;
			this.addChild(bmp);
			this.addEventListener(MouseEvent.CLICK, click4Big);
			this.addEventListener(Event.REMOVED_FROM_STAGE, cleanupImage);
			this.buttonMode = true;
		}

		public function click4Big(e:Event = null):void
		{
			if (stage.getChildByName("bigImage") == null)
			{
				bigI = new BigImageContainer(imageT);
				this.stage.addChild(bigI);
			}
		}
		
		private function cleanupImage(e:Event = null):void
		{
			if (bigI != null)
			{
				bigI.closeBig();
			}
		}
	}

}