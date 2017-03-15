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
		}
		
		protected var _powerStorage:int;
		public function get PowerStorage():int { return _powerStorage; }
		
		protected var _rechargeRate:Number;
		public function get RechargeRate():Number { return _rechargeRate; }
	}

}