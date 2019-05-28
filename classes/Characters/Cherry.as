package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	
	public class Cherry extends Creature
	{
		//constructor
		public function Cherry()
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true;
			
			this.short = "Cherry";
			this.originalRace = "rahn";
			
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 50;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 24;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 400;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 5;
			this.minutesSinceCum = 300;
			this.timesCum = 5555;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].clits = 1;
			this.vaginas[0].wetnessRaw = 5;
			this.vaginas[0].loosenessRaw = 1;
			this.vaginas[0].bonusCapacity = 10;
			this.vaginas[0].vaginaColor = "crimson";
			//Goo is hyper friendly!
			this.elasticity = 10;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 7;
			this.nippleColor = "red";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 2;
						
			this._isLoading = false;
		}
		override public function get bustDisplay():String
		{
			return "CHERRY";
		}
	}
}