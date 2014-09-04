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
		
		private var _gatsOldButton:MainMenuButton;
		private var _gatsButton:MainMenuButton;
		private var _cheshireButton:MainMenuButton;
		private var _noneButton:MainMenuButton;
		
		private var _optsProperty:String;
		
		private var _prio:int;
		
		public function BustsPreferenceControl(priority:int) 
		{
			_prio = priority;
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			this.Build();
		}
		
		private function Build():void
		{
			_noneButton = new MainMenuButton(false, buttonClickHandler);
			_noneButton.name = _noneButton.arg = "none";
			this.addChild(_noneButton);
			_noneButton.buttonName = "None";
			_noneButton.x = 780 - (_noneButton.width + 10);
			_noneButton.y = 30;
			
			_cheshireButton = new MainMenuButton(false, buttonClickHandler);
			_cheshireButton.name = _cheshireButton.arg = "CHESHIRE";
			this.addChild(_cheshireButton);
			_cheshireButton.buttonName = "Cheshire";
			_cheshireButton.x = _noneButton.x - (_cheshireButton.width + 5);
			_cheshireButton.y = 30;
						
			_gatsButton = new MainMenuButton(false, buttonClickHandler);
			_gatsButton.name = _gatsButton.arg = "GATS";
			this.addChild(_gatsButton);
			_gatsButton.buttonName = "Gats";
			_gatsButton.x = _cheshireButton.x - (_gatsButton.width + 5);
			_gatsButton.y = 30;
			
			_gatsOldButton = new MainMenuButton(false, buttonClickHandler);
			_gatsOldButton.name = _gatsOldButton.arg = "GATSOLD";
			this.addChild(_gatsOldButton);
			_gatsOldButton.buttonName = "Old Gats";
			_gatsOldButton.x = _gatsButton.x - (_gatsOldButton.width + 5);
			_gatsOldButton.y = 30;
			
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
			_descriptionText.styleSheet = UIStyleSettings.gSharedStyleSheet;
			_descriptionText.name = "name";
			if (_prio == 0) _descriptionText.htmlText = "<span class='words'><p><b>Primary bust preference.</b></p></span>";
			if (_prio == 1) _descriptionText.htmlText = "<span class='words'><p><b>Secondary bust preference.</b></p></span>";
			if (_prio == 2) _descriptionText.htmlText = "<span class='words'><p><b>Tertiary bust preference.</b></p></span>";
			this.addChild(_descriptionText);
			
			_descriptionText.width = _gatsButton.x - 10;
			_descriptionText.height = _gatsButton.bodyHeight();
			
			updateStateFromOptions();
		}
		
		private function updateStateFromOptions():void
		{
			var opts:GameOptions = kGAMECLASS.gameOptions;
			
			if (opts.getBustPriority(_prio) == null)
			{
				_gatsButton.DeHighlight();
				_cheshireButton.DeHighlight();
				_noneButton.Highlight();
				_gatsOldButton.DeHighlight();
			}
			else if (opts.getBustPriority(_prio) == "CHESHIRE")
			{
				_gatsOldButton.DeHighlight();
				_gatsButton.DeHighlight();
				_cheshireButton.Highlight();
				_noneButton.DeHighlight();
			}
			else if (opts.getBustPriority(_prio) == "GATS")
			{
				_gatsOldButton.DeHighlight();
				_gatsButton.Highlight();
				_cheshireButton.DeHighlight();
				_noneButton.DeHighlight();
			}
			else if (opts.getBustPriority(_prio) == "GATSOLD")
			{
				_gatsOldButton.Highlight();
				_gatsButton.DeHighlight();
				_cheshireButton.DeHighlight();
				_noneButton.DeHighlight();
			}
		}
		
		public function updateDisplay():void
		{
			updateStateFromOptions();
		}
		
		private function buttonClickHandler(buttonName:String):void
		{
			var tName:String = buttonName;
			
			kGAMECLASS.gameOptions.setBustPriority(tName, _prio);
			
			updateStateFromOptions();
		}
	}
}