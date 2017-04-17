/* PLANETS:
1 - MHEN'GA
2 - TARKUS
3 - MYRELLION
4 - 

-1 - NEW TEXAS
-2 - UVETO

*/
public function getRareDropsForCreatureByPlanet(planet:Number,target:Creature):void
{
	var threshold:Number = 0;
	if(rand(100) <= threshold)
	{
		switch (planet)
		{
			case -1:
				break;
			case -2:
				break;


			case 1:
				//target.inventory.push();
				break;
			case 2:
				break;
			case 3:
				break;
			case 4:
				break;
			default:
				break;
		}
	}
	//Easter special!
	if(isEaster() && rand(100) <= threshold+1) target.inventory.push(eggSelect());
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