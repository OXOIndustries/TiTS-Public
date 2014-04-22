package classes.UIComponents.ContentModuleComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class PerkButtonGroup extends Sprite
	{
		private var _buttons:Vector.<PerkButton>;
		
		public function PerkButtonGroup() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_buttons = new Vector.<PerkButton>();
			
			this.Build();
		}
		
		private function Build():void
		{
			_buttons[0] = new PerkButton();
			_buttons[1] = new PerkButton();
		}
		
		public function setPerkData(perk1:*, perk2:* = null):void
		{
			_buttons[0].x = 0;
			
			if (_buttons[0].parent == null)
			{
				this.addChild(_buttons[0]);
			}
			
			_buttons[1].x = _buttons[0].x + _buttons[0].width;
			
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
		}
	}
}