package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	
	public class Cynthia extends Creature
	{
		public function Cynthia()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Cynthia";
			originalRace = "human";
			
			femininity = 80;
			hairType = GLOBAL.HAIR_TYPE_HAIR;
			hairColor = "black";
			hairLength = 18;
			tallness = 102;
			tone = 100;
			thickness = 100;
			eyeColor = "brown";
			skinTone = "black";
			skinFlags = [GLOBAL.FLAG_SMOOTH];
			skinType = GLOBAL.SKIN_TYPE_FUR;
			furColor = "brown";
			faceType = GLOBAL.TYPE_BOVINE;
			faceFlags = [GLOBAL.FLAG_MUZZLED, GLOBAL.FLAG_LONG];
			earType = GLOBAL.TYPE_BOVINE;
			eyeType = GLOBAL.TYPE_HUMAN;
			lipMod = 1;
			lipColor = "black";
			tongueType = GLOBAL.TYPE_HUMAN;
			armType = GLOBAL.TYPE_HUMAN;
			armFlags = [GLOBAL.FLAG_FURRED];
			legType = GLOBAL.TYPE_BOVINE;
			legFlags = [GLOBAL.FLAG_DIGITIGRADE, GLOBAL.FLAG_FURRED, GLOBAL.FLAG_HOOVES];
			
			hornType = GLOBAL.TYPE_BOVINE;
			horns = 2;
			hornLength = 1;
			tailType = GLOBAL.TYPE_BOVINE;
			tailCount = 1;
			tailFlags = [GLOBAL.FLAG_LONG, GLOBAL.FLAG_FLUFFY];
			
			//breastRows = [new BreastRowClass()];
			breastRows[0].breastRatingRaw = 21;
			breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
			nipplesPerBreast = 1;
			nippleColor = "black";
			
			milkMultiplier = 200;
			milkRate = 50;
			milkFullness = 100;
			milkType = GLOBAL.FLUID_TYPE_MILK;
			girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			
			createVagina();
			shiftVagina(0, GLOBAL.TYPE_GABILANI);
			vaginas[0].vaginaColor = "black";
			vaginas[0].addFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED);
			vaginalVirgin = false;
			
			hipRatingRaw = 21;
			buttRatingRaw = 18;
			
			createPerk("Bubble Butt", 0, 0, 0, 0, "");
		}
	}
}

