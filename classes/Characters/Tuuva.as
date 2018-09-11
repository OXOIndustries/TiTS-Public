package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Melee.SaviciteLightMaul;
	import classes.Items.Melee.MasterworkYappiStrap;
	import classes.Items.Guns.KorgGreatBow;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class Tuuva extends Creature
	{
		//constructor
		public function Tuuva()
		{
			this._latestVersion = 2;
			this.version = _latestVersion;
			this._neverSerialize = false;
			fluidSimulate = false;
			statusSimulate = false;
			this.short = "Tuuva";
			originalRace = "korgonne";
			
			keeperBuy = "";
			keeperSell = "";
			
			inventory.push(new SaviciteLightMaul());
			inventory.push(new MasterworkYappiStrap());
			inventory.push(new KorgGreatBow());

			this.typesBought = [GLOBAL.MELEE_WEAPON,GLOBAL.RANGED_WEAPON,GLOBAL.ARMOR];
			
			this.sellMarkup = 1.0;
			this.buyMarkdown = .25;

			this.femininity = 85;

			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].type = GLOBAL.TYPE_CANINE;
			this.vaginas[0].hymen = false;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].vaginaColor = "black";
			this.vaginas[0].vagooFlags = [];

			this.cocks = new Array();
			this.createCock();
			this.shiftCock(0,GLOBAL.TYPE_CANINE);
			this.cocks[0].cLengthRaw = 8;
			this.cocks[0].cockColor = "black";
			this.balls = 2;
			this.ballSizeRaw = 5;
			this.cumMultiplierRaw = 20;
			this.ballEfficiency = 60;

			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 25;
			this.timesCum = 2508;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
		}
		
		public function UpgradeVersion1(dataObject:Object):void
		{
			if(dataObject.cocks.length > 0 && dataObject.cocks[0].cType == GLOBAL.TYPE_EQUINE)
			{
				dataObject.cocks[0].cLengthRaw = 16;
			}
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.approachTuuva();
		}
	}
}