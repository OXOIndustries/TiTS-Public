import classes.Creature;
import classes.GameData.Pregnancy.Handlers.MakiusPregnancyHandler;
import classes.GameData.Pregnancy.Templates.MakiusUniqueChild;
/**
 * Doc links:
 * Codex: 		https://docs.google.com/document/d/1KmCH3DOFK6PTZ1bezSSw83dCbe7LfNXl6rRS3-MkLKM/edit
 * crew: 		https://docs.google.com/document/d/1HjBqf5uhNbHxb9Tg5bdesQoRRoTUtPkm6UEMHOWJuNQ/edit
 * sex: 		https://docs.google.com/document/d/1e5_lef3tTN0YJepY-d--l6IKJFbCXLKyR2wOwMzQglA/edit
 * nursury: 	https://docs.google.com/document/d/1I0a3nPuPM58oBkMBR-H51RJWlJQRk_YmrzZm--BIHyU/edit
 * events: 		https://docs.google.com/document/d/17pifrZgnEVpQWBn6uXPm-kUi05UlzmmTCXXjf1UhWy0/edit
 * original:	https://docs.google.com/document/d/1wibs7TKhrIs4NZ7-LkmofhXJJQbxxYAF3t3tcbB8WtI/edit
 */

/** MAIN FLAGS:
 * MAKI_STATE: 0 is normal. 1 is breeder. 2 is pregnant.
 * MAKI_RELATION: counter that goes up if you spend time with Makius, unlocks dates at 50 and 100 points.
 * MAKI_RELATIONSHIP_STATUS: 0 is friends(no sex). 1 is friends with benefits. 2 is lovers.
 * MAKI_DATE: current status of makius's dates.
 * MAKI_OFFERED_JOB_AT_NURSERY: true if offered a job at the nursery.
 * MAKI_IN_CREW: true if makius is currently a crewmember.
 * MAKI_SUBBED_TIME: last time makius was subbed.
 * MAKI_SUBPOINTS: how much of a sub makius is.
 * MAKI_BREEDER_SEEN: true if seen makius as a breeder
 * MAKI_HAS_BEEN_RECRUITED_BEFORE: true if he has been a crewmember at some point.
 * 
 * FLAVOR FLAGS:
 * MAKI_NOT_LICKING_WOUNDS: true if you disallowed maki from licking your wounds
 * MAKI_HOME_SEEN: true if pc has seen the current state of Makius's home
 * MAKI_GAVE_BLOWJOB: true if maki has performed a blowjob on the pc
 * MAKI_PREG_GAVE_BLOWJOB: true if commented on how well preg maki does blowjobs
 * MAKI_BREASTFED: true skips lactation comment
 * MAKI_SERVED_FOOD: true if pc has tasted maki's sandwiches
 * MAKI_SIRED_CHILDREN: amount of children makius fathered with you
 * MAKI_BIRTHED_CHILDREN: amount of children makius has birthed
 * 
 * DRUG FLAGS:
 * MAKI_BIOVEN_QUEST: the progression of finding out how to intersex your maki
 * MAKI_BIOVEN_QUEST_TIMER: timer that keeps track of when the last bioven quest event was.
 * MAKI_TAKING_BIOVEN: 1 = feminine, 2 = masculine, 0 or false = natural
 * MAKI_TAKING_SUPPRESSANTS: true keeps the breeder away
 * MAKI_TAKING_MALE_CONTRACEPTIVES: true is no virtile seed
 * MAKI_VIRILITY_BOOST: last time maki had a virilityboost
 * MAKI_TAKING_FEMALE_CONTRACEPTIVES: true is no anal babies
 */

 //--General Section--
 
public function makiusRecruited():Boolean{
	return flags["MAKI_HAS_BEEN_RECRUITED_BEFORE"];
}

public function makiusIsCrew():Boolean{
	return flags["MAKI_IN_CREW"];
}

public function makiusAtNursery():Boolean{
	return flags["MAKI_OFFERED_JOB_AT_NURSERY"] && !flags["MAKI_IN_CREW"];
}


public function makiusMasculine():Boolean{
	return flags["MAKI_TAKING_BIOVEN"] == 2 || (!flags["MAKI_STATE"] && flags["MAKI_TAKING_BIOVEN"] != 1);
}

public function makiusHasMedlab():Boolean{
	return shits["SHIP"].equippedItemCountByClass(Medlab) > 0;
}

//Function for changing makius's sublevel. A number above zero is always the pc pitching anal, so pregstuff is handled here as well
public function makiusSubbed(amount:Number):void{
	if (amount > 0) flags["MAKI_SUBBED_TIME"] = GetGameTimestamp();
	flags["MAKI_SUBPOINTS"] = Math.max(0, Math.min(10, flags["MAKI_SUBPOINTS"] + amount));
}

public function makiusLeave():void{
	if (!flags["MAKI_IN_CREW"] && (flags["MAKI_STATE"] == 2 || flags["MAKI_OFFERED_JOB_AT_NURSERY"])) moveTo("RESIDENTIAL DECK 12");
	else if (!makiusLeftClinic()) moveTo("NOVA CLINIC");
	mainGameMenu();
}

//used to calculate how pregnant makius is: 0 and 1 is invisible, 2 to 4 are stages of bigger belly
public function makiusPregLevel():int{
	if (flags["MAKI_STATE"] == 2)return Math.floor((1 - makius.pregnancyData[3].pregnancyIncubation / 518401) * 5);
	return -1;
}

public function makiusBellyDescriptor():String{
	var adj:Array;
	switch(makiusPregLevel()){
		case 2:
			adj = ["baby bump", "bulging belly", "pregnant tummy", "subtle bump"];
			break;
		case 3:
			adj = ["swelling tummy", "gravid belly", "bloated abdomen", "flagrant bump"];
			break;
		case 4:
			adj = ["huge belly", "engorged tummy", "heavily-gravid belly", "huge bump"];
			break;
		default:
			adj = ["flat belly", "flat tummy", "belly", "tummy"];
	}
	return adj[rand(adj.length * Math.random())];
}

//increases makius's relation, 0 is for a talking, 1 for spending time and 2 for sex
public function makiusIncreaseRelation(type:int):void{
	if (type == 2) flags["MAKI_RELATION"] += 12;
	else if (type) flags["MAKI_RELATION"] += 6;
	else flags["MAKI_RELATION"] += 3;
	if (flags["MAKI_RELATIONSHIP_STATUS"]){
		if (flags["MAKI_RELATION"] > 100) flags["MAKI_RELATION"] = 100;
	}else{
		if (flags["MAKI_RELATION"] > 50) flags["MAKI_RELATION"] = 50;
	}
}

/** Possible busts:
 * MAKIUS
 * MAKIUS_BREED
 * MAKIUS_PREG1
 * MAKIUS_PREG2
 * MAKIUS_PREG3
 * MAKIUS_FEM
 * MAKIUS_FEM_BREED
 * MAKIUS_FEM_PREG1
 * MAKIUS_FEM_PREG2
 * MAKIUS_FEM_PREG3
 * MAKIUS_NUDE
 * MAKIUS_BREED_NUDE
 * MAKIUS_PREG1_NUDE
 * MAKIUS_PREG2_NUDE
 * MAKIUS_PREG3_NUDE
 * MAKIUS_FEM_NUDE
 * MAKIUS_FEM_BREED_NUDE
 * MAKIUS_FEM_PREG1_NUDE
 * MAKIUS_FEM_PREG2_NUDE
 * MAKIUS_FEM_PREG3_NUDE
 */
//Possible contexts: 0 = public, 1 = private, 2 = naked
public function makiusBust(context:Number = 0):String{
	var pregLevel:int = makiusPregLevel();
	return "MAKIUS" + (makiusMasculine()?"": "_FEM") + (flags["MAKI_STATE"]?"_BREED": "") + (pregLevel > 1?"_PREG" + (pregLevel - 1):"") + (context == 2 || (context == 1 && flags["MAKI_STATE"] == 1)?"_NUDE":"");
}
 
public function makiusAppearance():void{
	clearOutput();
	author("LukaDoc");
	processTime(5);
	showBust(makiusBust(0));
	output("You are looking at Makius, the venarian doctor ");
	if (flags["MAKI_IN_CREW"]) output("you have hired.");
	else output("working at " + (flags["MAKI_OFFERED_JOB_AT_NURSERY"] ? "your Nursery" : "the Novahome clinic.") + (!flags["MAKI_STATE"] ? " He smiles at you with a slightly curious expression." : "He smirks at you with a hungry expression, studying you just as intently as you are studying him."));
	output("\n\nThe Venarian is 6 feet tall, though if he wasn't slouching slightly he'd probably gain a couple inches. He looks like an anthropomorphic animal, though he doesn't resemble any particular single Terran species; instead his features are a curious mix of dog and shark traits. His face is a short conical muzzle with a big mouth full of rows upon rows of sharp teeth, and he has triangular, dog-like ears atop his head. Both his arms and hands are quite human-like, his four fingers tipped with short, round claws. However his legs are digitigrade, standing on the balls of his feet and toes that end up in claws similar to those on his fingers. His prehensile reptilian tail waves lazily behind; it’s covered with fine fur that is delightful to the touch.");
	//State and masculine stuff
	output("\n\nHis features are strong and masculine, " + (makiusMasculine() ? "and combined with his lean, sinuous build, unremarkable hips, boyish butt and a flat chest, it leaves little question as to his gender." : "but his build is more gender-queer than that; his once-flat chest has swollen into " + (flags["MAKI_STATE"] == 2 ? "perky, milk-dripping C-cups" : "proud and perky B-cups") + ", whilst his once-boyish hips are now curved and womanly.") + (flags["MAKI_STATE"] ? (makiusMasculine() ? "  However, looking at him from the back tells a different story: his once boyish buttcheeks" : " His asscheeks" ) + " have plumped into squeezable peaches, ready to be groped and grabbed. Under his restless tail, his tight little asshole has grown slick and damp, eager for cock." : ""));
	//Preg stuff
	var pregLevel:int = makiusPregLevel();
	if (pregLevel > 1){
		output((makiusMasculine()?" Despite his masculine outlooks his belly ":" The greatest proof of his gender ambiguity is his belly; it "));
		switch(pregLevel){
		case 2:
			output("bulges noticeably, stretching over the growing form of your child.");
			break;
		case 3:
			output("swells out visibly, eliciting self-assured strokes from the proud boy-momma-to-be.");
			break;
		case 4:
			output("is engorged hugely, as big as any human mother ever got, occasionally moving as the child inside of him shifts, growing ever more impatient to be born.");
			break;
		}
	}
	output("\n\nHe wears comfortable looking clothes: a sleeveless, unadorned black shirt and " + (makiusMasculine()?"comfortable":"loose") + ", ankle-length pants, which are held up by a belt around his waist. There is a slit cut in the back of his pants that lets his long, furry, lizard-like tail to poke through. He wears a professional-looking labcoat over the whole ensemble, though he doesn't button it up, pockets bulging with various accoutrements of his profession.");
	output("\n\nHis eyes, the same green as a patch of wet grass, sparkle " + (flags["MAKI_STATE"]?"lustfully over a lewd smirk and he flicks a lock of his mane of deep navy blue hair out of one eye in a calculatedly seductive gesture":"above a friendly smile, he flicks a lock of his mane of deep navy blue hair out of one eye") + ". The fur on his face and down his front, from what you have seen, is white, but the fur on his back is a rich blue color, a slightly brighter shade than his hair. He bounces around restlessly, clawed toes clicking on the floor, and his hands are restless " + (flags["MAKI_STATE"]?"nervously wandering all over his body, stroking random patches of fur.":"playing with some small oddments he keeps pulling out of his pockets."));
	if (!makius.analVirgin || !makius.cockVirgin){
		output("You know that a genital slit in his crotch can reveal his Venarian penis, very human-like in shape, but with a tip covered in nubs that hardens during orgasm. It is " + (makiusMasculine()?"nine":"seven") + " inches long and " + (makiusMasculine()?"two":"one and a half") + " inches thick, and " + (flags["MAKI_STATE"]?"he's evidently quite turned on, if the telling tenting of his pants is any indication. This close to him, you can smell his scent; a rich and heady musk that overwhelms you, making you realize that you have a sudden craving to give him a good fuck.":"is currently concealed due to his lack of arousal.") + (flags["MAKI_STATE"] == 2?" The fact that he is pregnant only enhances your lust.":""));
		if (flags["MAKI_STATE"] == 2) pc.lust(10);
	}
}

//--Crew section--

public function makiusCrewBonus(btnSlot:int = 0, showBlurb:Boolean = true):String{
	var buff:String = "\n\nMaki is in " + (makiusHasMedlab()?"the medlab":"his room") + " reading a book on the anatomy of various species. He seems pretty focused, though you know he wouldn't have a problem talking to you if you went over to see him. Might be nice to give the good doctor a break from his studies.";
	addButton(btnSlot, "Maki", makiusCrewMenu);
	return (showBlurb ? buff : "");
}


//returns true if the normal scene is not blocked
public function makiusEvents(atRoom:Boolean):Boolean{
	// calculate time penalty for maki's submission points. one point for every 2 days the timer doesn't reset
	var penalty:int = Math.floor((GetGameTimestamp() - flags["MAKI_SUBBED_TIME"]) / 2880);
	flags["MAKI_SUBBED_TIME"] = flags["MAKI_SUBBED_TIME"] + (2880 * penalty);
	flags["MAKI_SUBPOINTS"] = Math.max(flags["MAKI_SUBPOINTS"] - penalty, 0);
	
	// Preg events
	if (makius.hasStatusEffect("makiusPregnancyReveal")){
		makiusPregnancyReveal();
		return false;
	}
	if (makius.hasStatusEffect("makiusPregnancyReaction0") || makius.hasStatusEffect("makiusPregnancyReaction1") || makius.hasStatusEffect("makiusPregnancyReaction2")){
		makiusPregnancyReaction();
		return false;
	}
	
	if(atRoom){
		// BioVen quest
		if (flags["MAKI_BIOVEN_QUEST"] == 1 && flags["MAKI_BIOVEN_QUEST_TIMER"] + 10080 < GetGameTimestamp()){
			makiusBiovenResearch();
			return false;
		}
		if (atRoom && flags["MAKI_BIOVEN_QUEST"] == 3 && flags["MAKI_BIOVEN_QUEST_TIMER"] + 4320 < GetGameTimestamp()){
			makiusBiovenArrival();
			return false;
		}
		
		// Relation events
		if (flags["MAKI_DATE"] == 1){
			flags["MAKI_DATE"] = 2;
			makiusToFriend();
			return false;
		}else if (atRoom && flags["MAKI_DATE"] == 2 && flags["MAKI_RELATION"] == 100){
			makiusDate2Unlock();
			return false;
		}
	}
	
	// Sub changes
	if (flags["MAKI_SUBPOINTS"] > 5 && !flags["MAKI_STATE"] && !flags["MAKI_TAKING_SUPPRESSANTS"]){
		makiusToBreeder(true);
		return false;
	}
	if (flags["MAKI_STATE"] == 1 && flags["MAKI_SUBPOINTS"] == 0 && !makius.isPregnant()){
		makius.masculinize();
		output("<b>Makius has reverted form because he hasn't had your cum in his ass for too long.</b>\n\n");
	}
	return true;
}

public function makiusCrewMenu():void{
	clearOutput();
	processTime(10);
	if(makiusEvents(true)){
		author("LukaDoc");
		showBust(makiusBust(1));
		output("You ask the doctor if he wants to come to his room.\n\n");
		if(makiusHasMedlab()){
			if (flags["MAKI_STATE"] == 2) output("\"My room, huh? Well, let's not waste any time then.\" Maki approaches you and takes your arm, excitedly dragging you after him as he moves towards his room.");
			else if (flags["MAKI_STATE"] == 1) output("\"My room? I like this idea.\" Maki gives you a little peck on the cheek and takes your arm, not bothering to wait for your reaction before dragging you away to his room.");
			else if (flags["MAKI_RELATIONSHIP_STATUS"] == 2) output("\"You want to go to my room?\"\n\nThat is what you said, you reply. Maki smiles at you, grabs your hand and starts on his way towards his room.");
			else output("\"You want to go to my room?\" You nod. \"Ok, sure... let's go.\" Maki gets up and starts on his way towards his quarters.");
			output("\n\n");
		}
		output("The doctor's room is as you expected quite functional, with things laid out neatly to maximise space. A small personal computer sits on a sturdy table in one corner of the room, while in another he has a comfortable-looking couch. Next to it is a bookcase which holds a mixture of medical textbooks and fiction, showing that he must enjoy reading as a leisure activity. A comfortable bed, extra-soft, with a large, fluffy hug-pillow taking up most of the space. Nearby is a classy looking sound system, several years out of date, but was the top model when it was new.");
		output("\n\n" + (makiusHasMedlab()?"You seat yourself on Maki's bed, which is as comfortable as it looks.":"Only after seating yourself on Maki's comfortable bed does Maki notice your arrival."));
		if (flags["MAKI_STATE"] == 2){
			output("\n\nMaki sits beside you and wraps his arm around you, kissing you passionately on your lips. You respond, kissing your pregnant male lover with equal passion, placing your hand " + (makiusPregLevel() < 2?"on his soon to be bloated belly, filled with":"on his bloated belly, round and swollen with") + " life.");
			output("\n\nOnce you break your kiss, Maki smiles lovingly at you, before asking. \"So, what do you have in mind? Maybe you'd like me to take off my clothes?\"");
		}else if (flags["MAKI_STATE"] == 1){
			output("\n\nMaki doesn't wait for your response and begins undressing, carelessly tossing his clothes away.");
			output("\n\nHe angles his body provocatively towards you. \"Okay, I'm naked now. How do you intend to do me now?\" This close to him, his breeder's musk hangs around the both of you like a cloak, and you can see moisture running down his legs from both his lubricated ass and his erect cock alike.");
		}else output("\n\nMaki sits beside you, touching your hand. \"So, what do you want to do " + (makiusHasMedlab()?"now that we are in a more private setting":"") + "?\"");
		makiusMenu();
	}
}

public function makiusMenu():void{
	author("LukaDoc");
	clearMenu();
	addButton(0, "Appearance", makiusAppearance, undefined, "Appearance", "Inspect the Venarian doctor");
	addButton(1, "Talk", makiusTalk);
	
	if (flags["MAKI_RELATIONSHIP_STATUS"]){
		addButton(2, "Sex", makiusSexIntro);
		addButton(7, "Drugs", makiusDrugs);
	}else{
		addDisabledButton(2, "Sex", "Sex", "You don't know him well enough yet.");
		addDisabledButton(7, "Drugs", "Drugs", "You don't have any reason to ask about his medications.");
	}
	
	addButton(3, "Pet Him", makiusPets);
	addButton(4, "Comb Him", makiusComb);
	addButton(5, "EatTogether", makiusEat);
	
	if (flags["MAKI_STATE"] > 0 && !makiusMasculine()) addButton(6, "DrinkMilk", makiusDrinkMilk);
	else if (flags["MAKI_BREEDER_SEEN"]) addDisabledButton(6, "DrinkMilk", "Drink milk", "Maki is not lactating");
	
	
	if (pc.HP() >= pc.HPMax()) addDisabledButton(8, "Heal", "Heal", "You feel fine.");
	else if (pc.hasStatusEffect("Bandaged")) addDisabledButton(8, "Heal", "Heal", "You should wait until your bandages need replacement.");
	//this should go to the medlab scene first if that ever gets written.
	else addButton(8, "Heal", makiusHeal, undefined, "Heal", "Get healed by the good doctor.");
	
	if (!flags["MAKI_RELATIONSHIP_STATUS"] && flags["MAKI_RELATION"] == 50){
		addButton(9, "Date", makiusDate1);
	} else if (flags["MAKI_DATE"] == 3){
		addButton(9, "Date", makiusDateRetry);
	}
	
	if (flags["MAKI_IN_CREW"]){
		addButton(10, "Evict", makiusEvict);
	}else{
		addButton(10, "Recruit", makiusNurseryRecruit);
		if (!flags["MAKI_OFFERED_JOB_AT_NURSERY"]) addButton(11, "Offer Job", makiusNurseryOfferJob, undefined, "Offer job", "Offer Makius a job at the nursery");
	}
	addButton(14, "Back", makiusLeave);
}

public function makiusPets():void{
	clearOutput();
	processTime(15);
	author("LukaDoc");
	showBust(makiusBust(1));
	makiusIncreaseRelation(1);
	output("One of your arms reaches around the Venarian, pulling him close. The other rises up towards his head to stroke his strangely dog-like ears. The Venarian whimpers in delight leaning into your touch, flickering his ears as you gently pet them, his tail lovingly wrapping around your waist. Seeing how he's enjoying it, you continue to stroke and pet his ears, tenderly running your fingers over the soft, flicking appendages.");
	output("\n\nHe eyes you mischievously, then pounces on you, nuzzling you affectionately. Moving on from his ears, you ruffle his mane with one hand, while the other hand drags him " + (pc.isTaur()?"to the sheeting in front of you":"into your lap") + ". As you continue nuzzling your head into the crook of his neck, his tail coils around your own " + (pc.isNaga()?"coil":(pc.tailCount != 0?"tail" + (pc.tailCount > 1?"s":""):"legs")) + ". " + (!flags["MAKI_RELATIONSHIP_STATUS"]?"H":"Maki’s hands wander all over you, not missing a single opportunity to grope you back, h" ) + "e looks so much like a pet when he acts this way and you half expect a lick whenever he nuzzles you back. One of your hands runs down his spine stopping just above the base of his tail, where you give him a playful scratch. Then the other hand sneaks its way onto his belly to tickle him eliciting a chortle that he tries to stifle.");
	if (flags["MAKI_RELATIONSHIP_STATUS"] > 0){
		//kissing
		output("\n\nYou stifle it for him by capturing his lips with your own.");
		output("\n\nMaki is taken by surprise, but easily melts into your kiss. His early playfulness now replaced with desire as he kisses you back. You enjoy the kiss briefly, then break away, leaning back to evade his instinctive attempt to recapture your lips. He looks a bit disappointed, but quickly recovers, nuzzling you once more.");
		output("\n\nAs he nuzzles you, you feel something poking against you, and you can't resist teasingly asking if Maki really gets that hot and bothered over a kiss.");
		output("\n\n\"Of course I do.\n\n");
		if (flags["MAKI_RELATIONSHIP_STATUS"] == 1) output("Kissing is the most intimate form of contact. It's like you are sharing all your feeling with me at once. You could say it's, overwhelming... plus you are such a great kisser, so I really can't help it.\"");
		else output("I love you very much, [pc.name]. And when we kiss I feel so close to you that I can share everything you mean to me, and in turn I can feel how much I mean to you as well. So, can you really blame me for being turned on by kissing my mate? Plus, on top of all that, you are a great kisser... so I can't help it.\"");
		output("\n\nWords fail you, so you simply pull him close and hug him tenderly, one hand stroking the mane that runs down the back of his neck as you do so. Maki inhales deeply, taking in your scent as he enjoys the closeness you two are sharing. There is no need for words right now, so you just enjoy your time, relaxing with your Venarian lover.");
	}else output("\n\nYou bring your other hand to scratch his belly causing his paper thin veneer of resistance to collapse and his stifled chortles turn into bellowing laughter. He rolls around on himself until his back is on your " + (pc.isTaur()?"sheeting":"lap") + ", rubbing it all over as he tries, and fails, to control himself. As you slow down the scratchings and the chuckling stops, you see his face stamped with utter contentment, eyes closed and with tongue lolling out of open muzzle.");
	output("\n\nEventually, reluctantly, you let him go and tell him it's probably time you were going. Maki whimpers in disappointment before releasing you and rolling off you.");
	output("\n\n\"Duty calls, I guess....\"\n\nYou agree, and promise to visit again when you can.\n\n\"Well, I should probably get back to my research as well. See you later?\"\n\nYou assure him that he will, and then politely excuse yourself.");
	clearMenu();
	addButton(0, "Leave", makiusLeave);
}

public function makiusDrinkMilk():void{
	clearOutput();
	processTime(30);
	author("LukaDoc");
	showBust(makiusBust(1));
	makiusIncreaseRelation(1);
	output("You look at the alien male's breasts. He traces your eyes and puffs his chest once he notices where you are looking at.");
	output("\n\n\"Go ahead and touch them.\" He smiles.");
	output("\n\nYou reach out and begin to gently stroke his fluff-covered boobs, thumbs gently circling the nipples as you softly squeeze his " + (flags["MAKI_STATE"] == 1?"pert":"hand filling") + " orbs.");
	if (flags["MAKI_STATE"] == 1){
		if (!flags["MAKI_BREASTFED"]){
			flags["MAKI_BREASTFED"] = true;
			output("\n\nYou are surprised when you see a tiny bead of milk escape his erect nub.");
			output("\n\n\"Oh, would you look at that. Looks like I'm already lactating.\"");
			output("\n\nSurprised, you ask why he's lactating already; you didn't know he could do that without being pregnant first. Maki chuckles to himself.");
			output("\n\n\"Usually we male Venarians can't, and females definitely can't. However, as a side reaction to our change, some us males start lactating as soon as we change.  This isn't a problem for you, is it?\"");
			output("\n\nYou tell him that it isn't and give his breasts another grope.");
		}
		output("\n\nA Tiny bead of milk wells from his nipples.");
		output("\n\nMaki coos with delight. \"Why don't you drink it? It's healthy!\" He grins.");
		output("\n\nWell, if he insists... You give his breasts a few more squeezes, gently cupping and milking them with your hands to get him ready before settling yourself closer and leaning in with your mouth, gently closing your lips around his nipple, slowly rolling the tip of your [pc.tongue] over it. Maki hugs you close, pressing your face against his breast and coiling his tail around you, one hand stroking the back of your head.");
		output("\n\n\"Yes, drink it all my mate. I only wish I had more to give you. Maybe when you finally knock me up?\" He chuckles to himself.");
		output("\n\nYou grunt a muffled \"maybe\" around his tit and instead curl your arms around his waist for support, teasing and playing with the nipple in your mouth, tongue stroking it and teeth gently pressing it even as your lips suck against it. Maki groans and whimpers at your ministrations, while you're rewarded with the first drop of Venarian milk touching your tongue. There's a warm sweetness to it, maybe a hint of vanilla, but you haven't had enough yet to really say for sure. Still, it encourages you to suckle harder, bringing one hand back to cup the breast you're currently nursing from and gently massage it in order to better coax his limited milk to flow.");
		output("\n\nThe Venarian's excitement is clear, his shaft stands erect and a bead of pre forms at its tip. However he doesn't seem concerned with that at the moment. He pulls you closer, trying to get you to further lean on his chest, pressing himself against you and caressing your body whenever he gets the opportunity to. He whimpers in delight as his milk flows through his sensitive nipple.");
		output("\n\n\"Drink it up, [pc.name]. It's all yours.\" He coos gently in your [pc.ear].");
		output("\n\nAs if you need any further encouragement, you attack his breast with renewed gusto, your efforts finally coaxing a slow, steady trickle of sweet Venarian milk into your mouth, allowing you to swallow down several delicious mouthfuls of its tasty goodness. However, after no more than four swallows, it seems quite obvious that you've sucked this breast dry; while he's obviously enjoying it, you're not getting any more milk, and so you switch to his other breast. Don't want him to feel lopsided now, right?");
		output("\n\nYou resume suckling with a vengeance, eager for more of the tasty liquid treat your alien boyfriend is holding; as aroused as he is, for you can feel his cock jabbing wetly against your belly, it doesn't take long for you to coax another three-four mouthfuls of delicious milk from him. Alas, that seems to be all of it, though you stubbornly keep nursing for another few minutes, much to Maki's evident delight. Finally, you accept that you've drained him completely and you let go, hiccuping softly as the air you accidentally swallowed unsettles your stomach.");
		output("\n\nMaki draws you close into a nuzzle, whimpering as he rubs himself against you. \"Don't worry, my mate. Venarians are very productive, I'll have more milk for you in a little while.\" He smirks at you playfully. \"Though I would have much more if you went ahead and got me pregnant.\"");
		output("\n\nHe's really eager for you to knock him up, isn't he, you tease him.");
		output("\n\n\"Of course I am. I want your pups so badly...\" He whimpers. \"B-But I'll endure until you are ready.\"");
		output("\n\nYou tell him that you'll think hard about the matter.");
		output("\n\n\"Thanks, my mate. I love you.\" He nuzzles you once more.");
		output("\n\n\You accept his feelings, then apologise, telling him it's time to go. When he releases you, you stand up, wipe your mouth, and walk away.");
	}else{
		output("\n\nMilk begins to flow, slowly but freely, from his breasts at your touch, the engorged mammaries clearly having plenty of milk to spare.");
		output("\n\nMaki moans, your touch clearly sending ripples through the Venarian's sensitive bosom. \"[pc.name], my mate. As much as I enjoy your touch, you shouldn't waste milk, you know?\" He smiles playfully at you.");
		output("\n\nWell, if he's so eager to get started without foreplay, you settle yourself closer and lean in with your mouth, gently closing your lips around his nipple, slowly rolling the tip of your [pc.tongue] over it. Almost immediately, a spurt of warm Venarian milk hits your tongue, filling your tastebuds with its sweet, vanilla-tinged richness; a strong suckle and your mouth is filled with creamy goodness, which you swallow down without hesitation. Maki coos, wrapping his tail and arms around you in a loving hug, pressing your head close to his breast and nuzzling you affectionately as you drain his soft orb of it's bounty.");
		output("\n\nYou moan appreciatively into his breast, gurgling the half-mouthful of milk already there, and swallow before starting to suckle in earnest. With how eager his breast seems to be to release itself, you don't need much force or action; you just lay there in Maki's arms, wrapping your own arms around his waist for support, and gently nurse from him, feeling his warmth against your [pc.skin] and listening to his heartbeat, feeling safe, secure and comfortable as you do.");
		output("\n\nMaki is happy to nuzzle you and draw you closer to him, pressing his " + makiusBellyDescriptor() + " against you. His roaming hands caress every inch of you he can manage without disturbing your nursing in an act of pure affection.");
		output("\n\n\"[pc.name]. I love you,\" he whispers into your [pc.ears] between his nuzzling and cooing.");
		output("\n\nYou stop suckling just long enough to return the sentiment, then lazily take up his other nipple and start drinking, finding it just as full of deliciousness as the other.");
		output("\n\nTime ticks pleasantly by as you drink and drink until, at last, you feel you can drink no more and you let the Venarian's slick nipple pop wetly from your mouth. You sigh in contentment and compliment Maki on his delicious milk; the pup is going to be very lucky when it comes out.");
		output("\n\nMaki chuckles. \"Thank you, but I'll always have a spare breast for you in case you feel like joining in, you know? Too bad this will all be over when I change back.\" He looks you over appreciatively. \"Though if it comes down to it, you can always make me into a breeder again.\" He smiles playfully.");
		output("\n\nDoes he like that idea, you ask, because he makes it sound quite tempting - especially if it means he'll always have some of this delicious milk ready for you.");
		output("\n\n\"Of course I like the idea, specially the part where you'll have to get me to change. It takes a lot to change a Venarian you know?\" He chuckles playfully. \"However if you want a lot of milk you'll have to knock me up again, not that I mind carrying your pups over and over again.\" He nuzzles you affectionately.");
		output("\n\nWell, that's something to think about for the future; right now, you say, you're full and you think it's time you got back to work.");
		output("\n\nMaki lets out a disappointed whimper. \"Alright then, but do come visit us soon. Maybe next time we can cuddle together?\"");
		output("\n\nWell, if he wants to cuddle, you can probably spare a little time now, you suggest... Maki doesn't even wait for you to finish this thought before grabbing you and dragging you over to his bed, where he promptly lays down, pulling you close and wrapping his legs around you possessively.");
		output("\n\nYou sigh softly and cuddle up against your " + (makiusPregLevel() > 2?"swollen-bellied":"") + " expectant boyfriend, holding him gently against you and relaxing yourself in his arms.");
	}
	makiusMenu();
}

public function makiusEat():void{
	clearOutput();
	clearMenu();
	processTime(15);
	author("LukaDoc");
	showBust(makiusBust(1));
	makiusIncreaseRelation(1);
	output("\"Sure. I'm feeling a bit peckish myself. Just make yourself comfortable while I go fetch us something.\"");
	output("\n\nYou do as he says, taking a seat by his table and waiting patiently. It doesn't take long for the Venarian to return, carrying a tray with a serving of sandwiches and two mugs of tea.");
	output("\n\n\"Help yourself.\" He smiles.");
	output("\n\nYou pick up a sandwich and take a bite off of it. Tasty, " + (flags["MAKI_SERVED_FOOD"]?"and very familiar. You ask if he is using the same ingredients he did last time.\n\n\"Of course, I can't let you eat junk food. It's not good for your health.\"":"but you don't recognize any of the ingredients.\n\n\"Just some veggies and meat from my home planet. All very healthy.\""));
	flags["MAKI_SERVED_FOOD"] = true;
	output("\n\nYou chuckle at that. He always seems concerned about your wellbeing.");
	output("\n\n\"Of course; I'm your doctor" + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?" and your mate":"") + ". If I don't look out for you, who will?\"");
	output("\n\nYou reach across the table to ruffle his head, earning yourself a delighted coo from the Venarian.");
	output("\n\n\"Try out the tea.\"");
	output("\n\nYou do as he suggests. It's slightly sweet and a bit citrusy, before you can say anything Maki explains,");
	output("\n\n\"Herbs and dried fruit. These aren't from my home planet, but I read they are very invigorating. Plus it's delicious.\"");
	output("\n\nHe won't be getting any arguments from your end. The tea compliments the taste of his sandwiches nicely, helping the flavor spread along your tongue. Overall it's a simple meal, certainly nothing compared to a fancy restaurant or a properly homecooked meal. But it's tasty and healthy, according to your Venarian doctor. Plus the company is good. You find yourself stealing glances at the Venarian, while he does the same." + (flags["MAKI_STATE"] > 0?" Though you do detect a certain hunger in the way he keeps eyeing you.":""));
	output("\n\nAll too soon you are done; you eat the last bite and take one last sip out of your tea and pat your [pc.belly].");
	output("\n\n\"Dessert?\" You hear Maki offer.");
	
	//Gives the food buff
	eatHomeCooking(50);
	var cock:int = pc.cockThatFits(makius.analCapacity());
	if (flags["MAKI_STATE"] == 1 && pc.hasCock() && Math.random() <= 0.25 && cock > -1) makiusEatAphro(cock);
	else{
		addButton(0, "Yes", makiusEatYes, undefined,"Yes", (flags["MAKI_STATE"] == 2 && !makiusMasculine()?"By how full those breasts are you can make a pretty good guess where your dessert is coming from":"You'd really like some dessert"));
		addButton(1, "No", makiusEatNo, undefined, "No", "You'd rather not have dessert");
		if (flags["MAKI_RELATIONSHIP_STATUS"]) addButton(2, "Sex", makiusEatSex);
	}
}

public function makiusEatYes():void{
	clearOutput();
	processTime(30);
	author("LukaDoc");
	showBust(makiusBust(1));
	if (flags["MAKI_STATE"] > 0 && !makiusMasculine()){
		output("Maki takes off his shirt, exposing his breasts for you. \"How about some milk?\" He asks, cupping his breast and smiling at you.");
		output("\n\nWell, since he's offering so nicely, and you do feel a little thirsty... You close the distance between the two of you, swaying your hips from side to side in a sensual manner as you get closer, watching Maki's reaction to your flirtations.");
		output("\n\nThe Venarian chuckles. \"Cut it out, [pc.name]. You are sexy enough for me without putting up any kind of show, now come here and help yourself. I'm need to be drained anyway, so drink to your heart's content.\" He opens his arms, inviting you into his embrace.");
		output("\n\nYou roll your eyes and then slide nimbly into his arms, placing a quick kiss on his lips before bending your head down to start playing with his nipple, teasing the pink pearl with your lips and the tip of your [pc.tongue] before opening your mouth and closing it around his nipple, feeling the first beads of milk already seeping onto your tongue. Mmm, sweet.");
		output("\n\nMaki lets out a coo of delight, hugging you and " + (pc.hasHair()?"ruffling your hair":"rubbing your head") + " lovingly. He thrusts his chest forward, making himself more accessible to your ministrations. You suckle with languid, luxurious gulps, steadily milking him of his sweet alien milk and swallowing it down.");
		output("\n\nTime passes blissfully by until you have " + (flags["MAKI_STATE"] == 1?"drained his breasts":"had your fill") + " and you remove your mouth from his nipple with a wet pop. Snuggling up against your fluffy boytoy, you realise that he hasn't had any dessert - or \"dessert\" - of his own, and you ask if he's on a diet.");
	}else{
		output("\"I got some cupcakes last time I had a chance to shop.\"");
		output("\n\nCupcakes sound nice, and you tell him you'd like to have some. He procures one and presents it to you. You take the cupcake from him and, pausing only a moment to admire its simple, tasteful design, take a bite. Mmm, yum; it's nothing extravagant, just vanilla icing with a cream center, but it's well-made and not too sweet. You polish it off with gusto, wiping off the last few crumbs, but then realise that Maki doesn't seem to be eating anything. You ask curiously if he's not going to have dessert.");
	}
	if (flags["MAKI_STATE"] == 2){
		output("\n\n\"I'll be getting my dessert soon enough.\" He smiles mischievously at you, through half-lidded eyes. Now that sounds enticing.");
		if (pc.hasCock()){
			output("\n\nMaki spins you around, pinning you against the chair. Slowly he kneels before you, pulling your lower [pc.lowerUndergarment] apart to reveal your [pc.cocksLight]. You watch him work eagerly, anticipation thrilling through you and stirring your [pc.cockBiggest] towards erection. All it takes is a few light caresses from the amorous Venarian before you are rock hard before him. Without missing a beat, he licks his lips and engulfs your [pc.cockNoun], licking and sucking you into his mouth as he begins bobbing his head.");
			output("\n\nPleasure sparks and surges across your [pc.skin] as his warm, wet mouth and lashing tongue stroke and tease your shaft, tantalising you and steadily pushing you to the peaks of pleasure. You shiver and shudder in your seat as his ministrations bring you to the edge, the coiling tongue stroking all the right spots, his mouth so hot and wet across your sensitive skin...");
			output("\n\nYou barely have time to warn him as you cum into his waiting mouth. Maki not being surprised at your discharge at all, drinks all of your load, cooing in appreciation as you fill his mouth with your [pc.cumNoun]. You sigh in pleased satisfaction as you finish, slumping in your seat as the last of your [pc.cumVisc] seed flows into Maki's mouth. Maki licks his lips and cleans up your [pc.cock], before getting up with a bright smile.");
			output("\n\n\"Thanks for the dessert, [pc.name].\"");
			output("\n\n\"It was your pleasure\", you reply, a small chuckle escaping you at your own lame pun.");
			output("\n\nOnce you regain the feeling in your [pc.legOrLegs], you re-dress yourself and apologise, saying it's time you got back to the bridge.");
			output("\n\n\"Alright, [pc.name]. But come back soon; don't forget you have two to feed here.\" He smiles.");
			output("\n\nHow can you ever forget? You kneel before him and plant a kiss on his " + makiusBellyDescriptor() + " before standing up and, with a wave goodbye, head back to the bridge.");
		}else{
			output("\n\nMaki wraps your lips into a deep kiss, thrusting his tongue into your mouth to pull your own into his. He tilts his head and makes out with you hungrily. You do your best to give as good as you get, your [pc.tongue] tangling against his, grinding your body against his own, feeling his hard cock poking against you, precum starting to soak through his clothing.");
			output("\n\nYou break the kiss to catch your breath, but are soon pulled back into a second one, just as deep as the first. You let out a muffled protest, but it's half-hearted, your arms squeezing Maki close to you, your hands running up to play with his hair at the base of his neck. Maki whimpers in delight, continuing to vigorously make out with you. After what feels like an eternity he breaks the kiss. A thin strand of saliva links your lips together before the Venarian licks it off.");
			output("\n\n\"Thanks for the dessert, [pc.name].\"");
			output("\n\n\"It was my pleasure\", you reply, still snuggling against him.");
			output("\n\nYou cuddle with him a while longer, then apologise, saying you have to leave. Maki nods and lets you up, and you wave your lover goodbye before heading back to the bridge.");
		}
	}else if (flags["MAKI_STATE"] == 1 && pc.hasCock()){
		output("\n\n\"Of course I am.\" He grins mischievously, ducking below the table.");
		output("\n\nOh hoh... what a naughty doctor you have, not that this stops you from spreading your [pc.legs] to give him better access to your crotch. It takes only moments before you feel a " + (pc.isCrotchGarbed()?"pair of probing hands pull your [pc.lowerUndergarment] away and a ":"") + "questing muzzle nuzzle your [pc.cocks]. With that kind of encouragement, you don't take long to get erect, your shaft stiffening under the table. Maki gives you no quarter, he eagerly grabs your [pc.cockBiggest] and engulfs it with such hunger it scares you for a moment.");
		output("\n\nYou gasp, shudder and moan as your Venarian lover lavishes his affections on your cock, sucking for all his worth as his tongue flashes around and across the skin of your shaft. Hot wetness envelops you, rippling as he suckles greedily at you, his frenetic ministrations driving you inexorably towards the edge...");
		output("\n\nMaki whimpers in delight as the first jet of cum shoots against his willing throat, he suckles with all his might." + (pc.balls > 0?" His hands busy themselves with your [pc.balls], massaging and coaxing " + (pc.balls > 1?"them":"it") + " to empty " + (pc.balls > 1?"their":"its") + " life-giving load into his muzzle.":"") + " You groan with satisfaction as you empty yourself into his waiting mouth, slumping back in your chair in satisfaction. Having finished drinking his \"dessert\", Maki whimpers in delighted pleasure, even becoming distracted and bumping his head against the underside of the table.");
		output("\n\nYou ask in concern if he's alright. He comes out from under the table, rubbing his head, ears flat.");
		output("\n\nWhen he turns to look at you though, his lips broaden into a smile. \"Thanks a lot, [pc.name]. That really hit the spot.\"");
		output("\n\nWell, at least he's alright.");
		output("\n\nOnce you regain feeling in your [pc.legOrLegs], you rearrange your clothing and announce it's time you got back to the bridge.");
		output("\n\n\"Alright, but before you go.\" You give him a curious look. \"Think we have time for a quickie?\"");
		output("\n\nYou shake your head and reply that you don't.");
		output("\n\nHe snorts in disappointment. \"Fine, but promise you'll be back soon? At least to feed me some more of your seed? If not bend me over and show me how much you love me?\"");
		output("\n\nWell... if he's good, you'll think about it, you teasingly tell him.");
	}else if (flags["MAKI_RELATIONSHIP_STATUS"] == 2){
		output("\n\n\"Yes, I am.\" He leaves his chair and saunters towards you, hugging you and nuzzling you affectionately.");
		output("\n\nYou hug him back, asking him playfully if this is his idea of dessert. Instead of replying, he grins at you and wraps your lips into a deep kiss, taking advantage of your surprise to sneak his tongue into your mouth to dance with your own. You moan into his mouth and kiss him back, your own [pc.tongue] " + (pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)? "easely keeping up":"doing its best keep up") + " with him, your arms wrapping around him and pulling him closer in a possessive embrace. You run your hands up into his hair, one sliding so far as to play with his ears, grinding your [pc.breasts] against his own chest.");
		output("\n\nMaki wraps you into a tight embrace, tail encircling you to help him come as close as possible. He continues kissing you with abandon, drinking in the pleasure of being with his mate. You share his kisses with equal passion, absently noting the pressure of his erection tenting against your belly; mischief fills you and one hand snakes away from his hair to teasingly grope his cock through his clothes.");
		output("\n\nMaki breaks the kiss with a gasp, still holding you tightly. \"Thanks for the dessert,\" he whispers into your ear.");
		output("\n\n\"It was your pleasure\", you reply, still holding him. You stroke his shaft twice, then wriggle away from him, explaining it's time you got back to the bridge.");
		output("\n\nHe moans, momentarily weakened by your teasing touch. \"You're going already? Just when things were getting good?\" He pants, obviously turned on by the earlier actions.");
		clearMenu();
		addButton(0, "Sex", makiusEatYesSex);
		addButton(1, "Leave", makiusEatYesLeave);
		return;
	}else{
		output("\n\n\"No, not really. I'm fine.\" He waves.");
		output("\n\nWell, alright, if he's sure.");
		output("\n\nThe two of you spend a little time sharing small talk before you apologise, saying you need to get back to the bridge.");
		output("\n\nMaki nods his head in understanding and you politely depart.");
	}
	clearMenu();
	addButton(0, "Back", makiusLeave);
}

public function makiusEatYesSex():void{
	clearOutput();
	processTime(2);
	author("LukaDoc");
	showBust(makiusBust(2));
	output("Well, since he started this, you might as well finish it. You tell him you want to get some real dessert before you go...");
	output("\n\nMaki grins happily, tail waving lazily behind as he begins stripping off. He makes his way towards his bed, tossing his garments carelessly as he does so; by the time he reaches his bed, he's already naked, Venarian cock pointing at the ceiling in anticipation of what's to come.");
	output("\n\nYou follow quickly in his wake, " + (!pc.isNude()?"shedding your clothes with equal eagerness," + " mind a-whirl with the possibilities of slaking your mutual lusts...":""));
	clearMenu();
	makiusSexMenu();
}

public function makiusEatYesLeave():void{
	clearOutput();
	processTime(2);
	author("LukaDoc");
	showBust(makiusBust(1));
	output("Sorry, but, duty calls. But you're sure you'll find the time to come back and help him out, if he's still up for it later.");
	output("\n\n\"Okay. I'll be waiting.\"");
	output("\n\nYou pat him comfortingly on the head and thank him for being so understanding, then leave Maki to cool himself off.");
	clearMenu();
	addButton(0, "Back", makiusLeave);
}

public function makiusEatNo():void{
	clearOutput();
	processTime(2);
	author("LukaDoc");
	showBust(makiusBust(1));
	if (!flags["MAKI_STATE"]){
		output("\"Already stuffed, huh?\"");
		output("\n\nYou nod.");
		output("\n\n\"I always have space for dessert, but if you are satisfied it's okay.\"");
		output("\n\nYou thank the Venarian for the food and the company, excusing yourself as you make your way out.");
		output("\n\n\"Don't mention it.\" He smiles as you leave him.");
	}else{
		output("The Venarian looks at you, disappointed you refused his invitation.");
		output("\n\n\"Fine, I guess I can let you go this time. But next time you're getting your dessert whether you want it or not.\" He smiles confidently. \"And I'll be getting mine,\" he quickly adds.");
		output("\n\nYou can only wonder what kind of dessert the Venarian had in mind, maybe next time. You thank him for the meal and the company, then promptly excuse yourself.");
		output("\n\n\"No problem. Come see me soon.\"");
	}
	clearMenu();
	addButton(0, "Back", makiusLeave);
}

public function makiusEatSex():void{
	clearOutput();
	processTime(10);
	author("LukaDoc");
	showBust(makiusBust(2));
	output("\"Let's skip the euphemisms here,\" you reply; you'd rather work off the meal by having sex.");
	if (flags["MAKI_STATE"] == 2){
		output("\n\n\"So you want a Venarian for dessert?\" He smiles playfully. \"Funny, I was thinking I'd like to have you for dessert too.\"");
		output("\n\nWith a flourish he disposes of his clothes, tossing it carelessly away and sauntering towards you to wrap you in a hug, tail rubbing against your side as it wraps you in an embrace of its own. You wrap your arms around your alien and caress him, one hand sliding down to squeeze his butt, the other rising sensuously up his neck to stroke his hair, even as you plant teasing kisses on his lips, leaving him gasping for more, his cock slick and wet against your [pc.belly] as you almost dance him across the floor to his bed.");
		output("\n\nSlipping playfully from his embrace, you dance a step or two back and start to " + (!pc.isNude()?"seductively strip yourself down":"teasingly caress your naked body") + ", watching carefully to see his reaction. He eyes you with lust, licking his lips as you present your naked form for his viewing pleasure.");
		output("\n\nYou return his lustful look, hungrily drinking in the sight of your pregnant alien boytoy, wondering just how you should take the eager little manslut...");
	}else if (flags["MAKI_STATE"] == 1){
		output("\n\nMaki groans in relief. \"Finally! This is exactly what I was hoping you'd suggest [pc.name]. I even considered making an aphrodisiac tea for you.\"");
		output("\n\nHe wastes no time shedding his clothes, standing before you in all his naked glory. " + (makiusMasculine()?"Cock already fully erect and ready for action":"Pert bosom already sporting erect nipples, cock fully erect and ready for action") + ". He turns around and walks towards the bed, swaying his full butt side to side as his tail accompanies the motions like a tantalizing pendulum; you can see moisture gathering on his ass crack, proof that his ass is wet and as ready as the rest of him. He sits on the bed and looks at you in anticipation. \"Dessert is served,\" he says with a seductive smile.");
		output("\n\nYou greedily eye the treat on display for you, already feeling the arousal spiking through you. " + (!pc.isNude()?"Your [pc.gear] almost feel like they're strangling you and you hastely to cast them aside, striding":"You stride") + " to close the distance and seize your alien lover's lips with your own. Maki replies in kind, running his hands over your body in an attempt to arouse you further. You shiver in pleasure, mind already reeling with the possibilities of how you will take him...");
	}else if (flags["MAKI_RELATIONSHIP_STATUS"] == 2){
		output("\n\nMaki smiles at your suggestion. \"If that's what my mate wants, then I'm fine with it. But I expect you to work for it. So... come and get it?\" He grins, a bit nervous despite his apparent excitement.");
		output("\n\nYou stride confidently up to him, the predator claiming [pc.hisHer] prey, watching the hypnotic waving of his tail as it swishes above his cute butt. You squeeze his asscheeks and stroke the base of his tail, the Venarian jumping a little at that, then pull him to his feet and seize his lips with your own, striving to undress him without releasing his lips. You grind your crotch against his and feel his erect cock pressing back against you, hot and wet in anticipation, dampening his clothes with precum. Maki moans into your kiss, eagerly kissing you back as his hands roam your ");
		output((pc.isNude()?"naked body. You take his hands and guide them to your sensitive spots, still grinding against him as you do so. He smiles to himself while kissing and groping you.\n\nWhen he grows tired of groping":"body, looking for a way to undo your [pc.gear]. You take his hands and guide them so he can disrobe you, still grinding against him as you do so. He pulls and tugs until your [pc.gear] comes loose, smiling to himself while kissing you.\n\nNow freed of your clothes"));
		output("\n\n, you can fully concentrate on undressing him, and soon you are pinning your naked lover to the bed beneath you, trying to decide just how you'll take him...");
	}else{
		output("\n\n\"Umm... I....\" The Venarian trails off, not exactly sure how to reply to that.");
		output("\n\nYou shush him gently, crossing the distance between you and holding him comfortingly in your arms. You stroke his ears and kiss him gently on the nose, earning yourself a short gasp from the Venarian. Even as he does that, you start gently leading him towards the bed, letting him free of your embrace only so as to more easily remove his clothes.");
		output("\n\nMaki follows your lead, still a bit nervous. Eventually he comes around and helps you undress him; in no time you have the Venarian naked and sitting on his bed. With a coy smile and a seductive expression, you " + (!pc.isNude()?"begin stripping off your own [pc.gear]":"teasingly caress your naked body") + ", doing your best to make the inexperienced alien flustered and excited with the most provocative motions you can muster.");
		output("\n\nMaki watches you enraptured, his Venarian cock already fully erect and throbbing, demanding attention. All that you must do now, is decide what to do with him.");
	}
	clearMenu();
	makiusSexMenu();
}

public function makiusEatAphro(cock:int):void{
	processTime(20);
	output("\n\nYou feel a strange warmth flooding through your body, sparking surges of need in your mind, feeding desire into your loins where your + " + (pc.cockTotal() > 1?"cocks grow":"cock grows") + " erect" + (pc.hasVagina()?"and your [pc.cunt] starts to grow wet in anticipation":"") + ". You feel the ache to fuck consuming you.");
	if (flags["MAKI_DRUGGED_PC"] == undefined){
		output("\n\nStartled, baffled by this sudden surge of desire, you ask Maki just what he did to you.");
		output("\n\nMaki grins ear to ear. \"Just something to go with 'dessert'.\" He leans over the table, supporting his head on his hands and elbows as he waits for your next move.");
		output("\n\nYou can't help but feel at least a bit betrayed by the mischievous Venarian. A wave of arousal surges through you" + (!pc.isNude()?" and suddenly your clothes feel constricting and bothersome":"") + ". The glare you shoot the Venarian is enough to make him wipe the smile off his face.");
		output("\n\n\"Umm… I'm sorry, [pc.name]. I guess I shouldn't have spiked your drink after all.\" He rubs the back of his neck, ashamed of himself. You begin panting, swallowing to repress a gasp of lust as your body heat increases at a steady pace. \"I-I don't know what I was thinking.\" His ears flatten and his tail sags behind him as he averts his gaze and looks down at the floor.");
		output("\n\nWell… what's done is done. You begin " + (!pc.isNude()?"stripping off your [pc.gear], freeing":"stroking") + " your hardening [pc.cocks]" + (pc.hasVagina()?" and moistening [pc.vagina]":"") + ". The Venarian is completely oblivious to the act as he wallows in shame. You decide that since he's responsible for this, he should also be the one to do something about it. So you approach the Venarian with a wry smile.");
		output("\n\nIt's not until your [pc.crotch] enter Maki's field of vision that he reacts, ears standing erect in surprise and tail muscles tensing at the sight before him. His eyes trail your body upwards until they settle upon your smiling face. You raise a brow wondering what he intends to do. He just blinks, stunned. With a sigh you ask if he's going to take responsibility for his acts or not?");
		output("\n\n\"I… you are not mad?\"");
		output("\n\nYou shake your head side to side, on one hand Maki did do something wrong, on the other hand you know the Venarian would never do anything that would harm you. You tell Maki that you'll forgive him if he does something about this, pointing back at your crotch.");
		output("\n\nHe smiles thankfully at you. \"Thanks [pc.name].\" You pet him softly, earning a whimper of delight. You have to ask though… what was he thinking!?");
		output("\n\nHe recoils a bit at that. \"I… uh… it's just that….\" he trails off before sighing. \"I just wanted you to see how you make me feel.\"");
		output("\n\nYou look at him in confusion.");
		output("\n\n\"When I'm changed, I can't help but think of you. And when I do that I get really horny, about as horny as you are now. And I feel like this all the time, except when we are breeding.\" His tail waves behind him. \"When I'm like this I get lonely and needy. And I know you can't be with me all the time, but it doesn't make this any less trying.\"");
		output("\n\nYou ponder his explanation. You suppose that you can understand how he feels about this…. \"Thanks, [pc.name].\" He brightens up.");
		output("\n\nNow that's dealt with… the Venarian before you looks positively appetizing, with his " + (makiusMasculine()?"boyish hips and full butt begging to be groped and freed from the good doctor's pants":"curvaceous hips and full butt, the small breasts begging to be groped and freed from the good doctor's shirt") + ". His shapely tail, waving about in teasing metronome fashion. The bulge in his pants, begging for attention and the knowledge that inside his pants is a slick boy-pussy, wetting itself every time you throw the Venarian a passing gaze.");
		output("\n\n\"Umm… [pc.name]?\"");
		output("\n\nYou quickly seize his head and wrap your lips around his own, probing inside his mouth with your [pc.tongue]. After the initial surprise over the suddenness of your kiss, he quickly reciprocates, grabbing onto your arms for support as he readily accepts you. You break the kiss and forcefully drag the Venarian up and out of his chair before spinning him around and setting him down on your lap as you take his place. You kiss him again, silencing a yelp as you roughly grope his butt; deft fingers working the buttons to remove the offending cloth.");
		output("\n\nMaki tries to say something, whether it is a protest or an encouragement you can't tell, you never give him a chance to repeat himself as you drag his shirt up and over his head. You pull and tug on the shirt, not even giving him a chance to lift his arms as you forcefully pull on his shirt, tearing its seams apart as you rip his shirt off him " + (pc.physique() < 15?"with strength you didn't even know you had":"") + ".");
		output("\n\nMaki looks at you with a mixture of surprise, fear, lust and anticipation. He opens his mouth to say something, but all that comes off is a slutty moan as you bite one of his erect nipples, careful not to hurt him… much. You stand, holding the Venarian's butt as he fights to get his balance back. You never give him a chance to recover as you push him towards his bed. Maki yelps as he trips on his own tail, falling backwards and landing on his mattress. Conveniently, his pants seemed to have stuck to your hands, and you shuck them away without a care. All that's left is his undies… which you promptly rip off him much like his shirt.");
		output("\n\nYou look over your Venarian lover, admiring his breedable, hormone-laden form. He crawls backward on his bed, waiting to see your next move. You glare at him like a predator glares at its prey; like a hungry animal glares at a tasty morsel. Maki can only blink in silence, shuddering at your lustful glare. You lean over him, crawling on top of him and pinning his arms as you bring yourself ever closer to his neck. He gasps as you give him a little nip on the neck, then exposes himself for you as you continue to nip and nibble. Ropes of slick pre spurt out of his cock and onto his belly; a sign of how excited the Venarian truly is. You inhale deeply, drinking in his pheromones as you release him and get up. Now… time to get to business.");
		flags["MAKI_DRUGGED_PC"] = true;
	}else{
		output("\n\nThis time, you recognize the feeling and you ask, with somewhat strained patience, if Maki really couldn't resist spiking your tea again. Maki just grins and blinks his eyes in mock innocence.");
		output("\n\n\"Can you really blame me for trying to get a repeat of last time's performance?\"");
		output("\n\nWith a throaty growl you hurl yourself from your seat and stalk forward, grabbing him by the underside of his jaw and pulling him into a rough kiss.");
		output("\n\nThe mischievous Venarian gasps as you engulf his lips into a kiss, moaning as you take this opportunity to thrust your tongue in. Breaking the kiss, you slide an arm under his and haul him upright, practically dragging him across the room to where his bed awaits. Lust burning in your eyes you savagely yank at his clothes, tearing the fabric from his body, oblivious to any ripping noises you make in your enthusiasm. For a moment Maki looks at you in surprise, wary of your roughness, before anxiousness and lust overtakes him. He begins to mouth a protest, but all that comes out of his mouth is a throaty moan fit for a boy-slut's mating call.");
		output("\n\nA part of you wants him to moan some more, but the rest of you is too needy to care. You push him and, with little encouragement, he collapses onto his bed, already positioning himself seductively, awaiting your pleasure. " + (!pc.isNude()?"Furiously you remove your [pc.gear] until you":"You already") + " stand naked, ready to start…");
	}
	addButton(0, "LustyFuck", makiusSexLustyFuck, [cock, true]);
}

public function makiusComb():void{
	clearOutput();
	processTime(10);
	author("LukaDoc");
	showBust(makiusBust(1));
	makiusIncreaseRelation(1);
	output("Maki sighs. \"Listen, [pc.name]. Not all Venarians are like this, but for me? It's like fighting a losing battle. My mane simply refuses to be combed.\"");
	output("\n\nYou admit you did notice it was a bit unkempt. Would he like a hand at combing it? See if maybe a different pair of hands can tame it for him?");
	output("\n\nHe brightens up at the offer. \"Well, if you want to try your hand I'd be happy to let you. Just don't get your hopes up.\" He smiles nervously.");
	output("\n\nYou'll just have to see how it happens. Now, where are his grooming things?");
	output("\n\nHe walks towards a cabinet where he procures a brush, a comb, and some other hair care products. They seem brand new, you suspect Maki doesn't really use them. It can't be that bad right? Maybe he's just being lazy…");
	output("\n\nHe sits on a chair nearby and takes a hold of his tail. \"Ready when you are.\"");
	output("\n\nYou gather up the items he collected for you and approach him, already studying the disheveled tangle of hair that sprouts from his scalp and grows down the back of his neck.");
	output("\n\nYou start off by running your fingers through his mane, getting a better feel of what you are going to have to deal with. You meet little resistance, much to your surprise. A smile cracks on your face as Maki whimpers, obviously enjoying the contact.");
	output("\n\nWithout further ado you take a comb and begin straightening out his mane. One pass, two passes, three passes and it seems to sit straight. Satisfied with your work, you move on to the treat the other side. Once again, it's not too difficult to straighten out his mane. You take a step back, smirking. The Venarian was just pulling your leg, his hair is incredibly easy to- what the?");
	output("\n\nYou look, stupefied as the side you had worked on earlier returns to the tangled mess it was before. Sighing, you take the comb in hand and begin working once more. As soon as you are done, you look over Maki's head and spot that it's his <b>other</b> side that's a mess now. You grunt in thought. Maybe there was some truth to what Maki was saying earlier…");
	output("\n\nThe Venarian himself looks at you nervously, but it's obvious he's trying to contain his laughter. His eyes, while apologetic, do transmit a certain sense of \"I told you so\".");
	clearMenu();
	addButton(0, "Persist", makiusCombPersist);
	addButton(1, "Give up", makiusCombEnd);
}

public function makiusCombPersist():void{
	clearOutput();
	processTime(30);
	author("LukaDoc");
	showBust(makiusBust(1));
	output("You won't be beaten by the Venarian's wild mane, there's still a few tricks you can use!");
	output("\n\nYou take another look at the available products and quickly work out a strategy.");
	output("\n\n<b>Later…</b>\n\n");
	makiusCombEnd();
}

public function makiusCombGiveUp():void{
	clearOutput();
	makiusCombEnd();
}

public function makiusCombEnd():void{
	processTime(5);
	author("LukaDoc");
	showBust(makiusBust(1));
	output("You groan, finally ready to admit defeat. Maki was right… it's virtually <b>impossible</b> to straighten out his mane.");
	output("\n\nHe pats your back, consoling you as well as understanding of your frustration. \"I know, [pc.name]. Trust me, I do….\" He immediately chuckles then. \"I guess it's really useless to fight nature, huh? Still you tried, thanks for that.\"");
	output("\n\nYou smile at him, nodding and turning to ruffle his hair.");
	output("\n\n\"H-Hey!\" At least you don't have worry about messing his hair up anymore than it already is. \"I suppose that's a perk?\"");
	output("\n\nMaki rests a hand on your head, running his fingers " + (pc.hasHair()?"through your [pc.hair]. \"Mine might be hopeless, but I'm pretty sure I could return the favor and comb yours if you want.\" You'd like that, you think.":"running his fingers over your [pc.hair]. \"Maybe I should try shaving my mane off. It looks more convenient than having to deal with this mess on a day-to-day basis.\"\n\nYou take a moment to imagine the Venarian… bald. Nope, thank you.\n\nHe laughs at your reaction. \"No dice, huh? That's fine, I was just joking anyway.\""));
	output("\n\nYou enjoy a few more moments of peace with the Venarian, glad for the company. \"We still have some time, in case you want to do something else?\"");
	clearMenu();
	addButton(0, "Yes", makiusCombYes);
	addButton(1, "Leave", makiusCombLeave);
}

public function makiusCombYes():void{
	clearOutput();
	processTime(5);
	author("LukaDoc");
	showBust(makiusBust(1));
	output("Sure, that would be nice.\n\n");
	makiusMenu();
}

public function makiusCombLeave():void{
	clearOutput();
	processTime(5);
	author("LukaDoc");
	showBust(makiusBust(1));
	clearMenu();
	output("You tell Maki that you are going to leave for now.");
	output("\n\n\"Oh.\"");
	output("\n\nBut you'll be back later to visit him. At hearing that he immediately perks up.");
	output("\n\n\"Okay, I'll be looking forward to it.\"");
	output("\n\nYou ruffle his hair one more time before walking away.");
	addButton(0, "Leave", makiusLeave);
}

public function makiusTalk():void{
	clearOutput();
	processTime(5);
	author("LukaDoc");
	showBust(makiusBust(1));
	if (flags["MAKI_RELATIONSHIP_STATUS"] == 2) output("Maki smiles at you and leads you to his couch, sitting down and patting the seat beside him. You take his offer. He smile and loops his tail around you, hugging you and nuzzling you as you two settle on the couch. \"Okay, I guess we're both comfortable now. So what do you want to talk about?\"");
	else if (flags["MAKI_RELATIONSHIP_STATUS"] == 1) output("\"Just a chat? No problem.\" He walks towards his couch and takes a seat, patting the seat beside him. You take his offer and sit beside him. \"What would you like to talk about?\"");
	else output("\"You just want to chat? Okay then.\" He motions towards his couch. \"Have a seat.\" You take his offer and take a seat " + (pc.isTaur()?"close to":"on") + " one end of couch. Maki takes the other end \"So what you want to talk about?\"");
	makiusTalkMenu();
}

public function makiusTalkMenu(from:int = -1):void{
	clearMenu();
	if (from == 0) addDisabledButton(0, "Family");
	else addButton(0, "Family", makiusTFamily);
	if (from == 1) addDisabledButton(1, "His Job");
	else addButton(1, "His Job", makiusTHisJob);
	if (from == 2) addDisabledButton(2, "Feelings");
	else addButton(2, "Feelings", makiusTFeelings);
	if (CodexManager.entryViewed("Venarians") || flags["MAKI_BREEDER_SEEN"]) {
		if (from == 3) addDisabledButton(3, "Pregnancy");
		else addButton(3, "Pregnancy", makiusTPregnancy);
	}else addDisabledButton(3, "Pregnancy", "Pregnancy", "You should learn more about Venarian biology first.");
	if (currentLocation == "NURSERYI16") addButton(14, "Back", mainGameMenu);
	else addButton(14, "Back", makiusMenu);
}

public function makiusTFamily():void{
	clearOutput();
	processTime(10);
	author("LukaDoc");
	showBust(makiusBust(1));
	makiusIncreaseRelation(0);
	output("You ask Makius if he'll tell you some things about his family; his parents, if he has any siblings, that sort of thing?");
	output("\n\n\"So you want to know more about my family? Sure.\" He helps you get more comfortable, until you make it clear you're ready for him to begin.");
	output("\n\n\"Now where do I start… Ah yes, I grew up in a fairly normal family. It was me, my parents and 2 siblings. I still keep contact with them, but being out and about in space makes that a bit difficult.\" He laughs a bit.");
	output("\n\nYou note that tends to be the case.");
	output("\n\n\"While most of my immediate family decided to stay in Venar, I do have a few more distant relatives that took to space. But I haven't heard about them since they left, so I don't know exactly how they've been doing... either way, they are pretty skilled, so they should be fine.\" Maki smiles.");
	output("\n\nPolitely, you ask what jobs his space-faring family members are involved in, and what his family back on Venar does for a living.");
	output("\n\n\"Hmm... I'm not too sure what they do. All I know is that they have a ship of their own, so maybe they are explorers? Merchants? I'm sorry I have no idea. They aren't my closest relatives you know?\"");
	output("\n\nYou agree that it makes sense he doesn't know much about them.");
	output("\n\n\"Now... my planetside relatives work with tourism, of course. Pretty much everyone in Venar has something to do with tourism and my family is no exception.\"");
	output("\n\nYou express polite curiosity at that fact.");
	output("\n\n\"My parents' work is... well... I guess you could say they are the entertainment.\"");
	output("\n\nYou ask what that entails.");
	output("\n\n\"Some Venarians are paid to live a more... tribal lifestyle. We live in tree-houses, go out hunting, basically we live as if we hadn't discovered technology yet.\"");
	output("\n\nThat sounds... humiliating.");
	output("\n\n\"Actually not. It's more of a choice in lifestyle you know? My parents weren't forced to work there, they chose to do that. Plus the pay is very good and it's not like we shun all forms of technology, we still have TVs, virtual computers and such in our house, hidden from sight. It's just another draw of Venar tourism.\"");
	output("\n\nStill sounds kind of awkward, but you drop the topic. You ask what his direct family consists of.");
	output("\n\n\"That would be my sister, my brother and my moms.\" He smiles.");
	if (CodexManager.entryViewed("Venarians") || flags["MAKI_BREEDER_SEEN"]){
		output("\n\nYou ask how Maki could have two mothers; was he adopted, or is this like how he can bear children despite being male?");
		output("\n\n\"That would be the latter. My mothers met, fell in love, mated and here I am.\" He smiles.");
		output("\n\nSo, female Venarians can also change to get others pregnant, just like males can change so they can get pregnant?");
		output("\n\n\"Of course, it wouldn't be very productive if only males had that ability, right? Though males that change do suffer a lot more with hormonal changes than females... their change lasts just until they have a successful insemination. Buuut....\"");
		output("\n\n\"But what?\" you ask.");
		output("\n\n\"Females who change multiple times during their partner's pregnancy, or just take hormones to remain that way aren't unheard off. I suppose it makes sense, since being pregnant makes the mother-to-be horny. It's a like a hormone-induced chemical warfare, lovers can't help but change for each other.\" Maki laughs lightly.");
		output("\n\nCurious now, you ask if it's possible for a female and a male who are coupling to change so it ends up being the female who impregnates the male. The Venarian thinks for a few moments.");
		output("\n\n\"Well, naturally this would never happen. The hormones that trigger male and female transformation are exclusive to each gender, but with today's technology I suppose it could happen... bottle up some pheromones and release them in a small room and I'm pretty sure you'd trigger the change, though I don't know how the attraction will feel like.\" He smirks at you. \"You see when we change we also become even more attuned to our mates, we just can't stop but think about our mates all the time, and if you are in the same room.\" He whimpers at the thought. \"So... yeah... I don't know how they'd react to that.\"");
		if (flags["MAKI_STATE"] == 1) output("\n\nHe licks his lips as he gazes into your eyes. \"So, you see? I can't stop thinking about you bending me over and filling me up with pups, it's really taking all of my self control not to pounce you" + (pc.isNude()?(pc.hasCock()?"":", even through I know you have no cock"):" and rip your lower garments off" + (pc.hasCock()?"":", even if I know there is no cock in there.")) + ".");
		else if (flags["MAKI_STATE"] == 2) output("\n\nHe laughs a bit. \"Make no mistake though, I still think about you pretty much all the time, specially when I remember it's you who put this pup inside my belly.");
		else if (flags["MAKI_BREEDER_SEEN"]) output("\n\nHe looks pensive for a moment. \"You know... I wouldn't mind changing again.\" He looks at you seductively. \"In fact. How about you help me change again? Make it so I'm always ready for your cock?\" He licks his lips. You tell him you'll think about it.");
	}else output("\n\nPresuming he was adopted, you politely avoid digging too deep and instead change the topic.");
	output("\n\n\"Anything else you'd like to know?\" He asks with a smile.");
	clearMenu();
	makiusTalkMenu(0);
}

public function makiusTHisJob():void{
	clearOutput();
	processTime(10);
	author("LukaDoc");
	showBust(makiusBust(1));
	makiusIncreaseRelation(0);
	output("Maki scratches his chin. \"Well, being a medical officer is not easy. You need to study a lot and you can never stop studying. Plus there's countless different species in the universe and you never know what's going to come knocking,\" he explains. \"And even if you are working on ship and only treating the crew, there's no telling what kind of injuries or illness you might catch. So being a medical officer is pretty much a lifetime commitment.\"");
	output("\n\nYou nod in understanding, then question him on his professional formation. You know how he wound up in Last Resort, but you are curious about his time before then.");
	output("\n\n\"I see. Well, I'd be happy to tell you.\" He smiles pleasantly. \"I decided what I wanted to do pretty early in my life. My family was very supportive and I wanted the best. So it comes as no surprise that my only option, if I was aiming for the top, was UGCMA.\" He puffs his chest proudly.");
	output("\n\nYou congratulate him on making it in.");
	output("\n\n\"Thank you. Anyway, I guess I spent most of my life in the academy doubled over books. That doesn't mean I had no social life, I did have friends.\" He scratches his head in thought. \"Though we did gather to study more often than not... I guess we really did not partake in much enjoyment outside of our studies.\" He waves the thought away. \"But it all paid off. We were at the top of the class.\"");
	output("\n\nYou interrupt him to ask him about his adventures in the academy. Surely he must've engaged in some mischief.");
	output("\n\nMaki closes his eyes in thought. \"Nope, nothing.\"");
	output("\n\nYou look at him in disbelief. He averts his gaze.");
	output("\n\n\"Well... umm... I'm a bit shy and I was too busy to do anything besides studying.\"");
	output("\n\nThat's a bit disappointing, you were kinda hoping for some stories.");
	output("\n\n\"I guess my life as a student really is kinda boring. Maybe I should have been a bit more adventurous?\"");
	output("\n\nYou shake your head. He's fine the way he is, besides, as long as he's serving under your command he can expect a good deal of adventures.");
	output("\n\nHe looks at you a bit reproachfully. \"You are not thinking on doing anything dangerous, are you? As your doctor I should discourage you from pursuing-\"");
	output("\n\nYou interrupt him and explain that you don't intend to put yourself, nor anyone from your crew, in a dangerous situation. But you can't very well explore if you don't take risks, can you?");
	output("\n\nMaki sighs. \"I guess you can't.\" Then he smiles brightly at you. \"Alright then. I'll make sure to support you to the best of my ability. So if you are feeling unwell please come to me. Or just come to visit.\" You promise you will.");
	if(flags["MAKI_RELATIONSHIP_STATUS"] == 2) output("\n\n\"He wraps you into a tight hug, nuzzling you affectionately. \"I love you, [pc.name].\" You pat him on the back of his neck, stroking him gently and replying to his affection in kind. He breaks the hug with a smile.");
	clearMenu();
	makiusTalkMenu(1);
}

public function makiusTFeelings():void{
	clearOutput();
	processTime(10);
	author("LukaDoc");
	showBust(makiusBust(1));
	makiusIncreaseRelation(0);
	output("\"You want to know how I'm feeling?\"");
	if (flags["MAKI_STATE"] == 2){
		output("\n\nMaki pats his belly. \"I'm feeling a bit sick, " + (makiusPregLevel() > 2?"bloated,":"") + " lovestruck and maybe a bit horny too. In other words, as happy as I can be.\" He smiles at you, waving his tail side to side.");
		output("\n\nYou can't help yourself; you hug your pregnant boytoy and then rub his " + makiusBellyDescriptor() + " gently. Maki whimpers in delight.");
		output("\n\n\"Careful, [pc.name]. Don't want to spoil our pup before it's born.\"");
		output("\n\nYou simply stroke his belly some more in response.");
		output("\n\nMaki pulls you into a kiss, smiling happily as his tail comes around to stroke your side. \"Anything else I can help you with, my mate?\"");
	}else if (flags["MAKI_STATE"] == 1){
		output("\n\nMaki flicks his mane. \"I'll tell you how I feel. Horny and wet. That's pretty much how I feel anytime I think of you, [pc.name]. I want cock, and not just any cock. I want <b>your</b> cock. " + (pc.hasCock()?"So how about we move to my bed and you make me heavy with your pups?\"":"So how about you grow one back to fuck me with?\""));
		output("\n\nYou shake your head as you realise you're instinctively reaching out to do that, putting yourself forcibly back under control" + (flags["MAKI_TAKING_FEMALE_CONTRACEPTIVES"]?" and reminding him that he's on the pills to prevent himself getting pregnant":"") + ". He walks over towards you, hugging you and rubbing himself on you as best as he can.");
		output("\n\n\"Okay, fine. Pregnancy can wait, but pleaaase let's go to my bed? I need you so badly.\"");
		clearMenu();
		addButton(0, "Sex", makiusTFeelingsSex);
		addButton(1, "No", makiusTFeelingsNo);
	}else if (flags["MAKI_RELATIONSHIP_STATUS"] == 2){
		output("\n\nMaki pulls you into a quick kiss. \"I love you. And being with my mate, I'm as happy as any Venarian could ever hope to be.\"");
		output("\n\nYou kiss him deeply, running your hands appreciatively over his ass, and when you finally step back from him, you promise him that you will get him good on his next break.");
		output("\n\nHe looks at you seductively. \"Really? Then maybe I should take a break right now?\"");
		clearMenu();
		addButton(0, "Sex", makiusTFeelingsSex);
		addButton(1, "No", makiusTFeelingsNo);
	}else if (flags["MAKI_RELATIONSHIP_STATUS"] == 1){
		output("\n\nMaki smiles at you. \"Ever since we... you know. I've been thinking about you alot. I'd never felt like this before, but it's a nice feeling. I guess you could say that I'm happy. I'm once again serving in a ship and I have the best captain I could have.\"");
		output("\n\nYou smile and pat his shoulder, playfully telling him he sounds like a little kid when he talks like that.");
		output("\n\n\"Only because it's true. I'm really glad we could meet. Maybe getting stranded in Tarkus wasn't so bad after all.\"");
		output("\n\nMaybe it wasn't, you agree.");
		output("\n\n\"Anything else I can help you with, [pc.name]?\"");
	}else{
		output("\n\nThe Venarian rubs his chin for a few seconds. \"Fine I guess. I'm very happy to be working at a vessel again.\" He smiles at you. \"I can't thank you enough for saving me, captain. And I can only hope that I'm being helpful to you as well.\"");
		output("\n\nYou tell him that it's good to have him onboard.");
		output("\n\n\"Thank you, captain! Is there anything else I can help you with?\"");
	}
	makiusTalkMenu(2);
}

public function makiusTFeelingsSex():void{
	clearOutput();
	processTime(5);
	author("LukaDoc");
	showBust(makiusBust(1));
	output((flags["MAKI_STATE"] == 1?"Well, if that's what he wants... you tell him to lead the way to his bed. Maki takes your arm and drags you off towards his room, his tail looping around your waist possessively.":"Well, if that's what he wants, you tell him...\n\n\"Alright, break time then.\" He stretches and walks past you, making sure to stroke your side with his tail as he does. He turns his head to look at you on the side, his tongue lolling out in a teasing and playful expression."));
	makiusSexMenu();
}

public function makiusTFeelingsNo():void{
	clearOutput();
	processTime(5);
	author("LukaDoc");
	showBust(makiusBust(1));
	if (flags["MAKI_STATE"] == 1){
		output("Insistently, you explain that sex right now isn't an option.");
		output("\n\n\"But that's not fair! You come in here, make me think about your sexy body and about how much I want your pups.... And then you just say no? At least promise you'll do me soon!\" He demands.");
		output("\n\nYou apologise, but you're not ready to fuck him just yet.");
		output("\n\nHe groans in frustration. \"Fine, I guess I'll find a way to calm myself down later.\"");
		output("\n\nYou assure him that he'll figure something out, then stroke his mane for emphasis.");
		output("\n\nHe leans against your hand and whimpers in delight. \"I can't stay mad at you if you keep pampering me like this.\"");
		output("\n\nYou tell him that he's a very generous person.");
		output("\n\n\"I'm in a good mood now. Something else you want, my mate?\" His tail lazily waves behind him.");
	}else{
		output("You shake your head; now is not the time, you explain.");
		output("\n\n\"Okay. But don't hesitate to come to me whenever you are feeling like it. I love you, and as your mate, it's my duty to make sure you aren't feeling pent up. Besides, as your doctor, I have to advise you that holding back can lead to health problems. And you know I can never say no to you.\" He smiles.");
		output("\n\nYou let him know you'll do that.");
		output("\n\n\"Great, anything else I can help you with, my mate?\"");
	}
	makiusTalkMenu(1);
}

public function makiusTPregnancy():void{
	clearOutput();
	processTime(10);
	author("LukaDoc");
	showBust(makiusBust(1));
	makiusIncreaseRelation(0);
	if (flags["MAKI_STATE"] == 2){
		output("\"It might a be a bit too late to talk about that now.\" He chuckles happily, patting his " + makiusBellyDescriptor() + ". \"In any case, what is it you want to talk about? Perhaps you'd like to start discussing names? Venarians just pick a name when the baby is born, but I heard other cultures like to discuss in advance.\"");
		output("\n\nHmm... that's a possibility, but you were kind of wondering if he'd tell you just how he feels about it. You can't imagine it being easy for a man to be pregnant, after all.");
		output("\n\n\"Ah, it's not so bad. I'll admit I never thought too much about it, but right now… I'm happy. I'm happy to be carrying a tiny spark of our own. Sure there's all kinds of new things I have to get used to, and it's not always peachy either. But I'm happy that I'm carrying our child.\" He smiles blissfully at you.");
		output("\n\nSo it seems... in fact, if you're honest, you'd almost say he looks like he enjoys being pregnant, you comment, reaching out to place your hand on the ");
		switch(makiusPregLevel()){case 3:output("flagrent"); break; case 4:output("huge"); break; default:output("subtle"); }
		output("bump that is your unborn child in Maki's womb.");
		output("\n\nHe places a hand over yours, letting his fingers interlace with your own. \"I do enjoy it. I mean… it's our child. How could I not enjoy it?\" He breaks into a happy grin. \"I think we'll both be wonderful parents.\"");
		output("\n\nYou tell him that's very flattering... so, he's honestly not just comfortable with being pregnant, he's enthusiastic about the fact?");
		output("\n\n\"Very much.\" He nods for emphasis. \"I'm very happy that our union is going to bear fruits. I just hope this won't come between our… umm… activities.\"");
		output("\n\nWell... you won't let it if he doesn't want you to, you reply.");
		output("\n\n\"Of course not!\" He immediately exclaims. \"I need you, [pc.name]. You're my mate and I need you with me, always. And just because I'm pregnant, it doesn't mean I don't crave you. On the contrary. I want you even more now.\" He averts his gaze, closing his eyes and smiling as his face heats up.");
		output("\n\nYou just smile and rub his belly. So... if he enjoys being pregnant, is there any particular thing about being pregnant that he considers his favorite part?");
		output("\n\nHe smiles adoringly at you. \"Of course. The best part of being pregnant is having my mate around to dote over me. Like so…\" He clears his throat. \"[pc.name]. Would you mind giving me a hug and a kiss? I'm feeling a bit lonely right now….\" He gives you his best impression of <i>puppy eyes</i>.");
		output("\n\nYou smile and sweep him into your arms, delicately embracing him before pulling him into a kiss. Passionately you lock lips with him, feeling your gravid boyfriend's form pressing against your own and letting him bask in your feelings for him.");
		output("\n\nHe breaks the kiss shortly afterward. \"I love you, [pc.name].\"");
		output("\n\nYou simply kiss him again, squeeze him gently, and then let him go. One last question, and then you'll leave him in peace, you promise.");
		output("\n\n\"Yeeeees?\" he questions with a musical tone.");
		output("\n\nHad he ever anticipated that he'd be the one to give birth to his children, when the time came for him to have a family?");
		output("\n\n\"Nope.\" He shakes his head. \"I've always thought I'd meet a nice Venarian female to settle down with. But now… well… now all I want is you. So I don't mind being banged silly and made to carry our child at all. In fact… I hope you will make me change again soon so we can have another.\" He grins at you.");
		output("\n\nYou nod your head absently as you digest this information, then thank him for sharing such personal information with you.");
		if (!pc.hasCock()) output("\n\n\"See you later, my love.\"");
		else{
			output("\n\nHis tail wraps around you possessively. \"Hold it for a moment.\" He pulls you against him, nuzzling you lovingly.");
			output("\n\nYou let your pregnant boyfriend nuzzle you, asking him what he wants.");
			output("\n\n\"I'm having a craving… and I want your help.\"");
			output("\n\nAnd how might you help him, you playfully ask.");
			output("\n\nHe grabs your crotch. \"I want your cock, my mate.\"");
			clearMenu();
			addButton(0, "Yes", makiusTPregnancyYes);
			addButton(1, "No", makiusTPregnancysNo);
		}
	}else{
		output("\"Pregnancy, huh….\" He sighs airily, a dreamy air about him as he looks at nothing in particular.");
		output("\n\nMaki? Makius? Hey, is he feeling alright, you ask even as you reach out and place a hand on his shoulder.");
		output("\n\n\"...Huh? Oh, sorry [pc.name].\" His eyes focus back on you and he smiles. \"What is it that you want to discuss about pregnancy?\"" + (flags["MAKI_SIRED_CHILDREN"] > 0 || flags["MAKI_BIRTHED_CHILDREN"] > 0?" His mouth opens in realization for a moment, before he gives you a loving gaze of adoration. \"Could it be that perhaps you wanted to discuss us having another baby?":""));
		output("\n\nWell... you'd guess the first thing you want to discuss is why the topic seems to make him go off into dreamland, you jokingly reply.");
		output("\n\n\"Ah, right.\" He laughs nervously. \"To be honest it's not something I give much thought normally, but I guess I don't mind carrying a little Venarian round, even though pregnancy has its issues.\"");
		output("\n\nIssues?");
		output("\n\n\"Yes, issues. For male Venarians it can be quite trying at times. Our bodies literally become a hormonal warzone, and we have to deal with all kinds of new feelings and crazy cravings.\"");
		output("\n\nIt sounds quite rough, you comment. But, has he ever thought about going through it himself?" + (flags["MAKI_BIRTHED_CHILDREN"] > 0?"Before you and he had " + (flags["MAKI_BIRTHED_CHILDREN"] == 1?"a child":"children") + " together, you mean.":""));
		output("\n\n\"Actually, no. But now that you mention.\" He looks you over quickly before averting his gaze and smiling to himself. " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?(!flags["MAKI_BIRTHED_CHILDREN"]?"\"I'm kinda looking forward to it….\"":"\"I want to feel like that again….\""):"\"...Nevermind, I'll worry about it when the time comes.\""));
		if (flags["MAKI_BREEDER_SEEN"] == true && pc.hasCock()){
			output("\n\nYou see... just one last question; had he ever thought that, when he found the right person to have children with, he'd be the one who'd give birth to them?");
			output("\n\nHe rubs his chin in thought. \"To be honest I always thought I would find a nice female Venarian to be with, so the thought never crossed my mind, but….\" He glances at you. \"I think now… I wouldn't mind getting knocked up.\"" + (flags["MAKI_BIRTHED_CHILDREN"] > 0?"He laughs a bit. \"The first time was pretty intense, I wouldn't mind going through that again for you.\"":""));
		}
		output("\n\nYou thank him for sharing such personal details with you.");
		output("\n\n\"No problem. Is there anything else you'd like to do?\"");
		makiusTalkMenu(3);
	}
}

public function makiusTPregnancyYes():void{
	clearOutput();
	processTime(5);
	author("LukaDoc");
	showBust(makiusBust(2));
	output("\"Yay!\" He celebrates. \"I'm so wet, and horny, and needy. Please play with me.\" He hugs you tightly nuzzling you lovingly.");
	if (!pc.isNude()){
		output("\n\nAlright, alright; but first, you need to get undressed, so if your sexy preggy boytoy will let you go, hmm?");
		output("\n\nHe reluctantly complies.");
		output("\n\nFree of his pinning grip, you step away and begin to strip yourself off, making a show of removing your gear and placing it safely aside.");
		output("\n\nAs Maki appreciates the show, he follows you by removing his own");
	}else output("\n\nMaki lets you go and starts removing his");
	output(" clothes" + (flags["MAKI_STATE"] == 2?", easily taking off the lab coat and pants, but struggling with the black undershirt that remains snug against his pregnant form":"") + ", until he is completely naked. You can see his Venarian cock poking out of its slit in arousal. Maki can really be a horny thing if left unchecked.");
	output("\n\nYou smile and study his gravid form, wondering just how you should sate his 'cravings'....");
	makiusSexMenu();
}

public function makiusTPregnancysNo():void{
	clearOutput();
	processTime(5);
	author("LukaDoc");
	showBust(makiusBust(1));
	output("\"Awww….\" His ears droop in disappointment.");
	output("\n\nYou are sorry, and you promise you'll drop by as soon as you can, but right now, you have some other business to take care of.");
	output("\n\nHe sighs, a bit grumpy. \"Alright. I'll hold out for you. But please don't make me wait long.\"");
	output("\n\nYou promise you'll try to be by soon.");
	output("\n\n\"Thanks, [pc.name].\" He smiles happily as you go.");
	makiusTalkMenu(3);
}

public function makiusDrugs():void{
	clearOutput();
	processTime(5);
	author("LukaDoc");
	showBust(makiusBust(1));
	output("You approach Maki's personal medicine cabinet and survey the selection of drugs he has.");
	clearMenu();
	addButton(0, "Virility", makiusDVirility, undefined, "Virility Pills", (flags["MAKI_TAKING_MALE_CONTRACEPTIVES"]?"Let him know you are ready for his baby.":"Let him know you are not ready for his baby."));
	if(flags["MAKI_BREEDER_SEEN"]){
		addButton(1, "Pregnancy", makiusDPregnancy, undefined, "Pregnancy Pills", (flags["MAKI_TAKING_FEMALE_CONTRACEPTIVES"]?"Tell him to stop taking pregnancy prevention pills.":"Tell him to start taking pregnancy prevention pills."));
		addButton(2, "Suppressants", makiusDSuppressants, undefined, "Suppressants", (flags["MAKI_TAKING_SUPPRESSANTS"]?"Ask him to go off the breeder suppressants.":"Ask him to start taking breeder suppressants."));
		//bioven
		if (!CodexManager.entryViewed("Venarians") && !flags["MAKI_BIOVEN_QUEST"]) addDisabledButton(3, "Locked", "Locked", "You should learn more about Venarians first.");
		else if (!flags["MAKI_BIOVEN_QUEST"]) addButton(3, "Manipulation", makiusBioVenResearch, undefined, "Manipulation", "See if you can get him to take Venarian breeding manipulation drugs.");
		else if (flags["MAKI_BIOVEN_QUEST"] == 1) addDisabledButton(3, "Manipulation", "Manipulation", "Maki is still researching which drugs are the best.");
		else if (flags["MAKI_BIOVEN_QUEST"] == 2) addButton(3, "BuyBioVen", makiusBioVenBuy, undefined, "Buy BioVen", "Check details and price on the medicine you discussed.");
		else if (flags["MAKI_BIOVEN_QUEST"] == 3) addDisabledButton(3, "BioVen", "BioVen", "The product hasn't arrived yet.");
		else addButton(3, "BioVen", makiusDBioVen, undefined, "BioVen", "Request he changes his masculinity for you.");
	}
	addButton(14,"Back", makiusMenu);
}

public function makiusDVirility():void{
	clearOutput();
	processTime(15);
	author("LukaDoc");
	showBust(makiusBust(1));
	clearMenu();
	if (flags["MAKI_TAKING_MALE_CONTRACEPTIVES"]){
		if (pc.isPregnant()){
			output("\"It's not like it matter really since you're already pregnant " + (pc.hasPregnancyOfType("MakiusPregnancy")?" with my child.":".") + (pc.vaginaTotal() > 1?(pc.isFullyWombPregnant()?" And you got all your wombs filled with " + (pc.hasPregnancyOfTypeOtherThan("MakiusPregnancy")?"babies":"puppies") + " too.":" Oh wait, you have more than one womb."):""));
			//cut this out.  put back in if pc butt preg actually leads anywhere: (pcHasAnalPreg?" Even your butt has a " + (pcHasmakiusAnalpuppy?"puppy.\"":"baby.\""):" Or are you like my kin that can carry a baby in the butt?\""));
			output("\n\nYou tell him you want " + (pc.findEmptyPregnancySlot(1) >= 0?"to be heavy with his puppies.":"him as virile as he can be even if you can't become any more pregnant."));
			output("\n\nHe blushes and shies away from your eyes. \"Sure, I'll stop taking the pills then.\"");
		}else if (flags["MAKI_SIRED_CHILDREN"] > 0 || flags["MAKI_BIRTHED_CHILDREN"] > 0){
			output("\"You want another child? Isn't " + (flags["MAKI_SIRED_CHILDREN"] + flags["MAKI_BIRTHED_CHILDREN"]) + " pupp" + (flags["MAKI_SIRED_CHILDREN"] + flags["MAKI_BIRTHED_CHILDREN"] == 1?"y":"ies") + " enough?\"");
			output("\n\nYou tell him you can never have too many puppies.");
			output("\n\n\"It's a good thing you have your own nursery, otherwise that wouldn't be the case at all. I'll stop taking the pills then.\"");
		}else{
			output("\"You think we're ready for a child?\"");
			output("\n\nYou tell him you think you are.");
			output("\n\nHe blushes. \"Sure, then I'll go off the pills so I can try to put a puppy in you.\"");
		}
		flags["MAKI_TAKING_MALE_CONTRACEPTIVES"] = false;
		if (!makius.cockVirgin){
			if (!flags["MAKI_VIRILITY_BOOST"] || GetGameTimestamp() > flags["MAKI_VIRILITY_BOOST"] + 1440) addButton(1, "Boost", makiusBoostVirility, undefined, "Boost virility", "You are determined to have his child! Demand he takes anything to boost his sperm production.");
			else addDisabledButton(1, "Boost", "Boost virility", "Maki is still on virility boosters");
		}else addDisabledButton(1, "Boost", "Boost virility", "You need to have had vaginal sex with him to ask him to take virility boosters");
		addButton(0 ,"Continue", makiusMenu);
	}else{
		output("\"I guess it's a pretty big responsibility to have " + (flags["MAKI_SIRED_CHILDREN"] > 0?"more babies":"a baby") + " in you. Even if you have your own nursery to take care of that business.\"");
		output("\n\nYou thank him for understanding.");
		output("\n\n\"Sure, no problem, I'll start taking the pills then.\"");
		flags["MAKI_TAKING_MALE_CONTRACEPTIVES"] = true;
		makiusMenu();
	}
}

public function makiusBoostVirility():void{
	clearOutput();
	processTime(5);
	author("LukaDoc");
	showBust(makiusBust(1));
	clearMenu();
	flags["MAKI_VIRILITY_BOOST"] = GetGameTimestamp();
	makius.cumQualityRaw = 4;
	output("As you finish making your request his ears lower and his tail slides between his legs.");
	output("\n\n\"You want me to take v-virility boosts.\" As he looks away from you, while laughing nervously, trying his best to hide his embarrassment. \"Jeez, y-you must be craving my puppies really bad.\"");
	output("\n\nYou grab the bottle of pills and nod, quickly closing the space between you. You kiss him to try and get him to relax and it doesn't take him long for him to start kissing back. You part the kiss and show him the pill you're going to make him take. His open maw is ready to welcome the virility boost, so you plop it down on his tongue and see it slide down into his throat, before he swallows it. You let your fingers slide down across his chest and into his pants, feeling the nubby tip already poking out from his slit. It rapidly fills in your hand, throbbing harder and hotter than ever before. " + (flags["MAKI_STATE"] > 0?" Your other hand slides between his oversized buttocks, his smile turning into a sloppy grin. \"Can we do it in my butt?\"":"Your Venarian boytoy is clearly embarrassed, but manages to ask, \"Can we do it right now?\""));
	makiusSexMenu();
}

public function makiusDPregnancy():void{
	clearOutput();
	processTime(15);
	author("LukaDoc");
	showBust(makiusBust(1));
	clearMenu();
	if (flags["MAKI_TAKING_FEMALE_CONTRACEPTIVES"]){
		if (flags["MAKI_STATE"] == 1){
			output("He grins and hugs you. \"So you are ready to make me heavy with your pups?\"");
			output("\n\nYou give his ass a squeeze. He just grins wider.");
		}else{
			output("\"So, you are ready for us to " + (flags["MAKI_BIRTHED_CHILDREN"] > 0 || flags["MAKI_STATE"] == 2?"continue adding to our family?":"build a family of our own?"));
			output("\n\nYou nod.");
			output("\n\nHe grins at you. \"Okay, I'll stop taking the pills.\"");
		}
		flags["MAKI_TAKING_FEMALE_CONTRACEPTIVES"] = false;
	}else{
		if(flags["MAKI_STATE"] == 2)output("\"So you don't want more babies? Alright. I'll start taking them as soon as I'm done with this little one.\" He pats his " + makiusBellyDescriptor() + ".");
		else if (flags["MAKI_STATE"] == 1){
			output("\"So, there won't be babies?\" He looks at you in disappointment.");
			output("\n\nYou nod and explain that you simply are not ready for a baby right now.");
			output("\n\n\"I understand, I'll start taking the pills. But you do know I'll be stuck like this until you knock me up, right?\"");
			output("\n\nYou give him a coy smile and tell him this isn't so bad.");
			output("\n\n\"Maybe not.\" He smiles back at you.");
		}else{
			output("\"Pills? Sure. I know we'll have " + (flags["MAKI_BIRTHED_CHILDREN"] > 0?"another ":"") + "one when the time is right.\" He smiles at you.");
			output("\n\nYou thank him for being so understanding.");
		}

		flags["MAKI_TAKING_FEMALE_CONTRACEPTIVES"] = true;
	}
	makiusMenu();
}

//suppressants will prevent maki_state from reaching 1
public function makiusDSuppressants():void{
	clearOutput();
	processTime(15);
	author("LukaDoc");
	showBust(makiusBust(1));
	clearMenu();
	if (flags["MAKI_TAKING_SUPPRESSANTS"]){
		output("\"You want me to stop taking my suppressants?\"");
		output("\n\nYou nod.");
		output("\n\n\"You realise that if we fool around too much when I'm off my suppressants I'll....\"");
		output("\n\nThat's the intention, you tell him. He smiles at you.");
		output("\n\n\"Okay, I'll stop taking them. Is there anything else you'd like to do?\"");
		flags["MAKI_TAKING_SUPPRESSANTS"] = false;
	}else{
		if (flags["MAKI_STATE"] == 2){
			output("\"Alright, [pc.name]. I'll start taking suppressants as soon as this little one is born. He pats his " + makiusBellyDescriptor() + " belly. \"So, is there anything else you'd like to do?\"");
		}else if (flags["MAKI_STATE"] == 1){
			output("\"Okay, [pc.name]. If you'd rather I took suppressants, I'll do it.\" Maki smiles at you, though you do detect some underlying disappointment. \"I'll need to ask you to leave while I do this, though. When we take suppressants after we've shifted, we tend to get a bit sick.\"");
			output("\n\nYou question if he'll be alright?");
			output("\n\n\"Yes, it's just a bit of nausea as our body shifts back. So, don't worry, I'll be fine.\"");
			output("\n\nYou nod in understanding and leave the Venarian alone for the moment.");
			flags["MAKI_STATE"] = 0;
			flags["MAKI_TAKING_SUPPRESSANTS"] = true;
			addButton(0,"Leave",makiusLeave);
			return;
		}else{
			output("\"Alright, [pc.name]. I'll start taking the pills.\"");
			output("\n\nYou thank the Venarian.");
			output("\n\n\"No problem. I can understand if you prefer me to look like my usual self. Anyway, is there anything else I can do for you?\"");
		}
		flags["MAKI_TAKING_SUPPRESSANTS"] = true;
	}
	makiusMenu();
}

public function makiusDBioVen():void{
	clearOutput();
	processTime(5);
	author("LukaDoc");
	clearMenu();
	output("You look at the BioVen medicine bottle tucked away in the corner of the cabinet. The bottle is split into three, each section labelled as Natural, Feminine and Masculine. Reading the effects of these pills on the booklet you learn that this medicine is capable of manipulating Venarian biology in order to control how they look whilst in breeding heat or even in their natural state. The natural pills seems to be a <i>cure</i> for the others, resetting their effects. There's a warning in big bold letters telling of the hazards of consumption for non-Venarians.");
	addButton(0, "Natural", makiusDBioVenNext, 0, "Natural", "Reset him back to his natural transitioning system.");
	addButton(1, "Feminine", makiusDBioVenNext, 1, "Feminine", "Tell him to take the feminization drug.");
	addButton(2, "Masculine", makiusDBioVenNext, 2, "Masculine", "Tell him to take the masculinization drug.");
	if (flags["MAKI_TAKING_BIOVEN"] == 2){
		addDisabledButton(2, "Masculine", "Masculine", "Tell him to take the masculinization drug.");
	}else if (flags["MAKI_TAKING_BIOVEN"] == 1){
		addDisabledButton(1, "Feminine", "Feminine", "Tell him to take the feminization drug.");
	}else{
		addDisabledButton(0, "Natural", "Natural", "Reset him back to his natural transitioning system.");
	}
	addButton(3, "back", makiusMenu);
}

public function makiusDBioVenNext(drugSelected:int):void{
	clearOutput();
	processTime(10);
	author("LukaDoc");
	showBust(makiusBust(2));
	clearMenu();
	flags["MAKI_TAKING_BIOVEN"] = drugSelected;
	makiusSexMenu();
	if (drugSelected == 2){
		output("\"Oh? So I guess you really do prefer males.\" He scritches his chin, trying his best to hide the fact that he is shying away from your gaze.");
		output("\n\nYes you do, and you like how he normally looks. Of course you won't say no to a bigger butt." + (flags["MAKI_STATE"] == 2?" And since the drug is safe you'll take extra joy in seeing him like that while carrying your pup.":(flags["MAKI_TAKING_FEMALE_CONTRACEPTIVES"]?" Seeing his belly expand with your pup will be the cherry on top.":"")));
	}else if (drugSelected == 1){
		output("\"So that's how you like seeing me.\" He blushes, you can seen by his lowered ears that he seems to be a little nervous. \"Makes me wonder why you picked a guy like me instead of a proper female.\"");
		output("\n\nSo that's what he's worried about. You boop is his nose and tell him it's because there isn't a female in this universe who looks half as cute as your little Venarian. His ears rise upwards as his blushing intensifies beneath those layers of fur.");
	}else{
		output("\"You want me to go back to normal? " + (makiusMasculine()?"I was getting used being like this all the time. But if you're sure you want me to go back to my natural self, I'll do it for you.\" He smiles at your decision.":"But I was starting to enjoy these!\" He pouts, while grabbing his breasts and showing off how jiggly they are. \"But if you're absolutely sure you want me to go back to my natural self, I'll do it for you.\" Despite what he said he seems a little saddened."));
		output("\n\nYou nod affirmatively.");
	}
	output("\n\nYou fetch him a cup of water and give it to him, together with the pill. He seems to be apprehensive, as he stares at the pill for a few minutes without making any attempt at taking it. You ask him what's wrong.");
	output("\n\n\"I wonder if I should be really be messing around with my body like this.\"");
	output("\n\nNow he's just making excuses, after all it was him that said this was the safest pill on the market.");
	output("\n\n\"But...\"");
	output("\n\nBefore he can give you another excuse, you plant a kiss on his lips to try to get him to become more comfortable with the situation. Slowly, he relaxes and kisses you back. After you part the kiss you tell him he's afraid over nothing and you would really want to see him change. He blushes <b>hard</b>, and you take his temporary embarrassment as an opportunity to get him undressed. You unbutton his lab coat, unfasten his pants, letting them fall to his feet, and pull the undershirt from his form, until he stands naked before you.");
	output("\n\nYou assertively pat the bed, telling that he should sit since BioVen's effects are immediate and you don't want him to fall. He sits beside you and looks at the pill, before popping it into his mouth and swallowing it with the glass of water.");
	output("\n\n\"Anything for you, my mate.\"");
	if (flags["MAKI_STATE"] && makiusMasculine()){
		//to female
		output("\n\nThe effect is almost immediate. \"Oh my stars!\" He moans as he collapses back on the bed, writhing not in pain but in lust, his hands darting all over his form before settling on his flat chest. His dick is already fully out of the slit and completely erect. Even though it's throbbing as hard as you've ever seen it throb, you notice that it's starting to diminish in size. It only lasts for a little bit, his penis losing around two inches and becoming a little thinner. Next is his hips, which expand quickly, filling out until they are the size perfect for a breeding mother, giving him that extra curvy look. Lastly you see him caressing his chest, which soon starts to fill out, growing larger and larger into a pair of perky" + (flags["MAKI_STATE"] == 2?", milk-dripping C":"B") + "-cup tits.");
	}else if (!flags["MAKI_STATE"] && !makiusMasculine()){
		//to male
		output("\n\nThe effect is almost immediate. \"Oh my stars!\" He moans as he collapses back on the bed, writhing not in pain but in lust. His hands dart all over his form before settling on his genital slit. It starts with his chest, as they slowly begin to deflate losing their perkiness " + (flags["MAKI_STATE"]?" and their milk":"") + ". Slowly the fat and loose skin begins to disappear until it completely flattens into a pair of taut pecs, a set not completely without muscle. Next is his hips, which start to diminish in size, until they are small enough that he looks less genderqueer. The perfect size for a man. Finally your eyes go to where his hands have been this whole time, languidly stroking his already erect dick. You're just in time to see the transformation, as his dick grows longer and thicker than before. It fills up until it's throbbing two inches larger than before, standing now at nine inches long, and a lot thicker.");
	}else{
		//nothing happened
		output("\n\nAfter waiting for a few minutes, you don't spot any changes to his body. You ask him if he feels anything.");
		output("\n\n\"I'm feeling tingly, but besides that nothing else. I suppose taking this pill in this state wouldn't trigger any visible changes." + (flags["MAKI_STATE"] == 2?" Guess we'll have to wait for the pup to come out before we can see any differences.":(flags["MAKI_STATE"]?" Maybe you should make me go into breeding heat.":"")) + (flags["MAKI_STATE"] == 1?" I think I'll have to take some suppressants before we can spot any difference.":" He giggles nervously."));
		output("\n\nAs you rise up from the bed, you feel his tail wrap around your " + (pc.tailCount != 0?"own":"midriff") + ", stopping you from leaving. \"I know there wasn't any change and all… and I don't know if this is me or the drug talking, but you kissed me and then got me all naked. And I would like...\" He seems really nervous, constantly tapping the tip of his forefingers.");
		output("\n\nYou rub his mane, telling him to relax and that yes, we can have some fun.");
		output("\n\nHis tails releases you and starts wagging behind him, \"Thank you [pc.name]!\"");
		flags["MAKI_TAKING_BIOVEN"] = drugSelected;
		return;
	}
	processTime(10);
	output("\n\nNot long after he seems to regain control of his body and sits up on the bed, his new body dripping with obvious arousal, from his erect penis to his bedroom eyes.");
	output("\n\n\"So, how do I look now? Do you like it?\" He gives you a nervous smile.");
	output("\n\nYou tell him he looks great, that you like it very much and thank him for doing this for you. Then, you hug him close and ask him if he wants to take his new body for a spin.");
	output("\n\nHe hugs you close, burying your head in his fluffy, " + (makiusMasculine()?"flat":"bountiful") + " chest, as he tells you, \"Yes! I would like that very much.\"");
	flags["MAKI_TAKING_BIOVEN"] = drugSelected;
}

public function makiusBioVenResearch():void{
	clearOutput();
	processTime(5);
	author("LukaDoc");
	showBust(makiusBust(1));
	clearMenu();
	output("You read on your codex that there was a way to manipulate his Venarian biology, so you ask the doctor if this is true.");
	output("\n\n\"It is. Honestly I never looked it up, just heard some rumours and dirty jokes. Why?\"");
	output("\n\nHe seems to be oblivious to your true intent, so you explain it to him.");
	output("\n\n\"I… You want me to look different… I guess I could do that. Just give me a while to do my research, so I can find the best, safest medicines.\"");
	output("\n\nYou leave him to his research.");
	flags["MAKI_BIOVEN_QUEST"] = 1;
	flags["MAKI_BIOVEN_QUEST_TIMER"] = GetGameTimestamp();
	addButton(0,"Leave",makiusLeave);
}

public function makiusBioVenBuy():void{
	clearOutput();
	processTime(5);
	author("LukaDoc");
	clearMenu();
	output("You take out your codex and search for the BioVen medicine the Venarian doctor mentioned after you asked him about manipulating his breeding heat. Advertisement claims it's one of the safest drugs of its kind for Venarians and searching through digital encyclopedias and reviewer blogs seems to confirm this. The particular variant of the product that Makius mentioned is more expensive than the rest, costing ten thousands credits for the whole bottle, but it comes with three types of drugs, masculinizing, feminizing and neutralizer and with enough doses to last a lifetime.");
	if (pc.credits >= 10000) addButton(0, "Buy", makiusBioVenBuyYes, undefined, "Buy", "Pay ten thousand credits for the BioVen drug.");
	else addDisabledButton(0, "Buy", "Buy", "You can't afford the drug.");
	addButton(1, "Back", makiusCrewMenu);
}

public function makiusBioVenBuyYes():void{
	clearOutput();
	processTime(10);
	author("LukaDoc");
	clearMenu();
	output("You order the drug and see ten thousand credits being deducted from your account. The receipt tells you the pills should arrive soon.");
	flags["MAKI_BIOVEN_QUEST"] = 3;
	flags["MAKI_BIOVEN_QUEST_TIMER"] = GetGameTimestamp();
	pc.credits -= 10000;
	addButton(0,"Leave",makiusLeave);
}

public function makiusHeal():void{
	clearOutput();
	processTime(20);
	author("LukaDoc");
	showBust(makiusBust(1));
	clearMenu();
	makiusIncreaseRelation(1);
	output("You ask the doctor if he could get you treated, " + (pc.HP() < pc.HPMax() / 3?"as you're at your brink of exhaustion.":(pc.HP() < pc.HPMax() / 3 * 2?"as you're hurting all over.":"not that you feel that bad, but better to be safe than sorry.")));
	output("\n\n\"Well, I don't have a specialized medlab, but I'm a doctor and a doctor should always be ready to treat a patient. Just " + (!pc.isNude()?"take off your clothes and ":"") + "sit on the bed while I go get the kit.\"");
	output("\n\nYou do as ordered" + (!pc.isNude()?", taking off " + (pc.isCrotchGarbed() && pc.exhibitionism() <= 50?"most of your clothes, leaving only your [pc.lowerUndergarment] on":"all of your clothes until you're completely nude"):"") + " and lay on top of the bed. He turns around " + (!pc.isCrotchGarbed() || pc.exhibitionism() >= 50?", surprised to see you naked,":"") + " with a kit in hand and begins to examine your wounds.");
	//licking wounds scene
	if (flags["MAKI_RELATIONSHIP_STATUS"] == 2 && pc.HP() < pc.HPMax() / 2 && (!flags["MAKI_NOT_LICKING_WOUNDS"])){
		output("\n\nYou feel something wet against your wound. Once, then twice, then thrice. It begins to sting so you look below and see him applying an orange ointment over the injury, replacing the pain with a refreshing sensation.");
		output("\n\nThen he gathers saliva on his maw and then approaches it over the wound. You see his slick tongue slipping out and starts licking your wounds like a big ol' dog. He runs his tongue three times and then applies the ointment. One by one he does this ritual, licking it three times and then applying the healing cream before jumping to the next wound, only stopping when every single wound is properly treated.");
		if (pc.hasStatusEffect("Venarian Spit")) pc.setStatusMinutes("Venarian Spit", 1440);
		else pc.createStatusEffect("Venarian Spit", 50, 0, 0, 0, false, "Icon_Water_Drop", "You've been licked by your Venarian lover. It's lingering effects slowly heal and energise you.", false, 1440);
		if (flags["MAKI_NOT_LICKING_WOUNDS"] == undefined){
			output("\n\n\"Good thing you have a Venarian for a doctor… and boyfriend.\" He giggles a bit nervously at that last part. \"Venarian saliva is a real potent disinfectant, much cheaper than these disinfectants I've been using.\" He points at his open maw, showing off a tongue wet with Venarian saliva. \"Though I should've asked earlier. Do you mind if I do this again in the future?\"");
			addButton(0, "Lick Me", makiusHealYesLick, undefined, "Yes", "That's okay.");
			addButton(1, "Don't", makiusHealNoLick, undefined, "No", "Ew, gross.");
			pc.HP(pc.HPMax());
			return;
		}
	}else if (pc.HP() < pc.HPMax() / 3)output("\n\n\"This is pretty serious! Good thing you have me as a doctor. We'll have you up and running in no time!\" He starts by cleaning your wounds, washing them with a painless, perhaps painkilling, disinfectant. Then he pulls out a few bandages with a strange blue colouring and applies them over your most grievous wounds. He finishes the treatment by applying an orange ointment over the smaller wounds.");
	else if (pc.HP() < pc.HPMax() / 3 * 2){
		output("\n\n\"It could be worse.\"");
		output("\n\nThat's not very comforting.");
		output("\n\n\"Don't worry about it, I have just the treatment to get you back to full health!\" He says as he starts cleaning your wounds with a disinfectant. It stings for a bit until he applies an orange ointment to it, replacing the pain with a refreshing sensation.");
	}else output("\n\n\"This is nothing much, just a cut here and there.\" He says, as he applies an orange ointment over your wounds and see them close and disappear leaving no hint of their existence behind.");
	output("\n\n\"Well, without a Medlab this is about the best I can do. Hope this is okay with you.\"");
	output("\n\nYou tell him that he did a fine job, even though you don't really have the necessary facilities, and thank him for his help.");
	if (flags["MAKI_RELATIONSHIP_STATUS"] == 2){
		output("\n\n\"When you show up with these wounds I can't help but worry. I really like you and seeing you with even the tiniest cut hurts me really bad. I know that being a rusher is a dangerous job, I just didn't expect to fall for one when you invited me in. Just… please just be careful out there.\"");
		output("\n\nYou tell him you will. He smiles, relieved with your answer.");
	}
	pc.HP(pc.HPMax());
	makiusMenu();
}

public function makiusHealYesLick():void{
	clearOutput();
	processTime(5);
	author("LukaDoc");
	showBust(makiusBust(1));
	clearMenu();
	output("You tell him you don't mind that, heck you might've started to enjoy it. He smiles, happy with your answer.");
	flags["MAKI_NOT_LICKING_WOUNDS"] = false;
	makiusMenu();
}

public function makiusHealNoLick():void{
	clearOutput();
	processTime(5);
	author("LukaDoc");
	showBust(makiusBust(1));
	clearMenu();
	output("That's just gross! You tell him no and to never do such thing ever again. He looks at you stunted for a bare moment before answering with a meek \"Okay\".");
	flags["MAKI_NOT_LICKING_WOUNDS"] = true;
	makiusMenu();
}

public function makiusEvict():void{
	clearOutput();
	processTime(5);
	author("LukaDoc");
	showBust(makiusBust(1));
	clearMenu();
	output("You apologize and tell him you need to make some space on the ship and that he needs to leave.");
	output("\n\nHis ears lower and he seems sad, \"I understand.\"");
	output("\n\nYou try to comfort him, telling you'll get invite him back when you get a bigger ship or find some more space somewhere. Not a moment and his ears perk up instantly.");
	if (flags["MAKI_STATE"] == 2 && !flags["MAKI_OFFERED_JOB_AT_NURSERY"] && !flags["MAKI_BIRTHED_CHILDREN"]){
		output("\n\n\"But where will I go? I'm carrying our <b>child</b>! I can't just raise it back on Tarkus like this.\" He says suddenly stricken with worry.");
		output("\n\nYou quickly console him and tell him he's welcome to stay at the nursery, get pampered until you give birth to our puppy.");
		output("\n\n\"Oh. I-I think I'm okay with that.\" He seems a lot more relieved after you allayed his worries.");
	}else if (flags["MAKI_STATE"] == 2){
		output("\n\n\"I'll go back to the nursery. I'll wait for our puppy to be born and then I'll ");
		if (flags["MAKI_OFFERED_JOB_AT_NURSERY"] == true){
			output("stay there to take care of our" + (flags["MAKI_BIRTHED_CHILDREN"] + flags["MAKI_SIRED_CHILDREN"] < ChildManager.numChildren()?" and your other":"") + " children");
		}else{
			output("move back to the clinic, trying my best to make ends meet. I will start looking for a job closer to Tavros");
		}
		output(".\" He says with a smile on his face, through his lowered ears tell you that he's doing his best to hide the fact that he is sad from being away from you.");
	}else if (flags["MAKI_OFFERED_JOB_AT_NURSERY"]){
		output("\n\n\"I understand.\" Despite his smile, his slightly lowered ears show that he can't help but feel a little sad at his imminent eviction. \"I will always be grateful that you managed to find me a job, especially one where I get to " + (!flags["MAKI_SIRED_CHILDREN"] && !flags["MAKI_BIRTHED_CHILDREN"]?"take care of":"be so close to our") + " children. I'll go get my stuff ready.");
	}else{
		output("\n\n\"I'll grab on to that promise.\" He smiles, but his lowered ears and the tone of his voice, shows that he's definitely disappointed with you. \"I guess I'll go back to working at the clinic in Tarkus, so if you're ever in the vicinity please make a visit.");
	}
	addButton(0, "Go", makiusEvictGo);
	addButton(1, "Nevermind", makiusEvictNevermind);
	if (!flags["BRIGET_MET"]) addDisabledButton(2, "Offer Job", "Offer him a job at the nursery", "It'd probably be a good idea to actually go speak to the person overseeing the nursery on your behalf before offering jobs to people!");
	else if (!flags["MAKI_OFFERED_JOB_AT_NURSERY"]) addButton(2, "Offer Job", makiusEvictJob, undefined, "Offer him a job at the nursery", "He doesn't have to go back to that ratty clinic if you offer him a job at your nursery in Tavros..");
}

public function makiusEvictGo():void{
	clearOutput();
	processTime(30);
	author("LukaDoc");
	showBust(makiusBust(1));
	clearMenu();
	if (flags["MAKI_RELATIONSHIP_STATUS"] == 2) output("You can see the sadness welling up in his eyes, despite him trying his best to contain his tears. So you try your best to console him, by wrapping your arms around him in a gentle hug. He looks straight into your eyes and you still see traces of sadness in them. You pat his head and give him some reassuring words, telling you will be back for him when you can. Then you finish it off with a kiss, smacking against his lips for longer than you should and then part ways. He starts arranging his stuff as you leave the soon-to-be empty room and as the door locks behind you, you lean back and hear some light sobbing.");
	else if (flags["MAKI_RELATIONSHIP_STATUS"]) output("You tell him this has been fun and offer him your hands for a handshake. He grabs it and you surprise him by pulling him closer into a hug. For a few minutes you both stand there appreciating each other's warm embrace, but eventually you have to part ways. He starts arranging his stuff as you leave the soon-to-be empty room.");
	else output("You offer him your hand for a handshake. He looks at your hand and he grabs it with both hands and gives you a good hard shake. You tell him you enjoyed working with him and hope you can hire him again in the future. \"Likewise.\" He starts arranging his stuff as you leave the soon-to-be empty room.");
	if(flags["MAKI_STATE"] == 2) resendMail("makius_nursery_abandoned_email", kGAMECLASS.GetGameTimestamp());
	flags["MAKI_IN_CREW"] = false;
	makius.masculinize();
	addButton(0,"Continue", mainGameMenu);
}

public function makiusEvictJob():void{
	clearOutput();
	processTime(5);
	author("LukaDoc");
	showBust(makiusBust(1));
	clearMenu();
	output("You ask him how well he works with kids.");
	output("\n\n\"I'm great with kids! They think i'm a giant puppy and love to play with me." + (flags["MAKI_BIRTHED_CHILDREN"] || flags["MAKI_SIRED_CHILDREN"]?" You should know since we have " + (flags["MAKI_BIRTHED_CHILDREN"] + flags["MAKI_SIRED_CHILDREN"] > 1?"puppies":"a puppy") + " of our own.\"":"\""));
	output("\n\nYou think rather than sending him to go back to working at a ratty frontier clinic he should come work at your nursery and " + (ChildManager.numChildren()?"take care of your" + (flags["MAKI_BIRTHED_CHILDREN"] || flags["MAKI_SIRED_CHILDREN"]?", and his,":"") + " kid" + (ChildManager.numChildren() > 1?"s.":"."):"get free money, since you don't have any kids yet."));
	output("\n\n\"That's… that's a great idea! I always wanted to put my xeno-pediatry training to good use, but never had the opportunity.\" " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"Then out of nowhere he wraps his arms around you and gives a really tight hug. \"I love you my mate.\" He squeezes you <b>hard</b>! \"LoveYou!LoveYou!LoveYou!\" It's becoming hard for you to breath. \"LoveYou... oh!\" He releases his grip on you and you feel air rushing back into your lungs. \"Sorry [pc.name] I just suddenly felt so happy. Thank you, mate! You know me so well.\"":"He spreads his arms wide open as asks, \"C-can I hug you?\" You nod, then almost immediately he wraps his arms around you, forcing you close to his furry " + (makiusMasculine()?"chest":"breasts") + " as his warmness envelops you. After one long moment he ends the hug, now shying away and with a blush clearly visible on his fur-covered cheeks.") + "\"I'll go get my stuff ready now!\" He says as you leave the soon to be empty room to get out of his way.");
	flags["MAKI_OFFERED_JOB_AT_NURSERY"] = true;
	flags["MAKI_HOME_SEEN"] = false;
	flags["MAKI_IN_CREW"] = false;
	makius.masculinize();
	addButton(0,"Continue", mainGameMenu);
}

public function makiusEvictNevermind():void{
	clearOutput();
	processTime(5);
	author("LukaDoc");
	showBust(makiusBust(1));
	clearMenu();
	output("You can't do this. The sadness your puppy is trying so hard to hide melts your " + (pc.isAss()?"hardened ":"") + "heart. You sigh, and tell him you've changed your mind, he can stay on your ship.");
	if (flags["MAKI_RELATIONSHIP_STATUS"] == 2) output("\n\nHe wraps his arms around you and hugs you tight. \"Don't scare me like that [pc.name]\"");
	else if (flags["MAKI_RELATIONSHIP_STATUS"]) output("\n\nA stupid, giddy smile forms on his face. \"Thank you, for keeping me around, [pc.name]. I'll try to be more useful from now on.\"");
	else output("\n\n<b>\"Yes!\"</b> he shouts and then does a happy dance. He notices you staring and his dance starts to slow down. \"Sorry… I'll try to be more useful from now on.\"");
	addButton(0,"Continue", makiusLeave);
}

//--Nursery Section--

public function makiusKidsNursery(btnIndex:Number):Number{
	if(makiusAtNursery() && hours > 7 && hours < 16){
		var rand:int = Math.random();
		//find children to talk about
		var children:Array = [];
		var makiusChildren:Array = [];
		ChildManager.CHILDREN.forEach(function(child:*, i:int, arr:Array) : void {
			if (child.Months() >= 36 || child.Months() <= 156) children.append(child);
			else if (child.Months() <= 12 && child is MakiusUniqueChild) makiusChildren.append(child); 
		});
		if (children.length > 0 && Math.random() > 0.4){
			if (rand < 0.33){
				output("\n\nYou see Makius putting ointment on a scrape a child managed to get on " + children[Math.random() * children.length].hisHer() + " knee. Although your kid is wailing, it doesn't seem serious.");
			}else {
				if (rand < 0.66) output("\n\nYou spot Makius playing hide and seek with your child" + (children.length > 1?"ren":"") + ". Judging by the way his tail keeps poking out of his hiding spots, it doesn't look like he intends to win.");
				else output("\n\nYou spot Makius getting " + (children.length > 4?"surrounded and petted by a mob of your children":"a thorough petting by your child" + (children.length > 1?"ren":"") + ". Seems like he's enjoying the attention, even if he's being treated like a giant puppy."));
			}
		}else if (makiusChildren.length > 0 && Math.random() > 0.8){
			if (rand < 0.33){
				output("\n\nYou see Makius cradling the infant pup you had together. He is making silly sounds, trying his best to keep the little bundle of joy and mayhem in his arms distracted.");
			}else{
				var chosen:* = children[Math.random() * children.length];
				if (rand < 0.66) output("\n\nYou see Makius, a serene smile lighting his features as he " + (!makiusMasculine()?"breast":"") + "feeds " + (children.length > 1?"one of his pups":"his pup") + ", cradling the little ball of fuzz close to his chest as " + chosen.heShe() + " happily suckles from " + (makiusMasculine()?"a smartly disguised bottle.":"his nipple."));
				else output("\n\nYou spot Makius trying to feed his pup a spoonful of baby formula. The reluctant child resists every attempt at giving " + chosen.himHer() + " " + chosen.hisHer() + " share of healthy nutrition, causing most of the food to end up on " + chosen.hisHer() + " and Maki’s clothes. Eventually, he comes up with a game that tricks the puppy into eating " + chosen.hisHer() + " food.");
			}
		}else{
			output("\n\n" + (rand < 0.5?"You spot Makius’ head buried under piles of books and data pads. It looks like he is studying intensely, doing his best to quickly expand his knowledge of xenopediatrics.":"You see Makius chatting with one of his co-workers. Thanks to his friendly attitude and Venarian mannerisms he is getting along well with them." + (ChildManager.numChildren()?" He must be on a break.":"")));
		}
		addButton(btnIndex, "Makius", makiusNurseryApproach, undefined, "Makius", "Approach the cute Venarian doctor.");
		btnIndex++;
	}
	return btnIndex;
}

public function makiusNurseryApproach():void{
	clearOutput();
	processTime(10);
	if(makiusEvents(false)){
		author("LukaDoc");
		showBust(makiusBust());
		clearMenu();
		output("You approach your cute Venarian doctor, who is too engrossed in what he's doing to notice you. You " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"wrap your arms around his back":"place your hand on his shoulder") + " and say hello. He turns around, startled, and looks you straight in the eyes, but then recognizes you and immediately relaxes.");
		if (flags["MAKI_RELATIONSHIP_STATUS"] == 2) output("\n\n\"Oh, it's you, my mate. Do you mind waiting until I finish this?\"\n\nNot a minute later, he's done with what he was doing and ready for you.\n\n\"You know I love to do anything if I’m doing it with you! What did you have in mind?\" He asks with a relaxed smile.");
		else if (flags["MAKI_RELATIONSHIP_STATUS"]) output("\n\n\"Hey, friend. I can't talk right now. Just give me a few minutes to finish this and we can hang out.\"\n\nYou wait for him to rush through what he's doing, and not five minutes later he's ready for you.\n\n\"So, what do you want to do? Did you have anything fun in mind?\" He asks with a naughty smile.");
		else output("\n\n\"Oh, hello, [pc.name]. I'm busy right now, so give me a few minutes to finish what I'm doing and we can talk, okay?\" He says before turning back to his previous task.\n\nYou wait for him to finish; a good ten minutes pass until he's finally ready for you.\n\n\"What do you want?\" He asks with a smile.");
		addButton(0, "Chat", makiusNurseryChat, undefined, "Chat", "Spend time chatting with Makius.");
		addButton(1, "Go Home", makiusNurseryGoHome, undefined, "Go Home", "Head to a private setting with the doctor.");
	}
}

public function makiusNurseryChat():void{
	clearOutput();
	processTime(5);
	author("LukaDoc");
	showBust(makiusBust());
	clearMenu();
	if (flags["MAKI_RELATIONSHIP_STATUS"] == 2) output("Maki smiles at you and leads you to the staff room. He sits down and pats a spot besides him. You accept his offer with a smile that the doctor is quick to reciprocate as he loops his tail around you, hugging and nuzzling you as you two settle on the couch. \"Okay, I guess we’re both comfortable now. What do you want to talk about?\"");
	else if (flags["MAKI_RELATIONSHIP_STATUS"]) output("\"Just a friendly chat? No problem.\" He walks towards the staff room and you follow him to a pair of chairs. He seats himself on one and pats the other. You accept his offer and sit down. \"What would you like to talk about?\"");
	else output("\"You just want to chat? Okay then.\" He motions towards the nursery’s staff room and finds a pair of chairs to sit on.\"Have a seat.\" You gladly accept his offer and take a seat. \"So, what do you want to talk about?\"");
	makiusTalkMenu();
}

public function makiusNurseryGoHome():void{
	clearOutput();
	processTime(5);
	author("LukaDoc");
	showBust(makiusBust());
	clearMenu();
	output("You ask him if he will have a break soon.");
	output("\n\n\"I do.\"");
	output("\n\nYou ask if he could take his break now so you two can enjoy some private time together.");
	output("\n\n\"Well, I'll just tell Bridget about that.\" He fiddles with his codex a few times and then turns to you with an excited smile, \"Done! Let's go.\" You reward him with a kiss on the cheek before allowing him to lead you through the residential deck and into his home.");
	makiusRoomEnter(true);
}

public function makiusRoomExtra(buttonID:Number):void{
	if (!flags["MAKI_IN_CREW"] && (flags["MAKI_STATE"] == 2 || flags["MAKI_OFFERED_JOB_AT_NURSERY"])){
		output("\n\nTo the east " + (flags["MAKI_OFFERED_JOB_AT_NURSERY"]?"is a cheap apartment with a simple facade. Sleek metallic plates, give it a modern look that shows the owner cares more for efficiency than anything.":"is a decrepit apartment, its facade clearly in a state of disrepair.") + "The notice on the door states that Makius is currently " +  (hours > 7 && hours < 16?(flags["MAKI_OFFERED_JOB_AT_NURSERY"]?"working at the nursery":"out doing odd jobs"):"in the house") + ". The holo-number next to the door reads 126.");
		if (hours > 7 && hours < 16) addDisabledButton(buttonID, "Makius' Room", "Makius' Room", "Nobody's home");
		else addButton(buttonID, "Makius' Room", makiusRoomEnter);
	}
	setNavDisabled(NAV_EAST_DISABLE);
}

public function makiusRoomEnter(fromNursery:Boolean = false):void{
	clearOutput();
	clearMenu();
	processTime(5);
	author("LukaDoc");
	showBust(makiusBust());
	moveTo("MAKIUS NURSERY HOME");
	if (flags["MAKI_HOME_SEEN"]){
		if (flags["MAKI_OFFERED_JOB_AT_NURSERY"]){
			if (fromNursery){
				output("You both arrive into his apartment and he promptly makes himself comfortable on the couch, encouraging you to do the same.\n\n");
				if (flags["MAKI_RELATIONSHIP_STATUS"] == 2) output("But before you can get fully seated, he pulls you in on top of him, going right for a steamy make-out session. His deft paws caressing your backside as your [pc.hands] crawl towards those " + (makiusMasculine()?"sensitive nipples":"voluptuous breasts") + " of his. You wrestle tongues for a good portion of an hour before you two finally part, breathless, but <i>quite</i> content. Looking up at you with a sated smile, your lusty Venarian lover sneaks in one final peck on the nose and then coyly asks what kinds of fun things you have in mind.");
				else if (flags["MAKI_RELATIONSHIP_STATUS"]) output("He wraps you in a passionate hug and nuzzles his face against your [pc.chest], rubbing himself all over you to make sure you are clearly imprinted with his smell. When he is finally satisfied with the claim he struck, he lets you go and asks what you would like to do.");
				else output("The doctor taps his codex a few times, making the wall-mounted television screen come to life, flicking through the dozens of channels available even in rush space. After a few minutes of trying to find anything fun to watch, Makius turns to you and asks what you would like to do instead.");
			}else if (makiusEvents(true)){
				output("You use the authorization code Makius has given you to walk into his home and find him ");
				var choices:Array = [];
				if(flags["MAKI_RELATIONSHIP_STATUS"]) choices.push("in his bedroom, cuddling what looks to be a very lewd body pillow with a picture of you in a sexy position. Noticing your arrival, he promptly shoves the body pillow off the bed, quickly piling all the bed’s covers over it.\n\n\"That was… nothing. Is there anything you want to do, so I don't have to explain that?\"");
				choices.push("in the kitchen, cooking a big meal for himself. Noticing your arrival, he offers you a spoonful, asking you for some feedback, looking really proud of his domestic prowess.\n\nYou " + (pc.isNice()?"praise his cooking enthusiastically, making the good doctor quite pleased":(pc.isMischievous()?"let him stew for a moment, but then admit that it ain't that bad":"shrug and tell him that it's some passable grub")) + ". Several minutes after that are spent with Maki making some finishing touches and storing the food, while you help by mostly staying out of his way.\n\nFinally, he turns back to you and asks what do you want to do next. \"So… what do you want to do?\"");
				choices.push("in the living room, scrubbing each and every surface of anything even remotely resembling dirt.\n\n\"My " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"mate":"saviour") + " is here! I can clean this stuff later!\" He exclaims. Pushing a few buttons and letting the automated systems of the apartment take care of storing the cleaning supplies and utensils, he rushes to your side. \"What can I do for you?\"");
				if(flags["MAKI_RELATIONSHIP_STATUS"]) choices.push("in the living room, watching a porn flick that features " + (pc.exhibitionism() > 80?"a compilation of your most daring public exploits":"some of the cheesiest and most explicit hospital setting scenarios you have ever seen") + ". Completely oblivious to your presence, the good doctor continues to enjoy his 'me time': his half-lidded gaze never leaves the screen as his deft hands simultaneously tend to his " + (makiusMasculine()?"nine":"seven") + " inch long cock while furiously shoving a sizable dildo deep into his " + (flags["MAKI_STATE"]?"moist ":"") + "asshole. What a naughty shark-puppy!\n\nOnly when you " + (flags["MAKI_RELATIONSHIP_STATUS"] > 1?"wrap your arms around him":"audibly clear your throat") + " does he finally notice your arrival and promptly hides the dildo into the couch.\n\nThe two of you spend the next few moments in a thoroughly embarrassed silence before he manages to let out a \"What do you want, [pc.name]?\"");
				output(choices[Math.floor(Math.random() * choices.length)]);
			}else return;
		}else if(makiusEvents(true)){
			output("You ring the bell, and once again you're welcomed into Makius' raggedy rented home. Since the first time you visited him, he has managed to clean up the rest of his apartment. The broken furniture has been thrown out, and the remainder looks as good as it can, given the circumstances. Still, he doesn't let you sit on the living room couch, instead walking you straight into his bedroom.");
			output("\n\nOnce you're nestled right next to each other, you ask him how he's doing and if he had any luck finding a job.");
			output("\n\n\"Nothing yet. And I'm doing fine now that you are here,\" he says with a smile. \"So, [pc.name], what do you want to do next?\"");
		}else return;
	}else{
		if (flags["MAKI_OFFERED_JOB_AT_NURSERY"]){
			output((fromNursery?"You follow Makius around Tavros station until you both reach":"You ring the bell, and after a couple of minutes the door opens to reveal surprised and happy Makius who " + (flags["MAKI_RELATIONSHIP_STATUS"] < 2?"greets you cordially":"gives you a big hug") + " before inviting into") + " his new home. You walk inside, and after a quick look around, find that it’s quite cozy, despite being decorated with cheap, modern-looking furniture. Everything is spotless and practically sterile, like you would expect the doctor's home to be. Rather than having the place illuminated by artificial lighting, the ever health-cautious doctor has installed holo-windows that bask the room in realistic sunlight " + (flags["MAKI_STATE"] == 2?", no doubt a much better option for an expecting 'mother'":"") + ".");
			output("\n\nHe brings you to his couch and you sit down, only to find it rather uncomfortable - as if there is something poking at your lower back. You reach between the couch's seats and pull out " + (flags["MAKI_RELATIONSHIP_STATUS"] < 2?"a big purple dildo":"an almost exact replica of your [pc.cockBiggest]") + ". He takes it off your hands, trying to avoid eye contact as he hides it somewhere out of sight.");
			output("\n\n\"That's for, ugh… " + (flags["MAKI_RELATIONSHIP_STATUS"] < 2?"when I'm bored":"when you are away for a long time") + ",\" he says embarrassedly. \"Since you " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"are my mate":"helped me to find a job with which I can afford a nice home like this") + "… Why don't you take the authorization code, so you can come in here whenever you want?\" He fiddles with his codex for a few moments before the screen of yours lights up, informing you it has received the code that will allow you to enter this apartment at any time.");
			output("\n\n\"With that out of the way, what do you want to do?\"");
		}else{
			output("You follow the coordinates from Makius email and find the door of his rented room. Not long after you've rung the bell, you see the pregnant Venarian opening the door.");
			output("\n\n\"Hello, [pc.name]\", he says, looking a bit more nervous than surprised.");
			output("\n\nYou break this awkward pause by asking if you can come in.");
			output("\n\n\"Sure, but be careful, I haven't fully cleaned up this place yet.\"");
			output("\n\nYou walk into his new home and quickly find out that the whole place is a mess. Most of the furniture is covered in a thick layer of dust and there's even a broken table in the corner. You head to the couch, but before you can sit down, you are stopped by the doctor.");
			output("\n\n\"Don't sit there! It's… infested. Let's head for my bedroom instead. I've already decontaminated most of it.\"");
			output("\n\nYou ask him why is the room in such poor state.");
			output("\n\n\"It’s the cheapest rented apartment available, and the landlord was trying to get rid of it as soon as possible, because he had a bad time here. I think he only rented it so people could fix the place for him so he can sell it later.\"");
			output("\n\nYou enter the bedroom and find it in a much better state than the previous room. There isn't a single speck of dust on any of the furniture or the floor, and the mattress looks new. There's also a smaller and less dangerous looking couch.");
			output("\n\n\"Come, sit with me,\" he says while patting the covers right next to him. \"This one is definitely not infested.\"");
			output("\n\nYou abide by his request and snuggle close to him before asking how are your favorite shark-puppies are doing, caressing his " + makiusBellyDescriptor() + " for emphasis.");
			output("\n\n\"We're doing fine, so you don't need to worry about us. I've been mostly cleaning this place up and receiving regular check ups in the nursery while looking for a job on this station.\"");
			output("\n\nYou ask him if he had any luck.");
			output("\n\n\"None so far. Looks like Tavros doesn't have a shortage of medical personnel. So, why are you visiting? Did you miss me? Is there anything you want to do?\"");
		}
		flags["MAKI_HOME_SEEN"] = true;
	}
	makiusMenu();
}

public function makiusNurseryRecruit():void{
	clearOutput();
	processTime(5);
	author("LukaDoc");
	showBust(makiusBust());
	clearMenu();
	if (flags["MAKI_STATE"] == 2){
		output("You tell the doctor that you’ve managed to free up some space on your ship, so he can come back onboard if he wants.");
		output("\n\n\"As much as I’d love to do that, I'm not entirely sure if I should. I… <i>we</i> have " + (pc.isPregnant()?"our babies":"a baby") + " to think of, and putting it in dangerous situations just... It just doesn't sit right with me.\"");
		output("\n\nMaki is visibly conflicted by this, biting his lip and avoiding direct eye contact with you. Looks like he really wants to go, barely managing to hold onto his sense of responsibility in the face of his affection towards you. Maybe, if you put just a little bit more pressure on him, he would buckle. Though he is probably right, you are likely to face dangerous situations during your journeys that might put both the expectant 'mother' and your child at risk.");
		addButton(0, "Press On", makiusNurseryRecruitPressOn);
		addButton(1, "Quit", makiusNurseryRecruitQuit);
	}else{
		output("You ask the doctor if he would like to take a break from dealing with " + (ChildManager.numChildren()?"kids, ":"") + "robo nannies and space mumps, so he can come work at your ship again?");
		output("\n\n\"" + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"As if you need to ask...":"Sure do") + ",\" he says with a " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"dreamy ":"") + "smile. " + (flags["MAKI_BIRTHED_CHILDREN"] || flags["MAKI_SIRED_CHILDREN"]?"It's a shame our child" + (flags["MAKI_BIRTHED_CHILDREN"] + flags["MAKI_SIRED_CHILDREN"] > 1?"ren":"") + " can't come with us, but at least I know that, no matter what, they will be taken care of.":(ChildManager.numChildren() > 15?"I love this job, but it's really exhausting. You have way too many children, " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"love!":"[pc.name]!"):(ChildManager.numChildren()?"It's fun to take care of your child" + (ChildManager.numChildren()?"ren":"") + ", but between Briget and all the technology this place has, it doesn't really look like they need me.":"Well it's not <i>that</i> much of a break when you have nothing to do at your job." + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?" We might want to work on that. Besides, I've missed you.":(flags["MAKI_RELATIONSHIP_STATUS"] == 1?" You might want to work on that.":""))))));
		output("\n\nIn that case, you reply, you'd like to offer him his previous position. Having a trained medical professional on board will surely come in handy in your travels.");
		output("\n\n\"Of course!\" He exclaims happily. \"Just give me a few minutes to warn Bridget and we can be off! " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"I can't wait to once again be by your side all the time. ":"") + " He disappears into the Residential Deck before you can say anything else.");
		output("\n\nYou can't help but marvel at how enthusiastic he is. " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"He must've really missed you.":"So long as he brings that enthusiasm into his work, he should be a valuable addition to your crew."));
		flags["MAKI_IN_CREW"] = true;
		addButton(0, "Back", move,"RESIDENTIAL DECK 12");
	}
}

public function makiusNurseryRecruitPressOn():void{
	clearOutput();
	processTime(5);
	author("LukaDoc");
	showBust(makiusBust());
	clearMenu();
	output("You tell him that you really need a trained medical professional on board, and he's the best one you know. " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"Not to mention just how much have you been missing him. Staying apart for so long has been an excruciating experience.":""));
	output("\n\nMaki's pointed, dog-like ears perk up and he starts to blush. \"Jeez, " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"you really miss me that much, huh?":"Am I really the best you know?") + " Maybe... I'm not sure [pc.name], do you really need me that badly?");
	output("\n\nYou wrap your arms around him and affirm that yes, you do need him by your side more than he can imagine.");
	output("\n\n\"And what about the dangers to the baby?\", your lover asks, not ready to shirk his responsibilities as an expectant 'mother'.");
	output("\n\nWith a confident smirk you tell him not to worry about it. You will be around almost constantly, and will never let anything happen to any of your loved ones. " + (silly?"Not only are you the protagonist, this is a porn game and miscarriage is one of the biggest boner killers.":""));
	output("\n\nGradually, between your confidence and his own desire to be around you, the doctor lets himself be convinced, giving you a timid nod. \"Well… I suppose I should have more faith in you, my mate.\"");
	output("\n\nYou answer with a kiss on the cheek.");
	output("\n\n\"I'll get my stuff ready…We'll meet back on the ship?\"");
	output("\n\nYou tell him you'll be there.");
	flags["MAKI_IN_CREW"] = true;
	addButton(0, "Leave", move,"RESIDENTIAL DECK 12");
}

public function makiusNurseryRecruitQuit():void{
	clearOutput();
	processTime(5);
	author("LukaDoc");
	showBust(makiusBust());
	clearMenu();
	output("You tell him he's right. It's too dangerous out there for your pregnant love and you just can't put your child at risk.");
	output("\n\n\"Thanks for being so understanding,\" he says, breathing out in relief.");
	makiusMenu();
}

public function makiusNurseryOfferJob():void{
	clearOutput();
	processTime((1440 - ((hours * 60) + minutes)) + 450);
	author("LukaDoc");
	showBust(makiusBust());
	clearMenu();
	output("You ask him if he ever had any experience working with kids.");
	output("\n\n\"I'm great with kids! They think i'm a giant puppy and love to play with me." + (flags["MAKI_BIRTHED_CHILDREN"] || flags["MAKI_SIRED_CHILDREN"]?" You should know since we have " + (flags["MAKI_BIRTHED_CHILDREN"] + flags["MAKI_SIRED_CHILDREN"] > 1?"puppies":"a puppy") + " of our own.":""));
	output("\n\nIn that case, you tell him, you think that rather than going back to that ratty frontier clinic after giving birth, he should come work at your nursery. He will get to  " + (ChildManager.numChildren()?"take care of a whole bunch of little Steeles" + (flags["MAKI_BIRTHED_CHILDREN"] || flags["MAKI_SIRED_CHILDREN"]?", including his own precious babies":"") + ".":"practically receive free money while there are no kids there."));
	output("\n\n\"That's… that's a great idea! I always wanted to put my xeno-pediatry training to good use, but never had the opportunity.\" " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"Then out of nowhere he wraps his arms around you and gives a really tight hug. \"I love you my mate.\" He squeezes you <b>hard</b>! \"LoveYou!LoveYou!LoveYou!\" It's becoming hard for you to breath. \"LoveYou... oh!\" He releases his grip on you and you feel air rushing back into your lungs. \"Sorry [pc.name] I just suddenly felt so happy. Thank you, mate! You know me so well. ":"He spreads his arms wide open as asks, \"C-can I hug you?\" You nod, then almost immediately he wraps his arms around you, forcing you close to his furry " + (makiusMasculine()?"chest":"breasts") + " as his warmness envelops you. After one long moment he ends the hug, now shying away and with a blush clearly visible on his fur-covered cheeks. \"") + "I'll head there right away! Who knows, I may even be able to buy some furniture and fix this room soon!\" He exclaims happily as you both head to the nursery to get him a job.");
	flags["MAKI_OFFERED_JOB_AT_NURSERY"] = true;
	flags["MAKI_HOME_SEEN"] = false;
	flags["MAKI_IN_CREW"] = false;
	moveTo("NURSERYI16");
	addButton(0, "Leave", move,"RESIDENTIAL DECK 12");
}

public function makiusNurseryAbandonedEmail():String{
	var msg:String = "";
	msg += "Hey " + kGAMECLASS.pc.nameDisplay() + ",";
	msg += "\n\nI'll be staying in a rented room on the Tavros Residential Deck while I wait for the pregnancy to come to term. The address is in the attachment.";
	msg += "\n\nPlease feel free to visit me anytime.";
	msg += "\n\nLove,\nMakius";
	msg += "<i>There is a file attached to this mail containing the coordinates for a room on Tavros.</i>";
	return msg;
}

//--Event section--

//Date unlocks in the menu when at 50 relation and 0 relation status. Unlocks an event that increases relation status.
public function makiusDate1():void{
	processTime(20);
	author("LukaDoc");
	clearOutput();
	clearMenu();
	showBust(makiusBust());
	output("Looking him over, he's not unattractive for an alien. With your usual level of tact, you ask if he's currently seeing anyone in the romantic sense.");
	output("\n\n\"Nope. I used to have a thing for an engineer in my previous ship, but from what I could see it was platonic.\" The doctor shrugs. \"What about you?\"");
	output("\n\nYou give a noncommittal reply, as that's not really what you want to talk about right now. You then ask in the same manner if he's interested in finding somebody.");
	output("\n\nMakius raises a brow at the question. \"Of course I am. I mean... I'd love to have someone to keep me company, cuddle with while sleeping. You know, the usual.\" He looks at you with a puzzled expression. \"But why are you asking? Do you know anyone that's interested in me by any chance?\" He looks at you with a hopeful expression.");
	output("\n\nWhat if you told him that <i>you</i> were interested in him, you ask. Maki looks at you with a blank stare, trying to process what you just said. You're trying to ask him on a date, you inform him. His expression doesn't change for a few seconds, so eventually an awkward silence falls between the two of you. You allow the silence to linger for a few moments, then grab his attention back to you. When he's actually looking at you with something other than a blank expression, you ask if he's saying he's not interested then." + (pc.hasCock()?" You ask if your gender has something to do with the rejection.":""));
	output("\n\nMaki scrambles and quickly recomposes himself. \"NO! I mean, no. I'm not rejecting you captain... its just... I....\" He trails off.");
	output("\n\nYou explain you're not mad if he's turning you down, and in this situation, he can leave ranks out of it.");
	output("\n\n\"I'm just... speechless. It's just that you are asking me so out of the blue, you caught me by surprise.\"");
	output("\n\nSo he is interested, then?");
	if(pc.isHerm()){
		output("\n\n\"You are very beautiful... " + pc.mf("handsome", "gorgeous") + " even.\" He swallows, the situation obviously making him nervous. \"I don't mind that you have " + pc.mf("female", "male") + " parts either. You see... I'm actually bisexual and... umm... this gives us more options I guess?\"");
		output("\n\nTeasingly, you ask if he got so tongue tied around the herms back home, but it's nice to hear somebody so... open minded about the possibilities you offer as a " + pc.mf("boy", "girl") + "friend.");
		output("\n\nHe smiles nervously. \"I-I would love to go out on a date with you captain. If you'll have me.\"");
	}else if(pc.isMasculine()){
		output("\n\n\"Well... umm... you are a pretty good looking guy.\" He rubs his hands thinking on how he should continue his train of thought. \"I personally don't mind guys. I'm bisexual... but if you don't mind me asking?\"");
		output("\n\nYou nod, gesturing for him to continue.");
		output("\n\n\"Why me?\" He looks at you nervously for a moment. \"You know what you don't have to answer that. I'm sorry for asking.\"");
		output("\n\nYou brush the question aside and ask for his answer.");
		output("\n\n\"My answer is yes. I would love to go on a date with you captain.\"");
	}else{
		output("\n\n\"You are very beautiful... gorgeous even.\" He swallows, the situation obviously making him nervous. \"I've never asked anyone out... much less been asked out by anyone. I guess not many people have an interest in Venarians. Some people see us as savages.\"");
		output("\n\nYou ask why that is; he's one of the most articulate and cultured people you've met in this part of space.");
		output("\n\nHe smiles bashfully at your compliment. \"Thanks. It might have something to do with my habits or the way I look.\"");
		output("\n\nWell, you don't think he's a savage, and you still want to take him on a date - if he'll come with you? Maki smiles.");
		output("\n\n\"Of course I will. I would love to go out on a date with you captain.\"");
	}
	output("\n\nHe grins happily at you but moments later his ears fall flat on his skull. \"Just one problem. I don't know anywhere nice to actually take you out to.\"");
	output("\n\nWell, why doesn't he just come to your quarters? You're sure the two of you can find something enjoyable and within his comfort level to do there.");
	output("\n\n\"Right, it's a date then. Just let me get ready.\" He gets up and dashes out of the door. You retire to your quarters, and await him there.");
	addButton(0, "Next", makiusDate1Start);
}

public function makiusDate1Start():void{
	processTime(20);
	author("LukaDoc");
	clearOutput();
	clearMenu();
	showBust(makiusBust());
	output("You decide upon a simple meal and a cup of coffee; lowkey for this first time, especially with a shy prospective partner like Maki. You get yourself properly dressed and see to cooking up what you need for the date.");
	output("\n\nYou don't have to wait long before a beep rings from your door, signalling Maki's arrival. You open the door and gaze at the nervous looking Venarian. He is wearing the same clothes he usually does, minus the white coat. His fur looks combed and you swear you can smell a pleasant fragrance emanating from the Venarian. \"Hi, [pc.name]. Sorry... I wanted to dress up nicer but I didn't have anything else to wear...\" He looks at the floor, ears flat on his skull.");
	output("\n\nYou tell him that what he's done is fine, and invite him to come in and sit down.");
	output("\n\nAt your invitation Maki lets himself in, looking around to examine your room. His nostrils flare for a moment and it becomes obvious that he is picking up on your scent, though he doesn't actually display any reaction besides his nervousness. He takes a chair and sits down, tail waving to and fro. He looks you over.");
	output("\n\n\"You look good right now.\" Then he quickly adds. \"I mean, you always look good, it's just that now you look... better... I'll shut up now...\" He trails off, still very nervous.");
	output("\n\nYou tell him to relax; you're not going to bite." + (pc.isMisc()?" Well, not unless he wants you to, you add after a moment's thought and with a cheeky smile.":""));
	output("\n\nThe Venarian takes a deep breath and visibly relaxes, though you still detect some nervousness within him. \"Sorry.\"");
	output("\n\nTelling him you understand, you serve up the coffee and the food and place it on the table before sitting down, telling him you hope he finds the food edible.");
	output("\n\nMaki takes a bite of the offered food. \"Hmm, this is great. I'm not much of a cook, so I wind up just eating frozen food or ordering through the extranet.\"");
	output("\n\nYou tell him that you hear such is common for doctors anyway, watching as he reaches for the cup of coffee. As his finger graze the cup he clumsily proceeds to drop the hot liquid on his lap.");
	output("\n\n\"Ow!\"");
	addButton(0, "Help Clean", makiusDate1HelpClean);
	addButton(1, "Pass Towel", makiusDate1PassTowel);
	addButton(2, "Don't Help", makiusDate1HelpClean);
}

public function makiusDate1HelpClean():void{
	processTime(5);
	author("LukaDoc");
	clearOutput();
	clearMenu();
	showBust(makiusBust());
	output("You quickly grab a towel and start brushing it across his lap, patting and stroking in an effort to sop up the hot liquid and alleviate his pain. Maki visibly stiffens up as you continue to press the towel against his lap. \"T-Thanks.\"");
	output("\n\nYou continue to press and stroke, ensuring you get as much as you possibly can. However, as you do so, you realise you can feel something strange under the towel and his damp pants; something hard and yet soft...");
	output("\n\n\"I-I think you can stop now. Sorry.\" He says nervously.");
	output("\n\nYou do as he asks, a suspicion about what happened coming to you.");
	flags["MAKI_RELATION"] += 6;
	makiusDate1ManeCrisis();
}

public function makiusDate1PassTowel():void{
	processTime(5);
	author("LukaDoc");
	clearOutput();
	clearMenu();
	showBust(makiusBust());
	output("Thinking quickly, but choosing to respect Maki's privacy, you grab a hand towel and pass it over so he has something to sop up the coffee he just spilt. He quickly presses the towel to his lap and lets it soak up the coffee. \"Thanks, [pc.name].\"");
	output("\n\nYou tell him it's okay and hopefully he's not hurt.");
	flags["MAKI_RELATION"] += 3;
	makiusDate1ManeCrisis();
}

public function makiusDate1DontHelp():void{
	processTime(5);
	author("LukaDoc");
	clearOutput();
	clearMenu();
	showBust(makiusBust());
	output("Maki gets up and proceeds to undo his belt and remove his pants, lest the coffee burn him up any more.");
	output("\n\nYou ask if he's alright.");
	output("\n\nJust now realising he took his pants off in front of you, Maki hurries to sit down and cover his lap with the pants. \"Y-Yeah, sorry.\"");
	makiusDate1ManeCrisis();
}

public function makiusDate1ManeCrisis():void{
	output("\n\nYou realise that his mane looks a bit disheveled now; the pain probably made his fur stand on end and the combing he did earlier has come undone.");
	addButton(0, "Touch Mane", makiusDate1TouchMane);
	addButton(1, "Compliment", makiusDate1Compliment);
	addButton(2, "Ignore", makiusDate1Ignore);
}

public function makiusDate1TouchMane():void{
	processTime(5);
	author("LukaDoc");
	clearOutput();
	clearMenu();
	showBust(makiusBust());
	output("You walk over to the Venarian and reach out to begin trying to tame his now-wild mane of fur and hair with your fingers, stroking through the lush, velvety growth with your hands as a makeshift comb. Maki closes his eyes and leans over your touch, clearly enjoying the attention. Amused, you continue to stroke, no longer bothering to comb and now seeing just how much you can make him enjoy this. The Venarian seems lost in the feeling, letting his tongue hang slightly as he rubs his head against your hand, eventually though he pulls away.");
	output("\n\n\"Erm... sorry. It's just that it felt so good when you stroked my mane.\" He smiles embarrassedly.");
	flags["MAKI_RELATION"] += 6;
	makiusDate1TalkHim()
}

public function makiusDate1Compliment():void{
	processTime(5);
	author("LukaDoc");
	clearOutput();
	clearMenu();
	showBust(makiusBust());
	output("Appreciatively, you tell Maki that he looks much better - much more natural - with his current hairdo.");
	output("\n\nHe reaches up with his hands and feel his wild mane. \"Oh no. And I took such a long time to comb it...\"");
	output("\n\nYou tell him that he doesn't need to be so formal with you - after all, you like him as he is. The Venarian is a bit embarrassed, but smiles at your compliment.");
	flags["MAKI_RELATION"] += 3;
	makiusDate1TalkHim()
}

public function makiusDate1Ignore():void{
	processTime(5);
	author("LukaDoc");
	clearOutput();
	clearMenu();
	showBust(makiusBust());
	output("Politely you ignore it and simply offer him a fresh cup of coffee.");
	output("\n\n\"Thanks.\"");
	output("\n\nYou get up and fetch him a cup of coffee, directly passing it to him handle-first. This time Maki manages to take the cup and sip it. \"Hmm, this is good coffee.\"");
	makiusDate1TalkHim()
}

public function makiusDate1TalkHim():void{
	processTime(5);
	author("LukaDoc");
	clearOutput();
	clearMenu();
	showBust(makiusBust());
	output("\n\nNow that you are both seated again, you start eating quietly, enjoying a bit of silent peace after the unintended incident. Deciding to break the calm, you ask Makius if he wouldn't mind telling you some things about him - where did he come from, his family, why he became a doctor?");
	output("\n\n\"Sure.\" He puts his hands on the table and looks at his plate as he recalls the past. \"I guess I wanted to become a doctor because when I was very little, I fell from a branch and broke my leg.\"");
	addButton(0, "Hold Hand", makiusDate1TouchHand);
	addButton(1, "Talk", makiusDate1JustTalk);
	addButton(2, "Change Subject", makiusDate1ChangeSubject);
}

public function makiusDate1TouchHand():void{
	processTime(5);
	author("LukaDoc");
	clearOutput();
	clearMenu();
	showBust(makiusBust());
	output("Placing your hand gently on his own, you ask him to continue the story as if you hadn't done anything. He startles at the gesture, although he doesn't recoil or pull away. Instead, he turns his hand and let his fingers trail your palm.");
	output("\n\n\"It was really bad, so I wound up in the hospital and the doctor told me I had to operate. Back then that really scared me.\"");
	output("\n\nYou pat his hand gently with your fingers, offering him comfort through your touch.");
	output("\n\nMaki smiles and holds your hand, squeezing it slightly. \"They had to put my leg back in place. It hurt so much to move my leg... but the doctor was quite skilled. It stung, but not nearly as bad as a I expected. He said I was going to be fine.\" He looks at you. \"I know this sounds silly, but it was then that I decided I wanted to do the same. I wanted to make people better, help people.\"");
	output("\n\nWhich makes him a very noble person, you tell him, giving his hand another squeeze and then let go.");
	flags["MAKI_RELATION"] += 6;
	makiusDate1Hug();
}

public function makiusDate1JustTalk():void{
	processTime(5);
	author("LukaDoc");
	clearOutput();
	clearMenu();
	showBust(makiusBust());
	output("Making it obvious that you're paying attention, you invite him to continue, letting his hand rest where it is.");
	output("\n\nMaki draws his hands away and rubs his chin. \"It was really bad, so I wound up in the hospital and the doctor told me I had to operate. Back then that really scared me.\"");
	output("\n\nYou offer him whatever words of comfort occur to you, trying to convey your sympathy. Maki smiles at you, thankful for your kind words.");
	output("\n\n\"They had to put my leg back in place. It hurt so much to move my leg... but the doctor was quite skilled. It stung, but not nearly as bad as a I expected. He said I was going to be fine.\" He looks at you, smiling. \"I know this sounds silly, but it was then that I decided I wanted to do the same.\"");
	flags["MAKI_RELATION"] += 3;
	makiusDate1Hug();
}

public function makiusDate1ChangeSubject():void{
	processTime(5);
	author("LukaDoc");
	clearOutput();
	clearMenu();
	showBust(makiusBust());
	output("You interject at that point, asking if he was impressed when his doctors managed to heal his broken leg.");
	output("\n\nMaki smiles. \"Very much so. It was pretty bad, and I was pretty scared, but they managed to heal my leg without any scarring.\"");
	makiusDate1Hug();
}

public function makiusDate1Hug():void{
	output("\n\nYou tell him that you're glad they saved his leg, and that they gave him his interest in medicine; you wouldn't be here talking to him now otherwise.");
	output("\n\n\"No, I wouldn't.\" He finishes his meal and smiles at you.");
	output("\n\nTaking a sip from your coffee, you wrack your brains and finally settle upon telling him that you're glad he did end up coming into space; he's quite enjoyable company.");
	output("\n\nMaki grins at that. \"Thanks, I'm happy to be here. And I enjoy your company too, [pc.name].\"");
	output("\n\nThe two of you settle down to companionable eating and drinking from then. Once you have both finished, Maki helps you gather and clean the plates and utensils before you escort him to the door.");
	output("\n\n\"[pc.name], I enjoyed our date. Thanks for having me.\" Maki smiles.");
	output("\n\nMaki stands there, outside the door, looking at you for a while longer.");
	addButton(0, "Hug", makiusDate1HugYes);
	addButton(1, "Don't Hug", makiusDate1HugNo);
}


public function makiusDate1HugYes():void{
	clearOutput();
	output("Seeing the obvious desire in his eyes, you step forward and pull him into an embrace, running your hands up and down his back. Maki hugs you back, running his hands on your back as well, whimpering in enjoyment of your close contact and doing his best to rub himself against your as much as possible. You hold him close and tight, then decide it's time to let go and separate yourself from him.\n\n");
	flags["MAKI_RELATION"] += 6;
	makiusDate1End();
}

public function makiusDate1HugNo():void{
	clearOutput();
	makiusDate1End();
}

public function makiusDate1End():void{
	processTime(5);
	author("LukaDoc");
	clearOutput();
	clearMenu();
	showBust(makiusBust());
	output("\"I should be going. See you later, [pc.name]\" He turns and makes his way back to his room.");
	output("\n\nYou tell him that you will see him later, watch him leave, and then close the door.");
	flags["MAKI_DATE"] = 1;
	addButton(0, "Next", makiusLeave);
}

public function makiusToFriend():void{
	processTime(5);
	author("LukaDoc");
	clearOutput();
	clearMenu();
	showBust(makiusBust());
	output("When you enter ");
	if (makiusAtNursery()) output("the nursery's infirmary, you see Makius reading up about xenopediatry");
	else if (makiusHasMedlab()) output("he medlab, you see Makius staring at the computer screen");
	else output("the doctor's quarters, you see Makius reading a book");
	output(" deep in thought, and decide to " + (pc.isNice()?"politely ":"") + "get his attention.");
	output("\n\nMaki visibly jumps, his ears standing at full attention as they swivel, scanning his surroundings. \"Ah... Hello, captain.\" Maki averts his gaze, his ears tucking down on his skull.");
	output("\n\nYou ask him what's wrong; he was just staring off into space when you came in.");
	output("\n\n\"Umm... nothing. Nothing wrong at all. Why would there be anything wrong? Nope.\"");
	output("\n\nWith a soft smile you point out that he's terrible at lying. You tell him it's okay to tell the truth to you. You're just concerned, that's all.");
	output("\n\n\"I... okay, I guess.\" He sighs. \"Recently, I've had dreams about you... about us...\"");
	output("\n\nDreams? Now you are curious. You try prodding the Venarian for more information, and when it looks like you won't get any answers that way, you step closer and begin rubbing his mane.");
	output("\n\nMakius closes his eyes and leans into your hand, his prehensile tail waving lazily behind him. You spend quite a while indulging his craving for pets, and when you finally stop Maki seems to be much more relaxed.");
	output("\n\n\"Mmm... I love it when you rub my mane...\" He says airily.");
	output("\n\nYou try asking for more details once again.");
	output("\n\nThe Venarian sighs. \"You are not going to leave me alone until I tell you, are you?\"");
	output("\n\nYou shake your head.");
	output("\n\n\"Okay then. But promise me you won't get angry?\"");
	output("\n\nYou nod, curious as to what can possibly be bothering him so much about a dream.");
	output("\n\nHe swallows. \"We were going for a swim, back at my home planet. The night had already fallen, but it was still very hot.\" Sounds innocent enough. \"We didn't have any bathing suits, so we went in naked.\" <i>That</i> sounds a little less innocent, but you indicate for him to continue. \"So, we were swimming, all fun and games, when you decided to get out and sit on the rim. And then I...\" He trails off, looking down in embarrassment.");
	addButton(0, "Get Details", makiusToFriendGetDetails);
	addButton(1, "Enough", makiusToFriendEnough);
}

public function makiusToFriendGetDetails():void{
	processTime(5);
	author("LukaDoc");
	clearOutput();
	clearMenu();
	showBust(makiusBust());
	output("You press Makius for details, telling him that you want to know exactly what happened in that dream. The Venarian is still visibly nervous, so you spend the next few minutes running your fingers through his mane and giving him an occasional scratch behind an ear.");
	output("\n\n\"Alright.\" He takes another deep breath. \"I saw your " + (pc.cockTotal() > 0?"[pc.cockBiggest], fully erect and ":(pc.hasVagina()?"[pc.pussy] blooming like a beautiful flower and ":"")) + (pc.hasTailCock()?"[pc.tailCock]":(pc.hasTailCunt()?"[pc.tailCunt]":"naked body")) + " glistening in the moonlight as you sat on the rim.\" He takes a short pause. \"And I couldn't help myself... I licked, sucked and drank.\" He closes his eyes. \"Many times.\" At this point, Maki can't handle his embarrassment anymore and hides his face behind his hands.");
	output("\n\nYou digest that fact, and then smile; could he be more specific, you suggest? It's a little vague what he actually did, the way he's saying it right now...");
	output("\n\nThe Venarian shakes his head emphatically. \"Sorry, no more.\" He's obviously trying to dodge the question, but you've had had your fun and so decide to let him off the hook.");
	makiusToFriendBenefits();
}

public function makiusToFriendEnough():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	output("You tell Makius that you can see where this is going; he doesn't need to say anything else. The Venarian doctor breathes a sigh of relief.");
	makiusToFriendBenefits();
}

public function makiusToFriendBenefits():void{
	output("\n\nSo he had a wet dream about you?");
	output("\n\nHe nods somewhat bashfully.");
	output("\n\nAnd he's been spaced out thinking about that? Is that all?");
	output("\n\n\"Actually... not entirely.\" You look at the Venarian expectantly, waiting for him to explain himself. \"You see, [pc.name]. The thing is I liked it. A lot. A lot more than I was supposed to, actually.\"");
	output("\n\nMaki stops talking and you put your hand over his, reassuring him you are not mad, just curious. What's he so bothered about then?");
	output("\n\nHe looks you in the eye, dead serious. \"I guess there is no point in delaying this any longer, so I'm going to be honest with you.\" Maki takes a deep breath. \"I like you [pc.name]. Way more than a friend is supposed to. I want us to take our relationship to the next level, you know? I find you extremely attractive. " + (pc.isHerm()?"You are " + pc.mf("handsome", "beautiful") + ", and the fact that you have both boy <b>and</b> girl-parts is quite sexy.":pc.mf("It doesn't matter to me that you are a guy, you are handsome and I like you", "You are beautiful, and just your scent is enough to excite me.")) + " Maki averts his eyes in embarrassment. \"I guess the point is. I would love to have you... if you'll have me. We don't have to do anything serious, take this as an experiment if you will. What do you say?\"");
	addButton(0, "Kiss", makiusToFriendKiss);
	addButton(1, "Tease", makiusToFriendTease);
	addButton(2, "Fine", makiusToFriendFine);
}

public function makiusToFriendKiss():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	output("Deciding not to waste breath on words, you pull the startled Venarian into a passionate kiss, wrapping your arms around his lean frame and holding him tight against you.");
	output("\n\nMaki hugs you back, rubbing himself against you as best as his can. You feel something hard poking you as the amorous Venarian kisses you back, probing your mouth with his tongue as he relishes the taste of you.");
	output("\n\nYou hold the position until the lack of air forces you apart. Maki laughs. \"You're a great kisser.\"");
	output("\n\nHe's not too shabby himself, you reply.");
	output("\n\nHe looks away in embarrassment, tail waving lazily behind him, ears flat. \"I think I should probably tell you about this... but what we just did, if we were in Venar, it'd be like asking for sex.\"");
	output("\n\n\"So you kinda asked me for sex?\"");
	output("\n\nHe begins laughing once more. \"Of course, you are not really a native Venarian, so I can't take this as an invitation for sex.\"");
	output("\n\nPlayfully, you ask just what Maki would do if you <b>were</b> asking for sex, perchance?");
	output("\n\n\"Then I'd be forced to take you " + (makiusHasMedlab() && flags["MAKI_IN_CREW"]?"back to my quarters":"to my bed") + ".\" Maki replies, playing along.");
	output("\n\nIf that's so, then maybe he should lead the way, you suggest...");
	output("\n\nMaki's ears stand at attention and his tail suddenly stops its sinuous motions. \"Wait. Are you serious about this?\"");
	output("\n\nAs serious as the bulge in his pants, you reply.");
	output("\n\nMaki tries to uselessly hide his tent. \"I... okay. Let's go to my room then.\" The Venarian walks ahead of you, you move to follow him, but he stops at the door.");
	output("\n\nYou ask him if something is wrong. His only reply is to spin on his heels and kiss you");
	output("\n\n\"Come on.\" He grabs your hand and starts on his way. You are happy to follow.");
	flags["MAKI_RELATIONSHIP_STATUS"] = 1;
	makiusSexMenu();
}

public function makiusToFriendTease():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	output("You rub your chin, making a show of studying Maki up and down. Slowly you circle around him, stroking his tail as it tries to curl around your wrist, brushing your fingers through his mane, then stopping with a firm slap on the butt. \"Oh!\"");
	output("\n\nYou casually tell him that he's starting to tent his pants.");
	output("\n\n\"I-I can't help it if you keep touching me!\" he huffs.");
	output("\n\nTouching him? Does he mean like this? You run your hands over his ass. Or like this? You stroke his ears, then scratch him at the base of the neck.");
	output("\n\nMaki shakes and whimpers. \"Y-Yes, just like that.\"");
	output("\n\nYou continue to stroke and pet him, then lean close and tell him in a stage whisper that, if he really wants you to touch him, well... you could do so much more if you were both somewhere private...");
	output("\n\nMaki suddenly blurts out. \"My " + (makiusHasMedlab() && flags["MAKI_IN_CREW"]?"quarters are not far":"bed is over there") + "!\"");
	output("\n\nThen what is he waiting for, you ask; why doesn't he lead the way...?");
	output("\n\nMaki grabs your hand and starts on his way. \"No time to lose then.\" You follow him, sneaking teasing little touches on his more sensitive points as you go.");
	flags["MAKI_RELATIONSHIP_STATUS"] = 1;
	makiusSexMenu();
}

public function makiusToFriendFine():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	output("You smile at the Venarian and tell him that the mere fact he's been having dreams about you is quite flattering. You two have dated in the past, so it's actually natural that he'd develop this kind of feelings for you.");
	output("\n\n\"Does this mean you feel the same for me?\" He asks tentatively.");
	output("\n\nYes it does, you reply. It's kind of what you were hoping for when you first asked him out.");
	output("\n\n\"I see... So you want to be more than just friends?\"");
	output("\n\nIf he's willing, you reply, then yes.");
	output("\n\nMaki gives you a glowing smile, his tail waving lazily behind. \"I would love to!\"");
	output("\n\nWell then, if that's how he feels, you say while giving him your most winning, \"come hither\" expression; perhaps he'd like to discuss things a little further in his quarters?");
	output("\n\n\"Sure, follow me then!\" He grabs your hand with barely contained excitement and proceed to drag you off towards his quarters.");
	flags["MAKI_RELATIONSHIP_STATUS"] = 1;
	makiusSexMenu();
}

public function makiusDate2Unlock():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust());
	flags["MAKI_ASKED_DATE"] = true;
	output("As you enter " + (!flags["MAKI_IN_CREW"]?"the infirmary":(makiusHasMedlab()?"the medlab":"his quarters")) + ", Maki instantly turns to greet you.");
	output("\n\n\"Hello [pc.name]. Do you have a moment?\"");
	output("\n\nYou nod, indicating that he tells you what he wants.");
	output("\n\nHe smiles, tail waving lazily behind him, ears alert on his head as he grabs your hands. \"Would you go on a second date with me?\"");
	addButton(0, "Yes", makiusDate2UnlockYes);
	addButton(1, "No", makiusDate2UnlockNo);
}

public function makiusDate2UnlockNo():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	output("You apologise, but you just don't have the time right now, you say; maybe later?");
	output("\n\nHis ears flatten and his tail stops moving. \"Sure... I don't want to burden you.\" Then he perks up. \"Just let me know when you have some time.\"");
	output("\n\nYou promise that you will, and then politely leave him to pull himself together.");
	flags["MAKI_DATE"] = 3;
	addButton(0, "Leave", makiusLeave);
}

public function makiusDate2UnlockYes():void{
	clearOutput();
	showBust(makiusBust())
	output("Surprised by his boldness, you smile and tell him you'd love to.");
	makiusDate2()
}

public function makiusDateRetry():void{
	clearOutput();
	output("You tell him that, if he's still wants it, you'd be happy to go on a date with him now.");
	makiusDate2()
}

public function makiusDate2():void{
	showBust(makiusBust())
	processTime(5);
	author("LukaDoc");
	clearMenu();
	flags["MAKI_DATE"] = 4;
	if (makiusHasMedlab()){
		output("\n\n\"Great, meet me in my quarters in a few minutes.\"");
		output("\n\nYou tell him that you'll be there. With that said, Maki bolts out the door towards his room.");
		output("\n\nYou watch him as he races off and then follow along at your own pace. Eventually, you're waiting outside his door, and ring the door to indicate you're there.");
		output("\n\nMoments later Maki is standing before you, wearing his usual clothes minus the lab coat. \"Great, you are here. Come in.\" He stands aside to let you enter.");
	}else{
		output("\n\n\"Great! But I need you to leave my room for a few minutes.\"");
		output("\n\nHe pushes you out of the room and closes the door behind you. Moments later Maki opens the door, wearing his usual clothes minus the lab coat. \"Great, you are still waiting. Come in.\" He stands aside to let you enter.");
	}
	output("\n\nYou see he's set up a small table and seats for two in the room, with cutlery and a pair of plates with something that looks like grilled fish on them just waiting for you. A bottle of some strange, reddish-orange colored juice takes center of the table, with an empty glass beside either plate.");
	output("\n\n\"I didn't know what you'd like to drink, so I got some other things, but I urge you to try the juice anyway. It's one of Venar's specialties and is also very nutritious.\"");
	output("\n\nCurious, you take a seat and politely wait for him to join you. Maki takes the seat across from you. \"I have something important to talk to you about. But first let's eat.\" He smiles, tail waving lazily behind him.");
	output("\n\nWondering what he has in mind, you pour yourself a glass; mmm, it's somewhere between citrusy and sweet - a pleasantly tangy flavor that's a little like oranges, but otherwise quite unique.");
	output("\n\nThe meal passes without incident, the two of you making small talk in-between bites but Maki seems intent on avoiding talking about anything big before you are done with your meal. You do note the Venarian looking at you with a certain intensity during your meal.");
	output("\n\nOnce you are done, you set your glass down and ask him what's up?");
	output("\n\nYou nod, wondering where he's going with this.");
	output("\n\n\"I don't know how much you know about Venarian culture, but while we have no problems having something more casual with anyone, we do find mates whom we wish to have something more... permanent.\"");
	output("\n\nYou find yourself holding your breath, waiting for him to finish.");
	output("\n\nHe looks you in the eyes, swallowing. \"I love you, [pc.name]. You are the best thing that's happened to me and I want us to be a couple... mates. Venarians mate for life, so if you'll have me, I promise to stand by you. It doesn't matter what trial you face or even if you decide you love someone more, I will still be by your side. I swear myself to you.\" He grabs your hand. \"Will you be my mate? For now and ever?\"");
	addButton(0, "Yes", makiusDate2mates);
	addButton(1, "No", makiusDate2friends);
}

public function makiusDate2mates():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	output("You consider what he just said, and decide there's only one answer. You reach across the table and pull him into a passionate kiss, devouring his lips with your own, feeling him heating up in lust at being pressed against you and taken in such a fashion.");
	output("\n\nMaki kisses you back as best as he can, and when you break the kiss, all he can do is gaze at you. He licks his lips. \"I take this means yes?\"");
	output("\n\nFor such a smart male, you tell him, he can sure ask some stupid questions. You then kiss him again before he can say something else stupid.");
	output("\n\nMakius gets up from his seat and lifts you from yours, kissing you as he pushes you towards his bed. Seeing no reason not to, you allow yourself to be seated down on the bed, making yourself comfortable as he hovers over you. The Venarian smiles at you, lust and love burning in his eyes. Slowly he undoes his belt and lets his pants fall to the ground, his boxers following suit. His sleeveless shirt comes off with a flourish and is easily discarded.");
	output("\n\nYou admire the sight, noting that Maki's " + (makiusMasculine()?"nine":"seven") + " inches of Venarian cock is totally erect and throbbing in anticipation.");
	output("\n\n\"I want you, [pc.name].\" You smile up at him, and languidly remove your clothes, leaving you as naked as he is and ready for him to claim you. He lays down on the bed, propped up on one elbow, looking you over. \"So... what do you want to do? My mate.\" He glows as he utters the last two words. You consider your options...");
	flags["MAKI_RELATIONSHIP_STATUS"] = 2;
	makiusSexMenu();
}

public function makiusDate2friends():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	output("Apologetically, you tell Maki that's a bit too serious for you; you weren't expecting your relationship to develop to that extent. You're sorry, but you really think that it's best if you both just stay friends... with benefits, if he's willing. Being just friends is fine too, you tell him.");
	output("\n\nMaki lets go of your hands and his ears flatten atop his head. \"Oh... I understand.\" He droops. \"Sorry to spring this up on you like that.\" He smiles weakly.");
	output("\n\nYou tell him it's alright, you're just not after that kind of relationship with him.");
	output("\n\n\He takes a moment to recompose himself. \"I'd love it if we could still stay friends. I just hope this doesn't make things weird between us.\"");
	output("\n\nYou promise that it won't.");
	output("\n\nHe looks embarrassed for a moment. \"And... uh... I like the benefits part. So I hope we can still... you know.\"");
	output("\n\nIf he wants to, you're happy to, you tell him. In fact, perhaps you could help him feel better now...?");
	output("\n\nMaki smiles at you but shakes his head. \"Thanks for the offer, but I'm just not in the mood right now. Can we do it later?\"");
	addButton(0, "Leave", makiusLeave);
}

public function makiusToBreeder(playScene:Boolean):void{
	makius.feminize();
	if (playScene){
		processTime(5);
		author("LukaDoc");
		clearMenu();
		clearOutput();
		showBust(makiusBust());
		if (!flags["MAKI_BREEDER_SEEN"]){
			output("As you enter the " + (!flags["MAKI_IN_CREW"]?"nursery infirmary, you stop and sniff; there's a strange scent in the air, underlying the usual smell of antiseptic":(makiusHasMedlab()?"medlab, you stop and sniff; there's a strange scent in the air, underlying the usual smell of antiseptic":"room, you stop and sniff; there's a strange scent in the air, one you're not used to")) + ". It's a strange, attractive smell that you can't resist following, your nose leading you right to... Maki? Yes, the smell hangs around the Venarian like a delicious veil... in fact, now that you're looking at him, you realise that Maki looks different. His pants are stretched tighter over a much rounder ass, a sexy butt that seems to invite you to squeeze and cup it, hips flared out like a woman's and only adding tension to his pants... And are those breasts starting to bulge his shirt?");
			output("\n\nThe Venarian's ears twitch and his nostrils flare, then he casually stops his typing and moves to look at you through half-lidded eyes. His tail waving expectantly behind. \"[pc.name]... I've been waiting for you.\" He licks his lips and flicks his mane seductively.");
			output("\n\nThe scent fills the air, stronger now than before, befuddling in its aroma. You dimly hear yourself asking if he's alright, noting that he looks and smells... different. Not in a bad way, just... different.");
			output("\n\nMaki gets up, slowly stretching himself to let you ogle him. As you watch, he walks past you, circling around you while rubbing his tail on your side. When he finishes looping around you, he leans in, rubbing himself against you and hugging your side. \"How do I look?\" He flicks the tip of his tail against your chin.");
			output("\n\nInstinctively, your hand cups his ass, and you playfully suggest that he looks horny, or perhaps sexy - which does he want to hear, you ask. Then, recovering, you ask what's happening to him; what made him change like he has?");
			output("\n\nMaki smiles and looks at you, pushing his butt against your hand as he does so. His eyes gaze into yours, filled with love and lust. \"You, of course.\"");
			output("\n\nMildly puzzled as well as increasingly aroused, you ask what he's changing for?");
			output("\n\nThe amorous Venarian nuzzles you. \"We've been fooling around a lot. You've taken my ass many times, but now.\" He licks his lips. \"Now I'm ready for you.... For us to have a child of our own.\" He gives you a little kiss on the cheek.");
			output("\n\nSomething primal seems to stir inside you at the scent filling the air, the Venarian's pheromones enticing you to rub and squeeze and fondle the ready, breedable male you've been courting up until now... if you don't leave now, you won't be able to stop yourself from doing just that.");
			flags["MAKI_BREEDER_SEEN"] = true;
			pc.lust(60);
			addButton(0, "Give In", makiusToBreederGiveIn);
			addButton(1, "Get Out", makiusToBreederGetOut);
		}else{
			output("As you enter the "  + (!flags["MAKI_IN_CREW"]?"nursery":(makiusHasMedlab()?"medlab":"doctor's quarters")) + ", you stop and sniff, a smile unconsciously crossing your lips. Maki's in one of his moods again, the kind of mood where he yearns for you to throw him down over the table and breed his belly full of pups. " + (pc.hasCock() || pc.hasTailCock()?"Y" + (pc.hasCock()?"our [pc.cocks] grow" + (pc.cockTotal() == 1?"s":"") + " stiff at the thought of it":"") + (pc.hasCock() && pc.hasTailCock()?" and y":"") + (pc.hasTailCock()?"our [pc.tailCock] wriggles madly,":"") + " eager to be sliding down his ass and filling him with your seed.":""));
			output("\n\nMaki turns to look at you, standing up and sauntering his way towards you, smiling seductively as he approaches. \"Hi [pc.name]!\" He walks past you, stroking your side with his tail and circling you. He leans into you, rubbing himself against and hugging your side. \"Something I can do you for?\"");
			pc.lust(40);
			makiusMenu();
		}
	}
}

public function makiusToBreederGiveIn():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	output("You give in to the instincts welling up within you and pull the Venarian into a kiss, squeezing his ass and feeling its warm, firm, tonedness under your fingers... then you realise what you are doing and force yourself to stop, though you can feel Maki's cock pressing through his pants against your thigh. You ask how that's supposed to work - he's a man, isn't he?" + (pc.hasVagina()? "Besides, shouldn't you be the one carrying a child anyway, given you have a womb?":""));
	output("\n\nMaki hugs you close, pressing himself against you. \"Yes, I am. But that doesn't matter for us Venarians.\" His tail circles around you, " + (pc.tailCount != 0?"finding your own [pc.tails] and coiling around them":"circling around your waist") + ". \"Males of my species can change, like I did. We can adapt ourselves to mimic females, so that we can bear the children of our loved ones. Similarly, women can adapt their bodies in order to sire children. The process is not permanent, of course, but it lets couplings like ours have a child of our own.\" He turns to kiss you once more.");
	output("\n\nYou kiss him back, letting him take the lead this time.");
	output("\n\n" + (pc.hasVagina()?"It doesn't matter that you have a womb. ":"") + "You've taken my ass so many times that I couldn't help but change....\"");
	output("\n\nYou digest this information, then ask if he's upset that he got put into this state. " + (pc.hasVagina()?" By someone who is technically a woman, no less.":""));
	output("\n\nHis hands slide along your belly, circling your navel with a clawed finger. \"This is something that happens naturally between mates. When a male takes another, the other male changes in order to better receive their mates. Now... normally we'd be having a chat to decide who gets to carry our child, but I guess I kinda forgot to mention this little detail about my species.\" He giggles. \"And I certainly don't mind carrying your child.\" He looks at you lovingly. \"So you ask if I'm upset?\" He smirks seductively at you and leans close to whisper into your [pc.ear]. \"Nope, I'm not upset at all. I'm just really, really wet right now.\"");
	output("\n\nAs if you needed any encouragement, you pull his lips back to yours and hungrily kiss him, rolling one hand across the base of his tail, as you know he likes, the other rising up to stroke his hair. The hand on his tail begins to worm its way under the hem of his pants, snaking past his loosened belt to grope at his soft butt and probe at his anus; like he promised, hot moisture greets your fingertips and you find that you can easily slip your digits inside; he's wet as any slut's cunt could ever hope to be.");
	output("\n\nYou enjoy molesting your medical officer for a while longer before he suddenly puts his hands on your chest and stops your advances, pushing you away. You stare at him, not bothering to hide your confusion; you thought he was enjoying it too.");
	output("\n\n\"Sorry....\" He says, stepping back and adjusting his tented pants. \"Sorry [pc.name]. I... I guess I let myself get carried away with this and didn't even ask you.\" He swallows. \"I want us to be a family, I want to bear your child... but it doesn't have to be now. I mean... I'm content with us just being mates right now, so the question is... do you want to have a child with me? Now?\"");
	addButton(0, "Yes", makiusToBreederGiveInYes);
	addButton(1, "No", makiusToBreederGiveInNo);
}

public function makiusToBreederGiveInYes():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	output("Seeing no point in wasting breath on words, you advance on your Maki and pull him back into your arms, crushing his lips against your own and pulling him tight against your chest. Hungrily you kiss him, and feel him start to return your ardour, before he suddenly pulls away.");
	output("\n\n\"" + (!flags["MAKI_IN_CREW"] || makiusHasMedlab()?"Nnn - Not here, [pc.name]; we'll contaminate the " + (!flags["MAKI_IN_CREW"]?"infirmary":"medlab") + ". Let's get to my quarters... quickly.\" He pleads with you. Nodding dumbly, the two of you practically fall over each other leaving the medlab and heading off to his quarters":"Let's get to my bed… quickly.\""));
	makiusSexMenu();
}

public function makiusToBreederGiveInNo():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	flags["MAKI_TAKING_FEMALE_CONTRACEPTIVES"] = true;
	output("Shaking your head to try and clear the fumes out of your nostrils, you tell Maki that, right now, you don't want to have a child with him.");
	output("\n\n\"Okay, I understand.\" He takes a deep breath, trying to calm himself down. \"Then... do you want me to change back? I can take some suppressants....\"");
	addButton(0, "Yes", makiusToBreederGiveInGoMale);
	addButton(1, "No", makiusToBreederGiveInGoFemale);
	if (CodexManager.entryViewed("Venarians")){
		addButton(2, "Fem Always", makiusToBreederGiveInAlwaysFemale, undefined, "Stay Female", "Ask him if there is any way to keep him like this even when not in breeding heat.");
	}else{
		addDisabledButton(2, "Fem Always", "Stay Female", "You don't know enough about Venarians to suggest this.");
	}
}

public function makiusToBreederGiveInGoMale():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	flags["MAKI_TAKING_SUPPRESSANTS"] = true;
	output("You tell Maki that it's probably best if he takes those suppressants, or else his pheromones are going to overwhelm the both of you.");
	output("\n\nMaki nods. \"Right. You'd best go then... before I lose control.\"");
	output("\n\nYou nod your head and, mustering your willpower, manage to drag yourself out of "  + (!flags["MAKI_IN_CREW"]?"the infirmary":(makiusHasMedlab()?"the medlab":"doctor's quarters")) + " before you end up " + (pc.hasCock() || pc.hasTailCock()?"burying your " + (pc.hasCock()?"cock":"tail-cock") + " to the hilt in a fertile Venarian boy-pussy.":"buying a transformative so you can plow his fertile Venarian boy-pussy."));
	addButton(0, "Leave", makiusLeave);
}

public function makiusToBreederGiveInGoFemale():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	output("You tell Maki that's not necessary; you happen to like the way he looks right now. You ogle his small breasts and big hips. Yes, he's looking pretty good right now.");
	output("\n\n\"R-Really?\" He smiles and bites his lip. \"Well... umm... you do realise that I'm going to stay like this until you actually get me pregnant right? Though I suppose that if I really need to go back to normal I could just take the suppressants, bu-\"");
	output("\n\nYou step forward and silence him with a kiss, hold it for several moments, and then break it before taking a step back.");
	output("\n\nThe Venarian doctor licks his lips, stunned by your kiss. He pants, looking lustfully at you. \"Hot Venarian sex in my room?\"");
	output("\n\nRather than waste time with words, you simply grab the closest convenient handle - hem of his pants, arm, tail, you're not sure what and, frankly, don't really care - and start dragging him in the direction of the " + (makiusHasMedlab()?"door out of the medlab and to Maki's room":"bed") + ".");
	makiusSexMenu();
}

public function makiusToBreederGiveInAlwaysFemale():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	output("Actually, you're totally loving this new body of his, from the supple breasts to the womanly curves, and you're left wondering if he can't look like that all the time.");
	output("\n\nThere is a short, confused pause before the Venarian speaks again, his voice full of disbelief and exasperation. \"Wha-What exactly do you want me to do? Take some drugs to turn myself into a woman for you?\"");
	output("\n\nYou remember how your codex mentioned that Venarians can manipulate their heat state with specialized drugs and transformatives. He could probably start taking some of those to accentuate his femininity, even when not in heat.");
	output("\n\n\"I… I guess that dirty old joke was true after all.\" He pauses for a long time, as he sighs, mostly relieved, then continues. \"I'll do some research and look for the safest drugs that will allow me to retain my femininity. For now I'll stay like this-\"");
	output("\n\nYou step forward and silence him with a kiss, holding it for several moments before taking a step back.");
	output("\n\nThe Venarian doctor licks his lips, stunned by your kiss.");
	output("\n\nHe pants, looking lustfully at you, \"Hot Venarian sex now?\"");
	output("\n\nRather than waste time with words, you simply grab as much of the flirty alien as you can get your hands on - hem of his pants, his butt, arm, tail, you're not sure what else, and frankly don't really care - and drag him in the direction of " + (makiusHasMedlab()?"his room":"the bed") + ".");
	flags["MAKI_BIOVEN_QUEST"] = 1;
	flags["MAKI_BIOVEN_QUEST_TIMER"] = GetGameTimestamp();
	makiusSexMenu();
}

public function makiusToBreederGetOut():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	output("Fighting to control yourself, you turn and run, leaving the surprised doctor behind you as you close the door as quickly as possible. You lean against the wall on the far side of the corridor for support, inhaling deep lungfuls of ship air to clear your head, your senses slowly losing their fuddled state and leaving you in control... if still painfully aroused. You realise your codex is chiming with a call, and you activate it, revealing Maki is the one calling you.");
	output("\n\n\"[pc.name]? I'm so sorry! I should have said something before... sorry for springing this up on you.\"");
	output("\n\nYou assure the Venarian that it's fine. But you still wonder what caused all of this. You voice your thoughts to the doctor.");
	output("\n\n\"Well, Venarians have the ability to take on the role of the opposite gender. This means females can impregnate and males can become pregnant. It's triggered when we get particularly amorous with our mates and... uuh... you've been fucking me a lot, so I couldn't help it.\" He bites his lip. \"But don't worry, we have a few hormonal suppressants we can take and I should be back to normal in a few hours... maybe.\"");
	addButton(0, "Stop Him", makiusToBreederGetOutStopHim);
	addButton(1, "Let Him", makiusToBreederGetOutLetHim);
	addButton(2, "Masc Only", makiusToBreederGetOutMascOnly, undefined, "Masculine only", "Ask him if there is any way to keep part of the transformation without the girly ones.");
}

public function makiusToBreederGetOutStopHim():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	output("You tell him not to do anything hasty.");
	output("\n\nThere is a short pause of confusion before the Venarian speaks again, his voice full of disbelief. \"But if I don't take the suppressants I'll stay like this until you make me pregnant!\"");
	output("\n\nYou smile and tell him that's not such a bad idea.");
	output("\n\n\"Uuh... excuse me?\" Seeing Maki like that surprised you, but you can't say you don't like seeing him like that.");
	output("\n\n\Maki ends the call and opens the door, looking at you with a baffled expression. \"So, you are not freaked out that I look like this?\"");
	output("\n\nYou shake your head, stating that he looks sexy the way he is.");
	output("\n\nAt this he smiles. \"Then, that means you are willing to knock me up? Because I don't mind carrying your pups... as many times as you want.\"");
	addButton(0, "Pups", makiusToBreederGetOutStopHimYes);
	addButton(1, "NoPups", makiusToBreederGetOutStopHimNo);
}

public function makiusToBreederGetOutStopHimYes():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	output("You tell him that if his biology lets him have pups, then you want to give him pups.");
	output("\n\nMaki can't suppress a grin at hearing that. \"Really!? Great! Because I'm all wet and ready right now, you can't believe how horny I am, it's like an ache that won't go away!\"");
	if (pc.isNice()){
		output("\n\nYou tell him you're sorry but you can't take him right now. He's obviously not in the right state of mind and you would feel awful for taking advantage of him so soon after the change.");
	}else{
		output("\n\nYou tell him not to get ahead of himself, as you don't intend to take him right now. Consider it punishment for not warning you about any of this.");
	}
	output("\n\n\"But I'm so horny! You can't leave me like this!\"");
	output("\n\nYou remain impassive to his pleading.");
	output("\n\nMaki's tail droops and his ears go flat against his skull. \"Aww.\"");
	output("\n\nYou pat him on the head before heading out, leaving the flustered doctor behind.");
	addButton(0, "Leave", makiusLeave);
}

public function makiusToBreederGetOutStopHimNo():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	output("You tell him you are just not ready to have kids right now. At least for the moment.");
	output("\n\n\"I see... but you like me like this, right?\"");
	output("\n\nYou nod.");
	output("\n\n\"Okay... then I'll take some fertility pills and you won't have to worry about this, and we can still have fun while I look like this.\" Maki licks his lips.");
	output("\n\nYou remind him not to get ahead of himself; he needs to take those pills first. <i>Then</i> you can have fun.");
	output("\n\n\"Alright, I'll start looking for them right now!\" Maki rushes " + (!flags["MAKI_IN_CREW"]?"back into the infirmary and closes the door behind him":(makiusHasMedlab()?"back into the medlab and closes the door behind him":"back to his computer")) + ". You decide to leave him to it, returning to your own quarters to avoid being overwhelmed by any lingering pheromones.");
	flags["MAKI_TAKING_FEMALE_CONTRACEPTIVES"] = true;
	addButton(0, "Leave", makiusLeave);
}

public function makiusToBreederGetOutLetHim():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	output("You tell him to do that. Seeing the Venarian so different really caught you off-guard, and you didn't like it. You say that you'll talk to him later, when he's back to his normal self.");
	output("\n\n\"S-Sorry....\" You can hear the sadness in his voice as you hang up the call.");
	flags["MAKI_STATE"] = 0;
	addButton(0, "Leave", makiusLeave);
}

public function makiusToBreederGetOutMascOnly():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	output("You tell him that, while you don't appreciate the breasts and the womanly hips, you're definitely enjoying his bigger, more supple ass and his frisky attitude.");
	output("\n\nThere is a short, confused pause before the Venarian speaks again, his voice expressing his disbelief. \"But… but I don't understand. What exactly do you want me to do?\"");
	output("\n\nYour codex mentioned that Venarians can manipulate their heat state with specialized drugs and transformatives. You ask him if it's possible to use those in a way that would allow him to keep his masculinity, but retain his bigger ass and his… eagerness and dedication to you. Maybe even get him heavy with your pups.");
	output("\n\n\"I… I've never looked into it too closely, but I suppose it's true. I did read a couple studies about it, not to mention one or two dirty jokes...\" He pauses for a long time, seemingly uncomfortable with your proposition and just as the silence begins to grow awkward, he continues. \"I guess I'll do some research and look for the safest drugs that do that. Meanwhile, I'll be taking the suppressants, since you clearly didn't appreciate my womanly features.\" He abruptly hangs up the call.");
	flags["MAKI_BIOVEN_QUEST"] = 1;
	flags["MAKI_BIOVEN_QUEST_TIMER"] = GetGameTimestamp();
	flags["MAKI_TAKING_SUPPRESSANTS"] = true;
	flags["MAKI_STATE"] = 0;
	addButton(0, "Leave", makiusLeave);
}

public function makiusPregnancyReveal():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	if (flags["MAKI_BIRTHED_CHILDREN"]){
		output("As you enter the "  + (!flags["MAKI_IN_CREW"]?"infirmary":(makiusHasMedlab()?"medlab":"room")) + ", you sniff the air, smiling unconsciously at the familiar fertile scent of your lover. However, it's not as strong as it usually is, and there are certain undertones that have changed. You know from experience now what it means: Maki has gone from \"ready to breed\" to \"has been bred\".");
		output("\n\nHe spots you and smiles, getting up to greet you. \"Hey there, [pc.name].\" He walks towards you " + (makiusPregLevel() > 2?"belly wobbling":"") + " and hugs you tightly, careful not to put extra pressure on your future offspring and rubbing himself against you.");
		output("\n\n\"Now, can I help you with something else? Or did you just come to check up on me and the fruits of our labor?\" He pats his " + makiusBellyDescriptor() + " lovingly.");
	}else{
		output("As you enter the "  + (!flags["MAKI_IN_CREW"]?"infirmary":(makiusHasMedlab()?"medlab":"room")) + ", you sniff the air, smiling unconsciously at the familiar fertile scent of your lover. However, it's not as strong as it usually is, and there are certain undertones that have changed. Could it be that Maki has gone from \"ready to breed\" to \"has been bred\"..?");
		output("\n\nThe Venarian looks over the screen of his computer and spots you. \"Hello [pc.name].\" He gets up, and you notice that he seems excited and more than a little embarrassed, even though he's smiling. \"I don't know if you've realised this by now, but I'm… I'm pregnant.\"");
		output("\n\nYou wrap your sharkpuppy in a tight hug and congratulate him, telling him how happy you are to hear that and ask him if he's okay.");
		output("\n\nMaki is quick to assure you, \"Yes. I am! I definitely am. Venarian pregnancies take a year to come to term, so it will take a while; but once it's done, we'll have a Venarian pup of our very own.\" Judging by the tone of his voice and the dopey expression he adopts, Maki is looking forward to the prospect of becoming a mother. \"So... anything you want my help with? I'm still all ready for you, you know? In case you want to.\"");
		output("\n\nHe's a horny thing, you tell him with a chuckle." + (pc.libido() >= 40?" Of course, you confess, so are you.":""));
		output("\n\n\"Well, sex happens to be healthy for all of us,\" he says, taking your hand and gently patting his stomach with it for emphasis. \"Besides, you can't blame me for wanting my " + pc.mf("handsome", "gorgeous") + " mate <i>now</i>, can you?\"");
		output("\n\nYou just smile softly, knowing that he has a point.");
		output("\n\nMaki looks at the floor then smiles lovingly at you. \"Now tell me, what exactly can I do for you right now? If it's me you want after all, just say so and I'm all yours\"");
	}
	makius.removeStatusEffect("makiusPregnancyReveal");
	makiusMenu();
}

public function makiusPregnancyReaction():void{
	processTime(60);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust());
	var semester:Number = pc.getPregnancyTime(pc.findPregnancyOfType("MakiusPregnancy")) / 365 * 4;
	
	if (flags["MAKI_SIRED_CHILDREN"]){
		output("You enter the " + (flags["MAKI_IN_CREW"]?(makiusHasMedlab()?"medlab":"room"):(flags["MAKI_OFFERED_JOB_AT_NURSERY"]?(hours > 7 && hours < 16?"infirmary":"room"):(flags["MAKI_STATE"] == 2?"room":"clinic"))) + ", ready to break the good news to your Venarian doctor-turned-lover. He quickly notices you and smiles.");
		output("\n\n\"Hello, [pc.name]. What can I do for you?\" he says with a loving grin.");
		output("\n\nYou decide to be quick about it, but before you can say anything else, he sniffs the air around you a few times and looks at you with surety.");
		output("\n\n\"You're pregnant with my puppies again!\" he blurts out, equally surprised and happy. Not a moment later he hugs you close and plants an adoring kiss on your [pc.lips]. Then he parts the kiss and kneels before you, putting one of his doggy ears on your [pc.belly].");
		output("\n\n" + (semester > 3?"\"I just felt a kick!\" he exclaims with barely contained giddiness.":(semester > 2?"\"It's not much, but I can already hear a heartbeat there,\" he says, smiling with genuine happiness.":"\"Guess it's too early to expect anything,\" he says with a bittersweet smile, trying his best to hide his disappointment.")) + " He gently rubs his head on your tummy, trying to imprint some more of his scent, before raising himself and holding your hands.");
		output("\n\nYou comment playfully that he must be really proud of himself to be checking the fruits of his labour so intensely. He just snickers and smiles even wider, looking you straight in the eyes. \"What can I say? You just keep making happier, even when I think I'm already as happy anyone can possibly be. If you need anything, and I mean <i>anything</i>, just tell me.\"");
		output("\n\n\"Now, can I help you with something else? Or did you just come to let me check up on the fruits of our labor?\" He pats your belly lovingly.");
	}else{
		var multiples:Boolean = pc.totalBabiesOfType("MakiusPregnancy") > 1;
		output("You mentally prepare yourself for what you're about to do, wondering how Maki will react once he learns he has put a pup in you. " + (multiples?"More than just one, in fact, according to your Codex. Guess you'll have a litter of your own soon enough.":"") + " But before you can enter the " + (flags["MAKI_IN_CREW"]?(makiusHasMedlab()?"medlab":"room"):(flags["MAKI_OFFERED_JOB_AT_NURSERY"]?(hours > 7 && hours < 16?"infirmary":"room"):(flags["MAKI_STATE"] == 2?"room":"clinic"))) + ", your cute Venarian doctor comes out. He is startled by your sudden appearance but his befuddled look quickly shifts into an amorous grin.");
		output("\n\n\"Oh! Hey, " + pc.mf("handsome", "gorgeous") + ". Eager once again to have some fun?\" he asks playfully, wrapping his arm around your waist and pulling you close, nuzzling himself into your neck.");
		output("\n\nYou tell him that " + (!pc.isAss()?", while you are always up for some loving fun with your mate,":"") + " now's not the time and ask him if the two of you can talk in private.");
		
		output("\n\n\"Sure! My door is always open for you!\" he says eagerly with a suggestive wink. " + (!flags["MAKI_IN_CREW"] && ((flags["MAKI_OFFERED_JOB_AT_NURSERY"] && hours > 7 && hours < 16) || flags["MAKI_STATE"] != 2)?"\"Follow me.\" He motions for you to follow him to a more private place.":"\"Come on in.\" He motions for you to enter " + (makiusHasMedlab()?"the medlab":"his room")) + ", his eyes occasionally looking back and taking a sneak peek at your " + (pc.hasBreasts()?"[pc.fullChest]":"crotch") + " along the way.");
		
		output("\n\n\"So… w-what do you want to talk about?\", he asks, seemingly having noticed your nervous energy and taken some of it for himself, immediately shifting emotional gears.");
		output("\n\nYou decide to just come out with it, so you take a couple of deep breaths and tell him that you're pregnant. For a brief moment, he seems relieved; maybe he expected something else? \"Congratulations! I hope you and the sire can raise it well.\" He seems to be oblivious to the fact that he is the father, but as it slowly dawns on him, he becomes really nervous. \"Is… is it mine?\"");
		output("\n\nYou " + (pc.isAss()?"answer with a firm and concise confirmation.":(pc.isMischievous()?"playfully bite his ear and ask in your best bedroom whisper if he’d find it hot to be called 'daddy'/":"just hug the cute doctor, plant a soft kiss on his cheek and beam at him happily.")));
		output("\n\nMaki " + (pc.isNice()?"hugs you back":"gives you a hug") + " and rubs himself against you, doing so a bit more carefully than usual, though just as thoroughly. \"I love you so much, my " + pc.mf("handsome", "gorgeous") + ", fertile mate.\" Then he reluctantly parts from the hug and goes on his knees to put one of his ears on your [pc.belly]. " + (semester > 3?"\"I just felt them kick!\" he exclaims with barely contained giddiness.":(semester > 2?"\"It's not much, but I can already hear a heartbeat there,\" he says, smiling with genuine happiness.\"":"\"Guess it's too early to expect anything,\" he says after some time, a bittersweet smile on his lips as he does his best to hide the disappointment.")));
		output("\n\nBoth of you spend the best part of an hour talking about your future child " + (multiples?"ren from picking their names":" from picking their name") + " and making plans for their education to deciding on who will eventually have to give them the Talk, among many others concerns. He seems to be worried about one of you having to settle down to take care of the newborn, but you quickly remind him that you have a Nursery prepared by your father that would take care of that. " + (flags["BRIGET_MET"]?"Headed by the best Robomom in existence and s":"S") + "taffed with top notch professionals in both pedagogy and pediatrics, no doubt! The tension visibly leaves his body as you convince him.");
		output("\n\nEventually, he can take his mind off of the subject entirely and return to the present - and you. \"Well, if you ever need anything, and I mean <i>anything</i>, I'm here for you, my mate. Now tell me, what exactly can I do for you right now? If it's me you want after all, just say so and I'm all yours.\"");
	}
	kGAMECLASS.makius.removeStatusEffect("makiusPregnancyReaction");
	makiusMenu();
}

public function makiusPcGivesBirth(amount:int, handler:MakiusPregnancyHandler, fromNursery:Boolean = false):void{
	processTime(180);
	if (!fromNursery) moveTo("SHIP INTERIOR");
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust());
	var firstFemale:Boolean = handler.generatemakiusChildren(true, amount);
	output("You start to feel sudden, intense contractions in your belly and pelvis, while your thighs become strangely wet. It only takes you a moment to realize that your waters just broke and you're about to give birth to a " + (amount > 1?"litter of Venarian puppies.":"Venarian puppy."));
	if (flags["MAKI_IN_CREW"] || fromNursery){
		if (fromNursery){
			output(" You instinctively call out to the doctor, the adorable Venarian that put the pupp" + (amount > 1?"ies":"y") + " in you.");
			output("\n\nMaki, who hasn't left your side these last few days, quickly rushes into the room, his face filled with panic, but he quickly gets over it and rushes to your aid.");
		}else{
			output(" Your first impulse is to call the doctor, the adorable Venarian that put the pupp" + (amount > 1?"ies":"y") + " in you.");
			output("\n\n\"Hello, [pc.name].\", he says in his usual cheerful tone. But then he sees the grimace stamped on your face and worriedly asks, \"What's wrong?\" Amidst the groans of pain, you manage to scream that you're going to give birth to your pupp" + (amount > 1?"ies":"y") + " <i>soon</i>. \"I… <b>I'll be there in an instant.</b>\"\n\n");
			if (InShipInterior()) output("Not a minute later he finds you on the ship and bring you over to his room. You settle on the bed as he rushes all over the room, making sure everything is ready for the birth of your bab" + (amount > 1?"ies.":"y."));
			else output("Not ten minutes have passed before an emergency drone arrives. Makius jumps outside before it even comes to a full stop and rushes to your side. Carefully and quickly, he helps you into the vehicle. Soon enough, you're back on your ship and are settled into Makius room as he finishes preparing everything a newborn might need.");
		}
		output("\n\nThe Venarian quickly helps you to settle " + (pc.isTaur()?"into a harness that gently supports your tauric body":"onto the bed") + ", taking position " + (pc.isTaur()?"behind your hindquarters":(pc.isNaga()?"over your coils":"between your spread legs")) + ". He gives you words of encouragement as he works his magic, a \"Push\" here and a \"We're almost done\" there. Slowly and surely, you let your bundle of love into the world. Once your child is fully birthed and wrapped up safely in his arms, you can finally breathe easy, " + (amount > 1?" - at least for a few seconds, since there's " + (amount == 2?"one more puppy":"more puppies") + " coming out of you today. He gives you more encouragement and platitudes as you go through the same laborious process all over again. " + (amount > 2?" And again...":""):"relieved that the newborn is safe."));
		output("\n\n" + (amount > 1?"After all of the puppies are out, you take a few minutes to just rest while Maki fusses over you, double checking that both you and the pups are healthy.":"After a few minutes of rest, Maki starts fussing over you, double checking that both you and the pups are healthy.") + " He then hands you " + (amount > 1?"one of your newborns":"your newborn") + (pc.isLactating()?" that you bring to your breast to suckle on your [pc.milk].":" which you gently cradle in your arms."));
		output("\n\n" + (amount > 1?"He " + (amount > 2?"hands you another infant as he ":"") + (makiusMasculine()?"cradles a " + (amount > 2?"third":"second") + " puppy in his arms. ":"brings a " + (amount > 2?"third":"second") + " puppy to one of his breast to suckle on its nutritious bounty. ") + (amount > 4?"The rest of the puppies are settled into a hastily prepared crib where they immediately start squirming and bumping into each other, searching for their mother's warmth. You'll need to tend to them as soon as you are done with their siblings. ":""):"") + (amount > 1?"They look":(firstFemale?"Sh":"H") + "e looks") + " exactly like " + (amount > 1?"their":(firstFemale?"her":"his")) + " father, but with [baby.hairColor] and [baby.skinFurScalesColor] patterned fuzzy fur, instead of the navy and blue Maki sports, as well as your [baby.eyeColor] eyes.");
		output("\n\nYou look up at Maki and tell him as much, your voice still small and raspy from the strain you have just experienced. He doesn't answer you with words, but his expression says it all: a mix of brimming pride, love, joy and the stress that has just begun to loosen its grip on your lover.");
		output("\n\nThe nursery pod arrives shortly after; it seems like even while worried sick, your doctor stayed immaculately professional. You both enjoy the presence of your child" + (amount > 1?"ren":"") + " a little while longer before handing " + (amount > 1?"them":(firstFemale?"her":"him")) + " over to be delivered to their new home.");
	}else{
		output("\n\n" + (InShipInterior()?"":"You stumble back onto your ship, doing your best to keep the child" + (amount > 1?"ren":"") + " from being born before you reach safety. ") + (crew(true, true)?"After you've locked the door to make sure none of your noisy crewmates come check on you, y":"Y") + "ou quickly collapse on top of your comfy, welcoming bed and get ready to give birth");
		output("\n\n<i>Hours pass</i>");
		output("\n\nAfter you successfully give birth and wash your bab" + (amount > 1?"ies":"y") + ", you can finally let yourself rest, " + (amount > 1?num2Text(amount) + " Venarian puppies, greedily sucking " + (target.hasBreasts()?"[pc.milk]from your [pc.breasts]":"milk from a bunch of bottles you have prepared beforehand. They look"):"a Venarian puppy " + (firstFemale?"girl":"boy") + " in your arms, greedily suckling on " + (pc.hasBreasts()?"your [pc.nipple]":"a milk bottle") + ". " + (firstFemale?"Sh":"H") + "e looks") + " exactly like " + (amount > 1?"their":(firstFemale?"her":"his")) + " father, but with [baby.hairColor] and [baby.skinFurScalesColor] patterned fuzzy fur, instead of the navy and blue Maki sports, as well as your [baby.eyeColor] eyes.");
		output("\n\nYou enjoy the presence of your child" + (amount > 1?"ren":"") + " for a little while longer before handing them over to the safety of the nursery pod" + (amount > 1?"s.":"."));
	}
	addButton(0, "Continue", mainGameMenu);
}

public function makiusGivesBirth():void{
	var handler:MakiusPregnancyHandler = PregnancyManager.findHandler(makius.pregnancyData[3].pregnancyType) as MakiusPregnancyHandler;
	var firstFemale:Boolean = handler.generatemakiusChildren(false);
	var onTavros:Boolean =  getPlanetName().toLowerCase() == "tavros station";
	MakiusPregnancyHandler.cleanupPregnancy(makius, 3, handler);
	if ((flags["MAKI_IN_CREW"] && InShipInterior()) || (!flags["MAKI_IN_CREW"] && onTavros)){
		clearOutput();
		clearMenu();
		author("LukaDoc");
		processTime(60);
		showBust(makiusBust());
		var secondDoctor:String;
		if (onTavros && flags["BRIGET_MET"]){
			moveTo("NURSERYI6");
			secondDoctor = "Briget";
		}else{
			moveTo("SHIP INTERIOR");
			//other medbay inhabitants
		}
		output("You hear your codex beeping and notice you have an incoming emergency call. It's Makius, your pregnant Venarian doctor. You open the video feed and immediately notice that he's huffing and groaning, his eyes struggling to stay open and his ears twitching in pain. \"My wa… ugh.. waters just broke. I think I'm about to give birth.\" You tell him you're coming as quickly as possible and rush back to " + (InShipInterior()?(makiusHasMedlab()?"the medlab.":"his room."):"your ship."));
		output((secondDoctor?"\n\n\"Good, you have arrived,\" says " + secondDoctor + (secondDoctor == "Bridget"?"":", the medic available to help with the birth.") + " \"He insisted on stalling the operation until you were here.\"":""));
		output("\n\nYou rush to Makius' side and grab his hand. He is clearly struggling: his ears tucked against his skull, whines of pain forcing their way past his tightly sealed lips, and his hand currently squeezing yours with way more strength than you're used to. He doesn't talk; instead he just looks at you and does his best to relax, extremely relieved by your presence.");
		if (secondDoctor){
			output("\n\n\"We're all set here,\" you hear the " + secondDoctor + " say from between your mate's spread legs. \"I'm going to need you to push.\"");
			output("\n\nYou feel his fingers lacing with yours as the puppy begins to come out of him. As you give him more encouragements, his grasp tightens even more, and you almost hear your fingers crack, but you both persevere for your child's sake. His breath grows more and more ragged each time he follows the instructions and pushes; eventually the doctor has him start taking short breaks.");
			output("\n\nIt takes a few hours, but once the baby is out his grip slackens and you hear the telltale cries of a newborn child taking its first breath, you both let out a deep sigh in relief. \"It's a healthy " + (firstFemale?"girl":"boy") + ", says " + secondDoctor + " before handing you the wailing newborn.");
		}else{
			output("\n\n\"I don't think I would've been able to hold out any longer,\" he says, taking deep breaths, \"and I'm going to need you to help me.\"");
			output("\n\nYou tell him you're no substitute for a proper doctor" + (pc.intelligence() > pc.intelligenceMax() * 0.6?", even though you've been reading up on the subject in preparation.":"."));
			output("\n\n\"I have most things covered, [pc.name]. Y... You'll just need to grab the baby as " + (firstFemale?"she":"he") + " comes out and make sure I don't hurt " + (firstFemale?"her":"him") + " by accident. P-please!\"");
			output("\n\nYou nod and take position between his legs, bracing yourself and getting ready to receive the baby that's going to come out of his anal passage.");
			output("\n\nThen he starts to push and bit by bit you see the baby's head showing. You give him encouragements and reassuring caresses as he perseveres, though you aren't sure how much of it registers in the struggling Venarian's mind. His breath grows more and more ragged each time he pushes, and eventually he needs to start taking short breaks.");
			output("\n\nAfter a few hours the child is born, and you hear the telltale cries of a newborn taking " + (firstFemale?"her":"his") + " first breath, and you both let out a deep sigh in relief. \"It's a healthy " + (firstFemale?"girl":"boy") + "!\", you tell the Venarian mother as you hand him the wailing newborn.");
		}
		output("\n\n" + (firstFemale?"Sh":"H") + "e looks exactly like " + (firstFemale?"her":"his") + " mother, but with [baby.hairColor] and [baby.skinFurScalesColor] patterned fuzzy fur, instead of the navy and blue Maki sports, as well as your [baby.eyeColor] eyes.");
		output("\n\nYou cradle your puppy in your arms" + (pc.isLactating()?", letting " + (firstFemale?"her":"him") + " suckle on your nipple for a short while":"") + ", before handing " + (firstFemale?"her":"him") + " to " + (firstFemale?"her":"him") + " mother. " + (makiusMasculine()?"Maki tries his best to comfort the child, only succeeding for a few minutes before the wailing starts anew - until " + (secondDoctor?secondDoctor:"you") + " hand him a bottle of milk, which the baby starts suckling from eagerly and greedily.":"He silences the baby's wailing cries by bringing him to his full breasts, getting you both some peace and quiet as the child starts suckling on his nipples eagerly and greedily."));
		output("\n\n" + (secondDoctor == "Briget"?"A drone soon arrives and, after a long goodbye, Makius hands the baby over, shedding a tear as the dutiful robot takes your newborn away and flies away to your nursery.":"Bridget arrives shortly after, telling you that she's gonna take the baby to postnatal care.") + " You decide that for now it's best to stay close to your mate, comforting him as you gently help him go to sleep.");
		addButton(0, "Continue", mainGameMenu);
	}else{
		resendMail("makius_nursery_missed_child", kGAMECLASS.GetGameTimestamp());
		mainGameMenu();
	}
}

public function makiusBirthMessage():String{
	var handler:MakiusPregnancyHandler = PregnancyManager.findHandler(makius.pregnancyData[3].pregnancyType) as MakiusPregnancyHandler;
	var firstFemale:Boolean = handler.generatemakiusChildren(false);
	MakiusPregnancyHandler.cleanupPregnancy(makius, 3, handler);
	
	var msg:String = "";
	msg += "Hey " + kGAMECLASS.pc.nameDisplay() + ", how are you doing? And because I know you'll ask: I'm doing fine.";
	msg += "\n\nI have some amazing news for you. Our baby has been born! I'm sorry you couldn't be around for our child's birth. Oh, and don't worry, our baby is a healthy " + (firstFemale?"girl":"boy") + "! It wasn't an easy birth, but that's the case with most male Venarian pregnancies. There were no serious complications, so I'm fine too.";
	if (flags["MAKI_OFFERED_JOB_AT_NURSERY"]){
		msg += "\n\nAnyway, I just wanted to thank you again for giving me a job in such an amazing, nurturing environment. It's fascinating how much some people can do for their children, even while their work keeps them away. I do hope that you've inherited that trait from your dad and will show as much appreciation for our child" + (flags["MAKI_SIRED_CHILDREN"] || flags["MAKI_BIRTHED_CHILDREN"] > 1?"ren":"") + " as he did.";
	}else{
		msg += "\n\nDespite how hard I looked I couldn't find any job for a doctor with my credentials on Tavros. So once I've finished weaning off the bab" + (flags["MAKI_SIRED_CHILDREN"] || flags["MAKI_BIRTHED_CHILDREN"] > 1?"ies":"y") + ", I'll go back to my old job in Nova's Clinic. I'll keep looking, but I don't have much hope. I'll leave the child in the care of your nursery, as I wouldn't feel comfortable to take it away from such an amazing, nurturing environment into the scrapheap field that Tarkus is.";
	}
	msg += "\n\nPlease come visit me anytime. I miss you.";
	msg += "\n\nLove,\nMakius\n\n<i>Attached to the message is a holo-pic of Makius cradling your puppy in his arms. " + (firstFemale?"Sh":"H") + "e looks exactly like " + (firstFemale?"her":"his") + " mother, but with " + kGAMECLASS.baby.hairColor + " and " + kGAMECLASS.baby.skinFurScales() + " patterned fuzzy fur, instead of the navy and blue Maki sports, as well as your " + kGAMECLASS.baby.eyeColor + " eyes.</i>";
	return msg;
}

public function makiusBiovenResearch():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	output("As you enter the room, you find Makius so deeply engrossed on his codex that he doesn't notice your arrival. You lean over him to see what he's looking at. He's reading up an in-depth study on the side-effects of a transformative drug called BioVen. You can't read much before he notices you and jumps out of his chair, completely startled. He relaxes as he notice that it's you.");
	output("\n\n\"Oh, hey [pc.name], didn't notice you there. I… I've been researching the transformative you wanted.\"");
	output("\n\nYou ask him if he has found anything.");
	output("\n\n\"Yes… Yes I have.\"");
	output("\n\nYou follow up and wonder if there are any problems as you note that he was looking at the detailed list of secondary effects.");
	output("\n\n\"Well, yes and no. We Venarians have an innate form of unconventional hermaphroditism, so most legal market transformatives are not really available to us. The standard microsurgeons and artificial hormones don't interact right with our bodies. Those on the black market… well we better not talk about something like that. Suffice to say, anything I might need to buy is gonna be kind of expensive.\"");
	output("\n\nYou're pretty sure you're not gonna like this, but you ask how much it costs, anyway.");
	output("\n\n\"Ten thousand credits for the full course.\"");
	output("\n\nThat's definitely expensive, so you follow by querying if there's anything cheaper.");
	output("\n\n\"Yes, but nothing that I would let myself take.\"");
	output("\n\nYou ask him if it's the BioVen treatment he was just reading about.");
	output("\n\n\"Definitely! BioVen is a really safe treatment that, rather than just feeding me artificial hormones, also uses microsurgeons to change the hormone receivers themselves into something that the drug can work with. It also comes in a complete package, with three different types of pills: feminizing, masculinizing and reversing. And it's completely safe to use while pregnant, so our baby would never be in danger" + (!flags["MAKI_BIRTHED_CHILDREN"]?"... you know, if we ever decide to have one.\" He says his fur barely hiding the blush on his cheeks/":"") + ".");
	output("\n\nYou suggest just buying one of them.");
	output("\n\n\"Sorry, but I rather have the complete set. I'm putting my paw down, so it's this or nothing.\"");
	output("\n\nYou are a little taken aback by him being so forceful on this.");
	output("\n\n\"Besides the prospect of being stuck forever in a form I might not like, I've read the background of the company that made them, BEM incorporated, and I kinda want to support them.\"");
	output("\n\nWhat kind of background would leave him so enamoured with a company?");
	output("\n\n\"Just a bittersweet love story,\" he says, seemingly eager to retell you this surprising piece of corporate lore. \"A Venarian that falls in love with a heterosexual ausar of the same sex. An old story of a romance completely set for failure, except in this case the Venarian lady was a geneticist. She invented a drug that would turn her permanently into her manly-looking breeding state.\"");
	output("\n\nConsidering that he said it was a bittersweet love story you assume it didn't end well.");
	output("\n\n\"The ausar she was pining after really appreciated the gesture, but just couldn't find her attractive. So they parted ways and the lovesick Venarian set up a company to help those of members of our species that got stuck in the same situation. In some cases it worked, in others it did not. Since most corps don't want to patch their mods with costly Venarian workarounds, BEM has a monopoly on Venarian and some other highly specialized racial transformatives.\" He pauses for a second to take a breath in and then asks \"So what do you say? Should I buy it or no?\"");
	if(pc.credits >= 10000){
		addButton(0, "Buy", makiusBiovenResearchBuy, undefined, "Buy BioVen", "Buy BioVen, the Venarian transformative that costs whopping 10000 credits.");
	}else{
		addDisabledButton(0, "Buy", "Buy BioVen", "Maybe later you'll be able to buy this expensive product.");
	}
	addButton(1, "Don't Buy", makiusBiovenResearchNo, undefined, "Don't buy BioVen", "On second thought, you don't want Maki to change <i>this</i> badly.");
}

public function makiusBiovenResearchBuy():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	output("You tell Maki you'll buy the product to make him look like you want him to be. He sends a link to your codex with a link of the site where to purchase it. You order the product and you receive a receipt telling it will arrive soon enough.");
	output("\n\n\"I hope you'll enjoy how I'll look after taking this,\" he muses. You tell him with a " + (pc.isNice()?"comforting smile":"playful smirk") + " that you will.");
	pc.credits -= 10000;
	flags["MAKI_BIOVEN_QUEST"] = 3;
	flags["MAKI_BIOVEN_QUEST_TIMER"] = GetGameTimestamp();
	makiusMenu();
}

public function makiusBiovenResearchNo():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	output("You tell him you " + (pc.credits < 10000?"can't":"don't want to") + " buy it right now because it's too expensive, but that he should save the link so you can buy it as soon as you can.");
	output("\n\n\"I guess I can wait for you to save enough money,\" he sighs, leaving you uncertain if he's sad or relieved.");
	flags["MAKI_BIOVEN_QUEST"] = 2;
	makiusMenu();
}

public function makiusBiovenArrival():void{
	processTime(15);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	flags["MAKI_BIOVEN_QUEST"] = 4;
	output("You spot Makius heading towards his room with a package in his arms, so you call for him.");
	output("\n\n\"Hello, [pc.name]!\" he exclaims, visibly happy to see you.");
	output("\n\nYou ask him if that package is what you think it is.");
	output("\n\n\"Yes, it's BioVen. I was heading to my room to open it right now… Want to come?\"");
	output("\n\nYou nod and follow him.");
	output("\n\nSoon enough, you are both in his room and tearing into the package, revealing its contents. A tri-coloured pill bottle, large enough that it might as well contain hundreds of them, and a small booklet that is filled with detailed instructions, advertisements and a list of side-effects. You skip all of that, assuming that the Venarian doc already knows everything there is to know about the treatment, and go straight for the effects on male Venarians. The blue side of the bottle is labelled <b>\"Masculine\"</b>, and according to the booklet, it will maintain the Venarian user's masculine physique through their heat and pregnancy without negatively affecting the child or triggering lactation. The pink pills are labelled <b>\"Feminine\"</b>, and upon consumption they will change the Venarian user's natural state and have them permanently experience the hip and breast growth that is typical for the species' heat, though they won't be able to lactate unless pregnant and will suffer from some penile shrinkage. The last side is green and labelled as <b>Natural</b>, and it will remove any effects from the other pills.");
	output("\n\n\"I guess this is it. This is what you wanted, right?\" Maki muses out loud.");
	output("\n\nHe seems nervous, so you try to get him to relax and tell him that yes, that is what you wanted and that he will look great after taking these. Despite all of that, he still seems somewhat apprehensive.");
	output("\n\nHe hesitates for just a few moments before he takes a deep breath and asks you, \"Which one did you want me to take again?\"");
	addButton(0, "Masculine", makiusDBioVenNext, 2, "Masculine", "Tell Maki you want him to look as manly as possible all the time.");
	addButton(1, "Feminine", makiusDBioVenNext, 1, "Feminine", "Tell Maki you want him to look as womanly as possible.");
	addButton(2, "None", makiusBiovenArrivalNo, undefined, "Natural", "Your lover doesn't seem ready for this and you don't want to push him into doing something he doesn't want to. You'll ask again later.");
}

public function makiusBiovenArrivalNo():void{
	processTime(5);
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust())
	output("You tell him if he doesn't want to, he doesn't have to take the pills right now. You can ask him again later when he feels more comfortable with the idea.");
	output("\n\n\"Thanks, [pc.name]! I think I'll be more comfortable the next time you ask me,\" he says releasing one big huff of relief.");
	makiusMenu();
}

//--Sex section--

public function makiusSexIntro():void{
	clearMenu();
	clearOutput();
	showBust(makiusBust(2));
	processTime(10);
	author("LukaDoc");
	if(flags["MAKI_STATE"] == 2){
		output("You tell Maki to take off his clothes.");
		output("He smiles and in one fell swoop removes and tosses his clothes away. He takes a moment to teasingly pinch one of his nipples " + (makiusMasculine()?"":", drawing a droplet of milk to the tip of the engorged nub, ") + "and moans in delight as he does so, obviously attempting to tempt you. It's working, though you restrain yourself to see how far he'll go.");
		output("Maki crawls on the bed, raising his tail so you can see his glistening boy-pussy already leaking moisture down his luxurious backside. \"See? All ready for you.\" He smirks over his shoulder, shaking his ass.");
		output("You " +(pc.isNude()?"":"cast off your clothes and") + " step up, reaching over to fondle the pregnant Venarian's luscious ass, listening to his appreciative moaning as you decide how you want him.");
	} else if(flags["MAKI_STATE"] == 1){
		output((pc.isNude()?"Maki's hormone-drunk gaze darts all over your nude form, as he moans and begins to finger his ass.":"Seeing that Maki has already, you begin stripping yourself. In his impatience, the Venarian hurriedly walks up to you and begins fumbling with your clothes. He growls lustily and seems to be fighting to control himself and not just rip your [pc.gear] off. Finally having stripped you naked, he moans and begins fingering his ass"));
		output("\n\n\"[pc.name], I want you. Now.\"");
		output("\n\nYou eagerly watch him playing with himself as you decide what sort of sex you want...");
	} else if(flags["MAKI_RELATIONSHIP_STATUS"] == 2){
		output("You pull your Venarian mate into a deep kiss. Maki eagerly returns, taking advantage of the opportunity to grope and rub you. When you finally break, he is panting and gazing lustily at you.");
		output("\n\n\"So, that's what you want.\" He smiles. \"That's unfair, you know I can't say no to you. And then you go ahead and get me all worked up.\"");
		output("\n\nYou look over your lover, smiling when you see his jutting erection tenting his pants. You pull him into a hug, rubbing his mane with one hand while the other trails down to brush the base of his tail.");
		output("\n\nMaki smiles happily as you rub him down, he responds by doing his best to rub himself against you. " + (pc.isNude()?"Then, h":"Using his advantageous position he begins working on your [pc.gear]. You help guide him through stripping yourself down until you are standing naked before him, then begin returning the favor. H") + "e just lays down and lets you peel off his clothes and toss them away. When he's completely naked, he wraps you into another hug, rubbing himself against you once more" + (makiusMasculine()?"":", his large breasts smooshed against your [pc.chest]") + " and coils his tail around " + (pc.tailCount == 0?"your waist.":"your own."));
		output("\n\n\"Alright, that's enough foreplay I think. I want you now.\"");
		output("\n\nYou agree and start considering your options.");
	} else {
		output("You pull your Venarian lover into a deep kiss, holding him tightly against your body. Maki embraces you, his tail " + (pc.tailCount == 0?"circling your waist":"entwining with your own") + ". Short moments later he breaks the kiss, panting and looking at you with wanton lust.");
		output("\n\nYou note that his pants are starting to tent.");
		output("\n\n\"Do you want to...\"");
		output("\n\nYou simply nod in reply. " + (pc.isNude()?"Being naked already, you simply climb into Maki's bed and wait for him, letting him ogle every inch of your bare form as you do":"Slowly you get off the bed and begin to peel off your clothes") + ". Not wanting to be left behind, Maki begins taking off his clothes, and soon enough you are both naked. The Venarian tries to look away in embarrassment, but can't seem to stop himself from ogling you with lust.");
		output("\n\nYou respond by striking a pose " + (pc.tone > 49?", flexing your muscles":"") + "and ask him if he likes what he sees.");
		output("\n\n\"I love what I see!\" He replies with a smile, licking his lips. \"So, what should we do?\"");
	}
	makiusSexMenu();
}

public function makiusSexMenu():void{
	if (pc.hasCock()){
		var fitsC:int = pc.cockThatFits(makius.analCapacity());
		if (fitsC == -1){
			addDisabledButton(0, "Pitch Anal", "Pitch Anal", "Your cock" + (pc.cockTotal() > 1?" is":"s are") + " too big for the Venarian 's ass.");
			if (makiusIsCrew() && flags["MAKI_BREEDER_SEEN"]){
				addDisabledButton(6, "LustyFuck", "LustyFuck", "Your cock" + (pc.cockTotal() > 1?" is":"s are") + " too big for the Venarian 's ass.");
				addDisabledButton(7, "Force Change", "Force Change", "Your cock" + (pc.cockTotal() > 1?" is":"s are") + " too big for the Venarian 's ass.");
			}
		}else{
			addButton(0, "Pitch Anal", makiusSexPitchAnal, fitsC, "Pitch Anal", "Take a ride on the Venarian's furry ass.");
			if (makiusIsCrew() && flags["MAKI_BREEDER_SEEN"]){
				if (flags["MAKI_STATE"] == 1){
					if (pc.libido() > 74 || pc.hasPerk("Breed Hungry") || pc.hasPerk("Inhuman Desire") || pc.hasPerk("Easy")){
						addButton(5, "LustyFuck", makiusSexLustyFuck, [fitsC, false], "LustyFuck", "Fuck the Venarian doctor senseless.");
					}else{
						addDisabledButton(5, "LustyFuck", "LustyFuck", "Your libido is not good enough to fuck him senseless.");
					}
					addDisabledButton(6, "Force Change", "Force Change", "Maki is already in his breeding heat.");
				}else{
					addDisabledButton(5, "LustyFuck", "LustyFuck", "He's not in the proper mindset to be fucked senseless.");
					if (flags["MAKI_STATE"] == 2){
						addDisabledButton(6, "Force Change", "Force Change", "Maki is already pregnant.");
					}else if (flags["MAKI_TAKING_SUPPRESSANTS"]){
						addDisabledButton(6, "Force Change", "Force Change", "You won't' be able to change Maki while he is on suppressants.");
					}else{
						addButton(6, "Force Change", makiusSexForceChange, fitsC, "Force Change", "Force the Venarian to enter into heat, by fucking his ass several times in a row.");
					}
				}
			}
		}
		addButton(1, "Get Blown", makiusSexPitchOral, undefined, "Get Blown", "Get the doctor down on his knees to make a very personal exam at your cock.");
	}else{
		addDisabledButton(0, "Pitch Anal", "Pitch Anal", "You need a cock to fuck the Venarian's ass.");
		addDisabledButton(1, "Get Blown", "Get Blown", "You need a cock to get blown by the Venarian doctor.");
		if (makiusIsCrew() && flags["MAKI_BREEDER_SEEN"]){
			addDisabledButton(5, "LustyFuck", "LustyFuck", "You need a dick to fuck him senseless.");
			addDisabledButton(6, "Force Change", "Force Change", "You need a cock to fuck him into heat.");
		}
	}
	if (pc.hasVagina()){
		//find the last vagina that fits and is not occupied, or find the smallest vagina that fits
		var fits:Number = makius.cocks[0].effectiveVolume();
		var counter: Number = pc.vaginas.length;
		//Current largest fitter
		var fitsV: Number = -1;
		while (counter > 0) {
			counter--;

			if (pc.vaginalCapacity(counter) >= fits) {
				//accept the vag if not pregnant immedietly
				if ((pc.pregnancyData[counter] as PregnancyData).pregnancyType == ""){
					fitsV = counter;
					break;
				}
				
				//If one already fits
				if (fitsV > -1) {
					//See if the newcomer beats the saved small guy
					if (pc.vaginalCapacity(counter) < pc.vaginalCapacity(fitsV)) {
						fitsV = counter;
					}
				}
				//Store the index of fitting dick
				else fitsV = counter;
			}
		}
		
		if(fitsV == -1){
			addDisabledButton(2, "Catch Vaginal", "Catch Vaginal", "Your vagina" + (pc.vaginaTotal() > 1?"s are":" is") + " too tight for the Venarian 's cock.");
		}else{
			addButton(2, "Catch Vaginal", makiusSexCatch, fitsV, "Get Penetrated", "Tell the doctor to examine your cunt with his dick.");
		}
	}else{
		addDisabledButton(2, "Catch Vaginal", "Get Penetrated", "You need a pussy before you can ride on the Venarian's cock.");
	}
	addButton(3, "Catch Anal", makiusSexCatch, -1, "Catch Anal", "Convince the doctor to fuck your ass.");
	addButton(4, "Blow Him", makiusSexCatchOral, undefined, "Blow Him", "Get on your knees and give the Venarian a blowjob.");
	addButton(14, "Back", makiusMenu);
}

public function makiusSexCatch(vNum:int):void{
	clearMenu();
	clearOutput();
	showBust(makiusBust(2));
	processTime(30);
	author("LukaDoc");
	makiusSubbed( -1);
	
	// reset virility when boost is over
	if (flags["MAKI_VIRILITY_BOOST"] && GetGameTimestamp() > flags["MAKI_VIRILITY_BOOST"] + 1440){
		flags["MAKI_VIRILITY_BOOST"] = undefined;
		makius.cumQualityRaw = 1;
	}
	
	if (makius.cockVirgin){
		if (!makius.analVirgin){
			output("\"Are you sure, [pc.name]? C-Can I really?\" He looks at you hopefully.");
			output("\n\nYes, he can; you want to feel him inside of your [pc.vagOrAss " + vNum + "].");
			output("\n\n\"I'm afraid I don't really have any experience….\" his ears flatten as he averts his gaze, embarrassed. \"I don't know if I'll be able to please you, I mean.\" You can clearly see he's a bit insecure, not to mention nervous.");
			output("\n\nYou assure him that with your tutelage, he'll do a fine job.");
			output("\n\nHe visibly perks up and smiles as you say that. \"Okay, please bear with me.\" Since this is my first time pitching, maybe we could try an easy position?\"");
		}else{
			output("\"You want me to penetrate you?\"");
			output("\n\nYou reply that's right" + (vNum == -1?".":", then point out that you " + (pc.hasVagina()?" want him to do you in the":"don't have a pussy, so he'll have to take your") + " ass; will that be a problem for him?\n\n\"No, of course not. I'll try to be careful and not hurt you.\"\n\nYou thank him for his consideration."));
			output("\n\nMaki rubs the back of his neck. \"Well... I think I should tell you that... uuh... you are going to be my first, so... err... please bear with me, I'm not sure of what exactly I'm doing?\"");
			output("\n\nYou tell him that's understandable, and you'll try to help him.");
			output("\n\n\"Thanks. Since this is my " + (makius.analVirgin?"... our first time":"first time pitching") + ", maybe we could try an easy position?\"");
		}
		output("\n\nYou ask him what he has in mind.");
		output("\n\n\"I guess your people call it doggystyle.\"");
		output("\n\nMakes sense, you tell him that's okay with you.");
		output("\n\nMaki closes the distance and embraces you, kissing you tenderly. You return the kiss, but close your hands gently around his wrists and start tugging him softly but insistently towards the bed.");
		output("\n\nHe lets go of you and watches as you climb onto his bed, crawling in position. The Venarian swallows nervously, then climbs on the bed behind you. You patiently wait for him, wriggling your [pc.butt] " + (pc.tailCount != 0?"and flicking your [pc.tail] ":"") + "in invitation. He spreads your cheeks open and you make an approving moan, encouraging him to go further. You feel him lick your [pc.vagOrAss " + vNum + "], slowly driving his tongue inside. You wriggle and laugh, commenting that his tongue feels strange inside you, clenching your muscles to try and squeeze it. Maki mumbles something but you can't hear him very well since he's currently busy " + (vNum > -1?"eating you out":"rimming you") + ".");
		output("\n\nWithdrawing, he says, \"I said that lubrication is important, for both us.\"");
		output("\n\nYou agree with him, feeling the wetness he's added to your [pc.vagOrAss " + vNum + "].");
		output("\n\n\"I think you are ready.\" He strokes around your opening.");
		output("\n\nYou murmur appreciatively, deliberately shivering to show your anticipation.");
		output("\n\n\"My turn now.\" He begins stroking his human-like cock, " + (makiusMasculine()?"nine":"seven") + " inches long, " + (makiusMasculine()?"two inches":"one inch and a half") + " thick with a head covered in small nub-like growths . You watch as soon enough beads of pre begin forming on his tip and then streaming down his length. Maki gathers all of it and bathes his whole shaft in it. You watch in anticipation, eager for him to be ready so that you can begin.");
		output("\n\nSoon, he approaches you and aligns himself with your [pc.vagOrAss " + vNum + "]. \"Are you ready?\"");
		output("\n\nYou tell him that you are and shuffle back, playfully stroking his shaft with your nethers.");
		output("\n\nYour Venarian lover begins making his way inside your depths, slowly filling you up as he leans over you, intent on staying as close as possible to you. You moan appreciatively as he slowly spreads you wider, filling you deeper and deeper. Soon he hilts within you and you shudder, clenching your [pc.vagOrAss " + vNum + "] to try and squeeze his alien cock with its delicious tingly nubbed texture.");
		makius.cockChange();
		pc.holeChange(vNum, makius.cockVolume(0));
		output("\n\n\"Aaahh. You feel so good.\" Maki hugs you, nuzzling you and taking in your scent.");
		output("\n\nYou kneel there and soak up the sensations; his fur brushing against your back, the warmth of his body against yours, his throbbing cock buried inside of you, his heart beating so fast and hard you can feel it against your skin. After a few long moments, though, you gently chide him, telling him that neither of you will get anywhere unless he starts moving.");
		output("\n\n\"S-Sorry.\" He moves his hands to your [pc.hips] and begins moving immediately.");
		output("\n\nYou tell him not to be so impatient; he needs to make his thrusts longer, more measured - don't go so fast, not at this early stage.");
		output("\n\nHe instantly does as you ask, moving slowly... maybe a bit too slow now. \"Like this?\"");
		output("\n\nFaster than that, you reply, but he's got the basic idea down.");
		output("\n\nHe speeds up a bit. \"Is this good?\"");
		output("\n\nGood, very good you reply, starting to thrust back against him now that he's got the right pace.");
		output("\n\nMaki pumps his " + (makiusMasculine()?"boyish":"curvy") + " hips against yours, slowly building up his pace and always mindful of your reactions. You murmur and growl appreciatively, flexing the muscles of your [pc.vagOrAss " + vNum + "] as you slide back and forth in tune with his own thrusts.");
		output("\n\n\"D-Damn...\"");
		output("\n\nYou ask what's wrong.");
		output("\n\n\"This feels so good that I don't think I'll be able to last much longer.\"");
		output("\n\nGiving up already, you tease, clenching tight as you can and drawing yourself up the length of his shaft with exquisite slowness for this next one.");
		output("\n\nHe whimpers and moans with each stroke, doing his best to rub himself against you as he fucks you; to imprint his scent on your body and your scent on his own.");
		output("\n\n\"[pc.name]. You smell so good, so enticing.\" He pushes his muzzle against your neck and inhales deeply. \"I want to cum inside you so badly... b-but I want you to enjoy this too. So I'll hold back, for you.\" He whimpers, it's clear holding back is taking all of his willpower.");
		addButton(0, "Together", makiusSexCatchFirstTogether, vNum, "Cum together");
		addButton(1, "Let Go", makiusSexCatchFirstLetGo, vNum, "Let it go");
	}else if(vNum >= 0){
		makiusSexCatchVaginal(vNum);
	}else{
		makiusSexCatchAnal();
	}
}

public function makiusSexCatchFirstTogether(vNum:int):void{
	clearMenu();
	clearOutput();
	showBust(makiusBust(2));
	processTime(300);
	author("LukaDoc");
	output("You tell Maki to hang in there. You are not much farther from climaxing yourself, and you want the two of you to cum together.")
	output("\n\n\"O-Okay I'll try.\" He doubles his pace, fucking you ferociously. The sound of your hips, grinding against each other echoes in the room. You moan and groan lewdly as he slaps your hips together, feeling the pleasure building inside of you as he slides and grinds through your hungry [pc.vagOrAss " + vNum + "]. \"I can't hold back anymore! I'm cumming!\" Maki yells. A sudden warmth fills your " + (vNum < 0?"bowels":"depths") + " as the Venarian begins inseminating you.")
	if (vNum < 0) pc.loadInAss(makius);
	else pc.loadInCunt(makius, vNum);
	makius.orgasm();
	output("\n\nYou cry out as the warmth pushes you over the edge and begin to cum yourself. " + (pc.isSexless()?"Your body wracks in a dry orgasm.":"Moisture " + (pc.hasVagina()?"showers down from your [pc.cunt]" + (pc.isHerm()?" and":""):"") + (pc.hasCock()?"gushes from your [pc.cocks]":"") + ", splattering onto the sheets underneath you."));
	pc.orgasm();
	output("\n\nAs you near the end of your orgasm; you suddenly feel yourself getting dragged to the side, as Maki collapses, panting. You just lay there, catching your breath along with your Venarian lover.")
	output("\n\n\"[pc.name]....\" Maki whimpers, hugging you tightly. You simply snuggle yourself against him and let sleep overtake you.")
	output("\n\nConsciousness returns, and you find yourself wrapped up in the warm embrace of Maki. You try to gently extract yourself from the Venarian's embrace, but he seems to resist every attempt at pushing him away and instead only holds on tighter. Seeing no other choice you reach back and gently tap his hips, intent on waking him up.")
	output("\n\n\"Hmm... [pc.name]?\"")
	output("\n\nYou politely ask him to let you go, as much as you enjoy cuddling you have duties.")
	output("\n\n\"Oh.\" He releases you and you get up, stretching your limbs. He does the same. \"Sorry about that.\"")
	output("\n\nYou smile at him and shake your head. He has nothing to apologise for, you kinda enjoyed being like that too.")
	output("\n\n\"[pc.name]?\"")
	output("\n\nYou look at him.")
	output("\n\n\"You are amazing.\"")
	output("\n\nYou can't help laughing at that, telling him that he's not so bad for a first timer either.")
	output("\n\nHaving said that you two redress in silence, exchanging glances once in awhile. Once you are properly dressed you hug outside his room and go your separate ways.")
	addButton(0, "Next", makiusLeave);
}

public function makiusSexCatchFirstLetGo(vNum:int):void{
	clearMenu();
	clearOutput();
	showBust(makiusBust(2));
	processTime(10);
	author("LukaDoc");
	output("You smirk and simply wring his cock with your inner walls again, stroking again. You tell him that it's okay, you want to make this good for him; he can go ahead and cum inside of you.");
	output("\n\n\"N-no, that would be selfish. I want you to enjoy this toooOOh.\" Maki moans as you wring his shaft, but he still doesn't orgasm.");
	output("\n\nMischievously you continue your almost torturously expert efforts at pushing him over the edge, playfully taunting him and trying to persuade him to give it up and cum already.");
	output("\n\n\"Nnnn... nooo... can't... c-cumming!\" Maki screams as he finally loses it and begins flooding your " + (vNum < 0?"bowels":"depths") + " with his pent-up seed. You moan and groan, feeling the warm deluge inside of you, it stirs your lust, but isn't enough to push you to orgasm, leaving you still bristling with need even as Maki finishes.");
	if (vNum < 0) pc.loadInAss(makius);
	else pc.loadInCunt(makius, vNum);
	makius.orgasm();
	output("\n\nHe collapses to the side, dragging along. He pants for a few moments, before uttering an apology, \"S-Sorry....\"");
	output("\n\nYou eye him appreciatively and tell him that it's alright; he'll get better with... practice, you say, a flirtatious tone coloring your voice. You extract yourself from your lover's cock, feeling his cum slowly seep from your used hole and trickle down the inside of your thighs. Maki just lays there, catching his breath and struggling to stay awake. You stroke his mane and tell him that for a first timer, he was doing great, leaning in to kiss his forehead. He sighs softly and closes his eyes, drifting off to sleep. You ruffle his mane and quietly slip out of his bed, redressing yourself and leaving the no-longer virginal doctor to his slumber.");
	pc.lust(80);
	addButton(0, "Next", makiusLeave);
}

public function makiusSexPitchAnal(cock:int):void{
	clearMenu();
	clearOutput();
	showBust(makiusBust(2));
	processTime(30);
	author("LukaDoc");
	makiusSubbed(1);
	var biggest:int = pc.biggestCockIndex()
	var cumQ:int = pc.cumQ()
	if (makius.analVirgin){
		output("\"You want to penetrate me?\"");
		output("\n\nYou tell him that you do, reaching out and gently stroking his shoulder as you say so.");
		output("\n\n\"O-Okay, I guess.\" He swallows audibly. \"So... you'll be taking my ass then? Because I heard it hurts....\"");
		output("\n\nYou promise him that you'll take things slow and careful; he'll feel a little weird until he adjusts, but it'll pass.");
		output("\n\n\"Okay. I guess I can at least try.\" He rubs the back of his neck. " + (makius.cockVirgin?"\"I never thought my first time would be....\" He trails off. \"I mean! I don't have a problem with it, but I....\" He trails off again. But what, you insist. ":"") + "\"I guess I'm still a bit nervous. So I don't know if I'll be able to relax... and then it'll hurt!\"");
		output("\n\nYou shuffle over so that you are leaning against him and gently wrap one arm around him in a partial hug, both hands running soothingly over his back, belly, chest, whatever catches your attention at the moment. You tell him to calm down and trust you; you'll make this good for him. He seems to enjoy the feeling but is still a bit tense.");
		output("\n\n\"Alright, [pc.name]. I trust you.\" You continue to stroke him with the arm wrapped around his shoulders, even as your other hand lifts his chin and gently pulls him into a kiss. You can feel him melting against you, tension ebbing away from your lips on his, and once suitably pliable you gently maneuver him until he's kneeling on all fours, finally breaking the kiss to move around behind him. You stroke the small of his back with one hand, and with the other, begin to caress his ass, his tail flicking gently in enjoyment. Carefully you extend a finger and begin gently probing at his anus; from the resistance it gives you, and the tightness with which it clamps down on you, he's an anal virgin.");
		output("\n\nThe Venarian whimpers a bit, whether in pain or pleasure you can't tell. His ears lay flat against his skull and he looks back at you, wondering what you'll do next.");
		output("\n\nYou can't resist reaching over and scratching his ears before ruffling his hair, the other hand patting his ass. You ask if he has any sort of lube to use.");
		output("\n\n\"Lube?\" He asks confused, before he suddenly slaps himself on the forehead. \"Oh yes, lube! Sorry, [pc.name]. To be honest I didn't really think that far ahead.\"");
		output("\n\nAh, well, you'll just have to make do, you tell him, smirking to yourself. You position yourself correctly and then lean over, supporting yourself on his soft, fluffy back.");
		output("\n\n\"W-Wait you aren't just going to take me dry are you!?\" He asks, panicked.");
		output("\n\nYou assure him that you aren't, but you're going to have to find another source of lube.");
		output("\n\nThat said, you reach for his crotch. Brushing through the silky-soft fluff, you find a strangely vagina like slit, from which is poking the unmistakable shape of his own penis. It's human-like, but the glans is covered in small, nubbly protrusions. One finger begins to run itself teasingly over the glans while the others close around his shaft, before you give it a friendly pump.");
		output("\n\nMaki moans as you stroke him. \"That feels nice... hmm... my slit, touch my slit,\" he says, letting his tongue loll out in pleasure. You take your other hand and begin to gently probe at the slit from which your alien lover's penis emerges, gently brushing and tracing it. \"Oh yes! That's the spot!\" The Venarian whimpers in delight.");
		output("\n\nYou smile, amused at his reaction; he really is getting so worked up over this... You blink in surprise as moisture suddenly hits the fingers of your hand still wrapped around his cock. Precum... in fact, a LOT of precum; he's leaking like a faucet! Hmm... this offers potential...");
		output("\n\nAs one hand continues to play with his groinal slit, your other hand releases his cock and begins to gather a great palmful of the slick, bountiful precum, which you then awkwardly bring back out and begin to massage into his virgin-tight asshole.");
		output("\n\n\"Ooh, that feels nice too!\" He closes his eyes and begins panting with a smile. You smirk and, after applying a second handful of precum-lube, begin gently probing with a finger, widening him for your own insertion.");
		output("\n\nMaki raises his butt to give you better access, draping his tail over your shoulder and stroking your back languidly. \"T-Touch me more!\" He says excitedly, it's quite obvious he's enjoying the treatment a great deal. You continue to probe at his ass with one finger, while the fingers of your other hand slide along his groinal slit and the base of his shaft. Watching him moaning and gasping under you, you can't help but feel turned on yourself.");
		output("\n\nFinally, you ask if he feels ready for the real fun yet. His reply is to lazily nod as he continues smiling. With his consent given, you stop probing at his ass and instead place that hand against his butt to better balance yourself as you take your [pc.cock " + cock + "] and press it against his virginal tailhole, slowly sliding the [pc.cockhead " + cock + "] into him.");
		pc.cockChange();
		makius.buttChange(pc.cockVolume(cock));
		output("\n\nMaki gasps, his eyes opening wide in shock. \"Ooooh!\" A moan fueled by pained pleasure escapes his throat as he bends his back into an arc. \"I-It's in!\" He whimpers.");
		output("\n\nNot just yet, you reply, but he's being very brave. With that you continue pushing your way inside of him, stroking his sensitive loins to distract him from the natural pain of being stretched looser around your member. He trembles as you feed him inch after inch of your [pc.cock " + cock + "]. His tail slides along your body, wrapping itself around your midriff" + (pc.tailCount == 0?".":" and seeking your own."));
		output("\n\n\"[pc.name]....\" He whimpers. Once your hips collide, Maki sighs, dropping chest-first onto the bed. \"J-Just give me a moment to adjust.\" You hold yourself steady as he asks, taking this perfect opportunity to fondle him, caressing his body with both hands, stroking his tail, gently nipping at the tips of his ears...");
		output("\n\n\"Hmm... if you keep doing this you'll make me cum.\" He pants a bit to catch his breath. \"I don't want to cum yet. I want to make you feel good too.\" With that in mind, you begin to slowly hump him properly, building up pace as his asshole loosens in response to your thrusts. Maki lifts himself back onto his elbows and in no time is bucking back against you just as eagerly as you are penetrating him. \"More!\" He asks, panting heavily. You begin to thrust harder and faster, holding onto his tail to help pull yourself against him. \"This feels so good! Everytime you pull off I feel so empty, and every time you pump yourself back in I feel like I'm being stuffed. D-Don't stop!\" You smirk and keep on thrusting, pumping as deeply into him as you can.");
		output("\n\nHe moans loudly one more. \"[pc.name]!\" As he finishes crying your name to the heavens you suddenly feel him " + (pc.hasKnot(cock)?"slip around your [pc.knot " + cock + "]":"tighten around your [pc.cock " + cock + "]") + ". His own cock throbs and spills its load onto the bedsheets below. You try to move, but his ass is gripping you too tightly to allow any kind of movement. Once he is done, he falls back, chest first, onto the puddle he made earlier. Too blissed out to care. \"I came.\" He whimpers in delight. \"[pc.name] did you come too?\"");
		output("\n\nYou moan and shake your head; you're so close, but you're not there yet...");
		output("\n\n\"Hmm... you need to cum too. I want your seed,\" he says lazily, still enjoying his afterglow. Seeing no reason not to accept that, and feeling his ass still eagerly gripping your cock, you continue humping the Venarian's butt, feeling it lazily wringing and squeezing you until you cry out and climax.");
		if (cumQ < 100){
			output("\n\nYour [pc.cock " + cock + "] spasms inside of the Venarian's ass, squirting it full of [pc.cum] until you are limp and spent, gasping for breath. \"Yes! Cum inside me!\" He says happily.");
			output("\n\nMoaning in pleasure, you " + (pc.hasKnot(cock)?"tug your [pc.knot " + cock + "] out, followed by":"pull") + " your slack shaft from Maki's cream-pied ass. A thin stream, resultant of your earlier actions, slowly leaks from the Venarian's used ass.");
		}else if (cumQ < 500){
			output("\n\nA cascade of semen floods from you, pouring into Maki's butt until his belly is noticeably soft and squishy to the touch from how much [pc.cumNoun] you've pumped into him. \"So full... so good.\" He sighs in pleasure.");
			output("\n\nMoaning in pleasure, you " + (pc.hasKnot(cock)?"tug your [pc.knot " + cock + "] out, followed by":"pull") + " your slack shaft from Maki's cream-pied ass. A sizeable stream begins leaking from Maki's butt, a sight you can certainly appreciate.");
		}else if (cumQ < 5000){
			output("\n\nGush after gush of your cum pumps into the limp alien under you, his belly visibly bulging from the stuffing he's received by the time you are finally spent. \"I feel bloated.... You really are virile, aren't you [pc.name]?\"");
			output("\n\nMoaning in pleasure, you " + (pc.hasKnot(cock)?"tug your [pc.knot " + cock + "] out, followed by":"pull") + " your slack shaft from Maki's cream-pied ass. Jism immediately starts pouring off the Venarian's ass and Maki moans at the sensation of your seed escaping him.");
		}else{
			output("\n\nYou cry out as a cascade of semen erupts from you and into Maki, jamming him fuller and fuller as his belly grows and grows and you still don't seem to run out. Finally, even your climax ends, leaving your male lover looking pregnant from the amount of seed flooding his belly. \"Wow [pc.name]. You came a lot! One would think you are trying to knock me up with all this cum!\"");
			output("\n\nMoaning in pleasure, you " + (pc.hasKnot(cock)?"tug your [pc.knot " + cock + "] out, followed by":"pull") + " your slack shaft from Maki's cream-pied ass. Your backed up cum squirts out of Maki's ass and the Venarian moans lewdly at the sensation, he had been filled to capacity and beyond. Yet he did not utter a single complaint, he must've really liked being filled so.");
		}
		makius.orgasm();
		makius.loadInAss(pc);
		pc.orgasm();
		output("\n\nYou appreciate the sight of your blissed out partner as Maki regains his breathing. The soft afterglow that follows your orgasm finally settling down fully.");
		output("\n\n\"Hey, [pc.name]?\"");
		output("\n\nYou signify he has your attention.");
		if (pc.isHerm()){
			output("\n\n\"I think I'm starting to develop a fetish for herms.\"");
			output("\n\nYou ask why he feels that way.");
			output("\n\nHe averts his gaze in embarrassment. \"I want you to do me in the ass again sometime... and the idea that you are, at least partially, a girl makes the idea sound even hotter for me.\"");
			output("\n\nYou smirk; when he puts it like that, it sounds quite flattering.");
			if (makius.cockVirgin){
				output("\n\n\"But I hope you'll let me penetrate you sometime as well.\"");
			}else{
				output(" You gently snuggle up against him. Sleep comes easily....");
				addButton(0, "Next", makiusSexPitchAnalVirginEnd);
				return;
			}
		}else{
			output("\n\n\"I guess I understand why some of my people prefer males now.\"");
			output("\n\nYou ask why he feels that way.");
			output("\n\n\"Well, we Venarians are inherently bisexual, because our unions usually provide results no matter the gender of the partner. But I kinda get why some of us prefer males now.\"");
			output("\n\nIs that so, you ask.");
			output("\n\n\"I'm not going to lie, I felt things I didn't think I would if I ever laid with another guy.\"");
			output("\n\nYou push for more details.");
			output("\n\n\"I guess what I mean to say is that I would love if we could do this again.\"");
			output("\n\nYou smile and suggest that might be possible.");
			if (makius.cockVirgin){
				output("\n\n\"And I hope sometime you're willing to let me do you as well?\"");
			}else{
				output(" You slide into his arms and allow him to cuddle you, then close your eyes....");
				addButton(0, "Next", makiusSexPitchAnalVirginEnd);
				return;
			}
		}
		addButton(0, "Okay", makiusSexPitchAnalVirginOkay);
		addButton(1, "Tease", makiusSexPitchAnalVirginTease);
		addButton(2, "No Way", makiusSexPitchAnalVirginNoWay);
	}else if(flags["MAKI_STATE"] == 2){
		output("The Venarian smiles, pleased by your request. He takes your arm and invites you to lay down on his bed, green eyes glued to your own.");
		output("\n\nYou see his reasoning; in his state, he can't have you on top, after all. You affectionately pat his " + makiusBellyDescriptor() + " and then seat yourself on his bed, laying back and making yourself comfortable, letting your [pc.cocks] be displayed for his perusal.");
		output("\n\nHe " + (pc.isNaga()?"":"spreads your legs and ") + "leans in to lick at your [pc.cocks]. He doesn't delay himself and there is no hesitation in his movements, but you can't help but think he's being deliberately slow in his movements. You watch, eager to see what he has in mind. He takes your [pc.cock " + biggest + "] into his mouth, mindful of his teeth, and begin lightly sucking on your [pc.cockhead " + biggest + "]. Pleasure skitters across your nerves and you moan softly, encouraging him as your shaft grows stiffer under his ministrations.");
		output("\n\nIt takes only a few moments before he releases you with a pleased whimper." + (pc.cockTotal() > 1?" This one.":""));
		if (cock != biggest){
			output("\n\nYou can't help but pointing out that he went right for your biggest cock. He is such a butt-slutt, isn't he? Not enough he has a baby in his belly, he needs your longest, thickest, <i>meatiest</i> dick up his ass? Looks like somebody's a bit of a size-queen....");
			output("\n\nHe laughs heartily at your teasing. \"You know I don't care much for size, [pc.name]. I'd take anything you have and be happy with it.\" He smirks mischievously. \"But since you have such a nice tool.\" He grabs your [pc.cock " + biggest + "] stroking you gently. \"Why shouldn't I pick the bigger one? Get more to play with?\"");
			output("\n\nYou can't help but laugh at that. \"But that one is too much.\" You pull your enormous tool from his relatively tiny hands and hand him a more reasonably-sized shaft.");
			output("\n\n\"Fair enough,\" he says sounding a bit disappointed.");
		}
		output("\n\nMaki climbs atop the bed, crawling over you as he moves to straddle you. As he crawls you can feel the pit-patter of his pre-drooling dick, already at full mast. A testament to how turned on he really is. You can feel his tail, caressing your [pc.legs] as it encircles you. Binding you playfully, as well as serving as a support for the Venarian. Throughout his movements you detect that he is exceedingly careful with his pregnant belly.");
		output("\n\nYou reach up and offer your support, gently stroking the swell of your pregnant boy-toy's belly. You can feel the beating of your unborn child's little heart through his stretched skin, and after your hand lingers you sense it moving, kicking in your direction as it feels your touch. You smile up at your lover, displaying your feelings to him.");
		output("\n\nHe places a hand over yours, just enjoying your touch for a moment. \"We should have another after this one.\"");
		output("\n\nOh? Does he enjoy being pregnant, or does he just want a big family?");
		output("\n\nHe grins at that. \"Maybe I just want to have you doting over me during my pregnancy? Though a big family wouldn't be so bad either….\"");
		output("\n\nYou simply smile and nuzzle his belly, feeling the warmth of the life growing inside of him. That's a deep thought, but this is a time for more intimate connections, doesn't he think so?");
		output("\n\nHe nods in agreement. \"Of course, my mate.\" He reaches for your [pc.cock " + cock + "], already throbbing in excitement and leaking pre. \"We are both horny, and I believe I have the solution to our problem right… here.\" He adjusts himself and lets your [pc.cockhead " + cock + "] press against his moist puckered hole, it takes only a slight pleasure before his depths envelop you in familiar warmth. His ass accepts your intrusion with only a token resistance, as if your shaft was meant for his tight, slick, hungry rosebud.");
		pc.cockChange();
		makius.buttChange(pc.cockVolume(cock));
		output("\n\nYou moan appreciatively as the sensation washes over your sensitive flesh; your lover's ass is so wet and warm, opening up to let you slide inside, then gripping you with delicious eagerness. Why, you'd almost think it was a vagina you were fucking... no, let's be honest; this is better than any pussy! Your hands reach up to caress his stomach as he slowly slides down and down, intent on hilting himself upon you, before moving up to stroke his " + (makiusMasculine()?"flat chest":"full, milk-seeping breasts") + ".");
		output("\n\nMaki moans in delight as soon as you grip his " + (makiusMasculine()?"chest":"breasts") + ", a girlish moan that looks completely out of place on the Venarian, a moan that screams want and lust. You like it when he moans like that. A wet squelch and the soft cushion of his butt on your hips signals that the Venarian's finally taken all of you in. He whimpers in delight, eyes cracking open to look lovingly at you as his butt begins its arduous task of milking you dry. Contractions ripple around you, working for the treat you are all too eager to give him.");
		output("\n\nShivering at the feeling of his butt rippling around you, you start to move your hips, experimentally thrusting into his welcoming backdoor, your hands continuing to rub and caress his " + (makiusMasculine()?"chest":"breasts") + " as you do so. However, your actions are a bit too much for your pregnant " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"boy":"") + "friend, and he loses his balance; you manage to grab him before he crashes and lower his gravid bulk gently down atop you. Staring into his eyes, your hands instinctively seek his own out, interlacing your respective fingers and gripping him tightly, feeling him do the same to you.");
		output("\n\nHe smiles at you in a mixture of thankfulness and love. You feel his hands grip your own as he uses them to get back up. Without another word he begins slowly riding you. Up and down, steadily and slowly at first, though he increases his speed just a tiny bit every time his butt comes into contact with your hips. You moan appreciatively, holding yourself back, letting him set the pace....");
		output("\n\nMinutes later, your body is aflame with lust and almost torturous pleasure. Maki has been riding you at the same exquisitely excruciating pace, milking you with each pass up and down your shaft's length, his wet ass suckling you like a ravenous mouth. His " + (makiusMasculine()?"belly jiggles":"breasts and belly jiggle") + " heavily each time his ass slaps into your hips, your Venarian whimpering as he slides up and moaning lustily each time he returns to the embrace of your body.");
		output("\n\nYou moan and groan, burning with need, feeling the crescendo making its inevitable approach, gasping a warning to Maki that you're going to cum if he keeps this up, unable to stop yourself from roughly bucking your hips - you need it, you need to cum!");
		output("\n\nHe redoubles his efforts in reply, slamming himself down on you with gusto, eager for your seed to be pumped into his confines." + (pc.hasKnot(cock)?" Finally, you feel his ass slowly stretching " + (pc.cocks[cock].knotMultiplier > 3?"obscenely ":"") + "around your [pc.knot " + cock + "], struggling to get past it's " + (pc.cocks[cock].knotMultiplier > 3?"humongous ":"") + "heft.":"") + " Incapable of holding back any longer, you cry out as you empty yourself into his greedy depths, flooding him as much as is possible with his womb already so full and heavy until at last you are spent, slumping back upon the bed with a sigh of contented relief.");
		makius.loadInAss(pc);
		pc.orgasm();
		output("\n\nAbove you, your Venarian lover has an expression of pure relief. His tongue is lolling out as he pants, ass gripping you tightly, " + (makiusMasculine()?"chest":"breasts") + " heaving with his pants. Looking down you note that his shaft is throbbing and tensing, no doubt these are the telltale signs of an ongoing orgasm. However much to your surprise, instead of the usual jet of white Venarian seed, what you see is ropes of white being shot weakly. It only goes a couple inches away before pooling on your belly. Instead of the usual outburst of seed, it simply comes out in waves, as a result the Venarian is locked into one long stretch of orgasmic high.");
		makius.orgasm();
		output("\n\nIt takes a lot longer than usual for him to be finished before he collapses nervelessly atop you. Somehow you manage to lessen his fall by holding onto his hands and slowly easing him in over you. Once he's in place, you gently fold your arms around him, pulling him into a loose but gentle embrace. You kiss him sweetly on the lips, and ask how they're both doing.");
		output("\n\nHe smiles at that, kissing you back weakly. \"Tired, but happy.\"");
		output("\n\nGood, you reply, stroking his belly with a free hand.");
		output("\n\n\"Hey, [pc.name]?\"");
		output("\n\nYou nod to show you're listening.");
		output("\n\n\"I know you are busy, but can we stay like this a while longer?\"");
		output("\n\nOf course.");
		output("\n\n\"Thanks.\"");
		output("\n\nHe nuzzles you affectionately, closing his eyes and nodding off for a short rest.");
		output("\n\nYou smile and nuzzle him back; he's just too cute for his own good. After that, you settle back and close your own eyes; you could use a rest yourself... besides, a pregnant man needs his sleep.");
		processTime(400);
		addButton(0, "Next", makiusLeave);
	}else if (flags["MAKI_STATE"]){
		output("Maki's muzzle widens in a grin, he pants happily as he throws himself down on his mattress, butt and tail high up in the air, ears flat on his skull. He spreads his buttcheeks apart and moans in wantom lust. He turns to look back at you and licks his lips. \"Don't make me wait, [pc.name].\"");
		output("\n\nYou smirk and reach down to pat his butt, squishing the plump cheeks between your fingers before moving your hand and extending your fingers to probe at his greedy asshole, sliding smoothly through the drooling orifice and into his back package, stroking and squeezing as best you can given the tightness with which he automatically grips you. Maki trembles as you insert your digit, aiding you by pulling your finger inside through his slick rosebud. His toes curl in pleasure, an obvious sign of how horny the Venarian really is.");
		output("\n\nYou can't resist a smirk as you ask if he likes that, stretching his tightly-clenching sphincter with a second finger and adding it as you wriggle around, worming your way towards his prostate.");
		output("\n\n\"Feels good,\" he whispers. \"But it's still not a cock! Fuck me [pc.name]!\" He begs, whimpering in frustration.");
		output("\n\nWhy be in such a hurry, you ask; he's clearly well and truly enjoying this... or is he going to lie and say that's not his cock throbbing every time you touch his prostrate, that it's not his musk you can smell as precum bubbles down his shaft and mingles with his natural anal lubricant, prodding his passage extra firmly for emphasis. The Venarian lets his tongue loll out, gasping and moaning at your ministrations, bucking back at your prodding fingers as his tail swings wildly above.");
		output("\n\n\"C-Cock, is better,\" he manages between moans.");
		output("\n\nWell, if that's the way he wants to play it... You remove your fingers from his butt with a wet pop. He moans, almost disappointed that your fingers have been pulled out of him.");
		output("\n\n\"Cock now?\" He asks, looking back at you through a haze of lust.");
		output("\n\nYou wave a finger at him in a chastising manner; if he wants your cock, first, he's got to put that sweet mouth of his to work and get it ready. You take a stance, hands on hips, so he can see your member and get a clear idea of what he needs to do. He looks to your [pc.cock " + cock + "] and then back at you, shaking his butt side to side as his tail drapes itself around you, tugging at you in a feeble attempt to get you to fuck him. You pull back to make it clear it's not working, and tell him that you'll fuck his ass once he's sucked you off a little, just to put you in the proper mood. Amusement colors your thoughts at seeing the normally so shy and proper doctor be such a horny buttslut.");
		output("\n\nMaki grunts in frustration, but spins around to face your [pc.cocks]. He licks his lips and watches your shaft bob before him with a barely repressed hunger; his earlier frustration forgotten for the moment. He wastes no time as he homes in on your [pc.cock " + biggest + "], kissing it, nuzzling it and licking it in reverence. You moan in pleasure at both your treatment and his willingness, your dick stiffening under his ministrations.");
		output("\n\nHe makes a detour to gently lay a couple gentle suckles to " + (pc.balls > 0?"your [pc.balls]":"on the [pc.sheath" + biggest + "]") + ", then gives you one long lick, all the way up to your tip where he lingers for a moment to tease you. You shiver and smile, encouraging him as your [pc.cock " + biggest + "] starts to leak precum. He leans in and gently gives your [pc.cockhead " + biggest + "] a suckling kiss, draining a bit of pre and smacking his lips with a smile at your taste.");
		output("\n\n\"Hmm... I love cock!\" He happily proclaims before opening his maw wide and taking in as much of your shaft as he can, sliding you into his throat effortlessly as he does so.");
		output("\n\nYour body shudders and you have to restrain yourself to keep from thrusting into his mouth to the hilt. Maki begins bobbing, swirling his tongue around your shaft in an effort to massage and taste you. He looks up at you, eyes shining with joy.");
		output("\n\nYou smile and stroke his ears affectionately, vocalising your pleasure at what he's doing and encouraging him to keep going. He grabs your hips, holding you in place so he can properly deepthroat you, using his own muscles to grant you in pleasure and pulling off only to catch his breath. You gasp and you grunt, feeling the warmth filling you, before you remember your plan and you stop Maki with your hands on his shoulders, pulling your cock wetly free of his mouth.");
		output("\n\nMaki looks up at you in confusion and slight disappointment. With a smile and a shake of your head, you remind him that the two of you are after his other hole. At hearing that he grins at you, tail waving in happiness as he begins turning around. You wait for him to be in position, tail up and drooling ass winking at you enticingly, before you pounce forward; your arms circle under his belly and, with a few tugs, you roll him over, spinning him around so he is belly-up on the bed and you can pin him down like that. The Venarian looks at you in confusion, wondering what you have in mind. You bend down and authoritatively seize the Venarian's lips in a passionate kiss, sliding your [pc.hips] so as to bring your now stiff dick rubbing eagerly against his wet, aching entrance. Maki hugs you, using his legs to hang on to you as he moans into the kiss, tail encircling you lovingly as he hugs you with his whole body.");
		output("\n\nYou fold yourself in your boytoy's full-body embrace, and, as best you can, you slide your shaft into the welcoming, eager embrace of his ass. At once the hot, tight, dripping wetness of his butt envelops your [pc.cock " + cock + "], squeezing you with a death-grip, eager to suck you down to the hilt and never let you go. You continue pushing as deeply as you can, tingles of pleasure coursing through your [pc.skinFurScales].");
		pc.cockChange();
		makius.buttChange(pc.cockVolume(cock));
		output("\n\nMaki breaks the kiss to nuzzle you, whimpering in delight at your intrusion, his own shaft throbbing in pleasure and leaking pre at your insertion. \"It's in [pc.name]. It's in, it's in, it's in!\" He looks at you, love and desire apparent in his happy gaze. \"Fill me with pups, [pc.name].\" He leans in to capture your lips back into kiss, grinding himself against you.");
		output("\n\nDeeper and deeper into his ass you slide, pleasure rippling through you as it flexes and shudders, greedily latching onto you and almost suckling you in its eagerness to have you inside of it. The wetness and contractions means the slang \"boypussy\" has never felt more accurate, but the tightness... no cunt could ever be this tight, or grip you so eagerly, you're sure of that!");
		output("\n\nThe Venarian's eyes are glazed over, overwhelmed with pleasure. He breaks the kiss and whimpers softly, each time you thrust into him he whimpers in delight, mouth agape and tongue lolling out. " + (makiusMasculine()?"You take hold of his flat chest, feeling it bare of any fat and with just a little bit of muscle, letting go of one pec":"You take hold of his breasts, squeezing them, feeling their weight squish and roll around under your fingers, letting go of one breast") + " only to capture his nipple between your [pc.lips], feeling the nub rolling as you assault it with tongue and the tips of your teeth. And all the while, you continue to thrust and hump against him, his ass eager to swallow you but reluctant to let you leave, wringing your cock in its readiness to milky you dry...");
		output("\n\n\"C-Close....\" he says airily, shuddering with the impact of your hips on his butt, legs tensing ever so slightly and cock twitching in preparation of what's to come. His ass forms a vacuum around your shaft, doubling the slippery moisture that suffuses his innards.");
		output("\n\nFeeling your own climax so close, you grab his legs and heave them up, bending him over so you can more fully pound his ass, thrusting as hard and as fast as you can into his vacuuming innards. Oh, so close now...");
		output("\n\nWith a gasp, Maki screams for you. \"[pc.name]! I'm cumming!!\" His shaft twitches once, twice and finally releases it's load onto the Venarian's own body. Painting his chest in his cum as he tries his best to buck against your thrusting hips despite his awkward position. His tight boypussy suckling on your [pc.cock " + cock + "] with abandon, truly milking you now. ");
		makius.loadInAss(pc);
		makius.orgasm();
		output("\n\nYou grunt and you moan, deep and low in your throat as the pleasure spirals to overwhelming heights. A few last thrusts and you cry out as you slam yourself home, cumming into his waiting ass with all the energy you can muster. Thick ropes of [pc.cum] begin gushing from your cock into his ass, filling him with your warm fluids");
		pc.orgasm();
		if (cumQ > 100) output((cumQ < 5000?"until his belly starts to visibly bulge from your deposit":"until he can't take any more and it begins flowing back out around the edges of your dick, painting you both with your fluids"));
		output(". You gasp as you finally finish cumming, letting Maki's legs down and pulling yourself wetly from his " + (cumQ > 5000?"asshole, [pc.cumNoun] squirting from it before he can clench it down to a trickle":"still-clenching butt") + ". Once Maki has flopped down onto the bed, you join him, sidling up to him from behind in a spooning position and draping your arms affectionately around him. He moans and pushes himself back against you, nestling on your arms and rubbing your sensitive [pc.cock " + cock + "] in the process. You shudder appreciatively, the stimulation coaxing one last burbling trickle of seed from your dick and running onto his fluffy butt. Maki's ears straighten up at this.");
		output("\n\nHe looks at you and then rolls around so he can face you. With a soft smile he adjusts the two of you, until he has his legs around and your [pc.cock " + cock + "] is resting snugly between his buttcheeks. he reaches down and adjusts you so he can reinsert you back into his moist, abused boypussy. You let him slide back in, enjoying the feeling of his warm, [pc.cum]-" + (cumQ > 5000?"flooded":"soaked") + " ass holding your dick so snugly.");
		output("\n\nHe nuzzles you affectionately before replying, \"I'm not done milking your seed.\"");
		output("\n\nYou can't resist teasing him for being so greedy.");
		output("\n\nHe looks a bit embarrassed for a moment before grinning back at you. \"I love you, and I'd loathe myself if I let even a drop of your precious seed go to waste, [pc.name].\"");
		output("\n\nYou simply hug him at that, unsure of what to say. He wiggles his hips, ass contracting around your half-erect prick and sucking you deeper inside. You murmur appreciatively, feeling yourself getting stiffer at the sensations.");
		output("\n\n\"Just make yourself comfortable and let me handle everything. And if you get hard again and feel like humping me some more, be my guest.\" He smiles warmly at you. \"You're not getting off this bed until you are completely dry.\" He nuzzles you once more.");
		output("\n\nWell, you can live with that, you tell him, holding him closer, grinding your dick deeper into his butt....");
		addButton(0, "Next", makiusSexPitchAnalBreeder, [cock, cumQ]);
	}else if (flags["MAKI_RELATIONSHIP_STATUS"] == 2){
		output("You close the distance between the two of you, wrapping his lips into a soft kiss. Maki whimpers into your kiss and opens his mouth, inviting you into his mouth with his own tongue. You take the invitation and the two of you stay locked in a passionate kiss.");
		output("\n\nYou feel a sinuous appendage coil itself around your midriff, warm and fuzzy. Maki's tail encircles you as he moves his hands to embrace you, though his eyes are closed you can feel his need for contact and are all too happy to comply.");
		output("\n\nEagerly you grind yourself against his body, feeling your [pc.nipples] growing erect at the friction, your [pc.cocks] rubbing against his own erect shaft and growing slick as his precum slathers your hot flesh. You set your hands on your lover's thighs, nudging them apart. Maki shows no resistance and allows you to pull him up and over your [pc.cock " + cock + "], thrusting yourself into the enticing cleavage of his ass.");
		output("\n\nMaki's eyes open in a gasp of surprise, though it only takes a moment before he closes his eyes once more. His lips curl into a smile and he grinds his ass against your cock, it's clear that he's as eager to receive as you are to give.");
		output("\n\nYou nuzzle your face against his, rubbing cheek to cheek, then steal a kiss from him; you know that gets him so turned on. You kiss his lips, then kiss your way down his neck, shifting him in your lap so you can more easily hotdog his pert butt... mmm, he's got a bitch's butt, just made for fucking, and you tell him just how wonderful you think his ass is.");
		output("\n\nMaki noses your neck, inhaling your scent. \"I'm glad you like my butt. But flattery will only get us so far, don't you agree?\"");
		output("\n\nYou nod absently to that.");
		output("\n\nHe leans in close to your ears, flickering his tongue to lick your jawline. \"I think you should know that my butt is ready for you. And so am I,\" he whispers into your [pc.ear].");
		output("\n\nWell, if that's the case.... You shift him around again and hoist his butt up from your lap, moving it so that it's positioned right over the tip of your [pc.cockNounComplex " + cock + "] and then slowly letting him fall onto it, spearing into his depths. His warmth slowly starts surrounding you. You take your time and enjoy your lover's embrace as he slides down your [pc.cock " + cock + "], his face is contorted into the cutest expression of pleasure, and you can't resist stealing a kiss as your [pc.hips] make contact with his fuzzy butt.");
		output("\n\nHe groans and you hold him there so he can start adjusting to you, caressing his mane and whispering little encouragements as you do so. Once you feel his rosebud starting to react to your presence, rippling around your dick as he rhythmically clenches himself, you smile at him and begin moving.");
		output("\n\nYou bump noses with him and throw him a tease about his eagerness.");
		output("\n\nHe pants, cock spurting ropes of pre down his shaft. Lust and love clear in his green eyes. \"O-Of course I'm eager for you. You are my mate, I'm always holding out for you.\"");
		output("\n\nReally? Why, you'd expect better of a doctor, you playfully cluck, letting him drop a little further. After all, he should know so that it's not good to let himself get so... pent up.... Again you let him sink down your shaft, spearing yourself into him.");
		pc.cockChange();
		makius.buttChange(pc.cockVolume(cock));
		output("\n\nHe moans, clenching his ass to hold onto your [pc.cock " + cock + "]. \"I know - ah! - I don't usually let myself get soOH! Pent up. I masturbate regularly! But nothing… hmm… beats being with you.\" He continues to moan in tune with your motions.");
		output("\n\nYou kiss him on the nose, appreciative of the flattery. Then you let him know that if he needs to get fucked, why, all he has to do is say so! And with that, you pull him down, pushing yourself to the hilt.");
		output("\n\nHe screams in joy, tail holding you tightly and legs wrapping around you. You moan as his tight pucker squeezes you, feeling the walls caressing you and massaging you. You squeeze his buttcheeks and massage his backside as you press your [pc.chest] to his own " + (makiusMasculine()?"flatness":"hefty pair") + ".");
		output("\n\nHe squeals in pleasure; eyes burning with his devotion, his love and his want. It's hard to resist replying in kind. He leans over; first licking your lips, then quickly enveloping them into a soft kiss. His tongue probes your lips for purchase, even as he moans and whimpers.");
		output("\n\nYou open your mouth and suck his tongue inside, tangling it as best you can with your own [pc.tongue], kissing him back and holding him close, letting him feel you wrapped around him, inside of him, bouncing him smoothly in your lap as his ass continues to milk you. Wetly you break the kiss, dreamily telling him that he's doing wonderfully at this.");
		output("\n\nHe looks away in clear embarrassment, though his smile tells you he's all too happy about the compliment. \"Thanks, I've had a lot of practice lately.\" He grins.");
		output("\n\nTime to put it to the test, you reply, and start going at it for real; up and down your hips thrust, drawing your shaft from Maki's rosebud and then slamming it home again, doing your best to drive " + (pc.hasKnot(cock)?"your knot past his tight asshole":"yourself " + (pc.balls > 0?"ball" + (pc.balls > 1?"s":"") + "-deep":"to the root of your dick")) + " with each impact, pushing yourself inexorably towards the delight of climax....");
		output("\n\nMaki lets his tongue loll out, doing nothing but grunt and moan at each thrust. His own Venarian shaft bouncing up and down with your thrusts, sprinkling his pre all over his " + makiusBellyDescriptor() + ". You grunt a warning for him to be ready, because... here it comes! With that you cry out" + (pc.hasKnot(cock)?", shove your [pc.knot " + cock + "] straight in":"") + " and empty yourself into his waiting belly, feeling his pucker milking you of every drop you have to give, your whole body quaking with the force of your climax.\n\n");
		if (cumQ < 100){
			output("Soon enough, though, you have emptied yourself utterly, with not a drop of [pc.cumNoun] left to give him, sighing loudly and wrapping your arms around him.");
		} else if (cumQ < 500){
			output("You pour your [pc.cum] into your oh-so-willing lover, feeling his belly bulging from your load. You flood him with your essence, his stomach beginning to bulge against your own [pc.belly], but Maki doesn't seem bothered by it in the slightest; even when you finally stop, leaving him visibly swollen with your deposit, his ass continues to milk your tired cock.");
		}else{
			output("\n\nIt's good for both of you that Maki's ass seems so eager to swallow every drop you have, because you have a lot of drops to give him - you can almost hear it gurgling as it surges inside him, a cascade of [pc.cum] from your hose of a dick. He cries out, wriggling and squirming in the most delicious of ways as you just keep pumping him fatter and fuller, his rounding stomach pressing forcefully against your [pc.belly] before you finally, mercifully, stop cumming.");
		}
		makius.loadInAss(pc);
		pc.orgasm();
		output("\n\nYou were so focused on your own orgasm, you didn't even notice Maki's own shaft, spurting ropey whiteness between the two of you. \"Sorry for the mess, \" he whispers weakly, still breathing heavily.");
		makius.orgasm();
		output("\n\nYou tell him it's alright; after all, it wasn't as if you didn't have fun making it - besides, you left him quite messy too, you point out, batting his " + (cumQ > 500?"swollen ":"") + "stomach.");
		output("\n\nHe smiles. \"I'm glad, though you should let me help you clean up. Can you help me off you? As much as I like having you inside, I can't get to the important parts like this.\" He grins bashfully.");
		output("\n\nYou nod your head and put your tired muscles to work helping to prise him free of your " + (pc.hasKnot(cock)?"[pc.knot " + cock + "]":"[pc.cock " + cock + "]") + ". It's not easy, his butt doesn't seem too eager to let you go, but finally you manage to pop free, letting a " + (cumQ < 100?"trickle":(cumQ < 500?"flow":(cumQ < 5000?"cascade":"deluge"))) + " of your semen run freely from his ass. He moans and stumbles away, falling on his back. You ask him if he's alright.");
		output("\n\nHe laughs in embarrassment. \"I'm fine, it's just that my hips are numb….\"");
		output("\n\nYou smile and pat him affectionately, running your hand playfully over his " + (makiusMasculine()?"boyish":"curvy") + " hips as you do so.");
		output("\n\nOnce Maki's picked himself up, he crawls over to you, smiling all the while. You see what he has in mind and position yourself so he can get at you more easily. He begins eagerly lapping at the mess he's made. You try to keep still as his tongue caress your sensitive skin, feeling a flush of pleasure blooming within you. Once he's done with your [pc.belly], he moves to your cock" + (pc.cockTotal() > 1?"s":"") + ", happily lapping at " + (pc.cockTotal() == 1?"it.":"your [pc.cock " + cock + "]."));
		output("\n\nYou can't hold back a moan at your lover's attentions to your still-tingling cock, feeling it starting to grow harder in response. As he laps and licks, all but suckling at you, you can't resist asking him if he needs another fix of you? Didn't he just get enough dick up his ass, he wants more now?");
		output("\n\nHe stops his licking, moving a hand to gently stroke your shaft as he grins mischievously at you. \"There's never enough [pc.name] for me.\"");
		output("\n\nYou give the matter some thought, telling him it's tempting, but... alas, duty calls; you'll just have to book another session with him when you're available.");
		output("\n\n\"Awww….\" He crawls up to you to give you an affectionate lick on the cheek. \"I'll wait for you then.\" He smiles.");
		addButton(0, "Leave", makiusLeave);
	}else{
		output("\"You want to penetrate me?\"");
		output("\n\nYou nod.");
		output("\n\nHe smiles nervously. \"Okay, but be gentle, please.\"");
		output("\n\nYou promise you will.");
		output("\n\nThe Venarian is a bit hesitant, so you decide to wrap him into a soft hug, patting his back. Maki whimpers and returns your hug. You just enjoy the feel of his fur against your " + (pc.skinType == GLOBAL.SKIN_TYPE_SKIN?"naked skin":(pc.hasFur()?"own fur":[pc.skinFurScales])) + ", caressing his back as you move lower and lower. Maki displays no reaction, but you have no doubt that if you could see his face, he'd be sporting a relaxed smile. Eventually you reach his butt, gripping them. At this Maki gasps, surprised at your sudden groping. You can feel his hardness press against you. The Venarian licks your collarbone.");
		output("\n\n\"I'm ready.\"");
		output("\n\nYou reach around with one finger and begin probing firmly but gently at his asshole. Your finger slides inside without much resistance, the alien's anal ring clamping tightly around the intruding digit. As he shivers in your grip, you begin leading him over towards his bed, sliding your finger free and stealing a kiss on the cheek as you instruct him to kneel on his bed. Maki's eyes are glazed with lust, his breathing worked, his Venarian shaft erect and throbbing. He nods lightly at your command and spins around, his tail caressing your side as he gets on his bed, kneeling like you ordered him to. You slide yourself up behind him, reaching out to caress his succulent rump, covered in soft, downy fur that you run your fingers through, stroking the very base of his tail.");
		output("\n\n\"Ohm, that feels nice,\" he says, coiling his tail around your midriff.");
		output("\n\nYou lean over his form and reach over to his dick, closing your fingers around its soft texture, feeling the surprisingly human-like shape of it in your hand, and beginning to stroke it with slow, rhythmic strokes. The Venarian gasps as you grasp his " + (makiusMasculine()?"large":"moderately-sized") + " shaft, his hips moving on its own to hump your hand as pre starts gathering on his tip and slowly sliding down his cock. You can feel the warm, slick substance as it oozes over your fingers, pooling in your hand, its consistency thicker than human pre. In fact, you know just what it would be perfect for...");
		output("\n\nYou continue to stroke him with your hand, getting your hand nice and coated in Venarian precum, then trade hands, using your clean hand to continue stroking him off while the slick digits of your other hand begin massaging his juices into his own asshole. You roll the base of your palm against his puckered ring, firmly yet not so hard as to hurt him, fingers squeezing inside to rub a thorough coating of Maki's natural lubricant inside and out. Maki moans each time your digits slip in, the extra stimulation making him leak even more of his slick pre.");
		output("\n\n\"[pc.name]!\" He calls out to you, desire apparent in his voice as he lifts his butt a bit higher, giving you better access. You cease your stroking and massaging, shifting closer that you might run your [pc.cock " + cock + "] through the cleft of his asscheeks, grinding it teasingly against his now-slick pucker to see how he will react. Maki presses back against you, moaning. \"Come on, [pc.name]. Don't tease me! Can't you see how much I want you?\" He whimpers.");
		output("\n\nWell, since he's that eager, you reply, and back up your words by aligning your [pc.cockhead " + cock + "] with his entrance and starting to push inside. There is only a token resistance to your intrusion, though the rings of his ass are still so very tight, squeezing and constricting you even as you push into his soft, warm, almost inviting depths. Once you begin feeding yourself into him, you progress much quicker and with greater smoothness, his ass swallowing you to the hilt, aided by Maki's excited state - he pushes back against you eagerly, practically bucking his " + (makiusMasculine()?"boyish":"curvy") + " hips to help force you inside of him.");
		pc.cockChange();
		makius.buttChange(pc.cockVolume(cock));
		output("\n\nHe looks back at you with a silly smile. \"So full... fuck me, please...\" he whispers.");
		output("\n\nYou take hold of him by the hips with one hand, the other holding the base of his tail for support, and you start to hump his ass as he pleads for you to do, pulling yourself almost out of him and then thrusting back inside, slowly at first, so he can match your rhythm. His tail flexes, pulling you against him forcibly as he humps back, your hips collide with a smack and the Venarian moans. His knees buckle in pleasure, his arms give out and he falls face-first onto his bedding. He turns to the side and look back at you, silly smile still plastered on face, his tongue lolling out as he reaches for his shaft with one hand.");
		output("\n\nYou decide to let him have his fun, concentrating on picking up the pace of your thrusts, trying to restrain the moans attempting to force their way out of your throat as his tight ass works to milk your dick dry. You begin leaning yourself over, wrapping your arms around your alien lover in a loose hug, one hand teasingly stroking the soft fur on his chest, the other ruffling his mane. His ears twitch in the most amusing fashion as you do, and you can't resist giving one of them a playful kiss, rubbing your [pc.breasts] and [pc.belly] against him as you do.");
		output("\n\nMaki whimpers and arches his back in an attempt to touch more of you. \"[pc.name], you are so warm,\" he says airily.");
		output("\n\nYou smirk and caress his " + (makiusMasculine()?"chest":"boobs") + " a few times more before suddenly slapping his butt with your other hand, picking up the pace yet again, thrusting harder and rougher than you have before now.");
		output("\n\n\"Yes! Yes! Fuck me more. Oh, this feels so good. I-I don't think I can last much longer, [pc.name]. I'm… I'm gonna cum!\" He barely finishes uttering the last word as he suddenly arches his back and moans throatily. His ass contracts, trapping you in place as his member twitches and begins painting Maki's bed with the Venarian's cum. He comes without stopping for a short while, until with one last tremble, he collapses. Relaxing his muscles and allowing you to move once more. \"[pc.name]. Y-You haven't cum yet. Use me. Fill me up. I want to feel you paint my insides with your hot seed.\" He averts his gaze in shame at what he just said, but you can tell he was earnest in his request.");
		output("\n\nYou grunt and you moan, deep and low in your throat as his ass tightens so hard on your cock, the walls milking you of everything you have. A few last thrusts and you cry out as you slam yourself home, cumming into his waiting ass with all the energy you can muster. Thick ropes of [pc.cum] begin gushing from your [pc.cock " + cock + "] into his ass, filling him with your warm fluids");
		if (cumQ > 100){
			output((cumQ < 500?"until his belly starts to visibly bulge from your deposit":"he can't take any more and it begins flowing back out around the edges of your dick, painting you both with your fluids"));
		}
		makius.loadInAss(pc);
		pc.orgasm();
		makius.orgasm();
		output(".\n\nYou sigh as the waves of pleasure flow through you, leaving you limp and sated. " + (pc.hasKnot(cock)?"You're firmly knotted inside Maki's butt":"You slickly pull your shaft from Maki's butt") + " and allow yourself to rest against him, the two of you sinking down onto the sheets in mutual bliss. You wrap yourself against your alien lover, snuggling up to his soft, downy form, and lazily wrap your arms around his waist, fingers idly tickling his " + makiusBellyDescriptor() + ". " + (pc.hasKnot(cock)?"Eventually, you manage to tug your [pc.knot " + cock + "] out and h":"H") + "e turns around, facing you and nuzzling you in affection.");
		output("\n\nYou plant a playful kiss on the tip of his nose and ask if he enjoyed himself, smirking as you do so.");
		output("\n\n\"Very much,\" he replies happily, rubbing his nose where you kissed him. You rest your head against him and enjoy the feeling of his warm fluffiness against you for a few minutes longer.");
		output("\n\nThen, reluctantly, you tell him that you need to go; captain's work is never done, after all. His ears fall flat against his skull and he looks a bit saddened at having to let you.");
		output("\n\n\"I understand. But please come see me again soon?\"");
		output("\n\nYou give him a squeeze and suggest you'll try to do so. He hugs you one last time before sending you off.");
		if(makiusHasMedlab())output("\n\n\"I'm just going to clean up and get back to my post at the medlab.\"\n\nYou note that sounds like a good idea, then get your own gear back together before leaving.");
		addButton(0, "Leave", makiusLeave);
	}
}

public function makiusSexPitchAnalVirginOkay():void{
	clearMenu();
	clearOutput();
	showBust(makiusBust(2));
	processTime(5);
	author("LukaDoc");
	output("You promise him that you will let him penetrate you.");
	output("\n\n\"Thanks. Can we cuddle now?\"");
	output("\n\nYou don't see any reason not to, and gently snuggle up against him. Sleep comes easily....");
	addButton(0, "Next", makiusSexPitchAnalVirginEnd);
}

public function makiusSexPitchAnalVirginTease():void{
	clearMenu();
	clearOutput();
	showBust(makiusBust(2));
	processTime(5);
	author("LukaDoc");
	output("You tell him that you'll consider doing that... if he's a good boy and especially if he takes it up the ass when you want to dish it out that way..");
	output("\n\n\"No objections, specially if it feels as good as it felt this time.\" He stretched himself and turns around to face you with a lazy smile. Then he opens his arms invitingly. You slide into his arms and allow him to cuddle you, then close your eyes....");
	addButton(0, "Next", makiusSexPitchAnalVirginEnd);
}

public function makiusSexPitchAnalVirginNoWay():void{
	clearMenu();
	clearOutput();
	showBust(makiusBust(2));
	processTime(5);
	author("LukaDoc");
	output("You tell him that's no deal; you intend to fuck his ass just like the anal-loving little bitch boy he is.");
	output("\n\n\"Heh, somehow I don't find this idea too bad.\"");
	output("\n\nOf course he doesn't, he's your Venarian boy-toy after all. You stroke his mane. He whimpers in delight.");
	output("\n\n\"Cuddle me now?\"");
	output("\n\nDeciding to humor him, you allow him to cuddle you and then close your eyes, eager to get some rest.");
	addButton(0, "Next", makiusSexPitchAnalVirginEnd);
}

public function makiusSexPitchAnalVirginEnd():void{
	clearMenu();
	clearOutput();
	showBust(makiusBust(2));
	processTime(420);
	author("LukaDoc");
	output("When consciousness returns, you are wrapped up in Venarian limbs. Maki holds you almost possessively. \"Hmm... [pc.name].\" He nuzzles you affectionately. You gently pat his cheek, rousing him to wakefulness. He reluctantly disentangles himself, allowing you to finally stand and stretch the kinks out of your muscles. \"I think I'm going to rest a while longer.\"");
	output("\n\nYou tell him you understand" + (pc.isNude()?"":", then quietly gather your clothes, pull them back on") + " and head for the door.");
	output("\n\n\"Looking forward to next time.\" He smiles and waves you away, settling down to rest some more.");
	addButton(0, "Next", makiusLeave);
}

public function makiusSexPitchAnalBreeder(vars:Array):void{
	clearMenu();
	clearOutput();
	showBust(makiusBust(2));
	processTime(30);
	var cock:int = vars[0];
	var cumQ:int = vars[1];
	author("LukaDoc");
	output("You cry out, arching your back as the last few ropes of jism spurt from your shaft into Maki's sopping wet depths, feeling it clench around your " + (pc.hasKnot(cock)?"[pc.knot " + cock + "]":"[pc.cock " + cock + "]") + " as your body wrings itself dry. It takes all you have to keep from collapsing bonelessly atop Maki's back, and you still nearly crash as you sink back down, weakly cuddling him as you tell him that you're positive you don't have a drop left to give him, now.");
	output("\n\n\"Are you sure? I'm sure I still have room for more in here.\" He pats his " + (cumQ < 100?"still flat":(cumQ < 500?"full":"bulging")) + " belly.");
	output("\n\nYou shake your head, insisting that you have nothing left." + (cumQ > 500?" Besides, if he gets any fuller, he's not going to be able to get out of bed.\n\n\"That's not a problem. I'll just have to rely on you for food and drink. Oh, and while you are at it, if you are feeling a bit pent up we could... you know.\"":""));
	output("He chuckles.\n\n\He is just insatiable today, isn't he?");
	output("\n\n\"You are just so busy sometimes. And I get so lonely. Can you blame me for wanting to make the most of our time together?\"");
	output("\n\nWell, not really... so, is he feeling any better now? \"Happy, satisfied and full of your love.\" He pats his belly once more.");
	output("\n\nYou nod your head and " + (pc.hasKnot(cock)?"tug your [pc.knot " + cock + "]":"pull") + " free of his now-loosened pucker, telling him that if that's the case, it's time for you to leave.");
	output("\n\nMaki whimpers in disappoint as you pull out of his, now loose, pucker. \"It feels so empty without you.\" He pouts as he looks at you, giving you his best version of puppy eyes.");
	output("\n\nYou remind him that as captain, you can't stay with him all day.");
	output("\n\n\"I know that....\" He sighs and then grins at you. \"Guess I'll have to settle for this for now.\" He rolls around to look at you and pats his belly, bloated with the results of your lovemaking. \"Don't stress yourself out with your duties, and please come visit me whenever you want.\" He grins once more. \"Specially if you need to get rid of your stress.\"");
	output("\n\nYou promise you'll remember that, even as you dress yourself and leave.");
	addButton(0, "Next", makiusLeave);
}

public function makiusSexPitchOral():void{
	clearMenu();
	clearOutput();
	showBust(makiusBust(2));
	processTime(10);
	author("LukaDoc");
	var cock:int = pc.cocks.length * Math.random();
	
	if (flags["MAKI_STATE"] == 2){
		output("He licks his lips enticingly. \"I was getting a craving for something filling and nutritious, and I guess your seed is as good as it gets, my mate.\" He giggles getting up and nuzzling into you affectionately.");
		output("\n\nYou smile and hug him close, stroking the bulge of your growing child where it sits in his belly. Wrapped in your arms, he is easily led over towards his bed, where you kiss him softly and then separate. You help him kneel on the floor before you, which is trickier than it sounds, with his gravid state.");
		output("\n\nHe admires your [pc.cocks]" + (pc.cockTotal() > 1?", browsing which one he should pick this time. \"I think I want this one this time,\" he says, grasping your [pc.cock " + cock + "] with a smile./.":"\"Looks like I don't have much to choose from, but this one will be perfect,\" he says, grabbing your [pc.cock " + cock + "] and smiling at you."));
		output("\n\nYou smile and pat his head; whatever the baby-daddy wants, that's what he gets; he's got a little life inside of him to feed as well, after all.");
		output("\n\n\"That I do.\" He nuzzles your hand lovingly. \"Sorry, but I'm going to keep foreplay to a minimum today, [pc.name]. I'm hungry and you're probably wanting to get rid of all the tension here.\" He fondles your " + (pc.balls > 0?"[pc.balls " + cock + "]":(pc.cocks[cock].hasFlag("Sheathed")?"[pc.sheath " + cock + "]":"perineum")) + ".");
		output("\n\nYou simply chuckle and nod, giving him the go ahead.");
		output("\n\nMaki starts off with a lick, from base to tip, before eagerly engulfing your shaft. He takes a couple experimental licks on your [pc.cockhead " + cock + "] before softly nodding to himself and inching his way down towards your crotch.");
		output("\n\nYou moan softly as his warm, wet tongue caresses your sensitive skin, shaft alight with sparks of pleasure as he starts to swallow it. You can't resist reaching down and scratching him behind his ears, like a puppy who's just performed a trick.");
		output("\n\nHe whimpers in delight and takes in more and more of your shaft, adjusting himself so he can deepthroat you. He holds you inside for only the briefest of moments, before starting to bob on your lap, tongue wrapping around your shaft to jerk you from within his mouth.");
		output("\n\nYou gasp and groan; he must be starving, you manage to blurt out - he's not normally this - ooh! - this enthusiastic....");
		output("\n\nHe looks up at you, green eyes full of mischief and lust, happy to be pleasuring you so. Intent on getting you to unload as soon as possible, he wraps his tongue around you tighter and quickens his pace.");
		output("\n\nUnder his onslaught, it's all you can do to keep yourself from popping your load right there and then; it seems like he knows every spot to lick, kiss and suck in order to bring you maximum pleasure... oh, gods, you can't hold out against this much longer, and you dreamily admit this fact to him, in between moaning like a whore... so good; so, sooo good....");
		output("\n\nHe smiles around your cock, determine look in his eyes. He pulls back all the way to your [pc.cockhead " + cock + "] and then push himself down, swallowing you whole and holding you within his throat. His throat muscles contract as he swallows, effectively milking you whilst his tongue and lips busy themselves with the rest.");
		output("\n\nYour resistance crumbles before the tide and you throw your head back, crying out as you climax under your pregnant boytoy's ministrations, flooding his mouth with your seed.\n\n");
		if (pc.cumQ() < 100){
			output("Maki swallows down your load without hesitation, suckling away with greedy eagerness until you've spent the last of your [pc.cumFlavor] load.");
		}else if (pc.cumQ() < 500){
			output("Maki's cheeks bulge with the volume of your shots, but he gulps it all down with the ease of the hungry, swallowing mouthful after mouthful until his already bloated belly bulges from the amount of [pc.cumNoun] you've fed him.");
		}else if (pc.cumQ() < 5000){
			output("Maki swallows desperately, trying to avoid spilling too much of your [pc.cumNoun] as you unleash your inhuman virility into his waiting mouth. He gurgles wetly as he gulps it down, refusing to be beaten even as you start to stretch his already generous waistline out inch after bloated inch. By the time you finally stop, he looks twice as pregnant as he did before, at the very least.");
		}else{
			output("Even as cum-thirsty as he is, Maki's more than met his match. Despite his best efforts, rivulets of seed spurt out around your [pc.cock " + cock + "] as the pressure squeezes past his lips, sending streams of [pc.cumColor] running down his chin to drip onto his expanding gut. Nonetheless, the bulk of it still goes into him, inflating the pregnant Venarian like a balloon until his old belly is swallowed by the cum-distended mass of his new belly, making him look almost too pregnant to walk.");
		}
		pc.orgasm();
		output("\n\nThe Venarian doctor pulls away from you, a thin string of cum connecting your [pc.cock " + cock + "] to his lips. He closes his eyes and takes a moment to relish in your taste before he opens them and notices the string. Quickly he leans in and licks your tip clean. You moan, shivering at the touch of his tongue on your sensitive shaft.");
		output("\n\nSatisfied with his work he takes a deep breath. \"Ah… thanks [pc.name]. That really hit the spot,\" he says with a smile, then he chuckles. \"Sorry, my cravings can be a bit crazy.\"");
		output("\n\nYou take a moment to catch your breath, before you chuckle yourself. You'd never expect the doctor's cravings to take this form? But you're certainly not complaining, you add. He grins nervously, obviously flustered.");
		if (flags["MAKI_PREG_GAVE_BLOWJOB"]){
			output("\n\nYou can't resist commenting that, even though you should know better, he still surprises you every time. Who knew that being pregnant was all it took to turn your shy little puppy of a doctor into a cocksucking maestro?");
			output("\n\nHe grins happily. \"Hehe, thanks [pc.name]. I… was really hungry. And I have been practicing too… for you.\"");
			output("\n\nPracticing, huh? And just how has he been doing that? He's a bit too round about the middle these days to be sucking himself.... You know the answer, of course, but he's just too much fun to tease.");
		}else{
			output("\n\nWho would have expected your little Maki to be such a good cocksucker? You can't believe he was able to bring you to climax so quickly - his tongue is just incredible.");
			output("\n\nHe smiles happily at the compliment. \"Thank you, [pc.name]! I'm glad you enjoyed yourself. I've been practicing.\"");
			output("\n\nPracticing, huh? And just how has he been doing that? He's a bit too round about the middle these days to be sucking himself....");
		}
		output("\n\nHe bites his lips, looking away in embarrassment. \"I've been using a… dildo.\" He closes his eyes and you're pretty sure his cheeks are burning red, even though you can't see them so well with his fur.");
		output("\n\nHe's been practicing by fellating a dildo? Why, you didn't know that pleasuring you was so important to him, you tease. Not that you're going to complain about your sexy pregnant " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"boy":"") + "friend working so hard for you... why, you think he deserves a reward....");
		output("\n\n\"A reward!?\" He exclaims happily, tail standing straight up in behind him in his excitement.");
		output("\n\nYou reach out and lift his chin gently with your fingers, staring into his eyes with a sultry look before bending in and kissing him gently, but insistently; ravenously you devour his lips, your [pc.tongue] probing for entrance.");
		output("\n\nHe grants you entry without a second thought. Eyes closed, he extends his own tongue to invite yours in.");
		output("\n\nIn it slides, reaching as far into his mouth as you desire, caressing his unresisting tongue and dominating it, holding him prisoner to your lusts. Wetly you release his lips, a glistening string of saliva linking your tongues for a moment as you break away. With a husky purr of pleasure, you ask how he liked his reward...?");
		output("\n\nHe hugs your midriff, nuzzling into your [pc.belly] as he coos in delight. \"I love you, [pc.name].\"");
		output("\n\nAnd you love him, too, you reply, hugging him back.");
		output("\n\nYou enjoy each other's warmth for a moment longer before Maki lets you go. He looks up at you with happy, gleaming eyes. \"Now that you took care of my craving, would you like a more thorough blowjob now?\"");
		flags["MAKI_PREG_GAVE_BLOWJOB"] = true
		
		var autoSpent:Boolean = true
		if (pc.lust() > 35 || pc.libido() > 50 || pc.hasPerk("Amazonian Endurance")){
			addButton(0, "Go Again", makiusSexPitchOralPregGoAgain, cock);
			autoSpent = false;
		}else{
			addDisabledButton(0, "Go Again", "Go Again", "You're not horny enough to keep going.");
		}
		if (pc.balls > 0){
			if(pc.ballEfficiency >= 2 && pc.cumQ() > 100){
				addButton(1, "My Balls", makiusSexPitchOralPregBalls, cock, "My Balls", "Ask Maki to give your balls some attention first.");
				autoSpent = false;
			}else{
				addDisabledButton(1, "My Balls", "My Balls", "Your balls are too spent for another round.");
			}
		}else{
			addDisabledButton(1, "My Balls", "My Balls", "You don't have any balls to give attention to.");
		}
		
		if (autoSpent){
			makiusSexPitchOralPregSpent();
		}else{
			addButton(2, "Spent", makiusSexPitchOralPregSpentClear);
		}
		
	}else if (flags["MAKI_STATE"]){
		//using biggest dick because throat doesn't have a ThatFits()
		output("\"You sure you'd rather have me blow you instead of using my other entrance?\" He teases, licking his lips and moving closer to you, bending over and lifting his tail to give you a clear view of his moist boy-pussy. He smirks enticingly at you as he inserts a finger inside with a wet schluck. His mouth opens into a perfect O, tongue darting out to lick his lips.");
		output("\n\nYou reach out with your hands to caress the lips of your Venarian buttslut's wet hole, rubbing soft circles around its circumference. Maki moans softly, and you close the distance between you, rubbing your [pc.cockBiggest] against his rosebud, grinding it through the canyon of his delicious ass, leaning over his shoulder and pulling him into a deep kiss, your [pc.tongue] pushing into his mouth. He closes his eyes, kissing you back through muffled moans as he grinds back, intent on taking right then and there.");
		output("\n\nWetly you break the kiss, and give him a firm but gentle push, nudging him meaningfully towards the bed. He puts up only a token effort, panting in lust as you lead him over. \"Ah, yes… I love you [pc.name].\"");
		output("\n\nAnd you love him too, you reply, even as you push him over to the bed. You spin him onto his back and climb over him, straddling his waist so you can, with a thrust of your [pc.hips], glide your cock through " + (makiusMasculine()?"the tiny mounds of his barely visible chest":"the canyon of his cleavage") + " to push against his mouth. With a smile, you tell him that while his boy-cunt is hot and wet and tight, just like you like it, you know his mouth will be just as good - even better, if he's willing to put that tongue of his to work for you....");
		output("\n\nHe goes cross-eyed as he looks at your [pc.cockheadBiggest]. \"You really want me to blow you, don't you?\" He asks rhetorically, as his tongue extends out of his mouth to flick against your tip.");
		output("\n\nYou gasp softly, a shiver of pleasure rippling across your skin.");
		output("\n\nHe smiles at you. \"Tasty. I supposed I am a bit hungry after all….\" he trails off, looking away for an instant before turning back and smiling at you. \"Feed me then, my mate.\" He opens wide, extending his tongue like a carpet, welcoming your [pc.cockBiggest] into his maw.");
		output("\n\nYou simply shake your head. First, you want to have a little fun with Maki's body... and with that, you slide your hips back, dragging your shaft back through his " + (makiusMasculine()?"flat pecs, reaching down with your hands to caress them. Your thumbs rub the nipples in circling motions as you massage them, pushing your dick back up through the velvety, fur-covered softness of his tiny cleavage.":"squeezable boy-boobs, reaching down with your hands to cup them. Your thumbs rub the nipples in circling motions as you squeeze the breasts together, pushing your dick back up through the velvety, fur-covered softness of his cleavage."));
		output("\n\nHe moans like a slut, thoroughly enjoying the treatment. \"I take it you like my " + (makiusMasculine()?"chest":"breasts") + "?\"");
		output("\n\nYou nod.");
		output("\n\n\"Good, because I love feeling your hot shaft " + (makiusMasculine()?"on it":"between them") + "… hmm… I… I'm not being too much of a slut for your tastes, am I [pc.name]?\" He asks, concern visible in his expression.");
		addButton(0, "No", makiusSexPitchOralBreederNo);
		addButton(1, "NotEnough", makiusSexPitchOralBreederNotEnough);
		addButton(2, "Yes", makiusSexPitchOralBreederYes);
	}else{
		output("\"Oh… I was wondering when I'd get " + (flags["MAKI_GIVEN_BLOWJOB"]?"another":"a") + " taste of you.\" He smiles ear to ear, tail wagging happily behind as he approaches you and takes your hand. \"I will gladly pleasure you with my mouth.");
		output("\n\nYou smile back at him, squeezing his fingers gently, and allow him to lead you over to his bed, making yourself comfortable upon its edge before you " + (pc.isNaga()?"":"spread your [pc.thighs] and ") + "reveal your [pc.multiCocks] to him.");
		if (pc.cockTotal() > 1){
			output("\n\nMaki examines your [pc.cocks] looking each in turn. He closes his eyes and sniffs the air, allowing his not to lead him and stopping only when he feels it bop against your [pc.cock " + cock + "]. He opens his eyes with a smile and licks his lips. \"I want this one.\"");
			output("\n\nYou reach out and stroke his ears, letting him know you approve of his choice.");
		}
		output("\n\nHe grabs your shaft almost reverently, stroking the length of your [pc.cock " + cock + "] slowly. \"Your heart is beating fast,\" he idly comments.");
		output("\n\nHis would be too, in your position, you reply.");
		output("\n\nHe chuckles and smiles up at you. Ears twitching in mirth. \"Of course, but thankfully I know just how to treat this.\"");
		output("\n\nHe lets his tongue poke out of his lips, gently pressing it against your [pc.cockhead " + cock + "]. He swirls it around, massaging your tip with slow circular movements.");
		output("\n\nYou groan appreciatively, feeling the sensations tingling across your sensitive cock-flesh, rewarding his efforts with precum.");
		output("\n\nHe eagerly laps up your pre, whimpering in enjoyment at the taste. No longer able to hold back, Maki opens his mouth and promptly glomps as much of your shaft as he can. He holds you inside, moving his tongue to massage your underside, his nose taking in all of your musk as he revels in your " + (pc.isMasculine()?"masculine ":"") + "aroma.");
		output("\n\nYou moan in pleasure as his warm, wet mouth surrounds you, sparks tingling as his tongue laps at your shaft's underside. You reach down and scratch the base of his ears, praising him for his... mmm... delectable enthusiasm.");
		output("\n\nHe leans against your scratching hand, eyes closed in delight as he sucks more of you inside, inching his way towards your crotch.");
		output("\n\nYes, yes, that's the way, you gasp to him, your nerves afire with the pleasure he is bringing you. You mindlessly thrust your hips forward, burning with the need for him to take as much of you as you can fit into his hot mouth.");
		output("\n\nHe finally stops when his " + (pc.balls > 0?"chin nestles against your [pc.balls]":"nose bops on your crotch") + ". You can feel his breathing, worked with arousal, his lips slowly nibbling on your [pc.cock " + cock + "] as his throat massages your length. He holds you in this position as he sucks, slurping noises filling the air around you.");
		output("\n\nYou moan like a whore as he works your shaft, unable to resist a mindless comment of just how good he is at this - why, you'd almost think he'd had training for it or something.");
		output("\n\nIf he registers your comment he doesn't pay it any mind and just focuses on you and your twitching shaft. Slowly he retracts, focusing his attention on your swollen glands. He lathers it with his saliva, kissing it like he would kiss a lover, lapping up all the beads of pre that form. Once he has toyed with your [pc.cockhead] enough, his lips form a tight seal and he begins sucking on you, like a straw, trying his best to drain you of your precious seed.");
		output("\n\nYou shudder and gasp and moan, your mind almost total mush by this point; you feel so good, so damn good... you're going to cum, oh, you're going to cum!");
		output("\n\nHis eyes open wide and he releases you. You groan deep and long, shivering as the cold air hits your sensitive cock. \"What!? Already?\"");
		output("\n\nYou don't even have time to nod your head, instead answering him in the most appropriately dramatic fashion - by cumming right there and then, spurting your seed right at Maki's face.\n\n");
		if (pc.cumQ() < 100){
			output("Strings of [pc.cumNoun] spray across his face, forming perverse necklaces of shimmering [pc.cumColor] against his fur.");
		}else if (pc.cumQ() < 500){
			output("A great surge of [pc.cumNoun] washes over the Venarian's face, plastering it with a visible coating of [pc.cumColor] semen and matting his mane with it.");
		}else if (pc.cumQ() < 5000){
			output("Your huge climax gushes across Maki's face, forcing him to close his eyes as you drench his features in your [pc.cumNoun] seed, painting his face with a thick layer of [pc.cumColor] goo that drips from his mane and oozes down his chest and upper back.");
		}else{
			output("A veritable tidal wave of semen erupts from your shaft" + (pc.cockTotal() > 1?"s":"") + ", washing over your lover's body in great, gluggy gushes that absolutely plaster him with [pc.cumNoun], caking his whole body with your fluids and leaving him a dripping, soggy mess, colored [pc.cumColor] from head to toe.");
		}
		pc.orgasm();
		output("\n\nMaki wipes his face, just removing the excess from around his eyes, and blinks in stunned surprise.");
		output("\n\nWith a sigh of relief, panting slightly for breath, you ask if that answers his question, unable to resist a grin curling your lips.");
		output("\n\nHe looks a bit disappointed. \"I guess it does….\" He wipes a strand from his muzzle and suck his finger clean, appreciating what little of your seed he actually got to taste.");
		output("\n\nWell, if he had kept his mouth around your dick, where it belonged, he'd have gotten a proper bellyful of cum instead of a facial, you teasingly chide him.");
		output("\n\n\"I should probably go shower,\" he announces, getting up on his feet and heading off towards his bathroom.");
		output("\n\nYou push yourself to your feet and close the distance between the two of you, taking him by an elbow and gently turning him to face you. What's wrong? Why does he seem to be so upset?");
		output("\n\nHe takes a deep breath. \"I wanted to suck you more.\"");
		output("\n\nSuck me more? Whatever for? He made you cum, after all - and so quickly, too, you add, trying to cheer him up.");
		output("\n\nHis expression brightens a little. \"Yeah, I suppose I did. But I still haven't tasted enough of you….\"");
		output("\n\nYou take his face gently, a hand on either cheek, and make him look into your eyes before you gently kiss him, hungrily consuming his lips with your own, thrusting your [pc.tongue] into his surprise-opened mouth and trying to dominate his tongue. You kiss until your mutual need for air forces the two of you to separate. Smiling coyly at him, you ask if that helped.");
		output("\n\nHe smiles back, visibly happier now. \"Yeah, thanks [pc.name].\"");
		output("\n\nThat's better; it's not fair he should be disappointed after sucking you off so well... speaking of, where did he learn to suck cock like that, anyway?");
		output("\n\nHe grins nervously, averting his gaze for an instant. \"Well… hehe… to be honest we train how to drain fluids from our patients in med school. I just thought the concept would apply here too, with a some adapting.\"");
		output("\n\n...School must have been <b>very</b> interesting, that's all you can say.");
		output("\n\nHe just fidgets a bit in embarrassment. \"Anyway, I should probably go shower. I can already feel your [pc.cumNoun] starting to dry on my fur. Join me?\" He smiles hopefully at you.");
		output("\n\nHmm... why not?");
		output("\n\nHe takes hold of your hand and saunters off towards the bathroom, carrying you in tow.");
		//this seems to imply the shower sex scene?
		addButton(0, "Next", makiusLeave);
	}
	flags["MAKI_GAVE_BLOWJOB"] = true;
}

public function makiusSexPitchOralPregGoAgain(cock:int):void{
	clearMenu();
	clearOutput();
	output("You smile and gently tap Maki's swollen belly with your fingertip. Is he sure he has the stomach left for it? Because you've got plenty of juice left in you....");
	output("\n\n\"Silly [pc.name]. We both know I can't have enough of you. You poured your seed inside me and loved me until I got addicted to you. You know I could never say no.\" He smiles happily.");
	output("\n\nWell, in that case... you make yourself comfortable, letting your newly erected shaft be exposed... he can be your guest.");
	makiusSexPitchOralPregContinue(cock);
}

public function makiusSexPitchOralPregBalls(cock:int):void{
	clearMenu();
	clearOutput();
	output("Well, you might be able to... if Maki would be a dear and help your poor, tired [pc.balls] recover, hmm? He sucked " + (pc.balls == 1?"it":"them") + " quite dry, after all; you're not sure " + (pc.balls == 1?"it":"they") + " can cook up another batch, you tell him with an exaggeratedly mournful tone.");
	output("\n\n\"Oh, I'm sorry for being so greedy, my mate. I'll help you, of course.\" He licks his lips and leans in to sniff at your ball " + (pc.balls > 1?"s":"") + ". \"Musky.\" Then he takes an experimental lick. \"And tasty. Just the way I like it.\" He smiles up at you.");
	output("\n\nYou moan as his touch enflames your sensitive skin, sparks of arousal surging through your nerves as his words stir something primal inside you. You can feel yourself starting to get hard again.");
	output("\n\nWatching your reaction with a smile, he sets to work. He kisses, sucks and licks your ball" + (pc.balls > 1?"s":"") + ", doing a thorough job as he cleans " + (pc.balls == 1?"it":"them") + ". " + (pc.ballSize() > 10?"Despite trying, he isn't able to get " + (pc.balls == 1?"your sole gigantic ball":"even one of your gigantic balls") + " into his maw. He settles on licking, nuzzle and sniffing your [pc.sack]; doing his best to incentivize you to produce more seed.":"He rolls " + (pc.balls == 1?"it":"them") + " around with his tongue, nuzzles, sniffs and blows on them; all to incentivize you to produce more seed."));
	output("\n\nYou gasp and moan and shudder, feeling yourself revitalised. You warn Maki to stop, else he's going to make you cum again before he gets his mouth over your cock.");
	makiusSexPitchOralPregContinue(cock);
}

//discontinued because there doesn't seem to be a standardised lust item tag
//public function makiusSexPitchOralPregLustItem(cock:int):void{
//	clearMenu();
//	clearOutput();
	
//	// make sure to import this and decide how to fill it with a lust item
//	var item:ItemSlotClass;
//	output("You ask Maki if he would fetch you the " + item.longName + " in your belongings? You'll be ready for him if you can use it. Maki stands up and goes fetch what you asked for, shaking his " + (makiusMasculine()?"boyish":"curvy") + " hips enticingly as he does so. He doesn't waste a single opportunity to entice you, does he?");
//	output("\n\n\"This one?\" He lifts a " + item.longName + " for you to look at.");
//	output("\n\nThat's the one, you reply, and beckon for him to give it to you. Once it's handed over, you use it, feeling the flush of arousal burning through your veins again, your [pc.cock " + cock + "] rising back its former hardness. A growl of lust rumbles in your throat and you stare hungrily at your pregnant boy-slut, letting your need for his mouth on your dick burn in your eyes.");
//	item.useFunction(pc);
//	makiusSexPitchOralPregContinue(cock);
//}

public function makiusSexPitchOralPregSpentClear():void{
	clearOutput();
	makiusSexPitchOralPregSpent();
}

//Shortened this scene because it was implying non-existant functionality
public function makiusSexPitchOralPregSpent():void{
	clearMenu();
	showBust(makiusBust(2));
	processTime(200);
	author("LukaDoc");
	output("You shake your head and sigh sorrowfully, explaining to Maki that he sucked you dry already feeding his cravings. You've nothing left to give him.");
	output("\n\n\"Already? Aww….\" He pouts. He hops next to you and nuzzles you lovingly; a sign of pure affection and one you never get tired of.");
	output("\n\nYou reach out and wrap him in your arms, " + (pc.isNaga() || pc.tailCount != 0?"twining your " + (pc.tailCount != 0?"tail":"coils") + " around him for added measure, ":"") + "content to relax in the comfort of his embrace.");
	addButton(0, "Next", makiusLeave);
}

public function makiusSexPitchOralPregContinue(cock:int):void{
	showBust(makiusBust(2));
	processTime(200);
	author("LukaDoc");
	output("\n\nThis time Maki decides to go slowly. First by kissing along the length of your shaft, savouring your taste and smiling to himself every time you give an involuntary throb.");
	output("\n\nYou moan softly, your sensitive flesh reacting to the touches with sparks of pleasure.");
	output("\n\nHe lets his tongue loll out and wraps it around your shaft, licking you as he nuzzles you, not caring in the least that the traces of your recent activities cling to his face.");
	pc.cockChange();
	output("\n\nYou arch your back and mewl, already feeling your damaged walls of reserve starting to crumble. You voice encouragements to him, begging with him to suck you for real.");
	output("\n\nMaki eagerly complies; he licks his way to your [pc.cockhead " + cock + "] and, after toying with it using the tip of his tongue, engulfs you in his warm maw once more.");
	output("\n\nA wordless cry of pleasure escapes you, bliss caressing you as he takes you inside. You are buried inside his warm wetness, and you don't ever want to leave.");
	output("\n\nHe rolls your mast inside inside, always mindful of his teeth. A whimper of delight escaping him as he enjoys the feeling of his mate's shaft deep within his mouth. His lips form a seal around you and his tongue massages you. A tickling lick here, a delightful press there and a quick flick to your glans. You feed him your pre as you inch ever closer to orgasm.");
	output("\n\nYour skin tingles and your senses reel, pleasure overwhelming you. You barely manage to hold back long enough to gasp a warning of your impending climax to your Venarian.");
	output("\n\nHe looks up at you, blinking to signal that he understood. Slowly he pulls away, until only your tip is inside his maw. He licks around your glans one more time and releases you, delivering a final kiss on your [pc.cockhead " + cock + "].");
	output("\n\nThat does it; you can't hold it back anymore, and you cum right there and then, painting a sizable splash of [pc.cumColor] across his face, barely aware of the fact that he promptly opens his mouth to try and catch the rest - all that you can think of is the sweeping pleasure as you climax for the second time in so short a span.");
	pc.orgasm();
	output("\n\nIt's a crescendo of pleasure that flows through you like a tidal wave, your whole body shaking with the force of it. But, like all waves, it comes to an end, and in its wake it leaves you tired and drained. You heave lungfuls of air, and then look at your lover; his face is totally matted with your [pc.cumNoun], his eyes closed and his tongue playing across his lips as far as it can reach to try and sweep up any of your fluids that he can.");
	output("\n\nYou watch enraptured as he swipes what his tongue can't reach and licks it off his hands. He looks very cute when he does this.");
	output("\n\n\"Hmm, tasty. Did you enjoy yourself, [pc.name]? My mate?\"");
	output("\n\nYes, you did. He did an absolutely wonderful job. You're proud of him, you say, reaching out to gently ruffle his ears.");
	output("\n\nHe nuzzle your hand, cooing lovingly. \"Cuddle before you have to go?\"");
	output("\n\nWhyever not?");
	output("\n\nHe hops beside you, wrapping himself around you with a smile.");
	output("\n\nYou reach out and wrap him in your arms, " + (pc.isNaga() || pc.tailCount != 0?"twining your " + (pc.tailCount != 0?"tail":"coils") + " around him for added measure,":"") + " content to relax in the comfort of his embrace.");
	addButton(0, "Next", makiusLeave);
}

public function makiusSexPitchOralBreederNo():void{
	clearMenu();
	clearOutput();
	showBust(makiusBust(2));
	processTime(400);
	author("LukaDoc");
	output("He smiles at your reply. \"Ah, good. I'm sorry for getting so carried away. It's just that I think of you all the time, and my hormones are waging war inside my body. I tend to get carried away.\"");
	output("\n\nYou assure him that it's alright, lucky him you happen to like slutty Venarians.");
	output("\n\nHe smiles at that. \"That's comforting, but come now, [pc.name]. I need my mate.\" He gives you his best impression of puppy eyes.");
	output("\n\nAlright then, alright, you'll give him what he wants....");
	makiusSexPitchOralBreederMerge();
}

public function makiusSexPitchOralBreederNotEnough():void{
	clearMenu();
	clearOutput();
	showBust(makiusBust(2));
	processTime(400);
	author("LukaDoc");
	output("\"Oh….\" He smiles mischievously. \"So, you like when I talk dirty?\"");
	output("\n\nYou admit that this is so.");
	output("\n\n\"You like hearing how much you excite me?\"");
	output("\n\nYes.");
	output("\n\n\"That's good. Because right now all I can think is how much [pc.cum] you'll force down my throat while I nurse from your delicious, juicy [pc.cockBiggest]. I just want it so badly… if you weren't straddling me I'd have pounced you already. I'm so horny that just the scent is getting me close to the edge.\" He makes a point of inhaling deeply, whimpering as he enjoys your musk.");
	output("\n\nYour cock throbs and twitches as your excitement builds; clever boy, he knows just what " + pc.mf("daddy","mommy") + " likes to hear, doesn't he?");
	output("\n\n\"Yes, yes I do. Feed me " + pc.mf("daddy","mommy") + ". I'm so hungry.\" He lets his tongue loll out, panting in wanton lust.");
	output("\n\nOh, you'll feed him alright....");
	makiusSexPitchOralBreederMerge();
}

public function makiusSexPitchOralBreederYes():void{
	clearMenu();
	clearOutput();
	showBust(makiusBust(2));
	processTime(400);
	author("LukaDoc");
	//wanted the length of the penis, using a random adjective instead
	output("\"Oh… sorry for that. I'm just so horny, and you are so attractive, and then you show me this " + pc.cockAdjectivesRedux(pc.cocks[pc.biggestCockIndex()], 1, false)[0] + ", juicy [pc.biggestCockNoun] of yours… I'll shut up now.\" His ears lay flat on his skull.");
	output("\n\nIt's alright, he just needs to try and tone it down a little; you don't need that kind of encouragement.");
	output("\n\n\"Noted.\" He smiles. \"So… how about we cut to the chase. I'm eager to start and I suppose you're also eager to get started?\"");
	output("\n\nYes, you are....");
	makiusSexPitchOralBreederMerge();
}

public function makiusSexPitchOralBreederMerge():void{
	output("\n\nYou slide yourself up his waist, feeling his " + (makiusMasculine()?"chest":"breasts") + " pushing against your inner [pc.thighs], and begin pushing your cock into his mouth. Maki relaxes, wary of his teeth as he guides your way inside whilst lapping at you. His mouth forming into an inviting O, sealing his lips around your shaft. You would feel envious of his enjoyment, if you weren't enjoying this just as much as he is.");
	pc.cockChange();
	output("\n\nSlowly you start to fuck your " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"boy":"") + "friend's face, letting your shaft slide gently in and out of his lips, feeling his tongue squeezing and caressing you. Your position is a little awkward, you can't fit yourself completely inside of him from this angle, but you resolve to try your hardest - he's certainly enjoying it, anyway, sucking away like your dick is a delicious lollipop, coaxing you to pick up the pace, steadily getting faster and faster.");
	output("\n\nYou feel an impact against your hips and look down; Maki is tapping at you with his hands. He looks at you inquisitively. You pop your cock free so that he can speak. He smack his lips as you pull away. \"You know, if you did this from another angle, you could go deeper into my throat.\"");
	output("\n\nThat sounds intriguing; you're willing to try if he is.");
	output("\n\nHe smiles. \"Go ahead then, I don't mind it. I want to be able to take all of you.\"");
	output("\n\nYou slide off of him, moving yourself around so that you are coming down at him from above, rather than up from below. As he lays back, his head leaning up towards the head of the bed and his mouth open, you straddle his head and gently feed your [pc.cock] into his waiting lips, leaning over him and holding onto his " + (makiusMasculine()?"chest":"breasts") + " as support. From this angle, you can already feel better penetration. Once settled, you ask if he's alright.");
	output("\n\nMaki can't speak with your cock inside his mouth, so he settles for a swallow along with a moan of enjoyment. With that made clear, you can start really enjoying yourself, thrusting in and then pulling out, feeling his tongue working along your shaft, his lips trying to keep you locked deep inside, his mouth moving to caress your [pc.skinFurScales]. " + (makiusMasculine()?"":"His boobs squish delightfully under your hands, and you can't resist playing with them as you thrust, kneading and squeezing them even as your hips buck your prick inside Maki's mouth."));
	output("\n\nHe whimpers in delight, doing his best to work his throat muscles into a perfect cocksleeve for your intruding shaft. His own hands reaching down to stroke his erect cock and finger his moist ass. Soon enough the wet squelches and slaps of his masturbation join the chorus of moans as you throat-fuck him.");
	output("\n\nFaster and faster you start to thrust as you adjust to the position. You can feel his warm breath against your sensitive " + (pc.balls > 0?"[pc.sack]" + (pc.hasVagina()?" and [pc.cunt]":""):(pc.hasVagina()?"[pc.cunt]":"perineum")) + ", his twitching ears tickling your inner [pc.thighs] and helping to send sparks of pleasure cascading across your nervous system.");
	output("\n\nYou lose yourself to the sensations, humping and squeezing for all you're worth, feeling that delicious pressure building inside of you. You're gonna... gonna... you cry out to Maki.");
	output("\n\nThe Venarian smiles as well as he can in his current position, swallowing and opening his throat so you can penetrate him as deeply as you can possibly manage; something you do without a second thought.\n\n");
	if (pc.cumQ() < 100){
		output("You feel the last of your composure gone and you empty yourself into your partner's waiting mouth, giving him a nice, healthy batch of [pc.cum] to swallow.");
		output("\n\nMaki just devours all that you give him, happy to be able to taste you as well as pleasure you.");
	}else if (pc.cumQ() < 500){
		output("Stronger than a normal man's, your climax sweeps through you, a great rush of [pc.cum] spilling into your partner's waiting mouth. Maki swallows without a second thought, not that he could do otherwise in his current position. Even as he gulps it down, you keep letting it out, spurt after spurt swallowed into your greedy little boytoy's belly. By the time you finish, Maki's belly is visibly distended, crammed so full of your spooge that it bulges in a small bump you can't resist playfully jiggling with the tips of your fingers.");
		output("\n\nThe Venarian doctor laughs, still muffled by your softening dick, desperately trying to move away from your teasing touch.");
	}else if (pc.cumQ() < 5000){
		output("A great cascade of cum erupts from you, your mind washed away in a tidal wave of [pc.cumColor] that leaves you consumed with bliss. Your Venarian lover does his best to swallow your load, despite there being little need to as your jets all but force their way down his throat. He barely has time to let your cum build up inside his mouth as he gulps it down.");
		output("\n\nAs hard as he works, though, you just can't seem to stop, and more just keeps pouring out of you. Stubborn as anything, Maki refuses to let go and it just keeps going down into his waiting belly, visibly stretching it before your eyes. Up and up it rises, finally settling into a great pregnant-looking bulge that slowly rises and falls, just slightly out of synch with Maki's breathing. Panting from the strength of your climax, you gently pat this proof of your awesome virility.");
		output("\n\nMaki coughs weakly. \"Wow… I'm so full….\" He pants from the exertion of swallowing down your prodigious load.");
	}else{
		output("The world seems to simply vanish from around you; there is only the tidal wave of seed erupting from the jizz-volcano you call a cock and the equally awesome wave of pleasure that swirls around you and near-drowns you in its intensity. Maki seems to be fighting a losing battle as he tries his best to keep up with your hot jets of [pc.cumColor] [pc.cumNoun]. Still he never manages to gulp down more than you give him, and it doesn't take long before the excess escapes the seal of his lips.");
		output("\n\nBarely cognizant of your boytoy's struggles as even his greed for your cum is tested, you just keep gushing semen, flooding his mouth and pinning him to the bed with the sheer force of your discharges. Like a cake in an oven his belly rises, and rises, and rises, a great wobbling dome that is almost brushing against your [pc.face] by the time that you finally, mercifully, come to an indescribably blissful end. When your eyes can focus again, his swollen belly stands as testament to your incredible, inhuman potency.");
		output("\n\nMaki is only capable of a tired groan, and a small burp follows in its wake. \"So, much… so, good….\" He finishes with a melodic note, clearly pleased with the results.");
	}
	output("\n\nHe rubs his belly as he whimpers, eyes closed in delight.");
	output("\n\nYou carefully pull yourself free and tiredly clamber around him so that you can lay yourself down by his side. You cuddle up against him, wriggling an arm under his shoulders to support his head, draping the other down his stomach to playfully rub his " + (pc.cumQ() < 100?"flat":(pc.cumQ() < 500?"bulging":(pc.cumQ() < 5000?"swollen":"huge"))) + " belly with soft, careful motions. You nuzzle your head into the crook of his shoulder, placing your face next to his.");
	output("\n\nHe takes a moment to smile at you, right before he nuzzles you affectionately, cooing all the while. \"Thanks, [pc.name]. That was almost as good as having you inside me.\"");
	output("\n\nYou're glad he enjoyed it, you tell him. He's got quite the sweet mouth, you add, stroking his belly some more. Then you sigh and cuddle up to him, more interested in just basking in the afterglow than in talking, wrapping yourself around him as best you can.");
	output("\n\nHe cuddles you back, tail wrapping around you tenderly. A clear sign of affection, though you do detect a certain feel of possessiveness. \"My mate. My wonderful mate. My virile mate.\"");
	output("\n\nMy Maki, you reply; my wonderful, loving, lusty Venarian.");
	output("\n\nHe coos and nuzzles you once more. \"Naptime?\"");
	output("\n\nNaptime sounds good, you admit sleepily, closing your eyes and letting yourself drift off in Maki's arms....");
	pc.orgasm();
	addButton(0, "Next", makiusLeave);
}

public function makiusSexCatchVaginal(vNum:int):void{
	clearMenu();
	clearOutput();
	showBust(makiusBust(2));
	makiusSubbed(-1);
	processTime(400);
	author("LukaDoc");
	if (flags["MAKI_STATE"] == 2){
		if(pc.isPregnant()){
			output("\"We're both already pregnant! Is there any point in this?\" He crosses his arms in mock indignation.");
			output("\n\nMaybe you just want your pussy pounded? Isn't there a part of him of that just just wants to have fun, despite your shared misery?");
			output("\n\nHe scratches his chin. \"Well, I'd be lying if I said I didn't want sex with you like that… But we're both pregnant and I wanted you to be at my beck and call, not the reverse. " + (!pc.hasPregnancyOfType("MakiusPregnancy")?"With a child that isn't even mine! ":"") + " He pouts.");
			output("\n\nYou tell him not to worry, you'll keep doting him as much as he wants, even after you both pushed these babies out.");
			output("\n\n\"Alright then.\" He smiles, content with you answer.");
		}else{
			output("\"So… just knocking me up is not enough? You want " + (flags["MAKI_SIRED CHILDREN"] > 0?"another":"a") + " baby for yourself too?\" He crosses his arms in mock indignation.");
			output("\n\nMaybe... But, be honest; isn't there a part of him that wants to knock you up, too? Whether it's to share being pregnant with you or just to make you go through the same misery as he did?");
			output("\n\nHe scratches his chin. \"Well, I'd be lying if I said I didn't want sex with you like that… but really. If we're both pregnant who's going to dote upon who? I kinda enjoy having you at my beck and call.\" He grins happily.");
			output("\n\nWell, obviously, whoever's bigger should get more doting, you reply.");
			output("\n\n\"Alright then.\" He smiles.");
		}
	}else if (flags["MAKI_STATE"]){
		output("He pouts as you finish your request. \"But, what about me?\"");
		output("\n\nWhat about him, you reply; if you both have parts in need of use, then it's only fair to take turns.");
		output("\n\n\"You made me change. It's not fair that only you get to have fun. I need a cock inside me too!\" He protests.");
		output("\n\nYou smile and wave your finger at him, telling him that you've got needs of your own" + (pc.hasPregnancyOfType("MakiusPregnancy")?", and that he doesn't get to be only one complaining about changes":"") + ". If he'll give you his dick this time, you'll " + (pc.hasCock()?"give him yours next time.":"think about getting a dick for his needy ass afterwards."));
		output("\n\nHe sighs. \"Fine, I guess I can agree to that.\"");
	}else if (flags["MAKI_RELATIONSHIP_STATUS"] == 2){
		output("\"You want me and I want you, so settle down my mate.\" He grins.");
		output("\n\n\"A-alright.\" He takes a deep breath and steels himself before looking you in the eyes and saying: \"Prepare yourself [pc.name]! I-I'm going to ruin you!\" He states, a bit nervously.");
		output("\n\nYou chuckle. Oh Maki, he’s adorable even when he’s trying to be intimidating…");
		output("\n\n\"Um… sorry?\" He grins nervously, ears flattened against his head as his cheeks redden with embarrassment.");
		output("\n\nYou close your distance and steal a quick kiss, telling him that he doesn't need to try so hard to impress you.");
		output("\n\nHis blushing intensifies as he closes his eyes and waves his tail, laughing nervously at his own blunder \"I'm sorry, I was just trying-.\"");
		output("\n\nYou shush him with a finger and tell him that you know what he was trying to do. It’s not a very effective approach when he’s such a cute little Venarian, but it was still sweet of him to try.");
		output("\n\n\"Right… umm… shall we?\"");
	}else{
		output("\"You wanna do that again, do you?\" He asks with a smile.");
		output("\n\nYes, you do. After all, practice makes perfect, you tease him." + (pc.hasPregnancyOfType("MakiusPregnancy")?" Not that he needs any, if your pregnant belly is any indication.":""));
		output("\n\nHe smiles a bashfully. \"Um, thank you.\"");
	}
	output("\n\nYou walk towards the bed, swaying your [pc.hips] in a seductive wiggle as you do, before laying down" + (pc.hasBalls()?", spreading your [pc.thighs] and lifting your [pc.balls]":" and spread your [pc.thighs]") + " to reveal your feminine treasure. You trace your labia with your fingers, asking if Maki likes what he sees, smiling seductively at him as you do.");
	output("\n\nMaki crawls onto the bed over you, looking adoringly at you as he moves his hand to caress your cheek. A small droplet of the Venarian's pre falls onto your crotch, a signal of just how aroused he really is.");
	output("\n\nYou let out an appreciative moan as you feel his fingers on your [pc.face], reaching up with a free hand to caress his slick, dripping cock, the anticipation of feeling it plunging into your depths almost palpable.");
	output("\n\nHe closes his eyes and gasps at your touch, letting out a silent moan as his eyes close. Panting he opens his eyes once more to gaze upon your prone form, you can almost feel the burning lust within as he gazes into you. \"[pc.name]....\" he calls out airily.");
	output("\n\nMaki, you reply in the same tone, leaning up slightly to kiss him. He leans into your kiss, closing his eyes and whimpering as his Venarian endowment throbs within your grasp. You squeeze it softly, not enough to hurt, but enough to let him feel your fingers.");
	output("\n\nBreaking the kiss, Maki leans down and licks his lips once, as he pants atop your [pc.cunt " + vNum + "]. You moan luxuriantly, a thrill of anticipation tingling through your body. He extends the long organ and gives your slit a lick, from the bottom, all the way to the top. You arch your back and hiss in pleasure at the stimulus. He repeats the motion, licking around your labia as he takes in your pheromones.");
	output("\n\nYou moan throatily, eyes fluttering at the stimulation. Mmm... he feels so good down there, you absently praise him. Does he like your taste?");
	output("\n\n\"Very much!\" He exclaims, licking his lips. \"I'm going to enter you now.\"");
	output("\n\nYou nod eagerly, conveying your readiness with your body language.");
	output("\n\nHe adjusts himself, slowly lowering his hips until the nubby tip of his cock, touches your labia. You shiver in anticipation, feeling its textured tip stroking your sensitive netherlips.");
	output("\n\nMaki lays atop you, hugging you against himself, His " + (makiusMasculine()?"flat chest":"soft breasts") + " pressing against your own [pc.chest]. And just like that, he thrusts.");
	if (pc.vaginas[vNum].hymen){
		output("\n\nHe suddenly stops in his tracks as he feels a barrier within you. \"[pc.name]! You….\"");
		output("\n\nIt's alright; you want him to be your first. Please, continue, you tell him. He nods in understanding, pulling away only to thrust himself back inside you, pushing past your hymen.");
		makius.cockChange();
		pc.cuntChange(vNum, makius.cockVolume(0));
		output("\n\nYou moan in pain-tinged pleasure as his shaft pierces your love-canal, so unused to anything like this experience, forcing you wider than your fingers have ever done. You can feel the rupturing of your virginity, and your once-untouched cunt instinctively clamps down on his cock at the stimulation. You cannot repress a hiss of pain at the breaching.");
		output("\n\nMaki looks at you, worry clear in his eyes. Shivering, you hold until you adjust, then nod to him, signalling that you're ready to proceed. Nodding he continues to feed you inch upon inch; until your hips connect with a shuddering moan from your Venarian partner. You moan along with him, the experience so new to you it's almost indescribable... other than that you feel good....");
	}else{
		output("\n\nYou moan appreciatively as his shaft spreads you wider, the Venarian sliding deeper and deeper inside of you until he has reached his hilt, something that makes him shudder and moan even before your cunt clamps down on him.");
		makius.cockChange();
		pc.cuntChange(vNum, makius.cockVolume(0));
	}
	output("\n\n\"So hot, so slick… so good.\" He nuzzles you as he holds himself fully hilted inside you.");
	output("\n\nHe's not half bad himself, you reply, nuzzling him back, draping your arms over your lover's back and squeezing his ass for emphasis. Once you feel adjusted to his intrusion, you tell him you're ready for him to start, bumping your hips against his own for emphasis.");
	output("\n\nHe nods and begins the slow process of pulling back, until only his nubby tip is still inside you, only to push himself back in. His pace is slow and his technique is nothing to be impressed at, then again you were his first and you still haven't taught him everything.");
	output("\n\nYou try to enjoy yourself, but his thrusts are just so slow and erratic; you can feel the tension in his muscles as he lays on top of you. There is a nervousness on his sharkish face... the lack of any action beyond thrusting isn't helping him, either. With a sigh you reach up and take his face, kissing him on the lips, deep and long. When you let go, you stage-whisper an admonition to him to not be so nervous, then take his hands in your own, bringing them to your [pc.breast].");
	output("\n\n\"Oh… sorry.\" He tries to relax as he gently caress your [pc.breasts], eventually finding and pressing on your [pc.nipples]. \"Is that better?\"");
	output("\n\nMmm, better, yes; now, kiss them, you order him. Use that tongue of his to tease them, but don't stop thrusting while he does so.");
	output("\n\n\"Okay.\" He leans over to kiss your chest, trailing his way to one of your [pc.nipples]. Finally he opens his maw and engulfs it, swirling his tongue around the sensitive [pc.nipple].");
	output("\n\nYou moan appreciatively, arching your back instinctively to let him get a better grip on your breast. Your [pc.cunt " + vNum + "] wrinkles around his shaft, milking at it with all the skill you can muster, your hands draping over his back and scraping through his thick fur. That's good work with his tongue... but he's starting to slacken down below; he needs to pick up the pace - move his hips faster, you order him.");
	output("\n\nHe stops playing with your nipples for a second. \"Sorry!\" He drives right back to his appointed tasks, licking and suckling on one of your [pc.nipples] while one of his hands plays with the other; he hunches slightly, using his tail for support as he finally begins going faster, setting at a steady pace. He whimpers every time your hips collide with a satisfying slap.");
	output("\n\nYou grunt and scrape your hands down his back, slapping at his ass. Now this is more like it, you absently comment, even as you start to buck back for real against his thrusts. Harder, you tell him, do it faster! You're not made of crystal, after all, you won't break if he really puts himself into it.");
	output("\n\nMaki redoubles his effort, his thrusts rocking you with each slap. He moans your name, now constantly whimpering in delight. Erratic thrusts sometimes brushing against your most sensitive spots. For a moment you have a distinct feeling that he's getting bigger, Maki must not have long to go.");
	output("\n\nA knowing smile crosses your lips as you squeeze his ass in your hands, pussy doing it's best to milk his shaft as your fingers creep towards his pucker, teasingly caressing the base of his tail with one hand and brushing his rosebud with the fingers of the other. You notice Maki's eyes dart backwards as he feels your hand on his ass; the moment he looks back at you in confusion you smile and set about guiding him with your hand, controlling his pace as you work yourself towards the inevitable climax.");
	output("\n\nWhimpers and moans of delight escape your Venarian lover, he stops playing with your nipples; instead all he does is thrust at your pace, focusing on the sensations of your milking pussy.");
	output("\n\nFinally, feeling your own climax imminent, you give Maki one last command: \"Cum for me,\" you whisper, pulling him roughly against yourself so that his next thrust goes as deeply into you as possible and pushing a finger into his sensitive" + (flags["MAKI_STATE"] > 0?", drooling":"") + " asshole for emphasis.");
	output("\n\nHe gasps, arching his back as he lets out a deep throated moan of pleasure. Hips grinding against you into a needy rut, his hands camp down on your [pc.hips] as he pulls you in an attempt to dig ever deeper. You feel his shaft throb, nubby glans seemingly vibrating as they harden and expand his tip. His cumvein, now held open, releases its copious content. A flood of Venarian spunk floods your passage, digging its way into your deepest recesses as Maki instinctively tries his best to fertilize his mate.");
	pc.loadInCunt(makius, vNum);
	makius.orgasm();
	output("\n\nA throaty cry rips its way out of you as your own climax washes through your, your clenching [pc.vaginas] flowing with [pc.girlCum]" + (pc.hasCock()?" and your [pc.cocks] spraying [pc.cumNoun] over Maki's " + makiusBellyDescriptor():"") + ". You claw at Maki's back, pulling him as tightly to you as possible as you ride the wave of pleasure, until finally it leaves you spent and gasping on the bed, the Venarian sprawled on top of you you. Once you can breathe freely again, you smile and ask how Maki thought it went.");
	pc.orgasm();
	output("\n\nHe looks at you, panting and smiling. \"That was the best, [pc.name].\" He nuzzles you lovingly, whimpering in delight.");
	output("\n\nYou smile and hug him. Good, you reply; see, it's not so difficult to be with you that way. Now, if he doesn't object, you were hoping to snuggle a little before you have to leave...?");
	output("\n\nHe just smiles and hugs you tighter.");
	addButton(0, "Next", makiusLeave);
}

public function makiusSexCatchAnal():void{
	clearMenu();
	clearOutput();
	processTime(100);
	makiusSubbed(-1);
	author("LukaDoc");
	showBust(makiusBust(2));
	if (flags["MAKI_STATE"] == 0){
		output("\"Oh, you want me to…\" he trails off scratching the back of his head nervously.");
		output("\n\nHe might be a little uneasy in his head, but his cock certainly knows what it wants; it's rock hard and just drooling slime everywhere in anticipation of getting to plough the very depths of your ass. Oh, he wants it alright.");
		output("\n\nMaki eyes you lustfully, smiling. \"If you really want me like that, I guess I can oblige.\" He swallows, still a bit nervous. \"Sorry for being nervous. It's just that… you excite me.\" He takes another glance at you, averting his eyes and biting his lower lip. \"A lot.\"");
		output("\n\nYou kind of got the impression, you reply, eyes giving a meaningful look at his dripping cock.");
	}else{
		output("\"Personally I'd rather be on the receiving end. " + (flags["MAKI_STATE"] == 2?"Even if you did finally put a baby Venarian inside me, I still crave you, y'know?\"":"Make a few Venarian babies….\" He closes his eyes, thinking with a smile. \"Yes that would be great.\""));
		output("\n\nMaki eyes you lustfully, smiling. \"If you really want me like that, I guess I can oblige.\" He chuckles. \"Sorry for being selfish, I guess you crave me in other ways too. And I can't deny my mate, can I?\" His tail waves happily behind; silly grin plastered on his face.");
		output("\n\nNo, he certainly can't... that's just one of the things that you love about him.");
	}
	output("\n\nYou close the distance between the two of you to envelop his lips in a hungry kiss, one hand reaching down to take a firm grip around his dick. You can feel it throbbing, hot and hard in your palm, drooling precum all over your fingers, and you stroke him meaningfully before letting it go, your hands gently taking his and positioning them around you waist, waiting to see if he will get the invitation.");
	output("\n\nRealisation suddenly dawns on your Venarian lover and he gets that he should be taking the lead. Maki leans over towards you to gently nip at your at your neck, kissing and licking. You moan softly in encouragement, looking forward to seeing him taking charge. He pulls you towards the bed. Feeling the bed behind your [pc.legs], you simply allow yourself to relax and sit down, seating yourself on the mattress. He stops his nibbling to look at you lovingly and gently caresses your cheek. You bat your eyes at him coyly, leaning into his stroking to show him how much you're enjoying this.");
	output("\n\nMaki stands up and gently pushes you down. You take the hint and comply, settling yourself down on your back and making yourself comfortable, controlling your fall so as to look like he's the one pushing you down and pinning you in place. He plants a kiss on your [pc.belly], trailing his way upwards. You laugh at the ticklish sensation, fidgeting slightly. Your [pc.breasts] " + (pc.biggestTitSize() == 0?"is":"are") + " showered in kisses before he licks your [pc.nipples] teasingly. Sparks of pleasure surge across your nerves and you moan softly, growing steadily anxious for him to begin. Finally he stops mere inches from your face, soft breathing teasing your [pc.skinFurScales] as he finally leans forward to kiss you once more. You moan softly into his mouth and kiss him back hungrily, closing your eyes so that you can focus entirely on the feel of his touch.");
	output("\n\nYou feel his hand roam your form, settling on your [pc.butt]. Maki spreads your cheeks, gently, and aligns his Venarian pecker with your rear entrance. You wait anxiously, feeling the very tip of his dick pressing against your ring, winking the muscles in anticipation of being penetrated, but nothing happens, and you let out a wordless noise of protest. Maki repositions himself, settling his shaft on your buttcrack. He rubbs his pre-coated dick against your entrance as his breathing becomes more and more worked. It's clear the Venarian is itching to bury himself into you, yet he maintains control. When he glances at you to gauge your reaction, you open your eyes and stare back at him, your eyes conveying your impatience to begin and your eagerness for what is coming.");
	output("\n\n\"I… need to make sure I won't hurt you.\"");
	output("\n\nYou nod your head and relax, making it clear that he can proceed.");
	output("\n\nHe slides himself off you, conveniently rubbing his body against yours, imprinting you with his scent as he climbs off you and rolls you around on your belly. You cooperate with his motions and roll over onto your [pc.belly], closing your eyes again. You wriggle instinctively when you feel the coolness of his nose pressing against your back passage, contrasting deliciously against the heat burning in the enflamed ring of your rosebud. You shiver in shock, whole body trembling as a wet tongue suddenly slides through your ass-cleavage, the tip tracing across your trembling hole's rim before withdrawing. Then it comes in again, and again, Maki busily slurping his way lewdly through your butt, sopping your anus with his thick saliva. Your asshole winks at him as you try to open the muscles there and catch his tongue, yearning to be penetrated and to feel its slick, muscular length sliding inside of you.");
	output("\n\nThis time the Venarian doctor does not disappoint. During a particularly drawn out lick, his tongue circles your rear-end and finally presses in. You moan lewdly, panting like a whore in heat as your pucker clenches down, trying to suck his tongue inside of you... oh, you can feel it wriggling around inside you, painting you with slick, wet goo as he gets you nice and lubed for his cock. Maki continues to explore your depths with his tongue, coating your insides in a slick layer of saliva. You continue to gasp and shudder, moaning softly as he teases you so. Suddenly he stops, withdrawing his tongue from your anus. Your rosebud wrinkles and clenches, already missing its presence, and you can't help a disappointed moan escaping your lips. He pants, letting his hot breath waft across your exposed rosebud.");
	output("\n\nYou gasp and shudder at the sensations; how much longer is he going to tease you like this?");
	output("\n\nHe swallows and says, \"I need you now.\" That's all the warning you get as he clambers his way on top of you.");
	output("\n\nYou moan in hunger, anticipation driving you mad as you feel his weight pressing down upon you, his fingers gripping you tightly as he positions himself over you, aligning his shaft with your ass, pressing it back against the hungry opening of your butt. You let out a throaty moan and beg him to thrust; oh, you need him inside you, you need it so bad!");
	output("\n\nThe Venarian growls, nosing your neck as he drives his hips forward, piercing your well-lubed back entrance. So slick are you that he just glides in, sliding over your sensitive walls and not stopping until his hips collide against yours, having hilted himself in a single thrust. You moan like a whore in pleasure and delight, already clenching your ass on him at the sensation of being filled so well; this is much better than his tongue was, and you babble this fact to him.");
	makius.cockChange();
	pc.buttChange(makius.cockVolume(0));
	output("\n\nIf he hears you, he doesn't bother to reply. He gives you a moment to adjust before retracting and pushing himself back in with a wet squelch. His pre-leaking cock fills your ass, painting its way in and out. You groan and hiss, pleasure ringing its way through your body, squeezing your ass as best you can to try and grasp his cock and hold it inside you, but he's just too slick, just too slippery to trap. His pacing speeds up, building towards a crescendo. Wet slaps echo from your joint hips with every thrust by the lust addled doctor. His hands hug you tightly from behind, as if afraid that you will evaporate if he ever let you go. You give yourself to his embrace, eager for it, surprised and delighted at just how much he's gotten into this.");
	output("\n\nHe groans, becoming more and more rough on his treatment. You thrust your hips back eagerly, matching each thrust with your own, the rhythmic slap of flesh on flesh filling the room.");
	output("\n\n\"[pc.name]....\" he whispers. \"Oh, [pc.name].\" His " + (makiusMasculine()?"boyish":"curvy") + " hips double in rhythm. \"[pc.name]! I'm OOOooooh!\" He never gets to finish his sentence, burying himself as far into you as he can manage.");
	output("\n\nYou cry out with equal lust, feeling the heat washing through you as his cock-head hardens, expanding his urethra and he paints your insides with jet after eager jet of Venarian seed. Oh, it's feels so good in your belly - you want it all, every last drop! Your [pc.asshole] ripples and squeezes as you try to milk him, greedily seeking to drink his cock dry of jism.");
	makius.orgasm();
	output("\n\nIt's all too much for your overstimulated brain and you cry out as you climax, whole body quaking in pleasure, " + (pc.hasCock()?"your [pc.cocks] spraying jism onto the sheeting":"") + (pc.isHerm()?" and ":"") + (pc.hasVagina()?"your [pc.cunt] spattering its juices below you":"") + ". You gasp and groan, whole body quaking until at last you give in and collapse into a heap, the breath whooshing from your lungs as your lover falls atop you in his own boneless collapse.");
	pc.loadInAss(makius);
	pc.orgasm();
	output("\n\nMaki whimpers in delight, nuzzling and inhaling your scent, even as he withdraws from you with a squelch. Your sphincter clenches automatically, and you can't help a pang of disappointment at being emptied like this. He rolls you both on your side and spoons you affectionately, tail draping over you possessively. Contentedly you snuggle into his arms, patting his hand where it drapes across your [pc.belly].");
	output("\n\nFor someone who wasn't so eager when he started, he sure did pretty good, you tell him.");
	output("\n\nHe coos affectionately. \"Thanks.\"");
	output("\n\nYou just sink back against him and let the time tick by, enjoying the warmth of having him so close" + (flags["MAKI_STATE"] == 2?", feeling his pup kicking under his skin as his belly pressing against your back":"") + (flags["MAKI_STATE"] == 0 || makiusMasculine()?"":(flags["MAKI_STATE"] == 2?" and":",") + " uncaring of the dampness his milk-oozing breasts are leaving on your back from being pressed so firmly against you") + ". However, time and tide wait for no man, as the saying goes, and eventually you tell Maki that you have to get up and leave now.");
	output("\n\n\"Aww, already?\" Disappointment clear in his voice as he lets out a whimper. You sit up and gently stroke his ears, petting him like a faithful dog. He leans against your touch, smiling happily. \"Alright then, [pc.name]. I understand you are busy, but please come see me again soon.\"");
	output("\n\nYou nod your head and slide out of the bed, gathering your things and leaving the room.");
	addButton(0, "Next", makiusLeave);
}

public function makiusSexCatchOral():void{
	clearMenu();
	clearOutput();
	processTime(300);
	author("LukaDoc");
	showBust(makiusBust(2));
	output("You look over the naked form of your lover, and your eyes fall upon his shaft, poking from his groinal slit and drooling thick ropes of slimy, gooey precum. You know just what you want to do with him. Swaying your [pc.hips] in an effort to appear enticing to him, you cross the distance between the two of you and you fold your arms around him, gently capturing his lips with your own. Maki kisses you back, tentatively at first, but the kiss quickly develops into something more passionate as he embraces you and brings you closer.");
	output("\n\nYou let him wrap his arms around you, feeling the hot wetness of his shaft against your [pc.belly]. You slip a hand free and slide it between your bellies, stroking your way down to grasp his alien cock and feel it bubbling its fluids against your fingers. You tease it with your fingers and then break the kiss, slipping neatly out of his embrace.");
	output("\n\nAt first Maki whimpers in disappointment, but as you slide your way down he can't help but look at you in curiosity. His shaft throbs as he wonders what it is that you intend to do. Yet he remains silent; he swallows, clearly excited and spreads his legs to allow you better access. You gracefully lower yourself to a kneeling position in front of him, stroking his cock a few times to ensure it's nice and slick, then make a show of leaning in to take a deep whiff of his musk.");
	output("\n\nHmm.... You tenderly trace the length of his shaft with your [pc.tongue], tickling the very tip as you savor the flavor of his precum. " + (makiusMasculine()?"It's very piquant in its taste; strongly masculine, despite Maki's appearance.":"The taste is very unusual, sweetly feminine yet spiced with just a hint of masculine musk."));
	output("\n\n\"You sure?\" You nod your head and smile gently, showing you're serious. \"I… umm… Venarians can be quite productive when we're getting stimulated….\" he trails off.");
	output("\n\nOh? Well, you're looking forward to seeing that, you reply, and you give him another long, wet, sloppy lick, [pc.tongue] dragging itself slowly across his sensitive flesh.");
	output("\n\nHe shudders and sighs. \"I'll do my best.\" He smiles.");
	output("\n\nYou deliver another couple of tantalizing, teasing caresses to his cock with your [pc.tongue], but enough is enough when it comes to foreplay. You open your mouth and pull in your tongue, then close it around the nubby tip of his " + (makiusMasculine()?"above average length":"modestly-sized member") + ". A gasp of surprise makes itself known above you. The warm, throbbing flesh slides easily into your jaws and you suckle on it, tasting its strong, distinctive flavor, bolstered by the steady flow of Venarian precum lubing your mouth and trickling slowly down your throat. Bolstered by the 'reward' you are receiving, you continue to suck, steady and strong, milking your lover with your mouth as best you can.");
	output("\n\nYou feel your Venarian lover pulling back, only slightly, before he bucks against you. Aided by his copious pre, his shaft slides against your tongue until your face is flush with his slit. You look up to gauge his reaction and your eyes are met with a lustful, yet apologetic, gaze.");
	output("\n\n\"Sorry. It just feels too good.\" You simply caress the underside of his dick with your [pc.tongue], trying your best to slide his tip down your throat, squeezing it by clenching your muscles and generally attempting to suck him as deeply inside of your mouth as you can. And all the while, your eyes look up into his" + (!makiusMasculine() || flags["MAKI_STATE"] == 2?", for all that his " + (flags["MAKI_STATE"] == 2?makiusBellyDescriptor() + (makiusMasculine()?"":" and "):"") + (makiusMasculine()?"":"breasts") + ", get in the way":"") + ", your gaze calm, level and knowing, a mischievous light dancing in their depths.");
	output("\n\nMaki moans at your ministrations, his restraint all but evaporating as he resumes his shallow, yet insistent, thrusts. \"[pc.name]....\" he moans above, eyes shut tightly as he processes the pleasure of having his lover offer him oral.");
	output("\n\nYou close your own eyes to better concentrate on pleasuring him in turn, tongue sliding across the hot flesh invading your mouth, throat squeezing and wringing whatever it can reach, gulping and slurping and slavering as you paint his dick with a mixture of your saliva and Maki's precum, some excess fluids spilling between your lips to drip onto the edge of the bed. Maki grips the bed as his " + (makiusMasculine()?"boyish":"curvy") + " hips continue to move on their own, force feeding you his pre, even though most of it spills past the seal of your [pc.lips]. He pants as if in heat, tongue lolling out of his mouth and eyes closed in pleasure.");
	output("\n\nYou swallow harder, forcing your alien boytoy's cock down until you can feel it slide into a proper deepthroating, your tongue sliding out past your lips; with the bulk of his shaft down your throat, it's got nothing to play with... nothing in your mouth, at least. Your tongue strokes at his groinal slit, delivering the most ticklish licks you can manage in your position to his sensitive flesh. You caress the fur around it, feeling his damp, fine texture on your tongue, then probe as far inside the pussy-like opening as you can reach.");
	output("\n\nMaki freezes in his position; back arched, hips thrusting forward as you subject him to such pleasure his tail goes stiff. Unable to move or react; all that he can manage is a sound somewhere between a groan and moan of pleasure as you feel the tell-tale signs of an approaching orgasm. His shaft throbs, stiff and erect inside your throat, you can feel the nubs covering his tip slowly expanding, holding your throat open as well as his urethra as more of his pre-seed leaks into your [pc.mouthFull].");
	output("\n\nDelight fills you at how easily you can pull Maki's strings, even as an intense and sudden hunger for more of his sweet essence blossoms in your belly. You want his cum. You <b>need</b> him to cum! Like a " + pc.mf("man", "woman") + " possessed you swallow and gulp, your throat churning and squeezing, milking his cock for all your worth. Your tongue dances inside his groinal slit, playing with the hot sensitive flesh inside, as your fingers squeeze his thighs for support, holding on as tightly as you possibly can. He is going to cum... and you will <b>not</b> stop until he does!");
	output("\n\nAll Maki manages before his tip expands at last and a flood of his slick cum spews forth into your throat is a shaky warning that quickly devolves into a moan of lust. His cum explodes inside you with such volume it feels like you are guzzling liquid down from a bottle. Greedily you drink and slurp until you feel like your belly has been filled, and then you drink some more. You intend to suck him dry of every last drop he has, no matter how much it may be. By the time that you swallow the last mouthful and he goes limp in your mouth, your belly is gurgling in protest, the skin of your midriff stretched tight as a drum over a stomach filled to its limit.");
	pc.loadInMouth(makius);
	makius.orgasm();
	output("\n\nYour Venarian lover coos in delight as his stiff body finally relaxes and he collapses nervelessly on his back. His cock slips out of your mouth with a pop, half-erect after his orgasm and quickly receding back into its protective slit. You watch as your recent treat slides its way back home, lightly stroking your grumbling stomach with your fingers. Once Maki's dick is gone, you lick at his groinal slit to dab up any lingering traces of cum before hauling yourself up onto the bed beside him. Once comfortable, you ask how he feels.");
	output("\n\n\"[pc.name]... that was amazing,\" he slurs as he finally gets enough muscle control back to drape his tail over you. You reach out and affectionately stroke his " + makiusBellyDescriptor() + ", petting him like a sleepy dog who nevertheless just did a very clever trick. He closes his eyes and whimpers in delight; a happy, satisfied smile plastered on his face.");
	output("\n\nIt doesn't take long for his breathing to even out and slow down; heavy breathing signalling that the Venarian is fast asleep. You smile and plant a gentle kiss on his mouth, before sliding quietly off the bed and leaving him to get some rest. You must have really worn him out….");
	addButton(0, "Next", makiusLeave);
}

public function makiusSexForceChange(cock:int):void{
	clearMenu();
	clearOutput();
	processTime(30);
	author("LukaDoc");
	makiusSubbed(5);
	showBust(makiusBust(2));
	var cumQ:int = pc.cumQ();
	output("\"You want to what!?\" His ears stand up in surprise when he hears what you intend to do. You tell him that the image of him, ready to be bred, just won't leave your head; he looks so sexy like that, " + (flags["MAKI_TAKING_BIOVEN"] == 2?"with his enormous":"swollen in all the right spots,") + " moist ass. Aching to have pups fucked into him... you want to make him change back into that state, and you want to try and change him now.");
	output("\n\n\"B-But that takes a lot of work! For both of us!\" He protests. \"It's not something simple that either of us can do so suddenly and-\"");
	output("\n\nYou interrupt him there, wrapping your arms around him and pulling him into a kiss, silencing his protests by thrusting your [pc.tongue] over his lips, your hands caressing at his butt and stroking his tail in the way you just know gets him turned on.");
	output("\n\n\"And....\"");
	output("\n\nYou kiss him, squeezing one asscheek with one hand, the fingers of your other hand worming their way into his crack and starting to circle the sensitive ring of muscle that is his back passage.");
	output("\n\n\"Let's try....\" He finally caves with a dopey smile and a whimper of delight, practically melting under your touch.");
	output("\n\nYou kiss him again, stroking his back with one hand even as the other continues playing under his tail, feeling his expert muscles rippling as if to draw your fingers in. You stop kissing his lips and start kissing your way across his face and down his neck, ending only when your Venarian lover is laying belly-up on the bed, ready for you to begin the next step. Maki's tail snakes it's way around your waist, wrapping and caressing you. Gently, the tip of his tail moves to your [pc.cocks] teasing your [pc.cock " + cock + "] with it's soft fur.");
	output("\n\nYou let him continue stroking you, fixated on the greater prize at hand. You spread his legs apart to reveal the alien nature of his crotch, his prick already erect, hard and throbbing in wanton lust, drooling precum like a steady fountain. You reach in with an authoritative hand to stroke his shaft, closing your fingers around it and feeling its warmth, precum sliding slick and gooey over your fingers as you slide it up and down, dimly aware of it throbbing in time with his heartbeat.");
	output("\n\nThe Venarian's breathing quicken as you tease his shaft, a small moan escaping him as you gather his slick pre. Fingers thoroughly coated, you remove your hand from his dick, sliding them into his asscrack to probe insistently at his butt. The alien's well-trained pucker opens to accept them, your pre-lubed fingers sliding in and rolling around, stretching it out with gentle touches and wriggles, ensuring he's lubed and primed for insertion. Maki whimpers in pleasure as you stroke his innards, particularly when your fingers rub at his prostate, causing his pre-dribbling cock to throb and shoot out a small jet of pre on his belly.");
	output("\n\nSatisfied with his lubing, you remove your fingers and lower yourself on top of him until your [pc.cock " + cock + "] is laying against his, the kinkiness of your action having helped get you in the mood. You can feel the sticky wet warmth of his shaft against your own, and you slide yourself back and forth along its length, hissing to yourself as you feel the sensations sparking along your nerves. Your hands worm their way between your bellies to start scooping up the precum he is gushing like a fountain. Hands filled with alien proto-jizz, you start to lather your shaft with it, massaging it along your length and caressing his dick in the process.");
	output("\n\nMaki swallows audibly, forcing back a moan of pleasure. \"[pc.name], I think I'm ready for you now.\"");
	output("\n\nYou nod your head absently and wriggle around until you can throw his legs over your shoulders and align your dripping dick with his butt. Holding him for support, you begin pushing forward; it's not as easy as when he's ready for you to breed him - his ass is actively resisting you, despite the lubing, and you groan as the tight ring of muscles squeezes against you, trying to keep you out despite Maki's wishes... but you keep pushing in, until finally you manage to work your tip inside.");
	pc.cockChange();
	makius.buttChange(pc.cockVolume(cock));
	output("\n\nThe Venarian arches his back once you finally pierce his resisting pucker, toes curling and tail gripping your waist tightly. His sphincter contracts around your shaft, gripping you deliciously as his shaft throbs. Savoring the moment, you push in slowly, inch by inch - partially due to how tight he is, but partially just to enjoy his whimpering in pleasure as you slowly stretch him fuller, until at last you have hilted yourself inside him. Maki gasps, throwing his head back in a whimpering moan as his alien cock tenses and spews a few ropes of his seed over his belly and chest.");
	makius.orgasm();
	output("\n\nThe Venarian's tongue lolls out. He pants, eyes closed, his ass grabs you tightly despite having come down from his climax. He takes a glance at you, making eye contact for an instant before averting his gaze, obviously embarrassed by his own excitement. Well, you note, looks like he's enjoying himself, you tell him. He closes his eyes, were it not for the fur covering his face you have no doubt he'd be burning red with embarrassment by now.");
	output("\n\nYou simply chuckle and start to pump yourself inside his butt, slowly at first, slowly increasing the pace as he grows more accepting of your thrusts.");
	output("\n\nMaki moans, rhythmically contracting his ass with in time with your thrusts. \"H-Harder,\" he moans.");
	output("\n\nYou grunt back and start to push yourself, thrusting harder and harder as he coaxes you onwards.");
	output("\n\nFor a time there is no sound but the moans of pleasure from two lovers' throats and the slapping of flesh on flesh, but you can feel yourself getting ever closer to the edge. With a grunt and a groan, you " + (pc.hasKnot(cock)?"push until your [pc.knot " + cock + "] manages to cram itself in":"thrust as deep inside of him as you can") + " and allow yourself to cum. Maki moans as you finish inside of him and allow yourself to settle atop his soft, flat, fluffy-furred belly, but you keep your cock firmly plugged " + (pc.hasKnot(cock)?"by your [pc.knot " + cock + "]":"inside of him") + "; you're not done with him yet.");
	makius.loadInAss(pc);
	pc.orgasm();
	output("\n\nThe two of you lay there, panting together, recovering from your recent exertions, before you start to move. Though it's a little tricky, you manage to pull the two of you upright so that you are both sitting together, Maki in your lap facing you with your cock still firmly in his butt. You seize your little doctor-slut's lips in a kiss, pulling him tightly against you, one hand stroking his long tail, the other petting his ears. Maki's been mostly passive since the two of you started, but now that he's in a more favorable position the Venarian begins truly reciprocating.");
	output("\n\nHe caresses your back, wrapping you into a hug, thrusting his furred chest forwards to rub himself on you, legs wrapping around your waist. His tail coils " + (pc.tailCount != 0?"around your own":"around your midriff") + ", his ears flatten as he whimpers into your kiss, obviously delighted to finally be able to get his hands on you. You let his lips go and start to nuzzle his neck, even as you " + (pc.hasKnot(cock)?"pull out your [pc.knot " + cock + "] and ":"") + "begin bouncing him atop you, rocking him up so he can fall back down on your [pc.cock " + cock + "], which is quickly growing hard again.");
	output("\n\nYou groan as his ass clenches around you, further quickening your recovery. Maki groans, his own Venarian prick back at full mast and leaking pre. He hugs you close, using your shoulders for support as he moves along with your bounces, impaling himself on your shaft as you guide him with your hands.");
	output("\n\nYou continue to stroke and nuzzle at him as you bounce him up and down, before distractedly suggesting that maybe he should do some of the work himself.");
	output("\n\n\"M-Myself?\" He asks through a haze of lust.");
	output("\n\nYou nod and move your hands to his prick. Slowly you begin to caress it, stroking it up and down, touching all the spots you just know he likes best.");
	output("\n\nMaki moans, absentmindedly thrusting against your grasping hands. His thrusts lift him off your own [pc.cock " + cock + "] and gravity brings him back down. It doesn't take long until he build a pace that's pleasurable enough for the both of you.");
	output("\n\n\"Ah, [pc.name]. I think I'm... ah... getting close.\"");
	output("\n\nYou smile wickedly at that and pick up the pace, trusting him to worry about getting you off while you focus on getting him off with your hands. He continues thrusting, until eventually his thrusts grow erratic.");
	output("\n\n\"C-Close!\" Feeling his ass clenching around your cock, your own orgasm close, you grunt and " + (pc.hasKnot(cock)?"shove your knot into him yet again":"thrust") + "; even as he submits and fires his seed wildly into the air, you struggle to hold your hands over his tip, intercepting the shots even as your own body writhes and fires its load into his wet, welcoming ass. The two of you buck and thrash together until finally your orgasms subside and you mutually sink onto the bed, still side by side, struggling to hold his shaft and his load in your hands without spilling any.");
	makius.orgasm();
	makius.loadInAss(pc);
	pc.orgasm();
	output("\n\n\"I don't know how much more of this I can take.\" He pants, eyes closed.");
	output("\n\nYou simply grunt absently, still trying to figure out how you can remove your hands and not drip cum everywhere.");
	output("\n\n\"Oh, sorry about that. Here let me take care of this.\" He grabs one of your hands and brings it level with his muzzle, extending his tongue and licking your palm clean of his seed. You smile at the ticklish sensation. He repeats the action on the other one and before long, your hands are clean. \"There you go.\" He smiles tiredly at you. You return the smile and gently pet his ears with your still-damp hand, but he seems not to notice - or to care. \"Can I take a short rest?\"");
	output("\n\nYou agree and shift your hips, " + (pc.hasKnot(cock)?"tugging on your [pc.knot " + cock + "] until it pops":"pulling") + " out of his now-loose ass, absently noticing the trickle of escaping seed that follows.");
	output("\n\n\"Thanks....\" he whispers.");
	output("\n\nYou caress your lover in response; not sexually, merely conveying comfort through your touch. You watch absently as his chest rises and falls in time with his breathing, gradually becoming more even. As it does, your hand slides down the small of his back to stroke his tail and, from there, to give exploratory brushes of his buttcheeks. Hmm... his ass definitely feels fuller and rounder under your hand; it looks like this idea is actually working...");
	processTime(20);
	output("\n\nEventually, you grow tired of waiting for him to take the initiative; you're so close now, he can't back out! With that in mind, you surge forward in a powerful flex of muscles, spinning him around so he's lying on his belly.");
	output("\n\n\"Whoa! What's up?\" He questions.");
	output("\n\nYou half-playfully chide him at sleeping on the job; he's had enough time to rest, now it's time to get back to fixing him up.");
	output("\n\n\"But- Eeep!\"");
	output("\n\nYou cull his protests with a soft slap on his butt. You grab his tail and lift it up, gently lifting his " + (makiusMasculine()?"boyish":"curvy") + " hips so he's on his knees.");
	output("\n\nHe looks back at you, then smiles softly. \"Go on then....\"");
	output("\n\nYou smile back at his approval and reinsert your hard [pc.cock " + cock + "] back into his still loose ass, enjoying the familiar heat and tightness of the Venarian's butt.");
	makiusToBreeder(false);
	output("\n\nYou fuck him over and over, driven by your desire and lust. Eventually losing the count of how many times you fill his ass with your [pc.cum]. The more you fuck him the more eager he is " + (cumQ > 500?", even as his belly begins distending from your repeated loads":"") + ". Every time you fill him up with a new batch you can feel his ass growing. Becoming a bit rounder and fuller, it's not long before it grows into a soft, yet firm, cushion that you are only too happy to thrust against." + (makiusMasculine()?"":" When his breasts begin growing, you smile and eagerly pinch his erect nipples.\n\n\"Ow!\" He moans in pleasured pain. Under your ministrations and tenders caresses you feel his chest grow. From a flat chest, into a small A-cup and finally into a perky B-cup. You can't resist giving his nubs a small bite as he hugs you tightly."));
	output("\n\nYou dump one last load onto the willing Venarian, straining as you lean over his back. Hips flush with his cushiony butt. Maki groans, cumming onto the bedsheets below. The two of you collapse nervelessly. The Venarian smooshed between your weight and his " + (cumQ > 500?"bloated ":"") + "belly groans in delight. You enjoy the afterglow, even as you feel your seed " + (pc.hasKnot(cock)?"sloshing around your [pc.cock " + cock + "], all of it still inside his ass thanks to your knot. Despite that, you can feel his own natural moisture leaking out, while":"slowly seep around your [pc.cock " + cock + "], still deeply embedded into his ass. His own natural moisture leaking with your cum as") + " his ass continues to suck you inside, milking you for all you're worth.");
	makius.orgasm();
	pc.orgasm();
	output("\n\nYou decide that now is the time to pull out and, as lubed as he is, " + (pc.hasKnot(cock)?"it's still hard to tug your [pc.knot " + cock + "] out, mostly because of":"you don't find it that hard, despite") + " his boypussy's insistent efforts at keeping you there. You back away slightly so you can observe your lover's altered form; tongue lolling out, a blissful expression on his lips, resting atop a " + (cumQ > 500?"pregnant-looking belly that reminds you of what nature will compel the alien to do once his hormones sink in":"flat belly") + ", Maki's tail waves lazily above his full, lusciously gropable butt, his asshole still open in the distinctive shape of your [pc.cock " + cock + "], even as it slowly leaks moisture and jism with each idle flutter, as if still trying to grip a phantasmal member.");
	output("\n\nWhen you move to take a step back, Maki suddenly looks back at you confusion clear on his face. \"Where are you going, [pc.name]? I can still take it. Let's do more!\" He grins, licking his lips. With a smile on your lips, you slap him softly on his butt, unable to resist grabbing the jiggling cheek and massaging it with your hand. \"Ohm, yes... stick it in!\" He demands wiggling his hips side to side, his tail slowly curling around your midriff. Amused, you repeat your action with the other cheek, but then let go and gently untangle his tail from around you.");
	output("\n\nSliding off the bed, you tell him that, as much as you love his new looks, you had better let him settle properly into them before you come back for more.");
	output("\n\n\"But I want you now!\" He protests.");
	output("\n\nWell, he'll just have to be good and wait for you to get ready, you reply, giving him a parting affectionate pat on the butt. A part of you considers asking him to clean you up, but you realise that's probably too much temptation for the Venarian in his present state. Instead, " + (pc.isNude()?"head for the door.":"you collect your clothes and redress yourself."));
	output("\n\nHe whimpers, rolling around and sitting up on his bed. \"You can't just change me and leave me wanting more....\" He pouts, making his best impression of puppy eyes.");
	output("\n\nYou promise him that you'll come back for more later, but right now he needs to sit and let his changes really sink in, especially if he has hopes of getting pregnant in the near future.");
	output("\n\n\He grunts, frustrated that his attempts at enticing you proved futile. \"Fine then... but come soon okay?\" He looks at you lovingly. \"You are lucky I can barely move my legs right now, otherwise I'd be all over you already.\"");
	output("\n\nYou pat him on the head and and tell him once more to behave himself while you're gone.");
	output("\n\n\"Only because I love you.\"");
	output("\n\nAffectionately you nuzzle your lover and then you leave, knowing he's grinning fit to make his ears fall off behind you.");
	addButton(0, "Next", makiusLeave);
}

/** args is an array consisting of:
 * 0: cock id to use
 * 1: boolean that is true if called from the aphro scene
 */
public function makiusSexLustyFuck(args:Array):void{
	clearMenu();
	clearOutput();
	processTime(100);
	author("LukaDoc");
	makiusSubbed(2);
	showBust(makiusBust(2));
	output("You seize your Venarian and pull him into a kiss, passionately consuming his lips with your own, thrusting your own [pc.tongue] as far into his mouth as he will allow you, only to pull away and push him over onto his bed, letting him stare up at you as he pants with lust. You move to where he can see you better, letting him admire your form, one hand sweeping seductively down your body to rest on your hip, flaunting your erect [pc.cockNounSimple " + args[0] + "] for his appraisal. Maki swallows audibly, licking his lips at the sight.");
	output("\n\nIt's quite obvious that this is exactly what he wants. You slide your way seductively into his bed, straddling him, brushing your erect [pc.nipples] and [pc.cock " + args[0] + "] against his body as you sinuously drape yourself over him, then hungrily twining your arms about his neck to hold him still so your lips can fasten to his.");
	output("\n\nThe Venarian moans at the feeling of you sliding up against his body, his own cock erect and bobbing with the sparks generated by your touch. Once you are within reach he hugs you tightly, pressing himself against you and poking at you with wet shaft. You kiss him, plastering teasing, butterfly-like pecks across his lips, and stroke his hair and mane, grinding yourself against him, stroking his shaft with your own in a tauntingly casual way. He responds whimpering at your kisses and nuzzling you affectionately, hands roaming your body, tail coiling around your body, one leg draping over you. It doesn't take long for his questing hands to find your hard [pc.cock " + args[0] + "].");
	output("\n\n\"I want you,\" he whispers.");
	output("\n\nYou know that he does, you whisper back, then kiss him again, grinding your cock against the wet, slick length that is his own shaft. So, if he wants you, you tell him, then why doesn't he come and get you? And with that you slide yourself off of him, taking a position beside him, making an open presentation of yourself, giving him the opening to mount you - if he dares.");
	output("\n\nMaki grins; he quickly raises himself off the bed and straddles you, nestling your [pc.cock " + args[0] + "] in his butt-cleavage. He looks down at you adoringly, slimy Venarian cock dripping on your belly. He shudders with barely contained excitement and leans over to kiss you again, grinding his butt against your cock, tail whipping about wildly behind him. You moan encouragingly and lift your hips slightly to thrust under his tail, sliding it through the round valley of his ass, making it clear that you're ready for him. Not one to disappoint, Maki reaches back to grab your shaft and aim it at an angle. Then he lifts his butt and begins making his way down your length. You practically glide inside his tight boy-pussy; whimpers of delight and slutty moans echo around you as Maki impales himself on your shaft.");
	pc.cockChange();
	makius.buttChange(pc.cockVolume(args[0]));
	output("\n\nYou gasp and groan, lifting your hips to facilitate his descent downwards, feeling the hot wet silky flesh of his ass envelop you and embrace you, reaching your fingers up to stroke his " + (makiusMasculine()?"flat chest":"full breasts") + " and play with his nipples, rolling them between the tips of your fingers, pinching them gently with finger and thumb. The lusty Venarian moans at your ministrations, clenching his backdoor at every pinch, milking you despite not even having begun moving. You remove your hands from his " + (makiusMasculine()?"chest":"breasts") + " and move them to his hips, placing them there and making it clear you're ready for him to start moving, rising your own [pc.hips] up, just once, to give him the signal to start.");
	output("\n\nMaki starts out slow, with steady movements. There is no resistance at your repeated penetrations, only the slick acceptance of an eager butt. Moments later the Venarian doctor begins speeding up, working himself into a faster rhythm that makes lewd slapping noises every time your hips meet. You gasp and groan, encouraging your partner with every perverse noise and gesture you can think of, pleasure wracking your body as he milks you and caresses you, leaving you helpless beneath him.");
	output("\n\nMaki lifts himself away from you and puts his hands on either side of you, supporting his body as he speeds up his tempo, milking you with more force, moaning and whimpering in his desire for you fertile seed. You feel the delicious pressure inside of you and you cry out as climax washes over you, sparks of pure pleasure caressing your [pc.skinFurScales] as you " + (pc.hasKnot(args[0])?"knot him and ":"") + "empty yourself into your writhing, lustful lover. Your Venarian lover holds himself seated on your pole of pleasure, mouth agape and drooling as you embed your cum deep within his ass. Despite his throbbing cock and contracting sphincter, you realize that the Venarian still hasn't reached orgasm and you are done before he even has a chance to. Still he doesn't seem to mind; he collapses on top of you with a silly, satisfied smile on his face.");
	pc.orgasm();
	makius.loadInAss(pc);
	output("\n\nYou stroke your Maki's ears and pet his head gently, tenderly caressing him, even as you heave breath back into your lungs. Once you regain yourself, you comment that he didn't cum yet.");
	output("\n\n\"That's alright, [pc.name]. I'm fine. I already got what I wanted.\" He grins");
	output("\n\nOh no, you're not letting him get out of this without coming as well... In fact, you add, realising that your own cock is still buried in his ass and you still feel more than frisky enough to keep going, you're not going to give him the choice. Before Maki can think to reply, you surge up from your prone position, rolling him over so that you are pinning him down. He squawks, but you cut him off with a kiss, hips already starting to piston back and forth as you " + (pc.hasKnot(args[0])?"pull your knot out and ":"") + "resume fucking him, trying to kiss him in time with each plunge into his ass, releasing his lips as you slide back out.");
	output("\n\nHe has nobody to blame for this but himself, you tease him as you begin to pick up the pace. Why, it's his pheromones that are keeping you so stiff and so horny - so that means it's his responsibility to keep helping you until you both get off.");
	output("\n\nHe tries to chuckle in-between his little moans of pleasure. \"I… ah… understand.\" He hugs you tightly with both his legs and his tail, arms wrapping around your neck in a light hug. \"R-Ravage me to your heart's content then.\"");
	output("\n\nWell, if that's what he wants, you whisper into his ear, and continue to thrust in and out. No need for roughness or fancy play here, just a constant pounding, steady and tender, sliding your shaft in and out of his silken passage, feeling it squeeze and caress you with each plunge inside of himself. Maki looks lost in bliss, his shaft swinging about wildly as your thrusts rock his body, you realise he will need a bit more work before he cums. You plunge yourself deeper and deeper inside of him, seeing just how far into him you can reach, even as one hand grabs his dick and starts to stroke it furiously, your fingers gliding freely over the slick, slimy organ. From the ferocity of your thrusts you begin to bend him over, aiming his dick squarely at his face.");
	output("\n\nThe Venarian doctor is completely oblivious to what you're doing, all he manages to do is stare into nothing and moan with every thrust of yours into his prone form. In one particularly deep thrust, his eyes suddenly bulge and you hear a strained whimper as his cock fires a rope of cum over his snout. The feeling of his own seed spattering on his face seems to jog him out of his trance-like state. He barely has time to react before another strand of cum shoots across the first one, hitting him on the forehead.");
	makius.orgasm();
	output("\n\nThroughout all this, you never stop your fucking, driving him on as he tries to hold back and think about how to escape his predicament. You never relent though, and with " + (pc.hasKnot(args[0])?"one last knotting":"another forceful") + " thrust he opens his mouth in a moan of pure pleasure. His pent up seed forces it's way past his cumvein and out into the air, landing on his open mouth.");
	output("\n\nArousal spikes inside of you at the perverse sight, watching with pleasure as your lover slurps and snaps, gulping down his own spunk as it sprays into his mouth. It pushes you over the edge again, mingling with the cruder delights of feeling his hot flesh wrapped around your own, and you cum into him again, feeling the thick [pc.cumNoun] gushing inside of him, painting his interior [pc.cumColor]. You gasp and shudder as you spend yourself inside of him, and then, at last, you slip down into his arms, sleepily embracing him as the afterglow's warmth washes over you.");
	pc.orgasm();
	makius.loadInAss(pc);
	output("\n\nYou look at Maki; despite him being able to drink a good amount of his seed, some of it still missed his mouth and is now matting his face. You chuckle at the sight.");
	output("\n\nHe wipes a strand off his muzzle and brings it to his mouth, licking his finger clean. \"That was mean of you, [pc.name].\"");
	output("\n\nOh, as if he didn't love it, you laugh, tapping him playfully on the nose with one finger. By the way, he missed a spot, you tell him. You lean in and lick a particularly thick strand of his seed from his lips, savoring the taste of him as you do so.");
	output("\n\nHe pouts. \"Hum… 'fine. At least help me clean up then.\" He does his best to appear moody, but from his slight smirk you can tell he's actually beaming. You help him lick and wipe the smears of semen from around his face, focusing on his forehead and the top of his muzzle... you know, you don't think you ever noticed before just how wiggly his ears are. They flick and they twitch and they move all the time... especially when you're kissing them, or gently nipping at their tips.");
	output("\n\n\"H-Hey! Cut it out, that tickles!\" Maki protests, doing his best to move his ears away from your prying fingers and mouth.");
	output("\n\nYou persist, following his head and playing all the more with his ears; blowing across them, nipping them, stroking them, fondling them...");
	output("\n\n\"C'mon [pc.name]! You are starting to annoy me!\"");
	output("\n\nThen why doesn't he stop you, you tell him, a smirk on your lips.");
	output("\n\nWith a growl that is more playful than angry, Maki lurches forward, grabbing you around your chest and pulling you over on your back. You look at him, twining your arms around his waist so he can't escape you either. He nuzzles you, pushing your chin away so he can get to your neck and nip at you. You struggle and writhe underneath him, playfully trying to fight your way free and tumble him over. As soon as you do, however, he starts trying to turn the tables, until the pair of you are just a writhing set of limbs lying beside of each other. You can feel his cock growing stiff against your [pc.belly], wet and slimy as it starts to ooze precum again, and you realise your own cock is growing hard again, still trapped within his ass. The two of you stop for a moment, panting and smiling at each other. You feel Maki contracting his sphincter and your [pc.cock " + args[0] + "] throbbing in response.");
	output("\n\n\"So, I take it you enjoyed wrestling me?\"");
	output("\n\nNot as much as he seemed to enjoy it, you reply.");
	output("\n\nHe chuckles. " + (args[1]?"I should spike your drink more often.\n\nOr maybe <i>you</i> should spike his drink, next time...\n\n\"I don't think you could possibly make me want you any more, [pc.name].\" He grins.":"\"I wonder what brought all of this on, not that I'm complaining.\"\n\nYou just smile and stroke his head. Maybe his pheromones really got to you, or maybe you just felt like toying with him. He leans against your touch, enjoying being caressed by you."));
	output("\n\n\"Anyway, you are my mate. And I should take care of you. So just sit back and relax, I got this.\" He pulls away from you, some of your spooge leaks from his abused ass, but it takes only a moment for him to clench it and stop the flow. You sigh, shivering slightly at the cold feeling of air on your cock now that it's out of Maki's passage, and then shift over so that you're laying on your back. Maki crawls over you, smiling as he does so; then slowly he crawls back and leans over, towards your shaft.");
	output("\n\nYou gasp and moan quietly as his broad, wet tongue glides across your still so-sensitive member. He continues his licking; softly slowly and thoroughly. You sigh in pleasure, losing yourself in the tender strokes of his tongue. Sometimes, when he touches a particularly sensitive spot, you buck; nearly driving your dick into his mouth. And whenever you buck, Maki looks mischievously at you. It takes a while, but eventually you start getting used to his tongue stroking your cock. So you resolve to just close your eyes and let him do all the work. Moments later you feel warmth engulf you as Maki begins fellating you in earnest; first by sucking you in as far as he can manage, then by pulling back until only your [pc.cockhead " + args[0] + "] is in.");
	output("\n\nHe teases you by licking around your glans and pressing his tongue against your urethra. You shudder and moan, feeling the ticklish sensation of his flesh on yours, slathering your cock in his saliva and leaving you hard and horny, aching for his perverse kisses. Your dick starts to leak [pc.cumNoun] in response to his licks, and you're sure that with only a little more effort, he could coax a third climax from you. He begins bobbing his head, slowly at first, but quickly increasing in tempo. You mewl in delight and thrust your [pc.hips], voicing your encouragement to coax him ever onwards in his actions.");
	output("\n\nOnce he reaches a rather fast rhythm, he sucks you in all the way to the back of his throat, and with a little wiggling he manages to welcome you even deeper into its recesses. You moan as you feel yourself wrapped so deliciously tight, the warm wetness of his mouth an incredible salve on your flesh, pleasure sparking along your nerves, blazing into your brain... He holds you there, swallowing and licking around your shaft, it's slick and warm, and it holds your [pc.cock" + args[0] + "] so deliciously tight that you don't think you have much longer. A couple extra swallows is all that you can take as you finally spew your third load down his throat. You thrust your shaft as deeply into his mouth as you can, feeling yourself emptying into his belly.");
	output("\n\nYou cry at him to take it all, to drink every drop that you have to offer him, your nerves afire and your brain melting into a puddle of pure pleasure as you unleash your third cascade of jism into his waiting throat, a final gush of [pc.cumNoun] erupting from within you and spearing it's way straight through his throat, settling in his belly. When you are finally done, you feel Maki quickly pulling away. He gasps for breath. You let out a huge moaning sigh and slump down on your back, fully spent for the moment.");
	pc.orgasm();
	output("\n\nYou ask Maki if he's alright.");
	output("\n\nHe coughs a couple times. \"Yeah, I'm fine.\" Then he grins. \"But you know I can never have enough of you.\" He nuzzles into your limping [pc.cock " + args[0] + "], inhaling your musk deeply.");
	output("\n\nHe really is quite incorrigible, you tell him, even as you stroke him affectionately on the head. Maki looks up at you and jumps at you, hugging you tightly as he nuzzles you affectionately. Well… if he really can't get enough of you; then you suppose you could give him more. You nuzzle him back, even as you begin grinding against him. It takes a bit of work, but your dick slowly starts getting hard once more….");
	output("\n\n<b>Later…</b>");
	output("\n\nYou stretch, or at least attempt to. Maki is still fast asleep and you seem to have finally managed to stoke the flames of your lust. Carefully you disentangle yourself from him and hop out of the bed. Finally… you stretch yourself until you hear your joints pop. As much as you'd like to keep the sleeping Venarian company, you have other things that require your attention." + (pc.isNude()?"":" So you fish up your [pc.gear] and don them once more.") + " You start on your way out of the doctors room, but before you leave, you decide to walk back and give him a little kiss on cheek. His lips curl into a smile and you bid his sleeping form farewell.");
	addButton(0, "Next", makiusLeave);
}

//this scene is ripped from the original file's "Sleep With" content, which was cut for being too large.
public function makiusShowerSex():void{
	clearMenu();
	clearOutput();
	processTime(30);
	author("LukaDoc");
	showBust(makiusBust(2));
	output("You ask Maki if he'd like to join you in the shower.");
	output("\n\n\"I'd love to! It's pretty tough washing off my fur by myself,\" is his reply.");
	output("\n\nSince he's obviously willing, you head towards the shower, confident that Maki will follow you. Once there, you " + (pc.isNude()?"":"remove your [pc.gear] and ") + "start setting up the water to just the right temperature, and then step inside, letting the liquid cascade down your body and over your [pc.face].");
	output("\n\nThe Venarian wastes no time in following after you, hugging you under the warm water as he grows increasingly wet. He directs you to his collection of shampoos and soaps; you examine each before making your choice.");
	output("\n\nHowever, as much as you'd like to reach for one, it's kinda difficult to do that with your Venarian attached to you. You jokingly ask if he could spend 10 seconds off you.");
	output("\n\n\"Don't wanna,\" is his short reply. He nuzzles you affectionately before slackening his grip and adding, \"but I guess I have to.\"");
	output("\n\nThat's a good boy. Now released, you take your choice and turn to face him, asking him where he'd like you to start soaping him up.");
	output("\n\nHe smiles and hugs you again, nuzzling you affectionately. \"Wherever you want,\" he replies.");
	output("\n\nYou can't help but notice a familiar presence jutting out of his groin; seems like your little Maki's been having a few select thoughts about bath time. You could just ignore it, bath time is for cleaning up and groping, not getting even dirtier… but it does have its merits, maybe you could humor him and grant him release?");
	addButton(0, "Tease Him", makiusShowerSexTease);
	if (pc.hasVagina() || pc.hasCock()){
		output(" Of course, you could always force him down on his knees and make him play with you instead.");
		addButton(1, "Get Oral", makiusShowerSexGetOral);
	}else{
		addDisabledButton(1, "Get Oral", "You don't have any genitals");
	}
	addButton(2, "Stroke Him", makiusShowerSexStrokeHim);
}

public function makiusShowerSexTease():void{
	clearMenu();
	clearOutput();
	processTime(60);
	author("LukaDoc");
	showBust(makiusBust(2));
	output("You decide not to indulge your overly eager Venarian lover this time, reasoning that if you did have too much fun with him right now, you'd just both wind up dirtying yourselves.");
	output("\n\nThat said, it's time to shampoo him. You instruct Maki to turn around so you can start with his back. He eagerly complies, though he does look the slightest bit disappointed at having to let go of you.");
	output("\n\nYou start on the top of his head, slowly lathering the herb-scented liquid into a fine, bubbly cream. Maki's mane tangles with your fingers, but a little struggling is all you need to make sure you can comb through it.");
	output("\n\nBy the time you finally move to his neck, he's got his eyes closed, whimpering in delight at your stroking of his body. His tail coils around you lovingly; it's a bit tough to move like this, but you appreciate the gesture. A few quick pats on the prehensile appendage is all you need to buy yourself some leeway so you can work his shoulders, though it doesn't let you go.");
	output("\n\nMaki's back is bigger than it looks, due in no small part to his sinuous build. Throughout your dutiful washing of his broad back you manage to find small sensitive spots, and you can't resist toying with him by teasing him in those spots. This earns you a wide variety of whimpers, coos and sighs from the Venarian; there's even one that makes his leg twitch, and you can't resist but be reminded of a dog when he does that.");
	output("\n\n\"I-I'm not a dog!\" he protests in mock anger. All it takes is a stroke of his soft ears to silence him. Laughing, you bop him on the nose with a soapy finger, leaving a bit of white foam on his nose. He quickly shakes it off and you go back to your task.");
	if (!flags["MAKI_STATE"]){
		output("\n\nFinally you make your way to his butt. Toned, but not overly muscled that you wouldn't find purchase if you gave it a quick squeeze, which you do. That earns you a gasp, though Maki himself seems to be enjoying your appreciation of his hind end.");
		output("\n\nYou stroke the base of his tail, wondering if it'll stop waving about and coiling around you so you can wash its length, well… you can always come back to this later. So you decide to focus on his butt, ensuring not only that its clean, but that it's well groped too.");
		output("\n\nHis expression is priceless, a happy smile with his tongue lolling out. Especially when you tease his tight little pucker. It's fun to hear him gasp whenever you threaten to press a finger inside, though he doesn't thrust back against your finger you know that he greatly enjoys being toyed with there.");
	}else{
		output("\n\nFinally you make your way to his butt. Pillowy and plush, its flesh yields to your groping hands like a cushion. You caress and squeeze the cheeks well as you clean them, earning yourself a wide array of moans and whimpers as the Venarian enjoys the attention on his back end. Supporting himself on the shower's wall, he thrusts his butt out for you to get easier access to it. You respond with a slap, which sends the two orbs jiggling and earns you a moan.");
		output("\n\nWashing his tail while he's like this is useless; even if you could get him to release you, you doubt it would sit still long enough for you to properly wash it. So for the moment you settle for teasing along it's base, which earns you a few appreciative bucks from the excited doctor.");
		output("\n\nHe looks to be completely immersed in bliss, not even caring that he's wearing such a silly expression. His mouth is ajar, with the tongue lolling out carelessly; he's leaning so far against the shower wall that he might as well as start licking it anytime. You chuckle at his reaction, he <b>really</b> likes having his butt toyed with, huh?");
		output("\n\n\"O-Only if it's you,\" he manages to say between gasps and moans of enjoyment.");
		output("\n\nThat so? In this case you'll endeavor to toy much more with it! You slap him again, making him jump slightly.");
		output("\n\nWithout so much as a care you spread his cheeks to check out the treasure he keeps hidden in that enthralling valley of his. His pucker winks lewdly at you; and you find that all it takes is a small poke to have it fighting to draw your finger inside. Moisture is no doubt leaking from the wet orifice, but with the shower water running you couldn't tell what really is and what isn't his juice.");
		output("\n\nThis is too good an opportunity for you to not take advantage of, you test the waters by pushing your index in, basking in the warmth of his innards as he moans lasciviously, bucking back at you like a bitch in heat. You wiggle and pump your finger inside and to your surprise you find his moaning getting shakier and shakier. It's not until you watch his cock throbbing and spewing it's load against the shower wall that you notice you've driven the good doctor into an orgasm.");
		makius.orgasm();
		output("\n\nWhat a naughty boy he is, you tease. You just poked his backdoor and that was enough to get him going? Just how excited can he get?");
		output("\n\nHe chuckles with a silly smile, tongue still lolling out as he turns to gaze appreciatively at you. \"That felt good,\" is his panting excuse.");
		output("\n\nWell he's not making your job any easier and with a last slap on his jiggly butt you move on with your task.");
	}
	output("\n\nHis front is much easier. A stroke here on his neck, a pinch there on his nipples, maybe a small lick when you feel like it, rewarding you with a moan at every touch. He's enjoying the treatment almost as much as you're enjoying toying with him; it's a sight to see.");
	if (!makiusMasculine()){
		if (flags["MAKI_STATE"] == 2){
			output("\n\nYou turn your attention towards Maki's belly, growing with your child. As you wash it you can't resist putting your cheek against it and feeling its warmth. Maki strokes your head lovingly as you do so.");
			output("\n\n\"All thanks to you,\" he says with a smile.");
			output("\n\nYou tell him you are hardly deserving of all the merits for this. Maki looks good like this, he's a natural breeder.");
			output("\n\nHe smiles happily at hearing that, though he looks a bit embarrassed. \"Hehe, I had a good partner too.\"");
			if (makiusPregLevel() > 2){
				output("\n\nEventually you feel a small kick against your cheek. Your baby just kicked!");
				output("\n\n\"I know right? I felt it too!\" he exclaims happily.");
				output("\n\nYou wonder how much longer it'll take until you can hold the Venarian pup in your arms… your Venarian pup, no less.");
			}else{
				output("\n\nEventually though you're forced to stop, due to the annoyance of having his wet erection jabbing against you as you enjoy his warm belly.");
				output("\n\n\"S-Sorry,\" he apologizes bashfully.");
				output("\n\nIt's fine, you tell him with a pat.");
			}
		}else if (flags["MAKI_STATE"] == 1){
			output("\n\nHis engorged breasts are soft to the touch, and very sensitive too. You take great care washing them, cupping them almost reverently as you circle each erect nipple. Of course, you also make sure to give each one a good lick and a tight suckle, don't want him coming down from his post-orgasmic high anytime soon.");
			output("\n\n\"Oh, [pc.name]! I love you!\" he screams in the throes of pleasure.");
			output("\n\nYou just chuckle and continue teasing him.");
		}
	}
	output("\n\nHaving finished his front; including giving his erect cock a thorough cleaning, though you didn't let him cum " + (flags["MAKI_STATE"]?"again ":"") + ", you decide it's about time he returned the favor.");
	output("\n\n\"Gladly!\" he exclaims, hugging you tightly and nuzzling you lovingly. Shampoo still clings to his body, and you find that he's unintentionally acting much like a giant bath brush. Seeing as you are both enjoying it, you decide not to say anything. He <b>is</b> cleaning you after all… in his own way.");
	var womb:int = pc.findPregnancyOfType("MakiusPregnancy");
	if (womb != -1){
		output("\n\n\"How's my " + pc.mf("handsome", "beautiful") + ", cute, loving soon-to-be mother?\" He asks as he puts his hands on your [pc.belly], lovingly caressing it's form.");
		//assuming getPregnancyTime gives time in womb scaled to incubation speed, triggers after 8 womb months
		output("\n\nYou tell him you're much better, now that you are being dotted by the adorable father of your puppy. By how hard he wags the tail behind him, splashing water everywhere, he truly appreciates the results of your love, the precious little puppy growing within your womb. " + (pc.getPregnancyTime(womb) > 350400?"You feel a kick and by his look he feels it too.":""));
		output("\n\n\"Did you feel that?\"");
		output("\n\nYou tell him you did, watching as his eyes fill with happiness.");
		output("\n\n\"I'm going to love our pup so much.\"");
	}
	output("\n\nMuch tussling and hugging later you are completely washed… and faced with a rather disappointed Maki.");
	output("\n\n\"No fair, I wanted to wash you too….\" he complains.");
	output("\n\nHe did, you reply. Very thoroughly too, you laugh.");
	output("\n\nHe sighs.");
	makiusBathtimeEpilogue();
}

public function makiusShowerSexGetOral():void{
	clearMenu();
	clearOutput();
	processTime(10);
	author("LukaDoc");
	showBust(makiusBust(2));
	output("With a smirk, you squirt some of his shampoo onto your hands, then place the sudsy appendages atop his " + (pc.tallness >= 62?"head":"shoulders") + ", instructing him to kneel for you.");
	output("\n\nNodding, he does as you ask. He looks up at you expectantly, tail waving behind. " + (!flags["MAKI_STATE"]?"He looks completely oblivious to what you have planned.":"His eyes dart towards your groin, lingering there for a moment before he looks up at you again. Seems like he still hasn't caught on to what you have in store.\n\n"));
	if (pc.isHerm()){
		output(" Only one question remains, should you make him lick " + (pc.vaginaTotal() > 1?"one of your pussies":"your pussy") + " or make him blow " + (pc.cockTotal() > 1?"one of your cocks":"your cock") + " instead?");
		addButton(0, "Cock", makiusShowerSexGetOralHerm, true);
		addButton(1, "Pussy", makiusShowerSexGetOralHerm, false);
	}else if (pc.hasCock()){
		makiusShowerSexGetOralCock();
	}else{
		makiusShowerSexGetOralPussy();
	}
}

public function makiusShowerSexGetOralHerm(cock:Boolean):void{
	clearMenu();
	clearOutput();
	author("LukaDoc");
	showBust(makiusBust(2));
	if (cock){
		makiusShowerSexGetOralCock();
	}else{
		makiusShowerSexGetOralPussy();
	}
}

public function makiusShowerSexGetOralCock():void{
	processTime(10);
	var cumQ:int = pc.cumQ();
	output("You can feel your [pc.cocks] growing strong and tall at the thought of violating his warm maw. With a thrust of your hips you bob " + (pc.cockTotal() > 1?"them":"it") + " towards him, waving it under his nose.");
	output("\n\nYour [pc.cockBiggest] bumps against his nose, and he looks cross eyed at your throbbing shaft. Realization dawns on his eyes, but he just smiles. When he opens his mouth to say something, you quickly take the opportunity to shove your [pc.cockheadBiggest] inside.");
	output("\n\nHe looks mildly annoyed at being denied his chance to speak, but quickly forgets about it as he has a far more important task and a far more delicious treat to worry about. He uses his lips, always wary of his teeth, to massage your crown; his tongue teasing your cumvein and licking around it. His hands move to your [pc.hips] in an attempt to steady himself as he begins digging his way towards the base of your [pc.cockBiggest].");
	output("\n\nYou moan softly in pleasure at the feel of him as he caresses your sensitive flesh. As he begins swallowing your length, you return your hands to his head and start to massage the shampoo into his flowing mane, gently at first, so as to not disturb his rhythm.");
	output("\n\nHe closes his eyes, ears swiveling atop his head, before they fall flat on his skull. It doesn't take long until he's taken in all he can. " + (pc.biggestCockLength() < 6?"His breathing tickles your crotch and " + (pc.balls > 0?"his chin nestles against your [pc.balls].":"his tongue swirls all around your perineum."):"He gags a bit in his eagerness to take all of you, but resigns when he sees there's no way he can take in all you have to offer."));
	output("\n\nHe looks up at you, smiling around your cock as he closes his eyes and returns his focus to pleasuring you. His tongue swirls around your length expertly, the nimble muscle coiling around from one side, before releasing and coiling again from the other side. He whimpers in delight, tail moving to wrap around you in affection.");
	output("\n\nYou caress his head with your hands, both petting him for his skill at pleasuring you and rubbing soapy suds from his hair, pushing him back and forth along your shaft as he works, moaning in pleasure at the feelings he knows he is giving you. You gently rub his ears between forefinger and thumb, kneading the sensitive flesh and the fur with gentle touches.");
	output("\n\nUrged on by your loving caresses, he moans around your shaft and tilts his head, presenting you with other areas he'd like stroked and washed. You note one of his hands leaving your hips and moving down towards his own crotch, where his own shaft is erect and demanding attention." + (flags["MAKI_STATE"] == 1?" To your surprise, he ignores it completely and instead moves to stroke his wet pucker. Come to think of it, you should have expected that….":""));
	if (pc.hasCuntTail()){
		output("\n\nSeeing his cock pulsing awakes a hunger in your [pc.tail], one that you feel no willingness to ignore. Down it coils, its ever-thirsty orifice opening to swallow his dripping Venarian dick, causing you to moan as you feel it stretching around his shaft and drinking in his precum.");
		output("\n\nMaki nearly chokes on you, surprised by the feeling of being engulfed by your warm [pc.tailCunt]. His hand squeezes your hip and he begins instinctively thrusting himself into your cocksleeve. His thrusts are awkward at first, but when his other hand re-sets itself upon your hips, he settles on a more steady pace.");
		output("\n\nYou moan appreciatively, your tailcunt clenching down on him as he thrusts, hungry for his seed" + (pc.hasCuntSnake()?" to fertilise its eggs":"") + ", but you shake your head and give his head a push into your crotch, verbally reminding him that your cock still wants his mouth's attention.");
		output("\n\nHe jumps a little, ashamed to have forgotten about your shaft for a moment. He eagerly returns to his task, sucking and slurping like his life depended on it.");
		output("\n\nThe twin stimulants are too much for you; flinging your head back in an ecstatic cry, your tailcunt clenches down on him with all its might, a tightness seizing you in the depths of your belly as your cock explodes into your " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"boy":"") + "friend's mouth, intent on filling him with the liquid expression of your satisfaction as pleasure consumes the entirety of your being.");
		output("\n\nWith one last shudder of pleasure, he all but screams, muffled by your [pc.cockBiggest], as he achieves his own climax. His muscles lock in place, tongue barely capable of guiding your " + (cumQ > 100?(cumQ < 500?"huge ":(pc.cumQ() < 5000?"prodigious ":"gargantuan ")):"") + "load down his throat and into his hungry belly. His nubby tip hardens, opening up his urethra for the onslaught of Venarian seed seeking to inseminate your [pc.tailCunt].");
		pc.fertilizeEggs("tail", 50);
		makius.orgasm();
		pc.orgasm();
		output("\n\nThe two of you stay locked in place, filling each other until you manage to come down from your orgasmic high. You release Maki, allowing him to fall back on his butt " + (flags["MAKI_STATE"] > 0?", which is, thankfully, very well cushioned":"") + ". He pants and coughs, patting his " + (cumQ > 500?"cum-bloated belly":makiusBellyDescriptor()) + " in satisfaction as he recovers from the pleasure overload. His cock still attached to your [pc.tailCunt], it eagerly drains him of the last remains of his seed.");
		output("\n\nYou sigh in relief as the twin sensations of being emptied of seed and having your tail pumped full of baby-goo washes over you. With an act of will you open your tailcunt and let him free, asking if he enjoyed that as much as you did.");
		output("\n\nHe smiles tiredly at you. \"Yeah. [pc.name], my mate, that was the best.\" He sighs, gathering his energy to push himself back to his feet.");
		output("\n\nYou lean down and help him off, maneuvering him into the water to help wash the shampoo from his head.");
		output("\n\nHe lets the waters rinse him and once done, he opens his eyes to greet you with a smile. \"Okay,\" he says, still breathing irregularly. \"We managed to get my mane clean, now we just have to clean the rest.\"");
		output("\n\nYou grin and nod your head at that. Now, where to begin….");
	}else if (pc.hasTail() && pc.hasTailFlag(GLOBAL.FLAG_PREHENSILE)){
		output("\n\nWith an amused impulse, your prehensile [pc.tail] undulates around your [pc.legs] to twine itself around his shaft, curling expertly and with inhuman grace about your " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"boy":"") + "friend's prick and starting to ripple and caress it, stroking it like a makeshift hand.");
		output("\n\nMaki shudders and moans around your cock, his wandering hand stopping in its tracks to set itself upon your hips and steady himself as he begins thrusting lightly. His oral ministrations become a bit more irregular, but he never stops servicing you. You pet him for being such a good boy.");
		output("\n\nYou bite your lip against a moan of pleasure as he sucks with particular eagerness on your shaft in response, tail unthinkingly tightening its grip and stroking him a little rougher and faster than before.");
		output("\n\nHe whimpers in delight, shuddering at the pleasure you are inflicting upon him. It's no secret that he's deriving great enjoyment both of blowing you and being stroked by your [pc.tail]. And considering the way his shaft is throbbing, it doesn't look like he'll hold on much longer.");
		output("\n\nWith a mischievous smirk, and feeling your own pleasure mounting, you start picking up the pace further, using your hands to guide him into sating your own member; you're determined that you won't be the last to orgasm.");
		output("\n\nYour Venarian lover follows your lead with eagerness, redoubling his efforts at draining you for your [pc.cum].");
		output("\n\nYou gasp and grunt, moaning in your pleasure like a " + pc.mf("man", "woman") + " in delirium, the pleasure mounting inside you like an unstoppable wave. As you writhe in the throes of pleasure, your tail vibrates madly milking Maki's cock for all it's worth.");
		output("\n\nYou feel him gasp around your cock, followed by a needy moan as warm wetness sprays around your [pc.tail]. Maki's body locks up, and he's unable to do anything but thrust lightly and suck you; his tongue wraps you in a vice-like grip, milking your shaft as it snakes around your [pc.cockBiggest].");
		makius.orgasm();
		output("\n\nIt's too much for you and, with an ecstatic cry, your resolve breaks and climax sweeps through you, a surge of [pc.cumNoun] flooding from your member into the Venarian's hungry mouth.");
		pc.orgasm();
		output("\n\nHe nearly chokes as the first wave of your orgasm hits, but easily recovers and begins swallowing all you have to offer.");
		output("\n\nYou give yourself over to your pleasure, absently trusting Maki to swallow everything you have to give him. Your tail continues to stroke and squeeze his own gushing prick until, at last, you finish up, blinking your eyes as you snap back to reality.");
		output("\n\nMaki sits back on his " + (flags["MAKI_STATE"]?"cushiony ":"") + "butt, panting and patting his " + (pc.cumQ() > 100?(pc.cumQ() < 500?"rounded belly":(pc.cumQ() < 5000?"bloated belly":"enormous belly")):makiusBellyDescriptor()) + ". His Venarian prick is going limp already, and you watch as it slowly retracts back into its hiding place.");
		output("\n\nWith a smile, you ask if he enjoyed himself.");
		output("\n\n\"Very much so!\" he exclaims, grinning happily. \"But… umm… I don't think we actually got any cleaner.\"");
		output("\n\nSo you didn't, you note. Well, you'll just have to take care of that.....");
	}else if (pc.isNaga()){
		output("\n\nSeeing the promise here, you undulate your serpentine lower torso; it's a little tricky to manage without pulling your [pc.cockBiggest] from his hungry mouth, but you manage to reach around with the tip of your tail and start to caress his cock with your coils, a makeshift hand of looped flesh squeezing and stroking his neglected member.");
		output("\n\nMaki shudders and moans around your cock, his wandering hand stopping in its tracks to set itself upon your hips and steady himself as he begins thrusting lightly. His oral ministrations become a bit more irregular, but he never stops servicing you. You pet him for being such a good boy.");
		output("\n\nYou bite your lip against a moan of pleasure as he sucks with particular eagerness on your shaft in response, tail unthinkingly tightening its grip and stroking him a little rougher and faster than before.");
		output("\n\nHe whimpers in delight, shuddering at the pleasure you are inflicting upon him. It's no secret that he's deriving great enjoyment both of blowing you and being stroked by your [pc.tail]. And considering the way his shaft is throbbing, it doesn't look like he'll hold on much longer.");
		output("\n\nWith a mischievous smirk, and feeling your own pleasure mounting, you start picking up the pace further, using your hands to guide him into sating your own member; you're determined that you won't be the last to cum.");
		output("\n\nYour Venarian lover follows your lead with eagerness, redoubling his efforts at draining you for your [pc.cum].");
		output("\n\nYou gasp and grunt, moaning in your pleasure like a " + pc.mf("man", "woman") + " in delirium, the pleasure mounting inside you like an unstoppable wave. As you writhe in the throes of pleasure, your tail vibrates madly milking Maki's cock for all it's worth.");
		output("\n\nYou feel him gasp around your cock, followed by a needy moan as warm wetness sprays around your [pc.tail]. Maki's body locks up, and he's unable to do anything but thrust lightly and suck you; his tongue tongue wraps you in a vice-like grip, milking your shaft as it snakes around your [pc.cockBiggest].");
		makius.orgasm();
		output("\n\nIt's too much for you and, with an ecstatic cry, your resolve breaks and climax sweeps through you, a surge of [pc.cumNoun] flooding from your member into the Venarian's hungry mouth.");
		pc.orgasm();
		output("\n\nHe nearly chokes as the first wave of your orgasm hits, but easily recovers and begins swallowing all you have to offer.");
		output("\n\nnYou give yourself over to your pleasure, absently trusting Maki to swallow everything you have to give him, tail continuing to stroke and squeeze his own gushing prick until, at last, you finish up, blinking your eyes as you snap back to reality.");
		output("\n\nMaki sits back on his " + (flags["MAKI_STATE"]?"cushiony ":"") + "butt, panting and patting his " + (pc.cumQ() > 100?(pc.cumQ() < 500?"rounded belly":(pc.cumQ() < 5000?"bloated belly":"enormous belly")):makiusBellyDescriptor()) + ". His Venarian prick is going limp already, and you watch as it slowly retracts back into its hiding place.");
		output("\n\nWith a smile, you ask if he enjoyed himself.");
		output("\n\n\"Very much so!\" he exclaims, grinning happily. \"But… umm… I don't think we actually got any cleaner.\"");
		output("\n\nSo you didn't, you note. Well, you'll just have to take care of that.....");
	//disallow pc that can't do a footjob
	}else if (pc.legCount > 1 && !pc.hasLegFlag(GLOBAL.FLAG_HOOVES) && !pc.hasLegFlag(GLOBAL.FLAG_AMORPHOUS)){
		output("\n\nYou maneuver yourself to a nearby rail within the shower and hold on to it in order to support yourself. As you do so, you move your [pc.foot] towards Maki's erect prick, intent on providing some relief for him yourself.");
		output("\n\nHe shudders, hand stopping in its tracks as soon as he feels your [pc.foot] on his prick. At first he goes tense, but as soon as you start moving, he visibly relaxes and returns his hand to your hips.");
		output("\n\nYou smile at him and continue to caress his dripping cock with your [pc.foot], feeling the soft flesh slide under it as you rhythmically stroke back and forth. As you do so, your hands continue to massage his scalp, rubbing the shampoo into his lush mane and working up a thick froth as you knead his ears.");
		output("\n\nHe thrusts against your foot, clearly deriving pleasure from your footjob as he moans around your cock and redoubles his efforts at milking you. His tongue twists and turns, licking the whole of your [pc.cockBiggest]. His sucking takes on a needy, almost desperate, note as he moans; slurping noises echo shamelessly around the both of you, loud enough to be audible even with the sound of the shower dampening it.");
		output("\n\nYou continue to massage his scalp and his shaft with equal abandon, picking up the pace with hands and foot alike, running your hands down his neck to knead his shoulders and doing your best to meet every thrust against your foot with an equally firm thrust back against his cock. You do your best at curling your [pc.toes] to try and grip his shaft, furthering your impromptu treatment of him.");
		output("\n\nHis blowing of your cock gets increasingly erratic as he nears the edge of his climax. Intent on getting you off as soon as he does, he refrains from thrusting against your foot, lest he cum too soon.");
		output("\n\nYou moan, struggling to keep yourself steady and to keep treating him with hands and foot... you're so close now... but you want him to cum first, and so you do your best to keep your strokes as level as possible, grabbing his shaft between your [pc.toes] and running it up and down.");
		output("\n\nIn the end Maki is the one to pop first, moaning lasciviously even though your [pc.cockBiggest] effectively muffles him. Jet after jet of Venarian spunk cling to your [pc.feet] and [pc.legs] as he rides out his orgasm; the shower quickly washes the white gobs away, but Maki is happy to replace them with new ones.");
		makius.orgasm();
		output("\n\nThe moans are the final stimulation you need as your cock explodes in Maki's mouth, pleasure washing over you and leaving you helplessly balancing against him for support, unable to do anything but let the liquid waves surge into his hungry throat. Good thing you were supporting yourself on the rail, because the force of your orgasm is such that your world becomes naught but a blur, with Maki's muzzle as its focus. You can't say how long you've been stuck in this cacophonic state, but by the time awareness returns, you're looking at a very satisfied Venarian, idly stroking his " + (pc.cumQ() > 100?(pc.cumQ() < 500?"rounded belly":(pc.cumQ() < 5000?"bloated belly":"enormous belly")):makiusBellyDescriptor()) + ".");
		pc.orgasm();
		output("\n\nSeems like he enjoyed himself, you note.");
		output("\n\n\"Yes, I did not know you could do that with your foot. It felt surprisingly good,\" he says excitedly.");
		output("\n\nYou might need to remember that for the future, then, if he enjoyed it that much.");
		output("\n\n\"I guess we should probably focus on washing up now,\" he notes, climbing to his feet.");
		output("\n\nPerhaps... but, nothing says you can't have a little more fun while you wash up, right...?");
	}else{
		output("\n\nYou smile and leave him to his self-amusements; you have other matters to concentrate on. You roll your hands through his hair, working the shampoo into a froth, and guiding his head back and forth along your shaft, occasionally thrusting your hips back and forth for good measure.");
		output("\n\nHe moans with barely contained excitement, both at giving you head as well as the results of his own ministrations on " + (flags["MAKI_STATE"] == 1?"his wet ass. He plugs his boypussy with a finger, thrusting it in and out a couple times, then adds another digit, repeating the process. You watch with amusement as he plays with his stretchy hole, spreading it open with both fingers before adding a third. Another moan vibrates along your [pc.cockBiggest] as he begins truly fingering himself. Venarian dick throbbing, despite its abandonment.":"his wet cock. Using his index and thumb he plays with his nubby crown, teasing his cumslit in the process and drawing bead upon bead of his bountiful pre. Next he grips and begins stroking, from tip to base. He moans, muffled by your [pc.cockBiggest], and blows you in tandem with his masturbation. Every few pumps he stops to tease his slit, right where it meets his cock, poking the sensitive flesh with a pair of digits."));
		output("\n\nYou moan in chorus with him, savoring the feel of his tongue and lips around your flesh, so hot and wet, the perverse sight of Maki pleasuring himself further goading you along. You move his head to ensure he licks and suckles you where and when you want it, humping his mouth in your eagerness. You pat his head softly, warning him that if he continues like that you're going to pop anytime.");
		output("\n\nWhether he hears you or not you don't know, but you do notice his tail waving a bit faster. Maki's rhythm though doesn't change, he continues stroking your [pc.cockBiggest] with his tongue, sucking you in the same pace he's masturbating himself, it's not until later that you notice he seems to be smiling around your cock. Before you can react though, he pulls back and shoves himself, as far as he can, onto your dick. " + (pc.biggestCockLength() < 12?"Despite not being able to deepthroat you initially, he twists his head a bit to the side and you feel yourself sliding deep into his throat. ":"") + "Straining to hold his breath, he delivers a kiss right on your " + (pc.hasSheath(pc.biggestCockIndex())?"[pc.sheathBiggest].":"crotch."));
		output("\n\nThat little lewd touch is the last straw, you can feel your self-control slipping. You thrust into his mouth with all your might, babbling about what an excellent cock-sleeve his throat is and how delicious he feels wrapped around your dick like this. Oh, too much... gonna... gonna...!");
		output("\n\nThe world shrinks to just you and Maki as your will breaks and climax sweeps through you like a tidal wave, a storm of pleasure cascading across your [pc.skin] and making every inch of you tingle with pleasure.");
		output("\n\nYou cry out, trying to put into words the pleasure you are feeling, and empty yourself into your " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"boy":"") + "friend's mouth. It's not until you start to come down from your orgasmic high that you realize you'd been holding Maki tightly, by the ears no less, completely flush to your crotch. You release him and immediately he pulls away, gasping for air as he falls on his " + (flags["MAKI_STATE"]?"cushiony ":"") + "butt.");
		pc.orgasm();
		output("\n\nDespite nearly choking on your dick, you can tell her enjoyed it greatly. His shaft is throbbing, looking ready to pop at any moment. You smile mischievously and decide to give him a little push. Using your index, you press onto his urethra like a button. He gasps once more, this time due to pleasure, and cries out as his nubs harden, expanding his crown for the inevitable fountain of Venarian sperm that is to follow. Jet after jet he spills his load, white arcing through the air to splatter his " + (pc.cumQ() > 100?(pc.cumQ() < 500?"rounded belly":(pc.cumQ() < 5000?"bloated belly":"enormous belly")):makiusBellyDescriptor()) + ".");
		makius.orgasm();
		output("\n\nYou just watch the perverted display with amusement, until he collapses on the floor, worn out after his explosive climax. You let him rest for a few moments before tapping him on the lips. He opens his mouth and you offer him your finger, which he dutifully licks. You withdraw with a pop and grab his arm, intent on helping him stand.");
		output("\n\n\"Thanks, [pc.name]. That was the best,\" he says, sighing in pleasure. Once you're satisfied that he's capable of standing on his own two feet, you give his " + (flags["MAKI_STATE"] == 0?"pert":"plush") + " butt a resounding slap, making him jump and take a couple steps forward and under the shower head. You help him rinse off all the shampoo, pulling him out once he's clean to give him a hug and a nuzzle, much like he does most of the time.");
		output("\n\nWith a smile, he replies in kind, enjoying the closeness for a moment before you break. Well, his head is clean, now to finish the rest. You rub the base of his tail, hinting at what's to come….");
	}
	makiusBathtimeEpilogue();
}

public function makiusShowerSexGetOralPussy():void{
	processTime(10);
	var vag:int = pc.vaginas.length * Math.random();
	var cumQ:int = pc.girlCumQ(vag);
	output("Your [pc.pussies] " + (pc.vaginaTotal() > 1?"are":"is") + " growing slick and damp as you mentally picture Maki's slick, flexible tongue sliding inside of you, teasing your netherlips and caressing your innards. Placing your hands atop his head, you \"accidentally\" push him towards your [pc.legs], his nose runs smack into your " + pc.vaginaDescript(vag, true) + ".");
	output("\n\nThough you can't see very well, his eyes bulge in realisation. He tilts his head up in an attempt to nuzzle your [pc.pussy " + vag + "], caressing your soft folds with his snout.");
	output("\n\nA shudder of pleasure ripples through your body and you can't help but express your appreciation, your hands pushing against the back of his head as you start working shampoo into his flowing mane, oh so coincidentally ensuring that he cannot remove his mouth from your netherlips.");
	output("\n\nTaking the hint, it's not long before the good doctor is treating your [pc.cunt " + vag + "] to errant licks and loving kisses.");
	output("\n\nYou moan as he massages your [pc.cunt " + vag + "] with his lips and tongue, resisting the urge to clamp his head in place on your [pc.thighs] and struggling to keep massaging shampoo into his scalp, using your hands to guide his mouth to where it feels best.");
	if (pc.vaginas[vag].clits > 0){
		if(pc.clitLength > 3){
			output("\n\nYou gasp in surprise when you feel your [pc.clit " + vag + "] being enveloped by his warm maw. He licks and sucks on the tip of your elongated buzzer, almost as if it were a cock. You enjoy the electric sensation of his treatment until he releases you, shuddering in pleasure as your clitty is left to linger in the colder air of the steamy shower.");
			output("\n\nYou sigh lustily, unable to resist commenting that he certainly knows his way around a clit... or is it a matter of him knowing his way around a cock and your [pc.clit] just happens to be like one, hmm?");
			if (pc.hasCock()){
				output("\n\nWould he rather be sucking your [pc.cockBiggest]?");
				output("\n\n\"Do you want me to?\" he asks, licking your muff as he looks up at you.");
				output("\n\nYou give the matter some thought, but decide you'd much rather keep going like this. Rather than say anything, you just smile coyly at your " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"boy":"") + "friend, gently rubbing his ears before taking your hands and insistently pushing his nose back up against your [pc.cunt " + vag + "].");
			}else{
				output("\n\nYou could grow one for him, if he asks you nicely.");
				output("\n\nLifting his head to look up at you, he shakes his head. \"No need, I like you just the way you are,\" he says, breaking into a smile.");
				output("\n\nYou smile and pet him on the head for his sweet answer, then gently place your hands atop his head and lead his sweet tongue back to your needy pussy, bumping his nose against it and letting him get a good whiff of your scent.");
			}
		}else{
			output("\n\nYou gasp in surprise as you feel him nose your pleasure buzzer, already erect from his previous caresses. He licks and kisses, lavishing you in attention.");
			output("\n\nYou moan appreciatively, caressing his ears and stroking down his neck to rub his shoulders, unable to resist thrusting your [pc.hips] to press your [pc.pussy " + vag + "] harder onto his mouth.");
			output("\n\nHe eagerly slurps your clitty a few more times before moving back to your dripping entrance.");
		}
	}
	output("\n\nAfter taking a good whiff of your pheromones, he sticks his tongue out and unceremoniously feeds it into your entrance.");
	output("\n\nYou can't hold back a groan as you feel its hot, wet length entering you and caressing your interior, instinctively trying to clench down and trap it inside of you. Your hands push against the back of his head, pressing his face harder against your cunt, your fingers curling around his ears as if instinctively seeking them as handholds. You can't resist grinding your pussy against your " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"boy":"") + "friend's face, but as you do so, you dimly realise one of his hands is moving down towards his own crotch, where his own shaft is erect and demanding attention." + (flags["MAKI_STATE"] == 1?" To your surprise, he ignores it completely and instead moves to stroke his wet pucker. Come to think of it, you should have expected that….":""));
	if (pc.hasCuntTail()){
		output("\n\nSeeing his cock pulsing awakes a hunger in your [pc.tailCunt], one that you feel no willingness to ignore. Down it coils, its ever-thirsty orifice opening to swallow his dripping Venarian dick, causing you to moan as you feel it stretching around his shaft and drinking in his precum.");
		output("\n\nMaki nearly chokes on you, surprised by the feeling of being engulfed by your warm [pc.tailCunt]. His hand squeezes your hip and he begins instinctively thrusting himself into your cocksleeve. His thrusts are awkward at first, but when his other hand resets itself upon your hips, he begins a more steady pace.");
		output("\n\nYou moan appreciatively, your tailcunt clenching down on him as he thrusts" + (pc.hasCuntSnake()?", hungry for his seed to fertilise its eggs":"") + ", but you shake your head and give his head a push into your crotch, verbally reminding him that your cunt still wants his mouth's attention.");
		output("\n\nHe jumps a little, ashamed to have forgotten about your pussy for a moment. He eagerly returns to his task, kissing and slurping like his life depended on it. He thrusts his tongue inside your [pc.pussy " + vag + "], keeping pace with his thrusting hips.");
		output("\n\nThe twin stimulants are too much for you; flinging your head back in an ecstatic cry, your tailcunt clenches down on him with all its might, a tightness seizing you in the depths of your belly as your pussy explodes all over your " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"boy":"") + "friend's face, covering him with the liquid expression of your satisfaction as pleasure consumes the entirety of your being.");
		pc.orgasm();
		output("\n\nWith one last shudder of pleasure, he all but screams, muffled by your greedy netherlips, as he achieves his own climax. His muscles lock in place, tongue still stuck inside you as a [pc.girlCumVisc] flood of [pc.girlCum] rains down onto his open maw and into his hungry belly. His nubby tip hardens, opening up his urethra for the onslaught of Venarian seed seeking to inseminate your [pc.tail].");
		pc.fertilizeEggs("tail", 50);
		makius.orgasm();
		output("\n\nThe two of you stay locked in place; him filling your tail with his fertile Venarian seed and you feeding him your [pc.girlCum]; until you manage to come down from your orgasmic high. You release Maki and he falls back on his butt" + (flags["MAKI_STATE"] >= 1?", which is, thankfully, very well cushioned":"") + ". He pants and coughs, patting his " + (cumQ > 100?(cumQ < 500?"rounded belly":(cumQ < 5000?"bloated belly":"enormous belly")):makiusBellyDescriptor()) + " in satisfaction as he recovers from the pleasure overload. His cock still attached to your [pc.tailCunt], as it eagerly drains him of the last remains of his seed.");
		output("\n\nYou sigh in release as the twin sensations of being eaten out and having your tail pumped full of baby-goo wash over you.");
		output("\n\nWith an act of will you open your tailcunt and let him free, asking if he enjoyed that as much as you did.");
		output("\n\n\He smiles tiredly at you. \"Yeah, " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"my mate":"[pc.name]") + ", that was the best.\" He sighs, gathering his energy to push himself back to his feet.");
		output("\n\nYou lean down and help him off, maneuvering him into the water to help wash the shampoo from his head.");
		output("\n\nHe lets the waters rinse him and once done, he opens his eyes to greet you with a smile. \"Okay,\" he says, still breathing irregularly. \"We managed to get my mane clean, now we just have to clean the rest.\"");
		output("\n\nYou grin and nod your head at that. Now, where to begin….");
	}else if (pc.hasTail() && pc.hasTailFlag(GLOBAL.FLAG_PREHENSILE)){
		output("\n\nWith an amused impulse, your prehensile [pc.tail] undulates around your [pc.legs] to twine itself around his shaft, curling expertly and with inhuman grace about your " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"boy":"") + "friend's prick and starts to ripple and caress it, stroking it like a makeshift hand.");
		output("\n\nMaki shudders and moans into your netherlips, his wandering hand stopping in its tracks to set itself upon your hips to steady himself as he begins thrusting lightly. His oral ministrations become a bit more irregular, but he never stops servicing you. You pet him for being such a good boy.");
		output("\n\nYou bite your lip against a moan of pleasure as his tongue-fucking becomes a bit more intense in response. Your tail unthinkingly tightens its grip and strokes him a little rougher and faster than before.");
		output("\n\nHe whimpers in delight, shuddering at the pleasure you are inflicting upon him. It's no secret that he's deriving great enjoyment both from eating you out and being stroked by your [pc.tail]. Considering the way his shaft is throbbing, it doesn't look like he'll hold on much longer.");
		output("\n\nWith a mischievous smirk, and feeling your own pleasure mounting, you start picking up the pace further, using your hands to guide him into sating your own needs; you're determined that you won't be the last to cum.");
		output("\n\nYour Venarian lover follows your lead with eagerness, redoubling his efforts and eagerly drinking all of your juices.");
		output("\n\nYou gasp and grunt, moaning in your pleasure like a " + pc.mf("man", "woman") + " in delirium, the pleasure mounting inside you like an unstoppable wave. As you writhe in the throes of pleasure, your tail vibrates madly, milking Maki's cock for all it's worth.");
		output("\n\nYou feel him gasp into your pussy, followed by a needy moan as warm wetness sprays around your [pc.tail]. Maki's body locks up, and he's unable to do anything but thrust lightly and moan; his tongue tongue thrashes inside you, stroking your walls and brushing against your g-spot with each whiplash.");
		makius.orgasm();
		output("\n\nIt's too much for you and, with an ecstatic cry, your resolve breaks and climax sweeps through you; a surge of [pc.girlCumNoun] flooding into the Venarian's hungry mouth.");
		pc.orgasm();
		output("\n\nHe nearly chokes as the first " + (pc.isSquirter(vag)?"squirt":"wave") + " of your orgasm hits, but easily recovers and begins swallowing all you have to offer.");
		output("\n\nYou give yourself over to your pleasure, absently trusting Maki to swallow everything you have to give him. Your tail continues to stroke and squeeze his own gushing prick until, at last, you finish up, blinking your eyes as you snap back to reality.");
		output("\n\nMaki sits back on his " + (flags["MAKI_STATE"] > 0?"cushiony ":"") + "butt, panting and patting his " + (cumQ > 100?(cumQ < 500?"rounded belly":(cumQ < 5000?"bloated belly":"enormous belly")):makiusBellyDescriptor()) + ". His Venarian prick is going limp already, and you watch as it slowly retracts back into its hiding place.");
		output("\n\nWith a smile, you ask if he enjoyed himself.");
		output("\n\n\"Very much so!\" he exclaims, grinning happily. \"But… umm… I don't think we actually got any cleaner.\"");
		output("\n\nSo you didn't, you note. Well, you'll just have to take care of that….");
	}else if (pc.isNaga()){
		output("\n\nSeeing the promise here, you undulate your serpentine lower torso; it's a little tricky to manage whilst keeping your [pc.cunt " + vag + "] within reach of his hungry mouth, but you manage to reach around with the tip of your tail and start to caress his cock with your coils, a makeshift hand of looped flesh squeezing and stroking his neglected member.");
		output("\n\nMaki shudders and moans into your netherlips, his wandering hand stopping in its tracks to set itself upon your hips to steady himself as he begins thrusting lightly. His oral ministrations become a bit more irregular, but he never stops servicing you. You pet him for being such a good boy.");
		output("\n\nYou bite your lip against his moan of pleasure as his tongue-fucking becomes a bit more intense in response. Your tail unthinkingly tightens its grip and strokes him a little rougher and faster than before.");
		output("\n\nHe whimpers in delight, shuddering at the pleasure you are inflicting upon him. It's no secret that he's deriving great enjoyment from both eating you out and being stroked by your [pc.tail]. Considering the way his shaft is throbbing, it doesn't look like he'll hold on much longer.");
		output("\n\nWith a mischievous smirk, and feeling your own pleasure mounting, you start picking up the pace further, using your hands to guide him into sating your own needs; you're determined that you won't be the last to cum.");
		output("\n\nYour Venarian lover follows your lead with eagerness, redoubling his efforts and eagerly drinking all of your juices.");
		output("\n\nYou gasp and grunt, moaning in pleasure like a " + pc.mf("man", "woman") + " in delirium, the pleasure mounting inside you like an unstoppable wave. As you writhe in the throes of pleasure, your tail vibrates madly, milking Maki's cock for all it's worth.");
		output("\n\nYou feel him gasp into your pussy, followed by a needy moan as warm wetness sprays around your [pc.tail]. Maki's body locks up, and he's unable to do anything but thrust lightly and moan; his tongue thrashes inside you, stroking your walls and brushing against your g-spot with each whiplash.");
		makius.orgasm();
		output("\n\nIt's too much for you and, with an ecstatic cry, your resolve breaks and climax sweeps through you; a surge of [pc.girlCumNoun] flooding into the Venarian's hungry mouth.");
		pc.orgasm();
		output("\n\nHe nearly chokes as the first " + (pc.isSquirter(vag)?"squirt":"wave") + " of your orgasm hits, but easily recovers and begins swallowing all you have to offer.");
		output("\n\nYou give yourself over to your pleasure, absently trusting Maki to swallow everything his " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?pc.mf("boy", "girl"):"") + "friend has to give him, tail continuing to stroke and squeeze his own gushing prick until, at last, you finish up, blinking your eyes as you snap back to reality.");
		output("\n\nMaki sits back on his " + (flags["MAKI_STATE"] > 0?"cushiony ":"") + "butt, panting and patting his " + (cumQ > 100?(cumQ < 500?"rounded belly":(cumQ < 5000?"bloated belly":"enormous belly")):makiusBellyDescriptor()) + ". His Venarian prick is going limp already, and you watch as it slowly retracts back into its hiding place.");
		output("\n\n With a smile, you ask if he enjoyed himself.");
		output("\n\n\"Very much so!\" he exclaims, grinning happily. \"But… umm… I don't think we actually got any cleaner.\"");
		output("\n\nSo you didn't, you note. Well, you'll just have to take care of that….");
	//disallow pc that can't do a footjob
	}else if (pc.legCount > 1 && !pc.hasLegFlag(GLOBAL.FLAG_HOOVES) && !pc.hasLegFlag(GLOBAL.FLAG_AMORPHOUS)){
		output("\n\nYou maneuver yourself to a nearby rail within the shower and hold on to it in order to support yourself. As you do so, you move your [pc.foot] towards Maki's erect prick, intent on providing some relief for him yourself.");
		output("\n\nHe shudders, hand stopping in its tracks as soon as he feels your [pc.foot] on his prick. At first he goes tense, but as soon as you start moving, he visibly relaxes and returns his hand to your hips.");
		output("\n\nYou smile at him and continue to caress his dripping cock with your [pc.foot], feeling the soft flesh slide under it as you rhythmically stroke back and forth. As you do so, your hands continue to massage his scalp, rubbing the shampoo into his lush mane and working up a thick froth as you knead his ears.");
		output("\n\nHe thrusts against your foot, clearly deriving pleasure from your footjob as he moans into your [pc.pussies] and redoubles his efforts at pleasuring you. His tongue twists and turns, attempting to lick and taste every little crevice of your [pc.pussy " + vag + "]. His licks takes on a needy, almost desperate, note as he moans; slurping noises echo shamelessly around the both of you, loud enough to be audible even with the sound of the shower dampening it.");
		output("\n\nYou continue to massage his scalp and his shaft with equal abandon, picking up the pace and the force with hands and foot alike, running your hands down his neck to knead his shoulders and doing your best to meet every thrust against your foot with an equally firm thrust back against his cock. You do your best at curling your [pc.toes] to try and grip his shaft, furthering your impromptu treatment of him.");
		output("\n\nHis tongue-fucking gets increasingly erratic as he nears the edge of his climax. Intent on getting you off as soon as he does, he refrains from thrusting against your foot, lest he cum too soon.");
		output("\n\nYou moan, struggling to keep yourself steady and to keep treating him with hands and foot... you're so close now... but you want him to cum first, and so you do your best to keep your strokes as level as possible, grabbing his shaft between your [pc.toes] and running it up and down.");
		output("\n\nIn the end Maki is the one to pop first, moaning lasciviously even though your muff effectively muffles him. Jet after jet of Venarian spunk cling to your [pc.feet] and [pc.legs] as he rides out his orgasm; the shower quickly washes the white gobs away, but Maki is happy to replace them with new ones.");
		makius.orgasm();
		output("\n\nThe moans are the final stimulation you need as you flood Maki's mouth, pleasure washing over you and leaving you helplessly balancing against him for support, unable to do anything but let the liquid waves surge into his hungry throat. Good thing you were supporting yourself on the rail, because the force of your orgasm is such that your world becomes naught but a blur, with Maki's muzzle as its focus. You can't say how long you've been stuck in this cacophonic state, but by the time awareness returns, you're looking at a very satisfied Venarian, idly stroking his " + (cumQ > 100?(cumQ < 500?"rounded belly":(cumQ < 5000?"bloated belly":"enormous belly")):makiusBellyDescriptor()) + ".");
		pc.orgasm();
		output("\n\nSeems like he enjoyed himself, you note.");
		output("\n\n\"Yes, I did not know you could do that with your foot. It felt surprisingly good,\" he says excitedly.");
		output("\n\nYou might need to remember that for the future, then, if he enjoyed it that much.");
		output("\n\n\"I guess we should probably focus on washing up now,\" he notes, climbing to his feet.");
		output("\n\nPerhaps... but, nothing says you can't have a little more fun while you wash up, right...?");
	}else{
		output("\n\nYou smile and leave him to his self-amusement; you have other matters to concentrate on. You roll your hands through his hair, working the shampoo into a froth, and guiding his head up, down and around your muff, occasionally holding his head and bucking against him for good measure.");
		output("\n\nHe moans with barely contained excitement, both at giving you cunnilinguis as well as the results of his own ministrations on " + (flags["MAKI_STATE"] == 1?"his wet ass. He plugs his boipussy with a finger, thrusting it in and out a couple times, then adds another digit, repeating the process. You watch with amusement as he plays with his stretchy hole, spreading it open with both fingers before adding a third. Another moan vibrates along your [pc.vagina " + vag + "] as he begins truly fingering himself. Venarian dick throbbing, despite its abandonment.":"his wet cock. Using his index and thumb he plays with his nubby crown, teasing his cumslit in the process and drawing bead upon bead of his bountiful pre. Next he grips and begins stroking, from tip to base. He moans, muffled by your [pc.vagina " + vag + "], and licks you in tandem with his masturbation. Every few pumps he stops to tease his slit, right where it meets his cock, poking the sensitive flesh with a pair of digits."));
		output("\n\nYou moan in chorus with him, savoring the feel of his tongue penetrating you, so hot and wet, the perverse sight of his pleasuring himself further goading you along. You move his head to ensure he licks and slurps you where and when you want it, humping his mouth in your eagerness. You pat his head softly, warning him that if he continues like that you're going to cum anytime.");
		output("\n\nWhether he hears you or not you don't know, but you do notice his tail waving a bit faster. Maki's rhythm though doesn't change, he continues stroking wet walls with his tongue, tongue-fucking you in the same pace he's masturbating himself; it's not until later that you notice he seems to be smiling. Before you can react though, he pulls back and shoves his tongue, as far as he can, inside you. Straining to hold his breath, his mouth forms a tight seal around your nethers.");
		output("\n\nThat little lewd touch is the last straw, you can feel your self-control slipping. You buck against him, babbling about what an excellent little pet he is, licking and cleaning you so thoroughly. Oh, too much... gonna... gonna...!");
		output("\n\nThe world shrinks to just you and Maki as your will breaks and climax sweeps through you like a tidal wave, a storm of pleasure cascading across your [pc.skinFurScales] and making every inch of you tingle with pleasure.");
		output("\n\nYou cry out, trying to put into words the pleasure you are feeling, and let yourself loose into your " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"boy":"") + "friend's mouth. It's not until you start to come down from your orgasmic high that you realize you'd been holding Maki tightly, by the ears no less, completely flush to your crotch. You release him and immediately he pulls away, gasping for air as he falls on his butt.");
		output("\n\nDespite being smothered by your cunt, you can tell he enjoyed it greatly. His shaft is throbbing, looking ready to pop at any moment. You smile mischievously and decide to give him a little push. Using your index, you press onto his urethra like a button. He gasps once more, this time due to pleasure, and cries out as his nubs harden, expanding his crown for the inevitable fountain of Venarian sperm that is to follow. Jet after jet he spills his load, white arcing through the air to splatter his " + (cumQ > 100?(cumQ < 500?"rounded belly":(cumQ < 5000?"bloated belly":"enormous belly")):makiusBellyDescriptor()) + ".");
		output("\n\nYou just watch the perverted display with amusement, until he collapses on the floor, worn out after his explosive climax. You let him rest for a few moments before tapping him on the lips. He opens his mouth and you offer him your finger, which he dutifully licks. You withdraw with a pop and grab his arm, intent on helping him stand.");
		output("\n\n\"Thanks, [pc.name]. That was the best,\" he says, sighing in pleasure.");
		output("\n\nOnce you're satisfied that he's capable of standing on his own two feet, you give his " + (flags["MAKI_STATE"] == 0?"pert":"plush") + " butt a resounding slap, making him jump and take a couple steps forward and under the shower head. You help him rinse off all the shampoo, pulling him out once he's clear to give him a hug and a nuzzle, much like he does most of the time.");
		output("\n\nWith a smile, he replies in kind, enjoying the closeness for a moment before you break. Well, his head is clean, now to finish the rest. You rub the base of his tail, hinting at what's to come….");
	}
	makiusBathtimeEpilogue();
}

public function makiusShowerSexStrokeHim():void{
	clearMenu();
	clearOutput();
	processTime(60);
	author("LukaDoc");
	showBust(makiusBust(2));
	output("Without breaking the hug you reach down between his legs and give his pecker a firm tug.");
	output("\n\nMaki jumps and breaks the hug with a yelp of surprise. You just chuckle at his reaction.");
	output("\n\n\"That was mean, [pc.name],\" he scolds you.");
	output("\n\nYou reach out and grab his shaft once more, this time gently. He shudders slightly at your touch, but otherwise doesn't protest. Maybe what you did was a little mean… so why doesn't he simply let you <i>apologize</i>.");
	output("\n\n\"Ooh… you don't have-\"");
	output("\n\nYou silence him with a finger. Yes you don't have to… you want to.");
	output("\n\nHe smiles nervously at that. \"I guess if you really want to, then I can't stop you, can I?\" he grins.");
	output("\n\nNo, he can't. You have him literally in the palm of your hand, and he will dance to your tune now. You emphasise this with a squeeze, milking some of his pre.");
	output("\n\nYou reach out and pull him into a soft kiss, entering his mouth and inviting his tongue for a dance; an invitation he gladly accepts. All the while you keep stroking his shaft, feeling it grow harder than ever. You break the kiss with a smile, stepping back to examine the results of your handiwork thus far.");
	output("\n\nMaki is already panting, his shaft throbbing as it stands painfully hard. " + (flags["MAKI_STATE"]?"His butt is probably as wet as his shaft is hard.":"") + " Satisfied for the moment you pull him against your chest, spinning him so he has his back turned to you. Hugging him from behind you guide him to sit down on the floor, leaning against you as you gently lay him " + (pc.isNaga()?"on your coils.":"between your [pc.legs]."));
	if (flags["MAKI_STATE"]){
		output("\n\n\"[pc.name]. Can you do my butt too?\" he requests.");
		output("\n\nChuckling you embrace him and pull him into another short kiss. You tell him you'll consider it, since he's asked so nicely. Right now however, you are more interested in what he has up front.");
	}
	output("\n\nYou use both hands as you draw them ever closer to his erect Venarian prick. One plays with his slit, stretched out by his shaft, while the other grips him just below the crown of his nubby tip. You start out slow, stroking him and tracing his genital slit with a finger.");
	output("\n\nYou've barely started and Maki's already moaning lasciviously. You can't believe how easy he is to tease. He's really become your boytoy hasn't he? No matter, you love playing with your Venarian.");
	output("\n\n\"I like being played with too,\" he admits, averting his eyes in embarrassment.");
	output("\n\nYou kiss his neck and praise him for being a good boy.");
	output("\n\nHis pre leaks like an open faucet; if the water from the shower didn't wash it off, you're pretty sure there'd be a moderately sized pool of his excitement on the floor right now. It feels good to have him sit with you like this. Sure, right now you aren't exactly focusing on your own pleasure. But you feel genuinely warm at the fact you can get him riled up with your simple touch. You haven't even gotten started on the good parts of this little massage and he looks about ready to blow. But you won't let him.");
	output("\n\nYou slow down your stroking, barely moving your hands now. You feel his " + (makiusMasculine()?"boyish":"curvy") + " hips rise a bit off the floor, starting to fuck your hand; immediately you lift your hand and bop him on nose. Ah, ah, he's not supposed to do anything right now. You're playing with him right now, and you can't really do much if he shoots too soon now, can you?");
	output("\n\nHe grins nervously, \"Sorry.\" It's fine, you reply.");
	output("\n\nBut if he really wants to do something, then why doesn't he clean up the hand he's soiled with his naughty Venarian pre? You lift your hand, flicking his tip as you begin teasing his lips with your index finger.");
	output("\n\nHe just licks his lips and extends his tongue, gently lapping at your hand. You just smile and let him work. He takes his time too; lapping your palm clean, then the back of your hand when presented and individually sucking each finger clean.");
	output("\n\nOnce he's calmed down enough, you move your hand back to his penis. All it takes is one squeeze and it's back to its previous rock-hard state. No holding back this time. You present your other hand to Maki, your first two fingers extended and pressing themselves gently against his mouth, inviting him to resume his former treatment on these new digits.");
	output("\n\nHe eagerly accepts the offering, licking and sucking on them, lathering them as his tongue curls and dances around your digits.");
	output("\n\nYou watch your " + (flags["MAKI_RELATIONSHIP_STATUS"] == 2?"boy":"") + "friend eagerly as he ministers to your offered digits, occasionally twisting or turning your fingers to let him touch a side of them that you feel is getting neglected. To encourage him, your free hand caresses his shaft in turn, moving faster when you want him to go faster, slowing down when you want him to lap slower, circling the tip of his glans with the tips of your fingers to really coax him onwards.");
	output("\n\nFinally, you deem your fingers sufficiently lubed and you wetly pop them free of his lips, a particularly careful caress ensuring his moans are of pleasure more than disappointment. As your hand continues to play with his cock, the now-lubed fingers creep towards his tailhole, worming through the canyon of his " + (flags["MAKI_STATE"] >= 1?"plush":"firm") + " ass-cheeks and then pushing inside of him.");
	output("\n\nMaki gasps and moans. " + (flags["MAKI_STATE"] >= 1?"Ah! Yes! My butt, yes!":"Oh! [pc.name]!") + " He bucks at the sudden intrusion, tongue lolling out and panting out of sheer excitement. His hands close into tight fists, his toes curl and he arches his back.");
	output("\n\nSmiling to yourself at how easily your lover is reduced to putty in your hands, you alternate between stroking his shaft and ploughing for his prostate, ensuring he is hit with a constant barrage of pleasures. Maki shudders and whimpers, alternatively grinding his ass back against your probing fingers and rutting forward into your encircling palm, something that makes you speed up the pace of your actions. You draw him closer so that he is supporting himself upon you, nuzzling him affectionately even as your hands busily play with him, seeing just how far you can push him before he cums.");
	output("\n\nYour fingering, your stroking and the loving nuzzle proves to be too much for the poor Venarian. With a cry of pleasure his shaft throbs, nubs hardening and on his tip, preparing his glans for the tsunami that's about to be unleashed. With a devilish grin, you plug his cumvein shut with a finger. If he wants to cum, he's going to have to give you a little something in return. After all… you've been so focused on him, you didn't really get much out of it.");
	output("\n\n\"W-What!?\" he asks in desperation.");
	output("\n\nHmm… how about a kiss?");
	output("\n\nThe Venarian scrambles to get into a position where he can kiss you, and kiss you he does. He wastes no time in shoving his tongue into your mouth. You suck on his tongue, releasing his shaft and giving it a firm tug.");
	output("\n\nHis seed bursts forth, even before he lavishly moans into your kiss. Arcing ropes of white fly through the air, mingling with the water of the shower before landing back on his body. Using your fingers, still deeply embedded into his behind, you stroke his prostate. This earns you another moan and even more seed. You hug Maki, his shuddering soon becomes thrashing, as the last few ropes of cum spew forth.");
	makius.orgasm();
	output("\n\nAfter what seems like an eternity, he stops. You break the kiss to catch your breath. His tongue slips from your mouth, limp. You chuckle, seems like you worked him a bit too hard, maybe. His shaft begins receding back into its hiding place and you remove your fingers from his " + (flags["MAKI_STATE"]?"wet ":"") + "ass, moving it to join your other arm in hugging him. He pants, eyes closed, ears flat. His tail, normally as energetic as its amorous, lays unmoving " + (pc.isNaga()?"along your coils.":"between your legs."));
	output("\n\nLeaning Maki against you for support, your hand starts to climb up his body. " + (flags["MAKI_STATE"] == 2?"Your hand rubs itself in gentle circles over the swollen bulge in which your pup is growing, marvelling in the miraculous life that you helped engender, before your hands climb higher.":"You stroke his flat belly, smearing his spent seed across it, even as the water of the shower washes it off. You tease his belly-button with a finger before moving up towards his chest."));
	if (makiusMasculine()){
		output("\n\nYou rub Maki's flat chest, drawing teasing circles around his nipples, you press each of them in turn, smearing his little nubs with the seed still clinging to his body.");
	}else{
		output("\n\nYou can't resist squeezing and groping his swollen, womanly-tits, " + (flags["MAKI_STATE"] == 2?"feeling milk leaking over your fingers as ":"") + "your fingers make his fur gleam with his own masculine fluids. You have half a mind to wrap your lips around one of his breasts, but your current position wouldn't allow for that. So instead you decide to pinch each nipple with your finger, tugging them lightly" + (flags["MAKI_STATE"] == 2?" and letting his milk seep out to join his fluids, shortly before they are both washed away.":"."));
	}
	output("\n\nMaki still seems out of himself, he didn't react to any of your stroking… you really gave him a hard time. As much as you'd like to let him rest, however, you still haven't even begun to clean him up. So you give one of his soft ears a gentle bite.");
	output("\n\n\"Ouch.\" Finally a reaction. He looks at you, a bit grumpy. \"Can't you give me a few more minutes?\"");
	output("\n\nYou shake your head. He can rest later, right now you gotta finish washing him up and yourself. Especially since he saw it fit to coat himself with semen.");
	output("\n\nHe averts his gaze, a bit embarrassed. \"I couldn't really control it. Besides weren't you having fun rubbing it in just moments ago?\"");
	output("\n\nOk, he got you there, but that doesn't change the fact that you're not halfway done with him yet.");
	output("\n\nTaking a deep breath, he replies with a smile, \"Alright then, but you're going to have to help me. I still haven't recovered the strength in my legs.\"");
	output("\n\nThat's fine, you know exactly how to help him up. You give the base of his tail a small, teasing pinch….");
	makiusBathtimeEpilogue();
}

public function makiusBathtimeEpilogue():void{
	pc.shower();
	output("\n\nNow that the two are out of the shower, you set about drying yourselves off - no small task with Maki's fur coat. The two of you naturally help each other towelling down, and if Maki sneaks a few gropes of you during the process, well, it's alright; you do the same thing to him, after all.");
	output("\n\nOnce you are both as dry as you're likely to get, you stretch yourself and proclaim that, as refreshing as that might of been, it's about time you leave.");
	addButton(0, "Next", makiusLeave);
}