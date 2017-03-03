package classes.Ships.Map 
{
	import classes.Ships.IOwner;
	import classes.Ships.SpaceShip;
	import flash.geom.Vector3D;
	import classes.kGAMECLASS;
	/**
	 * ...
	 * @author Gedan
	 */
	public class ShipRoom implements IOwner
	{
		private var _owner:IOwner;
		public function get Owner():IOwner { return _owner; }
		public function set Owner(v:IOwner):void { _owner = v; }
		public function get OwningShip():SpaceShip { return _owner as SpaceShip; }
		
		public static const FLAG_ROOT:uint = 0;
		
		public var Index:String;
		public var Name:String;
		public var ShortName:String;
		
		public var EntryFunction:Function;
		public var MoveTime:Number;
		public var Flags:Array;
		protected var VariableFlags:Array;
		
		public var NorthExit:String;
		public var NorthCondition:Function;
		public var NorthName:String;
		public var NorthRoom:ShipRoom;
		
		public var EastExit:String;
		public var EastCondition:Function;
		public var EastName:String;
		public var EastRoom:ShipRoom;
		
		public var SouthExit:String;
		public var SouthCondition:Function;
		public var SouthName:String;
		public var SouthRoom:ShipRoom;
		
		public var WestExit:String;
		public var WestCondition:Function;
		public var WestName:String;
		public var WestRoom:ShipRoom;
		
		public var UpExit:String;
		public var UpCondition:Function;
		public var UpName:String;
		public var UpRoom:ShipRoom;
		
		public var DownExit:String;
		public var DownCondition:Function;
		public var DownName:String;
		public var DownRoom:ShipRoom;
		
		public var EnemyEncounterContainers:Array;
		public var ActiveCharacters:Array;
		
		public var MapPosition:Vector3D;
		
		public function HasActiveEnemies():Boolean
		{
			return false;
		}
		public function HasFlag(tFlag:uint):void
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
		
		public function ShipRoom() 
		{
			Flags = [];
			VariableFlags = [];
			ActiveCharacters = [];
			EnemyEncounterContainers = [];
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