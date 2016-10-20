package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Transformatives.Honeyizer;
	import classes.Items.Armor.ChitPlate;
	import classes.Items.Guns.BoltActionRifle;
	import classes.Items.Guns.RudimentaryRevolver;
	import classes.Items.Guns.TrenchShotgun;
	import classes.Items.Melee.CavalrySaber;
	import classes.Items.Melee.MilitaryPick;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class MerchantQueen extends Creature
	{
		//constructor
		public function MerchantQueen()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			short = "Merchant Queen";
			originalRace = "myr";
			
			//None of this character's stats matter, soz we're leaving everything but inventory shit as default.
			this.inventory.push(new Honeyizer());
			this.inventory.push(new RudimentaryRevolver());
			this.inventory.push(new TrenchShotgun());
			this.inventory.push(new BoltActionRifle());
			this.inventory.push(new CavalrySaber());
			this.inventory.push(new ChitPlate());
			this.inventory.push(new MilitaryPick());

			this.sellMarkup = 1.3;
			this.buyMarkdown = .75;
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.introductionToMerchantQueenSloot();
		}
	}
}