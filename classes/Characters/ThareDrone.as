package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class ThareDrone extends Creature
	{
		public function ThareDrone()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			short = "Thare drone";
			originalRace = "robot";
			
			sellMarkup = 1.0;
			buyMarkdown = 1.0;
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.thareManorPQMenu();
		}
	}

}
