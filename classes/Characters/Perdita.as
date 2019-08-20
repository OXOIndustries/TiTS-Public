package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Stories.LeatherClub;
	import classes.Items.Stories.GoJackals;
	import classes.Items.Stories.WolfBreeding;
	import classes.Items.Stories.WorshippingTheAnubisQueen;
	import classes.Items.Stories.HellhoundGangbang;
	import classes.Items.Stories.SuccubusInLove;
	import classes.Items.Stories.MyRomanticEncounter;
	import classes.Items.Stories.MonsterThreesome;

	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class Perdita extends Creature
	{
		//constructor
		public function Perdita()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			short = "Perdita";
			originalRace = "half-ausar";
			a = "";
			capitalA = "";
			
			keeperBuy = "Why wait when money can buy you instant gratification?\n\nPerdita tilts her head to the side and smirks. <i>“Seriously? You’d be my first customer if that were the case...”</i>\n\nShe pauses and blinks. <i>“I have no idea what to charge for that. Uuuh... here.”</i> A blush creeps into her cheeks and she fiddles with her datapad before holding it out to you.\n\n";
			keeperSell = "";
			
			inventory.push(new LeatherClub());
			inventory.push(new GoJackals());
			inventory.push(new WolfBreeding());
			inventory.push(new WorshippingTheAnubisQueen());
			inventory.push(new HellhoundGangbang());
			inventory.push(new SuccubusInLove());
			inventory.push(new MyRomanticEncounter());
			inventory.push(new MonsterThreesome());
			
			typesBought = [];
			
			sellMarkup = 1.0;
			buyMarkdown = .5;

			femininity = 75;
			tallness = 6*12;
			hairColor = "brown";
			hairLength = 17;
			earType = GLOBAL.TYPE_CANINE;
			earFlags = [GLOBAL.FLAG_FURRED,GLOBAL.FLAG_LONG];
			eyeColor = "lavender";
			skinTone = "tan";
			tailCount = 1;
			tailType = GLOBAL.TYPE_CANINE;
			tailFlags = [GLOBAL.FLAG_FURRED,GLOBAL.FLAG_LONG];
			buttRatingRaw = 10;
			breastRows[0].breastRatingRaw = 5;
			createCock();
			cocks[0].cLengthRaw = 8;
			cocks[0].cType = GLOBAL.TYPE_CANINE;
			balls = 2;
			ballSizeRaw = 6;
			cumMultiplierRaw = 15;
			ballEfficiency = 45;
		}
		override public function get bustDisplay():String
		{
			return "PERDITA";
		}
		override public function onLeaveBuyMenu():void
		{
			if(kGAMECLASS.flags["MET_PERDITA"] == 2) kGAMECLASS.perditaIsBackForNormalInteractions(true);
			else kGAMECLASS.perditaMeeting(true);
		}
	}
}
