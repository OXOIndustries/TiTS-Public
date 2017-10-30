//Spend some quality Halloween time slashing squash with your spawn
//https://docs.google.com/document/d/1Qtm-fVvVii7LQ4qEuVJvRa-8_9i2d0Zz_C9s0hr29yY/edit

public function tryToCarvePumpkins():void
{
	
	//LOL lets use a uint to store 32 flags
	var hweenBitFlags:uint = 0;
	
	//If condition is met, set the '<<x'th bit to 1
	hweenBitFlags = (zilCallgirlAtNursery()?1<<0:0) + //Zheniya is at Nursery
					(ChildManager.numOfTypeInRange(GLOBAL.TYPE_MILODAN, 11, 9001) > 0 ?1<<1:0) + //Have Milodan pups
					(ChildManager.ofType(GLOBAL.TYPE_CUNTSNAKE) && (ChildManager.numChildrenAtNursery() - ChildManager.numOfType(GLOBAL.TYPE_CUNTSNAKE)) > 0 ?1<<2:0) + //Have cuntsnake babies and other kids
					(ChildManager.of ?1<<3:0) +
					( ?1<<4:0) +
					( ?1<<5:0) +
					( ?1<<6:0) +
					( ?1<<7:0) +
					( ?1<<8:0) +
					( ?1<<9:0) +
					( ?1<<10:0) +
	
	
	
	
	
	
	
	
	
}