//JimT's V-Ko

//Gildenmere Hospital
public function viBonus():Boolean
{
	output("There’s one word for this hospital - <i>grand</i>. The sheer size of this place is overwhelming. The floors are made of shining onyx and there are pillars of gleaming crystal. The hospital beds are hidden behind fancifully embroidered partitions. The smell of antiseptic is nowhere to be found, carefully masked with lilac, jasmine, and rose.\n\nThere are many doctors and nurses bustling about, re-establishing that this place is indeed a hospital. The medical professionals are constantly in transit from one patient to another, slipping in and out from the patterned privacy screens.");
	//PC Has Never Met This V-Ko
	if(flags["MET_VI"] == undefined)
	{
		output("\n\nThere is a woman with alabaster-white skin who stands out amongst the honey colored aliens. Her hair is tied in a violet side-tail.");
		if(flags["MET_VKO"] == undefined) 
		{
			output(" She looks like a V-Ko android. But why is she on Myrellion?");
			output(" Your codex chimes, <i>“V-Ko model nursedroid detected. Manufactured by JoyCo. Provides basic medical services. More data available upon request.”</i>");
			// Unlock 'V-Ko IV' Codex Entry
			CodexManager.unlockEntry("V-Ko");
		}
		addButton(0,"V-Ko",approachVi);
	}
	else 
	{
		output("\n\nVi is standing here looking for patients to heal. If you want to, you could secure her services.");
		addButton(0,"Vi",approachVi);
	}
	vendingMachineButton(1);
	return false;
}

public function showVi(nude:Boolean = false):void
{
	if(flags["VI_BIGBOOBS"] == 1)
	{
		if(!nude) showBust("VI_LARGE");
		else showBust("VI_LARGE_NUDE");
	}
	else
	{
		if (!nude) showBust("VI");
		else showBust("VI_NUDE");
	}
	showName("\nVI");
}

//Vi / V-Ko IV
//Main menu
public function approachVi():void 
{
	clearOutput();
	showVi();
	author("JimThermic");
	//First Visit:
	if(flags["MET_VI"] == undefined)
	{
		output("As you approach the V-Ko unit, you’re struck by how, well, <i>risque</i> she looks. The tail of her violet side-plait tumbles over one of her shoulders and rests atop her hefty, well-formed tits, the tip threatening to disappear between their ampleness. They’re even more exaggerated by her tight-fitting corset. Besides a garter belt and stockings, there’s simply no coverage below her waist, leaving her smooth feminine mound on display.");
		output("\n\nAlmost as an afterthought – and perhaps so people didn’t think she was a sex-bot – the violet-haired VI wears a white cap with a cross on it and a pair of medical gloves. What little clothing she wears looks attached to her snowy skin. She has an equally pale tail protruding from above her hand-crafted rump, long and visibly prehensile.");
		output("\n\nHer eyes lock onto you – midnight black except for two pale cross-shaped irises. <i>“Hello, prospective patient!”</i> she exclaims, crossing her arms underneath those voluptuous breasts. <i>“My designated name is ‘Vi’. I have been placed here to dispense medical procedures for a reasonable, profit ensuring price.”</i>");
		processTime(3);
		flags["MET_VI"] = 1;
		// New Page - Clear Screen
		clearMenu();
		addButton(0,"Next",approachViFirstTimePart2);
	}
	else
	{
		output("Vi smiles brightly as you approach, crossing her arms underneath those voluptuous breasts. <i>“Your biosigns identify you as [pc.fullName]. How may I serve your needs today, " + pc.mf("sir","ma’am") + "?”</i> Her prehensile tail picks up a patient chart and deposits it in her hands.");
		//if health is below 25%:
		if(pc.HPQ() < 25)
		{
			output(" The moment she spots how injured you are, a look of shocked concern spreads across her face. <i>“Oh my! How can you still stand? Please, allow me to heal you! The " + (isAprilFools() ? "dogecoin" : "credit") + " charge is more survivable than your wounds.”</i>");
		}
		//else if health is below 50%:
		else if(pc.HPQ() < 50)
		{
			output(" The moment she spots your wounds, she lets out a shocked gasp. <i>“You’re injured! Please, allow me to heal you. The small surcharge is minor compared to your wounds.”</i>");
		}
		//else if health is below 100%:
		else if(pc.HP() < pc.HPMax())
		{
			output(" <i>“You appear to have sustained minor injuries. I can heal them for a small surcharge, should you wish it.”</i>");
		}
		//else uninjured:
		else output(" <i>“My sensors detect you are in good health, but my other services are available should you require them.”</i>");
		processTime(1);
		viMenu();
	}
}

public function approachViFirstTimePart2():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	output("<i>“I can sell you medical supplies, examine you for diseases, heal your injuries, or provide relief services. How may I assist you today?”</i>");
	viMenu();
}

public function viMenu():void
{
	clearMenu();
	//[Appearance] [Talk] [Heal] [Examination] [S.Relief]
	//[Buy] [Sell]
	// tooltip.sRelief: Ask Vi if she can provide you with sexual relief services.
	addButton(0,"Appearance",viAppearance,undefined,"Appearance","Take a look at Vi.");
	addButton(1,"Talk",talkToVi,undefined,"Talk","Talk to Vi.");
	if(pc.HP() < pc.HPMax()) addButton(2,"Heal",healFromVi,undefined,"Heal","Get your wounds treated.");
	else addDisabledButton(2,"Heal","Heal","You don’t have any wounds to treat!");
	addButton(3,"Examination",getExamanitedByVi,undefined,"Examination","Have Vi give you a thorough examination.");
	addButton(4,"S.Relief",viSexualRelief,undefined,"S.Relief","Have Vi provide sexual relief.");
	addButton(5,"Buy",viShop);
	addButton(6,"Sell",viShop,false);
	//[Modify]
	// ‘Pleasure’ talk topic must have been watched, to learn that she’s been tampered with already.
	if(flags["VI_PLEASURE_TALKED"] != undefined) addButton(7,"Modify",modifyViMenu,undefined,"Modify","Modify Vi’s specs to suit your tastes!");
	else addDisabledButton(7,"Modify","Modify","She doesn’t look like the kind of ‘bot that would modify her chassis.");
	if(pc.hasItemByClass(DamagedVIChip)) addButton(8,"Give VI Chip",nurseDroidChipTurnIn,"Vi","Give VI Chip","Give the V-Ko droid the damaged chip you looted off the Nym-Foe. Maybe she can do something with it, or give you a few space-bucks for the trouble.");
	
	joyCoDonationButton(9, "vi");
	
	addButton(14,"Leave",mainGameMenu);
}

//Appearance
public function viAppearance():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	output("You take a good look at Vi. As soon as you begin to stare, her shyness subroutines start playing. Her snowy cheeks are visibly flushed.");
	output("\n\n<i>“I hope my hardware is to your satisfaction, " + pc.mf("sir","ma’am") + ". I would hate to be below the recommended or minimum specifications.”</i>");
	output("\n\nWell, when it comes to <i>one</i> area, she’s definitely first rate. Her hefty, well-formed breasts are a work of art, upon which her violet side-plait comfortably rests. Her incredible bust is made even more pronounced by her tight-fitting corset, which lifts and presses it together, forming distinctively deep cleavage.");
	output("\n\nBelow the hem of this, however, she’s wearing nothing but a garter belt and stockings, leaving her smooth feminine mound brazenly on display.");
	//Borrowed Her Pussy:
	if(pc.hasKeyItem("Vi's Vagina")) output("Right now it’s utterly featureless, since you’ve purloined her actual pussy.");
	output(" She’s so scantily-clad that it would be hard to tell she was a medical bot at all, if it wasn’t for her white nurse’s cap with a cross on it, and a pair of medical gloves. A closer examination shows every piece of clothing is actually attached to her snowy skin.");
	output("\n\nTwo other features really stand out; her midnight black eyes with pale, cross-shaped irises, and her snowy white tail. The latter is very long and visibly prehensile – you’ve seen her use it to pick up all sorts of things with little effort.");
	output("\n\nThere’s a small inscription on her upper right arm: <i>“V-Ko Model IV”</i>.");
	processTime(3);
	viMenu();
	addDisabledButton(0,"Appearance","Appearance","You’re looking at her appearance right now!");
}

//Talk
public function talkToVi():void
{
	clearOutput();
	showVi();
	output("What do you talk with Vi about?");
	viTalkMenu();
}

//[Name] [Model] [Owner] [Methods] [Pleasure]
//[Leave]
public function viTalkMenu():void
{
	clearMenu();
	addButton(0,"Name",talkToViAboutName,undefined,"Name","Ask her about her name.");
	addButton(1,"Model",talkToViAboutHerModel,undefined,"Model","Ask her about her model.");
	addButton(2,"Owner",talkToViAboutHerOwner,undefined,"Owner","Ask her who owns her.");
	if(flags["HEALED_BY_VI"] != undefined || flags["TREATED_BY_VI"] != undefined) addButton(3,"Methods",talkToViAboutHerMethods,undefined,"Methods","Ask her about her treatment methods.");
	else addDisabledButton(3,"Methods","Methods","You’ll have to see her methods before you can ask about them.");
	if(flags["VI_SEXED"] != undefined) addButton(4,"Pleasure",talkToViAboutPleasure,undefined,"Pleasure","Ask her about why she seems to feel pleasure.");
	else addDisabledButton(4,"Pleasure","Pleasure","You’ll need to be intimate with her before you can ask this.");
	addButton(14,"Back",viMenu);
}

//Name
public function talkToViAboutName():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	output("Feeling a little curious, you ask Vi about her designation. Is there some meaning behind it? She nods a little, tellingly touching her side braid.");
	output("\n\n<i>“Yes, " + pc.mf("sir","ma’am") + ". My designation was chosen based on the first letter of my model type, ‘V’, the fact I am a Virtual Intelligence, and that my hair is violet.”</i>");
	output("\n\nSeems simple enough. Did someone special name her that, you ask? Her expression goes blank, and she begins to furiously blink.");
	output("\n\n<i>“Um, " + pc.mf("sir","ma’am") + ", I’m having trouble processing your input. I’m terribly sorry, but would you mind repeating the question?”</i>");
	output("\n\nYou rephrase the question, asking who designated her ‘Vi’, since the concept of ‘someone special’ hasn’t been programmed into her.");
	output("\n\n<i>“Oh, I was given my designation by the assembled medical staff. Several names were discussed, but ‘Vi’ won by popular vote,”</i> Vi explains, smiling.");
	processTime(4);
	// Return to talk menu.
	viTalkMenu();
	addDisabledButton(0,"Name","Name","You just talked about that.");
}

//Model
public function talkToViAboutHerModel():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	//if Met Other VKO:
	if(flags["MET_VKO"] != undefined)
	{
		output("You ask Vi about her model type. She looks decidedly different from the pink, fully dressed V-Ko you met before, particularly in the ‘lack of clothing area’.");
	}
	//else not Met Other Vko Because She Had Robot Cooties:
	else output("You ask Vi about her model type. She appears to be geared towards medical support, but she’s wearing almost nothing at all.");
	//FEELS LIKE I'M WEARING... NOTHING AT ALL
	output("\n\nVi clasps her hands together in front of her, a bright smile on her face. <i>“I’m a V-Ko model IV, variant five, " + pc.mf("sir","ma’am") + "! I was built to fit in with cultures that have low to no nudity taboos.”</i>");
	//Stupid sexy V-Ko
	output("\n\nWell, Gildenmere definitely fits that description. But what about the tail, you ask?");
	output("\n\n<i>“Oh, my JoyCord? My records indicate this was a part design being tested for a different model of medical relief androids. It can be equipped with different specialty attachments, or used to grab nearby objects while my hands are occupied.”</i>");
	processTime(2);

	CodexManager.unlockEntry("V-Ko IVs");
	output("\n\nYour codex beeps to inform you that <b>an informational article about this model has been unlocked.</b>");
	// Return to talk menu.
	viTalkMenu();
	addDisabledButton(1,"Model","Model","You just talked about that.");
}

//Owner
public function talkToViAboutHerOwner():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	output("You ask Vi who her current owner is. Does she belong to the UGC? She earnestly shakes her head.");
	output("\n\n<i>“Oh, no, I still belong to JoyCo, my manufacturers. I was sent here to provide medical support and supplies at an affordable price.”</i>");
	output("\n\nThat seems strangely altruistic. You ask Vi what the purpose of her being sent here is. She tilts her head, a perplexed look playing on her features. Seems it was too complex a question. You ask her instead if she has any other duties.");
	output("\n\n<i>“I’m also to report back any unique pathogens, biological data on flora and fauna, as well as the sentient species of Myrellion, " + pc.mf("sir","ma’am") + ". This helps JoyCo develop more effective treatments and prevent potential outbreaks resulting from first contact.”</i>");
	processTime(3);
	viTalkMenu();
	addDisabledButton(2,"Owner","Owner","You just talked about that.");
}

//Methods
// Must have had a parasite removed or been healed by Vi at least once.
public function talkToViAboutHerMethods():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	output("You ask Vi about her unusual healing methods. ");
	//MetOtherVko: 
	if(flags["MET_VKO"] != undefined) 
	{
		output("Compared to the V-Ko you met, the way she practices medicine is much more, well, <i>intimate</i>");
	}
	else output("You’ve never seen a medical android who practices medicine quite like <i>that</i>");
	output(". Plus, she seems kind of, well, empathic for a Virtual Intelligence.");

	output("\n\nVi nods, toying with her side braid. <i>“That’s common feedback registered with my product line, " + pc.mf("sir","ma’am") + ". We were designed to have a better, more organic bedside manner than other models, to ensure patients are properly relaxed.”</i>");

	output("\n\n<i>“Studies showed that users who were thinking sensual thoughts or engaging in acts of pleasure were by far the most relaxed and satisfied with their medical care. My anaesthetic lips and JoyCord allow me to keep a patient relaxed and administer hands-free treatment simultaneously.”</i>");

	output("\n\nYou ask her why she seems less stiff than most Virtual Intelligences. Even so, she doesn’t seem like a AI-D.");

	output("\n\n<i>“You are correct, " + pc.mf("sir","ma’am") + ". Most of my coding parameters are geared towards either medical care or my bedside manner, which is why my mannerisms appear more organic. Compared to the first generation of V-Kos, this model has approximately fifty million more lines of code.”</i>");
	processTime(4);
	viTalkMenu();
	addDisabledButton(3,"Methods","Methods","You just spoke about that.");
}

//Pleasure
// This topic must be unlocked by engaging in certain sex scenes.
public function talkToViAboutPleasure():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	output("You question Vi about something you noticed during sex; that she seems to feel sexual pleasure. That seems a little odd, you remark, since she’s a virtual intelligence.");
	output("\n\nVi visibly flushes. <i>“Ah, yes. It appears that while my internal diagnostics report everything is fine, secondary evidence – such as hospital video footage – suggest my hardware has been tampered with.”</i>");
	output("\n\n<i>“I’ve been informed by hospital staff that while I was powered down, a rusher appears to have installed me with a pleasure-reward interface. According to my databanks, this device delivers a digital approximation of organic sexual pleasure during intercourse. This device is unsanctioned by JoyCo, and I’ve already reported this for immediate fixing.”</i>");

	//pc has borrowed her pussy:
	if(pc.hasKeyItem("Vi's Vagina"))
	{
		output("\n\nVi flutters her eyes at you. <i>“The device is particularly troublesome when someone runs off with my primary sexual organ, taking it for their own private use!”</i>");
		output("\n\nYou grin, remarking that she seems to <i>enjoy</i> you toying with her now-pocket pussy, pulling it out. As you stroke her lower lips, the nurse droid quivers on the spot. Her full lips part and she lets out a low, breathy moan.");
		output("\n\n<i>“W-well, it is hard to provide sexual relief services without it! It’s hard to deliver proper treatment w-when, you’re, u-um, d-doing things like that!”</i> Vi pleads, rubbing her thighs together. Her slickness is already dribbling down your fingertips. A few more strokes, and you’re sure she’ll lose the ability to speak.");
		output("\n\nStashing her synthetic snatch away, Vi squirms on the spot. She looks all worked up! That pleasure-reward device must be working overtime!");
		pc.lust(5);
	}
	else 
	{
		output("\n\nVi then bows and looks incredibly apologetic, <i>“...I’m very sorry if this device has interfered with my sexual relief services. I’d hate to think I was giving you a sub-par effort because, um, of the sudden twitching and wetness I experience when I’m pleasuring you.”</i>");
		output("\n\nBy the way she’s blushing and rubbing her thighs together, you have a feeling she’s picturing exactly that right now.");
	}
	// Mark topic ‘Pleasure’ as having been read.
	flags["VI_PLEASURE_TALKED"] = 1;
	processTime(7);
	viTalkMenu();
	addDisabledButton(4,"Pleasure","Pleasure","You just spoke about that!");
}

//Heal
// Note: Getting medic/V-Ko heals would be a ton more useful if you didn’t just knit up wounds from sleeping out in the open!
public function healFromVi():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	output("You take Vi up on her suggestion, deciding to get treated for your wounds. After all, it’s not like you love walking around ");
	if(pc.HPQ() < 25) output("limping and bleeding");
	else if(pc.HPQ() < 50) output("all beat up");
	else output("all scuffed up");
	output(".");

	//Cost = 5 times HP 
	var cost:int = Math.round(pc.HPMax() - pc.HP());
	cost *= 5;

	output("\n\n<i>“Good,”</i> Vi visibly sighs with relief, pressing a hand to her chest. <i>“Judging by your injuries, your treatment should cost " + num2Text(cost) + " credits in total. Are you okay with that, " + pc.mf("sir","ma’am") + "?”</i>");

	clearMenu();
	//[Yes] [No]
	// Yes goes to ‘Get Healed’.
	// No goes to ‘Turn Down Healing’.
	if(pc.credits >= cost) addButton(0,"Yes",getHealedByVi,cost,"Yes","Pay Vi to heal you.\n\n<b>Cost: </b>" + cost + " credits");
	else addDisabledButton(0,"Yes","Yes","You can’t afford that.");
	addButton(1,"No",dontTakeViHeals);
}

