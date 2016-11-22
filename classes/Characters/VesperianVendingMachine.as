package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Transformatives.TauricoVenidae;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class VesperianVendingMachine extends Creature
	{
		//constructor
		public function VesperianVendingMachine()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "vending machine";
			originalRace = "VESPERIAN";
			
			this.inventory.push(new TauricoVenidae());
			/*
			this.typesBought[this.typesBought.length] = GLOBAL.ARMOR;
			this.typesBought[this.typesBought.length] = GLOBAL.MELEE_WEAPON;
			this.typesBought[this.typesBought.length] = GLOBAL.RANGED_WEAPON;
			this.typesBought[this.typesBought.length] = GLOBAL.SHIELD;
			this.typesBought[this.typesBought.length] = GLOBAL.ACCESSORY;
			this.typesBought[this.typesBought.length] = GLOBAL.GADGET;
			this.typesBought[this.typesBought.length] = GLOBAL.GEM;*/
			this.sellMarkup = 1.05;
			this.buyMarkdown = .1;

			this.femininity = 85;
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.mainGameMenu();
		}
	}
}