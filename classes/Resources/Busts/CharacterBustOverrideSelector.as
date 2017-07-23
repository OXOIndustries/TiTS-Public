package classes.Resources.Busts 
{
	import classes.TiTS;
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
		private var _bustList:Array;
		private var _bustName:String;
		private var _bustDisplays:Object;
		private var _numBustDisplays:int;
		private var _container:Sprite;
		private var _background:Sprite;
		
		private var _close:MainMenuButton;
		private var _blank:MainMenuButton;
		private var _clear:MainMenuButton;
		
		public function CharacterBustOverrideSelector(bustList:Array, bustIdx:int) 
		{
			super();
			_bustList = bustList;
			_bustName = bustList[bustIdx];
			name = "bustSelector";
			_numBustDisplays = 0;
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
				if (("Bust_" + _bustName) in NPCBustImages[GLOBAL.VALID_ARTISTS[i]])
				{
					addSelectableBust(GLOBAL.VALID_ARTISTS[i], _bustName);
				}
			}
			
			// Fallbacks - search for the other inherent variant of a character bust if the primary isn't actually available anywhere
			if (_bustName.indexOf("_NUDE") == -1 && _numBustDisplays == 0)
			{
				for (i = 0; i < GLOBAL.VALID_ARTISTS.length; i++)
				{
					if (("Bust_" + _bustName + "_NUDE") in NPCBustImages[GLOBAL.VALID_ARTISTS[i]])
					{
						addSelectableBust(GLOBAL.VALID_ARTISTS[i], _bustName + "_NUDE");
					}
				}
			}
			else if (_bustName.indexOf("_NUDE") != -1 && _numBustDisplays == 0)
			{
				var tBustName:String = _bustName.split("_NUDE")[0];
				for (i = 0; i < GLOBAL.VALID_ARTISTS.length; i++)
				{
					if (tBustName in NPCBustImages[GLOBAL.VALID_ARTISTS[i]])
					{
						addSelectableBust(GLOBAL.VALID_ARTISTS[i], tBustName);
					}
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
			_background.graphics.beginFill(UIStyleSettings.gBackgroundColour);
			_background.graphics.lineStyle(3, UIStyleSettings.gForegroundColour);
			_background.graphics.drawRect(0, 0, 735, _container.height + 80);
			_background.graphics.endFill();
			addChildAt(_background, 0);
			
			_background.x = Math.round(stage.stageWidth - _background.width) / 2;
			_background.y = 15;
			_background.addChild(_container);
			
			_container.x = Math.round((735 - _container.width) / 2) - 10;
			_container.y = 10;
			
			
			_close = new MainMenuButton();
			addChild(_close);
			_close.buttonName = "Save";
			_close.func = saveSetting;
			_close.x = _background.width - 10 - _close.width;
			_close.y = _background.height - 10 - _close.height;
			_background.addChild(_close);
			
			_blank = new MainMenuButton();
			addChild(_blank);
			_blank.buttonName = "Hide Character";
			_blank.func = setNoBustDisplayed;
			_blank.x = _close.x - _blank.width - 10;
			_blank.y = _close.y;
			_background.addChild(_blank);
			if (_bustName in kGAMECLASS.gameOptions.configuredBustPreferences)
			{
				if (kGAMECLASS.gameOptions.configuredBustPreferences[_bustName] == "NONE")
				{
					_blank.Highlight();
				}
			}
			
			_clear = new MainMenuButton();
			addChild(_clear);
			_clear.buttonName = "Clear Setting";
			_clear.func = clearBustSetting;
			_clear.x = _blank.x - _clear.width - 10;
			_clear.y = _blank.y;
			_background.addChild(_clear);
		}
		
		private function clearBustSetting():void
		{
			deselectChildren();
			_clear.Highlight();
		}
		
		private function setNoBustDisplayed():void
		{
			deselectChildren();
			_blank.Highlight();
		}
		
		private function saveSetting():void
		{
			for (var key:String in _bustDisplays)
			{
				if (_bustDisplays[key].selected)
				{
					kGAMECLASS.gameOptions.configuredBustPreferences[_bustName] = key;
				}
			}
			
			if (_blank.IsOn())
			{
				kGAMECLASS.gameOptions.configuredBustPreferences[_bustName] = "NONE";
			}
			
			if (_clear.IsOn())
			{
				delete kGAMECLASS.gameOptions.configuredBustPreferences[_bustName];
			}
			
			closeDisplay();
		}
		
		private function closeDisplay():void
		{
			stage.removeChild(stage.getChildByName("bustSelector"));
			
			// For some reason, kGAMECLASS.showBust() can't take in an array input and output the result properly...
			switch(_bustList.length)
			{
				case 2: kGAMECLASS.showBust(_bustList[0],_bustList[1]); break;
				case 3: kGAMECLASS.showBust(_bustList[0],_bustList[1],_bustList[2]); break;
				case 4: kGAMECLASS.showBust(_bustList[0],_bustList[1],_bustList[2],_bustList[3]); break;
				case 5: kGAMECLASS.showBust(_bustList[0],_bustList[1],_bustList[2],_bustList[3],_bustList[4]); break;
				case 6: kGAMECLASS.showBust(_bustList[0],_bustList[1],_bustList[2],_bustList[3],_bustList[4],_bustList[5]); break;
				case 7: kGAMECLASS.showBust(_bustList[0],_bustList[1],_bustList[2],_bustList[3],_bustList[4],_bustList[5],_bustList[6]); break;
				case 8: kGAMECLASS.showBust(_bustList[0],_bustList[1],_bustList[2],_bustList[3],_bustList[4],_bustList[5],_bustList[6],_bustList[7]); break;
				default: kGAMECLASS.showBust(_bustName); break;
			}
			/*
			kGAMECLASS.showBust(_bustList);
			*/
		}
		
		private function addSelectableBust(artistName:String, targetBustName:String):void
		{
			_bustDisplays[artistName] = new SelectableSingleBustDisplay(artistName, targetBustName);
			_numBustDisplays++;
			_container.addChild(_bustDisplays[artistName]);
			
			if (_bustName in kGAMECLASS.gameOptions.configuredBustPreferences)
			{
				if (kGAMECLASS.gameOptions.configuredBustPreferences[_bustName] == artistName)
				{
					_bustDisplays[artistName].selected = true;
				}
			}
		}
		
		public function deselectChildren():void
		{
			for (var key:String in _bustDisplays)
			{
				(_bustDisplays[key] as SelectableSingleBustDisplay).selected = false;
			}
			_blank.DeHighlight();
			_close.DeHighlight();
			_clear.DeHighlight();
		}
	}

}