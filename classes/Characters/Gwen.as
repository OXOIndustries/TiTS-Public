package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Accessories.ExplorersCloak;
	import classes.Items.Apparel.HardlightAGBra;
	import classes.Items.Apparel.SlepraDownBra;
	import classes.Items.Armor.GemstoneLinks;
	import classes.Items.Armor.SleekParka;
	import classes.kGAMECLASS;
	
	public class Gwen extends Creature
	{
		//constructor
		public function Gwen()
		{
			this._latestVersion = 11;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Gwen";
			this.originalRace = "puzai";

			inventory.push(new ExplorersCloak(), new GemstoneLinks(), new SleekParka(), new HardlightAGBra(), new SlepraDownBra());
			
			this.sellMarkup = 1.2;
			this.buyMarkdown = .75;

			this.femininity = 85;
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.mainGameMenu();
		}
	}
}