/* 
 * Some Sort of System for Impregnating Gastigoth Prisoners
 * https://docs.google.com/document/d/1Xs6hjnIZfgTwSQYnwOlrfadgr3pSyPao3rCnRIsQ1iQ/edit
 * 
 */

const GAST_PREG_COST:int = 15000;

public function impregAPrisoner(prisonerName:String):void
{
	clearOutput();
	clearBust();
	author("Savin");
	
	output("You tap the sub-menu labelled “Breeding Program: Eligibility.” Gastigoth's standard U.I. radiates several new statistics and options around, exploding close-up digital dissections of the prisoner's DNA and reading off tab after tab of psych evaluations. Woah, that's a lot to process.");
	output("\n\nAt the bottom of the huge stack of readouts is a contract, explaining in more detail what exactly is going to happen if you choose to take advantage of this service:");
	output("\n\nYou're going to visit the prisoner in a conjugal cube. Before arrival, the prisoner will be dosed with a cocktail of aphrodisiacs and fertility enhancers ensured to keep her docile, and increase your chances of a successful impregnation. If you're successful, you'll be charged an additional " + GAST_PREG_COST/1000 + "," + ("000".substr(0, 3 - String(GAST_PREG_COST%1000).length) + String(GAST_PREG_COST%1000)) + " credits once the inmate delivers her child. In addition to maternal care, this will cover in-utero gene modification to your specifications, including “treatment” of any defects such as psychosis that might be passed on by the inmate parent. After birth, the infant will be sent to a location of your choosing -- in this case, you fill out the Tavros nursery details. Better almost anywhere than the prison, you suppose.");
	output("\n\nThat's a lot of money, though, and the contract doesn't say what happens if you can't pay it. Nothing good, you suspect. ");
	if(flags[prisonerName.toUpperCase() + "_PREG_PAID"] != undefined) output("<b>You've already paid to knockup this prisoner, but must still pay the regular 1,000 CR fee.</b>");
	else output("<b>Just in case, you decide to pay now rather than risk it.</b>");
	output("\n\nDo you want to go through with this?");
	
	processTime(5+rand(5));
	
	//Preg Paid Flags:	- 1 if already paid for the pregnancy, undefined if never paid or prior pregnancy resolved
	//TAMTAM_PREG_PAID
	//SAM_PREG_PAID
	//KHORGAN_PREG_PAID
	//etc.
	if(pc.credits >= GAST_PREG_COST || (flags[prisonerName.toUpperCase() + "_PREG_PAID"] != undefined && pc.credits >= 1000)) addButton(0, "Yes", impregAPrisonerYes, prisonerName, "Yes", "Let's knock this bitch up.");
	else addDisabledButton(0, "Yes", "Yes", "You don't have the required funds.");
	addButton(1, "No", impregAPrisonerNo, undefined, "No", "Maybe not.");
}

public function impregAPrisonerNo():void
{
	clearOutput();
	author("Savin");
	clearMenu();
	
	output("Deciding you're not interested in fathering a prison baby just now, you cycle back to the terminal's main menu.");
	
	addButton(0, "Next", sexHaverTerminalTime, true, "", "");
}

public function impregAPrisonerYes(prisonerName:String):void
{
	clearOutput();
	author("Savin");
	clearMenu();
	
	if(flags[prisonerName.toUpperCase() + "_PREG_PAID"] == undefined) pc.credits -= GAST_PREG_COST;
	else pc.credits -= 1000;
	flags[prisonerName.toUpperCase() + "_PREG_PAID"] = 1;
	
	output("You fill out the requisite details, wire the payment details across, and confirm your contact details for when the child's delivered. Assuming your seed does its part, anyway. Once everything's squared away, you confirm that you're ready with a final tap of the screen.");
	output("\n\nA gruff male voice answers back, <i>“Affirmative. Inmate ");
	switch(prisonerName)
	{
		case "Tamtam": output("Tam-Tam");break;
		case "Khorgan": output("Khorgan");break;
		case "Sam": output("Sam");break;
	}
	output(" will be processed shortly. Please follow the running lights to the holding area. Please ensure that you have no sharp or heavy objects on your person when entering the holding area.”</i>");
	output("\n\nAn array of tiny red lights flicker on under your [pc.feet], guiding you back down the hallway you came in the first time. As directed, you following the floor lights to an airlock that opens automatically as you approach, pass through it, and down another set of corridors. Armed guards and automated turrets seem to greet you at every turn, watching you as warily as they might any inmate. You doubt you're ever more than twenty feet from a loaded gun... and you're starting to feel awful naked without your kit.");
	output("\n\nYou do your best to shrug off the feeling. You should feel <i>safe</i> around all the security, but...");
	output("\n\nThe running lights eventually take you to another lobby, adorned much like the first, with a large sealed bulkhead dominating the far wall. A solid red light is displayed over the door, and the terminal nearby has a >PROCESSING>>> bar ticking upwards. There's nothing to do but wait, and psych yourself up for what's to come.");
	output("\n\nEventually, the bar fills up, and the light shifts over to green. The V.I.'s voice comes over the room's speakers, telling you <i>“The inmate requested has been processed. Please proceed into the holding unit.”</i>");
	
	processTime(20+rand(10));
	
	switch(prisonerName)
	{
		case "Tamtam": addButton(0, "Next", tamtamStuffGo, true, "", ""); return;
		case "Khorgan": addButton(0, "Next", capnKhorganPrisonVisit, true, "", ""); return;
		case "Sam": addButton(0, "Next", samsPrisonRoom, true, "", ""); return;
	}
}

