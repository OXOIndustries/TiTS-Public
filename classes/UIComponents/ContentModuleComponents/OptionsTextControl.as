package classes.UIComponents.ContentModuleComponents
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	import classes.UIComponents.UIStyleSettings;
	import classes.kGAMECLASS;

	/**
	 * ...
	 * @author Gedan
	 */
	public class OptionsTextControl extends Sprite
	{
		private var _fontSizeText:TextField;
		private var _incFontSizeButton:MainMenuButton;
		private var _decFontSizeButton:MainMenuButton;
		private var _rstFontSizeButton:MainMenuButton;

		private var _fontLeadingText:TextField;
		private var _incFontLeadingButton:MainMenuButton;
		private var _decFontLeadingButton:MainMenuButton;
		private var _rstFontLeadingButton:MainMenuButton;

		private var _previewText:TextField;

		public function OptionsTextControl()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			this.Build();

			updateDisplay();
		}

		private function Build():void
		{
			// Font Size Row

			_incFontSizeButton = new MainMenuButton(true);
			this.addChild(_incFontSizeButton);
			_incFontSizeButton.x = 760 - (_incFontSizeButton.width + 10);
			_incFontSizeButton.buttonName = "Increase\nFont Size";
			_incFontSizeButton.func = fontSizeButtonHandler;
			_incFontSizeButton.arg = "inc";

			_decFontSizeButton = new MainMenuButton(true);
			this.addChild(_decFontSizeButton);
			_decFontSizeButton.x = _incFontSizeButton.x - (_decFontSizeButton.width + 5);
			_decFontSizeButton.buttonName = "Decrease\nFont Size";
			_decFontSizeButton.func = fontSizeButtonHandler;
			_decFontSizeButton.arg = "dec";

			_rstFontSizeButton = new MainMenuButton(true);
			this.addChild(_rstFontSizeButton);
			_rstFontSizeButton.buttonName = "Reset\nFont Size";
			_rstFontSizeButton.func = fontSizeButtonHandler;
			_rstFontSizeButton.arg = "reset";
			_rstFontSizeButton.x = _decFontSizeButton.x - (_rstFontSizeButton.width + 5);

			_fontSizeText = new TextField();
			_fontSizeText.border = false;
			_fontSizeText.background = false;
			_fontSizeText.multiline = false;
			_fontSizeText.wordWrap = true;
			_fontSizeText.embedFonts = true;
			_fontSizeText.mouseEnabled = false;
			_fontSizeText.mouseWheelEnabled = false;
			_fontSizeText.antiAliasType = AntiAliasType.ADVANCED;
			_fontSizeText.x = 5;
			_fontSizeText.y = 0;
			_fontSizeText.styleSheet = UIStyleSettings.gSharedStyleSheet;
			_fontSizeText.name = "text";
			_fontSizeText.htmlText = "<span class='words'><p><b>Main content font size: " + kGAMECLASS.gameOptions.fontSize + "</b></p></span>"
			this.addChild(_fontSizeText);
			_fontSizeText.width = _rstFontSizeButton.x - 15;
			_fontSizeText.height = _rstFontSizeButton.bodyHeight();
			_fontSizeText.y = Math.round((_fontSizeText.height - _fontSizeText.textHeight) / 2);
			_fontSizeText.height = _fontSizeText.textHeight;

			// Font Leading Row

			var fontLeadingY:int = _incFontSizeButton.y + _incFontSizeButton.height + 5;

			_incFontLeadingButton = new MainMenuButton(true);
			this.addChild(_incFontLeadingButton);
			_incFontLeadingButton.x = 760 - (_incFontLeadingButton.width + 10);
			_incFontLeadingButton.y = fontLeadingY;
			_incFontLeadingButton.buttonName = "Increase\nLine Height";
			_incFontLeadingButton.func = fontLeadingButtonHandler;
			_incFontLeadingButton.arg = "inc";

			_decFontLeadingButton = new MainMenuButton(true);
			this.addChild(_decFontLeadingButton);
			_decFontLeadingButton.x = _incFontSizeButton.x - (_decFontLeadingButton.width + 5);
			_decFontLeadingButton.y = fontLeadingY;
			_decFontLeadingButton.buttonName = "Decrease\nLine Height";
			_decFontLeadingButton.func = fontLeadingButtonHandler;
			_decFontLeadingButton.arg = "dec";

			_rstFontLeadingButton = new MainMenuButton(true);
			this.addChild(_rstFontLeadingButton);
			_rstFontLeadingButton.buttonName = "Reset\nLine Height";
			_rstFontLeadingButton.func = fontLeadingButtonHandler;
			_rstFontLeadingButton.arg = "reset";
			_rstFontLeadingButton.x = _decFontLeadingButton.x - (_rstFontLeadingButton.width + 5);
			_rstFontLeadingButton.y = fontLeadingY;

			_fontLeadingText = new TextField();
			_fontLeadingText.border = false;
			_fontLeadingText.background = false;
			_fontLeadingText.multiline = false;
			_fontLeadingText.wordWrap = true;
			_fontLeadingText.embedFonts = true;
			_fontLeadingText.mouseEnabled = false;
			_fontLeadingText.mouseWheelEnabled = false;
			_fontLeadingText.antiAliasType = AntiAliasType.ADVANCED;
			_fontLeadingText.x = 5;
			_fontLeadingText.y = fontLeadingY;
			_fontLeadingText.styleSheet = UIStyleSettings.gSharedStyleSheet;
			_fontLeadingText.name = "text";
			_fontLeadingText.htmlText = "<span class='words'><p><b>Main content line height: " + kGAMECLASS.gameOptions.fontLeading + "</b></p></span>";
			this.addChild(_fontLeadingText);
			_fontLeadingText.width = _rstFontLeadingButton.x - 15;
			_fontLeadingText.height = _rstFontLeadingButton.bodyHeight();
			_fontLeadingText.y = fontLeadingY + Math.round((_fontLeadingText.height - _fontLeadingText.textHeight) / 2);
			_fontLeadingText.height = _fontLeadingText.textHeight;

			// Preview Text Row

			_previewText = new TextField();
			_previewText.border = false;
			_previewText.background = false;
			_previewText.multiline = true;
			_previewText.wordWrap = true;
			_previewText.mouseEnabled = false;
			_previewText.mouseWheelEnabled = false;
			_previewText.embedFonts = true;
			_previewText.antiAliasType = AntiAliasType.ADVANCED;
			_previewText.x = 5;
			_previewText.y = _incFontLeadingButton.y + _incFontLeadingButton.height + 5;
			_previewText.width = 760;
			_previewText.height = 140;
			_previewText.styleSheet = UIStyleSettings.gMainTextCSSStyleSheet;
			_previewText.name = "preview";
			_previewText.htmlText = "<span class='words'><p>Victor Steele is one of the richest men in the galaxy. His fortune was gained through years of adventuring during the Thirteenth Great Planet Rush, almost two hundred years ago. His trillion dollar company, Steele Industrial Technologies and Production, or Steele Tech, is one of the most respected names in its field.</p></span>";
			this.addChild(_previewText);
		}
		
		public function updateDisplay():void
		{
			updateStateFromOptions();
		}

		private function updateStateFromOptions():void
		{
			_fontSizeText.htmlText = "<span class='words'><p><b>Main content font size: " + kGAMECLASS.gameOptions.fontSize + "</b></p></span>";
			_fontLeadingText.htmlText = "<span class='words'><p><b>Main content line height: " + kGAMECLASS.gameOptions.fontLeading + "</b></p></span>";

			// The GUI is not available on startup so we guard against that here.
			if (kGAMECLASS.userInterface) {
				// Apply the styles from the GUI refreshTextStyles method.
				kGAMECLASS.userInterface.refreshTextStyles();
			}
		}

		private function fontSizeButtonHandler(arg:String):void
		{
			var fontSize:int = kGAMECLASS.gameOptions.fontSize;
			if (arg == "inc" && fontSize < 26) fontSize++;
			if (arg == "dec" && fontSize > 12) fontSize--;
			if (arg == "reset") fontSize = 18;

			kGAMECLASS.gameOptions.fontSize = fontSize;
			updateDisplay();
		}

		private function fontLeadingButtonHandler(arg:String):void
		{
			var fontLeading:int = kGAMECLASS.gameOptions.fontLeading;
			if (arg == "inc" && fontLeading < 16) fontLeading++;
			if (arg == "dec" && fontLeading > -2) fontLeading--;
			if (arg == "reset") fontLeading = 0;

			kGAMECLASS.gameOptions.fontLeading = fontLeading;
			updateDisplay();
		}
	}
}
