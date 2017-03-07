package classes.Ships 
{
	import classes.DataManager.Serialization.VersionedSaveableV2;
	import classes.Ships.Map.ShipMap;
	/**
	 * ...
	 * @author Gedan
	 */
	public class SpaceShip extends VersionedSaveableV2 implements IOwner
	{
		public function SpaceShip() 
		{
			HullMax = 100;
			Hull = HullMax;
			
			ShieldsMax = 100;
			Shields = ShieldsMax;
			
			CapacitorMax = 100;
			Capacitor = CapacitorMax;
			
			Targeting = Thrust = Agility = Systems = Aim = 10;
			
			_inventory = [];
			_internalMap = new InternalMapClass();
		}
		
		[Serialize]
		public var _name:String;
		public function get Name():String { return _name; }
		public function set Name(v:String):void { _name = v; }
		
		protected var _manufacturer:String;
		public function get Manufacturer():String { return _manufacturer; }
		
		protected var _model:String;
		public function get Model():String { return _model; }
		
		protected var _baseValue:int;
		public function get BaseValue():int { return _baseValue; }
		
		[Serialize]
		public var _hull:Number;
		public function get Hull():Number { return _hull; }
		public function set Hull(v:Number):void { _hull = v; }
		
		protected var _hullMax:Number;
		public function get HullMax():Number { return _hullMax; }
		public function set HullMax(v:Number):void { _hullMax = v; }
		
		[Serialize]
		public var _shields:Number;
		public function get Shields():Number { return _shields; }
		public function set Shields(v:Number):void { _shields = v; }
		
		protected var _shieldsMax:Number;
		public function get ShieldsMax():Number { return _shieldsMax; }
		public function set ShieldsMax(v:Number):void { _shieldsMax = v; }
		
		[Serialize]
		public var _capacitor:Number;
		public function get Capacitor():Number { return _capacitor; }
		public function set Capacitor(v:Number):void { _capacitor = v; }
		
		protected var _capacitorMax:Number;
		public function get CapacitorMax():Number { return _capacitorMax; }
		public function set CapacitorMax(v:Number):void { _capacitorMax = v; }
		
		protected var _targeting:Number;
		public function get Targeting():Number { return _targeting; }
		public function set Targeting(v:Number):void { _targeting = v; }
		
		protected var _thrust:Number;
		public function get Thrust():Number { return _thrust; }
		public function get Thrust(v:Number):void { _thrust = v; }
		
		protected var _agility:Number;
		public function get Agility():Number { return _agility; }
		public function set Agility(v:Number):void { _agility = v; }
		
		protected var _systems:Number;
		public function get Systems():Number { return _systems; }
		public function set Systems(v:Number):void { _systems = v; }
		
		protected var _aim:Number;
		public function get Aim():Number { return _aim; }
		public function set Aim(v:Number):void { _aim = v; }
		
		protected var _armor:Number;
		public function get Armor():Number { return _armor; }
		public function set Armor(v:Number):void { _armor = v; }
		
		protected var _power:Number;
		public function get Power():Number { return _power; }
		public function set Power(v:Number):void { _power = v; }
		
		[Serialize]
		public var _inventory:Array;
		public function get Inventory():Array { return _inventory; }
		
		protected var _storageTypeGeneral:int;
		public function get StorageTypeGeneral():int { return _storageTypeGeneral; }
		public function set StorageTypeGeneral(v:int):void { _storageTypeGeneral = v; }
		
		protected var _storageTypeConsumable:int;
		public function get StorageTypeConsumable():int { return _storageTypeConsumable; }
		public function set StorageTypeConsumable(v:int):void { _storageTypeConsumable = v; }
		
		protected var _storageTypeArmor:int;
		public function get StorageTypeArmor():int { return _storageTypeArmor; }
		public function set StorageTypeArmor(v:int):void { _storageTypeArmor = v; }
		
		protected var _storageTypeWeapons:int;
		public function get StorageTypeWeapons():int { return _storageTypeWeapons; }
		public function set StorageTypeWeapons(v:int):void { _storageTypeWeapons = v; }
		
		protected var _internalMapClass:Class;
		public function get InternalMapClass():Class { return _internalMapClass; }
		
		protected var _internalMap:ShipMap;
		public function get InternalMap():ShipMap { return _internalMap; }
	}
}