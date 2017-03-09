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
		}
		
		private var _powerStorage:int = 500;
		public function get PowerStorage():int { return 500; }
	}

}