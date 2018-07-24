package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Guns.SalamanderRifle;
	import classes.Items.Guns.SalamanderPistol;
	import classes.Items.Melee.VampBlade;
	import classes.Items.Melee.LavaSaber;
	import classes.Items.Melee.Jolthammer;
	import classes.Items.Protection.SalamanderShield;
	import classes.Items.Protection.OzoneAegis;
	import classes.Items.Accessories.SalamanderDuster;
	import classes.Items.Accessories.SalamanderDefenseSystem;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class Emmy extends Creature
	{
		//constructor
		public function Emmy()
		{
			this._latestVersion = 2;
			this.version = _latestVersion;
			this._neverSerialize = false;
			fluidSimulate = true;
			statusSimulate = true;
			this.short = "Emmy";
			originalRace = "ausar";
			
			keeperBuy = "";
			keeperSell = "";
			
			inventory.push(new SalamanderRifle());
			inventory.push(new SalamanderPistol());
			inventory.push(new SalamanderDuster());
			inventory.push(new SalamanderShield());
			inventory.push(new VampBlade());
			inventory.push(new LavaSaber());
			inventory.push(new Jolthammer());
			inventory.push(new OzoneAegis());
			inventory.push(new SalamanderDefenseSystem());

			
			this.typesBought = [GLOBAL.MELEE_WEAPON,GLOBAL.RANGED_WEAPON,GLOBAL.SHIELD,GLOBAL.ACCESSORY];
			
			this.sellMarkup = 1.0;
			this.buyMarkdown = .25;

			this.femininity = 85;

			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cThicknessRatioRaw = 1;
			this.cocks[0].cLengthRaw = 15;
			this.cocks[0].cType = GLOBAL.TYPE_CANINE;
			this.cocks[0].cockColor = "black";
			this.cocks[0].cockFlags = [GLOBAL.FLAG_KNOTTED, GLOBAL.FLAG_SHEATHED, GLOBAL.FLAG_TAPERED];
			
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].type = GLOBAL.TYPE_CANINE;
			this.vaginas[0].hymen = false;
			this.vaginas[0].wetnessRaw = 3;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].vaginaColor = "black";
			this.vaginas[0].vagooFlags = [];
			
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 15;
			
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 0;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 10;
			this.ballFullness = 100;
			
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 30;
			
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 2000;
			this.timesCum = 1689;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;

			createPerk("No Cum Leakage",0,0,0,0);
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.backToEmmyMain();
		}
		public function UpgradeVersion1(dataObject:Object):void
		{
			dataObject.inventory.push(new SalamanderDefenseSystem().getSaveObject());
		}
	}
}