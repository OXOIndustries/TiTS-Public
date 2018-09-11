package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;

/*Erika, a slender kaithrit, sits alone at the bar. By a rough estimate, you would say that she stands at about 5'3''. The first impression her appearance gives you is a lot like a standard kaithrit, with feline ears poking from her hair, two feline tails swirling behind her, and normal human like skin.

Long purple hair with lime green highlights hangs in front of her green feline eyes, adorning her pale face. Erika’s full lips are a positively eye-catching feature of her face, with the lower one adorned by a single gleaming silver stud.

She is wearing a rather banal outfit: a plain white strapless blouse and a pair of jeans. You notice that her nipples are visible through her shirt; it looks like this little kitty likes going commando. Her jeans cling to her fertile hips and plump butt, while two dark purple feline tails curl and sway behind her. The tips of her tails are highlighted with the same green color as her hair.

A small but undeniably unfeminine bulge lies between her legs. {If has seen her naked: Having seen below her clothes, you know that her boobs are definitely a C - cup. She has roughly five inches worth of canine meat between her legs, located just below a heart - shaped thatch of pubic hair. Below that is a pair of tightly drawn balls. 
*/
	public class Erika extends Creature
	{
		
		public function Erika() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Erika";
			this.originalRace = "kaithrit";
			this.a = "";
			this.capitalA = "";
			this.isPlural = false;
			
			this.femininity = 100;
			this.hairType = GLOBAL.HAIR_TYPE_HAIR;
			this.hairColor = "purple and green";
			this.hairLength = 40;
			this.tallness = 63;
 
			this.tone = 20;
			this.thickness = 40;
 
			this.eyeColor = "green";
			this.skinTone = "pale";
			this.skinFlags = [GLOBAL.FLAG_SMOOTH];
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.furColor = "dark purple";
			this.earType = GLOBAL.TYPE_FELINE;
			this.eyeType = GLOBAL.TYPE_FELINE;
			this.lipMod = 2;
			this.lipColor = "pink";
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.armType = GLOBAL.TYPE_FELINE;
			this.armFlags = [GLOBAL.FLAG_PAWS];
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = [GLOBAL.FLAG_SMOOTH];
			this.legType = GLOBAL.TYPE_FELINE;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE, GLOBAL.FLAG_FURRED];
			this.breastRows[0].breastRatingRaw = 3;
			this.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_INVERTED;
			this.nipplesPerBreast = 1;
			this.nippleColor = "pink";
			
			this.milkMultiplier = 0;
			this.milkRate = 0;
			this.milkFullness = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;

			this.tailType = GLOBAL.TYPE_FELINE;
			this.tailCount = 2;
			this.tailFlags = [GLOBAL.FLAG_PREHENSILE, GLOBAL.FLAG_LONG, GLOBAL.FLAG_FURRED];
			this.tailGenitalArg = 0;
			this.tailGenital = 0;
			this.tailVenom = 0;
			this.tailRecharge = 0;

			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cThicknessRatioRaw = 1.5;
			this.cocks[0].cLengthRaw = 5;
			this.cocks[0].cType = GLOBAL.TYPE_CANINE;
			this.cocks[0].cockColor = "red";
			this.cocks[0].cockFlags = [GLOBAL.FLAG_KNOTTED, GLOBAL.FLAG_TAPERED];
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 3;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 15;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 65;
			this.timesCum = 9001;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
		}
		
		
	}

}