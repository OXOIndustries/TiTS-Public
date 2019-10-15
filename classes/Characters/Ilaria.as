//=========================
//Mostly stolen from Emmy.as with no effort.
//=========================

package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class Ilaria extends Creature
	{
		//constructor
		public function Ilaria()
		{
			this._latestVersion = 2;
			this.version = _latestVersion;
			this._neverSerialize = false;
			fluidSimulate = true;
			//statusSimulate = true;
			this.short = "Ilaria";
			originalRace = "ausar";
			
			this.femininity = 85;

			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cThicknessRatioRaw = 1;
			this.cocks[0].cLengthRaw = 6;
			this.cocks[0].cType = GLOBAL.TYPE_CANINE;
			this.cocks[0].cockColor = "red";
			this.cocks[0].cockFlags = [GLOBAL.FLAG_KNOTTED, GLOBAL.FLAG_SHEATHED, GLOBAL.FLAG_TAPERED];
			
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].type = GLOBAL.TYPE_CANINE;
			this.vaginas[0].hymen = false;
			this.vaginas[0].wetnessRaw = 3;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].bonusCapacity = 15;
			this.vaginas[0].vaginaColor = "black";
			this.vaginas[0].vagooFlags = [];
			
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 15;
			
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 10;
			this.ballFullness = 100;
			
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 30;
			
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 2000;
			this.timesCum = 1689;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.fertilityRaw = 8;
			createPerk("Fixed CumQ",50000,0,0,0);
			//createPerk("No Cum Leakage",0,0,0,0);
			this.impregnationType = "IlariaPregnancy";
		}
		public function UpgradeVersion1(dataObject:Object):void
		{
			dataObject.cumQualityRaw = 1;
			dataObject.impregnationType = "IlariaPregnancy";
		}
		override public function get bustDisplay():String
		{
			if(bellyRating() >= 25) return "ILARIA_PREG";
			return "ILARIA";
		}
		
		override public function isPregnant(vIdx:int = 0):Boolean
		{
			return (kGAMECLASS.flags["ILARIA_PREG_TIMER"] != undefined);
		}
		override public function loadInCunt(cumFrom:Creature = null, vagIndex:int = -1):Boolean
		{
			if (cumFrom is PlayerCharacter) sstdChecks(cumFrom,"vagina");
			
			kGAMECLASS.tryKnockUpIlaria();
			
			return false;
		}
	}
}
