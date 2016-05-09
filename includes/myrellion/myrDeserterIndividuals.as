import classes.Characters.GardeBot;
import classes.Characters.MyrGoldFemaleDeserter;
import classes.Characters.MyrRedFemaleDeserter;
import classes.Creature;
import classes.GameData.CombatManager;
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

When the PC engages in sex from the non-hostile menu (After winning five or more fights), the 'Win' sections of text are used. To this end, the bracketed sex scene sections are labelled 'Win/Consent'.

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
	return false;
}
public function hasRedDildo():Boolean
{
	return false;
}
public function removeRedDildo():void
{

}
public function removeGoldDildo():void
{
	
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
			combatBlurb(true);
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
			combatBlurb(false);
		}
	}
	// If either of the above are true, use the non-combative approach instead.
}

public function combatBlurb(gold:Boolean = false):void
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
		output("\n\nAs you walk through the desolate and war torn wasteland, the wind howls around you. It rages against its underground confines. Instinctively, you ");
		if(pc.meleeWeapon is EmptySlot && pc.rangedWeapon is EmptySlot) output("grab a nearby rock.");
		else output("tighten your grip on your [pc.weapon].");

		output("\n\nA deafening boom fills the air. The ground trembles, and dirt and stalagmites fall from the cavern ceiling. Heart racing in your chest, you throw yourself to the ground.");
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
		output(". <i>“... I’m going to help myself to your things. Maybe I’ll help myself to you too, while I’m at it.”</i>");

		output("\n\n<i>“It’s the rules of this place, so don’t feel too hard done by - I’ve been on the receiving end as well. It’s just your turn, that’s all.”</i>");
		output("\n\n");
		if(gold) output("She stabs at you with the bayonet blade. You dart to the side, and it <i>just</i> misses.");
		else output("She pulls back the toggle-lock of the semi-auto with a loud click.");
	}
	else
	{
		if (gold) IncrementFlag("MET_GOLD_DESERTER");
		else IncrementFlag("MET_RED_DESERTER");
		
		output("You’re walking through the desolate and war-torn wasteland. Suddenly, there’s a bee-like whizzing past your ear. A ragged-looking ");
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
	CombatManager.setFriendlyCharacters(pc);
	CombatManager.setHostileCharacters(tEnemy);
	CombatManager.victoryScene(winVsAntGrillDeserts);
	CombatManager.lossScene(loseToAntGrillDeserts);
	CombatManager.displayLocation(flags["KNOW_GOLD_MYR_NAME"] == undefined ? "GOLD DSTR" : "LYS");
}

public function configureRedDeserterFight(tEnemy:Creature):void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyCharacters(pc);
	CombatManager.setHostileCharacters(tEnemy);
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
		output("\n\nYou’re walking through the desolate and war-torn wasteland. Nearby, you spot a ragged looking red deserter.");
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
		//{Second Pregnancy && First Time Seeing Her Pregnant (this time)
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
			output("\n\n<i>“Hi there, soldier. I’m just sitting down for a rest,”</i> she smiles and stretches out. <i>“... So, what brings you out to ");
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
		output("\n\nYou’re walking through the desolate and war-torn wasteland. Nearby, you spot a ragged looking ");
		if(!gold) output("red");
		else output("gold");
		output(" deserter");
		if(!gold && flags["KNOW_RED_MYR_NAME"] == 1) output("- it’s Briha");
		else if(gold && flags["KNOW_GOLD_MYR_NAME"] == 1) output("- it's Lys");
		output(". She’s holding her ");
		if(!gold) output("semi-auto pistol and hatchet");
		else output("trench shotgun and pistols");
		output(" but doesn’t make any move to attack.");
		
		//Red/Briha:
		if(!gold)
		{
			//{Post-pregnancy:
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
				else output("\n\n<i>“... Got time to spend with me? I’d appreciate the company.”</i>");
			}
			else
			{
				output("\n\n<i>“Hi, soldier. ");
				if(hasRedDildo()) output("May I have the Private back? I've lost enough fights to you to know how trying to take it will go down... so why don't we play nice?");
				else output("How about we skip the usual scuffles and just play nice? I’ve got into enough fights with you to know who’s going to end up on top,");
				output("”</i> she wryly smiles.");
			}
		}
		else
		{
			output("\n\n<i>“Fancy meeting you here. ");
			//(PC has her strapon)
			if(hasGoldDildo()) output("How about you generously let me have my strap-on and I skip the whole 'tough soldier' bit?");
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
	clearMenu();
	//[Sex] [Talk] [Fight] [Flee]
	if(pc.lust() >= 33) addButton(0,"Sex",sexWithAntGrills,gold);
	else addDisabledButton(0,"Sex","Sex","You aren't aroused enough for that.");
	// Fight is not available with the pregnant red myr. Otherwise, it goes right to combat.
	addButton(1,"Talk",talkToAntSloots,gold);
	if(gold) addButton(2,"Fight",fightADumbShitAntWaifu,gold);
	else 
	{
		if(flags["BRIHA_INCUBATION_TIMER"] != undefined) addDisabledButton(2,"Fight","Fight","You're not going to smack around a pregnant girl!");
		else addButton(2,"Fight",fightADumbShitAntWaifu,gold);
	}
	if(hasRedDildo() || hasGoldDildo()) addButton(3,"Give Dildo",giveDildoToAntSloot,gold,"Give Dildo","Return your looted prize.");
	addButton(14,"Run",runFromDatAntSloot,gold);
}

