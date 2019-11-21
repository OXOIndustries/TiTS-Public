package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Engine.Interfaces.GetGameTimestamp;
	import classes.kGAMECLASS;
	
	public class Mirrin extends Creature
	{
		public function Mirrin()
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true;
			
			this.short = "Mirrin";
			this.originalRace = "qilin";
			
			//I dont recall her exact measurements, so these are guestimated.
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cThicknessRatioRaw = 1;
			this.cocks[0].cLengthRaw = 16;
			this.cocks[0].cType = GLOBAL.TYPE_EQUINE;
			this.cocks[0].addFlag(GLOBAL.FLAG_BLUNT);
			this.cocks[0].addFlag(GLOBAL.FLAG_FLARED);
			this.createCock();
			this.cocks[1].cThicknessRatioRaw = 1;
			this.cocks[1].cLengthRaw = 12;
			this.cocks[1].cType = GLOBAL.TYPE_EQUINE;
			this.cocks[1].addFlag(GLOBAL.FLAG_BLUNT);
			this.cocks[1].addFlag(GLOBAL.FLAG_FLARED);
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 100;
			this.ballEfficiency = 300;
			this.ballSizeRaw = 3.5;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballFullness = 100;
			
			this.refractoryRate = 9991;
			this.minutesSinceCum = 65;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			
			this._isLoading = false;
		}

		public function upgradeCawks():void
		{
			cocks[0].cLength(22, true);
			cocks[0].addFlag(GLOBAL.FLAG_RIBBED);
			cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
			cocks[1].cLength(17, true);
			cocks[1].addFlag(GLOBAL.FLAG_RIBBED);
			cocks[1].addFlag(GLOBAL.FLAG_KNOTTED);
		}
	}
}