package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.FungalExtract;
	import classes.Items.Combat.CrystalShard;
	import classes.Items.Transformatives.GooBallRed;
	import classes.Items.Transformatives.GooBallOrange;
	import classes.Items.Transformatives.GooBallYellow;
	import classes.Items.Transformatives.GooBallGreen;
	import classes.Items.Transformatives.GooBallBlue;
	import classes.Items.Transformatives.GooBallPurple;
	import classes.Items.Transformatives.GooBallPink;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class CrystalShopkeep extends Creature
	{
		//constructor
		public function CrystalShopkeep()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "crystalline shopkeep";
			originalRace = "ganrael";
			
			this.inventory.push(new CrystalShard());
			this.inventory.push(new FungalExtract());
			this.inventory.push(new GooBallRed());
			this.inventory.push(new GooBallOrange());
			this.inventory.push(new GooBallYellow());
			this.inventory.push(new GooBallGreen());
			this.inventory.push(new GooBallBlue());
			this.inventory.push(new GooBallPurple());
			this.inventory.push(new GooBallPink());
			//this.inventory.push(new ());
			this.sellMarkup = 1;
			this.buyMarkdown = .5;

			this.femininity = 85;
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.visitCrystalGooShop();
		}
	}
}
