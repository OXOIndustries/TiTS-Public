package classes.UIComponents 
{
	import flash.text.StyleSheet;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.TextFormatDisplay;
	import flash.text.Font;
	
	/**
	 * Static class-like interface to centralise UI display settings & associated formatting.
	 * Fen mentioned maybe possibly adding the capability to re-style the UI at run-time, at least as far as colours (and maybe fonts) goes,
	 * so I'm setting this up now. I'm using it for custom components that I'm building, so it saves having to convert them over later.
	 * 
	 * Some (most) of these settings will need to be updated to match the "Tits standard"
	 * @author Gedan
	 */
	public class UIStyleSettings 
	{
		
		/**
		 * This is a bullshit method of getting incremental colours from debug usage when laying out items. The FlashCC compiler settings need to be modified in the FLA
		 * file for this to work when using it as the project compiler...
		 */
		/*CONFIG::debug {
			private static var bkgIndex:int = 0;
			
			public static function get gPaneBackgroundColour():uint
			{
				bkgIndex++;
				
				if (bkgIndex == 1) return 0xFF0000;
				if (bkgIndex == 2) return 0x00FF00;
				if (bkgIndex == 3) return 0x0000FF;
				if (bkgIndex == 4) return 0xFFFF00;
				if (bkgIndex == 5) return 0xFF00FF;
				
				bkgIndex = 0;
				return 0x00FFFF;
			}
		}
		
		CONFIG::release	{
			public static var gPaneBackgroundColour:uint = 0x1C1C1C;
		}*/
		
		// TITS VALUES
		public static var gBackgroundColour:uint 			= 0x3D5174; // Stage colour, also used for menu button backgrounds
		public static var gForegroundColour:uint			= 0x333E52; // Pane colour (background of left/right bar);
		public static var gHighlightColour:uint				= 0x8D31B0; // Fancy schmancy highlights (the purple)
		
		// VALUES I PULLED OUTTA MY ASS THAT SOMEBODY WHO CAN ACTUALLY DO UI DESIGN SHOULD PROBABLY LOOK AT
		public static var gStatusGoodColour:uint			= 0x0CD71C;
		public static var gStatusBadColour:uint				= 0xFF0000;
		public static var gTheColourOfDebug:uint 			= 0xFFA90A;
		
		// RANDOM VALUES I STOLE FROM BAD SHIT I WROTE IN THE PAST etc
		public static var gDebugPaneBackgroundColour:uint 	= 0xFF0000;
		public static var gMainTextColour:uint   			= 0xFFFFFF;
		public static var gUIBarTextColour:uint  			= 0xFFFFFF;
		public static var gStatusBarTextColour:uint 		= 0xFFFFFF;
		
		// Font Faces
		private static var _gFontFace1:Font;
		public static function get gFontFace1():Font
		{
			if (!UIStyleSettings._gFontFace1)
			{
				UIStyleSettings._gFontFace1 = new Font1;
			}
			return UIStyleSettings._gFontFace1;
		}
		
		// Text formatters
		private static var _gNameHeaderFormatter:TextFormat = undefined;
		public static function get gNameHeaderFormatter():TextFormat 
		{
			if (UIStyleSettings._gNameHeaderFormatter == undefined)
			{
				UIStyleSettings._gNameHeaderFormatter = new TextFormat();
				UIStyleSettings._gNameHeaderFormatter.size = 25;
				UIStyleSettings._gNameHeaderFormatter.color = 0xFFFFFF;
				UIStyleSettings._gNameHeaderFormatter.align = TextFormatAlign.LEFT;
				UIStyleSettings._gNameHeaderFormatter.font = UIStyleSettings.gFontFace1.fontName;
			}
			return UIStyleSettings._gNameHeaderFormatter;
		}
		
		private static var _gStatBlockHeaderFormatter:TextFormat = undefined;
		public static function get gStatBlockHeaderFormatter():TextFormat 
		{
			if (UIStyleSettings._gStatBlockHeaderFormatter == undefined)
			{
				UIStyleSettings._gStatBlockHeaderFormatter = new TextFormat();
				UIStyleSettings._gStatBlockHeaderFormatter.size = 14;
				UIStyleSettings._gStatBlockHeaderFormatter.color = 0xFFFFFF;
				UIStyleSettings._gStatBlockHeaderFormatter.align = TextFormatAlign.LEFT;
				UIStyleSettings._gStatBlockHeaderFormatter.font = UIStyleSettings.gFontFace1.fontName;
			}
			return UIStyleSettings._gStatBlockHeaderFormatter;
		}
	}

}