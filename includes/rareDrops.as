import classes.Items.Stories.BXBIOne;
import classes.Items.Stories.BXBITwo;
import classes.Items.Stories.EightClicks;
import classes.Items.Stories.BecomingOneOfTheGirls;
import classes.Items.Stories.FuckTheSystem;
import classes.Items.Stories.SatyrSlave;
import classes.Items.Stories.CapturedByTheDemons;
import classes.Items.Stories.TentaclesAndTanukis;
import classes.Items.Stories.StolenGoods;
import classes.Items.Piercings.GeddaniumRingPiercing;
import classes.Items.Treasures.Savicite;


public function genericRareDrops(loot:Array):Array
{
	var threshold:Number = 1;
	var planet:String = getPlanetName().toLowerCase();
	var tempLoot:Array = [];
	if(rand(100) <= threshold)
	{
		switch (planet)
		{
			case "tavros station":
				break;
			case "mhen'ga":
				if(!CodexManager.entryUnlocked("BXBI: I")) tempLoot.push(new BXBIOne());
				if(!CodexManager.entryUnlocked("BXBI: II") && CodexManager.entryUnlocked("BXBI: I")) tempLoot.push(new BXBITwo());
				if(!CodexManager.entryUnlocked("Satyr Slave")) tempLoot.push(new SatyrSlave());
				if(!CodexManager.entryUnlocked("Tentacles & Tanukis") && metKiro() && flags["MET_SYRI"] != undefined) tempLoot.push(new TentaclesAndTanukis());
				break;
			case "tarkus":
				if(!CodexManager.entryUnlocked("||||||||")) tempLoot.push(new EightClicks());
				if(!CodexManager.entryUnlocked("Fuck the System")) tempLoot.push(new FuckTheSystem());
				if(!CodexManager.entryUnlocked("Stolen Goods")) tempLoot.push(new StolenGoods());
				if(!CodexManager.entryUnlocked("Becoming One...")) tempLoot.push(new BecomingOneOfTheGirls());
				
				break;
			case "myrellion":
				if(!CodexManager.entryUnlocked("Captured...")) tempLoot.push(new CapturedByTheDemons());
				if(!CodexManager.entryUnlocked("Satyr Slave")) tempLoot.push(new SatyrSlave());
				if(!CodexManager.entryUnlocked("Fuck the System")) tempLoot.push(new FuckTheSystem());
				if(!CodexManager.entryUnlocked("Stolen Goods")) tempLoot.push(new StolenGoods());
				break;
			case "uveto vii":
				tempLoot.push(new Savicite());
				break;
			case "zheng shi station":
				tempLoot.push(new GeddaniumRingPiercing());
			default:
				break;
		}
		//Universal rare drops~
	}
	//Easter special!
	if(isEaster() && rand(100) <= threshold+1) tempLoot.push(eggSelect());
	if(isNearlyJulyFourth() && rand(100) <= threshold+2) tempLoot.push(new RedRocket());
	//Bonus special TF items 15% of the time.
	if(planet == "tarkus" && rand(100) <= 15)
	{
		if(pc.hasVagina()) {
			tempLoot.push(new SlutShroom());
			if(pc.pregnancyIncubationBonusMotherRaw < 7) tempLoot.push(new Motherhusk());
		}
		else if(pc.hasCock()) tempLoot.push(new SpunkShroom());
	}

	//Add one item from tempLoot to loot.
	if(tempLoot.length > 0) loot.push(tempLoot[rand(tempLoot.length)]);
	return loot;
}

public function gimmeBooks():void
{
	var tempLoot:Array = [];
	
	tempLoot.push(new BecomingOneOfTheGirls());
	tempLoot.push(new BXBIOne());
	tempLoot.push(new BXBITwo());
	tempLoot.push(new CapturedByTheDemons());
	tempLoot.push(new EightClicks());
	tempLoot.push(new FuckTheSystem());
	tempLoot.push(new SatyrSlave());
	tempLoot.push(new StolenGoods());
	tempLoot.push(new TentaclesAndTanukis());
	
	clearOutput();
	output("Beep boop. All the codes are ready!");
	output("\n\n");
	
	clearMenu();
	addButton(0, "Next", itemCollect, tempLoot);
}

public function eggSelect():ItemSlotClass
{
	var egg:int = rand(8);
	switch(egg)
	{
		case 0: return new EggBlueLarge(); break;
		case 1: return new EggBlueSmall(); break;
		case 2: return new EggPinkLarge(); break;
		case 3: return new EggPinkSmall(); break;
		case 4: return new EggWhiteLarge(); break;
		case 5: return new EggWhiteSmall(); break;
		case 6: return new SmallEgg(); break;
		case 7: return new LargeEgg(); break;
	}
	return null;
}
