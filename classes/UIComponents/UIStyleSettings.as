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
	 * 
	 * If I can work out how to do ObserverPattern style databindings, I can probably rig up all of the UI classes to recolour themselves if and when
	 * the properties here get changed; so styling the UI at runtime would just need an interface adding to change these values. Neat, huh?
	 * @author Gedan
	 */
	public class UIStyleSettings 
	{
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
		
		private static var _gTooltipHeaderFormatter:TextFormat = undefined;
		public static function get gTooltipHeaderFormatter():TextFormat 
		{
			if (UIStyleSettings._gTooltipHeaderFormatter == undefined)
			{
				UIStyleSettings._gTooltipHeaderFormatter = new TextFormat();
				UIStyleSettings._gTooltipHeaderFormatter.size = 18;
				UIStyleSettings._gTooltipHeaderFormatter.color = 0xFFFFFF;
				UIStyleSettings._gTooltipHeaderFormatter.align = TextFormatAlign.LEFT;
				UIStyleSettings._gTooltipHeaderFormatter.font = UIStyleSettings.gFontFace1.fontName;
			}
			return UIStyleSettings._gTooltipHeaderFormatter;
		}
	}

}