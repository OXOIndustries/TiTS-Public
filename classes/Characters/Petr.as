package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Apparel.BaggySwimShorts;
	import classes.Items.Apparel.MaleThong;
	import classes.Items.Apparel.OnePieceSwimsuit;
	import classes.Items.Apparel.FrillyBikiniTop;
	import classes.Items.Apparel.FrillyBikiniBottom;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class Petr extends Creature
	{
		//constructor
		public function Petr()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			short = "Petr";
			originalRace = "human";
			
			inventory.push(new BaggySwimShorts());
			inventory.push(new MaleThong());
			inventory.push(new OnePieceSwimsuit());
			inventory.push(new FrillyBikiniTop());
			inventory.push(new FrillyBikiniBottom());
			
			sellMarkup = 0.9;
			buyMarkdown = 0.5;

			femininity = 10;
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.mainGameMenu();
		}
	}
}
