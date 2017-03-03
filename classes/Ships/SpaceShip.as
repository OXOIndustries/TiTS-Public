package classes.Ships 
{
	import classes.DataManager.Serialization.VersionedSaveableV2;
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
		}
		
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
		
		protected var _internalMap:ShipMap;
	}
}