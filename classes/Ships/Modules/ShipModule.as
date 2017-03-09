package classes.Ships.Modules 
{
	import classes.DataManager.Serialization.UnversionedSaveableV2;
	import classes.Ships.IOwned;
	import classes.Ships.IOwner;
	import classes.Ships.Map.ModularShipRoom;
	import classes.Ships.Map.ShipMap;
	import classes.Ships.Map.ShipRoom;
	import classes.Ships.SpaceShip;
	/**
	 * ...
	 * @author Gedan
	 */
	public class ShipModule extends UnversionedSaveableV2 implements IOwned
	{
		public function ShipModule(owner:IOwner) 
		{
			_owner = owner;
		}
		
		private var _owner:IOwner;
		public function get Owner():IOwner { return _owner; }
		public function set Owner(v:IOwner):void { _owner = v; }
		
		public function get OwningShip():SpaceShip { return ParentLocation.Owner as SpaceShip; }
		public function get ParentLocation():ShipMap { return Owner as ShipMap; }
		
		protected var _room:ShipRoom;
		public function get Room():ShipRoom { return _room; }
		
		protected var _powerConsumption:Number;
		public function get PowerConsumption():Number { return _powerConsumption; }
		
	}

}