/* 
 * Some Sort of System for Impregnating Gastigoth Prisoners
 * https://docs.google.com/document/d/1Xs6hjnIZfgTwSQYnwOlrfadgr3pSyPao3rCnRIsQ1iQ/edit
 * 
 */
import classes.GameData.Pregnancy.Child;
import classes.GameData.Pregnancy.UniqueChild;
import classes.GameData.Pregnancy.Containers.Genders;

public function impregAPrisoner(prisonerName:String):void
{
	clearOutput();
	clearBust();
	author("Savin");
	
	const GAST_PREG_COST:int = 15000;
	
	output("You tap the sub-menu labeled “Breeding Program: Eligibility.” Gastigoth’s standard U.I. radiates several new statistics and options around, exploding close-up digital dissections of the prisoner’s DNA and reading off tab after tab of psych evaluations. Woah, that’s a lot to process.");
	output("\n\nAt the bottom of the huge stack of readouts is a contract, explaining in more detail what exactly is going to happen if you choose to take advantage of this service:");
	output("\n\nYou’re going to visit the prisoner in a conjugal cube. Before arrival, the prisoner will be dosed with a cocktail of aphrodisiacs and fertility enhancers ensured to keep her docile, and increase your chances of a successful impregnation. If you’re successful, you’ll be charged an additional " + GAST_PREG_COST/1000 + "," + ("000".substr(0, 3 - String(GAST_PREG_COST%1000).length) + String(GAST_PREG_COST%1000)) + " credits once the inmate delivers her child. In addition to maternal care, this will cover in-utero gene modification to your specifications, including “treatment” of any defects such as psychosis that might be passed on by the inmate parent. After birth, the infant will be sent to a location of your choosing -- in this case, you fill out the Tavros nursery details. Better almost anywhere than the prison, you suppose.");
	output("\n\nThat’s a lot of money, though, and the contract doesn’t say what happens if you can’t pay it. Nothing good, you suspect. ");
	if(flags[prisonerName.toUpperCase() + "_PREG_PAID"] != undefined) output("<b>You’ve already paid to knockup this prisoner, but must still pay the regular 1,000 CR fee.</b>");
	else output("<b>Just in case, you decide to pay now rather than risk it.</b>");
	output("\n\nDo you want to go through with this?");
	
	processTime(5+rand(5));
	
	//Preg Paid Flags:	- 1 if already paid for the pregnancy, undefined if never paid or prior pregnancy resolved
	//TAMTAM_PREG_PAID
	//SAM_PREG_PAID
	//KHORGAN_PREG_PAID
	//etc.
	if(pc.credits >= GAST_PREG_COST || (flags[prisonerName.toUpperCase() + "_PREG_PAID"] != undefined && pc.credits >= 1000)) addButton(0, "Yes", impregAPrisonerYes, prisonerName, "Yes", "Let’s knock this bitch up.");
	else addDisabledButton(0, "Yes", "Yes", "You don’t have the required funds.");
	addButton(1, "No", impregAPrisonerNo, undefined, "No", "Maybe not.");
}

public function impregAPrisonerNo():void
{
	clearOutput();
	author("Savin");
	clearMenu();
	
	output("Deciding you’re not interested in fathering a prison baby just now, you cycle back to the terminal’s main menu.");
	
	addButton(0, "Next", sexHaverTerminalTime, true, "", "");
}

