package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.Chocolac;
	import classes.Items.Miscellaneous.Condensol;
	import classes.Items.Miscellaneous.Estrobloom;
	import classes.Items.Miscellaneous.Pussybloom;
	import classes.Items.Miscellaneous.Pussyblossom;
	import classes.Items.Miscellaneous.Rainbotox;
	import classes.Items.Miscellaneous.TerranTreats;
	import classes.Items.Miscellaneous.Tittyblossom;
	import classes.Items.Transformatives.DendroGro;
	import classes.Items.Transformatives.ManUp;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class ChrysalisDrone extends Creature
	{
		public function ChrysalisDrone()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			short = "Dark Chrysalis drone";
			originalRace = "robot";
			
			inventory.push(new TerranTreats());
			inventory.push(new Estrobloom());
			inventory.push(new Tittyblossom());
			inventory.push(new Pussybloom());
			inventory.push(new Pussyblossom());
			inventory.push(new ManUp());
			inventory.push(new Condensol());
			inventory.push(new DendroGro());
			inventory.push(new Rainbotox());
			inventory.push(new Chocolac());
			
			typesBought[typesBought.length] = GLOBAL.PILL;
			typesBought[typesBought.length] = GLOBAL.POTION;
			typesBought[typesBought.length] = GLOBAL.DRUG;
			
			sellMarkup = 1.2;
			buyMarkdown = .8;
			
			femininity = 85;
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.mainGameMenu();
		}
	}

}
