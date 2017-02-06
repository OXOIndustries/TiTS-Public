package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Armor.HideVestAndBreeches;
	import classes.Items.Melee.EssyraGreatspear;
	import classes.Items.Melee.PlasmaHawk;
	import classes.Items.Miscellaneous.RoastedZhorBeast;
	import classes.Items.Miscellaneous.ThermalPack;
	import classes.Items.Protection.HeatBelt;
	import classes.kGAMECLASS;
	
	public class Kazra extends Creature
	{
		//constructor
		public function Kazra()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Kazra";
			this.originalRace = "essrya";
			this.keeperBuy = "";
			this.keeperSell = "";

			inventory.push(new HeatBelt(), new ThermalPack(), new PlasmaHawk(), new HideVestAndBreeches(), new EssyraGreatspear(), new RoastedZhorBeast());
			
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