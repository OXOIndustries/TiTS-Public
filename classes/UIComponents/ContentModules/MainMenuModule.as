package classes.UIComponents.ContentModules 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import UIComponents.ContentModule;
	import classes.UIComponents.UIStyleSettings;
	import flash.text.AntiAliasType;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class MainMenuModule extends ContentModule
	{	
		// Embed assets purely used for this module.
		[Embed(source = "../../../assets/modules/mainmenu/tits_logo.svg", mimeType = "image/svg")]
		private static var Tits_Logo:Class;
		
		[Embed(source = "../../../assets/modules/mainmenu/warning.svg", mimeType = "image/svg")]
		private static var Warning_BG:Class;
		
		// Display elements
		private var _mainMenuButtons:Array;
		private var _titsLogo:Sprite;
		
		private var _warningBackground:Sprite;
		private var _warningText:TextField;
		
		private var _creditText:TextField;
		
		private var _websiteText:TextField;
		
		public function MainMenuModule() 
		{
			leftBarEnabled = true;
			rightBarEnabled = true;
			fullButtonTrayEnabled = true;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.BuildGraphicsElements();
			this.BuildTextElements();
			this.BuildButtons();
		}
		
		private function BuildGraphicsElements():void 
		{
			_titsLogo = new MainMenuModule.Tits_Logo();
			_titsLogo.x = 168;
			_titsLogo.y = 142;
			this.addChild(_titsLogo);
			
			_warningBackground = new MainMenuModule.Warning_BG();
			_warningBackground.x = 10;
			_warningBackground.y = 380;
			this.addChild(_warningBackground);
		}
		
		private function BuildTextElements():void
		{
			_creditText = new TextField();
			_creditText.border = false;
			_creditText.background = false;
			_creditText.multiline = true;
			_creditText.wordWrap = true;
			_creditText.embedFonts = true;
			_creditText.antiAliasType = AntiAliasType.ADVANCED;
			_creditText.defaultTextFormat = UIStyleSettings.gMainMenuTextFormatter;
			_creditText.mouseEnabled = false;
			_creditText.mouseWheelEnabled = false;
			this.addChild(_creditText);
			
			_creditText.x = 10; // 210
			_creditText.y = 305;
			_creditText.height = 77;
			_creditText.width = 780;
			
			
			// Fuck with this to test hyperlink shit
			_websiteText = new TextField();
			_websiteText.border = false;
			_websiteText.background = false;
			_websiteText.multiline = true;
			_websiteText.wordWrap = true;
			_websiteText.embedFonts = true;
			_websiteText.antiAliasType = AntiAliasType.ADVANCED;
			_websiteText.defaultTextFormat = UIStyleSettings.gMainMenuTextFormatter;
			_websiteText.mouseEnabled = true;
			_websiteText.mouseWheelEnabled = false;
			this.addChild(_websiteText);
			
			_websiteText.x = 10;
			_websiteText.y = 475;
			_websiteText.width = 780;
			_websiteText.height = 25;
			_websiteText.text = "http://www.TrialsInTaintedSpace.com";
			
			
			// Rework the positioning so it sits inside the warning bkg elem
			_warningText = new TextField();
			_warningText.border = false;
			_warningText.background = false;
			_warningText.multiline = true;
			_warningText.wordWrap = true;
			_warningText.embedFonts = true;
			_warningText.antiAliasType = AntiAliasType.ADVANCED;
			_warningText.defaultTextFormat = UIStyleSettings.gMainMenuTextFormatter;
			_warningText.mouseEnabled = false;
			_warningText.mouseWheelEnabled = false;
			this._warningBackground.addChild(_warningText);
			
			_warningText.x = 95;
			_warningText.y = 10;
			_warningText.height = 75;
			_warningText.width = 655;
		}
		
	}

}