public function impregAPrisonerYes(prisonerName:String):void
{
	clearOutput();
	author("Savin");
	clearMenu();
	
	const GAST_PREG_COST:int = 15000;
	
	if(flags[prisonerName.toUpperCase() + "_PREG_PAID"] == undefined) pc.credits -= GAST_PREG_COST;
	else pc.credits -= 1000;
	flags[prisonerName.toUpperCase() + "_PREG_PAID"] = 1;
	
	output("You fill out the requisite details, wire the payment details across, and confirm your contact details for when the child’s delivered. Assuming your seed does its part, anyway. Once everything’s squared away, you confirm that you’re ready with a final tap of the screen.");
	output("\n\nA gruff male voice answers back, <i>“Affirmative. Inmate ");
	switch(prisonerName)
	{
		case "Tamtam": output("Tam-Tam");break;
		case "Khorgan": output("Khorgan");break;
		case "Sam": output("Sam");break;
	}
	output(" will be processed shortly. Please follow the running lights to the holding area. Please ensure that you have no sharp or heavy objects on your person when entering the holding area.”</i>");
	output("\n\nAn array of tiny red lights flicker on under your [pc.feet], guiding you back down the hallway you came in the first time. As directed, you following the floor lights to an airlock that opens automatically as you approach, pass through it, and down another set of corridors. Armed guards and automated turrets seem to greet you at every turn, watching you as warily as they might any inmate. You doubt you’re ever more than twenty feet from a loaded gun... and you’re starting to feel awful naked without your kit.");
	output("\n\nYou do your best to shrug off the feeling. You should feel <i>safe</i> around all the security, but...");
	output("\n\nThe running lights eventually take you to another lobby, adorned much like the first, with a large sealed bulkhead dominating the far wall. A solid red light is displayed over the door, and the terminal nearby has a >PROCESSING>>> bar ticking upwards. There’s nothing to do but wait, and psych yourself up for what’s to come.");
	output("\n\nEventually, the bar fills up, and the light shifts over to green. The V.I.’s voice comes over the room’s speakers, telling you <i>“The inmate requested has been processed. Please proceed into the holding unit.”</i>");
	
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
			//Default is natural kids, can be changed via 2nd preg email
			flags["TAMTAM_BABY_GENES"] = 1;
			flags["TAMTAM_PREG_PAID"] = undefined;
			pc.clearRut();
			
			var x:Number = ((pc.virility() + tamtam.fertility())/2 + 0.25)/2;
			
			//3 Babies!
			if(rand(10000) <= ((Math.atan(x - 2) + Math.PI/2)/Math.PI)*10000)
			{
				flags["TAMTAM_NUM_BABIES"] = 3;
			}
			//2 Babies!
			else if(rand(10000) <= ((Math.atan(x - 1) + Math.PI/2)/Math.PI)*10000)
			{
				flags["TAMTAM_NUM_BABIES"] = 2;
			}
			//1 Baby!
			else
			{
				flags["TAMTAM_NUM_BABIES"] = 1;
			}
			
			//Lets roll for genders 45/45/10
			flags["TAMTAM_BABY_GENDERS"] = new Array();
			for(var i:int = 0; i < flags["TAMTAM_NUM_BABIES"]; i++)
			{
				var genderSeed:int = rand(20);
				if(genderSeed < 2) flags["TAMTAM_BABY_GENDERS"].push("H");
				else if(genderSeed < 11) flags["TAMTAM_BABY_GENDERS"].push("F");
				else flags["TAMTAM_BABY_GENDERS"].push("M");
			}
			
			processTime(1);
			return flags["TAMTAM_NUM_BABIES"];
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
			//Default is natural kids, can be changed via 2nd preg email
			flags["KHORGAN_BABY_GENES"] = 1;
			flags["KHORGAN_PREG_PAID"] = undefined;
			pc.clearRut();
			
			//roll for twins - chance% = (arctan((pc.vir+khorg.fert)/2+.25-5)+Pi/2)/Pi * 100
			if(rand(10000) <= ((Math.atan((pc.virility() + khorgan.fertility())/2 + 0.25 - 5) + Math.PI/2)/Math.PI)*10000)
			{
				flags["KHORGAN_NUM_BABIES"] = 2;
			}
			else
			{
				flags["KHORGAN_NUM_BABIES"] = 1;
			}
			
			//Lets roll for genders 50/50
			flags["KHORGAN_BABY_GENDERS"] = new Array();
			for(var i:int = 0; i < flags["KHORGAN_NUM_BABIES"]; i++)
			{
				if(rand(2) == 0) flags["KHORGAN_BABY_GENDERS"].push("M");
				else flags["KHORGAN_BABY_GENDERS"].push("F");
			}
			
			processTime(1);
			return flags["KHORGAN_NUM_BABIES"];
		}
	}
	return 0;
}