public function gastigothKnockupChance(mommy:Creature):Boolean
{
	//Using the formula preg chance % = (1-e^(-.38x))*100
	//This gives a nice curve that ensures pregnancy is never quite 100%, but virility is still very impactful
	//x is the average of the PC/NPC's virility/fertility with a small boost for the Gastigoth fertility drugs
	var x:Number;
	
	if(pc.virility() == 0 || mommy.fertility() == 0) return false;
	
	x = (pc.virility() + mommy.fertility())/2.0 + .25;
	
	//5 decimal place precision :ok_hand:
	return (rand(10000) <= (1 - Math.exp(-0.38*x))*10000);
}

public function tryKnockUpTam():Boolean
{
	if(!tamtam.isPregnant())
	{
		if(gastigothKnockupChance(tamtam))
		{
			flags["TAMTAM_PREGNANCY_TIMER"] = 0;
			flags["TAMTAM_PREG_PAID"] = undefined;
			pc.clearRut();
			return true;
		}
	}
	return false;
}

public function tryKnockUpKhorgan():Boolean
{
	if(!khorgan.isPregnant())
	{
		if(gastigothKnockupChance(khorgan))
		{
			flags["KHORGAN_PREGNANCY_TIMER"] = 0;
			flags["KHORGAN_PREG_PAID"] = undefined;
			pc.clearRut();
			return true;
		}
	}
	return false;
}