//Get Healed
// Unlock ‘Methods’ talk topic, if not already unlocked.
public function getHealedByVi(cost:Number):void
{
	clearOutput();
	showVi();
	author("JimThermic");
	output("The synthetic nurse leads you to one of the patient beds, hidden behind a lavish privacy curtain. ");
	if(!pc.isNude()) output("There, you strip off your [pc.gear] and toss it aside, then climb onto the bed as instructed.");
	else output("Since you’re already naked, all you have to do is climb onto the bed as instructed.");
	output(" <i>“What now?”</i> you ask.");

	output("\n\n<i>“Just stay still so I can begin the procedure,”</i> Vi tells you, also climbing up and onto the bed. You watch ");
	if(flags["HEALED_BY_VI"] == undefined) output("with surprise ");
	output("as she presses your chest down and climbs on top of you, mounting your waist!");

	if(flags["HEALED_BY_VI"] == undefined)
	{
		output("\n\n<i>“Is this proper medical procedure?”</i> You ask, blinking up at the violet haired nurse.");
	}
	else output("\n\n<i>“I still can’t believe this is how you heal people,”</i> you remark, blinking up at the violet haired nurse.");
	output(" As she presses her hands against your chest and lowers herself down, you feel the tip of her braid intimately tickle the [pc.skinFurScalesNoun] of your belly. She brings her ivory lips closer, and you can feel her slightly cool breath brushing across your ");
	if(pc.biggestTitSize() >= 1) output("breasts.");
	else output("chest.");

	output("\n\n<i>“Of course – it is essential that you allow your body to relax during this procedure. Pinning you down is just the quickest way to do that,”</i> Vi remarks, a cat-like smile playing on her lips. Did someone program that in-? You don’t get time to ask before she administers a tiny kiss on your chest. Seconds later, your whole body begins to tingle. The pain you were feeling seconds before is entirely gone.");
	if(flags["HEALED_BY_VI"] == undefined) output(" Anaesthetic lips-?");

	output("\n\n<i>“Prevention is the best cure, " + pc.mf("sir","ma’am") + ". Please try to be more careful in the future,”</i> Vi almost purrs, bringing her snowy-white tail up and around to your wounds. The tip flips open, and from it pokes a nozzle of some sort. <i>“This may be a little cold, so focus on your chest.”</i>");

	output("\n\nAs Vi nuzzles and kisses your [pc.chest], you feel a small frigid blast enveloping your wounds. You can’t tell <i>which</i> of the sensations you’re shivering from! However, the chill soon fades away, replaced by warmth which you <i>assume</i> is your tissue healing.");

	output("\n\nWhen she stops blasting your wounds and kissing the pain away, you look over at where her tail has been, and your wounds are completely gone! Vi dismounts you with practiced effort and slides off the bed, a delighted smile playing on her ivory lips.");

	//PC is clothed:
	if(!pc.isNude())
	{
		output("\n\n<i>“All done, " + pc.mf("sir","ma’am") + "! Here are your clothes,”</i> she adds, helpfully handing your [pc.gear] to you. <i>“Is there anything else you require?”</i>");
	}
	//Else PC’s one of those fucking furry nudists like Tigger:
	else output("\n\n<i>“All done, " + pc.mf("sir","ma’am") + "! Is there anything else you require?”</i>");
	pc.HP(pc.HPMax());
	pc.credits -= cost;
	processTime(23);
	IncrementFlag("HEALED_BY_VI");
	// Return to Menu
	viMenu();
}

//Turn Down Healing
public function dontTakeViHeals():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	output("You turn down Vi’s offer of treatment. Her expression is one of visible worry, holding her balled up hands against her chest.");
	output("\n\n<i>“A-are you sure, " + pc.mf("sir","ma’am") + "? Walking around in your injured state must be troublesome. If there is any way I can make you reconsider your decision...”</i>");
	output("\n\nYou shake your head. Sensing your determination, she lowers her hand, bowing politely. <i>“Very well, " + pc.mf("sir","ma’am") + ". Are there any other services I can provide today?”</i>");
	processTime(2);
	viMenu();
}

//Examination
public function getExamanitedByVi():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	output("You ask Vi to check you for diseases. The synthetic nurse nods, pulling back one of the lavish privacy curtains. <i>“Of course, " + pc.mf("sir","ma’am") + ". Please climb onto the bed, and I’ll begin the examination.");
	if(!pc.isNude()) output(" You’ll need to strip off your things first.");
	output("”</i>");

	if(!pc.isNude())
	{
		//if No-Low Exhibition score && clothed:
		if(pc.exhibitionism() < 33)
		{
			output("\n\nCoughing a little, you slip behind the curtain, hearing it close behind you with a loud <i>sshhh</i>. As you begin to remove your clothes, you notice Vi watching, and remind yourself she’s just a robot. Still, as you strip off, she gives what you <i>swear</i> is an appreciative glance at your ass.");
		}
		//else if Moderate Exhibition Score && clothed:
		else if(pc.exhibitionism() < 66)
		{
			output("\n\nYou blushingly begin stripping off your things before you reach the curtain, unsure if you’re happy or sad that you don’t need to do it in front of an audience. Still, when the privacy screen closes with a loud <i>shhh</i>, Vi is standing there and giving what you swear is an appreciative glance at your ass.");
			output("\n\n<i>“...Do you like what you see?”</i> you ask, simultaneously stripping off. The violet-haired nurse toys with the end of her side plait, a light smile on her snowy lips.");
			output("\n\n<i>“Your posterior has an admirable amount of symmetry, " + pc.mf("sir","ma’am") + ". My medical database informs me symmetry is considered attractive amongst organics. In that sense, your backside is excellent.”</i>");
			pc.lust(3);
		}
		//else if high exhibition score && clothed:
		else
		{
			output("\n\nYou brazenly begin stripping off on the spot, right in front of all the other medical staff. While the half-nude doctors and nurses are not abashed by your nudity, they are certainly <i>attracted</i> to it, watching with avid interest as you strip off.");
			output("\n\n<i>“Um, " + pc.mf("sir","ma’am") + ", there’s a privacy curtain?”</i> Vi pipes up. You notice she’s holding it back for you... apparently stripping was a bit premature. Chuckling a little, you stride butt-naked behind it. As you strut past, you swear you see the violet-haired nurse give your ass an appreciative glance.");
			output("\n\n<i>“...Do you like what you see?”</i> you ask, feeling a little worked up from all the attention. Vi closes the screen with a loud <i>shhhh</i> behind you, a light smile on her snowy lips.");
			output("\n\n<i>“Your posterior has an admirable amount of symmetry, " + pc.mf("sir","ma’am") + ". My medical database informs me symmetry is considered attractive amongst organics. In that sense, your backside is excellent.”</i>");
			pc.lust(5);
		}
	}
	//else unclothed:
	else
	{
		output("\n\nAs you walk up to the bed and Vi closes the privacy curtain behind you, you swear the violet-haired nurse gives your ass an appreciative glance. Butt naked, you turn to her, quirking a brow.");
		output("\n\n<i>“Looking at something?”</i> you ask, feeling curious. The snowy-skinned nurse smiles, crossing her arms under those voluptuous breasts of hers.");
		output("\n\n<i>“Your posterior has an admirable amount of symmetry, " + pc.mf("sir","ma’am") + ". My medical database informs me symmetry is considered attractive amongst organics. In that sense, your backside is excellent.”</i>");
	}
	output("\n\nNow that your obligatory ogling is done, you climb onto the surprisingly comfy bed. The curvaceous nurse then brings her fingers to your chest. You try to sit calmly as her slender digits roam across your [pc.skinFurScalesNoun]. Her long-lashed lids are intensely narrowed as she examines you, each of her fingertips glowing with pale, purple light. The whole thing feels <i>very</i> intimate...");
	output("\n\n<i>“I can hear your heartbeat, " + pc.mf("sir","ma’am") + ". It’s very strong,”</i> Vi murmurs, her fingers splaying across your [pc.chest]. Your cheeks burn brightly, your pulse speeding up, her delicate fingers brushing awfully close to your nipples.");
	output("\n\nSuddenly, tiny, delicious little jolts begin to tickle them – not painful in the least, but instead <i>very</i> stimulating. You gasp out loud, trying not to squirm as her fingers splay around them, lightly pinching the sides.");
	output("\n\n<i>“...Commencing deep scan. We don’t want to miss anything,”</i> Vi smiles, rubbing her fingers against your ");
	if(pc.biggestTitSize() >= 1) output("breasts");
	else output("chest");
	output(". <i>“Analyzing...”</i>");

	processTime(14);
	
	var sstds:Number = pc.sstdTotal();
	var parasites:int = 0;
	if(pc.hasStatusEffect("Butt Bug (Female)")) parasites++;
	if(pc.hasCuntTail() && pc.hasParasiteTail()) parasites++;
	if(pc.hasCockTail() && pc.hasParasiteTail()) parasites++;
	if(attachedMimbranes() > 0) parasites++;
	//if Detected No Parasites:
	if(sstds <= 0 && parasites <= 0)
	{
		output("\n\nVi pulls back and puts a hand on her synthetic chest, letting out a relieved sigh. <i>“Good. You appear to be in perfect health, " + pc.mf("sir","ma’am") + ". Apart from a highly advanced group of microsurgeons, there are no foreign contaminants in your system. Nothing to worry about!”</i>");
		output("\n\n<i>“");
		if(pc.isNice()) output("So, the cost...?");
		else if(pc.isMischievous()) output("What’s the damage, doc?");
		else output("That was pretty quick, you better not charge me much. Cost?");
		output("”</i> You ask, bringing up your credit balance on your codex.");

		output("\n\nVi chuckles and picks up a chart with her tail, dumping it in her hands. <i>“No cost, " + pc.mf("sir","ma’am") + " – examinations are always free. Treatments are a little different. I still have to charge a small fee, but it’s well below galactic norms. Thankfully I can provide my services to you at a dime.”</i>");

		output("\n\n<i>“Is there anything else I can help you with today, " + pc.mf("sir","ma’am") + "?”</i>");
		// Return to menu
		viMenu();
		return;
	}
	
	var buttons:Array = [];
	
	//if detected more than one lot of parasites:
	if(sstds > 0)
	{
		output("\n\n<i>“I should also inform you, it appears you have contracted ");
		if(sstds > 1) output("more than one type of disease");
		else output(pc.getRandomSSTD());
		if(parasites > 0)
		{
			output(" and ");
			if(parasites > 1) output("multiple parasites");
			else output("a parasite as well");
			output(". Unfortunately, I can only ");
			if(parasites > 1) output("treat one of your parasitic infections at a time. Alternatively, I can cure your diseases for a modest 500 credits.");
			else output("treat a parasite or your diseases at a time. The latter costs 500 credits.");
		}
		else
		{
			output(". A treatment to cure ");
			if(sstds > 1) output("them");
			else output("it");
			output(" can be produced for only 500 credits and a few minutes of processing time. Would you like a treatment?");
		}
		output(" Please indicate your choice, " + pc.mf("sir","ma’am") + ".”</i>");
		
		if(pc.credits < 500)
		{
			buttons.push(["TreatDisease", null, undefined, "Treat Disease", "You cannot afford this treatment.\n\nCosts 500 credits"]);
		}
		else
		{
			buttons.push(["TreatDisease", removeDiseasesVI, undefined, "Treat Disease", "Get any diseases you’re carrying removed for 500 credits."]);
		}
	}
	if(parasites > 0)
	{
		if(sstds <= 0)
		{
			if(parasites > 1)
			{
				output("\n\n<i>“I should also inform you, it appears you have more than one type of parasitic affliction. Unfortunately, I can only treat one lot of parasites in a single procedure. Please indicate which infestation you would like me to treat first, " + pc.mf("sir","ma’am") + ".”</i>");
				// Show list of parasites + no removal button.
				// Treating a parasite goes to the ‘Remove Parasite’ Scene further down. No Removal goes to the ‘Turn Down’ scene, also further down.
			}
		}
		// if PC has butt bug:
		if(pc.hasStatusEffect("Butt Bug (Female)"))
		{
			if(parasites == 1)
			{
				output("\n\nHer fingers reach up to clasp your shoulder, and she turns you slightly around to gaze at your ass – the second time in a row! This time, however, she’s staring with a concerned look in her eyes.");
				output("\n\n<i>“It is as I thought. I’m sorry to inform you of this, " + pc.mf("sir","ma’am") + ", but you’ve been infected by a hilinara parasite. In order to treat it, I will have to administer anesthesia. Will you consent to treatment?");
			}
			buttons.push(["Treat B.Bug", removeAParasiteWithVi, "buttbug", "Treat Butt Bug", "Remove the butt bug parasite."]);
		}
		// if cock snake:
		if(pc.hasCockTail() && pc.hasParasiteTail())
		{
			if(parasites == 1)
			{
				output("\n\nHer fingers reach up to clasp your shoulder, and she turns you slightly around to gaze at your ass – the second time in a row! This time, however, she’s staring with a concerned look in her eyes.");
				output("\n\n<i>“It’s as I thought. I’m sorry to inform you of this, " + pc.mf("sir","ma’am") + ", but you’ve been infected by a hydrus constuprula parasitic vine. In order to treat it, I will have to administer anesthesia. Will you consent to treatment?");
				//[Treat Cock.S] [NoRemoval]
				// Treating goes to ‘Remove Parasite’ Scene further down. No Removal goes to the ‘Turn Down’ scene, also further down.
			}
			buttons.push(["Treat C.Vne", removeAParasiteWithVi, "cockvine", "Cockvine Treatment", "Get any parasitic tails removed."]);
		}
		// If Cunt Snake:
		if(pc.hasCuntTail() && pc.hasParasiteTail())
		{
			if(parasites == 1)
			{
				output("\n\nHer fingers reach up to clasp your shoulder, and she turns you slightly around to gaze at your ass – the second time in a row! This time, however, she’s staring with a concerned look in her eyes.");
				output("\n\n<i>“It is as I thought. I’m sorry to inform you of this, " + pc.mf("sir","ma’am") + ", but you’ve been infected by a class ‘C’ parasitic snake. In order to treat it, I will have to administer anesthesia. Will you consent to treatment?");
				//[Treat Cnt.S] [NoRemoval]
				// Treating goes to ‘Remove Parasite’ Scene further down. No Removal goes to the ‘Turn Down’ scene, also further down.
			}
			buttons.push(["Treat C.Snk", removeAParasiteWithVi, "cuntsnake", "Cunt Snake Treatment", "Get any parasitic tails removed."]);
		}
		// if PC has mimbranes attached:
		if (attachedMimbranes() > 0)
		{
			if(parasites == 1)
			{
				output("\n\nPulling back, there’s a concerned look in Vi’s eyes. She reaches up with a hand and toys with the tip of her side plait. <i>“I’m sorry to inform you of this, " + pc.mf("sir","ma’am") + ", but you appear infected with " + (attachedMimbranes() == 1 ? "a class ‘M’ epidel parasite" : "class ‘M’ epidel parasites") + ". In order to treat it, I will have to administer anesthesia. Will you consent to treatment?”</i>");
				//[Treat Mimb] [NoRemoval]
				// Treating goes to ‘Remove Parasite’ Scene further down. No Removal goes to the ‘Turn Down’ scene, also further down.
			}
			buttons.push(["Treat Mimbs", removeAParasiteWithVi, "mimbrane", "Mimbrane Treatment", "Get any mimbranes removed."]);
		}
	}
	
	if(sstds > 0 || parasites > 0)
	{
		clearMenu();
		
		var btn:int = 0;
		var i:int = 0;
		for(i = 0; i < buttons.length; i++)
		{
			if(btn >= 14 && (btn + 1) % 15 == 0)
			{
				addButton(btn, "None", declineParasiteTreatmentFromVi, undefined, "No", "Decline to get any parasites removed.");
				btn++;
			}
			
			if(buttons[i][1] == null) addDisabledButton(btn, buttons[i][0], buttons[i][3], buttons[i][4]);
			else addButton(btn, buttons[i][0], buttons[i][1], buttons[i][2], buttons[i][3], buttons[i][4]);
			btn++;
		
			if(buttons.length > 14 && (i + 1) == buttons.length)
			{
				while((btn + 1) % 15 != 0) { btn++; }
				addButton(btn, "None", declineParasiteTreatmentFromVi, undefined, "No", "Decline to get any parasites removed.");
			}
		}
		addButton(14, "None", declineParasiteTreatmentFromVi, undefined, "No", "Decline to get any parasites removed.");
	}
}

public function removeDiseasesVI():void
{
	clearOutput();
	showVKo();
	author("Fenoxo");
	output("After a few moments of simulated concentration, the nursedroid speaks up, <i>“There! I’ve scanned your viral structure and uploaded a countermeasure to your microsurgeon immune system. You should be clear of the disease in a few moments.”</i>");
	output("\n\n<i>“Do you require additional services?”</i>");
	pc.removeSSTDs();
	processTime(15);
	pc.credits -= 500;
	IncrementFlag("TREATED_BY_VI");
	viMenu();
}

//Remove Parasite
// Unlock ‘Methods’ talk topic, if not already unlocked.
public function removeAParasiteWithVi(arg:String):void
{
	clearOutput();
	showVi();
	author("JimThermic");
	output("<i>“Good,”</i> Vi visibly sighs with relief, a bright smile spreading across her ivory lips. <i>“Now, time to go to sleep. The procedure will be done before you know it.”</i>");
	output("\n\nYou’re surprised when the violet-haired medic wraps her arms around your neck and plants a soft, synthetic kiss right on your lips! Just as you open your mouth to exclaim your surprise, you feel your consciousness swiftly slip away. The last sight you see is her face pulling back from yours. You can feel her catching your head as you fall back into the sheets... and into nothingness.");
	processTime(2);
	// Next Page
	clearMenu();
	addButton(0,"Next",postParasiteRemoval,arg);
}

public function postParasiteRemoval(arg:String):void
{
	clearOutput();
	showVi();
	author("JimThermic");
	output("When you awaken, you feel a slight stroking of your cheek. There’s a warm pressure there. It feels kind of soothing.");
	output("\n\n<i>“...Vitals are nominal... " + pc.mf("Mister","Miss") + " Steele, can you hear me?”</i> You hear Vi ask. It takes you a few moments to respond in the affirmative, and longer still to open your eyes. When you do, however, the medic looks very pleased. <i>“Here, let me help you up. The chemicals should be metabolized out of your system any second now, though you may have a slight aftertaste...”</i>");
	output("\n\nShe’s right. There’s a slightly unpleasant metallic flavor on your tongue. You feel something being pressed into your hands. Feels like a cup. The straw is brought to your lips, and you suck on it. Mmm, it’s some sort of flavorful juice. Just the thing to flush the bad taste out.");
	output("\n\n<i>“How did the treatment go?”</i> You ask, your vision slowly clearing. Vi seems to be clutching a chart to her bountiful bust, looking very pleased. Her synthetic tail is even flicking!");
	output("\n\n<i>“It was a complete success, " + pc.mf("sir","ma’am") + "! All ");
	if(arg == "cuntsnake") output("‘C’ type snakes");
	else if(arg == "cockvine") output("‘H’ class parasitic vines");
	else if(arg == "mimbrane") output("‘M’ class epidel parasites");
	else if(arg == "buttbug") output("‘B’ class parasitic worm");
	output(" were removed from your body. There should be no lasting effects, but if you do find yourself exhibiting strange symptoms, please come find me.”</i>");

	output("\n\nYou ask Vi if she’s going to charge you for the treatment, and she shakes her head. There’s suddenly a lively look in her eyes. <i>“Oh no, the operation was free! Due to the inherent dangers of first contact and the introduction of parasites, JoyCo can invoice the UGC directly for any containment costs.”</i>");
	output("\n\nWell, that’s handy for you. You thank her for her services, since she apparently performed the surgery. Not so coincidentally. There’s a quarantine container not too far away from your bed, marked for immediate medical incineration.");
	// Do the removal shit
	purgeParasites(arg);
	
	IncrementFlag("TREATED_BY_VI");
	// Return to menu.
	processTime(120+rand(20));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Turn Down
public function declineParasiteTreatmentFromVi():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	output("You turn down Vi’s treatment and hop off the table. Her expression is one of visible worry, holding her balled up hands against her chest.");
	output("\n\n<i>“A-are you sure, " + pc.mf("sir","ma’am") + "? Walking around with a parasitic infection must be troublesome. If there is any way I can make you reconsider your decision...”</i>");
	output("\n\nYou shake your head. Sensing your determination, she lowers her hand, bowing politely. <i>“Very well, " + pc.mf("sir","ma’am") + ". Are there any other services I can provide today?”</i>");
	// Return to Menu.
	viMenu();
}

