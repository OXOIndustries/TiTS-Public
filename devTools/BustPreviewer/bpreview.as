package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Loader;
	import flash.display.DisplayObject;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.display.Bitmap;
	import flash.display.BitmapData;	
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	
	public class bpreview extends MovieClip {
		
		var image:Bitmap;
		var imageBD:BitmapData;
		var testImage:Bitmap;
		var testImageMask:Sprite;
		var loader:Loader;
		
		var largeImageBlock:Sprite;
		var bkgSprite:Sprite;
		
		var cropTopBar:Sprite;
		var cropBottomBar:Sprite;
		var cropLeftBar:Sprite;
		var cropRightBar:Sprite;
		
		public function bpreview() {
			testImageMask = new Sprite();
			testImageMask.graphics.beginFill(0xFFFFFF, 1);
			testImageMask.graphics.drawRect(0, 0, 189, 150);
			testImageMask.graphics.endFill();
			testImageMask.x = 0;
			testImageMask.y = 5;			
			
			reloadImage.addEventListener(MouseEvent.CLICK, loadImage);
			reloadImage.mouseChildren = false;
			reloadImage.buttonMode = true;
			
			testCrop.addEventListener(MouseEvent.CLICK, generateBust);
			testCrop.mouseChildren = false;
			testCrop.buttonMode = true;
			
			largeImageBlock = new Sprite();
			this.addChild(largeImageBlock);
			largeImageBlock.x = 200;
			
/*			cropTopBar = new Sprite();
			cropTopBar.graphics.beginFill(0x00FF00);
			cropTopBar.graphics.drawRect(0, 0, 1000, 5);
			cropTopBar.graphics.endFill();
			
			cropTopBar.addEventListener(MouseEvent.MOUSE_DOWN, dragTopBar);
			cropTopBar.addEventListener(MouseEvent.MOUSE_UP, onStopDrag);
			
			cropBottomBar = new Sprite();
			cropBottomBar.graphics.beginFill(0x00FF00);
			cropBottomBar.graphics.drawRect(0, 0, 1000, 5);
			
			cropBottomBar.addEventListener(MouseEvent.MOUSE_DOWN, dragBottomBar);
			cropBottomBar.addEventListener(MouseEvent.MOUSE_UP, onStopDrag);
			
			cropLeftBar = new Sprite();
			cropLeftBar.graphics.beginFill(0xFF00FF);
			cropLeftBar.graphics.drawRect(0, 0, 5, 800);
			cropLeftBar.graphics.endFill();
			
			cropLeftBar.addEventListener(MouseEvent.MOUSE_DOWN, dragLeftBar);
			cropLeftBar.addEventListener(MouseEvent.MOUSE_UP, onStopDrag);
			
			cropRightBar = new Sprite();
			cropRightBar.graphics.beginFill(0xFF00FF);
			cropRightBar.graphics.drawRect(0, 0, 5, 800);
			cropRightBar.graphics.endFill();
			
			cropRightBar.addEventListener(MouseEvent.MOUSE_DOWN, dragRightBar);
			cropRightBar.addEventListener(MouseEvent.MOUSE_UP, onStopDrag);
			
			largeImageBlock.addChild(cropTopBar);
			largeImageBlock.addChild(cropBottomBar);
			largeImageBlock.addChild(cropLeftBar);
			largeImageBlock.addChild(cropRightBar);*/
		}
		
/*		public function onStopDrag(e:MouseEvent):void {
			e.target.stopDrag();
			trace(e.target.x);
			trace(e.target.y);
		}
			
		public function dragTopBar(e:Event):void {
			var bounds:Rectangle = new Rectangle(0, image.y, 1, cropBottomBar.y - cropTopBar.height);
			cropTopBar.startDrag(false, bounds);
		}
		
		public function dragBottomBar(e:Event):void {
			var bounds:Rectangle = new Rectangle(0, cropTopBar.y + cropTopBar.height, 1, image.y + image.height);
			cropBottomBar.startDrag(false, bounds);
		}
		
		public function dragLeftBar(e:Event):void {
			var bounds:Rectangle = new Rectangle(image.x, 0, image.width, 1);
			trace(cropRightBar.x);
			cropLeftBar.startDrag(false, bounds);
		}
		
		public function dragRightBar(e:Event):void {
			var bounds:Rectangle = new Rectangle(image.x, 0, image.width, 1);
			trace(image.x + image.width);
			cropRightBar.startDrag(false, bounds);
		}*/
		
		public function loadImage(e:Event = null):void {
			loader = new Loader();
			var req:URLRequest = new URLRequest("preview.png");
			req.method = URLRequestMethod.POST;
			req.data = true;
			
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, doneLoad);
			
			loader.load(req);
		}
		
		private function doneLoad(e:Event):void {
			imageBD = Bitmap(loader.content).bitmapData.clone();
			generateLargeImageBlock();
			generateBust();
		}
		
		public function generateBust(e:Event = null):void {
			if (testImage != null && testImage.parent != null) testImage.parent.removeChild(testImage);
			if (testImage != null && testImage.mask != null) testImage.mask = null;
			if (testImage != null) testImage.bitmapData.dispose();
			
			testImage = new Bitmap();
			testImage.bitmapData = imageBD.clone();
			testImage.smoothing = true;
			testImage.pixelSnapping = "never";
			
			testImage.scaleX = testImage.scaleY = 1.0;
			var sH:Number = 150 / testImage.height;
			testImage.scaleX = testImage.scaleY = sH;
			
			
			if (testImageMask.parent == null) leftBar.addChild(testImageMask);
			leftBar.addChild(testImage);
			testImage.mask = testImageMask;
			testImage.x = 15;
			testImage.y = 10;
			
			trace(testImage.x + " " + testImage.y);
		}
		
		public function generateLargeImageBlock():void {
			if (image != null && image.parent != null) largeImageBlock.removeChild(image);
			
			image = new Bitmap();
			image.bitmapData = imageBD.clone();
			(image as Bitmap).smoothing = true;
			
			var sW:Number = 1000 / image.width;
			var sH:Number = 800 / image.height;
			
			if (sW < sH)
			{
				image.scaleX = image.scaleY = sW;
			}
			else
			{
				image.scaleX = image.scaleY = sH;
			}
			
			var pX:Number = (1000 - image.width) / 2;
			var pY:Number = (800 - image.height) / 2;
			
			image.x = pX;
			image.y = pY;
			
			if (bkgSprite != null && bkgSprite.parent != null) largeImageBlock.removeChild(bkgSprite);
			
			bkgSprite = new Sprite();
			bkgSprite.graphics.beginFill(0x333E52);
			bkgSprite.graphics.drawRect(image.x, image.y, image.width, image.height);
			bkgSprite.graphics.endFill();
			largeImageBlock.addChild(bkgSprite);
			
			largeImageBlock.addChild(image);
			
/*			cropTopBar.x = 0;
			cropTopBar.y = image.y;
			
			cropBottomBar.x = 0;
			cropBottomBar.y = image.y + image.height - cropBottomBar.height;
			
			cropLeftBar.x = image.x;
			cropLeftBar.y = 0;
			
			cropRightBar.x = image.x + image.width - cropRightBar.width;
			cropRightBar.y = 0;*/
			
/*			largeImageBlock.setChildIndex(cropTopBar, largeImageBlock.numChildren - 1);
			largeImageBlock.setChildIndex(cropBottomBar, largeImageBlock.numChildren - 1);
			largeImageBlock.setChildIndex(cropLeftBar, largeImageBlock.numChildren - 1);
			largeImageBlock.setChildIndex(cropRightBar, largeImageBlock.numChildren - 1);*/
		}
	}
	
}
