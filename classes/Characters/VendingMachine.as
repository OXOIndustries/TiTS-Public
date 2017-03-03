package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Transformatives.TauricoVenidae;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class VendingMachine extends Creature
	{
		//constructor
		public function VendingMachine()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			short = "vending machine";
			originalRace = "robot";
			
			inventory = [];
			
			sellMarkup = 1.0;
			buyMarkdown = 1.0;
			
			femininity = 85;
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.mainGameMenu();
		}
	}
}