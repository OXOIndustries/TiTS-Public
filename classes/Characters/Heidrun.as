package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Accessories.TravelersCloak;
	import classes.Items.Apparel.LeatherBra;
	import classes.Items.Apparel.LeatherPanties;
	import classes.Items.Apparel.FurryLoincloth;
	import classes.Items.Apparel.FurryBra2;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class Heidrun extends Creature
	{
		//constructor
		public function Heidrun()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			fluidSimulate = false;
			statusSimulate = false;
			this.short = "Heidrun";
			originalRace = "korgonne";
			
			keeperBuy = "";
			keeperSell = "";
			
			inventory.push(new LeatherBra());
			inventory.push(new LeatherPanties());
			inventory.push(new FurryBra2());
			inventory.push(new FurryLoincloth());
			inventory.push(new TravelersCloak());

			this.typesBought = [GLOBAL.CLOTHING,GLOBAL.LOWER_UNDERGARMENT,GLOBAL.UPPER_UNDERGARMENT];
			
			this.sellMarkup = 1.0;
			this.buyMarkdown = .25;

			this.femininity = 85;

			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].type = GLOBAL.TYPE_CANINE;
			this.vaginas[0].hymen = false;
			this.vaginas[0].wetnessRaw = 3;
			this.vaginas[0].loosenessRaw = 3;
			this.vaginas[0].vaginaColor = "blue";
			this.vaginas[0].vagooFlags = [];
			
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 2000;
			this.timesCum = 8008;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.approachHeidrun();
		}
	}
}