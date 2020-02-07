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
	import flash.text.TextFieldType;
	import classes.UIComponents.CustomCellRenderer;
	
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
			UIStyleSettings._gMapCaveRoomFlagColourTransform = null;
			UIStyleSettings._gMapFallbackRoomColourTransform = null;
			UIStyleSettings._gMapPCLocationRoomColourTransform = null;
			UIStyleSettings._gMapTundraRoomColourTransform = null;
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
			
			UIStyleSettings._gSelectedPerkDescriptionTextFormat = null;
		}
		
		// TITS VALUES
		public static var gBackgroundColour:uint 			= 0x3D5174; // Stage colour, also used for menu button backgrounds
		public static var gForegroundColour:uint			= 0x333E52; // Pane colour (background of left/right bar) -- this was also used for some fade-out colour transforms throughout various parts of the UI code
		public static var gHighlightColour:uint				= 0x8D31B0; // Fancy schmancy highlights (the purple)
		public static var gMovementButtonColour:uint		= 0x84449B;
		public static var gPurpleGlowColour:uint			= 0x84449B; // The glow colour for button highlights was slightly different. Here for documentation purposes
		public static var gPaleColour:uint					= 0x53677b;
		
		// VALUES I PULLED OUTTA MY ASS THAT SOMEBODY WHO CAN ACTUALLY DO UI DESIGN SHOULD PROBABLY LOOK AT
		public static var gStatusGoodColour:uint			= 0x0CD71C;
		public static var gStatusBadColour:uint				= 0xFF0000;
		public static var gTheColourOfDebug:uint 			= 0xFFA90A;
		//Fen did this. Find & Replace all if you replace it!
		public static var gStatusLowPriorityColor:uint      = 0xB793C4;
		
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
		public static var gCaveRoomFlagColour:uint 			= 0x332225;
		public static var gDesertRoomFlagColour:uint		= 0xD6BB8D;
		public static var gForestRoomFlagColour:uint		= 0x3F704C; //Greenish
		public static var gJungleRoomFlagColour:uint 		= 0x184925; //Darker/Greener!
		public static var gTundraRoomFlagColour:uint		= 0x5DD5E5;
		public static var gFrozenRoomFlagColour:uint 		= 0xE1F0FF; // Todo: invert/change icon colour on room flags that use this colour shade
		
		public static var gShieldColour:uint				= 0x00CCFF;
		public static var gHPColour:uint					= 0x00CC2F;
		public static var gLustColour:uint					= 0xDD597E;
		public static var gEnergyColour:uint				= 0x754C24;
		
		public static var gColdStatusColour:uint			= 0x5DD5E5;
		
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
		
		private static var _gCompressedStatBlockNameFormatter:TextFormat;
		public static function get gCompressedStatBlockNameFormatter():TextFormat
		{
			if (UIStyleSettings._gCompressedStatBlockNameFormatter == null)
			{
				_gCompressedStatBlockNameFormatter = new TextFormat();
				_gCompressedStatBlockNameFormatter.size = 18;
				_gCompressedStatBlockNameFormatter.color = 0xFFFFFF;
				_gCompressedStatBlockNameFormatter.align = TextFormatAlign.LEFT;
				_gCompressedStatBlockNameFormatter.font = "Univers UltraCondensed";
			}
			return _gCompressedStatBlockNameFormatter;
		}
		
		private static var _gMailEntryUnreadFormatter:TextFormat;
		public static function get gMailEntryUnreadFormatter():TextFormat
		{
			if (UIStyleSettings._gMailEntryUnreadFormatter == null)
			{
				UIStyleSettings._gMailEntryUnreadFormatter = new TextFormat();
				UIStyleSettings._gMailEntryUnreadFormatter.size = 14;
				UIStyleSettings._gMailEntryUnreadFormatter.color = 0xFF0000;
				UIStyleSettings._gMailEntryUnreadFormatter.align = TextFormatAlign.LEFT;
				UIStyleSettings._gMailEntryUnreadFormatter.font = "Lato";
				UIStyleSettings._gMailEntryUnreadFormatter.bold = true;
			}
			return UIStyleSettings._gMailEntryUnreadFormatter;
		}

		private static var _gMailEntryReadFormatter:TextFormat;
		public static function get gMailEntryReadFormatter():TextFormat
		{
			if (UIStyleSettings._gMailEntryReadFormatter == null)
			{
				UIStyleSettings._gMailEntryReadFormatter = new TextFormat();
				UIStyleSettings._gMailEntryReadFormatter.size = 14;
				UIStyleSettings._gMailEntryReadFormatter.color = 0x00FF00;
				UIStyleSettings._gMailEntryReadFormatter.align = TextFormatAlign.LEFT;
				UIStyleSettings._gMailEntryReadFormatter.font = "Lato";
				UIStyleSettings._gMailEntryReadFormatter.bold = false;
			}
			return UIStyleSettings._gMailEntryReadFormatter;
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
				UIStyleSettings._gCodexTreeHeaderFormatter.color = 0xFFFFFF;
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
				UIStyleSettings._gLevelUpPointsBarNumber.size = 90;
				UIStyleSettings._gLevelUpPointsBarNumber.color = 0xFFFFFF;
				UIStyleSettings._gLevelUpPointsBarNumber.align = TextFormatAlign.CENTER;
				UIStyleSettings._gLevelUpPointsBarNumber.kerning = false;
				UIStyleSettings._gLevelUpPointsBarNumber.leading = -2;
				UIStyleSettings._gLevelUpPointsBarNumber.letterSpacing = -5;
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
				UIStyleSettings._gLevelValueLabelText.align = TextFormatAlign.CENTER;
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
		
		private static var _gLevelUpBarChangeValueLabelFormatter:TextFormat;
		public static function get gLevelUpBarChangeValueLabelFormatter():TextFormat
		{
			if (UIStyleSettings._gLevelUpBarChangeValueLabelFormatter == null)
			{
				UIStyleSettings._gLevelUpBarChangeValueLabelFormatter = new TextFormat();
				UIStyleSettings._gLevelUpBarChangeValueLabelFormatter.size = 32;
				UIStyleSettings._gLevelUpBarChangeValueLabelFormatter.color = 0xFFFFFF;
				UIStyleSettings._gLevelUpBarChangeValueLabelFormatter.align = TextFormatAlign.CENTER;
				UIStyleSettings._gLevelUpBarChangeValueLabelFormatter.bold = true
				UIStyleSettings._gLevelUpBarChangeValueLabelFormatter.kerning = true;
				UIStyleSettings._gLevelUpBarChangeValueLabelFormatter.leading = -2;
				UIStyleSettings._gLevelUpBarChangeValueLabelFormatter.font = "Lato";
			}
			return UIStyleSettings._gLevelUpBarChangeValueLabelFormatter;
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
		
		private static var _gBigStatBarBackTextFormat:TextFormat;
		public static function get gBigStatBarBackTextFormat():TextFormat
		{
			if (UIStyleSettings._gBigStatBarBackTextFormat == null)
			{
				_gBigStatBarBackTextFormat = new TextFormat();
				_gBigStatBarBackTextFormat.size = 48;
				_gBigStatBarBackTextFormat.color = UIStyleSettings.gBackgroundColour;
				_gBigStatBarBackTextFormat.align = TextFormatAlign.LEFT;
				_gBigStatBarBackTextFormat.leading = -5;
				_gBigStatBarBackTextFormat.kerning = true;
				_gBigStatBarBackTextFormat.bold = false;
				_gBigStatBarBackTextFormat.font = "Univers UltraCondensed";
			}
			return UIStyleSettings._gBigStatBarBackTextFormat;
		}
		
		private static var _gSmallStatBarBackTextFormat:TextFormat;
		public static function get gSmallStatBarBackTextFormat():TextFormat
		{
			if (UIStyleSettings._gSmallStatBarBackTextFormat == null)
			{
				_gSmallStatBarBackTextFormat = new TextFormat();
				_gSmallStatBarBackTextFormat.size = 33;
				_gSmallStatBarBackTextFormat.color = UIStyleSettings.gBackgroundColour;
				_gSmallStatBarBackTextFormat.align = TextFormatAlign.LEFT;
				_gSmallStatBarBackTextFormat.leading = -5;
				_gSmallStatBarBackTextFormat.kerning = true;
				_gSmallStatBarBackTextFormat.bold = false;
				_gSmallStatBarBackTextFormat.font = "Univers UltraCondensed";
			}
			return UIStyleSettings._gSmallStatBarBackTextFormat;
		}
		
		private static var _gBigStatBarFrontTextFormat:TextFormat;
		public static function get gBigStatBarFrontTextFormat():TextFormat
		{
			if (UIStyleSettings._gBigStatBarFrontTextFormat == null)
			{
				_gBigStatBarFrontTextFormat = new TextFormat();
				_gBigStatBarFrontTextFormat.size = 48;
				_gBigStatBarFrontTextFormat.color = UIStyleSettings.gForegroundColour;
				_gBigStatBarFrontTextFormat.align = TextFormatAlign.LEFT;
				_gBigStatBarFrontTextFormat.leading = -5;
				_gBigStatBarFrontTextFormat.kerning = true;
				_gBigStatBarFrontTextFormat.bold = false;
				_gBigStatBarFrontTextFormat.font = "Univers UltraCondensed";
			}
			return UIStyleSettings._gBigStatBarFrontTextFormat;
		}
		
		private static var _gSmallStatBarFrontTextFormat:TextFormat;
		public static function get gSmallStatBarFrontTextFormat():TextFormat
		{
			if (UIStyleSettings._gSmallStatBarFrontTextFormat == null)
			{
				_gSmallStatBarFrontTextFormat = new TextFormat();
				_gSmallStatBarFrontTextFormat.size = 33;
				_gSmallStatBarFrontTextFormat.color = UIStyleSettings.gForegroundColour;
				_gSmallStatBarFrontTextFormat.align = TextFormatAlign.LEFT;
				_gSmallStatBarFrontTextFormat.leading = -5;
				_gSmallStatBarFrontTextFormat.kerning = true;
				_gSmallStatBarFrontTextFormat.bold = false;
				_gSmallStatBarFrontTextFormat.font = "Univers UltraCondensed";
			}
			return UIStyleSettings._gSmallStatBarFrontTextFormat;
		}
		
		private static var _gBigStatBarValueFormat:TextFormat;
		public static function get gBigStatBarValueFormat():TextFormat
		{
			if (UIStyleSettings._gBigStatBarValueFormat == null)
			{
				_gBigStatBarValueFormat = new TextFormat();
				_gBigStatBarValueFormat.size = 30;
				_gBigStatBarValueFormat.color = 0xFFFFFF;
				_gBigStatBarValueFormat.align = TextFormatAlign.RIGHT;
				_gBigStatBarValueFormat.leading = -5;
				_gBigStatBarValueFormat.kerning = true;
				_gBigStatBarValueFormat.bold = true;
				_gBigStatBarValueFormat.font = "Lato";
			}
			return UIStyleSettings._gBigStatBarValueFormat;
		}
		
		private static var _gSmallStatBarValueFormat:TextFormat;
		public static function get gSmallStatBarValueFormat():TextFormat
		{
			if (UIStyleSettings._gSmallStatBarValueFormat == null)
			{
				_gSmallStatBarValueFormat = new TextFormat();
				_gSmallStatBarValueFormat.size = 21;
				_gSmallStatBarValueFormat.color = 0xFFFFFF;
				_gSmallStatBarValueFormat.align = TextFormatAlign.RIGHT;
				_gSmallStatBarValueFormat.leading = -3.5;
				_gSmallStatBarValueFormat.kerning = true;
				_gSmallStatBarValueFormat.bold = true;
				_gSmallStatBarValueFormat.font = "Lato";
			}
			return UIStyleSettings._gSmallStatBarValueFormat;
		}
		
		private static var _gCompressedStatBarBackTextFormat:TextFormat;
		public static function get gCompressedStatBarBackTextFormat():TextFormat
		{
			if (UIStyleSettings._gCompressedStatBarBackTextFormat == null)
			{
				_gCompressedStatBarBackTextFormat = new TextFormat();
				_gCompressedStatBarBackTextFormat.size = 18;
				_gCompressedStatBarBackTextFormat.color = 0xFFFFFF;
				_gCompressedStatBarBackTextFormat.align = TextFormatAlign.LEFT;
				_gCompressedStatBarBackTextFormat.leading = -5;
				_gCompressedStatBarBackTextFormat.kerning = true;
				_gCompressedStatBarBackTextFormat.bold = false;
				_gCompressedStatBarBackTextFormat.font = "Univers UltraCondensed";
			}
			return UIStyleSettings._gCompressedStatBarBackTextFormat;
		}
		
		private static var _gCompressedStatBarFrontTextFormat:TextFormat;
		public static function get gCompressedStatBarFrontTextFormat():TextFormat
		{
			if (UIStyleSettings._gCompressedStatBarFrontTextFormat == null)
			{
				_gCompressedStatBarFrontTextFormat = new TextFormat();
				_gCompressedStatBarFrontTextFormat.size = 18;
				_gCompressedStatBarFrontTextFormat.color = 0xFFFFFF;
				_gCompressedStatBarFrontTextFormat.align = TextFormatAlign.LEFT;
				_gCompressedStatBarFrontTextFormat.leading = -5;
				_gCompressedStatBarFrontTextFormat.kerning = true;
				_gCompressedStatBarFrontTextFormat.font = "Univers UltraCondensed";
			}
			return UIStyleSettings._gCompressedStatBarFrontTextFormat;
		}
		
		private static var _gCompressedStatBarValueTextFormat:TextFormat;
		public static function get gCompressedStatBarValueTextFormat():TextFormat
		{
			if (UIStyleSettings._gCompressedStatBarValueTextFormat == null)
			{
				_gCompressedStatBarValueTextFormat = new TextFormat();
				_gCompressedStatBarValueTextFormat.size = 15;
				_gCompressedStatBarValueTextFormat.color = 0xFFFFFF;
				_gCompressedStatBarValueTextFormat.align = TextFormatAlign.RIGHT;
				_gCompressedStatBarValueTextFormat.leading = -3.5;
				_gCompressedStatBarValueTextFormat.kerning = true;
				_gCompressedStatBarValueTextFormat.bold = true;
				_gCompressedStatBarValueTextFormat.font = "Lato";
				
			}
			return UIStyleSettings._gCompressedStatBarValueTextFormat;
		}
		
		private static var _gCompressedStatDisplayStatusEffectBackgroundTextFormat:TextFormat;
		public static function get gCompressedStatDisplayStatusEffectBackgroundTextFormat():TextFormat
		{
			if (UIStyleSettings._gCompressedStatDisplayStatusEffectBackgroundTextFormat == null)
			{
				_gCompressedStatDisplayStatusEffectBackgroundTextFormat = new TextFormat();
				_gCompressedStatDisplayStatusEffectBackgroundTextFormat.size = 30;
				_gCompressedStatDisplayStatusEffectBackgroundTextFormat.color = gBackgroundColour;
				_gCompressedStatDisplayStatusEffectBackgroundTextFormat.align = TextFormatAlign.RIGHT;
				_gCompressedStatDisplayStatusEffectBackgroundTextFormat.leading = -5;
				_gCompressedStatDisplayStatusEffectBackgroundTextFormat.kerning = true;
				_gCompressedStatDisplayStatusEffectBackgroundTextFormat.font = "Univers UltraCondensed";
			}
			return _gCompressedStatDisplayStatusEffectBackgroundTextFormat;
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
				UIStyleSettings._gSelectedPerkTextFormat.bold = true;
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
				UIStyleSettings._gSelectedPerkNameFormat.bold = true;
				UIStyleSettings._gSelectedPerkNameFormat.font = "Lato"
			}
			return UIStyleSettings._gSelectedPerkNameFormat;
		}
		
		private static var _gSelectedPerkDescriptionTextFormat:TextFormat;
		public static function get gSelectedPerkDescriptionTextFormat():TextFormat
		{
			if (UIStyleSettings._gSelectedPerkDescriptionTextFormat == null)
			{
				UIStyleSettings._gSelectedPerkDescriptionTextFormat = new TextFormat();
				UIStyleSettings._gSelectedPerkDescriptionTextFormat.size = 18;
				UIStyleSettings._gSelectedPerkDescriptionTextFormat.color = 0xFFFFFF;
				UIStyleSettings._gSelectedPerkDescriptionTextFormat.align = TextFormatAlign.LEFT;
				UIStyleSettings._gSelectedPerkDescriptionTextFormat.kerning = true;
				UIStyleSettings._gSelectedPerkDescriptionTextFormat.font = "Lato"
			}
			return UIStyleSettings._gSelectedPerkDescriptionTextFormat;
		}
		
		private static var _gPerkButtonBlueColourTextFormat:TextFormat;
		public static function get gPerkButtonBlueColourTextFormat():TextFormat
		{
			if (UIStyleSettings._gPerkButtonBlueColourTextFormat == null)
			{
				UIStyleSettings._gPerkButtonBlueColourTextFormat = new TextFormat();
				UIStyleSettings._gPerkButtonBlueColourTextFormat.size = 21;
				UIStyleSettings._gPerkButtonBlueColourTextFormat.color = UIStyleSettings.gForegroundColour;
				UIStyleSettings._gPerkButtonBlueColourTextFormat.align = TextFormatAlign.CENTER;
				UIStyleSettings._gPerkButtonBlueColourTextFormat.leading = 0;
				UIStyleSettings._gPerkButtonBlueColourTextFormat.kerning = true;
				UIStyleSettings._gPerkButtonBlueColourTextFormat.bold = true;
				UIStyleSettings._gPerkButtonBlueColourTextFormat.font = "Lato";
			}
			return UIStyleSettings._gPerkButtonBlueColourTextFormat;
		}

		private static var _gPerkButtonWhiteColourTextFormat:TextFormat;
		public static function get gPerkButtonWhiteColourTextFormat():TextFormat
		{
			if (UIStyleSettings._gPerkButtonWhiteColourTextFormat == null)
			{
				UIStyleSettings._gPerkButtonWhiteColourTextFormat = new TextFormat();
				UIStyleSettings._gPerkButtonWhiteColourTextFormat.size = 21;
				UIStyleSettings._gPerkButtonWhiteColourTextFormat.color = 0xFFFFFF;
				UIStyleSettings._gPerkButtonWhiteColourTextFormat.align = TextFormatAlign.CENTER;
				UIStyleSettings._gPerkButtonWhiteColourTextFormat.leading = 0;
				UIStyleSettings._gPerkButtonWhiteColourTextFormat.kerning = true;
				UIStyleSettings._gPerkButtonWhiteColourTextFormat.bold = true;
				UIStyleSettings._gPerkButtonWhiteColourTextFormat.font = "Lato";
			}
			return UIStyleSettings._gPerkButtonWhiteColourTextFormat;
		}
		
		private static var _gSaveEditorInputEnabledTextFormat:TextFormat;
		public static function get gSaveEditorInputEnabledTextFormat():TextFormat
		{
			if (UIStyleSettings._gSaveEditorInputEnabledTextFormat == null)
			{
				_gSaveEditorInputEnabledTextFormat = new TextFormat();
				_gSaveEditorInputEnabledTextFormat.size = 18;
				_gSaveEditorInputEnabledTextFormat.color = 0xFFFFFF;
				_gSaveEditorInputEnabledTextFormat.align = TextFormatAlign.LEFT;
				_gSaveEditorInputEnabledTextFormat.leading = 0;
				_gSaveEditorInputEnabledTextFormat.kerning = true;
				_gSaveEditorInputEnabledTextFormat.font = "Lato";
			}
			return UIStyleSettings._gSaveEditorInputEnabledTextFormat;
		}
		
		private static var _gSaveEditorInputDisabledTextFormat:TextFormat;
		public static function get gSaveEditorInputDisabledTextFormat():TextFormat
		{
			if (UIStyleSettings._gSaveEditorInputDisabledTextFormat == null)
			{
				_gSaveEditorInputDisabledTextFormat = new TextFormat();
				_gSaveEditorInputDisabledTextFormat.size = 18;
				_gSaveEditorInputDisabledTextFormat.color = 0x666666;
				_gSaveEditorInputDisabledTextFormat.align = TextFormatAlign.LEFT;
				_gSaveEditorInputDisabledTextFormat.leading = 0;
				_gSaveEditorInputDisabledTextFormat.kerning = true;
				_gSaveEditorInputDisabledTextFormat.font = "Lato";
			}
			return UIStyleSettings._gSaveEditorInputDisabledTextFormat;
		}
		
		private static var _gSaveEditorLabelTextFormat:TextFormat;
		public static function get gSaveEditorLabelTextFormat():TextFormat
		{
			if (UIStyleSettings._gSaveEditorLabelTextFormat == null)
			{
				_gSaveEditorLabelTextFormat = new TextFormat();
				_gSaveEditorLabelTextFormat.size = 18;
				_gSaveEditorLabelTextFormat.color = 0xFFFFFF;
				_gSaveEditorLabelTextFormat.align = TextFormatAlign.RIGHT;
				_gSaveEditorLabelTextFormat.leading = 0;
				_gSaveEditorLabelTextFormat.kerning = true;
				_gSaveEditorLabelTextFormat.bold = true;
				_gSaveEditorLabelTextFormat.font = "Lato";
			}
			return UIStyleSettings._gSaveEditorLabelTextFormat;
		}
		
		private static var _gSaveEditorCenteredLabelTextFormat:TextFormat;
		public static function get gSaveEditorCenteredLabelTextFormat():TextFormat
		{
			if (UIStyleSettings._gSaveEditorCenteredLabelTextFormat == null)
			{
				_gSaveEditorCenteredLabelTextFormat = new TextFormat();
				_gSaveEditorCenteredLabelTextFormat.size = 18;
				_gSaveEditorCenteredLabelTextFormat.color = 0xFFFFFF;
				_gSaveEditorCenteredLabelTextFormat.align = TextFormatAlign.CENTER;
				_gSaveEditorCenteredLabelTextFormat.leading = 0;
				_gSaveEditorCenteredLabelTextFormat.kerning = true;
				_gSaveEditorCenteredLabelTextFormat.bold = true;
				_gSaveEditorCenteredLabelTextFormat.font = "Lato";
			}
			return UIStyleSettings._gSaveEditorCenteredLabelTextFormat;
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
		
		private static var _gRoomLocationTextBustGlow:GlowFilter;
		public static function get gRoomLocationTextBustGlow():GlowFilter
		{
			if (UIStyleSettings._gRoomLocationTextBustGlow == null)
			{
				UIStyleSettings._gRoomLocationTextBustGlow = new GlowFilter(UIStyleSettings.gHighlightColour, 1, 4, 4, 5, 1, false, false);
			}
			return UIStyleSettings._gRoomLocationTextBustGlow;
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

		private static var _gMapCaveRoomFlagColourTransform:ColorTransform;
		public static function get gMapCaveRoomFlagColourTransform():ColorTransform
		{
			if (UIStyleSettings._gMapCaveRoomFlagColourTransform == null)
			{
				UIStyleSettings._gMapCaveRoomFlagColourTransform = new ColorTransform();
				UIStyleSettings._gMapCaveRoomFlagColourTransform.color = UIStyleSettings.gCaveRoomFlagColour;
			}
			return UIStyleSettings._gMapCaveRoomFlagColourTransform;
		}

		private static var _gMapForestRoomFlagColourTransform:ColorTransform;
		public static function get gMapForestRoomFlagColourTransform():ColorTransform
		{
			if (UIStyleSettings._gMapForestRoomFlagColourTransform == null)
			{
				UIStyleSettings._gMapForestRoomFlagColourTransform = new ColorTransform();
				UIStyleSettings._gMapForestRoomFlagColourTransform.color = UIStyleSettings.gForestRoomFlagColour;
			}
			return UIStyleSettings._gMapForestRoomFlagColourTransform;
		}
		private static var _gMapDesertRoomFlagColourTransform:ColorTransform;
		public static function get gMapDesertRoomFlagColourTransform():ColorTransform
		{
			if (UIStyleSettings._gMapDesertRoomFlagColourTransform == null)
			{
				UIStyleSettings._gMapDesertRoomFlagColourTransform = new ColorTransform();
				UIStyleSettings._gMapDesertRoomFlagColourTransform.color = UIStyleSettings.gDesertRoomFlagColour;
			}
			return UIStyleSettings._gMapDesertRoomFlagColourTransform;
		}
		private static var _gMapJungleRoomFlagColourTransform:ColorTransform;
		public static function get gMapJungleRoomFlagColourTransform():ColorTransform
		{
			if (UIStyleSettings._gMapJungleRoomFlagColourTransform == null)
			{
				UIStyleSettings._gMapJungleRoomFlagColourTransform = new ColorTransform();
				UIStyleSettings._gMapJungleRoomFlagColourTransform.color = UIStyleSettings.gJungleRoomFlagColour;
			}
			return UIStyleSettings._gMapJungleRoomFlagColourTransform;
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
		
		private static var _gMapTundraRoomColourTransform:ColorTransform;
		public static function get gMapTundraRoomColourTransform():ColorTransform
		{
			if (UIStyleSettings._gMapTundraRoomColourTransform == null)
			{
				UIStyleSettings._gMapTundraRoomColourTransform = new ColorTransform();
				UIStyleSettings._gMapTundraRoomColourTransform.color = UIStyleSettings.gTundraRoomFlagColour;
			}
			return UIStyleSettings._gMapTundraRoomColourTransform;
		}
		
		private static var _gMapFrozenRoomColourTransform:ColorTransform;
		public static function get gMapFrozenRoomColourTransform():ColorTransform
		{
			if (UIStyleSettings._gMapFrozenRoomColourTransform == null)
			{
				UIStyleSettings._gMapFrozenRoomColourTransform = new ColorTransform();
				UIStyleSettings._gMapFrozenRoomColourTransform.color = UIStyleSettings.gFrozenRoomFlagColour;
			}
			return UIStyleSettings._gMapFrozenRoomColourTransform;
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
		
		private static var _gPerkButtonAvailableColorTransform:ColorTransform;
		public static function get gPerkButtonAvailableColorTransform():ColorTransform
		{
			if (UIStyleSettings._gPerkButtonAvailableColorTransform == null)
			{
				UIStyleSettings._gPerkButtonAvailableColorTransform = new ColorTransform();
				UIStyleSettings._gPerkButtonAvailableColorTransform.color = UIStyleSettings.gForegroundColour;
			}
			return UIStyleSettings._gPerkButtonAvailableColorTransform;
		}
		
		private static var _gPerkButtonUnavailableColorTransform:ColorTransform;
		public static function get gPerkButtonUnavailableColorTransform():ColorTransform
		{
			if (UIStyleSettings._gPerkButtonUnavailableColorTransform == null)
			{
				UIStyleSettings._gPerkButtonUnavailableColorTransform = new ColorTransform();
				UIStyleSettings._gPerkButtonUnavailableColorTransform.color = UIStyleSettings.gPaleColour;
			}
			return UIStyleSettings._gPerkButtonUnavailableColorTransform;
		}
		
		private static var _gPerkButtonTakenColorTransform:ColorTransform;
		public static function get gPerkButtonTakenColorTransform():ColorTransform
		{
			if (UIStyleSettings._gPerkButtonTakenColorTransform == null)
			{
				UIStyleSettings._gPerkButtonTakenColorTransform = new ColorTransform;
				UIStyleSettings._gPerkButtonTakenColorTransform.color = UIStyleSettings.gHighlightColour;
			}
			return UIStyleSettings._gPerkButtonTakenColorTransform;
		}
		
		private static var _gMailListCSSStyleSheet:StyleSheet;
		public static function get gMailListCSSStyleSheet():StyleSheet
		{
			if (UIStyleSettings._gMailListCSSStyleSheet == null)
			{
				UIStyleSettings._gMailListCSSStyleSheet = new StyleSheet();
				
				var readFormat:Object = {
					fontFamily: "Lato",
					fontSize: 14,
					color: "#FFFFFF"
				};
				
				var unreadFormat:Object = {
					fontFamily: "Lato",
					fontSize:15,
					color: "#FFFFFF",
					fontWeight: "bold"
				};
				
				UIStyleSettings._gMailListCSSStyleSheet.setStyle(".unread", unreadFormat);
				UIStyleSettings._gMailListCSSStyleSheet.setStyle(".read", readFormat);
			}
			
			return UIStyleSettings._gMailListCSSStyleSheet;
		}
		
		// CSS Style Sheet to apply to "large" text blocks
		private static var _gMainTextCSSStyleSheet:StyleSheet;
		public static function get gMainTextCSSStyleSheet():StyleSheet
		{
			if (UIStyleSettings._gMainTextCSSStyleSheet == null)
			{
				UIStyleSettings._gMainTextCSSStyleSheet = new StyleSheet();
				
				var defaultFormat:Object = { 
					fontFamily: "Lato",
					//fontSize: 18,
					color: "#FFFFFF",
					marginRight: 5
				};
				
				var shieldDamage:Object = {
					fontFamily: "Lato",
					//fontSize: 18,
					color: "#00CCFF",
					marginRight: 5
				}

				var shieldHeal:Object = {
					fontFamily: "Lato",
					//fontSize: 18,
					color: "#caf4ff",
					marginRight: 5
				}
				
				var hpDamage:Object = {
					fontFamily: "Lato",
					//fontSize: 18,
					//OLD: color: "#00CC2F",
					color: "#fc3a3a",
					marginRight: 5
				}

				var hpHeal:Object = {
					fontFamily: "Lato",
					//fontSize: 18,
					color: "#00ff16",
					marginRight: 5
				}
				
				var lustDamage:Object = {
					fontFamily: "Lato",
					//fontSize: 18,
					//color: "#DD597E",
					//color: "#dd597e",
					color: "#ff00f0",
					marginRight: 5
				}

				var lustHeal:Object = {
					fontFamily: "Lato",
					//fontSize: 18,
					color: "#ffadc4",
					marginRight: 5
				}

				var energyDamage:Object = {
					fontFamily: "Lato",
					//fontSize: 18,
					color: "#ffd207",
					marginRight: 5
				}

				var energyHeal:Object = {
					fontFamily: "Lato",
					//fontSize: 18,
					color: "#fff3be",
					marginRight: 5
				}
				
				var good:Object = { 
					fontFamily: "Lato", 
					//fontSize: 18, 
					color: "#00CCFF", 
					marginRight: 5 
				};
				
				var bad:Object = { 
					fontFamily: "Lato", 
					//fontSize: 18, 
					color: "#CC3300", 
					marginRight: 5 
				};
				
				var caution:Object = { 
					fontFamily: "Lato", 
					//fontSize: 18, 
					color: "#E8C815", 
					marginRight: 5 
				};
				
				var passive:Object = { 
					fontFamily: "Lato", 
					//fontSize: 18, 
					color: "#D982EF", 
					marginRight: 5 
				};
				
				var indifferent:Object = { 
					fontFamily: "Lato", 
					//fontSize: 18, 
					color: "#FFFFFF", 
					marginRight: 5 
				};
				
				var header:Object = {
					fontFamily: "Univers UltraCondensed",
					fontSize: 72,
					color: "#FFFFFF",
					marginRight: 5
				}
				
				var blockHeader:Object = {
					fontFamily: "Univers UltraCondensed",
					fontSize: 28,
					color: "#FFFFFF",
					marginRight: 5
				}
				
				var lockedCodexEntry:Object = {
					fontFamily: "Lato",
					fontSize: 18,
					color: "#CC3300",
					marginRight: 0
				}
				
				var newCodexEntry:Object = {
					fontFamily: "Lato",
					fontSize: 18,
					color: "#CCBC14",
					marginRight: 0
				}
				
				var viewedCodexEntry:Object = {
					fontFamily: "Lato",
					fontSize: 18,
					color: "#FFFFFF",
					marginRight: 0
				}
				
				var activeCodexEntry:Object = {
					fontFamily: "Lato",
					fontSize: 18,
					color: "#00CCFF",
					marginRight: 0,
					fontWeight: "bold"
				}
				
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".words", defaultFormat);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".good", good);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".bad", bad);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".caution", caution);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".passive", passive);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".nothing", indifferent);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".header", header);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".blockHeader", blockHeader);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".locked", lockedCodexEntry);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".new", newCodexEntry);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".viewed", viewedCodexEntry);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".active", activeCodexEntry);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".shield", shieldDamage);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".shieldHeal", shieldHeal);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".hp", hpDamage);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".hpHeal", hpHeal);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".lust", lustDamage);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".lustHeal", lustHeal);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".energy", energyDamage);
				UIStyleSettings._gMainTextCSSStyleSheet.setStyle(".energyHeal", energyHeal);
			}
			return UIStyleSettings._gMainTextCSSStyleSheet;
		}
		
		private static var _gSharedStyleSheet:StyleSheet;
		public static function get gSharedStyleSheet():StyleSheet
		{
			if (UIStyleSettings._gSharedStyleSheet == null)
			{
				UIStyleSettings._gSharedStyleSheet = new StyleSheet();
				
				var defaultFormat:Object = { 
					fontFamily: "Lato",
					fontSize: 18,
					color: "#FFFFFF",
					marginRight: 5
				};
				
				var good:Object = { 
					fontFamily: "Lato", 
					fontSize: 18, 
					color: "#00CCFF", 
					marginRight: 5 
				};
				
				var bad:Object = { 
					fontFamily: "Lato", 
					fontSize: 18, 
					color: "#CC3300", 
					marginRight: 5 
				};
				
				var indifferent:Object = { 
					fontFamily: "Lato", 
					fontSize: 18, 
					color: "#FFFFFF", 
					marginRight: 5 
				};
				
				var header:Object = {
					fontFamily: "Univers UltraCondensed",
					fontSize: 72,
					color: "#FFFFFF",
					marginRight: 5
				}
				
				var blockHeader:Object = {
					fontFamily: "Univers UltraCondensed",
					fontSize: 28,
					color: "#FFFFFF",
					marginRight: 5
				}
				
				var lockedCodexEntry:Object = {
					fontFamily: "Lato",
					fontSize: 18,
					color: "#CC3300",
					marginRight: 0
				}
				
				var newCodexEntry:Object = {
					fontFamily: "Lato",
					fontSize: 18,
					color: "#CCBC14",
					marginRight: 0
				}
				
				var viewedCodexEntry:Object = {
					fontFamily: "Lato",
					fontSize: 18,
					color: "#FFFFFF",
					marginRight: 0
				}
				
				var activeCodexEntry:Object = {
					fontFamily: "Lato",
					fontSize: 18,
					color: "#00CCFF",
					marginRight: 0,
					fontWeight: "bold"
				}
				
				UIStyleSettings._gSharedStyleSheet.setStyle(".words", defaultFormat);
				UIStyleSettings._gSharedStyleSheet.setStyle(".good", good);
				UIStyleSettings._gSharedStyleSheet.setStyle(".bad", bad);
				UIStyleSettings._gSharedStyleSheet.setStyle(".nothing", indifferent);
				UIStyleSettings._gSharedStyleSheet.setStyle(".header", header);
				UIStyleSettings._gSharedStyleSheet.setStyle(".blockHeader", blockHeader);
				UIStyleSettings._gSharedStyleSheet.setStyle(".locked", lockedCodexEntry);
				UIStyleSettings._gSharedStyleSheet.setStyle(".new", newCodexEntry);
				UIStyleSettings._gSharedStyleSheet.setStyle(".viewed", viewedCodexEntry);
				UIStyleSettings._gSharedStyleSheet.setStyle(".active", activeCodexEntry);
			}
			return UIStyleSettings._gSharedStyleSheet;
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
		
		public static function cfgTextInput(obj:TextField):void
		{
			obj.backgroundColor = 0xFFFFFF;
			obj.border = true;
			obj.borderColor = 0xFFFFFF;
			obj.embedFonts = true;
			obj.antiAliasType = AntiAliasType.ADVANCED;
			obj.type = TextFieldType.INPUT;
			obj.defaultTextFormat = UIStyleSettings.gTextInputFormatter;
		}
		
		public static function cfgEditorTextInput(obj:TextField):void
		{
			obj.background = true;
			obj.backgroundColor = UIStyleSettings.gForegroundColour;
			obj.border = true;
			obj.borderColor = 0xFFFFFF;
			obj.embedFonts = true;
			obj.antiAliasType = AntiAliasType.ADVANCED;
			obj.type = TextFieldType.INPUT;
			obj.defaultTextFormat = UIStyleSettings.gTextInputFormatter;
		}
	}
}