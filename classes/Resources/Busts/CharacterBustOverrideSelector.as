package classes.Resources.Busts 
{
	import classes.UIComponents.ContentModuleComponents.MainMenuButton;
	import classes.UIComponents.MainButton;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import classes.GLOBAL;
	import classes.Resources.NPCBustImages;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	import classes.UIComponents.UIStyleSettings;
	import classes.kGAMECLASS;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class CharacterBustOverrideSelector extends Sprite
	{
		private var _bustName:String;
		private var _bustDisplays:Object;
		private var _container:Sprite;
		private var _background:Sprite;
		
		private var _clearSetting:MainMenuButton;
		private var _close:MainMenuButton;
		
		public function CharacterBustOverrideSelector(bustName:String) 
		{
			super();
			_bustName = "Bust_" + bustName;
			name = "bustSelector";
			_bustDisplays = { };
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Build();
		}
		
		public function Build():void
		{
			_container = new Sprite();
			addChild(_container);
			
			for (var i:int = 0; i < GLOBAL.VALID_ARTISTS.length; i++)
			{
				if (_bustName in NPCBustImages[GLOBAL.VALID_ARTISTS[i]])
				{
					addSelectableBust(GLOBAL.VALID_ARTISTS[i]);
				}
			}
			
			finalize();
		}
		
		private function finalize():void
		{
			var i:int = 0;
			for (var key:String in _bustDisplays)
			{
				_bustDisplays[key].x = Math.round((int(_bustDisplays[key].width) * int(i % 3))) + 10;
				_bustDisplays[key].y = Math.round((int(_bustDisplays[key].height) * int(i / 3))) + 10;
				i++;
			}
			
			_background = new Sprite();
			_background.graphics.beginFill(UIStyleSettings.gForegroundColour);
			_background.graphics.drawRect(0, 0, _container.width + 35, _container.height + 80);
			_background.graphics.endFill();
			addChildAt(_background, 0);
			_container.x = 10;
			_container.y = 10;
			
			trace(stage.width);
			trace(_background.width);
			
			_background.x = Math.round(stage.stageWidth - _background.width) / 2;
			_background.y = 5;
			_background.addChild(_container);
			
			_close = new MainMenuButton();
			_close.buttonName = "Save";
			_close.func = saveSetting;
		}
		
		private function saveSetting():void
		{
			var hasSelected:Boolean = false;
			for (var key:String in _bustDisplays)
			{
				if (_bustDisplays[key].selected)
				{
					hasSelected = true;
					kGAMECLASS.gameOptions.configuredBustPreferences[key];
				}
			}
			
			if (!hasSelected)
			{
				delete kGAMECLASS.gameOptions.configuredBustPreferences[key];
			}
			
			stage.removeChild(stage.getChildByName("bustSelector"));
		}
		
		private function addSelectableBust(artistName:String):void
		{
			_bustDisplays[artistName] = new SelectableSingleBustDisplay(artistName);
			_container.addChild(_bustDisplays[artistName]);
			
			if (kGAMECLASS.gameOptions.configuredBustPreferences[_bustName] != undefined)
			{
				_bustDisplays.selected = true;
			}
		}
		
		public function deselectChildren():void
		{
			for (var key:String in _bustDisplays)
			{
				(_bustDisplays[key] as SelectableSingleBustDisplay).selected = false;
			}
		}
	}

}