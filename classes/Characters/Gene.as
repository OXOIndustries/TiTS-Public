package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Accessories.LeithaCharm;
	import classes.Items.Miscellaneous.*;
	import classes.Items.Combat.CrystalShard;
	import classes.Items.Melee.NyreanSpear;
	import classes.Items.Melee.MilitaryPick;
	import classes.Items.Armor.ChitinArmor;
	import classes.Items.Armor.NyreanChain;
	import classes.Items.Transformatives.Bovinium;
	import classes.Items.Transformatives.Nepeta;
	import classes.Items.Transformatives.ManUp;
	import classes.kGAMECLASS;
	import classes.rand;
	
	public class Gene extends Creature
	{
		//constructor
		public function Gene()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Gene";
			
			keeperBuy = "";
			keeperSell = "";
			
			inventory.push(new Bovinium());
			// 9999 plz add this item for matching sets: inventory.push(new MinoCharge());
			inventory.push(new Condensol());
			inventory.push(new EasyFit());
			inventory.push(new Chocolac());
			
			this.typesBought = [];
			
			this.sellMarkup = .9;
			this.buyMarkdown = .5;

			this.femininity = 0;
			this.createCock();
			this.cocks[0].cLengthRaw = 15;
			this.balls = 2;
			this.ballSizeRaw = 14;
			this.cumMultiplierRaw = 30;
			this.ballEfficiency = 90;
		}
	}
}
