package classes.Ships.Modules 
{
	import classes.Ships.IOwner;
	/**
	 * ...
	 * @author Gedan
	 */
	public class ShieldModule extends ShipModule
	{
		public function ShieldModule(owner:IOwner) 
		{
			super(owner);
		}
		
		private var _baseShield:Number = 100;
		private var _shieldRechargeRate:Number;
		private var _shieldResistances
	}

}