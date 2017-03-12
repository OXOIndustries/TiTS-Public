package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class ChrysalisDrone extends Creature
	{
		public function ChrysalisDrone()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			short = "Dark Chrysalis drone";
			originalRace = "robot";
			
			typesBought[typesBought.length] = GLOBAL.PILL;
			typesBought[typesBought.length] = GLOBAL.POTION;
			typesBought[typesBought.length] = GLOBAL.DRUG;
			
			sellMarkup = 1.2;
			buyMarkdown = .8;
			
			femininity = 85;
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.mainGameMenu();
		}
	}

}
