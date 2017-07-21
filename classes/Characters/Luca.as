package classes.Characters
{
	import classes.Creature;
	import classes.kGAMECLASS;
	
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
