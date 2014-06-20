package classes.UIComponents.ContentModuleComponents 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextField;
	import classes.GameData.GameOptions;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import classes.kGAMECLASS;
	import flash.text.AntiAliasType;
	import classes.UIComponents.UIStyleSettings;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class BustsPreferenceControl extends Sprite
	{
		private var _descriptionText:TextField;
		
		private var _gatsButton:MainMenuButton;
		private var _chesireButton:MainMenuButton;
		private var _noneButton:MainMenuButton;
		
		private var _optsProperty:String;
		
		public function BustsPreferenceControl() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			this.Build();
		}
		
		private function Build():void
		{
			_noneButton = new MainMenuButton();
			_noneButton.name = "none";
			this.addChild(_noneButton);
			_noneButton.buttonName = "None";
			_noneButton.x = 780 - (_noneButton.width + 10);
			
			_chesireButton = new MainMenuButton();
			_chesireButton.name = "CHESIRE";
			this.addChild(_chesireButton);
			_chesireButton.buttonName = "Chesire";
			_chesireButton.x = _noneButton.x - (_chesireButton.width + 5);
						
			_gatsButton = new MainMenuButton();
			_gatsButton.name = "GATS";
			this.addChild(_gatsButton);
			_gatsButton.buttonName = "Gats";
			_gatsButton.x = _chesireButton.x - (_gatsButton.width + 5);
			
			_descriptionText = new TextField();
			_descriptionText = new TextField();
			_descriptionText.border = false;
			_descriptionText.background = false;
			_descriptionText.multiline = true;
			_descriptionText.wordWrap = true;
			_descriptionText.embedFonts = true;
			_descriptionText.antiAliasType = AntiAliasType.ADVANCED;
			_descriptionText.x = 5;
			_descriptionText.y = 0;
			_descriptionText.styleSheet = UIStyleSettings.gMainTextCSSStyleSheet;
			_descriptionText.name = "name";
			_descriptionText.htmlText = "<span class='words'><p><b>Bust display preference.</b></p></span>";
			this.addChild(_descriptionText);
			
			_descriptionText.width = _gatsButton.x - 10;
			_descriptionText.height = _gatsButton.bodyHeight();
			
			_descriptionText.y += Math.round((_descriptionText.height - _descriptionText.textHeight) / 2);
			_descriptionText.height = _descriptionText.textHeight;
			
			_noneButton.addEventListener(MouseEvent.CLICK, buttonClickHandler);
			_chesireButton.addEventListener(MouseEvent.CLICK, buttonClickHandler);
			_gatsButton.addEventListener(MouseEvent.CLICK, buttonClickHandler);
			
			updateStateFromOptions();
		}
		
		private function updateStateFromOptions():void
		{
			var opts:GameOptions = kGAMECLASS.gameOptions;
			
			if (opts.bustsEnabled == false)
			{
				_gatsButton.DeHighlight();
				_chesireButton.DeHighlight();
				_noneButton.Highlight();
			}
			else
			{
				if (opts.bustPriority[0] == "CHESIRE")
				{
					_gatsButton.DeHighlight();
					_chesireButton.Highlight();
					_noneButton.DeHighlight();
				}
				else
				{
					_gatsButton.Highlight();
					_chesireButton.DeHighlight();
					_noneButton.DeHighlight();
				}
			}
		}
		
		private function buttonClickHandler(e:MouseEvent):void
		{
			var tName:String = e.target.name;
			
			if (tName == "none") kGAMECLASS.gameOptions.bustsEnabled = false;
			if (tName == "CHESIRE")
			{
				kGAMECLASS.gameOptions.bustPriority = ["CHESIRE", "GATS"];
				kGAMECLASS.gameOptions.bustsEnabled = true;
			}
			if (tName == "GATS") 
			{
				kGAMECLASS.gameOptions.bustPriority = ["GATS", "CHESIRE"];
				kGAMECLASS.gameOptions.bustsEnabled = true;
			}
			
			updateStateFromOptions();
		}
	}
}