package classes.Ships.Modules.UpgradeModules 
{
	import classes.Ships.IOwner;
	import classes.Ships.Modules.ShipModule;
	/**
	 * ...
	 * @author Gedan
	 */
	public class UtilityModule extends ShipModule
	{
		
		public function UtilityModule(owner:IOwner) 
		{
			super(owner);
			
			_bonusInventoryTypeArmorSlots = 0;
			_bonusInventoryTypeConsumableSlots = 0;
			_bonusInventoryTypeGeneralSlots = 0;
			_bonusInventoryTypeWeaponsSlots = 0;
			
			_bonusCrewSlots = 0;
		}
		
		protected var _bonusInventoryTypeGeneralSlots:int;
		protected var _bonusInventoryTypeConsumableSlots:int;
		protected var _bonusInventoryTypeArmorSlots:int;
		protected var _bonusInventoryTypeWeaponsSlots:int;
		
		protected var _bonusCrewSlots:int;
		
		public function get BonusGeneralInventorySlots():int { return _bonusInventoryTypeGeneralSlots; }
		public function get BonusConsumableInventorySlots():int { return _bonusInventoryTypeConsumableSlots; }
		public function get BonusArmorInventorySlots():int { return _bonusInventoryTypeArmorSlots; }
		public function get BonusWeaponInventorySlots():int { return _bonusInventoryTypeWeaponsSlots; }
		
		public function get BonusCrewSlots():int { return _bonusCrewSlots; }
	}

}