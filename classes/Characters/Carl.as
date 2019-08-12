package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Accessories.LeithaCharm;
	import classes.Items.Miscellaneous.AssSlapPatch;
	import classes.Items.Miscellaneous.EasyFit;
	import classes.Items.Miscellaneous.FocusPill;
	import classes.Items.Miscellaneous.NukiCookies;
	import classes.Items.Transformatives.Hornucopia;
	import classes.Items.Transformatives.Nepeta;
	import classes.Items.Transformatives.SirensBounty;
	import classes.Items.Transformatives.OrefishShard;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class Carl extends Creature
	{
		//constructor
		public function Carl()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Carl";
			originalRace = "terran";
			
			keeperBuy = "";
			keeperSell = "";
						
			this.typesBought = [];
			
			this.sellMarkup = 1;
			this.buyMarkdown = .5;

			this.femininity = 25;
		}
		override public function get bustDisplay():String
		{
			return "CARL";
		}
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.crazyCarlShop();
		}
	}
}
