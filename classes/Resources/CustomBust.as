package classes.Resources 
{
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	import flash.utils.getQualifiedClassName;
	import classes.kGAMECLASS;
	import flash.system.Security;
	import classes.Engine.Interfaces.output;
	
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
		
		private static var Enabled:Boolean = true;
		
		private static var Cache:Object = {};
		
		private var _bustName:String;
		private var _bustId:String;
		public function get bustId():String { return _bustId; }
		
		private var _embedded:Class;
		
		public function init():void
		{
			var info:Object = Cache[ _bustName ];
			
			if ( info.flags == 2 ) // custom file exists and can be loaded
			{
				tryLoad();
			}
			else
			{
				var bustObj:Bitmap = new _embedded();
				bustObj.smoothing = true;
				this.addChild(bustObj);
				
				if (Enabled && !IsRemoteSandbox && info.flags == 0) // never tried to load before
				{ 
					tryLoad(); 
				}
			}
		}
		
		private function get IsRemoteSandbox():Boolean
		{
			return Security.sandboxType == Security.REMOTE;
		}
		
		private function tryLoad():void
		{
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIoError);
			loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
			var urlReq:URLRequest = new URLRequest('custom_busts/Bust_' + _bustName + '.png');
			loader.load(urlReq);
		}
		private function onLoadComplete(event:Event):void
		{
			try
			{
				var yoff:Number = this.y + this.height;
				while (this.numChildren)
				{ this.removeChildAt(this.numChildren - 1); }
				var myimage:Bitmap = event.target.content as Bitmap; // this line causes the security error 2148
				// local file access is not allowed, but the error only appears when accessing the result after load complete - very mysterious
				myimage.smoothing = true;
				this.addChild(myimage);
				this.y = yoff - this.height;
				Cache[ _bustName ].flags = 2;
				_bustId = _bustName;
			}
			catch (e:SecurityError)
			{
				kGAMECLASS.output( "<b>[" + e.name + " " + e.message + " loading custom bust]</b>", false, false );
				Cache[ _bustName ].flags = 4;
				_bustId = ""; // invalidate id so that it is replaced by embedded bust ASAP
			}
		}
		private function onIoError(event:Event):void
		{
			//kGAMECLASS.output( "<b>[" + event + " loading custom bust]</b>", false, false );
			Cache[ _bustName ].flags = 1;
		}
		private function onSecurityError(event:SecurityErrorEvent):void
		{
			kGAMECLASS.output( "<b>[" + event + " loading custom bust]</b>", false, false );
			Cache[ _bustName ].flags = 4;
		}
		
		public static function customBustLoaded(bustName:String):Boolean
		{
			var info:Object = Cache[ bustName ];
			
			return info && info.flags == 2;
		}
		
		// flags selects which status is reported
		// by default only loaded(override) and security errors are reported
		// io errors (file not found) are omitted
		public static function customBustStatus(bustName:String, flags:int = 6):String
		{
			var info:Object = Cache[ bustName ];
			var res:String = "";
			
			if ( info && info.flags & flags )
			{
				switch (info.flags)
				{
					case 1:
						res = "(Custom bust not loaded.)";
						break;
					case 2:
						res = "(Custom bust overrides selection.)";
						break;
					case 4:
						res = "(SecurityError prevented loading of custom bust.)";
						break;
				}
			}
			
			return res;
		}
	}

}
