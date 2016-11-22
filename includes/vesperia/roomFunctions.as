import classes.RoomClass;

public function canadiaUnlocked():Boolean
{
	return (MailManager.isEntryViewed("kirodatemeet"));
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
	
	return false;
}

public function outsideCanadiaBarBonus():Boolean
{
	kiroKallyCanadiaBarBonus();
	
	return false;
}

public function bathAreaBonus():Boolean
{
	vendingMachineString();
	addButton(0,"V.Machine",approachVesperianVendingMachine);
	return false;
}
