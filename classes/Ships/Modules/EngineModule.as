package classes.Ships.Modules 
{
	import classes.Ships.IOwner;
	/**
	 * ...
	 * @author Gedan
	 */
	public class EngineModule extends ShipModule
	{
		public function EngineModule(owner:IOwner) 
		{
			super(owner);
		}
		
		private var _agilityMultiplier:Number = 1.0;
		private var _maneuveringSpeed:Number = 5.0;
		
		public function get AgilityMultiplier():Number { return _agilityMultiplier; }
		public function get ManeuveringSpeed():Number { return _maneuveringSpeed; }
	}

}