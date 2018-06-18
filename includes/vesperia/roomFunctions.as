import classes.RoomClass;

public function canadiaUnlocked():Boolean
{
	return (flags["CANADA_UNLOCKED"] == 1 || MailManager.isEntryViewed("kirodatemeet") || MailManager.isEntryViewed("del_moved") || MailManager.isEntryViewed("del_moved_light") || MailManager.isEntryViewed("ushamee_meet"));
}

public function flyToCanadia():void
{
	output("You fly to Vesperia, stopping at Canadia Station in orbit");
	if(leaveShipOK()) output(" and step out of your ship");
	output(".");
}

public function canadiaLandingPadBonus():Boolean
{
	kiroKallyCanadiaLPBonus();
	shizzyGreatMajinBonus(0);
	
	return false;
}

public function canadiaAirlockBonus():Boolean
{
	kiroKallyCanadiaAirlockBonus();
	
	return false;
}

public function canadiaHallwayBonus():Boolean
{
	kiroKallyCanadiaHallwayBonus();
	ushameeCanadiaCorridorBonus(0);
	return false;
}

public function outsideCanadiaBarBonus():Boolean
{
	if(riyaBonus()) return true;
	kiroKallyCanadiaBarBonus();
	return false;
}

public function bathAreaBonus():Boolean
{
	vendingMachineButton(0, "Vesperian");
	
	output("\n\nThe elaborately decorated rooms to the west seem to be for visitors looking to stay a while.");
	
	kallyDoorBonus();
	
	return false;
}
