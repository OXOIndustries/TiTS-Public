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
			createCock();
			cocks[0].cType = GLOBAL.TYPE_INHUMAN;
			cocks[0].cLengthRaw = 13;
			cocks[0].cockColor = "black";
			cocks[0].addFlag(GLOBAL.FLAG_BLUNT);
			cocks[0].addFlag(GLOBAL.FLAG_SHEATHED);
			cocks[0].flaccidMultiplier = (12/13);
			
			createPerk("Fixed CumQ",3000,0,0,0);
		}
	}
}
