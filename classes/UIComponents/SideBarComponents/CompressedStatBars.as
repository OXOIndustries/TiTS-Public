package classes.UIComponents.SideBarComponents 
{
	import classes.GameData.SingleCombatAttack;
	import flash.display.Sprite;
	import flash.events.Event;
	import classes.UIComponents.UIStyleSettings;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Gedan
	 */
	public class CompressedStatBars extends Sprite
	{
		private var _shieldBar:SingleCompressedStatBar;
		private var _hpBar:SingleCompressedStatBar;
		private var _lustBar:SingleCompressedStatBar;
		private var _energyBar:SingleCompressedStatBar;
		
		public function get shield():SingleCompressedStatBar { return _shieldBar; }
		public function get hp():SingleCompressedStatBar { return _hpBar; }
		public function get lust():SingleCompressedStatBar { return _lustBar; }
		public function get energy():SingleCompressedStatBar { return _energyBar; }
		
		public function set bustVisible(v:Boolean):void
		{
			shield.bustVisible = hp.bustVisible = lust.bustVisible = energy.bustVisible = v;
		}
		
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
			
			_shieldBar = new SingleCompressedStatBar();
			addChild(_shieldBar);
			_shieldBar.labelText = "SHIELD";
			_shieldBar.setValue(1, 4);
			
			_hpBar = new SingleCompressedStatBar();
			addChild(_hpBar);
			_hpBar.labelText = "HP";
			_hpBar.y = _shieldBar.y + _shieldBar.height + 1;
			_hpBar.setValue(0, 1);
			
			_lustBar = new SingleCompressedStatBar();
			addChild(_lustBar);
			_lustBar.labelText = "LUST";
			_lustBar.y = _hpBar.y + _hpBar.height + 1;
			_lustBar.setValue(3, 4);
			
			_energyBar = new SingleCompressedStatBar();
			addChild(_energyBar);
			_energyBar.labelText = "ENERGY";
			_energyBar.y = _lustBar.y + _lustBar.height + 1;
			_energyBar.setValue(4, 4);
		}
	}
}