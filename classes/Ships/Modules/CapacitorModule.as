package classes.Ships.Modules 
{
	import classes.Ships.IOwner;
	/**
	 * ...
	 * @author Gedan
	 */
	public class CapacitorModule extends ShipModule
	{
		public function CapacitorModule(owner:IOwner) 
		{
			super(owner);
			
			_powerStorage = 500;
			_rechargeRatePerRound = 50;
			_rechargeRatePerMinute = 5;
		}
		
		protected var _powerStorage:int;
		public function get PowerStorage():int { return _powerStorage; }
		
		protected var _rechargeRatePerRound:Number;
		public function get RechargeRatePerRound():Number { return _rechargeRatePerRound; }
		
		protected var _rechargeRatePerMinute:Number;
		public function get RechargeRatePerMinute():Number { return _rechargeRatePerMinute; }
	}

}