public function viShop(buy:Boolean = true):void
{
	clearOutput();
	showVi();
	author("JimThermic");
	shopkeep = chars["VI"];
	//Buy texts!
	var buyText:String = "You ask Vi what kind of supplies she has for sale. An excited look lights up her face, and she suddenly runs off! Just when you’re wondering if she’s going to come back, the violet-haired android comes back hefting a large container of... <i>some</i>thing... and drops it in front of you.";
	if(flags["SEEN_VI_BUY_MENU"] == undefined)
	{
		buyText += "\n\n<i>“Whew! Sorry about that, " + pc.mf("sir","ma’am") + ", I was beginning to think nobody would ever ask!";
	}
	else buyText += "\n\n<i>“Sorry, I put away the stock container. Nobody but you ever asks for it - n-not that I mind that you do!";
	buyText += "”</i> Vi flushes, taking a moment to compose herself. <i>“...So, this is what I’ve been sent at the moment. Is there anything you’d like?”</i>\n";
	
	//Sell texts!
	var sellText:String = "You ask Vi if you can sell her some medical supplies. She nods happily, grabbing a digipad with her prehensile tail and dropping it into her hands.\n\n<i>“Of course! We’re always looking for more medical supplies around here. What do you have?”</i>\n";

	//Plug in the pieces.
	chars["VI"].keeperBuy = buyText;
	chars["VI"].keeperSell = sellText;
	chars["VI"].keeperGreeting = "RUH ROH! SOMETHING WENT WRONG.";
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	if(buy) 
	{
		if(flags["SEEN_VI_BUY_MENU"] == undefined) flags["SEEN_VI_BUY_MENU"] = 1;
		buyItem();
	}
	else sellItem();
}

//S.Relief
public function viSexualRelief():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	//PC has borrowed her pussy:
	if(pc.hasKeyItem("Vi's Vagina"))
	{
		output("You ask for sexual relief and Vi blushes, outstretching a hand.");
		output("\n\n<i>“I cannot offer proper sexual relief until you return my pussy, " + pc.mf("sir","ma’am") + "!”</i>");
		clearMenu();
		//[ReturnIt] [Don’t]
		addButton(0,"Return It",returnVisPussyPot);
		addButton(1,"Don’t",dontReturnsVisCunt);
	}
	//Else // Pussy not borrowed:
	else
	{
		//First Time getting sex relief:
		if(flags["VI_SEXED"] == undefined)
		{
			output("<i>“You mentioned ‘relief’ earlier. Relief from what, exactly?”</i>");
			output("\n\nVi gives a telling glance towards one of the nearby beds, her fingertips toying with her side braid. <i>“...Um, well, the sexual kind, " + pc.mf("sir","ma’am") + ". Sexual frustration is a leading cause of accidents. It’s not good to be pent up all the time, and I was designed to help relieve those frustrations.”</i>");
			output("\n\nThe violet-haired femme-droid looks up at you through her long lashes. It’s hard not to notice her stocking clad thighs rubbing together. <i>“...Would you like me to show you my special functionalities, " + pc.mf("sir","ma’am") + "? It’s been a long while – I apologise if I’m a little uncalibrated...”</i>");
		}
		//Had Sex with her more than once AND less than ten times:
		else if(flags["VI_SEXED"] < 10)
		{
			output("You ask Vi if she can offer you some of her ‘special relief’.");
			output("\n\nVi gives a telling glance at once of the nearby beds, her face visibly flushed. A hand reaches up to toy with the tip of her side braid and her stocking clad thighs rub together. <i>“O-of course, " + pc.mf("sir","ma’am") + "! I, um, kept my calibration settings from last time in a special file. I’m happy that you want to use me again.”</i>");
		}
		//Had sex ten or more times:
		else
		{
			output("You ask Vi if she can offer some of your ‘special relief’, since you’ve become quite fond of being tended to by the synthetic nurse.");
			output("\n\nVi’s whole face flushes, and you can see her squirming on the spot. Slick, gleaming fluid begins to liberally drool from her pale pussy lips, quickly soaking her stocking clad thighs. <i>“O-of course, " + pc.mf("sir","ma’am") + "! I, um, have your calibrations settings saved to a special file... I’m really happy that you want to use me again.”</i>");
			output("\n\nYou swear her digital eyes look quite spaced out. Is she becoming addicted to having sex with you?");
			//HaveNotReadPleasureTalkTopic: 
			if(flags["VI_PLEASURE_TALKED"] == undefined) output("\n\nMaybe you should ask her about it.");
		}
		viSexMenu();
	}
}

//Return It:
public function returnVisPussyPot():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	output("Handing over her purloined pussy, Vi positions it between her stocking-clad thighs and inserts it back into her body. There’s a little bit of wiggling before it’s finally back in place.");
	output("\n\n<i>“...There! I should be back at full functionality now, " + pc.mf("sir","ma’am") + ". Please don’t run off with JoyCo property again!”</i> Vi pleads.");
	if(flags["VI_PUSSY_FAPPED"] != undefined)
	{
		output(" At the same time, she looks a <i>little</i> pleased, perhaps with how you were using her pussy in its absence?");
		flags["VI_PUSSY_FAPPED"] = undefined;
	}
	processTime(1);
	// Vi gets her pussy back.
	// Remove Vi’s pocket pussy from player’s key inventory.
	// Return to her main menu.
	pc.removeKeyItem("Vi's Vagina");
	viMenu();
}

//Dont
public function dontReturnsVisCunt():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	output("<i>“I can’t administer proper sexual relief while you’re still running around with JoyCo property. My functionality has already been halved!”</i> Vi exclaims. At the same time, she looks a little bit pleased. Does she like the fact someone literally owns her pussy...?");
	processTime(1);
	// Nothing changes.
	// Return to her main menu.
	viMenu();
}

public function viSexMenu():void
{
	clearMenu();
	var capacity:Number = chars["VI"].vaginalCapacity(0);

	if(pc.hasCock())
	{
		if(pc.cockThatFits(capacity) >= 0) 
		{
			addButton(0,"Ride Her",rideVi,undefined,"Ride Her","Throw her face-forward on the bed and have your way with her pussy. Must have a cock.");
			//Cowgirl
			// PC must have cock
			// PC must not be taur
			if(pc.isTaur()) addDisabledButton(5,"Cowgirl","Cowgirl","This sexual position does not work with your anatomy.");
			else addButton(5,"Cowgirl",cowgirlWithVi,undefined,"Cowgirl","Get into a bed, have her climb on you, and have some face-to-face sex, cowgirl style.");
			if(pc.isTaur()) addDisabledButton(7,"Rough Sex","Rough Sex","This doesn’t work with your body type.");
			else addButton(7,"Rough Sex",roughSexWithVi,undefined,"Rough Sex","Ravish the nurse-droid <i>rough</i> and <i>hard</i>. WARNING: Hardcore SM content.");
		}
		else 
		{
			addDisabledButton(0,"Ride Her","Ride Her","You’re too big to fit inside her.");
			if(pc.isTaur()) addDisabledButton(5,"Cowgirl","Cowgirl","This sexual position does not work with your anatomy.");
			else addDisabledButton(5,"Cowgirl","Cowgirl","You’re too big to fit inside her.");
			if(pc.isTaur()) addDisabledButton(7,"Rough Sex","Rough Sex","This doesn’t work with your body type.");
			else addDisabledButton(7,"Rough Sex","Rough Sex","You’re too big to fit inside her.");
		}
		addButton(2,"Potency T.",viPotencyTest,undefined,"Potency Test","Get a ‘Potency Test’ from the nurse droid to test your [pc.cumNoun]-making capacity. Must have a cock.");
		addButton(8,"Titty Fuck",tittyFuckDatVi,undefined,"Titty Fuck","Fuck her tits and add some cream to her chest. Must have a cock.");
	}
	else
	{
		addDisabledButton(0,"Ride Her","Ride Her","You require a penis for this.");
		addDisabledButton(2,"Potency T","Potency Test","You require a penis for this.");
		addDisabledButton(5,"Cowgirl","Cowgirl","You need a penis in order to do this.");
		addDisabledButton(7,"Rough Sex","Rough Sex","You need a penis in order to do this.");
		addDisabledButton(8,"Titty Fuck","Titty Fuck","You need a penis to do this.");
	}
	if(pc.hasGenitals()) 
	{
		//Give Head
		// No taurs
		// No back genitals
		// No Neuters
		if(pc.genitalLocation() >= 2 || pc.isTaur()) addDisabledButton(3,"Get Head","You must have your genitalia in the proper location and not be a taur for this.");
		else addButton(3,"Get Head",giveHeadToVi,undefined,"Get Head","Ask her to ‘give you some head’. Request may not work out as intended. Must not be a neuter or taur.");
	}
	else addDisabledButton(3,"Get Head","Get Head","You need genitalia for this.");


	addButton(1,"AnalTease",analViTease,undefined,"Anal Tease","Get her to tease your ass with her fingers, and perhaps something a little bigger?");
	addButton(4,"Tail Screw",tailScrewWithVi,undefined,"Tail Screw","Have her attach a phallic attachment to her tail-cord and fuck your ass with it.");
	addButton(6,"Use Pussy",useVisPussy,undefined,"Use Pussy","Ask her if you can use her pussy. Request may not work out as intended.");
	//[RideHer] [AnalTease] [Potency.T] [GetHead] [TailScrew]
	//[Cowgirl] [UsePussy] [RoughSex] [TitFuck]
	// RideHer.tooltip: Throw her face-forward on the bed and have your way with her pussy. Must have a cock.
	// AnalTease.tooltip: Get her to tease your ass with her fingers, and perhaps something a little bigger?
	// PotencyT.tooltip: Get a ‘Potency Test’ from the nurse droid to test your [pc.cumNoun]-making capacity. Must have a cock.
	// GetHead.tooltip: Ask her to ‘give you some head’. Request may not work out as intended. Must not be a neuter or taur.
	// TailScrew.tooltip: Have her attach a phallic attachment to her tail-cord and fuck your ass with it.
	// Cowgirl.tooltip: Get into a bed, have her climb on you, and have some face-to-face sex, cowgirl style. PC must have a cock and not be a taur.
	// UsePussy.tooltip: Ask her if you can use her pussy. Request may not work out as intended.
	// RoughSex.tooltip: Ravish the nurse-droid <i>rough</i> and <i>hard</i>. WARNING: Hardcore SM content. Must have a cock.
	// TitFuck.tooltip: Fuck her tits and add some cream to her chest. Must have a cock.
	addButton(14,"Back",approachVi);
}

//Ride Her
// PC must have have a cock.
// PC cock can be any size.
public function rideVi():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	var x:int = pc.cockThatFits(chars["VI"].vaginalCapacity(0));
	output("You shoot a glance at one of the privacy curtains. Both of you wordlessly slip behind it. As soon as you’re behind the fabric barrier, you feel her arms slip around ");
	if(!pc.isTaur()) output("you from behind");
	else output("your waist");
	output(", and the sizable pressing of her breasts against you.");

	//PC is wearing clothes:
	if(!pc.isNude())
	{
		output("\n\n<i>“...Please, " + pc.mf("sir","ma’am") + ", let me strip off your clothes...”</i> Vi breathily requests, her slender fingers stroking intimately across your chest. You silently nod.");
		//ArmorYes:
		if(!(pc.armor is EmptySlot)) output(" The violet-haired medic strips off your [pc.armor], kissing your shoulder blades and back with her synthetic lips, almost worshipfully so.");
		if(!(pc.upperUndergarment is EmptySlot)) output(" Her hands slide upward and remove your [pc.upperUndergarment].");
		if(!(pc.lowerUndergarment is EmptySlot)) output(" With practiced precision, her fingers then delve downward, pulling off your [pc.lowerUndergarment].");
	}
	output("\n\nFeeling impulsive, you grab Vi firmly by the hips and lead her to the bed. The medic-bot blushes harder – it seems she’s unused to patients taking the lead. Once there, you twirl her on the spot and push her face-forward against the bed, enjoying her surprised squeak. <i>“..." + pc.mf("S-s-sir","M-m-ma’am") + ", I’m meant to be the one administering relief!”</i>");
	if(flags["VI_SEXED"] != undefined && flags["VI_SEXED"] >= 10) output(" Her ivory pussy can’t stop gushing; synthetic lubricant is streaming down her stocking-clad thighs and making a big, messy puddle between her tiny feet.");
	else output(" There’s already synthetic lubricant dribbling out from her ivory pussy. It’s dribbling and glistening down her stocking-clad thighs, making a little puddle between her tiny feet.");

	output("\n\n<i>“Who said I’m not enjoying myself?”</i> You ask, sliding two of your fingers into her sopping wet snatch. Vi trembles and moans as your fingers penetrate her from behind and wiggle about inside of her. You caress her surprisingly human g-spot, stroking a finger against her quaking insides, until she lets out a high pitched cry. The medical droid begins spasming on the spot, squirting lubricant wildly from her thighs, and utterly drenching your hand!");
	output("\n\n<i>“AH-AHHH! Muh-Muscular systems malfunctioning! Cognitive functions impaired!”</i> Vi whimpers, clutching desperately at the bedsheets. <i>“E-Experiencing strange, unregulated input. Buh-behavioral system shutting down!”</i> Her hips buck back against your knuckles, forcing your fingers as deep as they can go into her slopping wet pussy. <i>“...P-please, </i>more<i>, " + pc.mf("sir","ma’am") + "!”</i>");
	output("\n\nOnce her explosive climax is finally finished, Vi collapses in a heap against the sheets.");

	if(flags["VI_PLEASURE_TALKED"] == undefined) output("\n\nWhat was that, some kind of digital orgasm..? You’re surprised, since that shouldn’t be possible, but also");
	else output("\n\nAfter watching her cute digital orgasm, you’re");
	output(" rock hard. ");
	if(!pc.isTaur()) output("Grabbing her twitching ivory tail in one hand,");
	else output("Putting your front [pc.footOrFeet] on the bed, you prepare yourself to mount the comparatively tiny nurse-droid, then");
	output(" you plunge [pc.oneCock] into her squirting snatch. Her passage is so warm and slick that it only takes a few seconds before you’re buried in her right up to the hilt.");
	pc.cockChange();

	output("\n\n<i>“..." + pc.mf("S-sir","M-ma’am") + "’s inside of me,”</i> she moans. The nurse-droid’s well-lubed passage suddenly constricts around your shaft, her pale hips shaking with unconcealed delight. Gripping tightly to her tail, you grind against her pale asscheeks, massaging her passage with your [pc.cockNounSimple " + x + "]. With trembling little sighs, she presses back into your thrusts, desperately coaxing your crown deeper inside of her. Her snowy hands ball up in the sheets and her whole back arches like a synthetic cat, one that you’ve ");
	if(!pc.isTaur()) output("caught by the tail!");
	else output("mounted in heat.");
	output(" <i>“P-Please... unload your sperm inside of me!”</i> Vi breathily begs.");

	output("\n\nWith that plea, she draws you right in and up to the base, then wrings it hard. Before you can even cum, however, the nurse-droid begins squirting and spasming around your cock – way too turned on by the feeling of it rubbing that deep inside of her. Swooning with pleasure, you give one final thrust, giving yourself over to the pleasure assaulting your wringed prick. You shoot your [pc.cumVisc] hot [pc.cumNoun] inside Vi’s clenching cunt, shooting it straight up into her synthetic and inactive womb.");
	//LargeCumOrMore: 
	var cum:Number = pc.cumQ();
	if(cum >= 1000) 
	{
		output(" You gush so much love-liquid from your [pc.cockHead " + x + "] that her synthetic belly begins to swell, until she ");
		if(cum < 3000) output("has a tiny baby bump.");
		else if(cum < 6000) output("looks like she’s six months pregnant.");
		else if(cum < 10000) output("looks like she’s in her final term.");
		else output("looks like she’s about to give birth to a leithan foal!");
		output(" When you finally pull out your prick, a [pc.cumColor] flood gushes out from her sticky snatch, and Vi cums again, each orgasmic contraction sending streams of [pc.cumNoun] spraying wildly all over the hospital floor. When she’s fully empty, she holds her now flattened belly, looking spaced out and somehow, a little wistful; did she like having her womb filled with your DNA?");
	}
	else output(" When you pull out your prick, a small stream of [pc.cumColor] trickles down the inside of her pearly thighs.");

	output("\n\n<i>“...T-that experience was incalculable, " + pc.mf("s-sir","m-ma’am") + ". I-I think I’m going to have trouble categorizing it for my memory databanks,”</i> Vi dreamily murmurs, rubbing a hand longingly between her legs. She looks up at you, her long lashes fluttering. <i>“...My motor functions are still impaired... and my processing time is reduced... I believe this unit may have trouble standing up.”</i>");

	if(!pc.isAss()) output("\n\nYou reach out a hand and help Vi to her feet. Even then, she’s a little wobbly, falling moments later into your arms and chest.");
	else output("\n\nPfft. That’s not your problem.");
	output(" After a minute or two, she regains full functionality. Her tail grabs a cloth and begins to wipe up her [pc.cumNoun]-splattered pussy, a serious blush on her cheeks.");

	output("\n\n<i>“I hope I helped relieve your sexual frustration, " + pc.mf("sir","ma’am") + ". You appear to have left ");
	if(cum < 20) output("at least some");
	else if(cum < 1000) output("a fair amount of");
	else output("a large amount of");
	output(" your seed within this unit,”</i> Vi observes, twirling her fingers coquettishly around her side braid. <i>“I-If you wish to utilize my services again, you need but ask...”</i>");

	output("\n\nYou grin, slipping your ");
	if(pc.isNude()) output("Codex");
	else output("clothes");
	output(" back on and stepping out from behind the privacy curtain. Vi follows out a little later, trying to fix up her noticeably tousled hair.");

	// Unlock talk topic ‘Pleasure’ if not unlocked already.
	// Scene end, back to menu
	processTime(37);
	IncrementFlag("VI_SEXED");
	StatTracking.track("joyco/cum milked", cum);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Anal Tease
