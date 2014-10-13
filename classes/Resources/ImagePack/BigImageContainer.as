package classes.Resources.ImagePack 
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import classes.UIComponents.UIStyleSettings;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class BigImageContainer extends MovieClip
	{
		public var bmp:Bitmap;
		public function BigImageContainer(imageT:Class) 
		{
			super();
			bmp = new imageT();
			bmp.smoothing = true;
			this.addChild(bmp);
			this.addEventListener(MouseEvent.CLICK, closeBig);
			this.addEventListener(Event.ADDED_TO_STAGE, configureContainer);
			this.buttonMode = true;
			this.name = "bigImage";
		}
		
		private function configureContainer(e:Event = null):void
		{
			// Scale
			var scale:Number = 1.0;
			
			if (bmp.width > 1184)
			{
				scale = 1184 / bmp.width;
			}
			
			if (bmp.height * scale > 784)
			{
				scale = 784 / bmp.height;
			}
			
			// Add an element behind the image to serve as a border
			var bg:Sprite = new Sprite();
			bg.graphics.beginFill(UIStyleSettings.gForegroundColour);
			bg.graphics.drawRect(0, 0, (bmp.width * scale) + 16, (bmp.height * scale) + 16);
			bg.graphics.endFill();
			this.addChildAt(bg, 0);
			
			this.bmp.width *= scale;
			this.bmp.height *= scale;
			this.bmp.x = 8;
			this.bmp.y = 8;
			
			// Position
			var padX:Number = (1200 - this.width) / 2;
			var padY:Number = (800 - this.height) / 2;
			
			this.x = padX;
			this.y = padY;
		}
		
		public function closeBig(e:Event = null):void
		{
			this.removeEventListener(MouseEvent.CLICK, closeBig);
			this.removeEventListener(MouseEvent.CLICK, configureContainer);
			if (this.parent != null) this.parent.removeChild(this);
		}
	}

}