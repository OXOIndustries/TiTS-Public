package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Transformatives.Sylvanol;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class Velta extends Creature
	{
		//constructor
		public function Velta()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Velta";
			this.originalRace = "human";
			this.a = "";
			this.capitalA = "";
			
			this.femininity = 75;
			this.hairType = GLOBAL.HAIR_TYPE_HAIR;
			this.hairColor = "jet-black";
			this.hairLength = 6;
			this.tallness = 60;
			this.tone = 60;
			this.thickness = 30;
			this.eyeColor = "blue and brown";
			this.skinTone = "cocoa";
			this.skinFlags = [GLOBAL.FLAG_SMOOTH];
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.earType = GLOBAL.TYPE_HUMAN;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 1;
			this.lipColor = "dark brown";
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
			this.nippleColor = "dark brown";
			
			this.milkMultiplier = 0;
			this.milkRate = 0;
			this.milkFullness = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].vaginaColor = "dark brown";
			this.vaginas[0].clits = 1;
			this.vaginas[0].type = GLOBAL.TYPE_HUMAN;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].bonusCapacity = 20; //should give her a 104 volume max
			this.clitLength = 0.5;
			this.vaginalVirgin = false;
			
			this.analVirgin = false;
			this.ass.loosenessRaw = 1;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 0;
			
			this.elasticity = 1.00;
			this.fertilityRaw = 1.00;
			this.pregnancyMultiplierRaw = 1;
			
			this.hipRatingRaw = 6;
			this.buttRatingRaw = 6;


		}		

	}
}