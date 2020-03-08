package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	
	public class Ardia extends Creature
	{
		//constructor
		public function Ardia()
		{
			this._latestVersion = 4;
			this.version = _latestVersion;
			this._neverSerialize = false;
			fluidSimulate = true;
			
			this.short = "Ardia";
			this.originalRace = "dzaan";
			this.a = "";
			this.capitalA = "";
			this.long = "";
			this.customDodge = "She easily avoids your attack.";
			this.customBlock = "She easily avoids your attack.";
			this.isPlural = false;

			this.meleeWeapon.longName = "fist";
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.attackNoun = "punch";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.physiqueRaw = 4;
			this.reflexesRaw = 5;
			this.aimRaw = 13;
			this.intelligenceRaw = 13;
			this.willpowerRaw = 13;
			this.libidoRaw = 65;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 45;

			this.level = 3;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 25;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 90;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "blue";
			this.tallness = 6*12+11;
			this.thickness = 90;
			this.tone = 0;
			this.hairColor = "blue";
			this.hairType = GLOBAL.HAIR_TYPE_REGULAR;
			this.scaleColor = "chocolate";
			this.furColor = "brown";
			this.hairLength = 11;
			
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "brown";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_DZAAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.lipColor = "blue";
			this.earType = GLOBAL.TYPE_DZAAN;
			this.earLength = 4;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = GLOBAL.TYPE_DZAAN;
			this.hornLength = 0;
			this.armType = GLOBAL.TYPE_DZAAN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_DZAAN;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_HUMAN;
			this.tailCount = 0;
			this.tailFlags = new Array();
			
			this.tailGenitalArg = 0;
			this.tailGenital = 0;
			this.tailVenom = 0;
			this.tailRecharge = 5;
			
			this.hipRatingRaw = 14;
			this.buttRatingRaw = 15;
			
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cLengthRaw = 10;
			this.cocks[0].cockColor = "brown";
			this.cocks[0].cType == GLOBAL.TYPE_THRAGGEN;
			this.cockVirgin = false;
			
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].bonusCapacity = 55;

			this.balls = 2;
			this.cumMultiplierRaw = 20;
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 12;
			this.ballFullness = 100;
			this.ballEfficiency = 60;
			this.refractoryRate = 3;
			
			this.minutesSinceCum = 65;
			this.timesCum = 1549;

			this.elasticity = 1.5;
			this.fertilityRaw = 5;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "dull pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 0;
			
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 25;
			
			isUniqueInFight = true;
			btnTargetText = "Ardia";
			setDefaultSexualPreferences();
			
			this._isLoading = false;
		}
		
		override public function setDefaultSexualPreferences():void
		{
			/*
			//Likes
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,			GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,			GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_WIDE_HIPS,			GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,				GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_PUSSIES,				GLOBAL.KINDA_LIKES_SEXPREF);

			//Dislikes
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_MASCULINE,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS,			GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SCALIES,				GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_GAPE,					GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_CUMMY,				GLOBAL.REALLY_DISLIKES_SEXPREF);*/
		}
		
		override public function get bustDisplay():String
		{
			return "ARDIA";
		}
		public function UpgradeVersion1(dataObject:Object):void
		{
			dataObject.cockVirgin = false;
		}
		public function UpgradeVersion2(dataObject:Object):void
		{
			dataObject.hairType = GLOBAL.HAIR_TYPE_REGULAR;
			dataObject.eyeType = GLOBAL.TYPE_HUMAN;
			dataObject.tongueType = GLOBAL.TYPE_HUMAN;
			dataObject.antennaeType = GLOBAL.TYPE_HUMAN;
			dataObject.skinType = GLOBAL.SKIN_TYPE_SKIN;
			
			dataObject.faceType = GLOBAL.TYPE_DZAAN;
			dataObject.earType = GLOBAL.TYPE_DZAAN;
			dataObject.earLength = 4;
			dataObject.horns = 0;
			dataObject.hornType = GLOBAL.TYPE_DZAAN;
			dataObject.hornLength = 0;
			dataObject.armType = GLOBAL.TYPE_DZAAN;
			dataObject.legType = GLOBAL.TYPE_DZAAN;
		}
		public function UpgradeVersion3(dataObject:Object):void
		{
			dataObject.fluidSimulate = true;
		}
	}
}