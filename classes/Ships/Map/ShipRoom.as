package classes.Ships.Map 
{
	import classes.DataManager.Serialization.UnversionedSaveableV2;
	import classes.Ships.IOwned;
	import classes.Ships.IOwner;
	import classes.Ships.SpaceShip;
	import flash.geom.Vector3D;
	import classes.kGAMECLASS;
	/**
	 * ...
	 * @author Gedan
	 */
	public class ShipRoom implements IOwned
	{
		private var _owner:IOwner;
		public function get Owner():IOwner { return _owner; }
		public function set Owner(v:IOwner):void { _owner = v; }
		
		public function get OwningShip():SpaceShip { return ParentLocation.Owner as SpaceShip; }
		public function get ParentLocation():ShipMap { return Owner as ShipMap; }
		
		public static const FLAG_ROOT:uint = 0;
		public static const FLAG_AIRLOCK:uint = 1;
		public static const FLAG_COCKPIT:uint = 2;
		public static const FLAG_CAPTAINSQUARTERS:uint = 3;
		public static const FLAG_STORAGE:uint = 4;
		public static const FLAG_STORAGE_ARMORY:uint = 5;
		public static const FLAG_MEDBAY:uint = 6;
		public static const FLAG_CREWQUARTERS:uint = 7;
		public static const FLAG_CARGOHOLD:uint = 8;
		
		private var _index:String;
		public function get Index():String { return _index; }
		public function set Index(v:String):void { _index = v; }
		
		private var _name:String;
		public function get Name():String { return _name; }
		public function set Name(v:String):void { _name = v; }
		
		private var _shortName:String;
		public function get ShortName():String { return _shortName; }
		public function set ShortName(v:String):void { _shortName = v; }
		
		private var _entryFunction:Function;
		public function get EntryFunction():Function { return _entryFunction; }
		public function set EntryFunction(v:Function):void { _entryFunction = v; }
		
		private var _moveTime:Number;
		public function get MoveTime():Number { return _moveTime; }
		public function set MoveTime(v:Number):void { _moveTime = v; }
		
		private var _flags:Array;
		public function get Flags():Array { return _flags; }
		
		private var _variableFlags:Array;
		public function get VariableFlags():Array { return _variableFlags; }
		
		private var _northExit:String;
		public function get NorthExit():String { return _northExit; }
		public function set NorthExit(v:String):void { _northExit = v; }

		private var _northCondition:Function;
		public function get NorthCondition():Function { return _northCondition; }
		public function set NorthCondition(v:Function):void { _northCondition = v; }

		private var _northName:String;
		public function get NorthName():String { return _northName; }
		public function set NorthName(v:String):void { _northName = v; }

		private var _northRoom:ShipRoom;
		public function get NorthRoom():ShipRoom { return _northRoom; }
		public function set NorthRoom(v:ShipRoom):void { _northRoom = v; }
		
		private var _eastExit:String;
		public function get EastExit():String { return _eastExit; }
		public function set EastExit(v:String):void { _eastExit = v; }

		private var _eastCondition:Function;
		public function get EastCondition():Function { return _eastCondition; }
		public function set EastCondition(v:Function):void { _eastCondition = v; }

		private var _eastName:String;
		public function get EastName():String { return _eastName; }
		public function set EastName(v:String):void { _eastName = v; }

		private var _eastRoom:ShipRoom;
		public function get EastRoom():ShipRoom { return _eastRoom; }
		public function set EastRoom(v:ShipRoom):void { _eastRoom = v; }
		
		private var _southExit:String;
		public function get SouthExit():String { return _southExit; }
		public function set SouthExit(v:String):void { _southExit = v; }

		private var _southCondition:Function;
		public function get SouthCondition():Function { return _southCondition; }
		public function set SouthCondition(v:Function):void { _southCondition = v; }

		private var _southName:String;
		public function get SouthName():String { return _southName; }
		public function set SouthName(v:String):void { _southName = v; }

		private var _southRoom:ShipRoom;
		public function get SouthRoom():ShipRoom { return _southRoom; }
		public function set SouthRoom(v:ShipRoom):void { _southRoom = v; }
		
		private var _westExit:String;
		public function get WestExit():String { return _westExit; }
		public function set WestExit(v:String):void { _westExit = v; }

		private var _westCondition:Function;
		public function get WestCondition():Function { return _westCondition; }
		public function set WestCondition(v:Function):void { _westCondition = v; }

		private var _westName:String;
		public function get WestName():String { return _westName; }
		public function set WestName(v:String):void { _westName = v; }

		private var _westRoom:ShipRoom;
		public function get WestRoom():ShipRoom { return _westRoom; }
		public function set WestRoom(v:ShipRoom):void { _westRoom = v; }
		
		private var _upExit:String;
		public function get UpExit():String { return _upExit; }
		public function set UpExit(v:String):void { _upExit = v; }

		private var _upCondition:Function;
		public function get UpCondition():Function { return _upCondition;}
		public function set UpCondition(v:Function):void { _upCondition = v; }

		private var _upName:String;
		public function get UpName():String { return _upName; }
		public function set UpName(v:String):void { _upName = v; }

		private var _upRoom:ShipRoom;
		public function get UpRoom():ShipRoom { return _upRoom; }
		public function set UpRoom(v:ShipRoom):void { _upRoom = v; }
		
		private var _downExit:String;
		public function get DownExit():String { return _downExit; }
		public function set DownExit(v:String):void { _downExit = v; }

		private var _downCondition:Function;
		public function get DownCondition():Function { return _downCondition; }
		public function set DownCondition(v:Function):void { _downCondition = v; }

		private var _downName:String;
		public function get DownName():String { return _downName; }
		public function set DownName(v:String):void { _downName = v; }

		private var _downRoom:ShipRoom;
		public function get DownRoom():ShipRoom { return _downRoom; }
		public function set DownRoom(v:ShipRoom):void { _downRoom = v; }
		
		private var _enemyEncounterContainers:Array;
		public function get EnemyEncounterContainers():Array { return _enemyEncounterContainers; }

		private var _activeCharacters:Array;
		public function get ActiveCharacters():Array { return _activeCharacters; }
		
		private var _mapPosition:Vector3D;
		public function get MapPosition():Vector3D { return _mapPosition; }
		public function set MapPosition(v:Vector3D):void { _mapPosition = v; }
		
		public function HasActiveEnemies():Boolean
		{
			return false;
		}
		public function HasFlag(tFlag:uint):Boolean
		{
			if (Flags.indexOf(tFlag) != -1) return true;
			if (VariableFlags.length > 0)
			{
				for (var i:int = 0; i < VariableFlags.length; i++)
				{
					var o:VariableFlag = VariableFlags[i] as VariableFlag;
					if (o.Flag == tFlag && kGAMECLASS.flags[o.FlagName] == 1) return true;
				}
			}
			return false;
		}
		public function AddFlag(... Flags):void
		{
			Flags = Flags.concat(Flags);
		}
		public function AddVariableFlag(tFlag:uint, tFlagName:String):void
		{
			if (VariableFlags.length > 0)
			{
				for (var i:int = 0; i < VariableFlags.length; i++)
				{
					if ((VariableFlags[i] as VariableFlag).Is(tFlag, tFlagName)) return;
				}
			}
			VariableFlags.push(new VariableFlag(tFlag, tFlagName));
		}
		
		public function ShipRoom(owner:IOwner) 
		{
			Owner = owner;
			
			_flags = [];
			_variableFlags = [];
			_activeCharacters = [];
			_enemyEncounterContainers = [];
		}
		
	}

}

class VariableFlag
{
	public var Flag:uint;
	public var FlagName:String;
	
	public function VariableFlag(tFlag:uint, tFlagName:String)
	{
		Flag = tFlag;
		FlagName = tFlagName;
	}
	
	public function Is(tFlag:uint, tFlagName:String):Boolean
	{
		return Flag == tFlag && FlagName == tFlagName;
	}
}