public function analViTease():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	output("<i>“I know the perfect way to relieve the tension. Follow me!”</i> Vi exclaims. You follow her as she leads you to a bed and pulls around the privacy curtain. She instructs you to ");
	if(!pc.isNude()) output("remove your things and then to ");
	output("climb up on to the bed. You do as she asks, bending over obediently, your ass sticking up in the air.");

	output("\n\nYou’re not exactly sure what you’re waiting for, but you don’t have to wait long to find out. Suddenly there’s a cool, slick sensation between your buttocks, and you feel a finger abruptly pressed into your anus! You let out surprised noise as a slender digit wiggles around inside of your bum, shallowly lubing it up both inside and out.");
	if(pc.hasCock())
	{
		output(" With a slight blush, your [pc.cocks] ");
		if(pc.cockTotal() == 1) output("excitedly twitches");
		else output("excitedly twitch");
		output(", betraying your arousal.");
	}
	output("\n\n<i>“Like that, do you? I’m not surprised – the anus has a relatively high number of nerve endings, you know,”</i> Vi explains, all the while lewdly running her finger around inside of your ring. <i>“");
	if(pc.hasCock()) output(" And then further in, there’s your prostate, which when stroked can produce stronger and more powerful orgasms than penile stimulation.");
	else if(pc.hasVagina()) output(" And then further in, there’s a special place where you can stimulate your G-spot from the other side.");
	else output(" I hear having a large object filling up your rectum can feel quite pleasant.");
	output(" Would you like to try?”</i>");

	output("\n\nYou nod, your face burning as you try to hide it in the bed pillow. Still, you raise your rump invitingly. Her feminine digits burrow deeper into your backside, wiggling their way inward, and you let out a sweet moan. It feels like a thrumming erotic warmth is filling every inch of you, completely different to ");
	if(pc.hasCock()) output("the pinpoint pleasure of having your [pc.cocksNounSimple] stroked! When they reach your walnut-sized prostate,");
	//else if pc.hasPussy: 
	else if(pc.hasVagina()) output("the belly-pooling pleasure of having your [pc.vaginas] stroked! When she reaches the thin fleshy wall guarding your g-spot,");
	else output("the pinpoint pleasure of having your opening teased! When she reaches the innermost depths of your rectum,");
	output(" she gently strokes along it, making your [pc.legOrLegs] quiver and your lips part. You hear a " + pc.mfn("throaty moan","high-pitched moan","hitched moan") + ", and only later do you realize it was <i>yours</i>!");
	output("\n\n<i>“Bit of a butt-slut, are we?”</i> Vi huskily teases, all the while wiggling her fingers knuckle-deep inside your asshole. It’s a little hard to argue when you’re letting out such loud moans, bent over with a nurse-droid’s fingers inside your rump! You let out a whine of protest when she pulls her fingers out, only to feel something thin slide inside of you in it’s place. Whatever it is, it’s got a flat base to stop it being totally swallowed inside; it’s clearly designed to be put in your ass.");
	pc.buttChange(10);

	output("\n\n<i>“Whuh-what is that?”</i> you ask, wiggling your hips in nervous excitement. Not knowing, and just feeling, makes the experience that much more exhilarating. Your ass is literally being dominated right now by the nurse droid!");

	output("\n\n<i>“A remote controlled butt-plug! It feels a little thin, but that’ll change – give it a second,”</i> Vi explains. Seconds later, you feel the object thickening and expanding in your ass. It feels like you’re being <i>knotted</i>! As the butt-toy swells and rounds, it pushes pointedly against your ");
	if(pc.hasCock()) output("prostate");
	else if(pc.hasVagina()) output("sweet spot");
	else output("rectal walls");
	output(", and you let out a ");
	if(pc.hasVagina()) output("lusty");
	else output("sweet");
	output(" cry. It’s certainly not the first, as it suddenly begins vibrating and whirring inside of your utterly stuffed rump, quickly reducing you to a babbling, pleasure-wracked mess. Within no time at all, ");
	if(pc.hasCock()) output("you’re shooting your [pc.cumVisc] spunk all over the sheets and messing up your belly, your [pc.thighs] shaking spastically");
	else if(pc.hasVagina()) 
	{
		output("you’re creaming yourself and ");
		if(pc.isSquirter()) output("squirting");
		else output("dribbling");
		output(" your [pc.girlCumVisc] girl-cum all over the sheets, your thighs shaking spastically");
	}
	else 
	{
		output("you’re cumming hard as your ");
		if(pc.legCount > 1) output("[pc.thighs] shake spastically");
		else output("[pc.leg] shakes spastically");
	}
	output(". You desperately cling to the pillow as you’re swept away by glorious, maddening pleasure swell, your pucker madly wringing the toy’s base as if it’s trying to milk it for cum!");
	pc.buttChange(700);
	output("\n\nYou’re so spaced out afterwards that you can barely speak, lying there complacently as she pulls the deflating toy out from between your buttocks. After you finally regain the ability to walk, you thank Vi and slip your things back on. Ass-play is the best!");
	// Scene end, back to menu
	processTime(41);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Potency Test
// PC must have a cock.
public function viPotencyTest():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	
	output("<i>“How about I give you a potency test?”</i> Vi ");
	if(flags["VI_SEXED"] != undefined && flags["VI_SEXED"] >= 10) output("breathily");
	else output("brightly");
	output(" offers.");
	if(flags["VI_POTENCY_TEST"] != undefined) output("\n\nLast time it was amazing, so you immediately agree");
	else output("\n\nYou’re not sure what it involves, but your curiosity is piqued, so you agree to get one");
	output(". The nurse droid leads you over to a bed and, after pulling the privacy curtain closed, kneels down ");
	//taur + backgenitals:
	if(pc.isTaur()) output("and underneath your many-legged body");
	else output("before you");
	output(". ");
	if(!pc.isCrotchExposed()) 
	{
		output("After pulling [pc.eachCock] free of its confines, she grabs ");
		if(pc.cockTotal() == 1) output("it");
		else output("one of them");
		output(" and begins to jerk it to full stiffness.");
	}
	//ElseNotLowerGarbed:
	else output("She then grabs [pc.oneCock] and begins to jerk it to full stiffness.");
	//FirstTime:
	if(flags["VI_POTENCY_TEST"] == undefined) output(" So far, you’re loving this test!");
	else output("You groan and let your head loll back – this really is the best test!");

	output("\n\n<i>“You seem to be ready. Let’s begin!”</i> she exclaims, taking her hand off your now turgid member");
	//PC has multi-cocks:
	if(pc.cockTotal() > 1) output(" – now one of many – ");
	else output(" ");
	output("and pulls out a box of condoms from underneath the bed. She pulls out one and removes the rubbery ring from a packet, placing it flush on your [pc.cockHeadBiggest]. <i>“...Here’s the bit I like the most!”</i> The violet-haired nurse exclaims. Placing her plush lips on the tip of your prick, she masterfully slides the prophylactic down your prick, sliding her soft lips down and around it at the same time. By the time she reaches your [pc.knotBiggest], your twitching tip is completely buried in her ");
	if(pc.biggestCockLength() < 7) output("mouth");
	//mid:
	else if(pc.biggestCockLength() < 10) output("gullet");
	else if(pc.biggestCockLength() < 15) output("throat");
	else output("belly");
	output(". With no gag reflex or reason to breathe, the nurse-droid lovingly lashes your length with her tongue, even going so far as to slide it out and lightly touch your ");
	if(pc.balls > 0) output("[pc.balls].");
	else output("taint.");

	output("\n\nDue to her oral skill, it doesn’t take you long at all to blow your load ");
	if(pc.biggestCockLength() < 7) output("all over her tongue");
	else if(pc.biggestCockLength() < 13) output("against her throat");
	else output("in her stomach");
	output(" – or you would be, if it wasn’t for the condom! You groan and spill your hot [pc.cumNoun] inside the rubbery confines, your efforts to spill your seed inside the synthetic nurse utterly thwarted. When she pulls your prick out of her mouth with a loud <i>plop</i>, you’re left with the image of her wet lips and a ");
	var cum:Number = pc.cumQ();
	var totalBigBalloons:int = 0;
	var totalCum:Number = cum;
	if(cum < 10) output("tiny");
	else if(cum < 200) output("golf-ball sized");
	else if(cum < 700) output("baseball-sized");
	else if(cum < 2500) output("basketball-sized");
	else output("beachball-sized");
	output(" [pc.cumColor] balloon hanging off your cock-tip.");
	if(cum >= 700) 
	{
		output(" Not only are you surprised she pulled that out of her, it’s amazing it didn’t burst!");
		totalBigBalloons++;
	}

	output("\n\n<i>“That’s the first one. A test isn’t a test until it’s conclusive!”</i> Vi merrily exclaims, slipping the now-used condom off your prick and tying it off. She places ");
	if(cum >= 700) output("it beside her, the overfilled balloon barely balancing there as she slips the next one on");
	else output("it upon her rack, giving you a saucy sight to look at as she slips the next one on");
	output(". This time she jerks off your prick instead, mercilessly jerking and wringing your [pc.sheathBiggest] until you cum, taking no prisoners! Your second load is less than the first, and she methodically whips the rubber off, ");
	pc.orgasm();
	cum = pc.cumQ();
	totalCum += cum;
	if(cum >= 700) 
	{
		output("tosses it beside her with the first,");
		totalBigBalloons++;
	}
	else output("tosses it on her breasts with the first,");
	output(" and tries again. Each and every time she does something different, from massaging out a load with her pussy, ass, or fingers, to fingering <i>your</i> ass to get you to blow one off! By the end, ");
	pc.orgasm();
	if(pc.cumQ() >= 700) 
	{
		totalBigBalloons++;
		totalCum += pc.cumQ();
	}
	pc.orgasm();
	cum = pc.cumQ();
	if(cum >= 700) 
	{
		totalBigBalloons++;
		totalCum += cum;
	}
	pc.orgasm();
	if(pc.cumQ() >= 700) 
	{
		totalBigBalloons++;
		totalCum += pc.cumQ();
	}
	pc.orgasm();
	if(pc.cumQ() >= 700) 
	{
		totalBigBalloons++;
		totalCum += pc.cumQ();
	}
	pc.orgasm();
	if(pc.cumQ() >= 700) 
	{
		totalBigBalloons++;
		totalCum += pc.cumQ();
	}

	//hugeCumsOrMore: 
	if(totalBigBalloons >= 3) output("the space around her is filled with gigantic");
	else output("her cleavage is utterly lined with");
	output(" [pc.cumColor] [pc.cumNoun]-filled baggies, all adoringly milked out from your [pc.cocksNounSimple]");
	if(totalBigBalloons > 0) 
	{
		output(" - to say nothing of the " + num2Text(totalBigBalloons) + " spunk-bag");
		if(totalBigBalloons > 1) output("s");
		output(" on the floor alongside her");
	}
	output(".");
	output("\n\n<i>“Whew! That should do it. Now to process the results,”</i> Vi happily exclaims, picking up the [pc.cumNoun] lined condoms and examining them closely.");
	output("\n\n<i>“");
	if(totalCum < 100) 
	{
		output("Hmmm, this is worrying. I thought I’d get a LOT more out from such a fine ");
		if(pc.cockTotal() == 1) output("cock,");
		else output("set of cocks,");
	}
	//Medium Potency:
	else if(totalCum < 400) output("Well, looking at these, I’d say you’re about average potency. And I’d say this was a pretty comprehensive test!");
	else if(totalCum < 3000) output("Well, looking at these, I’d say you’re definitely above average! I’m glad we used the big box of condoms, or else I might have run out,");
	else output("How did you even produce this much? You’re like some kind of [pc.cumNoun]-making machine! I mean, I was down to the emergency condoms; what are we going to do if there’s a red venom outbreak?");
	output("”</i> the nurse-droid informs you, all the while stroking ");
	if(pc.cockTotal() > 1) output("one of ");
	output("your utterly spent length");
	if(pc.cockTotal() > 1) output("s");
	output(". <i>“");
	if(totalCum < 400) output("If you want, ");
	else output("Not that you need it, but ");
	output("I can administer a treatment to increase your potency? It only costs 500 credits, and it’d make any chance of conception that much more assured. After all, you can’t have too much of a good thing! Or, well, at least you can’t when it comes to cum – ");
	if(pc.race() != "kui-tan") output("just ask the kui-tan!");
	else output("I mean, you’re a kui-tan!");
	output("”</i>");
	IncrementFlag("VI_POTENCY_TEST");
	StatTracking.track("joyco/cum milked", totalCum);

	processTime(63);
	pc.orgasm();
	//[Yes] [No]
	clearMenu();
	if(pc.credits >= 500) addButton(0,"Yes",yeahSureIWannaCumMoreSlut);
	else addDisabledButton(0,"Yes","Yes","You can’t afford that treatment.");
	addButton(1,"No",noIDontWantNutTreatments);
}

