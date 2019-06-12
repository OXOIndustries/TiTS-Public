package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;

	import classes.kGAMECLASS;
	
	public class Vahn extends Creature
	{
		public function Vahn()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Vahn";
			this.originalRace = "ausar";
			this.a = "";
			this.capitalA = "";
			this.long = "";
			this.customDodge = "";
			this.customBlock = "";
			this.isPlural = false;
			
			this.inventory = [];
			
			keeperBuy = "Unneeded";
			
			this.typesBought = [];
			this.sellMarkup = 1.0;
			this.buyMarkdown = .6;
			this.createPerk("SHIP VENDOR");
		}
		override public function get bustDisplay():String
		{
			var str:String = "VAHN";
			
			return str;
		}
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.VahnTheMechanic();
		}
	}
}
