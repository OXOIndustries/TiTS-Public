package classes.Ships.Modules 
{
	import classes.Ships.IOwner;
	/**
	 * ...
	 * @author Gedan
	 */
	public class WeaponModule extends ShipModule
	{
		public function WeaponModule(owner:IOwner) 
		{
			super(owner);
			
			_powerConsumption = 100;
			
			_rangeAccuracyPointBlank = 1.0;
			_rangeAccuracyShort = 1.0;
			_rangeAccuracyMedium = 1.0;
			_rangeAccuracyLong = 1.0;
		}
		
		protected var _rangeAccuracyPointBlank:Number;
		protected var _rangeAccuracyShort:Number;
		protected var _rangeAccuracyMedium:Number;
		protected var _rangeAccuracyLong:Number;
		
		public function get RangeAccuracyPointBlank():Number { return _rangeAccuracyPointBlank; }
		public function get RangeAccuracyShort():Number { return _rangeAccuracyShort; }
		public function get RangeAccuracyMedium():Number { return _rangeAccuracyMedium; }
		public function get RangeAccuracyLong():Number { return _rangeAccuracyLong; }
		
	}

}