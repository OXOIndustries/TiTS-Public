import classes.Items.Stories.BXBIOne;
import classes.Items.Stories.BXBITwo;
import classes.Items.Stories.EightClicks;
import classes.Items.Stories.BecomingOneOfTheGirls;
import classes.Items.Stories.FuckTheSystem;

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
				break;
			case "tarkus":
				if(!CodexManager.entryUnlocked("BXBI: I")) tempLoot.push(new BXBIOne());
				else if(!CodexManager.entryUnlocked("BXBI: II") && CodexManager.entryUnlocked("BXBI: I")) tempLoot.push(new BXBITwo());
				break;
			case "myrellion":
				break;
			default:
				break;
		}
		if(tempLoot.length == 0) 
		{
			if(!CodexManager.entryUnlocked("||||||||")) tempLoot.push(new EightClicks());
			if(!CodexManager.entryUnlocked("FuckTheSystem")) tempLoot.push(new FuckTheSystem());
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