public function processGastigothPregEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	if(flags["TAMTAM_GAST_PREG_TIMER"] != undefined) flags["TAMTAM_GAST_PREG_TIMER"] += totalDays;
	if(flags["KHORGAN_GAST_PREG_TIMER"] != undefined) flags["KHORGAN_GAST_PREG_TIMER"] += totalDays;
	if(flags["SAM_GAST_PREG_TIMER"] != undefined) flags["SAM_GAST_PREG_TIMER"] += totalDays;
	
	var timestamp:int = GetGameTimestamp() + deltaT;
	
	//Gastigoth Preg email stuff
	//5 repeatable emails per NPC D:
	//Tam-Tam
	if(tamtam.isPregnant())
	{
		if(flags["TAMTAM_PREG_EMAIL1"] == undefined)
		{
			resendMail("tamtam_preg1", timestamp);
			flags["TAMTAM_PREG_EMAIL1"] = 1;
		}
		if(flags["TAMTAM_PREG_EMAIL2"] == undefined && flags["TAMTAM_GAST_PREG_TIMER"] >= 80)
		{
			timestamp = (GetGameTimestamp() + deltaT - (flags["TAMTAM_GAST_PREG_TIMER"] * 24 * 60) + (80 * 24 * 60));
			resendMail("tamtam_preg2", timestamp);
			flags["TAMTAM_PREG_EMAIL2"] = 1;
		}
		if(flags["TAMTAM_PREG_EMAIL3"] == undefined && flags["TAMTAM_GAST_PREG_TIMER"] >= 160)
		{
			timestamp = (GetGameTimestamp() + deltaT - (flags["TAMTAM_GAST_PREG_TIMER"] * 24 * 60) + (160 * 24 * 60));
			resendMail("tamtam_preg3", timestamp);
			flags["TAMTAM_PREG_EMAIL3"] = 1;
		}
		if(flags["TAMTAM_PREG_EMAIL4"] == undefined && flags["TAMTAM_GAST_PREG_TIMER"] >= 230)
		{
			timestamp = (GetGameTimestamp() + deltaT - (flags["TAMTAM_GAST_PREG_TIMER"] * 24 * 60) + (230 * 24 * 60));
			resendMail("tamtam_preg4", timestamp);
			flags["TAMTAM_PREG_EMAIL4"] = 1;
		}
		//Trigger Birth
		if(flags["TAMTAM_GAST_PREG_TIMER"] >= 240)
		{
			timestamp = (GetGameTimestamp() + deltaT - (flags["TAMTAM_GAST_PREG_TIMER"] * 24 * 60) + (240 * 24 * 60));
			resendMail("tamtam_preg5", timestamp);
			tamtamGastBirth(timestamp);
		}
	}
	
	//Khorgan
	if(khorgan.isPregnant())
	{
		if(flags["KHORGAN_PREG_EMAIL1"] == undefined)
		{
			resendMail("khorgan_preg1", timestamp);
			flags["KHORGAN_PREG_EMAIL1"] = 1;
		}
		if(flags["KHORGAN_PREG_EMAIL2"] == undefined && flags["KHORGAN_GAST_PREG_TIMER"] >= 50)
		{
			timestamp = (GetGameTimestamp() + deltaT - (flags["KHORGAN_GAST_PREG_TIMER"] * 24 * 60) + (50 * 24 * 60));
			resendMail("khorgan_preg2", timestamp);
			flags["KHORGAN_PREG_EMAIL2"] = 1;
		}
		if(flags["KHORGAN_PREG_EMAIL3"] == undefined && flags["KHORGAN_GAST_PREG_TIMER"] >= 100)
		{
			timestamp = (GetGameTimestamp() + deltaT - (flags["KHORGAN_GAST_PREG_TIMER"] * 24 * 60) + (100 * 24 * 60));
			resendMail("khorgan_preg3", timestamp);
			flags["KHORGAN_PREG_EMAIL3"] = 1;
		}
		if(flags["KHORGAN_PREG_EMAIL4"] == undefined && flags["KHORGAN_GAST_PREG_TIMER"] >= 140)
		{
			timestamp = (GetGameTimestamp() + deltaT - (flags["KHORGAN_GAST_PREG_TIMER"] * 24 * 60) + (140 * 24 * 60));
			resendMail("khorgan_preg4", timestamp);
			flags["KHORGAN_PREG_EMAIL4"] = 1;
		}
		//Trigger Birth
		if(flags["KHORGAN_GAST_PREG_TIMER"] >= 150)
		{
			timestamp = (GetGameTimestamp() + deltaT - (flags["KHORGAN_GAST_PREG_TIMER"] * 24 * 60) + (150 * 24 * 60));
			resendMail("khorgan_preg5", timestamp);
			khorganGastBirth(timestamp);
		}
	}
	
	//Sam
	if(sam.isPregnant())
	{
		if(flags["SAM_PREG_EMAIL1"] == undefined)
		{
			resendMail("sam_preg1", timestamp);
			flags["SAM_PREG_EMAIL1"] = 1;
		}
		if(flags["SAM_PREG_EMAIL2"] == undefined && flags["SAM_GAST_PREG_TIMER"] >= 60)
		{
			timestamp = (GetGameTimestamp() + deltaT - (flags["SAM_GAST_PREG_TIMER"] * 24 * 60) + (60 * 24 * 60));
			resendMail("sam_preg2", timestamp);
			flags["SAM_PREG_EMAIL2"] = 1;
		}
		if(flags["SAM_PREG_EMAIL3"] == undefined && flags["SAM_GAST_PREG_TIMER"] >= 120)
		{
			timestamp = (GetGameTimestamp() + deltaT - (flags["SAM_GAST_PREG_TIMER"] * 24 * 60) + (120 * 24 * 60));
			resendMail("sam_preg3", timestamp);
			flags["SAM_PREG_EMAIL3"] = 1;
		}
		if(flags["SAM_PREG_EMAIL4"] == undefined && flags["SAM_GAST_PREG_TIMER"] >= 170)
		{
			timestamp = (GetGameTimestamp() + deltaT - (flags["SAM_GAST_PREG_TIMER"] * 24 * 60) + (170 * 24 * 60));
			resendMail("sam_preg4", timestamp);
			flags["SAM_PREG_EMAIL4"] = 1;
		}
		//Trigger Birth
		if(flags["SAM_GAST_PREG_TIMER"] >= 180)
		{
			timestamp = (GetGameTimestamp() + deltaT - (flags["SAM_GAST_PREG_TIMER"] * 24 * 60) + (180 * 24 * 60));
			resendMail("sam_preg5", timestamp);
			samGastBirth(timestamp);
		}
	}
}

