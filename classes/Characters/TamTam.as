package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	/**
	 * ...
	 * @author Upcast Drake
	 */
	public class TamTam extends Creature
	{
		
		public function TamTam() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Tam-Tam";
			this.originalRace = "kaithrit";
			this.a = "";
			this.capitalA = "";
			this.isPlural = false;
			
			this.femininity = 100;
			this.hairType = GLOBAL.HAIR_TYPE_HAIR;
			this.hairColor = "pink";
			this.hairLength = 32;
			this.tallness = 60;
 
			this.tone = 20;
			this.thickness = 40;
 
			this.eyeColor = "blue";
			this.skinTone = "fair";
			this.skinFlags = [GLOBAL.FLAG_SMOOTH];
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.furColor = "pink";
			this.earType = GLOBAL.TYPE_FELINE;
			this.eyeType = GLOBAL.TYPE_FELINE;
			this.lipMod = 2;
			this.lipColor = "peach";
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = [GLOBAL.FLAG_SMOOTH];
			this.legType = GLOBAL.TYPE_HUMAN;
			this.breastRows[0].breastRatingRaw = 6;
			this.nipplesPerBreast = 1;
			this.nippleColor = "pink";
			
			this.milkMultiplier = 0;
			this.milkRate = 0;
			this.milkFullness = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			
			this.createVagina();
			this.vaginas[0].vaginaColor = "pink";
			this.vaginas[0].clits = 1;
			this.vaginas[0].type = GLOBAL.TYPE_HUMAN;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 4;
			this.clitLength = 0.5;
			this.vaginalVirgin = false;
			this.fertilityRaw = 1.05;
			
			this.tailType = GLOBAL.TYPE_FELINE;
			this.tailCount = 2;
			this.tailFlags = [GLOBAL.FLAG_PREHENSILE, GLOBAL.FLAG_LONG, GLOBAL.FLAG_FURRED];
			this.tailGenitalArg = 0;
			this.tailGenital = 0;
			this.tailVenom = 0;
			this.tailRecharge = 0;
			
			this.hipRatingRaw = 8;
			this.buttRatingRaw = 8;

		}
		
		override public function get bustDisplay():String
		{
			return "TAMTAM";
		}
		
		override public function isPregnant(vIdx:int = 0):Boolean
		{
			return (kGAMECLASS.flags["TAMTAM_PREGNANCY_TIMER"] != undefined);
		}
	}

}