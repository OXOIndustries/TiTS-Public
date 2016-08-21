package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.StorageClass;
	import classes.CockClass;
	import classes.Items.Armor.ArmstrongSuitWhite;
	import classes.Items.Armor.ArmstrongSuitViolet;
	import classes.Items.Armor.ArmstrongSuitBlue;
	import classes.Items.Apparel.LittleGreenShirt;
	import classes.Items.Apparel.LittleGreenTankTop;
	import classes.Items.Apparel.LittleGreenBra;
	import classes.Items.Apparel.LittleGreenBriefs;
	import classes.Items.Apparel.LittleGreenPanties;
	import classes.Items.Apparel.LittleGreenThong;
	import classes.Items.Transformatives.BigGreenPotion;
	
	public class Liriel extends Creature
	{
		public function Liriel() 
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			short = "Liriel";
			a = "";
			long = "Liriel Armstrong";
			capitalA = "";
			originalRace = "human";
			
			keeperBuy = "You tell Liriel you’d like to see what she has in stock.\n\n<i>“Alrighty,”</i> she bubbles, pressing a button on her stand. With a hum, shelves and racks appear before you to display her full inventory. <i>“Let me know if there’s anything you’d like to buy.”</i>\n";
			keeperSell = "";
			
			inventory.push(new ArmstrongSuitWhite());
			inventory.push(new ArmstrongSuitViolet());
			inventory.push(new ArmstrongSuitBlue());
			inventory.push(new LittleGreenShirt());
			inventory.push(new LittleGreenTankTop());
			inventory.push(new LittleGreenBra());
			inventory.push(new LittleGreenBriefs());
			inventory.push(new LittleGreenPanties());
			inventory.push(new LittleGreenThong());
			inventory.push(new BigGreenPotion());
			
			typesBought = [];
			
			sellMarkup = 1;
			buyMarkdown = .5;
			
			armor = new ArmstrongSuitWhite();
			lustRaw = 50;
			
			femininity = 100;
			tallness = 74;
			tone = 30;
			thickness = 50;
			
			hipRatingRaw = 6;
			buttRatingRaw = 10;
			
			skinType = GLOBAL.SKIN_TYPE_SKIN;
			skinTone = "green";
			skinFlags = [GLOBAL.FLAG_SMOOTH];
			hairType = GLOBAL.HAIR_TYPE_REGULAR;
			hairColor = "vibrant purple";
			hairLength = 18;
			faceType = GLOBAL.TYPE_HUMAN;
			faceFlags = [];
			eyeType = GLOBAL.TYPE_HUMAN;
			eyeColor = "luminous violet";
			earType = GLOBAL.TYPE_HUMAN;
			lipMod = 3;
			lipColor = "violet";
			tongueType = GLOBAL.TYPE_HUMAN;
			tongueFlags = [];
			antennae = 2;
			antennaeType = GLOBAL.TYPE_HRAD;
			armType = GLOBAL.TYPE_HUMAN;
			armFlags = [];
			legType = GLOBAL.TYPE_HUMAN;
			legCount = 2;
			legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			genitalSpot = 0;
			
			ass.wetnessRaw = 0;
			ass.loosenessRaw = 1;
			
			breastRows[0].breastRatingRaw = 15;
			breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
			nipplesPerBreast = 1;
			nippleWidthRatio = 2.4;
			nippleColor = "violet";
			
			milkMultiplier = 100;
			milkRate = 20;
			milkFullness = 200;
			milkType = GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT;
			
			cocks = [];
			cocks.push(new CockClass());
			cocks[0].cLengthRaw = 12;
			cocks[0].cThicknessRatioRaw = 1.5;
			cocks[0].cType = GLOBAL.TYPE_HRAD;
			cocks[0].cockColor = "purple";
			cocks[0].cockFlags = [GLOBAL.FLAG_FORESKINNED, GLOBAL.FLAG_FLARED];
			
			balls = 2;
			ballSizeRaw = 12;
			ballFullness = 100;
			ballEfficiency = 30;
			cumMultiplierRaw = 15;
			cumQualityRaw = 0;
			cumType = GLOBAL.FLUID_TYPE_HRAD_CUM;
			refractoryRate = 9999;
			
			girlCumType = GLOBAL.FLUID_TYPE_HRAD_CUM;
			
			minutesSinceCum = 2000;
			timesCum = 0;
			cockVirgin = false;
			analVirgin = false;
			
			createStatusEffect("Force Fem Gender");
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.lirielBackMenu(1);
		}
	}
}