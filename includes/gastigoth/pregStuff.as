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

//This returns your preg score on a scale of 0-99999, or 0%-99.999%
//This score can be used to determine conception and the number of kids depending on the prisoner
public function gastigothKnockupChance(mommy:Creature):int
{
	//Using the formula preg chance % = (1-e^(-.38x))*100
	//This gives a nice curve that ensures pregnancy is never quite 100%, but virility is still very impactful
	//x is the average of the PC/NPC's virility/fertility with a small boost for the Gastigoth fertility drugs
	var x:Number;
	
	if(pc.virility() == 0 || mommy.fertility() == 0) return 0;
	
	x = (pc.virility() + mommy.fertility())/2.0 + .25;
	
	//5 decimal place precision :ok_hand:
	return (1 - Math.exp(-0.38*x))*10000;
}

//return 0-3 for number of babies she's preggo with
public function tryKnockUpTam():int
{
	if(!tamtam.isPregnant())
	{
		var score:Number = gastigothKnockupChance(tamtam);
		
		if(score == 0) return 0;
		
		//roll for pregnancy
		if(rand(10000) <= score)
		{
			flags["TAMTAM_GAST_PREG_TIMER"] = 0;
			flags["TAMTAM_PREG_PAID"] = undefined;
			pc.clearRut();
			processTime(1);
			
			var x:Number = ((pc.virility() + tamtam.fertility())/2 + 0.25)/2;
			
			//3 Babies!
			if(rand(10000) <= ((Math.atan(x - 2) + Math.PI/2)/Math.PI)*10000)
			{
				return flags["TAMTAM_NUM_BABIES"] = 3;
			}
			//2 Babies!
			else if(rand(10000) <= ((Math.atan(x - 1) + Math.PI/2)/Math.PI)*10000)
			{
				return flags["TAMTAM_NUM_BABIES"] = 2;
			}
			//1 Baby!
			else
			{
				return flags["TAMTAM_NUM_BABIES"] = 1;
			}
		}
	}
	return 0;
}

//return 0-2 for number of babies she's preggo with
public function tryKnockUpKhorgan():int
{
	if(!khorgan.isPregnant())
	{
		var score:Number = gastigothKnockupChance(khorgan);
		
		//roll for pregnancy
		if(rand(10000) <= score)
		{
			flags["KHORGAN_GAST_PREG_TIMER"] = 0;
			flags["KHORGAN_PREG_PAID"] = undefined;
			pc.clearRut();
			processTime(1);
			
			//roll for twins - chance% = (arctan((pc.vir+khorg.fert)/2+.25-5)+Pi/2)/Pi * 100
			if(rand(10000) <= ((Math.atan((pc.virility() + khorgan.fertility())/2 + 0.25 - 5) + Math.PI/2)/Math.PI)*10000)
			{
				return flags["KHORGAN_NUM_BABIES"] = 2;
			}
			else
			{
				return flags["KHORGAN_NUM_BABIES"] = 1;
			}
		}
	}
	return 0;
}

