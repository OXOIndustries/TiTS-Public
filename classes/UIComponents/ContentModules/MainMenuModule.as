package classes.UIComponents.ContentModules 
{
	import classes.TiTS;
	import classes.UIComponents.ContentModuleComponents.MainMenuButton;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.ContentModule;
	import classes.UIComponents.UIStyleSettings;
	import flash.text.AntiAliasType;
	import classes.UIComponents.ContentModule;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class MainMenuModule extends ContentModule
	{	
		// Embed assets purely used for this module.
		[Embed(source = "../../../assets/modules/mainmenu/tits_logo2.png", mimeType = "image/png")]
		private static var Tits_Logo:Class;
		
		[Embed(source = "../../../assets/modules/mainmenu/warning.svg", mimeType = "image/svg")]
		private static var Warning_BG:Class;
		
		// Display elements
		private var _mainMenuButtons:Vector.<MainMenuButton>;
		
		public function get mainMenuButtons():Array
		{
			var btnArray:Array = new Array();
			
			for (var i:int = 0; i < _mainMenuButtons.length; i++)
			{
				btnArray.push(_mainMenuButtons[i]);
			}
			
			return btnArray;
		}
		
		private var _titsLogo:DisplayObject;
		private var _warningBackground:Sprite;
		private var _warningText:TextField;
		private var _creditText:TextField;
		private var _websiteText:TextField;
		
		public function get warningText():TextField { return _warningText; }
		public function get creditText():TextField { return _creditText; }
		public function get websiteText():TextField { return _websiteText; }
		
		public function MainMenuModule() 
		{
			leftBarEnabled = true;
			rightBarEnabled = true;
			fullButtonTrayEnabled = true;
			_moduleName = "MainMenu";
			
			_mainMenuButtons = new Vector.<MainMenuButton>();
			
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
			_creditText.htmlText = "Created by Fenoxo, Text Parser written by Fake-Name, UI Code by Gedan.\nEdited by Zeikfried, Prisoner416, and many more.\n<b>Game Version: " + (this.root as TiTS).version + "</b>";
			
			
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
			_websiteText.htmlText = "<a href='http://www.taintedspace.com'>www.taintedspace.com</a>";
			
			
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
			_warningText.htmlText = "This is an adult game meant to be played by adults. Do not play this game\nif you are under the age of 18, and certainly don't\nplay this if exotic and strange fetishes disgust you. <b>You've been warned!</b>";
		}
		
		private function BuildButtons():void
		{
			var posX:int = 10;
			var posY:int = 518;
			
			for (var btnIdx:int = 0; btnIdx < 6; btnIdx++)
			{
				var newBtn:MainMenuButton = new MainMenuButton(); 
				
				if (btnIdx == 3)
				{
					posX -= 474;
					posY += 50;
				}
				
				posX += 158;
				
				this.addChild(newBtn);
				
				newBtn.x = posX;
				newBtn.y = posY;
				newBtn.mouseChildren = false;
				
				_mainMenuButtons.push(newBtn);
			}
		}
	}
}