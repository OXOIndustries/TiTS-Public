package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	
	public class Makius extends Creature
	{
		//constructor
		public function Makius()
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = false;
			
			this.short = "Maki";
			this.originalRace = "venarian";
			this.capitalA = "";
			this.impregnationType = "MakiusPregnancy";
			this.cumMultiplierRaw = 400;
			this.fertilityRaw = 0.2;
			//has sterile perk when not in breeder form
			
			//Penis
			this.cocks = new Array();
			this.createCock();
			
			masculinize();
		}
		
		public function feminize():void{
			flags["MAKI_STATE"] = 1;
			this.removePerk("Sterile");
			this.buttRatingRaw = 8;
			
			this.cocks[0].cLengthRaw = 7;
			this.cocks[0].cThicknessRatioRaw = 1.25;
			
			this.ass.bonusCapacity = 150;
			this.elasticity = 3;
			this.ass.wetnessRaw = 3;
		}
		
		public function masculinize():void{
			flags["MAKI_STATE"] = 0;
			this.createPerk("Sterile");
			this.buttRatingRaw = 3;
			
			this.cocks[0].cLengthRaw = 9;
			this.cocks[0].cThicknessRatioRaw = 1.75;
			
			this.ass.bonusCapacity = 100;
			this.elasticity = 1;
			this.ass.wetnessRaw = 5;
			this.ass.loosenessRaw = 4;
		}
	}
}