package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.*;
	import classes.Items.Combat.CrystalShard;
	import classes.kGAMECLASS;
	import classes.rand;
	
	public class CrystalShopkeep extends Creature
	{
		//constructor
		public function CrystalShopkeep()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "crystalline shopkeep";
			
			this.inventory.push(new CrystalShard());
			this.inventory.push(new FungalExtract());
			//this.inventory.push(new ());
			this.sellMarkup = 1;
			this.buyMarkdown = .5;

			this.femininity = 85;
		}
	}
}
