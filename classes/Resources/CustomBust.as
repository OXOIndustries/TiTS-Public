package classes.Resources 
{
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	import flash.utils.getQualifiedClassName;
	import classes.kGAMECLASS;
	
	/**
	 * ...
	 * @author adev
	 */
	public class CustomBust extends Sprite 
	{
		
		public function CustomBust(bustName:String, embedded:Class) 
		{
			super();
			_bustName = bustName;
			_embedded = embedded;
			var info:Object = Cache[ bustName ];
			if (!info)
			{
				info = Cache[ bustName ] = { flags: 0 };
			}
			if ( info.flags == 2 )
			{ _bustId = bustName; }
			else
			{ _bustId = getQualifiedClassName(embedded); }
		}
		
		private static var Cache:Object = {};
		
		private var _bustName:String;
		private var _bustId:String;
		public function get bustId():String { return _bustId; }
		
		private var _embedded:Class;
		
		public function init():void
		{
			var info:Object = Cache[ _bustName ];
			
			if ( info.flags == 2 ) // custom file exists
			{
				tryLoad();
			}
			else
			{
				var bustObj:Bitmap = new _embedded();
				bustObj.smoothing = true;
				this.addChild(bustObj);
				
				if ( info.flags == 0 ) // never tried to load before
				{ tryLoad(); }
			}
		}
		private function tryLoad():void
		{
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIoError);
			var urlReq:URLRequest = new URLRequest('custom_busts/Bust_' + _bustName + '.png');
			loader.load(urlReq);
		}
		private function onLoadComplete(event:Event):void
		{
			Cache[ _bustName ].flags = 2;
			_bustId = _bustName;
			var yoff:Number = this.y + this.height;
			while (this.numChildren)
			{ this.removeChildAt(this.numChildren - 1); }
			var myimage:Bitmap = event.target.content as Bitmap;
			myimage.smoothing = true;
			this.addChild(myimage);
			this.y = yoff - this.height;
		}
		private function onIoError(event:Event):void
		{
			Cache[ _bustName ].flags = 1;
		}
	}

}