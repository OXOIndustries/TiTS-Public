package classes.Ships.Map.Library 
{
	import classes.Ships.IOwner;
	import classes.Ships.Map.ModularShipRoom;
	import classes.Ships.Map.ShipMap;
	import classes.Ships.Map.ShipRoom;
	/**
	 * ...
	 * @author Gedan
	 */
	public class TestMapInterior extends ShipMap
	{
		
		public function TestMapInterior(owner:IOwner) 
		{
			super(owner);
			
			Index = "TestShip";
			Name = "Test Ship Interior";
			ShortName = "Test Ship";
		}
		
		public var Airlock:ShipRoom;
		public var Cockpit:ShipRoom;
		public var Armory:ShipRoom;
		public var CaptainsQuarters:ShipRoom;
		public var Cargohold:ShipRoom;
		public var CrewQuarters1:ShipRoom;
		public var CrewQuarters2:ShipRoom;
		
		public var WeaponRoom1:ShipRoom;
		public var WeaponRoom2:ShipRoom;
		
		public var ModuleRoom:ModularShipRoom;
		
		override public function Configure():void
		{
			Airlock = new ShipRoom(this);
			Airlock.Index = "Airlock";
			Airlock.Name = "Airlock";
			Airlock.WestExit = "Corridor1";
			Airlock.AddFlag(ShipRoom.FLAG_ROOT, ShipRoom.FLAG_AIRLOCK);
			AddRoom(Airlock);
			
			var r:ShipRoom = new ShipRoom(this);
			r.Index = "Corridor1";
			r.Name = "Corridor";
			r.EastExit = "Airlock";
			r.SouthExit = "Cockpit";
			r.NorthExit = "Corridor2";
			r.WestExit = "Armory";
			AddRoom(r);
			
			Cockpit = new ShipRoom(this);
			Cockpit.Index = "Cockpit";
			Cockpit.Name = "Bridge";
			Cockpit.NorthExit = "Corridor1";
			Cockpit.AddFlag(ShipRoom.FLAG_COCKPIT);
			AddRoom(Cockpit);
			
			Armory = new ShipRoom(this);
			Armory.Index = "Armory";
			Armory.Name = "Armory";
			Armory.EastExit = "Corridor1";
			Armory.AddFlag(ShipRoom.FLAG_STORAGE, ShipRoom.FLAG_STORAGE_ARMORY);
			AddRoom(Armory);
			
			r = new ShipRoom(this);
			r.Index = "Corridor2";
			r.Name = "Corridor";
			r.SouthExit = "Corridor1";
			r.WestExit = "CaptQuart";
			r.NorthExit = "Corridor3";
			AddRoom(r);
			
			r = new ShipRoom(this);
			r.Index = "Corridor3";
			r.Name = "Corridor";
			r.SouthExit = "Corridor2";
			r.NorthExit = "Cargo";
			r.EastExit = "Crew2";
			r.WestExit = "Crew1";
			AddRoom(r);
			
			CaptainsQuarters = new ShipRoom(this);
			CaptainsQuarters.Index = "CaptQuart";
			CaptainsQuarters.Name = "Really Ready Room";
			CaptainsQuarters.EastExit = "Corridor2";
			CaptainsQuarters.AddFlag(ShipRoom.FLAG_CAPTAINSQUARTERS);
			AddRoom(CaptainsQuarters);
			
			Cargohold = new ShipRoom(this);
			Cargohold.Index = "Cargo";
			Cargohold.Name = "Cargo Hold";
			Cargohold.SouthExit = "Corridor3";
			Cargohold.NorthExit = "ModRoom";
			Cargohold.AddFlag(ShipRoom.FLAG_CARGOHOLD);
			AddRoom(Cargohold);
			
			CrewQuarters1 = new ShipRoom(this);
			CrewQuarters1.Index = "Crew1";
			CrewQuarters1.Name = "Crew Quarters";
			CrewQuarters1.EastExit = "Corridor3";
			CrewQuarters1.AddFlag(ShipRoom.FLAG_CREWQUARTERS);
			AddRoom(CrewQuarters1);
			
			CrewQuarters2 = new ShipRoom(this);
			CrewQuarters2.Index = "Crew2";
			CrewQuarters2.Name = "Crew Quarters";
			CrewQuarters2.WestExit = "Corridor3";
			CrewQuarters2.AddFlag(ShipRoom.FLAG_CREWQUARTERS);
			AddRoom(CrewQuarters2);
			
			ModuleRoom = new ModularShipRoom(this);
			ModuleRoom.Index = "ModRoom";
			ModuleRoom.Name = "Modular Room";
			ModuleRoom.SouthExit = "Cargo";
			ModuleRoom.EastExit = "Wep1";
			ModuleRoom.WestExit = "Wep";
			AddRoom(ModuleRoom);
			
			WeaponRoom1 = new ModularShipRoom(this);
			WeaponRoom1.Index = "Wep1";
			WeaponRoom1.Name = "Weapon Bay";
			WeaponRoom1.WestExit = "ModRoom";
			AddRoom(WeaponRoom1);
			
			WeaponRoom2 = new ModularShipRoom(this);
			WeaponRoom2.Index = "Wep";
			WeaponRoom2.Name = "Weapon Bay";
			WeaponRoom2.EastExit = "ModRoom";
			AddRoom(WeaponRoom2);
			
		}
		
	}

}