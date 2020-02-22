package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Protection.HeatBelt;
	import classes.Items.Protection.ArcticWarfareBelt;
	import classes.Items.Miscellaneous.ClimbingKit;
	import classes.Items.Miscellaneous.FishingRod;
	import classes.Items.Apparel.InsulatingBriefs;
	import classes.Items.Apparel.InsulatingUndershirt;
	import classes.Items.Apparel.ThermalJacket;
	import classes.Items.Accessories.LightJetpack;
	import classes.Items.Accessories.FlashGoggles;
	import classes.Items.Transformatives.HuskarTreats;
	import classes.Items.Tents.HLReaperTent;
	import classes.kGAMECLASS;
	
	public class Nerrasa extends Creature
	{
		//constructor
		public function Nerrasa()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			short = "Nerrasa";
			originalRace = "huskar";
			
			inventory = [];
			inventory.push(new HeatBelt());
			inventory.push(new ArcticWarfareBelt());
			inventory.push(new HLReaperTent());
			inventory.push(new HuskarTreats());
			//inventory.push(new Frostfire());
			//inventory.push(new AusarTreats());
			inventory.push(new ClimbingKit());
			inventory.push(new FishingRod());
			inventory.push(new InsulatingBriefs());
			inventory.push(new InsulatingUndershirt());
			inventory.push(new ThermalJacket());
			inventory.push(new LightJetpack());
			//inventory.push(new HL4Salamander()); 9999
			//inventory.push(new FuelCanister()); 9999
			inventory.push(new FlashGoggles());

			
			keeperBuy = "Nerrasa just keeps up with her reps whilst you browse the store's wares, paying you no mind what so ever.\n";
			
			typesBought = [];
			sellMarkup = 1.2;
			buyMarkdown = .8;
		}
		override public function get bustDisplay():String
		{
			return "NERRASA";
		}
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.uvetoNerrasaMenu();
		}
	}
}
