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
			
			keeperBuy = "You tell Nevrie you’d like to see what the Xenogen store has in stock.";
			keeperSell = "";
			
			inventory.push(new Bovinium());
			inventory.push(new Chocolac());
			inventory.push(new FocusPill());
			inventory.push(new EasyFit());
			inventory.push(new LeithaCharm());
			inventory.push(new Nepeta());
			
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