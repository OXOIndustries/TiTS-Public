package classes.Ships.Library 
{
	import classes.Ships.Modules.*;
	import classes.Ships.SpaceShip;
	import classes.Ships.Map.Library.TestMapInterior;
	import classes.Ships.ActionLibrary;
	/**
	 * ...
	 * @author Gedan
	 */
	public class TestShip extends SpaceShip
	{
		
		public function TestShip() 
		{
			_lightdriveModule = new LightdriveModule(this);
			_engineModule = new EngineModule(this);
			_shieldModule = new ShieldModule(this);
			_hullArmoringModule = new HullArmoringModule(this);
			_reactorModule = new ReactorModule(this);
			_capacitorModule = new CapacitorModule(this);
			_gunneryModule = new GunneryModule(this);
			
			Name = "Test Ship";
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
		}
		
	}

}