package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	//import classes.Items.Miscellaneous.FungalExtract;
	//import classes.Items.Combat.CrystalShard;
	//import classes.Items.Transformatives.GooBallRed;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class KattomOsgood extends Creature
	{
		//constructor
		public function KattomOsgood()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Patton Osgood";
			originalRace = "kaithrit";
			
			/*
			this.inventory.push(new CrystalShard());
			this.inventory.push(new FungalExtract());
			this.inventory.push(new GooBallRed());
			this.inventory.push(new GooBallOrange());
			this.inventory.push(new GooBallYellow());
			this.inventory.push(new GooBallGreen());
			this.inventory.push(new GooBallBlue());
			this.inventory.push(new GooBallPurple());
			this.inventory.push(new GooBallPink());
			*/
			//this.inventory.push(new ());
			this.sellMarkup = 1.5;
			this.buyMarkdown = .25;
			this.typesBought.push(GLOBAL.MELEE_WEAPON);
			this.typesBought.push(GLOBAL.RANGED_WEAPON);
			this.typesBought.push(GLOBAL.ARMOR);
			this.typesBought.push(GLOBAL.SHIELD);
			this.typesBought.push(GLOBAL.GADGET);
			this.typesBought.push(GLOBAL.EXPLOSIVECONSUMABLE);

			this.femininity = 15;
		}
		override public function get bustDisplay():String
		{
			return "KATTOM";
		}
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.approachKattom(true);
		}
	}
}
