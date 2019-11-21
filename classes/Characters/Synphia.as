package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	
	public class Synphia extends Creature
	{
		public function Synphia()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Synphia";
			this.originalRace = "slyveren";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "";
			this.customDodge = "";
			this.customBlock = "";
			this.isPlural = false;
			
			this.inventory = [];
			
			keeperBuy = "Unneeded";
			
			this.typesBought = [];
			this.sellMarkup = 1.0;
			this.buyMarkdown = .4;
			
			//this.createPerk("SHIP VENDOR");
		}
		override public function get bustDisplay():String
		{
			var str:String = "SYNPHIA";
			
			return str;
		}
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.approachSynphia(true);
		}
	}
}
