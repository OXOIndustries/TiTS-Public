package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.Chocolac;
	import classes.Items.Miscellaneous.Condensol;
	import classes.Items.Miscellaneous.EasyFit;
	import classes.Items.Transformatives.Bovinium;
	import classes.Items.Transformatives.BumpyRoad;
	import classes.Items.Transformatives.MinoCharge;
	import classes.Items.Transformatives.Circumscriber;
	import classes.Items.Transformatives.Turtleneck;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class Gene extends Creature
	{
		//constructor
		public function Gene()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Gene";
			originalRace = "fanfir";
			
			keeperBuy = "";
			keeperSell = "";
			
			inventory.push(new Bovinium());
			inventory.push(new MinoCharge());
			inventory.push(new Condensol());
			inventory.push(new EasyFit());
			inventory.push(new Chocolac());
			inventory.push(new BumpyRoad());
			inventory.push(new Circumscriber());
			inventory.push(new Turtleneck());
			
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
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.genesModsGenericScene();
		}
	}
}
