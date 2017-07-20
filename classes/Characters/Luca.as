package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.*;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class Luca extends Creature
	{
		//constructor
		public function Luca()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Luca";
			originalRace = "dzaan";
			
			keeperBuy = "";
			keeperSell = "";
			

			inventory.push(new FocusPill());
			
			this.typesBought = [];
			
			this.sellMarkup = 1.0;
			this.buyMarkdown = .5;

			this.femininity = 85;
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.lucaBusinessMenu();
		}
	}
}