public function processGastigothPregEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	if(flags["TAMTAM_GAST_PREG_TIMER"] != undefined) flags["TAMTAM_GAST_PREG_TIMER"] += totalDays;
	if(flags["KHORGAN_GAST_PREG_TIMER"] != undefined) flags["KHORGAN_GAST_PREG_TIMER"] += totalDays;
	if(flags["SAM_GAST_PREG_TIMER"] != undefined) flags["SAM_GAST_PREG_TIMER"] += totalDays;
	
	//Gastigoth Preg email stuff
	//5 repeatable emails per NPC D:
	//Tam-Tam
	if(tamtam.isPregnant())
	{
		if(flags["TAMTAM_PREG_EMAIL1"] == undefined)
		{
			if (MailManager.hasEntry("tamtam_preg1")) MailManager.deleteMailEntry("tamtam_preg1");
			MailManager.addMailEntry("tamtam_preg1", preg1EmailText("Tam-Tam"), "Gastigoth Inmate Tam-Tam - Pregnancy Detected", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
			goMailGet("tamtam_preg1");
			flags["TAMTAM_PREG_EMAIL1"] = 1;
		}
		if(flags["TAMTAM_PREG_EMAIL2"] == undefined && flags["TAMTAM_GAST_PREG_TIMER"] >= 80)
		{
			if (MailManager.hasEntry("tamtam_preg2")) MailManager.deleteMailEntry("tamtam_preg2");
			MailManager.addMailEntry("tamtam_preg2", preg2EmailText("Tam-Tam"), "Gastigoth Inmate Tam-Tam - Pregnancy Options", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
			goMailGet("tamtam_preg2");
			flags["TAMTAM_PREG_EMAIL2"] = 1;
		}
		if(flags["TAMTAM_PREG_EMAIL3"] == undefined && flags["TAMTAM_GAST_PREG_TIMER"] >= 160)
		{
			if (MailManager.hasEntry("tamtam_preg3")) MailManager.deleteMailEntry("tamtam_preg3");
			MailManager.addMailEntry("tamtam_preg3", preg3EmailText("Tam-Tam"), "Gastigoth Inmate Tam-Tam - Pregnancy Update", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
			goMailGet("tamtam_preg3");
			flags["TAMTAM_PREG_EMAIL3"] = 1;
		}
		if(flags["TAMTAM_PREG_EMAIL4"] == undefined && flags["TAMTAM_GAST_PREG_TIMER"] >= 230)
		{
			if (MailManager.hasEntry("tamtam_preg4")) MailManager.deleteMailEntry("tamtam_preg4");
			MailManager.addMailEntry("tamtam_preg4", preg4EmailText("Tam-Tam"), "Gastigoth Inmate Tam-Tam - It's Nearly Time!", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
			goMailGet("tamtam_preg4");
			flags["TAMTAM_PREG_EMAIL4"] = 1;
		}
		//Trigger Birth
		if(flags["TAMTAM_GAST_PREG_TIMER"] >= 240)
		{
			if (MailManager.hasEntry("tamtam_preg5")) MailManager.deleteMailEntry("tamtam_preg5");
			MailManager.addMailEntry("tamtam_preg5", preg5EmailText("Tam-Tam"), "Gastigoth Inmate Tam-Tam - Child Delivery Report", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
			goMailGet("tamtam_preg5");
			//tamtamGastBirth();
		}
	}
	
	//Khorgan
	if(khorgan.isPregnant())
	{
		if(flags["KHORGAN_PREG_EMAIL1"] == undefined)
		{
			if (MailManager.hasEntry("khorgan_preg1")) MailManager.deleteMailEntry("khorgan_preg1");
			MailManager.addMailEntry("khorgan_preg1", preg1EmailText("Khorgan"), "Gastigoth Inmate Khorgan - Pregnancy Detected", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
			goMailGet("khorgan_preg1");
			flags["KHORGAN_PREG_EMAIL1"] = 1;
		}
		if(flags["KHORGAN_PREG_EMAIL2"] == undefined && flags["KHORGAN_GAST_PREG_TIMER"] >= 50)
		{
			if (MailManager.hasEntry("khorgan_preg2")) MailManager.deleteMailEntry("khorgan_preg2");
			MailManager.addMailEntry("khorgan_preg2", preg2EmailText("Khorgan"), "Gastigoth Inmate Khorgan - Pregnancy Options", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
			goMailGet("khorgan_preg2");
			flags["KHORGAN_PREG_EMAIL2"] = 1;
		}
		if(flags["KHORGAN_PREG_EMAIL3"] == undefined && flags["KHORGAN_GAST_PREG_TIMER"] >= 100)
		{
			if (MailManager.hasEntry("khorgan_preg3")) MailManager.deleteMailEntry("khorgan_preg3");
			MailManager.addMailEntry("khorgan_preg3", preg3EmailText("Khorgan"), "Gastigoth Inmate Khorgan - Pregnancy Update", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
			goMailGet("khorgan_preg3");
			flags["KHORGAN_PREG_EMAIL3"] = 1;
		}
		if(flags["KHORGAN_PREG_EMAIL4"] == undefined && flags["KHORGAN_GAST_PREG_TIMER"] >= 140)
		{
			if (MailManager.hasEntry("khorgan_preg4")) MailManager.deleteMailEntry("khorgan_preg4");
			MailManager.addMailEntry("khorgan_preg4", preg4EmailText("Khorgan"), "Gastigoth Inmate Khorgan - It's Nearly Time!", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
			goMailGet("khorgan_preg4");
			flags["KHORGAN_PREG_EMAIL4"] = 1;
		}
		//Trigger Birth
		if(flags["KHORGAN_GAST_PREG_TIMER"] >= 150)
		{
			if (MailManager.hasEntry("khorgan_preg5")) MailManager.deleteMailEntry("khorgan_preg5");
			MailManager.addMailEntry("khorgan_preg5", preg5EmailText("Khorgan"), "Gastigoth Inmate Khorgan - Child Delivery Report", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
			goMailGet("khorgan_preg5");
			//khorganGastBirth();
		}
	}
	
	//Sam
	if(sam.isPregnant())
	{
		if(flags["SAM_PREG_EMAIL1"] == undefined)
		{
			if (MailManager.hasEntry("sam_preg1")) MailManager.deleteMailEntry("sam_preg1");
			MailManager.addMailEntry("sam_preg1", preg1EmailText("Sam"), "Gastigoth Inmate Sam - Pregnancy Detected", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
			goMailGet("sam_preg1");
			flags["SAM_PREG_EMAIL1"] = 1;
		}
		if(flags["SAM_PREG_EMAIL2"] == undefined && flags["SAM_GAST_PREG_TIMER"] >= 60)
		{
			if (MailManager.hasEntry("sam_preg2")) MailManager.deleteMailEntry("sam_preg2");
			MailManager.addMailEntry("sam_preg2", preg2EmailText("Sam"), "Gastigoth Inmate Sam - Pregnancy Options", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
			goMailGet("sam_preg2");
			flags["SAM_PREG_EMAIL2"] = 1;
		}
		if(flags["SAM_PREG_EMAIL3"] == undefined && flags["SAM_GAST_PREG_TIMER"] >= 120)
		{
			if (MailManager.hasEntry("sam_preg3")) MailManager.deleteMailEntry("sam_preg3");
			MailManager.addMailEntry("sam_preg3", preg3EmailText("Sam"), "Gastigoth Inmate Sam - Pregnancy Update", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
			goMailGet("sam_preg3");
			flags["SAM_PREG_EMAIL3"] = 1;
		}
		if(flags["SAM_PREG_EMAIL4"] == undefined && flags["SAM_GAST_PREG_TIMER"] >= 170)
		{
			if (MailManager.hasEntry("sam_preg4")) MailManager.deleteMailEntry("sam_preg4");
			MailManager.addMailEntry("sam_preg4", preg4EmailText("Sam"), "Gastigoth Inmate Sam - It's Nearly Time!", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
			goMailGet("sam_preg4");
			flags["SAM_PREG_EMAIL4"] = 1;
		}
		//Trigger Birth
		if(flags["SAM_GAST_PREG_TIMER"] >= 180)
		{
			if (MailManager.hasEntry("sam_preg5")) MailManager.deleteMailEntry("sam_preg5");
			MailManager.addMailEntry("sam_preg5", preg5EmailText("Sam"), "Gastigoth Inmate Sam - Child Delivery Report", "Dr. Arno Kramer", "DoNotReply@FaangnisCorrections.corp", quickPCTo, quickPCToAddress);
			goMailGet("sam_preg5");
			//samGastBirth();
		}
	}
}

public function preg1EmailText(prisonerName:String):String
{
	var eText:String = "";
	var plural:Boolean = ((prisonerName == "Tam-Tam" && flags["TAMTAM_NUM_BABIES"] > 1)
							||(prisonerName == "Khorgan" && flags["KHORGA_NUM_BABIES"] > 1)
							||(prisonerName == "Sam" && flags["SAM_NUM_BABIES"] > 1));
	
	eText+="Greetings, Captain Steele,";
	if(flags["GAST_PREG_EMAIL1_RECV"] == undefined)
	{
		eText+="\n\nMy name is Dr. Arno Kramer. I am the director of the child-bearing services here at Gastigoth station, including health services, maternity, and genetic modification.";
		flags["GAST_PREG_EMAIL1_RECV"] = 1;
	}
	eText+="\n\nI'd like to offer my congratulations. Prisoner "+prisonerName+" has just returned a positive pregnancy test, and our genetic analysis confirms you to the be father. My staff and I will take the best of care of her ";
	if(plural)
	{
		eText+="and the ";
		if(prisonerName == "Tam-Tam")eText+=flags["TAMTAM_NUM_BABIES"];
		if(prisonerName == "Khorgan")eText+=flags["KHORGAN_NUM_BABIES"];
		if(prisonerName == "Sam")eText+=flags["SAM_NUM_BABIES"];
		eText+=" children she is carrying ";
	}
	eText+="for the duration of the pregnancy, and we will be sure to update you as the pregnancy progresses.";
	eText+="\n\nIf you have any questions or concerns, please do not hesitate to contact me.";
	eText+="\n\nWith regards,";
	eText+="\n\nDr. Arno Kramer";
	eText+="\nMaternity Ward Director,";
	eText+="\nPenal Station <i>Gastigoth</i>";
	
	return doParse(eText);
}

public function preg2EmailText(prisonerName:String):String
{
	var eText:String = "";
	var plural:Boolean = ((prisonerName == "Tam-Tam" && flags["TAMTAM_NUM_BABIES"] > 1)
							||(prisonerName == "Khorgan" && flags["KHORGA_NUM_BABIES"] > 1)
							||(prisonerName == "Sam" && flags["SAM_NUM_BABIES"] > 1));
	
	eText+="Greetings, Captain Steele,";
	eText+="I am writing this email in regards to prisoner "+prisonerName+"'s current pregnancy. She is nearing the end of her first trimester, which is when my department usually recommends making any gene therapy and cosmetic modifications to the child";
	if(plural) eText+="ren";
	eText+=" you wish to have done. I've taken the liberty of mapping the child" + (plural ? "ren's genomes" : "'s genome") + " and predicting mental and physical features based upon that.";
	eText+="\n\nPlease consult the predictive mockup attached and, if you desire any alterations, fill out the attached questionnaire. If you would prefer your child" + (plural ? "ren's genomes" : "'s genome") + " remain all-natural, you may write and say so, or simply decline to respond to this email.";
	eText+="\n\nWith regards,";
	eText+="\n\nDr. Arno Kramer";
	eText+="\nMaternity Ward Director,";
	eText+="\nPenal Station <i>Gastigoth</i>";
	eText+="\n\n<i>Attached to the email is an incredibly comprehensive survey of the unborn child" + (plural ? "ren" : "") + "'s genetics, with predictions on gender, physical attributes, mental faculties, criminal or anti-social tendencies, and much, much more.";
	eText+="\n\nThis must be the sort of thing your father looked through before you were born, sitting with the doctor and deciding the kind of person you would be. Or at least, laying the foundation for who you'd become. Will you do the same thing to your child" + (plural ? "ren" : "") + "? Some might say it's the responsible thing to do, given the mother, to reduce the chances of your child" + (plural ? "ren" : "") + " following in her criminal footsteps. Then again, this form gives you the power to edit everything about your child" + (plural ? "ren" : "") + " like a spreadsheet, from sex to eye color to mental acuity. You could create an ubermensch worthy of the Steele legacy!";
	eText+="\n\nWhat do you do?</i>";
	
	return doParse(eText);
}

public function preg3EmailText(prisonerName:String):String
{
	var eText:String = "";
	
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	
	return doParse(eText);
}

public function preg4EmailText(prisonerName:String):String
{
	var eText:String = "";
	
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	
	return doParse(eText);
}

public function preg5EmailText(prisonerName:String):String
{
	var eText:String = "";
	
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	eText+="\n\n";
	
	return doParse(eText);
}