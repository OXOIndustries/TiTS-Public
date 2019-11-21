import classes.Items.Toys.MindwashVisor;
//Mindwash Visor - By Adjatha with some Poached CoC scenes on the sliiiiide
//CoC Scenes for Mindwash Visor:
//https://docs.google.com/document/d/12UPRoKZyNskoJNRsNElMZ_0QDixsJDs76q3LOJIExtU/edit?usp=sharing
//Add the flagged CoC scenes as bonus content for the Visor, using static body variables


/*
Additional Visor smut scene ideas
Futa - The Galaxy's Worst Delivery Girl (uniform, hat, thigh-high stockings, cocksock, blasted liberally by folks who don't want to pay)
Female - Does a Body Good (huge breasted, milky milf with breast pumps hooked to a dildo, the more she orgasms, the more milk is pumped from her tits to her womb)
Male - Size Matters (twinky male bullied by two hyper-endowed dickgirls, smooshed between their cocks while they frot one another with the protag between them)
Female - Daily Chores (farm life gal has stable filled with futa who must be milked for their cum like cows in an unusual way: condom blowjob inflated inside the gal's throat)
Futa - Thrill of the Hunt (bounty hunter in 'zero suit' hunting for bestial humanoid alien seed is overcome and spit-roasted between them)
Male - Sensitivity Training (asshole guy is sent by female employer to be hooked up to electric tabs and vibes, making his whole body hypersensitive, cum by mere touch)
Futa - Workplace anti-harassment video where the player is the aggressive boss and harasses their employees in exaggerated, stereotypical fashion w/ voiceover scolding
Male - Tank Kannon as a secret agent, hit by a mega dongulator ray by evil lethian Dr. Elle Phantis, she splits into three girls, brains, boobs, and butt (doc, elle, and phanny?)
Neutral - "Top Sluts: Spotting the Best" instructional video of going to bars, clubs, and brothels, explaining pros and cons of various sluts in mile-a-minute coked-out way
*/

//Broken Lotus
//Allows the player to view a random Mindwash Visor scene from the Lotus Eaters VR Lounge on Canadia Station (maybe a discount of 250 credits)
//Add "Broken Visor" to Luca's "Business" prompt
// [Broken Visor]
//Mouseover (not yet selected) - One of the booths has an "Out of Order" sign over it. Damage from an overexcited guest, maybe?
//Mouseover (repeat) - The damaged VR booth is still roped off, but you're welcome to give it another try. Cost: 250 credits

//Broken Visor - First Time
public function mindwashBrokenVisor():void
{
	clearOutput();
	showLuca();
	author("Adjatha");
	if(flags["LUCAS_MINDWASH"] == undefined)
	{
		output("You ask Luca about the closed off booth.");
		output("\n\n<i>“Ah yes,”</i> she frowns, her expression darkening. <i>“Not all damage comes from rowdy patrons. In this case, I believe we’ve had a saboteur. And right under my nose, too! If I ever catch who did it...”</i>");
		output("\n\nYou ask her what’s wrong with the machine?");
		output("\n\nShe lets out a sigh and waves dismissively. <i>“Rather than playing the approved simulations, that one seems to be picking up random extranet porn. Even worse, the safety limiters have been utterly stripped from the thing. Tess said the damage is so severe, I’d have to replace the whole thing.”</i>");
		output("\n\nYou’re a little surprised she’d keep something that might not be safe to use. Why not trash it?");
		output("\n\n<i>“Well, it’s not my poor baby’s fault, is it? Besides, I don’t think it’s extremely dangerous, just not up to the professional standards of my parlor. I think...”</i>");
		output("\n\nThe modded dzaan gives you an appraising look, her emerald eyes sweeping up and down while her plump lips purse in thought. <i>“I don’t suppose you’d like to take a look for me? See how safe it is to use? I won’t even charge you for it.”</i>");
		processTime(3);
		clearMenu();
		// [No Way] [Couldn’t Hurt]
		addButton(0,"No Way",noWayMindwash);
		addButton(1,"Couldn’t Hurt",mindwashingCouldntHurt);
	}
	else
	{
		output("<i>“Good luck,”</i> Luca offers as you head through the draped privacy cloth covering the sabotaged booth.");
		output("\n\nAs you settle in, you consider that it’d probably be best to keep your messes to a minimum. You strip, putting your equipment away from the splash zone and take your seat.");
		//if Bubble Buddy & penis:
		if(checkToyDrawer(BubbleBuddy) && pc.hasCock()) 
		{
			output(" Speaking of messes, you pull out your Bubble Buddy, and secure it on your [pc.cockBiggest]. Picking up goo-filled condoms is a much easier cleanup than wiping down the interior of your ship!");
			if(pc.cockTotal() > 1) output("\n\n ...not that it’s going to do anything for the mess left by the rest of your body. But hey, every little bit helps.");
		}
		output("\n\nYou make yourself comfortable and put on the ‘Mindwash’ Visor. A feeling of elated disorientation passes just behind your eyes as your brain does the mental gymnastics needed to survive the visor’s hypnotic displacement. It flickers from a dangerously vibrant pink color to a more comforting blue and your muscles relax as the light radiates into you.");
		pc.credits -= 250;
		//play random Mindwash scene
		processTime(3);
		clearMenu();
		addButton(0,"Next",startMindwashSceneLucas);
	}
}

public function startMindwashSceneLucas(choice:String = "menu"):void
{
	var characterSelect:Boolean = true;
	if(!pc.hasStatusEffect("LucasMindwash")) pc.createStatusEffect("LucasMindwash");
	// Maybe allow players to select gender if we have a lot of these eventually. Tech Specialists can get in there and slow down random selector enough to get a gender choice while non-Techies have to use a computer-savvy follower to do it for them?
	if(characterSelect && choice == "menu")
	{
		clearOutput();
		showName("SELECT\nCHARACTER...");
		author("Adjatha");
		
		output("A menu spits a torrent of small, preview images out. With the sheer volume of smut available, it’d be impossible to focus on a single one. With a little effort, you could at least narrow down what kind of character you’ll be inhabiting.\n\nAlthough... there’s a pink flashing selection marked “CoC” that always seems to be there. You could give that a go.");

		if(isHalloweenish()) output("\n\nA glowing, orange box pops up, interrupting your experience before it even starts. It reads <i>“Click here if you dare!”</i> and has a small, photo-negative picture of a screaming face next to it. Is this some kind of advertising? A virus? Or maybe somebody’s just been screwing with the machine?");
		
		processTime(1);
		clearMenu();
		// [Random] [Male] [Female] [Futa]
		// After making a selection, the game displays a random scene from the appropriate gender
		addButton(0,"Random",startMindwashSceneLucas, "random");
		addButton(1,"Male",startMindwashSceneLucas, "male");
		addButton(2,"Female",startMindwashSceneLucas, "female");
		addButton(3,"Futa",startMindwashSceneLucas, "futa");
		addButton(4,"Game: CoC",startMindwashSceneLucas,"CoC");
		if(isHalloweenish()) addButton(5,"Pop-Up Ad",startingThisShit,undefined,"Pop-Up Ad","This hacked scenario seems to be holiday-related. Maybe it’s worth checking out? From what you can see, you’ll be playing from the point of view of a male avatar. The whole thing seems vaguely sketchy. Hopefully it doesn’t give you some kind of brain virus.");
		return;
	}
	if(characterSelect && choice != "random")
	{
		RandomInCollection(mindwashSceneList("Luca", [choice]))();
		return;
	}
	
	RandomInCollection(mindwashSceneList("Luca"))();
}

// [No Way]
public function noWayMindwash():void
{
	clearOutput();
	showLuca();
	author("Adjatha");
	output("Strap yourself in to a sabotaged machine with no safety system in place? Sounds like a good way to get your brain burned out! You ");
	if(pc.isNice()) output("politely");
	else if(pc.isMischievous()) output("wryly");
	else output("firmly");
	output(" decline the patroness’ offer and excuse yourself. You’re nobody’s guinea pig.");
	//end and remove [Broken Visor] from Luca’s menu
	flags["LUCAS_MINDWASH"] = -1;
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

// [Couldn’t Hurt]
public function mindwashingCouldntHurt():void
{
	clearOutput();
	showLuca();
	author("Adjatha");
	//non-bimbo
	if(!pc.isBimbo()) output("<i>“I’ve dealt with plenty of crazy machines, I think I can handle this one. Besides, it’s just a little porn, right?”</i>");
	//Bimbo
	else output("<i>“A free ride in the porn machine? And you’re not even going to charge me?”</i> You bounce up and down, clapping your hands in excitement. <i>“Strap me in! Strap me in!”</i>");

	//merge
	output("\n\nLuca smiles and leads you to the roped off booth. Privacy curtains have been hung all around it, but she pulls them aside for the two of you to step in. The state of the machine is a sad one. The compact and stylish visor has been pulled apart and vandalized into little more than a series of plates and wires with a holoscreen between them. The far end of the booth has even been defaced with graffiti, renaming the machine the “Mindwasher”.");
	output("\n\nYou can see why she was reluctant to let anybody near this thing.");
	output("\n\nLuca excuses herself from the booth, visibly upset by what’s been done to it. With a bit of trepidation, you take off your equipment and a seat and lower the thin plates of the Mindwash machine to either side of your head. The curved hardlight screen flickers across your field of vision before engulfing your senses. A small host of error messages scroll across the screen before the pink light fades to a soft blue. Your body seizes up, muscles straining and the hot wash of panic surging up your gullet. You force yourself to relax, and the tension melts away. It seems your body can have only one master at a time and the visor is in control for now.");

	//Play random Mindwash Visor scene
	processTime(3);
	clearMenu();
	addButton(0,"Next",startMindwashSceneLucas);
}

public function mindwashNextButtonAndStatAwardsAndClears(cumNum:Number):void
{
	clearMenu();
	pc.taint(1);
	pc.libido(2);
	var noCumHarvest:Boolean = false;
	//Using the mindwash in Lucas
	if(pc.hasStatusEffect("LucasMindwash"))
	{
		pc.removeStatusEffect("LucasMindwash");
		//Can't cum harvest on first go-round
		if(flags["LUCAS_MINDWASH"] == undefined)
		{
			noCumHarvest = true;
			eventQueue.push(brokenMindwashVisorEpilogue);
		}
		IncrementFlag("LUCAS_MINDWASH");
	}
	else if(pc.hasStatusEffect("BadgerMindwash"))
	{
		pc.removeStatusEffect("BadgerMindwash");
		if(flags["BADGER_MINDWASH"] == undefined) noCumHarvest = true;
		IncrementFlag("BADGER_MINDWASH");
	}
	if(!noCumHarvest && checkToyDrawer(BubbleBuddy) && pc.hasCock())
	{
		if(cumNum <= 300) quickLoot(new SmallCumBubble());
		else if(cumNum <= 4000) quickLoot(new MediumCumBubble());
		else if(cumNum <= 10000) quickLoot(new LargeCumBubble());
		else quickLoot(new HugeCumBubble());
	}
	else addButton(0,"Next",mainGameMenu);
}

//After scene ends, add the following:
public function brokenMindwashVisorEpilogue():void
{
	clearOutput();
	showName("\nAFTERMATH");
	author("Adjatha");
	output("You’re still feeling lightheaded when you stumble out of the booth. Luca shuffles to your side and offers her arm to help you from tumbling over. <i>“Well? Is my baby okay?”</i> she asks with motherly worry.");
	output("\n\nYou relate what happened, more or less.");
	output("\n\n<i>“Well, at least it doesn’t seem to be outright dangerous, but I certainly can’t just open it up to the public. People with less mental fortitude might walk away still believing they’re the characters from the simulation! I’ll have to think on what to do with my poor, damaged visor.”</i>");
	output("\n\n<i>“I suppose you’re welcome to use it in the meantime. I’ll even give you half off, as a way of saying ‘thank you’ for testing it out for me.”</i>");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

/*Mindwash Visor
//harvested from the Doll Maker and added to your key items menu. Able to install in your ship.
//alternately: buy a Tamani Corp version for mega buxxx?

//Add Mindwash Visor to Dr. Badger’s inventory if the player has not harvested it from the Doll-Maker
//Buy It From Badger
// [Mindwash x1] 5,250 credits
//mouseover: A pair of shallow, nipple-like plates that - once attached to the head - link via a hardlight holo-screen. Apparently Badger heavily modified this so that it broadcasts porn directly onto your memories, as if they were little more than blank canvas. Dangerous to use out in the open, so you’ll have to install it in your ship if you want to try it out.
*/

// [Install]
//upon returning to your ship and using the “Mindwash” item
public function installTheMindwashVisor():void
{
	clearOutput();
	showName("\nINSTALLING");
	author("Adjatha");
	//Not in ship.
	if(!InShipInterior())
	{
		output("You can’t make use of it without any power. Maybe take it back to your ship?");
		clearMenu();
		addButton(0,"Next",useItemFunction);
		return;
	}
	output("Now that you’re safe aboard your vessel, you can take a look at the Mindwash Visor you got from the Bimbotorium. The device is quite small, little more than a pair of plastic discs connected by a curving screen of hardlight. Despite the light hum it lets off, there is a socket on one side that’ll have to be hooked into your ship’s power supply. It seems the little toy is quite an energy hog.");
	output("\n\nYou plug it in next to a large, comfortable seat somewhere not too conspicuous and examine Badger’s visor. With the power on, its normally passive holoscreen is blinking with an inviting pink glow. One last check-through reveals an “intensity” gage on the side. It seems to go from “Fuck Me Up” all the way to “Tabula Rasa” so you go ahead and dial that down to the lowest setting. No sense in taking undue risks when dealing with Badger Tech.");
	output("\n\nNow that you’ve got it, though, do you really want to use it?");
	output("\n\n<b>“Mindwash” has been added to your masturbate menu while on your ship!</b>");
	processTime(4);
	flags["MINDWASH_VISOR_INSTALLED"] = 1;
	pc.destroyItemByClass(MindwashVisor);
	clearMenu();
	//Go back to inventory instead?
	addButton(0,"Next",useItemFunction);
}

// [Mindwash]
public function installedMindwashBonus(btnSlot:int = 0):void
{
	output("\n\nThe Mindwash Visor you purchased from Doctor Badger is placed close by, currently on idle mode.");
	
	addButton(btnSlot, "Mindwash", mindwashMeShipVers, false, "Mindwash Visor", "Doctor Badger’s hypnosis-inducing holovisor that has been dialed down to be used safely.");
}
public function mindwashMeShipVers(fromMasturbate:Boolean = true):void
{
	clearOutput();
	showName("\nMINDWASH!");
	author("Adjatha");
	output("A holovisor that has been significantly altered by Doctor Badger. While broadcasting smut, it induces a state of semi-hypnosis in the viewer, suppressing their sense of self and thrusting them into the role of one of the characters instead. At max power, it could very well be used to brainwash someone, but you’ve turned down the intensity, so it should be safe to use recreationally.");
	
	processTime(3);
	clearMenu();
	
	output("\n\nWill you plug in");
	
	var backFunc:Function = (fromMasturbate ? masturbateMenu : shipStorageMenuRoot);
	
	//Add Yammi and Pexiga scenes if there is demand for it
	//Maybe get other folks to write a scene or two for Anno & Reaha trying out the Visor?
	var eligibleCrew:Array = [];
	if(celiseIsCrew()) eligibleCrew.push("Celise");
	//if(yammiIsCrew()) eligibleCrew.push("Yammi");
	//if(pexigaIsCrew()) eligibleCrew.push("Pexiga");
	//if(annoIsCrew()) eligibleCrew.push("Anno");
	//if(reahaIsCrew()) eligibleCrew.push("Reaha");
	if(shekkaIsCrew()) eligibleCrew.push("Shekka");
	
	if(eligibleCrew.length > 0)
	{
		output(", or convince " + (eligibleCrew.length == 1 ? "your crew member" : "one of your companions") + " to give it a spin");
		
		addButton(0,"Me",useShipMindwashMeee);
		
		var btnSlot:int = 1;
		
		for(var i:int = 0; i < eligibleCrew.length; i++)
		{
			if((btnSlot + 1) % 15 == 0)
			{
				addButton(btnSlot, "Back", backFunc);
				btnSlot++;
			}
			switch(eligibleCrew[i])
			{
				case "Celise": addButton(btnSlot,"Celise",mindwashCelise); btnSlot++; break;
				//case "Yammi": addButton(btnSlot,"Yammi",mindwashYammi); btnSlot++; break;
				//case "Pexiga": addButton(btnSlot,pexigaName(),mindwashPexiga); btnSlot++; break;
				//case "Anno": addButton(btnSlot,"Anno",mindwashAnno); btnSlot++; break;
				//case "Reaha": addButton(btnSlot,"Reaha",mindwashReaha); btnSlot++; break;
				case "Shekka": addButton(btnSlot,"Shekka",useMindwashOnShekka); btnSlot++;
			}
		}
		if(btnSlot > 14)
		{
			while((btnSlot < 59) && ((btnSlot + 1) % 15 != 0)) { btnSlot++; }
			addButton(btnSlot, "Back", backFunc);
		}
	}
	else addButton(0, "Use", useShipMindwashMeee);
	
	output("?");
	
	addButton(14, "Back", backFunc);
}

// [Me]
public function useShipMindwashMeee():void
{
	clearOutput();
	showName("\nMINDWASHING...");
	author("Adjatha");
	//first time
	if(flags["BADGER_MINDWASH"] == undefined)
	{
		output("With a bit of trepidation, you take off your gear, take a seat, and lower the thin plates of the Mindwash machine to either side of your head. The curved hardlight screen flickers across your field of vision before engulfing your senses. A small host of error messages scroll across the screen before the pink light fades to a soft blue. Your body seizes up, muscles straining and the hot wash of panic surging up your gullet. You force yourself to relax, and the tension melts away. It seems your body can have only one master at a time and the visor is in control for now.");
	}
	//repeat
	else
	{
		output("It’d probably be best to keep your messes to a minimum. You strip, setting your equipment away from the splash zone and take your seat.");
		if(checkToyDrawer(BubbleBuddy) && pc.hasCock()) 
		{
			output(" Speaking of messes, you pull out your Bubble Buddy, and secure it on your [pc.cockBiggest]. Picking up goo-filled condoms is a much easier cleanup than wiping down the interior of your ship!");
			if(pc.cockTotal() > 1) output("\n\n ...not that it’s going to do anything for the mess left by the rest of your body. But hey, every little bit helps.");
		}
		output("\n\nYou settle in and put on the Mindwash Visor. A feeling of elated disorientation passes just behind your eyes as your brain does the mental gymnastics needed to survive the visor’s hypnotic displacement. It flickers from a dangerously vibrant pink color to the more comforting blue and your muscles relax as the light radiates into you.");
	}
	//merge
	processTime(3);
	clearMenu();
	addButton(0,"Next",mindwashVisorScenes);
}

public function mindwashVisorScenes(choice:String = "menu"):void
{
	var characterSelect:Boolean = true;
	
	// Maybe allow players to select gender if we have a lot of these eventually. Tech Specialists can get in there and slow down random selector enough to get a gender choice while non-Techies have to use a computer-savvy follower to do it for them?
	if(characterSelect && choice == "menu")
	{
		clearOutput();
		showName("SELECT\nCHARACTER...");
		author("Adjatha");
		
		output("A menu spits a torrent of small, preview images out. With the sheer volume of smut available, it’d be impossible to focus on a single one. With a little effort, you could at least narrow down what kind of character you’ll be inhabiting.\n\nAlthough... there’s a pink flashing selection marked “CoC” that always seems to be there. You could give that a go.");
		if(isHalloweenish()) output("\n\nA glowing, orange box pops up, interrupting your experience before it even starts. It reads <i>“Click here if you dare!”</i> and has a small, photo-negative picture of a screaming face next to it. Is this some kind of advertising? A virus? Or maybe somebody’s just been screwing with the machine?");
		processTime(1);
		clearMenu();
		// [Random] [Male] [Female] [Futa]
		// After making a selection, the game displays a random scene from the appropriate gender
		addButton(0,"Random",mindwashVisorScenes, "random");
		addButton(1,"Male",mindwashVisorScenes, "male");
		addButton(2,"Female",mindwashVisorScenes, "female");
		addButton(3,"Futa",mindwashVisorScenes, "futa");
		addButton(4,"Game: CoC",mindwashVisorScenes,"CoC");
		if(isHalloweenish()) addButton(5,"Pop-Up Ad",startingThisShit,undefined,"Pop-Up Ad","This hacked scenario seems to be holiday-related. Maybe it’s worth checking out? From what you can see, you’ll be playing from the point of view of a male avatar. The whole thing seems vaguely sketchy. Hopefully it doesn’t give you some kind of brain virus.");
		return;
	}
	
	pc.createStatusEffect("BadgerMindwash");
	
	if(characterSelect && choice != "random")
	{
		RandomInCollection(mindwashSceneList("Badger", [choice]))();
		return;
	}
	
	RandomInCollection(mindwashSceneList("Badger"))();
}

public function mindwashSceneList(sourceType:String = "", choices:Array = null):Array
{
	var sceneList:Array = [];
	
	// Auto generate choices if no paths provided (random)
	if(choices == null || choices.length <= 0)
	{
		choices = [];
		choices.push("male");
		choices.push("female");
		choices.push("futa");
		choices.push("neutral");
	}
	
	switch(sourceType)
	{
		case "Badger":
			if(choices.indexOf("male") != -1)
			{
				sceneList.push(pumpTheSpy);
				sceneList.push(invasionOfTheDickSuckers);
				sceneList.push(cowifiedMindwash);
				sceneList.push(jezebelMindwash);
			}
			if(choices.indexOf("female") != -1)
			{
				sceneList.push(petPro);
				sceneList.push(doorToDoorDildos);
				sceneList.push(gymTripScene);
			}
			if(choices.indexOf("futa") != -1)
			{
				sceneList.push(poorLittleWhiteGel);
				sceneList.push(bodysuitBubblesScene);
				sceneList.push(breakingTheLaw);
			}
			break;
		case "Luca":
			if(choices.indexOf("male") != -1)
			{
				sceneList.push(pumpTheSpy);
				sceneList.push(invasionOfTheDickSuckers);
				sceneList.push(cowifiedMindwash);
				sceneList.push(jezebelMindwash);
			}
			if(choices.indexOf("female") != -1)
			{
				sceneList.push(petPro);
				sceneList.push(doorToDoorDildos);
				sceneList.push(gymTripScene);
			}
			if(choices.indexOf("futa") != -1)
			{
				sceneList.push(poorLittleWhiteGel);
				sceneList.push(bodysuitBubblesScene);
				sceneList.push(breakingTheLaw);
			}
			break;
	}
	if(choices.indexOf("CoC") != -1)
	{
		sceneList.push(impMobAmbush);
		sceneList.push(akbalScene);
		sceneList.push(kitsuneSex);
		sceneList.push(goldKitsune);
		sceneList.push(goldKitsuneII);
		sceneList.push(redKitsuneLoss);
		sceneList.push(followingKitsunes);
		sceneList.push(sanuraFucksPC);
		sceneList.push(fuckingSphynx);
		sceneList.push(cumWitchBadEnd);
		sceneList.push(sandMotherFuck);
		sceneList.push(yvonneFuckies);
		sceneList.push(ceraphPetPlay);
		sceneList.push(loppeTheRabbot);
		sceneList.push(heckelScene);
		sceneList.push(roxanneDrinkingScene);
		sceneList.push(cinnabarPortals);
		sceneList.push(driderTableTurner);
		sceneList.push(gloryholesScene);
		sceneList.push(minotaurDream);
		sceneList.push(minotaurXCowgirls);
		sceneList.push(minotaurSubmission);
		sceneList.push(minotaurCampBadEnd);
		sceneList.push(minotaurUrethralFuck);
		sceneList.push(izmaVictory);
		sceneList.push(izmaLoss);
	}

	if(sceneList.length <= 0) return [mainGameMenu];
	
	return sceneList;
}

//Male Scenes
//1 - Pump the Spy
public function pumpTheSpy():void
{
	clearOutput();
	showName("PUMP\nTHE SPY");
	author("Adjatha");
	output("The visor’s light grows brighter and brighter before resolving with crystal clarity in an instant.");
	output("\n\nYou stand, arms crossed over your chest, as the gabilani girl rouses from the knock on the head your goons gave her. She’s not much to look at - a mere three and a half feet tall with narrow hips and a svelte frame. Her green skin is stuffed into a tight, black bodysuit, her arms and legs stretched wide and bound to an inclined table. She shakes her head, sending a cascade of long, red hair tumbling over her sharp features, black eyes slowly coming to focus.");
	output("\n\n<i>“The infamous Agent ‘Goblin,’ captured at last,”</i> you begin, rolling the name over your tongue with relish. <i>“We almost had you, back on Kakaris, but you’re every bit as slippery as the rumors say. We took a pretty big hit on that one.”</i>");
	output("\n\nThe spy narrows her eyes, testing her bonds one by one. <i>“Glad to be of assistance,”</i> she retorts. <i>“Anything to keep a credit or two out of your bank account, Thoroughbred.”</i>");
	output("\n\nYou lean forward, resting your palms on her plump inner thighs as you loom with suitable menace. <i>“Ah, but now that I’ve actually seen you, your weakness is all too clear. A gabilani who’s never given birth,”</i> you chuckle. <i>“That’s got to be some kind of miracle.”</i>");
	output("\n\nBeads of sweat trickle down her forehead and into her small cleavage. <i>“What? How would you-”</i>");
	output("\n\n<i>“These hips don’t lie,”</i> you interrupt, running your hands over the spy’s slim haunches. <i>“But don’t worry, I think with a little training, we could make quite a broodmother out of you.”</i> Seizing the thin latex of her suit right at the girl’s crotch, you give a savage yank and tear a hole in it. The flushed, emerald skin of her plump pussy shines up from the gap in her glossy black outfit.");
	output("\n\nWith a grin of wicked satisfaction, you throw off the clasps of your own uniform, revealing the charcoal hued sheath and heavy, basketball-sized testies swinging low against your knees. <i>“No one steals from Thoroughbred and gets away with it, Agent Goblin. It’s time you learned your place.”</i>");
	output("\n\nInch after inch of your massive, equine member begins expanding out of your sheath, flopping down heavily against the squirming operative. It grows inexorably, until all three feet of your bloated breeder lays atop the green girl. In all, your shaft is easily five inches across, with a fat medial ring and bulging veins that pulse with the effort of keeping your erection at full mast. <i>“I’ve broken more rebellious mares than you, gabilani slut.”</i>");
	output("\n\nShe wears a grin of defiance, but the heat radiating from her body tells a different story. <i>“Do you expect me to beg, Horse Member?”</i>");
	output("\n\nUsing both hands to guide the flat crown of your bitch-tamer to the tear in her suit, you press the mammoth cock against her fat pussy lips just hard enough to leave her gasping. <i>“No, Ms. Goblin,”</i> you laugh. <i>“I expect you to get fucked.”</i> Pushing hard, you force the blunt peak of your flesh pillar into the squirming saboteur, groaning at her tightness.");
	processTime(10);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",pumpTheSpyII);
}

public function pumpTheSpyII():void
{
	clearOutput();
	showName("PUMP\nTHE SPY");
	author("Adjatha");
	output("The short gabilani shudders, biting back a strangled cry. She grits her teeth and winces as her tender depths are savaged by the swollen lust of your eye-wateringly thick pole. She twists and pulls at her restraints as you buried inch after inch inside her. Hips quivering and chest dripping with sweat, she tosses her head side to side, unable to keep herself from moaning with long-denied need.");
	output("\n\nYou pull one hand up, bracing it against her thigh as your cock bottoms out inside of her. You grunt and give her a few thrusts, growing progressively fiercer with each one. <i>“What, already?”</i> you grumble. <i>“A third of my length is all you can handle? You’re not getting off that easily.”</i>");
	output("\n\nSnapping your fingers at your burly ausar goons, they step up on either side of the secret agent’s head. One roughly grabs her fiery mane of red hair, yanking her head back with his right hand while the left clenches down around her throat. The man zips open the crotch of his uniform, revealing a hefty 10 inches of canine cock, erect and ready to go. He positions himself inches from her reclined face, letting his dick twitch against her cheek as he reaches into a pouch at his side. He produces a handful of slightly gelatinous capsules that seem to glow with an eerie, emerald light.");
	output("\n\n<i>“It might not surprise you to know that most cunts in this galaxy can’t handle me,”</i> you gloat, giving the cock-stuffed slut a hard pump. <i>“But that’s what science is for, see? With a little GaloMax, you bitches will take every last inch and beg for more.”</i> With another nod, your waiting lacky carefully balances three of the pills on the shovel-like peak of his red rocket and jams it into the green girl’s mouth. Her eyes go wide and she chokes, but the meager might of her tongue is not enough to resist the unforgiving strength of the muscled ausar holding her. Every last bit of the thug’s meat slips past her lips until her nose is squashed up against his taut balls.");
	output("\n\n<i>“And just to make sure you don’t spit those pills back up,”</i> you narrate as your face-fucking tough produces a bright pink, hexagonal pill and swallows it with practiced ease. The result is immediate: his body shivers, his muscles tense, his abdomen rumbles, and he blasts a hot load of spunk right down the green girl’s throat, washing the GaloMax down with it.");
	output("\n\nYour underling pulls back before he knots the spy’s mouth, giving her enough air to sputter and gasp. <i>“W-what did you do to me? Everything feels... hot!”</i> Her perspiration-slick skin seems to shimmer, growing wetter and wetter until every inch of her body has a freshly oiled appearance. She pants, pulling at her restraints and finding the tight bindings no longer hold her. Her hands slip right out with a moist, squishing sound.");
	output("\n\nYou give her tummy an open-palmed smack and grin as the impact ripples across her frame. <i>“Don’t worry, I’ve just expanded your talents, Agent Goblin. Or, should I say, Agent Gooblin?”</i> You unhook and throw off the leg tethers before grabbing her behind her knees and hoisting her legs up. There’s only the slightest tension as you press her thighs against her breasts, practically folding the girl in two. She gasps and moans, unable to believe just how stretchy she’s become. <i>“Oh, it gets better,”</i> you assure her.");
	processTime(10);
	pc.lust(15);
	clearMenu();
	addButton(0,"Next",pumpTheSpyIII);
}

public function pumpTheSpyIII():void
{
	clearOutput();
	showName("PUMPING\nTHE SPY");
	author("Adjatha");
	output("Letting loose your animalistic instincts, you brace yourself with the slut’s inner thighs and pound into the freshly stretchy spy’s cunt. Despite its tightness, it offers little in the way of restriction for your mass. The wet warmth of her body parts before your inches as foot after foot slams into her with slurping, suckling relish. She gapes in disbelief as her womb is filled by your flesh and expands upwards, visibly distending her gut and chest. A nearly perfect imprint of your arm-thick pole bulges under her skin, pushing up past her stomach and between her breasts.");
	output("\n\n<i>“M-my whole body is a pussy,”</i> she moans, her eyes rolling up in unexpected bliss. <i>“Oh... oh... oh fuck!”</i> she pants, breathlessly stroking the swell of your penetrating puss crusher. <i>“Fuck me,”</i> she whispers and sighs. <i>“Fuck me!”</i> Her high, thin voice becomes more frantic, crying out with sweet delight as you rock the little whore along your mast like a gooey green sex toy.");
	output("\n\n<i>“You want it, don’t you?”</i> you tease growling into her blissed-out face. Before she can answer, you hoist her upright pulling her down on your colossal cock like a spear. You grab both of her wrists and use them to pull her body down after every frenzied thrust tosses her small frame up, into the air.");
	output("\n\n<i>“Yes! Yes!”</i> she screams, the bulge of your shaft smacking against her lower jaw each time she’s yanked back down onto you. <i>“Oh! OH! FUCK! BREED ME YOU BEAUTIFUL EQUINE BASTARD! MAKE ME YOURS!”</i> she wails in orgasmic rapture.");
	output("\n\nYou grab her shoulders and turn her 90 degrees on your dick before hoisting her ankles up around her long, floppy ears. With a satisfied grunt, you release your seed deep into the broken bitch, her body no more than the latest in a long line of your cum dumps. Her throat bulges as your peak fountains hot cream into her freshly elastic womb. You watch with delight as her body fattens and shudders, drunk with your spunk.");
	output("\n\nHer narrow waist bloats, stomach swelling up with a pregnant bump that swiftly balloons into a nine-month burden. With her womb full to bursting, the gooey consistency of her body starts finding new places to redirect the weight of your subsequent loads. Your cream flows through her, filling her pathetically flat chest, expanding meger A-cups to a proper whore’s double Ds. Her ass inflates to cushiony orbs that practically beg for pounding. Even her hips and thighs fill out, growing wider and fatter until she looks every bit the broodmother you promised her.");
	output("\n\nWrapping one arm around her throat and leaning in close, you listen to her ecstatic mumbling. Her whole body swollen with your seed, the tight, black bodysuit she was wearing finally gives out - tearing at the seams across her legs, hips, gut, and bust. <i>“You’re not going to be very useful as a spy, Agent Gooblin, but I bet I can think of some use for you,”</i> you chuckle.");
	processTime(20);
	pc.lust(20);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",pumpTheSpyIV,cumNum);
}

public function pumpTheSpyIV(cumNum:Number):void
{
	clearOutput();
	showName("PUMP\nTHE SPY");
	author("Adjatha");
	output("Before you can subject the secret agent to any more of your endless depredations, light floods your eyes. You struggle, reaching out to hold on a bit longer but the visor’s scene has ended and you return to the real world. It takes you a minute or two to readjust to your real body and remember than you’re not the super villain Thoroughbred.");

	//player does not have a penis
	if(!pc.hasCock())
	{
		output("\n\nYou instinctively reach down to stroke your mammoth length, only to remember it was a simulation. Almost like a phantom limb, you can still feel the ghost of the colossal cock swinging from your hips, throbbing with need. You gradually get up and put your equipment back on.");
	}
	//player has a penis but no Bubble Buddy
	else if(!checkToyDrawer(BubbleBuddy) || cumNum == 0)
	{
		output("\n\nYou glance around and realize your in-simulation orgasms were matched by real world ones as well.");
		if(cumNum <= 0) {}
		else if(cumNum < 20) output(" Spurts of jizz have left dripping blobs on the panels and across the floor. It’s a bit embarrassing, but shouldn’t be too hard to clean up.");
		else if(cumNum < 100) output(" Large puddles of cum are pooled around your feet and you even seem to have hit yourself with some of it while you were under. You clean up as best you can, but somebody else is going to have to give this place a good scrub. Whoops!");
		else if(cumNum < 4500) 
		{
			output(" The panels around you are practically coated with the dripping curtain of cum you’ve released. Your body didn’t fare much better, and everything is sticky. You should really consider getting something to catch all this next time!");
			pc.applyCumSoaked();
		}
		else 
		{
			output(" A sudden wave of exhaustion hits you and you numbly glance around. Every surface is coated in dripping streams of spunk, from the walls to yourself, and even the machine itself. Thankfully, it seems to be waterproof. You don’t have the energy to clean up, so you’ll just have to stew in your own juices for a while longer.");
			pc.applyCumSoaked();
		}
		output(" You gradually get up and put your gear back on.");
	}
	//player has a penis and a Bubble Buddy
	else
	{
		output("\n\nWhen you’ve finally put the after-effects of the simulation aside, you note that your rubbery cum-sheath has a present for you. It seems your VR orgasms were mirrored in real life and the Bubble Buddy has collected the results. You twist-seal the package and put your gear back on.");
		// {player gains cum bubbles as if taking the Masturbate option with the Bubble Buddy}
	}
	mindwashNextButtonAndStatAwardsAndClears(cumNum);
}

//2 Cow-ified
public function cowifiedMindwash():void
{
	clearOutput();
	showName("\nCOW-IFIED");
	author("Adjatha");
	output("As you walk briskly along the buzzing, neon-lit hall, you wave and flashing your big, bright smile to the clients you pass. A glance to one side catches your reflection in a mirrored meeting room window, so you pause to make a few adjustments. The figure smiling back at you is a young, svelte man, dressed in a sensible but stylish charcoal-grey number. Your suit is fitted exceptionally well and accented with a bold green-silver that picks out your clear, sharp eyes. You give yourself a wink before picking up your earlier, peppy pace.");
	output("\n\nWhen you make it to the meeting room, you’re feeling positively buoyed by the appraising looks you felt from those you passed on the way. Normally, you’d just shut down small fish like the two young, red-skinned vulkrim waiting impatiently for you. Clients without corporate backing tend to have too slim a return on investment to be worth the lending risk - at least, for someone like yourself anyway. But, you notice that the two scorpion-tailed men can’t help but seem taken aback at your cultivated style. You figure you’ll at least let them pitch their offer before rejecting it.");
	output("\n\n<i>“Gentlemen. How can you make money for my employer and I?”</i>");
	output("\n\nThe taller of the two, a Vulkrim with curving horns and a barrel-chested physique that strains against his ill-fitting suit, stands with a cough. <i>“Well, uh, it’s like this: We’ve got an invention that’ll make millions, but we need money for, um, distribution.”</i>");
	output("\n\nYou offer a polite laugh and lean back in your chair. <i>“Well, that’s a good start. Convince me.”</i>");
	output("\n\nThe big guy gives a goofy smile of relief and turns it over to his partner. The shorter of the two men fidgets with the spectacles at the bridge of his nose. <i>“You are, no doubt aware of the farming aggregate world ‘New Texas?’ What we want to do-”</i>");
	output("\n\nYou cut him off with a gesture and fold your hands on the table with a sigh. A pity - you were in such a good mood, too. <i>“I’m going to have to stop you there, boys. No doubt you’ve some proposal to vie for a share of New Texan milk money. Believe me when I say that I’d love it if you had a chance. There’s a ton of money locked in that monopoly.”</i> You sigh wistfully.");
	output("\n\n<i>“Unfortunately, it’s not going to work. Their ‘Treatment’ is far too effective. Any attempt at competition doomed from the start. I’ve looked into it on behalf of a half dozen people just like you two. There’s no way to get in there and make a profit.”</i>");
	processTime(10);
	clearMenu();
	addButton(0,"Next",cowifiedMindwashII);
}

public function cowifiedMindwashII():void
{
	clearOutput();
	showName("\nCOW-IFIED");
	author("Adjatha");
	output("<i>“But, if you aren’t willing to try, then they’ll always be on top,”</i> the shorter Vulkrim protests, his crimson cheeks darkening to a russet, wine-colored flush.");
	output("\n\n<i>“We love investing in new Bioengineering,”</i> you shrug, <i>“but you’re not going for anything new, are you? Just reinventing the wheel. Been done, patented, and monetized. Our money’s better spent on cutting edge frontiers, not to start a tech war with,”</i> you wet your lips with the tip of your tongue, <i>“an incumbent hegemony.”</i>");
	output("\n\nThe tall vulkrim boy looks lost, turning to his companion for help, but the spectacled fellow merely grits his teeth, the plates of his chitin shifting under his cheap suit. Addressing you instead, the big guy produces a glowing tablet. <i>“Won’t you even look at the prospectus? The trial cases? Anything?”</i>");
	output("\n\n<i>“No can do, fellas,”</i> you puff, rising from your chair with a conciliatory gesture that indicates the meeting is over. <i>“Thanks for coming in and best of luck on your next moo.”</i>");
	output("\n\nYou blink. That was weird. You sniff the air, noticing a faint hint of citrus, as if someone had freshly zested a fruit. The big vulkrim looks just as surprised as you, but the shorter just stares with a dark, faint smile.");
	output("\n\n<i>“Ahem. As I was saying. We can’t moo the loan for your moo, but maybe another, smaller firm can moo your moooooo-”</i> Slapping your hands over your mouth, you take a step backwards. Beads of sweat start forming on your forehead. Something’s wrong. You reach for your pocket tablet, to call in security, but lose your focus as a band of heat wraps around your chest and chokes off your breath. The front of your suit coat begins drifting into your field of vision and you jerk back in shock as your chest expands before your eyes.");
	output("\n\n<i>“See,”</i> the smaller, devilish inventor sneers. <i>“We’re well past the concept stage. Aerosol instead of injection. 700% faster transformation. Sure, there’s the vocal bug, but that’s a small issue. And the best part? It’s gender indiscriminate. Anyone can become a milk cow. Well, except vulkrim, of course. Safety first.”</i>");
	output("\n\nSure enough, your pectorals are vanishing beneath the milky bulk of your newly acquired breasts as he speaks. You stumble towards the door, but a bout of vertigo drops you to your knees. A throbbing in your head turns to a splitting headache as small horns sprout from your brow. <i>“This is moo! I’ll moo the U.G.C.! You’ll never moo away with mooooo!”</i> You cry out in desperation as a slim, tufted tail slides out over the waist of your slacks.");
	output("\n\nThe big guy seems nearly as panicked as you are. <i>“We didn’t discuss this! I’m pretty sure this is illegal! Oh man, oh man, we are gonna get in so much trouble...”</i>");
	processTime(10);
	clearMenu();
	addButton(0,"Next",cowifiedMindwashIII);
}

public function cowifiedMindwashIII():void
{
	clearOutput();
	showName("\nCOW-IFIED");
	author("Adjatha");
	output("<i>“Relax!”</i> his partner scolds. <i>“It’s fine. Look how docile she’s getting.”</i> You blink, suddenly aware of how slack your posture has become, your movements dulled and sluggish. Wait, ‘she?’ You feel your face, only to find your masculine jaw has softened to a gentle curve, complementing your puffing lips and lengthening eyelashes.");
	output("\n\n<i>“Moo!”</i> you moo in protest. As if echoing your anger, the seams of your tailored suit groan. One by one, the very expensive stitches split along your fattening thighs and tits. Still prone, you try to stand but find the liquid weight filling your bovine acquisitions too much to handle. Buttons pop off as your cup size multiplies out of control.");
	output("\n\n<i>“None of our tests did anything like this! You gotta turn it off!”</i>");
	output("\n\n<i>“She just needs a little release,”</i> the smaller vulkrim grins, walking around you with an appraising eye. <i>“Isn’t that right, cow?”</i> His segmented tail whips around and smacks hard against your freshly cushioned rump, pulling a fresh moo from your fatigued form. <i>“She’s just as excited about this as we are, see? Get on board and tend to the slut already.”</i>");
	output("\n\nThrowing off the torn remnants of your ripped suit, the scorpion man invites his partner to a full look at your new body. Despite your panic, fear, and anger, the involuntary transformation has not left you untouched by its exhilarating sensitivity. Additionally, it seems that the feminizing effects of whatever gas the red-skinned inventors released, your cock has remained unchanged. Nine inches of stiffness bob with needy throbs above your taut balls.");
	output("\n\nThe taller, more sympathetic of the two stares unabashedly at your exposed organ and gulps. <i>“Well... it SEEMS like he’s enjoying it.”</i>");
	output("\n\n<i>“She,”</i> the smaller one corrects. <i>“Cows are female, bulls are male. Now, get over here and fuck this slutty cow.”</i>");
	processTime(10);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",cowifiedMindwashIV);
}

public function cowifiedMindwashIV():void
{
	clearOutput();
	showName("\nCOW-IFIED");
	author("Adjatha");
	output("Despite the worried nervousness on his face, the bigger scorpion-featured man moves behind you and runs his tail along the generous curve of your posterior. <i>“J-just so you know, I’m doing this under protest,”</i> he assures you.");
	output("\n\nPulling off his belt and stepping out of his pants, he reveals his own, thick member. The vulkrim’s shaft is as dusky crimson as his face, robed in loose foreskin about the sloped, spaded peak. You gulp, your tail flicking in upwards in an unintentionally inviting gesture.");
	output("\n\nA pinch on your breasts brings you back to the small man who has crouched next to your fattening tits. On the balls of his feet, he seizes both of your freshly thickened nipples between his forefingers and thumbs. <i>“Feels good, doesn’t it?”</i> he mocks. <i>“Being made into a cash chow instead of milking one? How about we get a sample for your bosses to taste?”</i>");
	output("\n\nHis pinching grip tightens, squeezing your flush peaks between his coarse knuckles. Rolling back to front in slow, cruel motions, the scarlet man tugs instantly at your massive mounds. A tremble shudders through you, nerves aflame with a building needs for release that drives you to hands and knees with gasping, mooing tremors.");
	output("\n\nA gradual, steady pressure below your flicking tail becomes a sudden, suffocating fullness in your lower half. A high, sharp <i>“Moo!”</i> squeaks from your mouth as you force a ragged gasp from your overburdened chest. A pillar of stiff heat pushes into your rump with startling ease. The larger vulkrim grunts as his mast plows through your clenching rear, wearing your depths around his thickness like a too-tight sheath. You stretch to accomodate his girth even as your own prick leaps and bobs, waves of distress knocking aside your dignity. Ropes of jizz spurt your helpless bliss across the muted carpet.");
	output("\n\nWith the big man drilling your overstuffed ass and the other finger-fucking your over-filled melons, it takes scarcely any time to reduce you to a mooing, moaning cow slut. Little more than a slave to the intoxicating abuses piled upon you, your body feels utterly defenseless. Each hip-slapping thrust sends spasms of orgasmic fire to your swollen, empty member.");
	output("\n\nThe raw tugging at your udders is eventually rewarded with jets of pale white. Streams of milk spray from your engorged teats just like a prize cow. You expected an emptying feeling of relief and release for your first milking, but every calcium-laden spurt only adds to the flooding pressure swelling within your colossal cups.");
	output("\n\nRough fingers clenching around your thick thighs is all the warning you get before the scorpion-tailed man behind you launches into a body-swaying, frantic pace. Each stroke pumps the fullness of his manhood through your suckling sphincter and slams his tensed, firm abdomen against your wobbling asscheeks with loud, crisp claps. His heavy, swinging sack slaps your achingly exhausted balls with encouraging thwacks.");
	output("\n\nYou moo with unexpected huskiness as a fresh bolt of bliss cuts through your fatigued and over-wrought sissy-shaft. When your ass-pounding partner seizes your bovine tail with a hard tug and sprays hot, thick seed deep into your core, your body finds the strength for yet another orgasm. One final, untapped reserve of liquid lust mainlines through your painfully hard member in an explosive, spunk-spraying climax of complete surrender.");
	output("\n\nYou collapse atop your torso-sized endowments, panting, mooing, and staring into empty space as sticky passion is pumped into your fattening gut like a second heartbeat. Milk flows freely from your nipples, coaxed by the pressure of your body alone. The orchestrator of your humbling transformation wipes the milk from his hands with the tattered remnants of your extremely expensive and completely ruined suit. <i>“See? Works like a charm,”</i> he chuckles.");
	output("\n\nThe other man, finally finished flooding your rump with his seed, pulls out with a long, satisfied sigh. A steady stream of cum trickles out from your anal creampie while the one responsible cleans his shaft on the jiggling mass of your bovine ass. <i>“Yeah,”</i> he agrees, wiping his brow and buckling his overalls. <i>“But, um, how do we move her?”</i>");
	output("\n\nThe little guy gives you an appraising look. <i>“Hrm. That’s... that’s actually a good point. We probably should’ve done this closer to our place.”</i> With your ZZZ-cups each nearly the size of the rest of your body, you look less like a powerful, dynamic bank officer and more like a run-down cow trying to smuggle a pair of flesh-tone galotians under your chest. The devilish inventor gives you an experimental push, but only manages to send you swaying atop your milk-filled mountains.");
	output("\n\n<i>“Shoot. This milk-cow thing will be tougher to set up than I expected.”</i>");
	output("\n\n<i>“Plus, we’d need all the bottles and labels. Also somebody to transport the product to stores and off-world. Not to mention advertising...”</i>");
	output("\n\n<i>“Can I tell you something?”</i>");
	output("\n\n<i>“Sure.”</i>");
	output("\n\n<i>“I don’t even like milk very much. This just seemed like an easy way to make money.”</i>");
	output("\n\n<i>“Oh. Actually, me neither. I just thought the transformation bit was pretty cool and I didn’t want to discourage you.”</i>");
	output("\n\n<i>“Well, back to the drawing board. Maybe we could do something with honey?”</i>");
	processTime(20);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",cowifiedMindwashV,cumNum);
}

public function cowifiedMindwashV(cumNum:Number):void
{
	clearOutput();
	showName("\nCOW-IFIED");
	author("Adjatha");
	output("And, at that, the two leave the meeting room, discreetly turning on the ‘Meeting In Progress’ message on the exterior of the gently closing door. You vaguely wonder if the folks at New Texas are accepting resumes. Groaning as you feel more milk filling in your chest, light floods your eyes. You struggle, reaching out to hold on a bit longer but the visor’s scene has ended and you return to the real world. It takes you a minute or two to readjust to your real body and remember than you’re not a man-turned-heifer.");

	//player does not have breasts
	if(pc.biggestTitSize() < 1) output("\n\nYou instinctively reach forward to soothe your aching breasts, only to find [pc.chest]. You sigh and tell yourself it was a simulation. Almost like a phantom limb, you can still feel the ghost of the colossal rack hanging from your body, throbbing with need. Donning your gear before you head out, you give the machine a suspicious glance. It sits there, motionless.");
	//player has breasts
	else if(!pc.canLactate() && !pc.isLactating())
	{
		output("\n\nYour [pc.breasts] ache as you come to, but you’re conspicuously dry. It takes you a moment to remember that you’re not actually lactating, though your [pc.nipples] are as stiff and sore as if gallons had just been sucked from you. It’s a difficult and uneasy dissociation for you to manage, but you do your best to block out the intrusive, false memories while you put your gear back on and head out.");
	}
	//player has breasts and is lactating
	else
	{
		output("\n\nYour [pc.breasts] ache as you come to, and it’s not hard to see why. Apparently the vigorous VR milking you’d been experienced in simulation has managed to affect your actual mammaries as well! Streams of the warm fluid run down your skin and pool on the ground");
		if(pc.canMilkSquirt()) output(", and it seems like your squirting even managed to soak the panels in front of you!");
		else output(".");
		output(" Cleaning up what you can, you eventually put your gear back on and leave the visor alone for now.");
		pc.milked();
	}
	processTime(4);
	mindwashNextButtonAndStatAwardsAndClears(cumNum);
}

//3 Invasion of the Dick Suckers
public function invasionOfTheDickSuckers():void
{
	clearOutput();
	showName("DICKSUCKING\nINVASION");
	author("Adjatha");
	output("<i>“But Ace, I don’t think we’re supposed to be up here. Isn’t this, like, some kind of military base?”</i>");
	output("\n\n<i>“Aw, come on, Blu. Where’s your spirit of adventure? Besides, I’m almost positive the meteor crashed somewhere around here. Maybe it was a ship and somebody needs help!”</i>");
	output("\n\nYour gal gives an uncertain smile, but follows along all the same. The black scaled gryvain girl is taller than most terrans, yourself included, but manages to seem smaller as the two of you push through the wooded hillock. She wraps an arm around yours as your path takes you past the treeline and into a clearing of flattened brush and smouldering trunks. <i>“Do you hear that?”</i> she whispers, her azure-lacquered lips warm against your ear. <i>“Some kind of low whistle?”</i>");
	output("\n\nThe ground here is little more than a shallow crater and at its center lies a large, faintly glowing stone. <i>“Aw, it’s just some space junk,”</i> you sigh. <i>“Sorry to drag you all the way out here, Blu.”</i>");
	output("\n\nYou turn to your girlfriend, but something seems to have come over her. There is an intenseness to her gaze and she is already taking tentative steps toward the crater. Before you can catch up with her and ask what’s going on, you hear the crackle of electrostatic and voices from close at hand.");
	output("\n\n<i>“Shoot... I think you might’ve been right about that military base,”</i> you loudly whisper back to Blu. <i>“Lay low, I’ll check it out.”</i> Stooping down, you creep along the periphery of the crater to a recent path leading back to the standing trees.");
	processTime(10);
	clearMenu();
	addButton(0,"Next",invasionOfTheDickSuckersII);
}

public function invasionOfTheDickSuckersII():void
{
	clearOutput();
	showName("DICKSUCKING\nINVASION");
	author("Adjatha");
	output("As you sneak closer, you can just make out five adult-sized shapes lying prone amid the soft brush. Wet slurping and husky moans carry faintly through the eerie hush of the emptied forest, urging you closer and closer, until your voyeuristic curiosity brings you a mere few feet from the apparent orgy.");
	output("\n\nAll five are in various states of undress, but what clothing they are still wearing all seems to be identical, dull fatigues. Some kind of security team? The two terran males you can spy are on their backs, eyes pinched shut and fingers digging into the dirt with bliss. Their bodies are poured over by hungering attentions the female members of the group. A grey furred ausar girl has her mouth and much of her throat filled with one man’s cock while the bronze-skinned dzaan and dark blue ovir take turns suckling at the other man’s shaft in long strokes.");
	output("\n\nA hot blush floods your cheeks as you gradually back away. Just some guards having fun, you figure as you’re turning back to check on Blu at the crater. Your foot loudly strikes a small, black rectangle and you look back to see if the rutting strangers heard anything. No one’s attention seems to be on you, so you carefully inspect what you nearly tripped over.");

	output("\n\nThe object proves to be a palm-sized communications device that faintly crackles while a nearly unheard voice talks quickly on the other end. You raise the com to your ear and listen in, only to realize the other voice isn’t just excited, it’s frantic. <i>“ Major Whang? Private Driver? Anyone? Do not - repeat - do NOT approach the female members of your unit! Exposure means contamination! Their lips! It’s in their lips!”</i>");

	output("\n\nAs you listen, you peer through the dim night back towards the orgy. Looking more carefully, you noticing something strange about all of the girls there. Each seems to be wearing identical, glossy black lipstick that doesn’t smudge no matter how much they smear their mouths all over the throbbing flesh of their companions. More than just this, you realize, their lips are huge- pornstar huge! The swollen puckers form glistening onyx ovals from just below their noses that reach almost all the way to their chins.");

	output("\n\nAs you watch with a mix of fear and arousal, it’s almost as if the donut-shaped lips are actually pulling the women’s heads on their dick-sucking mission. Their half-lidded eyes and disconnected expressions take on a new character as the sound of their slurping and sucking grows louder and more desperate. The men, utterly at the mercy of the cock-thirsty women, groan with the overture of release, but you dare not stay a moment longer.");

	processTime(10);
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",invasionOfTheDickSuckersIII);
}

public function invasionOfTheDickSuckersIII():void
{
	clearOutput();
	showName("DICKSUCKING\nINVASION");
	author("Adjatha");
	output("Rushing back to the crater, you find Blu crouched at its edge, looking at your with confusion. <i>“What-?”</i>");
	output("\n\n<i>“No time,”</i> you yell as you take her hands and lift her to her feet. <i>“We gotta go! Some kind of infection... black lips... dick sucking...”</i> you pant unable to properly articulate what you’ve just seen. Rather than explain further, you pull your gryvain gal with you back the way you came. The trees whizz past in your flight and it’s not until you see the light of the city that you slow down enough to catch your breath.");
	output("\n\n<i>“I... I think we’re safe,”</i> you pant, giving Blu a great big hug. <i>“I- I don’t know what I saw. But we’ve got to call somebody. Have them check on those people. And that glowing rock. What even was that?”</i>");
	output("\n\n<i>“Hrm? Oh, it was nothing. Like you said: probably some space junk. It just had this oily goop inside. I dunno how it was glowing, though. That was kinda weird,”</i> Blu remarks, distractedly chewing her lower lip.");
	output("\n\nYou take hold of the gryvain girl’s shoulders and peer closer at her. <i>“Blu, did... did you wipe off your lipstick?”</i>");
	output("\n\nShe laughs lightly, cocking her head in confusion. <i>“What? What kind of question is that? No, of course not! Wouldn’t be much point in the nick name if I didn’t have my color on, ya goof.”</i>");
	output("\n\n<i>“It’s just... it’s your lips,”</i> you whisper with growing dread. <i>“They’re black.”</i>");
	output("\n\nShe touches her mouth, a bit annoyed. <i>“Ah geez, really? That’s weird. I got this brand ‘cause they said it doesn’t just wipe off. What’s wrong with you, anyway?”</i> she asks as she produces a tube of ultramarine blue and carefully circles her mouth with well-practiced ease. Pressing her lips together and then blowing you a kiss, she rolls her eyes. <i>“Better?”</i>");
	output("\n\nHer lips are still black. If anything, they seem thicker, puffier than just a moment ago. <i>“I think... I think something’s wrong,”</i> you whimper as you take a step back.");
	output("\n\n<i>“Oh don’t be so dramatic,”</i> Blu chides, yawning. <i>“Geez, I didn’t realize that run tired me out so much. Hey, how about we set your mind at ease with a little oral massage?”</i>");
	processTime(15);
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",invasionOfTheDickSuckersIV);
}

public function invasionOfTheDickSuckersIV():void
{
	clearOutput();
	showName("DICKSUCKING\nINVASION");
	author("Adjatha");
	output("<i>“Are- are you feeling okay, Blu? Feeling yourself?”</i>");
	output("\n\n<i>“Of course,”</i> she replies, her eyelids drooping as she fingers the exterior of her gently inflating, polished obsidian lips. <i>“Don’t make me beg,”</i> she sighs as she steps toward you and gently forces you to the ground. The O-ring of her puckered mouth seems to pulse as she moves closer and closer.");
	output("\n\nYour shaft springs upright as she unzips you, the bright metal tab held between her teeth. Wrapping her palms across your hips, Blu leans down to press her lips against the crest of your member, sucking it into her mouth in one fluid motion. Your fingers twitch as she swallows inch upon inch as easily as breathing, your swollen mast slipping between those black, pillowy cushions. Your cock tingles all along its length at the sucking pressure of her mouth. A wild urge to grab her head and pull it down into your lap seizes you, but all force has left your arms. Shuddering, you gasp and moan while Blu finishes her descent with a vibrating purr, pressing her thick, ebony ‘O’ against the very root of your manhood.");
	output("\n\nShe doesn’t look up or even seem troubled by the thickness throbbing inside of her throat. Instead, she pulls back, twisting her head slightly to one side, then the other, savoring every square inch of your texture. Her tongue coils and teases, flicking and stroking while her lips pulse upon you. Bobbing up and down now, she begins her feast in earnest, suckling with increasing urgency while her fingers tighten their curled grip on your waist.");
	output("\n\n<i>“A-ah!”</i> you moan as the first tickling warmth of your orgasm blossoms within you. As if she can feel the nearness of her prize, Blu closes her eyes in complete concentration. The long, gurgling strokes give way to rapid, shallow gulps as she slams herself up and down the bottom inches of your length so fast her lips slap against your skin like a round of lively applause.");
	output("\n\nThe liquid weight of your climax surges within you, unable to withstand the heated embrace of your girl’s moist, wanton maw. You struggle to move through your strange paralysis, but Blu thrusts her own head down onto your lap as if trying to get even just a fraction of an inch closer to your nearing bliss. Her throat and tongue stroke eagerly and, never one to disappoint, the groaning release follows a moment later.");
	output("\n\nGouts of white-hot seed spurt from your tender tip, flooding the gryvain’s cheeks. A massive burst of achingly urgent cream geysers out of you, then a second, then a third. You bite the inside of your own cheek at the impossible volume of your endless release, nearly struck blind by the shivering pleasure electrifying your mind. Blu’s tongue dances across your hydraulic cum vein while her throat clenches and loosens with calm ease. You’re not sure if it’s to manage the overabundance of your release or to milk even more from you. Her shoulders roll and her gullet distends with the magnitude of her meal, gulping down the burdensome bounty one load at a time while her inflated cheeks puff again and again at the pressure of your measureless spunk.");
	output("\n\nDespite the cushiony deathgrip Blu’s lips have on the base of your shaft, the sheer quantity proves too much for her to restrain. Thick, white rivulets spurt past her glossy, raven cocksuckers in wild, pressurized streams. A frothy wash of your alabaster goo fills the narrow space between your lap and your girl’s face. Whip-like ropes of thick ejaculate jet out and slap against the two of you, forming a dripping curtain of hot passion.");
	output("\n\nWhen, at last, she has drained you of every last drop, Blu disentangles her cum-glazed face from your twitching thickness, pausing at the tip for one last kiss. You groan, utterly spent in a whole-body way you’ve never experienced before. The mere thought of movement is impossible - it’s as if she drank down the very core of your body, leaving nothing but an empty husk behind. You look up at her with a feeble, bleary gaze and discover her mouth has transformed into a perfect replica of the huge, inky ovals shared by the female soldiers near the crater. From nose to chin, a throbbing donut of a kisser stands out as black as space and as swollen as a freshly gorged predator.");
	output("\n\nYou try to reach out a hand, but only manage a single twitch of a finger. It doesn’t matter. Blu rises to her feet and casts her gaze out to the lights of nearby civilization. Looking, no doubt, for her next meal. Your vision swims and the faint memory of your gryvain girl’s deep blue scales fades into a dark, endless, ever-hungering blackness.");
	processTime(20);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",invasionOfTheDickSuckersV,cumNum);
}

public function invasionOfTheDickSuckersV(cumNum:Number):void
{
	clearOutput();
	showName("DICKSUCKING\nINVASION");
	author("Adjatha");
	output("The encroaching dusk vanishes in a flood of light as your visor turns off. You blink and scrub at your eyes, trying to put the residual memory of that hot temptation out of your mind. Invading aliens have been a popular smut plot practically forever, but living lipstick? You shake your head in disbelief.");
	//player does not have balls
	if(pc.balls < 2)
	{
		output("\n\nYou instinctively reach down to massage your poor, abused balls, only to remember it was a simulation. Nevertheless, you can still feel the ache of your utterly drained VR testes. You gradually get up and put your gear back on, moving slowly from the phantom fatigue.");
	}
	else if(pc.hasCock())
	{
		if(!checkToyDrawer(BubbleBuddy) || cumNum <= 0)
		{
			output("\n\nYou glance around and realize your in-simulation orgasms were matched by real world ones as well.");
			if(cumNum <= 0) {}
			else if(cumNum < 20) output(" Spurts of jizz have left dripping blobs on the panels and across the floor. It’s a bit embarrassing, but shouldn’t be too hard to clean up.");
			else if(cumNum < 100) output(" Large puddles of cum are pooled around your feet and you even seem to have hit yourself with some of it while you were under. You clean up as best you can, but somebody else is going to have to give this place a good scrub. Whoops!");
			else if(cumNum < 4500) 
			{
				output(" The panels around you are practically coated with the dripping curtain of cum you’ve released. Your body didn’t fare much better, and everything is sticky. You should really consider getting something to catch all this next time!");
				pc.applyCumSoaked();
			}
			else 
			{
				output(" A sudden wave of exhaustion hits you and you numbly glance around. Every surface is coated in dripping streams of spunk, from the walls to yourself, and even the machine itself. Thankfully, it seems to be waterproof. You don’t have the energy to clean up, so you’ll just have to stew in your own juices for a while longer.");
				pc.applyCumSoaked();
				pc.applyCumSoaked();
			}
			output(" You gradually get up and put your gear back on.");
		}
		//player has a penis and a Bubble Buddy
		else
		{
			output("\n\nWhen you’ve finally put the after-effects of the simulation aside, you note that your rubbery cum-sheath has a present for you. It seems your VR orgasms were mirrored in real life and the Bubble Buddy has collected the results. You twist-seal the package and put your gear back on.");
			// {player gains cum bubbles as if taking the Masturbate option with the Bubble Buddy}
		}
	}
	else
	{
		output("\n\nYou instinctively reach down to massage your poor, abused cock, only to remember it was a simulation. Nevertheless, you can still feel the ache of your utterly drained VR testes. You gradually get up and put your gear back on, moving slowly from the phantom fatigue.");
	}
	mindwashNextButtonAndStatAwardsAndClears(cumNum);
}

//Female Scenes
//1 Gym trip
public function gymTripScene():void
{
	clearOutput();
	showName("GYM\nTRIP");
	author("Adjatha");
	output("Stepping through the gym doors, you can’t help but take a quick look around. The sound of clanking metal and grunting effort punctates the busy motion of your fellow exercise enthusiasts. It looks like most of the machines are already filled. Beefy bodies, slick with sweat, pump and heave, their muscles straining to the dull, thrumming beat of a bass-heavy jam. You can’t help but tremble with anticipation as you pull off your shapeless coat to reveal the lean, feminine curves beneath. You give your core a little smack, admiring the flex of your abs in the ceiling-high wall mirrors. Slipping a hairband around your long ponytail, you pull at the thin fabric of your form-fitting 2-piece, adjusting a bit to compensate for your large, stiff nipples before setting out onto the floor.");
	output("\n\n<i>“Best to start with some stretches,”</i> you remark to no one in particular as you head over the corner. Plush floor mats give you a bit of comfort as you hoist one arm over your head, then the other, you breasts straining against the feeble sports bra. You twist at your waist, admiring the subtle bounce in your booty as you flex. Moving down, you give a few slow kicks in the air. Your foot gets a little higher each time until you manage to catch your leg around the calf and pull your knee up to your ear.");
	output("\n\nYou wobble a bit, but manage to keep your balance as the stretch sends little, tight twitches through your thighs and groin. A tall, dark-skinned gryvain woman in a white one-piece pauses next to you, giving an appreciative glance. Her eyes travel from your suspended foot all the way down to your planted toes. She takes a step closer and then another.");
	output("\n\nThe faint bump of her phallus stiffens, swelling with excitement as she takes in the sight of your lean, athletic frame. She raises an eyebrow and gives you an approving nod as her tail follows the path of her eyes, running firmly against your inner leg until it reaches the bulge your pussy lips are making in your skimpy shorts. She gives you a few extra strokes, flitting her tail tip between your lower lips before turning aside, on her way to the sauna with a sly smile.");
	processTime(4);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",gymTripSceneII);
}

public function gymTripSceneII():void
{
	clearOutput();
	showName("GYM\nTRIP");
	author("Adjatha");
	output("<i>“Better make this workout quick,”</i> you muse, watching the draconic woman sashay her way through the space like she were shopping at a meat market. You let your leg drop, shaking out the slight burn and hoist up the other leg in a similar fashion. This time, you draw the attention a small group of fit, ausar men. They jostle one another, chuckling as they approach and, without so much as a word to you, the begin groping your exposed form. Rough hands press against the small of your back and slide down over the taut orbs of your ass. Another pair produces a water bottle filled with a thick, creamy fluid. They tilt your head back and pop the nozzle between your lips before giving it a little squeeze.");
	output("\n\nFocusing as hard as you can on maintaining your balance, you absently swallow the gooey refreshment with deep, thirsty gulps. The dog boys laugh riotously as they grope you harder with each gulp you take. In no time at all, the plastic bottle is nearly empty and your body is throbbing with overheated stimulation. One presses his tongue at the base of your collar bone and draws the hot organ up your neck and across your chin. Then, with riotous laughter, they leave you alone to finish your unsteady, panting stretches.");
	output("\n\n<i>“Everybody’s so friendly here,”</i> you gasp, wiping a stray droplet of your unexpected protein shake from your lips. <i>“So what’s first? Upper body, legs, or core?”</i> A quick survey of the gym reveals that the butterfly press is open, so you strut over and take a seat. Lifting your arms at right angles, you firmly grip the wings on either side of you and, with a slow exhale of breath, draw your forearms forward until the rubber hemispheres on the machine’s arms bump together. You ease the machine back into its starting position, your pecs flexing against the restraint of your top with a faint tearing sound.");
	output("\n\nYou keep up the pace despite the warning, your chest and arms tingling with the effort until, finally, you finish the set. Large holes have torn into the fabric of your top, revealing tantalizing glimpses of your constrained breasts. Another set and the whole thing might just pop open! As is, sweat has left your skin glistening with an oiled polish. More people have stopped their exercises to stare, as if trying to get you to push your fabric to bursting through sheer force of will.");
	processTime(8);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",gymTripSceneIII);
}

public function gymTripSceneIII():void
{
	clearOutput();
	showName("GYM\nTRIP!");
	author("Adjatha");
	output("Moving to the next machine, you’re stopped by an outraged shout that pulls your attention back. A kui-tan girl has taken your place on the butterfly press. She’s dressed in little more than a string bikini that does nothing to hide her fuzzy balls and barely even covers her sheath. She turns in place to demonstrate that her whole back side has been soaked from the sweat you left on the machine.");
	output("\n\n<i>“Walking away without wiping down your machine?”</i> the fuzzy hardbody growls. <i>“Gym foul, bitch.”</i> At that, she reaches out and grabs at your shorts, yanking the thin material hard enough to tear a huge hole in your crotch. She advances, furious and ready to do a lot more than just tear your clothes off.");
	output("\n\nYou stumble back, a bit surprised, but thankfully the girl’s towering, bull-like personal trainer intervenes, darting in low and hooking his arms under her knees. With a huff of effort, he hoists her up and folds her legs up against her chest. He pulls a drawstring and her bikini bottom slips right off");
	output("\n\n<i>“Hey, sorry about that,”</i> he grunts, lifting and dropping the nuki girl atop his equine thickness like it was just part of his normal workout. <i>“No harm done, right?”</i> he asks with a hopeful grin. HIs cock cozy seems to have lost her original spit and vinegar, and has begun counting off reps for her trainer. Her multi-knotted shaft bounces up and down with each cycle but - quite thoughtfully - she’s put a condom on, so the bulging spurts of pre-cum merely make a wobbling bubble at her tip, rather than drench the equipment.");
	output("\n\n<i>“Oh, it was my fault, really,”</i> you assure the two with a laugh before moving on.");
	processTime(8);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",gymTripSceneIV);
}

public function gymTripSceneIV():void
{
	clearOutput();
	showName("GYM\nTRIP!");
	author("Adjatha");
	output("Perhaps it was your run in with the kui-tan, but you find yourself moving to the exercise balls next. Huge and rubbery, the inflated spheres will give you a chance to work out a good variety of muscle groups. You select one with built-in handles and note that this model also has a seven inch rubber canine dildo affixed to it.");
	output("\n\n<i>“Ah, an extra grip. That’s a pretty good idea!”</i> Since you’ve already got a tear, you don’t even bother taking off your skin-tight shorts before planting yourself on the orb, sliding the shaft past your puffy labia and into your drooling depths. Your fingers tighten on the hand grips as your depths clench down on molded rubber inside you. Balancing on the balls of your feet, you begin rocking up and down atop the endowed globe, letting the fat knot smack against your ass each time. Your pace picks up and before long, you’re riding the ball for all it’s worth, panting and moaning as you go.");
	output("\n\nA sudden weight fills your gut and you know that you’ve accidentally taken the knot. You pause, taking an unsteady moment to gather yourself. A passing kaithrit notices your predicament, however, and comes to your aid. <i>“Doing alright?”</i> he ask with a purring slyness. Bracing his hands on your hips he gives you a few toe-curling bounces on the ball, just to make sure you’re stuck. <i>“Yup! Quite a little problem there! No worries, I know just the fix.”</i>");
	output("\n\nHe reaches around and hooks his fingers into the tears in your sports bra. With deliberate slowness, he tears them further and further until, finally, your top gives up the ghost and simply snaps apart, spilling your breasts to the open air. <i>“H-how is that supposed to h-help?”</i> you ask, unable to keep yourself from running a hand across the abdominal bulge left by the massive toy’s bloated knot.");
	output("\n\nThe imposing workout partner’s twin tails snake their way up to wrap around your sweat-slick breasts, squeezing nearly as hard as your thighs on the colorful orb you’ve been bound to. <i>“Hrm? Oh, right! Helping!”</i> He pushes against your back, folding you over while he grabs your ankles and lifts your legs up, leaving you a horizonal plank atop a pliant rubber ball. He tears the hole in your shorts a bit more and slaps his feline cock between your ass cheeks. Rocking you back and forth on the ball, the kaithrit coats his nub-covered member across the slick nectar of your oozing femme cum, polishing your ass at the same time. Then, with his hands firmly around your ankles, he pulls you back, onto his manhood.");
	output("\n\nThe double penetration leaves you moaning like a well-trained whore. The knotty knock in your pussy rubs against the cat boy’s hot meat in your ass, the nerve-filled wall between the two squeezed tighter than any workout could manage. You bounce, sweat, moan and cum as your body is pounded with rhythmic regularity.");
	output("\n\nA pair of ovir slap their long, thick phalluses across your face and you instinctively pull them both into your gasping mouth. With the rubber knot as a fulcrum, you wobble between back and forth between the cat and the lizards, slurping hungrily at both ends. When the cat blasts a hot load up your rectum, he give your ass a firm slap of satisfaction. He pulls out and checks the state of the knot. <i>“Huh. Still in there. Oh well! Good luck with that.”</i> He leaves you to the ovir girls at your front, but not before using his towel to wipe the dripping cum from between your legs. Another fitness enthusiast takes his place, ramming into you without so much as an introduction.");
	output("\n\nYou’re used as a workout machine in this way for an hour or two before, finally, your exhausted, shuddering body gives up its death grip on the exercise ball’s cock. You slide off and slip to the floor, face up and gasping. The slick abs you came in with have vanished under the liquid weight of your distended gut. Packed from both ends, a steady stream of white that oozes across your inner thighs and down your cheeks. A shadow up above draws your attention away from the sight of your bloated belly, only to reveal the kui-tan from before.");
	output("\n\n<i>“Still not cleaning up after you’re done,”</i> she tuts. The condom on her cock has been filled with perhaps two gallons of nuki-spunk, which she removes carefully, holding it above you. <i>“It’s about consideration for others, bitch.”</i> And with that, she drops the over-filled rubber ball onto your face, its un-tied ring spraying hot blobs all over you.");
	output("\n\nBlissed out and dripping everywhere, you wonder if the gryvain girl is still in the sauna. After all this, you could a good steam with a fat-cocked dragon girl.");

	processTime(8);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",gymTripSceneV,cumNum);
}

public function gymTripSceneV(cumNum:Number):void
{
	clearOutput();
	showName("GYM\nTRIP!");
	author("Adjatha");
	output("Light floods your eyes as the porn clip ends and it takes you a minute or two to readjust to your real body. Just about every muscle in your body feels like its gone through a wringer. It’s almost impossible for you to struggle into your [pc.gear] without groaning. Before you leave, you give the visor a quick wipe-down, just in case. ");
	mindwashNextButtonAndStatAwardsAndClears(cumNum);
}

//2 - Door to Door Dildos
public function doorToDoorDildos():void
{
	clearOutput();
	showBust("MIDEE");
	showName("DOOR TO\nDOOR DILDOS");
	output("An inopportune knock at the your apartment’s entry hatch draws you away from the smutty holo you were just getting into. <i>“What timing!”</i> you pout, pausing the explicit material mid-thrust. <i>“Who could that be this late?”</i> With no time to slip panties on, you grab a short, metallic silver skirt and yank a tight, white top over your perky B-cups. With a hurried skip, you cross the room to the polished steel of your door, catching a reflection on the way. A blue-scaled raskvel looks back at you with a pleasantly heart-shaped face. Your ass-length feathery plumage is still quite messy from an hour of your sweaty, panting, private time, but it’ll have to do.");
	output("\n\nPressing a hand to the cool steel port, you open the door to a tall, thin feline girl. From your four-foot vantage, her face is almost entirely obscured by the massive, gravity-defying G-cup tits that are barely squeezed in a too-tight, strapless dress. Covered head to toe in black fur and a short, azure crop of spiked hair, the woman before you flashes a wide grin and steps into your apartment without being invited.");
	output("\n\nWith a breathless enthusiasm she launches into her spiel. <i>“Hiya! I’m Mi’Dee and you’ll never believe what I’m selling! What could it be? Why, thank you for asking! It’s just about the bestest, most amazing thing ever produced by science, and I’m here to show you how it works!”</i>");
	output("\n\n<i>“What-”</i> is all you manage to get out before she starts up again.");
	output("\n\n<i>“You’re a girl, right? Yeah, totally. So, like, this is so cool you don’t even know. Have you ever wondered what it’d be like to have a dick? Sure you have! But gene mods can be expensive and can have all kinds of unwanted side effects like no-reason boners or erections lasting more than 72 hours, though personally I don’t see what’s so bad about that, ya know what I mean?”</i>");
	output("\n\nAs she blathers on, the hyper pussy cat produces a long, red box from her cleavage and clicks it open lengthwise. <i>“But now, you can totally enjoy all the benefits of a cock without all the messy cleanup involved! Ta da!”</i> She holds the contents up for inspection. There is an eight inch dildo nestled in the center and a small, thin ring about as wide as your pinkie.");
	output("\n\n<i>“But I already own-”</i> you start, gesturing at the small pile of toys you’d been using next to the paused holo-smut.");
	output("\n\n<i>“Oh, of course, we all own literally hundreds of dildos already. But this one is different! It’s so supery special that you’ll never even believe how crazy special it is! Just take the ring here,”</i> she nabs the device, <i>“and put it on your favorite clit.”</i> By way of demonstration, she yanks your skirt down around your knees and sinks to her knees in front of you.");
	output("\n\n<i>“Woah, hey!”</i> you protest, a bit embarrassed by how puffy your sapphire lips still are after your prolonged recreation. Your well-jilled clits are swollen to almost thumb-thickness and poke out from your dripping pussy like azure on-switches. Mi’Dee wastes no time, sliding the electronic ring around your top-most feminine nub with practiced ease.");
	output("\n\nA wave of unfamiliar impulses flood your body, washing through you with all the pressing urgency of rocket fuel igniting. Your knees knock, your hips shake, your tail lifts, and your toes curl. Biting down on your lower lip, you take a step forward and nearly collapse, leaning against the curvaceous salesgirl for balance. <i>“What... the...?”</i>");
	output("\n\n<i>“Oh, that’s just the techie stuff doings its, um, stuff! See, the ring is transmitting all the good feelings of the dildo into your little clitty, up your spine, and into your noggin!”</i> She pulls the dildo from the box and sure enough, you can feel the girl’s fingers around the wobbling shaft as if it were hanging between your legs. <i>“So friggin cool, am I right? So, how many can I put you down for?”</i>");
	processTime(10);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",doorToDoorDildosII);
}

public function doorToDoorDildosII():void
{
	clearOutput();
	showBust("MIDEE");
	showName("DOOR TO\nDOOR DILDOS");
	output("Rather than paying attention to her, you jump up and nab the cock from the catgirl and grasp it with both hands. A tremble flits through your stomach and fresh warmth blossoms in your loins. <i>“This is... incredible!”</i> you gasp, stroking the dildo slowly at first. Mi’Dee nods encouragingly as you bring the tip to your lips and start sucking. <i>“I’m- sucking- my own- dick!”</i> you marvel between long, moist kisses.");
	output("\n\n<i>“Oh yeah, it’s super great! So, can I get your credit chit or...?”</i>");
	output("\n\nThe pleasure keeps growing, so you suck deeper and deeper, jamming the shaft deep enough down your mouth to leave a bulge in your throat. A tight tension overtakes your muscles and your fingers tremble, but no matter how much you suck, you can’t quite catch the tantalizing feeling of white-hot completion that seems to hang just out of reach. Desperate, you reach one hand under your top to tweak and massage a nipple while the other hand worries one of your long, dangling ears between your forefinger and thumb. Despite all the normal tricks, you just can’t hit satisfy the new organ.");
	output("\n\n<i>“Wow, you’re getting really into it, huh?”</i> Mi’Dee comments with a nervous smile. <i>“Um, should I just, like, check back later?”</i>");
	output("\n\nThe sound of her voice crystallizes your mounting frustration into an aggressive force. You kick off the skirt around your ankles and leap at the salesgirl with cock-madness in your eyes. She lets out an <i>“eep!”</i> of surprise and stumbles backwards, tripping over her six-inch heels and flattening on the ground. You draw the dildo from your throat as if unsheathing a weapon and brandish the saliva-dripping tool at the startled slut beneath you.");
	output("\n\n<i>“What, um, what are you gonna do with that?”</i> she inquires lightly, squirming between your thick thighs.");
	output("\n\nBy way of an answer, you yank down the top of her dress and expose her massive mammaries to the open air. Pink nipples top the colossal orbs, so you grab both peaks with one hand and squeeze them together while sliding the dildo in between them. Your hips buck as the tight valley of her copious titflesh sucks in your well-lubricated faux-cock and it’s all you can do to keep a hand on the base of it as you pump ferociously through the jiggling pussy cat’s mounds.");
	output("\n\n<i>“Ma’am, this isn’t really how these kinds of demonstrations are supposed to go!”</i> she wails as you use her over-inflated breasts as a heated fuck-sleeve, parting their yielding mass with rapid, relentless strokes. The bliss of your tit-fucking leaves your own cunt drooling with delight, but the climax just won’t come.");
	output("\n\nYou slide off of her stomach just to grab the sex kitten’s tail and flip her over. Hauling up the hem of her dress, you reveal the hefty booty beneath. She appears to have a pair of fist-thick balls and a kaithrit cock of her own, but your main concern is the warm, moist slit between her thighs. Just as she walked right into your apartment without so much as an introduction, you jam the dildo into her as deep as it will go. Mi’Dee yowls with surprise and scratches her fingers into your carpet as her knees go wide. She cranes her head around to say something, but you flatten yourself on her back, face planted in her booty, and use your feet to slam the back of her head down into the plush shag.");
	output("\n\nWith both hands, you pump the cock in and out of the sales girl’s pussy, every fold of her clenching depths transmitted through your body by the clit ring. You twist the shaft, feeling out her squeezing passages with urgent, unsatisfied lust that leaves you shivering. The catgirl’s tail wraps itself around your arms, while she mumbles and moans under your feet.");
	output("\n\nYou can feel her body tense beneath you and the kitty-cock between her legs twitches before discharging steady, pumping streams of jizz all over your floor. Staring at the throbbing balls inches from your nose fills you with envious despair and you spear her again and again with the dildo, feeling every trembling inch of her sweet slit but unable to flood her with the passion endlessly building inside you. <i>“I just... can’t... CUM!”</i> you cry with a mournful wail and everything goes dark.");
	processTime(10);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",doorToDoorDildosIII);
}

public function doorToDoorDildosIII():void
{
	clearOutput();
	showBust("MIDEE");
	showName("DOOR TO\nDOOR DILDOS");
	author("Adjatha");
	output("When the light comes back, you and Mi’Dee are standing side by side, looking at the camera. <i>“We’ve had a lot of fun tonight,”</i> she starts with a wink, <i>“especially me. But abusing sex toys is no joke.”</i>");
	output("\n\n<i>“That’s right,”</i> you add, gesturing at the sticky, femme-cum dripping dildo in your left hand. <i>“Using toys is a great way to have fun by yourself or with others, but when you become reliant on them, you can end up in a situation like we just saw.”</i>");
	output("\n\n<i>“Gene mods can be expensive, but that’s only because you’re paying for quality,”</i> the black-furred catgirl explains, demonstrating her own, extensive modding with a bouncy twirl.");
	output("\n\n<i>“So please, before you go out and buy the latest in simulated pleasure, won’t you consider a more meaningful investment?”</i> You drop the dildo and wrap a hand around Mi’Dee’s waist as encouraging music swells.");
	output("\n\nA low voice over speaks at a rapid pace, just barely loud enough to be heard over the music. <i>“The preceding has been a paid presentation using compensated actors. The views and opinions expressed are not necessarily shared by this station and claims made are for dramatic appeal, not to be taken as literal statement of fact. This info-porn has been brought to you by ManUp and JoyCo. JoyCo: For Your Health.”</i>");
	processTime(5);
	clearMenu();
	addButton(0,"Next",doorToDoorDildosIV);
}

public function doorToDoorDildosIV():void
{
	clearOutput();
	showName("IT’S\nOVER");
	author("Adjatha");
	output("When the VR ends and you return to your body, you’re feeling more confused than disoriented. Is the visor playing first-person infomercials? ");
	if(pc.hasStatusEffect("BadgerMindwash")) output("Dr. Badger really IS evil!");
	else output("No wonder Luca was doubtful about opening this thing up to the general public!");
	//No actual orgasm!
	mindwashNextButtonAndStatAwardsAndClears(0);
}

//3 - Pet Pro
public function petPro():void
{
	clearOutput();
	showName("PET\nPRO");
	author("Adjatha");
	output("You blink to find yourself in a fairly large room, surrounded by huge dogs. No, that’s not quite right. You rub your eyes to reveal that what you took for mastiffs are, in fact, ausar wearing bondage gear. The collection of burly males around you are on all fours and outfitted with muzzle masks that resemble canine faces and thick, plush-stuffed paw gloves. Their tails wag eagerly, knotted cocks stiff and dripping with anticipation.");
	output("\n\nYour body relaxes as you realize you’re right where you belong: amid your beloved puppies right at feeding time. Your favorite time of day. You step over to a lounge cushion and recline with a warm sigh, letting your body drape over the well-used furniture. The ausar around the room prowl up to you, lust-drunk eyes taking in your vulnerable form and circling like predators. You can hear them sniffing, breathing in the scent of your sex.");
	output("\n\nOne of the pups, a big, pale-skinned she-wolf with white fur hops up, planting her paws on your shoulders. <i>“Oh, do you have a treat for me?”</i> you muse. Tipping your head back, you breathe in the sweet scent of her bubbling pre-cum as her rod strains inches from you. Craning forward, you plant your lips across the broad oval of her crest, savoring the salty moisture of her passion.");
	output("\n\nShe bucks against your mouth, provoking a slight laugh from you. <i>“Bad girl,”</i> you scold, slapping her tummy. <i>“Stay,”</i> you coo, running your fingertips across her under-vein as she whines helplessly. You soak in the desperate, needy desire of the bound bitch before flicking your tongue across her swollen cumslit.");
	output("\n\n<i>“Release,”</i> you command, allowing your pet to jump forward gratefully, jamming her length into your throat in a single thrust. Your relaxation is so deep that she bucks past your curling tongue and against the back of your mouth, pre gushing freely as she goes. You rest your fingers at the peak of your neck, enjoying the feeling of your esophagus bloating with the thick puppy pecker even as your mouth fills with the ballooning girth of her knot. You swallow and gulp with a milking motion that leaves your puppy pawing at you with her building climax.");
	output("\n\nJust as eagerly as she mounted you, she busts her nut deeply into your esophagus, sending jets of thick spunk gushing down into your stomach. Her balls lightly slap your chin as her abdomen grinds against your nose, making sure every last drop finds its way into your tummy. You rub the warm blossom of liquid weight in your gut and tap the girl on her thigh to make her back up. Reluctant but obedient, the white ausar retreats from your mouth, dragging her salty tip across your forehead as her member slowly goes flaccid.");
	processTime(10);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",petProII);
}

public function petProII():void
{
	clearOutput();
	showName("PET\nPRO");
	author("Adjatha");
	output("Another pupper moves up to take her place, this one a dusky-skinned male with a cock like a burgundy pipe. <i>“Oh, finally over your shyness?”</i> you ask the gifted dog. <i>“Well, let’s find a good place for you to bury that bone.”</i> The canine cock puts your jaw to the test, forcing you to lean way back just to maximize how far you can yawn. Slowly, he pushes his way in, groaning under his mask with a muttered oath. You lightly pinch his thighs in annoyance even as he feeds you fresh inches. New puppies always forget they’re not allowed to talk, you muse, licking his cockhead as best you can, considering the mouth-stretching bulk.");
	output("\n\nOther, less patient puppers crowd around you, finding a free leg or even just a patch of skin to rub their cocks on. So many treats, you gurgle in delight, rubbing your left hand around the big boy’s fat knot while the left fondles the heavy balls dangling in front of your eyes. The pressure on your throat is intense as you push yourself down the shaft, but when your lips hit the knot, your journey stops dead. No way you’re getting past that! A fresh gout of heat sprays across the back of your throat, filling your mouth with the cheek-bloating meal that dribbles past your mouth and down your face, into your hair. Soothing the pup with long, soft strokes, you reward his softly muffled woofs with extra attention from your swirling tongue.");
	output("\n\nHe pulls out and you let the dog nut slosh around your mouth for a bit longer, savoring the flavor that creeps up your nostrils and slides down your well-used throat. A thin ausar with jet-black fur pads up and jams his shaft into your open maw like it were a wet and waiting pussy. The sudden thrust sends the last pup’s seed splattering out in gooey streams. Grabbing your lower law with both paw-gloved hands, he bucks rapidly, forcing himself from tip to knot again and again, brutally facefucking your head with a low, rumbling growl. You gulp and squirm, toes curling as your body is rocked back and forth to the brutal pace of the fierce dog.");
	output("\n\nYour vision swims as you struggle to get air between his rapid thrusts and you reach up, between her legs to grab at his tucked tail. With a tug, you pull it aside and slip a finger into his ass, honing in on his prostate with practiced motions. A steady, rubbing pressure pushes him to release, his member swelling as his strokes lose speed and become ragged.");
	output("\n\nWhen at last he reaches his limit, he pulls back and presses his tip down directly onto your tongue. You can feel the boy’s orgasm through the liquid, salty pressure of his peaking pleasure, every rapid heartbeat a fresh spout of canine cum pumped directly onto your exposed taste buds. He drills the flavor of his passion into you with every fresh ejaculation, heat building on your sticky cheeks as a flush rises to your spunk-covered face.");
	output("\n\nYou give the black-furred pup encouraging scritches, swallowing eagerly until, finally, he runs dry. Your world gradually expands outwards once more as breathing comes easily again. Faintly, you’re aware of the gooey glaze your bare skin is soaking in. Some of the less disciplined ausar must’ve blown their loads over you while you were being face-fucked. <i>“Such a waste,”</i> you moan, coaxing another pup into your drool-slick mouth, and then another. You stroke the growing expanse of your belly as all your precious pets fill you with their sweet, sweet cum.");
	processTime(20);
	pc.lust(30);
	clearMenu();
	addButton(0,"Next",petProIII);
}

public function petProIII():void
{
	clearOutput();
	showName("PET\nPRO");
	author("Adjatha");
	output("By the time the fading taste of VR spunk is replaced by the glowing lights of the real, you’re still catching your breath from the exhaustive petplay orgy. Your jaw is sore and if feels like you’ve had enough to eat for a lifetime, but you’re otherwise none the worse for the wear. As you put your gear back on, you ponder, trying and failing to understand why some people don’t like dogs.");
	processTime(2);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	mindwashNextButtonAndStatAwardsAndClears(cumNum);
}

//Futa Scenes
//1 - Poor Little White Gel
public function poorLittleWhiteGel():void
{
	clearOutput();
	showName("RECORD\nSEEKER");
	author("Adjatha");
	output("Your gel-like body shivers with anticipation. Shifting in your seat, you take a moment to look over your thin, pale form, atrophied from a week of no food. All around you, kui-tan girls are standing, nude and erect, laughing with disbelief. <i>“This is crazy,”</i> one of them sighs. <i>“You know that right? Even for a rahn, there’s no way you can handle all of us.”</i>");
	output("\n\n<i>“Trust me. I’m a professional,”</i> you respond, your fishbowl helmet muting your words to an almost indecipherable mumble. You give a thumbs up instead, and tap the glass sphere buckled around your head. The seal around your neck is tighter than you expected. <i>“Hopefully it’ll be flexible enough to let me swallow,”</i> you mutter to yourself. Well, nobody ever broke galactic records by playing it safe. You flash the Go sign and settle back, licking your alabaster lips.");
	output("\n\nThe girls around you take up their positions, waddling to carry their heavily over-filled testes. Each of them seems to be hefting a pair of beanbag chairs, the bloated orbs sloshing with each movement. They turn to the camera, one after another, lifting their fingers up in a V before popping the cap on a vial of nuki nut and gulping it down.");
	output("\n\nThe throes of cum cascade rush through their bodies as quickly as you’d hoped, and each grabs one of the suction cups attached to your chair. Popping it onto their swelling members, the girls crowd in close, the heat of their bodies radiating into your white membrane.");
	output("\n\nFat blobs of pre-cum begin bubbling up from the now moaning girls and the pump under your seat whirrs to life. The kui-tan goo is drawn up the cock-sucking sleeve, into the vibrating tubes, fed past your shoulders and into the dome around your peak. The fishbowl helmet fills with the alluring scent of cream a second before the thin fluid splashes down over your gelatinous forehead. You can’t help but laugh as the warm, sticky spunk flows down your face and pools around your neck. In just a few seconds, the pre has reached the bottom of your chin and a flash of doubt crosses your mind.");
	processTime(10);
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",poorLittleWhiteGelII);
}

public function poorLittleWhiteGelII():void
{
	clearOutput();
	showName("RECORD\nSEEKER");
	author("Adjatha");
	output("There’s no time to consider just how much cum you’re planning on drinking, however, as the first of the kui-tan hits her peak and begins to gush like an oil derrick. She holds the suction cum to her triple-knotted mast and bucks her hips against the liquid girth of her over-filled balls. Her urethra widens and gouts of girl-jizz flood her tube, turning the translucent plastic off-white in an instant. Thick wads of seed zip through the pump and splash down on top of you in a slimy curtain, not all that dissimilar from your own natural coloring.");
	output("\n\nYour stomach rumbles as your senses flood with fresh nut. The smells, the feel, the warmth... you can hold back no longer and crane your face forward, sipping at the delicious load like it were a delicacy. Of course, every race has a different taste, but there’s something about an aged, kui-tan vintage. Harvested at the peak of cascade, when they’re so full they can barely walk? Why, it’s divine.");
	output("\n\nYou let the mouthful roll across your tongue, from one cheek to the other as its bouquet fills your mind and, with a swallow, your throat. The heavy gulp pushes down your neck, parting the seal just enough to let it sink into your midsection. Mustn’t digest it though. Not yet!");
	output("\n\nYou turn your attention outward again, pleased to find that another girl has begun her climax as well. Your helmet is filling up quick quickly now, rising from your chin to just below your eyes. The liquid heat of their passion all around you, it’s all you can do to cross your legs and squeeze your thighs tight. Opening your mouth once more, you being your work in earnest.");
	output("\n\nYou swallow quickly, almost disappointed that you can’t take more time to just bask in the jizz. One by one, your gulping quaffs keep pace with the big balled women around you. Regular oscillations flow down your neck, like the ripples of a river, carrying twin seas of spunk to the ocean filling your gut.");
	processTime(10);
	pc.lust(20);
	addButton(0,"Next",poorLittleWhiteGelIII);
}

public function poorLittleWhiteGelIII():void
{
	clearOutput();
	showName("RECORD\nSEEKER");
	author("Adjatha");

	output("Another kui-tan hits her peak and collapses atop her own balls. Her thick shaft begins pumping while her hands sink into the pliant mass of her swaying balls. Massaging her nuts more and more aggressively, the girl’s fluffy tail twitches and spasms while her cock milker hums at full power. Her goo seethes through the machine and hits your helmet like a flash flood. The water level rises despite your pace and ivory slime rises up over your eyes and ears, submerging you in an aquarium of nuki spoo.");
	output("\n\nWith your view of the outside world lost, your attention turns wholly on yourself. No need to bother with gulps, you figure. Parting your plumping lips into a wide O-shape, you open your throat entirely, forming an uninterrupted pipeline down into your belly. You can feel the weight expanding your formerly lithe waist into plump, then thick, then outrageous levels as gallon after gallon fills your body up like a gelatinous condom. Time becomes a faint memory as you lose track of just how much spunk you’ve swallowed.");
	output("\n\nThe other girls must’ve hit their climax at some point, because your stomach seems to have hit peak elasticity. Quickly, you divert the flow into your breasts, pumping them full of the sweet, salty cream. You can feel a pressure at the back of your nipples and you focus on removing the outlets as quickly as you can. If you started to spring a leak, it’d all be over! Still blinded by your spunk helmet, you press your palms down on the expanding orbs of your chest. D-cups, F-cups, J-cups... Z-cups... you stop tracking them once they too quiver with the tension of their pressurized contents.");
	output("\n\nYour ass comes next, swelling to fill the seat of your chair in moments before expanding outward with hips that would need to use loading bays as doors. Despite your concentration, you can feel the inevitable consequences of this much suspended seed inside yourself. All the tingling, heated hunger inside you seems to focus itself right at the base of your abdomen. A firm, gel appendage pokes up from your stretched skin and swells out past your massive belly. The pseudopod bulges in the middle and throbs against your cum-fattened thighs. Your fingers clutch at the armrests of your chair, silently resisting the orgasm that threatens to ruining everything, while the seemingly endless supply of sticky girl-spunk pours into you.");
	processTime(10);
	pc.lust(20);
	addButton(0,"Next",poorLittleWhiteGelIV);
}

public function poorLittleWhiteGelIV():void
{
	clearOutput();
	showName("RECORD\nSEEKER");
	author("Adjatha");

	output("Just as you think you’ve hit your hard limit, the liquid pressure around your head recedes. You can hardly believe it, but you seem to be nearing the end. The kui-tan arrayed around you have run dry! They cling, exhausted, to your mountainous frame, hugging their albino cum-canister with the blissed-out fatigue of sated junkies. The pumps on their cocks keep sucking, but there’s nothing left but moans.");
	output("\n\nYou take a big gulp and manage to store it in a protrusion that vaguely resembles an ‘outtie’ belly button. There’s just a bit left, right at the bottom of the helmet, but you need a moment to take an assessment. It seems you’ve filled just about every inch of your body to capacity. Where can you keep this last, little bit? You wince at the nearness of your orgasm. What can you do?");
	output("\n\nA crash of inspiration strikes and you wind your long, rahn tongue down to slurp up the last of the cum, feeding it directly into your lips. Your pucker swells and bloats into a pair of wobbling lips that practically ache to suckle at the exhausted tips of the girls around you. With a final gasp, you open your mouth wide for the camera, running your tongue along its circuit to show that you’ve ingested every last drop.");
	output("\n\nThen, at last, you allow your body to start digesting. Your colossal, cum-filled frame wobbles at the effort. But, once a go’rahn starts drinking, there’s not a force in the galaxy that can stop her. The sheer ecstasy of your unfathomably vast meal hits all your buttons at once. With a cry of gushing joy that puts the fuzzy nukis around you to shame, your ovipositor erupts with volcanic force. Every gallon of swallowed seed is almost instantaneously drained of its precious biomass and converted into rahn ejaculate. Alabaster goo spews from your shaft, blasting up against the ceiling of the room and showering down on everyone in attendance with all the urgency of a fire suppression system.");
	output("\n\nYour fertility-idol bloat recedes, bit by bit, as the endless orgasm plasters opal over everything. The heat rouses the kui-tan from their slumber, the girls giggling and gasping at the deluge. You hadn’t intended to form any eggs, but sheer organic satisfaction courses through you with a breeding imperative, kicking repressed needs into overdrive. Fist-sized eggs form in your core before being swept away by the torrent, carried out of your spasming pillar and bouncing around the room like high-velocity rubber balls.");
	output("\n\nThe girls, looking rather like drippy white galotians from all the spoo, do their part to bring your geyser down. All of them wrap their arms around your now torso-sized member and begin pumping in unison. You add your own hands to the task and after a few more chair-shaking blasts, you finally reach the glorious, triumphant end.");
	output("\n\nDespite your copious release, the weight of your feat has left its mark on you. Your normally narrow, thin body has been pumped to the absurd proportions of a loo’rahn. A definite paunch in your belly and the extra thick hips and ass seem utterly out of place on your cream-polished frame. The eye-boggling Q-cups on your chest make you think twice about trying to stand up just yet, and the wobble of your inflated lips lets you know that the last gulp of all that nuki nut is still with you.");
	output("\n\nYou tap a water-proofed tablet dangling from one armrest and upload the video to the judging committee. After a brief wait, the screen blinks with a bright, golden glow. You’ve done it! You’re the new record holder for the most cum swallowed by a single humanoid organism at once! Now everybody will know the name...");
	processTime(10);
	pc.lust(20);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	addButton(0,"Next",poorLittleWhiteGelV,cumNum);
}

public function poorLittleWhiteGelV(cumNum:Number):void
{
	clearOutput();
	showName("RECORD\nSEEKER");
	author("Adjatha");
	output("...[pc.name] Steele! Wait. Who? You blink, shaking your head in disorientation. Despite not being a rahn, you think you can still feel the strain of all that cum filling your body at once. When you move, you keep expecting the spunk-bloated, jiggling weight of all that fluid hold you down. It takes a few minutes to re-orient yourself to your old body, and longer still to get the taste of thousands of gallons of cum off your mind.");

	if(pc.hasCock())
	{
		//player has a penis but no Bubble Buddy
		if(!checkToyDrawer(BubbleBuddy) || cumNum == 0) 
		{
			output("\n\nYou glance around and realize your in-simulation orgasms were matched by real world ones as well.");
			if(cumNum == 0) {}
			else if(cumNum < 20) output(" Spurts of jizz have left dripping blobs on the panels and across the floor. It’s a bit embarrassing, but shouldn’t be too hard to clean up.");
			else if(cumNum < 100) output(" Large puddles of cum are pooled around your feet and you even seem to have hit yourself with some of it while you were under. You clean up as best you can, but somebody else is going to have to give this place a good scrub. Whoops!");
			else if(cumNum < 4500) 
			{
				output(" The panels around you are practically coated with the dripping curtain of cum you’ve released. Your body didn’t fare much better, and everything is sticky. You should really consider getting something to catch all this next time!");
				pc.applyCumSoaked();
			}
			else 
			{
				output(" A sudden wave of exhaustion hits you and you numbly glance around. Every surface is coated in dripping streams of spunk, from the walls to yourself, and even the machine itself. Thankfully, it seems to be waterproof. You don’t have the energy to clean up, so you’ll just have to stew in your own juices for a while longer.");
				pc.applyCumSoaked();
			}
			output(" You gradually get up and put your gear back on.");
		}
		//player has a penis and a Bubble Buddy
		else
		{
			output("\n\nWhen you’ve finally put the after-effects of the simulation aside, you note that your rubbery cum-sheath has a present for you. It seems your VR orgasms were mirrored in real life and the Bubble Buddy has collected the results. You twist-seal the package and put your gear back on.");
			// {player gains cum bubbles as if taking the Masturbate option with the Bubble Buddy}
		}
	}
	else
	{
		output("\n\nYou instinctively reach down to massage your poor, abused cock, only to remember it was a simulation. Nevertheless, you can still feel the ache of your utterly drained VR testes. You gradually get up and put your gear back on, moving slowly from the phantom fatigue.");
	}
	mindwashNextButtonAndStatAwardsAndClears(cumNum);
}

//#2 - Bodysuit Bubbles
public function bodysuitBubblesScene():void
{
	clearOutput();
	showName("BODYSUIT\nBUBBLES");
	author("Adjatha");
	output("<i>“Alright, I think we’re good to go. Hear me okay, Gin?”</i>");
	output("\n\nYou touch the small, buzzing beads body-glued to your throat and aural-holes self consciously. <i>“Yeah, loud and clear, Vee,”</i> you whisper almost inaudibly. You can hear the sound of bustling crowds just around the corner as Tavros station gears up for another busy, artificial day. Visitors and residents alike fill the crowded halls with the dull roar of their impatient rush.");
	output("\n\nYour tail swishes anxiously while you tug at the squeezing confines of your brand new body suit. Your busty ovir frame fills out the faux-latex well enough to leave little room for bunching, but you can’t help feeling practically naked in the thing. A second skin so fine, it’s almost like you’re wearing nothing at all!");
	output("\n\n<i>“How in the inky depths of the galactic core’s black hole did I let you talk me into this Vee,”</i> you hiss to your kui-tan friend on the other end of your communication rig. <i>“My sister said you’d be nothing but trouble, you know.”</i>");
	output("\n\n<i>“Trouble is just fun you don’t realize you’re having at the time,”</i> she shoots back with a scolding click of her tongue.");
	output("\n\n<i>“That doesn’t make any sense!”</i>");
	output("\n\n<i>“It doesn’t have to! Now get out there, you big baby. I’ll do it next time and the you can be the one making up encouraging quips.”</i>");
	output("\n\n<i>“Yeah, next time. Assuming this doesn’t get me thrown in jail,”</i> you mutter, squeezing your thighs together as you tighten your hands into fists. The nervous heat in your belly has migrated south and those ticklish butterflies have started doing some inappropriate things to the space below your hips. With a gulp, you step out of the back alley and join the crowded press of bodies moving through the space station’s commercial district.");
	processTime(10);
	clearMenu();
	addButton(0,"Next",bodysuitBubblesSceneII);
}

public function bodysuitBubblesSceneII():void
{
	clearOutput();
	showName("BODYSUIT\nBUBBLES");
	author("Adjatha");
	output("The bulges of your puffy nipples stand out under the flush fabric, drawing some covert glances at you join the crowd. A few even notice the blatantly obvious swell of your lower lips, but the alien throng mostly mind their own affairs and shuffle inattentively past the glowing neon ads and holographic billboards. Blessedly, the few who do notice your state say nothing to the alert others to the blushing, squirming ovir in their midsts.");
	output("\n\n<i>“You can do this no problem, Ginny,”</i> your friend cheerfully observes. <i>“Everybody’s so plugged into their coms and tablets that they wouldn’t notice if you jammed your big, lizard cock up their asses.”</i>");
	output("\n\n<i>“Vee!”</i> You hiss, turning a darker hue at the hot flush that sweeps over you.");
	output("\n\n<i>“Oh, they can’t hear me! Relax and enjoy,”</i> the kui-tan adds, dismissively. Her suggestion, however, hits its mark and your imagination takes off.");
	output("\n\n<i>“They can’t, but I can! Just chill out with your-”</i> a jolt takes you out of your head-space and you realize you’ve just walked directly into an ausar girl. She lets out an distressed eep and nearly drops the thin screen she’d stopped to read. Turning around to scold you for your inattention, you’re treated to a smack across the face as her obviously augmented bust swings into your cheek like a pillowy fist. You teeter back and fall on your ass, reeling from the not entirely unwelcome surprise more than the impact itself.");
	output("\n\n<i>“Um, would you watch where you’re, like, going?”</i> the canine chirps in oblivious annoyance as she scans her screen for any damage or fingerprints. As she does, her gravity-defying tits continue their jiggling wobble in almost mesmeric fluidity.");
	output("\n\n<i>“But - but you’re the one who stopped first,”</i> you shoot back while the foot traffic parts around the two of you like a river of bodies flowing around an inconvenient island.");
	output("\n\n<i>“Uh, that’s ‘cause I got a super important message? Um, duh?”</i> Glancing down at you for the first time, her lips curl in distaste. <i>“Like, what are you even wearing? And, like, what is that between your legs?”</i>");
	output("\n\nThe righteous heat in your chest rushes up to your face as anger becomes embarrassment in an instant. You realize you’d been staring at the bimbo’s chest a bit too intently. The flutters in your gut have become the rush that you’d been fearing. A thick python of ovir masculinity has already snuck past your sheath lips as it engorges. Each heart beat thickens and lengthens the third leg as it creeps under your suit and up your abdomen. You throw both hands over the bulge and awkwardly rise to your feet. <i>“S-sorry!”</i> you yell too loudly and dive into the protective anonymity of the ever-moving tourist crowd.");
	output("\n\nYour kui-tan buddy meanwhile is cracking up in your ear, laughing herself breathless. <i>“Ha ha hah! Did you - are you - this is so fucking great... did you plan that? You gotta level with me: did you get a boner from falling on your ass or from being yelled at? Gin you kinky bitch, I never knew!”</i>");
	output("\n\n<i>“Neither!”</i> you shoot back. <i>“I’m into normal stuff,”</i> you mutter, your voice gaining volume as you press on. <i>“It was her big, fake tits, if you have to know! I’m into normal stuff! Normal! Not some weird humiliation fetish,”</i> you practically yell.");
	output("\n\n<i>“Fuck! My ears! That mic is set up for whispers, you scaly-tailed cunt! Warn me before you blow out my hearing next time!”</i>");
	processTime(10);
	pc.lust(15);
	clearMenu();
	addButton(0,"Next",bodysuitBubblesSceneIII);
}

public function bodysuitBubblesSceneIII():void
{
	clearOutput();
	showName("BODYSUIT\nBUBBLES");
	author("Adjatha");
	output("A sudden cold, sinking sensation overtakes you as you realize just how loudly you’d been yelling. The crowd has all but stopped in their tracks, staring at you with with a curious intensity. You can practically feel their eyes boring into you as your erection continues its ascent, winding between your breasts while the bodysuit clings so tightly your veins are showing. The medial ring emerges from your slit like a fat reminder just how plainly everyone can make out every last detail of your throbbing flesh through the immodest outfit.");
	output("\n\n<i>“Shit,”</i> you whisper, hunching over and ineffectually trying to hide your mast with both arms. All you really accomplish is squeezing your cleavage tighter while your manhood slides into it.");
	output("\n\n<i>“Don’t get off on humiliation, huh? Methinks she doth protest like a lying bitch. Did you forget to tell your dick about all your totally normal fetishes?”</i> Vee taunts into your ear.");
	output("\n\nThe people around you have begun whispering to each other and it’s all you can do to try to ignore it while you uselessly try to calm yourself. Your hips wiggle as warm, thin pre-cum begins to bubble past your broad peak and wash down your cock-stuffed cleavage. <i>“Everybody’s looking,”</i> you wail to your nuki friend as your body heat climbs another few degrees. <i>“What do I do?”</i>");
	output("\n\n<i>“Better not think about their hands all over your slutty scales,”</i> she teases. As if the suggestion was all it took, the clinging tightness of the faux-latex seems to transform into the hungry, obscene grip of hands all over you. Cupping your breasts, stroking your thighs, teasing your tail, pinching your nipples, tickling your underarms...");
	output("\n\nA shudder runs down your spine and a reflexive abdominal ripple sends a fat blob of spunk up your bulging trunk. A visible bubble of jizz fills atop your flat cockhead, drawing gasps from the crowd.");
	output("\n\n<i>“Did she just...?”</i>");
	output("\n\n<i>“Oh, how indecent!”</i>");
	output("\n\n<i>“Shameless...”</i>");
	output("\n\n<i>“Lewd!”</i>");
	output("\n\n<i>“Disgraceful...”</i>");
	output("\n\nThe words cascade around you and you moan, trying to pat down the cum bulge, only to send the warm spunk running down the rest of your body. Sticky heat seeps down the interior of your suit, your liquid lust oiling your body. You heart races faster and faster as the situation deteriorates.");
	output("\n\n<i>“What are you waiting for,”</i> Vee giggles to you in a private, coaxing whisper. <i>“Give the people a show.”</i>");
	processTime(10);
	pc.lust(15);
	clearMenu();
	addButton(0,"Next",bodysuitBubblesSceneIV);
}

public function bodysuitBubblesSceneIV():void
{
	clearOutput();
	showName("BODYSUIT\nBUBBLES");
	author("Adjatha");
	output("Blushing and shaking with lust now as much as embarrassment, you move your palms from uselessly trying to hide your huge, two-foot length to actively stroking it instead. A few gasps from the crowd are largely swallowed up the by far louder cheering as the pervs push their way to the front of your audience.");
	output("\n\nWith everyone totally obsessed with your softly moaning frame, you sink to your knees. The heels of your palms drive against the unyielding firmness of your cock while fresh waves of pre-orgasmic excitement flood your suit and stretch out the rubbery skin. With more pouring into the oh-so-tight suit, it begins to feel like you’re practically swimming inside the ballooning body condom.");
	output("\n\n<i>“Are all ovir like this?”</i>");
	output("\n\n<i>“...gotta be some guerilla marketing thing...”</i>");
	output("\n\n<i>“...how much can that outfit hold?”</i>");
	output("\n\nYou moan louder and stroke faster, enlisting your tail to help squish past the cum-swelling second skin in a race for your eagerly awaited climax. <i>“I am going to get you back so hard for this,”</i> you gasp into your mic while the kui-tan at the other end purrs stimulus right back.");
	output("\n\n<i>“Sure, sure. You’re not loving every second of this. Big finale now!”</i>");
	output("\n\nYou squeeze your tits together and start bobbing up and down, tit-fucking your cockhead with your own trapped cum as lubricant. When the peaking pleasure overtakes you, it does so in time with a roaring cheer from your audience of complete strangers. Jizz spurts from your bestial girth and, with nowhere else to go, spouts up and out of the bodysuit’s seal around your neck. Gouts of creamy alabaster shoot up, under your chin and into your hair and nostrils before pouring back down over your bloated outfit like a self-contained shower. The faux-latex glistens at the gooey varnish, cascades of white running down your shoulders, over your breasts, and pooling between your thighs as you helplessly pant and sway.");
	output("\n\n<i>“Damn, girl! How long you been saving that up?”</i> Vee asks, vocalizing the shocked sentiment of your speechless audience. <i>“I will never understand how those internal gonads work.”</i>");
	output("\n\nAwash with jizz, inside and out, you scarcely notice when station security pushes past the crowd to collect you. Steady pumps keep pushing waves of cream against your throat and down your body, but the cops lay hold of you all the same, lifting your boneless, blissed-out frame between them.");
	output("\n\n<i>“I’ll get bail for you this time, if you get bail for me next week,”</i> Vee offers with gleeful delight, no doubt already uploading the recording to the extranet.");
	processTime(10);
	pc.lust(15);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",bodysuitBubblesSceneV,cumNum);
}

public function bodysuitBubblesSceneV(cumNum:Number):void
{
	clearOutput();
	showName("BODYSUIT\nBUBBLES");
	author("Adjatha");
	output("Your shoulders sag as the simulation fades and the station security are no longer supporting you. You breathe a sigh of relief at not actually being arrested for that little show, though a twinge of outrage is still there. People do way worse than that! How dare they arrest you for a little dare!");

	if(pc.hasCock())
	{
		//player has a penis but no Bubble Buddy
		if(!checkToyDrawer(BubbleBuddy) || cumNum == 0) 
		{
			output("\n\nYou glance around and realize your in-simulation orgasms were matched by real world ones as well.");
			if(cumNum == 0) {}
			else if(cumNum < 20) output(" Spurts of jizz have left dripping blobs on the panels and across the floor. It’s a bit embarrassing, but shouldn’t be too hard to clean up.");
			else if(cumNum < 100) output(" Large puddles of cum are pooled around your feet and you even seem to have hit yourself with some of it while you were under. You clean up as best you can, but somebody else is going to have to give this place a good scrub. Whoops!");
			else if(cumNum < 4500) 
			{
				output(" The panels around you are practically coated with the dripping curtain of cum you’ve released. Your body didn’t fare much better, and everything is sticky. You should really consider getting something to catch all this next time!");
				pc.applyCumSoaked();
			}
			else 
			{
				output(" A sudden wave of exhaustion hits you and you numbly glance around. Every surface is coated in dripping streams of spunk, from the walls to yourself, and even the machine itself. Thankfully, it seems to be waterproof. You don’t have the energy to clean up, so you’ll just have to stew in your own juices for a while longer.");
				pc.applyCumSoaked();
			}
			output(" You gradually get up and put your gear back on.");
		}
		//player has a penis and a Bubble Buddy
		else
		{
			output("\n\nWhen you’ve finally put the after-effects of the simulation aside, you note that your rubbery cum-sheath has a present for you. It seems your VR orgasms were mirrored in real life and the Bubble Buddy has collected the results. You twist-seal the package and put your gear back on.");
			// {player gains cum bubbles as if taking the Masturbate option with the Bubble Buddy}
		}
	}
	processTime(2);
	mindwashNextButtonAndStatAwardsAndClears(cumNum);
}

//#3 - Breakin’ the Law
public function breakingTheLaw():void
{
	clearOutput();
	showName("BREAKIN’\nTHE LAW");
	author("Adjatha");
	output("The rear hatch slides open with a whisper, noise following after like thunder following the rain. <i>“Whoo! We did it! Bastards never saw it coming, either. Fuck the UGC!”</i> The speaker, a boisterous galotian adopting the features of an eye-poppingly well-endowed human woman rolls into the ship’s interior with a further hoot of victory.");
	output("\n\nHer companion, a purple rahn, enters more deliberately, tossing a lab tech’s uniform into the ship’s incinerator slot as she does so. <i>“We’re not free and clear yet,”</i> the gel woman cautions, rolling a number of stainless steel capsules in the palm of her hand. <i>“The police and security forces will be looking for amorphs.”</i> She turns to you with a thin smile. <i>“Time for you to earn your share.”</i>");
	output("\n\nReflexively, you pull your big, fluffy kui-tan tail in front of your face. <i>“O-okay Miss Violet,”</i> you stammer nervously.");
	output("\n\nThe rahn sighs, stalking toward you. <i>“It’s Violet. Just Violet. They’re code names, Brown, not surnames.”</i> She kicks a wide, steel ring as she approaches, sending the device sliding next to you. <i>“And stop leaving your cockring jerk-off toys around the ship. It’s unsanitary,”</i> she hisses, inches from you.");
	output("\n\n<i>“But, if the fuzz is supposed to believe she flies around with massive balls all the time, wouldn’t a lot of toys sell the ‘pervert’ angle better?”</i> the galotian thief asks, sloshing next to the rahn mastermind.");
	output("\n\n<i>“I... suppose so,”</i> she admits grudgingly. <i>“No time to argue about it now anyway. Let’s get underway. First,”</i> she enumerates, bringing her palm to her mouth and swallowing all but one of the capsules, letting them float inertly in her gelatinous body. <i>“Next.”</i> She lifts the last pill between her forefinger and thumb, pulling the full weight of her pheromone control to break on your defenseless body. <i>“Sit.”</i>");
	processTime(10);
	clearMenu();
	addButton(0,"Next",breakingTheLawII);
}

public function breakingTheLawII():void
{
	clearOutput();
	showName("BREAKIN’\nTHE LAW");
	author("Adjatha");
	output("You’re on your butt in the captain’s chair before you realize you’d been moving. <i>“Open up,”</i> she murmurs and you pull the zipper of your inconspicuous flight-suit open, bearing your C-cup breasts and massive, 26\" kui-tan cock. The knotty phallus is so thick it’s almost like a third leg resting atop your softly furred thighs. Your sac is as close to empty as you could get it, barely an inch across and virtually lost beneath the unfuckably thick member.");
	output("\n\n<i>“Can’t we have a celebratory snack first,”</i> the goo girl whines.");
	output("\n\n<i>“You’ll have all you can drink in a few minutes, Green. Patience.”</i> Violet takes the single capsule and pulls the two halves of its containment apart, revealing a squishy blob of ooze that glows with neon, lime-green light. <i>“The latest in Fixed-Body abuses,”</i> the rahn muses, using the term like a curse. <i>“Forget GaloMax, Formula 469 will give them all the flexibility of a galotian and the structure of a rahn, targeted exactly where they want.”</i> She sneers, looking at you as if you were responsible for the thing, rather than a hired accomplice to the theft. <i>“Notes destroyed, files wiped, and prototype stolen; let’s see them come back from that.”</i>");
	output("\n\n<i>“Yeah, but, don’t we kinda need it to work, Violet? You know, to hide an’ stuff?”</i>");
	output("\n\nThe purple girl turns her focus on you once more. <i>“Let’s see what science has wrought.”</i> She drops the goo onto your urethra before swallowing the empty canister along with the others. A cold, slimy sensation spreads across your crest as the transformative sinks into your body, going to work on your cock and balls immediately. You shudder as the chill of exposure turns hot, your flesh losing consistency for a moment before solidifying once more. You hiccup once and just like that: it’s done.");
	output("\n\nYour penis feels a bit alien. There is a slight delay in sensation, making it feel as if someone else’s cock were between your legs. Experimentally, you put a pinkie at the tip of your shaft and push down. The flesh now feels softer, as if it were little more than gel. You push the digit into your urethra and it takes it with hardly any difficulty, swallowing the digit up to the third knuckle.");
	output("\n\nYou’d expected pain or at least discomfort, but the feeling is, if anything, intoxicating. You push more fingers in, marvelling at how pliable your mast has become. The fat prick stretches and gapes as your whole fist pushes in, doubling girth to accommodate the firmness of your hand. Pulling out, you flex and the shaft returns to its prior state, no worse the wear for your insertion.");
	output("\n\n<i>“The coppers are gonna be looking for some amorphs, but they’ll never think to check the kui-tan with two girl-sized balls,”</i> Green gloats, her excited impatience drawing her to your side with fawning affection. <i>“Ready or not, here I come,”</i> she giggles.");
	processTime(10);
	pc.lust(15);
	clearMenu();
	addButton(0,"Next",breakingTheLawIII);
}

public function breakingTheLawIII():void
{
	clearOutput();
	showName("BREAKIN’\nTHE LAW");
	author("Adjatha");
	output("The galotian criminal puts her fingertips to your phallus and all but dives in with delighted squeals. Your permissive penis takes on her hands and forearms as easily as your lungs take in air. You lean back in your chair, biting your lower lip as your body expands with each passing moment. Green, both arms inside, mimes taking a big breath before lowering her head and ducking in, shoulders and all. The slime gal’s body warmth floods into you like an orgasm in reverse, her liquid body sliding through your sensitive, muscled interior, stretching the fleshy pole with her curvaceous form.");
	output("\n\n<i>“S-slower!”</i> you beg as the faint ache of churning cum production starts deep within you. As if she can sense the brewing meal, Green hastens her descent, her breasts slipping past your swallowing slit, followed by her belly. You flex and gasp, doing your best to keep from jizzing her right back out, closing off your muscles and pulling her deeper into you, an inch at a time.");
	output("\n\nYour triple-knotted cock is an virtual parody of itself- nearly two feet across as the green girl is sucked down into your ballooning balls. Her absurd hips press against your drug-treated body and are caught for a long, wonderfully tantalizing moment before being pulled in with a wet plop.");
	output("\n\nWith the girl’s thickest spot swallowed, the rest is pulled in like water being sucked down a drain. Your urethra narrows and she kicks her feet daintily as her gooey legs slip down and vanish into you, your cock returning to its normal size a moment later.");
	output("\n\nGasping, you tremble and try to calm yourself. Your previously tunnel-sized cock shows no signs of its trial, not even the slightest stretch mark. The only sign that the galotian girl didn’t simply vanish but is hanging between your legs. You scoot forward and let your nearly 3\' wide ball plop off your lap and down onto the floor with a burdened jiggle. You perch at the edge of the captain’s chair, rubbing your single, mammoth nut gently, feeling the slight movements of Green within as she no doubt feasts on the cum steadily filling up her hiding place.");
	output("\n\nYou raise your gaze to Violet and are about to invite her in to fill the other orb when your voice cracks as a monumental orgasm sweeps through your momentary lapse of concentration. You shudder and gasp, fingers digging into your armrests as your chest heaves. You feel heat surging upward as the galotian, recently settled, is forced upward once more.");
	processTime(10);
	pc.lust(25);
	clearMenu();
	addButton(0,"Next",breakingTheLawIV);
}

public function breakingTheLawIV():void
{
	clearOutput();
	showName("BREAKIN’\nTHE LAW");
	author("Adjatha");
	output("A purple hand slams the stainless steel ring down onto your member, shutting off the release before it forces Green right back out. Violet shakes her head in exasperation. <i>“Try to be a professional,”</i> she scolds as you tremble your way through the dry shudders of your ring-locked climax. Once the threat has passed, Violet removes the sex toy and hands it to you with a look of disdain. <i>“Just in case you find yourself unable to hold back again.”</i>");
	output("\n\nGulping, you nod silently and spread your knees, holding your mast in both hands. Rather than dive in like her companion, Violet moves forward and climbs onto your lap. Delicately, almost modestly, she raises one leg and presses her toeless foot to the peak of your heart-shaped cockhead. She wiggles as the elastic urethra opens and her purple gel and sinks into you, engulfed her up to the ankle. Her pheromones flood your senses once more and she grabs you by the jaw, locking eyes with you. <i>“Do. Not. Cum.”</i> You nod, mutely, as she slips one leg down to the knee into your stretching body.");
	output("\n\nAs matter-of-factly as if she were putting on stockings, the doh’rahn bends over and hooks a finger around your widened peak, stretching it further to allow her to slip her other foot inside as well. Firmer than her galotian partner-in-crime, you can clearly make out the outline of Violet’s slender legs deforming your shaft as she slides into your bit by bit. You groan and your tail thumps heavily on the floor, but her command stays with you and the orgasmic bliss simply keeps building without any hint of release. Her hips slide into your now girl-shaped mast as her feet slide down into your balls, and a muscle spasm drags her deeper in, up to her chest.");
	output("\n\nWith the rahn halfway down your devouring cock, you figure now is as good a time as any. <i>“V- Violet?”</i>");
	output("\n\nThe gel girl rolls her eyes as she sinks into you, her breasts slipping inside the form-fitting phallus. <i>“Please don’t tell me you’re going to profess your love for the girl going into your balls.”</i>");
	output("\n\n<i>“N-no. It’s just that... you’re under arrest.”</i>");
	output("\n\nThe look of annoyed boredom slips into such authentic shock that you very nearly orgasm despite her earlier command. <i>“Wha-”</i> is all she can get out before you flex the full strength of your highly-trained groin muscles and pull her down, into your balls in a sudden, slurping motion. Her arms fly up and are swallowed too, her hands vanishing past the lip of your shaft as she joins the galotian.");
	processTime(10);
	pc.lust(25);
	clearMenu();
	addButton(0,"Next",breakingTheLawV);
}

public function breakingTheLawV():void
{
	clearOutput();
	showName("BREAKIN’\nTHE LAW");
	author("Adjatha");
	output("You fit the cockring around your member, fitting it securely around the base of your lowest knot. With a comforting hand, you stroke the full length of your 6\' balls, feeling the two girls squirm helplessly within. <i>“Amorphs,”</i> you chuckle, reaching for the communicator hidden in the seat of your chair. <i>“Act like a push-over and they’ll assume you’re as spineless as they are.”</i> You pull the com to your mouth but hesitate. The sloshing inside of you keeps up at a steady pace, the girls pushing against the confines of their fleshy prisons, perhaps trying to communicate with one another through your internal walls.");
	output("\n\nYou set the com aside and pat the entrapped criminals almost affectionately. <i>“We planned out this sting for months, but not a single scenario went down like this,”</i> you admit. <i>“Still, I have to say, I’m pretty appreciative. Maybe enough to give you girls that celebratory snack after all.”</i> In preparation for the capture, you’d emptied your sac, so you swing your chair around and reach into a bin on the floor. Retrieving a fat, blobby balloon of a condom from it, you untie the tip and watch the white goo sloshing warmly within. <i>“A really big snack.”</i>");
	output("\n\nYou lift the condom to your lips and slurp down the fresh nuki nut, swallowing the slightly salty jizz with satisfaction. A kui-tan cum cascade can be tough to handle under normal circumstances, but this time you’ve got help. The narcotic euphoria sweeps over you as heat builds under your fur. The tip of your tail twitches and your ears flick in agitation. <i>“I hope you girls are still hungry,”</i> you moan, grabbing your shaft and sliding a thumb up and down the sensitive peak.");
	output("\n\nYour body goes into full blown cascade with a white flash behind your eyes that leaves you panting and pawing at your ring-sealed mast. Your balls begin filling with fresh spunk, filling the girls’ prisons with the thick batter of your alabaster seed. You can feel the two inside you, palming at your inner walls, trying to force their way out, to no avail. The two colossal orbs grow larger as they fill, bloating outwards with every rapid heartbeat.");
	output("\n\nBy the time your testicles have reached nearly double their girl-filled girth, the struggles within have ceased. Perhaps sensing the futility of their attempts, or simply overcome by their gooey thirst, the two seem to set about their task. You rest your palms on either nut and coo with delight as you can feel them slowly shrinking, bit by bit, as the girls drink their fill and more from your flooded depths. Just how long can you keep them like this?");
	output("\n\nYou pick up your com once more and click it on. <i>“This is ‘Brown.’ No sign of the amorphs. I will head back to the rendezvous and try to meet back up with them.”</i>");
	output("\n\nYou click the com off and toss it aside. That’ll keep the UGC satisfied for the time being. You’ll let them out eventually, but for now, the three of you can have plenty of fun right where you are.");
	processTime(10);
	pc.lust(25);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",breakingTheLawVI,cumNum);
}

public function breakingTheLawVI(cumNum:Number):void
{
	clearOutput();
	showName("BREAKIN’\nTHE LAW");
	author("Adjatha");
	output("When the smut fades away, you feel a deep emptiness that leaves you cold. You reach out for the massive balls housing your goo girls before remembering that it was just a porn. Still, the memory stays with you, making it difficult for you to stand and put on your gear, as if you were still burdened by your cum-bound captives.");
	output("\n\nFaintly, you wonder if Formula 469 is a real thing or not.");
	processTime(2);
	mindwashNextButtonAndStatAwardsAndClears(cumNum);
}

// [Celise]
//Spaceship only
public function mindwashCelise():void
{
	clearOutput();
	showCelise();
	author("Adjatha");
	if(flags["CELISE_MINDWASHED"] == undefined)
	{
		output("Honestly, you’re not even sure if Doctor Badger’s technology works on galotians. But your emerald goo girl rarely seems to mind being a test subject, as long as there’s jiggly, gushing fun afterwards. You find her blobby puddle snuggled up against a heated pipe near the rear of your ship and with a poke, manage to rouse her from the quivering nap.");
		output("\n\nHer head molds out of the slime and glances around. <i>“Hrm? Oh! Hiya [pc.name]!”</i> Her face beams with playful mirth. <i>“What’cha up to?”</i>");
		output("\n\n");
		if(pc.isNice()) output("You explain the Mindwash Visor as best you can to goopy girl, but her short attention span interferes with your attempts. <i>“A new toy? Sure! I’d love to play with you,”</i> she giggles, completely ignoring your safety warnings. Hoo boy.");
		else if(pc.isMischievous()) output("<i>“Hey Celise! Do you ever wish you could be other people?”</i> She shivers and changes her shape to vaguely resemble you. <i>“Uh, not like that, I mean in your mind.”</i> Celise stares blankly, then changes her shape into you again. <i>“You know what? Forget it. I got a new toy. Come test it out with me.”</i> She nods excitedly, all too happy to help out.");
		else output("You give Celise a doubtful look and ask if she even has a brain to be washed. <i>“My whole body is my brain,”</i> she chirps, helpfully. <i>“Pound for pound, I’m probably the biggest brain on the ship. So super dooper smart, I should get, like, smart-girl glasses.”</i> Rolling your eyes, you just motion for her to follow you.");

		output("\n\nYou and your galotian head to the chair you’ve set up for the visor and with squelching slurps, she climbs up and wiggles into place. Her goo pools around the cushion and drips onto the floor, but her jiggly curves manage to stay solid enough to let you lower the visor down around her eyes. <i>“Ooooooo. Pretty!”</i> She starts poking at the visor, but you pull her hands back down to the arm rests.");
		output("\n\n<i>“Just sit there and let the machine work,”</i> you advise, flipping the external switch to activate the machine and stepping back to watch.");
		output("\n\n<i>“This feels funny. Am I-”</i> she stops mid sentence as the visor hits its stride. Lights start flashing across the screen at a rapid pace while the goo girl’s body swells and contracts, as if her whole form were taking a deep, steadying breath. ");
		//if Celise has tentacles activated: 
		if(flags["GIGACELISE"] == 1) output("The mass of her writhing tentacles slips back into her body, sucked up to allow her breasts to swell once more to the porn-star levels she is no doubt experiencing. ");
		output("Your emerald friend’s long, slimy tresses sink into her back and shoulders, leaving a short, sensible bun perched atop her head. Her body changes bit by bit, until she’s nearly unrecognizable from the girl she was at the start of all of this.");

		output("\n\nThe reshaped goo twitches, her mouth curled in an ‘O’ of pleasure and you notice dimples form on the outside of one of her breasts. They run across the globular surface, sliding in shrinking circles until they reach her big, puffy jade nipple. As her fat areola squeezes outward, you realize what those dimples must’ve been: fingers. Her body is acting out what her mind is experiencing.");

		processTime(4);
		clearMenu();
		addButton(0,"Next",mindwashCeliseFirstimeII);
	}
	else
	{
		//these scenes are randomly selected from all the component listed next to each other
		output("All you have to do is crook a finger at your galotian and the green girl climbs up into the seat you’ve set aside for the Mindwash visor. She squirms a bit to get comfortable and giggles as you lower the mask over her eyes. With a little tweak to the intensity settings, you send her off into a very smutty dreamland.");
		output("\n\nThis time, Celise reforms into ");
		var celiseScene:Number = rand(6);
		if(celiseScene == 0) output("a well endowed kui-tan, her nuts swollen with seed and need.");
		else if(celiseScene == 1) output("a feminine ovir, her trunk-like shaft slipping out from between her thighs like a floppy third leg.");
		else if(celiseScene == 2) output("a masculine, well-built ausar with muscles so tight that you can practically see veins in the goo.");
		else if(celiseScene == 3) output("a particularly busty zil girl, her belly gravid with and extremely advanced pregnancy.");
		else if(celiseScene == 4) output("a built thraggen, drooping balls the only part of her that’s not rock hard.");
		else output("a long-eared raskvel, her huge hips squishing against the limits of the chair’s armrests.");
		output(" Celise seems to adjust to her new shape almost immediately, as if she’d worn it all her life. The flickering light of the visor seems to send pink trembles through her goo as the show gets started.");

		output("\n\nWith little ceremony, her body starts telling you everything you need to know about the scene she’s currently experiencing. ");

		celiseScene = rand(4);
		if(celiseScene == 0) output("A host of finger indentations spread across her body, dozens fo invisible people clutching and groping every inch of her form.");
		else if(celiseScene == 1) output("Her mouth goes wide as an invisible mass thrusts into her maw, filling one cheek, then the other as handprints form around the back of her head.");
		else if(celiseScene == 2) output("Her knees are lifted and spread to accommodate the unseen girth of an absurdly massive shaft is forced, inch by inch, into her ass.");
		else output("Her hands sink between her legs, frantically pressing into her reformed anatomy with all the pent-up lust of a horny teenager.");

		output(" You can hear Celise moan but only faintly, as if her voice were coming from some vast distance. She wiggles and squirms, knees trembling and chest fluttering as she blushes with a deep, forest green flush.");

		output("\n\nYour galotian winces as ");
		celiseScene = rand(4);
		if(celiseScene == 0) output("a clear hand-print appears across her ass so violently you imagine you can almost hear the slap.");
		else if(celiseScene == 1) output("the underside of fingers appear around her neck, tightening just enough to make her take short, shallow gasps.");
		else if(celiseScene == 2) output("her hair jerks down, pulled by some unseen force with a tug fierce enough to yank her head back.");
		else output("a human-shaped footprint presses down on her crotch, shifting from side to side and driving its heel against her throbbing body.");
		output(" The violence startles you, but the goo girl just squeaks out a cooing whimper. Chest heaving with swelling excitement, she ");

		celiseScene = rand(4);
		if(silly && rand(2) == 0) output("affects a falsetto, proclaiming <i>“Oh, what a lovely tea party!”</i>");
		else if(celiseScene == 0) output("calls out for daddy to give her more.");
		else if(celiseScene == 1) output("begs them to let her cum.");
		else if(celiseScene == 2) output("defiantly asks if that’s all they’ve got.");
		else output("eggs them on, crying out <i>“Again! Harder!”</i>");

		output("\n\nYou aren’t sure if there’s any response from the hidden participants in the porn Celise is experiencing, but the action carries on. For the next hour, she is subjected to ");
		
		celiseScene = rand(4);
		if(celiseScene == 0) output("dozens of tongues licking her all over while just as many cocks force themselves into her ass, one after another.");
		else if(celiseScene == 1) output("a series of slapping impacts across her face that knocks her head to and fro, until she’s disoriented, drooling, and pinching her nipples hard enough to make herself yelp.");
		else if(celiseScene == 2) output("a rising and falling weight atop her lap, invisible thighs squeezing and grinding into the goo’s base with heedless abandon.");
		else output("a seemingly endless array of small pinpricks as needles are being forced into her arms, shoulders, thighs, and ass, filling her with dizzying number of unknown drugs.");
		output(" Through it all, she whispers heated groans and whimpering moans, occasionally offering faint encouragement as much to herself as the invisible figures leaving their indents across her supple, verdant mass.");

		output("\n\nWhen the porn reaches its peak at last, you’re ");
		if(pc.isNice()) output("almost relieved that your poor goo’s ordeal is coming to an end.");
		else if(pc.isMischievous()) output("still trying to reconstruct the plot in your head, filling in characters and motivations like a mad lib.");
		else output("practically taking notes on some fun new things to try out yourself.");
		output(" Celise gurgles as ");

		celiseScene = rand(3);
		if(celiseScene == 0) output("her interior parts to allow non-existent loads of cum to pour down her lips and up her ass in twin torrents that rush to meet in her middle.");
		else if(celiseScene == 1) output("large holes open through both nipples, heavy piercings weighing down her teats with and leaving ring-like indentations on her pliant peaks.");
		else output("gushing release spurts from her body with the honey-thickness of long-teased bliss.");
		output(" At the height of her climax, the bimbo’s expression is one of glowing rapture, triumphant in her needful indulgence.");

		output("\n\nRippling waves of orgasmic pleasure send wobbling vibrations through the girl’s gelatinous form, ultimately shaking her self-control away. She collapses into a puddle of goo once more, and you pull the visor aside, switching it off. It takes a bit longer than usual for her to reform, but your slimy friend returns with a big, dopey smile all the same. <i>“I dunno how you guys do it! Being solid is crazy!”</i>");

		output("\n\nYou assure her that, yes, it is quite crazy and help her down from the chair. If it were anybody else, you’d worry about subjecting them to the machine this intensely, but something tells you that Celise will just keep springing back to her old self, no matter what the visor throws at her.");
		processTime(75);
		pc.lust(25);
		IncrementFlag("CELISE_MINDWASHED");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

public function mindwashCeliseFirstimeII():void
{
	clearOutput();
	showCelise();
	author("Adjatha");
	output("The rounded peak of her nipple is pressed inward by an invisible force, squishing her bloated teat inward, further and further. As if opening with a heated sigh, the tip of her peak dilates, widening enough to allow what could only be a phallus into her massive, jiggling breast. You round the goo and stare down the two-inch tunnel being pressed into her and even reach a finger out to wiggle the digit in the deepening hole. If you didn’t know better, you’d think Celise were getting nipple-fucked by an invisible cock. Not a big deal for a galotian, but one has to wonder who the porn star was for whatever she’s watching.");
	output("\n\nThe other breast experiences a similar procedure: unseen hands roughly grabbing the weighty mass before a fat phallus pushes past her impossibly pliant peak. More hands form around her knees and pull her plump thighs apart. A pair of indentations on her abdomen seem to suggest a double-dicked participant has entered the orgy and in short order he goes to work as well. Both her pussy and her asshole widen with intangible girth, all four shafts in her pushing deeper and deeper. Once every tunnel infiltrating the girl’s body seems to have reached its limit, she turns her head over one shoulder and the ‘o’ of her moaning delight is pulled to the very limits of her cheeks, the largest cock of all jamming itself past her tongue and down her widening throat.");
	output("\n\nShe jiggles with the weight of her unseen partners’ lust, her molded form possessed by thirty minutes of frenzied thrusts. She seems perpetually on the threshold of a full-body orgasm as her frame is plied to exhaustion by by unquenchable lusts. Cylindrical tunnels visibly bisect her body again and again, thrust after thrust. There is a sense of tension, every point of penetration widening more and more until, at last, the invisible masses are pushed to their limits and fat bulbs pop into place. Celise - or more accurately, whoever she is watching - has just been quintuple knotted. The experience is too much for her, and the girl starts helplessly squirting in the intensity of her climax. Because her simulated partners have nothing real filling her tunnels, the galotian’s gooey juices start spraying out of her pussy, drenching her inner thighs and dripping into a pool on the chair seat.");
	output("\n\nThe outlines of knotted phalluses pump with the disjointed, shallow strokes you’d expect of four people reaming a single girl, all while the galotian squirms and creams herself with gushing, sloppy gurgles. The shaft in her throat bloats and you can practically see the path of its invisible spunk as the peak sprouts a thin offshoot which rolls down her chest and pools in her middle in an expanding, empty stomach. One after another, the knotted tunnels reach their own climax in the girl, pouring the bloating contents of their bliss into her overfilled form.");
	output("\n\nThe imaginary dog dicks try to pull out, but the knots are too large and her body too tight, so they content themselves with a slow, lazy series of half-hearted thrusts, enjoying the spunk-filled cock holsters.");
	processTime(15);
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",mindwashCeliseFirstimeIII);
}

public function mindwashCeliseFirstimeIII():void
{
	clearOutput();
	showCelise();
	author("Adjatha");
	output("The lights on the visor go out and immediately, Celise loses her consistency. The girl splashes into her seat like a popped water balloon, the smut machine dropping atop the puddle like a crown. You retrieve the visor and set it off to the side as Celise slowly reforms into her normal shape. She looks woozy and every so often, you can see her nipples inverting, as if being pushed inward by more invisible penises.");
	output("\n\n<i>“So, how was it?”</i> you ask, coyly.");
	output("\n\n<i>“It was squelchin’ awesome!”</i> she gushes, throwing her arms wide. <i>“It was like I was a totally different girl! Like, all solid an’ stuff! And there were all these other ausar guys and they were totally reaming me, but I couldn’t just reform, so I had to take all the pressure and it was AMAZING. Can I go again? Can I? Can I?”</i>");

	if(pc.isNice()) output("\n\nOn the one hand, you doubt it could really do much to harm the irrepressible goo, but on the other, you don’t want to take the chance. After all, Badger technology shouldn’t be taken lightly. You allow her to use the visor once a day, and only for an hour at a time. Tough but fair.");
	else if(pc.isMischievous()) output("\n\n<i>“Hey, knock yourself out,”</i> you remark with a shrug and a wink. <i>“Just remember the visor’s not going to actually feed you, so be sure to pay your captain a visit from time to time.”</i> She looks alarmed at the thought of a missed meal and you doubt she’ll just plug herself in while you’re aboard the ship, just in case.");
	else output("\n\nYou didn’t really set up the Mindwash so the goo girl could spend all her time on it. You insist she not use it unless you’re there to supervise. Can’t have the bimbo breaking valuable tech, after all.");

	output("\n\nShe looks at the visor and back at you, practically bubbling with delight <i>“Oooo, thank you [pc.name]! What a cool toy!”</i> She leaps forward, practically throwing herself at you and wrapping her arms and legs around you in a full-body hug that puts a bit too much pressure on your ribs. You tense at first, but accept the over-stimulated goo’s embrace.");

	output("\n\n<i>“Yay toys,”</i> she whispers as she gives you another big squeeze.");
	processTime(7);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	IncrementFlag("CELISE_MINDWASHED");
}

//Imp Mob Ambush
public function impMobAmbush():void
{
	clearOutput();
	showName("IMP\nAMBUSH");
	author("?? CoC ??");
	output("You sleep uneasily. A small sound near the edge of your camp breaks into your rest and you awaken suddenly to find yourself surrounded by a mob of imps!");
	output("\n\nThe gang of imps swarms over you, dragging you to the ground as you twist and struggle in their grips, determined to make them work for their fun! They pull you down over a fallen log, ass resting above your head. Two imps sit on your arms, their gonads rubbing against your biceps, and rub their hands over your shoulders and chest. Others stretch your legs wide apart, holding them against the log.");
	output("\n\nThe imp gang makes short work of your red, high-society bodysuit, unbuckling straps and stripping you quickly. An imp mounts your chest and slaps his shaft between your multi-layered breasts, squeezing them tight over his cock as he rubs back and forth. Two imps seize your cluster of wide, squirming cock-tendrils, licking the tips with their inhumanly nimble tongues while they stroke the shafts. You writhe in the grasp of the imps, reveling in the sensations of being spread open and completely at the mercy of these demons. Tiny hands slide over your face and you lick and suck at the fingers.");
	output("\n\nHands slide over your multi-layered back-breaking love-pillows, pinching and pulling at your nipples. The imp riding your immense breasts licks your tit-flesh, slowly working his tongue up towards your slightly lactating cherry-like nub. Finally the imp’s tongue reaches your nipple, wrapping around and pulling at the tingling flesh. The tongue squeezing and tugging your nipple floods your body with lust. You moan and arch your back, offering your tits to the imp riding your chest. You can hear your pulse pounding in your ears as you pant in desire. Suddenly you feel tiny needle-sharp teeth pierce your nipple. You scream as venom pumps into your tits, red-hot poison that makes your multi-layered mountainous love-pillows feel as though they were being stung by bees. You moan in pain as your breasts start to swell, the imp rider biting into your other nipple to pump demon-taint into it.");
	output("\n\nThe master of this imp gang steps up between your legs, leering down at your trapped body. Four feet tall and broader and stronger than any imp in the pack, with a face as much dog as imp, this new imp has grey fur, broad black demon wings, two long demon-horns on his head, and a animalistic puppy-pecker big enough to choke a minotaur. Pre-cum drips from the broad tip of it, dripping down onto your cluster of distended, sinuous tentacle-cocks. The heat stings your flesh. The imps licking your groin lap up the hot fluid, cooling you with their saliva. The big imp sneers as you whimper, and drags the head of his pointed shaft down to your very loose twat. He thrusts brutally, shoving the head of his fat pointed prick into your pussy. The master imp’s painfully hot knotty dog-shaft stretches your hole wider than it ever should be, and you moan in perverse ecstasy. His huge dick-knot bumps against the entrance of your muff.");
	output("\n\nThe big imp reaches past your tit-rider and grabs one of your painfully distended breasts in each hand, mauling and bouncing the flesh as if weighing them. You gasp in pain as your multi-layered monumental breasts swell further at his touch. Your mouth gapes open and an imp takes the chance to stuff it full of cock. The master imp grabs your hips and starts to fuck you hard, pistoning his steaming cock in and out of your slavering snatch. The rough fucking shakes your breasts, and the imp sucking your nipples clings tightly to your monstrously swollen three rows of breasts. Your breasts have grown three cup sizes since the imp pumped his venom into you. The imp fucking your face grabs your ass-length, green goo-hair and jaw, forcing your head back so he can ram his cock into your throat. The obscene bulge sliding in your throat matches the bulge in your belly. The smaller imp pulls back just enough to let you gasp for air, then thrusts into your throat again. The big imp pounds the knot of his pointed dog-dick against your very loose muff, not caring that he’s stretching you beyond normal human endurance. This corrupted land has left its mark on you. You could never have taken a cock this big before you arrived here.");
	output("\n\nAn ache starts deep in the base of your tits and works its way to your sore nipple. Your already bloated nipples swell as your rider suckles and you gasp as the first rush of milk spills into his mouth. Your rider milks your udders, moving his hands between your multi-layered back-breaking tits and forcing out more milk than he could ever drink. Other imps lick the milk from the shiny skin of your swollen breasts.");
	output("\n\nThe smaller imp slams his cock as deep into your throat as it will go, slapping his two apple-sized balls against your face. He cums, balls twitching as they pump spunk down your throat. You can feel your stomach stretching, but you’re more worried about breathing. The imp cums for an impossibly long time, streams of jism pouring into you. The edge of your vision starts to go red and your chest heaves as you fight for air. Finally the imp draws his cock out of your throat, spraying his last gobs of cum over your face as you gasp in huge lungfuls of air. The sudden rush of oxygen pushes you over the edge and you cum hard. Your body arches and your eyes roll back in your head as you twist around the demonic canine shaft pounding into you. You shriek as your very loose fuck-hole spasms on the steaming pole that impales it. Another imp shoves his cock in your mouth as you scream, throat convulsing around his cock-head. Your wriggling bunch of distended, wriggling plant-pricks shoots cum across your belly and into the waiting mouths of the imps licking your crotch.");
	output("\n\nImps lick milk from your bloated breasts as your rider milks you. As one imp drinks his fill, staggering away with a sloshing belly, another steps up to guzzle from your milk-spewing udders.");
	output("\n\nThe imp-cock in your throat spasms and its owner rams as deep into you as he can get. He floods your already swollen stomach with inhuman amounts of cum. Again you feel yourself about to black out as the demon pumps jism into you. He pulls out and again you orgasm as you wheeze for air. Another imp forces his cock down your throat as you moan and gasp. Your body shakes in pleasure on the big imp’s canine member. Tightening his grip on your flared thighs the master imp howls and slams his shaft into your muff. His unnaturally huge knot stretches the entrance of your hole, and he hammers into you again. The master imp’s bloated knot stretches your entrance and plunges into your hole with a loud pop. Another orgasm hits you as the pointed shaft rams even deeper into you. You howl around the imp-cock stretching your throat, thrashing and bucking as your orgasm shakes you. Your violent thrashing throws the imps off your legs and you wrap your legs around the big imp, pulling him further into your hole. The big imp howls again as he cums, each wave of steaming demon-cum stretching his knot and shaft even more. His cum-pumping pointed dog-dick is bottomed out deep in your womb and he pumps more jism into you than his balls could possibly hold. Your belly stretches with every blast of cum and you shriek around yet another cock in your throat.");
	output("\n\nThe imp riding your monumental tits finally cums, painting your distended fuck-udders with his massive load. Your master isn’t done with you yet, churning his pointed prick knot in your twat as he continues to cum. You’re pumped full of demon-cum from both ends as one imp shoots his load in your throat and another steps up to take his place. You shake and tremble in your own endless orgasm as the pleasure in your stretched hole blends with the pain of your swollen belly. Your legs thrash as the master imp shifts his massive knot within your monstrously stretched very loose muff. Your toes curl as you feel more pulses of demon-cum work their way up his shaft and into your already-huge belly.");
	output("\n\nYou pass out as another load of imp-cum pours down your throat, another tidal wave of corrupted jism spews into your hole, to meet somewhere in the middle...");
	processTime(45);
	var cumNum:Number = pc.cumQ() * 2;
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",impNightBang, cumNum);
}

public function impNightBang(cumNum:Number):void
{
	clearOutput();
	showName("\nAFTERMATH");
	author("?? CoC ??");
	output("You wake up later, still trembling with small orgasms. Cum burbles in your mouth as you breathe. You haven’t moved since you passed out. Your hips are still propped up over the log, and you rest in a cooling pool of cum, your ass-length, green goo-hair plastered to the ground with drying jism. You couldn’t move even if your legs felt stronger. Your hideously bloated belly weighs you down, and your milk-filled udders are still swollen with imp-venom, quivering with every orgasmic twitch that passes through you. The skin of your distended belly and massive tits is drum-tight and shiny, and your belly-button has popped out into an outie. As you slip back into unconsciousness, one last thought flits across your mind. Why bother with your silly quest, when you’ve only scratched the surface of the pleasures this land offers you?");
	processTime(24);
	cumNum += pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

//Akbal
public function akbalScene():void
{
	clearOutput();
	showName("AKBAL:\nPANTHER GOD");
	author("?? CoC ??");
	output("As you are walking through the forest, a twig suddenly snaps overhead. You quickly look up towards the source of the noise, only to be met by a pair of glowing emerald eyes hidden in the shadowed canopy of a tree. A demonic force sweeps over you, keeping you frozen in place as a single jaguar paw emerges from the darkness. The graceful killer stalks across the branch of its tree and soon is fully exposed to you. Bathed in the sunlight filtering through the trees overhead, the creature holds you within its gaze – a gaze far too intelligent to belong to a mere wild animal. A chorus of whispering voices tickles your ear, but too quietly for you to make out what is being said.");
	output("\n\nThe jaguar blinks, releasing you from your trance, and the creature finally jumps down to the ground. It widens its stance and unleashes a roar so loud that it seems to be coming from every direction at once, drowning out everything but the sound of your own heartbeat hammering away in the confines of your chest.");
	output("\n\nThe creature circles you once before you hear a deep male voice rise amongst the chorus of whispers.");
	output("\n\n<i>“I am Akbal, God of the Terrestrial Fire. You are trespassing on sacred ground... Submit, or die.”</i>");
	output("\n\nThe aura pouring forth from this ‘Akbal’ is anything but god-like; you recognize the demon for what it truly is. Yet its ivory teeth and sharp claws prove to you that it can make good on its threat. What do you do?");
	output("\n\nAfter a few moments of silence you ask, <i>“What do you mean, ‘submit’?”</i> Akbal grins, revealing a row of wicked ivory teeth as he opens his mouth. You suddenly feel the demon’s powerful body pinning you down, a wide tongue licking your neck and claws tickling your back in a way that is both horrifying and sensual. Yet after a moment of taking it in, you realize that he is still there in front of you, unmoved and grinning. You can guess what the image means: he wants you to become his mate for a day to make up for invading his territory. What do you do?");
	processTime(10);
	clearMenu();
	addButton(0,"Submit",akbalSubmit);
	addButton(1,"Resist",akbalDefiance);
}

//Submit
public function akbalSubmit():void
{
	clearOutput();
	showName("AKBAL:\nPANTHER GOD");
	author("?? CoC ??");
	output("After thinking for a minute, you nod to Akbal. The deep voice in your head commands you to disrobe. You obediently take off your red, high-society bodysuit and set it aside just before the demon is upon you.");
	output("\n\nAkbal pushes you face-first into the ground and places his forward paws on your back, pinning your chest against the ground. He removes them after a few seconds and you attempt to reposition yourself, only for you to be pushed back down again: a silent yet forceful command for you to stay in this position.");
	output("\n\nHis paws slide to your waist, changing into hands along the way. You look back and watch as his body starts morphing into a more humanoid shape, his muscles shifting themselves beneath his skin as his body changes to something better suited to dominate you.");
	output("\n\nHe suddenly yanks your upturned bottom half toward himself and shoves his face into your cushiony ass. His slippery wet tongue begins to work its way into your anus, greedily lapping at your exposed backside as though it were a quickly-melting ice cream cone. The sensation causes you to groan and grind against the tongue, quickly losing yourself into ecstasy. You spread your legs and arch your back, allowing his long and thick jaguar tongue to drill deeper into your loose asshole. You feel his thick and warm saliva sliding into you and coating your insides.");
	output("\n\nAkbal slurps his way down to your slavering cunt, twisting his face and drilling his tongue into you, mercilessly attacking your greedy clitty as you scream, howl and cringe from the stimulation. He then gently sucks your diminutive clit into his mouth and twirls his tongue around it, making you grind your swollen sex against his jaguar lips. His oral ministrations end when a sudden warmth heats your innards, and you shiver in ecstasy as the demon rises to mount you. A single paw-like hand shoves your lifted chest and face back into the dirt, causing cold earth to cling to your face as Akbal gets into position above you.");
	output("\n\nYou feel him poking around your loose backdoor, learning quickly that not only is his member insanely large, but its head is covered in dozens of tiny barbs. You grit your teeth, expecting pain. However, thanks to the weird saliva he slathered your innards with, you feel none as his gargantuan member forcibly widens your loose backdoor.");
	output("\n\nBeing stretched by Akbal’s long and slick member makes you shudder. The weird spit even begins to heat up, creating a steamy warmth inside you as Akbal’s equally hot member stretches you out, your body spasming slightly in response. After a few slow and shallow strokes, you can feel the barbs begin to vibrate. The sudden motion sends your body into convulsions, the wicked-looking barbs acting more like humming sex beads than barbs. When Akbal picks up the pace, you can only grit your teeth harder as you’re stretched more and more beyond your natural limits.");
	output("\n\nAkbal works his hips fast, piston-pumping his long demon cat-dick in and out of your loose pucker. The rampant babbling coming from your mouth breaks with his every thrust, and your body is racked by orgasm after orgasm. You’re soon on your chest and knees in a pool of your own love juices.");
	output("\n\nAkbal releases a harsh growl and you feel his large feline member twitch and swell inside you. You let out a growl of your own as the hot, corrupted seed of the demon cat shoots into you. Feeling the hot, wet warmth being fucked deeper into you is so close to supreme bliss that you can scarcely tell the difference.");
	output("\n\nAfter the sensation begins to settle, you realize Akbal isn’t slowing down. His hips carry on with their pistoning right through his orgasm and continually slam into your big, slappable butt. He persists until he’s erupted no less than eight times, masterfully working your hole the entire time.");
	output("\n\nAfter his final massive eruption, the jaguar demon pulls out. His copious load is released from your happy hole in an oddly satisfying cascade of thick white cream, rushing like a waterfall down your legs.");
	output("\n\nThe jaguar demon no longer seems to mind your presence in his territory as he drapes his body over yours, and the two of you fall into a sex-induced sleep.");
	processTime(20);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

public function akbalDefiance():void
{
	clearOutput();
	showName("AKBAL:\nPANTHER GOD");
	author("?? CoC ??");
	output("You fall to your knees and begin to feverishly masturbate. Akbal rises onto his two hind legs, his body shifting into a more humanoid form as he stands. His long cock swings ominously between his legs as he walks towards you. The first thing he does is pull his massive 15-inch cock to your lips, slapping the shaft against your chin.");
	output("\n\nLike a whore in heat, you open your mouth and lewdly lick the jaguar demon’s cock head, feeling odd barbs rub against your tongue. Your mouth opens wide, but can’t even get past the head before the sheer girth of Akbal’s massive sex organ halts its advance. Akbal is content to let you orally fumble with the head for only a few moments before he pushes down onto your back. His claws tickle your thighs as he forces your legs up over your head, bringing your anus into plain view.");
	output("\n\n<i>“Defiance repaid,”</i> is all you hear from the chorus of voices in your head as Akbal displays his massive length to you. Your eyes widen in horror, counting a dozen wicked-looking barbs on the head of his overtly thick and over-sized cock.");
	output("\n\nAkbal begins to push into you, the barbs on his massive cockhead causing you to wince as are forcibly stretched. Without warning, he forces the entirety of his massive length into you in with a snarl. You almost pass out just from the initial incursion, but as he saws his length in and out, your body reacts of its own accord. You widen your legs in an attempt to lessen the sudden slicing pressure created by the barbed cock head. The moment you stop resisting, the barbs start to vibrate; they start to feel more like humming sex beads than the wicked-looking barbs you know are inside you. You can’t suppress the shuddering and groaning coming from your body as you are hit with a tidal wave of ecstasy.");
	output("\n\nAkbal’s embedded cock begins to hum inside you, causing you to cry out as he picks up the pace. His every thrust is a hammer-like thump against your spread legs. Suddenly his thrusts become sloppy, and you feel his giant tool swelling inside you, stretching you out even more. Akbal roars as he reaches his climax, and you feel his giant cock hosing down your insides, filling you with his corrupted demon seed as he rides out his orgasm. His hips never stop. You feel your own orgasm rising to the surface, only to suddenly fizzle out. It is with horror that you realize that the corrupted seed inside you is actually stopping you from reaching climax. Akbal, however, sprays his spunk into your asshole again and again, not slowing for even a moment. Soon your stomach is obscenely swollen, and you even taste cat jizz in your throat. Yet Akbal just keeps going, brutally fucking you into the ground.");
	output("\n\nAfter hours of being his toy you finally pass out, never having reached your own orgasm.");
	processTime(65);
	var cumNum:Number = pc.cumQ() * 3;
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

//Kitsune
public function kitsuneSex():void
{
	clearOutput();
	showName("DEFEEATED\nKITSUNE!");
	author("?? CoC ??");
	output("Standing over the beaten kitsune, you hear a barely audible groan. Curiously, you lean down, and are surprised to find that the sound is coming from the girl’s stomach.");
	output("\n\nShe gently rubs her somewhat pudgy tummy, sighing and whimpering, <i>“So hungry...”</i>");
	output("\n\nSo, she’s hungry, is she? With a smirk, you tell her you have just the thing to fix that.");
	output("\n\nStripping out of your red, high-society bodysuit, you pull her into a kneeling position and press her back against a tree, presenting your slithering vine-prick with a grin. She ogles it hungrily and licks her lips, eyes wide with desire. As she reaches up to take it into her hands, you grab her wrists instead and pin them to the trunk of the tree. You explain that she is to use only her mouth, and that if she does her job properly, then you will satiate her hunger.");
	output("\n\nShe pouts coyly, pursing her plush, kissable lips. Your eyes are drawn to them, and it is only now that you notice just how juicy and full-looking they truly are. As she leans forward to press them to your wide plant-like crown, they seem to plump up even more, their warm wetness sending a shiver of pleasure through your groin.");
	output("\n\nGrinning up at you, she dips underneath your shaft, lifting it up with her nose, flattening out her tongue around the underside of your base and running it slowly upward. Having her wrists restrained doesn’t seem to be hampering her ability to pleasure you much at all - it even seems to be turning her on. She pushes your writhing tentacle-pecker up against your stomach using her nose, kissing along the underside longingly and making wet smacking sounds.");
	output("\n\n<i>“Mmn... it’th tho delithiouth... can’th waith thil ‘oo fee’ me lotth of tasthty cu’n,”</i> she slurs around your hardening member, always staring up at you demurely with those big green eyes.");
	output("\n\nInch by inch she trails her tongue up the shaft, lavishing your cock with affection as she loudly and shamelessly licks and laps her way up and down. With one final exaggerated slurp, she runs her wet tongue from base to wide plant-like crown, narrowing her eyes mischievously. Warm wetness encases the end of your member, a gentle breeze cascading over it as she exhales slowly from her nose. The contrast of her cool, minty breath and the warmth of her mouth sends sparks of flaming pleasure zig-zagging down your shaft, making you shiver.");
	output("\n\nYou have to admit, the gluttonous slut certainly has skills! You have to suppress a moan when she parts her plump lips into a large ‘O’ and engulfs your member, her cheek bulging out as she tilts her head to one side, trapping you there. Righting herself, she begins to bob her head, pushing you to the back of her throat repeatedly. The pillowy caress of her plush pink lips sliding around your member ripples through your loins, making you groan deeply in pleasure. Before you can get too ahead of yourself, though, she pulls back, lips squeezing tightly every inch of the way until your throbbing cock breaks free of her lips with a resounding ‘plop’! She skillfully catches the tip on her lower lip, her tongue snaking out to gently cup the underside.");
	output("\n\n<i>“Mmn... I’n tho lucky...”</i> she croons, the corners of her mouth curling up as she kisses it gently, blowing cool azure flames across the tip. <i>“Doeth it theel good?”</i>");
	output("\n\nYour shaft is swallowed up once more, forced to the back of her throat as she gulps down inch after inch of your throbbing meat. She pulls back, sucking as though her life depended on it, then dips down again, slurping up your salty precum desperately. The mushroom-like tip of your cock hits the back of her throat again and again, each bob of her head inching her lips closer and closer to your base. She hungrily swallows along your length, moaning into your engorged prick as she finally presses her lips to your base and rolls her eyes back in pleasure, her neck bulging slightly from the presence of your shaft.");
	output("\n\nHer throat muscles ripple and pulse around you, making loud slurping and gulping noises that only fuel your lust. She pulls back, her lips pursed around just the very tip as she stares up at you needfully for a moment before closing her eyes and downing your entire length once more. With her face impaled on your member, you can feel her tongue slithering out of her mouth, looking down to see the obscenely long appendage coiling around your member and squeezing gently. Your cock bulges out around it, swelling up incredibly, and the kitsune looks up at you, playing innocent.");
	output("\n\nShe resumes her wild deep-throating, moaning through your cock as she swallows it whole time and time again. Strings of saliva mixed with precum start to fly from the corners of her mouth with each bob of her head, dribbling down your shaft. Driven by lust, you opt to forgo your prior negotiations, releasing her wrists to instead grab the back of her head. A light giggle trembles through your cock as you thrust your hips forward, tilting her head back a little and moaning deeply.");
	output("\n\nTaking advantage of her newfound freedom, the kitsune slides her hands up and down your sides, wisps of flame sparking to life and dancing along her fingertips, seeking only to heighten your pleasure. Trailing them across your sides, she runs her index finger teasingly along your slit. Her throat muscles relax entirely, and she happily submits herself to your brutal face-fucking.");
	output("\n\nAgain and again, you thrust your waspish thighs forward, mashing your pelvis against her face. Your knee-length, wriggling plant-shaft glides down her throat, making her neck bulge outward, and her only response is to moan into it, swallowing hungrily. She massages your shaft sensually with her lips, using her tongue and throat to eagerly draw you inside again each time you pull back. From the intense moaning that is vibrating through your bucking groin, you judge that she must enjoy being used like this, a thought that only heightens your desire even more.");
	output("\n\nYou feel a tightness swelling in your prostate as your pleasure starts to come to a head, running your fingers down through her soft, raven-colored hair. Her glistening green eyes roll back in her head as she opens her throat to accept your orgasm gleefully, her tongue dancing along your length. When your climax hits, a thick bulge begins to swell up just behind where her tongue still has a tight grip on your base. It builds until the pressure is too much to hold back, and then releases all at once, the kitsune moaning powerfully into your cock as the delicious, salty cream pours into her throat.");
	output("\n\nShe sucks it down hungrily, gripping your shaft with both hands and milking it for all it’s worth, as though it is the last meal she’ll ever have. As stream after stream of sticky seed cascades down her throat, her tongue swirls around inside her mouth, gathering up every stray drop. Swallowing eagerly, she gulps down your shaft one last time, tightening her lips and squeezing the final few globs of cum from your urethra as she pulls back with a loud ‘smack!’");
	output("\n\n<i>“Mnn... so tasty... is there... is there any more?”</i> she asks hopefully, wiping spittle from the corner of her mouth and licking her fingertips hungrily.");
	output("\n\nSighing in satisfaction, you step back from the tree to catch your breath. The kitsune leans back, laying a hand on her stomach and rubbing it lightly. An audible gurgle reaches your ears, and she sighs bemusedly, shaking her head. Either way, it doesn’t look like the exhausted girl is going to be getting up soon, so you gather your things and head back to camp.");
	processTime(40);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

//Gold
public function goldKitsune():void
{
	clearOutput();
	showName("GOLD\nKITSUNE");
	author("?? CoC ??");
	output("As you explore deeper into the dense wood, you are abruptly aware that your surroundings have grown darker without warning. The back of your neck tingles lightly with a sense of foreboding, and you instinctively ready your fists, feeling uneasy. Wracked with paranoia, you find yourself swiveling to face toward every random noise, and you could swear you just heard a voice through the trees. There it was again! As the ghostly, feminine laughter fills your ears, you are positive that it can’t just be your imagination. You turn left, then right, trying to pinpoint its source, but it truly sounds as though it is all around you now.");
	output("\n\nCatching a glimpse of motion out of the corner of your eye, you whip around to face it, but are surprised to see that the only thing there is a small, pale blue flame, flitting about idly. It dances around hypnotically, and as you stare into its ghostly light, you find your conscious mind growing hazy. Your concerns suddenly seem trivial, and you find yourself relaxing gradually as the ethereal wisp glides along your arms, leaving behind a cool tingle where it touches you.");
	output("\n\nIt seems to be beckoning you to follow it.");
	output("\n\nYour mind is jogged out of its haze when you remember a note from the Traveler’s Guide. It warned about mysterious flames in the forest that lead hapless adventurers astray. You hesitate now, wondering what to do.");
	output("\n\nThe flame suddenly darts off into the darkness of the trees, and you find yourself unable to resist giving chase. It feels as though you are being drawn to it by some otherworldly force, but every time your suspicions begin to grow, the flame pauses to float around you, tickling your erogenous zones and then pressing onward.You are unsure of how long you have been stumbling after the flame, but in a brief moment of clarity, you stop dead in your tracks and look around cautiously. Suddenly you deeply regret having followed the flame this far out of your way. Your skin crawls as you hear that eerie, ghostly laughter once again, making you shudder involuntarily. As you turn to head back the way you came, you practically jump out of your tan skin in surprise. Mere inches from you stands a strange woman with back-length, flaxen hair, smirking precociously.");
	output("\n\n<i>“My, my, aren’t we the clever one?”</i>");
	output("\n\nAs she closes the gap even more, you now notice that she isn’t any ordinary woman - a pair of large, vulpine ears parts her hair at the top of her head, and six luxuriously furred tails fan out around her. A layer of ornate tattoos covers patches of her exposed flesh, accentuating her feminine curves nicely. She’s so close now that a few of the tails are drifting along your tan skin, leaving a trail of crackling blue sparks that impart the same cool tingling that the flame did.");
	output("\n\n<i>“You resisted my illusions... that’s impressive,”</i> she says, teasing you with her tails. You back away from her, but give a start and wheel around when you feel yourself bump into something.");
	output("\n\n<i>“Going somewhere?”</i>");
	output("\n\nHow did she get behind you so quickly? You were staring at her the entire time! Glancing quickly over your shoulder, you confirm that this is not a case of twins, but when you turn to face her, she has disappeared once again!");
	output("\n\n<i>“Over here, silly~”</i> she calls to you with a mischievous tone, beckoning to you as you whip around to face her voice. <i>“Don’t be shy, I don’t bite... often...”</i>");
	output("\n\nHer tone is innocuous enough, but her mannerisms are a little disconcerting, somehow. What are you going to do?");
	output("\n\nSomething just doesn’t sit right with you about this woman, and you cautiously raise your fists, watching her carefully.");
	output("\n\n<i>“Ah, so we’re going to play like that, are we?”</i> she says with a grin, making a small clawing motion in the air. <i>“Very well my darling, if that’s how you want it, but I won’t be taking it easy on you just because you’re cute~.”</i>");
	output("\n\nYou are now fighting a blonde kitsune!");
	processTime(20);
	clearMenu();
	addButton(0,"Next",goldKitsuneII);
}

public function goldKitsuneII():void
{
	clearOutput();
	showName("GOLD\nKITSUNE");
	author("?? CoC ??");
	output("The kitsune hits the ground with an ‘Oomph’, landing roughly on her well-cushioned backside. She rubs her sore posterior, wincing in pain and pouting childishly.");
	output("\n\n<i>“I only wanted to play...”</i> she says, looking crestfallen.");
	output("\n\n You could use an oviposition elixir on her...");
	output("\n\nYou fish in your pouch for a large hexagonal bottle with a picture of an egg tagged to the neck, holding it up to the light and swirling the thick green liquid inside. The kitsune eyes you suspiciously as you close in on her, slowly crawling backward until she hits a tree. She scrambles to escape, failing spectacularly when you step on one of her tails, making her yelp in surprise and fall flat on her face.");
	output("\n\nHolding the bottle in one hand, you push out the stopper with a thumb, wrestling her into submission. She is unable to put up much of a fight, and you are easily able to subdue her feeble struggles, tipping the crystalline flask into her mouth. Holding her head back, you keep the lip of the bottle up to her mouth until the last drop has disappeared into her throat, then casually dispose of it, stepping back to watch the show.");
	output("\n\n<i>“Uugh... m-my stomach...”</i> she groans, her hands traveling down to her abdomen as you hear an audible rumbling from within her. Her flesh practically bubbles as her belly begins to swell, rounding out into a firm bulge.");
	output("\n\nPanting lightly, she leans back, supporting herself on a tree to catch her breath. She grins up at you, managing to breathlessly tease, <i>“S-so, you UGH... you like pregnant girls, do you? You’d better... HNNG... take responsibility...”</i>");
	output("\n\nIt’s plain to see that she’s trying but failing utterly to maintain her sly demeanor, regularly doubling over and clutching her abdomen as her simulated pregnancy advances another stage. Her magic must be reacting with the potion’s, or something to that nature, as her belly has already almost quadrupled in size since you began your little experiment, hanging out over her hips heavily.");
	output("\n\nGroaning, she slides down the side of the tree, both of her arms supporting the tremendous weight of her curvaceous stomach. You’re certain something fishy is going on now as her breasts spill out of her robes with a bountiful jiggle, twin streams of milk sprinkling from her rapidly expanding tits. Ovi Elixirs don’t do that, at least not to your knowledge.");
	output("\n\nShe sinks down further, stroking her belly lovingly and laying flat on her back, her swollen milk-udders rising and falling with every labored breath she takes.");
	output("\n\n<i>“If you just stand there gawking... HNnn... you might miss your chance,”</i> she says, regaining some of her composure now that the intense swelling of eggs within her uterus has calmed.");
	output("\n\nHer words snap you from your reverie, and you rush over, hurriedly stripping out of your red, high-society bodysuit. You drop to the ground near her and begin to run your hands across her body, squeezing her massively engorged breasts, eliciting a light moan. She coos softly as you slide your palms over the gravid swell of her stomach, caressing the taut flesh gently. Your touch travels downward, cascading over her thighs momentarily before spreading them apart to get at the puffy lady-lips in between them.");
	output("\n\nYou gently insert a finger into her moistened cunt, relishing the sound of her moans as you slowly pump your digit in and out. As your finger slides up her slick pink slit, she shivers quite powerfully, a quickening gurgle issuing from her belly.");
	output("\n\nRealizing that if you delay for much longer you really will miss your chance, you hastily remove your finger and reposition yourself between her splayed legs, stroking your massive cock up to full mast. She moans and arches her back a little as the crown presses up against her warm love hole, though the weight of her stomach makes it a little difficult for her.");
	output("\n\nAs you prepare to plunge yourself into her quivering lips, a pair of golden tails slither up around your throbbing member, one curling around your sheath while the other slowly tickles across the underside of the shaft. It travels slowly up and down your prick, then drifts down toward your muff, teasing your pleasure-buzzer gently. Her swollen cunt parts around you easily as you delve into her depths, rippling around your member sensually. The muscular walls stretch around you, a steady trickle of feminine juices spilling out around your forearm-length cock.");
	output("\n\nYour pelvis gently bounces against hers, sending a ripple through her gravid stomach, and you slowly start to buck your hips. Leaning down over her, you begin to grope and knead her swollen tits, running your hands over the soft, pliable flesh and squeezing firmly to force out a little milk.");
	output("\n\nShe relaxes submissively as you toy with her breasts, running her fingers through her own flaxen hair and moaning loudly. Her legs wrap around the back of your flared thighs strongly, pulling you forward to press against the underside of her belly, and you can feel the gentle rumble of the eggs still growing in her womb.");
	output("\n\n<i>“H-having fun, I hope? AAh, I’m so full...”</i> she says with a husky moan, rolling her eyes back in pleasure.");
	output("\n\nAs you sink your hands into the soft, squishy flesh of her engorged udders, she reaches up to wrap her arms around your shoulders, pulling you down against her chest. Her rounded belly juts up underneath you, making it a bit difficult to maintain your balance in this position, but you plant your paws in the dirt as best you can and redouble the thrusting of your hips. Running her fingers across the back of your neck, she draws you down to one of her turgid, leaking nipples, moaning softly.");
	output("\n\n<i>“Please... drink up,”</i> she says with a shuddering sigh as you latch on and start to suckle her creamy milk. <i>“I-is my milk good, dear?”</i>");
	output("\n\nYour only reply is to drink deeply of her thick milk while you pound your hips into her slick vagina like a rutting animal, moaning into her jiggling tits. Her moans reverberate through her chest, tickling your lips as you suck down the contents of her breast before switching to the other. As the delicious cream slides down your throat, you are filled with a cool tingling sensation, the distinct aftertaste of wintergreen lacing your tongue.");
	output("\n\nThe tingling works its way from your core, traveling down to your groin, and you almost lose your mind with pleasure as every squeeze and ripple of her insides is magnified tenfold. You feel a loud gurgle trembling through her distended abdomen, watching her as pleasure is abruptly replaced with a strained grimace. You don’t have much time - eager to finish, you move your hands down to her hips and begin to thrust into her with a reckless passion, each pump of your hips making her swollen tits flop and jiggle obscenely, droplets of milk flying through the air.");
	output("\n\n<i>“Hh-ah! Don’t stop! J-just about... there!”</i> she yells out, her face showing a mixture of pleasure and pain while her soaking wet vagina clamps down on you, a warm stream of femcum splashing against your stomach with every thrust.");
	output("\n\nHer body suddenly tenses up as you orgasm, and she digs her fingers into your shoulders, gritting her teeth and bearing down on your cock with all her strength. The instant the first streams of your cum begin to pour into her egg-stuffed womb, you feel something hard and round begin to slide down the tight tunnel alongside your twitching member.");
	output("\n\nYour cock is pushed free of her folds with a resounding plop, followed shortly afterward by a cum-soaked egg. A few more streams of spunk spurt out across the underside of her belly, painting it white with your stringy cum. She groans deeply, clutching her stomach with both hands as the second egg begins to crown, squeezing out and rolling through a puddle of mixed fluids. That egg is soon followed by another, and another, a seemingly endless clutch of them popping free of her clenched pussy one at a time.");
	output("\n\nHer stomach gradually deflates with each egg she lays, grunting and straining with effort. She moans tremendously as the last oversized egg is finally forced out of her drenched cunt, panting with exhaustion in a puddle of sweat, milk, and spunk. You sit back to catch your breath as well, watching as the kitsune’s breasts slowly shrink back to their normal size, and then turn your attention to the pile of eggs on the ground.");
	output("\n\nThey are about the size of ostrich eggs. You pick one up and examine it, rolling it in your hand a bit. A rustling in the bushes brings your focus back to the kitsune, but by the time you look up, all you see is a set of golden tails slipping into the underbrush.");
	output("\n\n<i>“Take good care of my little eggies, darling!”</i>");
	processTime(45);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

//Red - teased loss
public function redKitsuneLoss():void
{
	clearOutput();
	showName("RED\nKITSUNE");
	author("?? CoC ??");
	output("You collapse on the ground, too weakened to fight back anymore. With a mischievous grin, the redhead playfully saunters up to you, crouching down and prodding you in the side.");
	output("\n\n<i>“Finished already? I thought a big strong girl like you would put up more of a fight.”</i>");
	output("\n\nWith a light shrug, she ceases chastising you and gets down to business, carefully pulling off your red, high-society bodysuit and rolling you over to get a good look at your body. As her hands cascade over your naked form, you struggle in vain against her incessant pinches and gropes, unable to resist becoming aroused. Her fingertips slide over your back-breaking love-pillows, pressing down lightly as they circle your slightly lactating nipples. Ethereal flames crackle along behind her fingers as they drag across your flesh, making your whole body tingle with pleasure and forcing a moan from your throat.");
	output("\n\nAs she begins to examine your nethers, a number of her bushy red tails begin to slither around your limbs, binding your arms behind your back. She idly lifts each of your undulating tentacle-dicks, playfully wobbling it back and forth and giggling at the pleasured grimace you make. Her fingertips then gently walk along your groin, sliding down to caress and part the lips of your gaping cunt, coming away with a thin thread of your feminine juices.");
	output("\n\n<i>“Oh, we are gonna have some fun, you and I,”</i> she says, patting your head softly.");
	output("\n\nOnce she is suitably satisfied with her teasing, she decides to get down to business, stripping out of her robes. She throws you a sly grin as she pulls them down around her shoulders, letting her large breasts bounce free and giving you a little show, tweaking her nipples and moaning a bit. Tugging at the sash around her waist, she lets her robes fall off entirely now, and you watch as her throbbing, twelve-inch cock springs to life, no longer held in check by the confines of her clothes.");
	output("\n\nThough her impressive endowment isn’t quite as fearsome as some of the others in this strange land, that eerie blue fire that encircles it gives you reason to worry. There’s little you can do about it though, wrapped up in her tails as you are, unable to resist her advances. You squirm a bit when you feel her press up against your pussy, struggling in vain against the tails binding you. Your fears are assuaged somewhat when you feel the head pushing past your entrance, and you realize that rather than burning you the ghostly flames are filling you with a cool tingling.");
	output("\n\n<i>“Shh, just relax, it’ll be all over soon, dear,”</i> she whispers in your ear, baring her teeth with an almost sadistic glee.");
	output("\n\nWrapping her arms around your waist, she stuffs the remainder of her thick member inside you with one thrust, making you howl in pleasure. Your muscles instinctively clench down on the intruder, milking her throbbing shaft in blatant disregard of your own desires, and the kitsune moans in pleasure, rolling her eyes back a little.");
	output("\n\n<i>“Hmm... a little loose for my tastes, but I suppose it’ll have to do. You haven’t been slutting it up on minotaurs and tentacle beasts, have you cutie?”</i> she says teasingly, giving you a patronizing pinch on the cheek.");
	output("\n\nThe coolness of the flames and the warmth of her cock vie for dominance inside you, and you can feel her heartbeat pulsing through her shaft with every thrust.");
	output("\n\nAs she uses your gaping cunt as her own personal fuckhole, her many tails begin to stroke and tease along your naked body, tickling you with their bristly tips and painting trails of fire across your flesh. You are caught up in shivers each time one of them crosses one of your erogenous zones, the cool flames tickling and tingling across your most sensitive areas. Thrashing and wriggling underneath her, you belt out a trembling moan, every muscle in your body resonating with pleasure from the odd contrast of the gentle caress of her tails with the rough pistonlike pounding of her cock.");
	output("\n\n<i>“Yes, yes, oh gods YES!”</i> she screams skyward, her tongue hanging out wantonly as she mashes her pelvis into yours with an almost brutal fervor. Pain has long since been supplanted by pleasure, but you know that you’ll probably be sore in the morning when all of this is over.");
	output("\n\nYou feel yourself being lifted off the ground slightly, a single tail gliding up and down your back. Your muscles clench up involuntarily as it brushes against you, and it is almost as though you can make out every vein and wrinkle on the brash redhead’s cock now, feeling the rapid throb of her heartbeat through it. Her cock swells with a thick load of seed, and you can feel slick hot jets of semen flooding your muff. Your insides milk her swollen member of every ounce of futa-jism she has, her hips pumping continuously and sloppily pounding into you like a horny teenager. Her voluminous load is so immense that you can feel your abdomen begin to swell as pressurized streams of her seed begin to escape, spilling out onto the ground.");
	output("\n\nWhen she finally calms down and pulls out with a satisfied sigh, your slavering cunt lies agape, a small river of seed slowly pouring out. Your stomach has swollen to the size of a watermelon, jiggling heavily with the weight of her incredible load of futa-cum. Her spent cock hangs limply between her thighs, a mixture of cum and feminine juices dripping from the tip.");
	output("\n\nShe leans down over you and whispers a line of some strange language into your ear, and almost immediately you can feel your consciousness begin to fail you. The last thing you see before blacking out is her half-flaccid cock swaying happily between her legs as she bends down to pick up her clothes, flashing you one last look at her wide, round ass.");
	processTime(30);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

//Follow to Lair
public function followingKitsunes():void
{
	clearOutput();
	showName("\nLOST");
	author("?? CoC ??");
	output("As you explore deeper into the dense wood, you are abruptly aware that your surroundings have grown darker without warning. The back of your neck tingles lightly with a sense of foreboding, and you instinctively ready your fists, feeling uneasy. Wracked with paranoia, you find yourself swiveling to face toward every random noise, and you could swear you just heard a voice through the trees. There it was again! As the ghostly, feminine laughter fills your ears, you are positive that it can’t just be your imagination. You turn left, then right, trying to pinpoint its source, but it truly sounds as though it is all around you now.");
	output("\n\nCatching a glimpse of motion out of the corner of your eye, you whip around to face it, but are surprised to see that the only thing there is a small, pale blue flame, flitting about idly. It dances around hypnotically, and as you stare into its ghostly light, you find your conscious mind growing hazy. Your concerns suddenly seem trivial, and you find yourself relaxing gradually as the ethereal wisp glides along your arms, leaving behind a cool tingle where it touches you.");
	output("\n\nIt seems to be beckoning you to follow it.");
	output("\n\nYour mind is jogged out of its haze when you remember a note from the Traveler’s Guide. It warned about mysterious flames in the forest that lead hapless adventurers astray. You hesitate now, wondering what to do.");
	output("\n\nThe flame suddenly darts off into the darkness of the trees, and you find yourself unable to resist giving chase. It feels as though you are being drawn to it by some otherworldly force, but every time your suspicions begin to grow, the flame pauses to float around you, tickling your erogenous zones and then pressing onward.You are unsure of how long you have been stumbling after the flame, but in a brief moment of clarity, you stop dead in your tracks and look around cautiously. Suddenly you deeply regret having followed the flame this far out of your way. Your skin crawls as you hear that eerie, ghostly laughter once again, making you shudder involuntarily. As you turn to head back the way you came, you practically jump out of your tan skin in surprise. Mere inches from you stands a strange woman with shoulder-length, crimson hair, smirking precociously.");
	output("\n\n<i>“My, my, aren’t we the clever one?”</i>");
	output("\n\nAs she closes the gap even more, you now notice that she isn’t any ordinary woman - a pair of large, vulpine ears parts her hair at the top of her head, and six luxuriously furred tails fan out around her. A layer of ornate tattoos covers patches of her exposed flesh, accentuating her feminine curves nicely. She’s so close now that a few of the tails are drifting along your tan skin, leaving a trail of crackling blue sparks that impart the same cool tingling that the flame did.");
	output("\n\n<i>“You resisted my illusions... that’s impressive,”</i> she says, teasing you with her tails. You back away from her, but give a start and wheel around when you feel yourself bump into something.");
	output("\n\n<i>“Going somewhere?”</i>");
	output("\n\nHow did she get behind you so quickly? You were staring at her the entire time! Glancing quickly over your shoulder, you confirm that this is not a case of twins, but when you turn to face her, she has disappeared once again!");
	output("\n\n<i>“Over here, silly~”</i> she calls to you with a mischievous tone, beckoning to you as you whip around to face her voice. <i>“Don’t be shy, I don’t bite... often...”</i>");
	output("\n\nHer tone is innocuous enough, but her mannerisms are a little disconcerting, somehow. What are you going to do?");
	output("\n\nCuriosity and lust get the better of you, and you decide to throw caution to the wind and take her up on her offer. If her sisters are any bit as stunning as she is, then you know you’re in for a real treat. She seems pleased with your decision, teasing the underside of your chin with one of her tails and beckoning you to follow her.");
	output("\n\nShe leads you deeper and deeper into the woods, and before long night has fallen. Thankfully your guide has summoned up a number of pale flames that light your way. As you peer into the darkness beyond their range, you realize it is now too late to change your mind - even if you wanted to turn back, you would most certainly get lost.");
	output("\n\nThe kitsune stops for a moment, turning back to face you, and then disappears into the bushes with a girlish giggle. You briefly fear that she has abandoned you in the wilderness, but as you break through the other side of the untamed hedge after her, you nearly smack face-first into a large stone wall. Before you lies an imposing mansion, surrounded on all sides by the impressive wall. You briefly wonder what sort of madman would build such an extravagant home in the middle of nowhere, but are broken out of your reverie when you spot the kitsune peering out from the gate, waving to you flirtatiously.");
	output("\n\n<i>“Welcome,”</i> you hear as you enter the courtyard, startling you a little. There to greet you at the mansion’s door stands a trio of lovely maidens - including the one that led you here, a blonde, a redhead, and one with silky black hair. Their revealing robes are filled out in all the right places, hugging their enticing curves. Each of them sports a pair of large fox ears and a cluster of luxuriously soft tails that wave hypnotically.");
	output("\n\n<i>“We’ve been expecting you,”</i> the blonde one says, stepping forward with a flirtatious grin.");
	output("\n\nThe three ladies close in around you, running their hands over your body and giggling lightly. You find yourself practically floating among their many tails, drunk on the promise of pleasure as they lead you through the foyer. They sit you down in front of a long table with a spectacularly opulent spread, and before long you are having your fill of delicacies the likes of which you never dared to dream about.");
	output("\n\nYour cup never remains empty for long, as one of the sisters is always quick to arrive with a fresh decanter. The strong alcohol burns your throat as it goes down, and it does not take much before your head is swimming. You have grown so tipsy by now that you don’t even register as the girls usher you out of the dining room, only noticing your change of scenery as you feel yourself being pulled down into a warm pool of water.");
	output("\n\n<i>“We hope you enjoyed the feast we prepared,”</i> says the one with jet-black hair, as she and her sisters crowd around you in the water, fully nude. <i>“Now, it’s our turn.”</i>");
	output("\n\n<i>“Just relax,”</i> the redhead whispers into your ear in a warm tone that seems to demolish any vestige of resistance. <i>“We’ll take care of everything...”</i> Up to your waist in the warm water of the hot springs, you can’t help but surrender to their will, your worries flowing out of you. Enveloped on all sides by their unearthly warm flesh, you lean into their arms and sigh blissfully as every touch and caress sends shivers down your spine.");
	output("\n\n<i>“Oh my! It looks like we’re in for a real treat tonight, sisters...”</i> the blonde says as she runs her hands along your impressive prehensile endowments.");
	output("\n\n<i>“Mmm... tentacles... my favorite flavor,”</i> the black-haired one chimes in, rubbing her pudgy belly and licking her lips hungrily. Slipping into the water next to you, each of them takes one of your hulking tentacles into her hands, grinning eagerly. Working together, they weave their tails through your brace of writhing appendages, cinching tight around the base of each one as their fingers slide along the flexible shafts. Trails of blue fire dance across each writhing tentacle, sending you into a shivering, shuddering frenzy, and the three sisters cast each other knowing grins. Your liquor-addled mind is too foggy by now to resist their advances, though who would want to?");
	output("\n\n<i>“Oh, I do so enjoy our work,”</i> the blonde remarks, running her hand up to the tip of your cock and squeezing the bulbous head experimentally. She flashes a satisfied smirk at the way your firm flesh yields under her touch, nodding softly. The tip of one of her tails trails along the underside, tickling you sensually as more coils of fur stroke and knead along the obscene organ.");
	output("\n\n<i>“We just looooove tentacles,”</i> the black-haired girl explains to you, giggling like a schoolgirl as one of your obscene tendrils starts moving on its own, sliding down between her legs and threading its way between her expansive ass cheeks. <i>“When we see tentacles this thick, long, and...”</i> she pauses to wrap her lips around the end of your cock, sliding her tongue along the tip, <i>“... mmm... juicy.... it’s just impossible to contain our excitement.”</i>");
	output("\n\nAs if to illustrate this point, she hungrily swallows almost a foot of your wriggling tentacle, a trail of spittle hanging out lazily from one corner of her mouth as she swallows carefully along your length. Your writhing shafts are assaulted on all sides by all manner of touches and caresses; fingers, tongues, tails and breasts all working in glorious harmony to tease and pleasure you. One tendril instinctively coils around one of the blonde’s breasts, squeezing it tightly while the tip pokes and prods the soft flesh, teasing her pert pink nipples. Moaning in response, she slides her fingers along the base, cool blue flames crackling to life across her fingertips and sending chills through your body. Each of your thick tentacles swells up incredibly, the kitsune’s magic sending jolts of pleasure across the surface. As the pale flames dance across your groin, you feel an odd tension building up, and in a shower of viscous cum, your loins erupt into a monstrous, wriggling mass of at least a dozen undulating tentacles!");
	output("\n\n<i>“Hehe, that’s how we like it!”</i> the blonde says with a chuckle, pressing her body to the squirming brace of tentacles and moaning in anticipation.");
	output("\n\nYou feel something warm prodding you in the side, and look down to find that the redhead has something between her legs that her sisters are lacking. With one of your undulating cocks curled down between her legs, she begins to grind herself against you, lining up her thick, throbbing member up against one of yours and rubbing her hips back and forth lewdly. Grabbing a segment of your ropey dick, she coils it around the base of her own, thrusting through the ring of cock flesh and groaning into your ear.");
	output("\n\nHer hot breath cascades across your shoulders, followed shortly by a distinctive minty coolness. The stark contrast between the two feelings makes you shudder, your chest rising and falling quickly as the pleasure begins to mount. Your breath is knocked out of you with a startling abruptness as the blonde is thrown down onto your chest, toppled over by her black-haired sister. With a tentacle in one hand and the blonde’s sizeable breast in the other, the plucky ravenette alternates between the two, sucking, squeezing and stroking while wriggling her plump rear back and forth. Your hands start to glide across their silky skin of their own accord, groping the supple flesh and stroking their shimmering tails, squeezing their firm breasts and running your fingers through their soft hair.");
	output("\n\nA number of your cocks are ensnared by a group of long black tails, guiding them down to her upended pussy and slowly running the head of one up and down her glistening snatch. She crawls up over her blonde sister, leaning down to nibble on your ear along with the redhead, and mumbles through her teeth, <i>“Nn... time for the main course... Go on, you know you wanna stick it in... Ravage us.”</i>");
	output("\n\nWithout hesitation, your tentacle-dick drills eagerly into her sopping snatch before you can think. Your moans join hers in a lewd symphony, each of your writhing tentacles finding its home in one hole or another, sending the three girls into a lust-filled frenzy atop you. Before long, you lose track of where one girl ends and the others begin, your hands cascading over their soft, supple bodies, intersecting in a carnal mass of flesh, tails, tentacles and lust.");
	output("\n\nYour tentacles move of their own accord, ensnaring the three sisters in a densely tangled knot of limbs and tendrils. The redhead hangs upside-down, dangling by her ankles with a look of utter bliss on her face as her cock is furiously jerked by one of your tentacles, both of her holes being pounded simultaneously by two thick tendrils pistoning in and out alternately. The black-haired girl is in no less of a predicament, her eyes rolled back and tongue hanging out as her ass is stuffed full of throbbing tentacle, one hand haphazardly thrusting into her pussy alongside another.");
	output("\n\n<i>“Uuuoohh... my belly’s so fulllll...”</i> she groans orgasmically, clutching her stomach as your cock snakes its way through her insides, visibly distorting her pudgy belly. Her body goes slack, hand falling away from her groin as a thick stream of girlcum arcs through the air, her face turning red and her eyes going blank with ecstasy.");
	output("\n\nThe blonde is folded double, her thighs spread out while her ankles are hooked behind her head, all six of her tails twitching madly. Her breasts squash and bulge around your tentacles as they squeeze and coil around them, rubbing lewdly against her nipples. It seems as though sense has long since been driven from her mind, her mouth hanging agape and her eyes vacant with lust. Her throat bulges from the intrusion of your cock, pre-cum mixed with drool dribbling down her chin as she eagerly begins to suck on it, thrusting her hips automatically in sync with the undulations of your cocks in her other orifices.");
	output("\n\nThe air is filled with the heavy, musky scent of semen as a jet of cum shoots skyward from the redhead’s cock, the throbbing member swelling visibly each time she spurts another stream. The entire deck and the water around you is stained with her seed, she and her sisters all plastered from head to toe with her copious emissions. The cooling sensation of mint permeates your skin wherever the sticky droplets land on you, making you shudder in pleasure, and the tingling feeling of her seed dribbling down along your tentacle shafts sends an unbearable pleasure to your groin.");
	output("\n\nThe three insensate kitsune twitch helplessly in the grips of your tentacles, maddened by pleasure as your magically enhanced tendrils plow away at them without pause, pummeling their abused holes unceasingly. Every muscle in your body tenses in preparation for an incredible climax, the lust boiling in your loins like a coiling spring. The pressure builds until you just can’t take it any longer, convulsing beneath the three sisters and groaning in ecstasy as your orgasm shoots up each of your shafts simultaneously, swelling from base to tip and releasing your thick load inside of them.");
	output("\n\nWarm streams of spunk flow from each of your tentacles, painting the sisters white inside and out. Hot pearls of cum drench the three kitsune, mixing with the redhead’s and rolling off of their bodies to dribble into the water.");
	output("\n\nEvery twitch and spasm of your loins finds you feeling a little more fatigued, your eyelids growing heavy with drowsiness as you can feel the life being drained from you. Panting desperately, the three sisters gradually regain their senses as your flagging tentacles slowly lower them down into the water. Exhausted from your ordeal, you let yourself relax into a blissful stupor, only vaguely aware of the feeling of being dragged up onto the deck. The last thing you see before going unconscious is the three sisters crawling up around you, coaxing your spent tentacles back to life, their eyes glinting hungrily.");
	output("\n\nWhen you awaken the next morning, the sisters, the hot springs, and the mansion are nowhere to be found. You are lying naked in the wilderness, your possessions sitting in a neat little pile a short distance away, and your memories of the previous night are little more than a hazy fever dream. You sit up, but fall back almost immediately, groaning as the full weight of your hangover hits you like a ton of bricks. It takes a long time before you can muster up the willpower to gather your things and head back to camp, but as you set out, you swear you could hear the sound of ghostly laughter echoing through the trees.");
	processTime(30);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

//Sanura
//Pc gets fucked
public function sanuraFucksPC():void
{
	clearOutput();
	showName("\nSPHYNX");
	author("Fenoxo");
	output("<i>“Oh! You’ll play my game? Marvelous! Well then, let’s begin...”</i>");
	output("\n\n<i>“Mmm, I’ve always been fond of this one. Delightfully simple, really - don’t overthink it, dear. ‘I always run, yet never walk; I murmur often, yet never talk; and I’ve a bed, yet never sleep. What am I?’”</i>");
	output("\n\nHaving lost the Riddle Game, you do as the sphinx-girl commands: you pull off your red, high-society bodysuit, leaving yourself bare under the desert sun. <i>“Now then, my dull little pet, what shall I do with you...”</i>");
	output("\n\nStarting to disrobe, you flop your wriggling bunch of freakish, mixed cocks free in the dry desert heat, allowing them to sway back and forth as the omnipresent heat and seductive sphinx have their way with your heightened libido. Sanura snaps her palm up in front of your face as your red, high-society bodysuit hits the ground, landing with a heavy thump.");
	output("\n\n<i>“You don’t need to seduce me, you know? Just go ahead and assume the position,”</i> she commands, wings fluffing the hot, dry air across her breasts, fanning her delicious tan mounds.");
	output("\n\nUmm, position? You’re not quite sure you follow, and you’re sure to say as much.");
	output("\n\nSanura folds her arms across her perky tits and rolls her eyes. <i>“You know, bent over, on the ground, ass-up and open?”</i> She blows a strand of black hair air of the way with an exasperated sigh. <i>“Just how long have you been in Mareth? You know what? Never mind, just get that ass up so I can plow it.”</i>");
	output("\n\nYou can’t help but point out the obvious: she doesn’t have a penis, at least not one you can see.");
	output("\n\n<i>“So?”</i>");
	output("\n\nWell, she can’t really fuck your ass without one...");
	output("\n\nSanura laughs, <i>“I’m a sphinx. Reality is my plaything! Go on...”</i> Her heavy forepaw falls on your shoulder, the soft, feline-like pads compressing soft and pillow-like against your slimy, sandy blonde fur, forcing you down. You lean over reluctantly and lift your large, bouncy derriere towards the assertive lioness, shivering at how open and exposed you are like this, your backdoor puckered and ready to be plowed. Her other paw comes down on your right shoulder, and the shadow of her muscular, leonine lower body falls across you, causing her warm body heat to wash over you. Sanura’s soft underfur brushes across your back, tickling you sensually as she gets in position. Curling over your shoulders, her toes extend deadly looking claws, but they do no more than press against the top of your chest, securing you in place with cushy paw-pads and pointed threats.");
	output("\n\nTilting your head to the side, you try to look up above, but all you can see past her brustling belly-fur are the pert swells of her cleavage and a few swirling, ephemeral hexagons floating around her wrists while her fingers swivel with inhuman dexterity. There’s a barely audible ‘fwoomp’ followed by a tingling against your loose backdoor, abruptly carrying its magical effervescence into your sphincter as something flat and blunted butts up against it. Your eyes open wide in surprise at the pressure on your backdoor, something Sanura takes absolute delight in seeing, bending her human-half over to take in your expression while her forepaws push you harder onto her magical spear.");
	output("\n\nYou will yourself to relax, but you just aren’t big enough back there to make much of a difference. Just having such an immense dong pressing at your backdoor is enough to push you to your limits, but your sphincter hasn’t even dilated enough to take a fraction of her girth. Sanura growls in frustration and begins to hump at it, smacking the blunted tip into it again and again. The shocking sensation makes your anal muscles twitch, spasm, and relax as she works to plow her way through your more than token resistance.");
	output("\n\nShe grunts, <i>“Gods, you’re tighter than a virgin imp’s asshole!”</i>");
	output("\n\nThat’s no small comfort to your poor, sore rectum. It’s going to be left gaped by this monstrous woman in short order, pounded into open, stretched submission, just like its owner. The pain of being opened up this forcefully is enough to bring a tear to your eye and a strange surge of excitement through your crotch. How can you be enjoying this? You don’t have long to ponder it, your muscles are caving in underneath Sanura’s butt-battering fucking, slowly, inexorably stretching to handle her fat flare. Gods! You whimper as your anus abruptly gives up the ghost and allows Sanura’s phantom member inside, inches of her tingly fuck-tool nestling inside you in seconds.");
	output("\n\nSanura straightens with an unseen smile, her hand playfully tangling with your obscenely long, sandy blonde goo-mane as she hilts the rest of the way into your abused anus, not stopping until jiggling, magical nuts slap into your soft, pinchable derriere. <i>“Atta girl. I thought for a moment that this might have been a waste of magic. Now just settle in and enjoy it.”</i> You wince with the knowledge that somehow, you ARE enjoying it. The pain seems to have faded with the magical buzzing in your butthole, and all that you’re left with is a satisfied stretching and the friction that comes with it.");

	output("\n\nSanura reluctantly changes direction and begins to pull the immense length out of you. She actually yanks it back far enough that the top flops out of your gaped orifice, flopping lewdly against a leg as she lines back up for a second push. As the sphinx nudges her tree-trunk-like totem into you, you try to fathom the size of the thing. It must be several feet long and at least six inches wide by the way it’s distending your innards, maybe seven inches across at the tip. Moaning, you helplessly give yourself over to the unusual feelings her ephemeral erection installs in your plugged-up pucker.");
	output("\n\n<i>“Yeah, I knew you’d like it,”</i> Sanura drawls, <i>“I had you pegged for some kind of butt-slut when I met you.”</i> She lurches her hips forward to bury herself the rest of the way inside. <i>“Now, I just have you pegged.”</i> She smirks and resumes a long, slow reaming of your bowels. Pre-cum oozes from one of your shafts in steady strings that dangle onto the dirt, painting a swirled pattern beneath you as your prostate is pushed hard enough to squeeze trickles of your salty ‘milk’ from you.");
	output("\n\nMoving faster now, Sanura descends into sexual frenzy. She ruts your butthole like a beast possessed, and given the phantasmal nature of her equine dick, you have to wonder if that isn’t what happened. The leonine beauty savagely pounds your loose ass with long, heavy strokes, leaving nothing but tingling excitement in her wake. Whenever her flare slides past your prostate, the wide, blunt head squeezes it hard enough to express a huge strand of pre. After a few such thrusts, her bouncing, fake balls rise up in their faux, fleshy sack. Her swollen dick-tip engorges more than you thought possible inside you, wide enough for you to touch through your belly and marvel at the size. Quivering from head to four lion-like toes, Sanura cums.");
	output("\n\nThe butt-breaking horse-cock releases enough cum into you to make your middle audibly gurgle and your belly begin to distend, flooding your intestines with tingles and liquid warmth. Thankfully, Sanura slowly begins to pull out, even as she’s cumming, her cock flexing in your brutalized asshole for every inch it’s pulled past, leaving enough goo in its wake that your innards never get to relax. When she crosses the lump that is your well used prostate, you lose control and shudder with a nice, long cum of your own, your arms giving out and dumping you face-down on the ground while you spurt milky whiteness onto your chest, chin, and then the ground. The head is so swollen that she actually struggles to pop it back out of your ass, bouncing her hips back a few times with little success and dragging you through your fresh, milky puddle. Eventually, she gives a mighty, sphincter-stretching lurch and ejects from your large, plush rump, painting it white on the way out.");
	output("\n\nYou collapse in a well-fucked heap while Sanura’s extra addition fades away. She lays down next to you, fanning her face with her wings as you try to recover. Her arm rubs one of your cheeks, still sensitive from whatever magic was in her balls, and she says, <i>“That was great fun. Let’s do it again sometime?”</i>");
	output("\n\nYou muster the strength for a thumbs up, a dopey smile still painted on your face.");
	processTime(30);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

public function fuckingSphynx():void
{
	clearOutput();
	showName("FUCKING\nSPHYNX!");
	author("?? CoC ??");
	output("<i>“W-what!?”</i> the sphinx gasps as you correctly answer the last of her riddles. <i>“I-I don’t... but how? No one’s ever had the wits to answer all three riddles!”</i>");
	output("\n\nShe takes a moment to collect herself, then shrugs her shoulders lightly, <i>“Well, that was unexpected. My apologies, but I never actually expected you to win... still, I did offer you recompense for your efforts. I am Sanura,”</i> she bows, and over her shoulder you suddenly see a small door in the face of a dune emerge. <i>“You may enter the lair of the Sand Witches at your leisure. Or... if you so desire... my body is yours to do with as you will,”</i> she adds playfully.");
	output("\n\nGrinning lustily at the pretty leonine girl, you tell her it’s time to have some fun. With an easy grace, she slips the sky blue shift from her shoulders, exposing her pert, palmable breasts. <i>“Well, you did win my game, after all... I’m yours to do with as you wish, my brilliant beautiful friend.”</i>");
	output("\n\nYou disrobe, tossing your red, high-society bodysuit aside into a small pile. You stretch your muscles in the dry desert air and exult in the warm rays beating down on your slimy, sandy blonde fur and obscene group of bloated, mismatched dicks. Sanura pads around you, taking in your appearance with her chestnut-colored eyes before clicking her tongue approvingly. Her leonine tail swishes across the top of your cock, stroking it with the silky soft tuft of fur at its tip. You shiver at the contact, unsure of what to think. Your penis, on the other hand, has no such conflictions, and immediately begins to rise.");
	output("\n\nSanura’s eyes go wide upon seeing your monstrous cock. She opens her mouth, attempting to speak, but no words come out. Her tail reaches out, coiling around your dick in futility. <i>“By Marae’s pillowy tits that thing is huge,”</i> she says finally, regaining her voice. <i>“I don’t know if I can take something that big... but goddamnit, I’m going to try.”</i>");
	output("\n\nYour manhood spikes upwards at the attention, becoming painfully hard as the sphinx continues to survey your body. Her tail flicks over your slimy, sandy blonde fur gently, stopping briefly to tantalize each of your nipples, which stiffen in response, just like your cock. You can’t help but think there’s some sort of magic at work here. Her tail passes between your thighs, gracefully tickling your damp cunt, which suddenly tightens up and practically gushes with slick juices.");
	output("\n\nFinally she stops and looks at you head on. <i>“All right then, lay down and let’s do this,”</i> she says casually, crossing her arms under her small breasts. You quirk your eyebrow at her, questioningly. <i>“This is what you want, isn’t it?”</i> she asks, turning her sensuous tauric body around to show off a moist, dripping cunt. <i>“Because that,”</i> she says, pointing at your dick as she licks her lips, <i>“is what I want.”</i>");
	output("\n\nThe sight of that lionpussy is all the enticement you need. You sink to your knees, and then flop onto your back, your cock standing tall and proud just like the stone pillar nearby. The brilliant and ravishing sphinx strides over top of you, placing a soft leathery paw over your wrists gently. <i>“Mmm, don’t worry about this, love, I just want to make sure you’re not going anywhere.”</i> You gently struggle against the paws, not actually trying to free yourself, but rather testing her strength, and she is indeed strong.");
	output("\n\n<i>“Let’s start off with a bit of a warm up, shall we?”</i> she asks with a mischievous grin. Her leonine body lowers down towards yours, making you gasp sharply as your rigid rod contacts her feline folds. But alas, there’s no penetration. Instead, Sanura rocks her body up and down your shaft, tantalizing and teasing it with her hot, wet folds. You bite your lip while the sphinx above you moans with mild delight. <i>“O-ho,”</i> she laughs, <i>“you may have bested me intellectually, but I can still tease you.”</i>");
	output("\n\nSanura grips one of her breasts, pinching the nipple roughly while she continues to slip up and down your pillar of cock. You attempt to push your hips forward, aching to penetrate her pussy, but she merely mutters, <i>“Tut-tut,”</i> and waggles a finger at you disapprovingly. You glower up at her for a moment, and then a plan alights in your brain. As soon as the sumptuous sphinx turns her attentions back to her breasts, you concentrate on her hip motions, developing the rhythm in your head.");
	output("\n\nYou count out the rhythm, and when the time is right, thrust your hips up and forward, splitting Sanura’s cunt wide. A look of shock crosses her face, quickly replaced by an ecstatic look of bliss. Her lips form an O-shape, allowing a long moan to escape. <i>“I... you’re not supposed to...”</i> she starts, looking down at you with a mixture of annoyance and pleasure. <i>“Oh fuck... so good! Don’t stop!”</i>");
	output("\n\nYou grin and thrust into her again. Her hips pick up the pattern and bounce along with your hips, making wet squelching noises as you plunge your monstrous cock into her again and again. Sanura’s cunt squeezes you tightly, tighter than you’d imagine a tauric creature to be, while she plays with her pert little breasts, apparently lost in a sea of euphoric oblivion. Small gasps leave her lips with every other thrust, escaping onto the warm desert breeze. Your hips hammer away, your entire body becoming passionately hot, craving some form of release, but you don’t give in just yet.");
	output("\n\nYou bring Sanura to her first screaming orgasm, then a second, and a third. You don’t stop until the sphinx is little more than a quivering mass of flesh wrapped in orgasmic rapture. Her legs shake like jelly, barely holding your arms down, but that doesn’t matter anymore. You know who’s in control of this situation, and it’s certainly not the lioness atop you. Thrust after thrust you bury your tool deeper within Sanura’s cavern, bringing her to a fourth orgasm as her face distorts, showing little more than a climax-induced grin, her eyes rolled back in their sockets.");
	output("\n\nYou can’t hold out much further either, and give one last push forward, embedding your cock as far as it will go. Jet after jet of cum erupts from your cock, painting the sphinx’s inner walls white.");
	output("\n\nSome of your spunk dribbles out the side and down your shaft before dripping into the hot desert sand below.");
	output("\n\nFinally you collapse, letting all your muscles relax. Sanura isn’t far behind, falling to the side of you, panting wildly. It takes you several minutes to recover, the sphinx even longer, but you finally gather the strength to haul yourself up onto your paws.");
	output("\n\n<i>“Well, that’s certainly not what I had in mind,”</i> Sanura says, recomposing herself after that vicious fucking. <i>“But I can’t say I can complain.”</i> Neither can you, you smirk to yourself.");
	processTime(30);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

//Cum Witch bad end
public function cumWitchBadEnd():void
{
	clearOutput();
	showName("...CUM\nWITCH?");
	author("Fenoxo");
	output("The curtain pulls to the side easily, and as soon as you enter, you’re greeted by the sound of flesh slapping on flesh from somewhere to your left. Briefly, you note a number of desks as you turn towards the sexual audio, but what really catches your eyes are the two girls locked in coitus. One, a normal-looking sand witch, is bent over a bench and taking quite the fucking. Milk drips in huge beads from her four fat teats while fresh rivulets of cum run down past the dried-cum on her thighs. Above her is something else entirely, a taller woman with a single pair of obscenely large breasts. She’s so dark skinned that at first you have difficulty picking out her features in the dim lighting. Glittering sweat runs down her form, dripping from her pendulous breasts as she throws back her head and moans, <i>“Gonna... just... take it! Take my gift!”</i>");
	output("\n\nBeneath the ebony woman, you see the sand witch begin to quiver and moan, thick gouts of semen back-flooding from her packed cunny as her belly rounds with delicious fecundity. Her muscles lock, then twitch feebly for a few seconds before she slides off into the new-born cum-puddle, slipping along the floor in an insensate pile of orgasmic bliss. You’re so enraptured by the sight, that you don’t even try to hide when the ebony futanari turns to face you, putting on a pointed, wide-brimmed hat and black robe. For the slightest second you see a pair of orange-sized balls and one thick, cum-lubed member, but those quickly disappear into the voluminous robes.");
	output("\n\n<i>“Well now, surely you aren’t one of the witches here to receive my seed,”</i> the odd witch muses, <i>“I’m afraid you must be an interloper then. Pity, but then, maybe you can come to serve us as a mother. Our tribe is not wasteful.”</i>");
	output("\n\nThe soot-skinned futanari delicately opens one of her palms and murmurs an unintelligible word. Before your eyes, flickers of light flash into existence and align themselves vertically, slowly sliding together like pieces of a flawless crystal jigsaw puzzle. The glimmering phantasmal luminance slowly fades as all the pieces come together, leaving a flawless ivory staff in the woman’s hand. She slams the base into the ground, sending ripples of magical force through the many pools of cum scattered around the room. It looks like you’ll have to fight her!");
	output("\n\nHelplessly, you dig your hands into your loins, frigging your hungry cunt so hard your juices splatter the Witch’s robe. The Cum Sorceress smiles and releases her staff. Instead of clattering to the ground, it dematerializes a piece at a time, fading away in a way that would be mesmerizing were you not otherwise occupied. She hikes her robes up and pulls off her hat with them, shaking her surprisingly light, blonde hair free. <i>“Now, all that got me pretty worked up, and I don’t think the girls will mind if I give you your first sampling of cum witchery. What do you think, hun?”</i> she asks, glancing back towards the comatose witch behind her.");
	output("\n\n<i>“i’z fine...”</i> a quiet voice draws, barely loud enough to be heard.");
	output("\n\nYour captor flashes you a smile and giggles, <i>“See? I told you they wouldn’t mind. Now, let’s go ahead and get your first daughter inside you, shall we? There will be plenty of time to make you one of us while we’re waiting.”</i>");
	output("\n\nThe dark-skinned futanari strokes herself to full hardness, smiling when thick strings of cum begin to drizzle from her swollen cock-tip.");
	output("\n\nHer tongue licks her lips in anticipation as she readies herself, though she stops a moment later when she sees you still have a bit of fight in your eyes, even though your hand is knuckle-deep in your twat.");
	output("\n\nKneeling before your helpless form, the mysterious witch sighs and whispers, <i>“Why can’t you just accept it? You belong with us. We’re going to fix this desert - and Mareth. The demons can’t stop us. The monsters won’t stop us. They CAN’T.”</i> She gently brushes her hand through your hair, smearing you with her sex-juices unthinkingly as she prattles on, <i>“Just relax, babe. Here, maybe this will help.”</i> The Witch’s hands are suddenly holding you by your ears and her lips are moving in nonsensical ways. Whatever she’s saying you can’t hear it with how she’s holding you.");
	output("\n\nHer spell goes off like a gunshot, at least that’s what it seems like to you. It cracks through your consciousness with a booming ripple that stuns you into unthinking silence, your thought process momentarily short-circuited. Your mouth lamely opens, your tongue slipping out and drooling as your whole body goes limp, uncontrolled. If it weren’t for the Cum Witch’s capable hands, you’d have fallen over into some of her fluids, but she kindly keeps you up, even as she begins to remove your red, high-society bodysuit.");
	output("\n\n<i>“There, there hun, isn’t that better?”</i> the sorceress asks, <i>“It’s always better to listen to me.”</i> You stare at her, unblinking. <i>“Right,”</i> she giggles, <i>“That’s what I thought! You’re going to love being a Sand Witch, absolutely love it.”</i> A dark hand, lighter on the palm than the outside gently touches your cheek and guides your head into a little nod. She quips, <i>“That’s right, being a Sand Witch is the best! You’ll get to have four big, milky tits to milk whenever you have free time, and two cunts that you can get filled any time you come visit.”</i> Each rambling explanation slips into your ears and settles over your dimmed mind, slipping into the thoughtless, crevices before your brain reasserts itself.");
	output("\n\nThe Cum Witch begins moving your hand for you, artlessly toying with your cunt as she whispers into your ear. She’s brainwashing you, and you’re too helpless, too vacant to lift a finger. Besides, it’s better to listen to her. Just listening, it’s better. Yes, that’s it.");
	output("\n\n<i>“Oh, I can just tell you’re going to be a great sister! You’ll love being milked almost as much as you’ll love having my kids.”</i> she coos. You start to nod in agreement before you remember to listen, your thought processes slowly resuming. <i>“You’ll love having my babies so much that you’ll try to keep both your wombs full all the time, once you get your second one, won’t you? You love my cum, and you want it in all of your holes, but mostly your wombs”</i> This time you do nod - it’s going to be fun! You can’t wait to get your four, big tits milked or to get your first proper administration of witch-cum.");
	output("\n\nGiggling, you agree wholeheartedly and ask her to help you up onto a bench, so you can be properly bred. Getting one in the oven now will give you a headstart on getting both your wombs pregnant - you just need to get them to give you a second cunt after this. Just thinking about her gets you wet, wetter than you were already, and you were already so hot and moist from earlier. Your legs spread of their own accord as she lifts you onto a waist-high bench, your cunt-juices drooling down the jizz-polished hardwood, your head swimming from the potent smells of sex that saturate this room. Wiggling your bottom, you move your big, slappable ass back and forth enticingly, shaking it in front of your partner’s leaky tool, your eyes locking onto that messy implement as if it were going to save your life somehow.");
	output("\n\nThe cum witch gives your impertinent bottom a slap to steady it, bursting an exclamation of pain from your mouth at the sudden rough treatment. ‘She’s so rough,’ you mentally whine, but another voice answers, ‘But she’ll be so good to you!’ Sighing contently, you listen to that second, louder thought and lie there, watching your lover slowly line herself with your entrance. When her cock’s oozing tip first brushes your folds, an electric bolt of raw pleasure runs through your body, drawing out a slippery spurt of lady-spunk just from that touch. Gods above and below, it’s so hot, just touching it seems to make your pussy wetter. If you didn’t know better, you’d swear your pussy was boiling over with lust and frothing with need.");
	output("\n\nTwo huge tits come to rest on your back, pinning you underneath their enormous weight, smooth, sweat-slicked skin sliding across your body like silk as the hard shaft spreads your vulva wide and slides through the curtain of oozing fem-cum. You moan happily at that welcome intrusion, a sensation of amazing fullness - no, rightness - filling you up in the most perfect and womanly way. One of your cocks throbs beneath you, hard as rock and crushed between your belly and the slippery-smooth wood. It seems unimportant compared to what’s going on above it.When the two, wondrously bulging nuts come to rest on your soft, pinchable butt, you realize she’s completely and utterly inside you. That hard, wonderful cock is inside you and pressing up on your cervix, the thick, potent cum oozing directly into you, where it belongs. You sigh in contentment and work your internal muscles, clenching the dick inside you as if you could milk it, drawing a surprised gasp from the dusky lips of your dark-skinned lover. Her hard nipples dig harder into your back and an increase in the wet warmth in your slavering fuck-hole alerts you to just how much she’s enjoying it.");
	output("\n\nThe Cum Witch strokes your hair and promises, <i>“I’ll do this for you every day, every hour if I have to, until you’re pregnant... and then I’ll come visit you in the wards and give you all the cum you’d ever want.”</i> A fat bulge distends your labia as it works its way down the Witch’s dick, squirting explosively inside you, proof of her excitement for the idea. You couldn’t be happier! Not only are you going to be a huge-tittied milk-witch, but your lover is going to keep you so full... warm and packed with spunk and life. Your loose muff tingles and quivers at the thought, massaging the woman’s thick, black dick happily as she begins to slowly move her hips, gently sliding herself out just enough to release a few bubbles of cum before sheathing herself in your twat once again.");
	output("\n\nYou shiver wildly, now impaled again, just the way you wanted. That perfect bliss is fleeting, as the Cum Witch begins to fuck you faster and harder, tits wobbling dangerously on top of you as her bottom arches and straightens with each thrust. You begin moaning with every thrust, a picture of feminine contentment as you’re perfectly mounted by another (partial) female. Smiling knowingly, your blonde-haired lover kisses at your shoulders. Her moist, soft lips slowly but inexorably travel closer and closer to your spine, until, with an electric thrill, they kiss one of your vertebrae. You shiver, but she isn’t done yet. Her gentle kisses work up to the nape of your neck where they pause, a saliva-slicked tongue smoothly gliding across your body to lick at the corner of your ear.");
	output("\n\nThroughout the sensual love-making, you feel the spooge bubbling up into your body, a constant, pulsing reminder of the Cum Witch’s seemingly endless affection. Globules of her seed have already begin to slip out of your cunt-lips, hanging from your diminutive insatiable button for a moment before they drip to the floor. This constant fluid flow proves surprisingly pleasurable, and if you weren’t already moaning like a whore in paradise, you’d start now. The thick cock inside you seems to find the sensation equally enjoyable, if its twitching and gradually increasing cum-flow is any indication to go by. With her hips pistoning hard, the hermaphrodite seems to relentless in her attentions, but passionate beyond belief.");
	output("\n\nThen, just when you expect her to go wild and take you both to orgasm, she pulls out and flips you over, turning you up to face her. Her sky-blue eyes twinkle happily as she admires your cum-pudged belly, but when you reach down and pull your hungry pussy-lips apart, the interlude comes to an end. With animal savagery, the Cum Witch mounts you, throwing her whole body atop you and crudely pounding your box. Fat globules of cum squirt from her shaft almost constantly with each push inside your well-juiced nethers. Still, even though you’re quaking and shaking with her, you can tell that she hasn’t cum yet. Her eyes do look a little distant, and thinking to bring about your fertilization that much quicker, you reach up for her huge nipples.");
	output("\n\nThey’re as soft as the rest of her, though they have a slightly pebbly texture that makes you wish you could lick and suck on one. Instead, the huge knockers are threatening to completely envelop your hands, the huge tits smashing flat against your exercise-ball-sized breasts. The Cum Witch suddenly cries out, and you see her biting down on her lower lip, her eyelids low and her body shaking. Her hips slam into you one last time, hard, deliciously filling you. Her balls bounce up and down, and you feel her shaft suddenly thickening from base to tip, expanding to pass the huge torrent of cum she’s starting to pump into your womb. Blessed heat washes through you, and you feel the slimy, cerulean skin stretching tight. You feel so full and taut that you could use your belly like a drum, but the Cum Witch’s orgasm is just getting started. Each pulsing blast of semen is answered by a matching torrent of cum that sprays from your soaked pussy, puddling on the floor. You twitch beneath her, orgasming from the feel of so much fluid flowing through your box, and closing your eyes as the pleasure overwhelms you.");
	output("\n\nThe two of you stay joined at the hips for an indeterminable amount of time, sweating bodies joined in ecstatic bliss. Like all good things, it does come to an end, and one of the normal sand witches enters to interrupt you. The ebon beauty leaves you suddenly empty, a flood of her fluid dripping to the floor as she announces, <i>“I subdued the interloper, but I convinced her to join us.”</i>");
	output("\n\nThe other woman looks a little confused at this, but when she sees your wide, excited eyes, she reluctantly nods. There’s a flash of irritation at your presence, but it fades when your lover offers, <i>“Don’t be sour, I saved some for you, hun. Why don’t you take your sister to the mother, and when you come back, I’ll make sure to pack all three of your cunts, okay?”</i>");
	output("\n\nThis seems to placate the four-breasted, three-pussied woman, a wide grin breaking out on her face. She helps you up and leads you from the room to your new life, the last thing you see as you go a subtle wink from the Cum Witch...");
	processTime(35);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",cumWitchBadEndII,cumNum);
}
public function cumWitchBadEndII(cumNum:Number):void
{
	clearOutput();
	showName("CUM\nWITCH!");
	author("Fenoxo");
	output("Some time later...");
	output("\n\nYou smile and rub your hands across your womb. True to her word, the Cum Witch got both your wombs pregnant in short order, and you couldn’t be happier. Your sisters have doted on you ever since they discovered your devotion to milk-production and child-incubation. At first, they were a bit disturbed by your seemingly endless love for the Cum Witch’s cum, but as you produced more and more milk (and children) they stopped worrying about making you stay clothed or cleaning her cum from your skin. Not long after that, you moved in with her as a live-in cum-dump. Life is good.");
	output("\n\nYou swallow a creamy batch of her spunk and cup her heavy balls. They’ve grown a little since you moved in, you suppose to keep up with your voracious appetite for her seed, but your black lover doesn’t seem to mind. If anything, she seems quite happy to have you between her knees while she’s studying her spells. You can focus on swallowing her cum until you’re full, and she gets the motivation she needs to properly develop her magics. Why, just last week she learned how to make her jizz taste like chocolate - that was a great week!");
	output("\n\nStill, as you massage her quaking testes and drink down her delicious jism, you have to think, <i>“Life is good.”</i>");
	processTime(45);
	cumNum += pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

//Sand Mother fuck
public function sandMotherFuck():void
{
	clearOutput();
	showName("SAND\nMOTHER");
	author("?? CoC ??");
	output("Reclining atop an intricately carved throne is what can only be described as the Queen Sand Witch. The imposing, statue-esque woman must be over eight feet tall when standing, with a quartette of watermelon-sized tits and proud, three-inch long nipples that clearly show through her fine, silken robe. Platinum blonde tresses hang down to her shoulders, so bleached they’re nearly white. She glares down at you imperiously with unusual, glowing eyes. Her irises are solid white and luminant, leaving only the black of her pupils to eye you with. She inquires, <i>“So, you are the one to get my girls’ skirts in a bunch.”</i>");
	output("\n\nThe Witch Queen steeples her fingers and considers you above them. <i>“Well, what brings on your intrusion of my coven? You do not stink of corruption over-much, like many in this land, but that does not mean you are not an agent of the Lethice’s. Explain your actions, heathen, or be scourged from this chamber like one of Lethice’s demons.”</i>");
	output("\n\nYou brandish your beautiful sword and advance threateningly. The Sand Witch Queen slowly rises, pulling a scepter from beneath her robes with a resolute look in her eyes. <i>“You shall regret this action for a time, until we’ve corrected your diseased way of thinking. Now, taste the power of a Sand Mother!”</i>");
	output("\n\nPanting with lust, the Sand Mother sinks back into her throne with sweat and milk staining her silky robes. She groans softly, the milk-stains slowly spreading as you consider your options. This woman dared to stand against you. What do you do?");
	output("\n\nYou admire your prize for a moment, reveling triumphantly in your victory as you hastily disrobe. The Sand Mother, defeated and weak, declares, <i>“Fine then, do as you will. You won’t break me.”</i> The venom in her voice takes you off-guard - she still thinks you’re a demonic agent! You shrug and roll her over, pulling her up onto her hands and knees. She can think what she wants, but you’re going to tap her super-curvy body regardless. You smack the weakened Queen through her sheer robes and admire the ripple that moves from one side of her well-endowed tush to the other. Another slap, this time from the other side, sends waves of motion back across, and you cannot help but give the supple cheeks a tight squeeze immediately after.");
	output("\n\n<i>“Just... just get it over with already!”</i> implores the queen witch, glaring daggers back at you over her shoulder. Her skin is warm to the touch, even through the fabric of her robe, and a slight blush is visible on her cheeks. Whatever she says, she must be enjoying this to some degree. You lift the hem of her robe to expose the reddened derriere, gently caressing it. Dipping a finger lower, you find her womanly folds and casually test them. Two pairs of simmering snatches slick your fingers with her copious lady-lube, so thick it feels ready to drip and ooze out in long strings.");
	output("\n\nYou laugh and ask her why she’s pretending not to want this - her pussy is wet enough to flood the deserts! Shamed by your discovery, the Sand Mother casts her eyes down and shudders in shame, her juices beginning to spatter wetly on the floor. You stand up from underneath her and wipe your fingers off at the nape of her neck, then shift position to cup her swollen mammaries. The super-soft, fluid-filled breasts seem to devour your fingers with their softness, and you begin to roughly grope and knead them, expressing a few drops of milk as you maul her tits. Her nipples grow hard under your less-than-gentle ministrations, engorging to near double their original size. You flick one and smile when the huge-breasted Queen of the desert lets out a little moan of a whimper.");
	output("\n\nYou go back to grabbing her ass with one hand and fondling her pussy with the other until your digits are soaked with the slobbery lady-lube. Now that she’s nice and ready, you smear her juices across your cock, mixing it in with your own bubbling pre. She starts to push back into you, hungry for stimulation now that you’ve left her womanhood untended. You smirk and aim your slippery member at one of the approaching holes, grabbing a second cock as well, intent on penetrating both of her sopping entrances. The moment her labia caress your cockheads, she freezes as she realizes what she’s doing, and she tries to pull away.");
	output("\n\nIntent on penetration, you grab hold of the witch’s well-developed hips and drag her weakened body down, smoothly impaling her on your tools. She moans out loud, throwing her bleached tresses around wildly in pleasure while inch after inch of cock snakes into her passages. Your flared hips clap against her jiggly butt when you bottom out, rocking her whole body forward from the impact and setting all four breasts bouncing and swaying beneath her, painting trails of milk across the floor. Gradually, you draw back, exposing your sex-slicked length, and thrust back in, leaving no time for her to pull away. As soon as you hilt yourself to the sheath, you bounce away, pushing in and out, back and forth, a slow, steady fuck that leaves the Sorceress little time to do anything but roll her hips in your palms and moan like a whore in heat.");
	output("\n\nThe tall, statue-esque lady is little more than putty in your hands and around your penises, her pulsing, slick oven quivers in anticipation of the next stroke every time you leave her vacant. You really work her over, spanking her encouragingly whenever you feel she isn’t into it enough. She’s blatantly, unashamedly moaning by this point, and she lowers herself to the floor so she can begin to squeeze her breasts with her hands, squirting out puddles of milk from one pair then the other, bouncing back and forth until the resulting four puddles turn into one small lake. The Witch’s twin cunnies are gushing out fem-lube with every motion, and as you feel both of your orgasms approaching, you pull completely out, leaving her achingly empty and gaped.");
	output("\n\nThe Sand Mother begs, <i>“Put it back in! Please, fuck me! I neeeeeed it!”</i> She tries to crawl back into you, aiming to pin you between the wall and her sizeable ass. You easily shift to the side and let her smash her butt into the stone, squeezing her plump cheeks obscenely as she moans disconsolately. When she crawls away, there’s two cunt-shaped stains on the wall, dripping long rivulets to the ground. Gods in heaven, she’s wet!");
	output("\n\nYou tell her that if she wants to be fucked like a bitch, she needs to beg like a bitch - face down, ass up, and whimpering like the needy slut that she is. Hope sparks in her eyes, warring with suppressed pride, and she gingerly lowers her face to the ground, not daring to meet your gaze as she lifts her rump high and spreads her legs. A pitiful whine so quiet that you can barely hear it squeaks from her lips. Not good enough. You tell her that you aren’t convinced. She doesn’t sound like a horny bitch just begging to be plugged full of cock. Again, the witch whines, but this time, it’s high and keening, a plaintive wail that’s part moan and part encouragement. Juices drip freely down her legs as she gives in completely, her knees twitching, her twin pussies opening, blooming like flowers and pulsing with hungry dilations, still slightly gaped from your fuck.");
	output("\n\nWatching her debase herself like this, one of your shafts grows even harder, oozing and aching to cum. You congratulate the simpering excuse for a sorceress on her proper mewling by pushing back inside her sweltering snatches. Fucking her hard and fast, you pay little heed to her pleasure and simply mount her, rutting her roughly. She doesn’t even stop her begging either, and every now and then you can actually pick out words like, <i>“Please,”</i> and <i>“Cum.”</i> You grab a fistful of her hair and pull her head back, commanding her to cum for you, even as you feel your orgasm rising, welling up within you.");
	output("\n\nThrusting hard enough to clap your loins to her ass audibly, you erupt, spurting wildly into the convulsing, snug love tunnels. Semen floods out of you from the force of your orgasm, creaming the juicy cunts as they clamp down, squirting femlube and leftover spunk across your paws. Once you’ve pumped every ounce of your virile fluid into the waiting receptacles, you pull, admiring the salty, mark you’ve left on the once proud woman.");
	output("\n\n<i>“Ahhhh,”</i> she sighs, slumping down into the puddles of sex, <i>“Told... told you... you couldn’t - mmmm... break me...”</i>");
	processTime(40);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

//Yvonne
public function yvonneFuckies():void
{
	clearOutput();
	showName("\nYVONNE");
	author("?? CoC ??");
	output("The interior of the armory is blisteringly hot, filled with intense heat from the massive forge dominating the far side of the shop. The bellows are blowing hard as a tall german-shepherd woman works the forge. Incredibly, she’s wearing nothing aside from a ragged leather apron. It bulges from the front, barely containing her obscene proportions as it protects them from the heat of her forge. She pulls a piece of metal from the forge and strikes it a few times with a hammer bigger than your head, then tosses it in a bucket filled with water, steam boiling out of it from the hot metal. At last, the sweating forgemistress notices you and turns around, her breasts jiggling wildly.");
	output("\n\n<i>“What can I make for you? Platemail? Or something that breathes a little easier?”</i> Yvonne asks, fanning herself.");
	output("\n\nYou step closer, glancing from her bulging, barely contained tits to her pouting lips and expressive, violet eyes. A shock of sweat-matted auburn hair obscures part of her face, but the tall, buxom blacksmith nervously brushes it aside as she watches. Once you’re close enough to touch, you quietly and sincerely proclaim, <i>“You’re the most beautiful piece of craftsmanship in this entire store.”</i>");
	output("\n\nYvonne steps back, and you swear you can see a blush blooming through her fur, a fiery glow of embarrassment that spreads to the upper curve of her immense mammaries. She folds her arms over her apron, unintentionally smushing those gigantic tits closer together and deepening her cleavage into a canyon. An immense sigh causes the plush plateau to sway pendulously as Yvonne answers, <i>“You want to go again, huh? I do love working up a sweat...”</i>");
	output("\n\nYou walk over to the door and find a sign hanging in front of the window. The side facing indoors has ‘out’ on it. There’s also a ‘closed’ sign hanging to the side of the doorframe. You take the simple wood plaque in hand and flip it over - can’t have anybody walking in on your sexual hijinks, can you?");
	output("\n\nA fuzzy, calloused hand grabs you by the scuff of the neck, lifts you off the ground and pushes you against the wall, slamming you into it forcefully enough that some weapons hanging nearby rattle dangerously. A hot puff of breath hits your cheek, Yvonne’s wet, canine nose bumping against your ear as she pants in your face. She closes, and you feel her bare, sweat-soaked breasts sliding up and down your back, holding you up as firmly as her iron grip. Yvonne’s long, smooth tongue licks you from collarbone to chin, lapping up the sweat that’s already starting to bead, the heat of the simmering forge-fires and your companion’s well-warmed, powerful frame long since getting to you.");
	output("\n\nA distinctly feminine scent wafts up to your nostrils, intermingled with the blacksmith’s own pungent body-odor, strong enough to make your head swim. Yvonne’s free hand begins removing your full platemail, the blacksmith’s confident motions suggesting she’s had plenty of experience at this. The aroma of the super-stacked bitch’s estrus increases to the point where it nearly overpowers her salty sweat-smell, her nipples pressing hard into your back. One of your cocks grows hard from the forceful attention, pinned between the wall and your belly. Finished with your gear, Yvonne nips your neck and says, <i>“Nice package, breeder.”</i>");
	output("\n\nThe forge-mistress abruptly releases you and steps away, the supporting cushion of her breasts no longer there to help balance you. After a moment of confused stumbling, you catch yourself and turn around, curious as to just what the buxom bitch is doing.");
	output("\n\nYvonne is on the ground on all fours. Her tail is sticking nearly straight up, waving back and forth excitedly as she presents her curvy rump to you. Surprisingly, her ass is much less muscular than her upper body, with a pair of pillowy buttcheeks that nearly conceal her soaked cunny from view. You aren’t sure if it’s lubricant from her arousal, or sweat from working the forge all day, but Yvonne’s thighs are absolutely drenched with moisture; a veritable slip n’ slide of wetness that beckons you to bury your bone in the canine’s feminine entrance. She glances back over her shoulder, a submissive glint in her eyes as she begs, <i>“Come on, be my alpha. This bitch needs a hot, wet fuck. Do it!”</i> What an odd dichotomy - one moment she’s throwing you around, the next, begging to be mounted. For all her power, it seems Yvonne still wants to be taken as a meek bitch.");
	output("\n\nYou sidle up to the larger woman and begin aligning each of your shafts with her mammoth buns, the sweltering, pheromone-laced stink pouring from her body making it difficult not to fall on top of her and rut. Her huge tits are squished against the floor, squeezing out obscenely to either side of the blacksmith’s lithe, muscular torso. When you push inside, her slick wet cunt squeezes your corrupted cock powerfully but affectionately. Her potent vaginal muscles work your unholy cock over, tightly embracing your turgid dickflesh as you begin to fuck her properly, plowing her sweat and love-juice soaked folds even while you struggle to reach up for her incredible breasts.");
	output("\n\nYou get a handhold on the soft chest-flesh and begin to massage at what you can find, releasing appreciative moans from your partner. Unfortunately, her furiously-wagging tail bludgeons you across the nose over and over, and you’re forced to block it with one arm so that you can ream her snatch unimpeded by the woman’s canine instincts. She growls, but doesn’t stop you. You can see the muscles in her arms quivering, shaking, struggling to maintain her posture in spite of the overwhelming pleasure your wide, unholy cock is inflicting upon her poor womanhood.");
	output("\n\nA shiver runs through the dog-morph’s entire body, culminating in a cock-wringing contraction that ripples through her cunt, milking you with her slippery twat. It works, and you lean over her prostrate form as you bottom out inside her, her sweat-matted fur smearing your face with her scent as you cum. Your jizz bubbles out to fill her depths, the spunk surging through her as it moves towards her womb. Yvone sighs dreamily, <i>“Ahhhh...”</i> while you empty your quartette of basketball-sized balls inside her unprotected womanhood. With a thoroughly cream-stuffed twat beneath you, you pull out, accompanied by a exhalation of female pleasure.");
	output("\n\nYvonne staggers up on her footpaws, groaning the whole time, a trail of white dribbling on the floor behind her. Her tail wags happily, and she grabs you, pulling you into her sweaty bosom as she affectionately squeezes your muscly handful of derriere. You aren’t released until you feel dizzy, half-suffocated by her preponderance of breast-tissues and potent pheromones.");
	output("\n\nYvonne tosses you your gear, and you dress in a daze. Before you’ve completely finished, she’s pushing you out into the street, covered in sex-stink and stumbling over your own paws. She calls out after you, <i>“Thanks babe, I gotta mop this mess up!”</i>");
	processTime(30);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

//Ceraph
//Pet play
public function ceraphPetPlay():void
{
	clearOutput();
	showName("\nCERAPH");
	author("?? CoC ??");
	output("When you broach the idea of submitting to your fetish queen, delight washes across Ceraph’s face. Before another word can be spoken, she lashes out with her whip (where did she get that from?) and catches you around the neck with the taut leather, yanking hard enough to drag you to the ground and make you sputter for air. The shining leather slides off as soon as your hands hit the ground, but the demoness is already standing above you, pushing on you with her stiletto-like heels to roll you aside.");
	output("\n\n<i>“That’s a better place for a useless little girl like you, down in the dirt where you belong,”</i> the demoness declares, pacing back and forth. She crouches next to you and whispers in your ear, <i>“The safe word is ‘apple’, you pitiful pig.”</i>");
	output("\n\nYou nod meekly, awed by the demonic dominatrix’s imposing, self-assured aura of command.");
	output("\n\n<i>“Bend over, slut,”</i> Ceraph commands.");
	output("\n\nYou start to stand up, but Ceraph again lashes out with her whip, striking you across the back four or five times. It’s hard to keep count through the pain. Stinging welts rise on your slimy, emerald skin, and a heady thrill runs through your groin. You’re totally stiff by the time she finishes the punishment, and it’s plainly visible to the cruel hermaphrodite above.");
	output("\n\nScowling down at you, Ceraph commands, <i>“Pets don’t get to sit up - they roll over in the mud and crawl on your hands and knees like the beasts they are. Remember that, Deez. You aren’t a person.”</i> Her whip lightly smacks your hip. <i>“You’re a pet.”</i> SMACK! <i>“A slave.”</i> CRACK! <i>“Property.”</i> SNAP!");
	output("\n\nYou mewl pathetically under the blows but do your best to present yourself as ordered, rolling over and climbing up, full platemail covered in grime. Worse still, your excitement is showing in more ways than one, both in the hardness of your manhoods and the moisture leaking from under your equipment.");
	output("\n\nCeraph smirks and asks, <i>“Does my subby slut like it when I play rough? Or did you just get hard when you realized how right I am? There’s no shame in enjoying your station, pet. After all, animals are there to please their owners.”</i> She strokes your obscenely long, black and white spotted goo-hair with an unfamiliar gentleness. It’s like a pleasant balm after the rough whipping, and you find yourself leaning into it, accepting the demeaning affection just to feel something that doesn’t hurt.");
	output("\n\n<i>“Good girl,”</i> the purple-skinned dom coos as she begins to undress you, keeping you on the ground the whole time. <i>“Let’s get you out of these pesky clothes. Good pets are naked, and I can see how hard you’re trying to be a good pet.”</i> Her hand dances across each of your shafts with ticklishly-soft touches before gently squeezing your ballsack, savoring your state. You groan out loud at the sudden sensation, and a bead of pre-cum has begun to form on your tainted crown. The crystal-clear droplet of congealed lust slowly begins to dangle down, connected for a few seconds by a string of moisture before it snaps and disappears into the dirt.");
	output("\n\n<i>“Oh, pet is dripping?”</i> Ceraph wonders aloud as she stands and pivots, immediately taking a seat on your back. <i>“Perhaps pet is feeling a little pent up.”</i> She loops the whip around your neck and tugs slightly, enough to make you realize that she could control your breathing right now, if she wanted to. The damnable magic of that whip has your blood boiling, and the erotic tingle of the treated leather against your slimy, black and white spotted fur doesn’t help. Another drop falls, and you start to answer, <i>“Yes...”</i>");
	output("\n\nThe word is choked off as soon as its started. Ceraph lectures, <i>“Pet, that isn’t how you speak! If you’re going to be more than a useless submissive, you need to learn how to communicate. Now, if you want me to ease that pressure, you can mewl like a cat or bark like a dog once for yes. Do it twice for no, and we can go for a walk.”</i> The crushing pressure around your windpipe is relaxed, and you are given a chance to respond.");

	processTime(20);
	pc.lust(100);
	clearMenu();
	addButton(0,"Bark Once",barkOnceForCeraph);
	addButton(1,"Bark Twice",barkTwiceForCeraph);
}

//Bark once
public function barkOnceForCeraph():void
{
	clearOutput();
	showName("\nCERAPH");
	author("?? CoC ??");
	output("<i>“Arf!”</i> you bark, loud and almost proudly, wagging your tail excitedly.");
	output("\n\nCeraph casually pulls her panties a bit lower to ease the pressure on her tightly-contained phallus. The stalk of her cock drips with the swampy cunt-lubricant her delta exudes, and she pumps it a few times to make it stand long and erect, nine inches of pulsating, demonic horror. Tiny nodules decorate the shaft in concentric rings to stimulated anyone lucky enough to experience her cock. As Ceraph eyes your backside, you realize that you’re going to be feeling it before long.");
	output("\n\n<i>“ARF! ARF!”</i> you bark in distress, trying to crawl away. You didn’t mean to get milked like... like that! Her whip snaps taut before dragging you back. You scrabble in the dirt for a half-second, choking yourself before you give up and sag limply down at her feet. Slowly, you lift your full, toned derriere up into the air to allow Ceraph access, regretfully yielding to her like you should have initially.");
	output("\n\nSWAT! Her hand claps against a cheek, lingering to squeeze the raw flesh after the spank. She explains, <i>“That was for resisting, and this...”</i> You feel a slick, wet warmth at your tender, rear opening. <i>“...is for being my obedient, playful little doggie.”</i> Her hips press the hot spear harder against your backdoor. The cunt-slick tool slides right on in thanks to your capacitative anus, the gentle nubs each massaging your snug ring as they slide on through. You groan as you’re taken by your owner, catching yourself halfway and arresting the pleasured grunt as soon as you can, but it doesn’t matter - the damage is already done.");
	output("\n\nThere’s a ring of larger bumps, just around the edges of Ceraph’s glans, and they catch on something inside you as she grinds through your butthole, sending heat-spikes of inadvertent pleasure through your twitching malenesses. Almost immediately, you squirt out a huge dollop of pre-cum. It dangles heavily enough to make your giant, nub-covered demon-dick bob below, and you give up another grunt of pleasure while your hips press harder against your owner’s.");
	output("\n\nCeraph’s hands fall on either side of your waist. She reassures, <i>“I treat my pets well, Deez.”</i> Her hips pull out, the nubby, textured tool bouncing and grinding all along your insides as she continues. <i>“I make them happy to be pets...”</i> That thick, demonic dick pushes back in a little harder, pushing your arms down so that your face is pressed into the dirt. <i>“...Happy to be owned, because obedience IS pleasure.”</i> Ceraph adjusts the angle so the blunted tip of her erection rams straight into your inner, cock-milk reserve, and fireworks start to go off inside your brain.");
	output("\n\nDick-milk drizzles from one of your peckers into a pool on the floor as you’re expertly brought to a tingly, body-quivering, anal orgasm. It can barely be called an ejaculation, really. The cum is just sliding smoothly out of it as your inner reservoir is squeezed. Ceraph continues to push, but her dicktip slips off its mark, and she quickly buries herself back inside, each nodule responsible for small blurts of jism as they slip across your orgasmically tightening prostate. Ironically, one of your cocks has begun to lose some of its stiffness, and you grow limper and limper as more of your cum leaks from you.");
	output("\n\nMost amazingly of all, though the ‘pressure’ feels released, you’re still horny, even with soft cocks. Ceraph purrs, <i>“I told you that I was a good owner, didn’t I? Now just lie there and enjoy myself on your sensitive tush.”</i>");
	output("\n\nShe rapidly begins to pump her penis through your sphincter, battering your ass with firm but gentle thrusts. You bark in pleasure like the cum-slut doggy that you are and start to push back against her before long. Those nodules rub your insides so well, and they keep you dripping wasted semen from your limp cocks the entire time, tingling in ecstatic pleasure. Soon, you’re panting hard while Ceraph’s hips slap off your shapely, chiseled backside hard enough to sound like miniature thunderclaps, and your poor prostate is getting pushed up against each time.");
	output("\n\nCeraph moans out loud and suddenly rams herself into you brutally hard, hard enough to make you feel like your guts are being smushed into each other and your prostate is being smashed flat. Warmth explodes inside your intestines, slowly spreading out around the flaring, demonically enhanced dick as it orgasms. You can hear your owner’s lady-spunk splattering into the ground behind you as she whimpers, <i>“G-g-good... girl...”</i>, her dick firmly spraying its thick, tainted milk straight onto your sore prostate. You scrunch your eyes closed as Ceraph claims your ass for her own, and each of your cocks lets go the very last of your sticky, stinky, pet-cum.");
	output("\n\nYour Mistress eventually finishes and pulls out, offering a tasty bone-shaped biscuit for you to gobble down, and she pats you on the head as you gratefully accept your reward.");
	output("\n\n<i>“Good, girl.”</i> her voice says, slowly fading into the wind.");
	processTime(30);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

//Bark Twice
public function barkTwiceForCeraph():void
{
	clearOutput();
	showName("\nCERAPH");
	author("?? CoC ??");
	output("<i>“Arf! Arf!”</i> you bark, wiggling your tail happily. For some reason, the idea of denying yourself release in exchange for more humiliation is appealing to you.");
	output("\n\nGently tying the end of her whip around your neck into an improvised collar, Ceraph smoothly strokes your back, praising you again, <i>“Such a good pet. Let’s go for that walkie, and let all your friends see just how good you can be.”</i> There’s a gentle tug on your new collar, and you crawl along after your slave-turned-mistress, whining like a needy animal.");
	output("\n\nCeraph leads you out into the wasteland on an exhausting, humiliating journey. Somehow, she keeps finding imps and goblins to show you off to. The goblins seem intrigued by the sight of your compulsively erect malenesses, and often offer Ceraph a bounty of gems to fuck you. Your mistress insists that you don’t need any such sexual release, because you are a good doggie and get all you need out of obedience. Her words draw an exaggerated whimper from your lips along with a few fresh drops of pearly cock-cream, but you hold still, legs quaking eagerly. It feels like all it would take to get your release would be a few soft touches on your aching cocks.");
	output("\n\nOne of the goblins even notices your state and comments on it, holding her hand beneath your freely drooling erections to collect a palmful of slippery boy-honey. She holds it up in front of her nose and sniffs it, sighing, <i>“She certainly does seem to be well tamed, miss demon. You’re lucky you caught her before I did. With cum this nice, I’d be milking her dry every time she could get it up. Maybe you’ll change your mind sometime.”</i>");
	output("\n\nCeraph shakes her head but smiles down at you, patting you on the head. The humiliation of it all is twisting around with your lust, the two emotions so confused that you feel yourself getting harder from being treated like a house-pet. A dollop of pre-cum rockets onto the ground while you whine softly. Your owner notices and commands, <i>“Now, pet, we can’t have you making this goblin’s home a mess. Lick it up.”</i>");
	output("\n\nYou bend down and lick up your sexual leavings, tasting the dirt below until there’s a mess of spit and cum mud where your pre-ejaculate landed. <i>“Good enough. Come on, doggy, let’s finish our walk!”</i>");
	output("\n\nCeraph drags at your collar, picking up the pace as she takes you home. Each movement is torturous, as your dangerously excited boners feel like they could go off at any second. The journey is murder for your poor, over-inflated malenesses, but you somehow make the whole way home without popping. The trail of musky slime that clearly marks your journey is another thing though.");
	output("\n\nClick.");
	output("\n\nYour collar is removed, and you look around realizing your owner is gone. Your muscles are sore from the journey and you NEED to masturbate... You aren’t even sure why you did that.");
	processTime(30);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,0);
}

//Loppe
public function loppeTheRabbot():void
{
	clearOutput();
	showName("\nLOPPE");
	author("?? CoC ??");
	output("Wandering towards the bar, you notice an unusual commotion; there are a lot more people hanging around here than is usual for the time of day. Feeling curious, you go over to investigate, and ask a bystander what all of this is about.");
	output("\n\n<i>“You don’t know? Today we’re having a show at the bar. A dancer is going to be dancing for us. You should go and have a look, it’s very beautiful!”</i>");
	output("\n\nThere’s no harm in staying a while...");
	output("\n\nYou make your way through the crowd, pushing past the doorway to try and find a table to sit down at. The place is really jam-packed, and it’s not helped by the fact that a small makeshift stage has been set up in the center of the room. The bartender is working flat-out to provide drinks for all the thirsty people, and you wonder where in the world you’ll find a place to sit down and watch. After a lot of elbowing, narrowly avoiding being stepped on, and small confusions, you manage to find what you think is a good place to watch the ‘show’.");
	output("\n\nSuddenly the bar goes silent and the lights dim; a figure clad in a white mantle steps onto the stage; discarding the covering with a swift movement, it reveals the comely visage of a bunny-girl - a literal bunny-girl, in that apart from the obvious bunny ears and the hints of rabbit-like legs, she actually looks otherwise human despite the prevalence of anthropomorphic animals in this city.");
	output("\n\nA strange, exotic robe adorned with floral designs decorates her body, and her face is completely white, delicately painted to make her look like a porcelain doll; her eyes are shaded with a red eyeliner and her lips with a crimson lipstick. The black hair atop her head is done in a small bun, perched just above her flattened bunny ears. She smiles at her audience and takes a pair of fans out of her long sleeves, opening them and beginning to motion in graceful, fluid movements. You watch mesmerized as an unusual, but calming, music begins playing in the background; while the small makeshift stage begins to glow with a strange substance, the dancer begins going through her preparatory motions.");
	output("\n\nThe grace and speed with which she moves are admirable. Whoever this strange woman is, she’s obviously honed her body quite well. This promises to be quite an interesting spectacle.");
	output("\n\nThe crowd begins cheering as finally the dancer begins, striking poses that seem next to impossible in those restrictive robes of hers; she surprises you even more when she begins singing in tune with the music, a beautifully melodic voice that silences the crowd and echoes throughout the room. Every single one of the patrons gathered today watch the show enraptured, while the bartender takes this small reprieve to rest for a spell.");
	output("\n\nSuddenly the eyes of the dancer turn towards you, deep brown and gentle, but filled with a mysterious intensity that makes her look even more exotic. Throughout the dance you have the impression the woman glances your way whenever she can, and yet her movements and motions are so natural, so fluid, you have to wonder if she’s really looking at you or just going through the choreographed motions of her dance.");
	output("\n\nFinally, at the climax of the song, the dancer’s robe is set aglow, likely by the same substance that covers the stage, giving her a shining silver aura that illuminates the whole room and dazzles the watchers!");
	output("\n\nThe dancer spins one last time, slowly crouching and looking at you over her opened pair of fans, as the glow in her robes and the stage begin to fade. The patrons, entranced, miss the ending of the show and begin to clap and cheer only a short while after the lights have gone back on inside the bar. The dancer’s eyes stay locked on you, even as a few of the patrons attempt to approach the stage and touch her. A pair of city guards enter the bar and make their way through the crowd, likely to open a passage for her egress.");
	output("\n\nYou watch her as she goes, and then get up to try to leave, elbowing your way through the crowd.");
	output("\n\nAs you exit the bar you hear someone say, <i>“Hey! Wait up!”</i>");
	output("\n\nYou pause, wondering who it might be, and turn around to see who’s calling with one concealed hand carefully ready to defend yourself; can’t be too careful, after all. Even if Tel’Adre isn’t full of rapist monsters, that doesn’t mean there aren’t common muggers. A tired bunny-girl clad in light-blue robes similar to the ones the dancer was wearing runs toward you. In fact, staring at her, you’re quite certain she is the bunny-girl who was just dancing. You cautiously greet her, wondering what she wants.");
	output("\n\nTaking a moment to catch her breath, the bunny-girl smiles at you. <i>“Hello! You’re a new face... I don’t think I’ve ever seen you around the city before; how long has it been since you moved?”</i>");
	output("\n\nYou look at her and state that you don’t live here in the city; you’re just visiting. She raises an eyebrow at that. <i>“Really? So there are other places out there that are safe too?”</i> she asks, covering her mouth, startled.");
	output("\n\n<i>“Oh, where are my manners...?”</i> She extends her hand, cutting off any reply. <i>“I’m Loppe; pleased to meet you, umm...”</i>");
	output("\n\nYou smile, share your own name in turn and then shake her hand. It’s quite a coincidence to see someone who has the same race as the dancer that was just eyeballing you in the Wet Bitch so soon afterward. Loppe giggles, then comes clean. <i>“Yeah, that was me... did you enjoy the show? Ah, actually, let’s not talk about it here in the street... did you maybe want to come with me to this little bakery I know? They make a mean carrot cake.”</i>");
	output("\n\nYou consider the time of day, and the girl offering, and decide that it can’t hurt. Loppe smiles and takes your hand, leading you towards a nearby bakery.");
	output("\n\n<i>“Carrot cake!”</i> she happily pips to nobody in particular. <i>“With a side of chocolate-chip cookies, and some cupcakes. Can’t wait!”</i>");
	output("\n\nThe carrot cake was something you could have seen coming, but what’s with the cookies and cupcakes? Is one little, dainty-looking bunny-girl really going to eat all that?");
	output("\n\nLoppe shrugs and smiles. <i>“I love sweets, and dancing works up an appetite.”</i> Then she gives you a seductive glance. <i>“You aren’t going to deny a dainty-looking bunny-girl her pleasure, are you... sugar?”</i> She lets the last word roll off her tongue in a provocative manner.");
	output("\n\nYou tell her that you aren’t, you just didn’t expect her to have such an appetite. With a playful smile, you ask what other not-so-dainty secrets she’s hiding; does she burp loudly to show she enjoyed her meal? Loppe smiles mischievously, <i>“Oh, my sweet girl... When I get my hands on something I like, I eat it up whole...”</i> Slowly, you feel a foot gently glide across your legs.");
	output("\n\nWell, now. This is a different kind of world, indeed, but this feels a little too quick. Still, it’s not entirely unwelcome, and while you decide to leave your hand where it is, you allow her to continue, not hiding that you recognize what she’s doing and you rather like it. However, the waitress stops your playing around with her approach.");
	output("\n\n<i>“Yes; I’m positively ravenous...”</i> she replies, and hikes her foot a little higher, not only intent on feeling you up, but also inviting you to do the same to her.");
	output("\n\nYou keep your hand where it is for now; there’s a waitress ready for your orders.");
	output("\n\nLoppe clicks her tongue in disappointment and quietly retracts her foot. <i>“You know what I want, sugar.”</i> She smiles lasciviously, reinforcing the double entendre behind her apparently innocuous words.");
	output("\n\nYou tell the waitress, a fetching young cat-woman, what you’d like, and pull out the thirty gems needed to cover the tab; as mostly specialty items not on the usual menu, the price is a bit higher. A small voice inside wonders if she’d eat so extravagantly were she footing her own bill.");
	output("\n\nThe waitress jots down your order, snatches up the gems, and then walks off, tail swishing above a feminine butt. You turn to look at Loppe, and notice she’s staring with interest at the waitress’s ass. <i>“She’s got quite a nice ass... I wouldn’t mind getting behind that,”</i> Loppe comments quietly, watching the cat-woman’s tail swish.");
	output("\n\nLoppe giggles at your expression and answers the unspoken question. <i>“I do, Deez. It’s not really girl-on-girl, though.”</i> Loppe stays silent for a long moment, then sighs reluctantly and gently but firmly takes your hand and places it over her crotch, where you can feel a most unfeminine bulge. She holds it there, then lets you go, looking at you all the while.");
	output("\n\n<i>“... So?”</i> she carefully asks. <i>“I do have a pussy as well, by the way. I’m hermaphroditic. This is the part where you can tell me to... fuck off, or go away, or something similar, if you like. I’ve dated enough to know when someone isn’t into me... and I’m not made of glass; I won’t break, so don’t worry.”</i> Despite her tough display you do notice a bit of moisture gather in her eyes.");
	output("\n\nLoppe looks at you, studying you to see if you’re mocking her. But when she detects only honesty, she sighs and breaths a sigh of relief. <i>“Sugar, you really are sweet. I can’t tell you the number of times I’ve been rejected just because I’m a herm... anyways, we can chat later. Our food is here.”</i> She points toward the waitress holding your orders in a tray. You nod to her in agreement and turn your attention towards the food, ready to savor the sweets.");
	output("\n\nLoppe’s dress robe - a kimono, as she calls it - is very well-made, and it really hides her package well. You wouldn’t have thought she was a hermaphrodite if she hadn’t revealed it during your little tête-à-tête. You ask if her deception is, perhaps, intentional? She did say she got rejected plenty of times for being a herm.");
	output("\n\n<i>“Haha, I have no problems with my sex. It’s just coincidence that this kimono is really good at hiding it.”</i> Loppe grins at you, then gives you a sultry look.");
	output("\n\n<i>“Hey, Deez,”</i> she says quietly, <i>“you’re really beautiful, y’know? And kind... how about a quick stop at my place, before we say goodbye?”</i>");
	output("\n\nThe dancer smiles mischievously at you. <i>“Wonderful. I’m going to show you just how great my body looks without this dress. You wouldn’t believe how much time I spend in the gym, working out.”</i> Loppe grabs her last cookie in one hand and your arm in the other, leading you away - presumably to her house. Enroute, she giggles constantly, provoking a question from you.");
	output("\n\n<i>“I always get giddy when I can spend time with a sexy thing like you...”</i> she replies, <i>“but I was just recalling some of my earlier encounters. I should warn you, I tend to get very, and I do mean very carried away during the act. Things can get pretty intense.”</i>");
	output("\n\nYou tell her that you’re confident in your stamina. Truth be told, you can withstand a fight with a whole mob of minotaurs and still have enough energy left to fight off demons.");
	output("\n\nLoppe smirks. <i>“So if I manage to tire you out, that would make me stronger than a mob of minotaurs, right? Okay! Challenge accepted!”</i> She tightens her hold on your hand and starts walking faster, eager to get you to her place.");
	output("\n\nIt’s not very difficult to reach Loppe’s place; it happens to be located only a few blocks away from the gym, behind a small shop with the sign <i>“Kemono’s Oriental Clinic”</i>.");
	output("\n\nOnce you get to the front door you’re surprised to see that Loppe’s house is most unusual. The structure is the same as all other houses in Tel’Adre but the decoration is what sets it apart, it is covered in symbols that just don’t any make sense to you; noticing your confusion, Loppe explains, <i>“Mom drew these, it’s supposed to be something to help ward off bad influences. It’s a cultural thing.”</i> Loppe grins. They don’t seem to work very well - after all, you’re here.");
	output("\n\nLoppe smiles and produces a key. With a click the door unlocks and the two of you step inside. If the exterior was unusual, the interior is even moreso; the first thing that catches your eye is the door; it’s a sliding door, covered with some sort of film or paper that effectively prevents anyone from seeing beyond it. Why they would need something like that, considering whoever got in had to get past the front door, is anyone’s guess...");
	output("\n\n<i>“Mom! I’m home!”</i> Loppe yells, and waits for a response. When none comes, she grins at you. <i>“Looks like we’re in the clear, c’mon!”</i> She slides the door open and leads you inside. You note a distinct lack of chairs and the tables seem a bit too low; after some thought, you guess that you’re supposed to lower yourself to the ground in order to accommodate the furniture. You also note that most of the floor seems to be covered in a soft carpet, which feels great under your paws. You admire it as Loppe takes you to the back of the house, to a door marked with the image of a cute little bunny chewing on a carrot.");
	output("\n\n<i>“Here we are, sugar. My room.”</i> Loppe makes a show of opening the door and letting you peer inside.");
	output("\n\nWanting to be polite, and curious, you do what she’s clearly inviting you to do and take a look. The interior is quite homey; a sizable but modest bed is covered with soft cushions and blankets, and the remaining space is filled with a vanity table, a large closet, and some small shelves. You see a number of books, but the topmost shelf gives pride of place to three well-loved stuffed dolls. Loppe notices where you’re looking and gives you a sheepish grin. <i>“Ah... a girl sometimes likes to keep her old comforters,”</i> she offers defensively, clearly embarrassed that you’ve seen them.");
	output("\n\nYou politely slip inside, waiting for her to join you. Loppe closes the door behind her, and with a practiced flourish removes her clothes, shortly followed by her underwear. You’re surprised to see the laquine’s forwardness, but you suppose this is what you came here for after all, so you smile and strip off your full platemail.");
	output("\n\nLoppe admires you as you undress, giving you ample opportunity to admire her back. As you examine each other, your eyes set on her hardening horse-cock. It swells to an impressive size and points the same direction as her eyes - it certainly didn’t look this big when it was tucked inside her tight shorts.");
	output("\n\n<i>“So, sugar,”</i> she says, interrupting your reverie, <i>“we can do this however you like. I don’t really mind pitching or catching, especially with a cutie like you.”</i> Loppe winks at you, posing for your benefit.");
	output("\n\nPulling her onto your dick would result in some cowgirl fun, though you’d have to deal with her cock pointed right at you when she came. You could just whip it out and ask what she thinks of it, compared to hers - it might lead to some cross words and crossed swords, though. You could take her monster length vaginally, but if her libido is what she claims, you’ll probably wind up quite stretched. Her hardening horsecock looks like it would fit between your immense tits, an act likely to net you a messy demonstration of her enthusiasm. There’s always the option to receive her anally, though with her vaunted libido, you’d probably end up so flooded with her cum that it would wash from your mouth. Or you could be a prick-tease and leave.");
	processTime(50);
	pc.lust(40);
	clearMenu();
	addButton(0,"Get BJ",loppeBJ);
	addButton(1,"Catch Anal",loppeAnal);
}

//Bj
public function loppeBJ():void
{
	clearOutput();
	showName("\nLOPPE!");
	author("?? CoC ??");
	output("As your eyes sweep over the naked half-breed’s form, they focus on her equine masculinity, already standing proud and eager at the prospect of sex. Distinctly aware of your own male appendages, you conversationally ask Loppe what she thinks of your bumpy demon-dick, an idea starting to form in your mind.");
	output("\n\n<i>“What do I think about your dick? Well... it’s huge! So big, hard and juicy - that’s a cock I can really get my hands around. To be honest with you, I’m having a hard time not taking it for a spin. Such a wonderful looking member... even if it does look too big to fit.”</i> She licks her lips.");
	output("\n\nDrawing confidence from her words, you look directly at your lover. <i>“Show me exactly how much you like it, then.”</i>");
	output("\n\n<i>“Hmm, are you implying what I think you’re implying, sugar? To be honest, I’d rather be inside someone or have someone inside me... maybe even both!”</i> Loppe laughs. <i>“But since it’s you who’s asking... I can’t deny a request from a sweet thing like you now, can I?”</i> She motions towards her bed.");
	output("\n\nYou seat yourself, giving her perfect access to your stiffening manhood and making it obvious you’re ready to begin.");
	output("\n\nLoppe kneels before you, leaning in to inhale your musk. <i>“Mmm... strong and sexy. Just the way I like it.”</i> She licks her lips. Gently, she closes a hand around your shaft, pumping and pressing on you, milking a few dollops of pre. You murmur appreciatively, shivering at the skilled pressure she applies to your sensitive manhood, but you wait patiently for her to proceed.");
	output("\n\nLoppe sucks the pre off your tainted crown, making a show of swallowing slowly. <i>“I might pop just from blowing you, sugar,”</i> she chuckles. <i>“That’s how tasty you are... gimme more of that juicy cock.”</i> She leans in and begins licking you, from base to tip and back down, lathering the entirety of your unholy cock in her warm saliva. She only stops to deliver appreciative kisses to the underside of your member, moaning every time she does so... nuzzling into your crotch, seemingly unconcerned with steadily leaking pre that’s sticking to her hair or her rabbit-like ears.");
	output("\n\nYou grab hold of the bed for support, moaning audibly at her skilled lips and tongue as they caress your throbbing, sensitive prick. A part of you wants to just thrust your cock into her lips already, but you force yourself to be patient; there must be more to come, and who’s to say it won’t be even better?");
	output("\n\nThe laquine looks seductively up to you, half-smiling as she licks her way up your shaft, catching a stray bead of pre that runs down your length. Once she arrives at your nub-ringed tip, instead of working her way back to the base, she closes her lips and kisses your cumslit with a feather-like touch that sends electric jolts of pleasure running through your body. Without warning she takes your tip into her mouth, caressing your glans with her tongue as she fondles your dick passionately, moaning and sending vibrations running along your length. Her hands busy themselves with your shaft, never stopping their wonderful massage.");
	output("\n\nLoppe’s smile is like a promise of what’s to come, and she does not disappoint. As if her fingers were not enough, her tongue also contributes to your dick-massage, pushing all of your right buttons... it’s a wonder you haven’t lost it already. The half-breed herm gives your tainted crown a long lick as she pulls away shortly. <i>“Come on, sugar. Let me taste you.”</i> She smiles as she leans over your shaft once more, blowing lightly on your crown, before taking it inside her mouth and sucking sharply.");
	output("\n\nWith a moan, hollow and deep with longing, unable to even think of warning Loppe that it’s coming, you orgasm right into the laquine’s mouth. Your ejaculate feels like molten magma as it boils up from inside of you, consuming your cock with the most delicious warmth of pure bliss as you splurt gush after gush into your partner. So intense is the feeling - and so eagerly does she suck, lick, and swallow, caressing your cock even as she gulps down each mouthful - that even when the haze clears and you stop cumming, your cock is still rock-hard.");
	output("\n\nLoppe unlatches from you with a ‘pop’. <i>“Thanks for the meal, sugar,”</i> she grins. <i>“Now... I can see you’re still hard, so how about some more fun? Hmm? I’ll be wanting to have some of my own, of course.”</i> She unbends, to rest your wet shaft in her cleavage.");
	output("\n\nUsing her hands and arms, Loppe grinds her soft boobs against your wide, blighted cock, milking a few more dollops of cum from you, slickening her breasts, as well as your saliva-coated prick. You shudder and instinctively thrust your cock into her soft cleavage; her skin against your corrupted cock sends tingles of pleasure rippling through your loins. The half-breed doesn’t stop her ministrations, barely noticing your reaction. All she does is giggle as you continue pumping more of your slick pre all over her breasts. Murmuring and moaning appreciatively, you continue to thrust and grind, eagerly spilling pre-cum all over your herm lover’s cleavage and midriff, though you can’t prevent one sudden spurt from landing right on her face.");
	output("\n\n<i>“All ready!”</i> Loppe declares, letting go of your slick shaft and delivering a parting peck. You wonder what exactly you’re ready for, other than the obvious... it doesn’t stop you from continuing to thrust in anticipation of your second release.");
	output("\n\nLoppe pushes you back onto the bed and straddles you, stroking her equine-prick in order to milk more pre and spread it over her shaft. <i>“It’s time to give this monstrous, infernal prick of yours a ride of its own,”</i> she hums. She aligns her tool with your own, rubbing your slick lengths together as she begins humping. You grind and slide your wet, pre-smeared shaft against hers, groaning and hissing at the sparks of pleasure the slippery friction sends surging into your brain.");
	output("\n\nLoppe pants over you, humping your shaft as she looks deeply into your eyes with a gaze fogged by pleasure. You can feel the warmth emanating from her equine endowment as she leaks copious amounts of pre over your own shaft. With a gasp of surprise and without slowing her rhythm, Loppe cums. Rope after sticky rope of cum splashes across your belly and your monumental milky tits. You squeeze her ass, feeling her tail swishing across your fingers as you grind and rut against her, cock to cock and balls to balls, the delicious friction pushing you over the edge.");
	output("\n\n<i>“Can you see... how much I love... your cock, now?”</i> Loppe asks, panting. Panting right back, you answer her with your eyes as your cock proclaims its love for her, dropping the last dike of resistance and yielding to your overreaching orgasm. The pleasure of cumming fills your addled brain again as you spray your cock-juice all over your lover’s belly, breasts, face and dick, soaking her with every last drop you can dredge up. Your orgasm triggers another of Loppe’s own, and with a groan, she gives you a coating of her own issue. After spewing the last of her load onto you, she collapses and gives you a gooey hug, followed by a slimy kiss on your cheek.");
	output("\n\n<i>“You’re the best, sugar.”</i> You simply nod, too dazed to really listen. She humps you a couple more times, noting your softening member. Giggling, she says, <i>“It’s too early for you to go soft on me, Deez. I still have a lot of appreciation to show you... and I’m sure you still want to show your appreciation for me too. So get ready for round two!”</i> She leers at you, licking her lips in blatant anticipation.");
	output("\n\nWith a wince of equal parts anticipated pleasure and pain, you ready yourself for a long session.");
	processTime(30);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",loppeBJ2,cumNum);
}
public function loppeBJ2(cumNum:Number):void
{
	clearOutput();
	showName("\nLOPPE");
	author("?? CoC ??");
	output("One hour and many orgasms later...");
	output("\n\nLoppe screams as she cums one last time, sprinkling you in white again. Finally spent, she collapses atop you. <i>“I guess that was enough appreciation, right sugar? I mean... I love you and your cock so much that I bet I could draw a couple more loads of appreciation if you really wanted,”</i> she pants, smiling at you. You just shake your head, barely able to see Loppe’s face - a quick wipe with your hand removes the worst of the caked-on semen (yours, hers, you can’t tell whose) from your face.");
	output("\n\n<i>“You sure?”</i> she asks, giggling. <i>“Alright then... my cock feels so sensitive I’d probably end up appreciating you right away, anyways, and there’s no fun in that, right? How about a nap instead?”</i> Without a word in reply, you lie back and closing your eyes. You think you feel Loppe snuggle up against you, but you fall asleep too quickly to be sure.");
	processTime(60);
	cumNum += pc.cumQ() * 3;
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",loppeBJ3,cumNum);
}
public function loppeBJ3(cumNum:Number):void
{
	clearOutput();
	showName("\nLOPPE");
	author("?? CoC ??");
	output("Two hours later...");
	output("\n\nA familiar feeling emanates from your crotch... a distinct sucking and bobbing feeling. Your eyes open and you awaken with a gasp as you blast a fresh batch of cum into Loppe’s eager mouth. She withdraws with a slurp and smiles gleefully at you. <i>“Morning, sleepyhead! Rest well? Want me to wake you up some more?”</i> she asks, licking her lips. <i>“I placed your stuff on the chair over there. And don’t worry, it’s all cleaned too. See you later on? For more ‘appreciation’, of course...”</i>");
	processTime(60);
	cumNum += pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum)
}


//Anal
public function loppeAnal():void
{
	clearOutput();
	showName("\nLOPPE");
	author("?? CoC ??");
	output("You swallow as your eyes are drawn to the equine sausage jutting out between the bunny-girl’s legs, and know you just have to have it. Slowly, you spread yourself upon Loppe’s bed, scooting up toward the head and pillows and kneeling, full, toned butt in the air, inviting the laquine to do with you as she will.");
	output("\n\nLoppe giggles. <i>“So you want it that way, huh? You sure about this, sugar?”</i>");
	output("\n\nYou nod your head, still silent, letting her take her cue from your actions. <i>“Okay then, let’s get you prepped up first.”</i> Loppe insists, moving to her closet. She opens it and looks around. <i>“Hmm... aha!”</i> Your lover triumphantly lifts a rather large bottle containing a strange bluish liquid, the label sporting a design featuring an extremely well-hung, happy looking herm with an erection. <i>“Good old lubrication!”</i>");
	output("\n\nNow, why do you suppose she has that handy? Loppe blushes a bit and giggles. <i>“Well, a girl has her kinks, sugar. So it pays to be ready... anyways, you’re one to talk, crawling onto my bed and lifting that cute butt up for me.”</i>");
	output("\n\nLoppe moves back towards the bed and gently places the vial beside you. <i>“Since you’re so eager for this, you may do the honors.”</i> She crosses her arms and stands beside the bed, waiting for you to get started; her cock looks painfully erect and throbs visibly.");
	output("\n\nYou look at her, finding it a little hard to believe that she doesn’t want to do this herself. Still, you pick up the bottle of lube and examine it.");
	output("\n\nSquirting a good measure of the lube into your hands, rolling the thick, sticky, creamy liquid around in your palms, you bend to start massaging it into your ass, worming it into the crack. That’s cold! You shiver, but stubbornly continue the massage, getting your ass nice and slick, gently inserting lube-coated fingers to stretch it a little in preparation for Loppe’s horse-meat sausage.");
	output("\n\n<i>“Sorry to interrupt sugar... but that was meant for me, not for you. I was hoping to feel your slick hands on this bad boy.”</i> She waggles her prick at you; the half-formed flare bobs and weaves through the air.");
	output("\n\nYou give her a look of feigned sorrow at your mistake, but promptly apply some lube to your hands and motion her to the bedside. When she draws close, erection proudly jabbing towards you, you reach out and clasp your slippery hands around its impressive girth; Loppe squeals softly. <i>“That’s cold!”</i> she says, shivering from the sensation. You just smile up at her and begin to stroke her shaft. Up and down, back and forth, gently twisting your hands around to ensure a nice, even cover across her length. You grip tightly, pulling in smooth, steady jerks with each pump of your limbs, the lube helping you to slide forward and back. Loppe moans and smiles at you. <i>“That feels great, sugar - keep going!”</i>");
	output("\n\nThe head of her horse-like cock is starting to swell out into its distinctive flare, perfect for stroking all sides of the orifice lucky enough to accept it. You begin to massage the lube into the engorging flesh, rolling your fingers teasingly over the cumslit. Your hands, still with a considerable amount of lube on them, find their way back down her length to the opposite end. There her balls lie, proud and swollen with the hot laquine cream she’ll soon be trying to pour into your belly, and under them lies her pussy, already growing damp from the stimulation you’re giving her. You begin to squeeze and knead both; her balls get the attention of one hand while the other slips into her pussy and starts gently probing into its hot, tight, slick depths.");
	output("\n\nLoppe gasps in pleasure. <i>“H-hey, sugar, what are you doing? That place doesn’t need to be lubed.”</i>");
	output("\n\nYou give her your most mischievous smile and promptly give her balls a playful squeeze. The bunny-stallion moans hoarsely, precum welling up from her flared head and noisily dripping with a soft splat onto the floor. You release her shaft and reposition yourself on her bed as you were originally were, telling her that you think she’s ready to go.");
	output("\n\nLoppe pants and smiles at you. <i>“Now you’ve done it... you got me really going now, so get ready. I’ll give you a ride you won’t forget anytime soon!”</i> your lover hurriedly snatches the vial of lube and puts it away, then literally pounces on your elevated butt and aligns the tip with your moist rosebud.");
	output("\n\nLoppe presses her flared head against your full ass and gasps in surprise as her tip all but glides inside without a hitch. You croon in delight at the welcome feeling of cock up your trained ass once more. <i>“Whoa, sugar. I can see you really enjoy some butt-fun.”</i>");
	output("\n\nHaving an enormous cock and a libido as large as she claims, you would think she’d be pretty used to stimulating herself with a little ass-play as well. <i>“Of course I do, once in a while, but I’m not nearly as loose as you are. But I won’t lie and say this doesn’t feel good; it’s like a moist little pussy...”</i> Loppe retorts.");
	output("\n\nWell, in that case, surely Loppe knows what to do. You push back against her, sliding several more inches into yourself, and Loppe giggles. <i>“Of course I do, sugar.”</i> She bucks her hips into you, quickly hilting herself within your gaping, accommodating ass. You gasp in pleasure and surprise as you suddenly find yourself filled with Loppe’s equine-prick, moaning audibly as Loppe settles inside you, and turn to smile at her, eager to see what she can do once she really gets going.");
	output("\n\nLoppe grabs your waspish thighs, leaning over your back to whisper into your ear. <i>“Should I get started, sugar? Or do you want me to wait while you get used to me?”</i>");
	output("\n\nShivering around the horse-cock spearing your tingling ass, you grind back against your hermaphrodite lover in physical encouragement, impatient with desire. Loppe giggles, amused by your reactions.");
	output("\n\nYou moan as Loppe quickly pulls out, leaving you with a feeling of uncomfortable emptiness; but soon she thrusts herself back inside, filling you up once more. She initially sets upon a slow, long rhythm but quickly speeds up as your moans and gasps of pleasure encourage her to go further. <i>“How is it, sugar? It feels pretty good back here,”</i> Loppe pants, humping you. You simply nod, groaning softly at the sensations filling you, cocks dripping pre and pussy oozing femlube... you beg her to go faster, to do it harder!");
	output("\n\nLoppe happily complies, thrusting herself deeper and stronger. One of her hands reaches around to grasp your pre-slickned corrupted cock, stroking you in time with her thrusts. Wet slapping noises fill the room, and you gasp in pleasure each time her cum-churning balls slap against yours. Loppe lays down on top of you, panting hotly on your neck, moaning in pleasure each time your sphincter contracts.");
	output("\n\nWith a groan, she jams herself as far in as she can, grasping your flared thighs tightly. You can feel her balls churning against your butt, her throbbing dick seemingly growing fatter as cum travels up her urethra; finally, with a moan, she explodes inside you, filling you up with hot laquine cream. You gasp and shudder as shot after shot of herm-spunk rushes in; you’d almost swear you can hear it slurping and splashing as it cascades into your belly, and you’re positive you can feel your stomach start to distend from the glutinous mass of semen building up inside of you. You struggle to hold back your own orgasm but finally lose the battle, crying out as it rocks through you. A gush of sexual fluids from your crotch completely soaks the bed-linen under you.");
	output("\n\nWith a hollow, ragged moan you collapse face down into the pillow, falling flat on your stretched stomach. You nuzzle into the bed linen, feeling Loppe’s comforting weight on your back, and make soft sounds of appreciation. Loppe kisses the back of your neck, dreamily cooing, <i>“I’m glad you liked it, sugar. Your ass feels so good... I wouldn’t mind doing this again. In fact, that sounds good.”</i> You barely have time to protest as she begins humping you once more, her shaft throbbing and hardening once more as she gets her second wind.");
	output("\n\nYou realize she’s not going to take no for an answer; clenching the bedding between your fingers, you ready yourself for whatever she has in mind...");
	output("\n\nOne hour and some orgasms later...");
	output("\n\n<i>“Ahhh... that was great. My balls feel completely dried out. I loved it!”</i> Loppe rolls over to the side, pulling out of your well-used asshole with a wet slurp; her cock is closely followed by a veritable cascade of white spunk.");
	output("\n\nYou simply moan incoherently, your brain too fizzed with exhaustion and pleasure to form sentences, leaving you to just lay there and slosh on your impossibly swollen belly. Utterly bloated, you can’t even bring yourself to react. You try to muster something to reply to her just the same, but all you dredge up is a heavily spunk-scented belch, the thick, salty tang of cum flooding your tongue.");
	output("\n\n<i>“Sugar? Are you okay?”</i> Loppe asks worriedly. You cough and spit up a gobbet of cum. Loppe must have really enjoyed herself to fill you this full. You stifle another belch and more spunk drips from your lips. Loppe smiles nervously. <i>“Whoops... I guess I got a little carried away.”</i>");
	output("\n\nStill... it was definitely an interesting ride. <i>“Aw, sugar, I’m sure it’s not that bad.”</i> She gives your chiseled ass a playful swat, prompting a jet of spunk to spill from your abused ass, and bites her lip apologetically.");
	output("\n\nYou run your hands over your distended abdomen... you wouldn’t be surprised if she got you pregnant despite this being the wrong hole.");
	output("\n\n<i>“Now you’re just being silly; I’m not that virile... nobody’s that virile.”</i> The laquine pouts, clearly upset. You laugh softly; hopefully she’ll never have to meet the creature that dispelled that same doubt in you. <i>“I think this is time for sleeping, not joking.”</i> With a trace of wounded dignity, she lays herself down and curls into your back, one arm wrapped around your gurgling belly.");
	output("\n\nEven if you wanted to get out now, you doubt you could with her arm and the dead weight of her deposit. Sighing, you relax next to the petulant half-breed and let sleep claim you...");
	processTime(30);
	var cumNum:Number = pc.cumQ() * 3;
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",loppeAnal2,cumNum);
}

public function loppeAnal2(cumNum:Number):void
{
	clearOutput();
	showName("\nLOPPE");
	author("?? CoC ??");
	output("Two hours later...");
	output("\n\nSomething wiggles inside your maw, exploring every little bit of it. It feels warm... you move your tongue to try and trap this pleasant invader and taste something strange... with a start, you realize it tastes like the cum you burped up earlier, and your stomach heaves a bit. Opening your eyes reveals Loppe’s own; the laquine is lying down on top of you, kissing you deeply to try and lick your mouth clean of her own cum. She smiles at you with her eyes but doesn’t break away, scooping up as much cum as she can from your mouth, sucking on your tongue to try and replace the taste of cum with the taste of her saliva.");
	output("\n\nFinally satisfied, she pulls away, a thin strand of saliva linking her lips to your own. <i>“Are you alright, sugar? Want me to get you something to eat?”</i> Loppe offers.");
	output("\n\nYou think it over, then shake your head. No, you feel too queasy still to really eat anything for a while yet.");
	output("\n\nLoppe draws you into a short kiss. <i>“Sorry... but you know how much I like sex, and you’re really cute too. It’s kinda hard to control myself.”</i> She smiles seductively at you. <i>“Then again, maybe I could just fuck you into staying here with me - that way you wouldn’t have to bother leaving and coming back.”</i>");
	output("\n\nShe continues elaborating despite the look you give her. <i>“Room and board won’t be a problem; I could just double my dancing shifts and I’d have enough saved up to keep you. Feeding, either... I can just stuff you myself.”</i> She grins wickedly, obviously enjoying the mental image.");
	output("\n\n<i>“Anyways, I cleaned your clothes,”</i> she suddenly declares, obviously changing the subject. Loppe gets out of the bed to go and get your clothes. You take this opportunity to slip out between the sheets; while your belly is still swollen enough to look like a full-term mother’s-to-be, you’ve shrunk down considerably. Looking around, you see that Loppe has somehow managed to clean the linens and the floor of the mess that the two of you made... well, really, it was mostly her mess, seeing as how virtually everything pumped out was pumped into you, by her.");
	output("\n\nLoppe returns with your full platemail in hand. <i>“Here you go, sugar,”</i> she says, presenting them, then adds, <i>“Err... you might want to get a bath before putting these on... would you like me to heat some water for you?”</i>");
	output("\n\nA quick hot bath would do wonders. Especially for helping you, ah, clear some backlog. Loppe looks mischievous when you answer in the affirmative. <i>“As much as I might love to join you, I’d best let you bathe alone; we don’t want this to happen again.”</i> She taps on your pregnant-looking belly. <i>“I don’t think I’d be able to help myself if we were to enter a tight little tub together.”</i>");
	output("\n\nLoppe blushes when she sees your expression and looks down; you follow her eyes and, sure enough, her equine member is slowly growing back to full erection again. You stare at her in disbelief, to which she shrugs casually. <i>“I can’t help it. You’re hot.”</i>");
	output("\n\nOne bath later...");
	output("\n\nFeeling clean and refreshed, not to mention much lighter, you leave Loppe’s bathroom with a thank-you. The girl laughs nervously. <i>“Again, sorry about that, sugar. Anyways, I’m in need of a bath of my own.”</i>");
	processTime(120);
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

//Heckel
public function heckelScene():void
{
	clearOutput();
	showName("\nHECKEL");
	author("?? CoC ??");
	output("As you approach the edge of the track, the hyena comes around the bend towards you. Her fur is a light brown mottled with spots of dark brown and black, with a thicker and longer black mane passing for hair. You get a good view of her B-cup breasts bouncing inside her shirt, black workout bra straps sticking out on her shoulders. She has simple black shorts on that hug her firm ass, and you can’t help but admire her toned legs as they move beneath her. As she stops running and turns toward you, you see something else entirely bouncing around in her groin. Her body reminds you of a coiled spring, too much power and tension in too small a frame.");
	output("\n\nWhen she draws up to you, she slows down long enough to have a conversation. She smiles at you with a grin that manages to show every single fang, and you realize she caught you staring. <i>“Fresh meat, huh? I’m Heckel, the alpha dog around here.”</i> She extends a large paw toward you as she wipes her face. You ignore the sweat as you shake hands and introduce yourself.");
	output("\n\n<i>“So, Deez, what can I do for you? The person working the desk can give you a tour if that’s what you need... or maybe you were looking for a training partner? If you can keep up with me, of course.”</i>");
	output("\n\nYou tell Heckel that you’re looking for a training partner, and she makes no attempt to hide her gaze as she looks you up and down. When she’s finished, her unsettling grin returns. <i>“Excellent! Let me just get cleaned up and we’ll start with some stretches.”</i>");
	output("\n\nYou follow her towards the changing rooms, which are built into the wall like large shower stalls near the actual showers. There is a larger locker room connecting them and the showers, making you pause. It takes you a moment to realize that in a place where genders are so blurred, separating showers by genitalia is apparently impossible. The locker room is unisex, and by the time you figure that out and walk in your guide has already disappeared. A moment later, you hear the sound of a shower from around the corner.");
	output("\n\nYou wander down the rows of aisles, but the room appears to be deserted. Either the gym isn’t doing as well as you thought, or this isn’t a popular time to work out in Tel’Adre. You barely finish walking into sight of the showers when the nozzle shuts off. A moment later, Heckel walks out with a towel around her torso, her mouth splitting into a grin at the sight of you. Her fur is matted down from the shower, and with every step you can see the movement of her toned muscles across her body. Her fur is so short that it starts springing back to normal even as she approaches you, but you can see her muscles move under her skin even still.");
	output("\n\nShe walks past you with a sway in her step and sits on a bench behind you. With a shrug of her shoulders, she lets the towel fall down and reveal her body fully. She doesn’t seem as tall sitting down, but you’d still guess that she’s a bit over six feet. Her brown fur is mottled with black all over her body, except for a white square above and between her breasts. Her breasts themselves are large B-cups, with black areolas surrounding pert nipples. She leans back and spreads her legs, revealing her equipment fully.");
	output("\n\nA black cock hangs half erect between her legs, a pair of fist-sized testes underneath. Fully erect, you estimate her dong would be around ten inches long; large, but fitting for her lithe body. It grows a little stiffer as you stare down at it, and it isn’t until Heckel starts cackling that you realize how long you’ve been staring.");
	output("\n\n<i>“Like what you see?”</i> she asks, looking you up and down. <i>“‘Cause I like what I see. It’s not every day I get someone as fit as you brave enough to partner up with me. Come on then fresh meat, every newbie has to start at the bottom.”</i> She tilts her head towards her hardening member and raises an eyebrow.");
	output("\n\nYou feel pretty strong yourself, and you realize you could probably arm wrestle this hyena-bitch down to size.");
	processTime(30);
	pc.lust(10);
	clearMenu();
	addButton(0,"Suck Her",heckelGetsSucked);
	addButton(1,"Catch Anal",heckelAnalScene);
	addButton(2,"TopTheDog",heckelTopDog);
}

public function heckelGetsSucked():void
{
	clearOutput();
	showName("\nHECKEL");
	author("?? CoC ??");
	output("You walk over to Heckel and fall to your knees, already licking your lips. Heckel throws her head back in a barking laugh as she scoots forward, one paw coming around the back of your head. Without needing further encouragement, you grab the flaccid dog cock and give it an experimental pump.");
	output("\n\nYou can feel the blood flowing beneath your fingers as your hand works, the black shaft growing firmer and bigger in your grasp. You lean in for a lick from base to tip, and it feels unexpectedly rough on your tongue with the smell of the savanna. Before you can fall into another staring trance with it, you open your mouth and take the head in.");
	output("\n\nHeckel gasps above you in the most feminine sound you’ve heard from her yet, and you’re awarded with a salty drop of pre. You start working your tongue around her point immediately, the dog cock becoming fully erect in your mouth. You look down your nose at the furry crotch beneath you and realize that your estimates of ten inches were definitely on the short side, and with a deep breath through your nose you begin to swallow her cock.");
	output("\n\nThe first inch hits the back of your throat, but your practiced gag reflex keeps you from reacting. Heckel’s paw begins moving through your obscenely long, black and white spotted goo-hair, massaging you subconsciously. You force your head down another two inches as your throat opens around her head, but not before it deposits another spurt of pre-cum. Your tongue continues to massage the underside of her cock as you try not to gag, but the paw on the back of your head has already begun pressing you down further.");
	output("\n\nYou take another inch into your throat before pulling off. Heckel growls above you until you lower your head again, this time further than before. Her growl becomes a moan instantly as the paw on your head is joined by another, both gripping your hair together. As you raise and lower your head, the furry balls in front of you begin to swing back and forth with Heckel’s small thrusts, and you reach out a hand to fondle them.");
	output("\n\nAs you fondle her balls, your fingers graze over something wet behind them. If you could smile around the mouthful of doggy-dick, you definitely would. You’ve discovered that Heckel is definitely a herm, and you make sure to give her gash another graze as you bob your head down. The head of her cock pulses as you take her length deeper than you had before, and the hands in your hair tighten their grip as Heckel rises from her seat suddenly. You lose pace at this sudden change, and the position forces you to look up at her face.");
	output("\n\nYou look up her body at her scowling face, wondering what you did wrong. <i>“None of that, little meat. I’m top dog here, which means you don’t go near there. But if you keep sucking this well, I might just let you keep that hand.”</i> Heckel clearly isn’t amused, but she hasn’t pulled you away either. Whether from her threat or your lust, you aren’t about to let this hard cock out of your mouth any time soon anyway. Your next bob is echoed by a thrust from Heckel, as is the next and the next after that. Her thrusts start coming faster than your head can keep up, and then her hands in your obscenely long, black and white spotted goo-mane tighten their grip to hold your mouth in place. Before you know it she’s fucking your throat more than you’re giving her head. All you can do is watch her furry groin and stomach pumping towards you, and you have ample time to watch a knot start forming at the base of her dick. Your eyes begin to tear up as her cock pushes your throat open again and again, her thrusts getting faster and faster. It’s all you can do to keep one hand stroking her shaft without gagging on her dick.");
	output("\n\nYou let your eyes close as you focus on not gagging, but open them wide when something else presses against your lips. It takes you a moment to realize that her knot is pushing at the entrance to your mouth as Heckel grunts above you, her thrusts coming faster and faster. You look up at her in alarm, and she barks out a laugh from above her swaying breasts. <i>“What? What did you think I meant by stretch?”</i> Her voice wavers as her cock spasms, shooting another spurt of pre into your throat.");
	output("\n\nBefore you can start thinking of a way out of the situation, she growls loudly above you. Her hands grip the back of your head and pull you towards her, burying your face in wet fur and her knot in your mouth. You feel her lean over you as your vision goes dark, your entire face buried in the fur of her groin. Her entire cock seems to flex inside you as her hips thrust forward, and a moment later you feel a burning heat travelling down your throat. Your hands go to the ground to steady yourself as she pulls herself suddenly away, her dick pulling out of your gullet with a long slurp and giving you a chance to breathe clearly again. You barely get one breath in before you realize that she’s still cumming, and a thick stream of jism lands across your face and into your open mouth as she paws herself off the rest of the way. Unable to do anything else at this point, you simply fall back onto your shapely, chiseled butt and let her cum across your face two more times, her tongue lolling out of her mouth as she finishes.");
	output("\n\nWhen she’s finally emptied herself on your face, she falls down onto the bench in front of you. Before you can say anything, she extends a paw and ruffles your semen-streaked hair. <i>“Heh, not bad fresh meat. If you can learn your place on the food chain here, we might have a beautiful partnership ahead of us. If you still think you can keep up, that is.”</i> She winks at you as she stands again, tossing you her towel from earlier as she heads towards the showers.");
	processTime(40);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,0);
}

//Anal
public function heckelAnalScene():void
{
	clearOutput();
	showName("\nHECKEL");
	author("?? CoC ??");
	output("Heckel’s eyes flash as her grin splits her face, and for just a moment you wonder if this might have been a bad idea. Before you can object, however, she’s pushing you down onto your stomach, your arms and legs draped over either side of the wooden bench.");
	output("\n\nYou half expect her to just shove herself in right there, but she thankfully holds off. Instead, you feel her rough paws grab and knead either side of your full ass as she lets out a low growl. <i>“Damn Deez, you’ve got one hell of an ass. I bet it’s gonna feel even better than it looks.”</i>");
	output("\n\nOne hand releases your full derriere and you can hear the sound of her stroking herself. You start to turn your head around to watch, but she firmly presses you back down against the bench. <i>“Now now partner, I told you to stay there. When you’re the alpha dog around here, then you can make the rules.”</i> Deciding this treatment isn’t so bad anyway, you relax and let her hand continue to knead your muscular, hand-filling rump.");
	output("\n\nThe sound of her stroking stops, and you bite your lower lip. You feel the bench shift beneath you as she changes position, and a moment later she pulls both of your asscheeks apart to expose your butthole. You tense for the inevitable penetration, but instead of a hard cockhead poking at your backdoor you feel something warm and wet. Heckel is licking you!");
	output("\n\nHer large tongue feels like sandpaper as it licks up and down your anus, your spread cheeks exposing you to the world. You can feel her wet nose on your sensitive skin, and the contrast with her warm tongue makes you shiver. Her tongue pokes and prods at your ass before slipping painlessly in, swirling expertly around before pulling out and licking some more.");
	output("\n\nOne of your demonic dongs is trapped between you and the wooden bench, and you know Heckel won’t let you shift position to free it. Your slavering pussy is also being ignored, and having so much pleasure with so little stimulation is driving you crazy. You hump weakly up and down, trying to draw some pleasure out of the bench beneath you while simultaneously pushing her rolling and massaging tongue closer to your aching slit, but she ignores you and only licks deeper. She buries her face in your ass entirely, her cold nose and teeth rubbing up against your sensitive skin as her tongue pushes as far inside of you as she can get it.");
	output("\n\nEven with only a few inches inside your ass, her tongue makes you moan almost immediately. She rolls in back and forth, then side to side, then pushes it in and out before starting the cycle over. The teasing becomes more and more unbearable until you’re ready to abandon caution and begin masturbating, but just as you tense to change position she stops and pulls her tongue out suddenly.");
	output("\n\nHer legs bump against yours as she pulls herself up, the contact sending shivers through your sensitive body. <i>“Even better than I thought,”</i> she mumbles as you hear the sound of her stroking herself. Before the wetness around your ass can dry up, you feel something hard and slightly pointed poking the entrance of your backdoor.");
	output("\n\nYou open your mouth to gasp as she slides into you, but no sounds come out. You can feel inch after inch penetrate you, your asshole slowly stretching to accommodate her increasing thickness. She pushes as much as she can into you before pulling back slightly, then humping lightly as she works the rest in little by little.");
	output("\n\nAs more and more doggie dick is pushed into your ass, you find your estimations of her size more and more ridiculous. There has to be an entire foot of cock in you already, but she’s still going! When she does finally bottom out, your mind reels at the impossibility. Her dick must grow the longer she stays aroused, because she’s at least 15 inches right now! The base of her dick stretches your ass painfully open, and she gives you a moment to adjust to it.");
	output("\n\nJust as the sting begins to fade, she draws herself out to the tip in one motion. You bite your lip in anticipation, but you still moan like a whore when she slams all 15 inches back into you. She draws back before pounding your backdoor again, making your muscular, hand-filling ass shake with the impact.");
	output("\n\nAlthough one of your infernal pricks is trapped beneath you, Heckel’s balls slap into your cunt with every one of her quickening thrusts. Although neither your bundle of distended, bumpy demon-dicks or fuck-hole are getting much stimulation, your prostate is being milked better than it ever has. One thrust in particular makes you cry out, and Heckel laughs above you as she slams her furry thighs into yours again. <i>“You moan like a whore, Deez, a perfect bitch for me to ride.”</i>");
	output("\n\nYou don’t bother to protest your indignation as she pushes her canine dick into you again, opening your ass farther than you thought possible. You’re sure you could see the outline of her cock from your stomach if you weren’t being pinned beneath her. Heckel pauses in her deliberate thrusts to lean over you, mashing her breasts across your back as she brings her mouth to your ear. <i>“I’m going to ride your ass like you wish you could ride me,”</i> she whispers into your ear. You can’t help but shiver as she adjusts herself before resuming her pounding, drawing small gasps from you with every thrust.");
	output("\n\nHer thrusts become faster and shorter as she leaves more of her cock buried inside of you, jackhammering your hole with her last few inches. Something even bigger begins to press against your ass as you hear her breathing become faster, her tongue lolling out of her mouth. You forgot about her knot! She doesn’t let up her speed as she pushes it a little further with every thrust, and you don’t want to think of how big it must be by now if it grew along with her dick size. She doesn’t seem deterred however, and all you can do is grunt in pain as it pushes itself further and further.");
	output("\n\nHeckel suddenly freezes up and bites down on your shoulder, throwing her hips forward. Her knot pushes against your backdoor as she tries to force it in, but your ass just won’t expand that much. She growls and pushes again, making you yelp as it spreads you even further. It feels like she’s shoving a melon up there! She growls even louder and bites down harder, and you can feel her dick flare inside you as her knot pushes you further and further apart. You cry out as it passes the midway point, your ass sucking the knot up greedily and contracting around the other side.");
	output("\n\nHeckel wastes no time before going back to her brutal fucking, though her thrusts are limited to short bursts now. She makes up for this in speed as you lie helplessly below her, the pain of taking her knot slowly turning into intense pleasure. The heat and pleasure spreads from your ass to your entire groin, and the knot pushes against the walls of your vagina hard enough to make them rub against each other. Heckel cries out above you and slams her hips into you as much as she can, and you immediately feel a burning heat shooting up your gut. She pumps again as she seeds your insides with another spurt, and this time you orgasm along with her. Your cunt spasms and gushes over your soaked legs, your asshole spasming around her cock just as much. Your wriggling bunch of wide, demonic cocks soon follows, shooting your own seed up between your back-breaking tits and coating your stomach. Even as your orgasm begins to taper off, you can do little more than lie panting in a pool of your own spunk. Your legs quiver beneath hers as the warmth spreads further up your gut, leading you into a warm and hazy afterglow.");
	output("\n\nAs your orgasm fades, you turn your head to look at your workout partner. Heckel has completely collapsed across your back, her head leaning against your own. A distinct snore comes from her mouth, and you can’t help but laugh. For all her bluster, it looks like you worked her harder than she worked you! With her knot stuck in you, it’s probably going to be awhile before you can go anywhere anyway, so you lay your head down on the bench and enjoy the feeling of fullness her softly pulsing dick gives you.");
	output("\n\nWhen you awaken, several hours have passed and Heckel is still asleep on top of you. You’re sure that someone else must have wandered into the locker room by now, but there doesn’t seem to be anyone there at the moment. You shake your partner awake and she pulls her now flaccid cock from your ass, no small amount of cum following it out.");
	output("\n\nYou lay on the bench for a few moments as Heckel ruffles your hair again. <i>“Not bad, partner. You’re the best fuck I’ve had in years, you know that? Not to mention the best workout!”</i>");
	output("\n\nShe laughs as she stands and heads for the shower, letting you clean yourself up and head back to camp.");
	processTime(40);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

//Top Dog
public function heckelTopDog():void
{
	clearOutput();
	showName("\nHECKEL");
	author("?? CoC ??");
	output("Smirking, you fold your arms and tell her to bend over - there’s a new top dog just waiting to claim the town bitch. Heckel snorts, <i>“Nice try, fuck-meat, but I’m always on top. If you want a squealing submissive to ride, the Wet Bitch is that way,”</i> pointing towards the exit. Her flaccid dog-dong twitches a little but remains defiantly soft.");
	output("\n\nYou step closer her body, admiring the shapely curve of her muscles beneath her sweat-matted fur. Heckel’s nipples perk up at your close proximity and gently come to rest against your monumental milk-udders once you invade her personal space. She doesn’t take a single step back, and you suggest, <i>“Some top dog. Wanna bet your ass?”</i>");
	output("\n\nHeckel retorts, <i>“You gonna bet yours?”</i> Her tough finger-tip slams into your solar plexus for emphasis.");
	output("\n\nOf course, with Heckel around you knew you’d be risking your ass, but at least now you’re going to get a shot at hers. You nod at the surprised hyena herm in acceptance of her wager and suggest the most obvious way to settle just who runs this gym - an arm wrestling contest.");
	output("\n\nThe spotted muscle-girl snarls, <i>“You’re on!”</i> She knocks some water bottles off a nearby table and positions herself to one side, slamming her elbow down carelessly. <i>“This is going to make pounding your ass that much sweeter, Deez.”</i> Breathing heavily now, Heckel looks to you expectantly. Her mighty she-cock, half-hidden by the table begins to strain upward, hardening with eager anticipation.");
	output("\n\nYou flash a cocky grin of your own and seat yourself across from her, making sure to flash your cluster of wide, bumpy demon-dicks in her direction as you sit down. <i>“Just making sure you know what you’re getting yourself into,”</i> you taunt. The tabletop is made from thick, lacquered wood that squeaks when your elbow comes to rest on the polished surface. You clench your fist and flex your arm, displaying your muscles to your foe, and Heckel does likewise, her powerful body rippling beneath her furry skin, tendons taut and visible. <i>“Is my little bitch afraid?”</i> you ask.");
	output("\n\n<i>“Never!”</i> the powerful hyena retorts, clasping your palm with hers. You can feel the barely restrained potential energy in her grip. She says, <i>“On three. One, two... THREE!”</i> An avalanche of tension comes down across your forearm, but you throw your own considerable might into it, stopping your knuckles a half-inch off the table’s surface. Matched muscle to muscle, you look the hyena in the eye. On each side of the table your free hands grab the edge for stability, squeezing so hard you swear you can hear the wood splintering. Inexorably, you turn the tide, slowly bending Heckel’s arm back. Nearly lost, the hyena catches a second wind and holds you there, arm shaking. Her eyes are desperate and wide, her pupils tiny, focused pinpricks. She grunts and groans as she struggles as hard she can, but you push harder, and press her knuckles against the woodgrain.");
	output("\n\nHeckel lets go of your palm, staring at her hand in disbelief. <i>“You... you beat me...”</i>");
	output("\n\nTime to claim your prize...");
	output("\n\nYou casually rise and circle round the table. Before she can react, you dexterously slip your hands down to Heckel’s sculpted, furry backside and lift her high, easily flipping her up onto the wooden surface. The muscle-herm grunts softly as she comes to rest upon the polished wood, her flopping dog-cock already starting to thicken with the telltale engorgement of oncoming arousal. Smirking, you gently prod at the growing knot and tease her - she might be an avowed dom, but her dick seems excited by the prospect of sex on any terms.");

	output("\n\nHeckel protests, <i>“Please; just because my body is looking for a fuck doesn’t mean I want to be your bottom bitch.”</i>");
	output("\n\nYou flick one of her fuzz-shrouded balls and laugh, <i>“You could’ve fooled me.”</i> The hyena-girl begins a new protest, but before it can leave her mouth, you dip lower to her lube-moistened cunt and tweak her hidden clit. Her voice goes from griping to whorish moan in a flash, rising in volume until you’re sure someone must hear. You grin and blush hotly, imagining the whole of the gym watching you fuck this hyena, their watchful eyes exciting you further. Never stopping their probing motions, your fingertips dance through the hyena’s sopping passageway, caressing the underswell of her virile nutsack, and occasionally brush the sensitive fur along her inner thighs. Heckel is squirming and writhing atop the table, dominated by the mere twitches of your digits, a panting bitch in heat just begging for rough impalement on each of your perverse peckers.");
	output("\n\nStepping to the side but never leaving the hyena’s arousal-engorged box empty, you flop your distended, blighted cock across her nose, fanning the others across her neck and forehead, burying her in penis. She whimpers as you rub your sensitive underside across her nose and pouting lips, looking up at you with what you imagine was supposed to be hatred. It looks like lust instead. Slowly stroking yourself while you diddle her, your manhoods throb and thicken further, too turned on to stop even if you wanted to. You command her to open with a terse word. She does, and you slide inside.");
	output("\n\nHeckel’s mouth is a hot, wet cavern of fleshly delight for your infernal prick, and an involuntary tremble of bliss travels through your swollen meat, depositing a single drop of pre-cum onto the muscle-girl’s tongue. Her body wriggles happily in acceptance, twitching around your knuckles. A nice, sticky puddle of her own pre has formed on her well-defined abdominals, still connected to its spigot by a web of glittering, translucent love-juice. Whimpering, Heckel fairly hums with need, the vibrations of her hungry protests bouncing through your cursed cock pleasantly.");
	output("\n\nPulling your fingers out of her oozing, cock-hungry snatch, you wipe her drippings off on one of her rigid, clenched thighs. The fur makes her good for a towel, if nothing else. Her whimpers rise in pitch and frequency, turning her lusty mouth into a snug, cock-sucking vibrator. You cannot take such pleasure without giving into your own baser instincts. Grabbing hold of the back of her head in a two-handed grip, you piston your waspish thighs forward to jam as much of it as possible down her throat. Heckel’s eyes bulge in disbelief, wildly looking left and right. Her teeth come down, just barely pricking the skin of your towering, cursed cock in warning. You twist her nipple in a retaliatory strike, opening her throat up with a moaning shriek.");
	output("\n\nYou savor the sensation a bit, but ultimately withdraw. Your unholy cock glistens with spit and mucus, leaking heady flows of pre-cum on Heckel’s exhausted muzzle. She coughs and gasps, whimpering and moaning in between. You make sure to wipe most of it off on her forehead, smearing the saliva and cock-juice to mark her as your bitch.");
	output("\n\nThe muscular woman tries to lurch off the table, but you growl and pin her in place with your superior strength. She fights and snarls, spitting and hissing like a wild snake. It takes most of your considerable power to hold her still, and only after she discovers her utter helplessness before you does she slump down in acceptance. Hissing through her teeth, she exhales, <i>“Quit teasing me and fuck me already...”</i>");
	output("\n\n<i>“What’s that? I didn’t hear you,”</i> you answer, <i>“You’ll have to speak up.”</i>");
	output("\n\nHeckel whimpers pleadingly, jostling her hips in your direction, still leaking and dripping all over the strong table. Gone is the woman obsessed with taking you; in her place is a whiny, sultry bitch begging to be fucked. You let her go and flick her cock, commenting, <i>“No need for this little puppy-prick to get anything.”</i> Then, without any further teasing, you mount the table and your new muscle-slut all in one motion. The heat from her mons washes over one of your demonic cocks like the air from a salacious furnace, basting your quartette of basketball-sized testicles with her steaming warmth. You give her a knowing smile, ‘woman’ to woman, and rock forward, sliding through her puffy labia and into her silky canal. Those wet hyena-lips cling to every vein and rigid nook of your blighted cock, slurping your penis down the slick tunnel with hungry undulations.");
	output("\n\nAs soon as you finish your slow glide into that wondrous passage, you drop forward over your prize to look her in the eyes, admiring the smears of cock-cream you dripped and wiped over her muzzle. Her pouty black lips are trembling, and inspired by the exquisite sensations migrating through your distended, infernal prick, you kiss her, not as her lover but as her owner. You ply her mouth with brutal, forceful kisses, raping her lips with your tongue, twining it around her own as you pillage her confused visage with a bruisingly rough french. Her animal-like ears quickly begin to twitch, and her back arches, pressing her nipples into your breasts as she sensually writhes beneath you.");
	output("\n\nYou reach down to crudely grope at her perky tits, squeezing the soft mounds in your fingers as you take her completely, your hips bouncing atop hers hard enough to shake the table. The whole structure rocks slightly, rattling against the wall with loud knocks. You pound her pussy hard, her useless balls jostle uncomfortably, passing momentary glimpses of displeasure through her sex-fueled rictus. Her pre-spunk, which coated her toned abs long ago, has puddled up to such a degree that it’s rolling down her sides in small rivers, lubricating the wood below enough that she’s begin to slip and slide across it. You break the kiss to look her in the eye, and with another squeeze of her enjoyable little titty, you say, <i>“You’re MY bitch.”</i>");
	output("\n\nA high-pitched whine escapes from Heckel’s mouth. In seconds, it rises to a keening wail, exploding into a full-blown, orgasmic screech a moment later. Heckel pumps against you, her labia oozing lubricant while her pussy begins to spasm with wild undulations. A wasted spurt of cum explodes from her oozing cock-slit onto her belly, followed a moment later by a thicker blast that glazes the under-curve of her breasts. Her knot inflates, ballooning cartoonishly throughout her orgasm as she continues to squirt and splort with reckless abandon. Jizz splashes across her nipples, puddles in her belly button, and even catches her in the chin. Her screaming moan dies down as her balls empty, but that doesn’t stop her cunt from trying to wring you dry, and indeed, your maleness is on the cusp of submitting to that hungry pussy.");
	output("\n\nYou pump one last time into the hole, mashing your groin into her mons with a tit-shaking thrust, and cum. Your distended, corrupted cock pulses powerfully, sending jet after jet of your orgasmic bliss deep into your conquest’s crotch. She mewls in ecstatic bliss as you fill her, shaking weakly, her orgasm enhanced by the cream filling. Watching her eyes roll back slightly until they’re half-hidden behind her lids only excites you further, and like a cat with a mouse, you gloat over your prize. Your other members contribute as well, turning her hips and thighs into a wonderland of ivory-soaked fur.");
	output("\n\nOnly once you have fully sated yourself upon the still-climaxing herm’s vagina do you pull out. Her gash gapes in the shape of your maleness as you exit, dribbling sperm and continuing to convulse anew, milking the phantom member she wishes were still inside her. You plop your distended, bumpy demon-dick into her mouth, and she licks it without thought or question, cleaning the mixed love-juices from you until you shine with her glossy spit.");
	output("\n\nHeckel moans again when you take your cock away from her lewd licks. Looking over her, you admire your handiwork and get dressed, feeling utterly satisfied.");
	processTime(40);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

//Roxanne Drinking
public function roxanneDrinkingScene():void
{
	clearOutput();
	showName("\nROXANNE");
	author("?? CoC ??");
	output("Roxanne saunters over to the demonic-looking deer-taur working the tap and gives him a weighty gem-pouch, covering the cost of the contest and her mates’ drinking in advance. She lets the keg-keep top off the mug and throws it back, easily draining it with a few practiced swallows. Her tail slaps the table in front of you as she teases, <i>“Are you going to check me out all day or get smashed? Come on!”</i>");
	output("\n\nYou take the mug and hand it to the tainted ‘taur working the tap. He smirks at you as he fills it, radiating amusement at your attempt to out-drink Roxanne Poisontail. It seems the locals don’t believe you can win against such a renowned foe. You hesitantly sniff at the brew, taking in its dark color and heady, hoppy aroma before you slam the dark beer back and swallow.");
	output("\n\n<i>“You call that drinking? Watch and learn, sister!”</i> shouts Roxanne triumphantly as she holds her mug aloft overhead. The frothy beverage begins to pour out, an amber waterfall of intoxicant raining down towards the lizan’s face, but the canny pirate is ready for it. She opens her jaw and extends her tongue, over two feet of the pink-hued organ, catching the alcoholic downpour and funneling it past her smiling lips. Finished, she belches loudly and pumps her hips at you rudely. <i>“I hope you’re ready to get fucked!”</i>");
	output("\n\nThe ‘taur at the tap quickly grows bored with the constant bantering from Roxanne and the flirting you shower the lizan in. You down your drinks quickly, even sneaking refills while the lizan is distracted in order to speed your inevitable loss. She looks at you, clearly checking you out while you unabashedly fixate on the pulsing mass of cock-flesh that strains her oh-so-tight pants. Roxanne stops drinking and walks over to you, a little unsteady but still in control of herself, and pulls your head against her groin, letting you nuzzle it while she puts filled mugs in your hands. <i>“Go on and drink... good girl,”</i> she coos when you turn to the side and swallow more of the delicious brew.");
	output("\n\nGiggling and nearly tripping up on your own slimey cillia, you stumble up to the corrupted deer-taur. He looks at your wobbling stance, nearly-vacant eyes, and dopey grin before he shakes his head from side to side and says, <i>“No.”</i> Yessss! You finally got so drunk that Roxanne has no excuse not to pack your drunk ass full of lizan-spoo! A scaled hand slaps your expansive, squeezable ass spinning you around to fall drunkenly into the pirate’s soft, cushy chest. <i>“Don’t worry, I’ll be gentle,”</i> she whispers, hooking an arm around your sagging frame.");

	//Rox small
	if(rand(2) == 0)
	{
		output("\n\nA foot interposes itself between you and the table, and a shove sends you flopping onto the booze-soaked planks face-down, the last few inches of descent slowed by Roxanne’s firm hands. A scaled digit digs under your full platemail, pulling and tugging. As each piece is forcibly removed, you’re left more and more naked, totally exposed to the heat of the fire and the smooth scales of the lizan’s body. The room lurches when you to try to move and stop her, and you flop back down, ignoring the drunken spin of your surroundings. Laughing heartily, the pirate leans over you to pin your hands to the table. While her position has the intended effect of restraining you, it also gives you the enviable ability to feel Roxanne’s iron-hard nipples pressing into your back.");
		output("\n\nYou giggle underneath the lizan, your face mopping up the frothy brew that spilled during the previous bout of binge drinking. Lapping it up, you forget about your predicament as you adjust to the warm, scaled body overtop you. Roxanne leaves you to your distractions while she wiggles out of her pants, her tail swaying to counterbalance the now-freed bulk of her member. The sodden shaft rises to bump your butt, dripping with pre-cum as it wiggles between your cheeks. It prods your backdoor, rousing you from your drunken stupor and earning a look back, but the pirate begins to tongue the edge of your ear, making you giggle and relax into sexy, alcohol-lubricated acquiescence.");
		output("\n\nWith a slow, steady push, Captain Poisontail forces her drippy tip through your liquor-loosened ring and into your innards. You grunt in discomfort from the sudden straightening of your colon, unable to take such a beast in silence. It’s enough to stir you from your semi-conscious silence, and you try to ask her to go slower, slobbering and slurring your protests through numbed lips. <i>“Relax, my helpless prey. Don’t fight. Just lie there and take what’s coming to you,”</i> orders the still somewhat-sober lizan while she leers at you with an expression that borders on malice. Her words ring true, you’re drunk and helpless to resist the inches of thick shemale cock sliding into your stretched pucker.");
		output("\n\nToo intoxicated to control yourself, your sphincter clenches repeatedly, drawing in a few more inches of Roxanne’s thickness. It packs you completely, filling you in a way that centers all of your limited thoughts on the feel of that bulbous mass inside your anus. While the lizan is scaled from head to toe, her penis clearly isn’t. You judge by the shape stuffing you that her cock is like that of a human, a long veiny shaft capped with a rounded crown. Her balls slap against your own, the six orbs rolling around each other in their sweaty sacks.");
		output("\n\nThere’s nothing to do but lie there and accept it. You’re too drunk to run even if you did get the aggressive shemale out of your rectum. Worse still, her ‘crew’ of male lizans are standing guard in a ring around the pair of you. Even though they seem focused on protecting against external threats, you know you’d never get past them without tripping over a tail or being snatched by a strong, sober arm. You belch and relax, your face sliding over the booze-slicked table while Roxanne starts to pound away at your stretched tail-hole. It begins to feel good, very good, as she bumps and grinds against your deepest places, spurting drops of pent-up need from her swollen shaft.");
		output("\n\n<i>“Unf... you’re so fucking tight, Deez! Gods, I hate Ceraph’s curse and this wretched world... but your ass... your gorgeous, cock-slurping asshole... it’s divine,”</i> praises Roxanne, smacking your ass-pillows in between her slow, rump-filling pumps. She continues ranting with her thrusts, picking up the pace while she says, <i>“So hot... my beautiful, drunken anal slut. Look at you... you’re soaked in your spilt beer, panting while I ream your rump. Did you even want to win? I bet you secretly wanted this, didn’t you? Go on, nod and tell me how much you want this.”</i>");
		output("\n\nYou shake your head no, and are rewarded for your disobedience with a violent, butt-jiggling tail-whip. Gasping from the pain, your anus contracts involuntarily, milking Roxanne’s member for a few more drops of pre. The aggressive lizard really gets into it, her massive, DD-cup tits pinning you to the table while she smacks your cheeks with her flexible lizan tail. Pounding and slapping you, she abuses you for every dick-milking squeeze you’ll give her, until you’re voluntarily working your abdominal muscles to avoid the pain. Breaking under the onslaught, you mewl drunkenly, <i>“Fuck my assh... plug me with your cum,”</i> and wonder if you actually meant it.");
		output("\n\nThe constant pressure of her thrusts seems to flow straight to one of your infernal pricks as if each of Roxanne’s prostate-pounding bumps is injecting you with her lust. They bounce against your belly with your heartbeats, loving the anal pressure. Sticky droplets of pre-cum leak from you, and you can’t stifle the pleasured gasps that burst from your maw. To your delight and shame, your pussy is equally aroused by the action, musky and wet from the pirate’s lewd anal battering.");
		output("\n\nRoxanne shifts forward slightly, heaving the smooth scales of her mammoth breasts a little further up your back. She doubles her pace suddenly, balls slapping loudly into you while she moans and howls lustily. You feel the telltale bulging of an impending orgasm in your gut, and her balls drag up your skin, preparing to disgorge their steamy cargo. The lizan grabs your hair and twists her fingers through it while she hilts you, screaming out her pleasure for all to hear.");
		output("\n\nYour insides froth and churn while they’re filled with pent-up lizan cum. The shemale’s balls bounce against you, violently relaxing and contracting in time with the bursts of cream filling your intestines. Wetness fills you completely, but the spurts go on relentlessly. Suddenly, small squirts of hot cum escape your tender asshole, running down Roxanne’s still-pulsing balls. The action smears the cummy lather everywhere, and while the discomfort of being so completely filled rises, the pleasure grows in equal measure until you’re twitching and moaning with whorish delight.");
		output("\n\nFinishing her obscene orgasm, Roxanne sighs, depositing one last creamy dollop into your anal seed-lake. She coos in your ear, <i>“That was nice... I can see you shaking. Did you enjoy being a loser that much?”</i> You nod meekly, blubbering out your embarassed agreement. <i>“How pathetic. You’ll probably be back here tomorrow to lose again, won’t you? Such a shameful butt-slut.”</i>");
		output("\n\nRoxanne tugs back, but even with the pressure of her reproductive leavings inside you, you keep her pinned inside your depths, squeezing and writhing on her shaft. She tugs harder and harder, muscles going taut under her shiny purple scales until, with a violent ‘POP’, she slides free. You climax in that moment, getting off while a river of cum pours from your gaping asshole. Crying and moaning, you tremble while your beer-stained lips drool in bliss. An outpouring of spunk drools from one of your bumpy demon-dicks, spurting submissively under the table. Bursts of milk erupt from your pinned slippery nipples, blasting out while you cum to stain the table white. As it winds down, you fall into slumber, snoring happily after your violation.");
		processTime(30);
		var cumNum:Number = pc.cumQ();
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",smallPoisontailEppie,cumNum);
	}
	//Rox big
	else
	{
		var hasCock:Boolean = (rand(2) == 0);
		var hasVagina:Boolean = (rand(2) == 0);
		
		output("\n\nGods, your head is swimming! The room is pitching from side to side, and you giggle as you idly wonder if this is what it would be like aboard Roxanne’s ship. Still, the well-endowed shemale doesn’t seem to mind your tipsy bumbling in the slightest. She hooks her hands under your soft, padded backside and squeezes the spacious ass-flesh appreciatively, then growls, <i>“Such a nice, round ass; perfect for stuffing with cock! You’re wasted as a champion. You’d make a better cabin-girl,”</i> into your ear as she drags you towards her wagon.");
		output("\n\nWooden planks rattle as you’re pushed against the door, your cushiony cheeks smushing out to the sides to stretch your full platemail. The busty victor nuzzles your neck, leaving lewd, drunken licks all the way up to your chin. Her moist sighs wash over you as she begins to pant faster and faster, her quickening arousal all but stealing the breath from both of your mouths. Squishing up against your thigh, the lizard’s semi-flaccid member is slowly filling, growing harder and harder as it floods with burgeoning passion. At some point it escaped the pirate’s imprisoning leather pants, and you drunkenly look down at it.");
		output("\n\nReflexively, Roxanne’s penis grows once you look down at it, gaining four or five inches in seconds. It pauses for the split-second before its owner’s next heartbeat, and then it expands again. This time, it lurches upward, the sensitive glans bouncing off your waspish, fertile hips before coming to rest against your belly. The inflating cockflesh slides up to your back-breaking breasts, leaving a trail of glistening pre-cum as it goes. Roxanne coos, <i>“Oooh, let’s get you inside before we make too much of a scene!”</i>");
		output("\n\nThe next moment, you’re stumbling inside, manhandled up against a bed before being forcefully bent over it. Groaning, you drunkenly hug one of the pillows as you settle into the odd posture. Shit; you’re gonna get fucked, aren’t you? You try to get up, but the room spins, and pieces of your full platemail are disappearing with alarming rapidity. Crack! A hand smacks across your voluminous backside hard enough to make your waspish, child-bearing thighs sway and set your copious flesh jiggling!");
		output("\n\n<i>“Such a big, beautiful butt you’ve got here,”</i> Roxanne mumbles, squeezing one of the cheeks, her fingers disappearing into the mound of flesh. <i>“I can’t get enough of thick, cock-craving sluts like you.”</i>");
		output("\n\nThe intoxicated shemale massages your derriere passionately as she works her pants zipper open. Her heavy, cum-filled balls pop out, swinging freely. Moments later, Roxanne’s leather trousers are kicked away, and her jacket joins them. She exhales in relief and takes the opportunity to get a feel for your slappable butt, kneading the generous flesh in lustful appreciation while her cock grows and sways dangerously above. Drops of hot lizard-pre splash onto your back - Roxanne’s excitement distilled into pure, liquid form. You moan and relax under your more sober compatriot’s ministrations. It feels goooood, so good you forgot why you were trying to get up a moment ago. You let yourself sink into the mattress, your muscles going slack, your body open and utterly exposed to her powerful fuckmeat.");
		output("\n\nDrops of liquid lizan love spatter across your asscheeks when Roxanne pulls herself back, and she comments, <i>“You’ve got a beautiful ass, Deez. So thick, soft, and... shiny.”</i> Narrow, reptilian fingers slide through your ass-cleavage, smearing the pirate’s natural lubricants everywhere and circling your tight anus with slow strokes. You clench at the first touch, an instinctive reaction to the probing, but the newhalf’s insistent caresses slowly win your drunken, pleasure-hungry mind (and hole) over. <i>“Atta girl!”</i> the lizard exclaims encouragingly.");
		output("\n\nAfter all that alcohol, kissing, and sensuous groping, you feel eager and ready to go, suddenly hungry for the pending, plus-sized violation that your lizan lover has been saving up for you. You sigh into your pillow as Roxanne’s bulbous cock-tip lines up with your tight anus, the muscles of your sphincter quivering in anticipation. Slurring drunkenly, you beg, <i>“Put it... put it in already... I’m ssho fukkin’ horny!”</i>");
		output("\n\nRoxanne gleefully slaps your expansive, squeezable ass and counters, <i>“I’m getting ready, ya greedy butt-slut!”</i> She groans, and you feel some of her syrupy pre slipping through your well-lubed ring. Despite her words, she’s ready to go and just as ready to blow. She edges her fluid-dribbling invader past your gate and suddenly thrusts, forcing you open and battering her way into your rectum with one hard push. As big as she is, only her tip and the first few inches get in, but you feel as if you’re about to be split in half. The pulsating, fleshy spear twitches happily from the warmth of your innards and the squeezing of your big, rounded booty. Your butthole is now a little loose.");
		output("\n\n");
		if(hasCock) output("One of your nubby shafts twitches, only half-hard and yet trembling from the light bumps your poor prostate receives. You moan and give a saucy wiggle as your ass caresses the bulbous invader, pulling it deeper to rub up against your anal G-spot. A tiny jet of pre squirts on the bed sheets, foreshadowing the fun to come. ");
		if(hasVagina) output("Meanwhile, your slavering twat gets slicker and slicker, your lust permeating the air with potent female musk. Oh, if only Roxanne would fuck you there too! ");
		output("Roxanne grunts, <i>“That’s a good girl... Oh, you’ll make such a great anal cum-dumpster for me.");
		if(hasVagina) output(" Your poor pussy will be so cum-starved, but you’ll be so stuffed with jizz that you’ll look pregnant anyhow!");
		output("”</i>");
		output("\n\nYou whimper as Roxanne thrusts herself further forward, burying another few inches of potent lizard-cock inside you. Its sheer size shifts your innards slightly, and you’re sure there must be a visible bulge on your tummy by now. The shemale sighs blissfully and continues to work her dick further and further inside you. Finally, when you feel you can fit no more, her large, quaking testes press against your rump. If you didn’t have such a round ass, she’d probably still be trying to go further inside, but your plump derriere actually helps to distance her from your vulnerable pucker - by a bit.");
		output("\n\nSighing with relief, your body shudders softly as you adjust to the meat-spear inside you, slowly relaxing until your stretched butt-cunt more comfortably fills the role of Roxanne’s fuck-toy. She exhales happily and places her smooth palms on your shoulders, gripping you firmly before she pushes again. You squeal in distress as at least another inch of the pirate’s gigantic dong slides inside you, her hips and balls smushing your jiggly cheeks out to the side. Her sack must be painfully pressing into you by now, but Roxanne doesn’t relent. She holds you there, forcing you to hold even more than before.");
		output("\n\nThe drunken, scaled dick-girl pulls most of the way out a few seconds later, teasing, <i>“Feeling empty, dear? I’ll fill you up, my cabin-girl,”</i> before plunging back in. Roxanne’s hips begin to pump your gaping asshole with practiced efficiency, every stroke smearing her rounded cock-tip");
		if(hasCock) output(" across your pre-greased prostate. You cannot help but moan in forced bliss.");
		else output(" through every sensitive part of your body, hard enough to make you shiver from the onslaught of sensation.");
		output(" Roxanne cries out ecstatically and shoots large globules of fluid into your rectum. Muffled, wet squishes and audible liquid churning can be heard from your guts, but you’re pretty certain it’s still only pre-cum.");
		output("\n\nYou’re openly moaning and gasping, your face pressed into the mattress by the hard-fucking lizan. She pounds you faster and faster, breathily exulting in the pleasure each time she bottoms out against your gigantic backside. You can’t help but clench and squeeze either - your body is being battered relentlessly. Your sphincter convulses around the thick cock, and when you can’t take any more, you cum, babbling drunkenly and submissively.");
		output("\n\nRoxanne moans, <i>“Here... it... coooomes!”</i> and thrusts herself into you hilt-deep and hard enough for her balls to leave a mark on your cushiony butt. Eruptions of gooey spunk go off inside you, slowly enlarging the visible bulge in your belly from tip to base, culminating in a spray of spooge from around the edges of Roxanne’s still-squirting cock. Jizz drips down your mounds of goo, pooling on the ground. At the same time, your bloated belly is starting to look fairly pregnant. It slowly balloons out, leaving your poor tummy totally, utterly filled. You get so used to the sensation that when Roxanne finally slows, you’re roused from your post-orgasmic haze");
		if(hasCock) output(", dimly aware of the mess you’ve made of Roxanne’s bedsheets");
		output(". Roxanne pulls out unceremoniously, releasing a torrent of white from your abused back-door.");
		output("\n\nYour strength is gone, either from booze, or the incredible reaming and creaming you just took. In any case, you slump over into the mess, falling asleep in your own spooge.");
		processTime(30);
		var cumNum2:Number = pc.cumQ();
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",largePoisontailEppie,cumNum2);
	}
}

public function smallPoisontailEppie(cumNum:Number):void
{
	clearOutput();
	showName("\nROXANNE");
	author("?? CoC ??");
	output("Later...");
	output("\n\nYou wake in the lizan’s bed with a nasty hangover, her arm curled around your gurgling belly. From how sore your rear feels, she kept ‘winning’ at least two or three more times. Your head is pounding, your mounds of goo are weak, and you dribble cum with every movement. It takes some doing to extricate yourself from Roxanne’s slumbering form, but you find your equipment and leave, hanging your head in shame under the leering eyes of the caravan-goers.");
	processTime(30);
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}
public function largePoisontailEppie(cumNum:Number):void
{
	clearOutput();
	showName("\nROXANNE");
	author("?? CoC ??");
	output("Later...");
	output("\n\nYou wake in the lizan’s bed, her arm curled around your gurgling belly. From how sore your rear feels, she probably kept ‘winning’ at least two or three more times. Your head is pounding, your mounds of goo are weak, and you dribble cum from your ass with every movement. It takes some doing to extricate yourself from Roxanne’s slumbering form, but you find your equipment and leave, hanging your head in shame under the leering eyes of the caravan-goers.");
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

//Cinnabar Portals
public function cinnabarPortals():void
{
	clearOutput();
	showName("\nCINNABAR");
	author("Fenoxo");
	output("Once you give your assent, Cinnabar’s paws dive into your full platemail, gliding over your fur before re-emerging above your gem-pouch. She deftly grabs her payment and snakes back through, tickling your belly with her soft, well-groomed fur. You look at her, then yourself, then her again. How the hell was she flexible enough to do that? Cinnabar giggles and curls her tail around your mounds of goo, looping it like a long, flexible rope. She hugs you and murmurs, <i>“Where will my mistress take her slutty, fuck-hungry companion?”</i> Her tongue flicks your ear like a snake tasting its prey, and though her attitude sounds submissive and weak, your horny ‘companion’ is clearly hiding a fiery, aggressive streak.");
	output("\n\nBefore you can make an answer, Cinnabar’s hands are back inside your full platemail, tugging your nipple towards an unmarked wagon that’s clearly her home. You smirk and rub her between her legs, feeling the moistness of her sloppy cunt through her now-dampened dress. Before she can tease you any more, you hook a finger up, pushing her dress into her hungry snatch. It’s easy to lead the giggling rat-whore like this, and when you reach the door she slides her tail into the lock, clicking it open with ease.");
	output("\n\nWith surprising strength, she drags you inside, kicking the door shut. She hurredly strips, struggling a little with the tight dress, and you take the cue to disrobe as well. You get done first, just in time to notice she’s stopped with the wet patch on her nose. She’s sniffing and tweaking a nipple, masturbating herself as if she’s completely forgotten about you. A crimson eye peeks through the upraised dress-slit, and you realize she’s imploring you to take advantage.");
	output("\n\nYou give the whore what she wants and pull the sodden dress from her, tweaking her nipple hard. She moans and pulls you into her bed, which groans from the sudden onslaught of added weight. As you lie atop her prone, exposed body, you realize the walls around her bed are plastered with dozens of spherical mirrors, all reflecting the nude flesh of your entwined bodies. Your slut-for-an-hour grabs you by the hair and kisses you hard, her velvety-soft lips raping your mouth and burning with the heat of her lust. She pulls you back and moans, <i>“Mistress has chosen well. Now please, pinch this slut’s nipples while she puts on a show for you.”</i>");
	output("\n\nObligingly, you grab both her black, puffy nipples and twist them. Her heart hammers in her chest, pumping hard enough for you to feel it beat through her abused, puffed-up teats. She twists her body, writhing out from under you while somehow keeping her nipples in your fingers the entire time. With an annoyed squeeze, you turn the tender nubs harder, smiling when they yield under the pressure and begin to corkscrew. Cinnabar groans lustily, now on all fours, and smears her dripping gash against the wall behind her, her tits swaying lewdly in your grasp.");
	output("\n\nCinnabar coos happily, in spite of the pain, and she begs, <i>“Please mistress, look at the mirrors. Your slut is trying to be good, but she needs to be filled so badly.”</i> You turn to look, but hold on to her tortured tits, just in case. Amazingly, a pair of the mirrors have changed. They no longer reflect your own image back – they show her gaping, girlcum-dripping gash and twitching, black-skinned anus. You can even smell her feral musk and feel the heat pouring from her horny genitalia hitting you in a wave.");
	output("\n\nToo shocked to keep your grip, you listen dumbly as Cinnabar groans, <i>“Mistress is pleased? This one knows how to use portals for their intended purpose. Watch slut make more sexy portals.”</i> True to her words, many of the other mirrors change, showing both sets of nipples, your cunt, and your pucker just inches away. Without any prompting, you reach through to touch her arousal engorged lips, slipping fingertips through the needy gash and marveling at how large it feels. You push forward, burying one, two, three, and finally four fingers inside her hungry nethers.");
	output("\n\nCinnabar pants, <i>“Ungh... more. Stuff this whore’s cunt,”</i> all while she wiggles her backside against the mirror, clearly enjoying the attention. You pull back to tease her, but the horny whore groans and reaches through another portal to grab your diminutive pulsating clit, rolling it between her thumb-pads with a hair too much pressure. She wants to be penetrated? Fine. You ball your fingers and push forward. Amazingly, you push through a gossamer curtain of femcum and bury your whole hand inside her cunt with ease. Her silky-smooth walls tremble and squeeze, caressing your hand like a long-lost lover.");
	output("\n\nSatisfied with your display of power, her fingers release their squeeze and settle to the business of sliding back and forth, caressing you from the inside out. Femcum begins to soak the rat’s practiced fingers, drenching her finger-pads with liquid lust. You rock back, slamming your wide, jiggling butt against the wall and moaning with need. She’s quite skilled, and caresses your passage in ways that leave you panting like a bitch in heat. She urges you on, practically begging, <i>“Yes! Stuff my hole! Fist me, mistress; stretch me with your hand until I’m too loose for a minotaur! Please... please... fist my ass too. Ruin my holes, mistress! Break fuck-toy’s body!”</i>");
	output("\n\nYou shrug and pull yourself up by the fist in her cunt, eliciting an agonized moan from your whore while you plunge your other hand into her clenching, squeezing asshole. Her knees dig deep into the cushions, now supporting her own weight as well as yours, but the quickening pace of Cinnabar’s fingers - no, fist tells you just how much she likes it. She even works her fist into your asshole, leaning on you in the same way and locking your bodies together through the portals. Growing more and more aroused, hotter and hotter, you pick up the pace, pistoning your forearms in and out of Cinnabar’s lewdly squelching holes.");
	output("\n\nShe squeaks, the first rodent-like sound she’s made all evening, and you take that as your cue to work her even more brutally, pounding her now-gaped holes with hard, fast strokes. Each time it seems like she swallows more of your arm, and after a few particularly violent poundings, you’ve sunk inside the rat up to the elbow. From where you’re kneeling, you can see her belly, and it isn’t distended in the slightest. Just how much can she handle?");
	output("\n\nYou press on, brutalizing her pussy and asshole simultaneously. Each time you pull your fist back, the flesh is hanging limply around it, stretched so wide she barely notices it, but then you’re back inside her, stuffing her with your bicep and rubbing her cervix. Nearby, you spot a mirror that gives you the perfect view of her clit, and with one inspired movement, you lean low enough to give it a lick. The smooth, hard flesh of her nub slides into your lips as you tongue at it, growing with Cinnabar’s rapidly spiking passion. She squeaks long and loud, dragging it into a moan while her violated pussy and gaped asshole pull tight around your arms, squeezing and milking them as if they were giant-sized cocks.");
	output("\n\nThe rat’s fists plunge further inside you, violating you far more gently, but still hard enough to get you off. She licks your little button, and your cunt convulses around the intruding digits, making you shiver and moan. Not wanting to be left out, your butthole clamps and puckers with it, wringing the rat’s hand in its hungry embrace. The orgasm is intense, and as you both succumb to exhaustion, two sets of limbs slip from abused orifices. Cinnabar and you fall into each other, collapsing in a puddle of sexual juices and sweaty limbs. Her arm and chest are left splattered from your explosive, squirting orgasm.");
	output("\n\nCinnabar rolls over to give you a kiss on the cheek once she’s recovered. Her voice is still rough from the volume of her pleasure-squeaks, but she manages to whisper, <i>“That was nice for someone who didn’t have a cock worth fucking. Feel free to catch your breath, but I’m a working girl so don’t take too long. I’ve got to get the sheets cleaned and the floor mopped before I can get my next customer.”</i>");
	processTime(60);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

//Drider Table-turner
public function driderTableTurner():void
{
	clearOutput();
	showName("\nDRIDER!");
	author("?? CoC ??");
	output("Eager to plumb the depths of this greedy spider’s snatch, you practically tear your way out of your full platemail in your hurry to get naked. Through it all she looks up at you with a look of disgust in her red eyes. She folds her arms across her many-bosomed, quadratically endowed chest with disdain, the chains jingling loudly as she does so. In spite of keeping a stiff upper lip about it, her lower ones visibly quiver while you strip. You saunter over to the limp-legged drider and run your hands down her inhuman, arachnid body, exploring the smooth, shiny carapace.");
	output("\n\nThe corrupted monster-girl sighs and shudders at your touches, as if she can somehow feel your finger-tips through the rock-hard exoskeleton. From the way she’s trying to hold in her exhalations, you can only guess that it must feel wonderful, so you keep it up, circling and touching every part of her exotic anatomy. By the time you’ve circled around her entire body, she’s giving up little, lewd moans of pleasure and her chain-pierced-nipples and clit look as hard as her natural body-armor. You boldly grope one of her pierced breasts, feeling the supple, soft flesh shift while you roughly palm it and rub your thumb down a dark nipple. You let the sensitive bud go and watch it spring back up, enjoying the drider’s gasp of surprised pleasure for the brief moment before she muffles herself.");
	output("\n\nStill fondling one of the four nicely-sized tits, you push the spider-bitch back, admiring the drider’s flexibility as she leans back over her inhuman lower body, giving you an even better view of her intoxicatingly sweet-smelling pussy. You take each of your cursed cocks in hand and rub the tainted crown along the slick lips of her pussy, shuddering slightly as her wetness rubs the sensitive glans. Gasping, you slowly spread her molten-hot pussy around your girth, reveling in the tight embrace of her slick walls. The drider squirms in your grip with her breasts bouncing deliciously and whole body trembling. Spreading as easily as her cunt, the drider’s venom-glossed lips slowly open into a wordless ‘o’ of rapturous pleasure.");
	output("\n\nHalf an inch at a time, you sink ever-deeper inside the seemingly bottomless pit that is the spider-girl’s steamy sex. Reveling in the taming of the aggressive predator’s sticky snatch, you postpone the eventual hilting as long as possible. For her part, she doesn’t seem to mind you having your way with her. All eight of her spindly legs are scrabbling pitifully in the dirt, doing little more than nervelessly convulsing in uncontrolled pleasure. The spider-woman’s arms close behind your back, the sharp tips of her nails trying to claw deep furrows into your black and white spotted fur. At long last, your waist presses against her own to feel the oozing slipperiness of her nethers. Your knee-length, nubby shaft is totally buried in her tunnel, and now that you’re holding still, you can feel the tiny folds inside her vagina slowly moving and gliding along your length, stroking your demonic dong like dozens of tongues.");
	output("\n\nCompelled by your body’s instincts, you draw back your waspish, voluptuous thighs to expose the bulk of your pussy-soaked shaft. The spider-woman moans disappointedly, her voice filled with so much wanton desire that your nub-ringed tip twitches in response. You fondle the drider’s lower pair of breasts with both hands, circling and squeezing the delectable mounds while you begin to repeatedly impale her squelching pussy, watching the upper row of pale breasts bounce and jiggle above your busy fingers. The chains binding her nipples make a delightful clinking noise with each squeeze and stroke.");
	output("\n\nMeanwhile, the drider’s swollen clit prods at your loins with each penetrating thrust, leaving lines of sticky spider-juice all over your crotch. Your extra penises fan out to the side, forgotten while you give yourself over to the silken caresses of her glorious vagina. The more you fuck the arachnid hussy’s wanton slit, the more animated she becomes, until she finally breaks her wordless silence by crying, <i>“Yes mistress, dominate me! I’ve been such a naughty bitch. Use me like your cheap whore! Fuck my holes full of cum, and leave me defiled in a puddle of spunk-laced mud!”</i>");
	output("\n\nInvigorated by the rising tide of desire inside her, the drider pulls her torso up, crushing her tits into your palms so hard that her flesh bulges out through your fingers. You smile down at the slutty spider and squeeze them hard enough to give her a taste of pain in response. She pants, and her four red-hued eyes gaze at you, so full of desire that you have a hard time not cumming on the spot while you lock onto those half-lidded, luminous orbs. You let go of her breasts and reach back to squeeze the smooth skin of her butt, feeling the joint between her human and arachnid halves just under her curvy derriere.");
	output("\n\nHeaving mightily, you use the submissive spider’s ass-cheeks as hand-holds for a fast, hard fuck. Her four pierced breasts mash against your multi-layered back-breaking love-pillows, sweaty skin sliding back and forth and drawing gasps from each of you every time one of her nipples brushes one of yours. She coos, <i>“Please fuck my slutty drider-cunt harder, mistress! It was so naughty and cruel when I tried to rape you. Don’t let me cum... deny me over and over until I’m your good little spider-pet that’ll do anything for release!”</i> She emphasizes every sentence by clamping her quim down on your massive, nubby shaft, the dozens of lubricant-soaked folds rolling back and forth, milking you until you cannot help but ejaculate inside her.");
	output("\n\nYour back arches in orgasmic pleasure, fingers squeezing her butt tightly enough that your pale lover’s derriere will show your hand-prints for some time. She shudders slightly as your girthy, infernal prick is forced as far inside her lewdly-textured vagina as possible, milking your penis with repeated strokes while your urethra bulges with the first load. You release what feels like a torrent into her passage; the heavy spurt is quickly swallowed by the drider, disappearing deep inside her as if drawn away on an unseen current. The sudden suction and increase in the movement of her folds makes your next rope of jizz feel even bigger, but it too disappears into the drider’s seemingly-bottomless body.");
	output("\n\nWhile you’re distracted by the repeated contrast of tension and relief emanating from one of your infernal pricks, the drider leans up and kisses your neck, humming against your throat as you squirt the last of your orgasmic goop into her vagina. You slump into her arms, spent by the effort of fucking her so fast and cumming so hard. As you lie there, her lips sucking hard enough to leave hickeys on your neck with every crushing, passionate kiss, you feel the patterns of glossy fluid tingling on your emerald skin. A jolt of fear runs up your spine, and you try to push away from her envenomed affections. It doesn’t work! You can barely lift your arms, let alone pull out of the amorous arachnid’s embrace!");
	output("\n\n<i>“Mmmmm,”</i> hums the drider into your collarbone, smearing more of her toxic lip-gloss onto you as she goes. <i>“Such a good mistress! You punished me so well! Now just relax... I’ve been dripping out a special venom that’ll help you teach me the rest of my lesson, and I need to make sure that every... single... drop... slips inside that sexy bloodstream of yours.”</i>");
	output("\n\nYou wiggle futilely, using the last of your strength to try to break free, but it’s no use - she’s too strong, or the venom has made you too weak. Dimly, you’re aware of your cursed cock pulsating inside her, hard as iron and burning hot with lust, even though you just came. The spider-woman continues to kiss you, and with every peck of her lips, you feel yourself sagging deeper into her embrace until you lay your head down on her breast, your only movements the slight twitches of your body as it tries to deal with the poison-induced need to copulate. You feel the warmth of her breath on your neck when she stops, cradling you in her arms.");
	output("\n\nThe drider cocks her head to the side so you can see her luminous red eyes boring into you while she whispers, <i>“Don’t try to fight it, dear. While there’s enough of my normal venom in there to keep your cursed cock hard enough to cum a few more times for me, the real magic is in the secondary chemicals my demonic friends were kind enough to teach me how to excrete. You can feel it relaxing your muscles can’t you? Well, the beauty is that it isn’t just your muscles relaxing... your mind is getting nice and relaxed too. So open and pliable that you’ll soon be a horny puddle of putty for me to play with.”</i>");
	output("\n\nGods, she’s right! You started to nod while she was talking, automatically agreeing with every sibilant syllable. Trying to shake your head in denial, you only succeed at bouncing the jiggling tit-flesh beneath you. You have to resist! You beat her! She can’t do this!");
	output("\n\nAs if reading your thoughts, the seductive spider answers, <i>“Oh dear, don’t struggle. You won, remember? You held me down and fucked me hard. You mounted me like a fuck-hungry stud that does all his thinking with the big fat cock between his legs, and we both loved it. You won’t deny that will you? It’s the truth.”</i>");
	output("\n\nOf course it’s the truth, the cunt’s clearly got a good grasp on the obvious. Unwilling to lose your grip on dominance, however, you try to keep struggling to get the upper hand.");
	output("\n\nThe drider croons, <i>“Come on, don’t delude yourself. If you weren’t such a dominating, rape-hungry beast you wouldn’t be nuzzling against my tits and giving me little nods of agreement. Honestly, how could you ever think of yourself as anything different when your brain just does whatever your dick tells it to? You just got off and might have even knocked me up, but your penis is even harder than before.”</i>");
	output("\n\nYou grumble out a denial. You’re not dumb, you just like to take charge and fuck. There’s no reason to resist jumping on a nice wet pussy and making it squirt while you pack it full... but you can’t quite get your limbs to move.");
	output("\n\n<i>“Oooh, are you leaking out more pre-cum already? You’re insatiable! I bet you start thinking about your next fuck before you even finish getting off, don’t you? You can deny it all you want, but I felt your dick puff up a little bit more as soon as I said it. No matter what you think, your cock is a dumb, happy little tattle-tale that always tells the girls exactly what you’re thinking.”</i> She adds, <i>“Face the music - there’s nothing you love more than defeating someone and letting your dick tell you what to do. You dumb... domineering... beast...”</i>");
	output("\n\nGods! It’s getting so hard to think with that tight cunt clutching at your cock and the soft, feminine enunciations constantly interrupting your thoughts. How can she concentrate with the stink of sex hanging so thick in the air? Your meaty, demonic cock is so horny, why aren’t you fucking her yet? You shudder weakly and remember that it’s because of her own venom paralyzing your muscles so effectively.");
	output("\n\nThe drider pauses to gaze into your eyes with all four of hers. She runs a hand through your hair while making gentle shushing noises at you before she resumes her diatribe. <i>“There there, I know how eager you are to fuck me into my place. I’m just another wanton harlot waiting to be forced on her back and turned into a fresh cock-sleeve for you, aren’t I? You recognize the absolute truth of my words. Every time I talk you can feel the words bouncing around inside that empty head of yours.”</i>");
	output("\n\nYou nod, actually moving your head against her pillowy breasts as you feel your strength starting to return. Why is she wasting so much time telling you things you already know? This bitch’s cunt is like a white-hot furnace of lust, and your cock is so tired of having to sit still. You can’t wait to recover from the venom and fuck her so hard she’ll black out from the ensuing orgasm. Then you’ll fuck her a few more times until your cock finally gets tired of her sloppy, cream-pied pussy.");
	output("\n\n<i>“Oooh, that dick is just getting harder and harder isn’t it? I bet it feels like it’s about to burst and cum, even though you’re not able to punish me like you want to yet. Maybe you secretly get turned on by being denied? Oh! I just felt your dick jump! So you want to go around, letting your dick tell you to dominate every horny cunt you see, but the thing that turns you on more than anything else is having a woman turn the tables on you, isn’t it?”</i>");
	output("\n\nYou moan, <i>“N-no...”</i> but a small burst of pre-cum chooses that moment to erupt from your forearm-length, blighted cock, still nestled inside the squirming spider-cunt. It feels heavenly, and while you try to struggle in your weakened state, the warm embrace of her pussy’s many cock-milking folds is turning your penis into a cum-drooling behemoth on the edge of exploding. Oh gods, is she going to do it? Damn, you want to put her in her place, but you’re so weak right now. Even worse, her pussy has you so close, so very close.");
	output("\n\nThe chitinous, oh-so-right bitch pulls your head up to gaze deeply into her eyes. <i>“You have a horny, naughty cock, and you always listen to it. This rebellious member gets you into so much trouble, but you’ll never stop listening to it. You’ll keep chasing every wet pussy you see, because you’re just a horny animal. A rutting, horny animal. But I know your secret. Your dick really wants a girl to turn the tables on you, paralyze you, and tease your cock mercilessly. It feels so good to let me touch your body, stroke it, tease it, and squeeze it. You won’t even fight any more. My pussy has your cock so close, so very close, and you’re going to cum when I tell you. You’ll blow your load on command for me, my servile, secretly submissive mount.”</i>");
	output("\n\nA plaintive whining, almost exactly like that of an animal, vocalizes subconsciously. Your demonic cock feels afire, constantly leaking pre-cum while you’re held immobile in your spidery mistress’ arms; you lick your lips and start to beg, mumbling out your desire to cum for her, anything for her, so long as she lets your dick orgasm again and again. You want to climax so bad, but you want her to control your cock so much more. It’s always getting you in trouble, and it feels so good to let her use you as her cum-drooling mount.");
	output("\n\nThe spider-woman giggles and surprises you by kissing you on the lips, holding you against her while her narrow tongue smears her venom all over your lips and tongue, staining them purple. You exhale happily through your nose, feeling perfectly, utterly relaxed and yet aroused beyond any reasonable measure. The squeezing caresses around your dick keep you happily squirting heavy dollops of pre-cum. You’ve no doubt it must look like some kind of over-stuffed sausage by this point, bloated beyond reason.");
	output("\n\nWhen she pulls away, her face is covered in a huge blush, and she’s panting out loud and interrupting her words with quiet moans as she talks, <i>“That’s a good girl. Even though you’re a stupid pussy-slave, bound to let your cock lead you into every hungry snatch you see, you know how to obey a smarter woman’s cunt, don’t you? Let me hear you beg like the animal you are. Whine for mistress while her cunt fucks your dick, show me with every fiber of your being how much you love to submit, to obey, and to beg to be allowed to cum.”</i>");
	output("\n\nShe lets your head hang limply, and all you can do is whine, and try to look up at her with the most pathetic expression in your eyes. You’re beaten - she’s so much smarter than you and she’s got you by your dick. Why didn’t you think? Gods it was a bad idea not to bind her lips... still, at least she’s controlling your rebellious dick, teaching the little prick a lesson while letting you feel so good.");
	output("\n\nThe drider moans louder and responds, <i>“Yes, oooh, good girl. You’re so hard, so very hard. You’re oozing out cum even though you’re not allowed to fuck me, and you love it. I bet you don’t even mind not getting to orgasm - so long as you’re helpless and hilt-deep in a cunt, you’re happy, aren’t you? Oohhh, I’m gonna... gonna... cum soon. Luckily for you, I want you to squirt inside me. I want that cock creaming my pussy as soon as I... ohhhh... so good... s-soon as I command it... You’ll do that for me, won’t you? You’ll obey me completely, utterly, and pump every drop of your jism into my soon-to-be-pregnant pussy, right?”</i>");
	output("\n\nYou mewl out an affirmation, forgetting how to speak with all the venom pumping through you and the mind-crushing levels of arousal pouring out of your forearm-length, corrupted cock.");
	output("\n\nThe spider-woman shudders from head to all eight of her ‘toes’, her four eyelids closing while her mouth gasps out, <i>“Cum for me.”</i>");
	output("\n\nThe first spurt of pent-up seed splatters the spider’s womb before you even realize she gave you permission, painting the squirming walls white. You growl and cum, releasing spurt after spurt of spunk while her pussy seems to drink it all down. Her legs skitter and tremble, her pussy convulses, and your dick gets the squeezing, sucking orgasm of a lifetime. It feels like you’re pumping out two or three orgasms worth of spooge, each dick-stretching explosion of cream dilating your slit almost painfully wide.");
	output("\n\nWhile it seems to go on and on, your orgasm eventually ends, leaving you to hang limp while your still-hard dick is massaged by a much wetter spider-cunt. The red-haired beauty dreamily says, <i>“Mmmm... good job, pet. Now, let that nice hard dick do the thinking for you and keep fucking my hot cunt until it goes dry. Maybe a few hours after you finish, you’ll be able to remember that you used to be a woman before you became my livestock.”</i>");
	output("\n\nThe blissful arachnid rolls onto her side with you still locked inside her and falls asleep, her red tresses splayed across the ground. Even unconscious, her vagina continues its rhythmic contractions around your cock, working you towards another burst of orgasmic pleasure while you wait for your strength to come back...");
	processTime(60);
	var cumNum:Number = pc.cumQ() * 2;
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",driderTimesEpilogue,cumNum);
}

public function driderTimesEpilogue(cumNum:Number):void
{
	clearOutput();
	showName("\nDRIDER");
	author("?? CoC ??");
	output("Sometime Later...");
	output("\n\nPistoning your hips violently, you continue to ravage the unconscious spider, fucking her in a brutal, beast-like manner that centers entirely upon your own pleasure. You cum, dumping a fresh batch of jizz into her already-stuffed twat, grinning when a few more rivulets of ooze roll over her inflamed pussy-lips to drip into the growing puddle. Still hard, one of your corrupted cocks continues to twitch, hungry for more, and you don’t deny it. You grab the arachnid bitch and stuff your dick into her mouth, shivering while her venom seeps into your dick, keeping you hard and ready to blow. Whatever special, immobilizing venom she had earlier, it seems exhausted, and the only response your body has to the onslaught of toxin is to erupt, spouting a huge load of semen into her mouth.");
	output("\n\nA low growl rips through your throat as you pull back and plaster her face white, coating the caked-on residue of a few previous loads with fresh moisture. You shift position and force your perverse pecker between her two pairs of breasts, sandwiching it in there for the titty-fuck of a lifetime. Pistoning back and forth, humping the glorious orbs relentlessly, you give yourself over completely to your sore dick, letting your world dissolve into the feelings of each of the spider-woman’s orifices around your member.");
	processTime(56);
	cumNum += pc.cumQ() * 2;
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",driderTimesEpilogue2,cumNum);
}

public function driderTimesEpilogue2(cumNum:Number):void
{
	clearOutput();
	showName("\nDRIDER!");
	author("?? CoC ??");
	output("Even later...");
	output("\n\nYou collapse into the dirt, not even caring that it stinks of dried cum and girl-jizz. You’ve completely emptied out every speck of sperm from your quartette of basketball-sized balls, and you even kept going for a while after that. It wasn’t until one of your bumpy demon-dicks went soft at last that you found enough peace to lie down. The longer you sit there, the more your strength returns to you, and the more the submissiveness placed into you by her venom recedes. Still, you’ve tired yourself out too much to leave at the moment. You shiver and wrap your arms around her, snuggling against her while a primal, buried part of your brain insists that she’s YOURS. You fall asleep like that, resting dreamlessly even through your mate’s waking and departure.");
	processTime(40);
	cumNum += pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

//Minotaur Quest
//Gloryholes
public function gloryholesScene():void
{
	clearOutput();
	showName("\nGLORYHOLES!");
	author("?? CoC ??");
	output("You’re surrounded by gloryholes! Dozens of exotic dicks are stuffed through, quaking with unspent delight. You could have your pick of any of them!");
	processTime(1);
	clearMenu();
	addButton(0,"Canine",doggieGHole);
	addButton(1,"Imp",impGHole);
	addButton(2,"Minotaur",minotaurGHole);
	addButton(3,"Mino Addict!",minotaurAddictGHole);
}

//Canine
public function doggieGHole():void
{
	clearOutput();
	showName("\nGLORYHOLES");
	author("Fenoxo");
	output("You sigh and kneel down to bring yourself level with the dog-dick hanging out of the wall. It’s pointed at the tip with a swollen circular bulb at the base. As a matter of fact, the dog-dick’s owner must be pretty excited to be here - it’s dripping cum and the knot has swollen so large that it can’t fit back through the hole.");
	output("\n\nYou throw yourself onto the swollen dog-cock and easily engulf the whole thing, spreading your lips wide around the thick knot. You can feel it bouncing the uvula in your throat around but you manage to supress your gag reflex like a good slut while you work the sweaty dick, giving it a thorough tongue bath. You wrap your lips around the base of the knot, feeling it start to stretch your jaws apart. You pull back before it can lock you like that, and squeeze the knot in your hands. It cums, unloading thick wads of gooey cum into your mouth.");
	output("\n\nA young goblin comes by with a bowl for you to make your payment into. You spit out the gunk and wipe your mouth, as the goblin carries the seed away. You notice a trail of clear drops on the ground behind her. She must be anticipating something...");
	processTime(30);
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,0);
}

//Imp
public function impGHole():void
{
	clearOutput();
	showName("\nGLORYHOLES");
	author("Fenoxo");
	output("You walk over to the hole in the wall, looking at the erect demon-member you’ll have to service. Judging by the height and constant bobbing up and down it does, the imp must be hovering on the other side, trying pretty damn hard to stay in the hole.");
	output("\n\nYou immediately dive forwards, relishing the idea of taking in another load of demonic cum. Your groin tingles as your lips make their way down the oddly textured shaft, engulphing nearly 10 inches of demon-cock, feeling it press down your throat. You curl your tongue around and begin sliding back and forth, immediately rewarded with a thick dribble of pre-cum. The imp on the other end loses it immediately, blasting waves of cum directly into your belly as you shove forwards, taking him into the hilt. You feel him pulsing and pull back in time to take the last few loads in your mouth, saving your payment for the goblins.");
	output("\n\nAbruptly, the demon-dong slips through your grasp and out the hole. You hear a loud thump as something lands on the ground. Poor thing.");
	processTime(20);
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,0);
}

public function minotaurGHole():void
{
	clearOutput();
	showName("\nGLORYHOLES");
	author("Fenoxo");
	output("Your eyes are drawn to the huge minotaur cock, and you instinctively kneel down in front of it.");
	output("\n\nIt’s the largest available member in the room by a considerable margin, and from your position on your knees, it looks even more massive; it’s over two feet long, and has three rings of prepuce spaced around its length. You can just barely span your entire hand around its thickness. You open your mouth wide and lean forward, taking the thick, spongy head into your mouth. The taste is incredibly strong, and its musk is as thick as the minotaur’s dick itself. You moan in pleasure, and start bobbing your head back and forth, taking more and more of the dick into your mouth. You stroke the rest of the cock in time with your sucking. You can hear muffled grunting and snorting coming from the other side of the wall, obvious sounds of approval from your partner.");
	output("\n\nDriven on by the minotaur’s reactions, you take more and more of the minotaur cock into your mouth. As you work your mouth around the first ring, you open up the top section of your red, high-society bodysuit, freeing up your three rows of tits. With each pass, you’re able to take more and more of the bull dick down your throat. You caress your back-breaking milky tits while moaning around the dick. When you get your mouth around the second ring, the minotaur’s cock throbs sharply, and his cum explodes in your mouth. Your eyes bulge in shock, and you pull off the cock as quickly as you can. You swallow the first several shots of thick, rich minotaur cum, while the rest shoots all over your face and tits. You hold up your tits as cum rains down upon you. By the time his orgasm stops and his dick goes limp, your face and breasts are covered in a thick layer of spooge.");
	output("\n\nYour head spins from the minotaur’s musk, and you idly mop up and swallow the cum on your muzzle. A goblin aide comes in with a bowl, and gently scrapes the cum off your tits with a smooth, flat rock. Once you’re cleaned up and you’re dressed, the aide leads you back to Lynnette.");
	processTime(10);
	pc.lust(40);
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,0);
}

//All minotaur special bonus
public function minotaurAddictGHole():void
{
	clearOutput();
	showName("MINOTAUR\nCOCK");
	author("Fenoxo");
	output("As the heady dicks twitch and throb, a familiar, heavenly scent catches your nose and wicks into your brain, flooding you with need and molten-hot lust. Lynnette saunters over with her lips slightly pursed and her body jiggling, but you brush her aside. She’s completely forgotten as you close in on the source of your olfactory bliss. Your sigh dreamily while your pupils slowly dilate from the familiar chemicals pounding through your bloodstream and puffing up your twat with liquid arousal.");
	output("\n\nYou push your way past a few more staring goblin sluts, tearing off your red, high-society bodysuit as you go. The animal part of your brain recognizes that such needless trapping would just get in the way of all the thick, dripping, minotaur spunk just waiting to pump inside you. Another door swings closed behind you while the scent drags you heedlessly deeper into the salon, closing in on the secluded glory-holes the goblins keep hidden away in the back. You drool spittle down your neck while you lose yourself in the memory of that taste on your tongue, letting your body seek it out on autopilot. A trail of female slime and pre-cum a few inches wide winds over the rough-hewn floor behind you, clearly marking your passage to the overpowering musk.");
	output("\n\nTime passes in a slow, torturous manner, but you turn the corner and sigh. Salvation is at hand – you’ve reached the glory-holes, and to your delight there’s nearly a dozen hard, dripping, delicious... mmmm... minotaur cocks crammed through the holes, some bulging out around the seams and leaking with need. You saunter forwards, hips swaying sensually as the drug-like desire of potent minotaur musk pulls you ever closer. Mewling happily, you take one of them in hand and stroke along its length, giggling as it pulses and leaks a stream of heavenly goo down your arm. You lick it from your arm in one long, languid motion before pursing your lips around the minotaur’s flared tip and sucking it hard as you quest for more of its heady ambrosia.");
	output("\n\nYou hear a deep, strangled sigh as more and more delicious pre floods your mouth, lighting your senses up with a fireworks show of pleasure and increasing the size of the puddle you’re leaving on the floor. In between gulps of the fragrant fluid, you suck the swollen rod deeper and deeper into your mouth, gleefully suppressing your gag reflex as it pushes aside your uvula. You work your throat, feverishly swallowing to suck it down. A flare briefly distends your neck as it’s taken deeper and deeper inside your form until your lips are puckered through the hole and you’re sniffing the minotaur’s pheromone-laced crotch.");
	output("\n\nThe beast pulls back and starts pounding the hole, letting out deep, rumbling sighs of pleasure with each throat abusing glory-hole fuck. If it weren’t for his constant, bubbling preseed turning your throat to a slippery rut-hole you’d be rubbed raw, but instead you continue to lean forward, sniffing at his matted pubes every time he crushes them against your dick-stretched lips. The other horny studs grunt with displeasure, but you reach out with your hands and grab hold two eager brutes’ throbbing horsecocks. Three out-of-sync heartbeats hammer through your hands and throat while you do your best to get them all off.");
	output("\n\nYou let your eyes drift closed and lash your tongue back and forth across the minotaur’s lowest medial ring, feeling his flare bulge larger inside you in response. The beast-man batters at the wall, grunting in equal measures of passion and pent-up desire as his cock’s tip stretches wide and locks itself inside you. His urethra bulges in rhythmic contractions, stretching your lips around the already swollen shaft and signaling to your musk-addled mind that you’re about to get what you desire. You hum with blissful delight as your belly begins to gurgle, accepting long bursts of sticky minotaur drug.");
	output("\n\nTied down by the cum-spurting flare locked in your gullet, you pump on the other two dicks with feverish speed and sway on your hooves as the narcotic spooge intoxicates your already-addled mind. You can feel each muscular contraction pulsing through the bestial shaft while it finishes depositing the heavy, sticky load, and your eyes cross from the viscous inebriation that’s pooling in your belly. Drizzles of pre-cum soak into your arms and palms, drawn out from the frenzied pumping of your fists. They won’t come from just a hand though. They need something... tighter.");
	output("\n\nYou start moaning in drug-induced bliss, but your vocalized pleasure is interrupted by the squelching slurp of the softening shaft being pulled from your dick-puckered lips. It drips a rope of cum over your mouth and chin as it pulls free from the wall, leaving behind one vacancy among the swarm of ready minotaur dicks. You lick up your stud’s leavings and purr in bliss, reaching through the hole to cup the departing minotaur’s balls teasingly. He grunts and walks out of your grip – sated for now. You curl your fingers into a come-hither gesture, retract your arm through the sweat-lubricated glory-hole, and wait for one of the other minotaurs to come over.");
	output("\n\nThe beast who kept your left hand so busy repositions himself at the now-vacant opening, and you decide to reward him for moving so quickly. You lick the last of the salty cream from your lips and muse that he isn’t the only one getting a reward, but the monstrous cow-man doesn’t need to know that. You wrap the pillowy flesh of your three rows of breasts around the new member, pleasantly surprised by its girth and wide, already-flared tip. Maybe you could have gotten him off with your hands after all? Runnels of pre cover the shaft and squish wetly between your tits, turning your body into a slip-n-slide that reeks of hot, sticky minotaur sex.");
	output("\n\nYou lower and raise yourself, bouncing up and down on your legs to enhance the tit-fucking you’re giving out. In such a position, you’re given the perfect view to watch as your strokes draw forth large bubbles of pre, and before you can lose your high, you latch onto the minotaur’s vulnerable urethra and suck, tonguing in wide circles around it since you can’t open wide enough to accommodate his flare. Of course, all the attention just makes him flare wider, not just at the tip, but through the whole shaft. The sudden girth change sends an enticing ripple through your multi-layered tits that’s pleasurable enough to make you moan into his steadily-widening urethra. You pull off and bounce faster, lost to your lust and the haze of sex-musk permeating the air, intent on seeing just how much this huge stud can spray onto you.");
	output("\n\nThe minotaur does not disappoint. His hole dilates from the size of the approaching cum-blast, and you sink down his shaft slowly until it’s aimed directly at your face. You close your eyes and feel the first explosion splatter over your obscenely long, black and white spotted goo-hair and forehead. The next takes you full in the face, making it difficult to breathe through the mask of drug-like goo, but a few quick licks gives you a fix and makes it easy to breathe again. On and on, the minotaur pumps fat ropes of spooge over your body until you’re a syrupy, sticky mess that reeks of minotaur pheromones so strongly that dizziness overwhelms you and you fall free of the still-orgasming mino-cock, taking a few final blasts of seed on your milky tits and crotch. Your hands instinctively shovel a few loads into your cunt while the animal part of your brain hopes it makes you pregnant with an equally girthy son.");
	output("\n\nGiggling, you stagger over to the next cock in line and turn around, possessed with the idea of taking its spooge in the most direct way possible – anally. You pull your butt-cheeks apart and lean back, surprising one of the horny beasts with the warmth of your tight anus as you slowly relax, spreading over his flare. He actually squirts ropes of something inside of you, but you’ve been around minotaurs enough to know that it can’t be cum, at least not yet. The slippery gouts of preseed make it nice and easy to rock back and spear yourself on the first few inches, delighting in the drug-numbed pain of stretching yourself beyond your normal capacity.Your backdoor is now a little loose.");
	output("\n\nYou slide down the twitching bull-shaft until your wide, jiggling ass slaps the wall, and you draw slowly away, but you push back harder, turned into a lewd, wanting whore by the massive quantity of minotaur seed in your belly, on your skin, and fogging up the air. The beast pulls out and you whine plaintively, feeling empty and useless until he plunges back inside and reminds you of your purpose. He starts to fuck you hard, not caring for your pleasure at all, slamming his horse-cock deep and fast. Each of his three rings of prepuce presses on your prostate as it squeezes by, making one of your bumpy demon-dicks drip and spurt freely until you can bear it no longer and cum, shaking and shuddering like a wanton whore. Jizz drips and pours from one of your unholy cocks in a steady stream that pools on the floor, slowly rolling towards a drain that doubtless empties into a tank or greedy goblin cunt.");
	output("\n\nThe strength goes completely out of your legs, but you manage to hold yourself up long enough for your stud to flex his cock inside you and fill up your backdoor with more potent addiction. You slide off, nerveless and still orgasming as jizz rains on your back from the abandoned cock, rolling off you to add to the ever-widening puddle of fluids on the floor. Smiling vacantly and addled on more minotaur-cum than any one person has reason to handle, you stumble up on all fours and crawl to the next one. More...");
	output("\n\nLynnette slaps your face, waking you from your stupor. What? Where are you? You look around and realize you’re strapped into a barber’s chair and caked with white goop, but why?");
	output("\n\nThe goblin answers before you can vocalize your query, <i>“Baby, you’re so cum-hungry you make my daughters look like chaste virgins! I haven’t seen anyone go to town on minotaurs like that since my mother passed away, Marae guide her soul. Normally we don’t have that much use for the minotaurs outside of a bit of recreational drug-play, but you milked out so much cum that we can start selling it! Isn’t that great!?”</i>");
	output("\n\nYou nod, a little shocked by your behavior, but already licking your lips in anticipation. Lynnette smiles and says, <i>“You can buy some for the usual price, plus 60 gems, but for right now, how about some hair service? It’s on the house!”</i> Lynnette offers and explains their options, <i>“So what’ll it be hun? We could cut it down or give you a lengthening treatment. Or you can get a hair-dye to use on your own. Just remember to come back in a few days for a touchup.”</i>");
	processTime(60);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

//Minotaur Dream
public function minotaurDream():void
{
	clearOutput();
	showName("\nMINOTAURS...");
	author("?? CoC ??");
	output("You have trouble relaxing as your mind wanders, dreaming of the many encounters you’ve had with minotaurs. You shake, cold sweat on your brow, a pit of emptiness in your stomach, and a seething fire in your loins. You don’t know how long you lie there, but gradually, somehow, dreams overtake you and the cramped isolation of your camp falls away to reveal a sweeping vista. Halfway up the slope of a mountain, the way down the sheer cliff face is a dizzying descent of jagged rocks. The plateau you find yourself on is fairly wide and is populated by a great many caves that wind down, deep into the mountain’s core. There is a strange sense of familiarity to this place, as if you... belong here.");
	output("\n\nYour presence does not go unnoticed. The owners of the caves step out of the shadows and you find yourself surrounded on all sides by the hulking, vulgar forms of minotaurs, their titanic cocks stiffening while their overfull balls sway heavily between their legs. You don’t remember how you got up here, but there is no way out. A thrill of panic shoots up your spine and you try to call for help, but your voice catches in your throat, barely more than an impassioned whisper. Then, they are upon you. Coarse hands grab your arms and hips, throwing you into the small circle at the center of the mob, the oafish beasts crowding against each other to surround you. They loom impossibly tall over you, the corded muscles of their barbarous chests hiding their faces from you, but you can hear them snorting in perverse impatience as they scuff their hooves on the ground, the flesh of their profane shafts engorged and straining in the air around you.");
	output("\n\nThe minotaurs grab their dicks and begin jerking themselves off, pumping their bitch-taming rods frantically, their unseen eyes boring holes of lustful desire through your body. Alarmingly, you seem to have lost your red, high-society bodysuit to the monstrous men, your nude body bare to their lascivious, rutting needs. You huddle against the ground, fearful of the bulls’ ejaculate, but something is wrong. Despite their best efforts, none of the cocks swarming around you are releasing their seething seed. You push yourself up to a sitting position and, hesitantly, reach a hand out to one of the shafts, its deeply-veined trunk bulbous and pulsing. Placing the lightest touch of your fingers on the cylindrical tip, the minotaur immediately reacts, jerking his hands down to the base of his shaft, his cockhead flaring outward in a fleshy bulge that pushes the tip of his urethra out in a gaping, mouth-like pucker. You barely have time to blink before the minotaur’s orgasm bursts forth, hot streams of creamy spunk lancing through the air to splat wetly on your face in sticky ropes. You recoil as the monster’s jizz pours from its arm-thick cum pump, the spurting cascade white-washing your love-pillows with the pale, liquid alabaster of his desperate need.");
	output("\n\nThe deluge from his straining flesh tube slows and you sputter, trying to wipe the tainted, milky pearls from your body when the smell of the semen wafts into your nostrils. An all-too-familiar weakness creeps into your limbs, addictive pheromones burning a depraved path from your nose directly into your brain, conquering your feeble will. Panting, sweat beading on your brow, you try to hold back, but the feral potency of the bull-men has subdued your fear and outrage, leaving only a domesticated need to serve. No longer the master of your body, your arms reach out and stroke more of the surrounding cocks, coaxing each one to fountain you with polluted, ivory loads, the pallid ambrosia lacquering your black and white spotted fur, coating you in the savage seed of your masters. You gratefully turn up your head to catch the full brunt of the torrid geysers with your face, syrupy cream rolling down your nostrils and filling your mouth until it runs over.");
	output("\n\nYou realize, at last, the bestial intelligence in the minotaurs. They did not simply take you, though you were unarmed and outnumbered. Instead, they let your own weakness doom you - a willing slave to the ecstasy of their loins. As you grasp at the melon-sized balls churning all around you, begging for ever more of their nectar, a distant, fading voice begs you to hold out, to escape. That final thought is driven away as the sublime arms of your masters lift their freshly broken cum-dump high into the air. They crowd so tightly that they seem to be holding you over a sea of straining phalluses, spunk still bubbling from their engorged tips. The palpable need to breed you ignites the bodies of your animalistic tyrants with smoldering heat. Then, as time seems to slow down around you, they thrust your tamed body down, jamming endless inches of minotaur cock deep inside the latest of their submissive cock-sleeves...");
	output("\n\nYou awaken from the vivid dream at the sensation of penetration, lurid images slowly fading in the morning light. Yet, somehow, you can still just barely smell the blissful odor of minotaur spunk.");
	processTime(30);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

//Minotaur x cowgirl voyeur
public function minotaurXCowgirls():void
{
	clearOutput();
	showName("MINOTAUR\n& COWGIRL");
	author("?? CoC ??");
	output("You can continue to search for new locations, or explore your previously discovered locations.As you pass a shadowy cleft in the mountainside, you hear the now-familiar call of a cowgirl echoing from within. Knowing what’s in store, you carefully inch closer and peek around the corner.");
	output("\n\nTwo humanoid shapes come into view, both with pronounced bovine features - tails, horns and hooves instead of feet. Their genders are immediately apparent due to their stark nudity. The first is the epitome of primal femininity, with a pair of massive, udder-like breasts and wide child-bearing hips. The other is the pinnacle of masculinity, with a broad, muscular chest, a huge horse-like penis and a heavy set of balls more appropriate on a breeding stud than a person. You have once again stumbled upon a cow-girl engaging in a not-so-secret rendezvous with her minotaur lover.");
	output("\n\nYou settle in behind an outcropping, predicting what comes next. You see the stark silhouettes of imps and goblins take up similar positions around this makeshift theatre, this circular clearing surrounded on the edge by boulders and nooks where all manner of creatures might hide. You wonder if they’re as eager for the upcoming show as you are. The heady scent of impending sex rises in the air... and with it comes something masculine, something that makes your stomach rumble in anticipation. The mouth-watering aroma of fresh minotaur cum wafts up to your nose, making your whole body quiver in need. Your slavering pussy immediately dampens, aching to be filled, while one of your unholy cocks rises to attention, straining at your red, high-society bodysuit.");
	output("\n\nYou can barely see it from your vantage point, but you can imagine it: the semi-transparent pre-cum dribbling from the minotaur’s cumslit, oozing down onto your tongue. Your entire body shivers at the thought, whether from disgust or desire you aren’t sure. You imagine your lips wrapping around that large equine cock, milking it for all of its delicious cum. Your body burns hot like the noonday sun at the thought, hot with need, with envy at the cow-girl, but most of all with arousal.");
	output("\n\nSnapping out of your imaginative reverie, you turn your attention back to the show. You wonder if you could make your way over there and join them, or if you should simply remain here and watch, as you have in the past.");
	output("\n\n--");
	output("\n\nThe prospect of getting a huge dose of that fresh minotaur cum is just too much to bear. Before you realize what’s happening, you’re moving out of your rocky hiding spot and making your way down to the two bovine creatures, stripping your red, high-society bodysuit as you go. By the time you reach the two figures, you’re as naked as they are. You shiver softly, whether due to some chill in the air or desperate anticipation, you can’t say.");
	output("\n\nThe cow-girl is bent over, her hands on a low ledge with the minotaurs hands on either side of her ample ass. She moans, more like a moo than a human groan, as the minotaur plunges into her quaking depths. As you step forward, suddenly unsure of yourself, both the bull and the cow turn their sharp gazes on to you. You feel very small as they look you up and down. The entire area goes silent, even the goblins and the imps that are no doubt watching seem to be holding their breath, wondering what will happen to you.");
	output("\n\nThe minotaur grunts, finally, as if he finds you acceptable, and turns back to the plush ass before him, plowing into it once more. The cow-girl, however, motions for you to move forward, and latches onto a lavish nipple when you do. Her soft lips encircle your areola, while her tongue dances over the rapidly hardening flesh of your teat. Your breasts tingle with the slightest bit of suction, making you gasp as small droplets of milk escape your nipple and roll over the cow-girl’s tongue. She sucks more and more, eagerly gulping down your refreshing lactic beverage.");
	output("\n\nAll the while the minotaur continues grunting, thrusting his massive member into the woman’s hungry cunt. The two rock back and forth, pushing her face right into your breast before pulling back again. The cow-girl’s legs tremble and you suddenly find her arm grasping your shoulder for support. Her other hand drifts down between your own naked legs, ignoring your cocks entirely, slipping a finger into your moistening pussy. A low moan escapes your lips as a second finger slips in while the busty bovine woman’s thumb swirls around your clitoris.");
	output("\n\nThe broad-shouldered minotaur urges his mate onto her knees while he does the same, his dick never leaving its temporary home. The cow-girl pulls you along, bringing you to your knees and then onto your back. You have a moment of sudden modesty as you fold your legs, trying to block your crotch from view. The bovine woman simply chuckles in between moans and lightly presses your knees apart. Your legs spread wide, lewdly showing off your nether region to the cow-girl, and anyone else that’s watching.");
	output("\n\nWithout wasting any time, the girl leans down and, once again ignoring your manhood completely, dives tongue first into your wet quim. The movement is so quick that you can’t even suppress the sudden, perverted moan that leaves your lips... a moan that sounds shockingly like a cow’s moo. The surprise at your sudden bovine outburst quickly dissipates as the cow-girl’s large tongue dips in and out of your sodden box. Any remaining fears of joining this very public sex show are gone, and you wonder why you didn’t join in sooner.");
	output("\n\nThe tongue lavishes your hole, paying homage to your crotch in the only way it knows how. Your breath comes shorter while your arms and legs tingle, fingers and toes curling against your will. The cow-girl laps and licks, her broad mouth muscle slipping in and out, curving in and around to hit every tender part of your insides. You run your fingers through the woman’s long red hair, forcing her head even deeper into your crotch. With her head down like this, you have an easy view of her ass high up in the air, getting fucked senseless by the minotaur. Every thrust makes the cow-girl moan into your lap, the added vibrations causing you to squirm even more.");
	output("\n\nThe bull thrusts in to the hilt, letting out one final bellow of pleasure. The cow-girl brings her head up, her mouth and chin slick and dripping with your juices. She lets out a moo-like bellow along with the minotaur, whose balls churn, no doubt depositing a heavy load of that delicious cum directly into her waiting womb. You lick your lips, wishing you could just wrap them around that cock right now, to get your fix and feel the blissful sensations of relief run across your body.");
	output("\n\nThe girl gibbers incoherently as she slides off the minotaur’s still-rigid cock, a small spurt of pearly white spunk running down her thighs. The minotaur smirks, smacking the cow’s ass and casually pushing her to the side. A goofy grin is plastered on her face, eyes rolled up into their sockets like she’s just experienced the most divine fuck imaginable. He then looks you dead in the eyes and says, in a deep, masculine and very dominant voice, <i>“You get to ride my cock next, cow.”</i>");
	output("\n\nHis rough, strong hands grasp your legs and draw you closer. You squirm half-heartedly, not really trying to get away. Though your mind tries to fight it, you know all you really want is that warm, sticky cum inside you one way or another. You want to be just like the half-unconscious girl beside you, stuffed with cock and turned into this rugged man’s breeding bitch.");
	output("\n\n<i>“Eager for a fucking, huh slut?”</i> he taunts, his turgid member resting along your stomach. You nod slowly. You feel a deep burning in your core. You want that cock inside you. You want to be filled to bursting with this bull’s seed, to feel it churn within your womb, knocked up by this manly beast. <i>“That’s a good slut,”</i> he grunts, pulling his cock off your belly and rubbing the slick, flat head against your awaiting loose, slavering cunt. He teases you with the slight contact until you open your mouth to voice your complaints, then he suddenly thrusts inside. Any words forming on your tongue fly away, replaced by a whine of relief as your hole gets stretched wide by the invading member.");
	output("\n\n<i>“Ahh, yeah. That’s some good cow-pussy right there,”</i> he groans, more of his bombastic cock slipping deep inside you. The minotaur hooks an arm under each of your knees, lifting up your lower body, pressing even deeper. Powerful sensations drift up from your g-spot as the minotaur’s wide flare strokes it through your vaginal walls. Biting your lip with barely contained pleasure, you bring your hands to your breasts, playing with your milk-sodden nipples in between each orgasmic thrust of the bull’s hips.");
	output("\n\nA giggle comes from your side, as you see the cow-girl is back up onto her knees, having recovered from her exalted orgasm. She crawls forward, kneeling just over your head and leaning in to kiss her minotaur lover. The two whisper sweet nothings to each other, too vague and indistinct to hear, but it doesn’t matter. All you can focus on is the dick lodged firmly inside of you... that, and the soaking cunt of the cow-girl just inches from your face. Alabaster droplets drip down her legs, one even landing on your lips. Before you can stop yourself, you lick them clean, savoring the taste of the second-hand cum.");
	output("\n\nSome part of your mind voices a complaint at what comes next, a voice that’s quickly squelched inside the addiction-fueled haze of your brain. You pull your head upwards and extend your tongue, slurping a large glob of cum from the cow-girl’s snatch. There’s a surprised yelp from above you, followed by a coo of pleasure. To your surprise, the cow-girl actually lowers her cunt down onto your face, giggling madly, filling your nostrils with the scent of her muff, with the scent of recent sex. Not letting this opportunity go to waste, you repay her actions from earlier, slipping your tongue inside her, eagerly licking out and guzzling down the remnants of the minotaur’s present.");
	output("\n\nThe minotaur, for his part, is in no rush to give you a cream pie of your own. His thrusts are slow and deliberate, with a rhythm that has you writhing with pleasure. The three of you moan together like some kind of erotic pyramid. The bull’s assault on your womb increases slowly, and you can feel your limbs tingling at the prospect of your mino-cum-induced orgasm.");
	output("\n\nIt starts in your fingers, where your nerves seethe, gathering up fistfuls of grass like one might grab a sheet. The heat continues down your arms and strikes your body like a lightning bolt, your belly suddenly spiking up, back arching as the orgasmic thunderstorm rolls over you. The flames don’t stop there, however. They travel down into your crotch, suddenly lighting up every nerve in your slavering fuck-hole like a Christmas tree. You’re acutely aware of every single movement, every pulse, every little bit of contact between you and the huge cock living inside you.");
	output("\n\nYour muscles spasm and clench as the minotaur lets loose a powerful roar. His own member twitches, suddenly releasing a flood of hot cum into your awaiting womb. The moment that long-awaited jism hits your walls, it’s like another lightning bolt hits. It travels up your spine and sets your entire brain aglow. Ecstasy wrapped in bliss with a side of euphoric rapture consumes your thoughts. Your vision goes white, pearly white like the seed filling your body, and your lips part as a primal <i>“moo”</i> slips out.");
	output("\n\nFor the longest time, the only thing your cum-addled mind can think about is cocks and cunts, of pregnant bellies and stomachs filled to capacity. You mind fills itself with visions of yourself on your knees, servicing this minotaur daily, hoping to please him enough that he might grace your womb with his divine dick.");
	output("\n\nIt takes several minutes for you to come down from this orgasmic high, and when you do, you see your minotaur lover has yet to recover from his. He lays on his back in the midst of this clearing, his still-rock-hard cock jutting upwards, coating in a mixture of various juices. The cow-girl sits beside him, carefully licking the towering pillar of cock clean. You sit up, wobbly and clutch your stomach. Filled with cum in two ends, you can’t help but feel oddly unsatisfied. Perhaps guzzling down some second-hand cum isn’t quite enough to sate your hunger. Perhaps you need it straight from the tap, as it were.");
	output("\n\nYou gingerly sit up, your body still quaking with pleasure. Every movement sends another luxurious aftershock rippling through your body. You crawl over to the splayed out minotaur, opposite your cow-girl partner, and join her in licking the man’s cock clean. It takes some work, but soon it glistens in the light of the red sky above you.");
	output("\n\nAs if you both possess some kind of bovine telepathy, you both lean forward, wrapping your uppermost breasts around his monolithic shaft. Your faces meet and her soft lips press against yours, each of you earnestly pressing your tongues into the other’s mouths, swapping the juices you’ve collected over the past hour or so. The bull beneath you groans, awakening to the feeling of four breasts surrounding his love muscle.");
	output("\n\nThe two of your pump your breasts up and down, your lips barely leaving each other long enough to give his member the occasional kiss, lick or slurp. Up and down you go, and this time it’s the minotaur’s body that’s wracked with bliss, writhing on the ground. Milk dribbles from your breasts, coating you, the cow-girl and the minotaur in a fine white sheen and creating a sweet-smelling aroma that permeates the air.");
	output("\n\nThe bull groans, biting his lip as a third, and likely final, orgasm rips through him. His hips buck upwards, his cock flaring up and out of your mammaries. Ropes of immaculate silver seed jet from his cumslit, arcing up into the air several feet before splattering down on your heads. Wasting no time, you slip your lips around the flare, gulping down mouthful after mouthful of the sweet man-milk. Even though it’s his third load of the hour, it’s just as big as the others, and soon your find you can’t swallow any more; your cum-laden belly just won’t allow it.");
	output("\n\nSadly, you relinquish your hold on his cock and sit back, watching the cow-girl opposite you pick up where you left off, slurping up whatever you missed with a dedicated fervor.");
	output("\n\nNow you feel satisfied. Filled with that precious, precious minotaur spunk in both ends, fresh from the source. You slump onto your back and drift off into a hazy, bull-filled dream world....");
	output("\n\nYou awaken several hours later. The minotaur and the cow-girl are nowhere to be seen, but your red, high-society bodysuit is left neatly folded next to you, along with a small bottle filled with some white liquid, most likely a gift from your “bull”.");
	output("\n\nYou quickly re-dress and head back to camp, spying the occassional goblin or imp scurrying from its hiding spot, no doubt recovering from their own self-inflicted orgasms.");
	processTime(45);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

//Minotaur Submission
public function minotaurSubmission():void
{
	clearOutput();
	showName("\nMINOTAURS");
	author("?? CoC ??");
	output("The huge bull-man grabs you around the waist with one hand and flips you over. You hang upside down in his grip, your legs splayed in the air. The minotaur rubs your face across his sweat-slick balls, smearing his musk into your skin. Each of the minotaur’s testicles is bigger than a man’s head, and the skin of his sack is pulled taut over his cum-filled balls.");
	output("\n\nThe minotaur traps your legs in one hand and slams your back against the cold cave wall. You gasp, spraying drops of musky sweat from your lips. Dragging you against the rough stone, the minotaur lifts you higher and bends your legs back over a rock ledge. You are pinned against the cave wall, legs held in one of the minotaur’s hands while his other roughly gropes your stretched-out body. The bull-man grabs your back-breaking tits, squeezing and mauling them with his calloused hand. Your wriggling bunch of drooling, nubby shafts slap painfully against your belly as the minotaur drags you along the wall. All you can see is the minotaur’s huge shaft, the tip grinding against your mouth. The minotaur slaps his cock-head against your face, rubbing his musk and pre-cum into your cheeks and hair.");
	output("\n\nThe minotaur reaches down and grabs your jaw, yanking it open. You know what’s coming next but decide not to fight it. Submitting to this beast is the safest choice. You spread your jaws as wide as you can and bend your mouth towards the minotaur’s monstrous cock-head...");
	output("\n\nWasting no time, the minotaur grinds his glans past your lips and tries to force the tip of his animalistic stallion-prick into your mouth. Snorting and grunting, he pushes your head against the cave wall as he shoves the tip past your teeth. The minotaur’s pre-cum pools in your mouth and dribbles out the corners, leaving trails of slime down your face. You breathe through your nose, inhaling the minotaur’s musk, as the brute forces another fraction of an inch of bull-cock into your mouth. Taking yet another quarter-inch of slimy meat, you wonder if it wouldn’t be better to let yourself pass out while the minotaur uses you.");
	output("\n\nYou hear a POP and feel a sharp pain in your jaw as the minotaur forces its full cock-head into your mouth. The head slides past your jaws and into your mouth, pinning your tongue down and jabbing against the opening of your throat. The flared end of the shaft wedges itself behind your teeth. The minotaur moans, a sound somewhere between a bull calling to its herd and a man groaning in ecstasy. You grab the bull-man’s shaft in both hands and brace yourself, trying to pull your head away from the cave wall. The minotaur starts grinding its hips, and with one hand grabs your head and twists it from side to side, rubbing its huge tip around in your mouth.");
	output("\n\nYou arch your back off the wall, resting your weight on the minotaur’s fat flared stallion-cock. Your chest and belly rub against the minotaur’s massive torso, painfully grinding your milk-leaking cherry-like nub against his wiry fur, and you can feel the minotaur’s hot breath on your quadruple soccerball-sized testicles. The bull-man snorts and jerks his hips as you twist your hands around his shaft, hoping to make him cum sooner. You tickle your tongue against his cock-head and start sucking as hard as you can. You bend your neck as the minotaur grinds itself in your mouth, hoping to make the tip easier to take. The minotaur jerks his hips in short spasms and you can hear its grunts coming closer and closer together. You take a deep breath through your nose, filling your lungs with air before the beast floods your throat with its cum...");
	output("\n\nWith no warning the minotaur yanks your legs off of the ledge and grabs your waist. He shoves you down hard on his shaft while slamming his hips foward. Your eyes go wide in shock as the minotaur rams the massive tip of its cock past your mouth and into your throat. Grunting and moaning the minotaur forces its cock into your throat, inch by inch as it grinds you around its shaft. Your throat bulges as the first ridge around the minotaur’s cock approaches your lips.");
	output("\n\nThe minotaur bellows and slams its hips forward, forcing the ridge past your lips. You’re almost out of air and the edges of your vision are starting to fade. All you can see is the minotaur’s belly. Its duo of watermelon-sized balls spasm just below your head, pumping hot come through its equine dong. The first wave of minotaur cum swells his cock and pushes past your teeth. The bull-man cums deep in your throat, inflating your stomach with hot seed. All you can feel is the minotaur’s bloated shaft rammed deep into your throat, blast after blast of thick cum forcing its way down his cock and into your belly.");
	output("\n\nThe minotaur grunts a few last times. Finished with you, it lifts your leg and pulls you off its fat animalistic stallion-prick. The huge cock-head slides through your throat, gets jammed behind your teeth, and finally pulls free with a loud sucking sound. Cum pours from your throat and over your face, and the minotaur sprays a few final loads across your bloated stomach. The minotaur drops you in the cum-pool and walks away, leaving you to cradle your distended belly and swoon as his drug-like sperm addles your mind. You pass out with a blissful smile.");
	processTime(30);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

public function minotaurCampBadEnd():void
{
	clearOutput();
	showName("MINOTAUR\nCAMP");
	author("?? CoC ??");
	output("You grin and stumble up the mountain, inhaling deep breaths from moment to moment to make sure you’re on the right track. The scent gets stronger and stronger, making you wet and hard with anticipation. Though you don’t notice, your pupils have dilated and your eyes are glassy from the smell alone. Scrabbling up the rocks, you’re oblivious to the cuts and scrapes that form on your hands and arms from the frantic climb. You pull yourself up onto a ledge and heave yourself over it, lying down to pant and drool from exhaustion. Only after you’ve recovered do you realize that you’ve found them!");
	output("\n\nThere’s a whole village of minotaurs here! Twenty or thirty cave openings are tunneled into the mountain, and an equal number of crude huts are built on the surrounding ledge. You aren’t looking at that way – your eyes are riveted by what you see between the two sets of structures. There are five of the shaggy beast-men gathered around a fire-pit, roasting some animal and relaxing. Two of them are vigorously fucking tiny minotaur-like beings with feminine features, spearing their much shorter brethren on their mammoth shafts. The look on the faces of the ‘minitaurs’ is one you know well, the pure ecstasy of indulging a potent addiction.");
	output("\n\nA third beast has a human-looking victim suspended by her ankles and is roughly fucking her throat. Her eyes are rolled back, though whether from pleasure or lack of oxygen you’re not sure. A pair of beach-ball-sized breasts bounces on her chest, and a cock big enough to dwarf the minotaur’s flops about weakly, dribbling a constant stream of liquid. She must be one of the slaves that escaped from the factory, though it doesn’t look like her life has improved much since her escape.");
	output("\n\nOne of the unoccupied monsters glances your way and gives you a predatory smile. He puts down the axe he was sharpening and strides over, his loincloth nearly tearing itself from his groin as his member inflates to full size. Amazingly, this minotaur bothers to speak, <i>“New fuck-toy. Suck.”</i>");
	output("\n\nHis words are music to your ears. Crawling forwards, you wallow in the dirt until you’re prostrate before him. Looking up with wide eyes, you grip him in your hands and give him a gentle squeeze. You open wide, struggling to fit his girthy member into your eager mouth, but you manage. A drop of pre-cum rewards your efforts, and you happily plunge forwards, opening wider as he slips into the back of your throat. Miraculously, your powerful needs have overcome your gag reflex, and you’re gurgling noisily as your tongue slides along the underside of his cock, massaging him.");
	output("\n\n<i>“Need... more!”</i> grunts the beast, grabbing you around the neck and pulling you upwards, forcing himself further and further into your throat. Normally being unable to breathe would incite panic, but the pre-cum dripping into your gullet blasts away the worry in your mind. You’re face-fucked hard and fast until you feel your master’s cock swelling with pleasure inside your throat. It unloads a thick batch of creamy minotaur jism directly into your stomach, rewarding you until your belly bulges out with the appearance of a mild pregnancy.");
	output("\n\nYour master pulls out and fastens a leather collar around your neck before dragging you through the mud back to his campfire. Between the tugging of your collar and rough throat-fucking, you’re breathless and gasping, but you couldn’t be any happier. Your new owner lifts you up by your plush ass and forces himself inside your ass, stuffing you full of thick minotaur cock. Still heavily drugged by the load in your gut, you giggle happily as you’re bounced up and down, totally relaxed in your master’s presence.");
	output("\n\nHe grunts and cums inside you for the second time, somehow still able to flood your bowels with what feels like a gallon of cum. Drooling brainlessly, happy gurgles trickle from your throat as you’re pulled off and tossed to the side. You don’t feel the impact of your body landing in the mud, or even notice when you’re passed around the camp-fire, broken in as each of your new monstrous masters has his turn.");
	processTime(60);
	var cumNum:Number = pc.cumQ()*6;
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

//Minotaur Urethral fuck
public function minotaurUrethralFuck():void
{
	clearOutput();
	showName("\nMINOTAUR");
	author("?? CoC ??");
	output("Overcome with lust and fatigue, the minotaur falls to the ground as you unhurriedly remove your full platemail. The minotaur’s eyes roam all over your body, his massive cock hard and throbbing. You slowly begin to stroke your own hard cock, pre-cum beginning to drool thickly from the head and over your hand. You slide your hand up and down your long shaft, lubing it with your juices as you decide what to do with the fallen brute before you. An idea forms in your mind and your cock throbs with anticipation, your imagination already working out the entertaining details.");
	output("\n\nWith a hand covered in pre-cum, you roughly grab his fat prick and you smear it onto his flared cockhead, feeling it throb in your hand from the sensation. You press the head of your knee-length, demonic dong against his and start rubbing it slowly in circles, spreading your sweet pre all over its flared tip while your other hand slowly strokes his tool. The minotaur closes his eyes, enjoying the feeling of your hand and girthy, perverse pecker rubbing against his own. It’s then you make your move. You suddenly shove your nubby shaft hard against the wide head of his equine-like prick. Naturally finding the only hole available, your drooling, bumpy demon-dick slides straight into his urethra fully on the first rough thrust. The minotaur’s eyes open wide in surprise and he moos loudly at the abrupt stretching of his cock-hole. His moos quickly turn to grunts as you thrust into him, but you remain unconcerned whether or not he is in pleasure or pain, only interested in the tight hole wrapped firmly around your perverse pecker.");
	output("\n\nThe minotaur’s grunts slowly turn into moans of pleasure as his body gives in to the stretching you’re giving him, even making occasional thrusts towards you in an attempt to fit more of you into him. You smirk at the way you’ve managed to make this mighty beast into just another fuck toy for you to enjoy. As he thrusts at you again, you decide to oblige him. You firmly grasp the flared head of his cock with both hands and yank his cock onto yours even further. It presses into your groin and you feel a tight pressure at the tip of your demonic cock. You shove once more, only to feel a hot liquid coat the head of your demonic dong. Looking down, you realize your entire length has filled and even surpassed his own - the warm liquid splashing your head with each hard thrust as thick cum boils up from inside him! You continue to pound your demonic cock into his and with aid from his hot sperm covering its head, your orgasm quickly approaches. You eagerly double your speed and before long, you slam your fluid-leaking, infernal prick as deep as you can into him and unleash your seed directly into his urethra. You realize with a smile (and a groan from the minotaur) that his watermelon-sized balls and prostate could get quite a stretching, but the thought is quickly pushed aside as loads of cum pour out of you in mighty spurts. With each consecutive outpouring of jizz, you feel his balls swelling bigger and bigger until you’ve unloaded your last drop.");
	output("\n\nYou survey the results of your orgasm, quite pleased and more than a little bit proud. His balls have swollen grotesquely, now so large that he will have difficulty moving. The minotaur groans in pain and it occurs to you that in his current state he can’t manage to cum either. As you pull your spunk covered cock free from his now gaping urethra, another wicked thought comes to your mind. You shove the minotaur so he lands on his chest. His ass sticks out in the air and his legs are spread wide, hips held high from the beach ball sized balls underneath him. You reach underneath him and pull his cock back towards you, leaving it pressed snug against the ground with his heavy balls pinning it down. The cock-hole still gapes lewdly from the pounding you gave it, a slow oozing of your cum flowing back out. You run your hand over your cock to gather up the cum coating it then reach down and smear it over his tight asshole, feeling it pucker and clench against your fingertips. You continue smearing it until your semen has coated it liberally. You smack his ass hard, then turn around and holler as loud as you can, knowing it will interest every horny creature within earshot. You look back once at the minotaur and see his eyes wide with fear as he starts mooing, desperate to get out of the predicament he is in. You hesitate, seeing such an inviting target, but you tire from your performance and you leave the struggling creature to the inhabitants of the mountain.");
	output("\n\nYou know that he won’t be able to leave or put up much of a struggle until he’s managed to cum, but with his balls pinning his cock down, that could be a while. Meanwhile, his raised ass and stretched urethra invite everyone around to take a turn.");
	processTime(30);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

//Izma Dominance Fights
//Izma victory
public function izmaVictory():void
{
	clearOutput();
	showName("\nIZMA");
	author("?? CoC ??");
	output("Your legs buckle, and your mind fogs with arousal; you are too turned on to continue fighting and collapse bonelessly into an aroused heap.");
	output("\n\nIzma shakes her head, grinning wryly. <i>“Looks like somebody needs to get more discipline before they try a sex-off.”</i>");
	output("\n\nAs you collapse in defeat, you’re aware of the pretty tigershark stalking around you and removing her clothing. She grabs hard on your red, high-society bodysuit and undresses you with minimal effort, revealing your throbbing erection and slavering cunt.");
	output("\n\n<i>“Dirty little minx, ain’t ya? You wanted this, didn’t you...”</i> Izma teases, shoving two fingers into your moist nether-lips, to test the waters. The peneration of your needy cunt does serve to make you whimper softly, almost begging to just be filled. Izma’s eyes widen as her entire hand seems to slip into your cavernous vagina. <i>“Holy shit... what’s been up here?”</i> she mumbles, laughing nervously in amazement.");
	output("\n\nPulling her fingers free, Izma quickly flips your nude body over, leaving you on your back and staring up at her. Izma’s hands are resting on her hips and she seems to be puffing her large chest out proudly. Her foot-long cock is fully erect, hot beads of pre-cum occasionally dripping onto the sands. She takes the time to examine your own cock, grinning with her fangs bared. <i>“Let’s see what you’ve got, weakling.”</i> Izma manages to supress a snort of laughter at the sight of your cock. <i>“Um... wow? It’s simply... heh, huge...”</i>");
	output("\n\nSeemingly done appraising you, Izma roughly grabs your hooves and pulls your rear upwards, forcing your weight onto your spine and making you cry out from the uncomfortable position. She doesn’t waste time on foreplay, simply deciding to bury her cock into you slowly, inch by painstaking inch until she’s pushing against the entrance to your womb.");
	output("\n\nShe starts thrusting in and out of you, gradually increasing the speed and force, her hot pre-cum and your feminine juices acting like a lubricant to make things easier. <i>“Ahh~ You’re a lovely cock-sleeve... you like being treated like this, don’t ya, weakling?”</i> Izma taunts, slamming in and out of your snatch.");
	output("\n\nEvery thrust pushes you deeper into the sands, and eventually you find yourself pumping your hips upward against Izma’s own, eager to pleasure her and yourself. Izma seems to notice this and laughs loudly. <i>“Oh? You really like being dominated? Ha, I thought as much.”</i> She continues to taunt you as she pounds into you, her balls smacking against you every time. Your mind is too clouded with lust to hear even half of what she says. Right now all you care about is getting off.");
	output("\n\nWithin minutes, Izma gives one final, powerful thrust and roars loudly, cum pumping into your womb and spraying out onto the sands. One of your demonic cocks twitches and pulses, ready to blow. Izma quickly takes hold and points them toward your face, stroking you to your own climax. Jets of your own cum splatter across your face and body as you writhe, protesting. <i>“Tch, you really thought I’d let you cum on ME? Maybe if you actually managed to beat me I’d give you the honor,”</i> Izma says, pulling free with a loud *SCHLICK* sound. She releases your hooves, allowing your thickly-padded backside to hit the sand with a plop, and gets to work redressing while you lie still.");
	output("\n\nShe gives you a wink and tosses the promised tooth at your feet before diving into the water, presumably to clean herself off. Several minutes later, you wash up as well and stagger back to camp, sore from the ordeal. Izma sure can be rough when she wants. A part of you wonders if you could see her that way again... You realize what you’re thinking and shudder, forcing the submission-tinged desires down. Where did they come from, anyway?");
	processTime(30);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

//Izma loss
public function izmaLoss():void
{
	clearOutput();
	showName("\nIZMA");
	author("?? CoC ??");
	if(rand(2) == 0)
	{
		output("You watch the defeated tigershark closely and a grin forms on your face. You touch a hand to her forehead and push her onto her back with minimal effort, slipping her clothing off. She hardly lacks the strength to stop you, but she knows full well what the terms of the battle were, so she’s not going to go back on her word. You remove your full platemail and spread Izma’s legs wide, one of your unholy cocks almost painfully erect as you lift her quartet of balls up to look at her glistening womanhood.");
		output("\n\nNot wanting to waste any time on foreplay, you push your knee-length, perverse pecker into Izma’s slit as far as you can manage, making Izma gasp sharply and writhe against you. You snicker and start thrusting into her, the odd little tendrils inside her cunt teasing and massaging your cock. The walls themselves are so tight and smooth that her pussy conforms to you like a glove. It almost feels like Izma’s snatch was made just for you. Hell, maybe it was made for you, given just how eager Izma seems to be whenever she sees you. It’s like she loses to you on purpose.");
		output("\n\nYou start to pick up speed as you mash your hips against Izma’s own, earning moans from the pretty tigershark which only seem to get louder with every subsequent thrust. Izma quickly starts to return the gesture, moving her hips up to meet your own thrusts every time. It’s while she’s doing this that you notice her throbbingly erect cock wobbling around.");
		output("\n\nDeciding that it’d be rude not to, and because you want to see just how loud you can make Izma moan, you grab hold of her raging erection and start jerking her off while you pound into her. The move seems to surprise Izma, and she starts moaning and screaming in pleasure. The double stimulation you’re pulling off pushes Izma past her limit very quickly, and she starts shooting thick jets of spunk into the air, which begin to rain down on her face and breasts. Her vaginal walls clamp down on your blighted cock almost painfully as the orgasm wracks her female genitalia too.");
		output("\n\nIzma starts panting and gasping for breath after the intense release, but immediately starts groaning when she realizes you are not done. You giggle and release her softening erection, placing both hands on her thighs as you start to redouble your efforts at fucking her. You push Izma deeper and deeper into the sands with each thrust, and despite her exhaustion Izma gives a few soft pleasured moans.");
		output("\n\nAfter a lengthy fuck, you grunt loudly as your knee-length, nubby shaft swells, blasting streamers of jizz into Izma’s womb and onto her groin, causing Izma to cry out loudly. You sigh happily and push back from her, weakly getting to your slimey cillia. You’re not done yet though, not fully.");
		output("\n\nIzma gasps again as you plant your slavering twat onto her face, grinding against the angular features and moaning loudly as her obliging tongue darts past your lips. You could really get used to this feeling. You ride her face for another few minutes before an orgasm rocks your female parts, splattering girlcum onto Izma’s face. You sigh happily and weakly get to your feet, redressing. You see Izma fishing something from her storage chest - a plant of some sort - and munching it down.");
	}
	else
	{
		output("You smirk as Izma slumps down, unable to fight against you anymore.");
		output("\n\nYou push her onto her back and see her inhuman dong flop free from her skirt. Seems the combat turned the little shark on. Well, ‘little’ is hardly the right word to describe any aspect of her, especially when she has a 15-inch rock-hard erection waving over her. It actually brings a dopey grin to your face. Well, you earned a reward, so you might as well take it.");
		output("\n\nYou lean down and start licking and suckling the tip of her monster dick, slurping up her hot pre and lubricating the tip of her raging boner. She moans and jerks at your touch, writhing around and loving the sensation of submissiveness. The feeling of having her under your power manages to bring a smile to your own face.");
		output("\n\nGradually you start to suck more and more of her cock, inch after inch moving down your throat. You gag lightly as you finally reach the base of her cock, before pulling it out. She whines weakly and looks at you pitifully, wondering why you’re teasing her. You remove your full platemail before turning to show her your thickly-padded ass, and a small smile spreads over her angular face as she realizes what you have planned. You plant your hands on your backside and pull your cheeks wide, before starting to slide onto her well-lubed pecker.");
		output("\n\nShe grunts and huffs as you slide down, and you too feel a strain from her iron-hard dick despite the various fluids lubricating it. But gradually pain turns to pleasure and you’re both moaning loudly and calling each other’s names as you ride her. Your anus is now a little loose.");
		output("\n\nThe shark grits her teeth and gives a roar as she cums, blowing a massive, hot load straight up your ass, bloating you slightly as she empties her quads inside you. Your muscles twitch and contract, and you can swear you see stars as she ejaculates. It takes you a while to catch your breath as you slide off her slowly softening meat pole and crawl onto the sand.");
	}
	processTime(30);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

public function CoCSceneEpilogue(cumNum:Number):void
{
	clearOutput();
	showName("\nMINDWASHED");
	output("Whoah! That one was weird. Like something out of a really fucked up game on the extranet. You feel so much dirtier for letting that world into your mind.");
	pc.taint(1);
	if(cumNum <= 0) 
	{
		output(" The lingering sexual feelings tingle in your [pc.vagOrAss].");
	}
	else if(pc.hasCock())
	{
		if(!checkToyDrawer(BubbleBuddy))
		{
			output("\n\nYou glance around and realize your in-simulation orgasms were matched by real world ones as well.");
			if(cumNum <= 0) {}
			else if(cumNum < 20) output(" Spurts of jizz have left dripping blobs on the panels and across the floor. It’s a bit embarrassing, but shouldn’t be too hard to clean up.");
			else if(cumNum < 100) output(" Large puddles of cum are pooled around your feet and you even seem to have hit yourself with some of it while you were under. You clean up as best you can, but somebody else is going to have to give this place a good scrub. Whoops!");
			else if(cumNum < 4500) 
			{
				output(" The panels around you are practically coated with the dripping curtain of cum you’ve released. Your body didn’t fare much better, and everything is sticky. You should really consider getting something to catch all this next time!");
				pc.applyCumSoaked();
			}
			else 
			{
				output(" A sudden wave of exhaustion hits you and you numbly glance around. Every surface is coated in dripping streams of spunk, from the walls to yourself, and even the machine itself. Thankfully, it seems to be waterproof. You don’t have the energy to clean up, so you’ll just have to stew in your own juices for a while longer.");
				pc.applyCumSoaked();
				pc.applyCumSoaked();
			}
			output(" You gradually get up and put your gear back on.");
		}
		//player has a penis and a Bubble Buddy
		else
		{
			output("\n\nWhen you’ve finally put the after-effects of the simulation aside, you note that your rubbery cum-sheath has a present for you. It seems your VR orgasms were mirrored in real life and the Bubble Buddy has collected the results. You twist-seal the package and put your gear back on.");
			// {player gains cum bubbles as if taking the Masturbate option with the Bubble Buddy}
		}
	}
	mindwashNextButtonAndStatAwardsAndClears(cumNum);
}


public function jezebelMindwash():void
{
	clearOutput();
	showName("JEZEBEL’S\nDUNGEON");
	author("Carol J");
	var cumNum:Number = 0;
	output("You’re a fool, you think to yourself through the haze of pleasure and exquisite relief you’ve found between your latest lover’s thighs. A stupid, feckless fool. If a deal like hers had sounded too good to be true, there wasn’t a doubt that it <i>was</i> too good to be true.");
	output("\n\nBut you’d taken it anyway. You’d made your wager and decided that you were strong enough to weather whatever hex she cast. That you could overcome whatever handicap she saw fit to weigh upon your shoulders. You grunt, empty your balls into the latest slut that sashayed into your path, and thank any gods or goddesses that might be listening that you were wrong.");
	output("\n\nHow long have you been in here for? It couldn’t be more than a few days, but the fugue of sex and rut dizzy your memory and make the whole blurry mess stretch on for what could be weeks. Maybe it could help you pin down something specific if you think back to how it all began. Probably not, given that you’ll likely end up hilted in some velvet-soft cunt before too long, but you have to at least pretend to struggle against this sinful pleasure.");
	output("\n\nThe first thing that happened when you stepped into her dungeon was...you pinned down a succubus and fucked a child into her. No! No, no, it had been...Gods, it was so hard to think! You had made your way into the dungeon, and in a puff of sulfur and glittering pink, SHE had appeared. Jezebel, the Queen of Succubi. The vile demon that had captured your beloved and spirited her away to the depths of the netherworld. As beautiful as she was malicious, with a body that weaker men would do anything to lay but a single finger upon.");
	output("\n\nBut you were stronger than them, and you were stronger than her. Or so you had thought. She dispelled such foolhardy notions within moments of your trespass, and she did so cannily. Your silver armor sent flaking into uselessness, and your sword along with it. In a matter of seconds, Jezebel had rendered you helpless, naked as a babe before her awful majesty. You remember...staring at her tits. Gawking at her milk-bloated udders and begging to suckle at her drooling teats as you fucked her cunt.");
	output("\n\nNo! No, you have to focus! Gods, but it’s hard to think... You haven’t cum in minutes!");
	output("\n\nYou remember standing tall in the face of her cowardly tricks, resolute despite her treachery. And you remember an offer.");
	output("\n\nWhether or not it was the truth, Jezebel was quite candid in revealing her motives. <i>“True love,”</i> she had said, <i>“is rarer than gold and all the more precious for its scarcity.”</i> And to test your devotion for your beloved princess, she posed a challenge: if she could lay but one hex upon you - one tiny little spell - then she would allow you to proceed through her dungeons unmolested. Not just by her, but by all her fell, seductive minions. Not a one of them would lift a finger to impede your progress. If there were to be any detours - and surely there would not be any, given the gravity of your quest - they would be your own. Completely voluntary.");
	output("\n\nNothing that would hurt you. Nothing that would <i>necessarily</i> stop you. Nothing that would keep you from proceeding and saving your princess. Unless you let it.");	
	output("\n\nYou had agreed, like a fool, and she laid her silk-smooth hands upon you. Jezebel had cupped your balls, hissed her siren’s spell, and departed with a smirk... leaving you to proceed.");

	processTime(20);
	pc.lust(50);
	cumNum += pc.cumQ();
	pc.orgasm();
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",jezebelMindwashII,cumNum);
}

public function jezebelMindwashII(cumNum:Number):void
{
	clearOutput();
	showName("JEZEBEL’S\nDUNGEON");
	author("Carol J");
	output("It wasn’t until some time had passed that you realized what she’d done to you. Certainly you were no stranger to carnal desire; your vows included many things, but celibacy was not among them. But even if you were used to more...libidinous urges, you weren’t used to them surfacing with such intensity. And certainly not so quickly. Not five minutes had passed before you felt your balls bloat heavier with an unspent load. Nothing unmanageable, but there was a certain uncomfortable fullness to your sack. One that only grew the further you proceeded.");
	
	output("\n\nEventually you’d come across a goblin, all voluptuous curves and bared, green skin. Jezebel had told the truth. She hadn’t lifted a finger to stop you, but the impish grin on her beestung lips spoke volumes, and it was so devilishly easy to convince yourself that you needed relief if you were going to concentrate. You laid back, snarled a command, and watched her strut forward, your eyes locked on the sway of wide, child-bearing hips.");
	
	output("\n\nWhen she straddled your lap and wriggled her peach of an ass over your naked, throbbing cock, you were practically holding your breath. Waiting for her to drop down, to take your cock in her cunt and milk it dry. Only so you could clear your head, of course. It was important to keep in mind that this was really all for the princess’ sake. When the goblin had slammed her hips down and taken you to the hilt in one wet, sloppy push, you took solace in the fact that you were only going to stuff this little bitch full of stiff, throbbing cock so you could be united once more with your beloved princess. No matter how good a fuck this little green-skinned slut was, she was just a tool to help you get to your one, true love. No matter how fucking <i>good</i> it felt to pump a load of thick, sperm-packed seed into her womb, you were only doing this to clear your head.");
	
	output("\n\nYou were doing this for love, you reminded yourself as you cock-slapped the little creampied tease, shivering at the whorish moan that passed her lips in response. Now that your head had cleared - if only a little - you could proceed.");
	
	output("\n\nThings get hazier as you retrace your steps in your memory, and it’s difficult not to dwell on that. It’s a mess of rut and sex. Your latest conquest glistening on your shaft did one hell of a job distracting you from the dizzying twists and turns of Jezebel’s dungeon, and before you knew it, you were stiff again, your cock twitching with every step. It was torturous, and even if you knew that it was just the effects of Jezebel’s spell, it didn’t make it any easier to shake off the mounting need to empty your balls somewhere hot, wet, and tight...again.");

	output("\n\nSo thank goodness you’d run into that enchantress. Buxom and beautiful, she’d gone to her knees in seconds when you commanded her to, and even if you didn’t quite have the energy to slamfuck her until her womb was bloated with your cum, she had a few tricks of her own. A few tricks that you were skeptical about...until the urge to cum grew too strong to resist. She mouthed arcane incantations for what felt like hours as she kneaded the pillowy flesh of her tits up and down against your shaft, but finally she finished and planted a doting kiss on the tip of your cockhead. The black of her lipstick seemed to tingle, but soon after that, her spell took hold of your member and...well, did exactly as she said it would.");
	
	output("\n\nA bigger cock meant that you could cum more and more, she’d purred up at you as you groaned your frustration. If your balls were too backed up for you to think clearly, all you needed was a bigger cock to pump out that seed, mm? The idea had made frightening sense to you, and it was that pernicious thought that made you accept her offer.");
	processTime(30);
	cumNum += pc.cumQ();
	pc.orgasm();
	cumNum += pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",jezebelMindwashIII,cumNum);
}
public function jezebelMindwashIII(cumNum:Number):void
{
	clearOutput();
	showName("JEZEBEL’S\nDUNGEON");
	author("Carol J");
	output("So there you were, stumbling forward, your cock sagging under its own weight, your balls swollen past the size of your fist, your quest to rescue the princess but an afterthought in the swirling haze of your fuckdrunk lust. You kept assuring yourself that you’d look for the princess...as soon as you cleared your head. Thank goodness Jezebel’s dungeon had so many curvaceous sluts to help you unload your spunk. Goblins and succubi to fuck pregnant, enchantresses to further enhance your bloated cock...");
	output("\n\nAfter a few hours of rut and sex and debauchery, you stagger into the penultimate chamber, the blighted throne room of the succubus who cursed you with this insatiable libido. Your mind is still your own, you reassure yourself, and the moments of clarity you achieve after one of Jezebel’s monsters milks your cock dry are enough to help you power through the curse she laid upon you. True, they’re shorter and shorter. True, it feels far better to let her seductive minions further enhance your manhood and worship it, as they so eagerly say it deserves.");
	output("\n\nIf you’re being honest with yourself, the sight of three freshly creampied goblins mashing their tits up against your twitching fuckrod and wringing out every last drop of spunk you have is...pleasant, to say the least. But that’s not why you’re here! You’re here to.");
	output("\n\nTo, uh.");
	output("\n\nTo save your beloved! Or something. Jezebel kidnapped someone, and you have to save her, and that’s why you let her curse your prick. More like <i>“bless,”</i> really. You think back fondly to the last round you had with one of the devil-worshiping enchantresses roaming the halls. The dumb bitch was so blinded by her own corrupt desires that she thought you were an <i>incubus</i>. Absurd. Still, that made it easier to bend her over and rape a child into her, so you’re hardly complaining.");
	output("\n\nThe thought of how many fatherless children you’re going to leave behind in this miserable dungeon brings a smirk to your face, and you wonder if it wouldn’t be worth it to wander the halls a bit longer to make sure each of Jezebel’s slutty little temptresses have a full womb.");
	output("\n\nThe thought sends your cock twitching, and even if sagging under its own ponderous weight, you can still enjoy the lightheadedness that an erection brings now. Fucking hell, but you can’t focus on your quest with your cock throbbing like this! Not to mention your balls churning with even more thick, virile cum. The door to the princess’ chambers is right ahead of you, behind Jezebel’s cursed throne...but you have to take care of this first.");
	output("\n\nAnd it looks like Jezebel is prepared to lend a helping hand. The queen of succubi flutters up behind you, giggling as you reach out and clumsily grope at her, snarling that you’re going to bend her over and make her your bitch as soon as you catch her. She feigns sympathy and shakes her head with a pout. Floating just out of reach, Jezebel coaxes you forward with every bounce of her breasts and every sensuous sway of her hips...");
	output("\n\n...until the strain proves too much to bear. With your bloated cock taking up so much blood, you’re remarkably easy to exhaust now. You have to rest for a moment. Have to sit down and catch your breath before you finally grab the dumb whore and impale her on your manhood. No other seat in sight, you stumble to Jezebel’s throne and collapse back into it, panting.");
	processTime(30);
	cumNum += pc.cumQ();
	pc.orgasm();
	cumNum += pc.cumQ();
	pc.orgasm();
	cumNum += pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",jezebelMindwashIV,cumNum);
}

public function jezebelMindwashIV(cumNum:Number):void
{
	clearOutput();
	showName("JEZEBEL’S\nDUNGEON");
	author("Carol J");
	output("It’s comfortable. The sudden sensation of lips pressing kisses up against your cockhead, even moreso. You look down, only to find two succubi tenderly licking and suckling at the bulging tip of your penis, almost meek in their worship. And why wouldn’t they be? Your cock is magnificent, a monument unto itself, the kind of fuckpillar that has bitches cumming around it the instant you hilt yourself in them...assuming they can take your length. Still, it hardly matters if you can gape a monster’s cunt with your cock when they’re so eager to worship you with their mouths and breasts instead.");
	output("\n\nYou lean back in the throne and let your eyes sink shut. Your lips curl up in a satisfied smile, and your two adherents earn a dollop of precum for their worship, which they lap up eagerly.");
	output("\n\nYou hear someone giggle, and it’s enough to make you crack one eye open. When you see the source of the laughter, your manhood gives an involuntary twitch. Goblins. More of them, creeping into the throne room. Drawn by the scent of your musk, no doubt. Stupid little cock-obsessed whores are practically begging to be stuffed full of cock. Soon you shove the two succubi aside in favor of a quintet of busty, green-skinned sycophants, and they repay your favor by mashing their tits up against your cock, all of them, all at once, and cooing their praise up at you with wide, adoring eyes.");
	output("\n\nLife is good, you decide, but...you can’t help but wonder if you’ve forgotten something.");
	output("\n\nWhatever. You’ll remember when you cum. All you have to do is bust a fat, sloppy nut in one of these dumb, submissive whores, and you’ll have a clear head. You can stop whenever you want. You’re not weak like they are. After all, how could you be? You’re not the one on your knees. You’re the one in the throne, commanding your slaves to pleasure you. You’re the one who gets to cum whenever he fucking wants. You’re the one strong enough to overcome the curse Jezebel cast. It was designed to stop you, right? To trick you into giving up your quest or whatever. Joke’s on her, you finished it with flying colors! You got to her throne room and claimed your place as the king. You brought her forces to heel with nothing more than your magnificent prick and their own empty-headed urges.");
	output("\n\nYou almost feel sorry for these stupid whores, utterly incapable of resisting the compulsion to fuck and cum.");
	output("\n\nYour thoughts are hazy, but you’ve come to enjoy the dizziness that accompanies a goblin’s cunt around your prick. Or an enchantress’ tits wrapped around your shaft. Or a succubus’ lips suckling at your cockhead. The only problem is that split-second of stark ennui after you finish emptying your load into whatever hole you’ve decided to fuck. That little instant of confusion, as if there’s something to do besides rut and breed and cum.");
	output("\n\nBut your enchantresses are quick to assure you that even that will fade in time. It’ll fade even faster if you let them further enhance your body and mind, and once you finish gulping down one of your goblin’s tinctures - you knew you had to try at least ONE when you heard it would make you grown a second cock - you tell them to do so.");
	output("\n\nTrue love, you vaguely remember hearing, is rarer than gold and all the more precious for its scarcity. But who needs love? Especially when it means you’re shackled to the same woman for the rest of your life. Fuck love. You don’t need that. Not when you have a harem of women to worship you, to breed themselves on your manhood, to shower you in praise and ensure you don’t have to do anything but cum.");
	output("\n\n...");
	processTime(40);
	cumNum += pc.cumQ();
	pc.orgasm();
	cumNum += pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",jezebelMindwashV,cumNum);
}

public function jezebelMindwashV(cumNum:Number):void
{
	clearOutput();
	showName("JEZEBEL’S\nDUNGEON");
	author("Carol J");
	output("Every now and then, Jezebel flutters into your throne room, amused for some reason. But the uppity cunt won’t put out, so you just growl and wave her away. What good is a woman who won’t let herself get bred? Stupid bitch should just fuck off and let you rape more children into your goblins and succubi.");
	output("\n\nThen again, one of your enchantresses had an interesting idea the other day. True, your slaves had bodies made to wring men dry, but...more of the same grew boring after a while. So why not send some of your troops to kidnap a princess or two? You’d practically bred an army already. Why not capture some human fuckmeat to rape an heir into?");
	output("\n\nThe thought brings a smile to your lips. You like the sound of that.");
	clearMenu();
	addButton(0,"Next",CoCSceneEpilogue,cumNum);
}

//Shekka goes through the mindwash, by B!
//Overview:
//A short expack for Shekka and the Mindwash Visor, as requested by Fenoxo. There isn’t much more to explain than that: it’s just a handful of scenes where Shekka gets sexy memories implanted into her head and she acts them out. Ta-da!

//[=Shekka=]
// Continue here when the PC selects the [=Shekka=] button from the Mindwash Visor menu
// (scene: First Time 1)
public function useMindwashOnShekka():void
{
	clearOutput();
	showShekka();
	author("B!");
	IncrementFlag("SHEKKA_MINDWASHED");
	if(flags["SHEKKA_MINDWASHED"] == 1)
	{
		output("You look at the device before you, with the wires and the sensitive materials connected to it. ");
		if(pc.characterClass != GLOBAL.CLASS_ENGINEER && pc.IQ() <= 65) output("You’re not totally sure how it works");
		else output("It’s a pretty simple device, honestly");
		output(", but you’re sure that if anyone could appreciate a device like this, it’d be Shekka. You use the ship’s intercom to call her to you.");
		output("\n\nShekka is with you just a moment later. <i>“Yeah, [pc.name], what’s–”</i> she asks, then halts herself, as she eyes the device in your hands. It’s little more than a headset with a visor, which is connected to a socket in the wall.");
		output("\n\n<i>“Is that what I think it is?”</i> she asks, pointing to it obliviously. You ask her you don’t know: what does she think it is? <i>“Well, I’ve only read about it in some theoretical engineering tabloids, but it looks like one of those memory abrogation devices. I’ve only ever seen a diagram or two, but... I kind of doubt this thing just plays some music.”</i>");
		if(pc.IQ() <= 65 && pc.characterClass != GLOBAL.CLASS_ENGINEER) 
		{
			output("\n\nYou stutter. Uh, yes! You tell her that it’s exactly what she’s thinking, and that that would have been your first guess, as well. Great minds think alike!");
			output("\n\nShekka giggles. <i>“It means that this thing rewrites memories. Or... rather, it ‘implants’ them, at least temporarily. It’s sort of like having a really, really vivid dream, but it’s someone </i>else’s<i> dream, and you’re living it out.”</i>");
			output("\n\nYou collect yourself and answer more appropriately.");
		}
		else 
		{
			output("\n\nYou reply that that’s exactly correct: this device, you’re told, can rewrite memories, and place new ones in the wearer’s mind.");
			output("\n\n<i>“Well, not </i>exactly<i>,”</i> she answers. <i>“It doesn’t ‘rewrite’ them as it does... temporarily ‘overwrite’ them. Sort of like a really vivid, waking dream, but you’re living out someone </i>else’s<i> dream.”</i>");
			output("\n\nYou hum to yourself as you consider your answer and her own.");
		}
		output(" Yes, as a matter of fact, that’s what this device does. You wanted to call Shekka here because you thought she would appreciate a piece of modern engineering like this one.");
		output("\n\n<i>“Hell yeah I would,”</i> Shekka answers, eyeing the device from the plug to its visor. <i>“This is some pretty advanced tech; I couldn’t have <i>hoped</i> to have the funds to put one together before I met you! Like, do you have any idea what the process to extract memories, and then write them in a... I guess the word ‘format’ would be appropriate, in such a format that the brain could process it all?”</i>");
		if(pc.IQ() <= 65 && pc.characterClass != GLOBAL.CLASS_ENGINEER) output("\n\nTo be honest, you hadn’t put a lot of thought into the workings of the machine and how it functions, or how or where it gets the data for its memories. You just know what the lady that sold it to you said.");
		else output("\n\nWhile you haven’t cracked the device open or anything, you could probably reverse-engineer it with some time. It honestly doesn’t sound all that complicated to you.");

		output("\n\n<i>“Have you used it yet?”</i> she asks, her eyes wide and sparkling with delight at the very concept of the device. ");
		//yes:
		if(flags["BADGER_MINDWASH"] != undefined) output("You reply that you have; you, uh, you enjoyed it.");
		else output("You answer that you haven’t, actually; you had only gotten a hold of it recently.");
		output(" <i>“Can I... can I try it? Man, if this thing is real, I’d love to experience it for myself!”</i>");

		output("\n\nGiven how enthusiastic she is, you couldn’t possibly turn her down; you motion towards the chair and invite her to sit. She’s giddy as can be as she sits down, and you had her the device; the earpieces fit awkwardly around her massive, floppy ears, and the headpiece is a bit fragile underneath its own weight, but she’s excited to give the device ");
		if(flags["BADGER_MINDWASH"] != undefined) output("a try.");
		else output("its inaugural activation.");

		output("\n\n<i>“Think of the applications!”</i> Shekka says excitedly as she adjusts and readjusts the headset, nervous to keep it steady on her head. She fidgets the visor slightly to ensure that its translucent screen covers all facets of her vision. <i>“Like, say, an artist, a painter, could upload their memories to this thing. A lifetime’s worth of artistry and mastery over their craft. Then, someone else could use it to learn everything that painter’s learned in the space of an afternoon. It could further the knowledge of our species, of</i> all <i>species, to unimaginable heights in the space of a generation!”</i>");
		output("\n\nShekka continues to rattle off some of the visor’s applications when you tighten the band around her head and flip the switch. Sure, there are plenty of miraculous applications that this device could have – but, in this degenerate universe, it could also be used sexily. She’ll figure it out in a hurry.");
		//[=Next=]
		processTime(10);
		// end scene (scene: First Time 1); go to (scene: First Time 2)
		clearMenu();
		addButton(0,"Next",shekkaFirstTimeMindwashII);
	}
	// Continue here if it’s not the first time
	// (scene: Intro)
	else
	{
		showShekka(true);
		output("You use your ship’s intercom to call Shekka to you. In just another moment, your Raskvel engineer is with you.");
		output("\n\n<i>“Hey, captain, what do you–”</i> she begins, then stutters, as she realizes where she is... and what’s in your hand. You smile coyly at her and ask if she happens to be in the mood to give the visor another go – you’re in a giving mood, and, well, you rather enjoyed the show last time. And, if memory serves, so did she.");
		output("\n\nShekka grins wryly as she considers the offer. <i>“Well, I guess I wouldn’t want the invitation to go to waste,”</i> she says.");
		output("\n\nShe turns and secures the door behind her, to give you both a bit of privacy. That done, she strips down, until she’s naked as could be; after her first outing with the device, she’s since learned to expect every time with it to be a little messy. ");
		if(!shekka.hasCock()) output("Her pussy glistens and puffs only slightly: the idea of giving the visor another try has already got her a bit ready");
		else output("Her huge horse dick flops limply with her every step, but its circumference bulges every other moment: the idea of using the visor once more already has her in the mood");
		output(".");

		output("\n\n<i>“So, do you use this thing at all, [pc.name]?”</i> she asks as she sits in the chair, wriggling her ass into the cushion to get herself nice and comfortable, <i>“or do you just get off on watching others use it?”</i>");

		output("\n\n");
		//Used it:
		if(flags["BADGER_MINDWASH"] != undefined) output("Of course you’ve used it. You understand the risks just as well, but, you’re not about to let her, or anyone else, have all the fun to themselves. You paid for it, after all.");
		else output("You avoid the question and instead ask Shekka if it bothers her that you watch. Of course, if it does, then she doesn’t have to use the device at all. She laughs, and, following your example, does not answer.");

		output("\n\n<i>“Let’s see what else this thing’s got in store for me, then,”</i> she says giddily as you gently fit the device around her massive, floppy ears. When it’s good and snug against her head, you flip the switch and let it do its thing. You can hear sounds play from the headphones, and you see a myriad of lights and images from the visor, and in just a few more moments, Shekka is ‘gone.’");
		processTime(10);
		clearMenu();
		addButton(0,"Next",shekkaRepeatMindwash);
	}
}

// (scene: First Time 2)
public function shekkaFirstTimeMindwashII():void
{
	clearOutput();
	showShekka();
	author("B!");
	output("As soon as the device hums alive and you can see some lights begin to blink on the visor’s screen, Shekka freezes up and stops muttering about the device’s usefulness. <i>“Wait,”</i> she implores suddenly, <i>“this isn’t – I thought – wait! Wait...”</i>");
	output("\n\nHer voice trails off after that, until she’s silent as could be while the machine does its work. Her pupils dilate; her jaw hangs slack; and her body goes somewhat limp in the chair. You can see her eyes move back and forth quickly, and you can hear a very faint sound from the headphones against her ears. It’s clearly having an effect on her, although you can hardly imagine what memory she’s witnessing right now.");
	output("\n\nLike you had expected, though, given who you bought the machine from, you can see the effects the device is having on Shekka’s body. Her fingers fidget and her hands reflexively go from the chair’s armrests to her knees, then to her crotch; she doesn’t bother trying to unzip or remove her suit, and she plays with herself straight through the fabric.");
	output("\n\n<i>“Elijah,”</i> Shekka whispers to herself, her tongue slipping from her lips to wet them with a long, thick lick, one swipe for each lip. <i>“I had waited so long for this, Elijah....”</i> Whichever memory she’s experiencing, it’s clearly from someone smitten with someone named Elijah.");
	output("\n\n<i>“No,”</i> she whispers, a little louder. Shekka thrusts her chest out and her arms bend upward, to her sides, giving her invisible lover free, unrestricted access to her upper body. She leans to one side, thrusting out her right boob; her erect nipple pokes obscenely at the fabric of her suit, and her body rotates in a slow circle, following some unseen pattern instinctually. <i>“Start here... touch me here.”</i>");
	output("\n\nYou stand there, admiring the sight of Shekka being so completely engrossed in the Mindwash Visor’s mechanics. Her body fidgets in small, excited bursts; she’s acting like a pure, blushing virgin, being taken for the first time by someone that knows how to press all her right buttons. <i>“N-No,”</i> Shekka stutters, her body rocking forward from her chest to her belly, <i>“there... I like it there. Touch me there.”</i>");
	output("\n\nShekka has completely surrendered to the device, and she’s begging ‘Elijah’ to touch her. You could... you could take the role of ‘Elijah’ right here and now. Help Shekka act out her false-memory. She’s clearly in need of some ‘external stimulus.’ But, on the other hand, she isn’t herself right now, technically speaking....");

	//[=Touch Her=][=Do Nothing=]
	processTime(3);
	clearMenu();
	addButton(0,"Touch Her",shekkaMindwashFirstTime3,true);
	addButton(1,"Do Nothing",shekkaMindwashFirstTime3,false);
}
// end scene (scene: First Time 2); regardless of the option chosen, go to (scene: First Time 3)

// (scene: First Time 3)
public function shekkaMindwashFirstTime3(touch:Boolean):void
{
	clearOutput();
	showShekka();
	author("B!");
	if(touch)
	{
		output("Hell, it’s not like you and Shekka haven’t fucked already. She trusts you enough to subject herself to whatever this device is doing to her; you doubt she’d mind if you got a feel, especially when she’s asking for it – even if she isn’t totally herself. You ");
		if(pc.hasKnees()) output("kneel");
		else output("place yourself");
		output(" next to the chair and do as she asks: your hand finds her right titty, and you give her a firm, yet gentle, cup, massaging her boob and palming at her pebbly nipple through her vest.\n\n");
	}
	output("Her fingers fidget, then grip tightly onto the chair’s armrests. Her breathing has increased in pure, sexual excitement, and she chews absently onto her bottom lip. Her legs grind together at the knees, ");
	if(!shekka.hasCock()) output("and you can see a very distinct damp spot spread from between them, at her crotch. The scent of her feminine arousal begins to permeate the air");
	else output("and her horsecock bloats obscenely at the crotch of her pants, straining the fabric there. A damp spot spreads from the bloating, leaking head as the scent of her pre begins to permeate the air");
	output(", and she visibly restrains herself from humping against her imaginary (to you) lover.");

	output("\n\n<i>“If only I had known you felt the same way,”</i> she whimpers as her chest levels out, ");
	if(touch) output("and you follow along with her, bringing your other hand to her other boob and giving it as much attention as its sister");
	else output("as you imagine ‘Elijah’ moving to her left tit");
	output(". She moans in horny delight, and you watch her shiver in her seat; her legs kick spontaneously, trying to find a comfortable position to be in during her horny state. Her hips shuffle back and forth, and Shekka gasps as her ass thrusts forward a bit, stimulated by something.");

	output("\n\n<i>“Kiss me,”</i> she begs, and, almost without any preamble, she gags on nothing. Her lips move in sensual, repeated open-and-closed motions, her tongue flailing out and whipping up and down and back and forth in the air, mingling with her lover’s. ");
	if(touch) output("You’re already in pretty deep, and, you can’t deny, you’re enjoying playing the role as Elijah – you lean in, and you mesh your [pc.lips] to hers, sucking on her pretty lips and tongue as they thrash against you excitedly.");
	else output("Drool runs unabashedly down her chin, dripping onto the material of her suit, and you can see her face turn slightly blue as she struggles to hold her breath so she can keep kissing her lover.");
	//aphro venom!
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED) && shekkaSpitAddicted()) shekkaSpitAddiction(4);

	output("\n\nShekka’s head whips back suddenly, and she gasps, taking in a deep breath of air and her tongue slips back into her mouth. <i>“I can’t take this anymore,”</i> she says, and her body jerks backward, into the chair. Her legs spread wide, as wide as she comfortably can, displaying her arousal unabashedly to you: ");
	if(!shekka.hasCock()) output("her cunt has bloated with her arousal, her puffy lips pushing against, and clenching onto, the fabric of her suit, giving her a <i>massive</i> camel-toe; her juices seep into the fabric’s linings so deeply that occasional beads soak through and drip onto the floor in front of her");
	else output("her massive cock pulses through the stretched fabric with her every heartbeat, and it pushes higher and higher as the flesh bloats with her arousal. Her balls inflate with ready seed, themselves pushing against her pants and framing themselves almost perfectly. Through Shekka’s rabid, horny breathing, you can hear the occasional rip of a fabric stretched too thin: if she gets any hornier, her cock is going to burst straight through her pants");
	output(". <i>“Please... just... just...!”</i>");

	output("\n\n");
	if(touch)
	{
		output("The poor girl is in some serious heat, and she needs something, <i>anything,</i> to give her a bit of release. You’d be a terrible friend to just let her sit there, so you move the hand at her left tit down to her crotch, and ");
		if(!shekka.hasCock()) output("give her a cup, followed by a shallow thrust, your fingers pressing into her through the wet material of her suit");
		else output("gently grip her cresting cock, stroking at it, and you feel the tense fabric of her suit strain even harder to maintain her");
		output(". ");
	}
	output("Suddenly, her hips thrust upwards, and she gasps in pure, sexual delight. Shekka grunts and hisses as her body struggles to maintain its balance on the chair while she fucks the air straight through her pants. Her knuckles turn white from gripping onto the chair too tightly, and ");
	if(!shekka.hasCock()) output("her girlish lube flings from her crotch and arcs through the air on a particularly hasty thrust.");
	else output("her dick lurches tightly against her pants with every push, her pre dribbling from her leaking head at an alarming rate.");

	output("\n\n<i>“Yes, like that, Elijah!”</i> she says loudly – she’s trying to resist the urge to scream in delight as Elijah");
	if(touch) output(" likely does the same thing you’re doing to her right now.");
	else output("... does whatever he’s doing to her. You can’t tell if Elijah is supposed to be fucking her, or if he’s supposed to be going down on her. Either way, whatever’s going on in front of you look like a hell of a good time.");

	output("\n\n<i>“I...”</i> she struggles to say as her hips pump and her juices leak, staining down the inside of her thighs, <i>“I... I love you, Elijah! Gods, this is everything I ever wanted! I, eeeughhh...”</i>");

	output("\n\nApparently, Shekka, or whoever she thinks she is, got a little too excited in the heat of the moment: her body stiffens and goes still, and she starts breathing hard and heavy through her nose as her orgasm overtakes her in a hurry. Her knees buckle and");
	if(!shekka.hasCock())
	{
		output(" you can almost hear her pussy wetly gurgle and squeeze at ");
		if(touch) output("your fingers");
		else output("nothing");
		output("; long, connected streams of her girly-jizz spills from her crotch ");
		if(touch) output("and across your hand ");
		output("in waves that are interrupted by the fabric of her pants, and they splash to the floor in broken flows. They streak down the inside of her thighs, pooling all the way down to her ankles,");
	}
	else 
	{
		output(", with some rapt awe, you watch as the fabric of Shekka’s pants give way: with a loud, harsh tear, her massive horsecock bursts through her pants, standing throbbing and erect as could possibly be, followed by a torrent, then another, of her Raskvel cum arcing from her bouncing balls and across the room. Her eyes close, part in bliss and part in concentration, as her hips pump impishly into nothing, her every thrust complemented by another thick gout of her cum decorating the floor some distance from her chair.");
		if(touch) output(" You stroke her through it all: your hand rubs along her thick, steely length again and again, coaxing more of her cum from her body.");
		output(" Her meat is beet-red and her every vein pulses with blood");
	}
	output(" as she experiences what must be the orgasm of a goddamn lifetime.");

	output("\n\nShekka slumps into her chair, dissolving into it languidly, her tongue lolling from her mouth as she pants in exhaustion. Her head rolls to one side, but her eyes are focused on something in front of her; after she takes a moment to collect herself, her mouth resumes its previous licking-and-smacking motions, restarting her kiss with Elijah");
	if(touch) output(". You opt not to join in this time. In fact, convinced that the show is about to end, you disengage from Shekka and stand back up");
	output(".");

	output("\n\n<i>“Oh, Elijah,”</i> she whimpers. Her left hand rubs and massages at something in front of her, before it dips a little lower and grips at nothing. Then, mapping out Elijah’s waist, she brings her hand around his waist. <i>“That was incredible. It was everything I had hoped it would be. You’re so good to me....”</i>");

	output("\n\nThe fingers of her hand take a very unsubtle tube shape, and she starts jerking her hand by the wrist back and forth: she’s giving Elijah one slow, but eager, handjob. <i>“But I came before you, baby... I can’t just leave a stud like you hanging, can I?”</i> Shekka licks her lips, drool dripping from her lips and onto the material covering her breasts once more. <i>“These balls must be full to the brim after that. Why don’t you lemme–”</i>");

	processTime(35);
	pc.lust(50);
	clearMenu();
	addButton(0,"Next",shekkaFirstTimeMindwashIII);
	// end scene (scene: First Time 3); increase Lust by 50; go to (scene: First Time Ending)
}
public function shekkaFirstTimeMindwashIII():void
{
	clearOutput();
	showShekka();
	author("B!");
	output("The device shuts off suddenly. The light whirring from around its headpiece silences, and the shimmering lights from the visor go dark. Parts of the device, namely, the silver box that looks like a hard drive, are still lit, so the device is still receiving power – the memory must have ended, or something.");
	output("\n\n<i>“–get on my kneeaaash annnnd, uhhhh, lemme suck onnnnn sommmaaaa–”</i> Shekka drones as her ‘implanted memories’ get cut off. She acts out the ending in her imagination: her mind tries to piece together how that memory <i>should</i> have ended, but without the device, she’s simply Shekka, and not the woman getting railed by a guy named Elijah.");
	output("\n\nGingerly, you remove the device from her head, carefully working the wires from around her massive, floppy ears. Her eyes are open, but glassy and unfocused; it takes her some time before she remembers to blink, and, after a few moments, she pulls herself together; she slowly pulls herself into a more proper sitting position, then she pulls her lolling tongue back into her mouth.");
	output("\n\nShe groans and rubs at her eyes as she collects herself. <i>“[pc.name]?”</i> she says dreamily as she tries to get a clearer vision of you and the room around her. <i>“Did... ugh. Where am I?”</i>");
	output("\n\nYou tell her that she is safe aboard your ship, and, if she doesn’t remember, she had just sat through a session with a device that implants memories. You’re careful not to call it by its name – Shekka’s in such a dizzy state that you don’t want to imply that you might have tried to brainwash her or something.");
	output("\n\nAs soon as you describe what happened, though, she bolts upright. <i>“Holy shit, yeah! It worked! Everything worked! It was all so real!”</i>");
	output("\n\nYou say nothing; she’ll figure out just how ‘real’ it was in a moment.");
	output("\n\n<i>“I... I can only remember bits and pieces of it. It really was like a dream, but it was so vivid! It looked so real, it felt so real! It–”</i> she says as she stands, and the wet");
	if(shekka.hasCock()) output(", breezy");
	output(" sensation between her legs hits her very suddenly. She looks down at her body, and her eyes widen and her cheeks flush in realization. <i>“It, uh... it felt pretty real, alright.”</i>");

	output("\n\nYou snicker well-meaningly, and ask Shekka if she wants to go into any more detail. She doesn’t answer right away; she scans the room for the mess that she made, ");
	if(!pc.hasCock()) output("and notes the rather substantial puddle at the foot of the chair. Her juices are still dripping from her suit and down her legs, adding to it");
	else output("and gasps at the long, white streaks of thick Raskvel cum she had painted down the floor of the room. Her hands gently fondle at her tired-and-sensitive cock, and she flaps at the torn material of her suit, surprised that it had given way");
	output(". <i>“Holy hell, I must have given you quite the show, huh, [pc.name]?”</i>");

	output("\n\nYou answer that it was... entertaining, to put it one way. You ask your question again, if she would like to go into detail about what she had seen. <i>“Yeah, I... I was a human woman. Twenty-something years old; the memory is already leaving me. Me and this – yowza, [pc.name], this absolute</i> hunk <i>of a guy named Elijah was there, and this lady that I was, she was a virgin, and she had been after Elijah since they had met in high school.”</i>");
	output("\n\nShe blushes deeper, but in a more shy, goofy way than in an embarrassed way. Her thighs rub together sensually as she recalls it, ");
	if(!shekka.hasCock()) output("and her pussy already threatens to add a bit more to the mess");
	else output("and her cock throbs and bobs under its own flaccid weight, stirring and rousing at the memory");
	output(". <i>“Gods, the way my heart was going pitter-patter at the idea of finally getting a piece of him...! And he was so gentle, but he was insistent; he knew just how to touch me and he was an</i> amazing <i>kisser!”</i>");
	output("\n\nYou ask Shekka if Elijah really was all that, or if she only <i>thinks</i> he was all that because the memories she experienced remembered him being all that.");
	output("\n\n<i>“See,</i> now <i>we’re getting into the ethical stuff when it comes to this device,”</i> Shekka says, indirectly answering your question. <i>“Truth be told, if I really think about it, I don’t think he was all that attractive – or, at least, he wasn’t my type. But you’re right: I thought he was an absolute superstar. How much of that was</i> me <i>saying that, and how much of it was the woman I</i> was <i>saying that?”</i>");
	output("\n\nShekka adjusts her pants to try and get more comfortable");
	if(shekka.hasCock()) output(" (to little avail – her cock is still flopping about with her every step)");
	output(". <i>“That’s what makes this thing dangerous, if you don’t use it in moderation. It’s impossible to know how much is</i> too <i>much, before you forget who you are, and your memories become someone else’s. But then, it also has a ton of benefits to it. Even if it wasn’t my memory... I hadn’t cum that hard in years.");
	if(shekka.hasCock()) output("”</i> She looks down at her torn pants and gives her dick a waggle with her hips. <i>“Evidently.");
	output("”</i>");
	output("\n\nYou ask her if <i>she</i> thinks it’s worth the risk.");
	output("\n\nShekka hums as she eyes the device in your hand. It’s not an easy question to answer, and she takes her time regarding it, and you. <i>“I,”</i> she drones for a moment. <i>“I think I wouldn’t mind a few more turns in that thing. I think I could take it.”</i>");
	output("\n\nAt that, she makes her way to the door, presumably so she can head to her quarters and get a change of pants. <i>“Although, next time, I’ll be sure to dress for the occasion,”</i> she laughs.");

	//[=Next=]
	// end scene (scene: First Time Ending); go back to the ship’s main menu
	processTime(20);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


// end scene (scene: Intro); randomly choose one of the following scenes to play
// (scene: Random 1)
public function shekkaRepeatMindwash():void
{
	clearOutput();
	showShekka(true);
	author("B!");
	if(0 == 0)
	{
		output("Shekka’s posture corrects itself: she sits upright, her back straight against the chair. She lifts her left leg and bends it over the right, crossing them. Her fingers rap against the chair’s armrest impatiently, and she rests her cheek against her other hand, balled into a fist. She immediately exudes a confident, domineering air, as whoever’s memories are being implanted into her begin to act themselves out.");
		output("\n\n <i>“You’re late,”</i> she says lowly, clearly displeased with someone. Her finger rap another wave against the armrest. <i>“I thought I had told you to be here at seventeen-hundred, on the dot. I won’t tolerate disobedience, rookie.”</i>");
		output("\n\nIt surprises you to hear Shekka say these words, and with this tone, but, of course, that’s just another feature of the device. You can be anyone, doing anything, at any time.");
		output("\n\n<i>“This is the third time this week,”</i> she continues, her eyes narrowing as she focuses on something directly in front of her. <i>“I’m starting to think you like it when I put you through the paces. Unless you’re just an idiot?”</i>");
		output("\n\nSilence, for a moment. <i>“There’s no excuse for this, rookie. It’s one or the other. Either you’re dumb, or you like it. Now, which is it?”</i> Another beat of silence – followed by Shekka exhaling through her nose as she grins in satisfaction. <i>“That’s what I figured. Assume the position and show me how much you like it, you little shit-disturber.”</i>");
		output("\n\nShekka uncrosses her legs, giving you an unrestricted view of her ");
		if(!shekka.hasCock()) output("dripping wet snatch");
		else output("her half-chub of a horsecock");
		output(", then crosses them again, the right leg on top. She extends it, pointing her foot directly forward, and she splays her toes, their sharpened nails pointing straight towards you. <i>“You know the drill. Work your way up. Ask me to forgive you</i> properly<i>.”</i>");
		output("\n\nWhoever Shekka is commanding, it’s clear that she wants them to redeem themselves for their rule-breaking by kissing her feet, followed by ‘working their way up,’ whatever that means (and you have a pretty good idea what it does). You stand there as you consider your own options: while this isn’t Shekka you’re with, technically speaking, you doubt she’d mind if you helped her act out whatever memory she’s replaying. Besides, it could be fun....");
		//[=Touch Her=][=Do Nothing=]
		// end scene (scene: Random 1); regardless of the option chosen, go to (scene: Random 1 Cont.)
		clearMenu();
		addButton(0,"Touch Her",shekkaRepeatMindwashVarI,true);
		addButton(1,"Do Nothing",shekkaRepeatMindwashVarI,false)
	}
}

// (scene: Random 1 Cont.)
public function shekkaRepeatMindwashVarI(touch:Boolean):void
{
	clearOutput();
	showShekka(true);
	author("B!");
	if(touch) output("You gotta admit, you kind of like this tone that Shekka has. It’s a different experience with her, when the normally hard-working genius of a Raskvel makes some sexy demands of you. It sends a shiver up your spine when you kneel down in front of her and nestle yourself in between her legs so that you can get to work.\n\n");
	output("Shekka relaxes in her chair and slides forward slightly, ruining her otherwise perfect posture. Her eyes droop in a satisfied half-lidded stupor, and she realigns her fingers so that she could idly chew on the nail of her pinky as she watches ");
	if(!touch) output("her invisible subordinate");
	else output("you");
	output(" service her. She hums once, long and low, almost like a single, elongated laugh.");

	output("\n\n");
	if(touch) output("You get to work, keeping one hand underneath her ankle to keep her steady, as you reverently kiss and lick at the flat of her foot. ");
	output("Her toes splay and they each move individually as you ");
	if(!touch) output("imagine her subordinate ");
	output("suck on them individually. She stretches her leg straight out, pointing her toes, and spreads them slightly, giving ");
	if(!touch) output("her ghostly rookie");
	else output("you");
	output(" easier access to the rest of her leg.");

	output("\n\n<i>“You’re very lucky to be in my squad, rookie,”</i> she sighs, her eyes laser-focused ");
	//No touch:
	if(!touch) output("on a spot just in front of her");
	else output("you and your performance – even if she’s more likely seeing straight through you");
	output(". <i>“Any other sergeant would have you do laps with weights, or would impose sanctions on your rations or something. And all</i> you <i>have to do to make it up to me is kiss my legs and ");
	if(!shekka.hasVagina()) output("eat my box");
	else output("lick my balls");
	output(" a little bit.”</i>");

	output("\n\nYou idly wonder if Shekka isn’t actually acting out some sort of role-play within the memory. Having an uncooperative and undisciplined rookie perform oral sex hardly seems like the most effective correctional exercise. No wonder this rookie kept slacking off.");

	output("\n\nShekka laughs in disdain at something her rookie has said or done. <i>“Enough with the shit, rookie. If you were really going to make some noise about how I manage my squad, you’d have done it by now.”</i> Her hand reaches forward and ");
	if(!touch) output("openly palms at the air, the sharp claws on her fingers scratching harshly at something");
	else output("clamps onto the back of your head, her sharp nails etching into your [pc.skinFurScales] a little roughly");
	output(". <i>“There are some rules that don’t need to be said. And one of them is to never front, especially to your superiors. Always be ready to cash checks that your mouth writes.”</i>");

	output("\n\nWith a harsh pull, Shekka thrusts ");
	if(!touch) output("her palm");
	else output("you");
	output(" into her crotch. She has a toothy grin plastered on her face as she grinds her ");
	if(!shekka.hasCock()) 
	{
		output("wet, gushing snatch against ");
		if(!touch) output("where her rookie’s face might be");
		else output("your face, meshing your [pc.nose] into her button and forcing you to inhale her aroma directly");
	}
	else 
	{
		output("erect, throbbing, sweaty horse cock ");
		//No touch:
		if(!touch) output("against her rookie’s face, her massive equine balls bouncing off their chin");
		else output("into your features: her half-chub-and-rising horsecock grinds against your forehead while your nose and lips are pressed into the taut, leathery sack of her balls");
	}
	output(". <i>“And in this case, I think it’s about time you paid the bills, rookie. Get in there nice and deep. And tell me how much you enjoy being my underling.”</i>");

	if(!touch) 
	{
		output("\n\nIt’s a hot sight, watching Shekka manhandle someone, even if you can’t see them, to ");
		if(!shekka.hasCock()) output("eating her out – and somewhat sloppily, too, given how much of a mess she’s making");
		else output("sucking her off – if that’s what they’re doing at all. Shekka might be perfectly okay with just frotting her thick cock against their face");
		output(". She pulls both her legs up, planting her feet on the edge of the chair, and she spreads her knees, giving her rookie completely unrestricted access to her crotch.");
	}
	else
	{
		output("\n\nYou have to admit, it’s kind of hot to see Shekka take on such a different, domineering role. You love Shekka, of course, but hearing her take such an authorizing tone and feeling her be so insistent in pressing you against her genitals is a different trip all together. You can’t help but submerse yourself in the role of her rookie and eagerly ");
		if(!shekka.hasCock()) output("service her dripping gash, driving your [pc.tongue] into her body to lap at all the delicious juices she’s dripping in her arousal");
		else output("extend your [pc.tongue] to draw long, wanton licks at her heavy, heaving testicles; you bury your nose into her wrinkly sack as you worship her nuts, feeling their heat against your mouth and her cock rise to full erect stiffness above you");
		output(".");
	}
	output("\n\n<i>“Would you rather do some push ups, or would you rather ");
	if(!shekka.hasCock()) output("eat me out");
	else output("kiss my dick");
	output("?”</i> she asks. Her breasts heave in excitement as ");
	if(!touch) output("her rookie goes");
	else output("you go");
	output(" to work on her, her wide grin remaining the whole time as she revels in the power-play between her and ");
	if(!touch) output("whoever’s going down on her");
	else output("you, playing as the role of her subordinate");
	output(". <i>“Would you rather scrub the halls with a toothbrush, or would you rather be on your knees, between my legs, ");
	if(!shekka.hasCock()) output("kissing my clit");
	else output("licking my balls");
	output("?”</i>");

	output("\n\n");
	if(touch) output("You don’t answer, but given the expression on her face, she must be getting one from the rookie. ");
	output("Whatever answers she’s hearing, they’re all the correct ones. She squirms in her seat, and you can ");
	if(!touch) output("see");
	else output("feel");
	output(" her ");
	if(!shekka.hasCock()) 
	{
		output("pussy drip with arousal, flinching automatically as ");
		if(!touch) output("some phantom appendage");
		else output("your [pc.tongue]");
		output(" pierces into it, giving it the fucking it deserves. Her vulva is bloated with blood and her clit stands painfully erect, and every now and then, her thighs clench in pleasure, presumably from ");
		if(!touch) output("her rookie");
		else output("you");
		output(" hitting some particularly sensitive spot.");
	}
	else output("horse cock stand tall, bobbing back and forth from its own weight but never toppling over itself. Beads of pearly pre slide tantalizingly down the broad-side of her cum-tube, and her flare balloons in pleasure every now and then, which is succeeded by another audible splurt of more of her juices. Her balls clench and pull against her body in time with her emissions, ready to start one hell of a fountain.");

	output("\n\n<i>“You and me, I think we’ll make it pretty far,”</i> she muses, her expression unchanging but her tone unsteady. <i>“Imagine, me as a Colonel and you as my Major. We’ll have entire platoons answer to us both, and none of them will ever realize that you made it as far as you did because you’re my precious little ");
	if(!shekka.hasCock()) output("carpet muncher");
	else output("dick kisser");
	output(". I mean, let’s face it, you’re not going to get there based on your conduct or your merits.”</i>");

	output("\n\nShe flinches suddenly. <i>“Oh, don’t fight the truth, rookie, you’re face-deep in my ");
	if(!shekka.hasCock()) output("muff");
	else output("sack");
	output(" right now. I could give you a task as simple as getting me a coffee and you’d fuck it up so you could personally service me some more.”</i>");
	if(touch) output(" Hell... honestly, that doesn’t sound so bad to you. Maybe her rookie had the right idea after all.");

	output("\n\nHer other hand comes to rest ");
	if(!touch) output("at where her rookie’s head must be, and she holds his invisible skull steady");
	else output("on your head, on top of her other hand, and she holds your skull steady");
	output(" as she thrusts her hips forward, <i>really</i> meshing her crotch into ");
	if(!touch) output("their");
	else output("your");
	output(" face. <i>“Speaking of which, our time is about at an end this time, rookie,”</i> she says, a high lilt in her voice. <i>“Let’s see how much backtalk you can give me after this one.”</i>");

	output("\n\nShekka is finally done with the talking, and instead, she sits there, roughly humping her hips forward again and again, crudely forcing ");
	if(!touch) output("her rookie");
	else output("you");
	output(" to take the brunt of her sexual release. She’s as close as she had implied, and with just a few more humps forward, she clenches her body ");
	if(!shekka.hasCock()) 
	{
		output("and her pussy squirts her Raskvel ladyjizz in several");
		if(!touch) output(", sharp arcs through the air");
		else output(" wet bursts straight into your gullet");
		output(". She hisses and bites into her lower lip through her toothy smile as you get a personal ");
		if(!touch) output("look");
		else output("taste and feel");
		output(" at how female Raskvel anatomy behaves during an orgasm: her pussy visibly ripples, starting from the outside and working deeper, milking the ");
		if(!touch) output("phantom ");
		output("tongue inside it. Her cum ");
		if(!touch) output("splashes onto the floor and pools at the feet of the chair, soaking into the metal floorboards and staining them with her scent");
		else output("Touch:pools into your mouth, coating your tongue and your cheeks with her tang, forcing you to swallow it down to keep up. You’ll be tasting her for hours after this");
	}
	else
	{
		output("and her cock bloats, from the base to her crown, in one very visible wave; her Raskvel cum shoots from her like it were a cannon, squirting from the urethra in the middle of her horse-like flare and arcing so high and so far that it reaches all the way to the opposite wall");
		if(!touch) output(". Most of the cum splashes onto the floors and the wall of the room, but when the arcs recede slightly, you feel it pool and drip and flow down your back as you service her");
		output(". Her massive nuts bounce and jostle under the strain and effort of keeping up with her body’s demands; when her first load begins to subside, she realigns her body a bit to force ");
		if(!touch) output("her rookie");
		else output("you");
		output(" into a new position, and each hefty nut clenches against her, starting it all over again");
		output(". Her fingers crook and scratch some more, and you wonder if whoever this drill sergeant is isn’t also into masochism: nails that sharp ");
		if(!touch) output("definitely would have drawn");
		else output("are about to draw");
		output(" blood.");
	}
	output("\n\nIt takes Shekka several heated moments to calm down from such a hot and heavy romp. Her orgasm takes a while to slow, and then stop, and she sits in her chair with a giddy childlike smile on her face the whole while as she ");
	if(!shekka.hasCock())
	{
		output("paints ");
		if(!touch) output("her rookie’s");
		else output("your");
		output(" face with her cum");
	}
	else 
	{
		output("imprints ");
		if(!touch) output("her rookie’s");
		else output("your");
		output(" features into her sack");
	}
	output(". When she finishes, and her orgasm finally winds down, she sighs and pulls herself back into her chair; she lets her feet down until they’re flat on the floor, and she resets her posture back to its perfect straightness");
	if(touch) 
	{
		output(". You lean forward, following her body momentarily, your mouth still tight against her ");
		if(!shekka.hasCock()) output("wet, beady pussy");
		else output("huge, heavy balls");
		output(" until her thighs begin to close around you. Reluctantly, you pull away");
	}
	output(".");
	
	output("\n\nShekka clears her throat and goes through the motions of adjusting her clothing – she’s probably wearing a uniform in the memory, if you had to guess. <i>“That’ll be all for now,”</i> she says with a stern, proper authority, as if whatever had just happened didn’t transpire at all. <i>“Don’t be late for your assignment tomorrow, rookie. I expect you in my office at thirteen-hundred.”</i>");
	output("\n\nShe grins deviously as the lights on her visor begin to flicker.");

	processTime(30);
	pc.lust(50);
	if(touch)
	{
		if(!shekka.hasCock()) pc.girlCumInMouth(shekka);
		if(shekka.hasCock()) pc.applyCumSoaked();
	}
	//[=Next=]
	clearMenu();
	addButton(0,"Next",shekkaRepeatMindwashVarIOutro);
}

public function shekkaRepeatMindwashVarIOutro():void
{
	clearOutput();
	showShekka(true);
	author("B!");
	// (scene: Ending)
	output("The memory draws to a close, and the visor shuts itself off slowly: the lights fade, and the few sounds you hear whir to silence over time. Shekka’s reaction isn’t immediate: she maintains her pose, and she tries to act out how her mind reasons that the memory <i>should</i> end, until her senses return to her, and you find yourself in the room with the one and only Shekka once more.");
	output("\n\n<i>“Ugh,”</i> she winces as she slips the visor off her head, rubbing at her eyes. <i>“[pc.name]?”</i> she asks drearily as she scans the room. She spots the mess she had made, and her expression changes as her blurry mind pieces together the clues of where she is and what she must have been doing.");
	output("\n\nShe laughs well-meaningly. <i>“How, uh, how was it this time? What did I do?”</i>");
	output("\n\nYou walk her through what she had done, and she corroborates your explanation with the fading memories still rattling in her head. You ask her some simple rudimentary questions – what is her name, where she is, and what the date is, among others – and she answers each of them correctly, satisfying you that she’s still her and that she hasn’t been brainwashed, or ‘overwritten,’ by whatever memory the visor had her act out.");
	output("\n\n<i>“I wouldn’t mind doing it again,”</i> Shekka says happily, pulling herself to her feet and reaching for her clothing. <i>“It’s always a great time in that thing; some of the memories in that thing are... well. I’d never act them out myself, that’s for sure!”</i>");
	output("\n\nYou tell her that she’s welcome to use the visor as much as she likes, as long as she’s comfortable with the risks, of course. With that, Shekka dresses herself, and shows herself out.");
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}