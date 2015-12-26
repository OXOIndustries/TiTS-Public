package classes.UIComponents.SideBarComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import classes.UIComponents.UIStyleSettings;
	/**
	 * ...
	 * @author Gedan
	 */
	public class CompressedStatBars extends Sprite
	{
		private var _shieldBar:Sprite;
		private var _hpBar:Sprite;
		private var _lustBar:Sprite;
		private var _energyBar:Sprite;
		
		public function CompressedStatBars() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Build();
		}
		
		private function Build():void
		{
			var wide:int = 124;
			var high:int = 15;
			var off:int = 1;
			
			_shieldBar = BuildBar(UIStyleSettings.gShieldColour, wide, high);	
			
			_hpBar = BuildBar(UIStyleSettings.gHPColour, wide, high);
			_hpBar.y = _shieldBar.y + _shieldBar.height + off;
			
			_lustBar = BuildBar(UIStyleSettings.gLustColour, wide, high);
			_lustBar.y = _hpBar.y + _hpBar.height + off;
			
			_energyBar = BuildBar(UIStyleSettings.gEnergyColour, wide, high);
			_energyBar.y = _lustBar.y + _lustBar.height + off;
		}
		
		private function BuildBar(colour:uint, wide:int, high:int):Sprite
		{
			var d:Sprite = new Sprite();
			d.graphics.beginFill(colour);
			d.graphics.drawRect(0, 0, wide, high);
			d.graphics.endFill();
			addChild(d);
			return d;
		}
	}

}