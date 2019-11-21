package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;

	import classes.kGAMECLASS;
	
	public class Vahn extends Creature
	{
		public function Vahn()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			short = "Vahn";
			originalRace = "ausar";
			a = "";
			capitalA = "";
			long = "";
			customDodge = "";
			customBlock = "";
			isPlural = false;
			
			inventory = [];
			
			keeperBuy = "Unneeded";
			
			typesBought = [];
			sellMarkup = 1.0;
			buyMarkdown = .6;
			createPerk("SHIP VENDOR");
			
			if(!hasCock()) createCock();
			shiftCock(0, GLOBAL.TYPE_CANINE);
			cocks[0].cLengthRaw = 10;
			cocks[0].flaccidMultiplier = 0.5;
			balls = 2;
			ballSizeRaw = 8;
			createPerk("Fixed CumQ", 1000, 0, 0, 0);
		}
		override public function get bustDisplay():String
		{
			var str:String = "VAHN";
			
			return str;
		}
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.VahnTheMechanic();
		}
	}
}
