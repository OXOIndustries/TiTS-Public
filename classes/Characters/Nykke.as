package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	/**
	 * ...
	 * @author DrunkZombie
	 */
	public class Nykke extends Creature
	{
		
		public function Nykke() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Nykke";
			this.originalRace = "frostwyrm";
			this.a = "";
			this.capitalA = "";
			this.isPlural = false;
			
			this.femininity = 50;
			this.tallness = 120;
 
			this.tone = 60;
			this.thickness = 60;
 
			this.eyeColor = "red";
			this.skinTone = "black";
			this.skinFlags = new Array();
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.scaleColor = "black";
			this.earType = GLOBAL.TYPE_DRACONIC;
			this.eyeType = GLOBAL.TYPE_SNAKE;
			this.lipMod = 2;
			this.lipColor = "pink";
			this.tongueType = GLOBAL.TYPE_DRACONIC;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.faceType = GLOBAL.TYPE_DRACONIC;
			this.breastRows[0].breastRatingRaw = 7;
			this.nipplesPerBreast = 1;
			this.nippleColor = "pink";
			this.horns = 2;
			this.hornType = GLOBAL.TYPE_DRACONIC;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_DRACONIC;
			this.legType = GLOBAL.TYPE_DRACONIC;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			
			this.milkMultiplier = 0;
			this.milkRate = 0;
			this.milkFullness = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			
			this.createVagina();
			this.vaginas[0].vaginaColor = "black";
			this.vaginas[0].clits = 1;
			this.vaginas[0].type = GLOBAL.TYPE_FROSTWYRM;
			this.vaginas[0].loosenessRaw = 5;
			this.vaginas[0].wetnessRaw = 5;
			this.vaginas[0].bonusCapacity = 1000;
			this.clitLength = 0.5;
			
			this.elasticity = 1;
			this.fertilityRaw = 10;
			this.clitLength = 3;
			this.pregnancyMultiplierRaw = 1;			
			//this.impregnationType = "FrostwyrmPregnancy";
			
			this.tailType = GLOBAL.TYPE_DRACONIC;
			this.tailCount = 1;
			this.tailGenitalArg = 0;
			this.tailGenital = 0;
			this.tailVenom = 0;
			this.tailRecharge = 0;
			
			this.hipRatingRaw = 16;
			this.buttRatingRaw = 16;
						
			this.cocks = new Array();
			this.createCock();
			this.shiftCock(0, GLOBAL.TYPE_FROSTWYRM);
			this.cocks[0].cLengthRaw = 12;
			this.cocks[0].cThicknessRatioRaw = 1.5;
			this.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
			
			this.balls = 2;
			this.cumMultiplierRaw = 3500;
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 100;
			this.ballFullness = 100;
			this.ballEfficiency = 200;
			this.refractoryRate = 50;
			this.minutesSinceCum = 5256000;
			this.timesCum = 0;			
			
			this.cockVirgin = true;
			this.analVirgin = true;
			this.vaginalVirgin = true;
			
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 1000;
			this.ass.loosenessRaw = 5;
			
			this.createPerk("Fixed CumQ",10000,0,0,0);

		}
		
	}

}
