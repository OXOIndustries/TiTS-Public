package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Transformatives.Sylvanol;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class Bea extends Creature
	{
		//constructor
		public function Bea()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Beatrice Reasner";
			originalRace = "human";
			
			femininity = 100;
			hairType = GLOBAL.HAIR_TYPE_HAIR;
			hairColor = "brown";
			hairLength = 16;
			tallness = 70;
			tone = 30;
			thickness = 60;
			eyeColor = "brown";
			skinTone = "fair";
			skinFlags = [GLOBAL.FLAG_SMOOTH];
			skinType = GLOBAL.SKIN_TYPE_SKIN;
			earType = GLOBAL.TYPE_HUMAN;
			eyeType = GLOBAL.TYPE_HUMAN;
			lipMod = 1;
			lipColor = "red";
			tongueType = GLOBAL.TYPE_HUMAN;
			armType = GLOBAL.TYPE_HUMAN;
			faceType = GLOBAL.TYPE_HUMAN;
			faceFlags = [GLOBAL.FLAG_SMOOTH];
			legType = GLOBAL.TYPE_HUMAN;
			legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			
			//breastRows = [new BreastRowClass()];
			breastRows[0].breastRatingRaw = 12;
			breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_INVERTED;
			nipplesPerBreast = 1;
			nippleColor = "brown";
			
			milkMultiplier = 15;
			milkRate = 10;
			milkFullness = 100;
			milkType = GLOBAL.FLUID_TYPE_MILK;
			girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			
			createVagina();
			vaginas[0].vaginaColor = "pink";
			vaginas[0].clits = 1;
			vaginas[0].type = GLOBAL.TYPE_HUMAN;
			vaginas[0].loosenessRaw = 3;
			vaginas[0].wetnessRaw = 2;
			clitLength = 0.8;
			vaginalVirgin = false;

			hipRatingRaw = 12
		}
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.ceriaMenu();
		}
	}
}