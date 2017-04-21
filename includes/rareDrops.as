import classes.Items.Stories.BXBIOne;

public function genericRareDrops(loot:Array):Array
{
	var threshold:Number = 0;
	var planet:String = getPlanetName().toLowerCase();
	if(rand(100) <= threshold)
	{
		switch (planet)
		{
			case "tavros station":
				break;
			case "mhen'ga":
				break;
			case "tarkus":
				if(!CodexManager.entryUnlocked("BXBI: I")) loot.push(new BXBIOne());
				break;
			case "myrellion":
				break;
			default:
				break;
		}
	}
	//Easter special!
	if(isEaster() && rand(100) <= threshold+1) loot.push(eggSelect());
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