public function processGastigothPregEvents(deltaT:uint, doOut:Boolean, totalDays:uint):Boolean
{
	if(flags["TAMTAM_PREGNANCY_TIMER"] != undefined) flags["TAMTAM_PREGNANCY_TIMER"] += totalDays;
	if(flags["KHORGAN_PREGNANCY_TIMER"] != undefined) flags["KHORGAN_PREGNANCY_TIMER"] += totalDays;
	if(flags["SAM_PREGNANCY_TIMER"] != undefined) flags["SAM_PREGNANCY_TIMER"] += totalDays;
	
	//Gastigoth Preg email stuff
	//5 repeatable emails per NPC D:
	//Tam-Tam
	if(flags["TAMTAM_PREG_EMAIL1"] == undefined && tamtam.isPregnant())
	{
		if (MailManager.hasEntry("tamtam_preg1")) MailManager.deleteMailEntry("tamtam_preg1");
		MailManager.addMailEntry("tamtam_preg1", tampreg1EmailText, "Gastigoth Inmate Tam-Tam - Pregnancy Report", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
		goMailGet("tamtam_preg1");
		flags["TAMTAM_PREG_EMAIL1"] = 1;
	}
	if(flags["TAMTAM_PREG_EMAIL2"] == undefined && flags["TAMTAM_PREGNANCY_TIMER"] >= 80)
	{
		if (MailManager.hasEntry("tamtam_preg2")) MailManager.deleteMailEntry("tamtam_preg2");
		MailManager.addMailEntry("tamtam_preg2", tampreg2EmailText, "Gastigoth Inmate Tam-Tam - Pregnancy Report", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
		goMailGet("tamtam_preg2");
		flags["TAMTAM_PREG_EMAIL2"] = 1;
	}
	if(flags["TAMTAM_PREG_EMAIL3"] == undefined && flags["TAMTAM_PREGNANCY_TIMER"] >= 160)
	{
		if (MailManager.hasEntry("tamtam_preg3")) MailManager.deleteMailEntry("tamtam_preg3");
		MailManager.addMailEntry("tamtam_preg3", tampreg1EmailText, "Gastigoth Inmate Tam-Tam - It's Nearly Time!", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
		goMailGet("tamtam_preg3");
		flags["TAMTAM_PREG_EMAIL3"] = 1;
	}
	if(flags["TAMTAM_PREG_EMAIL4"] == undefined && flags["TAMTAM_PREGNANCY_TIMER"] >= 230)
	{
		if (MailManager.hasEntry("tamtam_preg4")) MailManager.deleteMailEntry("tamtam_preg4");
		MailManager.addMailEntry("tamtam_preg4", tampreg1EmailText, "Gastigoth Inmate Tam-Tam - Child Delivery Report", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
		goMailGet("tamtam_preg4");
		flags["TAMTAM_PREG_EMAIL4"] = 1;
	}
	if(flags["TAMTAM_PREG_EMAIL5"] == undefined && flags["TAMTAM_PREGNANCY_TIMER"] >= 240)
	{
		if (MailManager.hasEntry("tamtam_preg5")) MailManager.deleteMailEntry("tamtam_preg5");
		MailManager.addMailEntry("tamtam_preg5", tampreg1EmailText, "Gastigoth Inmate Tam-Tam - Pregnancy Report", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
		goMailGet("tamtam_preg5");
		flags["TAMTAM_PREG_EMAIL5"] = 1;
	}
	//Khorgan
	if(flags["KHORGAN_PREG_EMAIL1"] == undefined && khorgan.isPregnant())
	{
		if (MailManager.hasEntry("khorgan_preg1")) MailManager.deleteMailEntry("khorgan_preg1");
		MailManager.addMailEntry("khorgan_preg1", tampreg1EmailText, "Gastigoth Inmate Khorgan - Pregnancy Report", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
		goMailGet("khorgan_preg1");
		flags["KHORGAN_PREG_EMAIL1"] = 1;
	}
	if(flags["KHORGAN_PREG_EMAIL2"] == undefined && flags["KHORGAN_PREGNANCY_TIMER"] >= 80)
	{
		if (MailManager.hasEntry("khorgan_preg2")) MailManager.deleteMailEntry("khorgan_preg2");
		MailManager.addMailEntry("khorgan_preg2", tampreg2EmailText, "Gastigoth Inmate Khorgan - Pregnancy Report", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
		goMailGet("khorgan_preg2");
		flags["KHORGAN_PREG_EMAIL2"] = 1;
	}
	if(flags["KHORGAN_PREG_EMAIL3"] == undefined && flags["KHORGAN_PREGNANCY_TIMER"] >= 160)
	{
		if (MailManager.hasEntry("khorgan_preg3")) MailManager.deleteMailEntry("khorgan_preg3");
		MailManager.addMailEntry("khorgan_preg3", tampreg1EmailText, "Gastigoth Inmate Khorgan - Pregnancy Report", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
		goMailGet("khorgan_preg3");
		flags["KHORGAN_PREG_EMAIL3"] = 1;
	}
	if(flags["KHORGAN_PREG_EMAIL4"] == undefined && flags["KHORGAN_PREGNANCY_TIMER"] >= 230)
	{
		if (MailManager.hasEntry("khorgan_preg4")) MailManager.deleteMailEntry("khorgan_preg4");
		MailManager.addMailEntry("khorgan_preg4", tampreg1EmailText, "Gastigoth Inmate Khorgan - It's Nearly Time!", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
		goMailGet("khorgan_preg4");
		flags["KHORGAN_PREG_EMAIL4"] = 1;
	}
	if(flags["KHORGAN_PREG_EMAIL5"] == undefined && flags["KHORGAN_PREGNANCY_TIMER"] >= 240)
	{
		if (MailManager.hasEntry("khorgan_preg5")) MailManager.deleteMailEntry("khorgan_preg5");
		MailManager.addMailEntry("khorgan_preg5", tampreg1EmailText, "Gastigoth Inmate Khorgan - Child Delivery Report", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
		goMailGet("khorgan_preg5");
		flags["KHORGAN_PREG_EMAIL5"] = 1;
	}
	
	
	
}