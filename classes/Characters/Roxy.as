package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	/**
	 * ...
	 * @author DrunkZombie
	 */
	public class Roxy extends Creature
	{
		
		public function Roxy() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Roxy";
			this.originalRace = "laquine";
			this.a = "";
			this.capitalA = "";
			this.isPlural = false;
			
			this.femininity = 100;
			this.hairType = GLOBAL.HAIR_TYPE_HAIR;
			this.hairColor = "dark brown";
			this.hairLength = 8;
			this.tallness = 68;
 
			this.tone = 75;
			this.thickness = 50;
 
			this.eyeColor = "topaz-yellow";
			this.skinTone = "tanned";
			this.skinFlags = new Array();
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.furColor = "milky-caramel";
			this.earType = GLOBAL.TYPE_LAPINE;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 2;
			this.lipColor = "dark brown";
			this.tongueType = GLOBAL.TYPE_LAPINE;
			this.armType = GLOBAL.TYPE_LAPINE;
			this.armFlags = [GLOBAL.FLAG_PAWS,GLOBAL.FLAG_FURRED];
			this.faceType = GLOBAL.TYPE_LAPINE;
			this.faceFlags = [GLOBAL.FLAG_SMOOTH];
			this.legType = GLOBAL.TYPE_LAPINE;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE,GLOBAL.FLAG_PAWS,GLOBAL.FLAG_FURRED];
			this.breastRows[0].breastRatingRaw = 7;
			this.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_INVERTED;
			this.nipplesPerBreast = 1;
			this.nippleColor = "dark brown";
			
			this.milkMultiplier = 0;
			this.milkRate = 0;
			this.milkFullness = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			
			this.createVagina();
			this.vaginas[0].vaginaColor = "ebony-black";
			this.vaginas[0].clits = 1;
			this.vaginas[0].type = GLOBAL.TYPE_EQUINE;
			this.vaginas[0].loosenessRaw = 3;
			this.vaginas[0].wetnessRaw = 3;
			this.vaginas[0].bonusCapacity = 50;
			this.clitLength = 0.5;
			
			this.elasticity = 1.00;
			this.fertilityRaw = 1.05;
			this.vaginalVirgin = false;			
			this.pregnancyMultiplierRaw = 1;			
			//this.impregnationType = "";
			
			this.tailType = GLOBAL.TYPE_LAPINE;
			this.tailCount = 1;
			this.tailFlags = new Array();
			this.addTailFlag(GLOBAL.FLAG_FURRED);
			this.tailGenitalArg = 0;
			this.tailGenital = 0;
			this.tailVenom = 0;
			this.tailRecharge = 0;
			
			this.hipRatingRaw = 13;
			this.buttRatingRaw = 9;
			
			this.analVirgin = false;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 100;

		}
		override public function loadInCunt(cumFrom:Creature = null, vagIndex:int = -1):Boolean
		{
			var heatSex:Boolean = false;
			if (flags["ROXY_HEAT_SEX"] == 1)
			{
				heatSex = true;
				flags["ROXY_HEAT_SEX"] = undefined;
			}
			this.vaginalVirgin = false;
			if (cumFrom is PlayerCharacter)
			{
				sstdChecks(cumFrom,"vagina");
				return kGAMECLASS.tryKnockUpRoxy(heatSex);
			}
			return false;
		}
		override public function isPregnant(vIdx:int = 0):Boolean
		{
			return (kGAMECLASS.flags["ROXY_PREG_TIMER"] != undefined);
		}
		
	}

}
