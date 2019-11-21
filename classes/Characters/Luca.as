package classes.Characters
{
	import classes.Creature;
	import classes.CockClass;
	import classes.kGAMECLASS;
	import classes.VaginaClass;
	
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

			this.cocks[0] = new CockClass();
			this.cocks[0].cLength(11, true);
			this.cocks[0].cThicknessRatio(1.5, true);

			// for vag cap you can copy Kaska, but make it a bit bigger
			this.vaginas[0] = new VaginaClass();
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].bonusCapacity = 50;

			this.createPerk("Fixed CumQ", 500);
		}
		override public function get bustDisplay():String
		{
			return "LUCA";
		}
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.lucaBusinessMenu();
		}
	}
}
