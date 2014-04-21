package classes.UIComponents 
{
	import flash.filters.GlowFilter;
	import flash.geom.ColorTransform;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.TextFormatDisplay;
	import flash.text.Font;
	import flash.text.StyleSheet;
	import flash.text.AntiAliasType;
	
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
		// Static init backing storage for stuff -- basically ensures that we'll only ever have one of these objects
		// kicking around and initialized for the whole game, to cut down on MASSIVE memory usage inflation, considering
		// how much these things get used.
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
			UIStyleSettings._gButtonBodyLabelFormatter = null;
			UIStyleSettings._gButtonBindLabelFormatter = null;
			UIStyleSettings._gRoomLocationTextGlow = null;
			UIStyleSettings._gButtonGlow = null;
			UIStyleSettings._gFadeOutColourTransform = null;
			UIStyleSettings._gWhiteColourTransform = null;
			UIStyleSettings._gBackgroundColourTransform = null;
			UIStyleSettings._gForegroundColourTransform = null;
			UIStyleSettings._gMovementButtonColourTransform = null;
			UIStyleSettings._gMainMenuTextFormatter = null;
			UIStyleSettings._gPurpleGlow = null;
			UIStyleSettings._gTextInputFormatter = null;
			UIStyleSettings._gMainTextCSSStyleSheet = null;
			UIStyleSettings._gCodexTreeHeaderHighlightColourTransform = null;
			UIStyleSettings._gCodexTreeHeaderDeHighlightColourTransform = null;
			UIStyleSettings._gCodexTreeHeaderFormatter = null;
			UIStyleSettings._gCodexTitleHeaderFormatter = null;
			UIStyleSettings._gCodexLinkFormatter = null;
			UIStyleSettings._gMapIndoorRoomFlagColourTransform = null;
			UIStyleSettings._gMapOutdoorRoomFlagColourTransform = null;
			UIStyleSettings._gMapFallbackRoomColourTransform = null;
			UIStyleSettings._gMapPCLocationRoomColourTransform = null;
			UIStyleSettings._gHighlightColourTransform = null;
			
			UIStyleSettings._gLevelUpPointsBarNumber = null;
			UIStyleSettings._gLevelUpPointsBarText = null;
			UIStyleSettings._gLevelLabelText = null;
			UIStyleSettings._gLevelValueLabelText = null;

			UIStyleSettings._gLevelUpBarLightLabelFormatter = null;
			UIStyleSettings._gLevelUpBarDarkLabelFormatter = null;

			UIStyleSettings._gLevelUpBarValueLabelFormatter = null;
			UIStyleSettings._gLevelUpBarChangeableArrowButtonFormatter = null;
			UIStyleSettings._gLevelUpBarMaxedArrowButtonFormatter = null;

			UIStyleSettings._gLevelUpBarMaxedColourTransform = null;
			UIStyleSettings._gLevelUpBarChangeableColourTransform = null;
			
			UIStyleSettings._gPerkHeaderLabelTextFormat = null;
			
			UIStyleSettings._gSelectedPerkTextFormat = null;
			UIStyleSettings._gSelectedPerkNameFormat = null;
		}
		
		// TITS VALUES
		public static var gBackgroundColour:uint 			= 0x3D5174; // Stage colour, also used for menu button backgrounds
		public static var gForegroundColour:uint			= 0x333E52; // Pane colour (background of left/right bar) -- this was also used for some fade-out colour transforms throughout various parts of the UI code
		public static var gHighlightColour:uint				= 0x8D31B0; // Fancy schmancy highlights (the purple)
		public static var gMovementButtonColour:uint		= 0x84449B;
		public static var gPurpleGlowColour:uint			= 0x84449B; // The glow colour for button highlights was slightly different. Here for documentation purposes
		
		// VALUES I PULLED OUTTA MY ASS THAT SOMEBODY WHO CAN ACTUALLY DO UI DESIGN SHOULD PROBABLY LOOK AT
		public static var gStatusGoodColour:uint			= 0x0CD71C;
		public static var gStatusBadColour:uint				= 0xFF0000;
		public static var gTheColourOfDebug:uint 			= 0xFFA90A;
		
		// RANDOM VALUES I STOLE FROM BAD SHIT I WROTE IN THE PAST etc
		public static var gDebugPaneBackgroundColour:uint 	= 0xFF0000;
		public static var gMainTextColour:uint   			= 0xFFFFFF;
		public static var gUIBarTextColour:uint  			= 0xFFFFFF;
		public static var gStatusBarTextColour:uint 		= 0xFFFFFF;
		
		// Specialist font/tweaked colours for certain UI elements
		public static var gBlueBindColour:uint				= 0x6699FF;
		
		// Map room colour settings
		// I'm going to tie a bunch of flags to colour the underlying room "block" based on these values
		public static var gPCLocationRoomColour:uint		= 0x8D31B0;
		public static var gFallbackRoomColour:uint			= 0x000000; // Obvious colour to highlight rooms without flags.
		public static var gIndoorRoomFlagColour:uint 		= 0x333E52;
		public static var gOutdoorRoomFlagColour:uint		= 0x77797A;
		
		// Font Faces
		
		// Lato "Regular"
		[Embed(source = "../../assets/Lato-Regular.ttf", fontName = "Lato", advancedAntiAliasing = true, mimeType = "application/x-font-truetype", embedAsCFF = false)]
		public static const LatoTTF:String;
		
		[Embed(source = "../../assets/Lato-Italic.ttf", fontStyle="italic", fontName = "Lato", advancedAntiAliasing = true, mimeType = "application/x-font-truetype", embedAsCFF = false)]
		public static const LatoItalicTTF:String;
		
		[Embed(source = "../../assets/Lato-Bold.ttf", fontWeight = "bold", fontName = "Lato", advancedAntiAliasing = true, mimeType = "application/x-font-truetype",
		embedAsCFF = false)]
		public static const LatoBoldTTF:String;
		
		[Embed(source = "../../assets/Lato-BoldItalic.ttf", fontWeight = "bold", fontStyle = "italic", fontName = "Lato", advancedAntiAliasing = true, mimeType = "application/x-font-truetype", embedAsCFF = false)]
		public static const LatoBoldItalicTFF:String;
		
		// There IS actually a family of fonts for bold/italics etc for Univers, but I don't have it on this computer... its on my laptop... which tried
		// its hardest to commit sepuku today... so I'll actually add the family at some point.
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
		
		private static var _gButtonBodyLabelFormatter:TextFormat;
		public static function get gButtonBodyLabelFormatter():TextFormat
		{
			if (UIStyleSettings._gButtonBodyLabelFormatter == null)
			{
				UIStyleSettings._gButtonBodyLabelFormatter = new TextFormat();
				UIStyleSettings._gButtonBodyLabelFormatter.size = 21;
				UIStyleSettings._gButtonBodyLabelFormatter.color = 0xFFFFFF;
				UIStyleSettings._gButtonBodyLabelFormatter.align = TextFormatAlign.CENTER;
				UIStyleSettings._gButtonBodyLabelFormatter.leading = 0;
				UIStyleSettings._gButtonBodyLabelFormatter.kerning = true;
				UIStyleSettings._gButtonBodyLabelFormatter.bold = true;
				UIStyleSettings._gButtonBodyLabelFormatter.font = "Lato";
			}
			return UIStyleSettings._gButtonBodyLabelFormatter;
		}
		
		private static var _gButtonBindLabelFormatter:TextFormat;
		public static function get gButtonBindLabelFormatter():TextFormat
		{
			if (UIStyleSettings._gButtonBindLabelFormatter == null)
			{
				UIStyleSettings._gButtonBindLabelFormatter = new TextFormat();
				UIStyleSettings._gButtonBindLabelFormatter.size = 15;
				UIStyleSettings._gButtonBindLabelFormatter.color = UIStyleSettings.gBlueBindColour;
				UIStyleSettings._gButtonBindLabelFormatter.align = TextFormatAlign.CENTER;
				UIStyleSettings._gButtonBindLabelFormatter.leading = 37;
				UIStyleSettings._gButtonBindLabelFormatter.kerning = true;
				UIStyleSettings._gButtonBindLabelFormatter.font = "Univers UltraCondensed";
			}
			return UIStyleSettings._gButtonBindLabelFormatter;
		}
		
		private static var _gMainMenuTextFormatter:TextFormat;
		public static function get gMainMenuTextFormatter():TextFormat
		{
			if (UIStyleSettings._gMainMenuTextFormatter == null)
			{
				UIStyleSettings._gMainMenuTextFormatter = new TextFormat();
				UIStyleSettings._gMainMenuTextFormatter.size = 18;
				UIStyleSettings._gMainMenuTextFormatter.color = 0xFFFFFF;
				UIStyleSettings._gMainMenuTextFormatter.align = TextFormatAlign.CENTER;
				UIStyleSettings._gMainMenuTextFormatter.leading = 0;
				UIStyleSettings._gMainMenuTextFormatter.kerning = true;
				UIStyleSettings._gMainMenuTextFormatter.tabStops = [35];
				UIStyleSettings._gMainMenuTextFormatter.font = "Lato";
			}
			return UIStyleSettings._gMainMenuTextFormatter;
		}
		
		private static var _gTextInputFormatter:TextFormat;
		public static function get gTextInputFormatter():TextFormat
		{
			if (UIStyleSettings._gTextInputFormatter == null)
			{
				UIStyleSettings._gTextInputFormatter = new TextFormat();
				UIStyleSettings._gTextInputFormatter.size = 18;
				UIStyleSettings._gTextInputFormatter.color = 0xFFFFFF;
				UIStyleSettings._gTextInputFormatter.align = TextFormatAlign.LEFT;
				UIStyleSettings._gTextInputFormatter.kerning = true;
				UIStyleSettings._gTextInputFormatter.leading = 11;
				UIStyleSettings._gTextInputFormatter.font = "Lato";
			}
			return UIStyleSettings._gTextInputFormatter;
		}
		
		private static var _gCodexTitleHeaderFormatter:TextFormat;
		public static function get gCodexTitleHeaderFormatter():TextFormat
		{
			if (UIStyleSettings._gCodexTitleHeaderFormatter == null)
			{
				UIStyleSettings._gCodexTitleHeaderFormatter = new TextFormat();
				UIStyleSettings._gCodexTitleHeaderFormatter.size = 50;
				UIStyleSettings._gCodexTitleHeaderFormatter.color = 0xFFFFFF;
				UIStyleSettings._gCodexTitleHeaderFormatter.align = TextFormatAlign.LEFT;
				UIStyleSettings._gCodexTitleHeaderFormatter.kerning = true;
				UIStyleSettings._gCodexTitleHeaderFormatter.leading = 0;
				UIStyleSettings._gCodexTitleHeaderFormatter.font = "Univers UltraCondensed";
			}
			return UIStyleSettings._gCodexTitleHeaderFormatter;
		}
		
		private static var _gCodexTreeHeaderFormatter:TextFormat;
		public static function get gCodexTreeHeaderFormatter():TextFormat
		{
			if (UIStyleSettings._gCodexTreeHeaderFormatter == null)
			{
				UIStyleSettings._gCodexTreeHeaderFormatter = new TextFormat();
				UIStyleSettings._gCodexTreeHeaderFormatter.size = 28;
				UIStyleSettings._gCodexTreeHeaderFormatter.color = UIStyleSettings.gForegroundColour;
				UIStyleSettings._gCodexTreeHeaderFormatter.align = TextFormatAlign.LEFT;
				UIStyleSettings._gCodexTreeHeaderFormatter.kerning = true;
				UIStyleSettings._gCodexTreeHeaderFormatter.leading = 0;
				UIStyleSettings._gCodexTreeHeaderFormatter.font = "Univers UltraCondensed";
			}
			return UIStyleSettings._gCodexTreeHeaderFormatter;
		}
		
		private static var _gCodexLinkFormatter:TextFormat;
		public static function get gCodexLinkFormatter():TextFormat
		{
			if (UIStyleSettings._gCodexLinkFormatter == null)
			{
				UIStyleSettings._gCodexLinkFormatter = new TextFormat();
				UIStyleSettings._gCodexLinkFormatter.size = 18;
				UIStyleSettings._gCodexLinkFormatter.color = 0xFFFFFF;
				UIStyleSettings._gCodexLinkFormatter.align = TextFormatAlign.LEFT;
				UIStyleSettings._gCodexLinkFormatter.kerning = true;
				UIStyleSettings._gCodexLinkFormatter.leading = 0;
				UIStyleSettings._gCodexLinkFormatter.tabStops = [15, 30, 45, 60, 75, 90];
				UIStyleSettings._gCodexLinkFormatter.font = "Lato";
			}
			return UIStyleSettings._gCodexLinkFormatter;
		}
		
		private static var _gLevelUpPointsBarNumber:TextFormat;
		public static function get gLevelUpPointsBarNumber():TextFormat
		{
			if (UIStyleSettings._gLevelUpPointsBarNumber == null)
			{
				UIStyleSettings._gLevelUpPointsBarNumber = new TextFormat();
				UIStyleSettings._gLevelUpPointsBarNumber.size = 120;
				UIStyleSettings._gLevelUpPointsBarNumber.color = 0xFFFFFF;
				UIStyleSettings._gLevelUpPointsBarNumber.align = TextFormatAlign.CENTER;
				UIStyleSettings._gLevelUpPointsBarNumber.kerning = false;
				UIStyleSettings._gLevelUpPointsBarNumber.leading = -2;
				UIStyleSettings._gLevelUpPointsBarNumber.letterSpacing = -15;
				UIStyleSettings._gLevelUpPointsBarNumber.font = "Univers UltraCondensed";
			}
			return UIStyleSettings._gLevelUpPointsBarNumber;
		}
		
		private static var _gLevelUpPointsBarText:TextFormat;
		public static function get gLevelUpPointsBarText():TextFormat
		{
			if (UIStyleSettings._gLevelUpPointsBarText == null)
			{
				UIStyleSettings._gLevelUpPointsBarText = new TextFormat();
				UIStyleSettings._gLevelUpPointsBarText.size = 40;
				UIStyleSettings._gLevelUpPointsBarText.color = 0xFFFFFF;
				UIStyleSettings._gLevelUpPointsBarText.align = TextFormatAlign.CENTER;
				UIStyleSettings._gLevelUpPointsBarText.kerning = true;
				UIStyleSettings._gLevelUpPointsBarText.leading = 0;
				UIStyleSettings._gLevelUpPointsBarText.font = "Univers UltraCondensed";
			}
			return UIStyleSettings._gLevelUpPointsBarText;
		}

		private static var _gLevelLabelText:TextFormat;
		public static function get gLevelLabelText():TextFormat
		{
			if (UIStyleSettings._gLevelLabelText == null)
			{
				UIStyleSettings._gLevelLabelText = new TextFormat();
				UIStyleSettings._gLevelLabelText.size = 144;
				UIStyleSettings._gLevelLabelText.color = UIStyleSettings.gForegroundColour;
				UIStyleSettings._gLevelLabelText.align = TextFormatAlign.LEFT;
				UIStyleSettings._gLevelLabelText.kerning = true;
				UIStyleSettings._gLevelLabelText.leading = 0;
				UIStyleSettings._gLevelLabelText.font = "Univers UltraCondensed";
			}
			return UIStyleSettings._gLevelLabelText;
		}

		private static var _gLevelValueLabelText:TextFormat;
		public static function get gLevelValueLabelText():TextFormat
		{
			if (UIStyleSettings._gLevelValueLabelText == null)
			{
				UIStyleSettings._gLevelValueLabelText = new TextFormat();
				UIStyleSettings._gLevelValueLabelText.size = 200;
				UIStyleSettings._gLevelValueLabelText.color = 0xFFFFFF;
				UIStyleSettings._gLevelValueLabelText.align = TextFormatAlign.LEFT;
				UIStyleSettings._gLevelValueLabelText.kerning = true;
				UIStyleSettings._gLevelValueLabelText.leading = -5;
				UIStyleSettings._gLevelValueLabelText.font = "Univers UltraCondensed";
			}
			return UIStyleSettings._gLevelValueLabelText;
		}

		private static var _gLevelUpBarLightLabelFormatter:TextFormat;
		public static function get gLevelUpBarLightLabelFormatter():TextFormat
		{
			if (UIStyleSettings._gLevelUpBarLightLabelFormatter == null)
			{
				UIStyleSettings._gLevelUpBarLightLabelFormatter = new TextFormat();
				UIStyleSettings._gLevelUpBarLightLabelFormatter.size = 65;
				UIStyleSettings._gLevelUpBarLightLabelFormatter.color = UIStyleSettings.gBackgroundColour;
				UIStyleSettings._gLevelUpBarLightLabelFormatter.align = TextFormatAlign.LEFT;
				UIStyleSettings._gLevelUpBarLightLabelFormatter.kerning = true;
				UIStyleSettings._gLevelUpBarLightLabelFormatter.leading = -1;
				UIStyleSettings._gLevelUpBarLightLabelFormatter.font = "Univers UltraCondensed";
			}
			return UIStyleSettings._gLevelUpBarLightLabelFormatter;
		}

		private static var _gLevelUpBarDarkLabelFormatter:TextFormat;
		public static function get gLevelUpBarDarkLabelFormatter():TextFormat
		{
			if (UIStyleSettings._gLevelUpBarDarkLabelFormatter == null)
			{
				UIStyleSettings._gLevelUpBarDarkLabelFormatter = new TextFormat();
				UIStyleSettings._gLevelUpBarDarkLabelFormatter.size = 65;
				UIStyleSettings._gLevelUpBarDarkLabelFormatter.color = UIStyleSettings.gForegroundColour;
				UIStyleSettings._gLevelUpBarDarkLabelFormatter.align = TextFormatAlign.LEFT;
				UIStyleSettings._gLevelUpBarDarkLabelFormatter.kerning = true;
				UIStyleSettings._gLevelUpBarDarkLabelFormatter.leading = -1;
				UIStyleSettings._gLevelUpBarDarkLabelFormatter.font = "Univers UltraCondensed";
			}
			return UIStyleSettings._gLevelUpBarDarkLabelFormatter;
		}

		private static var _gLevelUpBarValueLabelFormatter:TextFormat;
		public static function get gLevelUpBarValueLabelFormatter():TextFormat
		{
			if (UIStyleSettings._gLevelUpBarValueLabelFormatter == null)
			{
				UIStyleSettings._gLevelUpBarValueLabelFormatter = new TextFormat();
				UIStyleSettings._gLevelUpBarValueLabelFormatter.size = 56;
				UIStyleSettings._gLevelUpBarValueLabelFormatter.color = 0xFFFFFF;
				UIStyleSettings._gLevelUpBarValueLabelFormatter.align = TextFormatAlign.RIGHT;
				UIStyleSettings._gLevelUpBarValueLabelFormatter.bold = true
				UIStyleSettings._gLevelUpBarValueLabelFormatter.kerning = true;
				UIStyleSettings._gLevelUpBarValueLabelFormatter.leading = -2;
				UIStyleSettings._gLevelUpBarValueLabelFormatter.font = "Lato";
			}
			return UIStyleSettings._gLevelUpBarValueLabelFormatter;
		}

		private static var _gLevelUpBarChangeableArrowButtonFormatter:TextFormat;
		public static function get gLevelUpBarChangeableArrowButtonFormatter():TextFormat
		{
			if (UIStyleSettings._gLevelUpBarChangeableArrowButtonFormatter == null)
			{
				UIStyleSettings._gLevelUpBarChangeableArrowButtonFormatter = new TextFormat();
				UIStyleSettings._gLevelUpBarChangeableArrowButtonFormatter.size = 44;
				UIStyleSettings._gLevelUpBarChangeableArrowButtonFormatter.color = UIStyleSettings.gHighlightColour
				UIStyleSettings._gLevelUpBarChangeableArrowButtonFormatter.align = TextFormatAlign.LEFT;
				UIStyleSettings._gLevelUpBarChangeableArrowButtonFormatter.kerning = true;
				UIStyleSettings._gLevelUpBarChangeableArrowButtonFormatter.bold = true;
				UIStyleSettings._gLevelUpBarChangeableArrowButtonFormatter.font = "Lato";
			}
			return UIStyleSettings._gLevelUpBarChangeableArrowButtonFormatter;
		}

		private static var _gLevelUpBarMaxedArrowButtonFormatter:TextFormat;
		public static function get gLevelUpBarMaxedArrowButtonFormatter():TextFormat
		{
			if (UIStyleSettings._gLevelUpBarMaxedArrowButtonFormatter == null)
			{
				UIStyleSettings._gLevelUpBarMaxedArrowButtonFormatter = new TextFormat();
				UIStyleSettings._gLevelUpBarMaxedArrowButtonFormatter.size = 44;
				UIStyleSettings._gLevelUpBarMaxedArrowButtonFormatter.color = UIStyleSettings.gForegroundColour;
				UIStyleSettings._gLevelUpBarMaxedArrowButtonFormatter.align = TextFormatAlign.LEFT;
				UIStyleSettings._gLevelUpBarMaxedArrowButtonFormatter.kerning = true;
				UIStyleSettings._gLevelUpBarMaxedArrowButtonFormatter.bold = true;
				UIStyleSettings._gLevelUpBarMaxedArrowButtonFormatter.font = "Lato";
			}
			return UIStyleSettings._gLevelUpBarMaxedArrowButtonFormatter;
		}
		
		private static var _gPerkHeaderLabelTextFormat:TextFormat;
		public static function get gPerkHeaderLabelTextFormat():TextFormat
		{
			if (UIStyleSettings._gPerkHeaderLabelTextFormat == null)
			{
				UIStyleSettings._gPerkHeaderLabelTextFormat = new TextFormat();
				UIStyleSettings._gPerkHeaderLabelTextFormat.size = 72;
				UIStyleSettings._gPerkHeaderLabelTextFormat.color = UIStyleSettings.gForegroundColour;
				UIStyleSettings._gPerkHeaderLabelTextFormat.align = TextFormatAlign.CENTER;
				UIStyleSettings._gPerkHeaderLabelTextFormat.kerning = true;
				UIStyleSettings._gPerkHeaderLabelTextFormat.font = "Univers UltraCondensed";
			}
			return UIStyleSettings._gPerkHeaderLabelTextFormat;
		}
			
		private static var _gSelectedPerkTextFormat:TextFormat;
		public static function get gSelectedPerkTextFormat():TextFormat
		{
			if (UIStyleSettings._gSelectedPerkTextFormat == null)
			{
				UIStyleSettings._gSelectedPerkTextFormat = new TextFormat();
				UIStyleSettings._gSelectedPerkTextFormat.size = 32;
				UIStyleSettings._gSelectedPerkTextFormat.color = UIStyleSettings.gForegroundColour;
				UIStyleSettings._gSelectedPerkTextFormat.align = TextFormatAlign.LEFT;
				UIStyleSettings._gSelectedPerkTextFormat.kerning = true;
				UIStyleSettings._gSelectedPerkTextFormat.font = "Lato";
			}
			return UIStyleSettings._gSelectedPerkTextFormat;
		}
		
		private static var _gSelectedPerkNameFormat:TextFormat;
		public static function get gSelectedPerkNameFormat():TextFormat
		{
			if (UIStyleSettings._gSelectedPerkNameFormat == null)
			{
				UIStyleSettings._gSelectedPerkNameFormat = new TextFormat();
				UIStyleSettings._gSelectedPerkNameFormat.size = 32;
				UIStyleSettings._gSelectedPerkNameFormat.color = 0xFFFFFF;
				UIStyleSettings._gSelectedPerkNameFormat.align = TextFormatAlign.LEFT;
				UIStyleSettings._gSelectedPerkNameFormat.kerning = true;
				UIStyleSettings._gSelectedPerkNameFormat.font = "Lato"
			}
			return UIStyleSettings._gSelectedPerkNameFormat;
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
		
		private static var _gPurpleGlow:GlowFilter;
		public static function get gPurpleGlow():GlowFilter
		{
			if (UIStyleSettings._gPurpleGlow == null)
			{
				UIStyleSettings._gPurpleGlow = new GlowFilter(UIStyleSettings.gPurpleGlowColour, 1, 10, 10, 5, 1, false, false);
			}
			return UIStyleSettings._gPurpleGlow;
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
		
		private static var _gBackgroundColourTransform:ColorTransform;
		public static function get gBackgroundColourTransform():ColorTransform
		{
			if (UIStyleSettings._gBackgroundColourTransform == null)
			{
				UIStyleSettings._gBackgroundColourTransform = new ColorTransform();
				UIStyleSettings._gBackgroundColourTransform.color = UIStyleSettings.gBackgroundColour;
			}
			return UIStyleSettings._gBackgroundColourTransform;
		}
		
		private static var _gForegroundColourTransform:ColorTransform;
		public static function get gForegroundColourTransform():ColorTransform
		{
			if (UIStyleSettings._gForegroundColourTransform == null)
			{
				UIStyleSettings._gForegroundColourTransform = new ColorTransform();
				UIStyleSettings._gForegroundColourTransform.color = UIStyleSettings.gForegroundColour;
			}
			return UIStyleSettings._gForegroundColourTransform;
		}

		private static var _gHighlightColourTransform:ColorTransform;
		public static function get gHighlightColourTransform():ColorTransform
		{
			if (UIStyleSettings._gHighlightColourTransform == null)
			{
				UIStyleSettings._gHighlightColourTransform = new ColorTransform();
				UIStyleSettings._gHighlightColourTransform.color = UIStyleSettings.gHighlightColour;
			}
			return UIStyleSettings._gHighlightColourTransform;
		}
		
		private static var _gMovementButtonColourTransform:ColorTransform;
		public static function get gMovementButtonColourTransform():ColorTransform
		{
			if (UIStyleSettings._gMovementButtonColourTransform == null)
			{
				UIStyleSettings._gMovementButtonColourTransform = new ColorTransform();
				UIStyleSettings._gMovementButtonColourTransform.color = UIStyleSettings.gMovementButtonColour;
			}
			return UIStyleSettings._gMovementButtonColourTransform;
		}
		
		private static var _gCodexTreeHeaderHighlightColourTransform:ColorTransform;
		public static function get gCodexTreeHeaderHighlightColourTransform():ColorTransform
		{
			if (UIStyleSettings._gCodexTreeHeaderHighlightColourTransform == null)
			{
				UIStyleSettings._gCodexTreeHeaderHighlightColourTransform = new ColorTransform();
				UIStyleSettings._gCodexTreeHeaderHighlightColourTransform.color = UIStyleSettings.gHighlightColour;
			}
			return UIStyleSettings._gCodexTreeHeaderHighlightColourTransform;
		}
		
		private static var _gCodexTreeHeaderDeHighlightColourTransform:ColorTransform;
		public static function get gCodexTreeHeaderDeHighlightColourTransform():ColorTransform
		{
			if (UIStyleSettings._gCodexTreeHeaderDeHighlightColourTransform == null)
			{
				UIStyleSettings._gCodexTreeHeaderDeHighlightColourTransform = new ColorTransform();
				UIStyleSettings._gCodexTreeHeaderDeHighlightColourTransform.color = UIStyleSettings.gBackgroundColour;
			}
			return UIStyleSettings._gCodexTreeHeaderDeHighlightColourTransform;
		}
		
		private static var _gMapIndoorRoomFlagColourTransform:ColorTransform;
		public static function get gMapIndoorRoomFlagColourTransform():ColorTransform
		{
			if (UIStyleSettings._gMapIndoorRoomFlagColourTransform == null)
			{
				UIStyleSettings._gMapIndoorRoomFlagColourTransform = new ColorTransform();
				UIStyleSettings._gMapIndoorRoomFlagColourTransform.color = UIStyleSettings.gIndoorRoomFlagColour;
			}
			return UIStyleSettings._gMapIndoorRoomFlagColourTransform;
		}
		
		private static var _gMapOutdoorRoomFlagColourTransform:ColorTransform;
		public static function get gMapOutdoorRoomFlagColourTransform():ColorTransform
		{
			if (UIStyleSettings._gMapOutdoorRoomFlagColourTransform == null)
			{
				UIStyleSettings._gMapOutdoorRoomFlagColourTransform = new ColorTransform();
				UIStyleSettings._gMapOutdoorRoomFlagColourTransform.color = UIStyleSettings.gOutdoorRoomFlagColour;
			}
			return UIStyleSettings._gMapOutdoorRoomFlagColourTransform;
		}
		
		private static var _gMapPCLocationRoomColourTransform:ColorTransform;
		public static function get gMapPCLocationRoomColourTransform():ColorTransform
		{
			if (UIStyleSettings._gMapPCLocationRoomColourTransform == null)
			{
				UIStyleSettings._gMapPCLocationRoomColourTransform = new ColorTransform();
				UIStyleSettings._gMapPCLocationRoomColourTransform.color = UIStyleSettings.gPCLocationRoomColour;
			}
			return UIStyleSettings._gMapPCLocationRoomColourTransform;
		}
		
		private static var _gMapFallbackRoomColourTransform:ColorTransform;
		public static function get gMapFallbackColourTransform():ColorTransform
		{
			if (UIStyleSettings._gMapFallbackRoomColourTransform == null)
			{
				UIStyleSettings._gMapFallbackRoomColourTransform = new ColorTransform();
				UIStyleSettings._gMapFallbackRoomColourTransform.color = UIStyleSettings.gFallbackRoomColour;
			}
			return UIStyleSettings._gMapFallbackRoomColourTransform;
		}

		private static var _gLevelUpBarMaxedColourTransform:ColorTransform;
		public static function get gLevelUpBarMaxedColourTransform():ColorTransform
		{
			if (UIStyleSettings._gLevelUpBarMaxedColourTransform == null)
			{
				UIStyleSettings._gLevelUpBarMaxedColourTransform = new ColorTransform();
				UIStyleSettings._gLevelUpBarMaxedColourTransform.color = UIStyleSettings.gForegroundColour;
			}
			return UIStyleSettings._gLevelUpBarMaxedColourTransform;
		}

		private static var _gLevelUpBarChangeableColourTransform:ColorTransform;
		public static function get gLevelUpBarChangeableColourTransform():ColorTransform
		{						
			if (UIStyleSettings._gLevelUpBarChangeableColourTransform == null)
			{
				UIStyleSettings._gLevelUpBarChangeableColourTransform = new ColorTransform();
				UIStyleSettings._gLevelUpBarChangeableColourTransform.color = UIStyleSettings.gHighlightColour;
			}
			return UIStyleSettings._gLevelUpBarChangeableColourTransform;
		}
		
		// CSS Style Sheet to apply to "large" text blocks
		private static var _gMainTextCSSStyleSheet:StyleSheet;
		public static function get gMainTextCSSStyleSheet():StyleSheet
		{
			if (UIStyleSettings._gMainTextCSSStyleSheet == null)
			{
				UIStyleSettings._gMainTextCSSStyleSheet = new StyleSheet();
				
				var defaultFormat = { 
					fontFamily: "Lato",
					fontSize: 18,
					color: "#FFFFFF",
					marginRight: 5
				};
				
				var good = { 
					fontFamily: "Lato", 
					fontSize: 18, 
					color: "#00CCFF", 
					marginRight: 5 
				};
				
				var bad = { 
					fontFamily: "Lato", 
					fontSize: 18, 
					color: "#CC3300", 
					marginRight: 5 
				};
				
				var indifferent = { 
					fontFamily: "Lato", 
					fontSize: 18, 
					color: "#FFFFFF", 
					marginRight: 5 
				};
				
				var header = {
					fontFamily: "Univers UltraCondensed",
					fontSize: 72,
					color: "#FFFFFF",
					marginRight: 5
				}
				
				var blockHeader = {
					fontFamily: "Univers UltraCondensed",
					fontSize: 28,
					color: "#FFFFFF",
					marginRight: 5
				}
				
				var lockedCodexEntry = {
					fontFamily: "Lato",
					fontSize: 18,
					color: "#CC3300",
					marginRight: 0
				}
				
				var newCodexEntry = {
					fontFamily: "Lato",
					fontSize: 18,
					color: "#CCBC14",
					marginRight: 0
				}
				
				var viewedCodexEntry = {
					fontFamily: "Lato",
					fontSize: 18,
					color: "#FFFFFF",
					marginRight: 0
				}
				
				var activeCodexEntry = {
					fontFamily: "Lato",
					fontSize: 18,
					color: "#00CCFF",
					marginRight: 0,
					fontWeight: "bold"
				}
				
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".words", defaultFormat);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".good", good);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".bad", bad);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".nothing", indifferent);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".header", header);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".blockHeader", blockHeader);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".locked", lockedCodexEntry);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".new", newCodexEntry);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".viewed", viewedCodexEntry);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".active", activeCodexEntry);
			}
			return UIStyleSettings._gMainTextCSSStyleSheet;
		}
		
		// Util methods
		public static function cfgLabel(obj:TextField):void
		{
			obj.border = false;
			obj.background = false;
			obj.multiline = false;
			obj.wordWrap = false;
			obj.embedFonts = true;
			obj.antiAliasType = AntiAliasType.ADVANCED;
			obj.mouseEnabled = false;
			obj.mouseWheelEnabled = false;
		}
		
		public static function cfgTextBlock(obj:TextField):void
		{
			obj.border = false;
			obj.background = false;
			obj.multiline = true;
			obj.wordWrap = true;
			obj.embedFonts = true;
			obj.antiAliasType = AntiAliasType.ADVANCED;
			obj.mouseEnabled = true;
			obj.mouseWheelEnabled = true;
		}
	}

}