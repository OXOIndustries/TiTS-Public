package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	
	public class Kally extends Creature
	{
		public function Kally() 
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			short = "Kally";
			originalRace = "kui-tan";
			
			femininity = 85;
			tallness = 67; //Kiro: 66
			createCock();
			cocks[0].cType = GLOBAL.TYPE_INHUMAN;
			cocks[0].cLengthRaw = 13;
			cocks[0].cockColor = "black";
			cocks[0].addFlag(GLOBAL.FLAG_BLUNT);
			cocks[0].addFlag(GLOBAL.FLAG_SHEATHED);
			cocks[0].flaccidMultiplier = (12/13);
			
			createPerk("Fixed CumQ",4000,0,0,0);
		}
		//Gotta reset 'dem balls!'
		override public function cumQ(): Number {
			//Natural amount: 3L
			//1T, 1.5T, 2T, 3T, 4T, 5T
			var amount:Number = super.cumQ();
			if(kGAMECLASS.flags["SISTER_MILK_ACT"] == undefined || kGAMECLASS.flags["SISTER_MILK_ACT"] == 0) return amount;
			else if(kGAMECLASS.flags["SISTER_MILK_ACT"] == 1) amount *= 1.5;
			else if(kGAMECLASS.flags["SISTER_MILK_ACT"] == 2) amount *= 2;
			else if(kGAMECLASS.flags["SISTER_MILK_ACT"] == 3) amount *= 3;
			else if(kGAMECLASS.flags["SISTER_MILK_ACT"] == 4) amount *= 4;
			else if(kGAMECLASS.flags["SISTER_MILK_ACT"] == 5) amount *= 5;
			else 
			{
				if(kGAMECLASS.flags["SISTER_MILK_ACT"] < 15) amount *= kGAMECLASS.flags["SISTER_MILK_ACT"];
				else amount *= 15;
			}
			return amount;		
		}
	}
}