public function preg1EmailTextTamTam():String { return preg1EmailText("Tam-Tam"); };
public function preg1EmailTextKhorgan():String { return preg1EmailText("Khorgan"); };
public function preg1EmailTextSam():String { return preg1EmailText("Sam"); };
private function preg1EmailText(prisonerName:String):String
{
	var eText:String = "";
	var plural:Boolean = ((prisonerName == "Tam-Tam" && flags["TAMTAM_NUM_BABIES"] > 1)
							||(prisonerName == "Khorgan" && flags["KHORGAN_NUM_BABIES"] > 1)
							||(prisonerName == "Sam" && flags["SAM_NUM_BABIES"] > 1));
	
	eText+="Greetings, Captain Steele,";
	if(flags["GAST_PREG_EMAIL1_RECV"] == undefined)
	{
		eText+="\n\nMy name is Dr. Arno Kramer. I am the director of the child-bearing services here at Gastigoth station, including health services, maternity, and genetic modification.";
		flags["GAST_PREG_EMAIL1_RECV"] = 1;
	}
	eText+="\n\nI’d like to offer my congratulations. Prisoner "+prisonerName+" has just returned a positive pregnancy test, and our genetic analysis confirms you to be the father. My staff and I will take the best of care of her ";
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

public function preg2EmailTextTamTam():String { return preg2EmailText("Tam-Tam"); };
public function preg2EmailTextKhorgan():String { return preg2EmailText("Khorgan"); };
public function preg2EmailTextSam():String { return preg2EmailText("Sam"); };
private function preg2EmailText(prisonerName:String):String
{
	var eText:String = "";
	var plural:Boolean = ((prisonerName == "Tam-Tam" && flags["TAMTAM_NUM_BABIES"] > 1)
							||(prisonerName == "Khorgan" && flags["KHORGAN_NUM_BABIES"] > 1)
							||(prisonerName == "Sam" && flags["SAM_NUM_BABIES"] > 1));
	
	eText+="Greetings, Captain Steele,";
	eText+="\n\nI am writing this email in regards to prisoner "+prisonerName+"’s current pregnancy. She is nearing the end of her first trimester, which is when my department usually recommends making any gene therapy and cosmetic modifications to the child";
	if(plural) eText+="ren";
	eText+=" you wish to have done. I’ve taken the liberty of mapping the child" + (plural ? "ren’s genomes" : "’s genome") + " and predicting mental and physical features based upon that.";
	eText+="\n\nPlease consult the predictive mockup attached and, if you desire any alterations, fill out the attached questionnaire. If you would prefer your child" + (plural ? "ren’s genomes" : "’s genome") + " remain all-natural, you may write and say so, or simply decline to respond to this email.";
	eText+="\n\nWith regards,";
	eText+="\n\nDr. Arno Kramer";
	eText+="\nMaternity Ward Director,";
	eText+="\nPenal Station <i>Gastigoth</i>";
	eText+="\n\n<i>Attached to the email is an incredibly comprehensive survey of the unborn child" + (plural ? "ren" : "") + "’s genetics, with predictions on gender, physical attributes, mental faculties, criminal or anti-social tendencies, and much, much more.";
	eText+="\n\nThis must be the sort of thing your father looked through before you were born, sitting with the doctor and deciding the kind of person you would be. Or at least, laying the foundation for who you’d become. Will you do the same thing to your child" + (plural ? "ren" : "") + "? Some might say it’s the responsible thing to do, given the mother, to reduce the chances of your child" + (plural ? "ren" : "") + " following in her criminal footsteps. Then again, this form gives you the power to edit everything about your child" + (plural ? "ren" : "") + " like a spreadsheet, from sex to eye color to mental acuity. You could create an ubermensch worthy of the Steele legacy!";
	eText+="\n\nWhat do you do?</i>";
	
	return doParse(eText);
}

public function preg3EmailTextTamTam():String { return preg3EmailText("Tam-Tam"); };
public function preg3EmailTextKhorgan():String { return preg3EmailText("Khorgan"); };
public function preg3EmailTextSam():String { return preg3EmailText("Sam"); };
private function preg3EmailText(prisonerName:String):String
{
	var eText:String = "";
	var plural:Boolean = ((prisonerName == "Tam-Tam" && flags["TAMTAM_NUM_BABIES"] > 1)
							||(prisonerName == "Khorgan" && flags["KHORGAN_NUM_BABIES"] > 1)
							||(prisonerName == "Sam" && flags["SAM_NUM_BABIES"] > 1));
	
	eText+="Greetings, Captain Steele,";
	eText+="\n\nInmate "+prisonerName+" is healthy and her pregnancy is progressing smoothly. As her second trimester is drawing to a close, I’d like to take the opportunity to congratulate you on " + (plural ? "some" : "a") + " ";
	if(prisonerName == "Tam-Tam")
	{
		if(flags["TAMTAM_BABY_GENES"] < 3) eText+= "perfectly healthy";
		else eText+= "genetically superior";
		if(flags["TAMTAM_NUM_BABIES"] > 1) eText+= " children"
		else if(flags["TAMTAM_BABY_GENDERS"][0] == "H") eText+= " hermaphrodite child";
		else if(flags["TAMTAM_BABY_GENDERS"][0] == "F") eText+= " daughter";
		else eText+= " son";
	}
	else if(prisonerName == "Khorgan")
	{
		if(flags["KHORGAN_BABY_GENES"] < 3) eText+= "perfectly healthy";
		else eText+= "genetically superior";
		if(flags["KHORGAN_NUM_BABIES"] > 1) eText+= " children"
		else if(flags["KHORGAN_BABY_GENDERS"][0] == "F") eText+= " daughter";
		else eText+= " son";
	}
	else if(prisonerName == "Sam")
	{
		if(flags["SAM_BABY_GENES"] < 3) eText+= "perfectly healthy";
		else eText+= "genetically superior";
		if(flags["SAM_NUM_BABIES"] > 1) eText+= " children"
		else if(flags["SAM_BABY_GENDERS"][0] == "F") eText+= " daughter";
		else eText+= " son";
	}
	eText+=" soon to join your family.";
	eText+="\n\nWith regards,";
	eText+="\n\nDr. Arno Kramer";
	eText+="\nMaternity Ward Director,";
	eText+="\nPenal Station <i>Gastigoth</i>";

	if(prisonerName == "Khorgan")
	{
		eText+="\n\nP.S.: Inmate Khorgan has requested that the maternity ward forward a video message to you, Captain. You may find it attached to this email.";
		eText+="\n\n<i>Indeed, there is a .holo attached to the mail.</i>";
		eText+="\n\n(The video has been downloaded to your ship’s console!)";
		flags["KHORGAN_PREGSTURBATE"] = 1;
	}
	
	return doParse(eText);
}

public function preg4EmailTextTamTam():String { return preg4EmailText("Tam-Tam"); };
public function preg4EmailTextKhorgan():String { return preg4EmailText("Khorgan"); };
public function preg4EmailTextSam():String { return preg4EmailText("Sam"); };
private function preg4EmailText(prisonerName:String):String
{
	var eText:String = "";
	var plural:Boolean = ((prisonerName == "Tam-Tam" && flags["TAMTAM_NUM_BABIES"] > 1)
							||(prisonerName == "Khorgan" && flags["KHORGAN_NUM_BABIES"] > 1)
							||(prisonerName == "Sam" && flags["SAM_NUM_BABIES"] > 1));
	
	eText+="Greetings, Captain Steele,";
	eText+="\n\nInmate "+prisonerName+"’s pregnancy is nearly at its end! We estimate only about a week until you welcome ";
	if(plural) eText+="some new children";
	else if(prisonerName == "Tam-Tam")
	{
		if(flags["TAMTAM_BABY_GENDERS"][0] == "M") eText+="a new son";
		else eText+="a new daughter";
	}
	else if(prisonerName == "Khorgan")
	{
		if(flags["KHORGAN_BABY_GENDERS"][0] == "M") eText+="a new son";
		else eText+="a new daughter";
	}
	else if(prisonerName == "Sam")
	{
		if(flags["SAM_BABY_GENDERS"][0] == "M") eText+="a new son";
		else eText+="a new daughter";
	}
	eText+=" to the family! Per the instructions you filled out before conception, once ";
	if(plural) eText+="they are";
	else if(prisonerName == "Tam-Tam")
	{
		if(flags["TAMTAM_BABY_GENDERS"][0] == "M") eText+="he is";
		else eText+="she is";
	}
	else if(prisonerName == "Khorgan")
	{
		if(flags["KHORGAN_BABY_GENDERS"][0] == "M") eText+="he is";
		else eText+="she is";
	}
	else if(prisonerName == "Sam")
	{
		if(flags["SAM_BABY_GENDERS"][0] == "M") eText+="he is";
		else eText+="she is";
	}
	eText+=" born, your child" + (plural ? "ren" : "") + " will be sent to the Steele family nursery on Tavros Station. You will receive a final alert immediately after birth to confirm the health and safety of the newborn" + (plural ? "s" : "") + " before ";
	if(plural) eText+="they are";
	else if(prisonerName == "Tam-Tam")
	{
		if(flags["TAMTAM_BABY_GENDERS"][0] == "M") eText+="he is";
		else eText+="she is";
	}
	else if(prisonerName == "Khorgan")
	{
		if(flags["KHORGAN_BABY_GENDERS"][0] == "M") eText+="he is";
		else eText+="she is";
	}
	else if(prisonerName == "Sam")
	{
		if(flags["SAM_BABY_GENDERS"][0] == "M") eText+="he is";
		else eText+="she is";
	}
	eText+=" transported to Tavros.";
	eText+="\n\nWith regards,";
	eText+="\n\nDr. Arno Kramer";
	eText+="\nMaternity Ward Director,";
	eText+="\nPenal Station <i>Gastigoth</i>";
	
	return doParse(eText);
}

public function preg5EmailTextTamTam():String { return preg5EmailText("Tam-Tam"); };
public function preg5EmailTextKhorgan():String { return preg5EmailText("Khorgan"); };
public function preg5EmailTextSam():String { return preg5EmailText("Sam"); };
private function preg5EmailText(prisonerName:String):String
{
	var eText:String = "";
	var plural:Boolean = ((prisonerName == "Tam-Tam" && flags["TAMTAM_NUM_BABIES"] > 1)
							||(prisonerName == "Khorgan" && flags["KHORGAN_NUM_BABIES"] > 1)
							||(prisonerName == "Sam" && flags["SAM_NUM_BABIES"] > 1));
	
	eText+="Greetings, Captain Steele,";
	eText+="\n\nInmate "+prisonerName+" has just successfully given birth to " + (plural ? "some healthy, happy new children" : "a healthy, happy new child") + ". We’re currently performing a final medical checkup on the bab" + (plural ? "ies" : "y") + " before transporting ";
	if(plural) eText+="them";
	else if(prisonerName == "Tam-Tam")
	{
		if(flags["TAMTAM_BABY_GENDERS"][0] == "M") eText+="him";
		else eText+="her";
	}
	else if(prisonerName == "Khorgan")
	{
		if(flags["KHORGAN_BABY_GENDERS"][0] == "M") eText+="him";
		else eText+="her";
	}
	else if(prisonerName == "Sam")
	{
		if(flags["SAM_BABY_GENDERS"][0] == "M") eText+="him";
		else eText+="her";
	}
	eText+=" to Tavros, per your instructions.";
	eText+="\n\nCongratulations, captain!";
	eText+="\n\nDr. Arno Kramer";
	eText+="\nMaternity Ward Director,";
	eText+="\nPenal Station <i>Gastigoth</i>";
	
	return doParse(eText);
}

public function khorganPregsturbate():void
{
	clearOutput();
	showName("\nKHORGAN");
	showBust("CAPTAIN_KHORGAN_JAIL_PREG");
	author("Savin");
	
	output("You watch as a small grey room materializes around the statuesque figure of Captain Khorgan. She’s wearing her prison uniform, zipped down all the way to show off her now quite noticeable baby bump, underneath her milk-laden breasts. Stiff, dark green nipples peak out from either side of her uniform, and the thraggen sensually runs a hand over one, tweaking it hard enough to draw a little bead of pale milk from her teat.");
	output("\n\n<i>“Hey, stud,”</i> she growls, licking one of her little tusks. <i>“Look at what you’ve done to me. Fuck! It’s hot, isn’t it? Maybe I’m just a cocktail of hormones right now, but I can’t keep my hands off myself thinking about you. Then again... I had that problem before you knocked me up.”</i>");
	output("\n\nKhorgan grins toothily, running her hand down over her child-swollen belly... and down further, pulling down her orange jumper to slip her fingers into the jade gash between her thick legs. <i>“If I’m not fantasizing about you breeding me like your bitch, then I’m fantasizing about our fight. Getting beat down by you was the best fight of my life, and what we did afterwards...”</i> she laughs, and her fingers disappear into her flushed quim. <i>“Just thinking about it all gets my juices <b>flowing</b>.”</i>");
	output("\n\nApparently she’s being damn literal: her free hand angles the camera down, letting you get a good look at what’s going on down there. You can see a delta of moisture leaking down her thighs, glistening in the sterile prison light. Her labia lips are spread open around two fingers, which are vigorously pumping in and out. Khorgan groans, pushing in deep, and you could almost swear you hear your name growled out amongst her moans.");
	output("\n\n<i>“You’re gonna come see me again soon, aren’t ya?”</i> she says, almost a predatory growl. <i>“Fuck! I wish they’d let me loose with you for a few minutes so I could show you how thraggen make love. Until then, I guess I’ll have to settle for my hands, and feeling our child growing big and strong inside me.”</i>");
	output("\n\nShe moves her wrist a little faster, spearing her sex open and letting her juices pitter-patter onto the ground. Her thumb swirls around her clit, absolutely molesting the jade nub until her chest is hammering, tits spilling out of her jumpsuit. Her rigid teats tremble, starting to leak their own liquid load down her chest. Grunting her approval, Khorgan hefts up one of her overburdened breasts and brings the nipple up to her mouth, licking her milk clean.");
	output("\n\n<i>“Gonna be plenty left for you,”</i> Khorgan moans. <i>“Strong milk for strong children... and mates. Oh!”</i>");
	output("\n\nHer breath catches, and you watch her heavy belly quiver over the hand thrust up into her cunt. The flow of liquids from her body doubles for a moment, making an absolute mess of herself as she cums. The wet <i>schlicking</i> sound her hands make is only drowned out by her feral roar of pleasure -- one that swiftly draws the prison guard to her, grabbing the pregnant greenskin’s arms.");
	output("\n\n<i>“Soon, Steele!”</i> she howls, making a biting gesture at the camera as the guards manhandle her off screen. The holovid ends soon after.");
	
	processTime(10 + rand(3));
	pc.changeLust(60);
	
	clearMenu();
	addButton(0, "Next", smutFapMenu, true);
}

public function tamtamGastBirth(birthTimestamp:int = -1):void
{
	if(birthTimestamp < 0) birthTimestamp = GetGameTimestamp();
	
	var traitChar:Creature = chars["PC_BABY"];
	var c:UniqueChild = new TamTamUniqueChild();
	
	c.RaceType = GLOBAL.TYPE_FELINE;
	// 50% Male or Female
	for(var i:int = 0; i < flags["TAMTAM_NUM_BABIES"]; i++)
	{
		if(flags["TAMTAM_BABY_GENDERS"][i] == "M") c.NumMale += 1;
		else if(flags["TAMTAM_BABY_GENDERS"][i] == "F") c.NumFemale += 1;
		else c.NumIntersex += 1;
	}
	// Race modifier (if different races)
	c.originalRace = c.hybridizeRace(c.originalRace, pc.originalRace, true);
	
	// Adopt father's colors at random (if applicable):
	if(rand(2) == 0) c.skinTone = traitChar.skinTone;
	if(rand(2) == 0) c.lipColor = traitChar.lipColor;
	if(rand(2) == 0) c.nippleColor = traitChar.nippleColor;
	if(rand(2) == 0) c.eyeColor = traitChar.eyeColor;
	if(traitChar.hairColor != "NOT SET" && rand(2) == 0) c.hairColor = traitChar.hairColor;
	if(traitChar.furColor != "NOT SET" && rand(2) == 0) c.furColor = traitChar.furColor;
	
	c.MaturationRate = 1.0;
	c.BornTimestamp = birthTimestamp;
	ChildManager.addChild(c);
	
	StatTracking.track("pregnancy/tam sired", flags["TAMTAM_NUM_BABIES"]);
	StatTracking.track("pregnancy/total sired", flags["TAMTAM_NUM_BABIES"]);
	StatTracking.track("pregnancy/total day care", flags["TAMTAM_NUM_BABIES"]);

	if(flags["TAMTAM_TOTAL_KIDS"] == undefined) flags["TAMTAM_TOTAL_KIDS"] = 0;
	flags["TAMTAM_TOTAL_KIDS"] += flags["TAMTAM_NUM_BABIES"];
	flags["TAMTAM_GAST_PREG_TIMER"] = undefined;
	flags["TAMTAM_NUM_BABIES"] = undefined;
	flags["TAMTAM_BABY_GENES"] = undefined;
	flags["TAMTAM_BABY_GENDERS"] = undefined;
	flags["TAMTAM_PREG_EMAIL1"] = undefined;
	flags["TAMTAM_PREG_EMAIL2"] = undefined;
	flags["TAMTAM_PREG_EMAIL3"] = undefined;
	flags["TAMTAM_PREG_EMAIL4"] = undefined;
	flags["TAMTAM_PREG_EMAIL_CUSTOM"] = undefined;
}

public function khorganGastBirth(birthTimestamp:int = -1):void
{
	if(birthTimestamp < 0) birthTimestamp = GetGameTimestamp();
	
	var traitChar:Creature = chars["PC_BABY"];
	var c:UniqueChild = new KhorganUniqueChild();
	
	c.RaceType = GLOBAL.TYPE_THRAGGEN;
	// 50% Male or Female
	for(var i:int = 0; i < flags["KHORGAN_NUM_BABIES"]; i++)
	{
		if(flags["KHORGAN_BABY_GENDERS"][i] == "M") c.NumMale += 1;
		else c.NumFemale += 1;
	}
	
	// Race modifier (if different races)
	c.originalRace = c.hybridizeRace(c.originalRace, pc.originalRace, true);
	
	// Adopt father's colors at random (if applicable):
	if(rand(2) == 0) c.skinTone = traitChar.skinTone;
	if(rand(2) == 0) c.lipColor = traitChar.lipColor;
	if(rand(2) == 0) c.nippleColor = traitChar.nippleColor;
	if(rand(2) == 0) c.eyeColor = traitChar.eyeColor;
	if(traitChar.hairColor != "NOT SET" && rand(2) == 0) c.hairColor = traitChar.hairColor;
	if(traitChar.furColor != "NOT SET" && rand(2) == 0) c.furColor = traitChar.furColor;
	
	c.MaturationRate = 1.0;
	c.BornTimestamp = birthTimestamp;
	ChildManager.addChild(c);
	
	StatTracking.track("pregnancy/khorgan sired", flags["KHORGAN_NUM_BABIES"]);
	StatTracking.track("pregnancy/total sired", flags["KHORGAN_NUM_BABIES"]);
	StatTracking.track("pregnancy/total day care", flags["KHORGAN_NUM_BABIES"]);

	if(flags["KHORGAN_TOTAL_KIDS"] == undefined) flags["KHORGAN_TOTAL_KIDS"] = 0;
	flags["KHORGAN_TOTAL_KIDS"] += flags["KHORGAN_NUM_BABIES"];
	flags["KHORGAN_GAST_PREG_TIMER"] = undefined;
	flags["KHORGAN_NUM_BABIES"] = undefined;
	flags["KHORGAN_BABY_GENES"] = undefined;
	flags["KHORGAN_BABY_GENDERS"] = undefined;
	flags["KHORGAN_PREG_EMAIL1"] = undefined;
	flags["KHORGAN_PREG_EMAIL2"] = undefined;
	flags["KHORGAN_PREG_EMAIL3"] = undefined;
	flags["KHORGAN_PREG_EMAIL4"] = undefined;
	flags["KHORGAN_PREG_EMAIL_CUSTOM"] = undefined;
}

public function tamtamBabyBlurbs():void
{
	if(ChildManager.numOfTypeInRange(GLOBAL.TYPE_FELINE, 0, 4*12) == 1)
	{
		var boy:Boolean = ChildManager.ofTypeAndGenderInRange(GLOBAL.TYPE_FELINE, ChildManager.GENDER_MALE, 0, 4*12);
		output("\n\nYour kaithrit kitten is sprawled out on the floor, playing with a collection of fluffy toys. " + (boy ? "He" : "She") + " is clearly teething, chewing on toys as much as " + (boy ? "he" : "she") + "’s actually playing with them. " + (boy ? "His" : "Her") + " tails sway in the air, curling in on themselves happily.");
	}
	else if(ChildManager.numOfTypeInRange(GLOBAL.TYPE_FELINE, 0, 4*12) == 2)
	{
		output("\n\nYour pair of kaithrit-born kittens are sprawled out over each other, play-brawling between quick cat naps with their tails wrapped around each other.");
	}
	else if(ChildManager.numOfTypeInRange(GLOBAL.TYPE_FELINE, 0, 4*12) >= 3)
	{
		output("\n\nYou see a bushel of kaithrit kittens crawling all over each other, bapping noses and tugging on tails and ears. They constantly wrap their tails around their siblings’, a form of familiar communication unique to them.");
	}
}

public function khorganBabyBlurbs():void
{
	if(ChildManager.numOfTypeInRange(GLOBAL.TYPE_THRAGGEN, 0, 4*12) == 1)
	{
		var boy:Boolean = ChildManager.ofTypeAndGenderInRange(GLOBAL.TYPE_THRAGGEN, ChildManager.GENDER_MALE, 0, 4*12);
		output("\n\nYour thraggen " + (boy ? "son" : "daughter") + " is crawling around " + (boy ? "his" : "her") + " room, causing havoc whenever a staff member isn’t paying attention. " + (boy ? "He" : "She") + "’s a little hellion already, playing with toys before hurling them against a wall or out the door. Gonna be big and strong, this one.");
	}
	else if(ChildManager.numOfTypeInRange(GLOBAL.TYPE_THRAGGEN, 0, 4*12) == 2)
	{
		output("\n\nYour two " + (silly ? "spork" : "thraggen") + " kids are playing in their room, alternating between play-wrestling and falling asleep in each other’s arms. More often than not, one of them’s chewing on the other.");
	}
	else if(ChildManager.numOfTypeInRange(GLOBAL.TYPE_THRAGGEN, 0, 4*12) >= 3)
	{
		output("\n\nThere’s a big mess of thraggen squabbling in one of the rooms, slugging it out... about as good as babies do. They’re really just in a pile, grabbing and chewing on each other before being broken up by the nursery staff. Every hour or so, Briget herself is forced to come in and take one of them away from the others for a little comfort when things get just a little too real.");
	}
}