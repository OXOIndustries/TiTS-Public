package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;

	public class Ciaran extends Creature
	{
		
		public function Ciaran() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Ciaran Eildean";
			this.originalRace = "ausar";
			this.a = "";
			this.capitalA = "";
			this.isPlural = false;
			
			this.femininity = 0;
			this.hairType = GLOBAL.HAIR_TYPE_HAIR;
			this.hairColor = "onyx";
			this.hairLength = 3;
			this.tallness = 92;
 
			this.tone = 95;
			this.thickness = 5;
 
			this.eyeColor = "red orange";
			this.skinTone = "tan";
			this.skinFlags = [GLOBAL.FLAG_SMOOTH];
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.furColor = "onyx";
			this.earType = GLOBAL.TYPE_CANINE;
			this.eyeType = GLOBAL.TYPE_FELINE;
			this.beardLength = 0.25
			this.lipMod = 0;
			this.lipColor = "peach";
			this.horns = 2;
			this.hornType = GLOBAL.TYPE_BOVINE
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.armType = GLOBAL.TYPE_CANINE;
			//this.armFlags = [GLOBAL.FLAG_PAWS];
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = [GLOBAL.FLAG_ANGULAR];
			this.legType = GLOBAL.TYPE_CANINE;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE, GLOBAL.FLAG_FURRED];
			this.breastRows[0].breastRatingRaw = 0;
			this.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
			this.nipplesPerBreast = 1;
			this.nippleColor = "brown";
			
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cThicknessRatioRaw = 1.2;
			this.cocks[0].cLengthRaw = 14;
			this.cocks[0].addFlag(GLOBAL.FLAG_TAPERED);
			this.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
			
			this.balls = 4;
			this.cumMultiplierRaw = 25;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 15;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 10;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 200;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.timesCum = 0;
			this.minutesSinceCum = 9999;
			
			this.tailType = GLOBAL.TYPE_CANINE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_FLUFFY, GLOBAL.FLAG_LONG, GLOBAL.FLAG_FURRED];
			
			this.hipRatingRaw = 2;
			this.buttRatingRaw = 5;

		}
		
		override public function get bustDisplay():String
		{
			return "CIARAN";
		}
		
	}

}