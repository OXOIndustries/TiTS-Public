package classes.Ships.Modules 
{
	import classes.Creature;
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
		public function ShipModule(owner:IOwner = null) 
		{
			_owner = owner;
			_name = "Unnamed Module";
			_manufacturer = "Unknown Manufacturer";
			_model = "Unknown Model";
			_baseValue = 0;
			_room = null;
			_powerConsumption = 0;
			_capConsumption = 0;
			_grantedGadgets = [];
		}
		
		private var _owner:IOwner;
		public function get Owner():IOwner { return _owner; }
		public function set Owner(v:IOwner):void { _owner = v; }
		
		public function get OwningShip():SpaceShip { return Owner as SpaceShip; }
		
		protected var _name:String;
		public function get Name():String { return _name; }
		
		protected var _manufacturer:String;
		public function get Manufacturer():String { return _manufacturer; }
		
		protected var _model:String;
		public function get Model():String { return _model; }
		
		protected var _baseValue:int;
		public function get BaseValue():int { return _baseValue; }
		
		[Serialize]
		public var _roomIndexReplacement:String;
		public function get RoomIndexReplacement():String { return _roomIndexReplacement; }
		public function set RoomIndexReplacement(v:String):void { _roomIndexReplacement = v; }
		
		[Serialize]
		public var _assignedCrewMember:String;
		public function get AssignedCrewMember():String { return _assignedCrewMember; }
		public function set AssignedCrewMember(v:String):void { _assignedCrewMember = v; }
		
		protected var _hookedRoom:ModularShipRoom;
		public function get HookedRoom():ModularShipRoom { return _hookedRoom; }
		public function set HookedRoom(v:ModularShipRoom):void { _hookedRoom = v; }
		
		protected var _hookedCrew:Creature;
		public function get HookedCrew():Creature { return _hookedCrew; }
		public function set HookedCrew(v:Creature):void { _hookedCrew = v; }
		
		protected var _room:ShipRoom;
		public function get Room():ShipRoom { return _room; }
		
		protected var _powerConsumption:Number;
		public function get PowerConsumption():Number { return _powerConsumption; }
		
		protected var _capConsumption:Number;
		public function get CapConsumption():Number { return _capConsumption; }
		
		// Gadgets are just Ship Attacks with a different flag, tied to the presence of certain modules
		protected var _grantedGadgets:Array;
		public function get GrantedGadgets():Array { return _grantedGadgets; }
		
		protected var _canBeStaffed:Boolean;
		public function get CanBeStaffed():Boolean { return _canBeStaffed; }
		
		protected var _disabledForRounds:int;
		public function get DisabledForRounds():int { return _disabledForRounds; }
		public function set DisabledForRounds(v:int):void { _disabledForRounds = v; }
	}

}