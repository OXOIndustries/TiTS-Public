import classes.Items.Stories.BXBIOne;
import classes.Items.Stories.BXBITwo;
import classes.Items.Stories.EightClicks;
import classes.Items.Stories.BecomingOneOfTheGirls;
import classes.Items.Stories.FuckTheSystem;
import classes.Items.Stories.SatyrSlave;
import classes.Items.Stories.CapturedByTheDemons;
import classes.Items.Stories.TentaclesAndTanukis;
import classes.Items.Stories.StolenGoods;


public function genericRareDrops(loot:Array):Array
{
	var threshold:Number = 0;
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
				if(!CodexManager.entryUnlocked("FuckTheSystem")) tempLoot.push(new FuckTheSystem());
				if(!CodexManager.entryUnlocked("Stolen Goods")) tempLoot.push(new StolenGoods());
				break;
			case "myrellion":
				if(!CodexManager.entryUnlocked("Captured...")) tempLoot.push(new CapturedByTheDemons());
				if(!CodexManager.entryUnlocked("Satyr Slave")) tempLoot.push(new SatyrSlave());
				if(!CodexManager.entryUnlocked("FuckTheSystem")) tempLoot.push(new FuckTheSystem());
				if(!CodexManager.entryUnlocked("Stolen Goods")) tempLoot.push(new StolenGoods());
				break;
			default:
				break;
		}
		//Universal rare drops~
		if(tempLoot.length == 0) 
		{
			/*
			// Missing entries?
			if(!CodexManager.entryUnlocked("Becoming One...")) tempLoot.push(new BecomingOneOfTheGirls());
			*/
		}
	}
	//Easter special!
	if(isEaster() && rand(100) <= threshold+1) tempLoot.push(eggSelect());

	//Add one item from tempLoot to loot.
	if(tempLoot.length > 0) loot.push(tempLoot[rand(tempLoot.length)]);
	return loot;	
}

public function isEaster():Boolean
{
	//checkDate(day:int, month:int, dayRange:int)
	return checkDate(16, 4, 2);
}

public function eggSelect():ItemSlotClass
{
	if(rand(8) == 0) return new EggBlueLarge();
	else if(rand(7) == 0) return new EggBlueSmall();
	else if(rand(6) == 0) return new EggPinkLarge();
	else if(rand(5) == 0) return new EggPinkSmall();
	else if(rand(4) == 0) return new EggWhiteLarge();
	else if(rand(3) == 0) return new EggWhiteSmall();
	else if(rand(2) == 0) return new SmallEgg();
	else return new LargeEgg();
}