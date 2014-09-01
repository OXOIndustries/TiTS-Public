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
	public class OptionsTextSizeControl extends Sprite
	{
		private var _descriptionText:TextField;
		private var _incButton:MainMenuButton;
		private var _decButton:MainMenuButton;
		private var _previewText:TextField;
		
		public function OptionsTextSizeControl() 
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
			_incButton = new MainMenuButton(true);
			this.addChild(_incButton);
			_incButton.x = 780 - (_incButton.width + 10);
			_incButton.func = buttonClickHandler;
			_incButton.arg = "inc";
			_incButton.buttonName = "Increase\nFont Size";
			
			_decButton = new MainMenuButton(true);
			this.addChild(_decButton);
			_decButton.x = _incButton.x - (_decButton.width + 5);
			_decButton.func = buttonClickHandler;
			_decButton.arg = "dec";
			_decButton.buttonName = "Decrease\nFont Size";
			
			_descriptionText = new TextField();
			_descriptionText.border = false;
			_descriptionText.background = false;
			_descriptionText.multiline = true;
			_descriptionText.wordWrap = true;
			_descriptionText.embedFonts = true;
			_descriptionText.antiAliasType = AntiAliasType.ADVANCED;
			_descriptionText.x = 5;
			_descriptionText.y = 0;
			_descriptionText.styleSheet = UIStyleSettings.gSharedStyleSheet;
			_descriptionText.name = "text";
			_descriptionText.htmlText = "<span class='words'><p><b>Main content display font size.</b></p></span>";
			this.addChild(_descriptionText);
			_descriptionText.width = _decButton.x - 15;
			_descriptionText.height = _decButton.bodyHeight();
			_descriptionText.y += Math.round((_descriptionText.height - _descriptionText.textHeight) / 2);
			_descriptionText.height = _descriptionText.textHeight;
			
			_previewText = new TextField();
			_previewText.border = false;
			_previewText.background = false;
			_previewText.multiline = true;
			_previewText.wordWrap = true;
			_previewText.embedFonts = true;
			_previewText.antiAliasType = AntiAliasType.ADVANCED;
			_previewText.x = 5;
			_previewText.y = _decButton.y + _decButton.height + 5;
			_previewText.width = 770;
			_previewText.styleSheet = UIStyleSettings.gMainTextCSSStyleSheet;
			_previewText.name = "preview";
			_previewText.htmlText = "<span class='words'><p>This is some example text to preview the currently configured font size.</p></span>";
			this.addChild(_previewText);
			_previewText.height = 120;
		}
		
		private function updateStateFromOptions():void
		{
			var fSize:int = kGAMECLASS.gameOptions.fontSize;
			
			// Grab the font size from the preview display
			var cStyle:StyleSheet = _previewText.styleSheet;
			if (cStyle.getStyle(".words").fontSize != fSize)
			{
				cStyle.setStyle(".words", {fontFamily: "Lato", fontSize: fSize, color: "#FFFFFF", marginRight: 5});
				_previewText.styleSheet = cStyle;
			}			
		}
		
		public function updateDisplay():void
		{
			updateStateFromOptions();
		}
		
		private function buttonClickHandler(arg:String):void
		{
			var change:int = 0;
			
			if (arg == "inc") change++;
			if (arg == "dec") change--;

			kGAMECLASS.gameOptions["fontSize"] += change;
			
			if (kGAMECLASS.gameOptions.fontSize < 12) kGAMECLASS.gameOptions.fontSize = 12;
			if (kGAMECLASS.gameOptions.fontSize > 26) kGAMECLASS.gameOptions.fontSize = 26;

			updateDisplay();
		}
	}

}