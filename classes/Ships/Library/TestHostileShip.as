package classes.Ships.Library 
{
	import classes.Ships.Map.Library.TestMapInterior;
	import classes.Ships.Modules.CapacitorModule;
	import classes.Ships.Modules.EngineModule;
	import classes.Ships.Modules.GunneryModule;
	import classes.Ships.Modules.HullArmoringModule;
	import classes.Ships.Modules.Library.TestWeaponModule;
	import classes.Ships.Modules.LightdriveModule;
	import classes.Ships.Modules.ReactorModule;
	import classes.Ships.Modules.ShieldModule;
	import classes.Ships.SpaceShip;
	import classes.Engine.ShipCombat.ShipCombatOrderContainer;
	import classes.Engine.Utility.rand;
	import classes.Ships.ActionLibrary;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class TestHostileShip extends SpaceShip
	{
		protected function get TypedMap():TestMapInterior
		{
			return _internalMap as TestMapInterior;
		}
		
		public function TestHostileShip() 
		{
			_lightdriveModule = new LightdriveModule(this);
			_engineModule = new EngineModule(this);
			_shieldModule = new ShieldModule(this);
			_hullArmoringModule = new HullArmoringModule(this);
			_reactorModule = new ReactorModule(this);
			_capacitorModule = new CapacitorModule(this);
			_gunneryModule = new GunneryModule(this);
			
			Name = "Hostile Ship";
			_manufacturer = "GDN";
			_model = "FSP5";
			_baseValue = 150000;
			
			_hullMaxBase = 3500;
			Hull = HullMax;
			
			_shieldsMaxBase = 1000;
			Shields = ShieldsMax;
			
			_capacitorMaxBase = 1000;
			Capacitor = CapacitorMax;
			
			_targeting = _thrust = _aim = _agility = _systems = 50;
			
			_internalMap = new TestMapInterior(this);
			
			_storageTypeGeneral = 10;
			_storageTypeConsumable = 20;
			_storageTypeArmor = 10;
			_storageTypeWeapons = 20;
			
			_inherentGadgets = [ActionLibrary.TestAction];
			_inventory = [];
			_fittedModules = [];
			
			EquipModule(new TestWeaponModule(this), TypedMap.WeaponRoom1);
			EquipModule(new TestWeaponModule(this), TypedMap.WeaponRoom2);
		}
		
		override public function get Reflexes():Number { return 10; }
		
		override public function CombatAI(playerShips:Array, enemyShips:Array):void
		{
			// We don't execute or return an action here, we select one
			// and pack it into CombatOrders -- this will then execute in order of Reflexes.
			// Gunfire will happen automatically just like the players ship, this is simply
			// an opportunity to run additional actions, similar to the player.
			
			CombatOrders.DesiredRange = ShipCombatOrderContainer.RANGE_POINTBLANK;
			CombatOrders.SelectedTarget = playerShips[0];
			CombatOrders.SelectedAction = (rand(2) == 0 ? ActionLibrary.TestAction : null);
		}
		
	}

}