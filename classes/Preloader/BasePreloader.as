package classes.Preloader 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.AntiAliasType;
	/**
	 * ...
	 * @author Gedan
	 */
	public class BasePreloader extends Sprite
	{
		// These settings are stolen from UIComponents to minimise the size of the preloader by not having to include it
		private static const gBackgroundColour:uint = 0x3D5174;
		private static const gForegroundColour:uint = 0x333E52;
		private static const gHighlightColour:uint = 0x8D31B0;
		
		[Embed(source = "../../assets/Univers 59 Ultra Condensed.ttf", fontName = "Univers UltraCondensed", advancedAntiAliasing = true, mimeType = "application/x-font-truetype", embedAsCFF = false, unicodeRange = "U+0025, U+002e, U+0030-U+0039, U+0041, U+0043-U+0045, U+0047, U+0049, U+004c-U+0050, U+0054, U+0062, U+006b")]
		private static const UniversFont:String;
		
		private static var _gPreloaderStateFrontFormatter:TextFormat;
		public static function get gPreloaderStateFrontFormatter():TextFormat
		{
			if (_gPreloaderStateFrontFormatter == null)
			{
				_gPreloaderStateFrontFormatter = new TextFormat();
				_gPreloaderStateFrontFormatter.size = 69;
				_gPreloaderStateFrontFormatter.color = gForegroundColour;
				_gPreloaderStateFrontFormatter.align = TextFormatAlign.LEFT;
				_gPreloaderStateFrontFormatter.font = "Univers UltraCondensed";
				_gPreloaderStateFrontFormatter.kerning = true;
			}
			return _gPreloaderStateFrontFormatter;
		}
		private static var _gPreloaderStateBackFormatter:TextFormat;
		public static function get gPreloaderStateBackFormatter():TextFormat
		{
			if (_gPreloaderStateBackFormatter == null)
			{
				_gPreloaderStateBackFormatter = new TextFormat();
				_gPreloaderStateBackFormatter.size = 69;
				_gPreloaderStateBackFormatter.color = gBackgroundColour;
				_gPreloaderStateBackFormatter.align = TextFormatAlign.LEFT;
				_gPreloaderStateBackFormatter.font = "Univers UltraCondensed";
				_gPreloaderStateBackFormatter.kerning = true;
			}
			return _gPreloaderStateBackFormatter;
		}
		private static var _gPreloaderStatePercentFormatter:TextFormat;
		public static function get gPreloaderStatePercentFormatter():TextFormat
		{
			if (_gPreloaderStatePercentFormatter == null)
			{
				_gPreloaderStatePercentFormatter = new TextFormat();
				_gPreloaderStatePercentFormatter.size = 69;
				_gPreloaderStatePercentFormatter.color = 0xFFFFFF;
				_gPreloaderStatePercentFormatter.align = TextFormatAlign.RIGHT;
				_gPreloaderStatePercentFormatter.font = "Univers UltraCondensed";
				_gPreloaderStatePercentFormatter.kerning = true;
			}
			return _gPreloaderStatePercentFormatter;
		}
		
		[Embed(source = "../../assets/images/logos/steele_tech_logo_a.png")]
		public var STEELE_LOGO:Class;
		
		private var _steeleLogo:Bitmap;
		
		private var _progressBar:Sprite;
		private var _maskBar:Sprite;
		private var _barMaxWidth:int = 800;
		
		private var _loadTextBack:TextField;
		private var _loadTextFront:TextField;
		private var _loadPercent:TextField;
		
		public function BasePreloader() 
		{
			BuildDisplay();
			beginLoad();
		}
		
		private function BuildDisplay():void
		{
			_steeleLogo = new STEELE_LOGO();
			_steeleLogo.smoothing = true;
			_steeleLogo.width = 800;
			_steeleLogo.height = 533;
			_steeleLogo.x = 200;
			_steeleLogo.y = 75;
			addChild(_steeleLogo);
			
			var backBar:Sprite = new Sprite();
			backBar.graphics.beginFill(gForegroundColour);
			backBar.graphics.drawRect(0, 0, 804, 54);
			backBar.graphics.endFill();
			backBar.x = 198;
			backBar.y = 623;
			addChild(backBar);
			
			_progressBar = new Sprite();
			_progressBar.graphics.beginFill(gHighlightColour);
			_progressBar.graphics.drawRect(0, 0, 1, 50);
			_progressBar.graphics.endFill();
			_progressBar.x = 200;
			_progressBar.y = 625;
			_progressBar.width = 0;
			addChild(_progressBar);
			
			_maskBar = new Sprite();
			_maskBar.graphics.beginFill(0xFFFFFF);
			_maskBar.graphics.drawRect(0, 0, 1, 50);
			_maskBar.graphics.endFill();
			_maskBar.x = 200;
			_maskBar.y = 625;
			_maskBar.width = 0;
			addChild(_maskBar);
			
			_loadTextBack = new TextField();
			_loadTextBack.x = 200;
			_loadTextBack.y = 609;
			_loadTextBack.width = 800;
			_loadTextBack.height = 75;
			_loadTextBack.defaultTextFormat = gPreloaderStateBackFormatter;
			_loadTextBack.embedFonts = true;
			_loadTextBack.antiAliasType = AntiAliasType.ADVANCED;
			_loadTextBack.text = "LOADING...";
			_loadTextBack.mouseEnabled = false;
			_loadTextBack.mouseWheelEnabled = false;
			addChild(_loadTextBack);
			
			_loadTextFront = new TextField();
			_loadTextFront.x = 200;
			_loadTextFront.y = 609;
			_loadTextFront.width = 800;
			_loadTextFront.height = 75;
			_loadTextFront.defaultTextFormat = gPreloaderStateFrontFormatter;
			_loadTextFront.embedFonts = true;
			_loadTextFront.antiAliasType = AntiAliasType.ADVANCED;
			_loadTextFront.text = "LOADING...";
			_loadTextFront.mouseEnabled = false;
			_loadTextFront.mouseWheelEnabled = false;
			_loadTextFront.mask = _maskBar;
			addChild(_loadTextFront);
			
			_loadPercent = new TextField();
			_loadPercent.x = 200;
			_loadPercent.y = 609;
			_loadPercent.width = 800;
			_loadPercent.height = 75;
			_loadPercent.defaultTextFormat = gPreloaderStatePercentFormatter;
			_loadPercent.embedFonts = true;
			_loadPercent.antiAliasType = AntiAliasType.ADVANCED;
			_loadPercent.text = "0";
			_loadPercent.mouseEnabled = false;
			_loadPercent.mouseWheelEnabled = false;
			addChild(_loadPercent);
		}
		
		public function displayLoadState(currentSize:Number, maxSize:Number):void
		{
			var percent:Number = 0;
			
			if (currentSize > 0 && maxSize > 0)
			{
				percent = currentSize / maxSize;
			}
			
			if (_progressBar && _maskBar && _loadPercent)
			{
				_maskBar.width = _progressBar.width = percent * _barMaxWidth;
				
				var percDisplay:int = percent * 100;
				_loadPercent.text = String(percDisplay);
			}
		}
		
		public function beginLoad():void
		{
			throw new Error("Override me.");
		}
		
		public function loadComplete():void
		{
			throw new Error("Override me.");
		}
	}

}