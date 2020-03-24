import classes.Characters.GardeBot;
import classes.Characters.MyrGoldFemaleDeserter;
import classes.Characters.MyrRedFemaleDeserter;
import classes.Creature;
import classes.GameData.CombatManager;
import classes.GameData.Pregnancy.Templates.BrihaUniqueChild;
//Myr Deserter (Individual) Enemy Encounter
//Written by JimThermic

//This is a two part project - there is a document for an individual deserter encounter and one for a group encounter. This document is for the individual encounter.

//Here is the link for the group encounter document: 
//https://docs.google.com/document/d/1nVvR6wUos7V_n3aSzOYKHFm-_R32Hebz0jyM8XdRd8A/edit?usp=sharing

/*Project Overview


The Myr Deserter (individual) encounter occurs within No Ants Land. At the start of this encounter, the PC has a 50/50 chance of running into either a singular gold deserter or red deserter. While it is not immediately obvious to the player, the red or gold myr they encounter each time is the same red or gold myr (The same as the Naleen Female encounter).

These encounter are almost exactly the same as normal enemy encounters. However, this changes when the PC wins five consecutive fights against one of the Myr. At this point, the Myr in question becomes non-hostile, and the PC has the option to fight them, or avoid fighting altogether. Other options such as sex and talking become available.

The PC must win five consecutive fights against the particular color of myr to make them non-hostile. E.g. Winning five fights against the red myr makes the red myr not hostile, not both of them.

Some of the deserter sex scenes are available on win OR loss. Sections of the sex scene that are played on Win or Loss are clearly bracketed off, with a 'core' chunk of text left separate for both.

When the PC engages in sex from the non-hostile menu (After winning five or more fights), the 'Win' sections of text are used. To this end, the bracketed sex scene sections are labeled 'Win/Consent'.

The Gold Myr is named Lys. The Red Myr is named Briha. Until the PC wins five fights against the respective Myr, they are known as 'red myr deserter' or 'gold myr deserter' for the purposes of [enemy.name], changing to their respective names after five fights are won.

There is pregnancy support for Briha, so the PC can knock her up. This extra content is explained in further detail below.

Red Pregnancy

It is possible for the PC to get the red myr pregnant via vaginal sex scenes, which are currently on win only. If the red myr deserter is impregnated, regardless of victories, she always approaches the PC in a non-hostile manner from then on, including post-pregnancy.

Three or more months after impregnation, the next encounter with the Red Myr / Briha involves her handing over her egg (or child, if it's beyond four months) to Steele to have transferred to the nursery.

The PC cannot use the 'Fight' option on the pregnant red myr for obvious reasons.*/

/*
Individual Specs
 
Red Myr / Briha

Hair Color: Amber
Hair Length: Shaggy
Height: 5'2".
Eye Color: Black
Skin Color: Dusky red
Lips: Average. Scarlet.
Breast Size: C

Gold Myr / Lys

Hair Color: Black
Hair Length: Short
Height: 5'2".
Eye Color: Black
Skin Color: Gold
Lips: Average. Scarlet.
Breast Size: F
Special: Nipples are pierced.
*/

public function showDeserter(gold:Boolean = false,nude:Boolean = false):void
{
	if(gold)
	{
		if(flags["KNOW_GOLD_MYR_NAME"] == undefined) showName("GOLD MYR\nDESERTER");
		else showName("\nLYS");
		if(nude) showBust("LYS_NUDE");
		else showBust("LYS");
	}
	else
	{
		if(flags["KNOW_RED_MYR_NAME"] == undefined) showName("RED MYR\nDESERTER");
		else showName("\nBRIHA");
		if(flags["BRIHA_INCUBATION_TIMER"] != undefined)
		{
			if(nude) showBust("BRIHA_PREGNANT_NUDE");
			else showBust("BRIHA_PREGNANT");
		}
		else
		{
			if(nude) showBust("BRIHA_NUDE");
			else showBust("BRIHA");
		}
	}
}

//Utility functions for Z's new shit
public function hasGoldDildo():Boolean
{
	return pc.hasKeyItem("Republic Dildo");
}
public function hasRedDildo():Boolean
{
	return pc.hasKeyItem("Federation Vibrator");
}
public function removeRedDildo():void
{
	pc.removeKeyItem("Federation Vibrator");
}
public function removeGoldDildo():void
{
	pc.removeKeyItem("Republic Dildo");
}
public function giveMyrDildo(color:String = ""):void
{
	switch(color)
	{
		case "gold":
			if(!pc.hasKeyItem("Republic Dildo")) pc.createKeyItem("Republic Dildo",0,0,0,0);
			break;
		case "red":
			if(!pc.hasKeyItem("Federation Vibrator")) pc.createKeyItem("Federation Vibrator",0,0,0,0);
			break;
	}
}

//Myr Approaches
public function approachMyrDeserters():void
{
	//Approach (Combative)
	// This approach is used under the following conditions:
	//Have not won against this particular color of myr deserter five or more times.
	//The deserter is not a pregnant or post-pregnant red myr.
	trace("BRIHA PREGGO TIMER: " + flags["BRIHA_INCUBATION_TIMER"])
	//GOLD MYR!
	if(rand(2) == 0)
	{
		//Peaceful! - BEATEN DOOOOWN
		if(flags["GOLD_MYR_DESERTER_BEATEN"] != undefined && flags["GOLD_MYR_DESERTER_BEATEN"] >= 5)
		{
			approachMyrDesertersNonCombatShit(true);
		}
		//Combat!
		else 
		{
			approachMyrDesertersCombatBlurb(true);
		}
	}
	//RED MYR
	else
	{
		if(flags["BRIHA_INCUBATION_TIMER"] >= 90) {
			specialRedAntPreggosShitEvent();
			return;
		}
		//Add preggo checks later on~
		//PEACESHIT
		if(flags["RED_MYR_DESERTER_BEATEN"] != undefined && flags["RED_MYR_DESERTER_BEATEN"] >= 5 || flags["BRIHA_INCUBATION_TIMER"] != undefined || flags["RED_MYR_BIRTHS"] != undefined)
		{
			approachMyrDesertersNonCombatShit(false);
		}
		//COMBAT!
		else
		{
			approachMyrDesertersCombatBlurb(false);
		}
	}
	// If either of the above are true, use the non-combative approach instead.
}

public function approachMyrDesertersCombatBlurb(gold:Boolean = false):void
{
	author("Jim Thermic");
	var tEnemy:Creature;
	
	if (gold) tEnemy = new MyrGoldFemaleDeserter();
	else tEnemy = new MyrRedFemaleDeserter();
	showDeserter(gold);
	//First Time:
	if((gold && flags["MET_GOLD_DESERTER"] == undefined) || (!gold && flags["MET_RED_DESERTER"] == undefined))
	{
		if(gold) flags["MET_GOLD_DESERTER"] = 1;
		else flags["MET_RED_DESERTER"] = 1;
		output("\n\nAs you [pc.walk] through the desolate and war torn wasteland, the wind howls around you. It rages against its underground confines. Instinctively, you ");
		if(!pc.hasEquippedWeapon()) output("grab a nearby rock.");
		else output("tighten your grip on your [pc.weapon].");

		output("\n\nA deafening boom fills the air. The ground trembles, and dirt and stalactites fall from the cavern ceiling. Heart racing in your chest, you throw yourself to the ground.");
		output("\n\nWhen the tremors subside, you tentatively glance about – the explosion wasn’t close. The shock wave must have carried through the cave network.");
		output("\n\nVoid, what kind of crazy race uses explosives in closed caverns? You dust yourself off and ");
		if(pc.isBiped() || pc.isTaur()) output("stand up");
		else output("pull yourself upright");
		output(". Looking up, you spot a flash of ");
		if(!gold) output("red. A ragged looking female myrmedion is standing before you. The chipped, gleaming edge of a hatchet and the barrel of a luger-like pistol - each in a separate hand - are pointed directly at your face.");
		else output("gold. A ragged looking female myrmedion is standing above you. The chipped, gleaming edge of a bayonet - and the barrel of the trench shotgun it is attached to - are pointed directly at your face.");

		output("\n\n<i>“You’ve got terrible luck, off-worlder, running into the likes of me,”</i> she dryly smiles. ");
		if(gold) output("A notable scar mars her otherwise pretty mouth");
		else output("There’s a distinct scar over her right eye, which is half closed");
		output(". <i>“...I’m going to help myself to your things. Maybe I’ll help myself to you too, while I’m at it.”</i>");

		output("\n\n<i>“It’s the rules of this place, so don’t feel too hard done by - I’ve been on the receiving end as well. It’s just your turn, that’s all.”</i>");
		output("\n\n");
		if(gold) output("She stabs at you with the bayonet blade. You dart to the side, and it <i>just</i> misses.");
		else output("She pulls back the toggle-lock of the semi-auto with a loud click.");
	}
	else
	{
		if (gold) IncrementFlag("MET_GOLD_DESERTER");
		else IncrementFlag("MET_RED_DESERTER");
		
		output("You’re [pc.walking] through the desolate and war-torn wasteland. Suddenly, there’s a bee-like whizzing past your ear. A ragged-looking ");
		if(gold) output("gold");
		else output("red");
		output(" deserter is standing nearby, a thin, coiled line of smoke rising from her ");
		if(!gold) output("semi-auto pistol");
		else output("trench shotgun");
		output(".");
		if((gold && hasGoldDildo()) || (!gold && hasRedDildo())) output(" She smiles wickedly. <i>“I believe you have something of mine... I’d like it back.”</i>");

	}
	output("\n\n<b>It’s a fight!</b>");
	clearMenu();
	if (gold)
	{
		configureGoldDeserterFight(tEnemy);
		addButton(0,"Next", CombatManager.beginCombat);
	}
	else
	{
		configureRedDeserterFight(tEnemy);
		addButton(0,"Next", CombatManager.beginCombat);
	}
}

public function configureGoldDeserterFight(tEnemy:Creature):void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.victoryScene(winVsAntGrillDeserts);
	CombatManager.lossScene(loseToAntGrillDeserts);
	CombatManager.displayLocation(flags["KNOW_GOLD_MYR_NAME"] == undefined ? "GOLD DSTR" : "LYS");
}

public function configureRedDeserterFight(tEnemy:Creature):void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.victoryScene(winVsAntGrillDeserts);
	CombatManager.lossScene(loseToAntGrillDeserts);
	CombatManager.displayLocation(flags["KNOW_RED_MYR_NAME"] == undefined ? "RED DSTR" : "BRIHA");
}

//Approach (Non-Combative) 
// Used under the following conditions:
//PC has won against this color of myr at least five or more times, or
//The encounter is with the red myr/Briha when she is pregnant or post-pregnant.
//The PC does not fulfil the requirements for Approach (Pregnant Event) - See Event further down.
public function approachMyrDesertersNonCombatShit(gold:Boolean = false):void
{
	//Load the ants in in case we need 'em
	if (gold)
	{
		setEnemy(new MyrGoldFemaleDeserter());
		IncrementFlag("MET_GOLD_DESERTER");
	}
	else
	{
		setEnemy(new MyrRedFemaleDeserter());
		IncrementFlag("MET_RED_DESERTER");
	}
	showDeserter(gold);
	author("Jim Thermic");
	//Encounter is pregnant red myr deserter:
	if(flags["BRIHA_INCUBATION_TIMER"] != undefined && !gold)
	{
		output("\n\nYou’re [pc.walking] through the desolate and war-torn wasteland. Nearby, you spot a ragged looking red deserter.");
		if(enemy.bellyRating() >= 10)
		{
			output(" Under her partially torn uniform, she has " + indefiniteArticle(enemy.bellyDescript(true)) + ".");
			if(flags["SEEN_RED_DESERTER_PREGGERS"] == undefined) output(" She’s pregnant?");
		}
		output("\n\nRaising a nail-chipped hand, ");
		if(flags["KNOW_RED_MYR_NAME"] != undefined) output("Briha");
		else output("the amber-haired ant-girl");
		output(" waves to you. It seems she’s sitting down for a rest.");

		//First Pregnancy && First Time Ever Seeing Her Pregnant
		if(flags["SEEN_RED_DESERTER_PREGGERS"] == undefined && flags["RED_MYR_BIRTHS"] == undefined)
		{
			output("\n\n <i>“Hi there, soldier. Probably a good as time as any to tell you you’re a father,”</i> she grins, petting the obvious bump. <i>“And before you ask, it’s definitely yours. I don’t get laid enough to mix </i>that<i> up.");
			if(hasRedDildo()) output(" By the way... could I get the Private back? Being pregnant has got me all horny. Think of it as a congratulatory gift.");
			output("”</i>");
			flags["SEEN_RED_DESERTER_PREGGERS"] = 1;
		}
		//Second Pregnancy && First Time Seeing Her Pregnant (this time)
		else if(flags["SEEN_RED_DESERTER_PREGGERS"] == undefined && flags["RED_MYR_BIRTHS"] == 1)
		{
			output("\n\n<i>“Hi there, soldier. You’ve gone and knocked me up again,”</i> she grins, rubbing her bump. <i>“You’re a regular stud, aren’t you? Making a girl waddle around the battlefield");
			if(hasRedDildo()) output(", pregnant and horny as a cockvine with no way to relieve it but to seek you out. Speaking of... could I have the Private back?");
			else output(".");
			output("”</i>");
			flags["SEEN_RED_DESERTER_PREGGERS"] = 1;
		}
		else
		{
			output("\n\n<i>“Hi there, soldier. I’m just sitting down for a rest,”</i> she smiles and stretches out. <i>“...So, what brings you out to ");
			if(hasRedDildo()) output("my forsaken parts? Hopefully a vibrator delivery to relieve my horniness.");
			else output("these forsaken parts?");
			output("”</i>");
		}
		//Don’t Know Her Name:
		if(flags["KNOW_RED_MYR_NAME"] == undefined)
		{
			output("\n\n<i>“OH! By the way, the name’s Briha. Figure you should at least know the name of the mother of your child, right?”</i>");
			chars["RED_DESERTER"].short = "Briha";
			flags["KNOW_RED_MYR_NAME"] = 1;
		}
	}
	else
	{
		output("\n\nYou’re [pc.walking] through the desolate and war-torn wasteland. Nearby, you spot a ragged looking ");
		if(!gold) output("red");
		else output("gold");
		output(" deserter");
		if(!gold && flags["KNOW_RED_MYR_NAME"] == 1) output("- it’s Briha");
		else if(gold && flags["KNOW_GOLD_MYR_NAME"] == 1) output("- it’s Lys");
		output(". She’s holding her ");
		if(!gold) output("semi-auto pistol and hatchet");
		else output("trench shotgun and pistols");
		output(" but doesn’t make any move to attack.");
		
		//Red/Briha:
		if(!gold)
		{
			//Post-pregnancy:
			if(flags["RED_MYR_BIRTHS"] != undefined) 
			{
				output("\n\n<i>“Hi, soldier. ");
				//(PC has her vibro)
				if(hasRedDildo()) output("May I have the Private back? I’ve lost enough fights to you to know how trying to take it will go down... so why don’t we play nice?”</i>");
				else output("It’s good to see you again,”</i> she warmly smiles. Her weapons are immediately lowered.");
				if(hasRedDildo())
				{
					output(" <i>“Are you going to hand over the Private, or do I have to knock you around a bit?”</i> the myr jokes");
					//(5+ losses to PC)
					if(flags["GOLD_MYR_DESERTER_BEATEN"] != undefined && flags["GOLD_MYR_DESERTER_BEATEN"] >= 5) output(", winking to tell you she’s not up for a fight");
					output(". <i>“Either way, I’ll try not to be too hard on you.”</i>");
				}
				else output("\n\n<i>“...Got time to spend with me? I’d appreciate the company.”</i>");
			}
			else
			{
				output("\n\n<i>“Hi, soldier. ");
				if(hasRedDildo()) output("May I have the Private back? I’ve lost enough fights to you to know how trying to take it will go down... so why don’t we play nice?");
				else output("How about we skip the usual scuffles and just play nice? I’ve got into enough fights with you to know who’s going to end up on top,");
				output("”</i> she wryly smiles.");
			}
		}
		else
		{
			output("\n\n<i>“Fancy meeting you here. ");
			//(PC has her strapon)
			if(hasGoldDildo()) output("How about you generously let me have my strap-on and I skip the whole ‘tough soldier’ bit?");
			else output("How about we don’t fight this time? I’m sick of getting spanked by you - well, at least getting spanked in the non-fun way,");
			output("”</i> she grins.");
		}
		//Don’t Know Her Name:
		if((!gold && flags["KNOW_RED_MYR_NAME"] == undefined) || (gold && flags["KNOW_GOLD_MYR_NAME"] == undefined))
		{
			output("\n\n<i>“By the way, the name’s ");
			if(!gold)
			{
				flags["KNOW_RED_MYR_NAME"] = 1;
				output("Briha");
				chars["RED_DESERTER"].short = "Briha";
			}
			else
			{
				flags["KNOW_GOLD_MYR_NAME"] = 1;
				output("Lys");
				//Rather than setting the name and saving info about the character, use the flag to set the name during combat setup.
			}
			output(".”</i>");
		}
	}
	processTime(5);
	myrDeserterNonCombatMenu(gold);
}

public function myrDeserterNonCombatMenu(gold:Boolean = false):void
{
	clearMenu();
	//[Sex] [Talk] [Fight] [Flee]
	if(pc.lust() >= 33) addButton(0,"Sex",sexWithAntGrills,gold);
	else addDisabledButton(0,"Sex","Sex","You aren’t aroused enough for that.");
	// Fight is not available with the pregnant red myr. Otherwise, it goes right to combat.
	addButton(1,"Talk",talkToAntSloots,gold);
	if(gold) addButton(2,"Fight",fightADumbShitAntWaifu,gold);
	else 
	{
		if(flags["BRIHA_INCUBATION_TIMER"] != undefined) addDisabledButton(2,"Fight","Fight","You’re not going to smack around a pregnant girl!");
		else addButton(2,"Fight",fightADumbShitAntWaifu,gold);
	}
	if((hasRedDildo() && !gold) || (gold && hasGoldDildo())) addButton(3,"Give Dildo",giveDildoToAntSloot,gold,"Give Dildo","Return your looted prize.");
	else addDisabledButton(3,"Give Dildo","You don’t have a dildo to give back.");
	//Give Flower - new scene for Lys
	//avail. thru ‘About Her’ topic, consensual sex menu or victory-sex menu if Lys is friendly
	if(gold)
	{
		if(pc.hasItemByClass(VenusBloom) && flags["ENABLE_LYS_FLOWER"] != undefined) addButton(4,"Give Flower",giveFlowerToLys,undefined,"Give Flower","Present Lys with the exotic flower you found on Mhen’ga and see if it’ll cheer the poor girl up.");
		else if(flags["ENABLE_LYS_FLOWER"] != undefined) addDisabledButton(4,"Give Flower","Give Flower","Lys would appreciate any flowers you find. You wonder where you could get one....");
		else addDisabledButton(4,"Locked","Locked","You don’t know her well enough for this.");
	}
	addButton(14,"Run",runFromDatAntSloot,gold);
}


//Fight
public function fightADumbShitAntWaifu(gold:Boolean = false):void
{
	clearOutput();
	showDeserter(gold);
	author("Jim Thermic");
	output("You pull out your [pc.weapon]. [enemy.name] clicks her tongue. <i>“...Damn. Oh well, it was worth a try, right?”</i>");
	output("\n\n<b>It’s a fight!</b>");
	processTime(1);
	clearMenu();
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(enemy);
	CombatManager.victoryScene(winVsAntGrillDeserts);
	CombatManager.lossScene(loseToAntGrillDeserts);
	if (gold) CombatManager.displayLocation(flags["KNOW_GOLD_MYR_NAME"] == undefined ? "GOLD DSTR" : "LYS");
	else CombatManager.displayLocation(flags["KNOW_RED_MYR_NAME"] == undefined ? "RED DSTR" : "BRIHA");
	
	addButton(0, "Next", CombatManager.beginCombat);
}

