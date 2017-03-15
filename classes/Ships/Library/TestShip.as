package classes.Ships.Library 
{
	import classes.Ships.SpaceShip;
	import classes.Ships.Map.Library.TestMapInterior;
	/**
	 * ...
	 * @author Gedan
	 */
	public class TestShip extends SpaceShip
	{
		
		public function TestShip() 
		{
			Name = "Test Ship";
			_manufacturer = "GDN Heavy Industries";
			_model = "FSP5";
			_baseValue = 150000;
			
			HullMaxBase = 3500;
			BaseHull = HullMaxBase;
			
			ShieldsMax = 10000;
			Shields = ShieldsMax;
			
			CapacitorMax = 150;
			Capacitor = CapacitorMax;
			
			Targeting = 50;
			Thrust = 50;
			Agility = 50;
			Systems = 50;
			Aim = 50;
			Armor = 50;
			Power = 500;
			
			StorageTypeGeneral = 10;
			StorageTypeConsumable = 20;
			StorageTypeArmor = 10;
			StorageTypeWeapons = 20;
			_internalMapClass = TestMapInterior;
		}
		
	}

}