package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Transformatives.Sylvanol;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class Ceria extends Creature
	{
		//constructor
		public function Ceria()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Ceria";
			this.originalRace = "human";
			this.a = "";
			this.capitalA = "";
			
			this.femininity = 100;
			this.hairType = GLOBAL.HAIR_TYPE_HAIR;
			this.hairColor = "pink";
			this.hairLength = 18;
			this.tallness = 68;
			this.tone = 30;
			this.thickness = 20;
			this.eyeColor = "sapphire";
			this.skinTone = "tanned";
			this.skinFlags = [GLOBAL.FLAG_SMOOTH];
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.earType = GLOBAL.TYPE_SYLVAN;
			this.earLength = 7;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 1;
			this.lipColor = "rose gold";
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = [GLOBAL.FLAG_SMOOTH];
			this.legType = GLOBAL.TYPE_HUMAN;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			
			//breastRows = [new BreastRowClass()];
			this.breastRows[0].breastRatingRaw = 6;
			this.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
			this.nipplesPerBreast = 1;
			this.nippleColor = "bubblegum-pink";
			
			this.milkMultiplier = 0;
			this.milkRate = 0;
			this.milkFullness = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].vaginaColor = "bubblegum-pink";
			this.vaginas[0].clits = 1;
			this.vaginas[0].type = GLOBAL.TYPE_HUMAN;
			this.vaginas[0].loosenessRaw = 5;
			this.vaginas[0].wetnessRaw = 5;
			this.vaginas[0].bonusCapacity = 100; //should give her a 400 volume max
			this.clitLength = 0.5;
			this.vaginalVirgin = false;
			
			this.analVirgin = false;
			this.ass.loosenessRaw = 2;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15; //73 volume max
			
			this.elasticity = 1.00;
			this.fertilityRaw = 1.00;
			this.pregnancyMultiplierRaw = 1;
			
			this.hipRatingRaw = 6;
			this.buttRatingRaw = 6;
			
			this.inventory.push(new Sylvanol());
			//this.inventory.push(new ());
			this.sellMarkup = 1.2;
			this.buyMarkdown = .5;

		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.ceriaMenu();
		}
	}
}