//Flee
public function runFromDatAntSloot(gold:Boolean = false):void
{
	clearOutput();
	showDeserter(gold);
	author("Jim Thermic");
	output("You decide to avoid dealing with [enemy.name] altogether. As she stands there with a dumbfounded expression, you slip off.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Talk
public function talkToAntSloots(gold:Boolean = false):void
{
	clearOutput();
	showDeserter(gold);
	author("Jim Thermic");
	output("Since you’re not going to fight, you decide to sit down with [enemy.name] and talk. What do you chat about?");
	processTime(1);
	//[About Her] [Desertion] [Scars] [Leave]
	addButton(0,"About Her",aboutAnAntSlootDeserter,gold,"About Her","Ask about her.");
	addButton(1,"Desertion",askAntSlootsAboutDesertion,gold,"Desertion","Ask how she became a deserter.");
	addButton(2,"Scars",askAntDesertersAboutScurrs,gold,"Scars","Ask her how she got her scars?");
	addButton(14,"Leave",leaveAntShits,gold);
}

public function sexWithAntGrills(gold:Boolean = false):void
{
	clearOutput();
	showDeserter(gold);
	author("Jim Thermic");
	output("Which act will you perform?");
	clearMenu();
	
	//Dildo Screw (Red)
	// Two variants - PC loss and PC Win/Consent version. For Red Only.
	// Also a variant for the first time you get this scene, either loss or win/consent, where she introduces the dildo.
	if(enemy is MyrRedFemaleDeserter) addButton(0,"DildoScrew",redDildoScrew,undefined,"Dildo Screw","Play with her and her dildo.");
	//Sit & Screw (Gold)
	// Two variants - PC loss and PC Win/Consent version. For Gold Only.
	// Also a variant for the first time you get this scene, either loss or win, where she introduces the strap on.
	else addButton(0,"Sit‘n’Screw",sitAndScrewGoldMyr,undefined,"Sit & Screw","Have some fun screwing her... with her strap-on if you need one.");
	//Doggy Style (Both)
	// PC Win or Non-Hostile Consent Only
	// PC must have a dick.
	// Max capacity 16 inches.
	// Max girth four inches.
	if(pc.hasCock() && pc.cockThatFits(enemy.vaginalCapacity(0)) >= 0) addButton(1,"DoggyStyle",doggieStyleWithMyrBitches,gold,"Doggy Style","Do her doggy style!");
	else if(pc.hasCock()) addDisabledButton(1,"DoggyStyle","DoggyStyle","You need a penis that will fit inside her for this scene.");
	else addDisabledButton(1,"DoggyStyle","DoggyStyle","You can’t do her doggie style without a dick of your own.");
	//Cum Splurge (Red)
	// Pc must have a cock.
	// Not available on loss.
	if(enemy is MyrRedFemaleDeserter)
	{
		if(pc.hasCock()) addButton(3,"Cum Splurge",cumSplurgeForRedAntSloots,undefined,"Cum Splurge","Have the red myr give you a BJ. All that venom should make it interesting...");
		else addDisabledButton(3,"Cum Splurge","Cum Splurge","You need a penis that fits inside her for this scene.");
		//Anal Sex (Red)
		// PC must have cock.
		if(pc.hasCock() && pc.cockThatFits(enemy.analCapacity()) >= 0) addButton(2,"Anal Sex",analRedButtStuffMcStuffinButts,undefined,"Anal Sex","Put it in her butt.");
		else addDisabledButton(2,"Anal Sex","Anal Sex","You need a penis that will fit inside her for this scene.");

		if(pc.hasHardLightEquipped()) addButton(4,"CompareToys",doubleDildoBrihaStuffing,undefined,"Compare Toys","Show off your high-tech hardlight for the ant-girl" + (flags["RED_MYR_DESERT_DILDO_DONE"] != undefined) ? " and see how it stacks up to what she’s used to":"" + ".");
		else addDisabledButton(4,"CompareToys","Compare Toys","You need hardlight-enabled underwear for this.");
	}
	else 
	{
		addDisabledButton(3,"Cum Splurge","Cum Splurge","This scene is exclusive to red myr deserters.");
		addDisabledButton(2,"Anal Sex","Anal Sex","This scene is only available for the red myr.");
	}
	//Hand-Play (Gold)
	if(enemy is MyrGoldFemaleDeserter)
	{
		// PC can be any gender.
		// Not Available on PC loss
		// No fucking taurs.
		// Must have frontgenitals.
		if(!pc.isTaur()) addButton(4,"Hand-Play",handPlayForGoldWaifusInTraining,undefined,"Hand-Play","She’s got four arms... put them to work.");
		else addDisabledButton(4,"Hand-Play","Hand-Play","Tauric creatures cannot enjoy this scene.");
	}
	//REPLACED BY "CompareToys" SCENE:
	//else addDisabledButton(4,"Hand-Play","Hand-Play","Only a gold myr deserter has enough hands for this scene...");

	//Steal Dildo - new scene for either myr
	//steal the dildo (or use the stolen one on her), with or without orgasm denial
	//avail. in both myr's sex menus, combat-agnostic, but requires PC having seen 'Dildo Screw' (if with Briha) or 'Sit & Screw' (if with Lys), else button is hidden (not disabled)
	//adds PC lust at the end so PC can possibly masturbate with dildo right away
	//should add misch points
	//tooltip: Distract the myr with orgasm and then abscond with her sex toy{(repeat) again}. Or you could stop just before orgasm....
	gold = (enemy is MyrGoldFemaleDeserter);
	var dildoToolTip:String = "Distract the myr with orgasm and then abscond with her sex toy";
	if((gold && flags["GOLD_DILDOED"] != undefined) || ((!gold) && flags["RED_DILDOED"] != undefined)) dildoToolTip += " again";
	dildoToolTip += ". Or you could stop just before orgasm....";
	if((gold && flags["DILDO_SCREW_SCENE_SEEN"] != undefined) || (!gold && flags["RED_MYR_DESERT_DILDO_DONE"] != undefined)) addButton(5,"Steal Dildo",stealDildoScene,gold,"Steal Dildo",dildoToolTip);
	else addDisabledButton(5,"Steal Dildo","Steal Dildo","You don’t even know if she has one!");

	addButton(14,"Leave",leaveAntShits,gold);
}

public function leaveAntShits(gold:Boolean = false):void
{
	clearOutput();
	showDeserter(gold);
	author("Jim Thermic");
	output("You say your goodbyes and go on your way.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//About Her
public function aboutAnAntSlootDeserter(gold:Boolean = false):void
{
	clearOutput();
	showDeserter(gold);
	author("Jim Thermic");
	//Red/Briha:
	if(!gold)
	{
		output("You ask Briha a little bit about herself. The amber-haired ant girl scratches her head, looking a little self-conscious.");
		output("\n\n<i>“...Me? Just another dumb girl who got sucked into the propaganda,”</i> she answers. <i>“Honestly, girls like me are a " + (isAprilFools() ? "dogecoin" : "credit") + " a dozen. I’m nothing that special.”</i>");
		output("\n\nPushing her a little further, she gives you a bit more of an answer. <i>“Oh, okay. Well, where to start? I’m a twenty one year-old ex-career soldier from Rivalle. I was a Sergeant before I went AWOL.”</i>");
		output("\n\n<i>“I’m not all work - or rather, I wasn’t. I used to want to be a career dancer before the war started. I’m a bit too scarred for that now, though,”</i> she smiles wryly. <i>“Plus, I’m pretty sure we’re all going to get blown up before long... not that I can return home.”</i>");
	}
	//Gold/Lys:
	else
	{
		flags["ENABLE_LYS_FLOWER"] = 1;
		output("You ask Lys a little bit about herself. She curls a finger around her wild locks, her other arms hugging under her voluptuous breasts.");
		output("\n\n<i>“I guess I can tell you a little bit about myself. After all, it’s not exactly like I have a lot better to do,”</i> Lys chuckles. <i>“Maybe I should start with my measurements, or are you after something a little bit more personal?”</i>");
		output("\n\n<i>“Let’s see... I’m twenty six years old and an ex-florist. I used to have a lovely garden and my own cosy home not far from where we are now. My wife and I sold the loveliest blue-green sydranas... at least until we were both conscripted.”</i>");
		output("\n\nShe sighs and looks down at her assorted hands, lacing her fingers together. <i>“...That was so long ago... four years? It feels like forever.”</i>");
		output("\n\n<i>“Needless to say, she’s dead, along with the rest of our platoon. Our house is in ruins - there’s barely anything left. I’ve got some seeds left, but the soil is so ruined they refuse to bloom.”</i>");
		output("\n\n<i>“All I’m doing is wasting my time until someone hunts me down for desertion, or the world ends - whichever comes first.”</i>");
	}
	processTime(4);
	clearMenu();
	addButton(0,"Next",talkToAntSloots,gold);
	//Give Flower - new scene for Lys
	//avail. thru ‘About Her’ topic, consensual sex menu or victory-sex menu if Lys is friendly
	if(gold)
	{
		if(pc.hasItemByClass(VenusBloom) && flags["ENABLE_LYS_FLOWER"] != undefined) addButton(1,"Give Flower",giveFlowerToLys,undefined,"Give Flower","Present Lys with the exotic flower you found on Mhen’ga and see if it’ll cheer the poor girl up.");
		else if(flags["ENABLE_LYS_FLOWER"] != undefined) addDisabledButton(1,"Give Flower","Give Flower","Lys would appreciate any flowers you find. You wonder where you could get one....");
		else addDisabledButton(1,"Locked","Locked","You don’t know her well enough for this.");
	}
}

//Desertion
public function askAntSlootsAboutDesertion(gold:Boolean = false):void
{
	clearOutput();
	showDeserter(gold);
	author("Jim Thermic");
	//Red/Briha:
	if(!gold)
	{
		output("You ask Briha why she deserted the Scarlet Federation. Her face screws up a little, but she still answers the question.");
		output("\n\n<i>“...I guess it’s the obvious question, right? I guess... I had an image of how things would be. I was going to be the glorious defender of my homeland, fighting back against the hypocritical Golds, who were going to stomp all over us if we didn’t do something.”</i>");
		output("\n\n<i>“My dream of being a bold, adventurous heroine, delivering justice to the dirty Golds... I was so naive. I’ve shot and killed more people than I can count. Not just enemy soldiers, but civvies too. Sure, it was orders, but I was the one who pulled the trigger... or brought down the axe.”</i>");
		output("\n\nShe sighs and bites her fingernail. <i>“...I was thinking about deserting for a while, but I couldn’t do it to my squad. When you desert, you burn your whole squad. When they all died, I was in anguish, but I was relieved... how sick is that?”</i>");
		output("\n\n<i>“When that happened, I left the front. It was easier than I thought. Now, I’m living out here in the middle of nowhere, scraping together what I can to survive. But you know what? It beats having to shoot any more defenseless people and call it justice.”</i>");
	}
	//Gold/Lys:
	else
	{
		output("You ask Lys why she deserted the Gilden Republic. She sighs and looks at one of her fingers, rubbing it compulsively.");
		output("\n\n<i>“...My wife. We were both conscripted early on during the war. She... I... well... same platoon,”</i> she chokes up. Her black eyes become glassy with tears. <i>“...Sorry. I really thought I could talk about it this time... but I just can’t.”</i>");
		output("\n\nTaking a deep breath, she tries to calm her trembling body. <i>“...Whoooh. Right. So. When she left me, I ended up in a medical hospital for a little while. They put me back on the front line when the war effort started going south, though.”</i>");
		output("\n\n<i>“When the Reds took Kressia, I figured it wasn’t long before the End, what with the nukes. If I’m going to die, I wanted to do it near where our old house was, here in No Myr’s Land - not in some hopeless defense of the capital.”</i>");
		output("\n\n<i>“...So that’s it. I wander the wastes, stealing what I can, robbing strays, all so I can stay close to where she and I lived. I kind of feel like she’s there, you know?”</i>");
		output("\n\n<i>“I know I’m a terrible person, but the whole world is terrible. I don’t think there’s a single thing worth salvaging anymore - we’re all just a bunch of trampled flowers, struggling to grow on scorched earth.”</i>");
	}
	processTime(4);
	clearMenu();
	addButton(0,"Next",talkToAntSloots,gold);
}

//Scars
public function askAntDesertersAboutScurrs(gold:Boolean = false):void
{
	clearOutput();
	showDeserter(gold);
	author("Jim Thermic");
	//Red/Briha:
	if(!gold)
	{
		output("You ask Briha about her scars; the one over her damaged eye and one to the side of her heart.");
		output("\n\nBriha touches her scarred eye self consciously. <i>“...T-these? I suppose you would be curious,”</i> she mumbles, <i>“The eye I got early on in the war from being careless.”</i>");
		output("\n\n<i>“I’d taken a pot shot with a rifle at a gold scout. When I moved up to grab her hand-held, she damn near sliced my face open with a knife. We struggled for a bit before I smashed open her temple with her radio.”</i>");
		output("\n\nThe red myr brings down her hand to rub the scar just next to her heart. <i>“...This one’s a bit more painful. My squad and I ran into some wire entanglements. While trying to get through, we were herded into a machine gun.”</i>");
		output("\n\n<i>“Thankfully, a shelling took out the enemy gunner and I was dragged off the field. They stitched me up, and now I’ve got a scar and a story to tell off-worlders wandering through the wastes,”</i> she bitterly smiles.");
		output("\n\n<i>“You, though, look at you! All scarless and " + pc.mf("handsome","pretty") + ". Off-world medicine really is something else, isn’t it?”</i>");
	}
	//Gold/Lys:
	else
	{
		output("You ask Lys about her scars; the one on her lower lip and on her belly.");
		output("\n\nLys laughs and rubs her lower lip. <i>“...Well, you don’t spend time on the front without walking away with scars of one kind or another, right?”</i>");
		output("\n\n<i>“The belly and the lip are actually connected. We were pushing forward to take an enemy trench. When we reached it, I looked over and a red shot me at point blank.”</i>");
		output("\n\nShe taps her belly, <i>“...The bullet went right through me. Thankfully, it missed all the important stuff. But I was so shocked I toppled forward and fell face-first into the trench.”</i>");
		output("\n\n<i>“When I hit the ground, one of my teeth dug into my lower lip and cut it in half. Good thing we took the trench, otherwise I wouldn’t be alive to laugh about it. The doctors stitched my lip and belly back together, but it scarred over - no room for cosmetics on the front.”</i>");
	}
	processTime(4);
	clearMenu();
	addButton(0,"Next",talkToAntSloots,gold);
}

//Approach (Pregnancy Event)
public function specialRedAntPreggosShitEvent():void
{
	showDeserter(false);
	author("Jim Thermic");
	// This is a once-off scene that occurs three or more months after red myr impregnation. The next encounter with the red myr / Briha is this one, where she hands over her egg (or child, if it’s beyond four months) to Steele to have transferred to the nursery.
	// Also treating the first Briha kid as speshul and remembering her details, because Jim will probably write stuff later for her.
	output("\n\nNearby, you spot ");
	if(flags["KNOW_RED_MYR_NAME"] != undefined) output("Briha");
	else output("a ragged looking red deserter");
	output(". She’s carrying a ");
	//overFourMonthsPregnant: 
	if(flags["BRIHA_INCUBATION_TIMER"] >= 120) output("small child wrapped in a bundle in her arms");
	else output("pale white egg in in her arms");
	output(".");

	//First Pregnancy && First Time Ever Seeing Her Pregnant
	if(flags["SEEN_RED_DESERTER_PREGGERS"] == undefined && flags["RED_MYR_BIRTHS"] == undefined)
	{
		output("\n\n <i>“Hi there, soldier. Probably a good as time as any to tell you you’re a father,”</i> she grins, gently stroking the ");
		if(flags["BRIHA_INCUBATION_TIMER"] >= 120) output("baby’s cheek");
		else output("eggshell");
		output(". <i>“And before you ask, it’s definitely yours. I don’t get laid enough to mix </i>that<i> up.”</i>");
		flags["SEEN_RED_DESERTER_PREGGERS"] = 1;
	}
	//Second Pregnancy && First Time Seeing Her Pregnant (this time)
	else if(flags["SEEN_RED_DESERTER_PREGGERS"] == undefined && flags["RED_MYR_BIRTHS"] == 1)
	{
		output("\n\n<i>“Hi there, soldier. You’ve gone and done it again - another bundle of joy,”</i> she grins, gently stroking the ");
		if(flags["BRIHA_INCUBATION_TIMER"] >= 120) output("baby’s cheek");
		else output("eggshell");
		output(". <i>“We really do have beautiful children, you know?”</i>");
		flags["SEEN_RED_DESERTER_PREGGERS"] = 1;
	}
	//Else / Any other pregnancy time:
	else
	{
		output("\n\n<i>“Hi there, soldier. You missed the big event - lucky you!”</i> she smiles, gently stroking the ");
		if(flags["BRIHA_INCUBATION_TIMER"] >= 120) output("baby’s cheek");
		else output("eggshell");
		output(". <i>“");
		if(flags["RED_MYR_BIRTHS"] == undefined) output("Hurt more than getting shot, but </i>so<i> worth it.");
		else output("We really do have beautiful children, you know?");
		output("”</i>");
	}
	//Don’t Know Her Name:
	if(flags["KNOW_RED_MYR_NAME"] == undefined)
	{
		output("\n\n<i>“OH! By the way, the name’s Briha. Figure you should at least know the name of the mother of your child, right?”</i>");
		chars["RED_DESERTER"].short = "Briha";
		flags["KNOW_RED_MYR_NAME"] = 1;
	}
	var son:Boolean = (rand(2) == 0);
	//FirstKidWithBriha:
	if(flags["RED_MYR_BIRTHS"] == undefined)
	{
		flags["RED_MYR_BIRTHS"] = 1;
		flags["BRIHA_LATEST_SPAWN_AGE"] = flags["BRIHA_INCUBATION_TIMER"] - 120;
		flags["BRIHA_OLDEST_SPAWN_AGE"] = flags["BRIHA_INCUBATION_TIMER"] - 120;
		son = false;
		output("\n\nBriha lowers the bundle with a warm, motherly smile. You edge forward, feeling your heart thumping madly in your chest.");
		if(flags["BRIHA_INCUBATION_TIMER"] < 120) output(" The egg is partially see-through, so you can see your own half-myr child floating within - defenseless, unborn, and truly precious. Even in her semi opaque shell, you can see a glimpse of " + flags["BRIHA_SPAWN_1_DEETS"][0] + " hair.");
		else output(" The world stops as you look down at your precious little daughter. Her hair, sparse and babyish, is a mess of " + flags["BRIHA_SPAWN_1_DEETS"][0] + ", and two gorgeous " + flags["BRIHA_SPAWN_1_DEETS"][1] + " eyes stare up at you.");
		output("\n\n<i>“See? She takes after you. Her name is Aya, after my grandmother,”</i> Briha smiles, then adds, <i>“...And before you say anything, I had to push her out, so I get to name her.”</i>");
		output("\n\nIt’s a girl. You have a baby girl named Aya Steele. You’re a <i>father</i>.");
		output("\n\n<i>“Okay, your time to hold her,”</i> her amber-haired mother tells you, hoisting ");
		if(flags["BRIHA_INCUBATION_TIMER"] >= 120) output("your newborn daughter");
		else output("the egg");
		output(" into your arms. You smile down at the bundle-wrapped baby, stroking ");
		if(flags["BRIHA_INCUBATION_TIMER"] >= 120) output("her smooth, puffy cheek.");
		else output("her outer shell, protecting her from the world she has yet to enter.");

		if(flags["BRIHA_INCUBATION_TIMER"] >= 120) output("\n\nYour heart stops as your little daughter smiles up at you - an innocent, perfect little smile - and grabs one of your fingers. Her tiny hand clasps it and doesn’t let go. The world seems to stop, just for that perfect moment.");
		output("\n\nCoughing a little, Briha hugs her waist. There’s a tense look on her face. <i>“...Look. I’m a deserter. It-it breaks my heart into a million pieces, but you should take Aya. This place - not just the wastelands, but Myrellion - I don’t want her growing up here.”</i>");
		output("\n\nYou look at her intently. Her words are heavy, like each one is an effort to push out. Motherly concern is written all over her scarred face.");
		output("\n\n<i>“It’s a no-brainer, right? This world might end any moment, and even if it doesn’t, I’m a deserter. The Scarlet Federation will never take me back and I can never go to the Golds. What kind of future can she have here?”</i> She strokes ");
		if(flags["BRIHA_INCUBATION_TIMER"] < 120) output("the fragile shell");
		else output("her baby’s cheek");
		output(", a tear running down her half-lidded eye. <i>“...With you, off-worlder, she can have a real future. Something better than this scarred dustball. She can make her mother proud.”</i>");
		
		addUniqueChildBriha(false, flags["BRIHA_OLDEST_SPAWN_AGE"]);
	}
	//SecondKid:
	else if(flags["RED_MYR_BIRTHS"] == 1)
	{
		flags["RED_MYR_BIRTHS"] = 2;
		flags["BRIHA_LATEST_SPAWN_AGE"] = flags["BRIHA_INCUBATION_TIMER"] - 120;
		flags["BRIHA_SECOND_OLDEST_SPAWN_AGE"] = flags["BRIHA_INCUBATION_TIMER"] - 120;
		son = true;
		output("\n\nBriha lowers the bundle with a warm, motherly smile. You edge forward, feeling your heart thumping madly in your chest. ");
		if(flags["BRIHA_INCUBATION_TIMER"] < 120) output("The egg is partially see-through, so you can see your own half-myr child floating within - defenseless, unborn, and truly precious. Even in his semi opaque shell, you can see a glimpse of " + flags["BRIHA_SPAWN_2_DEETS"][0] + " hair.");
		else output("The world stops as you look down at your precious little son. His hair, sparse and babyish, is a mess of " + flags["BRIHA_SPAWN_2_DEETS"][0] + ", and two gorgeous " + flags["BRIHA_SPAWN_2_DEETS"][1] + " eyes stare up at you.");
		output("\n\n<i>“Just like Aya, he takes after you. His name is Brahn, after my grandfather,”</i> Briha smiles, then adds, <i>“You know the rules. I do all the work, I get to name them.”</i>");
		output("\n\nA son! You have a son named Brahn Steele. And Aya has a little brother!");
		output("\n\nSwallowing hard, Briha turns to you, a somber expression on her face. <i>“...You know what to do. He can’t stay here - take him. Every second I look at him, I love him a little more.”</i>");
		
		addUniqueChildBriha(true, flags["BRIHA_SECOND_OLDEST_SPAWN_AGE"]);
	}
	//Else: Third or more kid:
	else 
	{
		flags["RED_MYR_BIRTHS"]++;
		flags["BRIHA_LATEST_SPAWN_AGE"] = flags["BRIHA_INCUBATION_TIMER"] - 120;
		output("\n\nBriha lowers the bundle with a warm, motherly smile. You edge forward, feeling your heart thumping madly in your chest. ");
		if(flags["BRIHA_INCUBATION_TIMER"] < 120) 
		{
			output("The egg is partially see-through, so you can see your own half-myr ");
			if(son) output("son");
			else output("daughter");
			output(" floating within - defenseless, unborn, and truly precious.");
		}
		else
		{
			output("The world stops as you look down at your precious little ");
			if(son) output("son");
			else output("daughter");
		}
		output("\n\n<i>“You’re wearing me out, stud!”</i> Briha chuckles, but the mother’s face is positively aglow. <i>“...And another younger sibling for Aya and Brahn. They definitely won’t be lonely growing up - not with this little one to fuss over.”</i>");
		output("\n\nSwallowing hard, Briha turns to you, a somber expression on her face. <i>“...You know what to do. ");
		if(son) output("He");
		else output("She");
		output(" can’t stay here - take ");
		if(son) output("him");
		else output("her");
		output(". Every second I look at ");
		if(son) output("him");
		else output("her");
		output(", I love ");
		if(son) output("him");
		else output("her");
		output(" a little more.”</i>");
		
		addChildBriha(1, son, flags["BRIHA_LATEST_SPAWN_AGE"]);
	}
	output("\n\nWith a heavy heart, you take your infant child and kiss Briha goodbye");
	if(hasRedDildo())
	{
		output(" - the sly veteran snags her vibrator out of your pack while your hands are full, with a tired smile that tells you she’s hormonal enough to need it");
		removeRedDildo();
	}
	output(". It’s not hard to call a pick-up pod to carry ");
	if(son) output("him");
	else output("her");
	output(" to Tavros station, where a flurry of nursemaids will no doubt make a huge fuss over the new addition to the Steele family. You take your time strapping your child into the cushy, overprotected capsule and making sure the readings are set so <i>nothing</i> happens to ");
	if(son) output("him");
	else output("her");
	output(" - not even the slightest jostle.");
	output("\n\nOnce you finally feel secure in the ship’s integrity, you send it on return back to the space station. You know that you’ll be able to visit ");
	if(son) output("him");
	else output("her");
	output(" any time there.");
	output("\n\nWhen you turn around to look for Briha, she’s understandably gone. Watching the launch must have been too hard for her.");

	// Record firstkid Aya and secondkid Brahn’s haircolor and eyecolor, copying it from the PC’s hair and eyecolor at the time of conception. Don’t worry about the other kids.
	// Add +1 kid to Tavros station.
	// Return to map, scene over.
	processTime(15);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	flags["BRIHA_INCUBATION_TIMER"] = undefined;
	flags["SEEN_RED_DESERTER_PREGGERS"] = undefined;
	StatTracking.track("pregnancy/briha kids");
	if(son) StatTracking.track("pregnancy/briha sons");
	else StatTracking.track("pregnancy/briha daughters");
	StatTracking.track("pregnancy/total sired");
	StatTracking.track("pregnancy/total day care");
}
public function addUniqueChildBriha(isMale:Boolean = false, timeOffset:int = 0):void
{
	var traitChar:Creature = chars["PC_BABY"];
	var c:UniqueChild = new BrihaUniqueChild();
	
	c.RaceType = GLOBAL.TYPE_MYR;
	
	// Male or Female?
	if(!isMale)
	{
		c.NumMale = 0; c.NumFemale = 1; c.NumIntersex = 0; c.NumNeuter = 0;
		c.Name = "Aya";
		c.hairColor = flags["BRIHA_SPAWN_1_DEETS"][0];
		c.eyeColor = flags["BRIHA_SPAWN_1_DEETS"][1];
	}
	else
	{
		c.NumMale = 1; c.NumFemale = 0; c.NumIntersex = 0; c.NumNeuter = 0;
		c.Name = "Brahn";
		c.hairColor = flags["BRIHA_SPAWN_2_DEETS"][0];
		c.eyeColor = flags["BRIHA_SPAWN_2_DEETS"][1];
	}
	
	// Race modifier (if different races)
	c.originalRace = c.hybridizeRace(pc.originalRace, c.originalRace, true);
	
	// Adopt mother's colors at random (if applicable):
	if(rand(2) == 0) c.skinTone = traitChar.skinTone;
	if(rand(2) == 0) c.lipColor = traitChar.lipColor;
	if(rand(2) == 0) c.nippleColor = traitChar.nippleColor;
	//if(rand(2) == 0) c.eyeColor = traitChar.eyeColor;
	//if(rand(2) == 0) c.hairColor = traitChar.hairColor;
	//if(rand(2) == 0) c.furColor = traitChar.furColor;
	//if(rand(2) == 0) c.scaleColor = traitChar.scaleColor;
	//if(rand(2) == 0) c.chitinColor = traitChar.scaleColor;
	//if(rand(2) == 0) c.featherColor = traitChar.furColor;
	
	c.MaturationRate = 1.0;
	
	// Offset time (in days)
	c.BornTimestamp = (GetGameTimestamp() - (timeOffset * 1440));
	if(c.BornTimestamp < 0) c.BornTimestamp = 0;
	
	ChildManager.addChild(c);
}
public function addChildBriha(numChild:int = 1, isMale:Boolean = false, timeOffset:int = 0):void
{
	var c:Child =
		Child.NewChild(
			GLOBAL.TYPE_MYR,
			1.0,
			numChild,
			(isMale ? 1 : 0), (isMale ? 0 : 1), 0, 0
		);
	
	// Offset time (in days)
	c.BornTimestamp = (GetGameTimestamp() - (timeOffset * 1440));
	if(c.BornTimestamp < 0) c.BornTimestamp = 0;
	
	ChildManager.addChild(c);
}

public function addChildMyr(numChild:int = 1):void
{
	ChildManager.addChild(
		Child.NewChild(
			GLOBAL.TYPE_MYR,
			1.0,
			numChild,
			50, 50, 0, 0
		)
	);
}



//PC Loss
public function loseToAntGrillDeserts():void
{
	author("Jim Thermic");
	var gold:Boolean = (enemy is MyrGoldFemaleDeserter);
	//HP Loss:
	if(pc.HP() <= 0)
	{
		output("The last of your strength leaves your battered body.");
		if(!pc.hasStatusEffect("Tripped")) output(" Suddenly you’re falling backward. You hit the ground and the air leaves your chest in a giant <i>“oof”</i>. All you’re able to do now is stare at the cavern roof, your limbs heavy and useless.");
		else output(" You’re unable to lift your limbs to get off the ground - they’re heavy and useless.");

		output("\n\nRather than leave you battered and bruised, the [enemy.skinColor] skinned soldieress pulls out a first aid kit. She ");
		if((hasRedDildo() && !gold) || (hasGoldDildo() && gold))
		{
			output("pauses, though. Instead of opening it, the myr rifles through your own pack and reclaims her ");
			if(hasRedDildo()) output("vibrator");
			else output("strap-on");
			output(", grinning triumphantly.");
			//THE BELOW CONTENT WAS CUT. I DON'T CARE FOR IT. -F
			//(corresponding vibrator used flag at 1).. until a thought occurs to her. <i>“Did you use this?”</i> /(vibro used flag at 2).. until she smells it, and her grin turns to a puzzled frown. <i>“Smells like [pc.cumNoun]... just what did you do with my Private?”</i> }
			//output("\n\n{(nice)"Exactly as you think. Sorry!”</i> you admit. /(else)You answer with a coy smile. }
			output(" She stows it, then ");
		}
		output("dutifully patches you up, bandaging and dressing your wounds. The salve she applies instantly numbs your ails.");
		//First time Fighting Her:
		if(flags["LOST_TO_MYR_DESERTS"] == undefined)
		{
			flags["LOST_TO_MYR_DESERTS"] = 1;
			output("\n\n<i>“There you go, hon,”</i> the scrappy deserter smiles, patting your patched-up cheek. <i>“...I told you it’s just your turn to be on the receiving end. I may be a turncoat, but I’m not a </i>total<i> bitch - just a little bit of one.”</i>");
		}
		//else (not first time):
		else output("\n\n<i>“We just keep on running into each other, and you keep drawing the short end of the stick. It’s nothing personal, hon,”</i> the scrappy deserter reassures you, patting your patched-up cheek. <i>“How about I find a way to make it up to you? I’ve got a few ways in mind.”</i>");
	}
	//Lust Loss:
	else
	{
		output("You’re so aroused you can barely think straight. Panting heavily, your ");
		if(pc.physique() >= pc.aim()) output("[pc.meleeWeapon]");
		else output("[pc.rangedWeapon]");
		output(" slips from your fingers. Instead of picking it up, you find yourself touching yourself, fanning the flames of your wildly raging libido instead of putting them out.");

		//PcNotTripped:
		if(!pc.hasStatusEffect("Tripped")) output("\n\nStriding up to you, the seasoned soldieress presses a palm against your [pc.chest]. With a simple push, she knocks on your back. Instead of getting up, you gulp with delight. What does she have planned for you? A delighted shiver of anticipation scampers up your back.");
		//if PC has dildo, append this paragraph to lust loss
		if((hasRedDildo() && !gold) || (hasGoldDildo() && gold))
		{
			output("\n\nWith nimble fingers, she rifles through your possessions until she turns up her ");
			if(!gold) output("vibrator");
			else output("strap-on");
			output(". <i>“Might want to use this,”</i> she says, wearing an evil smile.");
			//THE BELOW CONTENT WAS CUT. I DON'T CARE FOR IT. -F
			// {(Briha and used flag at 2).. until a smell hits her nose. She looks more closely at the toy. <i>“Ehh... did you cum on the Private?”</i>");
			//output("\n\n{(nice)"Totally did. Sorry!”</i> you admit. /(else)You produce a giddy giggle(PC masc) barely befitting your appearance}. }/(used flag at 1).. until a thought occurs to her. <i>“You didn’t stick this anywhere dangerous, did you? Like, into a cockvine or a fungal myr or something?”</i>");
			//output("\n\n{(nice)"Er, no,”</i> you answer carefully. <i>“Not dangerous </i>per se<i>.”</i> /(else)You grin instead of answering{(mean) - though you note her suggestions for another day}. }");
			//DO NOT remove dildo item from PC until after the loss scene starts - triggers alt. text in sex scene opening
		}
	}
	// If Red, Dildo Screw Sex Scene
	// If Gold, Sit and Screw Sex Scene
	clearMenu();
	if(gold) addButton(0,"Next",sitAndScrewGoldMyr);
	else addButton(0,"Next",redDildoScrew)
}

//PC Win
public function winVsAntGrillDeserts():void
{
	clearOutput();
	var gold:Boolean = (enemy is MyrGoldFemaleDeserter);
	showDeserter(gold);
	author("Jim Thermic");
	//HP Loss:
	if(enemy.HP() <= 0)
	{
		if(enemy.short != "Briha" && enemy.short != "Lys") output("The ");
		output("[enemy.name] falls to her knees, utterly spent. Her ");
		if(gold) output("combat shotgun and service revolvers");
		else output("hatchet and primitive pistol");
		output(" slip out of her hands. There’s a series of whumphs as they hit the ground.");

		output("\n\nThere’s not an ounce of fight left in her - her exhausted expression affirms her submission to your superior skill.");
		
		if((enemy is MyrRedFemaleDeserter && flags["RED_MYR_DESERTER_BEATEN"] == undefined) || (enemy is MyrGoldFemaleDeserter && flags["GOLD_MYR_DESERTER_BEATEN"] == undefined)) output("\n\n<i>“...Guess you weren’t such an easy mark after all.");
		else output("<i>“...Guess it’s my turn after all.");
		output(" My life is yours, soldier. What are you going to do with me?”</i> Her singularly black eyes");
		if(!gold) output("- one partially closed -");
		output(" stare at you.");
	}
	//Lust Loss:
	else
	{
		if(enemy.short != "Briha" && enemy.short != "Lys") output("The ");
		output("[enemy.name] falls to her knees and drops her weapons. Instead of picking them up, she feverishly touches herself. Her face is flushed as she lets out lewd little moans.");
		output("\n\n<i>“...F-fuck-! I-I can’t stop!”</i> The [enemy.skinColor] skinned deserter moans, <i>“It’s been far too long since I’ve had a good lay. Come on, soldier, h-have your way with me.”</i> She begs.");
		//Red
		if(!gold) output("\n\nRaising her knees and hips, she lewdly displays the damp spot between her thighs. The fabric against her pussy is utterly soaked. It clings to her pussy lips, showing you her sinful contours.");
	}
	output("\n\nWhat do you do with her?\n\n");
	//[Dildo Screw] [Sit & Screw] [DoggyStyle] [Anal Sex] [Cum Spluge] [Hand Play]
	processTime(2);
	clearMenu();
	if(pc.lust() >= 33)
	{
		//Dildo Screw (Red)
		// Two variants - PC loss and PC Win/Consent version. For Red Only.
		// Also a variant for the first time you get this scene, either loss or win/consent, where she introduces the dildo.
		if(enemy is MyrRedFemaleDeserter) addButton(0,"DildoScrew",redDildoScrew,undefined,"Dildo Screw","Play with her and her dildo.");
		//Sit & Screw (Gold)
		// Two variants - PC loss and PC Win/Consent version. For Gold Only.
		// Also a variant for the first time you get this scene, either loss or win, where she introduces the strap on.
		else addButton(0,"Sit‘n’Screw",sitAndScrewGoldMyr,undefined,"Sit & Screw","Have some fun screwing her... with her strap-on if you need one.");
		//Doggy Style (Both)
		// PC Win or Non-Hostile Consent Only
		// PC must have a dick.
		// Max capacity 16 inches.
		// Max girth four inches.
		if(pc.hasCock() && pc.cockThatFits(enemy.vaginalCapacity(0)) >= 0) addButton(1,"DoggyStyle",doggieStyleWithMyrBitches,gold,"Doggy Style","Do her doggy style!");
		else if(pc.hasCock()) addDisabledButton(1,"DoggyStyle","DoggyStyle","You need a penis that will fit inside her for this scene.");
		else addDisabledButton(1,"DoggyStyle","DoggyStyle","You can’t do her doggie style without a dick of your own.");
		//Cum Splurge (Red)
		// Pc must have a cock.
		// Not available on loss.
		if(enemy is MyrRedFemaleDeserter)
		{
			if(pc.hasCock()) addButton(3,"Cum Splurge",cumSplurgeForRedAntSloots,undefined,"Cum Splurge","Have the red myr give you a BJ. All that venom should make it interesting...");
			else addDisabledButton(3,"Cum Splurge","Cum Splurge","You need a penis that fits inside her for this scene.");
			//Anal Sex (Red)
			// PC must have cock.
			if(pc.hasCock() && pc.cockThatFits(enemy.analCapacity()) >= 0) addButton(2,"Anal Sex",analRedButtStuffMcStuffinButts,undefined,"Anal Sex","Put it in her butt.");
			else addDisabledButton(2,"Anal Sex","Anal Sex","You need a penis that will fit inside her for this scene.");
			if(pc.hasHardLightEquipped()) addButton(4,"CompareToys",doubleDildoBrihaStuffing,undefined,"Compare Toys","Show off your high-tech hardlight for the ant-girl" + (flags["RED_MYR_DESERT_DILDO_DONE"] != undefined) ? " and see how it stacks up to what she’s used to":"" + ".");
			else addDisabledButton(4,"CompareToys","Compare Toys","You need hardlight-enabled underwear for this.");
		}
		else 
		{
			addDisabledButton(3,"Cum Splurge","Cum Splurge","This scene is exclusive to red myr deserters.");
			addDisabledButton(2,"Anal Sex","Anal Sex","This scene is only available for the red myr.");
		}
		//Hand-Play (Gold)
		if(enemy is MyrGoldFemaleDeserter)
		{
			// PC can be any gender.
			// Not Available on PC loss
			// No fucking taurs.
			// Must have frontgenitals.
			if(!pc.isTaur()) addButton(4,"Hand-Play",handPlayForGoldWaifusInTraining,undefined,"Hand-Play","She’s got four arms... put them to work.");
			else addDisabledButton(4,"Hand-Play","Hand-Play","Tauric creatures cannot enjoy this scene.");
		}
		//else addDisabledButton(4,"Hand-Play","Hand-Play","Only a gold myr deserter has enough hands for this scene...");
		//Cuff&Fuck
		cuffNFuckButton(5, enemy);
		//Steal Dildo - new scene for either myr
		//steal the dildo (or use the stolen one on her), with or without orgasm denial
		//avail. in both myr's sex menus, combat-agnostic, but requires PC having seen 'Dildo Screw' (if with Briha) or 'Sit & Screw' (if with Lys), else button is hidden (not disabled)
		//adds PC lust at the end so PC can possibly masturbate with dildo right away
		//should add misch points
		//tooltip: Distract the myr with orgasm and then abscond with her sex toy{(repeat) again}. Or you could stop just before orgasm....
		gold = (enemy is MyrGoldFemaleDeserter);
		var dildoToolTip:String = "Distract the myr with orgasm and then abscond with her sex toy";
		if((gold && flags["GOLD_DILDOED"] != undefined) || ((!gold) && flags["RED_DILDOED"] != undefined)) dildoToolTip += " again";
		dildoToolTip += ". Or you could stop just before orgasm....";
		if((gold && flags["DILDO_SCREW_SCENE_SEEN"] != undefined) || (!gold && flags["RED_MYR_DESERT_DILDO_DONE"] != undefined)) addButton(6,"Steal Dildo",stealDildoScene,gold,"Steal Dildo",dildoToolTip);
		else addDisabledButton(6,"Steal Dildo","Steal Dildo","You don’t even know if she has one!");
	}
	else
	{
		if(enemy is MyrRedFemaleDeserter) addDisabledButton(0,"DildoScrew","Dildo Screw","You’re not turned enough for sex.");
		else addDisabledButton(0,"Sit‘n’Screw","Sit & Screw","You aren’t turned on enough for this.");
		addDisabledButton(1,"DoggyStyle","DoggyStyle","You aren’t aroused enough for this.");
		addDisabledButton(2,"Anal Sex","Anal Sex","You aren’t aroused enough for this.");
		addDisabledButton(3,"Cum Splurge","Cum Splurge","You aren’t aroused enough for this.");
		addDisabledButton(4,"Hand-Play","Hand-Play","You aren’t aroused enough for this.");

		addDisabledButton(6,"Steal Dildo","Steal Dildo","You aren’t aroused enough for this.");
	}
	//Give Flower - new scene for Lys
	//avail. thru ‘About Her’ topic, consensual sex menu or victory-sex menu if Lys is friendly
	if(enemy is MyrGoldFemaleDeserter)
	{
		if(pc.hasItemByClass(VenusBloom) && flags["ENABLE_LYS_FLOWER"] != undefined) addButton(7,"Give Flower",giveFlowerToLys,undefined,"Give Flower","Present Lys with the exotic flower you found on Mhen’ga and see if it’ll cheer the poor girl up.");
		else if(flags["ENABLE_LYS_FLOWER"] != undefined) addDisabledButton(7,"Give Flower","Give Flower","Lys would appreciate any flowers you find. You wonder where you could get one....");
		else addDisabledButton(7,"Locked","Locked","You don’t know her well enough for this.");
	}
	addButton(14,"Leave",genericVictoryLeaveMyr);
}

public function genericVictoryLeaveMyr():void
{
	myrDeserterEpilogueShitTracker();
	CombatManager.genericVictory();
}

//Sex Scenes
//Hand-Play (Gold)
// PC can be any gender.
// Not Available on PC loss
// No fucking taurs.
// Must have frontgenitals.
public function handPlayForGoldWaifusInTraining():void
{
	clearOutput();
	author("Jim Thermic");
	if(!inCombat())
	{
		setEnemy(new MyrGoldFemaleDeserter());
	}
	showDeserter(true,true);
	output("You ask ");
	if(enemy.short != "Lys") output("the ");
	output("[enemy.name] if she’ll pleasure you with all those hands of hers.");

	output("\n\n<i>“Of course I can,”</i> she saucily smiles.");
	if(!pc.isNude()) output(" Putting one hand on her hips, she gestures with the others at your clothes. <i>“You’ll want to take those off, while I watch. I insist.”</i>");
	else output("<i>“Let me just slip out of my clothes first.”</i>");

	output("\n\n");
	if(!pc.isNude()) output("You strip off your [pc.gear] and she watches with keen interest. Once you’re finished, she");
	else output("She");
	output(" slowly strips off her battered combat fatigues. Underneath, she’s wearing an olive camo bra and matching panties. Reaching behind her, there’s a tiny click, and her honey-hued knockers spill out, bouncing before your eyes.");

	output("\n\nAs you lick your lips, the alieness saunters over, her sizable breasts jiggling about. <i>“...I think it’s better if I leave on my panties. Can’t have you getting too excited, now, can I?”</i>");

	output("\n\n");
	if(enemy.short != "Lys") output("She");
	else output("Lys");
	output(" runs her finger along your cheek, a sultry smile on her face. You gulp and look down at her awesome cleavage and ring-pierced nipples. They’re so close, and so tuggable...");

	output("\n\nBefore you can reach out to tease them, ");
	if(enemy.short != "Lys") output("the ");
	output("[enemy.name] wraps her arms around you. She pulls you close, pressing you against her plush breasts. With so many arms, you truly feel wrapped up by her. <i>“How does this feel? Nice?”</i>");
	output("\n\nYou nod and turn your head. Staring into her entrancingly black eyes, you both inch closer together at the same time. Your lips are achingly close. At last, they press together, and she lets out a happy noise. Parting your mouth, your wet tongues touch and wrestle as you make out with ");
	if(enemy.short != "Lys") output("the gold myr");
	else output("Lys");
	output(".");

	output("\n\nAs you’re kissing her, two of her hands slide up to cup your cheeks and pull your face closer. Another hand teases down your naked spine, tracing up and down. You instinctively shiver with delight, relishing in the tantalising sensation as her tongue dances with yours. There’s so much going on at once, your senses feel like they’re overloading!");

	output("\n\nYour lips part and ");
	if(enemy.short != "Lys") output("the ");
	output("[enemy.name] slowly kisses down your jaw and neck. You shiver with delight as she trails her way southward, making her way to your collarbone. She suckles on it, leaving little flushing marks.");
	output("\n\nShe kisses down your body, plump breasts sliding down your [pc.skinFurScales]. Stopping face-first in front of your [pc.groin], she ");
	if(pc.hasCock()) 
	{
		output("reaches up and wraps her fingers around [pc.oneCock].");
		if(pc.balls > 0) output(" Another hand reaches up to gently cup your [pc.balls].");
	}
	//ElseGotPussy: 
	else if(pc.hasVagina()) 
	{
		output("gently probes [pc.oneVagina]. You gasp as she slips a finger inside of you and wiggles it about. Another hand reaches up to flick and tease your [pc.clits].");
	}

	output("\n\n");
	output("[enemy.Name] masterfully teases your loins, ");
	if(pc.hasCock()) 
	{
		output("stroking and cupping your [pc.cockNounSimple]");
		if(pc.balls > 0) output(" and [pc.balls]");
	}
	else if(pc.hasVagina()) output("stroking and fingering your sopping wet slit");
	output(". One of her hands slides ");
	if(pc.legCount > 1) output("between your [pc.legs]");
	else output("around your waist");
	output(". A single finger presses between your buttocks and slides inside of your [pc.asshole]. You moan in delight as");
	if(pc.hasCock()) 
	{
		output(" you’re jerked off and fingered");
		if(pc.balls > 0) output(", the while having your [pc.sack] simultaneously fondled");
	}
	if(pc.hasVagina()) 
	{
		output( "you’re simultaneously fingered in both your [pc.pussy] and ass, all the while having your [pc.clits] rubbed");
	}
	output(".");

	output("\n\nJust when there’s nothing left for her last hand to touch, you look down to see ");
	if(enemy.short != "Lys") output("the ");
	output("[enemy.name] cupping and teasing her voluptuous breasts. She looks up at you with a sensuous grin on her honey-hued lips, teasing her plump puppies as she ");
	if(pc.hasCock()) output("tugs and finger-fucks you");
	else output("double finger-fucks you");
	output(". Her delving digits brush your ");
	if(pc.hasCock()) output("prostate");
	else output("g-spot");
	output(" and you’re pushed over the brink!");

	output("\n\nWith a loud cry, your [pc.thighs] quake and you ");
	if(pc.hasCock()) output("shoot [pc.cumColor] [pc.cumVisc] ropes of [pc.cumNoun] all over her cheeks. She continues to jerk you off and tickle your prostate, coaxing you to unload on her face, a satisfied smile playing on her spunk-stained lips.");
	else output("spastically cream yourself around her fingers. You wildly clench and drench them in your [pc.girlCum], bucking your hips wildly against her knuckles.");

	output("\n\nOnce you finish twitching, she pulls her fingers out and languidly licks your ");
	if(pc.hasCock())
	{
		output("[pc.cumNoun]-coated cock");
		if(pc.cockTotal() > 1) output("s");
		output(" until ");
		if(pc.cockTotal() == 1) output("it is");
		else output("they are");
	}
	else
	{
		output("sloppy slit");
		if(pc.totalVaginas() > 1) output("s");
		output(" until ");
		if(pc.totalVaginas() == 1) output("it is");
		else output("they are");
	}
	output(" completely clean. Pulling back, she looks so satisfied you half-expect her to purr.");

	output("\n\n<i>“Well, that was fun - thank you for the meal,”</i> ");
	if(enemy.short != "Lys") output("the ");
	output("[enemy.name] grins, slipping her clothes back on. Once she’s done, she gives you a quick kiss, picks up her weapon, and saunters off onto the battlefield.\n\n");
	myrDeserterEpilogueShitTracker();
	processTime(22);
	pc.orgasm();
	if (inCombat())
	{
		CombatManager.genericVictory();
	}
	else
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Anal Sex (Red)
// PC must have cock.
// Not available on PC loss
public function analRedButtStuffMcStuffinButts():void
{
	clearOutput();
	author("Jim Thermic");
	if(!inCombat())
	{
		setEnemy(new MyrRedFemaleDeserter());
	}
	showDeserter(false,true);
	var x:int = pc.cockThatFits(chars["RED_DESERTER"]);
	if(x < 0) x = pc.smallestCockIndex();
	output("You stride up to ");
	if(enemy.short != "Briha") output("the ");
	output("[enemy.name], ");
	if(pc.HP() > 0 && pc.lust() < pc.lustMax() && inCombat()) output("pull her to her feet, ");
	output("and turn her on the spot. Without warning, you pull down her camo pants and underwear, and she lets out a cry of surprise.");

	output("\n\n<i>“W-what are you planning...”</i> She breathlessly asks. Without answering, you pull out [pc.oneCock] and grind it between her bare red buttocks. Her muscular butt feels divine against your [pc.sheath " + x + "], clenching it instinctively.");
	output("\n\nAs you grind against ");
	if(chars["RED_DESERTER"].isPregnant()) output("your pregnant lover’s");
	else output("her");
	output(" ass, you slide your hands up the bottom of her top and the camisole underneath. Her pert breasts are perfectly hand sized and you cup them with relish. The female soldier moans and arches her back into your efforts, rubbing her round butt against your stiffening tool.");

	output("\n\n<i>“M-more... my nipples,”</i> she huskily begs. You indulge her. Lightly pinching her puckered buds, she trembles in your arms, letting out little gasps and moans. As you roll them between your fingertips, she practically melts in your arms. The more excited she gets, the more she wiggles her backside against [pc.eachCock], stoking your lust and making you achingly stiff.");

	output("\n\nYou order ");
	if(enemy.short != "Briha") output("the ");
	output("[enemy.name] to bend over, and she obediently does as you ask. Grabbing her gently curved hips in your hands, you press your [pc.cockHead " + x + "] between her taut buttocks.");
	if(flags["FUCKED_RED_DESERTBUTT"] == undefined)
	{
		output("\n\nShe lets out a squeal of protest when she realizes what you’re doing. <i>“W-w-w-what are you doing? N-not in </i>there<i>, that’s the wrong hole-!”</i>");
	}
	else output("\n\nShe shivers as she realizes what you’re doing. <i>“Y-you’re going to stick it in </i>there<i> again? But that’s so naughty...”</i>");

	output("\n\nYou tease her extremely cuppable breasts some more. Her protests lessen, until at last she caves, <i>“...O-o-oh all right. B-but be gentle, all right?");
	if(flags["FUCKED_RED_DESERTBUTT"] == undefined)
	{
		output(" It’s my first time.");
		flags["FUCKED_RED_DESERTBUTT"] = 1;
	}
	output("”</i>");

	output("\n\nWith a devilish grin, you continue to push your [pc.cockHead " + x + "] into her narrow crack until it is pressed flush with her naughty pucker. Telling her to relax, you continue to grope and tease her tits.");

	output("\n\nFinally, ");
	if(chars["RED_DESERTER"].isPregnant()) output("the pregnant myr’s");
	else output("the female soldier’s");
	output(" narrow hole begins to slacken, and you’re able to slowly slip your tip inside. Because she’s so tense, her ring and rectum are gloriously tight. At the same time, it takes a lot of effort to sheathe yourself inside of her muscled backside.");
	output("\n\nWhen at last your [pc.cock] bottoms out inside of her butt, you let out a throaty groan. Every inch of her narrow confines are deliciously wringing you. Reflexively, your [pc.cockHead " + x + "] swells deep inside of her ass, and she lets out another sharp cry. <i>“...O-Oh - you’re breaking my ass!”</i> Her whole butt tenses up. Void! She’s so tight inside it’s almost criminal!");
	pc.cockChange();

	output("\n\nHolding her back against you, you suck on her neck and pinch her nipples. Her clinging insides ripple around your [pc.cock " + x + "]. Moaning into her shoulder, you can’t help but thrust upwards, using gravity to fully impale her on your turgid tool. This time ");
	if(enemy.short != "Briha") output("the ");
	output("[enemy.name] lets out a loud moan and trembles against you.");

	output("\n\nEnthused by her response, you slowly pull yourself around to her naughty pucker and slide back in. Soon you’re slapping your hips against her rippling ass, the air filled with your shared moans and the lewd slapping of flesh.");

	output("\n\nFeeling her flex and wring your [pc.cock " + x + "] drives you into a lusty frenzy. You pinch and roughly tease her breasts, and ");
	if(enemy.short != "Briha") output("the female soldier");
	else output("Briha");
	output(" lets out a delighted cry. Her whole body quakes and she reaches up, clinging to your hands as she cums. Feeling her insides ripple and ring your throbbing tool pushes you over the brink, and you liberally unload your [pc.cum] inside of her tensed rectum.");

	output("\n\nOnce you’re both finished cumming, you slowly pull out of her trembling buttocks. With a loud plop, you remove your [pc.cockHead " + x + "]. Her asshole is left gaping in your absence, and a ");
	if(pc.cumQ() < 50) output("tiny stream");
	else if(pc.cumQ() < 1000) output("long stream");
	else output("river");
	output(" of [pc.cumColor] pours out of her dark hole and dribbles down her glistening pussy lips. She moans in delight from your anal creampie, reaching between her thighs and massaging your [pc.cumVisc] [pc.cumNoun] into her crimson snatch.");

	output("\n\n<i>“Mmm- that was really intense.”</i> she gasps, fingering your spunk into her hole. Even though you’ve just came, as she toys with her sloppy slit, you feel yourself twitching in response. What a sight! <i>“I think my ass is going to need a rest after that. It’s going to be a while before I can sit down.”</i>");
	output("\n\nPulling up her trousers, ");
	if(chars["RED_DESERTER"].isPregnant()) output("the pregnant woman");
	else output("the red myr");
	output(" gives you a saucy smile and then saunters off. You decide it’s probably time to get going as well.\n\n");

	myrDeserterEpilogueShitTracker();
	processTime(15+rand(10));
	postMyrCoitusPantyFapShit(false);
	pc.orgasm();
	if(inCombat()) CombatManager.genericVictory();
	else
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Cum Splurge (Red)
// Pc must have a cock.
// Not available on loss.
public function cumSplurgeForRedAntSloots():void
{
	clearOutput();
	author("Jim Thermic");
	if(!inCombat())
	{
		setEnemy(new MyrRedFemaleDeserter());
	}
	showDeserter(false,true);
	output("You ask ");
	if(enemy.short != "Briha") output("the raven-haired deserter");
	else output("Briha");
	output(" to go down on your [pc.cocks]. She puts a hand on her hip and quirks a brow.");

	//FirstTimeGivingYouHead:
	if(flags["GOTTEN_RED_DESERT_HEAD"] == undefined)
	{
		output("\n\n<i>“Are you sure? Asking my people for a blowjob... well, let’s just say you won’t be [pc.walking] anywhere for a few hours,”</i> she playfully cautions, then adds, <i>“...Or so I hear. I’ve never had the chance to give one, you know?”</i>");
		output("\n\n<i>“You’ll also have to put up with me being terrible. I mean, I’m confident in my venom, but not so much my technique, you know?”</i>");
		flags["GOTTEN_RED_DESERT_HEAD"] = 1;
	}
	//Else / Not first time:
	else
	{
		output("\n\n<i>“Well, if you’ve got the spare time, I mean, if you won’t be using your legs for the next few hours.”</i> ");
		if(chars["RED_DESERTER"].isPregnant()) output("The pregnant woman");
		else output("She");
		output(" grins.");

		output("\n\n<i>“I’m all for it. There’s something... I don’t know... indescribably satisfying about licking your [pc.cocks].”</i>");
	}

	output("\n\n");
	if(!pc.isNude()) output("You hastily strip off until you’re standing in the buff. Meanwhile, she takes it slow, slipping");
	else output("Slowly, she slips");
	output(" her torn combat fatigues. Underneath she wears a simple cotton black camisole and a matching thong. Her top barely covers her [enemy.belly] and accentuates her well-rounded breasts.");

	output("\n\nSeeing her in such a sexy yet simple outfit makes your [pc.cocks] stiffen. When she pulls off her top and bares her pert puppies, your [pc.cockHeads] ");
	if(pc.cockTotal() == 1) output("is");
	else output("are");
	output(" already pressing against your ");
	if(pc.biggestCockLength() <= 7) output("waist");
	else if(pc.biggestCockLength() <= 15) output("[pc.belly]");
	else output("chest");
	output(".");

	output("\n\n<i>“Mmm, I see you’re already standing to attention, soldier,”</i> she chuckles. Sauntering over in nothing but her underwear, you see you’re not the only one who’s stiff. Her dark red nipples are already puckered. As if you didn’t have enough eye candy!");

	output("\n\n");
	if(chars["RED_DESERTER"].isPregnant()) output("With a little bit of effort, your large-bellied lover");
	else output("She");
	output(" drops to her knees before your dick");
	if(pc.cockTotal() > 1) output("s");
	output(". With flushed cheeks, she inches closer to ");
	if(pc.cockTotal() == 1) output("it");
	else output("them");
	output(". Her hot breath washes over your sensitive skin, electrifying your senses. You let out a low, throaty groan. How can you be this aroused when she hasn’t even <i>touched</i> you yet?");

	output("\n\nWith a lick of her lips and intensity in her alien eyes, ");
	if(enemy.short != "Briha") output("the female deserter");
	else output("Briha");
	output(" edges closer to [pc.oneCock]. She parts her scarred mouth and gives ");
	if(pc.hasASheath() && pc.cockTotal() == 1) output("your [pc.sheath]");
	else output("one of them");
	output(" a tentative lick. Her inexperience is obvious, but her face is flushed from lust. Is she acting on instinct?");

	output("\n\nAs every groove of her tongue bastes your underside");
	if(pc.cockTotal() > 1) output("s");
	output(" in her warm saliva, you shiver with delight. Up and down, she lavishes your [pc.cocks] in her wetness. It’s not long before a fierce, fiery sensation begins to burn upwards from your loins. You flush with delight as diffused ecstasy seizes every inch of your body.");

	output("\n\nWith a few more licks, your [pc.cockHeads] deliciously twitch");
	if(pc.cockTotal() == 1) output("es");
	output(" and begin");
	if(pc.cockTotal() == 1) output("s");
	output(" to dribble [pc.cumNoun] like ");
	if(pc.cockTotal() == 1) output("a broken faucet");
	else output("broken faucets");
	output(". When her wet lips brush against your crown");
	if(pc.cockTotal() > 1) output("s");
	output(", you feel it in achingly exquisite detail - the venom is definitely having an effect!");

	output("\n\n");
	if(chars["RED_DESERTER"].isPregnant()) output("Your pregnant lover");
	else output("The red deserter");
	output(" suckles on ");
	if(pc.cockTotal() > 1) output("one of your shafts");
	else output("your shaft");
	output(". You let out a rapturous cry. Without warning, you cry out and shoot [pc.cumVisc] ropes of [pc.cumNoun] all over her face. Your head");
	if(pc.cockTotal() > 1) output("s are");
	else output(" is");
	output(" so hypersensitive you almost faint from the pleasure jetting out your cock hole");
	if(pc.cockTotal() > 1) output("s");
	output(".");

	output("\n\nAfterwards, you fall down in a trembling mess. Your lower body is still trembling and twitching, and [pc.cumColor] [pc.cumNoun] is still spurting and gushing out of your dick");
	if(pc.cockTotal() > 1) output("s");
	output(". Trying to grab ");
	if(pc.cockTotal() == 1) output("it");
	else output("them");
	output(" in your hands, you instead moan from the brushing of your fingertips against your [pc.cockColor] flesh.");

	output("\n\n<i>“Oh, that won’t do - we’re not nearly finished yet,”</i> ");
	if(enemy.short == "Briha") output("Briha");
	else output("She");
	output(" purrs. You moan as the red-skinned woman crawls up to you on all fours, clad in nothing but a black thong.");

	output("\n\nShe grabs [pc.oneCock], ");
	if(pc.cockTotal() > 1) output("each of them ");
	output("now covered in warm spunk. Her slender fingers push through the [pc.cumVisc] mess and grip your hypersensitive pole. Lightning bolts of pleasure fly from your grasped rod. Throwing back your head, you let out a low, primal moan, giving yourself over to pleasure.");

	output("\n\n<i>“That’s a good " + pc.mf("boy","girl") + ". Just relax and give into it.”</i> She wraps her scarred lips around [pc.oneCockHead] and suckles wildly on it. You moan and let your hot seed gush out and over her tongue, all the while your ");
	if(pc.balls == 0) output("body");
	else output("[pc.balls]");
	output(" ache");
	if(pc.balls <= 1) output("s");
	output(" in protest. <i>“...Now to take you a little bit deeper.”</i>");

	output("\n\nYou’re utterly blown away as she sucks [pc.oneCock] into her moist mouth. Her intoxicating saliva mixes with your [pc.cumVisc] [pc.cum] and pools around your [pc.cockHead]. It feels as intense as sex, if not <i>more</i> so!");

	output("\n\nAs she sucks you off in her hot, spunk-filled mouth, you groan and arch your back, a thin stream of drool trickling down your cheek. Right now you’re nothing but [pc.aRace] font of [pc.cumNoun] for her to suck upon and you don’t care. Letting out carnal cries and moans, you buck your hips against her chin, utterly lost in the utter pleasure of her druggy drool, giving over every drop you");
	if(pc.balls > 0) output("r [pc.balls]");
	output(" have to give.");

	output("\n\nYour brain utterly short circuits as she takes your [pc.cockHead] deeper and back into her throat. Babbling with delight, your whole body convulses, and you climax once more. It’s nothing more than a surge in the unstoppable stream drooling from your dick");
	if(pc.cockTotal() > 1) output("s");
	output(".");

	output("\n\n... After several orgasms, your entire body feels like lead. Your world spins and your [pc.cocks] ");
	if(pc.balls > 0) output("and [pc.ballsNoun] ");
	output("are filled with a hot, throbbing ache. Your loins are utterly [pc.cumNoun]-splattered. You can barely see ");
	if(enemy.short != "Briha") output("the ");
	output("[enemy.name]’s head roaming down at your hips.");

	output("\n\nShe drags herself up your utterly sapped body. You tremble and groan as her soft breasts rub up your receptive chest, your loins twitching at the brush of her erect nipples. When she comes face to face with you, she’s wearing a mask of your [pc.cum]. You can smell it all over her - ");
	if(chars["RED_DESERTER"].isPregnant()) output("the pregnant myr");
	else output("the myr deserter");
	output(" is utterly marked with your scent.");

	output("\n\n<i>“That was fun,”</i> ");
	if(enemy.short != "Briha") output("she");
	else output("Briha");
	output(" purrs and licks her lips. When she notices your eyes are rolled back, the soldier instinctively checks your pulse. <i>“...Whoops, did I go a little bit overboard?”</i>");

	output("\n\nUnable to lift even a single finger, you lie there on the ground, tiny pearls of [pc.cum] dripping from your [pc.cocksNounSimple].");
	//If have won five or more fights:
	if(flags["RED_MYR_DESERTER_BEATEN"] != undefined && flags["RED_MYR_DESERTER_BEATEN"] >= 5) 
	{
		if(enemy.short != "Briha") output("The ");
		output("[enemy.name] lies on top of you, resting her pert breasts against your chest. Once she knows you’re okay, she gets dressed, kisses your cheek, and slips off.");
	}
	output("\n\nIt takes at least an hour or two before you regain full motion, not to mention the time it takes you to clean up your messy loins. You’re still riding the euphoric high when you finish slipping on your gear. That really was something else!");

	myrDeserterEpilogueShitTracker();
	imbibeVenomEffects();
	processTime(120+rand(10));
	// PC loses two hours.
	// Balls are mother-fucking-emptied.
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	postMyrCoitusPantyFapShit(false);
	output("\n\n");
	if(inCombat()) CombatManager.genericVictory();
	else
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Doggy Style (Both)
// PC Win or Non-Hostile Consent Only
// PC must have a dick.
// Max capacity 16 inches.
// Max girth four inches.
public function doggieStyleWithMyrBitches(gold:Boolean = false):void
{
	clearOutput();
	author("Jim Thermic");
	if (inCombat())
	{
		gold = CombatManager.hasEnemyOfClass(MyrGoldFemaleDeserter);
	}
	else
	{
		if (gold) setEnemy(new MyrGoldFemaleDeserter());
		else setEnemy(new MyrRedFemaleDeserter());
	}
	showDeserter(gold,true);

	var x:int = pc.cockThatFits(enemy.vaginalCapacity(0));
	if(x < 0) x = pc.smallestCockIndex();

	var DontKnowName:Boolean = (enemy.short != "Lys" && enemy.short != "Briha");

	output("You stride up to ");
	//if(DontKnowName) output("the ");
	output("[enemy.name]. In an authoritative voice, you tell her to turn around, and lift her ");
	if(gold) output("abdomen");
	else output("butt");
	output(" in the air.");

	output("\n\nBlushing furiously, the [enemy.hairColor]-haired deserter does as you ask. She rolls on the spot");
	if(enemy.isPregnant()) output(" - though she’s careful of her [enemy.belly] -");
	output(" and raises up her rear end.");
	if(!gold) output(" With one swift movement, you pull down her trousers and underwear to her knees. Her glistening red snatch is exposed to your gaze, a perfect camel-toe peeking between her thighs.");
	else output(" Her glistening gold egg-slit is exposed to your gaze, positioned at the back of her large antish ass.");

	output("\n\n<i>“");
	var firstTime:Boolean = ((gold && flags["BONED_GOLD_DESERT"] == undefined) || (!gold && flags["BONED_RED_DESERT"] == undefined));
	if(firstTime) output("I-I’ve never done it with a " + pc.mf("male","real dick") + " before, so please be gentle,”</i> she requests.");
	else output("J-Just like last time?”</i>, she asks.");

	output("\n\nWith a light smile, you strip off your [pc.gear]. It falls to the ground around you, leaving you fully naked. Seeing her bent over, crotch exposed, has already got [pc.eachCock] achingly hard.");

	output("\n\nYou can see ");
	//if(DontKnowName) output("the ");
	output("[enemy.name] peeking back at your turgid length");
	if(pc.cockTotal() > 1) output("s");
	output(". Her ");
	if(gold) output("alien abdomen");
	else output("scarlet butt");
	output(" wiggles in nervous anticipation. Cute.");

	output("\n\nReaching out, you slide your fingers and palms across both ");
	if(gold) output("sides of her golden rump");
	else output("of her springy buttocks");
	output(". ");
	if(!gold && enemy.isPregnant()) output("Your pregnant lover");
	else output("She");
	output(" receptively pushes back into your hands. There’s a hot intensity in the air and your thoughts become drugged with lust - you want her, and you want her <i>now</i>.");

	output("\n\nWith a not-so-gentle jerk, you pull her wet pussy flush against [pc.oneCock]. Your rigid underside presses against her soft, slippery folds, which part and kiss your undercarriage. Adjusting your movement, you slide your [pc.cockHead " + x + "] inside of her warm confines and sheath yourself in her ");
	if(!gold) output("heavenly hole");
	else output("otherworldly egg-slit");
	output(".");
	pc.cockChange();

	output("\n\nAs your [pc.cockHead " + x + "] caresses her inner walls, ");
	//if(DontKnowName) output("the ");
	output("[enemy.name] croons with delight. She arches her back and presses needily against you.");

	output("\n\nYou groan with delight as she wrings your [pc.cock " + x + "]. Her alien cunt feels so damn <i>good</i> squeezing around you. It’s all you can do not to blow your load. You firmly grab ");
	//if(DontKnowName) output("the ");
	output("[enemy.name]’s rump, holding on as her ");
	if(gold) output("ovi-hole");
	else output("pussy");
	output(" milks your manhood.");

	output("\n\n<i>“M-more! D-deeper!”</i> ");
	if(enemy.isPregnant()) output("The pregnant deserter");
	else output("She");
	output(" begs. You slap your hips against her ");
	if(gold) output("gigantic gold bottom");
	else output("beautiful red rump");
	output(". The air is filled with lewd smacking noises and her juices dribble down");
	if(gold) 
	{
		output(" your thrusting cock");
		if(pc.balls > 0) output(" and [pc.balls]");
		output(".");
	}
	else output(" her taut thighs.");

	output("\n\nWith a shrill cry, the [enemy.hairColor]-haired ant-girl cums out of nowhere, convulsing wildly around your [pc.cock " + x + "]. She squeezes it hard as her hot juices flood down her narrow canal, spluttering against your [pc.cockHead " + x + "]. Your entire length is basted in her hot, sticky warmth. Your senses are utterly seized with unspeakable pleasure.");
	output("\n\nPushed over the edge, you grab and press your hips flush with her ");
	if(gold) output("golden hindquarters");
	else output("spasming ass");
	output(". Closing your eyes, you let yourself go to divine release. ");
	if(pc.cumQ() < 10) output("Little splutters");
	else if(pc.cumQ() < 100) output("Gooey spurts");
	else output("Liberal gushes");
	output(" of [pc.cumNoun] shoot from your [pc.cockNounSimple " + x + "] and deep into her ");
	if(gold) output("honeyed");
	else output("red");
	output(" snatch, filling it with your seed.");

	//Red+NotPregnant: 
	if(!gold && !enemy.isPregnant())
	{
		output("\n\nDeep inside of her alien womb, your [pc.cumVisc] seed swims up and seeks her eggs, basting them in your [pc.cumColor]");
		if(pc.virility() > 0) output(" virility");
		else output(" spunk");
		output(".");
	}

	//Knot:
	if(pc.hasKnot(x)) output("\n\nAs you continuously cum inside of her, your [pc.knot " + x + "] swells inside of her, locking deep inside of her sloppy pussy. She lets out a cry of surprise as you lock with her, followed by a low, throaty moan. Heightening her pleasure, you gyrate your hips. The stirring and spurting of your [pc.cockHead " + x + "] inside of her [pc.cumNoun]-filled hole drives her to insensibility and reduces her to a babbling, pleasure-wrecked mess.");

	output("\n\nAfter what seems like an eternity of pleasure, you pull out of her ");
	if(gold) output("egg-hole");
	else output("snatch");
	output(". There’s a loud plopping noise and ");
	if(pc.cumQ() < 10) output("tiny drops");
	else if(pc.cumQ() <= 50) output("thin streams");
	else if(pc.cumQ() <= 500) output("thick, gooey streams");
	else output("a torrent");
	output(" of [pc.cum] floods ");
	if(!gold) output("down her well-worn thighs");
	else output("out of her winking, well-fucked snatch");
	output(".");

	output("\n\nCrawling on her wobbly knees, ");
	output("[enemy.Name] turns around and grabs your sloppy [pc.cockNounSimple " + x + "]. Slowly and intimately, she licks it clean, not letting a single drop of your [pc.cumFlavor] [pc.cumNoun] go to waste.");

	//Red/Briha:
	if(!gold) 
	{
		output("\n\nAs ");
		if(enemy.isPregnant()) output("the pregnant myr’s");
		else output("her");
		output(" drug-like saliva washes over your spunk-covered staff, a euphoric haze grips you and won’t let go. Your [pc.cock " + x + "] stiffens once more and trembles. Letting out a sharp gasp, a tight pressure builds and coils in your loins. All it takes is a few more licks, and you’re spurting thick, [pc.cumVisc] ropes of [pc.cumNoun] all over her face and basting it in your seed.");
		output("\n\nWith a satisfied smile, she looks up at you, her face utterly coated in [pc.cumColor]. She wipes off her cheeks, letting your gooey strings stick to her fingers. One by one, she sucks your [pc.cumFlavor] [pc.cumNoun] off her fingers, a look of fluttering ecstasy on her face.");
	}
	//Gold/Lys:
	else
	{
		output("\n\nOnce the raven-haired myr is finished, she looks up at you and erotically parts her mouth. Her lips and tongue are coated in [pc.cumColor]. With a single lick and gulp, she swallows the remainder.");
	}
	output("\n\n<i>“...Delicious - your [pc.cumNoun] really is delicious,”</i> she murmurs. <i>“");

	if(firstTime) 
	{
		output("Does all of it taste like that, or just yours?");
		if(gold) flags["BONED_GOLD_DESERT"] = 1;
		else flags["BONED_RED_DESERT"] = 1;
	}
	else output("I really am addicted to the taste...");

	output("”</i>\n\nWhen she can finally stand, ");
	//if(DontKnowName) output("the ");
	output("[enemy.name] gives you ");
	if(gold) output("a long goodbye kiss. As you’re swooning, she");
	else output("a quick peck on the cheek. As you’re lightly swooning from her intoxicating saliva, she");
	output(" slips off with her clothes in her arms.\n\n");
	
	myrDeserterEpilogueShitTracker();
	processTime(15+rand(10));
	
	knockUpRedBitchChance();

	pc.orgasm();
	postMyrCoitusPantyFapShit(gold);
	if(inCombat()) CombatManager.genericVictory();
	else
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Dildo Screw (Red)
// Two variants - PC loss and PC Win/Consent version. For Red Only.
// Also a variant for the first time you get this scene, either loss or win/consent, where she introduces the dildo.
public function redDildoScrew():void
{
	author("Jim Thermic");
	if(!inCombat())
	{
		clearOutput();
		setEnemy(new MyrRedFemaleDeserter());
	}
	showDeserter(false,true);
	var DontKnowName:Boolean = (enemy.short != "Lys" && enemy.short != "Briha");
	var loss:Boolean = false;
	//IF PC LOSS:
	if(inCombat() && (pc.HP() <= 0 || pc.lust() >= pc.lustMax()))
	{
		loss = true;
		clearOutput();
		author("JimThermic");
		showDeserter(false,true);
		if(hasRedDildo())
		{
			if(DontKnowName) output(enemy.capitalA + enemy.short);
			else output("[enemy.name]");
			output(" waggles the vibrator at you, filling your imagination with eight semi-solid and pleasure-ready inches. ");
			removeRedDildo();
		}
		else
		{
			output("From her kitpack, ");
			//if(DontKnowName) output("the ");
			output("[enemy.name]");
			output(" pulls out an imposing dildo, a full eight inches of veiny goodness. ");
		}
		if(enemy.isPregnant()) output("Your pregnant lover");
		else output("She");
		output(" straddles your waist, sitting on top of you, and touches it against the tip of your nose.");

		//First Time Seeing Dildo Screw Scene:
		if(flags["RED_MYR_DESERT_DILDO_DONE"] == undefined)
		{
			output("\n\nYour eyes cross as you stare at the camo-colored cock. It’s shaped just like a myr cock, but instead of being scarlet, it’s a mottled green from tip to base with the occasional splotch of chocolate brown.");
			output("\n\n<i>“Like it?”</i> She purrs, <i>“It’s standard issue for us girls in the trenches. I’ve spent many a happy night with the Private inside of me, both of us quivering away.”</i>");
			output("\n\nThere’s a clicking noise. The synthetic wang begins to buzz against your sensitive nose. It’s shaped like a dildo, but it’s actually a vibrator? Two separate motors - one in the tip and another in the base - wildly whir.");
			output("\n\nDoes it look so thick because it’s right in front of your eyes, or is it <i>really</i> that big? A matching shiver courses through you, starting at your nose and ending at your [pc.toes].");
			flags["RED_MYR_DESERT_DILDO_DONE"] = 1;
		}
		//Else / Not first time:
		else
		{
			output("\n\n<i>“You remember the Private, don’t you? That delicious feeling of him quivering about inside of you-I bet you missed it,”</i> she purrs.");
			output("\n\nThere’s a clicking noise. The synthetic wang begins to buzz against your sensitive nose. The two separate motors - one in the tip and another in the base - wildly whir. A matching shiver courses through you, starting at your nose and ending at your [pc.toes].");
		}
	}
	//ELSE PC WIN/CONSENT:
	else
	{
		//First Time Seeing Dildo Screw Scene:
		if(flags["RED_MYR_DESERT_DILDO_DONE"] == undefined)
		{
			output("You notice there’s a sizable lump in her kitpack. Curious, you ask her what’s inside of it.");
			output("\n\nSurprised by your interest, the amber-haired ant-girl pulls out an imposing dildo, a full eight inches of veiny goodness. It’s shaped just like a myr cock, but instead of being scarlet, it’s a mottled green from tip to base with the occasional splotch of chocolate brown.");
			output("\n\n<i>“...This? It’s standard issue for us girls in the trenches. I’ve spent many a happy night with the Private inside of me, both of us quivering away.”</i>");
			output("\n\nYou ask ");
			//if(DontKnowName) output("the ");
			output("[enemy.name] if she could use it on you. She blinks her big black eyes, clearly surprised by your request. At the same time, she gulps, and a delighted flush travels across her cheeks.");
			output("\n\n<i>“...Of course. I mean, I’m no stranger on using it on other" + pc.mf("s"," girls") + ",”</i> she smiles. The beautiful deserter gestures for you to lie back on the ground and you do so. She straddles your waist, sitting on top of you, and touches the toy against the tip of your nose.");
			output("\n\nThere’s a clicking noise. The synthetic wang begins to wizz against your sensitive nose. It’s shaped like a dildo, but it’s actually a vibrator? Two separate motors - one in the tip and another in the base - wildly whir.");
			output("\n\nDoes it look so thick because it’s right in front of your eyes, or is it <i>really</i>that big? A matching shiver courses through you, starting at your nose and ending at your [pc.toes].");
			flags["RED_MYR_DESERT_DILDO_DONE"] = 1;
		}
		//Else / Not First Time:
		else
		{
			output("You ask ");
			//if(DontKnowName) output("her ");
			output("[enemy.name] if she could use the Private on you. She shoots you a saucy grin, clearly happy with your request.");
			output("\n\n<i>“...Of course. Lie back and I’ll whip him out,”</i> she smiles. The beautiful deserter gestures for you to lie back on the ground and you do so. She straddles your waist, sitting on top of you, and touches it against the tip of your nose.");
			output("\n\nThere’s a clicking noise. The synthetic wang begins to wizz against your sensitive nose. The two separate motors - one in the tip and another in the base - wildly whir. A matching shiver courses through you, starting at your nose and ending at your [pc.toes].");
		}
	}
	output("\n\nShe runs it across the side of your cheek. The trembling tool pulses against your [pc.skinFurScales]. Gently, you part your [pc.lips], which are sensitively quaking from the point-blank pulsing. A breathy sigh escapes your lips and your heart begins to race.");
	output("\n\nWhere is she going to stick it? Your mouth, ");
	if(pc.hasVagina()) output("your pussy, ");
	output("or perhaps in your ass? You can’t wait to find out!");

	output("\n\nAs she runs it down your neck, a glorious shiver courses through your body, and you let out a loud, breathy moan. She presses it against your earlobe, your lips, your collarbone... it’s like a trembling wand. Everywhere it touches, magic sparks fly through your [pc.skinFurScalesNoun].");

	output("\n\n<i>“Oh, you like it-? Trust me, I’m getting </i>just<i> as much pleasure watching,”</i> ");
	if(DontKnowName) output("the battle-beauty");
	else output("[enemy.name]");
	output(" whispers. Running the throbbing tip against your cheek, you find yourself rising to rub against it like a cat, your eyes half-lidded from dizzy pleasure. Void, she hasn’t even stuck it in yet!");

	output("\n\nDesperate for further heights of pleasure, you meekly lift your [pc.hips] in the air.");
	if(pc.hasGenitals())
	{
		output(" Your ");
		//GotCock: 
		if(pc.hasCock())
		{
			output("[pc.cocks] ");
			if(pc.totalCocks() == 1) output("is");
			else output("are");
			output(" achingly hard");
			if(pc.hasVagina()) output(" and your ");
		}
		if(pc.hasVagina()) 
		{
			output("[pc.vaginas] ");
			if(pc.totalVaginas() == 1) output("is");
			else output("are");
			output(" glistening wet");
		}
		if(!pc.isCrotchExposed()) output(" under your " + (!pc.isCrotchExposedByLowerUndergarment() ? "[pc.lowerUndergarment]" : "[pc.armor]"));
		output(".");
	}
	var x:int = -1;
	if(pc.hasVagina()) x = rand(pc.totalVaginas());

	output("\n\n<i>“P-please... i-in my ");
	if(x >= 0) output("pussy");
	else output("ass");
	output(",”</i> you breathily beg. Every inch of your being aches for it inside of you, stirring up the inside of your ");
	if(x >= 0) output("snatch");
	else output("butt");
	output(".");

	output("\n\n");
	if(!(pc.armor is EmptySlot)) output("After stripping off your [pc.armor], she");
	else output("She");
	output(" presses the pulsing phallus against your ");
	if(!(pc.upperUndergarment is EmptySlot)) output("covered nipple, the vibrations deliciously traveling through your [pc.upperUndergarment].");
	else output("naked nipple.");
	output(" Your [pc.nippleColor] nub receptively stiffens.");

	output("\n\n");
	if(!(pc.upperUndergarment is EmptySlot)) 
	{
		output("<i>“Let’s get this out of the way, shall we-?”</i> ");
		if(DontKnowName) output(enemy.capitalA + enemy.short);
		else output("[enemy.name]");
		output(" whispers. She sensuously strips off your [pc.upperUndergarment] and");
	}
	else output("Taking advantage of your toplessness, the deserter sensuously");
	output(" kisses your [pc.chest]. Her soft lips tickle and brush your [pc.skinFurScales]. Your whole body prickles and feels ultra sensitive - every little touch feels deliciously electric and you tremble in delight. Is this the effect of her venom?");

	output("\n\nHer other hand slides down and out of sight. Between your [pc.thighs], ");
	//IfPcHasLowerUndergarment:
	if(!(pc.lowerUndergarment is EmptySlot)) output("she tugs at your [pc.lowerUndergarment]. The fabric rubs against your [pc.groin], ");
	else 
	{
		output("she strokes ");
		if(pc.hasCock()) output("[pc.oneCock]");
		else if(pc.hasVagina()) output("[pc.oneVagina]");
		else output("your bare loins");
		output(", ");
	}
	output("making you ");
	if(pc.hasCock()) output("even more hard");
	else if(pc.hasVagina()) output("even more wet wet");
	else output("getting you even more worked up");
	output(". You let out a low, breathy moan. Instinctively, you lift your hips and grind against her hand, enthusiastically meeting her efforts.");
	
	//GotLowerUndergarment: 
	if(!(pc.lowerUndergarment is EmptySlot))
	{
		if(inCombat() && (pc.HP() <= 0 || pc.lust() >= pc.lustMax())) output(" No longer caring about your loss, you aid her as she");
		else output(" She");
		output(" strips off your ");
		if(x >= 0) output("damp ");
		output("[pc.lowerUndergarment] and tosses the offending garment aside. Afterwards, you");
	}
	else output("You ");
	output(" strip off her torn uniform, exposing the beautiful, scarlet-skinned body beneath. Her well rounded breasts are enough to make you gulp, not to mention her hard, puckered nipples.");

	output("\n\nYou " + pc.mf("teasingly","cutely") + " lick one of her dark buds. She lets out a husky moan and presses her pert breasts against your face and lips. You suckle and nibble on it, relishing in her naked body trembling against your [pc.skinFurScalesNoun], and her moist pussy rubbing against your [pc.thigh].");

	output("\n\n<i>“Turn around and bend over,”</i> the naked deserter breathily orders you, her cheeks flushed with arousal. You obediently flip around and get on your hands and knees, raising your [pc.ass]");
	if(pc.tailCount > 0) output(" and [pc.tail]");
	output(". Already, your ");
	if(pc.hasCock())
	{
		output("[pc.cocks] ");
		if(pc.cockTotal() == 1) output("is");
		else output("are");
		output(" pressing firmly against your [pc.belly] and dripping with pre-cum");
		if(x >= 0) output(", while your ");
	}
	if(x >= 0) 
	{
		output("[pc.vaginas] ");
		if(pc.totalVaginas() == 1) output("is");
		else output("are");
		output(" sopping wet.");
	}
	if(!pc.hasGenitals()) 
	{
		if(pc.legCount == 1) output("[pc.leg] is");
		else output("[pc.legs] are");
		output(" quivering with delight.");
	}

	output("\n\nDragging the Private up your [pc.thigh], she drags it up to your ");
	if(x >= 0) output("[pc.pussy " + x + "]");
	else output("[pc.ass]");
	output(". You moan as she drags the trembling tip around your needy hole, teasing your ");
	if(x >= 0) output("slick lower lips");
	else output("rim");
	output(". Pressing forward, she slowly sinks it inside of you. You moan as you’re filled up inch by glorious quivering inch, trembling in tandem.");

	output("\n\nYou can feel it rumbling against ");
	if(x >= 0) output("your cervix");
	else output("the deepest part of your rectum");
	output(" and you let out a carnal cry, bucking backwards against it. ");
	if(DontKnowName) output(enemy.capitalA + enemy.short);
	else output("[enemy.name]");
	output(" pulls back, then plunges it deep into your ");
	if(x >= 0) output("sloppy snatch");
	else output("forbidden hole");
	output(". An explosion of pleasure seizes your senses. Void, that feels so good! You arch your back in delight, panting like a dog, as drool drips down your chin. Animalistic delight seizes you, and soon you’re a slave to instinct, slapping your [pc.ass] back against her hand.");

	if(x >= 0) pc.cuntChange(x,300,true,true,false);
	else pc.buttChange(300);

	output("\n\nIt’s not long at all before you reach that euphoric peak. As she stirs the Private around inside of your [pc.vagOrAss " + x + "] and strains it against your ");
	if(x >= 0) output("slippery");
	else output("narrow");
	output(" walls, your world becomes searing white. You shake spastically and let out a loud, howling cry");
	if(pc.hasCock()) output(", shooting your hot, [pc.cumVisc] spunk all over your [pc.belly]");
	if(pc.hasCock() && pc.hasVagina()) output(" and ");
	if(pc.hasVagina()) 
	{
		if(pc.wetness(x) <= 4) output("squirting");
		else output("gushing");
		output(" your warm, [pc.girlCumVisc] [pc.girlCumNoun] all over her hand");
	}
	output(".");

	output("\n\nExhausted, you fall face first with your [pc.ass] high in the air, the camo-cock still wobbling away inside of your [pc.vagOrAss " + x + "]. With each spasmic aftershock, you lightly wring each artificial vein and crevasse. Your mind has melted into a puddle of pure pleasure.");

	output("\n\nDimly, you’re aware of light kisses being rained down on your [pc.ass]. When the Private is pulled from your [pc.vagOrAss " + x + "] with a sloppy, loud noise, you let out a delirious moan. In its place, licks are lavished upon your gaping hole. You shiver with delight - you’re still extremely sensitive right now. A second, lighter orgasm suddenly seizes you, and ");
	if(x >= 0)
	{
		if(pc.isSquirter()) output("you squirt all over her face");
		else output("you dribble your girl juice all over her face");
	}
	else if(pc.hasCock()) output("you shoot another lazy stream of [pc.cum] on the ground");
	else output("your eyes flutter and roll back into your head");
	output(".");

	//PC Loss:
	if(inCombat() && (pc.HP() <= 0 || pc.lust() >= pc.lustMax()))
	{
		output("\n\nSome time later, when you finally come to, you realize ");
		//if(DontKnowName) output("the ");
		output("[enemy.name] has already taken her leave. Shivering, you realize you’re covered in hickies.");
		if(pc.credits > 1)
		{
			output(" Not only that, you’ve lost some of your credits!");
			pc.credits -= 100+rand(100);
			if(pc.credits < 0) pc.credits = 0;
		}
		output("\n\nGrumbling a little - but not too much - you put back on your [pc.gear]. Thankfully, your ");
		if(pc.physique() >= pc.aim()) output("[pc.meleeWeapon]");
		else output("[pc.rangedWeapon]");
		output(" is not too far off. It seems she didn’t steal <i>everything</i> you owned.");
	}
	//PC Win/Consent:
	else
	{
		output("\n\nSome time later, when you come to, you find ");
		//if(DontKnowName) output("the ");
		output("[enemy.name] nestled against your side. She looks up at you with one big, black eye and the other scarred one, peering through her messed up amber hair. Lightly, she grasps at your chest, nails teasing your [pc.skinFurScales].");
		output("\n\n<i>“S-so, that was fun,”</i> she breathily states. You’re acutely aware of her pert, naked breasts pressing up against you. <i>“...Um, I guess I should get going? Hopefully I’ll see you around...”</i>");
		output("\n\n");
		if(enemy.isPregnant()) output("The pregnant myr");
		else output("She");
		output(" kisses you on the cheek. You slightly swoon from her intoxicating venom, your eyelids fluttering. By the time you come down from your high, ");
		if(DontKnowName) output("the deserter has");
		else output("Briha has");
		output(" already slipped off.");
	}
	myrDeserterEpilogueShitTracker();
	output("\n\n");
	processTime(90+rand(10));
	pc.orgasm();
	pc.orgasm();
	postMyrCoitusPantyFapShit(false);
	if(inCombat()) 
	{
		if(!loss) CombatManager.genericVictory();
		else CombatManager.genericLoss();
	}
	else
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Sit & Screw (Gold)
// Two variants - PC loss and PC Win/Consent version. For Gold Only.
// Also a variant for the first time you get this scene, either loss or win, where she introduces the strap on.
public function sitAndScrewGoldMyr():void
{
	clearOutput();
	author("Jim Thermic");
	if(!inCombat())
	{
		setEnemy(new MyrGoldFemaleDeserter());
	}
	showDeserter(true,true);
	var DontKnowName:Boolean = (enemy.short != "Lys" && enemy.short != "Briha");
	//IF PC LOSS:
	var combatLoss:Boolean = (inCombat() && (pc.HP() <= 0 || pc.lust() >= pc.lustMax()));
	var useStrapon:Boolean = true;
	
	//PC Loss:
	if(combatLoss)
	{
		output("While you lie on the ground, the buxom beauty begins to slowly strip of her torn battle garb. It’s not long before you’re staring longingly at her honey-hued skin and ring-pierced nipples. Despite yourself, ");
		if(pc.hasCock()) 
		{
			output("your [pc.cocks] stiffen");
			if(pc.cockTotal() == 1) output("s");
			if(pc.hasVagina()) output(" and ");
		}
		if(pc.hasVagina() || !pc.hasCock()) output("you feel a delicious tingling sensation deep in your loins");
		output(".");
		if(!pc.hasCock() && hasGoldDildo())
		{
			output("\n\nExulting in her power, the myr searches through your stuff, though ultimately, she’s only interested in her fat strap-on. She reclaims it with a flourish.");
		}

		output("\n\nStriding up to you, ");
		//if(DontKnowName) output("the ");
		output("[enemy.name] brushes one of her bare feet against ");
		if(pc.hasCock()) output("the underside of [pc.oneCock]");
		else if(pc.hasVagina()) output("[pc.oneVagina]");
		else output("your loins");

		//GotArmorOrLowerGarment:
		if(pc.isCrotchGarbed()) 
		{
			output(", teasing you through your [pc.lowerGarments]");
		}
		output(".");

		//PC GotCock:
		if(pc.hasCock())
		{
			output("\n\n<i>“Mmm, I think I’m going to borrow </i>this<i> for a while,”</i> the naked deserter sultrily purrs, <i>“...You don’t mind, right?”</i>");
			output("\n\nRegardless of your answer, the busty battle-maiden strips off your [pc.gear]. You’re left lying there with your aching [pc.cocksLight] brazenly exposed. Despite your embarassment - or perhaps because of it - your [pc.cockHeads] swell");
			if(pc.cockTotal() == 1) output("s");
			output(" with arousal.");
			useStrapon = false;
		}
		//Else PC GotNoCock:
		else
		{
			output("\n\n<i>“Mmm, you’re lacking a little something-something here,”</i> the naked deserter sultrily purrs, <i>“...Thankfully, ");
			if(hasGoldDildo()) output("you’ve brought back");
			else output("I’ve got just");
			output(" the thing to fix that.”</i>");
			output("\n\nFirst, the busty battle-maiden strips off your [pc.gear]. After this, she ");
			if(hasGoldDildo()) {
				output("waggles the strap-on she just reclaimed - ten-plus inches of low-hanging fruit with an extra berry on the back for the wearer’s pleasure.");
				removeGoldDildo();
			}
			else output("reaches into her kitpack. Out comes a rather impressive looking strap on - ten inches of golden veiny goodness. There’s another, smaller protrusion on the other side, designed to stimulate the wearer. It’s double-ended!");
			output("\n\n<i>“We trench girls have got to help each other out. This little beauty is no fun on your own, you know? That’s where you come in,”</i> the raven-haired soldier explains, <i>“...");
			if(pc.hasVagina()) output("How about both of us have a good time?");
			else output("I’ll have to remove the other end though. Sorry hon!”</i>");
		}
		//NeuterPC:
		if(!pc.hasGenitals()) output("\n\nShe quickly unfastens the inner dildo and tosses it aside. You flush with embarrassment. So, you’re going to be ridden like a living sex-doll?");
	}
	//Else PC Win/Consent:
	else
	{
		if((pc.isHerm() && rand(2) == 0) || pc.isMale()) useStrapon = false;
		
		if(!useStrapon)
		{
			output("You ask the buxom beauty if she’ll hop on your cock and take it for a ride.");
		}
		//First Time Seeing Dildo Screw Scene:
		else if(flags["DILDO_SCREW_SCENE_SEEN"] == undefined)
		{
			output("You notice there’s a sizable lump in ");
			//if(DontKnowName) output("the ");
			output("[enemy.name] kitpack. Curious, you ask her what’s inside of it.");

			output("\n\nThe raven-haired ant girl blushes and pulls out a strap-on dildo. It’s pretty impressive - ten inches of veiny goodness - and the same hue as a gold myr’s cock.");

			output("\n\n<i>“...This? The Gilden Republic issues this to all the girls on the front line. We’ve got to use it on each other, mind you, since we can’t easily play with ourselves.”</i>");

			output("\n\nYou notice there’s another, smaller protrusion on the other side, designed to stimulate the wearer. It’s double-ended!");
			if(pc.hasVagina()) output(" You ask her if you can use it on her.");
			else output(" You ask her if it can be removed so you can use it on her.");
		}
		//Else / Not First Time Seeing Scene:
		else
		{
			output("Knowing that ");
			//if(DontKnowName) output("the ");
			output("[enemy.name] has a double-ended dildo in her knapsack, you ask her if you can use it with her.");
		}
		output("\n\nShe blinks her big black eyes, clearly surprised by your request. At the same time, she gulps, and a delighted flush travels across her cheeks.");

		output("\n\n<i>“O-of course!");
		if(flags["DILDO_SCREW_SCENE_SEEN"] == undefined && useStrapon) output(" I mean, I haven’t had anyone to use it with for a while,");
		output("”</i> she breathily answers. <i>“Take off your things and lie down - I promise you won’t regret it.”</i>");

		output("\n\nYou do as she asks, stripping off your [pc.gear] and lying back. As you watch on, the buxom beauty begins to slowly strip of her torn battle garb. It’s not long before you’re staring longingly at her honey-hued skin and ring-pierced nipples. Despite yourself, ");
		if(pc.hasCock()) 
		{
			output("your [pc.cocks] stiffen");
			if(pc.cockTotal() == 1) output("s");
			if(pc.hasVagina()) output(" and ");
		}
		if(pc.hasVagina() || !pc.hasCock()) output("you feel a delicious tingling sensation deep in your loins");
		output(".");
		if(!pc.hasGenitals()) output(" Meanwhile, she quickly unfastens the inner dildo and tosses it aside.");
	}
	//PC Has No Cock:
	if(useStrapon)
	{
		output("\n\nYou lustily gaze at her pendulous breasts and ring-pierced nipples as she slides the strap-on into place.");
		if(pc.hasVagina()) output(" A moan escapes your lips as your end slides gently into [pc.onePussy].");
		output(" The female deserter smiles and makes sure the straps are done tight, until they’re well and truly hugging your [pc.hips].");
	}
	output("\n\n<i>“Head against the ground,”</i> the buxom beauty requests. As you do so, she stands above your head. Lowering herself down to her knees, she squats over your face. Her bare loins are thrust against your face and she squeezes her ample thighs against your cheeks. You’re pinned down!");
	output("\n\nDown below, you feel ");
	if(!useStrapon) output("[pc.oneCock]");
	else output("your strap-on cock");
	output(" being rubbed against with her ovipositor pussy. Since her abdomen stretches so far, it’s nothing for the ant-girl to face-sit on you while riding you with the pussy on her alien hindquarters.");

	output("\n\n<i>“I like this position - I can look down into your eyes as we fuck,”</i> ");
	//if(DontKnowName) output("the ");
	output("[enemy.name] giggles, touching your [pc.hair] with her fingers.");

	output("\n\nThe feeling is mutual - looking up from between her thighs, your world is filled with her massive mammaries and the golden hoops piercing her puckered nips. It’s a truly exquisite sight!");

	var x:int = 0;
	if(!useStrapon) 
	{
		x = pc.cockThatFits(enemy.vaginalCapacity(0));
		if(x < 0) x = pc.smallestCockIndex();
	}
	if(pc.hasGenitals())
	{
		output("\n\nAt the same time, her dripping lower lips are gently teasing your ");
		if(!useStrapon) output("[pc.cockHead " + x + "].");
		else output("fake cock-head and stirring up your own pussy in the process.");
		output(" You moan as she lowers herself onto your shaft, swallowing it whole inside her sopping wet honeypot.");

		output("\n\n<i>“Ooohh queens!”</i> The nipple-pierced deserter moans. Your ");
		if(!useStrapon) output("[pc.cockHead " + x + "] penetrates her until it’s lightly brushing against her cervix.");
		else output("gilded cock is soon fully sheathed inside of her and her waist is pressed against your own.");
		output(" Slowly, she begins to gyrate on top of you, all the while squeezing and wringing your ");
		if(!useStrapon) output("sensitive");
		else output("synthetic");
		output(" shaft. At the same time, her hands rest on your [pc.hair] and her jiggling thighs needily clutch your cheeks.");
	}
	//PC GotCock:
	if(!useStrapon)
	{
		pc.cockChange();
		output("\n\nYou groan in delight as you watch her grind against you. Her bountiful breasts and nipple-rings bounce and sway before your eyes. Deep inside of her, your [pc.cockHead " + x + "] swells and twitches, and pearls of pre-cum dribble inside of her hot, narrow tunnel. The whole thing is insanely erotic, and you’re not sure how long you can hold out before you’ll be blasting and filling her honey hole with your [pc.cum].");
	}
	//Else if PC Got Pussy:
	else if(pc.hasVagina())
	{
		output("\n\nYou let out a muffled moan as you watch her grind against you. Her bountiful breasts and nipple-rings bounce and sway before your eyes. She’s literally stirring you both up as she gyrates her hips, rubbing the inside of the artificial cock around your inner walls.");
		output("\n\nThe whole thing is insanely erotic, and you’re not sure how long you can hold out before you’ll be creaming yourself around your end of the double dildo. Your thighs tremble with pent-up pleasure as your narrow walls are caressed, the sound of her lewd moans and pressing hips fanning the wet heat between your loins.");
	}
	//else PC Neuter:
	else
	{
		output("\n\nYou let out a muffled moan as you watch her grind against you. Her bountiful breasts and nipple-rings bounce and sway before your eyes. The whole thing is insanely erotic, and you’re not sure how long you can hold out before you’ll be creaming yourself just listening to the sound of her lewd moans and feeling of her grinding insistently against you.");
	}
	output("\n\nAs you reach climax, a trembling intensity seizes your body. With a choked gasp, you thrust upwards with your [pc.hips]. Your cock-head presses right against ");
	//if(DontKnowName) output("the ");
	output("[enemy.name]’s deepest depths. Quivering and shaking, you wrap your arms around her thick thighs. You can’t hold out any longer - you’re going to cum!");

	//GotCock:
	if(!useStrapon)
	{
		output("\n\nIn a gooey gush, you spurt your [pc.cum] deep inside of the female deserter, letting your sperm ");
		if(pc.cumQ() < 10) output("trickle");
		else output("surge");
		output(" up into her barren womb. As you climax, the nipple-pierced alieness also reaches her peak, crying out and cumming hard around your [pc.cock " + x + "]. She spasmically squeezes and wrings your dick for every last drop, her trembling thighs clenching your cheeks.");
	}
	//Else NoCock:
	else
	{
		output("\n\nYou both reach your peak at the same time, ");
		if(pc.hasVagina()) output("both of your pussies clenching the shared length and dribbling your girl juice sloppily against each other.");
		else output("her pussy twitches against you and she spurts and bastes you in her gooey girl juice.");
		output(" Grinding in your shared spasmic throes, you both twitch and moan. As you cling to her legs, they cling to your cheeks, both of you clutching each other as you cum<i>long</i> and <i>hard</i>.");
	}

	//PC Loss:
	if(combatLoss)
	{
		output("\n\nAfter you’re both finished, ");
		//if(DontKnowName) output("the ");
		output("[enemy.name] pulls herself off you. Her slick juices dribble all over your waist and you let out a pleasured sigh. After giving you a single kiss on the lips, she pulls the strap-on off your exhausted body, and stashes it back in her kitpack.");

		output("\n\n<i>“I’d love to linger, but I really must get going,”</i> she informs you, an inflection of regret in her voice. However, after she’s done dressing, you’re pinned down once more");
		if(pc.credits >= 2) output(" as she steals some of your credits - and you’re too spent to resist!");
		else output(" as she searches you for credits - and you’re too spent to resist!");
		output("\n\n<i>“Don’t take it personally, hon. A girl’s got to eat, especially when she’s gone AWOL,”</i> ");
		if(pc.credits < 2) output("she sighs, coming up empty.");
		else 
		{
			output("she smiles and tucks the credits into her shirt. Thankfully, she leaves you with your things, slipping away without so much as touching your Codex.");
			pc.credits -= 100+rand(100);
			if(pc.credits < 0) pc.credits = 0;
		}
	}
	//PC Win:
	else
	{
		output("\n\nAfter you’re both finished, ");
		//if(DontKnowName) output("the ");
		output("[enemy.name] pulls herself off you and rests against your chest. The pressing of her large, warm breasts, mixed with the cold contrast of her nipple rings, is incredibly pleasant. At the same time, ");
		if(!useStrapon) output("your [pc.cum] runs down her thighs and drips onto your [pc.legOrLegs].");
		else output("her girl cum dribbles down her legs and onto your [pc.skinFurScales].");

		output("\n\n<i>“Mmm... that was wonderful,”</i> she dreamily murmurs. Some of her arms wrap around your waist, while the others stroke your cheeks. <i>“It can get lonely out here in the middle of nowhere. Hopefully I’ll see you around...”</i>");
		output("\n\nOnce she’s done cuddling, she pulls herself off you, and you both get dressed. With one last kiss, she slips away into the night. As enjoyable a victory as that was, it’s probably time to move on.");
	}
	if(useStrapon) flags["DILDO_SCREW_SCENE_SEEN"] = 1;
	output("\n\n");
	myrDeserterEpilogueShitTracker();
	processTime(33);
	pc.orgasm();
	if(!combatLoss) postMyrCoitusPantyFapShit(true);
	if(combatLoss) CombatManager.genericLoss();
	else if(inCombat()) CombatManager.genericVictory();
	else
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

public function knockUpRedBitchChance():void
{
	if(enemy is MyrRedFemaleDeserter && !enemy.isPregnant())
	{
		/*
		var bonusChance:int = (pc.cumQ()/ 50) + 10;
		if(bonusChance > 25) bonusChance = 25;
		bonusChance *= pc.virility();
		if(bonusChance > 75) bonusChance = 75;

		if(rand(100) + 1 <= bonusChance)
		{
			//Track hair/eye color for first shitbabies.
			if(flags["RED_MYR_BIRTHS"] == undefined) flags["BRIHA_SPAWN_1_DEETS"] = [pc.hairColor,pc.eyeColor];
			else if(flags["RED_MYR_BIRTHS"] == 1) flags["BRIHA_SPAWN_2_DEETS"] = [pc.hairColor,pc.eyeColor];
			//Set incubation timer
			flags["BRIHA_INCUBATION_TIMER"] = 0;
			pc.clearRut();
			trace("RED MYR KNOCKED UP!");
		}
		*/
		
		if(chars["PC"].virility() <= 0 || chars["RED_DESERTER"].fertility() <= 0) return;
		var x:Number = (chars["PC"].virility() + chars["RED_DESERTER"].fertility())/2;
		var score:Number = (1 - Math.exp(-0.38*x))*10000;
		
		if(rand(10000) <= score)
		{
			var traitChar:Creature = ((chars["PC_BABY"].eyeColor != "NOT SET" && chars["PC_BABY"].hairColor != "NOT SET") ? chars["PC_BABY"] : chars["PC"]);
			
			//Track hair/eye color for first shitbabies.
			if(flags["RED_MYR_BIRTHS"] == undefined) flags["BRIHA_SPAWN_1_DEETS"] = [traitChar.hairColor, traitChar.eyeColor];
			else if(flags["RED_MYR_BIRTHS"] == 1) flags["BRIHA_SPAWN_2_DEETS"] = [traitChar.hairColor, traitChar.eyeColor];
			//Set incubation timer
			flags["BRIHA_INCUBATION_TIMER"] = 0;
			pc.clearRut();
			trace("RED MYR KNOCKED UP!");
		}
	}
}

public function myrDeserterEpilogueShitTracker():void
{
	if(inCombat())
	{
		//WON!
		if(pc.HP() > 0 && pc.lust() < pc.lustMax())
		{
			if(enemy is MyrRedFemaleDeserter)
			{
				if(flags["RED_MYR_DESERTER_BEATEN"] == undefined) flags["RED_MYR_DESERTER_BEATEN"] = 0;
				flags["RED_MYR_DESERTER_BEATEN"]++;
			}
			else 
			{
				if(flags["GOLD_MYR_DESERTER_BEATEN"] == undefined) flags["GOLD_MYR_DESERTER_BEATEN"] = 0;
				flags["GOLD_MYR_DESERTER_BEATEN"]++;
			}
		}
		//LOST
		else
		{
			if(enemy is MyrRedFemaleDeserter)
			{
				if(flags["RED_MYR_DESERTER_BEATEN"] == undefined) flags["RED_MYR_DESERTER_BEATEN"] = 0;
				flags["RED_MYR_DESERTER_BEATEN"]--;
				if(flags["RED_MYR_DESERTER_BEATEN"] < 0) flags["RED_MYR_DESERTER_BEATEN"] = 0;
			}
			else 
			{
				if(flags["GOLD_MYR_DESERTER_BEATEN"] == undefined) flags["GOLD_MYR_DESERTER_BEATEN"] = 0;
				flags["GOLD_MYR_DESERTER_BEATEN"]--;
				if(flags["GOLD_MYR_DESERTER_BEATEN"] < 0) flags["GOLD_MYR_DESERTER_BEATEN"] = 0;
			}
		}
	}
}

public function postMyrCoitusPantyFapShit(forceGold:Boolean = false):void
{
	if(forceGold) 
	{
		if(flags["KNOW_GOLD_MYR_NAME"] != undefined && flags["LYS_PANTY_OFFER"] == undefined) eventQueue.push(lysPantyCollect);
	}
	else 
	{
		if(flags["KNOW_RED_MYR_NAME"] != undefined && flags["BRIHA_PANTY_OFFER"] == undefined) eventQueue.push(brihaPantyCollect);
	}
}

//Briha / Red Myr Deserter
// If PC is having sex with her and they know Briha's name, this scene occurs directly after a sex scene. One time event.
public function brihaPantyCollect():void
{
	clearOutput();
	showName("\nPANTIES");
	author("ASpoopyGhost");
	flags["BRIHA_PANTY_OFFER"] = 1;
	output("Hang on a second.... You look down on the ground and notice there’s a piece of fabric on the ground. Leaning down and picking it up, you realize they’re Briha’s panties. Did she leave them behind? They’re pretty standard issue for a military girl; camo t-backs, with a notably wet crotch.");

	//[Take] [Leave]
	clearMenu();
	addButton(0,"Take",takeBrihasPanties,undefined,"Take","Pick those panties up and keep ‘em - they’re spoils of war!");
	addButton(1,"Don’t",dontTakeBrihasPanties,undefined,"Don’t","Leave them where they are. Gross.");
}

//Take
public function takeBrihasPanties():void
{
	clearOutput();
	showName("\nPANTIES");
	author("ASpoopyGhost");
	output("You pocket Briha’s panties. Either the female soldier forgot, left them as a gift, or really doesn’t mind just walking around commando.");
	output("\n\n<b>You have obtained Briha’s panties!</b>");
	pc.createKeyItem("Panties - Briha's - Nylon, camo-print T-back panties.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Leave
public function dontTakeBrihasPanties():void
{
	clearOutput();
	showName("\nPANTIES");
	author("ASpoopyGhost");
	output("You leave Briha’s panties alone, deciding not to take them.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//("Panties - Lys's - Sheer black panties.")
//Lys / Gold Myr Deserter
// If PC is having sex with her and they know Lys's name, this scene occurs directly after a sex scene. One time event.
public function lysPantyCollect():void
{
	clearOutput();
	author("ASpoopyGhost");
	showName("\nPANTIES");
	flags["LYS_PANTY_OFFER"] = 1;
	output("Hang on a second. You look down on the ground and notice there’s a piece of fabric on the ground. Leaning down and picking it up, you realize they’re Lys’s panties. Did she leave them behind? The black sheer panties are rather alluring and definitely not military issue. You notice they’ve got a noticeably wet crotch.");
	//[Take] [Leave]
	clearMenu();
	addButton(0,"Take",takeLysPanties,undefined,"Take","Pick those panties up and keep ‘em - they’re spoils of war!");
	addButton(1,"Don’t",dontTakeLysPanties,undefined,"Don’t","Leave them where they are. Gross.");
}

public function takeLysPanties():void
{
	clearOutput();
	showName("\nPANTIES");
	author("ASpoopyGhost");
	output("You pocket Lys’s panties. Either the female soldier forgot, left them as a gift, or really doesn’t mind just walking around commando.");
	output("\n\n<b>You have obtained Lys’s panties!</b>");
	// Scene End.
	pc.createKeyItem("Panties - Lys's - Sheer black panties.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Leave
public function dontTakeLysPanties():void
{
	clearOutput();
	author("ASpoopyGhost");
	showName("\nPANTIES");
	output("You leave Lys’s panties alone, deciding not to take them.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function giveDildoToAntSloot(gold:Boolean):void
{
	clearOutput();
	showDeserter(gold,false);
	author("Zeikfried");
	//Give Dildo - all new sub-scene to return dildo voluntarily
	//found in the non-hostile, non-pregnant approaches; PC returns the dildo as requested
	//tooltip: Give the {dirty }sex toy back to the myr{ and let her know that you used it}.
	
	//CUT ORIGINAL Z DIALOGUE AND REPLACED WITH OPTIONS THAT AREN'T JUST THE PC BEING A GIGANTIC CUNT
	// {(nice)Smiling/(misch)With a stare rife with implications/(mean)Grunting}, you pull out the dildo and drop it at her feet. {PC used it)"By the way, I got some use out of it," you say, as she picks it up.}
	output("You pass the dildo back to its proper owner.");
	if(pc.isBimbo()) output(" <i>“It’s a super nice toy!”</i>");
	else if(pc.isNice()) output(" <i>“It seems only fitting I return your property.”</i>");
	else if(pc.isMischievous()) output(" <i>“I was getting tired of lugging this thing around everywhere.”</i>");
	else output(" <i>“I kept it warm for you.”</i>");

	//(PC didn't use it)
	if(!gold) output("\n\nThe myr smiles. <i>“Want to spend some time with me, then?”</i>");
	else output("\n\nLys smiles shyly. <i>“Well, okay then... want to talk?”</i>");
	//present usual non-hostile menu, minus the 'Fight' button
	//menu shit here
	if(gold) removeGoldDildo();
	else removeRedDildo();
	myrDeserterNonCombatMenu(gold);
}

//Steal Dildo - new scene for either myr
//steal the dildo (or use the stolen one on her), with or without orgasm denial
//avail. in both myr's sex menus, combat-agnostic, but requires PC having seen 'Dildo Screw' (if with Briha) or 'Sit & Screw' (if with Lys), else button is hidden (not disabled)
//adds PC lust at the end so PC can possibly masturbate with dildo right away
//should add misch points
//tooltip: Distract the myr with orgasm and then abscond with her sex toy{(repeat) again}. Or you could stop just before orgasm....

public function stealDildoScene(gold:Boolean):void
{
	clearOutput();
	showDeserter(gold,true);
	author("Zeikfried");
	var combatWin:Boolean = (inCombat() && (pc.HP() > 0 && pc.lust() < pc.lustMax()));
	var knows:Boolean = false;
	if(gold && flags["KNOW_GOLD_MYR_NAME"] != undefined) knows = true;
	if(!gold && flags["KNOW_RED_MYR_NAME"] != undefined) knows = true;

	//if first time for the given myr
	if((flags["GOLD_DILDOED"] == undefined && gold) || (flags["RED_DILDOED"] == undefined && !gold))
	{
		if(pc.isBimbo()) 
		{
			output("<i>“Let me play with your weenie,”</i> you say plainly.");
			output("\n\n<i>“My... weenie? You mean, this?”</i> The myr pulls the ");
			if(!gold) output("eight-inch vibrating dildo");
			else output("ten-plus-inch strap-on");
			output(" from her kit.");
		}
		else if(pc.isBro())
		{
			output("<i>“Hey. Lemme see your dildo,”</i> you grunt.");
			output("\n\nThe myr pulls it out - ");
			if(!gold) output("eight");
			else output("ten-plus");
			output(" inches of well-used plastic love.");
		}
		else if(pc.isNice())
		{
			output("<i>“I have an idea,”</i> you begin. <i>“But I want to use your sex toy, please.”</i>");
			if(!gold) output("\n\n<i>“The Private? ");
			else output("\n\n<i>“My strap-on? ");
			output("Sure,”</i> the myr says, pulling it from her kit bag.");
		}
		else if(pc.isMischievous()) 
		{
			output("<i>“Get your dick out,”</i> you order, staring at the myr and smiling.");
			output("\n\nShe takes a moment to understand, but blushes and reveals the ");
			if(!gold) output("vibrator");
			else output("strap-on");
			output(" concealed badly within her kit.");
		}
		else
		{
			output("<i>“Get out your dildo,”</i> you bark. <i>“Give it to me.”</i>");
			output("\n\nThe myr obeys, producing the ");
			if(!gold) output("vibrator");
			else output("strap-on");
			output(" and holding it out to you.");
		}
	}
	//repeat, PC does not have this myr’s dildo
	else if((gold && !hasGoldDildo()) || (!gold && !hasRedDildo()))
	{
		output("You smile and point right at the myr’s kit bag. She follows the line of your finger, slumps her shoulders, and then produces the ");
		if(!gold) output("camo-patterned");
		else output("golden");
		output(" marital aid.");
		output("\n\n<i>“You’re going to steal it again, aren’t you?”</i> she asks, when you motion her to hand it over.");

		if(pc.isBimbo() || pc.isNice())
		{
			output("\n\n<i>“Yup,”</i> you chirp.");
		}
		else output("\n\n<i>“Damn right,”</i> you assure her.");
		//(post-combat only)
		if(combatWin) output(" <i>“Them’s the rules around here.”</i>");
		else output("\n\n<i>“...Fine. Only because I kinda like you.”</i>");
	}
	//repeat, PC already has this myr’s dildo
	else
	{
		output("The myr’s ");
		if(!gold) output("vibrator");
		else output("strap-on");
		output(" appears from your own stowage.");

		if(!gold)
		{
			output("\n\n<i>“The Private!”</i> ");
			if(knows) output("Briha");
			else output("she");
			output(" says, affectionately.");
		}
		else 
		{
			output("\n\n<i>“My dildo!”</i> ");
			if(knows) output("Lys");
			else output("she");
			output(" blurts. <i>“You brought it back!”</i>");
		}
		if(pc.isBimbo()) output("\n\n<i>“I thought I’d stick this in your cute little kitty again,”</i> you purr.");
		else if(pc.isBro()) output("\n\n<i>“Can’t get enough of watchin’ you squirm,”</i> you grunt.");
		else output("\n\n<i>“I enjoyed this last time,”</i> you note. <i>“So we’re going again.”</i>");
		output("\n\n<i>“Are you going to give it back afterward?”</i> the alien woman asks. You grin and don’t answer.");
	}
	//red myr branch if Briha
	if(!gold)
	{
		//(PC doesn’t have red dildo)
		if(!hasRedDildo()) output("\n\nBefore she can pull back, you take the proffered vibrator and ");
		else output("\n\nCurtly, you ");
		output("order her to undress. ");
		if(knows) output("Briha");
		else output("The myr");
		output(" unbuttons her tattered uniform, teasing you with a glimpse of her modest bust");
		if(!pc.isAss()) output(", but you gesture for her to get on with it");
		output(". Her breasts spill from her top and she moves on to her pants and panties, sliding them down with a shimmy.");

		output("\n\nMeanwhile, you examine the vibrator. The power switch is easily found - it even has adjustable settings. ");
		if(!knows) output("Briha");
		else output("The red myr");
		output(" flinches when you crank it so high that it sounds like a tiny jackhammer, looking like she wishes you hadn’t. Either she’s a sexual lightweight, or she keeps it on low for another reason. Perhaps batteries are hard to come by out here? You readjust the setting and look up. Your lover-slash-victim is standing naked at attention, with proud little upright nipples.");
		output("\n\n<i>“Sit and spread,”</i> you instruct.");
		output("\n\n");
		if(knows) output("Briha");
		else output("The myr");
		output(" flushes, but complies. Planting her rosy tush in the dirt, she creeps her thighs apart, teasing you with a slim red slit that blooms as they open. ");
		//(post-combat and lust win)
		if(combatWin) output("It’s already glistening with lubrication from your infernal teasing. ");
		output("You crank the vibrator up and down again, causing it to wobble each time she exposes more of herself, like it’s excited. ");
		if(knows) output("Briha");
		else output("The woman");
		output(" tries to suppress her laughter, but ultimately fails.");

		output("\n\nWhen you’ve disarmed the girl, you turn the toy back to low one last time and advance. <i>“");
		if(pc.isNice())
		{
			output("Play with your ");
			if(pc.isBimbo()) output("titties");
			else output("breasts");
			if(!pc.isBro()) output(", but nothing else, please");
			output(",”</i> you instruct her.");
		}
		else
		{
			output("You may only touch yourself above the waist,”</i> you say, voice rich and dark as black satin.");
		}
		output(" Your partner blinks once, then smiles and raises her hands to her breasts. You slip the vibrator through her labia, sending a quake, and then another, up the poor girl’s frame. The tip coaxes her little red clitoris from its hood; it emerges within seconds of the faux-shaft’s petition, but you hold off.");
		output("\n\nInstead, you lower the whirring head to the urethra and the nerve-laden pussy entrance. ");
		if(knows) output("Briha");
		else output("Your lover");
		output(" squirms when you nestle the toy in her vagina; her hips start to pump, trying to get the toy inside so she can feel the wonderful sensation of being filled, but you don’t allow it. You ring her opening indolently, watching her pinch and tweak her nipples with eyes shut tight, the very picture of female arousal. The pornographic display stirs your blood");
		if(!pc.lowerUndergarment.shortName != "" && pc.hasGenitals())
		{
			output(", causing your [pc.lowerUndergarment] to grow ");
			if(pc.hasCock()) output("tight");
			if(pc.isHerm()) output(" and ");
			if(pc.hasVagina()) output("wet");
			output(".");
		}
		else if(pc.hasGenitals())
		{
			output(", bringing your ");
			if(pc.hasCock()) output("[pc.cocksLight] to erectness");
			if(pc.isHerm()) output(" and ");
			if(pc.hasVagina()) 
			{
				output("your vagina");
				if(pc.totalVaginas() > 1) output("s");
				output(" a blush of darker color");
			}
			output(".");
		}
		else output(".");

		output("\n\n<i>“C-come on,”</i> she shivers, <i>“put it in...”</i>");
		
		output("\n\nYou withdraw instead and move the vibrating tip under her clitoris, pressing up to expose it as much as possible. ");
		if(knows) output("Briha’s");
		else output("Her");
		output(" legs thump the ground, and her breasts bear deep, ruddy marks where she’s been squeezing. So does one side of her face - she’s popped a finger into her mouth and is simultaneously sucking on it and pulling at her lip. You turn the vibrator up a notch, sending stronger shocks through her.");
		output("\n\n<i>“No-!”</i> ");
		if(knows) output("Briha");
		else output("She");
		output(" cries. Her body locks up under your bedeviling care, with legs splayed and thighs jiggling juicily. Her hands stop massaging altogether, as though one more iota of arousal might drive her insane.");
		output("\n\nShe’s totally at your mercy. You could finish her with such an orgasm that she can’t lift a finger while you abscond with her toy, or you could tease her without release until she’s too <i>horny </i> to stop you. Which one do you do?");
		//buttons ‘Give Orgasm’, ‘Tease’ (Briha versions)
		clearMenu();
		//Give Orgasm - Briha version
		addButton(0,"Give Orgasm",giveOrgasmToBriha,undefined,"Shove it in and watch her cum.");
		//Tease - Briha version
		addButton(1,"Tease",teaseBrihaWithDildoStealAsshole,undefined,"Continue teasing her until she can’t see straight. It shouldn’t take long on a myr.");
	}
	//merge into yellow myr branch if Lys
	else
	{
		if(!hasGoldDildo()) output("\n\nYou snag the toy before she can withdraw it, and ");
		else output("\n\nLeering, you ");
		output("tell her to undress. ");
		if(knows) output("Lys");
		else output("The gold");
		output(" hesitates, focusing all four hands on each button, one at a time. You elect to put her at ease by enjoying her slow strip as much as you can - it’s not like her gorgeous globes are hard to look at. The more you stare, the more confident she becomes, until she’s holding her shirt wide open and jiggling like an erotic dancer for you.");
		output("\n\nHer first surprise comes when you find and unlatch the dildo’s fastener, pulling the ends apart, but she slows only a little. Eager to see a shiver in her huge tits, you raise the toy to your mouth and coat it with your saliva, ");
		if(!pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("passing it between your [pc.lips] until it’s slick.");
		else output("wrapping it in your [pc.tongue] like a perverted present.");
		//(PC is red myr with venom (no oranges))
		if(pc.race() == "red myr" && pc.hasPerk("Myr Venom")) output(" The myr’s eyes widen a bit as you dose her only companion with your venomous saliva - in her face, mixed with arousal, there’s even a bit of... fear? Maybe your red-like appearance is triggering something deep in her propaganda-filled past?");
		output("\n\n<i>“You do it too,”</i> you insist, holding the tip out to her.");

		if(knows) output("\n\nLys");
		else output("\n\nThe woman");
		output(" blushes at the indirect kiss, but throws herself wholeheartedly into lubricating the toy while she peels off her panties. Once the last scrap of uniform is discarded, you pop the toy from her mouth with a wet ‘ffup’.");
		output("\n\n<i>“Turn around,”</i> you order.");
		output("\n\nWith excited eyes, she rotates and drops down on all sixes, holding her big ant-abdomen in the air above her jiggly ass. The pussy on the underside would be visible from any angle - thick ropes of female lube hang from it, falling to wet the ground. Laughing, you post her little soldier right under it, standing at attention. Then you place a hand atop the abdomen and guide it down until the dildo sinks in. ");
		if(knows) output("Lys");
		else output("The alien");
		output(" is eager for the contact, using what leverage she has to drive her abdomen down harder.");
		output("\n\n<i>“Yesss,”</i> she lets out, in a low hiss. <i>“Ooh, fuck me.”</i>");
		output("\n\nYou say nothing, and your hand remains still. ");
		if(knows) output("Lys");
		else output("The myr");
		output(" continues to pump weakly at the rod, waiting for you to start working... after fifteen seconds, she strings two thoughts together and realizes you’re not going to. She looks back.");
		output("\n\nYour smile widens as the poor girl makes eye contact, and you hold out your hand palm-up - it’s all up to her. She frowns, but begins trying to pleasure herself in the awkward doggy-cowgirl-style mount, laboriously raising her abdomen high with her legs and letting it slide back down the dildo. Eventually she’ll no doubt get off, and the orgasm will be so weak that she’ll have plenty of energy to fuck with you. For now, though, her slow screw gives you plenty of time to think about how you want to play.");
		output("\n\nYou could pick up the other dildo and give her the huge orgasm she wants, draining her too far to stop you from purloining her dildo, or you could prevent her release and tease her until she’s too aroused to stand. Which one do you do?");
		//buttons ‘Give Orgasm’, ‘Tease’ (Lys versions)
		clearMenu();
		//Tease - Lys version
		addButton(0,"Tease",teaseLysVersion,undefined,"Tease","Fuck her just enough to blank out her thoughts with arousal.");
		//Give Orgasm - Lys version
		addButton(1,"Give Orgasm",giveLysAnOrgasm,undefined,"Give Orgasm","Give her an orgasm with one dildo in her pussy... and one in her butt.");
	}
	processTime(13);
	pc.changeLust(10);
}

//Give Orgasm - Briha version
//tooltip: Shove it in and watch her cum.
public function giveOrgasmToBriha():void
{
	clearOutput();
	showDeserter(false,true);
	author("Zeikfried");
	var combatWin:Boolean = (inCombat() && (pc.HP() > 0 && pc.lust() < pc.lustMax()));
	var knows:Boolean = (flags["KNOW_RED_MYR_NAME"] != undefined);
	if(knows) output("Briha");
	else output("The myr");
	output(" stares at you with eyes ablaze - the desire in them would be frightening if she weren’t completely at your discretion.");

	if(pc.isBimbo()) output("\n\n<i>“Wanna cum now?”</i> you coo.");
	else output("\n\n<i>“Ready for the big finish?”</i> you ask.");

	if(knows) output("\n\nBriha");
	else output("\n\nThe ant");
	output(" nods violently. You slide the tip of her toy down one last time, and press it into her with a firmness that says her thrusts will no longer go unrequited. She receives the message like a letter from a lost love, devouring the shaft with her pussy inches at a time. Once it’s finally home and pleasuring her with its whole surface, she sighs.");
	output("\n\nYou suspect she’s getting too comfortable... so you crank the knob. ");
	if(knows) output("Briha");
	else output("The poor girl");
	output(" yelps as the vibrator goes on a frenzy, and her satisfied stillness is replaced by lusty spasms that batter the faux-cock deep into her. Her back seizes and her breath stops. The ground under her ass darkens as her ruddy-red vagina orgasms and squirts fem-cum around the stuck dildo. For at least ninety seconds, her athletic frame is bent double in a parade of climaxes that covers your hand in sticky myr lube.");

	//first time robbing Briha
	if(flags["RED_DILDOED"] == undefined)
	{
		output("\n\nYou pull the dildo free, and ");
		if(knows) output("Briha");
		else output("the poor girl");
		output(" topples backwards. Wiping your hands on her discarded clothes, you stand to leave when a sound like a wheeze stops you. Briha is perched on shaky elbows, staring at her vibrator and trying to speak. <i>“...Give... give it back....”</i>");
		if(pc.isBro() || pc.isBimbo()) output("\n\n<i>“Haha, but, like, you’re helpless. That means I’m supposed to rob you, right?”</i> you laugh. <i>“Don’t worry... I’ll be back later. Uh, maybe.”</i>");
		else 
		{
			output("\n\n<i>“It wouldn’t be right if I took nothing from our little encounter,”</i> you taunt. <i>“After all, you’re at my mercy.");
			if(!pc.isAss()) output(" Don’t fret... I’ll probably bring it back.");
			output("”</i>");
		}
		output(" You waggle the toy at her");
		if(!pc.isAss()) output(" with a wink");
		output(".");
		if(knows) output("\n\nBriha");
		else output("\n\nYour victim");
		output(" looks at you with a mixture of confusion and worry, and then her elbows fail, dropping her flat on the ground again.");
	}
	//repeat theft
	else
	{
		output("\n\nThe myr slumps forward as you pull the toy free and wipe it on her soft thigh. Her eyes harden a bit when you tuck her toy into your kit, but knowing your response and being unable to speak anyway, she says nothing. With a cheerful finger wave, you leave her soaking in her juices and breathing like a furnace.");
	}
	//end, increase lust, time, add key item ‘Fed. Vibrator’ (you can name the dildoes whatever you like) if not present
	processTime(6);
	pc.changeLust(5);
	//Dildo go!
	giveMyrDildo("red");
	IncrementFlag("RED_DILDOED");
	if (inCombat())
	{
		output("\n\n");
		CombatManager.genericVictory();
	}
	else
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Tease - Briha version
//tooltip: Continue teasing her until she can’t see straight. It shouldn’t take long on a myr.
public function teaseBrihaWithDildoStealAsshole():void
{
	clearOutput();
	showDeserter(false,true);
	author("Zeikfried");
	var combatWin:Boolean = (inCombat() && (pc.HP() > 0 && pc.lust() < pc.lustMax()));
	var knows:Boolean = (flags["KNOW_RED_MYR_NAME"] != undefined);
	if(knows) output("Briha’s");
	else output("Your partner’s");
	output(" eyes implore you to finish her - certainly her mouth would too, if it weren’t locked in a puling whine of intense lust. You elect not to.");

	output("\n\nStooping, you bring your [pc.lips] to her clit, cozying it in your mouth. The myr’s head finally falls as the siege on her pleasure buzzer stops, and her breasts heave. But as your tongue takes over where the vibrator left off, her respiration only becomes frantic again.");
	if(!pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" Brushing and suckling, your tongue laps at her clit like a thirsty dog drinking.");
	else output(" Burnishing her pussy in long strokes like a chamois of flesh, the oral muscle glides up and over her clit, traces along the sensitive skin of her mound, and returns to ripple around the dildo on its loop back to the top.");
	output(" She tries to sink onto the vibrator again and again, and whenever her hips jerk, you pull the toy away completely.");

	output("\n\nAfter a few rounds of torture, ");
	if(knows) output("Briha");
	else output("the myr");
	output(" falls over, writhing and squeezing your face in her thighs. <i>“Just let me cum already!”</i> she moans.");

	output("\n\n");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("Your tongue reels into your mouth like a measuring tape. ");
	if(pc.isBimbo() || pc.isBimbo()) output("<i>“Sure, babe, whatever.”</i>");
	else output("<i>“Sorry, am I keeping you?”</i>");
	output(" You stop teasing and push yourself upright, then gather your things. She watches you for a moment, unable to comprehend what’s happening, and then her hand creeps toward the pussy you left unattended. Waiting for it, you whirl around.");

	if(pc.isBimbo() || pc.isBro() || pc.isNice())
	{
		output("\n\n<i>“Hold it, missy! I said touch your tits. Not");
		if(pc.isBimbo()) output(", like,");
		output(" wherever you want.”</i>");
	}
	else 
	{
		output("\n\n<i>“Stop right there");
		if(silly) output(", criminal scum");
		output("! Remember... no touching below the waist until I’m gone.”</i>");
	}
	output(" The startled ");
	if(knows) output("Briha");
	else output("woman");
	output(" is of two minds; half of her wants to laugh at you and half wants to ignore you. Just to emphasize, you level the sticky dildo at her like an obscene sword.");

	//first time
	if(flags["RED_DILDOED"] == undefined)
	{
		output("\n\n<i>“Hey,”</i> the myr calls, speech staggered with heavy breaths. <i>“At least... gimme my... vibrator.”</i>");
		if(pc.isBimbo() || pc.isBro()) output("\n\n<i>“Nah,”</i> you answer. <i>“I’m gonna keep it. There’s no laws or whatever out here, right?”</i>");
		else if(pc.isNice()) output("\n\n<i>“But I’ve incapacitated you... that means I get to take your stuff, right?”</i> you reason.");
		else 
		{
			output("\n\n<i>“Why don’t you come and take it? That’s the rule here,”</i> you cajole.");
		}
		output(" You hold the toy out to her and pull it back when she grabs for it.");
		if(pc.isBro()) output("<i>“Just keeping it for a lil’ while. Prob’ly.”</i>");
		else output("<i>“I’ll give it back next time... probably.”</i>");
		if(!pc.isAss()) output(" You wink.");

		if(knows) output("\n\nBriha");
		else output("\n\nThe woman");
		output(" looks unhappy, but her pussy throbs with more important problems to solve. You leave.");
	}
	//repeat theft
	else
	{
		output("\n\nThe myr stares at you, knowing the rules of the engagement. You back away slowly with the fake cock wibbling in your hand, taunting her until you turn a corner - at which point you could swear you hear a sound like two very wet fish being rubbed together.");
	}
	//end, increase lust, time, add key item ‘Fed. Vibrator’ if not present, add extra misch point or half-point for denying? (may be too many)
	pc.changeLust(10);
	processTime(5);
	pc.addHard(1);
	//red dildo get
	giveMyrDildo("red");
	IncrementFlag("RED_DILDOED");
	if (inCombat())
	{
		output("\n\n");
		CombatManager.genericVictory();
	}
	else
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Give Orgasm - Lys version
//tooltip: Give her an orgasm with one dildo in her pussy... and one in her butt.
public function giveLysAnOrgasm():void
{
	clearOutput();
	showDeserter(true,true);
	author("Zeikfried");
	var combatWin:Boolean = (inCombat() && (pc.HP() > 0 && pc.lust() < pc.lustMax()));
	var knows:Boolean = (flags["KNOW_GOLD_MYR_NAME"] != undefined);

	output("You elect to be merciful - after all, she can barely bend to hook a finger in her pussy with those massive knockers in the way. ");
	if(knows) output("Lys");
	else output("Your partner");
	output(" hums when your hand springs into action, jamming the toy into her puss on one of her downstrokes.");

	output("\n\n<i>“Finally,”</i> she says.");

	output("\n\nYou plunge it in over and over, giving up your vertical mount and angling it to hilt and drag along her sensitive entrance on the way in. Lys seems to appreciate this; her sass-mouth devolves into animalistic grunts of pleasure while you ram her soaked snatch better than she ever could on her own. Her pleasure is your study - you want her to be close to orgasm, but not slip over until you spring your little trick.");

	output("\n\nFortunately, she’s so wanton that she doesn’t notice. She kneels like a dog, lowering her chest further and further as your strokes push her ant-butt into the air, until her udders are mashed against the cave floor. Her abdomen is so high now that you can see everything, including your final target. You moisten the smaller dildo one last time.");

	output("\n\n<i>“So close...”</i> groans ");
	if(knows) output("Lys");
	else output("the myr");
	output(". Her gushing pussy quivers and sucks at the larger toy.");

	output("\n\nWith a deft shove, you aim the smaller knob beneath her bug-butt, right at her shadowy pucker. It sinks in just as a mighty yank frees the larger one from her vagina, and ");
	if(knows) output("Lys");
	else output("the poor myr");
	output(" gasps.");

	output("\n\n<i>“Nooo!”</i> she moans, as you penetrate her ass instead. Her abdomen remains airborne, barred from the action by your arm as you work the spit-slicked dick into her asshole, teasing the ring. <i>“Ugh... I want it in my pussy, but... it feels good in my butt too!”</i>");

	output("\n\nA spray of nectar-like fem-cum on your fending arm announces the girl’s orgasm. Her arms give out, but her face still doesn’t hit the dirt thanks to those ridiculous breasts. Ripples knead her flesh as she spasms and spooges, and jiggles break on the chitin sections like waves. Even her violated asshole suckles at the little knob, radiating heat over your hand. Within a minute, her surprise anal orgasm is over, and you pop the nodule-turned-buttplug out and wipe it on her skin.");

	//first time stealing
	if(flags["GOLD_DILDOED"] == undefined)
	{
		output("\n\n");
		//(unsexed and high libido)
		if(pc.libido() >= 66) output("<i>“You should thank me and return the favor someday,”</i> you say, licking your lips and imagining the pleasure.");
		else
		{
			if(pc.isBimbo() || pc.isBro() || pc.isNice() || pc.isMischievous()) output("<i>“Was that fun? It looked fun,”</i> you muse.");
			else output("<i>“Ugh, you got my arm wet,”</i> you gripe, smearing it on her plush backside.");
			if(knows) output("Lys");
			else output("The girl");
			output(" watches you clean up silently. Only when you pack her dildoes in your own kit does she speak.");
		}
		output("\n\n<i>“Hey... that’s my... mine,”</i> the myr says.");
		output("\n\n");
		if(pc.isBimbo() || pc.isBro()) output("<i>“Well, like, stop me,”</i> you laugh. <i>“I’ll prob’ly bring it back later.”</i>");
		else if(pc.isNice()) output("<i>“You can’t stop me, though,”</i> you say simply. <i>“And your wasteland code says I get to take what I want if so. If it makes you feel better, I’ll probably have it the next time you see me.”</i>");
		else output("<i>“Yeah? Stop me,”</i> you retort. <i>“Oh, you can’t. That means I get to take a prize, right? Maybe I’ll bring it back after I have my fun.”</i>");
		output("\n\nThe myr’s shoulders jerk like she wants to grab you, but her arms are wet noodles - you easily escape, grinning.");
	}
	//repeat
	else
	{
		output("\n\nThe myr frowns when you clean her dildoes on her uniform and tuck them in your kit, but unable to move and at least somewhat confident that she’ll see you again, she doesn’t try to stop you.");
	}
	//end, increase lust, time, add key item ‘G. Republic Dildo’ if not present
	processTime(7);
	pc.changeLust(10);
	//add gold dildo
	giveMyrDildo("gold");
	IncrementFlag("GOLD_DILDOED");
	if (inCombat())
	{
		output("\n\n");
		CombatManager.genericVictory();
	}
	else
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Tease - Lys version
//tooltip: Fuck her just enough to blank out her thoughts with arousal.
public function teaseLysVersion():void
{
	clearOutput();
	showDeserter(true,true);
	author("Zeikfried");

	var combatWin:Boolean = (inCombat() && (pc.HP() > 0 && pc.lust() < pc.lustMax()));
	var knows:Boolean = (flags["KNOW_GOLD_MYR_NAME"] != undefined);
	output("You work out how to tease ");
	if(knows) output("Lys");
	else output("the poor girl");
	output(", and shift your grip on the dildo’s base to a more sturdy one. Then you begin to work it counter to her desperate, greedy plunges, jamming it upward on her downstroke. By giving it a slight angle you can drive it in deep, tickling her pussy and making her feel deliciously full, judging by the way she moans. She’s ready to blow after just two minutes of your improved stimulation.");
	output("\n\n<i>“Gonna cum...”</i> moans ");
	if(knows) output("Lys");
	else output("the poor girl");
	output(", oblivious to your plan.");

	output("\n\n<i>“How helpful,”</i> you think. You stop pumping and reset the dildo, permitting only shallow penetration again.");

	output("\n\nThe myr swears when her next ass-thumping abdomen slap comes up so much shorter. She resumes lifting awkwardly, trying to get the best unaided stroke. After another minute of unsatisfying sex, you guess that she’s cooled enough to be teased some more, and start thrusting again. ");
	if(knows) output("Lys");
	else output("The woman");
	output(" says nothing this time, wise to your trick... but you remember how her body trembled when she was about to finish. You stop pumping and reset the dildo just before her climax again.");
	output("\n\n<i>“Stop fucking with me!”</i> demands ");
	if(knows) output("Lys");
	else output("the desperate woman");
	output(".");

	output("\n\nYou shrug and angle the dildo with sweet promise, but when her abdomen raises up one final time, pull it out completely. Her pussy hits the dirt floor with a ‘splut’. <i>“Okay,”</i> you grin. <i>“I’ll leave you alone.”</i>");

	//first time stealing
	if(flags["GOLD_DILDOED"] == undefined)
	{
		output("\n\n");
		if(knows) output("Lys’s");
		else output("The myr’s");
		output(" head whips around in a panic. <i>“What... you’re leaving? I didn’t mean... hey, don’t take my dildo!”</i> Despite her dangerous tone, her hips continue to pump automatically, trying to slap her cunt onto a missing lover.");

		if(pc.isBimbo() || pc.isBro())
		{
			output("\n\n<i>“Yeah, I’m gonna get out of here,”</i> you say absently. <i>“I’ll bring your stuff back later.");
			if(pc.isBimbo()) output(".. if, like, I remember.");
			output("”</i>");
		}
		else if(pc.isNice()) output("<i>“Sorry, got to be somewhere,”</i> you lie politely. <i>“I’ll come by later, if I remember.”</i>");
		else output("<i>“Come after me, miss shaky-hips,”</i> you laugh. <i>“It’ll be funny to see you run pumping your ass like that.”</i>");

		output("\n\nLys tries to get up but the ground is so slick with pussy-juice and her hips so loose that she slips twice. Eventually she gives up and rolls onto her side, trying to reach her pussy with her fingers to relieve the lust. By the time she hooks into it, pinching her massive bust between her chest and her arms until it looks like a bun wrapped around two black hot dogs, you’re long gone.");
	}
	//repeat
	else
	{
		if(knows) output("\n\nLys");
		else output("\n\nThe myr");
		output(" looks back, more disappointed than angry this time. Without another word, she rolls over onto her side and assumes the only position that allows her to reach her pussy without the dildo you just stole. After a bit of supervising at a distance");
		if(pc.isMischievous()) output(" and shouting encouragement at her like a personal cheerleader");
		output(", you leave.");
	}
	//end, increase lust, time, add key item ‘G. Republic Dildo’ if not present, add extra misch point/half-point?
	processTime(10);
	pc.changeLust(10);
	//dildoget!
	giveMyrDildo("gold");
	IncrementFlag("GOLD_DILDOED");
	if (inCombat())
	{
		output("\n\n");
		CombatManager.genericVictory();
	}
	else
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Use Stolen Dildo - new masturbation menu scenes for PCs who stole a dildo
//short scenes to dirty Briha’s/Lys’s stolen dildo with your naughty fluids (or implied doodoo if unsexed)
//button hidden instead of disabled if PC has no relevant key item (so it can be a surprise)
//also adds misch point, but only once per theft (no point added if ‘dildo used’ flag already at 1 or 2)
//tooltip: Get your smutty sexual fluids all over the dildo you stole from the myr deserter.
//tooltip disabled, has dildo but masturbation not allowed: You can’t masturbate here!
public function stolenDildoFap():void
{
	clearOutput();
	showName("\nDILDO");
	if(hasGoldDildo() && hasRedDildo()) showName("\nDILDOS");
	author("Zeikfried");
	var plural:Boolean = (hasGoldDildo() && hasRedDildo());
	output("You pull out the sexual aid");
	if(plural) output("s");
	output(" that you stole and examine ");
	if(!plural) output("it");
	else output("them");
	output(".");

	if(hasGoldDildo())
	{
		output("\n\n");
		if(flags["KNOW_GOLD_MYR_NAME"] != undefined) output("Lys’s");
		else output("The gold myr’s");
		output(" golden dick-alike is a double-ended model. The part meant for jabbing in your partner is a hefty ten inches, while the other is shorter, but detachable just in case you don’t have anywhere to stick it. What kind of perverted engineer would have thought of that, do you suppose?");
	}
	if(hasGoldDildo())
	{
		output("\n\n");
		if(flags["KNOW_RED_MYR_NAME"] != undefined) output("Briha’s");
		else output("The red myr’s");
		output(" toy is an eight-inch, twin-motor vibrator with one wiggly engine in the tip and the other in the base. It’s camouflage-patterned, befitting the myr’s martial theme.");
	}
	output("\n\nHow do you want to get ");
	if(plural) output("them");
	else output("it");
	output(" dirty?");
	//gives ‘Back’ button and the sub-buttons below, sub-buttons are also hidden if the requisite key item is not present
	//stolen dildo menu.
	clearMenu();
	
	//Vibrator Anal
	//requires Briha’s vibrator
	//taur PC must have equipped shield and at least 1 point of shield health to qualify
	//tooltip: Stick the red myr’s vibrator in your booty{(cock) for a prostate massage{(no taur), then cum all over it}}.
	//tooltip disabled, is taur and shield is at 0 or unequipped: You’d need some kind of force-field to push this thing back out once it’s up you. Goodness gracious.
	if(hasRedDildo())
	{
		if((pc.isTaur() && !(pc.shield is EmptySlot)) || !pc.isTaur()) addButton(0,"Anal Vibe",useBrihasVibeAnal,undefined,"Anal Vibe", ("Stick the red myr’s vibrator in your booty" + (pc.hasCock() ? " for a prostate massage" : "") + ((!pc.isTaur() && pc.hasCock()) ? " then cum all over it" : "") + "."));
		else addDisabledButton(0,"Anal Vibe","Anal Vibe","You’d need some kind of force-field to push this thing back out once it’s up you. Goodness gracious.");
	}
	//requiring Lys’s dildo
	if(hasGoldDildo())
	{
		if(!pc.isTaur()) addButton(1,"DP Ass",didloDPWivStolenDildo,"ass","DP Ass","Unlatch the dildo and stuff both ends inside your asshole. May end in accidental stretching.");
		else addDisabledButton(1,"DP Ass","DP Ass","Your backside’s too far away to fuck.");
		if(pc.hasVagina())
		{
			if(!pc.isTaur()) addButton(2,"DP Vag",didloDPWivStolenDildo,"vag","DP Vag","Unlatch the dildo and stuff both ends inside your vagina. May end in accidental stretching.");
			else addDisabledButton(2,"DP Vag","DP Vag","Your backside’s too far away to fuck.");
		}
		else addDisabledButton(2,"DP Vag","DP Vag","You don’t have a vagina.");

		if(pc.hasCuntTail()) addButton(3,"DP Tail",didloDPWivStolenDildo,"tail","DP Tail","Unlatch the dildo and stuff both ends inside your cunt tail. May end in accidental stretching.");
		else addDisabledButton(3,"DP Tail","DP Tail","There’s nowhere in your tail to put them!");

		if(pc.hasFuckableNipples()) addButton(4,"DP Nipple",didloDPWivStolenDildo,"nip","DP Nipple","Unlatch the dildo and stuff both ends inside your nipple.");
		else addDisabledButton(4,"DP Nipple","DP Nipple","There’s nowhere in your nipples to put them!");
	}
	addButton(14,"Back",masturbateMenu);
}
//Vibrator Anal
//requires Briha’s vibrator
//taur PC must have equipped shield and at least 1 point of shield health to qualify
//tooltip: Stick the red myr’s vibrator in your booty{(cock) for a prostate massage{(no taur), then cum all over it}}.
//tooltip disabled, is taur and shield is at 0 or unequipped: You’d need some kind of force-field to push this thing back out once it’s up you. Goodness gracious.
public function useBrihasVibeAnal():void
{
	clearOutput();
	showName("\nANAL!");
	author("Zeikfried");
	//non-taur version
	if(!pc.isTaur())
	{
		output("Eyeing the red myr’s vibrator, you decide on the dirtiest place you can think of. For several minutes, you smear it with your saliva, coating it to ease insertion.");
		if(pc.ass.looseness() >= 3) output(" You needn’t have bothered - the eight-inch toy slides into your [pc.asshole] like a one-man cargo shuttle slipping through an inter-system gate.");
		else output(" The preparation is worth it - your [pc.asshole] yields grudgingly to the wet toy, accepting it into your depths with a sticky welcome.");
		//butt stretch/butt hymen check
		pc.buttChange(20);
		if(pc.libido() >= 66) output("\n\nIt’s a natural next step to ");
		else output("\n\nIt takes a few moments to nerve yourself up to ");
		output("crank the switch and cut on the motors. The toy springs to life like it’s perfectly at home inside your [pc.asshole]. The wiggling base batters and stretches your sensitive anal ring, while the tip reaches a much deeper and more intimate spot");
		if(pc.hasCock()) output(" - your prostate");
		output(".");

		//no cock
		if(!pc.hasCock())
		{
			output("\n\nAs the vibrator caresses your colon with spastic jerks, your hands run over your [pc.chestFull], coming to rest on your [pc.nipples 0]. You tweak and pinch them, returning over and over between bouts of stroking your neck and resting a hand on your hip, pretending it’s a strong lover’s. When the mood suits you, you reach back and crank up the power on the stolen toy, and then take up a submissive position on your hands, with your [pc.ass] sticking up in the air, fantasizing about being fucked by a powerful, muscular man.");
			if(pc.isNice()) output(" You orgasm arrives, amid daydreams of being at his discretion, a slave-boy to be stuffed with his cock whenever he pleases.");
			else output(" Despite the thrilling fantasy, you don’t actually manage to climax until your mind wanders to guessing the red myr’s face... her reaction when she finds out just where you stuck her beloved ‘Private’.");
			output(" With a guttural grunt, you cum hard. Your asshole takes a long pull of the toy, drawing it inside you like a greedy mouth and ensuring it’s buried deep by the time you slump over.");
			output("\n\nFifteen minutes later, you wake up aroused, with the toy still buzzing busily in your ass. You pull it out and turn it off before it can stoke your lust too much.");
		}
		//cock
		else
		{
			output("\n\nStreams of [pc.cum] leak from your [pc.cocks] as the spastic head pushes against your sensitive gland. Heedless of orgasm, you fountain jizz from the prostate stimulation alone. The toy does its best to bring you off anyway - especially when you decide that you want to ejaculate badly enough to crank the knob. The vibrator rattles inside you, kneading your prostate and rendering you achingly stiff.");
			output("\n\nA suitable conclusion flashes through your thoughts. You yank out the toy, set it down deactivated, and start to masturbate your [pc.cumNoun]-smeared dick. ");
			if(pc.cumQ() < 25) output("A few droplets more of spunk escape your exhausted body, sprinkling onto the stolen dildo. It remains standing upright.");
			else if(pc.cumQ() < 300) output("Several ropes of jism lance toward the toy, only partly aimed. Nonetheless, you score a hit, and the dildo topples from the impact of your seed.");
			else output("You couldn’t possibly miss the toy - even a myr could score hits with your spread. Spooge floods the dildo, carrying it away in such a current of [pc.cumColor] that you worry about finding it again, somewhere deep in the last lucid part of your mind.");
			output("\n\nAfter blowing your load, you retrieve the toy and rest for a while to recover.");
			//end, pass 20 mins, resolve lust
			//mark ‘deserter sextoy used’ flag to 1 if no cock, or 2 if cock
		}
		processTime(20);
		pc.orgasm();
	}
	//taur version
	else
	{
		output("You really want to pleasure yourself with ");
		if(flags["KNOW_RED_MYR_NAME"] != undefined) output("Briha’s");
		else output("the red myr’s");
		output(" vibrator");
		if(!pc.isNice()) output(" and dirty it with your smutty hole");
		output(", but the sheer unwieldiness of your body creates some serious problems. You puzzle over it for a while until you come up with an... interesting solution. To start with, you strip off <i>all</i> of your gear.");

		output("\n\nCranking the vibrator to maximum, you set it flat end-down, nestled in the pile of your stuff for extra stability. You shuffle it between your [pc.feet], front to side to back, always pinning it between at least two. So doing, you manage to keep it both on and upright until it’s under your [pc.ass] with a very clever display of ");
		if(pc.legType == GLOBAL.TYPE_EQUINE) output("horse-man-ship");
		else output("prowess");
		output(". Greedily but carefully, you lower your [pc.asshole] onto the toy. It batters its way into you");
		if(pc.ass.looseness() >= 3) output("r loose hole easily");
		else output(" with a struggle");
		output(", aided by the weight of your back half.");
		pc.buttChange(20);

		output("\n\nThe sensation is nice");
		if(pc.hasCock())
		{
			output(" - nice enough that your [pc.cocksLight] start");
			if(pc.cockTotal() == 1) output("s");
			output(" to spurt [pc.cum] from the prostate stimulation");
		}
		output(". But you’re not going to be able to relax into the pleasure without securing its exit. This part is much harder, not least because the vibrator is battering your asshole like it’s possessed by angry ghosts. With quivering hands, you tie your " + pc.shield.longName + " to one of the straps of your pouch, turn it on... and then sit on it.");
		output("\n\nThe device slides partway into your distended anal ring, and the shield shifts to cover the new contours it finds. Abruptly, the blows of the vibrator head become soft - soft and electrically tingly. You laugh ");
		if(pc.hasCock()) output("and puddle more jizz ");
		output("as the toy’s buzzy assault bounces off of the shield, pushing it further and further out with each tiny wiggle. The tingling sensation spreads through your [pc.ass], and though the vibrator has already slid halfway out, you’re not close to done, so you plop your butt down again. It thrusts back inside and you let its tingly tantrum eject it, again and again.");
		output("\n\nBy the fourth pass, you can’t take any more of the muted caresses, and you come.");
		if(pc.hasCock())
		{
			if(pc.cumQ() < 8) output(" [pc.Cum] beads atop your [pc.cocksLight]; already half-spent by prostate stimulation, you dribble out an orgasm that wouldn’t impress an ant.");
			else if(pc.cumQ() < 400) output(" A few squirts of [pc.cum] spurt from you, decorating the underside of your torso and the ground.");
			else output(" Your fore-[pc.legs] and chest get a [pc.cum]-bath as your seed bubbles up; so many waves erupt from your prostate-pounding orgasm that you must focus on keeping your footing, wary of falling and jamming your toys too deeply to retrieve.");
		}
		//no cock
		else output(" Your asshole clenches and ripples around the toy, trying to hold onto it in defiance of physics, but ultimately your orgasm ends and the vibrator slides out.");
		output(" With the vibrator safely ejected by your shields, you can tug on the strap to retrieve your device and then clean up.");
		//end, lust, time
		//flag Briha’s vibro as used 1
		//if taur, reduce shields by 1 point
	}
	if(inCombat())
	{
		output("\n\n");
		if(pc.HP() <= 0 || pc.lust() >= pc.lustMax()) CombatManager.genericLoss();
		else CombatManager.genericVictory();
	}
	else
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	processTime(20);
	pc.orgasm();
	if(pc.isTaur()) pc.shields(-1);
}

//requiring Lys’s dildo
//Dildo DP - for vagOrAss (tail/nipcunt req’d if taur)
//works for vagOrAss unless PC is taur; taur requires nipple/tail cunt
//tooltip: Unlatch the dildo and stuff both ends inside your {(normies){vagina/asshole}/(taurs){tail-cunt/fuckable nipple}}. May end in accidental stretching.
//tooltip disabled, taur and no tail/nipcock: Your backside’s too far away to fuck.
public function didloDPWivStolenDildo(target:String = "vag"):void
{
	clearOutput();
	showName("\nDP!");
	author("Zeikfried");
	
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.shiftCock(0, GLOBAL.TYPE_HUMAN);
	pp.cocks[0].cLengthRaw = 10;
	pp.cocks[0].cThicknessRatioRaw = 1;
	
	output("You detach the smaller end from the strap-on and tickle your ");
	if(target == "vag") output("labia");
	else if(target == "ass") output("anal ring");
	else if(target == "tail") output("parasitic tail’s opening");
	else output("mutated, fuckable nipple");
	output(" with the tip of the ten-inch monster. Slowly, you work it inside; its edges stir and scrape at your nerves, sparking pleasure up your spine. ");
	if(target == "vag") pc.cuntChange(0,pp.cockVolume(0)); // 75
	else if(target == "ass") pc.buttChange(pp.cockVolume(0)); // 75
	
	output("\n\nYou masturbate to a froth with the first dildo, working yourself into such a fugue that your lust-addled mind craves more penetration. Extended plunges with the first toy dredge up lubrication from deep in your core, until you’re satisfied that you’re wet enough to take the smaller one as well. With care but very little ceremony, you slip it in alongside its larger sibling.");
	//second vaginal/anal/whatever stretch check (for double pen; both heads together are probably ~5in wide)
	
	pp.cocks[0].cThicknessRatioRaw = 1.5;
	
	if(target == "vag") pc.cuntChange(0,pp.cockVolume(0)); // 375
	else if(target == "ass") pc.buttChange(pp.cockVolume(0)); // 375

	output("\n\nThe two toys press against one another, each driving the other deeper into your furrows as you thrust in and out. It’s hard to keep the image of being man-handled by two strong lovers from your fertile imagination - once it’s in there, all you can see is the spectacle of them fighting over access to your ");
	if(target == "vag") output("[pc.vagOrAss]");
	else if(target == "ass") output("[pc.asshole]");
	else if(target == "tail") output("[pc.tailCunt]");
	else output("[pc.nipple]");
	output(". The smaller, more energetic one tries his best to shove the larger one aside, but his competition’s sheer bulk forces him to accept a subordinate position, unable to cum as deeply inside you.");

	output("\n\nUsing both of the shafts to pump at your hole, you come in minutes. ");
	
	if(target == "ass") output("Your anus clenches and tries to hold both invaders, but only succeeds in squeezing out the smaller head by pressing it against the other. The sensation of it sliding out sends aftershocks through you and you imagine a small, exhausted lover slipping his spent cock from your ass.");
	else
	{
		var squirt:Boolean = false;
		if(target == "nip" && pc.canMilkSquirt()) squirt = true;
		else if(target == "vag" && pc.isSquirter()) squirt = true;
		if(!squirt)
		{
			output("Your ");
			if(target == "vag") output("pussy");
			else if(target == "tail") output("tail-cunt");
			else output("nipple-hole");
			output(" quivers around them, dribbling a little bit of ");
			if(target != "nip") output("[pc.girlCum]");
			else output("[pc.milk]");
			output(" through the space between them.");
		}
		else
		{
			output("Your ");
			if(target == "vag") output("pussy");
			else if(target == "tail") output("tail-cunt");
			else output("nipple-hole");
			output(" gushes with climax, flooding the two toys with so much lubrication that the smaller one slips out on a tight squeeze.");
		}
		output("\n\nSpent, you lay down for a brief rest. The sex toys stuffing your hole are a problem for the awake you.");
	}
	if(inCombat())
	{
		output("\n\n");
		if(pc.HP() <= 0 || pc.lust() >= pc.lustMax()) CombatManager.genericLoss();
		else CombatManager.genericVictory();
	}
	else
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//end, lust, time, set ‘used’ flag for Lys’s toy
	processTime(30);
	pc.orgasm();
}

//Give Flower - new scene for Lys
//alternate use for the venus pitcher flower from Emmyquest
//hidden until PC has seen ‘About Her’ in Lys’s talk menu (think you’ll need a new flag for this)
//avail. thru ‘About Her’ topic, consensual sex menu or victory-sex menu if Lys is friendly
//adds nice point(s)
//tooltip: Present Lys with the exotic flower you found on Mhen’ga and see if {(nice)it’ll cheer the poor girl up. /(else)she’ll ‘appreciate’ you for it. }
//tooltip disabled, no flower in inventory: Lys would appreciate any flowers you find. You wonder where you could get one....
public function giveFlowerToLys():void
{
	clearOutput();
	showDeserter(true);
	author("Zeikfried");
	pc.addNice(2);
	pc.destroyItemByClass(VenusBloom);
	var combatWin:Boolean = (inCombat() && (pc.HP() > 0 && pc.lust() < pc.lustMax()));

	if(pc.isBro() || pc.isBimbo()) output("<i>“Um, I found a thing,”</i> you announce.");
	else if(pc.isNice()) output("<i>“You might like this,”</i> you remark.");
	else if(pc.isMischievous()) output("<i>“Battlefield flower delivery service,”</i> you jibe.");
	else output("<i>“This is for you,”</i> you say abruptly. <i>“Try not to get all emotional.”</i>");

	output("\n\nWhen you produce the explosively pink-and-purple blossom, the myr leans in so fast that she almost falls over. <i>“Where ");
	//(first time)
	if(flags["GAVE_LYS_FLOWER"] == undefined) output("did you get that? It’s ");
	else output("do you keep finding these? They’re ");
	output("gorgeous!”</i> You hold it out for her appraisal, and her face disappears into the bloom for the next few seconds as she takes a long, deep sniff. When it reappears, it’s plastered with a giddy smile.");
	if(flags["GAVE_LYS_FLOWER"] == undefined) 
	{
		output(" <i>“Aww... did you see this and think of me because I used to be a florist?”</i>");
		if(pc.isBimbo() || pc.isBro()) output("\n\n<i>“Used to... what?”</i> you ask, dimly. <i>“Oh! Yeah, like, totally.”</i>");
		else if(pc.isNice()) output("\n\n<i>“You seemed very sad, and I thought it might cheer you up.”</i>");
		else output("\n\nYou nod.");
	}
	output("\n\n<i>“So...”</i> Lys says, playing with her hair like a shy date. It’s funny when you remember that she’s a hardened soldier who’s probably killed more myr than you’ve met. <i>“...are you going to give that pretty flower to me?”</i>");

	//first time
	if(flags["GAVE_LYS_FLOWER"] == undefined)
	{
		if(pc.isNice() || pc.isBro() || pc.isBimbo())
		{
			output("\n\n<i>“Sure,”</i> you answer. <i>“That’s");
			if(pc.isBimbo()) output(", like,");
			output(" why I got it out.”</i>");
			output("\n\nLys smiles and holds out her hand - she also squeezes her breasts between her folded arms as she does, making sure you see a window of button-bursting, golden cleavage under her uniform.");
		}
		else if(pc.isMischievous()) 
		{
			output("\n\n<i>“That depends,”</i> you grin. <i>“A flower this rare is bound to be worth a lot. I could take it into town and get four, maybe five kisses for it.”</i>");
			output("\n\nLys’s expression starts crestfallen but recovers when she hears the end of the joke. <i>“I can do you a better offer than that,”</i> she says, leaning forward on her hands and showing off her bust. Her seductive lids lower.");
		}
		else
		{
			output("\n\n<i>“Could do that,”</i> you muse. <i>“It’s bound to be worth money, though. I’d want something valuable in exchange.”</i> You look at her, staring holes into her shirt to make sure she understands.");
			output("\n\nLys undoes a few buttons and leans forward on her hands, displaying her heavy cleavage. <i>“If you’ll accept services in lieu of goods and currency, I believe I have an offer.”</i>");
		}
		output("\n\nYou pass the blossom to Lys and she places it atop her kit bag with care.");
	}
	//repeat
	else output("\n\nYou pass over the flower. Lys places it atop her equipment, far behind her and out of the way.");

	//merge
	output("\n\nYou ");
	if(pc.isAss()) output("demand she strip.");
	else output("ask if she’s in the mood for some intimacy.");
	if(flags["KNOW_GOLD_MYR_NAME"] != undefined) output("\n\nLys");
	else output("\n\nThe gold myr");
	output(" agrees in a second, disrobing like skin is the only uniform she’s comfortable in. She takes special relish in exposing her huge tits, undoing buttons bottom-to-top so the jiggly jugs strain at the fasteners and nearly fall out of her shirt.");
	output("\n\n<i>“You like?”</i> she teases, watching you goggle at her breasts. A shimmy sets them swaying back and forth, highlighted in gold against the muted earth background.");
	if(pc.isBro() || pc.libido() >= 75)
	{
		output("\n\n<i>“Shake it, baby!”</i> you hoot.");
	}
	else if(pc.isNice() || pc.isBimbo()) output("\n\n<i>“Yes, very sexy,”</i> you say.");
	//(misch non-bimbro)
	else if(pc.isMischievous()) output("\n\n<i>“They’re a bit on the small side,”</i> you lie, with a smile. <i>“Are you sure you’re eating right out here?”</i>");
	else output("\n\nYou ignore her and gesture for her to finish.");

	output("\n\nLys winks and moves to her bottoms, sliding them over her thick golden booty. Her ant-abdomen bobs when she tugs the last piece of fabric away, starkly black-on-yellow");
	if(combatWin) output(" and already oozing translucent, slippery fluid from the aroused opening");
	output(".");

	output("\n\nYou remove your [pc.gear]. <i>“Show me your ");
	if(pc.isBro()) output("cute little pussy");
	else if(pc.isBimbo()) output("va-jay-jay");
	else output("vagina");
	output(",”</i> you instruct, pointing at the ground.");

	output("\n\nYour partner seats herself, leaning far back and spreading her legs so her bug-butt dangles like ripe fruit, beading with pussy-nectar. When you place a ");
	if(pc.isTaur()) output("[pc.foot]");
	else output("finger");
	output(" against her entrance, she shivers, and a ripple travels with it. Starting from her cushy ass, the shiver climbs her torso and vibrates the breasts lying indolently on her chest. The alien doesn’t try to restrain it; she watches to measure how hot you’re getting.");
	if(pc.hasGenitals()) 
	{
		output(" Your exposed ");
		if(pc.hasCock()) output("[pc.cocksLight]");
		else
		{
			output("vagina");
			if(pc.totalVaginas() > 1) output("s");
		}
		output(" do a poor job hiding it, ");
		if(pc.hasCock()) output("swelling with blood");
		else output("flushing with lust");
		output(".");
	}
	output("\n\n<i>“What will you do with me?”</i> asks your vulnerable lover.");
	processTime(7);
	IncrementFlag("GAVE_LYS_FLOWER");
	pc.changeLust(10);
	//if tailcock hasn’t been satisfied recently (commented for now because TC do not require sating)
	if(9999 == 0 && pc.hasTailCock())
	{
		output("\n\nBefore you can begin to choose, your [pc.tails] lash");
		if(pc.tailCount == 1) output("es and twists");
		else output(" and twist");
		output(" into your view. [pc.OneTailCock] has emerged at the sight and scent of pussy, drooling precum and slapping your [pc.ass] to punish you for neglecting it so long.");
		output("\n\n<i>“I suppose we’d better take care of that, first,”</i> says Lys, innocently.");
		//automatically skip choice (give ‘Next’ button or whatev) and start cock branch below, using tailcock tags
		//9999
	}
	//else present a choice: buttons ‘Use Cock’, ‘Cunnilingus/Analingus’
	else
	{
		clearMenu();
		if(pc.hasCock() && pc.cockThatFits(chars["GOLD_DESERTER"].vaginalCapacity(0)) >= 0) addButton(0,"Use Cock",useCockOnLysPostFlower,false,"Use Cock", ("Stick your dick in Lys’s pussy" + (!pc.isTaur() ? ", and your face in her thighs or tits, whichever you can reach" : "") + "."));
		else addDisabledButton(0,"Use Cock","Use Cock","You don’t have any suitable cocks secreted about your person.");
		if(pc.hasTailCock()) addButton(1,"Tailcock",useCockOnLysPostFlower,true,"Tailcock", ("Stick your cock-tail in Lys’s pussy" + (!pc.isTaur() ? ", and your face in her thighs or tits, whichever you can reach" : "") + "."));
		else addDisabledButton(1,"Tailcock","Tailcock","You don’t have any suitable cocks secreted about your person.");

		//http://www.nbc.com/saturday-night-live/video/colonel-angus-comes-home/n11685
		if(pc.hasVagina()) addButton(2,"Cunnilingus",enolAngusAkaColonelAngus,true,"Cunnilingus","Get Lys to lick your vagina while you amuse yourself with her sex.");
		else addDisabledButton(2,"Cunnilingus","Cunnilingus","You do not have a vagina to get licked.");
		addButton(3,"Analingus",enolAngusAkaColonelAngus,false,"Analingus","Get Lys to lick your anus while you amuse yourself with her sex.");
	}
}

//Use Cock
//gold myr are played out if missionary is all that’s left
//tooltip: Stick your {dick/cock-tail} in Lys’s pussy{(no taur), and your face in her {(PC < 4ft)thighs/tits}}.
//tooltip disabled, no cock/tailcock: You don’t have any suitable cocks secreted about your person.
//tooltip disabled, cocks too big and no tailcock: No number of presents would get her wet enough to take your enormous [pc.cocksLight]! Have you considered moving to the seaside?
public function useCockOnLysPostFlower(tailCawk:Boolean = false):void
{
	clearOutput();
	showDeserter(true,true);
	author("Zeikfried");
	output("Lys swallows hard at the ");
	var x:int = -1;
	if(!tailCawk) x = pc.cockThatFits(chars["GOLD_DESERTER"].vaginalCapacity(0));

	if(x >= 0) output("[pc.cockNounComplex " + x + "] you select");
	else output("[pc.tailCock] that self-selects and juts forward");
	output(", equal parts nerve and notion. One hand absently travels the valley between her hilly breasts, marking her blood-rich yellow skin with lines that show and fade a second later.");

	output("\n\n<i>“I’m ready... whenever you are,”</i> she invites, with husky breath.");

	output("\n\n’Ready’ isn’t a strong enough word. You [pc.walk] to her and straddle her ant-half. It curls up with her lust, dabbing at your ");
	if(x >= 0 && pc.balls > 0) output("[pc.sack]");
	else output("[pc.skinFurScales]");
	output(" and so eager for penetration that it’s actually hard to angle your shaft. Lys flushes and squeezes it into position by closing her thighs.");

	output("\n\nWith her restraints and her pussy kissing the tip of your prick, you can sink in, hilting in her deep, wet insides with one smooth stroke. The alien woman grunts as your overzealous thrust slaps your ");
	if(x >= 0) 
	{
		if(pc.hasKnot(x)) output("[pc.knot " + x + "]");
		else output("[pc.sheath " + x + "]");
	}
	else output("entire length");
	output(" into her labia.");

	output("\n\n<i>“You’re enthusiastic,”</i> Lys says.");

	if(pc.isAss()) output("\n\n<i>“Naw, just looser than I expected,”</i> you quip.");

	//no horses
	if(!pc.isTaur())
	{
		output("\n\nHer hands caress your collar, pulling you down. Her fingers, hardened with chitin, guide your face to her ");
		if(pc.tallness < 60) output("jiggly thighs");
		else output("bountiful cleavage");
		output(". The flesh accepts you willingly, holding you and softly buffeting whenever you thrust in deep.");

		output("\n\n<i>“Ah!”</i> squeaks Lys, every time you hump her ant-sex. With her flesh wrapped around your [pc.ears] and the scent of sugar in the air, the pleasure-grunts have a baffled, faraway quality, like you’re listening to her get fucked on the other side of an orchard. ");
		if(pc.tallness >= 60) output("Her erect nipples drool nectar as she presses her rich gold breasts into you, smearing your [pc.hair].");
		else output("Her sweaty thighs squeeze your head, making the orchard smell slightly past ripe with a cloying, musky sweetness.");
		output(" Wanton pussy clamps down on your ");
		if(x < 0) output("[pc.tailCock]");
		else output("[pc.cock " + x + "]");
		output(", oblivious to any <i>mise en scène</i> except the hot, wet sex, threatening you with your looming orgasm.");
	}
	//horses here
	else
	{
		output("\n\nHer hands caress your chest. The touches on your [pc.legFurScales] stir idled lust again, spurring desire to hear the arousal of the woman under you, even if you can’t see. A mighty pump elicits a cute little grunt - the first of many.");
		output("\n\nUsing her noises as cues, you rut mercilessly from your position of superior power. Whenever you hear a gratifying moan, you repeat the angle over and over, tagging the found spot until her cries weaken. The rampant pursuit of pleasure isn’t destabilizing Lys alone... you edge closer to blowing a load of [pc.race]-spunk with every stroke through her soaked furrows and folds.");
	}
	//if PC has an unused too-big (60 inches+ length) cock, append to either fork
	var hyperCock:Boolean = (pc.biggestCockLength() >= 60 && x != pc.biggestCockIndex());
	if(hyperCock)
	{
		output("\n\nIn one thrust, your [pc.cockBiggest] slaps against her golden, sticky nipple, delivering a shiver to your hips. Greedy for pleasure, you ");
		if(pc.isTaur()) output("ask Lys to wrangle and route it between her big, cushiony breasts, which she does.");
		else 
		{
			if(pc.tallness >= 60) output("pull your head free and wrangle your cock into its place, running");
			else output("run");
			output(" it between her big, cushiony breasts.");
		}
		output(" Lys is so eager that she fellates it immediately, slurping precum with two burning, wet lips. On every stroke, your [pc.cockHeadBiggest] now forges through a valley of quivering breast to end in the eager mouth of a cum-hungry slut, compounding the ecstasy of her pussy. It takes little time before your urethras swell to deploy your sperm - and she reacts by shutting her eyes and opening her mouth to brace for the strokes aimed right at her.");
	}
	//merge all
	output("\n\nWith a groan, you pop. ");
	if(pc.cumQ() < 9) 
	{
		output("Dribbles of [pc.cum] creep from your " + (tailCawk ? "[pc.tailCock]" : "[pc.cock " + x + "]") + ", oozing their way into the myr’s vagina.");
		if(hyperCock) output(" Her tongue intercepts the load from your second shaft, lapping it up on its way down your cock.");
	}
	//(med cum)
	else if(pc.cumQ() < 250)
	{
		output("Your spunk shoots wildly inside the myr, dosing her with [pc.cum] to give a rare taste of a queen’s happiness.");
		if(hyperCock) output(" The second load drops on her face, falling into her mouth and across her eyes.");
	}
	else
	{
		output("Cataracts of [pc.cum] rush against your crotch from the myr’s overflowing pussy, which is packed after only a few squirts from your hyper-fertile tool.");
		if(hyperCock) output(" Her open-mouthed naiveté gives way to a tight-shut face as she tries to weather the storm of sperm you unleash.");
	}
	output(" Lys’s pussy ripples with her own climax, juicing you for all the seed you can deliver");
	if(pc.cumQ() >= 1000) output(" regardless of ability to contain it");
	output(".");

	output("\n\n<i>“Well, that was enjoyable,”</i> says Lys when you finish");
	if(pc.tallness >= 60 && !pc.isTaur()) output(", wiping a bit of drool from between her breasts");
	output(". <i>“If you find any more flowers, bring them by - you’re fun to trade with.”</i>");

	output("\n\nYou ");
	if(pc.isNice()) output("laugh");
	else output("roll your eyes");
	output(", then collect your gear. Lys re-equips as well, holding the flower away to prevent crushing it, and then you bid one another goodbye.");
	if(inCombat())
	{
		output("\n\n");
		if(pc.HP() <= 0 || pc.lust() >= pc.lustMax()) CombatManager.genericLoss();
		else CombatManager.genericVictory();
	}
	else
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//end, reduce lust, time, remove 1x venus flower
	processTime(21);
	pc.orgasm();
}

//Cunnilingus/Analingus
//only displays as ‘Analingus’ if PC has no standard cunni
//tooltip: Get Lys to {lick your vagina/rim your asshole} while you amuse yourself with her sex.
public function enolAngusAkaColonelAngus(puss:Boolean = true):void
{
	clearOutput();
	showDeserter(true,true);
	author("Zeikfried");
	//I changed around the conditions for these. Z's grasp on the bimbo/bro personality types could use some work.
	if((pc.isBro() || !pc.isNice()) && !pc.isBimbo())
	{
		output("<i>“Eat my ");
		if(puss) output("pussy");
		else output("ass");
		output(",”</i> you enjoin.");
	}
	else
	{
		output("<i>“Could you use your mouth on, ah, my ");
		if(puss) output("pussy");
		else output("butt");
		output("?”</i> you request.");
	}
	output("\n\nLys looks startled, but rolls with it. <i>“Bring it over here, then,”</i> she tries to coo.");
	if(pc.isMischievous() && pc.buttRating() >= 15) output("\n\n<i>“Beeeep beeeep,”</i> you say, reversing your [pc.ass] into her.");
	else output("\n\nYou turn around and back your [pc.ass] up.");
	output(" Four palms intercept it, spreading your cheeks and searching out your [pc.vagOrAss]. No sooner do you feel the warm cave air than the flow is blocked. Hot breath fills you in its place, only to be pushed out in turn by a questing tongue. Ah, she gets right down to business.");
	output("\n\nAs her flexible oral muscle teases your ridges");
	if(puss) output(", dipping to slurp at [pc.oneClitPerVagina] and coax it from your hood");
	var x:int = -1;
	if(puss) x = rand(pc.totalVaginas());
	output(", you reach for her pink-gold pussy. You busy your hands with the myr’s smutty sex, trying to get her off in hopes that the moans into your [pc.vagOrAss " + x + "] will produce good vibrations. The myr can’t bear it; after a minute she’s wet enough that you can slip your whole hand in.");
	output("\n\n<i>“Hnnnnnnnnn,”</i> Lys groans, breathing on your blood-engorged ");
	if(puss) output("labia");
	else output("sphincter");
	output(". It becomes a game of who can get whom off first; Lys begins to suspect the rules after your next finger-pruning dive into her honeypot.");

	output("\n\n<i>“Trying to make me cum?”</i> she hums, lips pressed close to transmit the quivers. You reply with another plunge, and buck your [pc.ass] to rattle her off of her chat break and back to work. The myr licks at your [pc.vagOrAss " + x + "] with talent that could only bloom in an all-female combat wing, lingering when you jerk with pleasure and diddling your sweetest spots with the tip of her tongue. Her pussy, as wet as her mouth, pulls at your hand to draw it in for a load of semen that will never come.");

	output("\n\nWith an almost synchronized groan, you both climax. You’re pretty sure that you came first, but Lys is quaking and candying your hand with so much sweet fem-cum that you doubt she’ll note it. Your ");
	if(puss) output("pussy");
	else output("asshole");
	output(" squeezes her poor tongue, circling it with a vise of muscle designed for a much longer intruder but happy to rub against its bumpy surface.");
	if(puss && pc.isSquirter()) output(" A burst of your [pc.girlCum] hits her as you squirt with ecstasy, but her eyes are closed in a rapturous smile of her own.");
	output(" Panting heavily and sticky with sex, you fall apart.");

	output("\n\n<i>“Well, that was enjoyable,”</i> says Lys when you finish");
	if(pc.tallness >= 60 && !pc.isTaur()) output(", wiping a bit of drool from between her breasts");
	output(". <i>“If you find any more flowers, bring them by - you’re fun to trade with.”</i>");

	output("\n\nYou ");
	if(pc.isNice()) output("laugh");
	else output("roll your eyes");
	output(", then collect your gear. Lys re-equips as well, holding the flower away to prevent crushing it, and then you bid one another goodbye.");
	if(inCombat())
	{
		output("\n\n");
		if(pc.HP() <= 0 || pc.lust() >= pc.lustMax()) CombatManager.genericLoss();
		else CombatManager.genericVictory();
	}
	else
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//end, reduce lust, time, remove 1x venus flower
	processTime(20);
	pc.orgasm();
}

//double dildo stuffing on Briha [title: 'Compare Toys']
//button name: Compare Toys
//stick Briha's vribrator in her butt while you pound her pussy with hardlight
//tooltip: Show off your high-tech hardlight for {(knows name)Briha/(else)the ant-girl}{(PC has seen Briha's vibrator), and see how it stacks up to what she's used to}.
//tooltip disabled, no hardlight: You need hardlight-enabled underwear for this.
public function doubleDildoBrihaStuffing():void
{
	if(!inCombat())
	{
		clearOutput();
		setEnemy(new MyrRedFemaleDeserter());
	}
	showDeserter(false,true);
	author("Zeikfried");

	//first time: PC has not seen Briha's vibrator
	if(flags["RED_MYR_DESERT_DILDO_DONE"] == undefined)
	{
		output("You regard the ant-girl like a flower in a junkyard - no friends, no companions, just a single blithely-cheerful face in a dusty, dreary, same-y set of tunnels. She cocks her head.");
		output("\n\n<i>“What are you staring at?”</i>");
		if(pc.isBimbo())
		{
			output("\n\n<i>“Um, well... don’t you get lonely out here, honey?”</i> you ask, forced to speak before your thoughts have gathered.");
			output("\n\n<i>“I guess,”</i> ");
			if(flags["KNOW_RED_MYR_NAME"] != undefined) output("Briha");
			else output("the soldier");
			output(" answers. <i>“Sometimes I want someone to talk to and there’s nobody around.”</i>");
			output("\n\n<i>“No, like... I mean, </i>physically<i> lonely,”</i> you clarify. You rub your thighs together unconsciously.");
		}
		else if(pc.isBro()) output("\n\n<i>“So like, how do you get off out here, with no boyfriend and no washing machine?”</i> you ask.");
		else if(pc.isNice() || pc.isMischievous())
		{
			output("\n\n<i>“Don’t mean to pry, but... do you always have to jump a stranger when you get, um, the itch?”</i> you ask. ");
			if(flags["KNOW_RED_MYR_NAME"] != undefined) output("Briha");
			else output("The ant");
			output(" looks cock-eyed at you for a moment before she hits upon your meaning.");
		}
		else 
		{
			output("\n\n<i>“You must be really horny all the time,”</i> you answer.");
			output("\n\nShe blushes. <i>“Why do you say that?”</i>");
			output("\n\nYou grin cruelly. <i>“Because you can only get laid by beating someone, but you’re weak as a kitten with plastic fangs.”</i>");
		}
		output("\n\n<i>“Ah,”</i> the bug-girl answers, embarrassed. <i>“Well, actually... we were, how should I say, ‘equipped’? - to deal with that issue in basic.”</i> She reaches for her stowage and, after a few seconds, pulls out an impressive camo-patterned sex toy.");
		output("\n\n<i>“Meet the Private,”</i> ");
		if(flags["KNOW_RED_MYR_NAME"] != undefined) output("Briha");
		else output("the ant");
		output(" says, beaming. She holds it up proudly, like a torch. <i>“Durable, loyal, and never jealous, he has adjustable speed, from ‘gentle massage’ up to a setting that can please even the most... </i>sociable<i> and </i>well-exercised<i> army girl.”</i>");
		//flag Briha’s vibrator as seen
		flags["RED_MYR_DESERT_DILDO_DONE"] = 1;
	}
	//first time; PC has seen Briha’s vibrator
	else if(flags["BRIHA_HARDLIGHT_STUFFED"] == undefined)
	{
		output("You lean close to the ant-girl and smile disarmingly. She smiles back");
		//(still hostile)
		if(inCombat()) output(", nervously,");
		output(" and asks, <i>“What are you up to?”</i>");

		if(pc.isBimbo()) output("\n\n<i>“Like, you like your vibrator, right?”</i>");
		else if(pc.isBro()) output("\n\n<i>“You like your vibrator?”</i>");
		else output("\n\n<i>“You’re pretty happy with your little sex toy, aren’t you?”</i>");
		output("\n\n<i>“The Private?”</i> Briha temporizes");
		//(nonhostile)
		if(!inCombat()) output(", blushing a litte");
		output(". <i>“Yeah. We’ve been together since basic training. He’s just about my ideal boyfriend - quiet, loyal, stays out of the way.”</i>");

	}
	//merge first times
	if(flags["BRIHA_HARDLIGHT_STUFFED"] == undefined)
	{
		output("\n\n<i>“");
		if(pc.isBimbo()) output("Like, ");
		output("I dunno about it being as great as all that,”</i> you tease. <i>“It’s pretty low-tech, isn’t it?”</i>");
		output("\n\n");
		if(flags["KNOW_RED_MYR_NAME"] != undefined) output("Briha");
		else output("The girl");
		output(" easily intuits the question you want to hear. <i>“Compared to what?”</i> she asks.");

		output("\n\n<i>“Well...”</i> you begin");
		//(has outer garment)
		if(!pc.isCrotchExposedByArmor()) output(", opening your [pc.armor] to expose your [pc.lowerUndergarment]");
		output(". You slip a hand into your underwear to find the projector controls and turn them on. Emphasized by a theatrical hip thrust, a fat, photonic cock springs from your girt loins. <i>“...something like this, maybe?”</i>");
		output("\n\n<i>“Ooh, shiny,”</i> she says. She reaches out to touch it, haltingly, as if she expects it to fade like a hologram. Instead, you push it through her hand, which closes reflexively. <i>“What... it’s solid? That’s pretty cool....”</i>");
		output("\n\n’Size-adjustable, too,”</i> you add, pulsing it with the control.");
		output("\n\n<i>“But does it vibrate?”</i> she asks, knowingly.");
		output("\n\n<i>“");
		if(pc.isBimbo()) output("Like,");
		else output("That’s");
		output(" not a problem,”</i> you reply. <i>“</i>I<i> vibrate.”</i> ");
		if(flags["KNOW_RED_MYR_NAME"] != undefined) output("Briha");
		else output("The girl");
		output(" laughs as you jiggle your hips spastically, knocking the cock against her palm.");

		output("\n\n<i>“Okay,”</i> she finally agrees. <i>“What do you have in mind?”</i>");
		output("\n\n<i>“Side-by-side comparison,”</i> you answer cryptically. <i>“Take off your pants");
		if(pc.isNice() || pc.isBimbo()) output(", please");
		output(".”</i>");
	}
	//repeat intro
	else
	{
		if(pc.isBimbo()) output("<i>“Mmm, how about we both get our toys out and see how long it takes you to cum again, honey? I bet I can beat my high score.”</i>");
		else if(pc.isBro()) output("<i>“Get out your dildo.”</i>");
		else output("<i>“Get out your ‘Private’ and let’s play toy soldiers again.”</i>");

		output("\n\n");
		if(flags["KNOW_RED_MYR_NAME"] != undefined) output("Briha");
		else output("The ant");
		output(" colors, embarrassed. <i>“Okay,”</i> she says meekly, and produces the toy. You ");
		if(!pc.isCrotchExposedByArmor()) output("expose your [pc.lowerUndergarment] and ");
		output("generate the high-tech prick from your pants while she prepares to strip.");
	}
	//merge all intro to main body
	output("\n\n");
	if(flags["KNOW_RED_MYR_NAME"] != undefined) output("Briha");
	else output("The soldier");
	output(" fixates on your light-dick even as her hands slide to her waistband, her face a mosaic of second thoughts. She stares as if the humming, glowing marvel could decide to stop playing nicely and burn her at any time. For that matter, it might - if she’s too nervous to get wet, she’s going to have a bad time.");
	output("\n\n<i>“Why don’t we start with yours?”</i> you say");
	if(pc.isBimbo() || pc.isAss()) output(" kindly");
	output(".");

	output("\n\nThe ant-girl immediately seems more at ease. Her body posture relaxes, and the movements of her hands become natural, finding her buttons and bobs easily. Her army shorts slide down her hips and she leans forward to step out of them, blocking her sex but offering a very nice consolation view, right down her shirt.");
	output("\n\nYou stare ");
	if(!pc.isBimbo() && !pc.isBro()) output("covertly");
	else output("unabashedly");
	output(" at the smooth, dusky curves under the girl’s top, waiting ");
	if(!pc.isAss()) output("im");
	output("patiently for her to slide her panties over her feet and in so doing, lean far enough forward to give you a glimpse of nipple. She looks up just in time to catch you peering intently, and covers your view window with a hand.");
	output("\n\n<i>“Cheeky,”</i> she says, blushing again.");
	if(pc.isBimbo() || pc.isNice()) output("\n\n<i>“Please?”</i> you wheedle.");
	else output("\n\n<i>“Oh, come on,”</i> you grunt.");

	output("\n\n");
	if(flags["KNOW_RED_MYR_NAME"] != undefined) output("Briha");
	else output("The ant");
	output(" giggles. She finishes stepping out of her shorts and stands up, then hooks a finger under the bottom hem of her shirt. Slowly, she lifts it, exposing one side of her chest inch by inch. She stops just under the breast... but instead of revealing her nipple, she holds it there and begins to raise the other side.");

	output("\n\nUnconsciously, you’ve begun to lean in, fixated on her striptease. ");
	if(flags["KNOW_RED_MYR_NAME"] != undefined) output("Briha");
	else output("The girl");
	output(" smiles keenly, enjoying her power over you, and exposes a few more inches. This hand, too, stops just below her breast, where it waits with its companion until you exit your trance and look up at ");
	if(flags["KNOW_RED_MYR_NAME"] != undefined) output("Briha’s");
	else output("the girl’s");
	output(" face questioningly.");

	output("\n\nGrinning ear to ear, she flips up the top, finally exposing her dark nipples.");
	if(pc.hasCock()) output(" Your photonic dildo wavers a bit as if aroused, but really is only translating the stiffening of your [pc.cocks].");
	output(" <i>“You like?”</i> ");
	if(flags["KNOW_RED_MYR_NAME"] != undefined) output("Briha");
	else output("the girl");
	output(" asks. You nod furiously, and she places her hands under her breasts, caressing and buoying them. <i>“So... are we still going to play with our toy soldiers?”</i>");
	output("\n\nHer question snaps you back, and you take one last long glance at her pert breasts before breaking away to focus on her vibrator. <i>“");
	if(pc.isBimbo()) output("Like, l");
	else output("L");
	output("ie back,”</i> you instruct.");

	output("\n\nShe does, though she keeps her legs closed, concealing her pussy shyly. You nose at her knees with her toy, poking at them like a friendly dog’s nose and mimicking vibrator sounds. <i>“Bzzt.”</i> <i>“Bzzt.”</i>");

	output("\n\n");
	if(flags["KNOW_RED_MYR_NAME"] != undefined) output("Briha");
	else output("The ant");
	output(" laughs, and her defenses drop. She allows you to push her legs apart, revealing the fine, pink slit of her sex. It glistens with lubrication, and spreads as her thighs separate, opening into a target for your affections. You tap the vibrator to your chin thoughtfully, waiting for the girl to blush and squirm under your scrutiny, which she does.");

	output("\n\n<i>“C’mon,”</i> she whines. You give an excited grin of your own, and finally nudge the vibrator against her labia. The toy moves in your hand, and you fret that you bumped the knob by accident... but it’s only because ");
	if(flags["KNOW_RED_MYR_NAME"] != undefined) output("Briha");
	else output("the woman");
	output(" is so horny that her pussy is twitching. She can’t wait any longer - if you continue to stall, her quivering back muscles are liable to propel her along the ground in search of penetration. Yielding to her now-monstrous desire, you slide the toy into her. The woman’s head slumps and her chest thrusts into the air, and she releases a sigh like she’s been reunited with a missing child.");
	output("\n\nYou tease her with the toy’s familiar tip, guiding it through its old home ground with new eyes. The ant-girl’s hands drift to her breasts again, gently tickling the skin and tweaking the erect nipples. She’s really getting into it; a trickle of lubrication shivers from her pussy, slicking the tip of the well-used toy. Eager to get more, you withdraw and turn the vibrator on at the lowest setting before making another pass through her sensitive vulva.");
	output("\n\n<i>“Oh, please!”</i> cries the lust-struck soldier. <i>“Put it back in already!”</i> Her grip on her nipples tightens, and another pussy spasm pushes out another wave of free-flowing lubrication. More than enough for your plan.");
	output("\n\n<i>“Not here,”</i> you answer quietly. ");
	if(flags["KNOW_RED_MYR_NAME"] != undefined) output("Briha");
	else output("The ant");
	output(" looks at you, then colors furiously as you slide the shaking vibrator out from between her lips, down her perineum, and come to rest touching her asshole. You pause, with the lowest setting gently buzzing against her, staring into her eyes and waiting for her to break. She chews her lip impatiently, warring with fear and lust... and then nods permission.");
	output("\n\nThe vibrator glides into ");
	if(flags["KNOW_RED_MYR_NAME"] != undefined) output("Briha’s");
	else output("the girl’s");
	output(" asshole without a jerk, completely lubricated and limbered by her desire. Her reaction is immediate and audible. The ant groans in pleasure as the pulses of the toy go to work on her nerves. She writhes in it; her legs kick and rub together, trying to find a comfortable way to receive the intensifying jolts.");
	output("\n\n<i>“More?”</i> you ask, tilting the vibrator by the end to push it against one wall.");
	output("\n\n<i>“Gah! No!”</i> the anal lightweight gasps, arching her back futilely to try and relieve your pressure.");
	output("\n\n<i>“");
	if(pc.isNice()) output("Okay,”</i> you smile.");
	else output("Maybe just a bit?”</i> you ask, wry. The poor girl jerks in place as you turn the vibrator up one single notch, rocking her with stimulation. Her sensuous breast caress has become a deathgrip and her head lolls wildly, but it looks like you were right. She’s still smiling a rictus of pleasure... at least, when she’s not moaning.");

	output("\n\n<i>“Time for the comparison,”</i> you ");
	if(pc.isNice()) output("warn");
	else output("think");
	output(". The ant-girl lacks the muscle control to either resist or help as you spread her legs wide for room and ");
	if(pc.isTaur()) output("straddle her and lower your crotch");
	else output("lift her hips");
	output(", but her transfixed eyes give you the sign of her anticipation. Still gushing wet, the woman takes the sci-fi strap-on in a single well-aimed push.");

	output("\n\n<i>“Mmmgh,”</i> she grunts through her teeth. You pause for an explanation, but the urgency in her eyes is all you get; it tells you that she wants you to thrust, <i>now</i>. It’s an easy request to answer; the ant-girl’s legs are half-clasped around you, pulling you into her pussy; all you have to do is pull back and she’s more than eager to drag you back in. Her back muscles writhe, kicking up dirt and smearing her gorgeous, dark skin with sweat-mud. The wracking vibrations in her ass shake the woman, jiggling her perky breasts which roll unrestrained on her chest, slave to every bit of momentum you push into her.");

	//only if not unsexed
	if(pc.hasGenitals())
	{
		output("\n\n");
		if(flags["KNOW_RED_MYR_NAME"] != undefined) output("Briha");
		else output("The ant-girl");
		output(" isn’t the only one being teased by the maddening vibrator, either; every time you hilt the hardlight in her eager cunny, the base of her camouflage toy rests neatly against ");
		if(pc.balls > 0) output("your [pc.balls]");
		else if(pc.hasVagina()) output("your [pc.clit]");
		else output("the [pc.sheath] of your [pc.cockNounSimple]");
		output(", shuddering a dose of stimulation into you as well.");
	}
	//resume all
	output("\n\nThe ant is a rag-doll ");
	if(pc.isTaur()) output("between your [pc.legs]");
	else output("in your arms");
	output(", so destabilized by double-penetration that her dark eyes have glassed over. Her pussy-juice soaks your underwear, revealing the delicate pattern of circuitry in the fabric; they stick and cling to your skin. Her hands have completely given up on her breasts and now lie outstretched at her sides, clutching and flopping weakly. In contrast, her back muscles are as stiff as compressed springs");
	if(!pc.isTaur()) output(" in your palms");
	output(", ready to convulse and buckle in orgasm any second. Eager to see it, you angle a stroke low to knock the vibrator in the final inch, heedless to the difficulty she’ll have getting it free after the climax wipes her out.");

	output("\n\n<i>“Nnnn!”</i> ");
	if(flags["KNOW_RED_MYR_NAME"] != undefined) output("Briha");
	else output("the girl");
	output(" cries. <i>“Cuh-ming!”</i> Possessed of sudden strength, she curls up on you like a spider, wrapping her arms around you and pressing her breasts to your chest. You can feel the tremors in her stomach as her pussy convulses around the insensitive hardlight.");
	//(not unsexed)
	if(pc.hasGenitals()) 
	{
		output(" The awkward hug pushes the ant-girl’s vibrating asshole against ");
		if(pc.balls > 1) output("your balls");
		else if(pc.hasVagina()) output("your pussy");
		else output("the base of your cock");
		output(", teasing out a small orgasm from you as well");
		if(pc.hasCock() && pc.cumQ() >= 2000 && !pc.isCrotchExposed()) output(" - at least, small as far as you’re concerned. Your lover stares openly as your underwear balloons with jism and begins to leak wildly, smearing her quivering thighs with cummy, [pc.cumColor] mud-slime");
		output(".");
	}
	output("\n\nYou remain like that, locked up in her intimacy, ");
	if(!pc.isTaur()) output("staring into one another’s eyes, ");
	output("until ");
	if(flags["KNOW_RED_MYR_NAME"] != undefined) output("Briha’s");
	else output("the girl’s");
	output(" muscles relax.");
	if(!pc.isTaur()) output(" Instead of letting you go immediately, though, she smiles bashfully, leans in, and kisses you.");
	output(" <i>“Think you could help me take the Private out?”</i> she mumbles, weakly.");

	output("\n\nYou deactivate the hardlight and extricate yourself from her hug. ");
	if(pc.isNice()) 
	{
		output("<i>“Sure,");
		if(!inCombat()) output(" honey,");
		output("”</i> you reply. With a deft pluck, you pull the still-wet, still-shaking vibrator from her; her pussy twitches out one last sprinkle of lubrication on your hand as a thank-you. The ant sighs and reclines, lying in the dust with a sheen of sweat and satisfaction; you don’t hear anything else from her, but her eyes follow you affectionately as you leave.");
	}
	//(else not nice)
	else
	{
		output("<i>“Sure...”</i> you reply, reaching for the vibrator. You grasp the end but, instead of pulling it out, simply twist it back down to the lowest setting. <i>“...in your dreams.”</i> ");
		if(flags["KNOW_RED_MYR_NAME"] == undefined) output("Briha");
		else output("The girl");
		output(" gasps as you back away, leaving her at the mercy of her enthusiastic mechanical companion. She flops over, laid out in a haze of sex and sweat, stomach muscles working as the toy continues to ravish her; you pick up your things and leave, but don’t get far enough away before you hear the low moans of an ant-girl in orgasm reverberate through the cave a second time.");
	}
	if(inCombat())
	{
		output("\n\n");
		if(pc.HP() <= 0 || pc.lust() >= pc.lustMax()) CombatManager.genericLoss();
		else CombatManager.genericVictory();
	}
	else
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//do pc orgasm unless unsexed, pass time
	processTime(19);
	IncrementFlag("BRIHA_HARDLIGHT_STUFFED");
	pc.orgasm();
}