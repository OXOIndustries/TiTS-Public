package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	
	public class Focalor extends Creature
	{
		public function Focalor()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Focalor";
			this.originalRace = "tove";
			this.a = "";
			this.capitalA = "";
			this.long = "";
			this.customDodge = "";
			this.customBlock = "";
			this.isPlural = false;
			
			this.inventory = [];
			
			keeperBuy = "Unneeded";
			
			this.typesBought = [];
			this.sellMarkup = 1.1;
			this.buyMarkdown = .2;
			this.createPerk("SHIP VENDOR");
		}
		override public function get bustDisplay():String
		{
			var str:String = "FOCALOR";
			
			return str;
		}
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.leaveFocalor();
		}
	}
}
