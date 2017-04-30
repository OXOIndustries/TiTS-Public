package classes.Ships.Library 
{
	import classes.Ships.Map.Library.TestMapInterior;
	import classes.Ships.Modules.CapacitorModule;
	import classes.Ships.Modules.EngineModule;
	import classes.Ships.Modules.GunneryModule;
	import classes.Ships.Modules.HullArmoringModule;
	import classes.Ships.Modules.LightdriveModule;
	import classes.Ships.Modules.ReactorModule;
	import classes.Ships.Modules.ShieldModule;
	import classes.Ships.SpaceShip;
	/**
	 * ...
	 * @author Gedan
	 */
	public class TestHostileShip extends SpaceShip
	{
		
		public function TestHostileShip() 
		{
			Name = "Test Hostile Ship";
			_manufacturer = "GDN Heavy Industries";
			_model = "FSP5";
			_baseValue = 150000;
			
			_hullMaxBase = 3500;
			Hull = HullMax;
			
			_shieldsMaxBase = 10000;
			Shields = ShieldsMax;
			
			_capacitorMaxBase = 1000;
			Capacitor = CapacitorMax;
			
			_targeting = _thrust = _aim = _agility = _systems = 50;
			
			_internalMap = new TestMapInterior(this);
			
			_storageTypeGeneral = 10;
			_storageTypeConsumable = 20;
			_storageTypeArmor = 10;
			_storageTypeWeapons = 20;
			
			_inventory = [];
			
			_lightdriveModule = new LightdriveModule(this);
			_engineModule = new EngineModule(this);
			_shieldModule = new ShieldModule(this);
			_hullArmoringModule = new HullArmoringModule(this);
			_reactorModule = new ReactorModule(this);
			_capacitorModule = new CapacitorModule(this);
			_gunneryModule = new GunneryModule(this);
			
			_fittedModules = [];
		}
		
	}

}