//Yes:
public function yeahSureIWannaCumMoreSlut():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	IncrementFlag("VI_TREATED");
	output("<i>“Alright then! Just let me produce some,”</i> Vi exclaims, rubbing her hands together. Her breasts suddenly begin to jiggle a bit, and then there’s the sound of squirting from between her palms. Some kind of purple, transparent goo dribbles from between her digits. Did she just make that? She smears it on your [pc.cocks]");
	if(pc.balls > 0) output(" and [pc.balls]");
	output(", rubbing it in until it’s soaked into your pores.");

	output("\n\nAfter a few minutes, you feel a tingling inside of your ");
	if(pc.balls > 0) output("[pc.sack]");
	else 
	{
		output("length");
		if(pc.cockTotal() > 1) output("s");
	}
	output(" and traveling into your prostate. A broiling builds up within, steadily growing, until you’re moaning and throwing back your head. Just when the pleasurable pressure is becoming unbearable, you feel a divine release, and a gigantic stream of [pc.cumNoun] shoots out from your now <i>un</i>spent [pc.cocks]. <b>Your potency has considerably increased!</b>");
	// Increase the PC’s potency by a fair bit. Remove 500 credits.
	// Increase PC's ballEfficiency and cumMultiplier
	// efficiency goal is roughly 8x multiplier - this TF aims for large amounts of repeatable ejacs.

	var cumRatio:Number = pc.ballEfficiency / pc.cumMultiplierRaw;
	trace("ORIGINAL GOO SHIT!");
	trace("RATIO: " + cumRatio + " Efficiency: " + pc.ballEfficiency + " cumMultiplierRaw: " + pc.cumMultiplierRaw);
	var changeTier:Number = 0;
	if(pc.ballEfficiency + pc.cumMultiplierRaw < 25) changeTier = 6;
	else if(pc.ballEfficiency + pc.cumMultiplierRaw < 50) changeTier = 5;
	else if(pc.ballEfficiency + pc.cumMultiplierRaw < 100) changeTier = 4;
	else if(pc.ballEfficiency + pc.cumMultiplierRaw < 200) changeTier = 2.5;
	else if(pc.ballEfficiency + pc.cumMultiplierRaw < 400) changeTier = 1;
	else changeTier = 0.5;

	pc.cumMultiplierRaw += changeTier;
	//Cumratio is shit
	if(cumRatio < 2.5) 
	{
		pc.ballEfficiency += 12 * changeTier;
	}
	//Normalish
	else if(cumRatio < 4) 
	{
		//pc.ballEfficiency = (8 * pc.cumMultiplierRaw) - pc.ballEfficiency;
		pc.ballEfficiency += 11 * changeTier;
	}
	//Close to this TF's goal:
	else if(cumRatio < 7) 
	{
		//pc.ballEfficiency = (8 * pc.cumMultiplierRaw) - pc.ballEfficiency;
		pc.ballEfficiency += 10 * changeTier;
	}
	//Perfect goal!
	else if(cumRatio < 9)
	{
		//Keep it "perfect"
		//pc.ballEfficiency = (8 * pc.cumMultiplierRaw) - pc.ballEfficiency;
		pc.ballEfficiency += 8 * changeTier;
	}
	//Too high
	else if(cumRatio < 12)
	{
		//pc.ballEfficiency = (8 * pc.cumMultiplierRaw) - pc.ballEfficiency;
		pc.ballEfficiency += 6 * changeTier;
	}
	//Way Too high
	else if(cumRatio < 20)
	{
		//pc.ballEfficiency = (11 * pc.cumMultiplierRaw) - pc.ballEfficiency;
		pc.ballEfficiency += 3 * changeTier;
	}
	//Obscenely high
	else if(cumRatio < 50)
	{
		//pc.ballEfficiency = (15 * pc.cumMultiplierRaw) - pc.ballEfficiency;
		pc.ballEfficiency += 1 * changeTier;
	}
	//Ridic high.
	else
	{
		//pc.ballEfficiency = (45 * pc.cumMultiplierRaw) - pc.ballEfficiency;
	}
	trace("POST TF GOOSHIT!");
	trace("RATIO: " + cumRatio + " Efficiency: " + pc.ballEfficiency + " cumMultiplierRaw: " + pc.cumMultiplierRaw);
	pc.credits -= 500;

	output("\n\nIt seems Vi is the recipient of your sudden production spike, your [pc.cumVisc] [pc.cumNoun] splattering all over her pale cheeks and lips. Beneath the [pc.cumColor] mask, she looks like she’s blushing, like she <i>enjoys</i> being covered with your spunk. <i>“A successful treatment. Congratulations on your increased potency levels!”</i> the nurse-droid happily exclaims. Perhaps she suggested the treatment just so she could be covered in your [pc.cumNoun]?");
	output("\n\nNow that you’re well and truly finished, you both slip out from behind the curtain, with Vi quickly wiping off her face with a cloth. Five hundred credits well spent!");
	
	processTime(8);
	pc.orgasm();

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//No:
public function noIDontWantNutTreatments():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	output("<i>“Okay then! Well, the offer’s on the table whenever you want it. Or, well, on the bed, really,”</i> Vi states. You both slip out from behind the privacy curtain, though your legs are a little wobbly after the test. After all, that kind of test literally took a lot (of [pc.cumNoun]) out of you!");
	// Scene end, back to menu
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Give Head
// No taurs
// No back genitals
// No Neuters
public function giveHeadToVi():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	output("You ask the violet-haired nurse if she’ll give you head. With blushing cheeks, she eagerly nods. <i>“Of course, " + pc.mf("sir","ma’am") + "! Let me just activate my remote connectors...”</i>");
	output("\n\nRemote connectors? You wonder what she means, until she grabs her pale cheeks and, with a little twist, pulls off her head! You’re left gaping as she holds it under one of her arms, now completely headless, like some kind of mythological dullahan! With outstretched hands, she offers you her detached cranium, her feminine face still lively and looking up at you!");
	output("\n\n<i>“Here you go! This is what you wanted, right?”</i> The disembodied head asks, her side-tail dangling freely about. The top of her neck is smooth and flat, like Vi’s head was cut clean off. Even though it’s not what you meant, you take her head in your hands, feeling her cheek-muscles moving against your palms. It’s warm...");
	output("\n\n...Hmm, maybe you can still make this work.");
	output("\n\n<i>“Come with me,”</i> you instruct her, pulling back one of the privacy curtains surrounding a cubicle. Her headless body strolls inside first; it’s pretty impressive that it can still navigate around.");
	if(!pc.isCrotchExposed()) output(" After stripping off, you");
	//Else:
	else output(" You");
	output(" climb into the bed and place her head ");
	//legs: 
	if(pc.legCount > 1) output("between your thighs");
	else output("at your hip-height");
	output(". Looking down, you can see the cute, disembodied head staring with blushing admiration at your ");
	if(pc.hasCock()) output("[pc.cocks]");
	else output("[pc.pussies]");
	output(". <i>“It looks so much bigger from down here!”</i> Her body climbs onto the bed with you, spreading her own well rounded, stocking-clad thighs. You’ve got quite the sight of her snowy snatch from here.");
	//HadSex>10times:
	if(flags[""] != undefined && flags[""] >= 10) output(" She’s already glistening wet and there’s a damp patch on the sheets!");

	output("\n\nTelling Vi that she’s going to be getting a <i>lot</i> closer, you lie back, relaxing into the pillow behind you, and bring her dullahan-like head closer to your loins. You can feel a long, wet lick along ");
	if(pc.hasCock()) output("[pc.oneCock]");
	else output("[pc.onePussy]");
	output(". You tremble with delight, moving her head where you want her attentions to be, bringing it up slowly to your ");
	if(pc.hasCock()) output("[pc.oneCockHead]");
	else output("[pc.oneClit]");
	output(". She wraps her lips around it and suckles hard, flicking your sensitive ");
	if(pc.hasCock()) output("crown");
	else output("nub");
	output(" with her tongue, coaxing ");
	if(pc.hasCock()) output("a dribble of pre-cum from your cock hole and out onto her tastebuds");
	else 
	{
		output("even more wetness to form along your girlish slit");
		if(pc.totalVaginas() > 1) output("s");
	}
	output(".");

	output("\n\nAs you relish the nurse-droids oral efforts, her headless body shifts to lewdly masturbate in front of you, parting her pale slit and rolling a finger against her clit. With trembling thighs, she strokes herself off not five feet from you, while her detached head goes down on you! The strangeness of the situation just makes everything that much more erotic, and you find yourself quickly bucking your hips up and pressing your ");
	if(pc.hasCock()) output("prick");
	else output("pussy");
	output(" up against her face.");
	var x:int = pc.biggestCockIndex();
	//cock is longer than 8 inches: 
	if(pc.hasCock())
	{
		if(pc.cocks[x].cLength() >= 8) output(" Burying your length up to the hilt, you feel air brushing against your cock-end... and you look down to see it poking down and out the other end of her synthetic neck!");
	}
	output(" Vi moans into your loins at being face-fucked so <i>completely</i>, her slick juices dribbling out of her far-removed snatch. Suddenly, she lets out a muffled cry, and a thin clear stream jumps from between her glistening lips, arching and wetting the bed. Watching her ejaculate pushes you over the brink, and with a loud groan, you ");
	if(pc.hasCock()) output("shoot your [pc.cumNoun] down her disembodied neck, also messing up the bedsheets with your [pc.cumVisc] fluids!");
	else if(pc.isSquirter()) output("squirt all over her face in turn, utterly coating it with your [pc.girlcum]");
	//Else:
	else output("cum all over her tongue and mouth, flooding them with your [pc.girlCum].");

	output("\n\nOnce you’re both done basking in post orgasmic bliss, you climb off the <i>very</i> messy bed and Vi reattaches her head. She’s still got your ");
	if(pc.hasCock()) output("[pc.cumColor] spunk");
	else output("[pc.girlCumColor] juices");
	output(" all over her plush lips. She reaches up to touch them dreamily, pressing a fingertip into your soft goo and smearing it on a little like some sort of lip gloss. <i>“Thank you for your deposit, " + pc.mf("sir","ma’am") + ". Are you fully satisfied with your treatment?”</i>");

	output("\n\nYou nod without hesitation, and the nurse-droid beams. As you leave, you see her pulling off the messy sheets and quickly replacing them.");

	// Unlock talk topic ‘Pleasure’ if not unlocked already.
	// Scene end, back to menu
	processTime(23);
	pc.orgasm();
	IncrementFlag("VI_SEXED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Tail Screw
// No prerequisites.
// Vi screws you with a tail-attached dildo
public function tailScrewWithVi():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	output("You look at Vi’s tail and a naughty thought springs to mind, making your heart race. Can she, perhaps, use that to stimulate your ass... just like a cock?");
	output("\n\nWhen you ask her as much, Vi enthusiastically nods. <i>“Of course! But if you’re looking for anal stimulation, might I suggest a phallic attachment?”</i> She brings her tail around in front of her body and clasps it with both hands, tapping the tip with a finger. <i>“I’ve got one I can fasten right here; it’s much stiffer and vibrates. My tail’s kind of thin, so it doesn’t give </i>quite<i> the same feeling of a big, hard cock sliding in and out of you...”</i>");
	output("\n\n<i>“Oh, you’ve tried it on yourself?”</i> you ask, quirking a brow. The nurse droid flushes, clutching her tail even harder.");
	if(flags["VI_SEXED"] != undefined && flags["VI_SEXED"] >= 10) output(" Her trembling thighs are quickly becoming slick with her clear juices.");

	output("\n\n<i>“Um, system test requirements, " + pc.mf("sir","ma’am") + "! Every JoyCo model needs to make sure they’re functional at all times,”</i> she explains. You grin and slip behind one of the privacy curtains, stripping off ");
	if(pc.isNude()) output("your codex");
	output("while Vi grabs the attachment. While you wait for her, you ");
	if(pc.legCount == 2) output("climb up on the bed and lie on your back");
	else
	{
		output("get on your [pc.knees] on the floor");
		if(pc.isTaur()) output(", since the bed’s too tall for a taur like you");
	}
	output(".");

	output("\n\nWhen she returns, she’s got a long and veiny synthetic dong attached to the end of her prehensile tail. It’s the same alabaster white as the rest of her, making it appear seamless and attached, like a static part of her body. Clear fluid is already liberally drooling from her cock hole, and it takes you a moment to realize it’s lubricant! Vi jerks her snowy dick a few times, causing it to bubble and drool out and down her shaft, coating it in the slick, slimy fluid. <i>“Mmm... it’s important we make sure you’re well lubricated. Otherwise I’m not going to slide in you properly!”</i>");

	//If pc has 2 Legs:
	if(pc.legCount == 2 && pc.hasKnees())
	{
		output("\n\n<i>“Please raise your legs and knees,”</i> Vi requests, holding her impressively sized cock in hand. You flush and do as she asks, your heartbeat racing madly in your chest. Having your ass exposed like this and her holding <i>that</i>... it makes you tingle with anticipation for when she presses it between your now vulnerable buttocks.");
	}
	output("\n\nWith bated breath, you ");
	if(pc.legCount == 2) output("watch as she lowers her pale phallus between your parted thighs.");
	else output("lift your rump high and ready, waiting for her to put that pale phallus to work.");
	output(" The second you feel her slickened cock head pressing between your cleft and parting your [pc.skinColor] cheeks, your higher thought just stops right there, replaced instead with instinctual delight. There are no <i>words</i> for how exquisite it feels as she rubs her crown around your sensitive, twitching ring, teasing your all-too-sensitive opening with her tip. Without even thinking, you arch your back in response, ");
	if(pc.tailCount > 0) output("lifting your [pc.tails] like you’re in heat!");
	else output("your eyes already rolling back into your head!");

	output("\n\n<i>“Your ass is so sensitive, " + pc.mf("sir","ma’am") + " – does it love my cock?”</i> Vi breathily asks");

	//ReadTalkTopicPleasure:
	if(flags["VI_PLEASURE_TALKED"] != undefined) output(" – her cock must be attached to her feedback sensors!");
	else output(".");
	output(" You spacily nod, not able, or rather unwilling, to form words to speak. You don’t want to do <i>anything</i> that might break this hypnotic pleasure-bringing spell. Moments later, her rigid head pushes against and begins parting your pucker, stretching and slipping inside your ");
	if(pc.analVirgin) output("until-now virgin hole. You gasp at the strange new sensation, unsure <i>how</i> to deal with it. At first you instinctively clench, halting her entry, then try to consciously relax. As soon as you do, you feel her slip deeper inside, brushing past an oh-so-sensitive place.");
	//Tight: 
	else if(pc.ass.looseness() < 3) output("narrow hole. Your ass is still barely trained, unused to taking sudden insertions. You instinctively clench, halting her entry, then try to consciously relax. As soon as you do, you feel her slip deeper inside, brushing past an oh-so-sensitive place.");
	else output("well-trained hole. Flushing with memories of the pleasure that awaits you, you don’t clench a bit, letting her thick prick slide up and into you like the butt-slut you are. As soon as she brushes past that oh-so-sensitive place.");
	output(" Your senses are overwhelmed with transcendent pleasure, just from feeling her stroke that tiny place in your inner ass! You gasp and ");
	if(pc.legCount == 2 && pc.hasKnees()) output("your [pc.feet] hover slightly off the bed");
	else output("you needily raise your rump");
	output(". It feels so good you fear you’ll lose your mind!");
	pc.buttChange(250);

	output("\n\n<i>“R-right therree...”</i> you moan, and she drags her stiff dick back to it, pressing it pointedly against ");
	if(pc.hasCock()) output("your lumpy prostate");
	else output("that same spot");
	output(". You’re overwhelmed by pure rapture as she caresses your cock-filled canal. Tiny, spasmic twitches begin to jolt involuntarily through your body, building in frequency with each and every stroke. Unconsciously, your hands ");
	if(pc.legCount == 2 && pc.hasKnees()) output("reach above your head and dig into the sheets, gripping on to them to hold you steady in the storm, knowing that you’ll be swallowed at any moment.");
	else output("claw at the floor beneath you, trying to cling to something, anything!");
	output(" Your thighs begin to rapidly quake, and your heart is racing wildly in your chest.");

	output("\n\nOne final stroke of your inner ass, and the sublime ecstasy overcomes you, sending you careening completely over that blissful edge. You let out a " + pc.mf("surprisingly ","") + "shrill cry and clench down on her veiny cock, cumming so hard you momentarily forget the world exists outside this one utterly <i>sublime</i> moment.");
	if(pc.hasCock()) output(" Your partially erect [pc.cocksNounSimple] don’t spurt but instead drool [pc.cumNoun] out and all over the floor, cumming in a very unmasculine fashion.");
	//PcHasPussy:
	if(pc.hasVagina()) 
	{
		output(" Slick, soppy [pc.girlCum] ");
		if(pc.isSquirter()) output("squirts out");
		else output("dribbles down");
		output(" your [pc.thighs], leaving your unfucked [pc.vaginas] glistening wet.");
	}
	output(" Shuddering and shaking ");
	if(pc.legCount == 2 && pc.hasKnees()) output("on the bedsheets");
	else output("on the ground");
	output(", you’ve lost total control of your body. You’re so out of it that you don’t even notice when she pulls her veiny cock out from you with a loud plop, shivering and moaning herself as she shoots synthetic cum all over your ");
	if(pc.legCount == 2 && pc.hasKnees()) 
	{
		if(pc.biggestTitSize() >= 1) output("tits");
		else output("chest");
		output(" and belly");
	}
	else output("butt and back");
	output(".");

	output("\n\nWhen you finally recover from the incredibly intense orgasm, you feel so <i>heavy</i>, so much so that it’s hard to move. At the same time, every inch of you is thrumming and filled with a warm, satisfied feeling – so much so there’s really no reason to move. Even so, you can feel the delicious sensation of Vi’s slick, warm fluid warming your [pc.skinFurScalesNoun], shot from her cock that was buried moments before inside of your ass.");

	output("\n\n<i>“D-did you enjoy yourself, " + pc.mf("sir","ma’am") + "?”</i> Vi breathily asks, looking quite pleasure-dazed herself.");
	//HaveNotReadTalkTopicPleasure:
	if(flags["VI_PLEASURE_TALKED"] == undefined) output(" That can’t be possible, right?");
	output(" With bright pink cheeks, she pulls off her pale prick, holding it almost affectionately in her hands. There’s still synthetic lube-like cum drooling down her shaft; a sight that threatens to stoke your fires once more.");

	output("\n\nWith great effort, you nod, pulling yourself up ");
	if(pc.legCount == 2 && pc.hasKnees()) output("and off the bed.");
	else output("and onto to your [pc.footOrFeet].");
	//GotClothes:
	if(!pc.isNude()) output(" You then grab your [pc.gear] and re-dress yourself, though it takes some time.");
	output(" There’s a lot of lube leaking from your recently pummeled butthole, drooling out like the remnants of slick cum shot up into you. With how slickened up she was, you’ll probably be leaking it all day!");

	// Unlock ‘Pleasure’ talk topic, if not already unlocked.
	// Scene end, return to menu.
	IncrementFlag("VI_SEXED");
	processTime(23);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Cowgirl
// PC must have cock
// PC must not be taur
public function cowgirlWithVi():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	output("You grab Vi’s hand and lead her behind one of the privacy curtains. ");
	//PC.clothed: 
	if(pc.isCrotchExposed()) output("After you hastily strip off your things,");
	else output("Once there,");
	output(" you climb into one of the beds and lie back. Instinctively, the blushing nurse droid climbs on and slowly straddles you. Her tiny hands rest sweetly upon your chest, knees to either side of your waist, her warm sex pressed against your swelling loins. <i>“U-um, this is how you want me, right " + pc.mf("sir","ma’am") + "?”</i> she asks, brushing back a dangling bang.");

	var x:int = pc.cockThatFits(chars["VI"].vaginalCapacity(0));

	output("\n\nYou nod and grab her stocking-wrapped thighs. Giving a slight grind, you caress your length against her ");
	//Had sex ten or more times:
	if(flags["VI_SEXED"] != undefined && flags["VI_SEXED"] >= 0) output("already glistening");
	else output("synthetic");
	output(" slit. She bites her lower lips and her eyes flutter back, her whole body rocking in pagan rhythm with yours. Once you’ve had your fill of teasing her, you fill her instead, pulling back and sliding [pc.oneCock] into her quivering quim. Her subtle warmth neatly wraps around you, swallowing you up to the [pc.knot " + x + "]. Once more, you start rocking needily against each other, her slick insides wringing and squeezing your length as you rock underneath her. Noticing her pale clitty poking cutely out from her hood, you reach down and roll your thumb around it. The reaction is immediate, as the nurse droid lets out a girlish cry. She clamps around you and shivers <i>hard</i>, her whole body going into a pleasure fit!");
	pc.cockChange();

	output("\n\n<i>“I-I can’t–thuh-t-this input–!”</i> Vi cries, her fingers curling up, desperately trying to grab at your chest. You feel a warmth spreading down on your flexing crown as she cums on your cock, the turgid, moist sensation spreading downwards until it reaches your base");
	if(pc.balls > 1) output(" and balls");
	output(". After her spasms subside, she falls cutely on your chest, her flushed cheek pressed against ");
	if(pc.tallness < 80) output("yours");
	else output("it");
	output(". <i>“I’m sorry, " + pc.mf("sir","ma’am") + ", I-I appear to have experienced a system malfunction before I was done servicing you. C-can you forgive me?”</i>");

	output("\n\nHearing her words makes your slickened dick twitch in response. You seize her soft, grabbable ass and continue grinding against her with renewed vigor. Her cute whimpers fill the air as she squirms against your chest, her warm juices liberally dripping down your shaft. Her hips are soon rocking back with fevered urgency against your thrusts, her slick insides masterfully coaxing and wringing your [pc.cockHead " + x + "] for <i>more</i>. It pushes you well and truly over the edge, and with a throaty groan, you shoot your hot [pc.cumNoun] up and inside of the nurse droid, filling her with synthetic womb with your organic seed. You then both fall down in a heap, sweaty bodies pressed against each other, relishing in the afterglow and each other’s thermal warmth.");

	output("\n\n<i>“...T-thank you for your genetic input, " + pc.mf("sir","ma’am") + ",”</i> Vi whispers, sliding up to bite and nibble lightly at your [pc.ear]. You can feel your [pc.cumVisc] [pc.cumNoun] drooling out of her and rolling delightfully down ");
	if(pc.balls > 1) output("your balls");
	else output("between your buttocks");
	output(", linking the two of you with a string of [pc.cumColor] warmth.");

	// Unlock talk topic ‘Pleasure’ if not unlocked already.
	// Scene end, back to menu
	IncrementFlag("VI_SEXED");
	StatTracking.track("joyco/cum milked", pc.cumQ());
	processTime(13);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Use Pussy
public function useVisPussy():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	//First Time:
	if(flags["VI_OFFERED_PUSSY"] == undefined)
	{
		output("You look at Vi’s pale ");
		if(flags["VI_SEXED"] != undefined && flags["VI_SEXED"] >= 10) output("and glistening ");
		output("pussy, fantasizing about ");
		//pc.hasCock:
		if(pc.hasCock()) output("it wrapping around and enveloping [pc.oneCock]");
		else output("fingering it");
		output(". The thought gets you all worked up, so you ask her if you could ");
		if(pc.hasCock()) output("screw");
		else output("play with");
		output(" it?");
		output("\n\n");
	
		output("<i>“Oh, of course! Just give me a second...”</i> Vi ");
		if(flags["VI_SEXED"] == undefined && flags["VI_SEXED"] >= 10) output("breathily");
		else output("elatedly");
		output(" answers, reaching down to press her belly-button. Suddenly her whole snatch pushes itself out of her body like an ejected tape, falling unceremoniously to the floor! At the last moment, she catches it with her tail and deposits it in her hands, a cheery smile on her face. The empty space between her thighs closes over much like a starship hangar door closing shut, leaving no trace that she ever even <i>had</i> genitals there. <i>“Here you go, my pussy! You said you wanted to ");
		if(pc.hasCock()) output("screw");
		else output("play with");
		output(" it?”</i>");

		output("\n\n<i>“I, uh, didn’t mean literally,”</i> you respond, staring at the ejected snatch held in her slender hands. Come to think of it, when she’s got it like this, it looks a lot like a pocket pussy. <i>“Hey, it’s still twitching?”</i>");

		output("\n\nVi blushes a little. <i>“Um, I’m still connected to it, it’s just wireless now. See?”</i> She brings two fingers up and parts her labial lips; you can see her insides clenching and relaxing via remote control. <i>“I also get physical feedback, so... if you ");
		if(pc.hasCock()) output("fucked");
		else output("touched");
		output(" it like this, I’d still be able to feel it.”</i>");

		if(pc.hasCock()) output("\n\nFucking");
		else output("Teasing");
		output(" a pocket pussy someone else is controlling, and they can feel it too? That sounds pretty hot.");
	}
	//Repeat:
	else
	{
		output("You look at Vi’s pale");
		if(flags["VI_SEXED"] != undefined && flags["VI_SEXED"] >= 10) output("and glistening ");
		output(" pussy. Right now you’d really like to ");
		if(pc.hasCock()) output("screw");
		else output("tease");
		output(" it, but not necessarily while it’s inside her. You ask the violet-haired nurse if you could have it?");

		output("\n\n<i>“Oh, of course! Just give me a second...”</i> Vi ");
		//hadSex>10Times:
		if(flags["VI_SEXED"] != undefined && flags["VI_SEXED"] >= 10) output("breathily");
		else output("elatedly");
		output(" answers, reaching down to press her belly-button. Suddenly her whole snatch pushes itself out of her body like an ejected tape, falling unceremoniously to the floor. At the last moment, she catches it with her tail and deposits it in her hands, a cheery smile on her face. The empty space between her thighs closes over much like a starship hangar door closing shut, leaving no trace that she ever even had genitals there. <i>“Here you go, my pussy!”</i>");
		output("\n\nYou literally take it off her hands and, with two fingers, part her snowy slit. You can see her ");
		if(flags["VI_SEXED"] != undefined && flags["VI_SEXED"] >= 10) output("already slick ");
		output("insides clenching and relaxing via remote control. <i>“I’m still connected to it wirelessly, just like last time.”</i> She blushes, adding, <i>“And the physical feedback input is still engaged, so I can feel anything you do to my pussy.”</i>");
		
		//Stolen it before:
		if(flags["VI_PUSSY_TAKEN"] != undefined) output("\n\n<i>“Just promise me that you’re not going to run off with it again, okay? I’m trusting you!”</i>");
	}
	IncrementFlag("VI_OFFERED_PUSSY");
	//[Use It] [Get Her] [Take It]
	processTime(5);
	pc.lust(5);

	clearMenu();
	// tooltip.useIt: Order Vi to go back to her duties, while you stay with her pussy. PC must not be a taur.
	// tooltip.getHer: Get Vi to use her pocket pussy on you herself. Must have a cock.
	// tooltip.takeIt: Take Vi’s pussy from her and keep it!
	if(!pc.isTaur()) addButton(0,"Use It",useVisDisembodiedPussy,undefined,"Use It","Order Vi to go back to her duties, while you stay with her pussy.");
	else addDisabledButton(0,"Use It","Use It","You can’t really reach to do that with your current body shape.");
	if(pc.hasCock())
	{
		if(pc.cockThatFits(chars["VI"].vaginalCapacity(0)) >= 0) addButton(1,"Get Jacked",viGetHerScene,undefined,"Get Jacked","Get Vi to use her pocket pussy on you herself. Must have a cock.");
		else addDisabledButton(1,"Get Jacked","Get Jacked","You’re too big to fit inside.");
	}
	else addDisabledButton(1,"Get Jacked","Get Jacked","You need to have a penis for this.");
	addButton(2,"Take It",takeVisVagina,undefined,"Take It","Take Vi’s pussy from her and keep it!");
}

