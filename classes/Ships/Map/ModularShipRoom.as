package classes.Ships.Map 
{
	import classes.DataManager.Serialization.ISaveable;
	import classes.DataManager.Serialization.UnversionedSaveableV2;
	import classes.Ships.IOwner;
	import classes.Ships.Modules.ShipModule;
	/**
	 * ...
	 * @author Gedan
	 */
	public class ModularShipRoom extends ShipRoom
	{
		[Serialize]
		public var _fittedModule:ShipModule;
		public function get FittedModule():ShipModule
		{
			return _fittedModule;
		}
		
		override public function LoadSaveObject(saveObject:Object):void
		{
			super.LoadSaveObject(saveObject);
			
			if (FittedModule != null)
			{
				FittedModule.Owner = this.Owner;
			}
		}
		
		override public function get Name():String
		{
			return FittedModule ? FittedModule.Room.Name : super.Name;
		}
		
		override public function get ShortName():String
		{
			return FittedModule ? FittedModule.Room.ShortName : super.ShortName;
		}
		
		override public function get EntryFunction():Function
		{
			return FittedModule ? FittedModule.Room.EntryFunction : super.EntryFunction;
		}
		
		override public function get MoveTime():Number
		{
			return FittedModule ? FittedModule.Room.MoveTime : super.MoveTime;
		}
		
		override public function get Flags():Array
		{
			return FittedModule ? FittedModule.Room.Flags : super.Flags;
		}
		
		override public function get VariableFlags():Array
		{
			return FittedModule ? FittedModule.Room.VariableFlags : super.VariableFlags;
		}
		
		public function ModularShipRoom(owner:IOwner)
		{
			super(owner);
		}
	}

}