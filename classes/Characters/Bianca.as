package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	
	import classes.Engine.Interfaces.*;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Items.Recovery.FSrgKit;
	import classes.Items.Recovery.DoctorsBag;
	
	import classes.kGAMECLASS;
	
	public class Bianca extends Creature
	{
		//constructor
		public function Bianca()
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true;

			this.sellMarkup = 1;
			this.buyMarkdown = .80;
			this.keeperBuy = "You take Bianca’s orange tablet and scroll down the list of medicines available, though only a few catch your eye as being useful in your line of work.\n\n";

			this.inventory = [new DoctorsBag(), new FSrgKit()];

			this.short = "Bianca";
			this.originalRace = "human";
			this.a = "";
			this.capitalA = "";
			this.long = "Bianca is a fox-woman. She is not happy that this placeholder is being read.";
			this.customDodge = "Bianca Don’t Dodge Foo";
			this.customBlock = "Obvious placeholder is obvious.";
			this.isPlural = false;

			this.tailType = GLOBAL.TYPE_VULPINE;
			this.tailCount = (kGAMECLASS.biancaLover() ? 3 : 2);

			isUniqueInFight = true;

			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			
			this._isLoading = false;
		}

		public var boughtSomething:Boolean = false;

		override public function get bustDisplay():String
		{
			return "BIANCA_CLOTHED";
		}

		override public function onLeaveBuyMenu():void
		{
			clearMenu();
			clearOutput();
			kGAMECLASS.showBianca("CLOTHED");
			author("William");

			if (kGAMECLASS.pc.hasStatusEffect("Bought From Bianca"))
			{
				output("<i>“Thank you very much,”</i> Bianca chimes before handing you your purchase, <i>“be sure to apply treatment carefully and use only when necessary.”</i>");
				kGAMECLASS.pc.removeStatusEffect("Bought From Bianca");
				boughtSomething = true;
				kGAMECLASS.biancaBoothMenu(true);
			}
			else
			{
				output("You shake your head, telling Bianca that of these options you won’t be needing anything right now. She quietly takes the tablet back and nods.");
				kGAMECLASS.biancaBoothMenu(boughtSomething);
			}
			output("\n\nWhat now?");
		}
	}
}
