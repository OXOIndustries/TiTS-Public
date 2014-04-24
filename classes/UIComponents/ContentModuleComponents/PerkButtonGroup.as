package classes.UIComponents.ContentModuleComponents 
{
	import classes.Creature;
	import flash.display.Sprite;
	import flash.events.Event;
	import classes.GameData.PerkData;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class PerkButtonGroup extends Sprite
	{
		private var _buttons:Vector.<PerkButton>;
		
		private var _groupLevel:int;
		public function get groupLevel():int { return _groupLevel; }
		public function set groupLevel(v:int):void { _groupLevel = v; }
		
		public function get buttonOne():PerkButton { return _buttons[0]; }
		public function get buttonTwo():PerkButton { return _buttons[1]; }
		
		public function PerkButtonGroup() 
		{
			_buttons = new Vector.<PerkButton>();
			_buttons[0] = new PerkButton();
			_buttons[1] = new PerkButton();
		}
		
		public function setPerkData(perk1:PerkData, perk2:PerkData = null):void
		{
			_buttons[0].x = 0;
			
			if (_buttons[0].parent == null)
			{
				this.addChild(_buttons[0]);
			}
			
			_buttons[1].x = _buttons[0].x + _buttons[0].width + 10;
			
			if (perk2 != null)
			{
				if (_buttons[1].parent == null)
				{
					this.addChild(_buttons[1]);
				}
			}
			else
			{
				if (_buttons[1].parent != null)
				{
					this.removeChild(_buttons[1]);
				}
			}
			
			_buttons[0].setPerkData(perk1);
			if (perk2 != null) _buttons[1].setPerkData(perk2);
		}
		
		public function setBothUnavailable():void
		{
			_buttons[0].setUnavailable();
			_buttons[1].setUnavailable();
		}
		
		public function setBothAvailable():void
		{
			_buttons[0].setAvailable();
			_buttons[1].setAvailable();
		}
	}
}