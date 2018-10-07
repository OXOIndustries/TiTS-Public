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
			this._latestVersion = 3;
			this.version = _latestVersion;
			this._neverSerialize = false;
			fluidSimulate = true;
			statusSimulate = true;
			this.short = "Emmy";
			originalRace = "ausar";
			this.a = "";
			this.capitalA = "";
			
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

			this.femininity = 100;
			this.eyeType = 0;
			this.eyeColor = "blue";
			this.tallness = 5*12+8;
			this.thickness = 50;
			this.tone = 25;
			this.hairColor = "black";
			this.scaleColor = "gold";
			this.furColor = "tawny";
			this.hairLength = 24;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "tan";
			this.skinFlags = [];
			this.faceType = GLOBAL.TYPE_CANINE;
			this.faceFlags = [GLOBAL.FLAG_MUZZLED,GLOBAL.FLAG_FURRED];
			this.tongueType = 0;
			this.tongueFlags = [];
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_CANINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_CANINE;
			this.armFlags = [GLOBAL.FLAG_FURRED,GLOBAL.FLAG_PAWS];
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_CANINE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE,GLOBAL.FLAG_FURRED,GLOBAL.FLAG_PAWS];
			this.hipRatingRaw = 9;
			this.buttRatingRaw = 9;
			this.breastRows[0].breastRatingRaw = 28;
			this.nippleWidthRatio = 2;
			this.nippleColor = "black";
			
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
		override public function get bustDisplay():String
		{
			return "EMMY";
		}
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.backToEmmyMain();
		}
		public function UpgradeVersion1(dataObject:Object):void
		{
			dataObject.inventory.push(new SalamanderDefenseSystem().getSaveObject());
		}
		public function UpgradeVersion2(dataObject:Object):void
		{
			dataObject.a = "";
			dataObject.capitalA = "";
			dataObject.femininity = 100;
			dataObject.eyeType = 0;
			dataObject.eyeColor = "blue";
			dataObject.tallness = 5*12+8;
			dataObject.thickness = 50;
			dataObject.tone = 25;
			dataObject.hairColor = "black";
			dataObject.scaleColor = "gold";
			dataObject.furColor = "tawny";
			dataObject.hairLength = 24;
			dataObject.hairType = 0;
			dataObject.beardLength = 0;
			dataObject.beardStyle = 0;
			dataObject.skinType = GLOBAL.SKIN_TYPE_FUR;
			dataObject.skinTone = "tan";
			dataObject.skinFlags = [];
			dataObject.faceType = GLOBAL.TYPE_CANINE;
			dataObject.faceFlags = [GLOBAL.FLAG_MUZZLED,GLOBAL.FLAG_FURRED];
			dataObject.tongueType = 0;
			dataObject.tongueFlags = [];
			dataObject.lipMod = 1;
			dataObject.earType = GLOBAL.TYPE_CANINE;
			dataObject.antennae = 0;
			dataObject.antennaeType = 0;
			dataObject.horns = 0;
			dataObject.hornType = 0;
			dataObject.armType = GLOBAL.TYPE_CANINE;
			dataObject.armFlags = [GLOBAL.FLAG_FURRED,GLOBAL.FLAG_PAWS];
			dataObject.gills = false;
			dataObject.wingType = 0;
			dataObject.legType = GLOBAL.TYPE_CANINE;
			dataObject.legCount = 2;
			dataObject.legFlags = [GLOBAL.FLAG_PLANTIGRADE,GLOBAL.FLAG_FURRED,GLOBAL.FLAG_PAWS];
			dataObject.hipRatingRaw = 9;
			dataObject.buttRatingRaw = 9;
			dataObject.breastRows[0].breastRatingRaw = 28;
			dataObject.nippleWidthRatio = 2;
			dataObject.nippleColor = "black";

		}
	}
}