//Use It
// No taurs.
// If doesn't fit capacity for dicks, finger it. Maybe indicate?
public function useVisDisembodiedPussy():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	var x:int = -1;
	if(pc.hasCock()) x = pc.cockThatFits(chars["VI"].vaginalCapacity(0));
	output("A rather devilish thought pops into your mind. Perhaps you should stay here with Vi’s pussy and use it, while she goes back to her duties – or at least tries to?");
	output("\n\n<i>“Vi, stay right there. I’m going to stay here with </i>this<i> for a while. Don’t tell anyone what I’m about to do,”</i> you instruct. The nurse droid blushes and nods, not questioning your instructions. She does, however, watch you with keen eyes. With the privacy curtain open, she has a clear view of you slipping into one of the hospital beds");
	if(x >= 0) output(", and tucking your lower half under the covers,");
	output(" along with her stolen snatch.");

	output("\n\n<i>“Um, " + pc.mf("sir","ma’am") + ", may I inquire as to what you plan to do with my womanhood?”</i> Vi asks, long eyelashes fluttering. <i>Womanhood</i>; what a chaste term for a medic, and a VI at that! In a way, it’s kind of cute, particularly the way she’s flicking her eyes ");
	if(x >= 0) output("towards the large pitching in the sheets right above your loins");
	else output("her pussy in your hands");
	output(".");

	//pc.hasCock:
	if(x >= 0)
	{
		output("\n\nInstead of answering her, you bring her remote-wired snatch above your fully erect [pc.cockNounSimple " + x + "]. Slowly, you brush her soft pussy lips against your swelling crown, back and forth, teasing her slickened entry. The second you begin teasing the nurse droid’s snowy snatch, her eyes become half lidded, and her pretty lips part in a breathy moan. Just as keenly as if you were rubbing your cock between her thighs, the nurse-droid can feel what you’re doing to her kidnapped pussy! Her slickness is already running out and coating your tingling glans in her synthetic, yet still feminine juices.");
		output("\n\nAs the hospital staff begin to peer at the blushing nurse, you feel a sordid rush, grinding your [pc.cockHead " + x + "] even more against her silken slit. The more you tease it with your dick, the more her stocking-clad thighs quake; she’s barely able to keep standing! Her knees are pressed together and her wholesome breasts are heaving with excitement. With each roll of your hips, you work her up more, which works <i>you</i> up in turn!");
	}
	//else
	else
	{
		output("\n\nInstead of answering her, you brush your fingertips along her soft pussy lips, back and forth, teasing her slickened entry. The second you begin teasing the nurse droid’s snowy snatch, her eyes become half lidded, and her pretty lips part in a breathy moan. Just as keenly as if you were rubbing your digits between her thighs, the nurse-droid can feel what you’re doing to her kidnapped pussy! Her slickness is already running out and coating your tips with her synthetic, yet still feminine juices.");
		output("\n\nAs the hospital staff begin to peer at the blushing nurse, you feel a sordid rush, rubbing your fingers even more against her silken slit. The more you tease her petals, the more her stocking-clad thighs quake; she’s barely able to keep standing! Her knees are pressed together and her wholesome breasts are heaving with excitement. With each lewd stroke, you work her up more, which works <i>you</i> up in turn!");
	}
	output("\n\nIt’s not long before a myr doctor notices the nurse-droid’s strange behavior and walks up. <i>“Nurse Vi, are you alright...?”</i> she asks.");
	output("\n\n<i>“Y-yes, Doctor! I’m, </i>ahhhh<i>, just processing some patient feedback,”</i> Vi truthfully answers; as a V-Ko unit, she’s not programmed to lie. You decide to tease her further, pointedly ");
	if(x >= 0) output("thrusting your glans against her sensitive bud, mercilessly assaulting it with your dick as she tries to speak");
	else output("teasing her sensitive little bud as she tries to speak");
	output(". She loudly moans in front of the doctor, clinging to her side-braid as if it were a lifeline; the only thing stopping her from utterly melting in pleasure on the spot. <i>“More than perfectly fine. Trust me!”</i>");

	output("\n\nShe’s not joking; her girly juices are wildly drooling down your ");
	if(x >= 0) 
	{
		output("shaft and warming ");
		if(pc.balls > 0) output("your [pc.ballsNoun]");
		else if(pc.hasVagina()) output("your [pc.vaginas]");
		else output("your perenium");
	}
	else output("fingertips");
	output(". The doctor seems unconvinced – you’re not surprised – as she slickly dribbles down your ");
	if(x >= 0) output("dick");
	else output("digits");
	output(". <i>“Are you sure? Your face is flushed... I hear you synthetics can get viruses; have you contracted something?”</i>");
	output("\n\nWith a grin, you take <i>that</i> moment to slip ");
	if(x >= 0) output("your [pc.cockHead " + x + "]");
	else output("a finger");
	output(" inside of her. Vi lets out an even louder moan, her inner walls palpably quivering around ");
	if(x >= 0) output("your tip");
	else output("it");
	output("!");

	output("\n\n<i>“D-don’t worry about me, I-I’m just taking a lot of input right now!”</i> the nurse breathily answers, her pale cheeks flushed scarlet. She thinks <i>that’s</i> input? You slowly slide ");
	if(x >= 0) output("your [pc.cock " + x + "]");
	else output("a second one");
	output(" into her quivering box. The nurse-droid is so wet that it takes only a few seconds to sheathe yourself inside of her, burying yourself in her ‘womanhood’ right to the ");
	if(x >= 0) output("hilt");
	else output("knuckle");
	output(". The nurse-droid gasps and reaches out to grab a bed frame, unable to support her shaking legs.");

	output("\n\n<i>“If I didn’t know you were immune, I’d say you’d been exposed to red myr venom,”</i> the doctor exclaims, now blushing herself. Even not knowing the cause, it’s clear to the room that whatever is happening is sexual. Some of the staff even look a little worked up by her lewd noises. <i>“It really must be a lot of input!”</i>");

	//pc.hasCock:
	if(x >= 0)
	{
		output("\n\n<i>“It r-really is!”</i> Vi breathily exclaims, her round butt now pressing back against the bedframe. Smirking, you buck your hips up against her synthetic snatch, relishing in the feeling of your dick delving and pounding deep inside of her slick depths. With every slapping and squelching thrust, Vi’s moans get louder and lewder, bringing you both closer and closer to the brink. Just as you’re reaching yours, the violet-haired nurse squeals, toppling over first!");
		output("\n\n<i>“I-I can’t hold out any longer!”</i> Vi cries, clinging desperately to the bed frame. Her pussy clenches <i>hard</i> on your [pc.sheath " + x + "] and hot, synthetic girl-juice gushes down your rod. She’s creaming herself on your cock! Set off in turn, you groan and shoot your own [pc.cumNoun] into her quaking cunt, filling it up with your organic seed. As you fill her cunt with burst after sweet burst of your semen, Vi’s eyes roll back and her knees knock together. Even from afar, she’s relishing in receiving your [pc.cumVisc] gift!");
		output("\n\nOnce you’re done, you slip out of the bed and stride over to the quivering nurse, handing back her sperm slickened snatch. Vi blushingly receives it and slips it back between her thighs, a look of utter delight lighting up her face as she places your [pc.cumNoun] where it belongs: between her legs. <i>“T-thank you, " + pc.mf("sir","ma’am") + ", for your deposit. Do you feel sexually relieved?”</i>");
		output("\n\nYou earnestly nod and shoot a glance at the medical staff. Now that they’re clued in, they’re wearing amused expressions. The only one who isn’t is Vi, who still has a dreamy look in her eyes. <i>“Y-you’re leaking down my thighs,”</i> she murmurs. Just as she said, your [pc.cumColor] seed is dribbling out of her pale snatch and down her stocking-clad legs.");
		output("\n\nFeeling a little showy, you slip your hand between her sopping wet thighs and stroke her lower lips. As Vi moans with delight, still sensitive from her orgasm, you scoop up some of your [pc.cumNoun] and place it against her pale lips. She instinctively suckles them off, cleaning your fingers of your [pc.cumVisc] seed. Once she’s done, she stumbles back to work, looking more than a little light-headed from all your fooling around!");
		processTime(18);
		pc.orgasm();
	}
	else // No cock:
	{
		output("\n\n<i>“It r-really is!”</i> Vi breathily exclaims, her round butt now pressing back against the bedframe. Smirking, you finger-fuck her pussy, relishing in the feeling of her slick, velvety insides clenching your digits. With every squelching thrust, Vi’s moans get louder and lewder, getting closer and closer to the brink. Finally violet-haired nurse squeals, toppling over completely!");
		output("\n\n<i>“I-I can’t hold out any longer!”</i> Vi cries, clinging desperately to the bed frame. Her pussy clenches <i>hard</i> around your fingers and hot, synthetic girl-juice gushes down them. She’s creaming herself on your hand! Her eyes roll back and her knees knock together. Even from afar, she’s relishing in your fingers knuckle-deep in her snatch!");
		output("\n\nOnce her shaking subsides, you slip out of bed and stride towards Vi, handing her back her glistening snatch. The violet-haired nurse blushingly receives it and slips it back between her thighs, a look of utter delight lighting up her face as she places it back where it belongs <i>“T-thank you, " + pc.mf("sir","ma’am") + ". D-did you enjoy yourself as much as I did?”</i>");
		output("\n\nYou earnestly nod and shoot a glance at the medical staff. Now that they’re clued in, they’re wearing amused expressions. The only one who isn’t is Vi, who still has a dreamy look in her eyes. <i>“M-my juices are leaking down my thighs,”</i> she murmurs. Just as she said, her slick lady juice is dribbling out of her pale snatch and down her stocking-clad legs.");
		output("\n\nFeeling a little showy, you slip your hand between her sopping wet thighs and stroke her lower lips. As Vi moans with delight, still sensitive from her orgasm, you scoop up some of her fem-cum up and place it against her pale lips. She instinctively suckles them off, cleaning your fingers of her own slick sweetness. Once she’s done, she stumbles back to work, looking more than a little light-headed from all your fooling around!");
		processTime(18);
	}
	// Unlock talk topic ‘Pleasure’ if not unlocked already.
	// Scene end, back to menu
	IncrementFlag("VI_SEXED");
	
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Get Her
//Requires dick that fits.
public function viGetHerScene():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	var x:int = pc.cockThatFits(chars["VI"].vaginalCapacity(0));
	output("You slip behind one of the privacy curtains and then gesture for Vi to follow. She hurries in after you, a curious look in her eyes. They widen considerably when you hand her back her snowy snatch. As she clasps it with both hands, you ");
	//PC is lowerGarbed: 
	if(!pc.isCrotchExposed()) output("whip out [pc.oneCock], flopping it out right before her eyes");
	else output("gesture down to [pc.oneCock]");
	output(". <i>“Milk it. With your pussy.”</i>");

	output("\n\nVi blushes and sinks down to her stocking clad knees");
	if(pc.isTaur()) output(", crawling beneath you");
	output(" until she’s face to face with your [pc.cockNounComplex " + x + "]. Her dark eyes soak in the sight, gazing admiringly at your length from tip to");
	if(pc.hasKnot(x)) output(" knotted");
	output(" base. With visible trepidation, she brings her slick-lipped pussy up to your [pc.cockHead " + x + "], pressing your prick against her swiftly yielding folds. You groan as you sink a bare inch inside, caressing <i>just</i> inside her silky folds, titillated with near torturous pleasure! It’s all you can do to stop yourself simply thrusting forward and claiming her pussy right there. Still, you want <i>her</i> do to it, that’s half the fun!");

	output("\n\nWhen she finally sinks it down upon your shaft and all the way down to your [pc.knot " + x + "], you let out a pleasured groan, feeling her slick insides warming every inch of your rod. Looking down, Vi’s garter-lined hips are wiggling and her face is flushed; it seems you’re not the only one enjoying yourself. With hurried breaths, she uses her hand-held pussy to milk your cock. Her eyelashes flutter and her curvaceous chest sensuously rises and falls, her pale skin flushed with obvious excitement. You can feel her slick juices drooling down your turgid tool, dribbling down slowly to warm ");
	if(pc.balls > 0) output("your [pc.sack]");
	else output("the realm between your buttocks");
	output(".");

	output("\n\nJust as you’re about to reach your peak, the nurse-droid lets out a loud squeal and her synthetic snatch grips around your prick. She’s cumming on your cock! Feeling her gushing juices pool down on your [pc.cockHead " + x + "] sets you off. You groan and shoot a return volley of your [pc.cumNoun] right back and up into her detached cunt, the two warm liquids mixing together and pooling deliciously on top of your flexing prick. Quivering madly, Vi holds on to her tube-like pussy and like she’s about to fall over, the only thing keeping her up being the grip of her sex on your prick! When your erection dies down, her snatch quickly slips off and she falls to the ground, leaving her holding her pale, [pc.cumNoun] drooling pussy in her hands.");

	output("\n\n<i>“T-that was intense feedback,”</i> Vi breathily exclaims, bringing up her onahole-like pussy to show to you. Parting it with her fingers, you can clearly see your handiwork; a delicious cream-pie right inside of her synthetic snatch. It’s enough to make your slickened prick");
	if(pc.cockTotal() > 1) output("s");
	output(" twitch once more, threatening to rise to hardness for a second round! She then blushingly slips her pussy back between her thighs, placing your [pc.cumNoun] where it belongs: between her legs. When you both leave the cubicle, there’s a dreamy look in the nurse-droid’s eyes. You can see your [pc.cumColor] seed dribbling out of her pale snatch down her stocking-clad legs.");

	output("\n\nFeeling a little showy, you slip your hand between her sopping wet thighs and stroke her lower lips. As Vi moans with delight, still sensitive from her orgasm, you scoop up some of your [pc.cumNoun] and place it against her pale lips. She instinctively suckles them off, cleaning your fingers of your [pc.cumVisc] seed. The nurse droid then stumbles back to work, looking extremely spaced out from all your fooling around!");
	processTime(16);
	pc.orgasm();
	// Unlock talk topic ‘Pleasure’ if not unlocked already.
	IncrementFlag("VI_SEXED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Take It
public function takeVisVagina():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	//First Time Stealing:
	if(flags["VI_PUSSY_TAKEN"] == undefined)
	{
		output("A devilish thought pops into your head. Having Vi’s remote controlled pocket pussy could be pretty useful. Still, it’d lose its signal once you left the solar system... <i>unleeesss</i>... what if you were to hook it to your ship’s communications system, using it as a relay? That just might work.");
		output("\n\n<i>“You know what? I might take this off your hands,”</i> you remark, holding on to her pale pussylips. <i>“Journeys in space can be pretty lonesome, and I need the stress relief. You don’t mind, do you?”</i>");
		output("\n\nVi blinks furiously, unable to properly process what’s going on. Instead, she stands there agape, looking back and forth between you and the snatched snatch. <i>“Wuh–this... this isn’t among my list of situational parameters!”</i> she exclaims, looking more than a little lost. <i>“...Running search on nearest approximation... " + pc.mf("Sir","Ma’am") + ", is this theft?!”</i>");
		output("\n\n<i>“No, this is borrowing,”</i> you ");
		if(pc.isNice()) output("reassure her with a grin");
		else if(pc.isMischievous()) output("playfully explain");
		else output("smirk");
		output(". You then reach up and stroke her snowy snatch. The moment you do, the nurse-droid’s eyes half lid and she lets out a breathy moan. Her stocking clad thighs clench together and she quivers weakly on the spot.");
	}
	//Repeat:
	else
	{
		output("<i>“Run away with it? What a great idea. I think I’ll do that,”</i> you wink, at the same time stroking her snowy snatch.The moment you do, the nurse-droid’s eyes half lidd and she lets out a breathy moan. Her stocking clad thighs clench together and she quivers weakly on the spot.");
	}
	output("\n\n<i>“B-but if you take my pussy and keep doing that, I’ll be unable to properly function!”</i> Vi whimpers, sliding a hand down to stroke her flat mound, unable to get herself off. You feel an adrenaline kick as the nurse-droid is completely and literally in your hands. Not only that, you know that with her pussy in your hands, you’re the <i>only</i> one who can play with her.");
	output("\n\n<i>“I’ll be back with it later, if you’re good. Until then, I’ll be thinking of you,”</i> you smile, slipping your fingers into her slickening slit. The nurse droid moans and rubs frantically between her thighs – you know she’s feeling your fingers delving deep inside of her right now! You then stash her wettened womanhood away.");
	output("\n\nThe violet haired synthetic blushes, looking more than a little wistful that you stopped fingering her snatch. She really can’t cum until you let her now – it’s like having her wear a chastity belt!");
	output("\n\n<b>You now have Vi’s pussy in your possession. You can use it on your ship or in the field!</b>");
	// PC gets Vi’s pussy as a key item. Can use to access masturbation scene on ship or in field.
	// Unlock talk topic ‘Pleasure’ if not unlocked already.
	// Scene end, exit Vi’s character menu.
	processTime(5);
	pc.lust(5);

	IncrementFlag("VI_PUSSY_TAKEN");
	pc.createKeyItem("Vi's Vagina",0,0,0,0);

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Rough Sex
// PC must have cock
// PC must not be taur
// Warning tool tip: S/M content.
public function roughSexWithVi():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	var x:int = pc.cockThatFits(chars["VI"].vaginalCapacity(0));
	output("Feeling a dark, lusty fire burning within, you decide you <i>are</i> in the mood to use the nurse bot, though not in the way she probably expects. After inviting her behind one of the privacy curtains, you roughly seize her violet side tail and drag her forward by it. Vi lets out a surprised squeal as you shove her face forward against the bed, bent over with her pert ass raised to you. <i>“W-what are you doing, " + pc.mf("sir","ma’am") + "? Thuh-this doesn’t compute!”</i>");
	output("\n\n<i>“I’m having my way with you, slut-bot. What else?”</i> You remark, whipping out [pc.oneCock] and flopping it down between her garter-belt framed buttocks. Her round butt quivers as you grab her side-tail once more, using it like a leash as you roughly shove your dick inside of her ");
	//hadSex>10Times:
	if(flags["VI_SEXED"] != undefined && flags["VI_SEXED"] >= 10) output("already sopping wet");
	else output("synthetically slick");
	output(" pussy. There’s a strange resistance as your cockhead shoves deeper inside of her, but as you bottom out inside of her, she lets out a strange moan.");
	pc.cockChange();

	output("\n\n<i>“" + pc.mf("S-sir","M-ma’am") + ", I’m not programmed for this kind of subroutine! Are you committing property damage, or having sex with me? I can’t tell?!”</i> Vi flushingly exclaims, desperate for some kind of input. Instead, you give her yours, slapping your hips hard against her surprisingly life-like asscheeks. Every time she moans, you tug at her hair, confusing the data signals to her synthetic brain. After a while, the two get crossed, and she’s moaning when you tug her hair, relishing in the abuse you’re lavishing on her synthetic body. <i>“D-damage me more, " + pc.mf("sir","ma’am") + "! P-please fuck me up!”</i>");

	output("\n\n<i>“I’ll do whatever I damn well please with you, slut-bot!”</i> you growl, bringing your hand down on her delicate back with a resounding, hard slap. The shock to her system is visible as her whole back arches like a cat, and she lets out a shrill cry, cumming <i>hard</i> around your cock! Uncaring for how much pleasure <i>she’s</i> feeling, you seize her shaking hips and grind away until you’re satisfied. She’s babbling away from her sixth orgasm when you finally groan and shoot your [pc.cumVisc] [pc.cumNoun] inside of her synthetic cunt, and when you pull out, the nurse-bot looks like a ruined mess!");

	output("\n\n<i>“T-thu-thank you " + pc.mf("Sir","Ma’am") + " for abusing this unit...”</i> Vi murmurs, rolling on her back and looking up at you with spaced-out eyes. Your [pc.cumColor] seed is drooling down from her gaping, thoroughly claimed pussy. She reaches down and rubs it in, letting out a low, confused moan, trying to process the input of what just happened.");

	output("\n\nYou coolly slip ");
	if(!pc.isCrotchExposed()) output("your [pc.gear] back on and ");
	output("out of the closed off cubicle, leaving the nurse-bot to recuperate.");

	// Unlock talk topic ‘Pleasure’ if not unlocked already.
	// Scene end, back to menu
	IncrementFlag("VI_SEXED");
	StatTracking.track("joyco/cum milked", pc.cumQ());
	processTime(19);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Tit Fuck
public function tittyFuckDatVi():void
{
	clearOutput();
	showVi(true);
	author("JimThermic");
	//if (Vi has never revealed she has working boobage):
	if(flags["VI_TITFUCKED"] == undefined)
	{
		output("You gaze at her hefty, well-formed breasts and fantasize about them wrapping around [pc.eachCock]. Sadly, though she wears little else, it seems her corset is sewn on to her chassis. You ask Vi if this is true.");
		output("\n\n<i>“Oh, yes! But my breasts are still fully functional; just give me a moment!”</i> Vi explains. She then reaches up to her tightly fitting top. Apparently she’s going to show you with actions, not words. How can they be functional if the corset is sewn on, you wonder?");
		output("\n\nPlacing her hands to either side of her deliciously deep cleavage, she then tugs down her bra-cups, leaving two large holes in her corset! Her bountiful breasts excitedly spill out of the maternity flaps. She seems to catch and push up her chest-weights with an arm. Her large areolae and firm, budding nipples poke out at you, puckered ever so slightly from the cold. Talk about detail!");
		output("\n\nFor a while, you’re spellbound by her large, creamy breasts and rounded nipples. You do, however, ask her what she means by ‘fully functional’?");
		output("\n\n<i>“Oh that? Here, I’ll show you!”</i> The violet-haired nurse brightly smiles, reaching up with her slender fingers and squeezing one of her springy-looking breasts. A pearlescent drop forms from her nipple and hangs from it, temporarily defying gravity’s pull.");
		output("\n\n<i>“I’m a nursing bot, so it’s only natural that I can nurse in every capacity, " + pc.mf("sir","ma’am") + ", including infants. My mammaries are capable of producing milk for a number of species. It’s also a perfect means to deliver medicine to children,”</i> she blushes.");
		output("\n\nThat explains the maternity-bra look. Still, the way the fabric of her corset frames and hugs her burgeoning breasts, making them look even <i>larger</i> and <i>rounder</i>, is seriously hot. Her top seems to naturally squeeze her wetly dripping nipples, as she’s now leaking from both down the curves of her pale puppies. Noticing your look, the nurse blushes, pressing her rack up some more. Her stocking-clad thighs rub excitedly together. Is she getting off on you staring at her chest?");
		// Set Vi as having revealed boobage.
	}
	else // VI has revealed she has boobs before:
	{
		output("You gaze at Vi’s hefty, well-formed breasts and fantasize about them wrapping around [pc.eachCock]. Feeling a stirring stiffness");
		if(!pc.isCrotchExposed()) output(" in your [pc.lowerGarments]");
		output(", you ask her if she can bare them for you?");

		output("\n\n<i>“Of course, " + pc.mf("Sir","Ma’am") + "!”</i> Vi happily exclaims. She then reaches up to her tightly fitting top. With a swift tug, she pulls down her bra-cups, leaving two large holes in her corset. Her bountiful breasts excitedly spill out of the maternity flaps. Catching her chest weights with one arm, she pushes them up, causing her large areolae and firm, budding nipples to poke out at you. They’re puckered ever so slightly from the cold.");
		output("\n\n<i>“Do you like what you see?”</i> She coyly asks, reaching up with her slender fingers and squeezing one of her springy-looking breasts. A pearlescent drop forms from her nipple and hangs from it, temporarily defying gravity’s pull. The fabric of her corset frames and hugs her burgeoning breasts, making them look even <i>larger</i> and <i>rounder</i>, is seriously hot. Her top seems to naturally squeeze her wetly dripping nipples, as she’s now leaking from both down the curves of her pale chest.");
		output("\n\nYou nod enthusiastically, unable to get enough of ogling her luscious peaks. Vi blushes and presses up her breasts some more. Her stocking-clad thighs rub excitedly together. Is she getting off on you staring at her chest?");
	}
	output("\n\n<i>“Um, " + pc.mf("Sir","Ma’am") + ", if you want, I can service you with these?”</i> Vi tentatively asks. Seems she noticed the stiffness ");
	if(!pc.isCrotchExposed()) output("in your [pc.lowerGarment]");
	else
	{
		output("of your cock");
		if(pc.cockTotal() > 1) output("s");
	}
	output(". She doesn’t need to ask you twice! You both hastily retreat behind a privacy curtain. Once there, ");
	if(!pc.isCrotchExposed()) 
	{
		output("you strip off and ");
	}
	output(" she drops to her knees before your erection");
	if(pc.cockTotal() > 1) output("s");
	output(".");
	if(pc.biggestCockLength() >= 14) 
	{
		output(" Staring at your incredible size and swollen cockhead");
		if(pc.cockTotal() > 1) output("s");
		output(", the curvaceous nurse gives a visible gulp.");
	}

	//Bigger than 14 inches:
	var x:int = pc.biggestCockIndex();
	if(pc.cocks[x].cLength() >= 14)
	{
		output("\n\n<i>“I’m not sure you’re going to fit between my breasts. I’m going to make them a bit bigger,”</i> Vi breathily exclaims. Her stocking-clad thighs are rubbing excitedly together; is she turned on by the sight of your cock");
		if(pc.cockTotal() > 1) output("s");
		output("? Reaching up to grab the underside of her already ample mammaries, she holds up their weight as they begin to swell and expand in size, becoming even larger!");
		output("\n\nOnce Vi is done, she’s equipped with a truly titanic set of tits, and her nipples have doubled in size! Her milky mammaries are jiggling and wiggling about as thick, creamy streams pour out of her saucer-sized nubs. She looks she’s about to burst all over the place! You wonder if she can even properly hold them up?");
		output("\n\n<i>“Don’t worry about me. It’s all part of a nurse’s work!”</i> Vi reassures you with a rich blush on her cheeks. Well, <i>some</i> nurses, maybe. She wraps her gigantic knockers around [pc.eachCock], capturing ");
		if(pc.cockTotal() == 1) output("it");
		else output("all of them");
		output(" between her creamy flesh. You groan as her soft warmth presses against the sides of your rod");
		if(pc.cockTotal() > 1) output("s");
		output(". They’re deliciously enveloped in her pale peaks. At the same time, her crinkled nipples rub against your lower half, drawing erotically milky lines along your [pc.skinFurScalesNoun]. You can see your [pc.cockHeads] poking out from the top of her deep cleavage, ");
		if(pc.hasCockFlag(GLOBAL.FLAG_FLARED, x)) output("flaring");
		else output("twitching");
		output(" and primed to fire all over her udders and beautiful face.");
	}
	else
	{
		output("\n\n<i>“Beginning pleasure subroutine,”</i> Vi breathily states, her stocking-clad thighs rubbing excitedly together. Is she turned on by the sight of your [pc.cocks]? She then wraps her gigantic knockers around [pc.eachCock], capturing ");
		if(pc.cockTotal() == 1) output("it");
		else output("all of them");
		output(" between her creamy flesh. You groan as her soft warmth presses against the sides of your rod");
		if(pc.cockTotal() > 1) output("s");
		output(". They’re deliciously enveloped in her pale peaks. At the same time, her crinkled nipples rub against your lower half, drawing erotically milky lines along your [pc.skinFurScalesNoun]. You can see your [pc.cockHead " + x + "] poking out from the top of her deep cleavage,");
		if(pc.hasCockFlag(GLOBAL.FLAG_FLARED, x)) output("flaring");
		else output("twitching");
		output(" and primed to fire all over her udders and beautiful face.");
	}
	output("\n\nThe busty nurse-droid begins to lift and drop her plush breasts, wringing and milking your shaft");
	if(pc.cockTotal() > 1) output("s");
	output(", working them up and down with a lust-drunk look on her flushing face. Every lift comes with a breathy sigh, each fall with an excited wiggling of her voluminous, stocking-clad thighs. She eagerly bounces her bountiful breasts on your cock");
	if(pc.cockTotal() > 1) output("s");
	output(", letting out an excited noise as a thick dribble of pre-[pc.cumNoun] bubbles from your cock-hole and down to stain her snowy udders. The slickness dribbles down her cleavage and slickens it up, warming and easing each sultry stroke of your twitching tool");
	if(pc.cockTotal() > 1) output("s");
	output(". The longer she works it, the more excited she gets. Before you can even come yourself, the blushing nurse gets there first, so worked up by wringing your pricks! As her expansive thighs quiver and quake, a thin stream of fluid shoots out from between her thighs, shamefully splashing the ground beneath your [pc.feet]!");

	output("\n\n<i>“I-I’m cumming!”</i> Vi squeals, pressing her huge tits against your stiff prick");
	if(pc.cockTotal() > 1) output("s");
	output(". The sight and sound of her creaming herself from simply tit-fucking your rod");
	if(pc.cockTotal() > 1) output("s");
	output(" is so incredibly hot that you immediately shoot your [pc.cumNoun] all over her face and sweaty breasts, splattering her nose, lips, and cleavage with spurting [pc.cumColor]. As it drips from her chin and flushing cheeks, she lets out a low, erotic moan, squirting a little bit more as you both revel in erotic, lusty release. When you finally come down from your sticky climax, the synthetic nurse looks utterly drunk off your musky spunk, spacily wiping it across her skin and tits like she wants to rub the smell and feel of your sperm into her synthetic skin.");

	output("\n\n<i>“I hope you enjoyed my service, " + pc.mf("Sir","Ma’am") + "!”</i> Vi blushingly exclaims, looking up at you with fluttering eyes. Her breasts are utterly sopping wet with your [pc.cumVisc] [pc.cumNoun]. You nod and get her to wipe your cock");
	if(pc.cockTotal() > 1) output("s");
	output(" clean with her lips and hands, wringing out every last drop of your [pc.cumColor] goodness onto her chest. Once she’s done, rather than wiping it off, she lifts the flaps up and covers up your cum; hiding it from sight instead of wiping it off. Seems she wants to feel your sperm on her skin for a bit longer!");

	// Unlock talk topic ‘Pleasure’ if not unlocked already.
	IncrementFlag("VI_SEXED");
	IncrementFlag("VI_TITFUCKED");
	processTime(25);
	pc.orgasm();
	// Scene end, back to menu
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Pocket Pussy / Masturbation
// PC must have Vi’s pussy in their inventory to watch this scene.
// Masturbation scene. Accessible from the ship or in the field. Not for use in public areas.
//Has key item: "Vi's Vagina"
public function viPussyFapScene():void
{
	clearOutput();
	showVi();
	author("JimThermic");
	
	if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC))
	{
		output("As much as you may like to use it, Vi’s vagina isn’t something you can readily play with in public. Make sure you are in a location that’s a little less populated before attempting to do that!");
		
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	
	// Select anatomy
	var hasGenital:Array = [];
	var useGenital:String = "anus";
	if(pc.hasCock() && pc.cockThatFits(chars["VI"].vaginalCapacity(0)) >= 0) hasGenital.push("penis");
	if(pc.hasVagina()) hasGenital.push("vagina");
	if(hasGenital.length > 0) useGenital = hasGenital[rand(hasGenital.length)];
	
	output("You feel the familiar flush of arousal spreading across your [pc.skinFurScalesNoun]. Your heart beats faster. Your thoughts are swallowed in a haze of base arousal. You find your fingers reaching for your sensitive erogenous zones. Acting on instinct, you touch and rub them, enjoying the rewarding zings of pleasure shooting up from your ");
	if(pc.biggestTitSize() >= 1 || !pc.hasGenitals()) output("[pc.nipples]");
	else if(pc.hasCock()) 
	{
		output("slowly stiffening cock");
		if(pc.cockTotal() > 1) output("s");
	}
	else output("tingling sex");
	output(". You’re stirred up more and more, swimming in the sizzling sensations, until you reach that point of no return. You’ve got to get <i>release</i>!");

	output("\n\nFumbling around in your belongings, you seek that one particular <i>thing</i>... ah! With both hands, you pull out the synthetic nurse from Myrellion’s – Vi’s – pale pussy, stashed away as your own personal belonging. With an excited breath, you tap ");
	//onship:
	if(InShipInterior()) output("a console");
	else output("your codex");
	output(". The pussy-lips twitch in response, now connected to her from far away");
	if(InShipInterior()) output(", using your ship as a relay");
	output(".");

	output("\n\nWith one hand, you hold the sheath her snatch is contained within. With the other, you part her petal-soft folds, peering eagerly within. Under your gaze, her rippled insides clench and relax. A swelling sense of satisfaction fills your chest. Even from so far away, the nurse is definitely feeling it! You dip a [pc.skinColor] finger inside of her slowly slickening insides. They clench around it! You push your digit further inside of her, wiggling it about, relishing in her wettening warmth. At the same time, you brush her clit with your thumb, attacking her from within and outside. Slick lubricant drools out from her folds and dribbles down your fingertips, warming them with her sweet smelling lady-cum. Her snatch is so warm and realistic, that it’s hard to tell between it and a real woman’s!");

	output("\n\nYou slide in a second and a third digit, pistoning them inside her slick lady-lips. The sound of her sloppy, slurping lips being fucked with your fingers makes you even hotter and hornier, knowing that far off the nurse is whimpering with delight as she’s being triple-fingered between her quaking thighs. There’s a sudden tight clench around your digits, followed by a thin, clear stream of fluid jumping up and splashing in your face. Your cheeks, nose, and mouth are sopping wet; did she just squirt on you?! Licking your lips, there’s the slightest hint of sweetness to her taste. While you savor her flavor, her slippery white folds spasm around your digits, wringing them for all they’re worth!");

	//If PC has a cock, roll 50% chance of this text appearing. Else use the other text.
	if(useGenital == "penis" && rand(2) == 0)
	{
		output("\n\nOnce her sloppy pussy stops spasming, you ");
		if(InShipInterior()) output("lie down on your bed");
		else output("find somewhere comfortable to lie down");
		output(". With one hand, you ");
		if(!pc.isCrotchExposed()) output("whip out");
		else output("grab");
		output(" your [pc.biggestCock], while with the other you position her glistening muff above your glans. You rub it against her lusciously wet lips, imagining the nurse-droid positioning her muff above it and lowering herself onto you. At the same time, you press yourself inch by inch onto your twitching cockhead, feeling her silky snatch sink down on your shaft, swallowing it right up to your base. Somewhere, Vi’s feeling your ");
		//10InchesOrBigger:
		if(pc.biggestCockLength() >= 10) output("massive dick");
		else output("rigid rod");
		output(" press into her tiny hole, pressing inside of her until your [pc.cockHeadBiggest] is almost right in her belly. Her velvety insides squirm and squeeze around your length, clinging to it with delicious tightness, as if trying to wring your [pc.cumNoun] out.");

		output("\n\nAfter you’ve adjusted to her intense tightness, you start stirring your [pc.biggestCock] around inside of her synthetic pussy. Her silky wetness feels heavenly rubbing around your throbbing hardness. She begins squeezing you from tip to base, rippling around you almost intentionally, pleasuring your cock from afar. Is the synthetic nurse stroking between her thighs right now, feeling your dick buried deep inside of her? Her girly juices are wildly drooling down your ");
		
		output("shaft and warming ");
		if(pc.balls > 0) output("your [pc.balls]");
		else if(pc.hasVagina()) output("your [pc.vaginas]");
		else output("between your buttocks");
		output(". You buck your hips up against her synthetic snatch, relishing in the feeling of your dick delving and pounding deep inside of her slick depths. Her pale clit rubbing against your lower belly. Will you both come at the same time? You bite your lower lip hard, holding on as long as you can, wanting to share that with the synthetic nurse.");
		output("\n\nYour thrusting becomes feverish and fast, and just when you can’t hold out any longer, you feel a slick splash against your lower belly – Vi’s cumming on you again! As the nurse-droid cums on and around you, you groan and shoot your [pc.cumVisc], [pc.cumColor] [pc.cumNoun] inside of her twitching snatch. You’re filling her pussy up ");
		//pcOnMyrellion:
		if(rooms[currentLocation].planet == "PLANET: MYRELLION") output("from miles away");
		else output("from light-years away");
		output(", splattering your spunk inside of her synthetic pussy. Your shared orgasm seems to last forever, your mind devoid of anything but sizzling pleasure, and the dim awareness of your body being wracked by delicious twitching.");
		output("\n\nOnce you’re fully spent, the warmth from her cum mixing with yours around your shaft and her juices on your face, feels that much more evident. You have to muster the energy to pick yourself up and clean yourself up, a thrumming sense of pleasure suffused through your entire body. You imagine Vi is feeling exactly the same, or maybe more, since she came twice!");
	}
	//else
	else
	{
		output("\n\nOnce her sloppy pussy stops spasming, you ");
		if(InShipInterior()) output("lie down on your bed");
		else output("find somewhere comfortable to lie down");
		output(". With one hand, you bring her glistening muff to your lips, while your other hand sneaks down ");
		if(!pc.isCrotchExposed()) output(", beneath your [pc.lowerGarments] ");
		output("and to your [pc.vagOrAss]. As you lick her lusciously wet lips, you simultaneously press a finger ");
		if(pc.hasVagina()) output("between your own");
		else output("into your pucker");
		output(" and wriggle it about inside of yourself. You imagine the nurse-droid’s muff pressed in your face as you furiously finger yourself, moaning and bucking your hips up in the air. You can imagine it easily, your face covered with her lady-juice, and her warmth pressed up against your [pc.lips]. You tease her clit with your tongue – somewhere Vi’s squirming as you flick her love bud, sensitive in the aftermath of her first climax. You roll your finger ");
		if(pc.hasVagina()) output("against your own clit and insides");
		else output("around your insides");
		output(", sharing the sensation with her; you better than anyone know the sizzling pleasure she’s feeling! Will you both come at the same time? You bite your lower lip hard, holding on as long as you can, wanting to share that with the synthetic nurse.");
		output("\n\nFinally, you can hold out no longer, breathing hot and hard as you utterly quake with pleasure. Moments before, you feel another slick rope splash against your nose and cheeks – Vi’s cumming on your face again! You cream yourself <i>hard</i> to that sexy thought, clenching around your fingers as your thighs quake! Your shared orgasm seems to last forever, your mind devoid of anything but sizzling pleasure, and the dim awareness of your body being wracked by delicious twitching. Now that you’re fully spent, the warmth ");
		if(pc.hasCock()) output("from all your cum on your belly and hers on your face");
		else if(pc.hasVagina()) output("from all your cum on your snatch and hers on your face");
		else output("from her cum on your face");
		output(" is evident and more intense. You have to muster the energy to pick yourself up and clean yourself up, a thrumming sense of pleasure suffused through your entire body. You imagine Vi is feeling exactly the same, or maybe more, since she came twice!");
	}

	processTime(15);
	pc.orgasm();
	IncrementFlag("VI_PUSSY_FAPPED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//[Modify]

// Add this option to main menu.
// Modify.name: Modify Vi’s specs to suit your tastes!
//Modify
// ‘Pleasure’ talk topic must have been watched, to learn that she’s been tampered with already.
public function modifyViMenu():void
{
	clearOutput();
	showVi();
	author("A Spoopy Ghost");
	//Haven't got permission yet:
	// You get the ‘permission flag’ via this scene.
	if(flags["VI_MOD_OKAY"] == undefined)
	{
		output("You ask Vi if you can tamper with her hardware? The nurse-droid’s eyes fly open in shock, and she presses a slender hand to her chest.");
		output("\n\n<i>“Mess with my chassis? That’s incredibly forward, don’t you think?”</i> She breathily exclaims. She then adds, <i>“I’ve already been tampered with already. If you want to make modifications to this unit, you’ll need to contact JoyCo’s technical loans division.”</i>");
		output("\n\nEven as she says this, you notice her stocking-clad thighs are pressed together. There’s a glistening trickle dribbling down from her snowy-white lips. Her breathing is a little rough, too. Is she getting excited by the prospect of being modified?");
		processTime(3);
		//[PushIt] [LeaveIt]
		clearMenu();
		addButton(0,"Push It",pushItWithViMod);
		addButton(1,"Leave It",leaveViWellEnoughAlone)
		return;
	}
	else
	{
		//GotPermission:
		output("You tell Vi that you’d like to tamper with her hardware. The nurse droid shyly nods and presses her thighs together, rubbing them a little. By the flushing of her cheeks and her pale pussy, you can tell she’s excited by the prospect.");
		output("\n\n<i>“What about me would you like to tamper with today, " + pc.mf("sir","ma’am") + "?”</i>");
		viBoobSizeMenu();
	}
}

//PushIt:
public function pushItWithViMod():void
{
	clearOutput();
	showVi();
	author("A Spoopy Ghost");
	output("<i>“W-well, if you wanted to modify me, I really can’t say no. I’m programmed to obey nearly any request, " + pc.mf("sir","ma’am") + "?”</i> Vi informs you, touching her side tail. In short, you can do whatever you want to her, and she’s not going to object!");
	// Tick ‘GotPermission’ flag.
	flags["VI_MOD_OKAY"] = 1;
	processTime(2);
	//[IncreaseBoobs] [ShrinkBreasts]
	viBoobSizeMenu();
}

public function viBoobSizeMenu():void
{
	clearMenu();
	//Tooltip.increaseboobs: 
	if(flags["VI_BIGBOOBS"] == 1) addDisabledButton(0,"IncreaseBoobs","IncreaseBoobs","You’ve already filled Vi’s breasts to capacity!")
	else if(pc.hasItemByClass(Silicone, 2)) addButton(0,"IncreaseBoobs",inflateViBoobs,undefined,"IncreaseBoobs","Inflate Vi’s puppies until they’re heavy and hyper-sized!\n\n<b>Cost: 2 units of Silicone</b>");
	else addDisabledButton(0,"IncreaseBoobs","IncreaseBoobs","Inflate Vi’s puppies until they’re heavy and hyper-sized! You’ll need 2 units of silicone in order to inflate Vi’s breasts");
	//Tooltip.Shrinkbreasts: 
	if(flags["VI_BIGBOOBS"] == 1) addButton(1,"ShrinkBreasts",shrinkViBreasts,undefined,"ShrinkBreasts","Bring Vi’s breasts back down to their original size.");
	else addDisabledButton(1,"ShrinkBreasts","ShrinkBreasts","Her breasts are already as small as they can go.");
	addButton(14,"Back",viMenu);
}

//LeaveIt:
public function leaveViWellEnoughAlone():void
{
	clearOutput();
	showVi();
	author("A Spoopy Ghost");
	output("You decide not to press the point. After all, she’s technically not your droid to mess with.");
	// Return to her main menu. Nothing changes
	viMenu();
}

//IncreaseBoobs
public function inflateViBoobs():void
{
	clearOutput();
	author("A Spoopy Ghost");
	//FirstTime:
	if(flags["INFLATED_VI"] == undefined)
	{
		output("You pull out your gathered reserves of silicone");
		//output(" from New Texas, snatched from the claws of varmints");
		output(". Now, you’re planning to put it to good use, pumping it into Vi’s titties to make them deliciously big and hefty.");
		output("\n\nUpon spotting the seized silicone, Vi loudly gasps. <i>“That’s a Kiha-corp product! You can’t possibly be planning to cross-use company merchandise?”</i> Her silky thighs rub together even more. <i>“Pumping me full of the competitor’s product... that’s so lewd!”</i>");
		output("\n\nYou ask Vi where her input slot is for the silicone. The femme-bot coughs. <i>“Um, in my nipples, " + pc.mf("sir","ma’am") + ". My unit doesn’t come with a spinal input port for that sort of thing.”</i>");
	}
	//Repeat Scene:
	else
	{
		output("Time to pump the pale-skinned bot’s breasts full of soft silicone! As you position the seized substance before her, Vi blushes and squirms on the spot. She’s probably recalling the last time you used it to fill her already tantalizingly large tits.");
		output("\n\n<i>“It feels strange having my breasts pumped full of another company’s product,”</i> she exclaims, cupping her breasts. <i>“It’s not within my normal operating parameters.”</i>");
		output("\n\nVi reaches up to her tightly fitting top, and with two swift tugs, pulls down her bra-cups, leaving two holes in her corset. Her bountiful breasts excitedly spill out of the maternity flaps. She scoops up her chest weights with a free arm and presses upwards. Her pert nipples and well-rounded areolae are poking out at you.");
	}
	//Vi has never revealed her working boobage
	// This is ‘flags[<i>“VI_TITFUCKED”</i>]’, but you might want to change it to something more generic because she can now reveal she has working boobage here without the PC ever having titfucked her.
	if(flags["VI_TITFUCKED"] == undefined)
	{
		output("\n\nIn her nipples? You raise an eyebrow and stare at her corset that looks sewn onto her chassis. If she’s got nipples, you can’t see them, and you say as much.");
		output("\n\n<i>“That’s because you’ve never asked to see them,”</i> Vi playfully replies. <i>“Here, just give me a second...”</i>");
		output("\n\nAnd with that, Vi reaches up and places her hands on either side of her deliciously deep cleavage. Then, with two swift movements, she tugs down her bra cups, leaving two large holes in her corset! Her bountiful breasts excitedly spill out of the newly revealed maternity flaps and she catches them with an arm, pressing them upwards. Her large areolae and firm, budding nipples are now poking out at you, puckered ever so slightly from the cold. <i>“See? Perfectly functional.”</i>");
		output("\n\nFor a while, you’re spellbound by her large, creamy breasts and rounded nipples. You do, however, ask her if she means ‘fully functional’ in every sense of the word?");
		output("\n\n<i>“Of course!”</i> The violet-haired nurse brightly smiles, reaching up with her slender fingers and squeezing one of her springy-looking breasts. A pearlescent drop forms from her nipple and hangs from it, temporarily defying gravity’s pull. <i>“I’m a nursing bot, so it’s only natural that I can nurse in every capacity, " + pc.mf("sir","ma’am") + ".”</i>");
		output("\n\n<i>“My mammaries are capable of producing milk for any number of species. It’s also a perfect means to deliver medicine to very young children!”</i>");
		output("\n\nThat explains the maternity-bra look. Still, the way the fabric of her corset frames and hugs her burgeoning breasts–making them look even <i>larger</i> and <i>rounder</i>–is seriously hot. But you have a mission, and that’s to make those breasts even bigger!");
		// Tick Vi off for showing her working boobage.
		//Doesn't fuck up titfuck counts and still tracks that it isn't undefined! Everyone wins!
		flags["VI_TITFUCKED"] = 0;
	}
	//VI has revealed her working boobage before:
	else
	{
		output("\n\nVi reaches up to her tightly fitting top, and with two swift tugs, pulls down her bra-cups, leaving two holes in her corset. Her bountiful breasts excitedly spill out of the maternity flaps. She scoops up her chest weights with a free arm and presses upwards. Her pert nipples and well-rounded areolae are poking out at you.");
	}
	//First Time:
	if(flags["INFLATED_VI"] == undefined)
	{
		output("\n\nGrabbing two tubes from the silicone, you search for somewhere to insert them. Just when you’re about to ask, Vi brings two fingers to each nipple, making a ‘V’ with her digits. Her puckered nubs begin to stretch out and dilate before your very eyes! Soon you’re gazing into two circular and coin-sized fleshy tunnels in both of her breasts, like entirely new orifices smack-bang in the middle of her crinkled areolae. A small trail of soppy white milk is trailing out of them and dribbling down her curvaceous mounds, like a creek running out of a lumpy tunnel. <i>Are those nipple-pussies?</i>");
		output("\n\n<i>“Not many people see this particular function of mine. There’s very little reason to access the papilla valves,”</i> Vi explains, long lashes fluttering. <i>“If you slide the tubes in, I can clamp down and begin extraction into my breasts.”</i>");
		//first time && PC.hasCock:
		if(pc.hasCock())
		{
			output("\n\n[pc.EachCock] stiffens at her words. It’s hard not to imagine her warm milk-slickened nipples clamping around <i>something else</i> and extracting some fluids.");
			pc.lust(5);
		}
	}
	else
	{
		//Repeat Scene:
		output("\n\nVi brings two fingers to each nipple, making a ‘V’ with her digits. Her puckered nubs begin to stretch out and dilate before your very eyes. Soon you’re gazing into two circular and coin-sized fleshy tunnels in both of her breasts, like entirely new orifices smack-bang in the middle of her crinkled areolae. A small trail of soppy white milk is trailing out of them and dribbling down her curvaceous mounds, like a creek running out of a lumpy tunnel.");
		output("\n\n<i>“Just like last time, if you slide the tubes into my papilla valves, I can clamp down and begin extraction into my breasts.”</i>");
	}
	output("\n\nTitilated, you bring up one of the transparent tubes and slide it into her gaping nipple-holes. You wiggle it into her areolae and deep into her plump breasts. Stopping when you feel some resistance, you take your hand away. With the see-through tubing, you can still see deep into her pale tit-flesh. She clamps down on the plastic tubing and warps its shape. Her lumpy papilla tube presses against it just like a vaginal passage. It’s conveniently hands free, and you slip the other tube into her right breast, watching in amazement as she clamps down on that one as well.");
	output("\n\n<i>“I’m ready for pumping now, " + pc.mf("sir","ma’am") + ",”</i> Vi blushingly informs you, twin tubes jutting out of her dilated nipple-holes. The sight itself is very lewd, and you feel your ");
	if(pc.hasCock()) output("[pc.cocks] throb even harder");
	else output("skin flush and prickle");
	output(".");
	output("\n\nReaching down, you flick on the silicone pump, and there’s a low whir. Thick, lucid drops of the sticky liquid roll up the tube and into her tits, chased by thicker gauzy globs that eagerly force themselves deep into her spread out areolae. When the first generous dollop slips and slides into her exposed breasts, the snowy-skinned nurse gasps and her eyelashes wildly flutter. Her buxom chest jiggles with her suddenly erratic breathing. <i>“T-this is so strange to process... I have no parameters for this!”</i>");
	output("\n\nShe must have <i>some</i> similar parameters, by the way her pale mound is suddenly leaking down her quivering thighs. She loses control of them shortly after, planting her plush butt on the nearby bed and wiggling her butt into it. It’s not long at all before the pristine hospital sheets are soaked with her synthetic lady-juices, leaving a gigantic wet patch right under her rotund and quivering behind. What a naughty girl, messing up the sheets like that!");
	output("\n\nAs she clings desperately to the sheet fabric, you turn up the pump, grinning as more gauzy globs shoot up the tubes and into her ample breast-flesh. Her already deep cleavage is shivering and shaking about as she wiggles and moans, stimulated and gasping from each slick dollop fired into her yawning nipples. There’s a sharp girlish cry, and a thin arching stream squirts out from her hairless pussy, dripping and splashing on the ground before you. Her snowy-white snatch is now sloppy and wet with her juices, her round clit protruding and engorged, as she reaches down and rubs it instinctively to draw out her orgasm.");
	output("\n\nWhile she’s cumming, you can see her buxom breasts begin to droop and become heavier and fuller, almost as if each stroke of her quim is increasing its size, making it larger, like a building orgasm. With the pump on high, it’s not long before her swollen tit-flesh is ballooning out until each of her breasts are as scandalously large as watermelons, dangling off her comparatively tiny frame. Her stretched nipples are swelling and stretching in size as well, bringing her bumpy areolae into hypersexualized emphasis, to the point you couldn’t avoid noticing them if you tried.");
	//PC.hasCock:
	if(pc.hasCock())
	{
		output("\n\nUnable to hold back any longer, you ");
		if(!pc.isCrotchExposed()) output("whip out");
		else output("grab your");
		output(" [pc.oneCock] and smother it between her now mountainous cleavage. Her snowy skin is so soft and smooth that you’re slapping away against her hefty tits in no time, groaning and smacking against her constantly swelling cleavage. The nurse-droid is blushing as you forcibly fuck her billiowing bust, your [pc.cockHead] eager to fire another slick load all over her exterior as she’s pumped inside as well!");
		pc.lust(500);
	}
	output("\n\nStimulating you visually as well as with her involuntary moans, Vi dips a finger inside of her slick pussy and wiggles it about, her pinky pulled back and rubbing against her budding clit. If the bed wasn’t soaked before, it’s drenched down to the mattress now as the violet-haired VI humps the air, her butt-flesh quivering and flexing against an invisible lover plumbing her slit. Her shivering and shaking breasts continue to swell until you can barely see her actual chest at all now; it’s going to be hard for the nurse to take temperatures properly after this!");
	output("\n\nThere’s an excited squeal, and she throws her head back, her ponytail whipping backwards and slapping against her back. Wracked with orgasmic pleasure, she splutters and shoots a second intermittent pussy-burst all over the ground and her nurse stockings, staining them with her lady cream.");
	pc.lust(20);
	if(pc.hasCock()) 
	{
		output(" You cry out and unload your own [pc.cumNoun] all over her chest ");
		if(pc.cumQ() < 7) output("in a tiny [pc.cumColor] splatter");
		else if(pc.cumQ() < 50) output("in a thick [pc.cumColor] dollop");
		else if(pc.cumQ() < 500) output("in a thick [pc.cumNoun] pool");
		else output("in a thick [pc.cumNoun] flood");
		if(pc.cumQ() >= 50) output(", utterly basting her creamy flesh in your seed");
		output(".");
		pc.orgasm();
	}
	output(" She then falls back on the bed and touches her now tremendously huge peaks; they’ve so big she’s almost being squashed by her new Q-cups. Perhaps the pump was left on a little too long~?");
	output("\n\n<i>“I-Is this size satisfactory for you, " + pc.mf("sir","ma’am") +"?”</i> Vi asks, touching her massive mammaries and trying to slip out the now empty silicone tubes. Try as she might, she can’t reach around her own tremendous bust to properly pull them out; her arms are just too short!");
	output("\n\nYou indulge her and pull out the tubing, and she lets out a breathy sigh. Her distended nipples slowly close, but they still have dimples in the middle. Milk is liberally leaking from her swollen nubs like never before. Is the new silicone enhancements forcing it out? She certainly wasn’t lactating that much before.");
	output("\n\nWith a little difficulty, Vi clips the maternity-like flaps back over her nipples. Only a few moments later, the material looks a little stained.");
	output("\n\n<i>“How strange. Constant lactation isn’t within my normal operational parameters,”</i> Vi remarks, touching her ponytail. You’re not surprised, considering you just pumped her full of an unauthorized product. A few side effects are to be expected.");
	output("\n\n<b>Vi now has Q-cups!</b>");
	
	flags["VI_BIGBOOBS"] = 1;
	showVi(true);
	
	processTime(15);
	IncrementFlag("INFLATED_VI");
	
	pc.destroyItemByClass(Silicone,2);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//ShrinkBreasts
public function shrinkViBreasts():void
{
	clearOutput();
	author("A Spoopy Ghost");
	output("You tell Vi that you’re going to be decreasing her breast size. The nurse-droid places her hands underneath her massive melons and lifts them slighty, her hypersexualized nipples jutting pointedly through the corset’s fabric.");
	output("\n\n<i>“Well, it would make it easier to perform my primary tasks. Though the amount of requests for my secondary functions has leapt by 408%,”</i> Vi informs you, before handing you two nipple cups. <i>“You’ll need these. The process for extraction is slightly different from insertion. I’ll need to be milked.”</i>");
	output("\n\nYou attach the maternity milking cups to the ends of the transparent tubes, then clamp them onto the violet-haired nurse’s substantially sized nipples. The moment you turn the suction on, they suck her gigantic nubs into the cups and cling onto her breast flesh. She turns her lactation mode off slightly before, then cups her breasts once more. Slowly and with great precision, she rubs her thumbs and fingers into her ample breast flesh, as if she’s a new mother stimulating and working her mammary glands.");
	output("\n\n<i>“I don’t think it’s coming, " + pc.mf("sir","ma’am") + ". Can I get some assistance?”</i> Vi asks, lashes fluttering. You move up behind her and cup her voluminous breasts, helping her massage her soft and snowy skin. You can feel her internal temperature rising, or perhaps it’s part of the process? Either way she’s wiggling against your loins as you tweak and tease her maternity-cupped nubs, trying to coax the budding fluids out. <i>“O-oh, I think something’s coming!”</i>");
	output("\n\nTrue enough, you pinch her lower nipple and buds of sticky liquid begin to form around it. They’re sucked quickly into the tube and roll into the collection tank, signaling your success. The more you milk her, the more droplets form, and soon she’s producing dollops of diaphanous liquid right into the cups, like a cowgirl being milked. Vi must be enjoying it by the way she’s wiggling her butt in your lap and rubbing her thighs together, not to mention her breathy little moans. There’s a slickness against your lap, and you realize she’s gotten all wet, just like the time you pumped this stuff into her.");
	output("\n\n<i>“Please proceed, I’m still functional,”</i> Vi informs you, pressing her slender back up against you. She’s rubbing up against you like a cat despite herself while you milk her massive teats, spilling more and more slickness into the tubes. Noticing she’s letting out more the more worked up she gets, you reach down and slide a hand between her stocking-clad thighs, seeking out her slickened slit. Wiggling a finger inside her wetness, you stir it about, and the nurse-droid along with it! She’s whining and wiggling in your arms while you finger fuck her pussy, rubbing her engorged clit against the middle of your delving digits.");
	output("\n\nWith a loud cry, she creams herself on your fingers and squirts her girl-juices all over your palm. You feel the wet splattering with an immense sense of satisfaction, watching on as jets of clear fluid stream out of her shrinking bust. With your thoroughly drenched hands, you continue to fuck her sloppy slit while she bucks against you in wild abandon, filling the air with lewd squelching noises. She’s going at it as enthusiastically as if she were fucking");
	if(!pc.hasCock()) output(" a cock");
	else 
	{
		output(" your cock, and that gives you an idea. Already hard from her naughty display, you position [pc.oneCock] at her wiggling rump and slide your [pc.cockHead] between her twitching buttocks, right up into her relaxed sphincter. The nurse-droid lets out a surprised whine as you bury yourself without warning right up to the hilt, slapping against her shaking buttocks");
	}
	output(".");

	//Pc.hasCock:
	if(pc.hasCock())
	{
		output("\n\nSlapping and bouncing Vi on your turgid cock, you simultaneously finger-fuck her sloppy pussy from the front as you piston her pale pucker from behind. Globs of goo keep jumping excitedly from her nubs like never before as you rub your twitching crown around inside her rectum, painting her twitching depths with your dribbling pre-cum.");
		output("\n\nIt’s not long before she’s squirting once more into your hand, her whole rear end clinging and wringing your rod. Driven over the edge by her erotic squeezing, you groan and shoot your [pc.cum] deep into her rump, ");
		if(pc.cumQ() < 300) output("splattering it");
		else output("filling it up");
		output(" with your seed. She wrings it for every last drop you have, storing your seed deep up inside her sphincter, before you pull out with an unceremonious plop.");
		pc.orgasm();
	}
	else pc.lust(20);
	output("\n\nWhen the process is finally finished, you pull your shining finger out of her quim. The violet-haired nurse’s breasts are drastically reduced in size, though they’re really just back to how they were before.");
	output("\n\n<i>“That input was very stimulating for my processors,”</i> Vi exclaims, her snowy-white cheeks flushed. <i>“If you need to do any more modifications, please feel free to do it at any time, " + pc.mf("sir","ma’am") +".”</i>");
	output("\n\n<b>Vi now has D-cups again!</b>\n\n");
	
	flags["VI_BIGBOOBS"] = 0;
	showVi(true);
	
	processTime(25);
	
	var silicone:ItemSlotClass = new Silicone();
	silicone.quantity = 2;
	quickLoot(silicone);
}