//Fight
public function fightADumbShitAntWaifu(gold:Boolean = false):void
{
	clearOutput();
	showDeserter(gold);
	author("Jim Thermic");
	output("You pull out your [pc.weapon]. [enemy.name] clicks her tongue. <i>“... Damn. Oh well, it was worth a try, right?”</i>");
	output("\n\n<b>It’s a fight!</b>");
	processTime(1);
	clearMenu();
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyCharacters(pc);
	CombatManager.setHostileCharacters(enemy);
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
	else addButton(0,"Sit'nScrew",sitAndScrewGoldMyr,undefined,"Sit & Screw","Have some fun screwing her... with her strap-on if you need one.");
	//Doggy Style (Both)
	// PC Win or Non-Hostile Consent Only
	// PC must have a dick.
	// Max capacity 16 inches.
	// Max girth four inches.
	if(pc.hasCock() && pc.cockThatFits(enemy.vaginalCapacity(0)) >= 0) addButton(1,"DoggyStyle",doggieStyleWithMyrBitches,gold,"Doggy Style","Do her doggy style!");
	else if(pc.hasCock()) addDisabledButton(1,"DoggyStyle","DoggyStyle","You need a penis that will fit inside her for this scene.");
	else addDisabledButton(1,"DoggyStyle","DoggyStyle","You can't do her doggie style without a dick of your own.");
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
		if(!pc.isTaur()) addButton(4,"Hand-Play",handPlayForGoldWaifusInTraining,undefined,"Hand-Play","She's got four arms... put them to work.");
		else addDisabledButton(4,"Hand-Play","Hand-Play","Tauric creatures cannot enjoy this scene.");
	}
	else addDisabledButton(4,"Hand-Play","Hand-Play","Only a gold myr deserter has enough hands for this scene...");
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
		output("\n\n<i>“... Me? Just another dumb girl who got sucked into the propaganda,”</i> she answers. <i>“Honestly, girls like me are a credit a dozen. I’m nothing that special.”</i>");
		output("\n\nPushing her a little further, she gives you a bit more of an answer. <i>“Oh, okay. Well, where to start? I’m a twenty one year-old ex-career soldier from Rivalle. I was a Sergeant before I went AWOL.”</i>");
		output("\n\n<i>“I’m not all work - or rather, I wasn’t. I used to want to be a career dancer before the war started. I’m a bit too scarred for that now, though,”</i> she smiles wryly. <i>“Plus, I’m pretty sure we’re all going to get blown up before long... not that I can return home.”</i>");
	}
	//Gold/Lys:
	else
	{
		output("You ask Lys a little bit about herself. She curls a finger around her wild locks, her other arms hugging under her voluptuous breasts.");
		output("\n\n<i>“I guess I can tell you a little bit about myself. After all, it’s not exactly like I have a lot better to do,”</i> Lys chuckles. <i>“Maybe I should start with my measurements, or are you after something a little bit more personal?”</i>");
		output("\n\n<i>“Let’s see... I’m twenty six years old and an ex-florist. I used to have a lovely garden and my own cosy home not far from where we are now. My wife and I sold the loveliest blue-green sydranas... at least until we were both conscripted.”</i>");
		output("\n\nShe sighs and looks down at her assorted hands, lacing her fingers together. <i>“... That was so long ago... four years? It feels like forever.”</i>");
		output("\n\n<i>“Needless to say, she’s dead, along with the rest of our platoon. Our house is in ruins - there’s barely anything left. I’ve got some seeds left, but the soil is so ruined they refuse to bloom.”</i>");
		output("\n\n<i>“All I’m doing is wasting my time until someone hunts me down for desertion, or the world ends - whichever comes first.”</i>");
	}
	processTime(4);
	clearMenu();
	addButton(0,"Next",talkToAntSloots,gold);
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
		output("\n\n<i>“... I guess it’s the obvious question, right? I guess... I had an image of how things would be. I was going to be the glorious defender of my homeland, fighting back against the hypocritical Golds, who were going to stomp all over us if we didn’t do something.”</i>");
		output("\n\n<i>“My dream of being a bold, adventurous heroine, delivering justice to the dirty Golds... I was so naive. I’ve shot and killed more people than I can count. Not just enemy soldiers, but civvies too. Sure, it was orders, but I was the one who pulled the trigger... or brought down the axe.”</i>");
		output("\n\nShe sighs and bites her fingernail. <i>“... I was thinking about deserting for a while, but I couldn’t do it to my squad. When you desert, you burn your whole squad. When they all died, I was in anguish, but I was relieved... how sick is that?”</i>");
		output("\n\n<i>“When that happened, I left the front. It was easier than I thought. Now, I’m living out here in the middle of nowhere, scraping together what I can to survive. But you know what? It beats having to shoot any more defenseless people and call it justice.”</i>");
	}
	//Gold/Lys:
	else
	{
		output("You ask Lys why she deserted the Gilden Republic. She sighs and looks at one of her fingers, rubbing it compulsively.");
		output("\n\n<i>“... My wife. We were both conscripted early on during the war. She... I... well... same platoon,”</i> she chokes up. Her black eyes become glassy with tears. <i>“... Sorry. I really thought I could talk about it this time... but I just can’t.”</i>");
		output("\n\nTaking a deep breath, she tries to calm her trembling body. <i>“... Whoooh. Right. So. When she left me, I ended up in a medical hospital for a little while. They put me back on the front line when the war effort started going south, though.”</i>");
		output("\n\n<i>“When the Reds took Kressia, I figured it wasn’t long before the End, what with the nukes. If I’m going to die, I wanted to do it near where our old house was, here in No Myr’s Land - not in some hopeless defense of the capital.”</i>");
		output("\n\n<i>“... So that’s it. I wander the wastes, stealing what I can, robbing strays, all so I can stay close to where she and I lived. I kind of feel like she’s there, you know?”</i>");
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
		output("\n\nBriha touches her scarred eye self consciously. <i>“... T-these? I suppose you would be curious,”</i> she mumbles, <i>“The eye I got early on in the war from being careless.”</i>");
		output("\n\n<i>“I’d taken a pot shot with a rifle at a gold scout. When I moved up to grab her hand-held, she damn near sliced my face open with a knife. We struggled for a bit before I smashed open her temple with her radio.”</i>");
		output("\n\nThe red myr brings down her hand to rub the scar just next to her heart. <i>“... This one’s a bit more painful. My squad and I ran into some wire entanglements. While trying to get through, we were herded into a machine gun.”</i>");
		output("\n\n<i>“Thankfully, a shelling took out the enemy gunner and I was dragged off the field. They stitched me up, and now I’ve got a scar and a story to tell off-worlders wandering through the wastes,”</i> she bitterly smiles.");
		output("\n\n<i>“You, though, look at you! All scarless and " + pc.mf("handsome","pretty") + ". Off-world medicine really is something else, isn’t it?”</i>");
	}
	//Gold/Lys:
	else
	{
		output("You ask Lys about her scars; the one on her lower lip and on her belly.");
		output("\n\nLys laughs and rubs her lower lip. <i>“... Well, you don’t spend time on the front without walking away with scars of one kind or another, right?”</i>");
		output("\n\n<i>“The belly and the lip are actually connected. We were pushing forward to take an enemy trench. When we reached it, I looked over and a red shot me at point blank.”</i>");
		output("\n\nShe taps her belly, <i>“... The bullet went right through me. Thankfully, it missed all the important stuff. But I was so shocked I toppled forward and fell face-first into the trench.”</i>");
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
		output("\n\nCoughing a little, Briha hugs her waist. There’s a tense look on her face. <i>“... Look. I’m a deserter. It-it breaks my heart into a million pieces, but you should take Aya. This place - not just the wastelands, but Myrellion - I don’t want her growing up here.”</i>");
		output("\n\nYou look at her intently. Her words are heavy, like each one is an effort to push out. Motherly concern is written all over her scarred face.");
		output("\n\n<i>“It’s a no-brainer, right? This world might end any moment, and even if it doesn’t, I’m a deserter. The Scarlet Federation will never take me back and I can never go to the Golds. What kind of future can she have here?”</i> She strokes ");
		if(flags["BRIHA_INCUBATION_TIMER"] < 120) output("the fragile shell");
		else output("her baby’s cheek");
		output(", a tear running down her half-lidded eye. <i>“... With you, off-worlder, she can have a real future. Something better than this scarred dustball. She can make her mother proud.”</i>");
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
		output("\n\nSwallowing hard, Briha turns to you, a somber expression on her face. <i>“... You know what to do. He can’t stay here - take him. Every second I look at him, I love him a little more.”</i>");
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
		output("\n\n<i>“You’re wearing me out, stud!”</i> Briha chuckles, but the mother’s face is positively aglow. <i>“... And another younger sibling for Aya and Brahn. They definitely won’t be lonely growing up - not with this little one to fuss over.”</i>");
		output("\n\nSwallowing hard, Briha turns to you, a somber expression on her face. <i>“... You know what to do. ");
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
	}
	output("\n\nWith a heavy heart, you take your infant child and kiss Briha goodbye");
	if(hasRedDildo())
	{
		output(" - the sly veteran snags her vibrator out of your pack while your hands are full, with a tired smile that tells you she's hormonal enough to need it");
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
	StatTracking.track("pregnancy/total births");
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
			//(corresponding vibrator used flag at 1).. until a thought occurs to her. <i>“Did you use this?”</i> /(vibro used flag at 2).. until she smells it, and her grin turns to a puzzled frown. <i>“Smells like [pc.cumNoun]... just what did you do with my Private?”</i> }");
			//output("\n\n{(nice)"Exactly as you think. Sorry!”</i> you admit. /(else)You answer with a coy smile. }
			output(" She stows it, then ");
		}
		output("dutifully patches you up, bandaging and dressing your wounds. The salve she applies instantly numbs your ails.");
		//First time Fighting Her:
		if(flags["LOST_TO_MYR_DESERTS"] == undefined)
		{
			flags["LOST_TO_MYR_DESERTS"] = 1;
			output("\n\n<i>“There you go, hon,”</i> the scrappy deserter smiles, patting your patched-up cheek. <i>“... I told you it’s just your turn to be on the receiving end. I may be a turncoat, but I’m not a </i>total<i> bitch - just a little bit of one.”</i>");
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
			//{(Briha and used flag at 2).. until a smell hits her nose. She looks more closely at the toy. <i>“Ehh... did you cum on the Private?”</i>");
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
		
		if((enemy is MyrRedFemaleDeserter && flags["RED_MYR_DESERTER_BEATEN"] == undefined) || (enemy is MyrGoldFemaleDeserter && flags["GOLD_MYR_DESERTER_BEATEN"] == undefined)) output("\n\n<i>“... Guess you weren’t such an easy mark after all.");
		else output("<i>“... Guess it’s my turn after all.");
		output(" My life is yours, soldier. What are you going to do with me?”</i> Her singularly black eyes");
		if(!gold) output("- one partially closed -");
		output(" stare at you.");
	}
	//Lust Loss:
	else
	{
		if(enemy.short != "Briha" && enemy.short != "Lys") output("The ");
		output("[enemy.name] falls to her knees and drops her weapons. Instead of picking them up, she feverishly touches herself. Her face is flushed as she lets out lewd little moans.");
		output("\n\n<i>“... F-fuck-! I-I can’t stop!”</i> The [enemy.skinColor] skinned deserter moans, <i>“It’s been far too long since I’ve had a good lay. Come on, soldier, h-have your way with me.”</i> She begs.");
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
		else addButton(0,"Sit'nScrew",sitAndScrewGoldMyr,undefined,"Sit & Screw","Have some fun screwing her... with her strap-on if you need one.");
		//Doggy Style (Both)
		// PC Win or Non-Hostile Consent Only
		// PC must have a dick.
		// Max capacity 16 inches.
		// Max girth four inches.
		if(pc.hasCock() && pc.cockThatFits(enemy.vaginalCapacity(0)) >= 0) addButton(1,"DoggyStyle",doggieStyleWithMyrBitches,gold,"Doggy Style","Do her doggy style!");
		else if(pc.hasCock()) addDisabledButton(1,"DoggyStyle","DoggyStyle","You need a penis that will fit inside her for this scene.");
		else addDisabledButton(1,"DoggyStyle","DoggyStyle","You can't do her doggie style without a dick of your own.");
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
			if(!pc.isTaur()) addButton(4,"Hand-Play",handPlayForGoldWaifusInTraining,undefined,"Hand-Play","She's got four arms... put them to work.");
			else addDisabledButton(4,"Hand-Play","Hand-Play","Tauric creatures cannot enjoy this scene.");
		}
		else addDisabledButton(4,"Hand-Play","Hand-Play","Only a gold myr deserter has enough hands for this scene...");
		//Cuff&Fuck
		cuffNFuckButton(5, enemy);
	}
	else
	{
		if(enemy is MyrRedFemaleDeserter) addDisabledButton(0,"DildoScrew","Dildo Screw","You're not turned enough for sex.");
		else addDisabledButton(0,"Sit'nScrew","Sit & Screw","You aren't turned on enough for this.");
		addDisabledButton(1,"DoggyStyle","DoggyStyle","You aren't aroused enough for this.");
		addDisabledButton(2,"Anal Sex","Anal Sex","You aren't aroused enough for this.");
		addDisabledButton(3,"Cum Splurge","Cum Splurge","You aren't aroused enough for this.");
		addDisabledButton(4,"Hand-Play","Hand-Play","You aren't aroused enough for this.");
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

	output("\n\nAs you lick your lips, the alieness saunters over, her sizable breasts jiggling about. <i>“... I think it’s better if I leave on my panties. Can’t have you getting too excited, now, can I?”</i>");

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
	output("and turn her on the spot. Without warning, you you pull down her camo pants and underwear, and she lets out a cry of surprise.");

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

	output("\n\nYou tease her extremely cuppable breasts some more. Her protests lessen, until at last she caves, <i>“... O-o-oh all right. B-but be gentle, all right?");
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
	output("\n\nWhen at last your [pc.cock] bottoms out inside of her butt, you let out a throaty groan. Every inch of her narrow confines are deliciously wringing you. Reflexively, your [pc.cockHead " + x + "] swells deep inside of her ass, and she lets out another sharp cry. <i>“... O-Oh - you’re breaking my ass!”</i> Her whole butt tenses up. Void! She’s so tight inside it’s almost criminal!");
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
		output("\n\n<i>“Are you sure? Asking my people for a blowjob... well, let’s just say you won’t be walking anywhere for a few hours,”</i> she playfully cautions, then adds, <i>“...Or so I hear. I’ve never had the chance to give one, you know?”</i>");
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
	output(" in protest. <i>“... Now to take you a little bit deeper.”</i>");

	output("\n\nYou’re utterly blown away as she sucks [pc.oneCock] into her moist mouth. Her intoxicating saliva mixes with your [pc.cumVisc] [pc.cum] and pools around your [pc.cockHead]. It feels as intense as sex, if not <i>more</i> so!");

	output("\n\nAs she sucks you off in her hot, spunk-filled mouth, you groan and arch your back, a thin stream of drool trickling down your cheek. Right now you’re nothing but a [pc.race] font of [pc.cumNoun] for her to suck upon and you don’t care. Letting out carnal cries and moans, you buck your hips against her chin, utterly lost in the utter pleasure of her druggy drool, giving over every drop you");
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
	output(" purrs and licks her lips. When she notices your eyes are rolled back, the soldier instinctively checks your pulse. <i>“... Whoops, did I go a little bit overboard?”</i>");

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
	if(DontKnowName) output("the ");
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
	if(DontKnowName) output("the ");
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
	if(DontKnowName) output("the ");
	output("[enemy.name] croons with delight. She arches her back and presses needily against you.");

	output("\n\nYou groan with delight as she wrings your [pc.cock " + x + "]. Her alien cunt feels so damn <i>good</i> squeezing around you. It’s all you can do not to blow your load. You firmly grab ");
	if(DontKnowName) output("the ");
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
	output("\n\n<i>“... Delicious - your [pc.cumNoun] really is delicious,”</i> she murmurs. <i>“");

	if(firstTime) 
	{
		output("Does all of it taste like that, or just yours?");
		if(gold) flags["BONED_GOLD_DESERT"] = 1;
		else flags["BONED_RED_DESERT"] = 1;
	}
	else output("I really am addicted to the taste...");

	output("”</i>\n\nWhen she can finally stand, ");
	if(DontKnowName) output("the ");
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
			if(DontKnowName) output("The ");
			output("[enemy.name] waggles the vibrator at you, filling your imagination with eight semi-solid and pleasure-ready inches. ");
			removeRedDildo();
		}
		else
		{
			output("From her kitpack, ");
			if(DontKnowName) output("the ");
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
			output("\n\nYou notice there’s a sizable lump in her kitpack. Curious, you ask her what’s inside of it.");
			output("\n\nSurprised by your interest, the amber-haired ant-girl pulls out an imposing dildo, a full eight inches of veiny goodness. It’s shaped just like a myr cock, but instead of being scarlet, it’s a mottled green from tip to base with the occasional splotch of chocolate brown.");
			output("\n\n<i>“... This? It’s standard issue for us girls in the trenches. I’ve spent many a happy night with the Private inside of me, both of us quivering away.”</i>");
			output("\n\nYou ask ");
			if(DontKnowName) output("the ");
			output("[enemy.name] if she could use it on you. She blinks her big black eyes, clearly surprised by your request. At the same time, she gulps, and a delighted flush travels across her cheeks.");
			output("\n\n<i>“... Of course. I mean, I’m no stranger on using it on other" + pc.mf("s"," girls") + ",”</i> she smiles. The beautiful deserter gestures for you to lie back on the ground and you do so. She straddles your waist, sitting on top of you, and touches the toy against the tip of your nose.");
			output("\n\nThere’s a clicking noise. The synthetic wang begins to wizz against your sensitive nose. It’s shaped like a dildo, but it’s actually a vibrator? Two separate motors - one in the tip and another in the base - wildly whir.");
			output("\n\nDoes it look so thick because it’s right in front of your eyes, or is it <i>really</i>that big? A matching shiver courses through you, starting at your nose and ending at your [pc.toes].");
			flags["RED_MYR_DESERT_DILDO_DONE"] = 1;
		}
		//Else / Not First Time:
		else
		{
			output("\n\nYou ask ");
			if(DontKnowName) output("her ");
			output("[enemy.name] if she could use the Private on you. She shoots you a saucy grin, clearly happy with your request.");
			output("\n\n<i>“... Of course. Lie back and I’ll whip him out,”</i> she smiles. The beautiful deserter gestures for you to lie back on the ground and you do so. She straddles your waist, sitting on top of you, and touches it against the tip of your nose.");
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
			if(pc.isCrotchGarbed()) output(" under your [pc.lowerUndergarments]");
		}
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
		if(DontKnowName) output("The ");
		output("[enemy.name] whispers. She sensuously strips off your [pc.upperUndergarment] and");
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
	if(DontKnowName) output("The ");
	output("[enemy.name] pulls back, then plunges it deep into your ");
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
		if(DontKnowName) output("the ");
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
		if(DontKnowName) output("the ");
		output("[enemy.name] nestled against your side. She looks up at you with one big, black eye and the other scarred one, peering through her messed up amber hair. Lightly, she grasps at your chest, nails teasing your [pc.skinFurScales].");
		output("\n\n<i>“S-so, that was fun,”</i> she breathily states. You’re acutely aware of her pert, naked breasts pressing up against you. <i>“... Um, I guess I should get going? Hopefully I’ll see you around...”</i>");
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

	//PC Loss:
	if(combatLoss)
	{
		output("While you lie on the ground, the buxom beauty begins to slowly strip of her torn battle garb. It’s not long before you’re staring longingly at her honey-hued skin and ring-pierced nipples. Despite yourself, your ");
		if(pc.hasCock()) 
		{
			output("[pc.cocks] stiffen");
			if(pc.cockTotal() == 1) output("s");
			if(pc.hasVagina()) output(" and ");
		}
		if(pc.hasVagina() || !pc.hasCock()) output("you feel a delicious tingling sensation deep in your loins");
		output(".");
		if(hasGoldDildo())
		{
			output("\n\nExulting in her power, the myr searches through your stuff, though ultimately, she’s only interested in her fat strap-on. She reclaims it with a flourish.");
		}

		output("\n\nStriding up to you, ");
		if(DontKnowName) output("the ");
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
			output("\n\n<i>“Mmm, I think I’m going to borrow </i>this<i> for a while,”</i> the naked deserter sultrily purrs, <i>“... You don’t mind, right?”</i>");
			output("\n\nRegardless of your answer, the busty battle-maiden strips off your [pc.gear]. You’re left lying there with your aching [pc.cocksLight] brazenly exposed. Despite your embarassment - or perhaps because of it - your [pc.cockHeads] swell");
			if(pc.cockTotal() == 1) output("s");
			output(" with arousal.");
		}
		//Else PC GotNoCock:
		else
		{
			output("\n\n<i>“Mmm, you’re lacking a little something-something here,”</i> the naked deserter sultrily purrs, <i>“... Thankfully, ");
			if(hasGoldDildo()) output("you've brought back");
			else output("I’ve got just");
			output(" the thing to fix that.”</i>");
			output("\n\nFirst, the busty battle-maiden strips off your [pc.gear]. After this, she ");
			if(hasGoldDildo()) {
				output("waggles the strap-on she just reclaimed - ten-plus inches of low-hanging fruit with an extra berry on the back for the wearer's pleasure.");
				removeGoldDildo();
			}
			else output("reaches into her kitpack. Out comes a rather impressive looking strap on - ten inches of golden veiny goodness. There’s another, smaller protrusion on the other side, designed to stimulate the wearer. It’s double-ended!");
			output("\n\n<i>“We trench girls have got to help each other out. This little beauty is no fun on your own, you know? That’s where you come in,”</i> the raven-haired soldier explains, <i>“... ");
			if(pc.hasVagina()) output("How about both of us have a good time?");
			else output("I’ll have to remove the other end though. Sorry hon!”</i>");
		}
		//NeuterPC:
		if(!pc.hasGenitals()) output("\n\nShe quickly unfastens the inner dildo and tosses it aside. You flush with embarrassment. So, you’re going to be ridden like a living sex-doll?");
	}
	//Else PC Win/Consent:
	else
	{
		if(pc.hasCock())
		{
			output("You ask the buxom beauty if she'll hop on your cock and take it for a ride.");
		}
		//First Time Seeing Dildo Screw Scene:
		else if(flags["DILDO_SCREW_SCENE_SEEN"] == undefined)
		{
			output("You notice there’s a sizable lump in ");
			if(DontKnowName) output("the ");
			output("[enemy.name] kitpack. Curious, you ask her what’s inside of it.");

			output("\n\nThe raven-haired ant girl blushes and pulls out a strap-on dildo. It’s pretty impressive - ten inches of veiny goodness - and the same hue as a gold myr’s cock.");

			output("\n\n<i>“... This? The Gilden Republic issues this to all the girls on the front line. We’ve got to use it on each other, mind you, since we can’t easily play with ourselves.”</i>");

			output("\n\nYou notice there’s another, smaller protrusion on the other side, designed to stimulate the wearer. It’s double-ended!");
			if(pc.hasVagina()) output(" You ask her if you can use it on her.");
			else output(" You ask her if it can be removed so you can use it on her.");
		}
		//Else / Not First Time Seeing Scene:
		else
		{
			output("Knowing that ");
			if(DontKnowName) output("the ");
			output("[enemy.name] has a double-ended dildo in her knapsack, you ask her if you can use it with her.");
		}
		output("\n\nShe blinks her big black eyes, clearly surprised by your request. At the same time, she gulps, and a delighted flush travels across her cheeks.");

		output("\n\n<i>“O-of course!");
		if(flags["DILDO_SCREW_SCENE_SEEN"] == undefined && !pc.hasCock()) output("I mean, I haven’t had anyone to use it with for a while,");
		output("”</i> she breathily answers. <i>“Take off your things and lie down - I promise you won’t regret it.”</i>");

		output("\n\nYou do as she asks, stripping off your [pc.gear] and lying back. As you watch on, the buxom beauty begins to slowly strip of her torn battle garb. It’s not long before you’re staring longingly at her honey-hued skin and ring-pierced nipples. Despite yourself, your ");
		if(pc.hasCock()) 
		{
			output("[pc.cocks] stiffen");
			if(pc.cockTotal() == 1) output("s");
			if(pc.hasVagina()) output(" and ");
		}
		if(pc.hasVagina() || !pc.hasCock()) output("you feel a delicious tingling sensation deep in your loins");
		output(".");
		if(!pc.hasGenitals()) output(" Meanwhile, she quickly unfastens the inner dildo and tosses it aside.");
	}
	//PC Has No Cock:
	if(!pc.hasCock())
	{
		output("\n\nYou lustily gaze at her pendulous breasts and ring-pierced nipples as she slides the strap-on into place.");
		if(pc.hasVagina()) output(" A moan escapes your lips as your end slides gently into [pc.onePussy].");
		output(" The female deserter smiles and makes sure the straps are done tight, until they’re well and truly hugging your [pc.hips].");
	}
	output("\n\n<i>“Head against the ground,”</i> the buxom beauty requests. As you do so, she stands above your head. Lowering herself down to her knees, she squats over your face. Her bare loins are thrust against your face and she squeezes her ample thighs against your cheeks. You’re pinned down!");
	output("\n\nDown below, you feel ");
	if(pc.hasCock()) output("[pc.oneCock]");
	else output("your strap-on cock");
	output(" being rubbed against with her ovipositor pussy. Since her abdomen stretches so far, it’s nothing for the ant-girl to face-sit on you while riding you with the pussy on her alien hindquarters.");

	output("\n\n<i>“I like this position - I can look down into your eyes as we fuck,”</i> ");
	if(DontKnowName) output("the ");
	output("[enemy.name] giggles, touching your [pc.hair] with her fingers.");

	output("\n\nThe feeling is mutual - looking up from between her thighs, your world is filled with her massive mammaries and the golden hoops piercing her puckered nips. It’s a truly exquisite sight!");

	var x:int = 0;
	if(pc.hasCock()) 
	{
		x = pc.cockThatFits(enemy.vaginalCapacity(0));
		if(x < 0) x = pc.smallestCockIndex();
	}
	if(pc.hasGenitals()) 
	{
		output("\n\nAt the same time, her dripping lower lips are gently teasing your ");
		if(pc.hasCock()) output("[pc.cockHead " + x + "].");
		else output("fake cock-head and stirring up your own pussy in the process.");
		output(" You moan as she lowers herself onto your shaft, swallowing it whole inside her sopping wet honeypot.");

		output("\n\n<i>“Ooohh queens!”</i> The nipple-pierced deserter moans. Your ");
		if(pc.hasCock()) output("[pc.cockHead " + x + "] penetrates her until it’s lightly brushing against her cervix,");
		else output("gilded cock is soon fully sheathed inside of her and her waist is pressed against your own.");
		output(" Slowly, she begins to gyrate on top of you, all the while squeezing and wringing your ");
		if(pc.hasCock()) output("sensitive");
		else output("synthetic");
		output(" shaft. At the same time, her hands rest on your [pc.hair] and her jiggling thighs needily clutch your cheeks.");
	}
	//PC GotCock:
	if(pc.hasCock())
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
	if(DontKnowName) output("the ");
	output("[enemy.name]’s deepest depths. Quivering and shaking, you wrap your arms around her thick thighs. You can’t hold out any longer - you’re going to cum!");

	//GotCock:
	if(pc.hasCock())
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
		if(DontKnowName) output("the ");
		output("[enemy.name] pulls herself off you. Her slick juices dribble all over your waist and you let out a pleasured sigh. After giving you a single kiss on the lips, she pulls the strap-on off your exhausted body, and stashes it back in her kitpack.");

		output("\n\n<i>“I’d love to linger, but I really must get going,”</i> she informs you, an inflection of regret in her voice. However, after she’s done dressing, you’re pinned down once more");
		if(pc.credits >= 2) output(" as she steals some of your credits - and you’re too spent to resist!");
		else output(" as she searches you for credits - and you're too spent to resist!");
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
		if(DontKnowName) output("the ");
		output("[enemy.name] pulls herself off you and rests against your chest. The pressing of her large, warm breasts, mixed with the cold contrast of her nipple rings, is incredibly pleasant. At the same time, ");
		if(pc.hasCock()) output("your [pc.cum] runs down her thighs and drips onto your [pc.legOrLegs]");
		else output("her girl cum dribbles down her legs and onto your [pc.skinFurScales].");

		output("\n\n<i>“Mmm... that was wonderful,”</i> she dreamily murmurs. Some of her arms wrap around your waist, while the others stroke your cheeks. <i>“It can get lonely out here in the middle of nowhere. Hopefully I’ll see you around...”</i>");
		output("\n\nOnce she’s done cuddling, she pulls herself off you, and you both get dressed. With one last kiss, she slips away into the night. As enjoyable a victory as that was, it’s probably time to move on.");
	}
	if(!pc.hasCock()) flags["DILDO_SCREW_SCENE_SEEN"] = 1;
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
		var bonusChance:int = pc.cumQ()/ 50 + 10;
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
	output("Hang on a second.... You look down on the ground and notice there’s a piece of fabric on the ground. Leaning down and picking it up, you realise they’re Briha’s panties. Did she leave them behind? They’re pretty standard issue for a military girl; camo t-backs, with a notably wet crotch.");

	//[Take] [Leave]
	clearMenu();
	addButton(0,"Take",takeBrihasPanties,undefined,"Take","Pick those panties up and keep 'em - they're spoils of war!");
	addButton(1,"Don't",dontTakeBrihasPanties,undefined,"Don't","Leave them where they are. Gross.");
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
	output("Hang on a second. You look down on the ground and notice there’s a piece of fabric on the ground. Leaning down and picking it up, you realise they’re Lys’s panties. Did she leave them behind? The black sheer panties are rather alluring and definitely not military issue. You notice they’ve got a noticeably wet crotch.");
	//[Take] [Leave]
	clearMenu();
	addButton(0,"Take",takeLysPanties,undefined,"Take","Pick those panties up and keep 'em - they're spoils of war!");
	addButton(1,"Don't",dontTakeLysPanties,undefined,"Don't","Leave them where they are. Gross.");
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
	
}