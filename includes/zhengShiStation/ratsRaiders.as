/*
 *	flag:
 * RATPUTATION
 * RATCOUNTERS
 * RAT_ANUSES_TAKEN: the bit for 2^n handles the anus of rat n (used only for the mouse boys for now)
 */

public var rat0:RatsRaider = null;
public var rat1:RatsRaider = null;
public var rat2:RatsRaider = null;

public function ratMenu():void
{
	ratSetupGroup(rand(2) == 0);

	clearMenu();
	clearOutput();
	showBust(rat0.bustDisplay, rat1.bustDisplay, rat2.bustDisplay);

	output("<b>Ratcounters:</b> " + (flags["RATCOUNTERS"] == undefined ? 0 : flags["RATCOUNTERS"]));
	
	output("\n<b>Rat Reputation:</b> ");
	switch (ratputation())
	{
		case RatsRaider.RAT_REP_NONE: output("Unknown"); break;
		case RatsRaider.RAT_REP_LOW: output("Poor (" + flags["RATPUTATION"] + ")"); break;
		case RatsRaider.RAT_REP_MID: output("Average (" + flags["RATPUTATION"] + ")"); break;
		case RatsRaider.RAT_REP_HIGH: output("Good (" + flags["RATPUTATION"] + ")"); break;
		case RatsRaider.RAT_REP_GOOD_CEO: output("Friend"); break;
	}
	output("\n<b>Rat Booty:</b> " + (flags["RAT_STOLEN_BOUNTY"] == undefined ? 0 : flags["RAT_STOLEN_BOUNTY"]));
	output("\n<b>Ratbutt Virginities:</b> " + (flags["RAT_ANUSES_TAKEN"] == undefined ? 0 : flags["RAT_ANUSES_TAKEN"]));
	output("\n<b>rat0.legs:</b> [rat0.legs]");
	
	addButton(0, "Fight (F)", ratDebugFight, true);
	addButton(1, "Fight (M)", ratDebugFight, false);
	addDisabledButton(2, "Random Encounter");
	addDisabledButton(3, "Urbolg Introduction");
	addButton(4, "GoodCEO", ratDebugSetRep, 101);
	addButton(5, "Set Rep Low", ratDebugSetRep, 30);
	addButton(6, "Set Rep Mid", ratDebugSetRep, 60);
	addButton(7, "Set Rep Hi", ratDebugSetRep, 90);
	addButton(8, "Buttfuck 1", ratDebugButtfuck, 1);
	addButton(9, "Buttfuck 2", ratDebugButtfuck, 4);
	
	addButton(14, "Done", ratDebugDone);
}

public function ratDebugDone():void
{
	removeInput();
	mainGameMenu();
}

public function ratDebugSetRep(newRep:int):void
{
	if (newRep == 101)
	{
		flags["RATPUTATION"] = 101;
	}
	else
	{
		flags["RATPUTATION"] = newRep;
		if (flags["RATPUTATION"] > 100) flags["RATPUTATION"] = 100;
		else if (flags["RATPUTATION"] < 0) flags["RATPUTATION"] = 0;
	}
	
	ratMenu();
}

public function ratDebugFight(groupOne:Boolean):void
{
	removeInput();

	if (groupOne)
	{
		rat0 = new RatsRaider(RatsRaider.PINK_RODENIAN);
		rat1 = new RatsRaider(RatsRaider.TAN_MOUSEBOY);
		rat2 = new RatsRaider(RatsRaider.HALF_GIRL);
	}
	else
	{
		rat0 = new RatsRaider(RatsRaider.WHITE_RODENIAN);
		rat1 = new RatsRaider(RatsRaider.FAIR_MOUSEBOY);
		rat2 = new RatsRaider(RatsRaider.HALF_BOY);
	}

	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(rat0, rat1, rat2);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(ratDebugFightWrapup);
	CombatManager.lossScene(ratDebugFightWrapup);
	CombatManager.displayLocation("RAT THIEVES");
	CombatManager.beginCombat();
}

public function ratDebugFightWrapup():void
{
	clearOutput();
	
	if (pc.isDefeated()) output("Player lost");
	else output("Rats lost");
	
	output("\n" + int(CombatManager.getHostileActors().length) + " rats remaining.");
	CombatManager.abortCombat();
}

public function ratDebugButtfuck(maus:int):void
{
	if (flags["RAT_ANUSES_TAKEN"] == undefined) flags["RAT_ANUSES_TAKEN"] = 0;
	flags["RAT_ANUSES_TAKEN"] |= 1<<maus;
	ratMenu();
}
 
public function ratputation(increase:int = 0, goodCEO:Boolean = false):int
{
	//improve rep
	if (increase && flags["RATPUTATION"] != 101)
	{
		if (flags["RATPUTATION"] == undefined) flags["RATPUTATION"] = increase;
		else flags["RATPUTATION"] += increase;
		if (flags["RATPUTATION"] > 100) flags["RATPUTATION"] = 100;
		else if (flags["RATPUTATION"] < 0) flags["RATPUTATION"] = 0;
	}
	if (goodCEO) flags["RATPUTATION"] = 101;
	//return rep
	if (flags["RATPUTATION"] == undefined) return RatsRaider.RAT_REP_NONE;
	else if (flags["RATPUTATION"] < 33) return RatsRaider.RAT_REP_LOW;
	else if (flags["RATPUTATION"] < 66) return RatsRaider.RAT_REP_MID;
	else if (flags["RATPUTATION"] < 101) return RatsRaider.RAT_REP_HIGH;
	else return RatsRaider.RAT_REP_GOOD_CEO;
}

public function ratSetupGroup(groupOne:Boolean = true):void
{
	if (groupOne)
	{
		rat0 = new RatsRaider(RatsRaider.PINK_RODENIAN);
		rat1 = new RatsRaider(RatsRaider.TAN_MOUSEBOY);
		rat2 = new RatsRaider(RatsRaider.HALF_GIRL);
	}
	else
	{
		rat0 = new RatsRaider(RatsRaider.WHITE_RODENIAN);
		rat1 = new RatsRaider(RatsRaider.FAIR_MOUSEBOY);
		rat2 = new RatsRaider(RatsRaider.HALF_BOY);
	}
}