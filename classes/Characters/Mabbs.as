package classes.Characters
{
	import classes.CockClass;
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.Throbb;
	import classes.Items.Transformatives.Gush;
	import classes.Items.Transformatives.Soak;
	import classes.Items.Stories.BreedingSylvie;
	import classes.kGAMECLASS;
	
	public class Mabbs extends Creature
	{
		public function Mabbs()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Mabbs";
			this.originalRace = "rodenian";
			this.a = "";
			this.capitalA = "";
			this.long = "";
			this.customDodge = "";
			this.customBlock = "";
			this.isPlural = false;
			
			this.inventory = [];
			inventory.push(new Gush());
			inventory.push(new Soak());
			inventory.push(new Throbb());
			inventory.push(new BreedingSylvie());
			
			keeperBuy = "set in vesperia/mabbs.as";
			
			this.typesBought = [];
			this.sellMarkup = 1.3;
			this.buyMarkdown = .8;
		}
		override public function get bustDisplay():String
		{
			var str:String = "MABBS";
			
			return str;
		}
	}
}
