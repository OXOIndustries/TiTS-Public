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
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class Nevrie extends Creature
	{
		//constructor
		public function Nevrie()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Nevrie";
			originalRace = "dzaan";
			
			keeperBuy = "You tell Nevrie you’d like to see what the Xenogen store has in stock.\n\n<i>“Sure thing,”</i> she answers, spinning one of the holodisplays around so you can read it. <i>“Punch in whatever you want from the inventory list here, and one of the cargo bots will fetch it from storage.”</i>\n\nWhile you peruse the shop’s holographic wares, Nevrie leans back in her swivel chair and pulls the bag of snacks she was eating earlier back out of the drawer and resumes munching, only occasionally shooting a glance your way.\n";
			keeperSell = "";
			
			inventory.push(new AssSlapPatch());
			inventory.push(new EasyFit());
			inventory.push(new FocusPill());
			inventory.push(new Hornucopia());
			inventory.push(new LeithaCharm());
			inventory.push(new Nepeta());
			inventory.push(new NukiCookies());
			inventory.push(new SirensBounty());
			
			this.typesBought = [];
			
			this.sellMarkup = .9;
			this.buyMarkdown = .5;

			this.femininity = 85;
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.myrellionNevrieMenu();
		}
	}
}
