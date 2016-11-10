package classes.Characters 
{
	import classes.kGAMECLASS;
	import classes.BreastRowClass;
	import classes.CockClass;
	import classes.Creature;
	import classes.GLOBAL;
	//import classes.Items.Apparel.ComfortableClothes;
	import classes.VaginaClass;
	
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	import classes.Engine.Utility.weightedRand;
	
	/**
	 * Notes:
	 * @author Fenoxo, copy/pasted from Gedan's Saendra.as
	 */
	public class Pexiga extends Creature
	{
		public function Pexiga() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = false;
			
			this.short = "pexiga";
			this.originalRace = "pexiga";
			this.a = "";
			this.capitalA = "";
			// old descript:
			// long = "";
			
			this.level = 3;
			this.physiqueRaw = 13;
			this.reflexesRaw = 13;
			this.aimRaw = 13;
			this.intelligenceRaw = 4;
			this.willpowerRaw = 1;
			this.libidoRaw = 100;
			
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 100;
			
			this.XPRaw = normalXP();
			this.HPRaw = this.HPMax();
			
			/* STUFF I DONT REALLY NEED COPY/PASTED FROM SAEN DISABLED
			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_FELINE;
			this.eyeColor = "green";
			this.tallness = 75;
			this.thickness = 20;
			this.tone = 75;
			this.hairColor = "firey-red";
			this.scaleColor = "";
			this.furColor = "gray";
			this.hairLength = 36;
			this.hairType = GLOBAL.HAIR_TYPE_REGULAR;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "pale";
			this.skinFlags = [GLOBAL.FLAG_FLUFFY];
			this.faceType = GLOBAL.TYPE_FELINE;
			this.faceFlags = [];
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_FELINE;
			this.antennae = 0;
			this.horns = 0;
			this.hornType = 0
			this.armType = GLOBAL.TYPE_CANINE;
			this.gills = false;
			this.legType = GLOBAL.TYPE_CANINE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_FELINE;
			this.tailCount = 2;
			this.tailFlags = [GLOBAL.FLAG_FURRED, GLOBAL.FLAG_FLUFFY, GLOBAL.FLAG_LONG];
			this.tailGenitalArg = 0;
			this.tailGenital = 0;
			
			this.hipRatingRaw = 10;
			this.buttRatingRaw = 8;
			
			this.cocks = [];
			this.cockVirgin = true;
			this.balls = 0;
			this.cumMultiplierRaw = 0;
			this.cumQualityRaw = 0;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			this.ballFullness = 0;
			this.refractoryRate = 6;
			*/

			this.vaginas = [];
			this.createVagina();
			(this.vaginas[0] as VaginaClass).loosenessRaw = 1;
			(this.vaginas[0] as VaginaClass).hymen = false;
			(this.vaginas[0] as VaginaClass).wetnessRaw = 5;
			(this.vaginas[0] as VaginaClass).bonusCapacity = 100;
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.elasticity = 1.5;
			this.fertilityRaw = 0;
			this.clitLength = 0.5;
			this.pregnancyMultiplierRaw = 1;
			this.vaginalVirgin = false;
			
			// Breastrow 0 implicitly available
			(this.breastRows[0] as BreastRowClass).breastRatingRaw = 4;
			//BIMBO VERS: (this.breastRows[0] as BreastRowClass).breastRatingRaw = 12;
						
			this.nippleColor = "blue";
			//this.milkMultiplier = 1;
			//this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//this.milkRate = 0;
			
			(this.ass as VaginaClass).wetnessRaw = 0;
			(this.ass as VaginaClass).loosenessRaw = 1;
			this.analVirgin = true;
			
			//this.minutesSinceCum = 3200;
			this.timesCum = 2;
			
			//isUniqueInFight = true;
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			var str:String = "PEXIGA";
			
			return str;
		}
	}

}
