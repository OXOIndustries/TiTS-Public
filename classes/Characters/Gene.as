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
	import classes.Items.Transformatives.TauricoVenidae;
	import classes.Items.Transformatives.Reptilum;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class Gene extends Creature
	{
		//constructor
		public function Gene()
		{
			_latestVersion = 2;
			version = _latestVersion;
			_neverSerialize = true;
			
			short = "Gene";
			originalRace = "fanfir";
			a = "";
			capitalA = "";
			
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
			inventory.push(new TauricoVenidae());
			inventory.push(new Reptilum());
			
			typesBought = [];
			
			sellMarkup = .9;
			buyMarkdown = .5;

			femininity = 0;
			createCock();
			cocks[0].cLengthRaw = 15;
			balls = 2;
			ballSizeRaw = 14;
			cumMultiplierRaw = 30;
			ballEfficiency = 90;
		}
		
		public function UpgradeVersion1(dataObject:Object):void
		{
			dataObject.inventory.push(new Reptilum().getSaveObject());
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.genesModsGenericScene();
		}
	}
}
