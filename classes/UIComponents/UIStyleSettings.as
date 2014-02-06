package classes.UIComponents 
{
	import flash.filters.GlowFilter;
	import flash.geom.ColorTransform;
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
		// Static init backing storage for stuff
		{
			UIStyleSettings._gNameHeaderFormatter = null;
			UIStyleSettings._gStatBlockHeaderFormatter = null;
			UIStyleSettings._gTooltipHeaderFormatter = null;
			UIStyleSettings._gLocationBlockRoomFormatter = null;
			UIStyleSettings._gLocationBlockPlanetSystemFormatter = null;
			UIStyleSettings._gGeneralInfoLabelFormatter = null;
			UIStyleSettings._gGeneralInfoValueFormatter = null;
			UIStyleSettings._gSceneByLabelFormatter = null;
			UIStyleSettings._gSceneByValueFormatter = null;
			UIStyleSettings._gRoomLocationTextGlow = null;
			UIStyleSettings._gButtonGlow = null;
			UIStyleSettings._gFadeOutColourTransform = null;
			UIStyleSettings._gWhiteColourTransform = null;
		}
		
		// TITS VALUES
		public static var gBackgroundColour:uint 			= 0x3D5174; // Stage colour, also used for menu button backgrounds
		public static var gForegroundColour:uint			= 0x333E52; // Pane colour (background of left/right bar) -- this was also used for some fade-out colour transforms throughout various parts of the UI code
		public static var gHighlightColour:uint				= 0x8D31B0; // Fancy schmancy highlights (the purple)
		// public static var gPurpleGlowColour:uint			= 0x84449B; // The glow colour for button highlights was slightly different. Here for documentation purposes
		
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
		[Embed(source = "../../assets/Lato-Regular.ttf", fontName = "Lato", advancedAntiAliasing = true, mimeType = "application/x-font-truetype", embedAsCFF = false)]
		public static const LatoTTF:String;
		
		[Embed(source = "../../assets/Lato-Italic.ttf", fontStyle="italic", fontName = "Lato", advancedAntiAliasing = true, mimeType = "application/x-font-truetype", embedAsCFF = false)]
		public static const LatoItalicTTF:String;
		
		[Embed(source = "../../assets/Lato-Bold.ttf", fontWeight = "bold", fontName = "Lato", advancedAntiAliasing = true, mimeType = "application/x-font-truetype",
		embedAsCFF = false)]
		public static const LatoBoldTTF:String;
		
		[Embed(source = "../../assets/Lato-BoldItalic.ttf", fontWeight = "bold", fontStyle = "italic", fontName = "Lato", advancedAntiAliasing = true, mimeType = "application/x-font-truetype", embedAsCFF = false)]
		public static const LatoBoldItalicTFF:String;
		
		[Embed(source = "../../assets/Univers 59 Ultra Condensed.ttf", fontName = "Univers UltraCondensed", advancedAntiAliasing = true, mimeType = "application/x-font-truetype", embedAsCFF = false)]
		public static const UniverseUltraCondensedTFF:String;
		
		// Text formatters
		private static var _gNameHeaderFormatter:TextFormat;
		public static function get gNameHeaderFormatter():TextFormat 
		{
			if (UIStyleSettings._gNameHeaderFormatter == null)
			{
				UIStyleSettings._gNameHeaderFormatter = new TextFormat();
				UIStyleSettings._gNameHeaderFormatter.size = 25;
				UIStyleSettings._gNameHeaderFormatter.color = 0xFFFFFF;
				UIStyleSettings._gNameHeaderFormatter.align = TextFormatAlign.LEFT;
				UIStyleSettings._gNameHeaderFormatter.font = "Lato";
				UIStyleSettings._gNameHeaderFormatter.bold = true;
			}
			return UIStyleSettings._gNameHeaderFormatter;
		}
		
		private static var _gStatBlockHeaderFormatter:TextFormat;
		public static function get gStatBlockHeaderFormatter():TextFormat 
		{
			if (UIStyleSettings._gStatBlockHeaderFormatter == null)
			{
				UIStyleSettings._gStatBlockHeaderFormatter = new TextFormat();
				UIStyleSettings._gStatBlockHeaderFormatter.size = 14;
				UIStyleSettings._gStatBlockHeaderFormatter.color = 0xFFFFFF;
				UIStyleSettings._gStatBlockHeaderFormatter.align = TextFormatAlign.LEFT;
				UIStyleSettings._gStatBlockHeaderFormatter.font = "Lato";
				UIStyleSettings._gStatBlockHeaderFormatter.bold = true;
			}
			return UIStyleSettings._gStatBlockHeaderFormatter;
		}
		
		private static var _gTooltipHeaderFormatter:TextFormat;
		public static function get gTooltipHeaderFormatter():TextFormat 
		{
			if (UIStyleSettings._gTooltipHeaderFormatter == null)
			{
				UIStyleSettings._gTooltipHeaderFormatter = new TextFormat();
				UIStyleSettings._gTooltipHeaderFormatter.size = 18;
				UIStyleSettings._gTooltipHeaderFormatter.color = 0xFFFFFF;
				UIStyleSettings._gTooltipHeaderFormatter.align = TextFormatAlign.LEFT;
				UIStyleSettings._gTooltipHeaderFormatter.font = "Lato";
				UIStyleSettings._gTooltipHeaderFormatter.bold = true;
			}
			return UIStyleSettings._gTooltipHeaderFormatter;
		}
		
		private static var _gLocationBlockRoomFormatter:TextFormat;
		public static function get gLocationBlockRoomFormatter():TextFormat 
		{
			if (UIStyleSettings._gLocationBlockRoomFormatter == null)
			{
				UIStyleSettings._gLocationBlockRoomFormatter = new TextFormat();
				UIStyleSettings._gLocationBlockRoomFormatter.size = 37;
				UIStyleSettings._gLocationBlockRoomFormatter.color = 0xFFFFFF;
				UIStyleSettings._gLocationBlockRoomFormatter.align = TextFormatAlign.RIGHT;
				UIStyleSettings._gLocationBlockRoomFormatter.leading = -4;
				UIStyleSettings._gLocationBlockRoomFormatter.font = "Univers UltraCondensed";
			}
			return UIStyleSettings._gLocationBlockRoomFormatter;
		}
		
		private static var _gLocationBlockPlanetSystemFormatter:TextFormat;
		public static function get gLocationBlockPlanetSystemFormatter():TextFormat
		{
			if (UIStyleSettings._gLocationBlockPlanetSystemFormatter == null)
			{
				UIStyleSettings._gLocationBlockPlanetSystemFormatter = new TextFormat();
				UIStyleSettings._gLocationBlockPlanetSystemFormatter.size = 21;
				UIStyleSettings._gLocationBlockPlanetSystemFormatter.color = 0xFFFFFF;
				UIStyleSettings._gLocationBlockPlanetSystemFormatter.align = TextFormatAlign.RIGHT;
				UIStyleSettings._gLocationBlockPlanetSystemFormatter.leading = 8;
				UIStyleSettings._gLocationBlockPlanetSystemFormatter.font = "Univers UltraCondensed";
			}
			return UIStyleSettings._gLocationBlockPlanetSystemFormatter;
		}
		
		private static var _gGeneralInfoLabelFormatter:TextFormat;
		public static function get gGeneralInfoLabelFormatter():TextFormat
		{
			if (UIStyleSettings._gGeneralInfoLabelFormatter == null)
			{
				UIStyleSettings._gGeneralInfoLabelFormatter = new TextFormat();
				UIStyleSettings._gGeneralInfoLabelFormatter.size = 30;
				UIStyleSettings._gGeneralInfoLabelFormatter.color = 0xFFFFFF;
				UIStyleSettings._gGeneralInfoLabelFormatter.align = TextFormatAlign.LEFT;
				UIStyleSettings._gGeneralInfoLabelFormatter.leading = -4;
				UIStyleSettings._gGeneralInfoLabelFormatter.font = "Univers UltraCondensed";
				UIStyleSettings._gGeneralInfoLabelFormatter.kerning = true;
			}
			return UIStyleSettings._gGeneralInfoLabelFormatter;
		}
		
		private static var _gGeneralInfoValueFormatter:TextFormat;
		public static function get gGeneralInfoValueFormatter():TextFormat
		{
			if (UIStyleSettings._gGeneralInfoValueFormatter == null)
			{
				UIStyleSettings._gGeneralInfoValueFormatter = new TextFormat();
				UIStyleSettings._gGeneralInfoValueFormatter.size = 21;
				UIStyleSettings._gGeneralInfoValueFormatter.color = 0xFFFFFF;
				UIStyleSettings._gGeneralInfoValueFormatter.align = TextFormatAlign.RIGHT;
				UIStyleSettings._gGeneralInfoValueFormatter.leading = 11;
				UIStyleSettings._gGeneralInfoValueFormatter.font = "Lato";
				UIStyleSettings._gGeneralInfoValueFormatter.bold = true;
				UIStyleSettings._gGeneralInfoValueFormatter.kerning = true;
			}
			return UIStyleSettings._gGeneralInfoValueFormatter;
		}
		
		private static var _gSceneByLabelFormatter:TextFormat;
		public static function get gSceneByLabelFormatter():TextFormat 
		{
			if (UIStyleSettings._gSceneByLabelFormatter == null)
			{
				UIStyleSettings._gSceneByLabelFormatter = new TextFormat();
				UIStyleSettings._gSceneByLabelFormatter.size = 20;
				UIStyleSettings._gSceneByLabelFormatter.color = 0x999999;
				UIStyleSettings._gSceneByLabelFormatter.align = TextFormatAlign.LEFT;
				UIStyleSettings._gSceneByLabelFormatter.leading = 15;
				UIStyleSettings._gSceneByLabelFormatter.kerning = true;
				UIStyleSettings._gSceneByLabelFormatter.font = "Univers UltraCondensed";
			}
			return UIStyleSettings._gSceneByLabelFormatter;
		}
		
		private static var _gSceneByValueFormatter:TextFormat;
		public static function get gSceneByValueFormatter():TextFormat
		{
			if (UIStyleSettings._gSceneByValueFormatter == null)
			{
				UIStyleSettings._gSceneByValueFormatter = new TextFormat();
				UIStyleSettings._gSceneByValueFormatter.size = 20;
				UIStyleSettings._gSceneByValueFormatter.color = 0xFFFFFF;
				UIStyleSettings._gSceneByValueFormatter.align = TextFormatAlign.RIGHT;
				UIStyleSettings._gSceneByValueFormatter.leading = 15;
				UIStyleSettings._gSceneByValueFormatter.kerning = true;
				UIStyleSettings._gSceneByValueFormatter.font = "Univers UltraCondensed";
			}
			return UIStyleSettings._gSceneByValueFormatter;
		}
		
		// Glows
		private static var _gRoomLocationTextGlow:GlowFilter;
		public static function get gRoomLocationTextGlow():GlowFilter
		{
			if (UIStyleSettings._gRoomLocationTextGlow == null)
			{
				UIStyleSettings._gRoomLocationTextGlow = new GlowFilter(UIStyleSettings.gBackgroundColour, 1, 4, 4, 5, 1, false, false);
			}
			return UIStyleSettings._gRoomLocationTextGlow;
		}
		
		private static var _gButtonGlow:GlowFilter;
		public static function get gButtonGlow():GlowFilter
		{
			if (UIStyleSettings._gButtonGlow == null)
			{
				UIStyleSettings._gButtonGlow = new GlowFilter(UIStyleSettings.gHighlightColour, 1, 10, 10, 5, 1, false, false);
			}
			return UIStyleSettings._gButtonGlow;
		}
		
		// Colour Transforms
		private static var _gFadeOutColourTransform:ColorTransform;
		public static function get gFadeOutColourTransform():ColorTransform
		{
			if (UIStyleSettings._gFadeOutColourTransform == null)
			{
				UIStyleSettings._gFadeOutColourTransform = new ColorTransform();
				UIStyleSettings._gFadeOutColourTransform.color = UIStyleSettings.gForegroundColour;
			}
			return UIStyleSettings._gFadeOutColourTransform;
		}
		
		private static var _gWhiteColourTransform:ColorTransform;
		public static function get gWhiteColourTransform():ColorTransform
		{
			if (UIStyleSettings._gWhiteColourTransform == null)
			{
				UIStyleSettings._gWhiteColourTransform = new ColorTransform();
				UIStyleSettings._gWhiteColourTransform.color = 0xFFFFFF;
			}
			return UIStyleSettings._gWhiteColourTransform;
		}
	}

}