import classes.Items.Drinks.HoneyWine;

public function lieveHeader(isNude:Boolean = false, isSolo:Boolean = false):void
{
	showName("\nLIEVE");
	author("Savin");

	if (isNude)
	{
		if (isSolo) showBust("LIEVE_NUDE");
		else showBust("LIEVE_NUDE", "SIERVA_NUDE", "MAYREN_NUDE");
	}
	else
	{
		if (isSolo) showBust("LIEVE");
		else showBust("LIEVE", "SIERVA", "MAYREN");
	}
}

public function hasMetLieve():Boolean
{
	if (flags["MET_LIEVE"] != undefined) return true;
	return false;
}

public function hasFuckedLieve(inc:Boolean = false):Boolean
{
	if (inc)
	{
		if (flags["FUCKED_LIEVE"] == undefined) flags["FUCKED_LIEVE"] = 0;
		flags["FUCKED_LIEVE"]++;
	}

	if (flags["FUCKED_LIEVE"] != undefined) return true;
	return false;
}

public function hasFuckedTrenchWives(inc:Boolean = false):Boolean
{
	if (inc)
	{
		if (flags["FUCKED_TRENCHWIVES"] == undefined) flags["FUCKED_TRENCHWIVES"] = 0;
		flags["FUCKED_TRENCHWIVES"]++;
	}

	if (flags["FUCKED_TRENCHWIVES"] != undefined) return true;
	return false;
}

public function hasFuckedLieveSolo(inc:Boolean = false):Boolean
{
	if (inc)
	{
		if (flags["FUCKED_LIEVE_SOLO"] == undefined) flags["FUCKED_LIEVE_SOLO"] = 0;
		flags["FUCKED_LIEVE_SOLO"]++;
	}

	if (flags["FUCKED_LIEVE_SOLO"] != undefined) return true;
	return false;
}

public function lieveVenomEnabled():Boolean
{
	if (flags["LIEVE_VENOM_ENABLED"] != undefined) return true;
	return false;
}

public function lieveVenomUsed():Boolean
{
	if (flags["LIEVE_VENOM_USED"] != undefined) return true;
	return false;
}

public function lieveVenomCounterInc():void
{
	if (flags["LIEVE_VENOM_COUNTER"] == undefined) flags["LIEVE_VENOM_COUNTER"] = 0;
	if (flags["LIEVE_LAST_VENOM_TIME"] == undefined) flags["LIEVE_LAST_VENOM_TIME"] = GetGameTimestamp();
	flags["LIEVE_VENOM_COUNTER"] -= ( GetGameTimestamp() - flags["LIEVE_LAST_VENOM_TIME"] ) / (1.5 * 24 * 60);
	flags["LIEVE_LAST_VENOM_TIME"] = GetGameTimestamp();
	if (flags["LIEVE_VENOM_COUNTER"] < 0) flags["LIEVE_VENOM_COUNTER"] = 0;
	flags["LIEVE_VENOM_COUNTER"]++;
	if (flags["LIEVE_VENOM_COUNTER"] >= 4) flags["LIEVE_VENOM_ENABLED"] = 1;
}

public function lieveVenomCounterReset():void
{
	flags["LIEVE_VENOM_COUNTER"] = 0;
	flags["LIEVE_LAST_VENOM_TIME"] = GetGameTimestamp();
}

public function lieveBunkerFunc():Boolean
{
	if (flags["MET_LIEVE"] == undefined)
	{
		lieveInitialEncounter();
		if(flags["SELLERA_DENIED"] != undefined) flags["SELLERA_DENIED"] = undefined;
		return true;
	}
	//FederationQuest Denying stuff
	else if(flags["SELLERA_DENIED"] != undefined)
	{
		if(GetGameTimestamp() < (flags["SELLERA_DENIED"] + 60*48)) return false;
		else return lieveReturn();
	}
	else if(flags["FEDERATION_QUEST"] > 3 && flags["FEDERATION_QUEST_COAT"] == undefined)
	{
		lieveGiveCoat();
		return true;
	}
	else if(pc.hasStatusEffect("Lieve Disabled")) return false;
	else
	{
		output("\n\nLieve’s here, idly watching the approach through the viewslit. Her harem lounges around behind her, looking bored and horny but unwilling to disturb their mistress at present.");
		
		addButton(0, "Lieve", lieveRepeatEncounter);
	}
	
	return false;
}

public function lieveInitialEncounter():void
{
	clearOutput();
	lieveHeader();
	
	flags["MET_LIEVE"] = 1;

	output("You slip inside the bunker’s open door, following the voice of the red myr woman inside. Or women, by the sounds of things. You hear several distinct, feminine voices inside: two laughing and giggling, a third grumbling as you hear belts clicking and clothes rustling. A few steps down a corridor take you to an open interior with a viewslit looking out over the trench lines. Inside, you see the red myr soldier who poked her head out, her purple hair mussed and her uniform disheveled. To your surprise, a pair of gold myr are lounging next to her, both buck naked and clearly aroused, their large areolae stiff and their bare twats reddened with excitement.");
	
	output("\n\nThe soldier finishes buckling her belt and looks up at you, running a hand through her purple hair. <i>“Sorry about that,”</i> she chuckles, resting a hand on one of the gold myr’s heads. The nude woman makes a wordless sound of pleasure and nuzzles against the red’s chitinous palm. Scratching the golden’s blonde hair, the soldier continues, <i>“Look, the Commandant’s said all you offworlder types can go out into the tunnels even with the lockdown, but if you know what’s good for you, you won’t. Can’t stop you, but I can at least warn you. Goldies mined the tunnels pretty good, and now that the fighting’s done, plenty of scavengers are out looking to loot or breed. Some are myr, some... not.”</i>");
	
	// {if PC’s been in No-Man’s Land before:
	if (flags["ENTERED_NOMANSLAND"] != undefined)
	{
		output("\n\n<i>“I get the picture,”</i> you say. <i>“Been out there before.”</i>");
		
		output("\n\n<i>“Oh, right then,”</i> the warrior says, shrugging lightly. <i>“Sorry about that... most of you offworlders just look so wet behind the ear to me. Just kids, half of you.”</i>");
		
		output("\n\nYou cock an eyebrow at her. By human standards, she doesn’t look out of her twenties.");
	}
	else
	{
		output("\n\n<i>“Not?”</i> you ask, cocking an eyebrow.");
		
		output("\n\nShe nods gravely, casting a glance out the viewslit. <i>“Lot of things coming up from the deep caves. Goo-creatures, nyrea, funguses that’ll drive you mad with lust. Most of them usually keep to the darkest depths, well away from civilization, but the lull in the fighting - and all the extra offworlders - seem to be drawing them out. That’s why the town’s locked down: to keep the goldies from wandering out and getting killed, and keep the things that go bump in the dark away from us.”</i>");
	}
	
	output("\n\nWith her warning delivered, the soldier seems");
	if (pc.isMasculine(true)) output(" ready to dismiss you");
	else output(" to run out of things to say");
	output(" until the other gold myr girl with her, a raven-haired warrioress in her own right, slips up behind the red-plated soldier, pressing herself into her companion’s back and murmuring, <i>“Aren’t you going to introduce yourself?”</i>");
	
	if (pc.isMasculine(true))
	{
		output("\n\n<i>“Oh, right,”</i> the red soldier laughs. <i>“I’m Scout Thyrsa. You can call me Lieve if you’d like - most of you offworlders go by given names, right? That’s what the pamphlet said, anyway. I’m in charge of Kressia’s scout company, plus forward observation and reconnaissance. If you need any information about the region, feel free to come by and ask. Not much to do with the cease-fire on, so I’m pretty much sat here all day.”</i>");
	}
	else
	{
		output("\n\n<i>“I was just getting to that,”</i> the red soldier laughs, flashing you a warm smile and extending a hand in a surprisingly human gesture. <i>“I’m Scout Thyrsa. But </i>you<i> can call me Lieve.”</i>");
	
		output("\n\nYou take her hand and shake it, eliciting a larger smile from the crimson ant-girl. <i>“Ha! I got it right this time. Stupid pamphlet they gave us didn’t say to use your right hand, and all you offworlders kept looking at me funny when I tried.”</i>");
		
		output("\n\nNever thought you’d see someone so elated they’d gotten a simple handshake right. She laughs and apologizes, <i>“Sorry! Now you’re looking at me funny anyway... Look, if you need anything while you’re here in Kressia, come talk to me. I’m in charge of the city’s scout company and reconnaissance, but with the cease fire, I’m mostly just sitting around. Can tell you anything you’d want to know about the region. Even give you a tour of the town, if you want,”</i> she adds with a wink.");
	}
	
	output("\n\n<i>“And what’s </i>your<i> name?”</i> the more voluptuous blonde myr at Lieve’s foot coos, looking up at you with a blatantly flirtatious smile.");
	
	output("\n\n<i>“Steele. [pc.name] Steele,”</i> you answer.");
	
	if (pc.hasCock()) output("\n\n<i>“Steele?”</i> the ravenette smiles. <i>“What a firm, strong name...”</i>");
	else output("<i>“Good to meet you, Steele,”</i> Lieve says with a smile, gently stroking the blonde girl’s hair.");
	
	output("\n\n<i>“Oh, and these are my trench wives, Mayren,”</i> she says, patting the blonde’s head, <i>“and Sierva,”</i> she finishes, reaching behind herself to put a hand on the stronger-looking ravenette’s hip. The gold-plated warrior makes a pleasured sound and wraps her arms around Lieve’s waist.");
	
	output("\n\nLieve chuckles and says, <i>“Don’t mind them, they just got themselves a nice helping of my venom. Makes them nice and affectionate, doesn’t it girls?”</i> The two gold myr coo and moan, nuzzling against Lieve.");
	
	output("\n\nTheir mistress grins and turns her attention back to you. <i>“So, since you’re here, anything I can help you with?");
	if (!pc.isMasculine(true) && pc.lust() >= 33) output(" Or maybe you’re getting some other ideas...?");
	output("”</i>");

	processTime(30);
	lieveMenu();
}

public function lieveRepeatEncounter():void
{
	clearOutput();
	lieveHeader();
	if (!hasFuckedLieve() && pc.isMasculine(true))
	{
		output("<i>“Hey again, Steele,”</i> Lieve says, giving you a friendly smile. Her harem girls look up excitedly when you enter, and they quickly go from lounging on the carpet and chairs to curling up around their mistress, getting very friendly with Lieve’s thighs.");
	
		output("\n\nShe smiles and runs a hand through her blonde slave’s hair. <i>“Anything I can help you with, Steele? Or did you just come for the eye candy here?”</i>");
	}
	else if (hasFuckedLieve() && pc.isMasculine(true))
	{
		output("<i>“Hey again, Steele,”</i> Lieve says, turning to you and resting her shoulder against the side of the bunker. She gives you a friendly smile, and her harem girls make a show of crawling towards you, both with lust-filled and inviting looks writ plain across their faces.");
	
		output("\n\nTheir mistress chuckles, shaking her head at their wanton display. <i>“So, since you’re here, anything I can help you with? If not, it looks like my girls here would certainly like to make the trip worthwhile for you...”</i>");
	}
	else if (!hasFuckedLieve() && !pc.isMasculine(true))
	{
		output("<i>“Hey, [pc.name],”</i> Lieve says, perking up as you approach. She gives you a big, friendly smile and motions you closer. Her harem girls look up and smile at you; there’s little subtlety in the way they shift to make themselves look more appealing and inviting for you, sitting with chests out and legs spread.");
		
		output("\n\n<i>“Need help with anything?”</i> Lieve offers. <i>“Or");
		if (pc.lust() >= 33) output(" did you have something else in mind?");
		else output(" we could just hang out...");
		output("”</i>");
	}
	else if (lieveVenomEnabled())
	{
		output("<i>“Hey, [pc.name],”</i> Lieve beams, grabbing you by your [pc.hips] as you approach and pulling you into a fierce kiss that leaves you tingling with a sudden rush of chemical arousal. One of her hands brushes your cheek as she whispers, <i>“Good to see you.”</i>");
	
		output("\n\nAround her, Sierva and Mayren unsubtly shift to make themselves look more appealing for you, sitting with chests out and legs spread. After spending a moment firmly held in Lieve’s arms, you’re released and your lover asks, <i>“Need anything in particular? Or,”</i> she adds, smiling, <i>“did you just come to spend some time together?”</i>");
		
		imbibeVenomEffects();
	}
	else
	{
		output("<i>“Hey, [pc.name],”</i> Lieve beams, grabbing you by your [pc.hips] as you approach and pulling you into a tight hug. After a moment, she lets go and brushes one of her hands against your cheek as she whispers, <i>“Good to see you.”</i>");

		output("\n\nAround her, Sierva and Mayren unsubtly shift to make themselves look more appealing for you, sitting with chests out and legs spread. After spending a moment firmly held in Lieve’s arms, you’re released and your lover asks, <i>“Need anything in particular? Or,”</i> she adds, smiling, <i>“did you just come to spend some time together?”</i>");
	}

	processTime(10);

	lieveMenu();
}

public function lieveMenu():void
{
	// [Talk] [Sex] [Tour Town](1 time, fem PCs only) [Appearance]
	// [Trench Wives] [Try Venom // Kiss Her]
	clearMenu();
	addButton(0, "Talk", lieveTalkMenu, undefined, "Talk", "Lieve’s offering, so ask her a few questions.");
	addButton(1, "Sex", lieveSexEntry, undefined, "Sex", "See if Lieve’s got some steam to blow off. Even if not, looks like her harem girls are desperate for it.");
	addButton(2, "TrenchWives", lieveTalkToTrenchWives, undefined, "Talk To Trench Wives", "Ask Lieve if you can talk to her little harem for a bit.");

	if (!lieveVenomUsed())
	{
		if (!pc.isMasculine(true)) addButton(3, "TryVenom", lieveVenomToggle, undefined, "Try Venom", (flags["HAS_BEEN_MYR_VENOMED"] == undefined ? "You’ve heard amazing things about red myr venom. How about Lieve give you a taste of hers?" : "You’ve only dabbled with red myr venom. How about Lieve give you a taste of hers?"));
		else addDisabledButton(3, "TryVenom", "Try Venom", "Lieve is only really interested in feminine partners...");
	}
	else
	{
		if (hasFuckedLieveSolo()) addButton(3, "KissHer", lieveKissHer, undefined, "Kiss Her", "Pull Lieve in for a passionate, venom-filled kiss.");
		else addDisabledButton(3, "KissHer");
	}

	if (pc.isFeminine() && flags["LIEVE_TOWNTOUR"] == undefined && (pc.hasCock() || pc.hasVagina())) addButton(4, "Tour Town", lieveTourTheTown);
	else
	{
		if (flags["LIEVE_TOWNTOUR"] != undefined) addDisabledButton(4, "Tour Town", "Tour the Town", "Lieve’s already shown you around the town.");
		else addDisabledButton(4, "Tour Town", "Tour the Town", "Lieve probably isn’t all too interested in spending so much time with a dudely-dude.")
	}

	if (hasFuckedLieve()) addButton(5, "Appearance", lieveAppearance);
	else addDisabledButton(5, "Appearance");
	
	if (flags["FEDERATION_QUEST_CYPHER"] == 1) addButton(6, "Documents", lieveGiveDocs, undefined, "Documents", "Hand over those documents you found in the remnant’s radio tower.");
	
	if (lieveVenomEnabled()) addButton(10, "StopVenom", lieveDisableVenom, undefined, "Stop Venom", "Lieve assumes you are okay with her using her venom on you. You can ask her to stop using it so freely.");

	addButton(14, "Leave", mainGameMenu);
}

public function lieveDisableVenom():void
{
	clearOutput();
	lieveHeader();

	if (flags["VENOM_ADDICTION"] != undefined && flags["VENOM_ADDICTION"] >= 2)
	{
	output("You ask Lieve to go easy on the venom - your consumption has been getting out of hand.");
	}
	else
	{
	output("You ask Lieve to stop using her venom on you - you’d rather stay away from the stuff.");
	}

	output("\n\nShe shrugs. <i>“Sure.”</i>");

	lieveVenomCounterReset();
	flags["LIEVE_VENOM_ENABLED"] = undefined;

	processTime(2);
	lieveMenu();
}

public function lieveAppearance():void
{
	clearOutput();
	lieveHeader(false, true);

	output("Lieve Thyrsa is a prime example of a red myr woman. She stands at five feet seven inches, fairly average for her race, and sports a well-toned, athletic frame accented by distinctly feminine curves. You wouldn’t call Lieve muscular, but she carries herself with an unmistakable physicality. Like other myr, she has a pair of insectile antennas growing from her brow that twitch and turn seemingly of their own volition, always angling towards movement in her bunker.");
	
	output("\n\nHer limbs and digits are plated with dark red chitin, all of which is covered in dents, scars, and deep recesses where the plates have been cut or even shot. Lieve’s pale, cream-colored flesh isn’t in much better shape, once you get her out of her uniform: she has several long, deep scars lashed across her back, along with a pair of horizontal slashes across the left half of her belly, like some horrible beast dug its claws into her.");
	
	output("\n\nDespite the damage to her body, Lieve’s face is almost cutely feminine. She’s got small, rosy red lips beneath a cute little nose and a pair of big, black eyes. Her hair is cut short and spiky, left in a tousled muss atop her head. It’s been dyed a light lavender color, in stark contrast to her dark plates and eyes.");
	
	output("\n\nLieve’s sporting a pair of breasts a bit on the small side for her race, each a handful of C-cup tipped with a tiny pink nipple. Her teats are both pierced with a silver bar, and occasionally drip a bit of clear, amber honey to stain her fingers at a caress or pinch. She has slender, almost boyish hips that draw the eyes down to her crotch, and the bare, slick slit of a pink pussy between her plated legs.");
	
	output("\n\nLieve has a single, virginal asshole between her tight cheeks, right where it belongs.");
}

public function lieveTalkToTrenchWives():void
{
	clearOutput();
	lieveHeader();

	output("<i>“Mind if I ask the girls a few questions?”</i> you ask, fixing your gaze on the pair of nude gold myr fawning over Lieve.");
	
	output("\n\nTheir mistress shrugs mildly. <i>“Help yourself. Mayren, Sierva, tell [pc.himHer] whatever [pc.heShe] wants to know.”</i>");
	
	output("\n\n<i>“Of course,”</i> the raven-haired golden warrior says with a smile, taking a step nearer to you. Her more voluptuous companion giggles girlishly, leaning attentively towards you in a way that does magnificent things to her ample, honey-laden bust.");

	clearMenu();
	addButton(0, "Next", lieveTalkToTrenchWivesII);
}

public function lieveTalkToTrenchWivesII():void
{
	clearOutput();
	showName("SIERVA &\nMAYREN");
	showBust("SIERVA", "MAYREN");
	author("Savin");

	output("You’re talking to Sierva and Mayren, the two gold myr <i>“trench wives”</i> belonging to Scout Thyrsa.");
	
	output("\n\nSierva is a tall, chiseled woman with a physicality much like Lieve’s, suggesting soldiery in her past before becoming a harem girl. She has short, raven-dark hair cut just over her shoulders, and lips a natural honey-gold color. Her limbs are covered by black chitin and accented by golden stripes, culminating in a corset-like array of chitin plates that safeguard her chest, even her breasts. Her nipples poke out of a gap in the plates, underneath a long golden stripe. She has a small, insectile abdomen poking out of her back, tipped with a large, pink pussy.");
	
	output("\n\nMayren is, in contrast, much softer and curvier than the other myr girls. She has big, child-bearing hips and large breasts that might measure in at F- or even G-cups if she wore clothes. Her tits are swollen with nectar, which beads at her teats at the slightest brush or caress. An insectile abdomen pokes out from her waist, much larger than Sierva’s, and swollen thick with excess, honey-like fluid. Her sex is visibly agape, poking out of her abdomen in a wet gash that begs to be touched or fucked. Golden blonde hair falls past Mayren’s shoulders in thick, wavy locks, almost down to her waist.");

	lieveTrenchWivesMenu();
}

public function lieveTrenchWivesMenu():void
{
	clearMenu();
	addButton(0, "Sierva", lieveTalkToSierva);
	addButton(1, "Mayren", lieveTalkToMayren);
	if(flags["SIERVA_LATEGOODBYE_RESPONSE"] != LIEVE_LATEGOODBYE_COMPLETE && flags["LEARNED_IAYAS_FATE"] == 1) addButton(2,"Iaya",tellSiervaTheBadNews,undefined,"Iaya","Tell Sierva the bad news.");
	else if(flags["SIERVA_LATEGOODBYE_RESPONSE"] == LIEVE_LATEGOODBYE_COMPLETE) addDisabledButton(2,"Iaya","Iaya","You’ve already broken the news to Sierva.");
	else if(flags["SIERVA_LATEGOODBYE_RESPONSE"] == LIEVE_LATEGOODBYE_YES) addDisabledButton(2,"Iaya","Iaya","You don’t know about Iaya’s fate.");
	addButton(14, "Back", lieveMenu);
}

public function lieveTalkToSierva():void
{
	clearOutput();
	showName("\nSIERVA");
	showBust("SIERVA");
	author("Savin");

	flags["SIERVA_TALK"] = 1;

	output("<i>“Tell me about yourself, Sierva,”</i> you say, taking a seat across from the golden warrior woman.");
	
	output("\n\nThe question seems to take her aback, and it’s a long moment before she replies: <i>“I am... was, I suppose... a soldier.”</i> She straightens her back a bit, assuming a more rigid posture as she elaborates: <i>“4th Royal Infantry Battalion. Commanded by Queen Fyrena herself in the battle of Deep Springs. I was a captain, leading a company on the front lines through almost two years of constant fighting.”</i>");
	
	output("\n\n<i>“And before the war?”</i> you prompt.");
	
	output("\n\nAgain, your question seems to flummox her. Finally, she apologizes, running a hand through her dark hair. <i>“I’m sorry, I’m not used to talking about myself. It’s been so long...”</i>");
	
	output("\n\n<i>“It’s alright, Sierva. Go on,”</i> Lieve says, putting a hand on the golden girl’s shoulder.");
	
	output("\n\nYou blink at the surprisingly tender gesture before Sierva answers your query: <i>“Before, I was a teacher at a thollum - an academy for young girls, and one of the best in our province. I taught phys ed., coached a couple of junior sports teams for them. Best years of my life,”</i> she laughs dryly.");
	
	output("\n\n<i>“It was my second year there when the war broke out. Our province was near the frontlines, and we were evacuated early. Spent a while in shelters near Gildenmere in the early parts of the war, helping to take care of the girls. About three years ago, though, the queens made a big push for new recruits. We were running out of soldiers-”</i>");
	
	output("\n\n<i>“The war was turning against the Golds. Hard,”</i> Lieve adds. <i>“We’d started a big offensive in the north. Pushed miles into Gold territory inside a month. Lot of casualties.”</i>");
	
	output("\n\nSierva nods. <i>“I was conscripted just after the offensive. Thanks to my education, I was sent to officer’s school and, eventually, commissioned.”</i> She smiles proudly, if only for a moment.");
	
	output("\n\n<i>“So, how did you end up here?”</i> you ask.");
	if (pc.isNice()) output(" <i>“If you don’t mind me asking, that is.”</i>");
	
	output("\n\nSierva’s smile fades completely, replaced by a hurt look as she answers, <i>“I was wounded in action. Our battalion was supposed to take back a town from the Federation, a surface access town called Ferenze. The enemy was entrenched, though, and we walked into a solid wall of machinegun fire. I called a retreat when I realized the attack was hopeless, but took a round in the hip on the way back to our line. Ended up falling into a shell crater, left behind and bleeding out. I laid there for hours... the pain was incredible. Even if my troops realized they’d left me behind, there was nothing they could do to help with all those Federation guns aimed at them.”</i>");
	
	output("\n\n<i>“That night, though, Lieve found me. She was crawling through no-myr’s land to spot for artillery, and by chance happened to take cover in the crater I’d fallen into.”</i> Looking up to her captor with a smile, Sierva adds, <i>“She took pity on me. Dragged me back to a Federation aid station and ordered their medics to patch me up. Another hour, they said later, and I’d have bled out completely.”</i>");
	
	output("\n\nLieve finishes the story: <i>“My C.O. decided since I’d deigned to abandon my mission to save an enemy soldier, she’d be my responsibility. That’s how I ended up with my very first trench wife,”</i> she says, reaching down and grabbing one of Sierva’s breasts, forcing the golden girl out of her melancholy with a gasp of pleasure. They share a lustful smile before turning their attentions back to you.");

	processTime(25);

	lieveTrenchWivesMenu();
	addDisabledButton(0, "Sierva");
}

public function lieveTalkToMayren():void
{
	clearOutput();
	showName("\nMAYREN");
	showBust("MAYREN");
	author("Savin");

	output("You turn your attention to the buxom blonde at Lieve’s foot and ask, <i>“Tell me a little about yourself, Mayren.”</i>");
	
	output("\n\n<i>“I used to be an entertainer! One of the most popular acts in Gildenmere, before the war broke out,”</i> Mayren says proudly. You can hear the eagerness in Mayren’s voice as she tells you that she <i>“performed in front of two queens, even. I sang and danced, even acted in a few plays later on. It was amazing!”</i>");
	
	output("\n\n<i>“And then");
	if (silly) output(" war were declared");
	else output(" the war broke out");
	output(",”</i> Sierva says, putting a hand around Mayren’s shoulders and pulling the voluptuous ant close.");
	
	output("\n\nMay makes a little moaning sound and giggles as she’s squeezed into the warrior woman’s embrace. <i>“Pretty much. When the fighting started, my agent got me a gig entertaining the troops. They had me performing at bases, at the front lines, all sorts of new places. It was really exciting. All the girls wanted my autograph - and on these adorable dirty pictures of me, too! They were all so sweet...”</i>");
	
	output("\n\n<i>“Adorable. Right,”</i> Lieve laughs. <i>“I think what Mayren here means is that she was a Goldie pin-up model.”</i>");
	
	output("\n\nThe blonde girl nods enthusiastically. <i>“Getting to pose for artists and pictures was the most fun I’d ever had. Always getting me out of my clothes and telling me to hug up on fake bombs or rifles. There was one where I was sitting on a bullet case, leaning in on a big rifle up between my tits... my agent told me they were printing that picture more than field manuals for the troops!”</i>");
	
	output("\n\nSierva chuckles. <i>“I’ll admit, I had that picture. Gave me a lot of... comfort... out in the cold, dark trenches.”</i>");
	
	output("\n\nMayren beams and snuggles into Sierva’s shoulder. <i>“Of course... the war got tough later on. My agent got conscripted. My new agent said that if I didn’t want to have to fight, I’d have to join the Nurse Corps. I’m nowhere near smart enough to be a real doctor, but I could at least help, right?”</i>");
	
	output("\n\n<i>“How’d you end up with Lieve?”</i> you prompt.");
	
	output("\n\nMay looks up with adoration at her mistress as she tells you, <i>“They put me in an aid station near the front lines. It was nasty, bloody work. Horrible! I was only there for a little bit, though, before Lieve and her girls came and captured us. When the fight was over, a lot of her troops tried to gang up on me, but Lieve swooped in and saved me!”</i>");
	
	output("\n\n<i>“I think she just wanted you all to herself,”</i> Sierva laughs. The idea doesn’t seem to bother May a bit.");
	
	output("\n\n<i>“You don’t sound like you mind being a... trench wife,”</i> you say after a moment, when Mayren seems to be finished talking.");
	
	output("\n\nShe shrugs, <i>“It’s not so bad! Way better than all the scary pictures and movies back home made it sound. Like all the trench wives were just abused and treated horribly, but that’s not true. Lieve makes me feel </i>really good<i> all the time, and she even lets me sing and dance for the troops again! They’re red troops and trench wives now, though, but it’s way better than being a nurse!”</i>");
	
	output("\n\nThe way she’s getting worked up - and visibly aroused - you start to suspect she might have a stronger reaction to Lieve’s lust venom than her partner.");

	processTime(25);

	lieveTrenchWivesMenu();
	addDisabledButton(1, "Mayren");
}

public function lieveTalkMenu():void
{
	clearMenu();
	addButton(0, "NoMyrsLand", lieveTalkNoMansLand, undefined, "No Myr’s Land", "Ask for details about the stretch of territory outside Kressia: No Myr’s Land.");
	
	if (flags["LIEVE_TALK_NOMANSLAND"] != undefined) addButton(1, "FungalMyr", lieveTalkFungalMyr, undefined, "Fungal Myr", "Try and get more information about the fungus-infected myr.");
	else addDisabledButton(1, "FungalMyr");

	addButton(2, "The War", lieveTalkTheWar, undefined, "The War", "See if Lieve will tell you a little about the war, and her part in it.");

	if (hasFuckedLieveSolo() && flags["LIEVE_TALK_THEWAR"] != undefined) addButton(3, "Her Scars", lieveTalkScars, undefined, "Her Scars", "Ask Lieve about those brutal scars on her back.");
	else addDisabledButton(3, "Her Scars");

	if (flags["LIEVE_TALK_SCARS"] != undefined) addButton(4, "RedPrisoners?", lieveTalkRedPrisoners, undefined, "Red Prisoners?", "Push Lieve for more details about the prisoners.");
	else addDisabledButton(4, "Red Prisoners");

	if (flags["LIEVE_TALK_PRISONERS"] != undefined) addButton(5, "Myr Fertility", lieveTalkMyrFertility, undefined, "Myr Fertility", "Ask Lieve for more details about the state of Myr fertility.");
	else addDisabledButton(5, "Myr Fertility");

	addButton(6, "Trench Wives", lieveTalkTrenchWives, undefined, "Trench Wives", "Ask about Lieve’s harem, and Trench Wives in general.");

	addButton(7, "Fed.Army", lieveTalkFedArmy, undefined, "Federation Army", "Have Lieve tell you a little about the Scarlet Federation’s military.");
	
	//if has talked to Jim's Warmedic ant about "Her Past"
	if (flags["LIEVE_TALK_THEWAR"] != undefined && (flags["ANZHELA_HERPAST_TALK"] != undefined || CodexManager.hasViewedEntry("Red Myr"))) addButton(8, "Citizenship", lieveTalkCitizenship, undefined, "Citizenship", "Ask Lieve about Federal Citizenship. From what you understand, it’s very different from how the Confederate government handles things.");
	else addDisabledButton(8, "Citizenship");

	if (flags["NEVRIE_QUEST"] == 1 && flags["LIEVE_BLOOD_SAMPLE"] == undefined && !pc.hasKeyItem("Red Myr Blood"))
	{
		addButton(9, "BloodSample", lieveBloodSample, undefined, "Blood Sample", "Ask Lieve if you could get a sample of her blood for Nevrie.");
	}

	addButton(10, "Probe", lieveTalkProbe, undefined, "Steele Tech Probe", "Lieve’s a scout, right? Maybe she knows something about where your dad’s probe ended up.");
	
	addButton(14, "Back", lieveMenu);
}

public function lieveTalkNoMansLand():void
{
	clearOutput();
	lieveHeader();

	flags["LIEVE_TALK_NOMANSLAND"] = 1;

	output("<i>“Tell me a little about No Myr’s Land,”</i> you prompt. <i>“That’s why they’ve got you out here, right?”</i>");
	
	output("\n\n<i>“To keep you off-worlders from blundering out there blindly, anyway,”</i> she answers, adding with a mischievous wink: <i>“Apparently it’s bad PR if too many of you step on landmines or something.”</i>");
	
	// Encountered landmines
	if (flags["ENCOUNTERED_LANDMINES"] == undefined) output("\n\nYou blink. <i>“Landmines?”</i>");
	else output("\n\n<i>“I’ve noticed a few already,”</i> you grumble.");
	
	output("\n\nShe nods. <i>“We can’t use artillery down here, Steele. Both sides decided to make up for it by mining the space between the front lines, making it hell for the other to advance. There’s gold myr explosive mines, and our venom vapor ones out there. Either one can ruin your day if you’re not careful. If you haven’t already, go in town and see if you can buy a minesweeper. Cunning little device that picks ‘em up before you step on them. Saved my life more than once.”</i>");
	
	output("\n\n<i>“They’re not the worst things you’ll find out there, though,”</i> Lieve adds, inviting you to sit down. You do so as Lieve continues talking. Her voice shifts from the guarded friendliness she normally shows you to a more authoritative pitch, as if she’s talking to one of her subordinates. You imagine she’s given this speech several times before.");
	
	output("\n\n<i>“Ever since the cease-fire, we’ve gotten plenty of deep dwelling creatures coming back to the surface caves. Most are interested in looting the equipment and supplies left in No Myr’s, others in capturing our patrols or offworlder explorers for... breeding.”</i> Her brow twitches ever so slightly. <i>“The most common threat you’ll face out there are the nyrea. Like us red myr, they’re a warrior race, and damn good at it.”</i>");
	
	output("\n\nShe gives a wry chuckle at that. <i>“We’ve been fighting the nyrea for years up north. They’re more common there, more organized. Here in the heartlands, though, you’ll mostly be fighting lone huntresses");
	if (pc.isMasculine(true)) output(" keen on stealing your sperm");
	else output(" that want to borrow your ass or womb to lay their eggs in");
	output(".”</i>");
	
	output("\n\n<i>“You’ve fought the nyrea before?”</i> you ask.");
	
	output("\n\nLieve nods. <i>“Before the war, Federation troops were mainly fighting off nyrea raids. Back in our territory, the nyrea have a few fairly large city-states. One particularly ambitious queen even tried to form a nyrean country, though that failed spectacularly. Some even decided to join the Federation when it formed - we’ve got a few scout companies of mixed myr and nyrea. The ones that can take their minds off fucking for long enough to be useful, anyway.”</i>");
	
	output("\n\n<i>“Speaking of minds full of fucking, you’ll want to keep clear of any myr - of any color - you find out there. The ones that aren’t deserters looking to steal from you are likely to be infested with the myrmedius fungus. I don’t know what it would do to an offworlder, but to myr, it drives us mad with lust. Infected victims can be unpredictable, and will try to force themselves on you. They’re not particularly physically strong, but can still get the better of you if you aren’t careful.”</i>");
	
	output("\n\nYou ask how to recognize an infected myr, to which Lieve answers, <i>“You’ll see them, believe me. They’re surrounded by spore clouds, and the fungus grows all over them. It’s... not pleasant to look at.”</i>");
	
	output("\n\n<i>“Anything else I should be aware of?”</i>");
	
	output("\n\n<i>“There are other creatures out there, but the nyrea and fungal myr are the most common in No Myrs’s. If you go down in the deep caves, you’ll start seeing wetraxxal and creatures made of a living goo called the ganrael. Any of them can be bad news. Stay clear of them if you can. If not, well, I hope you’re as tough as you look.”</i>");

	processTime(10 + rand(5));
	
	lieveTalkMenu();
	addDisabledButton(0, "NoMansLand");
}

public function lieveTalkFungalMyr():void
{
	clearOutput();
	lieveHeader();

	output("<i>“Tell me about this... myrmedius fungus.”</i>");
	
	output("\n\nLieve shifts uncomfortably at the request, adjusting the collar of her uniform coat. <i>“It’s a parasitic fungus that infects us myr, fuses to our nervous system and can alter our thoughts. It can cause lust-madness, forcing the victim to try and rampantly fuck anyone she can get her hands on. I’ve only ever seen one girl infected with it, and we had to flush her out of the camp. She’d tried to force herself on three privates, all in public. By the time the base guards got there, she was running around the parade ground begging anybody she could get her hands on to fuck her. She was crying the whole time, completely desperate. The poor thing must have been humiliated, but she couldn’t help herself.”</i>");
	
	output("\n\nThat sounds awful.");
	
	output("\n\n<i>“It is,”</i> Lieve says, matter-of-factly. <i>“But it’s not fatal, and it’s not contagious once the initial lust-madness fades. Most of the girls that get it can come back into society after a week or so, though most are kept under medical watch for a while. Once the infection is complete, it’s no longer visible, and the girl’s mind returns to her. It’s hard to get back to normal after you’ve... embarrassed yourself like most victims do, but Command makes allowances for them, finds new jobs for them if needed. Most find themselves well-suited to prostitution, thanks to their libidos, but that’s not always the case.”</i>");
	
	output("\n\nYou nod your understanding, but you can’t help but add, <i>“You seem to know a lot about this fungus.”</i>");
	
	output("\n\nShe shifts again, juggling her weight from one foot to the other. <i>“Of course. We’re all briefed about what to look for, what to avoid. Especially scouts, since our job is to go out alone or in small groups into the caves. We’re especially vulnerable to them because of that, as well as to other monster attacks. The fungus is smart enough not to try and grab a soldier out of a column of fifty or sixty troops, but a lone scout? Well...”</i>");
	
	output("\n\n<i>“Has one ever tried to infect you?”</i> you ask, curious.");
	
	output("\n\nLieve blanches. <i>“Me? No, no. I carried phosphorous grenades to disperse fungus clouds if they ever got close. Doesn’t kill them, but drives them off in a hurry. It’s a trick we figured out early in the war - they’re not native where we reds come from, just here in goldie territory.”</i>");
	
	output("\n\nYou get the distinct feeling Lieve’s not telling you something, but you leave it at that for now.");

	processTime(10 + rand(5));
	
	lieveTalkMenu();
	addDisabledButton(1, "FungalMyr");
}

public function lieveTalkCitizenship():void
{
	clearOutput();
	lieveHeader();

	output("You ask Lieve if she’d be willing to tell you a little more about the Scarlet Federation’s concept of <i>“citizenship.”</i> From what you’ve heard, it’s very different from being a Confederate citizen, or the citizen of a planet elsewhere in the galaxy, where your citizenship is determined at birth.");

	output("\n\nLieve has a half-smile the entire time you’re talking, drinking up the details of your government and society you divulge with an eager curiosity. When you’re finished, she answers immediately: <i>“No, you’re right. The word means something entirely different for you off-worlders... and for golds... than it does to a red myr. I’m not exactly rated as a Moral Philosophy teacher, but I can try and explain if you’d like. That’s why I’m here, after all.”</i>");

	output("\n\nGiving her an encouraging nod, you ask Lieve to do her best.");

	output("\n\n<i>“I’ll try,”</i> she says with a wink. <i>“Right. The first thing to understand is that nobody is <i>born</i> a citizen of the Federation. Not even the children of the High Commanders. The Scarlet Federation was originally founded by warriors, veterans from our unification wars and the conflict with the nyrea queens around us. The early years were hard, and we survived and stayed together because good people made hard decisions. The Federation doesn’t have the luxury of assured safety and prosperity, and we couldn’t afford to let petty grievances and political machinations get in the way of survival. So the idea of veteran leadership took hold: the idea that the people most qualified to lead us were the people that had fought and bled to bring us together - the people that risked life and limb already for the safety of the Federation.”</i>");

	output("\n\nYou nod slowly. <i>“Wouldn’t that"); 
	if (pc.isBimbo()) output(", like,");
	output(" make your government pretty militaristic?”</i> you ask.");

	output("\n\nLieve smirks. <i>“That’s what the Republic would tell you. But the idea’s the opposite: if you’ve seen combat, you’re going to be the last person in the world to order more girls into the fire unless it’s absolutely necessary. You don’t get to make decisions in the Federation until you’ve proven that you’re willing to lay your life on the line, just like any of the troopers whose lives are in your hands.”</i>");

	output("\n\nThat makes sense, you suppose. Though you have to wonder how the Federation government would work in peace time. Just because you’re a veteran doesn’t mean you’re a capable politician, does it?");

	output("\n\n<i>“I hope we’ll find out someday,”</i> Lieve sighs, leaning against the bunker wall. <i>“Even outside of total war, the Federation’s been in some sort of conflict pretty much constantly. Our homeland’s a rough, unforgiving place, and we’ve always been surrounded by enemies. But this war... I hope it will be the last. Through victory, peace.");
	//if war is still on
	if (9999 == 9999) 
	{
		output(" Or through diplomacy, if we veterans have anything to say about it.”</i>");

		output("\n\n<i>“Oh?”</i> you ask. <i>“What do you mean?”</i>");

		output("\n\n<i>“Between you and me,”</i> Lieve says, giving her captive gold audience a stern look, <i>“rumor has it that High Command is going to issue a referendum on the war soon. With the cease fire looking like it could drag on indefinitely, I think we all just want this to end. If it comes to a vote, the question will be do we re-issue our declaration of war, or do we relent and accept peace? And if we pursue peace, what kind will it be? I think High Command will try and make the Republic a client state, like the nyrean city-states near our territory, but with the star-walkers looming over us... I don’t know. The Republic might squeak out intact in that case, but I’m not sure the Federal government - or its citizens - will settle for that after near total victory. Especially after so much loss to get here.”</i>");

		output("\n\nHeavy stuff. You wonder how the vote will go...");
	}
	else output("”</i>");

	processTime(10 + rand(5));
	lieveTalkMenu();
	addDisabledButton(8, "Citizenship");
}

public function lieveTalkTheWar():void
{
	clearOutput();
	lieveHeader();

	flags["LIEVE_TALK_THEWAR"] = 1;

	output("<i>“What can you tell me about the war?”</i> you ask.");
	if (pc.isNice()) output(" <i>“If you don’t mind me asking.”</i>");
	
	output("\n\nLieve sighs and scratches her head, just under one of her antennae. <i>“I can tell you you’d be better off asking one of my commanders. Colonel Nehzara loves briefing offworlders, I’m sure.”</i>");
	
	output("\n\nThat may be so, but you’d still like to hear Lieve’s take on things. She grunts at the prompting, rolling her eyes. <i>“Alright, alright. What do you want to know?”</i>");
	
	output("\n\n<i>“Let’s start with how it began.”</i>");
	
	output("\n\n<i>“We’ve been in conflict with the golds for generations. You need to understand that. They thought we were rogue hives they could push around, and we pushed back every time. But they were always small things: a few shots across the border, a few cargo ships raided. It was bad, but not </i>war<i> bad. Finally, the golds forced our hand,”</i> Lieve says, quickly replacing her hesitance on the topic with vitriol. <i>“They were testing new military aircraft, flew ‘em right into our territory. Our air corps intercepted them, tried to escort them back to neutral territory. Instead, the goldies opened fire, turned it into the first full-on dogfight in Myrellion’s history. Right over a populated city, too. If that’s not a declaration of war, I don’t know what is.”</i>");
	
	output("\n\nYou cock an eye at that. <i>“The golds just attacked you? Out of the blue like that?”</i>");
	
	output("\n\nShe shrugs. <i>“I guess. They say it was a mistake, but you don’t fly a squadron that far out of your territory for no reason. Not in your fancy new fighter planes, and not in spitting distance of one of our airbases. They wanted a fight, and we gave them one.”</i>");
	
	output("\n\nA quick glance down shows both of Lieve’s wives seem to be chafing at her comments, but they clearly know better than to speak up about it.");
	
	output("\n\n<i>“Federation and the Republic were at war inside a week. We came down on the golds like a hammer - harder than they could have ever expected. Their bases on our continent didn’t know what hit them. It’s been seven years of pushing over the northern deserts, across the ocean, and into the tunnels since then.”</i>");
	
	output("\n\nSeven years. Must have been brutal - most of the wars you hear about in U.G.C. space don’t last a year. Too costly by far. After a moment’s thought, you ask, <i>“When did you join the military?”</i>");
	
	output("\n\n<i>“Four years ago,”</i> Lieve answers, the venom fading from her speech just as easily as it came. <i>“I wasn’t old enough to sign up for Federal service when the fighting started. Didn’t stop me from trying to help, though. After the war went hot, just about every girl in Federation territory signed up for physical fitness, survival training, anything we could get to toughen us up until it was our turn to enlist. I joined a martial arts school, and pulled shifts in a munitions factory in the city whenever I could.”</i>");
	
	output("\n\n<i>“In the city?”</i> you ask. The way she says it makes it sound almost foreign to her.");
	
	output("\n\nShe nods, and you could swear you can see a bit of blush creep into her cheeks as she answers, <i>“I didn’t grow up in a city. My parents had a fungus farm, deep underground. Not big enough to be one of High Command’s breadbaskets, but we did what we could. Any, uh, anyway, when it was my year, I enlisted as soon as I could.”</i>");
	
	output("\n\nAll the red myr sounded eager to fight, the way Lieve describes it. You ask her if everyone in the Federation jumped at the chance to fight like she did.");
	
	output("\n\n<i>“Most did, yeah. We’re not like the golds, Steele - they barely had a proper military when the war started, had to draft year after year. In the Federation,");
	if (silly) output(" service guarantees citizenship");
	else output(" you can only get full citizenship and the right to vote through military service");
	output(". Even in peacetime, serving is a sacred duty for most myr, at least for a few years. We lived in a much, much rougher part of the world than the golds did, always under threat from monsters coming down from the north. When the war kicked off, the Federation had plenty of veteran soldiers ready to lead the vanguard, and more volunteers than it could handle.”</i>");
	
	output("\n\n<i>“And the war went well for you?”</i>");
	
	output("\n\nLieve grins proudly. <i>“It did. As you might have guessed from us sitting in Kressia, a golden city, just outside the gold capital. There were rough spots, of course. Especially when the golds went for chemical weapons - nobody was prepared for that. Bad couple of years since then, but we still pushed on. They put up a good fight, but once we managed to land on the continent, well, there wasn’t much they could do to stop us.”</i>");
	
	output("\n\n");
	if (pc.isMischievous()) output("You can’t suppress a mischievous smirk as you ask, ");
	output("<i>“What </i>did<i> stop you, then?”</i>");
	
	output("\n\nLieve’s grin twists into a scowl. <i>“You offworlders showing up for one thing! The war would be over if your ships had just showed up a day later.”</i>");
	
	output("\n\n<i>“We’d all be dead, too, Lieve,”</i> Sierva adds, earning a sharp look from her mistress.");
	
	output("\n\nLieve grumbles something under her breath, but admits, <i>“Yeah, that too. But it would be the Federation left standing in the end: you may have gotten nukes, too, but even then you wouldn’t have been able to get them across the ocean.”</i>");
	
	output("\n\nSierva shrugs at that, and Lieve adds, <i>“She’s right, though. High Command was going to drill nukes into Gildenmere. It would have been... bad... but High Command says we’d lose fewer troops that way than trying a ground assault.”</i>");
	
	output("\n\n<i>“I’m glad you space-people came to save us!”</i> Mayren adds with a dopey smile. Lieve just rolls her eyes.");

	processTime(20 + rand(10));
	
	lieveTalkMenu();
	addDisabledButton(2, "The War");
}

public function lieveTalkScars():void
{
	clearOutput();
	lieveHeader();

	flags["LIEVE_TALK_SCARS"] = 1;

	output("<i>“If you don’t mind my asking, how did you get all those scars?”</i> you ask, slipping around your lover’s side to stroke your hand along her back. She tenses at your question, and even more at your touch.");
	
	output("\n\n<i>“Is it rude to ask people... personal questions like that?”</i> Lieve asks, brushing your hands away. <i>“Among your people, I mean.”</i>");
	
	output("\n\nYou muse on that for a moment, letting your hands drop down to Lieve’s waist as you say, <i>“Not among lovers, no...”</i>");
	
	output("\n\nShe grumbles, but doesn’t step away from you again this time. After a few moments her hands find yours, lacing her fingers with yours. <i>“Alright, alright... girls, why don’t you go shopping or something, huh? Here,”</i> she adds, pulling a small coin purse out of her coat and handing it to Mayren. The busty gold girl giggles delightedly and takes Sierva’s hand, leading her companion away and out of the bunker.");
	
	output("\n\nWhen they’re gone, Lieve lets her longcoat slip off her shoulders, then turning back to face you, starts to unbutton her shirt. Slowly, she begins to speak: <i>“You want to know where my scars came from? I’m surprised you had to ask. Not many places a trooper can get cut up like I did.”</i>");
	
	output("\n\n");
	if (pc.characterClass != GLOBAL.CLASS_MERCENARY) output("Hesitantly, you say that you’re not as experienced with war as Lieve and her people.");
	else output("You nod slowly, but ask her to tell you the story - if she’s up to it.");
	
	output("\n\nLieve seems to think about it for a long moment before pulling her shirt off, revealing the small, pert mounds of her breasts and her flat, tight belly. Your eyes are instantly drawn to the pair of raking scars across her midriff, looking more like a pair of beast’s claws rent her nearly in half than a war wound.");
	
	output("\n\nShe turns around, showing you her back and planting her hands on her hips. Her back is an intricate network of scars, crossing in cruel patterns over each other. Compared to her normally pale, almost albino skin, Lieve’s scars are dark patches of winding vermillion. Her spine presses out against the taut flesh, prominent against her plateless torso. You plant a hand in the small of her back, caressing the rough skin and drawing close to your lover.");
	
	output("\n\n<i>“You know, for a lot of us red myr, scars are a badge of honor,”</i> Lieve starts, a little more quietly than before. <i>“Go out and ask any of the guards outside to show off their scars, and they’ll be happy to show ‘em off.”</i>");
	
	output("\n\n<i>“But not you?”</i>");
	
	output("\n\nLieve sighs. <i>“Not me. At least, not for those scars. A little over a year ago, I pulled spotter duty. Nothing out of the ordinary - one of the most important things us scouts do is carry radios into No Myr’s Land and spot for artillery. That’s how I met Sierva, even. Dangerous work, and exhausting, but it makes our cannons a hell of a lot more effective. Worth every sweaty, filthy day of curling up in a crater hoping the shells don’t fall just a little bit short and blow me to pieces.”</i>");
	
	output("\n\n<i>“It was the tenth time I’d played spotter, back when the fighting was about fifty miles back east. Everything was going fine until I crawled into a ditch... that happened to have a trap door in it.”</i>");
	
	output("\n\nLieve laughs and shakes her head. <i>“What’re the fucking odds? Of all the craters, ditches, and trenches I could have taken cover in, I’d land right on top of a Republic command bunker. Fell straight through the ceiling and onto their map table. There was about a full second of just stunned silence all around before somebody had the bright idea to rifle butt me.”</i> To illustrate her point, Lieve slaps the heel of her hand into her forehead, right to where you can see a very small, almost unnoticeable scar.");
	
	output("\n\n<i>“The goldies were already getting desperate by then. We’d pushed them across the ocean, deep into the heartlands. Even their filthy gas couldn’t stop us, they realized. So some of them went a little darker. They wanted - needed - to know how our troops were spread out. Where we’d hidden our artillery batteries and supply depots. How to hit us hardest, in other words. As you might expect, I wasn’t inclined to tell them.”</i>");
	
	output("\n\nOh.");
	
	output("\n\n<i>“I ended up in a prisoner camp. Golds don’t believe in trench wives, see - they just shove their P.O.W.s into camps with barely enough food and clothes, maybe some tents or shacks if you’re lucky. They herded us around like hysean slugs, staring down from watch towers full of machine guns and floodlights. It was cold, cramped, and full of sickness. If that wasn’t bad enough, Republic Intelligence would make the rounds every few days. Us officers would get dragged off, one after the other, to answer questions.”</i>");
	
	output("\n\nLieve shivers involuntarily, and you find yourself holding her a little closer as a result. <i>“Let’s just say the camp commander was very fond of whips. She had a whole collection she’d parade you through before...”</i>");
	
	output("\n\nYou get the picture.");
	
	output("\n\n<i>“You asked,”</i> Lieve says, forcing herself to smile as she slips out of your arms.");

	processTime(20 + rand(10));
	
	lieveTalkMenu();
	addDisabledButton(3, "Her Scars");
}

public function lieveTalkRedPrisoners():void
{
	clearOutput();
	lieveHeader();

	flags["LIEVE_TALK_PRISONERS"] = 1;

	output("You have to ask, if the supposedly peace-loving gold myr would resort to something like that, what do the reds do to their prisoners?");
	
	output("\n\nLieve scowls at the implication, but keeps her words more measured than her countenance would suggest. <i>“I can’t speak for everyone, everywhere, Steele. But we don’t do things the way the Republic does. Their government, the damn queens, demonize us. Turn the Federation into a horde of slavering barbarians intent on raping their women and stealing their men. We’re not people to them. It doesn’t matter what they do to us: poison gas, torture, anything they can think up to stave off the inevitable. It’s sick.”</i>");
	
	output("\n\nA moment passes in silence before her harsh scowl fades into an exhausted sigh. <i>“The gold myr we capture are warriors - worthy of respect, even if they failed. They become our wards, like May and Sierva are to me. If we need to learn something from a prisoner, our venom can get it as surely as a torturer can. It’s not painful. Just the opposite");
	if (lieveVenomUsed()) output(", as you well know");
	output(". By the time we’re through, they’re begging to tell us anything we want to know in exchange for release. We found out early in the war that venom’s good for more than just fun in the sack.”</i>");
	
	output("\n\nYou’ve noticed something listening to Lieve, and with her trench wives out for the moment, you don’t mind saying, <i>“The way you talk, you never blame the golds. Only the Republic?”</i>");
	
	output("\n\nLieve gives you a knowing look as she pulls her shirt back on. <i>“Do you think I’d keep trench wives if I blamed them for everything the Republic’s done? For the war? You can’t blame the soldiers for the decisions of the state, Steele. Every gold myr I’ve ever seen is an unwilling conscript. They hate the war. And if even their own daughters’ hearts aren’t behind them, what does that make the gold queens? Desperate tyrants, the lot of them. If I had my way, when we roll into Gildenmere we’d put the queens against the wall and leave again. Let the golds build something better in their place.”</i>");
	
	output("\n\nHarsh.");
	if (CodexManager.entryViewed("Gold Myr"))
	{
		output(" Still, you have to point out, <i>“Don’t the golds need their queens to reproduce? There wouldn’t be much of a race left if you killed all their breeders.”</i>");
	
		output("\n\nLieve scoffs. <i>“Not every gold breeder can be a queen. Most of them never see a drone in their lives - how would they know? ");
		if (pc.hasCock()) 
		{
			output(" Sierva mentioned she’s never seen a dick before yours. She might very well be a goldie breeder just waiting for her chance.");

			output("\n\n<i>“And Mayren?”</i>");
	
			output("\n\n<i>“Ha. The day I believe May’s not found a drone to shack up with is the day my plates turn green.”</i>");
	
			output("\n\nMust be a local expression, you guess. Lieve continues: <i>“");
		}
		output("Besides, you offworlders are here now. I’ve heard stories about what your medicine can do. Amazing things from the troops that took your fleet’s offer for medical help. A lot of the girls think you might be the cure for our... fertility problems.”</i>");
	
		if (pc.hasCock() && pc.isMischievous())
		{
			output("\n\nYou pull Lieve close again, grinning. <i>“I’ll solve your fertility, alright.”</i>");
		
			output("\n\n<i>“Not YOU, you... you ");
			if (pc.tallness > 73) output(" big");
			else if (pc.tallness < 61) output(" little");
			output(" idiot,”</i> she laughs, planting a kiss on your lips.");
		}
	}
	
	output("\n\nAs she’s finishing, you hear a light knock coming from the bunker’s door. Turning, you see May and Sierva poking their heads in, arms full of shopping bags. <i>“Can we come back yet?”</i> Mayren asks, her eyes as big as a puppy’s.");
	
	output("\n\n<i>“Yeah. I think we were just finishing up,”</i> Lieve says, waving them in. <i>“Unless Steele has more questions?”</i>");

	processTime(30 + rand(15));
	
	//Unlock "Myr Fertility" talk
	lieveTalkMenu();
	addDisabledButton(4, "Red Prisoners?");
}

public function lieveTalkMyrFertility():void
{
	clearOutput();
	lieveHeader();

	output("<i>“You mentioned fertility problems?”</i> you say, looking between the three girls at hand. Despite Lieve’s hardness and Sierva’s slender figure, all of them look like perfect candidates for motherhood by any human standard.");
	
	output("\n\n<i>“I did,”</i> Lieve answers, eyeing you in a way you can’t quite analyze thanks to her black, solid eyes. <i>“Well, problem might be an exaggeration. Or would be, if there hadn’t been a war. I’m not a statistician, but I know enough about breeding to say both the Federation and the Republic are in trouble, even if the war stays nice and cold for a few generations.”</i>");
	
	output("\n\nYou cock an eyebrow. <i>“Then what’s the issue?”</i>");
	
	output("\n\nTo your surprise, it’s Mayren who speaks up, looking very put out: <i>“We’re infertile! Well, most myr are. Some of us golds can breed a whole bunch and become queens...”</i>");
	
	output("\n\n<i>“And a little less than half of us reds can lay a few eggs,”</i> Lieve finishes. <i>“Plus only one in ten myr are men, on either side. Both the Federation and the Republic have lost more breeders than we’ve gained in the fighting. Even if we don’t glass ourselves, and you offworlders don’t decide to step on us all from on high, we might just die out anyway. Hell of a sendoff that’ll be.”</i>");
	
	output("\n\nYou grimace at Lieve’s sudden grimness. <i>“And how are we offworlders supposed to help, exactly?”</i>");
	
	output("\n\nIn answer, Lieve jabs a finger at your Codex. <i>“I’ve seen a few aliens with devices like that. Computers. You know, we’ve got computers too. They’re the size of warehouses, and take hours to do anything. You’ve got weapons that could crack our planet in half and send us all gasping into space. Airplanes that can travel between worlds where ours can’t make it across the ocean without a carrier.”</i>");
	
	output("\n\nYou guess she means starships, but hey.");
	
	output("\n\n<i>“And your medicine? When the... ow-soor... right?”</i>");
	
	output("\n\n<i>“Ausar,”</i> you correct when you realize it’s not a translator error, but Lieve actually trying to pronounce the word.");
	
	output("\n\n<i>“When the ausar fleet showed up in orbit, their medics offered to help a lot of our wounded. The troops we sent up came back with robotic parts in place of missing limbs, wounds healed that our best doctors would have called fatal. A few shipments of medicine has almost completely wiped out the thraadi flu. You can even change your bodies, swapping parts around like it’s nothing!”</i>");
	
	output("\n\nIt’s hardly nothing, but you get her point. <i>“You think we can make you all fertile?”</i>");
	
	output("\n\n<i>“You could do a lot more than that. Imagine if every girl had a male if she wanted one, if every woman could bear children. We could do more than rebuild, we could </i>flourish<i>! What if this war was nothing more than a bump in the road, not us teetering on the edge of extinction? My people, the Federation, would do anything for that. I swear, if whatever government is out there for you aliens would do that for us, you’d have the staunchest allies you could ever imagine.”</i>");
	
	output("\n\nYou don’t think you’ve ever seen Lieve this impassioned, even when making love. You go to put a reassuring hand on her shoulder, but she intercepts it, grabbing your hand in hers. <i>“Work with us, Steele. Give us a generation to recover. Your diplomats say they want that, right? Cooperation? If they’d </i>cooperate<i> with the Federation, we could be right out there beside you in the galaxy. Your shield and your hammer, if you’d have us.”</i>");
	
	output("\n\n");
	if (pc.isNice()) output("You can’t imagine the Confederacy uplifting a race just to be soldiers, but the offer is so passionate that you can’t help but appreciate the offer.");
	else if (pc.isMischievous()) output("It’s hard to refuse an offer like that! You could certainly picture a few uses for your own army of ant amazons. Maybe you ought to talk to Steele Tech about some... relief efforts? Corporate could probably write it off on their taxes.");
	else output("Now that’s an offer that’s hard to refuse. Whoever helps the red myr first would be a force to be reckoned with in a generation.");
	output(" Smiling, you turn to your insectile lover and tell her, <i>“Maybe you should have been the Federation ambassador.”</i>");
	
	output("\n\nLieve laughs at that. Good, honest, humor written across her features. <i>“I’m sure Colonel Nehzara would be thrilled to trade places with me, too, even if they bumped her back down to buck private.”</i>");
	
	output("\n\nSharing her smile, you ask if she’d take the post, given the chance. That makes her think for a second. <i>“I think I would, yes. If it would help my people, I’d take Nehzara’s spot in a heartbeat. Not that anybody’s offering me, though. I’m just a poor farm girl who barely made it to officer. High Command doesn’t even know I exist.”</i>");

	if (flags["LIEVE_TALK_MYRFERTILITY"] == undefined)
	{
		flags["LIEVE_TALK_MYRFERTILITY"] = 1;
		output("\n\n<i>“And where do the gold myr fit into this future of yours, exactly?”</i> Sierva asks, looking up to her mistress with a playful glint in her eye.");
		
		output("\n\nLieve answers by grabbing the gold warrior’s ass, making her gasp pleasurably. <i>“Heh, if we get to go out to the stars, fuck it, you can have this dry dirtball of a planet. But honestly... if we ever could hammer out a peace treaty, I don’t see why you couldn’t come along for the ride. I’m sure our alien friends would love all your art and music and... whatever.”</i>");
		
		output("\n\nMay and Sierva giggle at that, and let the topic slide.");
	}
	
	processTime(15 + rand(7));

	lieveTalkMenu();
	addDisabledButton(5, "Myr Fertility");
}

public function lieveTalkTrenchWives():void
{
	clearOutput();
	lieveHeader();

	output("<i>“Tell me about these two,”</i> you prompt, nodding to the gold myr girls clinging to Lieve. <i>“How does a red myr soldier end up with a couple of gold girls hanging on her like that?”</i>");
	
	output("\n\n<i>“With my winning personality, mostly,”</i> Lieve chuckles, running her hand through one of the girls’ hair. <i>“Well, and winning the war, too.”</i>");
	
	output("\n\nYou urge Lieve on, and she most happily obliges. <i>“Trench wives are prisoners of war. We’ve taken more prisoners than we could ever possibly deal with over the last seven years. Thousands and thousands of deserters we’ve picked up, wounded we’ve pulled out of No Myr’s Land, and more surrendered soldiers than we could stuff into camps even if we wanted to. But P.O.W.s have to go somewhere, right?”</i>");
	
	output("\n\n<i>“Somewhere being your bed?”</i>");
	
	output("\n\nLieve flashes you a slight twitch of a smile. <i>“That’s the idea. High Command doesn’t have the resources to deal with so many prisoners even if they wanted to. We’d have half the army relegated to guard duty that way, not to mention the food, space, shelter. From what I’ve heard, they realized the problem was going to be catastrophic before the first year of the war was over. So officers started telling their troops to keep prisoners for themselves, like in ancient days. To the victor goes the spoils, right?”</i>");
	
	output("\n\nThat’s certainly one way to look at it.");
	if (pc.isNice()) output(" Though it is somewhat... primitive.");
	else if (pc.isMischievous()) output(" It certainly seems to be working out for Lieve.");
	else output(" One you can certainly respect.");
	
	if (pc.isNice()) output("\n\nLieve smirks. <i>“It’s not exactly barbaric. We take care of them, and in return, they take care of our needs. It’s a lot better than the alternatives.”</i>");
	
	output("\n\n<i>“It could be worse,”</i> Sierva says, reclining against the wall. <i>“I’d rather be at home, well fed and wrapped up in my robes and a warm bed... but anything’s better than dead.”</i>");
	
	output("\n\nMay pipes up, adding, <i>“Or fighting! I’d rather eat pussy all day long than have to get shot at all the time.”</i>");
	
	output("\n\nLieve snickers and ruffles the honeypot’s golden hair.");
	if (pc.IQ() >= 33) output(" You’re not sure if it’s honest affection between the three of them, or the lingering addiction to myr venom that makes the two gold myr respond that way.");
	
	output("\n\n<i>“And how does one acquire a harem like this?”</i> you ask, nodding towards the golden girls at Lieve’s feet.");
	
	output("\n\n<i>“Oh, a little violence, a little luck...”</i> Lieve grins, patting the hatchet slung on her hip. <i>“Every harem’s different. Some are awarded by officers to particularly brave or heroic soldiers; others are accumulated over time. Capture an enemy officer here, lead the charge on an enemy base there, maybe find a wounded beauty dying in a foxhole.”</i>");
	
	output("\n\nShe flashes Sierva a little smile.");
	
	processTime(10 + rand(5));

	lieveTalkMenu();
	addDisabledButton(6, "Trench Wives");
}

public function lieveTalkFedArmy():void
{
	clearOutput();
	lieveHeader();

	output("You ask Lieve to tell you a little bit about the Federation’s military. After all, that seems to be the organization that you’re primarily interacting with here in Kressia.");
	
	output("\n\n<i>“I’d say it’s like any other army, but I don’t exactly know how you aliens do it. Aside from the whole trucking into orbit like you own the place - that was surprisingly familiar. But, uh, really we’re fairly simple in structure. Just like the civilian government, we’re all ultimately answerable to High Command. That’s a group of generals that we veterans elect to run the Federation, make all the important decisions. Under them, we’ve got the individual armies and the generals who don’t rate getting on the High Command board. We’re broken up into... you weren’t asking about our organizational structure, were you?”</i>");
	
	output("\n\nYou confess that you were more interested in the more intimate details.");
	
	output("\n\n<i>“Well,”</i> Lieve says. <i>“Let’s start with the basics. We train for a period of six weeks, twelve if you’re selected to be an officer or specialist like a radioman or a minesweeper. Basic training is almost all about discipline: making sure we know how to follow orders, how to stay calm under fire and keep your wits about you. That discipline is more important than even fighting skill, when you get right down to it. Federation troops don’t panic when the shells start flying, or when the enemy comes up out of their trenches. The girls we’ve recruited the last few years are even trained for gas and chemical attacks.”</i>");
	
	output("\n\n<i>“I’m sure that doesn’t seem like much to you off-worlders, but there’s a hell of a difference between a Federation soldier who’s been drilled to perfection and a gold who’s just been conscripted and had a rifle shoved in her hands for the first time ten minutes before they throw her over the top. There’s nothing more important than discipline, training, and experience for surviving in the trenches when you’re getting shot at and shelled for weeks on end. Basic can give you two of them, at least.”</i>");
	
	output("\n\nCurious, you ask if there’s much more to Federation service than fighting in the trenches.");
	
	output("\n\n<i>“Depends on your aptitudes,”</i> Lieve answers with a shrug. <i>“Girls with technical aptitude, good typists, scientists, anybody with useful skills usually get selected for special service. An army needs a lot of pencil pushers, and there’s thousands of girls working in R&D. We weren’t the first to get nukes by chance, you know. Of course, the position everybody wants these days is to be a fly girl with the air corps. Most of us had never seen the surface before the war, and now we’re sending hundreds of troops into the sky. One step closer to having ourselves a space corps, just like you offworlders.”</i>");

	processTime(10 + rand(5));
	
	lieveTalkMenu();
	addDisabledButton(7, "Fed.Army");
}

public function lieveTalkProbe():void
{
	clearOutput();
	lieveHeader();
	author("Neoptolemus");
	
	output("<i>“I’m looking for an offworld probe that crash landed somewhere around here.”</i> You explain to her. <i>“Have you or any of the other scouts seen anything like that out in the tunnels?”</i>");
	
	output("\n\nLieve considers this for a moment. <i>“My unit certainly hasn’t recovered any offworld artifacts, but there was something...”</i> she trails off and turns around to rifle through a bag lying against the bunker wall. A moment later Lieve straightens back up and unfolds a battered map. You can’t make out most of it, but from the general area and the mass of scribbled annotations, you guess that the Myr scouts use it to record their discoveries in the caverns. <i>“There we go, just before the ceasefire there was some sort of explosion west of here.”</i>");
	
	output("\n\n<i>“Command was worried the Golds had come up with some kind of new secret weapon.”</i> She grimaces. <i>“Sounds stupid now, but after the poison gas, we were all nervous about that. Anyway, we did some reconnaissance there. Something had punched down through a couple of layers of caverns, but other than that there wasn’t much to see.”</i>");
	
	output("\n\nYou nod encouragingly, this could be what you’re looking for. Those probes certainly looked like they were designed to take a heavy beating.");
	
	output("\n\n<i>“If you really want to check it out for yourself, head south west of here, you’ll find a ledge you can rappel down to reach the deep caverns. But you want to be prepared. Bad as it out there,”</i> Lieve points towards the unoccupied tunnels that stretch away outside the pillbox. <i>“It’s even worse in the deep caverns.”</i>");
	
	processTime(10 + rand(5));
	lieveTalkMenu();
	addDisabledButton(10, "Probe");
}


public function lieveVenomToggle():void
{
	clearOutput();
	lieveHeader();

	output("Taking a step closer to Lieve, you ask what she thinks about using her venom on other people.");
	
	output("\n\n<i>“Well,”</i> she says, crossing her arms, <i>“Most of us reds like to think that’s pretty intimate. Two lovers becoming addicted to each other - literally - and completely reliant on each other. Not to mention the overwhelming pleasure, even in a casual encounter. It’s not like you build up an immunity to our venom, you understand. It’s not like most drugs... just the opposite.”</i>");
	
	output("\n\nAs she’s speaking, Lieve curls her lips open and licks one of her canines, revealing a little bridge of pink-tinted saliva coating her teeth, ready to set your body on fire. <i>“The more venom you get, the more it affects you. After a few years, just a few drops can turn you into an orgasming wreck on the floor, completely insensate.”</i>");
	
	output("\n\nYou shiver just thinking about it.");
	
	output("\n\n<i>“So, Steele... were you trying to say you wanted a taste?”</i>");
	
	output("\n\nYou steel your courage and say that you do. Lieve just smiles, and steps a little closer. You shudder by reflex as one of her black-plated hands brushes your cheek.");
	
	output("\n\n<i>“You do... what?”</i>");
	
	output("\n\nA second passes in silence as your mind scrambles for an answer. <i>“I do... please?”</i>");
	
	output("\n\nLieve winks at you. <i>“Much better,”</i> she purrs, cupping your chin and angling your face to hers. Your eyes flutter closed as the seductive red myr leans in and presses her lips to yours in an open-mouthed kiss. You accept it with a moan, opening your [pc.lips] to admit Lieve’s tongue. You feel a touch of fire on your cheeks as the myr girl’s alien saliva trickles onto your [pc.tongue].");
	
	output("\n\nYour heart flutters, and you realize that your cheeks are flushing. You pull Lieve in close by the front of her uniform, kissing her more passionately. Your [pc.crotch] flush");
	if (pc.getListLength() <= 1) output("es");
	output(" with heat, spreading all through your body. Lust burns through you, making you melt into Lieve’s arms. You’ve never wanted the perky amazon more than you do right now....");
	
	output("\n\n<i>“You look like you’re feeling good,”</i> Lieve teases, breaking the kiss. <i>“Now, what to do with you...”</i>");

	pc.changeLust(50);
	flags["LIEVE_VENOM_USED"] = 1;
	
	processTime(30 + rand(10));
	imbibeVenomEffects();
	lieveVenomCounterInc();
	//Sex Menu here.
	lieveSexMenu(true);
}

public function lieveKissHer():void
{
	clearOutput();
	lieveHeader();

	output("You slip up into Lieve’s arms, leaning");
	if (pc.tallness < 61) output(" up");
	else if (pc.tallness > 73) output(" down");
	else output(" in");
	output(" to look her square in the eye. She cocks an eyebrow at you, until your hands reach out to her waist and pull the svelte warrior flush against you. You smile at the feeling of her breasts against you, pressing against your [pc.chest] through the thick fabric of her uniform.");
	
	output("\n\n<i>“Hey there, beautiful,”</i> she laughs, closing the gap to kiss you. You accept it with a moan, opening your [pc.lips] to admit Lieve’s tongue. You feel a touch of fire on your cheeks as the myr girl’s alien saliva trickles onto your [pc.tongue].");
	
	output("\n\nYour heart flutters, cheeks flushing. You pull Lieve in close by the front of her uniform, kissing her more passionately. Your [pc.crotch] flush");
	if (pc.getListLength() <= 1) output("es");
	output(" with heat, spreading all through your body. Lust burns through you, making you melt into Lieve’s arms. Now that’s the stuff...");
	
	output("\n\n<i>“Get everything you needed, Steele?”</i> Lieve asks, caressing your cheek. When you nod, she smiles and adds, <i>“Now, what’re you going to do to burn off all that extra lust, hmm?”</i>");

	flags["LIEVE_VENOM_USED"]++;
	imbibeVenomEffects();
	lieveVenomCounterInc();
	//Sex menu here
	lieveSexMenu(true);
	processTime(3 + rand(2));
}

public function lieveSexEntry():void
{
	clearOutput();
	lieveHeader();

	if (!hasFuckedLieve())
	{
		output("Lieve and her girls seem quite friendly, and the display of bare bosoms and the sexy, hungry looks of her harem has you burning up under the collar. After a moment’s hesitation, you take a step forward and ask if she’s up for it.");

		if (pc.isMasculine()) output("\n\nAfter a moment’s thought, Lieve flashes you a slight smile and says, <i>“I think we can do that. Go on, girls, I know you’ve been wanting to sink your teeth into him since you saw him.”</i>");
		else output("\n\n<i>“I thought you’d never ask,”</i> Lieve answers with a big grin. <i>“Just toss your gear aside and relax, [pc.name]. My girls and I will take good care of you...”</i>");
	}
	else
	{
		if (pc.isMasculine())
		{
			output("<i>“Sure! The girls have been looking forward to more after that last time, haven’t they?”</i> she says, teasing the antenna of a golden-haired slut.");
			
			output("\n\n<i>“We sure have,”</i> Mayren coos, crawling towards you.");
			
			output("\n\nBehind her, Sierva takes a long-legged stride towards you and murmurs, <i>“Just relax, [pc.name]. Let me and Mayren take care of you...”</i>");
		}
		else output("\n\n<i>“I suppose I can spare you a few minutes,”</i> Lieve teases, chewing her lip as she looks you over, eyes lingering over your [pc.chest] and [pc.hips]. <i>“Why don’t you go ahead and get her nice and ready for me, girls?”</i>");
	}

	output("\n\nYou stand still, letting the amorous golden ants crawl all over you, lavishing you with caresses and tender teases, slowly stripping you of your [pc.gear]. You shiver as lips and tongues brush across your bare [pc.skinFurScales] as the two girls work to leave you nude and thoroughly aroused for their mistress’s inspection.");
	
	output("\n\n<i>“Much better,”</i> Lieve grins");
	if (pc.isFeminine()) output(", stepping up and brushing a chitinous hand over your [pc.thigh]");
	output(".");

	// [Fuck Harem] [Lieve Solo] [Lieve Bodyworship]
	lieveSexMenu();
	processTime(20 + rand(10));
}

public function lieveSexMenu(tempVenomEnabled:Boolean = false):void
{
	clearMenu();
	if (pc.hasVagina()) addButton(0, "Fuck Harem", lieveFuckHarem, tempVenomEnabled, "Fuck Harem", "Take the harem babes up on their implicit offer and join Lieve in fucking them senseless.");
	else if (pc.hasCock()) addButton(0, "Fuck Harem", lieveFuckHaremDickVersion, tempVenomEnabled, "Fuck Harem", "Take the harem babes up on their implicit offer and join Lieve in fucking them senseless.");
	else addDisabledButton(0, "Fuck Harem", "Fuck Harem", "Take the harem babes up on their implicit offer and join Lieve in fucking them senseless. (Requires some form of genitalia)");

	if (pc.isMasculine()) addButton(1, "Lieve Solo", lieveSoloTurnsDownDudes, undefined, "Lieve Solo", "Get Lieve by herself for some fun. No harem, just the two of you...");
	else addButton(1, "Lieve Solo", lieveSoloFucktime, tempVenomEnabled, "Lieve Solo", "Get Lieve by herself for some fun. No harem, just the two of you...");

	if (pc.isFeminine() && (lieveVenomEnabled() || tempVenomEnabled)) addButton(2, "Bodyworship", lieveBodyWorship, undefined, "Worship Lieve’s Body", "Let Lieve hop you up on a nice, heavy dose of her lusty venom and then lavish the red myr’s chiseled body with your " + pc.tongueDescript() + ".");
}

public function lieveFuckHarem(tempVenomEnabled:Boolean = false):void
{
	clearOutput();
	lieveHeader(true);

	hasFuckedLieve(true);
	hasFuckedTrenchWives(true);

	output("You relax under the ministrations of the three lusty ant-girls, their hands playing and teasing all over your bare body, carrying away your equipment. The two goldens ease you down onto one of the stools scattered around the bunker, spreading your [pc.legs] nice and wide, one of them on either side of you. You shiver as their long tongues flick out, caressing your [pc.skinFurScales] all the way up your thighs. As they work, the girls’ mistress slips down behind them, running her hands along the chitinous backs of their insectile abdomens. Lieve flashes you a wink and a grin as her hands tenderly stroke their way down the girls’ backs, and then disappear behind them.");
	
	output("\n\nMayren and Sierva gasp in unison, dark eyes going wide for a second before they both make a low moaning sound, and start to lick you faster. Lieve moves her arms in a rhythmic pattern, pushing in against the girls hard enough to make their whole bodies lean into you, dragging their nectar-laden breasts up along your [pc.legs]. A little finger-pushing from Lieve quickly has the pair of gold myr slaves buried between your [pc.legs], their mouths close enough to your [pc.cunt] that you can feel their breath hot and heavy against the folds of your sex.");
	
	output("\n\n<i>“Me first,”</i> Mayren coos, her tongue slithering out to tease along the boundaries of your mons.");
	
	output("\n\nThe other gold huffs, <i>“Always so greedy!”</i> Sierva presses in, heedless of her partner’s insistence, kissing along the inside of your thigh and running a pair of fingers up towards your slit.");
	
	output("\n\nIt doesn’t take much for the girls to start squabbling over the right to taste you first, until Lieve breaks them up with a full-fist penetration into their abdominal cunts that has them both screaming in surprise and overwhelming pleasure. May grunts and shifts up, straddling the other trench-wife’s back and crawling up your body, pressing you against the cold, hard concrete as her sister digs into your cooch.");
	
	output("\n\n<i>“I’ll just have to play with these lips,”</i> May giggles, putting a chitinous finger to your [pc.lips] while she moves closer towards you, eventually pulling herself up to sit in your lap.");
	
	output("\n\nThe other gold grunts in frustration, suddenly finding Mayren’s abdomen planted atop her head like a hat, spreading her antenna apart. Their mistress chuckles, popping her fist out of the lusty gold’s back-mounted pussy and slipping down onto all fours behind Sierva, lifting up the golden warrior’s hind-end and bringing her pussy to her lips. Sier shudders and gasps as her mistress’s lips meet her sex, and the red myr’s pink-tinted saliva touches her already-eager channel.");
	
	output("\n\n<i>“Pass this on to [pc.name],”</i> Lieve laughs, her tongue slipping deep into Sierva’s slit. The slave girl does as she’s told, putting her gold lips to your [pc.pussy] and letting her tongue play out, straight between your own lower lips. You can’t hold back a muted gasp of pleasure, and find your hands digging into Mayren’s ample backside, squeezing the other slave girl’s butt until she squeals.");
	
	output("\n\n<i>“You like it?”</i> she murmurs into your ear, wiggling her hips in your lap.");
	
	output("\n\nYou start to answer her, but the moment you open your mouth, she quickly presses up against you in a tongue-filled kiss, making sure both your mouth and pussy are nice and full of myr-tongue. Your tension melts away under her affections, and you relax against the wall, wrapping your arms tighter around Mayren’s waist.");
	
	output("\n\n<i>“I thought so,”</i> she teases, reaching back to put her hands on yours. May leans back in your lap, inadvertently pressing Sierva’s head further down as she does so - and brings her huge, overflowing breasts level with your mouth. <i>“Now drink up, okay? I’ve got soooo much saved up!”</i>");
	
	output("\n\n<i>“That girl could feed an army,”</i> Lieve adds, pulling herself up from Sierva’s twat just long enough to slap May on the ass, making the bubbly blonde giggle. <i>“Hell, she probably did!”</i>");
	
	output("\n\nMay gives her mistress a playful wink and turns back to you, whispering, <i>“Well, only a few platoons... and a few officers. Well, a lot of officers.”</i> She titters and licks her lips, cupping her breasts as one of her gilded nipples pokes against your [pc.lips]. You open up and accept the saucer-like teat into your mouth, wrapping your lips around as much of her tit as you can and starting to gently suckle, drawing out the first trickle of myr nectar with ease.");
	
	output("\n\nWhen in Rome, right?");
	
	output("\n\nThe golden babe’s honey is wonderfully sweet and thick, though not at all viscous like a");
	if (flags["TIMES_MET_FEMZIL"] == undefined) output(" bee’s");
	else output(" zil’s");
	output(" is. It goes down easily, and every time you swallow, there’s another hot mouthful waiting to fill your cheeks again, just as quick as you can down the sugary nectar. The taste is as pleasant as you’d expect, somewhere between maple syrup and honey, yet still distinct in its own way. Mayren’s back arches as you drink from her, pleasured moans escaping her lips as your tongue and [pc.lips] gingerly work her teat.");
	
	output("\n\nAs you feed from the honey-pot ant, you struggle not to mirror her lusty moans and gasps of pleasure. Sierva’s tongue drills into you, licking with ever-increasing abandon. You can feel the gold warrior’s breath growing heavier and faster as she’s consumed with chemical lust, courtesy of her red myr mistress. Lieve’s as buried into her wife as Sierva is into you, squeezing the myr’s abdomen and circling her tongue around the wide, wet pussy on offer. Her aphrodisiac venom works wonders on Sierva, bringing the gold ant’s lusts to a head in a hurry. Sierva groans and sighs into your muff, licking faster and deeper, desperately eating out your pussy, driven wild by desire.");
	
	output("\n\nYou’re starting to think you might cum just from Sierva’s ministrations. Then again, considering the way both the gold myr girls are moaning, they aren’t far behind. Even Mayren, whose only pleasure is coming from your suckling from her and her hands playing across her buxom titflesh, seems to be taking an ordinate amount of pleasure from feeding you her nigh-boundless nectar. She only stops long enough to switch you from one breast to the other, urging you to keep her reserves of nectar nice and even: <i>“I’d hate to walk away lopsided!”</i>");
	
	output("\n\n<i>“Don’t worry, May,”</i> Lieve laughs, pulling herself up from Sierva’s pussy and shifting on her knees to position herself behind the honeypot’s honeypot. <i>“I’ll make sure you won’t be walking for a good long while.”</i>");
	
	output("\n\nMayren shivers with anticipation, chest heaving against your face as Lieve pulls her abdomen up and level with her mouth. The ant-girl yelps and her eyes roll back as her mistress’s attentions fall onto her abdominal cunt, and the lusty-inducing spit trickles directly into her sex. Nectar surges into your mouth, faster and more forceful than ever before. You struggle to keep up with your candy-sweet meal, swallowing as fast as you can until your stomach");
	if (!pc.isPregnant()) output(" looks positively pregnant with Mayren’s nectar");
	else output(" looks even more pregnant, thanks to the over-flowing bounty of Mayren’s nectar");
	output("!");
	
	output("\n\nIt isn’t long before both gold ants are overcome with chemical lust, desperately grinding and licking at you in search of release. You’re close, too - close enough to pop your lips off of Mayren’s tits and pull the lusty ant down into a kiss, letting her taste her nectar still hot on your [pc.lips]. You let yourself succumb to bliss with them, wrapping your [pc.legs] around Sierva’s");
	if (pc.isNaga()) output(" body");
	else output(" shoulders");
	output(" and your arms around Mayren, pulling the trench-wives close as they work in tandem for your pleasure.");
	
	output("\n\nYour cries of pleasure are drowned out in May’s golden lips, muffled as her tongue pushes into you, teasing and playing across your own. You wrap your lips around her tongue, and your pussylips around Sierva’s. Orgasm hits you moments later, slamming into you like a hammer and making you scream, voice echoing off the stark bunker walls. Sier’s tongue squirms inside you like a tentacle, finding your most sensitive spots with unerring accuracy and keeping you awash in sensation for what seems like an eternity of ecstasy. Your hips buck against her face and your hands dig into May’s plush little ass, loving every second of the golden babes being all over you until you’ve ridden out your orgasm and are left panting, slumped against the wall.");
	
	output("\n\nEven when you’re finished, the girls don’t relent. Mayren nuzzles against you in such a way to make her huge tits squeeze against your [pc.chest], tight enough to make her still-stiff teats drool onto your [pc.belly], trickling nectar down onto your [pc.skinFurScales]. It takes a moment for you to realize she’s still gasping and moaning, voice catching as shockwaves of pleasure course through her at the beck and call of Lieve’s tongue, buried deep in Mayren’s cunt. The gold myr’s skin is burning red with lust, and her eyelids seem to grow heavier by the minute - if her lips weren’t busy kissing and licking at your [pc.chest], you’re afraid the drugs working through her are so strong she might drool.");
	
	output("\n\n<i>“I think she likes you,”</i> Sierva chuckles, pulling herself out from between your [pc.legs] and smacking May’s behind. The squirming ant-girl just makes a mewling moan and wiggles her hips in your lap.");
	
	output("\n\nLieve laughs, grabbing Sier’s shoulder and pulling her back down and into Mayren’s pussy. <i>“Take over for me, will you? I’ve got to tend to our new friend.”</i>");
	
	output("\n\n<i>“Yes ma’am,”</i> Sierva says, pulling the lusty honey ant off your lap and into her arms. The two tumble off into a sixty nine as their mistress shifts to sit");
	if (!pc.isNaga()) output(" between your spread legs");
	else output(" on one of your serpentine coils");
	output(", licking her lips at the fem-cum-splattered sight of you. <i>“I love the look of a");
	if (pc.isFeminine()) output(" girl");
	else output(" girl... uh, guy...");
	output(" who’s enjoyed [pc.himHer]self. Like what my girls can do?”</i>");
	
	output("\n\nYou nod dumbly, still breathing hard from your climax.");
	
	output("\n\n<i>“Good,”</i> Lieve purrs, crawling up your sweat-sheened body and seating herself on your lap. You shiver as her chitin-clad limbs brush dangerously close to your [pc.cunt], and her plated fingers slip around your shoulder. Her other hand cups one of her small, perky breasts, pinching one of her crimson nipples between her digits. <i>“Now... I’d ask if you want me to show you what </i>I<i> can do, but we both know the answer to that.”</i>");
	
	output("\n\nAs she speaks, Lieve’s fingers massage her breast, making her back arch with pleasure. Her other arm slips lower, teasing all the way down to the small of your back. She crosses one leg over the other, letting the lower of the two rest of Mayren’s upraised ass as she whispers into your [pc.ear]: <i>“");
	
	var ppMayren:PregnancyPlaceholder = new PregnancyPlaceholder();
	ppMayren.breastRows[0].breastRatingRaw = 15;
	ppMayren.breastRows[0].breasts = 2;
	ppMayren.milkType = GLOBAL.FLUID_TYPE_NECTAR;
	ppMayren.milkMultiplier = 100;
	ppMayren.milkFullness = 100;
	pc.milkInMouth(ppMayren);
	
	if (!lieveVenomEnabled() && !tempVenomEnabled)
	{
		output("The real question is if you want the full package.”</i> As if to emphasize her point, Lieve leans in and plants a kiss on the nape of your neck, letting her tongue play across your [pc.skin] until you shiver with sensation, her aphrodisiac venom seeping into you. <i>“...Or do I need to hold back? It’s alright, nobody would think less of you if you didn’t want a big, strong ant to turn you into a screaming, blubbering bag of lust... just putty in my hands, cumming again and again and again.”</i>");
	
		output("\n\nThough she’s teasing you, Lieve doesn’t make a move until you answer.");
		
		clearMenu();
		addButton(0, "Venom Fuck", lieveVenomFuck, tempVenomEnabled, "Venom Fuck", "Tell Lieve you want her to use every tool at her disposal.");
		addButton(1, "No Venom", lieveNoVenomFuck, undefined, "No Venom", "You’d rather not have your body flooded with myr venom.");
		return;
	}
	else
	{
		output("You wanted my venom, Steele... I hope you’re ready for it. I’m going to enjoy watching you squirm and moan for hours.”</i>");
		clearMenu();
		addButton(0, "Next", lieveVenomFuck, tempVenomEnabled);
	}
	
	processTime(60 + rand(15));
}

public function lieveVenomFuck(tempVenomEnabled:Boolean = false):void
{
	clearOutput();
	lieveHeader(true);

	if (!lieveVenomEnabled())
	{
		output("You nod to Lieve, telling her you want to experience the same euphoria as her wives. She smiles at you, and you suddenly find yourself with a beautiful ant-girl straddling you, arms wrapping around your neck.");
		
		output("\n\n<i>“Just be thankful </i>you<i> have a choice,”</i> Lieve murmurs, nodding towards her wives’ writhing bodies at her side.");
	}
	else
	{
		output("You moan as the familiar burn of Lieve’s venom spreads through your neck. Slowly but surely, the ant-girl slips around overtop you, shifting to straddle your waist. You find yourself pinned to the wall with a beautiful ant-girl wrapping her arms around your neck, a pale pink trickle of envenomed saliva already cresting her rosy lips.");
		
		output("\n\n<i>“Just remember, you always had a choice,”</i> she whispers, ever so slightly nodding to the writhing bodies of her wives beside you.");
	}

	output("\n\nLieve smiles at you, licking her lips before leaning in and pressing them to yours, locking you in a tongue-filled kiss that quickly has your body burning with desire. You moan, relaxing utterly in your lover’s grasp, suddenly and completely aware of every subtle touch, every hair on your body. Lieve’s breath is hot against your [pc.skinFurScales], billowing across your nose in cascading waves: that alone is enough to make you shiver. You can feel your own orgasmic juices, mixing with Sierva’s saliva, drooling out of your well-eaten gash, and your whole body convulses with the incredible sensation of the afterglow, suddenly a thousand times more potent.");
	
	output("\n\nInstinctively, you move a hand down to your [pc.cunt], eager to fuck yourself out of the heady cocktail of aphrodisiacs starting to work their way down. Lieve catches your wrist, pulling you back and pinning your arm to the wall. She breaks the kiss and tsks her tongue at you, flicking a little more of her druggy spittle back onto your cheeks.");
	
	output("\n\n<i>“Sier, take this for a moment?”</i> she grins, handing your hand off to one of her wives. The gold myr doesn’t look up, just extends one of her four arms back and laces her fingers with yours, a more gentle and affectionate restraint than you expected. A moment passes in slow agony, letting you grow more desperate for sensation - any sexual touch to set you off. Your other hand traces across Lieve’s neck, chest, down to her breast, cupping one of the perky mounds in an effort to spur her on.");
	
	output("\n\n<i>“That’s just an appetizer,”</i> Lieve laughs, brushing your hand aside, guiding it down to her hip. She gives you a lascivious wink and slips down off your lap, down between your [pc.legs], stopping just long enough to make one long lick across each of your [pc.nipples].");
	
	output("\n\nYou groan as she teases you, a few meager touches enough to make your whole chest burn. It’s a force of will not to squirm and writhe in desperation; instead, you clutch Sierva’s hand tight and urge your red myr lover down with the other, running your hand through her pink-dyed hair and stroking one of her insectile antennae.");
	
	output("\n\nYou hear a voice begging Lieve to fuck you, to thrust her tongue deep into your [pc.cunt]. It takes a long moment for you to recognize the slurring voice as your own.");
	
	output("\n\nLieve smiles up at you, planting her plated fingers on your thighs and spreading you nice and wide for her inspection. <i>“I see my girls did a good job down here,”</i> she teases, one of her fingers caressing the tender flesh leading up to your groin. Just the feeling of her finger sliding up your thigh sends you into another orgasm");
	if(pc.hasClit()) output(", every inch of your body easily as sensitive as your [pc.clit] ever could be");
	output(". You scream and dig your hands into your lovers, holding tight as Lieve teases you through a second climax.");
	
	output("\n\n<i>“I guess I forgot, you’re not as used to my venom as the girls are,”</i> your red myr lover laughs, her lone finger still tracing up to the lips of your [pc.cunt]. You thought it was intense before, but God, the sensation of Lieve’s fingertip flicking your lip sends pleasure crashing through you in waves so strong you think you’ll faint.");
	
	output("\n\n<i>“Fuck,”</i> you manage to groan, body going limp.");
	
	output("\n\nWith a wink, Lieve");
	if(pc.hasClit()) output(" circles her finger around your [pc.clit], just far enough");
	else output(" presses her fingers around your labia with just enough pressure");
	output(" to keep you from going completely insane from overwhelming pleasure. <i>“Like my venom?”</i> she asks, sliding her finger in between your pussylips.");
	
	output("\n\nYou shriek out something that Lieve takes as a <i>“yes,”</i> and you feel two more fingers join the first, plunging into your twat.");
	
	output("\n\n<i>“Finish yourselves off again, girls,”</i> Lieve commands. <i>“I think our friend here needs a few more womens’ touches.”</i>");
	
	output("\n\nYou’re not sure of the trench wives answer an affirmative, or just join you in pleasured cries. You don’t see what they do more than a few moments after, as you’re quickly finding your eyes too heavy to keep open. They flutter closed, and your [pc.legs] squeeze tight around Lieve’s shoulders, drawing her further into your spasming cunt. You can feel the drooling rivers of fem-cum rolling down your thighs, squirting out of your slit as Lieve vigorously fingers you.");
	
	output("\n\nTime escapes you when eight more hands join Lieve’s, wandering all over your body, teasing your over-sensitive flesh. Several of them rub and caress your [pc.breasts], while others rub your thighs, neck, and lips. You feel the familiar sensation of Mayren’s honeypot tits pressing against your face, and Sierva’s tongue running dangerously close to your pussy. Lieve’s tongue joins her, slipping into your slit. Slow as she goes, you can feel her working her way deep into you, lacing the insides of your sex with her aphrodisiac saliva. The drug burns in you like a sexual wildfire, and you lose count of how many times you orgasm before she’s fully buried between your [pc.legs]. All you can do is writhe and moan, letting the ant-girls bring you to climax again and again and again until your mind’s a blank, completely given over to physical impulse.");

	processTime(200 + rand(40));
	clearMenu();
	if (!lieveVenomEnabled() && !tempVenomEnabled) lieveVenomCounterInc();
	addButton(0, "Next", lieveVenomFuckII);
}

public function lieveVenomFuckII(tempVenomEnabled:Boolean = false):void
{
	clearOutput();
	lieveHeader(true);

	//Drain Energy to 0, inflict lust venom debuff.
	output("<b>You have no idea how much time passes...</b>");
	
	output("\n\nYou don’t know if you’ve ever cum so much, but by the time Lieve is done with you, you feel like a hollow husk, completely drained of energy. You moan, your body unresponsive to your mental commands as you come to. Lethargy overwhelms you, and ant-girls caress and snuggle against you. It’s an effort to move yourself to sit up, and look over the intertwined bodies of Lieve and her wives. Your skin still burns with the red myr’s lust-drug, but the mind-numbing pleasure has abated somewhat, at least.");
	
	output("\n\nLieve looks lazily up at you, and runs a hand across your [pc.hip]. <i>“You leaving us?”</i> she murmurs, rolling onto her back and stretching, almost feline-like. You nod slowly, and she gives you a slight little smile. <i>“Take it easy for a bit, alright? ");
	//if LieveVenom off:
	if(!lieveVenomEnabled()) output("You’re still not used to my venom, after all. ");
	output("Give yourself some time to recover.”</i>");
	
	output("\n\nYou promise that you will, as you untangle yourself from her wives’ many arms. You grab your gear and head out, leaving Lieve to wake her gold myr brides back up.");

	processTime(30 + rand(10));
	
	pc.energyRaw = 0;
	
	for (var i:int = 0; i < 4; i++)
	{
		pc.orgasm();
	}
	
	flags["HAS_BEEN_MYR_VENOMED"] = 1;
	imbibeVenomEffects();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function lieveNoVenomFuck():void
{
	clearOutput();
	lieveHeader(true);

	output("<i>“No venom,”</i> you murmur back, slipping an arm around your myr lover’s waist. The slight pull of your arm stirs her to action, and Lieve flips herself to straddle you, wrapping her own chitinous arms around your neck.");
	
	output("\n\n<i>“Have it your way, Steele,”</i> she says in mock disappointment. She runs her thumb under her lip, wiping away a little trickle of pink, venomous saliva. She extends her hand, and one of her wives dutifully laps the extra drug up, moaning as she suckles on Lieve’s thumb before returning to eating out her partner.");
	
	output("\n\nWith her hand cleansed, Lieve slips it down between your bodies");
	if(pc.hasClit()) output(", teasing her fingertips around the bud of your [pc.clit]");
	output(". In turn, you lace your arms around her, pulling her a little closer until her small breasts are wonderfully near to your lips. She doesn’t seem to mind when you reach out and kiss one of them, teasing the stiff peak with your [pc.tongue], but when you try and suckle from her, Lieve roughly pushes you back against the wall, tsking her tongue and driving her fingers deep into your sex.");
	
	output("\n\n<i>“Ask a girl, first!”</i> she scowls, holding you firmly against the wall. <i>“I’m not a honeypot just waiting to drip nectar for you, Steele.”</i>");
	
	output("\n\nYou apologize, a bit taken aback by the sudden rebuke. Seeing you confused, Lieve softens, and whistles to get her wives’ attention. <i>“Mayren, I believe our friend here’s desperate for another drink. Why don’t you girls finish yourselves off again and come over here?”</i>");
	
	output("\n\nThe girls moan lustily, mouths still buried in each others’ abdomens, and Lieve returns her attention to you. The hand not teasing around your [pc.cunt] makes its way to your [pc.breast],");
	if (pc.biggestTitSize() >= 2) output(" cupping and");
	output(" squeezing your nipple between her thumb and forefinger until you suck in a sharp breath of pleasured pain");
	if (pc.isLactating()) output(" and a trickle of [pc.milk] squirts out over Lieve’s hand. So much for asking");
	output(". Succumbing to Lieve’s pincer attack on your tender flesh, you find yourself moaning like a whore, grinding your hips against her hand and letting your hands rove all across her body, grabbing breasts and caressing hips at random.");
	
	output("\n\nYour voice is joined by ecstatic moans and orgasmic screams from the floor beside you - Sierva and Mayren seem to be enjoying each other’s bodies and Lieve’s venom. As their orgasms pass, Lieve calls their attentions again, and soon enough you have a pair of lusty ant-girls crawling up to you and joining their mistress in tending to your needs. Mayren’s breast returns to your face, letting you get another taste of the delicious nectar of hers - though after a few mouthfuls, you’re starting to think you might be getting a contact high of venom through her breasts as your cheeks redden and your breath quickens.");
	
	output("\n\nDown below, you shiver as Sierva’s tongue resumes its place at the lips of your twat, slipping in under Lieve’s fingers. You try not to cry out under the sudden doubling of sensation, but you can’t stop your [pc.legs] from squirming around Sierva’s shoulders, squeezing the gold myr warrior tight - and pulling her closer, all the better to eat you out. Seeing what you’re about, Lieve laughs and reaches back to stroke her wife’s head and drives her other fingers into you to the hilt, searching through your channel for tender spots to caress.");
	
	output("\n\nWith three myr working tirelessly for your pleasure, you don’t have a prayer to hold back. They quickly have you screaming your orgasm out around a mouthful of honeypot tit, but never let up through your climax, and just keep going, fucking your limp and exhausted body straight on towards another orgasm, and another.");

	processTime(30 + rand(10));
	
	clearMenu();
	addButton(0, "Next", lieveNoVenomFuckII);
}

public function lieveNoVenomFuckII():void
{
	clearOutput();
	lieveHeader(true);

	output("<b>You lose track of time...</b>");
	
	output("\n\nYou’re nothing but putty in their hands by the time the ant-girls are done with you, barely able to feel your extremities as orgasms wrack your body again and again. You’ve consumed so much of Mayren’s nectar that your belly seems");
	if (!pc.isPregnant()) output(" positively pregnant");
	else output(" even more swollen than before");
	output(". Finally having burned through their dose of Lieve’s venom, the pair of trench wives are curled up around you, locking their plated limbs around your shoulders and waist, breasts pressing tight against you.");
	
	output("\n\nYou can’t remember when they pulled you off the stool, or when you ended up with your face buried between Lieve’s legs, but you can still taste the red myr’s sex on your [pc.lips], a warm and sultry flavor that clings stickily to you. Your head’s resting in the red mistress’s lap, her chitinous fingers stroking your [pc.hair].");
	
	output("\n\nSeeing you stirring, Lieve smiles down at you, saying <i>“I think my girls got a little overzealous, don’t you?”</i>");
	
	output("\n\nYou");
	if (pc.isNice()) output(" laugh, saying that you enjoyed yourself.");
	else if (pc.isMischievous()) output(" flash a grin back up at her. <i>“That’s my kind of zeal, though.”</i>");
	else output(" shrug and tell her that wasn’t exactly the worst thing that could’ve happened.");
	
	output("\n\n<i>“I’m glad,”</i> she says simply, peeling one of Mayren’s arms off you and helping you to your feet. <i>“I know you’ve got places to be, Steele. But it was fun while it lasted.”</i>");
	
	output("\n\nThat it was. You pick up your [pc.gear] and start for the door, leaving Lieve to wake her girls back up.");

	processTime(15 + rand(5));
	
	for (var i:int = 0; i < 4; i++)
	{
		pc.orgasm();
	}

	lieveVenomCounterReset();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function lieveFuckHaremDickVersion(tempVenomEnabled:Boolean = false):void
{
	clearOutput();
	lieveHeader(true);

	hasFuckedLieve(true);
	hasFuckedTrenchWives(true);

	output("You relax under the ministrations of the three lusty ant-girls, their hands playing and teasing all over your bare body, carrying away your equipment. Their movements become more and more excited as they near your [pc.crotch], and their eyes take on a lusty, greedy sheen as they");
	if (pc.isCrotchGarbed()) output(" pull off your [pc.lowerUndergarment]");
	else output(" tear away the last vestiges of your gear");
	output(" and get at your [pc.cock]. They stare almost reverently at your stiffening shaft of meat, eyes widening with a mixture of lust and awe.");
	if (flags["LIEVE_HAREM_DICKFUCK"] != undefined) output(" If you didn’t know different, you’d almost think they’d never seen a dick before.");

	flags["LIEVE_HAREM_DICKFUCK"] = 1;
	
	output("\n\nSierva’s black-plated fingers wrap around your [pc.cock] first, tentatively stroking the shaft near the base, leaving the [pc.cockHead] bobbing in the air. Seeing her opportunity, Mayren crawls over her muscular companion and plants herself overtop Sierva, her tits crushing down on Sier’s head like a pair of honey-filled weights. With a huge grin, May leans forward and wraps her lips around your [pc.cockHead], sending an uncontrollable shiver of pleasure through you.");
	
	output("\n\n<i>“What’re you-”</i> Sierva complains, squirming under the tremendous heft of Mayren’s tits. The busty honeypot just giggles around your cock and starts to slip more of you between her lips, leaning in until she’s kissing the top of Sierva’s fist. The ant-girl on bottom grunts and moves her hand a little faster, letting her tongue flick out across your sensitive underside when Mayren moves back up to your crown.");
	
	output("\n\nWhile they’re squabbling over your cock, the girls’ mistress moves down behind them, running her hands along their insectile abdomens. Lieve gives you a playful wink, licking one of her fingers and slipping into Mayren’s abdominal slit. The lusty bug yelps around a mouthful of cock, but her cry of surprise quickly turns into a low moan of pleasure as Lieve’s digits slide into her. You watch as Mayren’s eyes flutter closed, and her body starts to rock back and forth: onto Lieve’s hand, then down onto your cock, and back again.");
	if (pc.balls > 0) output(" Sierva shifts, pressed down by May’s weight. Her tongue goes with her, slurping down to your [pc.balls] and caress one of the full swells of your nads. You can’t suppress a moan, and you quickly find your hand wandering down to Sier’s head, pushing her deeper down into your crotch to get more and her wonderful tongue to work.");
	
	output("\n\n<i>“They just can’t get enough of your [pc.cock], can they?”</i> Lieve laughs as her hand completely disappears into Mayren’s abdomen. The buxom ant-girl moans something unintelligible, and goes nearly limp - save for her tongue, which continues to swirl and lick at your cockhead with unyielding vigor. You watch appreciatively as a squirt of fem-spunk squirts out around Lieve’s wrist, drenching her almost to the elbow in musky girl-juices.");
	
	output("\n\nPatting May’s head, you answer Lieve that one of her girls is going to get a lot more of your dick in a few moments if they keep this kind of attention up.");
	
	output("\n\n<i>“Then it’s my turn,”</i> Sierva says, forcing her way up - and shoving Mayren off your [pc.cock]. The bigger ant-girl grabs you by the waist and buries herself on your dick before you or May can fight back, stealing the last few licks you need to reach the peaks of pleasure. Grabbing Sierva’s head, you hammer your hips into her lips, forcing your [pc.cock] as deep down her throat as you can get it before she wrings the cum from you. With a roar of pleasure, you feel yourself cumming, spurting a");
	if (pc.cumQ() <= 250) output(" few squirts of seed into Sierva’s waiting lips");
	else if (pc.cumQ() <= 750) output(" a thick, hefty load of spunk down her throat");
	else if (pc.cumQ() <= 1500) output(" a tremendous load of spooge into her mouth, filling her almost faster than she can swallow it. She’s drooling your spunk before you’re done, trickles of [pc.cumColor] going down her chin.");
	else
	{
		if (flags["RESCUE KIRO FROM BLUEBALLS"] != undefined) output(" Kiro-sized");
		else output(" Absolutely monsterous");
		output(" load down Sierva’s throat, bloating the warrior-ant’s gut with a bunker-buster load of spooge.");
	}
	output(" Sierva coughs and wipes her lips, pulling herself off your wang - just in time for Mayren to take her place again, helping herself to the last trickles of your creamy seed. The bubbly honeypot eagerly finishes what her companion began, spit shining your [pc.cockHead] until it glistens.");
	
	output("\n\nYou sigh contentedly as the golden girls enjoy your spunk, marveling at the unfamiliar taste and texture of it. Mayren nuzzles into your thigh, absently stroking your [pc.cock] with one of her hands as the others clean up the excess spunk coating her lips and tease her swollen nipples. Her eyes are heavy-laden with chemical lust, even after Lieve’s popped her fist out of her pussy and moved on to Sierva. The bigger gold ant gasps and sighs as Lieve’s tongue slurps into her abdominal slit, venom-laced mouth pressing in to kiss Sierva’s lower lips.");
	
	output("\n\nYou watch the two of them entangle for a few brief, audibly pleasurable moments. Sier’s hand find their way between her mistress’s legs, teasing between Lieve’s rosy lips. <i>“Riiiight where you belong,”</i> Lieve coos, clenching her thighs around Sierva’s neck. Between the show they’re putting on and Mayren’s hands pumping your spent, sensitive shaft, you soon find yourself surging back to full strength.");
	
	output("\n\n<i>“Oooh, all for me this time?”</i> Mayren says with a smile, running her tongue along the side of your [pc.cock].");
	
	output("\n\n<i>“You’re welcome to it,”</i> Lieve laughs, patting Sierva’s cheek and stepping off from her gold myr lover. <i>“But I think [pc.heShe] would look a little better between the two of you, hmm?”</i>");
	
	output("\n\nOn that point, at least, the girls can all eagerly agree.");
	
	output("\n\nYou’re quickly pulled down off your stool and onto your back, straddled by both trench wives. Their eight hands explore your body in full now, cupping and squeezing and caressing every sensitive spot they can find. Sierva’s abdomen curls between her legs, its entrance probing at your lips. You open wide, letting your tongue fill in for Lieve’s and slip deep into Seirva’s slit. Grinning lustily at you, Mayren sidles down onto your lap, her own insectile behind caressing your [pc.cock] with wet, warm motions. You shiver uncontrollably as her wet slit slides along your underside, dragging along your shaft until her pussylips crest your crown.");
	
	output("\n\n<i>“Ah,”</i> she says simply, cupping one of her honey-swollen tits and sliding down your shaft. Your hands grip her hips, guiding her procession down until");
	if (pc.biggestCockLength() <= 12) output(" she’s fully mounted on your cock");
	else output(" her abdomen is distended with the overwhelming mass of your mighty rod");
	output(". She gives you a lascivious wink as she settles in atop you, caressing her own hind-end with her lower arms, feeling herself up on both fronts.");
	
	output("\n\nSuddenly, your view is blocked by a tight, bare, abdomenless ass. Lieve joins her wives in straddling you, facing Mayren full on and taking the honeypot’s huge breasts in her hands and burying her face in between them. May gasps and giggles as she gets a second dosing of lust-venom applied directly to her pert teats. It’s impossible to resist the urge to reach up and grab Lieve’s ass when it’s on such blatant display for you, close enough to kiss it if you weren’t busy tending to a different set of nethers. Lieve pauses to look over her shoulder, giving you");
	if (pc.isFeminine()) output(" a lascivious wink");
	else output(" a strange look");
	output(" before Sier leans forward, cupping Lieve’s cheek and pulling her into a kiss. You feel the pussy at your lips flush and start to leak as Lieve’s venom strikes again, sending shivers of pleasure through the antgirl’s body.");
	
	output("\n\n<i>“Don’t hog all the fun for us, Lieve!”</i> May giggles, caressing one of Lieve’s tits. <i>“I’m sure [pc.name] wants in on the fun. Don’t you, [pc.name]?”</i>");
	
	processTime(45 + rand(15));
	
	if (!lieveVenomEnabled() && !tempVenomEnabled)
	{
		output("\n\n<i>“That’s a good question,”</i> Lieve says, her smile widening. <i>“I’ve got plenty to share... or do I need to hold back? It’s alright, nobody would think less of you if you didn’t want a big, strong ant to turn you into a screaming, blubbering bag of lust... just putty in my girls’ hands, cumming again and again and again.”</i>");
	
		output("\n\nThough she’s teasing you, Lieve doesn’t make a move until you answer.");

		clearMenu();
		addButton(0, "Venom Fuck", lieveFuckHaremDickVersionVenom, tempVenomEnabled, "Venom Fuck", "Tell Lieve you want her to use every tool at her disposal.");
		addButton(1, "No Venom", lieveFuckHaremDickVersionNoVenom, undefined, "No Venom", "You’d rather not have your body flooded with myr venom.");
	}
	else
	{
		output("\n\n<i>“You wanted my venom, Steele... I hope you’re ready for it. I’m going to enjoy watching you squirm and moan for hours.”</i>");
		//Go straight to venom scene

		clearMenu();
		addButton(0, "Next", lieveFuckHaremDickVersionVenom, tempVenomEnabled);
	}
}

public function lieveFuckHaremDickVersionVenom(tempVenomEnabled:Boolean = false):void
{
	clearOutput();
	lieveHeader(true);

	output("Lieve manages to pull herself away from her wives for a few moments, long enough to turn her attention to you and run her pink-slathered tongue across the palm of her hand. She gives Mayren a little push, causing her wife to rise up on your cock, exposing most of your shaft to the cool air - though she’s sure to keep your crown nice and nestled in her pussy’s wet, sultry embrace. Lieve’s hand takes hold of your length, wrapping her venom-slathered fingers around it and pumping slowly up and down. Her spit and May’s drooling pussy-juice acts as a perfect lube, letting her glide along your length.");
	
	output("\n\nIt doesn’t take long for you to feel the first tendrils of Lieve’s venom seeping into you, sending a hot, murky lust rising through your body. As if the sight of three beautiful ant-girls crawling all over you wasn’t enough to have you rock hard to begin with! Regardless of your current arousal, you can feel the chemical aphrodisiac burning in your veins, searing away your conscious thoughts and replacing them with primal, animal need. Your hands dig into May’s abdomen, pulling her back down on your shaft and thrusting your hips up to meet her. She moans, eyes rolling back as you slam a venom-coated missile deep up her cunt, and sends a squirt of nectar hands-free to splatter over Lieve’s cheeks.");
	
	output("\n\nThe red myr chuckles and wipes the nectar away, licking it off her fingers - before finding Sierva’s lips pressing to hers again, suckling a little sweet venom from her lips and grinding her abdomen over your mouth. You enjoy the taste of Sierva’s cunt while you can, languidly licking at her lower lips and slipping your [pc.tongue] deep between them. Between your tongue and Lieve’s drugged lips, Sierva doesn’t last long - and neither does the gold bug on your [pc.cock], for that matter. Before long, you’ve got a pair of orgasming gold myr screaming their pleasure overtop you, squeezing breasts and bucking hips as they rain femcum down on you. With that kind of treatment, it’ll take days to get the girl-smell off of you - though in your condition, the idea of ridding yourself of the wondrous scent of female orgasm is heresy. You want more!");
	
	output("\n\nYou find your hands slipping around Sierva’s abdomen, fingers gliding into her sex, teasing the bud of her clit. A few short strokes and you’re treated to another screaming orgasm, just on the heels of the last. Sier cries out, her legs clutches around your head, tight enough to make you fear she’ll pop your head off! She’s got powerful thighs for a sex slave!");
	
	output("\n\nLapping up every drop of girl-spunk you earn, you slowly become cognizant of your own impending second climax. Feeling the same thing you are, Mayren wiggles her abdomen and starts moving faster. You might have tried to hold back, to wait until she’s ready to finish again, but the chemical rush centered right on your [pc.cock] denies all thoughts of restraint. You announce your orgasm with a sharp suck of breath, arching your back into a particularly deep thrust of May’s abdomen. You slam yourself deep into her insectile backside and unleash a second torrent of seed into her, flooding her honeypot with [pc.cumNoun].");
	
	output("\n\n<i>“That’s right. Fill her up, Steele,”</i> Lieve moans around a mouthful of May’s tit. She takes a break from suckling, flipping around so that her back’s to May and her front’s to you, letting you see her rosy-red pussy for the first time. She wraps one hand over her shoulder, caressing Mayren’s feelers; the other she plunges into her sex, digging deep between her legs to the same rhythm of your thrusts into her wife’s cunt.");
	
	output("\n\n");
	if (pc.isFeminine()) output("<i>“Like the view, Steele?”</i> Lieve teases");
	else output("<i>“Having fun, Steele?”</i> Lieve laughs");
	output(", gasping lustily while her <i>other</i> trench wife leans in and licks at her perky tits. Lieve cups Sier’s cheek, drawing the golden warrior’s lips up to meet her own. Rather than kiss her again, though, Lieve draws her tongue in a full circle over her wife’s lips. Sierva shudders at the sudden chemical surge, and you feel all the tension flooding out of her body. She’s almost limp in your hands, feeling like she’s being propped up by little more than your [pc.tongue].");
	
	output("\n\nLieve breaks the tongue-job with a laugh, planting a normal peck on Sierva’s nose. <i>“I think you need to lay down, babe. Maybe on Steele here, hmm?”</i>");
	
	output("\n\n<i>“Y-yeah,”</i> Sierva moans, almost too airily to hear. Lieve helps her turn around, and your face-full of abdomen-pussy is stolen from you, replaced with a pair of soft tits pressing against your [pc.chest] and Sierva’s face meeting yours. You’re vaguely aware of Sier’s insectile backside being hefted up by Lieve, and her tongue disappearing into Sierva’s nethers. The lusty insect overtop you traces kisses along your neck, slowly meandering up to your [pc.lips]. Your eyes flutter open in alarm as her venom-laden cockpillows brush against your mouth, but fall closed again with lust-laden leadenness. Your hands wrap around Sierva’s waist, pulling the ant-girl tight against you and drive your tongue into her mouth.");
	
	output("\n\nVenom seeps into you from the mouth and cock, hitting you from both ends. You feel yourself cumming again before long, moaning into Sierva’s mouth. And again. And again. You lose track of time completely, succumbing to the aphrodisiac coursing through your veins and the heady smells of sex that hang like a heavy cloud over the dungeon. Life is good...");

	processTime(200 + rand(40));
	clearMenu();
	if (!lieveVenomEnabled() && !tempVenomEnabled) lieveVenomCounterInc();
	addButton(0, "Next", lieveFuckHaremDickVersionVenomII);
}

public function lieveFuckHaremDickVersionVenomII():void
{
	clearOutput();
	lieveHeader(true);

	output("<b>You lose track of time...</b>");
	
	output("\n\nMayren and Sierva find themselves swapping places on your cock for what seems like an eternity, spurred on by a nigh-endless source of venom. Whenever one of the girls doesn’t have your [pc.cock] stretching her abdominal hole, she’s got Lieve tending to her, her tongue slurping through her slit.");
	
	output("\n\nYou’re not sure how you’re still awake. They’ve drained every drop of seed from you, that’s for certain. You groan and sigh and try to hang on through the last of the girls’ orgasms. They’re finally wearing out, too lust-drugged and worn out to continue. Mayren giggles weakly, her head nestling into Lieve’s lap. Your cock shudders inside her abdomen, sending dry shockwaves of pleasure back through you. Lieve chuckles, seeing you moaning weakly, and strokes your cheek.");
	
	output("\n\n<i>“A little venom and a couple of well-trained girls can go a long way, huh?”</i> she laughs, pulling May’s slack body off you once you’ve calmed down a bit.");
	
	output("\n\nYou nod, finally able to catch your breath. The air you’re able to suck in is rich with musk and sex. You shiver and cough, your chest heaving as the myr girls pull off of you. <i>“C’mon, Steele. Can’t lounge around all day with us... and I think the girls need some time to rest. But it was fun while it lasted.”</i>");
	
	output("\n\nThat it was. You pick up your [pc.gear] and stagger towards the door, leaving Lieve to wake her girls back up.");

	processTime(10 + rand(5));
	
	for (var i:int = 0; i < 4; i++)
	{
		pc.orgasm();
	}

	flags["HAS_BEEN_MYR_VENOMED"] = 1;
	imbibeVenomEffects();
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function lieveFuckHaremDickVersionNoVenom():void
{
	clearOutput();
	lieveHeader(true);

	output("<i>“No thanks,”</i> you say, managing to grunt that out betweens moans of pleasure. <i>“I’ve got more than enough pleasure right here.”</i>");
	
	output("\n\nWith that, you pull Sierva’s abdomen a little closer, driving your tongue deep inside her. Lieve chuckles and shakes her head, letting her attention return to her wives - whose attentions, in turn, are wholly focused on you. Driven on by their mistress’s poisonous kisses, the gold myr girls move over you with a wild, demanding passion. Hands play over your body, caressing your [pc.nipples]");
	if (pc.balls > 0 && !pc.hasVagina()) output(" and cupping your [pc.balls]");
	else if (pc.hasVagina() && pc.balls <= 0) output(" teasing the lips of your [pc.cunt]");
	else if (pc.hasVagina() && pc.balls > 0) output(", cupping your [pc.balls] and probing your pussy");
	output(".");
	
	output("\n\nWith three amorous ants all straddling you, there’s not much to do but lie back and let them bring you to orgasm again... and again. Even without Lieve’s lust-venom, your sensations swim under the constant barrage of stimulation, bringing you to the heights of pleasure and wringing your precious seed from your [pc.balls]. Mayren takes every load you’ll give her, greedily riding out a series of climaxes that leave her panting and gasping, propped up only by your cock and her chest resting on Lieve’s back.");
	
	output("\n\nSierva and Lieve aren’t much better off, mindlessly groping and caressing each other, lips locked in a deep and unbreaking kiss. Sierva’s fingers play around her mistress’s clit, occasionally breaking to slip inside her, thrusting in to the knuckles before switching back again. The girls go at it for what seems like an eternity, but you’re content to watch after a while, taking the chance to catch your breath and enjoy the afterglow, still buried in May’s cunt. It’s a long while before anybody notices that you’ve gone still, eyes closed and chest heaving.");
	
	output("\n\n<i>“You alright, Steele?”</i> Lieve finally asks. Blinking, you realize that she and Sierva have rolled off you - you’ve long since lost the sensation in your tongue, numb from so many ventures into Sierva’s slit. You grunt in answer, gently rolling Mayren off of you. Unsteadily, you stumble to your [pc.feet] and grab your [pc.gear], heading for the door.");
	
	output("\n\n<i>“Had enough of us already?”</i> Lieve chuckles, stroking May’s hair. <i>“Don’t be a stranger, then. The girls certainly seemed to enjoy that [pc.cock] of yours...”</i>");

	processTime(10 + rand(3));
	
	for (var i:int = 0; i < 4; i++)
	{
		pc.orgasm();
	}

	lieveVenomCounterReset();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function lieveSoloTurnsDownDudes():void
{
	clearOutput();
	lieveHeader(true, true);

	output("You gently brush the two harem babes off and close the distance between you and the amazonian red myr. She retreats a step under your advance, pressing her back to a wall; you plant a hand beside her, leaning in and saying that you’d prefer to just have a slice of her. No trench wives, just you and her.");
	
	output("\n\n<i>“Uh, hey, look,”</i> Lieve grimaces, fidgeting awkwardly. <i>“I’m not a breeder. Can’t have kids. Never even seen a male before. You’re real exotic, and there’s plenty of girls who’ll get their panties wet at the sight");
	if (pc.tone <= 66) output(" of a dick");
	else output(" of a dick and some chiseled muscles like that");
	output(", but it’s... it’s really just not doing it for me. Sorry.”</i>");
	
	output("\n\nOof. You slump your shoulders, advances turned aside by an accident of orientation. Lieve gives you an apologetic look and angles you towards her waiting harem. <i>“Look, we can have some fun by proxy, through the girls, all right? I know they’d love to get their hands on a real, live dick.”</i>");

	processTime(5 + rand(2));
	
	//Back to sex menu
	lieveSexMenu();
}

public function lieveSoloFucktime(tempVenomEnabled:Boolean = false):void
{
	clearOutput();
	lieveHeader(true, true);

	hasFuckedLieveSolo(true);

	showImage("LieveAgainstWall");
	output("You gently brush the two harem babes off and close the distance between you and the amazonian red myr. She retreats a step under your advance, pressing her back to a wall; you plant a hand beside her, leaning in and saying that you’d prefer to just have a slice of her. No trench wives, just you and her.");
	
	output("\n\n<i>“I’m sure the girls will be horribly disappointed,”</i> Lieve answers, though one of her hands shimmies around to grab your [pc.butt].");
	
	output("\n\nBehind you, her wives both make exaggerated moans and paw at you, trying to entice you back to their arms. You resist the urge to take advantage of the two lust-drugged golden beauties, long enough for the lustful pair to take the hint and scamper off. They close the bunker’s door loudly behind them, leaving you and your insectile lover all alone with each other.");
	
	output("\n\nThe moment they’re gone, Lieve pulls you in against her. Her lips meet yours in a passionate embrace, hands digging into your [pc.butt] and holding you tight against her. A little moan escapes the lock of your lips - and in the moment, you can’t tell if it’s you or her. Your hands return her advances, playing up the ant-girl’s chest and down under the lapel of her coat. Her eyes flicker open when you grab her perky little breasts. Running your thumbs across the soft mounds, you’re pleased to find a pair of stiff points straining against her uniform, rising up to meet your touch. Teasing them is almost too much to pass up, and you find yourself spending a few moments just enjoying the stiff little buds - and the way that caressing them makes Lieve moan and tremble.");
	
	output("\n\nFrom there, it’s easy to start unbuttoning her shirt, eagerly tearing the thin cloth away to get at the supple, scarred flesh beneath. Lieve sucks in a sharp, surprised breath when your fingers brush along the claw-scored trenches across her belly. She recovers in the blink of an eye, though, and you quickly find one of her smoothly-chitined hands wrapping over yours, guiding you downward.");
	
	output("\n\nLieve’s belt comes unbuckled and her zipper rips down, admitting your wandering hand access to her toned thighs and the silken treasure between them. A pair of fingers slip between her velvet folds, and you’re rewarded with a pleasured gasp. Lieve’s back arches into you, pressing her bare chest against you. Her hands slip around your waist, starting to work at pulling your own [pc.gear] off in turn. The more you work your fingers into her, and the more your lips play across each other, the more feverish her motions become until she’s stripped you bare and you’ve yanked her pants down around her ankles, leaving her nearly as vulnerable as you are save for the uniform shirt hanging limply off her shoulders.");
	
	output("\n\nIn the moment it takes you to break your kiss and pull Lieve’s shirt off, you feel your heart start to hammer in your chest. Your skin flushes with more than the usual fires of arousal and the need for your lover’s touch; your lips, especially, feel like they’re aflame as the cool air caresses them.");
	if (lieveVenomEnabled() || tempVenomEnabled) output(" The familiar taste of Lieve’s venom hangs heavily across your [pc.lips], spreading through your body in warm waves of pleasure.");
	else output(" Your mind leaps to the lusty venom red myr possess. The way your body’s reacting, you must have just gotten a hell of a dose, swapping spit with the crimson ant-girl like that.");
	
	output("\n\nYou lick your lips and grab at the myr’s breasts, scooping the pair of hand-filling mounds up and squeezing them until your lover moans. You push her back against the wall, pinning her back and");
	if (lieveVenomEnabled() || tempVenomEnabled) 
	{
		output(" furiously pressing your lips to hers, eager for more of that potent aphrodisiac.");
		imbibeVenomEffects();
	}
	else output(" trailing kisses up her neck, careful to avoid her poisonous lips.");
	output(" From where she’s positioned, it’s easy for Lieve to hike her legs up around your [pc.hips], and your hands are quick to grab her ass in turn, supporting her weight between you and the wall.");
	
	output("\n\nYour lips trail down, replacing your hands’ grasp on her perky tits and gently licking at the rosy peaks of her nipples. The feeling of her bare and eager pussy grinding against your [pc.belly] only fuels the fires of your arousal, making it painfully hard not to just start suckling from the lush teats on offer. You wrest yourself away from one boob and onto the other, shivering as Lieve’s hands slip down your body in turn. Her plated fingers brush across your [pc.nipples] and down to your [pc.crotch]. You suck in a sharp breath of pleasure when her hand");
	if (pc.hasCock()) output(" wraps around your [pc.cock]");
	else if (pc.hasVagina()) output(" caresses your [pc.cunt]");
	else output(" reaches between your [pc.legs] and teases at your [pc.asshole]");
	output(".");
	
	output("\n\nIn the blink of an eye, you go from pinning Lieve to a wall to slamming into the metal desk at the far side of the bunker, and spilling your myr lover out onto it. In the heat of the moment, you’re not sure if you tripped backwards or if Lieve pushed you; either way, you end up face to face with your insectile lover, and the lascivious look playing across her rose-red lips. Her legs are still locked around you, pinning you close enough to her that you can feel her breath hot against your venom-sensitized [pc.skinFurScales].");

	output("\n\nSlowly, sensually, Lieve leans back on the cold metal desk, planting her hands palm-down behind her. The angle puts her tight, strong stomach and perky breasts on full display for you, trimmed with chitin plates that lends the bombshell beauty just a touch of menace. Her black, featureless eyes flick downwards, drawing your attention from her amazonian figure down to the lips of her sex, flushed red with arousal.");
	
	output("\n\nLieve’s legs relax just enough for you to slip down, putting your face level with her pussy. You breath deep of the wonderfully rich, feminine smell radiating from the thin trickle of excitement smeared over her thighs. You can’t resist the urge to lick up it, playing your [pc.tongue] from thigh to pussylip, then up to the tender bud of her clit.");
	
	output("\n\n<i>“Oh, that’s good,”</i> Lieve groans, leaning back and letting her back arch again while your tongue circles her clit. One of her hands reaches up to cup her tit, and ends up squeezing so hard that a little trickle of nectar squirts out onto her black-plated fingers, staining them honey-yellow. Seeing your eyes transfixed on her, your lover makes a bit of a show of licking her digits clean, sucking the honey off of them one by one.");
	
	output("\n\nShe hasn’t even finished off her index finger when you give in, burying your face between her toned thighs and into the cleft of her cunt. Lieve’s whole body seems to lock rigid when your [pc.tongue] flicks out, parting her lips to test her sweet nether’s nectar. She’s hot inside, so much so that you’re almost worried about scalding your [pc.tongue] on her boiling depths. Her alien heat only serves to drive your lusts to burn higher, though, and you soon find yourself burying every inch of your");
	if (pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" inhumanly long");
	output(" tongue between Lieve’s legs. Her juices flow like water around you, smearing across your cheeks and chin; the more eagerly you eat your lover out, the more she rewards you with cute little moans and gasps.");

	output("\n\nLieve’s legs lock around your neck, pulling you deeper into her pussy. Her thighs are like wet vices around your temples, clamping you firmly right where you belong: servicing your lover’s sultry honeypot with every ounce of energy you can muster. Even then, though, your chemically-fueled lust doesn’t let you forget your own needs: the");
	if (pc.hasVagina() || pc.hasCock())
	{
		if (pc.hasVagina()) output(" drooling gash between your [pc.legs] is so wet that you’re leaking onto the floor, creaking a little pool of feminine excitement beneath you");
		if (pc.hasCock() && pc.hasVagina()) output(". Worse, the");
		if (pc.hasCock()) output(" hot, throbbing girth of your [pc.cock] is painfully erect. It dangles awkwardly between your [pc.legs], begging for a touch - any stimulation to relieve the intense pressure welling up inside you");
	}
	else output(" hot flush of your sexless body begs for any tender touch, any means of release from your venomous arousal");
	output(". Your hands start to slip down towards your crotch, desperately seeking some measure of relief - only to be grabbed by Lieve before they’ve cleared an inch from her.");
	
	output("\n\n<i>“Nobody said you could move,”</i> Lieve teases, firmly affixing your hands onto her hips. Your fingers claw at her flesh, but only accomplish a groping squeeze of her ass that leaves your fingers sinking into her fleshy flanks. You groan wordlessly into Lieve’s cunt, trying to ignore the burning desire coursing through your loins.");
	
	output("\n\nNever content to let something lie, Lieve coos <i>“Hm? What was that? I couldn’t hear you...”</i>");
	
	output("\n\n<i>“Please,”</i> you murmur around a mouthful of myr pussy, driven to say anything by your mounting desperation. The rest of the thought is drowned out in mindless, lustful noises between eager, almost pleading, licks of Lieve’s sex.");
	
	output("\n\nLieve stifles a laugh into a moan, barely managing <i>“Please what?”</i> around a particularly deep lick that has her legs tensing fiercely around your head.");
	
	output("\n\nThe heady mix of lust-drug in your veins and Lieve’s rosy sex in your face makes thinking up a more cogent response than a pitiful moan a near impossibility. It takes a great deal of your waning willpower to finally blurt out <i>“");
	if (pc.isBimbo()) output("Just, like, fuck me already!");
	else output("Please... please fuck me!");
	output("”</i>");
	
	clearMenu();
	addButton(0, "Next", lieveSoloFucktimeII, tempVenomEnabled);
}

public function lieveSoloFucktimeII(tempVenomEnabled:Boolean = false):void
{
	clearOutput();
	lieveHeader(true, true);
	output("That seems to be good enough for your ant-like lover, who loosens the grip of her thighs around your neck. Rather than releasing you to tend to yourself, though, Lieve curls her leg up until her toes are planted on your forehead, and give you just the push you need to go tumbling onto your back.");
	
	output("\n\nShe pounces on you like an animal, pinning you to the deck with both hands planted firmly on your [pc.chest] and the rest of her straddling your [pc.hips]");
	if (pc.hasCock()) output(", dangerously close to the erect mass of your [pc.cock], pressing so tight against her thigh you’re afraid you’ll blow your pent-up wad if she so much as grinds against it");
	output(".");
	
	output("\n\n<i>“Now that’s better,”</i> Lieve chuckles, brushing her thumbs across your [pc.nipples]. Pleasure cracks through you in a whiplash of over-sensitive flesh, making you moan and squirm under your lover. She just smiles and does it again, to much the same reaction. <i>“Ooh, that little dose of venom must be burning you up inside!”</i>");
	
	output("\n\nYou writhe helplessly as Lieve’s smooth, chitinous thumbs caress your [pc.nipples], driving you wild with overwhelming sensation.");
	if (pc.isLactating()) output(" Squirts of [pc.milkNoun] dribble out at even the slightest touches now, bathing Lieve’s hands in your lactic bounty until she’s forced to stop and clean her fingers off - using your mouth, of course. She presses her long digits to your lips with just enough pressure to urge you to open up and lick her clean. <i>“You really are making a mess of yourself,”</i> Lieve coos, running her other hand through the puddle of [pc.milkNoun] forming between your [pc.breasts].");
	output(" You groan under her domineering ministrations, trying at odds to draw more pleasure from her eager explorations of your body, and to stop yourself from cumming before you even touch on the main event.");
	
	output("\n\nLieve is insatiable, though, and the venom-high you’re rocking has left you completely vulnerable to her touch. With a weak whimper, you find yourself arching your back under her and succumbing utterly to pleasure.");
	if (pc.hasCock())
	{
		output(" Your cock is the first to give, shooting a thick rope of [pc.cumNoun] across Lieve’s bare thigh, grazing the slit of her cunt and glazing it with creamy [pc.cumColor] spunk. She gives a surprisingly delighted gasp, grinding her legs against your hardened shaft");
		if (pc.cocks.length > 1) output("s");
		output(" as you blow your " + possessive(pc.ballDescript()) + " load all over her.");
	}
	if (pc.hasVagina())
	{
		output(" Your [pc.cunt] contracts around the air, desperate for a cock to milk - anything to grab onto as an orgasm thunders through you. Juices squirt out over your thighs, drooling onto the floor in a messy, glossy swamp that pools sloppily between your ass cheeks.");
	}
	if (!pc.hasCock() && !pc.hasVagina())
	{
		output(" With nowhere to go, your body’s mounting, orgasmic pleasure focuses in on your nipples, letting the two sensitive buds Lieve’s been teasing erupt in cataclysmic pleasure.");
		if (!pc.isLactating()) output(" If you were lactating right now, you’re sure you’d be geysering milk like in an ultraporno.");
		else output(" [pc.milkNoun] geysers out from your [pc.nipples], splattering all over Lieve’s chest in wet, dripping arcs. <i>“Woah!”</i> she gasps, just barely getting her face out of the way. <i>“You sure do make a mess!”</i>");
	}
	
	output("\n\nGasping for breath, you collapse against the hard, sodden floor of the bunker. <i>“Now that’s better,”</i> Lieve laughs, running a hand through her lavender hair. She leans down over you, breasts pressing firmly against your [pc.chest], and plants a kiss on your [pc.lips]. Her tongue slithers into your mouth with serpent-like grace, and only too late do you realize you’ve doomed yourself to another heady dose of red myr venom. There’s nothing to do but wrap your arms around your lover and kiss her back, holding her tight as you feel the waning flames of passion reignite in waves of chemical arousal.");
	
	output("\n\n<i>“What?”</i> she says, pulling off you and back on her knees. <i>“You didn’t think you were getting off that easy, did you?”</i>");
	
	output("\n\nAll you can do is moan.");
	
	output("\n\nLieve starts to slide down you, slowly and sensually, taking her time to tease your oversensitive skin until you’re squirming and groaning");
	if (pc.hasCock()) output(" and hard as a rock again");
	output(". It feels like an eternity before you feel her plated hands on your [pc.legs], curling them up to give her ample access to your [pc.crotch].");
	
	if (pc.hasCock())
	{
		output("\n\n<i>“Hey there, buddy,”</i> Lieve whispers to your [pc.cock], her breath hot against your tender flesh. With cum still drooling from your prick, glazing your cockflesh in seed, you can’t help but let your manhood throb in response to her nearness. <i>“I’m not sure how I feel about ladydick,”</i> she continues, hiking your [pc.legs] up a little further. <i>“I guess a little taste couldn’t hurt, right? Just between you, me, and a hell of a lot of venom.”</i>");
		
		output("\n\nOh, shit.");
		
		output("\n\nLieve’s tongue flicks across the underside of your shaft, carrying with it a thick glaze of her venomous saliva. Your entire body trembles as the burning lust-drug contacts your most tender places, circling your crown and lapping around the still-wet slit atop your glans. When her tongue flicks off your crown, you’re treated to her grumbling about weird tastes before wrapping her hand around your shaft and pushing it back against your belly");
		if (pc.balls > 0) output("; her other hand cups your [pc.balls], hefting them out of the way");
		output(" to reveal your");
		if (pc.hasVagina()) output(" cunt");
		else output(" asshole");
		output(".");
		
		output("\n\n<i>“Now </i>that<i>’s more like it,”</i> she grins, licking her lips. Your cock throbs in her grip, splattering a second helping of [pc.cumNoun] across your [pc.belly] as she gently strokes you off. Your lover flashes you a wink before turning her attention to her real target.");
	}
	else if (pc.hasVagina())
	{
		output("\n\n<i>“Hey there, beautiful,”</i> Lieve coos, so close to your quivering quim that you can feel her breath hot on your lower lips. One of her smooth digits caresses your mons, tracing its way around your pussy - and sending trembling waves of pleasure through your envenomed skin.");
		if (!lieveVenomEnabled() && !tempVenomEnabled) output(" You can’t even imagine what it’s going to be like if she starts kissing you there....");
		else output(" All you can do is brace for the immense high a red myr’s pussy-eating’s going to leave you with!");
	}
	
	if (pc.hasVagina())
	{
		output("\n\nYou shiver as Lieve leans into your crotch, caressing your sex and teasing her way around your pussylips until her tongue finds its way to the very");
		if(pc.hasClit()) output(" tip of your [pc.clit]. You suck in a panicked breath as the crimson ant-girl licks your rosebud");
		if(pc.hasClit()) output(" edge of your female sex");
		output(", slathering it with a thick coating of saliva. The second lick is almost too much for you to bear.");
		
		output("\n\nShe takes her time, slowly circling your");
		if(pc.hasClit()) output(" clit");
		else output(" groin");
		output(" again and again, wrapping it in an irresistible coat of venomous wetness that seeps steadily into your sex. Your whole lower body tingles, and every hair you have stands on end as your lover lavishes you");
		if(pc.hasClit()) output("r pleasure buzzer");
		output(" with her mouth.");
		
		output("\n\nIt doesn’t take much of that treatment to wring another orgasm out of you. Her only recognition of your body’s sudden tension, and the wetness gushing between your [pc.legs], is a muted moan. She just keeps licking and kissing");
		if(pc.hasClit()) output(" around your clit");
		output(", brushing your pussylips but never quite pushing into you. You try to beg her to stop - that it’s too much - but all that comes out is a squealing <i>“Fuck me! Harder!”</i>");
	}
	
	if (!pc.hasCock() && !pc.hasVagina())
	{
		output("\n\nYou shiver as Lieve leans into your crotch, drawing her hands along your bare groin. <i>“Are all you offworlders like this?”</i> she asks, planting a kiss right where you sex ought to be. <i>“Just like my golden girls. I think I know how to deal with you...”</i>");
		
		output("\n\nA moan tears out of your lips as Lieve’s hands spread your [pc.butt]’s cheeks nice and wide, giving her a perfect view of your [pc.asshole]. She draws her tongue through your crack, tip to top, leaving an envenomed trail of sticky pink spit around your clenching hole.");
	}
	
	output("\n\nYou’ve barely recovered from your orgasm when you feel the tip of Lieve’s tongue pressing gingerly against your [pc.vagOrAss]. Your back arches, [pc.legs] squirming as she gently applies pressure, firmer and firmer until suddenly she’s inside you. Her hands hold your hips firm, keeping you from squirming away. All you can do is moan and lace your [pc.legs] around Lieve’s shoulders, and you find yourself pulling her deeper into your groin - and driving her tongue deeper into you clenching");
	if (pc.hasVagina()) output(" slit");
	else output(" ass");
	output(". You can feel her venom crawling through your body, lighting every nerve you have on fire.");
	
	output("\n\nYour chest clenches as if Lieve’s reaching through your body to grab your heart. Breathing is hard, coming in shaking gasps that tread towards orgasmic, echoing the cascades of pleasure coursing through you. Her oral skills are incredible, well practiced on a pair of eager slaves and honed to perfection by chemicals that flood you with aphrodisiacs so powerful that burns away any semblance of cogent thought other than <i>“FUCK ME!”</i>");
	
	output("\n\nAnd Lieve does. As relentless and methodical as a red myr ought to be, she lavishes every inch of your");
	if (pc.hasVagina()) output(" pussy");
	else output(" ass");
	output(" with attention. Every sensitive spot you have is hers for the taking, making you scream and moan and beg for more. Orgasms pass you by one after the other, shockwaves of pleasure that leave you increasingly limp and breathless in Lieve’s arms.");
	if (pc.hasVagina() && pc.wettestVaginalWetness() >= 4) output(" She takes every spurt of fem-cum you spray onto her in stride, never abating her oral assault for a second.");
	else if (pc.hasCock()) output(" She takes every spurt of cum you spray onto her in stride, never abating her oral assault for a second.");
	output(" Her venom burns so hot through your veins that your vision swims with pink, wrapping your whole world in a hazy pink mist that swirls and spins - only to come crashing down into another screaming orgasm.");
	
	output("\n\nYou completely lose track of time...");
	
	processTime(60 + rand(30));

	clearMenu();
	addButton(0, "Next", lieveSoloFucktimeWindup);
}

public function lieveSoloFucktimeWindup():void
{
	clearOutput();
	lieveHeader(true, true);
	//Lust to minimum. +6 orgasms. Pass 6 hours. Give benefits from rest (eg. energy). 

	output("You wake up with a gasp, blinking away what feels like years of sleep. Your body is wrapped in a pleasant warmth - a blanket, you realize when you try to sit up.");
	
	output("\n\n<i>“Easy, lover,”</i> Lieve says, her familiar hand suddenly on your cheek. You look up to find her sitting over you, resting your head in her lap. She’s dressed again, looking no worse for wear after your passionate lovemaking. Her pair of trench wives look at you from across the bunker with knowing smiles.");
	
	output("\n\nWith a groan, you pull yourself up to a sitting position - though a sudden bout of weakness has you leaning heavily on Lieve’s shoulders. She flashes you a little grin and slips an arm around your shoulders, playing the slip off like nothing. One of her girls hands you something musky and hot to drink, and you gulp it down greedily.");
	
	output("\n\n<i>“Sleep well?”</i> Mayren asks, trying not to giggle. You give her a nod and set the empty mug aside. Your hands are almost immediately filled by a folded-up stack of your gear, courtesy of Sierva. You slip out of the blanket and kit up, trying not to give too much of a show to Lieve and her lovers - you’re not sure you can handle another lesbothon like that again.");
	
	output("\n\nAt least, not for a little bit.");

	for (var i:int = 0; i < 6; i++)
	{
		pc.orgasm();
	}

	processTime(60 * 6);
	sleepHeal();

	//Bunker menu here
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function lieveBodyWorship():void
{
	clearOutput();
	lieveHeader(true, true);

	hasFuckedLieveSolo(true);

	output("You take a confident step towards Lieve, slipping your arms around the red myr warrior’s waist and leaning in for a kiss - as much a sign of affection as your growing desire to feel the burn of her lusty venom coursing back through your veins.");
	
	output("\n\n<i>“Oh, hey there, beautiful,”</i> Lieve laughs as you slip into her arms, just before your [pc.lips] press into hers.");
	
	output("\n\nShe accepts the kiss eagerly, knowing exactly what you want: her mouth opens invitingly, encouraging you to let your [pc.tongue] wander in and get your high from the source. Eagerly, you start to lap up the thick, pink-tinted saliva glazing the inside of your lover’s mouth, twisting your tongue around her own until you can start to feel that wonderful, familiar fog of heat starting to spread through you. Every nerve seems to light up all at once, cascading pleasure through you in a great tidal wave that leaves you almost limp in Lieve’s embrace.");
	
	output("\n\nYou wave one of your arms behind you, motioning Lieve’s harem girls off when they start to brush their hands against your suddenly-sensitive [pc.skinFurScales]. <i>“Give us a few minutes, girls,”</i> your lover murmurs over your shoulder, confirming your demand. They both make a combination of disappointed sighs and shuffle off. The door clicks closed behind them, leaving you alone with Lieve and your burning lusts.");
	
	output("\n\nIn the blink of an eye, Lieve’s clothing seems to disappear, ripped away by your hurried hands until her perky little breasts are firmly planted in your hands and your back is against the wall with an amorous ant-girl grinding up against you. Lieve trails kisses down your bare body, every caress of her lips and tongue loaded with venom that makes your [pc.skinFurScales] flush with the throbbing beginnings of arousal. Your hands slowly slip down to Lieve’s taut ass, squeezing her tight cheeks until even the tough ant-girl’s moaning between lustful licks around your [pc.nipples].");
	
	output("\n\n<i>“Mmm,”</i> Lieve purrs. <i>“You’ve got talented fingers. But what about that [pc.tongue] of yours?”</i>");
	
	output("\n\nBetween her lips and fingers playing across your venom-ridden body and the haze of lust-drug hanging over your mind, it takes you a moment to realize what the warrior ant is asking - long enough that she peels herself off of you and shimmies back against the far wall, crooking her finger at you. She hops up onto the metal table and spreads her legs invitingly around her rosy little twat, glistening with her own arousal.");
	
	output("\n\nYou find yourself following the crook of her finger like a loyal puppy bounding up to her mistress, so eager to please. Before you can reach her, though, you’re stopped by one of her chitin-clad feet pressing firmly against your chest to stop you. Blinking away a moment’s confusion, you let the gentle guidance of her perfectly-formed black foot guide you down onto your [pc.knees]. Lieve lavishes you with an approving smile, tracing the smooth, hard surface of her big toe up from around your [pc.nipple] and up to your [pc.lips] in an agonizingly slow journey. Her toes seem to leave a trail of cold heat in their wake, sending shivers down your spine. Every touch is nearly orgasmic, and you’ve only had a taste of her venom...");
	
	output("\n\n<i>“Go on, then,”</i> Lieve says evenly, running her big toe along the full circle of your [pc.lips]. <i>“A little proper worship, and I might just give you another dose... right on");
	if (pc.hasVagina()) output(" that cute little cunt of yours");
	else if (pc.hasCock()) output(" your slutty little lady-dick");
	else output(" that barren little patch of a crotch");
	output(".”</i>");
	
	output("\n\nYou obediently open your mouth and wrap your lips around the first of Lieve’s toes, sucking on it like a big, hard candy. Your hands wrap around her foot, holding it nice and steady for your inspection.");
	
	output("\n\nLieve’s feet are surprisingly small, almost dainty - not at all what you’d expect from the powerhouse of a fighter she is. They barely seem to fill your hands, though her toes are more than enough to keep your mouth busy. Your tongue slavishly works across her smooth, hard insectile plates, one after the other. The taste is impossible to describe - her chitin is just a touch oily, perhaps the equivalent of a myr’s sweat, but not altogether unpleasant to your offworlder’s taste. It’s almost sweet, in a way - a way that only serves to make you want to clean off every inch of her gleaming plates all the more.");
	
	output("\n\n<i>“There’s a good girl,”</i> Lieve coos as you work your way up along the sole of her foot. <i>“I wanna see that chitin shining when you’re done.”</i>");
	
	output("\n\nYou do your damnedest to make sure it does.");
	
	output("\n\nSatisfied with the way one foot glistens in the dim light of the bunker, you switch to the other, massaging it with your hands as you start to tongue-bathe her chitinous plates. Your worshipful motions eventually guide you further and further up her leg, to the rough patch where her chitin transitions to pale, creamy flesh. In your lust-addled state, you find yourself lavishing that alien join with your tongue even more so than her beautiful little feet, running your [pc.tongue] around the very edge of her bulky plates, getting into all those hard-to-reach places. All the while, you look lovingly up at Lieve, deep into the black wells of her eyes while you clean her. Hard to read as myr eyes are, you know you see a glimmer of returned lust there.");
	
	output("\n\nSeeing that you’ve polished her to a sheen, Lieve crooks a finger at you again. You move up, and she moves back, making you crawl up her body until you’re pressing her down onto her back, your lips pressing into hers. Lieve’s legs curl up and wrap around your [pc.hips], pulling you tight against her.");
	
	output("\n\nIn your state, the feeling of her tongue brushing your [pc.lips] is almost too much to bear. Your ");
	if (pc.hasCock()) output(" [pc.cock] throbs against Lieve’s leg, begging for the opportunity to slide into her wet and ready hole.");
	else if (pc.hasVagina()) output(" [pc.cunt] flushes with need, sending mind-breaking waves of pleasure through you every time it grinds against Lieve’s firm thighs or sodden crotch.");
	else output(" bare groin becomes an epicenter of pleasure, grinding against Lieve’s sodden crotch. Your skin is over-sensitive, burning with the throbbing heat of Lieve’s lusty venom.");

	output("\n\n<i>“You really love my venom, don’t you?”</i> Lieve purrs between kisses and caresses. <i>“Mmm, careful you don’t get </i>too<i> addicted, or I might just have to add you to my little harem... then again, maybe you’d like that?”</i>");
	
	output("\n\nYou know she’s only teasing, but in your envenomed state, you can’t deny just how aroused the suggestion suddenly makes you....");
	
	output("\n\nLieve’s hands gently push you down, guiding you back down to her legs. <i>“Now let’s put that talented tongue of yours back to work,”</i> she says, hooking one of her long legs over your shoulder. You find yourself staring down her tight ass and the cleft of her sex, but her gentle hands guide you to the fleshy underside of her leg. Lieve must have been a dirty, dirty girl to need all this cleaning... but you’re happy to help her.");
	
	output("\n\nLicking your way around Lieve’s leg, you lavish your lover with long drags of your [pc.tongue] along her inner thighs and the backs of her leg. You work your way all the way around her leg, circling again and again until your face is nestled into her crotch, and your tongue is probing deep into her rose-red pussy. She groans and squirms, back arching. Her cunt clenches around your tongue, trying to trap you inside her; your fingers have to join into the fray, teasing at her clit and ass until she’s crying out and grabbing your [pc.hair], pushing you deeper in.");
	
	output("\n\nA devilish urge crosses your mind. Before Lieve can get too carried away, you wrest yourself out of her crotch and start moving up. There’s so much more of her left to clean, after all. Lieve groans weakly as you break away from her twat, flopping back in a deflated mess on the desk and running a hand through her dyed hair. She groans out a guttural <i>“Fuck,”</i> laughing as you draw your tongue up her flat, muscular belly and up to the perky mounds of her tits. You gently swirl your [pc.tongue] around her perky red nipples, never quite close enough to wrap your lips around them, but enough to draw little gasps and moans from your lover.");
	
	output("\n\nYou make sure to clean every inch of her little tits before moving on. Your tongue traces its way through her underarms, using your hands to massage the tension out of her neck and shoulders. Her arms are next, and easy to clean: you make a show of sucking on each of her eight plated digits like a tiny little cock, polishing each one to a shine before moving on to the next.");
	
	output("\n\n<i>“Oh, you’ve really got me sopping wet,”</i> Lieve moans as you finish off her pinky, leaving a bridge of spittle between her chitin and your [pc.lips]. Her eyes, though, point lower than that. <i>“Still got one big, important place for you to clean off, though.”</i>");
	
	output("\n\nYou eye her curiously, until your lover gives you a gentle push off and crawls onto her knees. She turns around, chest pressing into the bunker wall, and gives you a sultry wink over her shoulder. She gives herself a spank, making even her tight little ass quake with the impact.");
	
	output("\n\n<i>“Dig in,”</i> she orders, shaking her hips all too enticingly. The lust drug in your veins flares, and in the blink of an eye you’re licking those two beautiful crescents of flesh on her rear, slowly working your way inwards towards your prize. Her smooth digits scrape against the rough concrete wall as you start to slip between her taut cheeks and into the cleft of her sex again - right back where you belong. Your hands grip her asscheeks firmly, squeezing hard enough to make her suck in a sharp breath and arch her back, and again when you spread them wide enough to get a good look at her crimson cunt.");
	
	output("\n\nLieve’s eyes flutter closed and her weight shifts back, planting her butt right on your face. You laugh and bear it, supporting her as much with your hands as you can; your tongue, meanwhile, slithers in between her slender pussylips and into the hot little channel between them. She moans, cupping one of her breasts so hard that a trickle of honey drools out of her teat, staining her fingers a creamy golden color. Too bad you can’t get a taste - the way she slurps up her lactic bounty, you imagine her nectar must be delicious.");
	
	output("\n\nLeft to your own devices, all you can really do is dig into Lieve’s sodden box and enjoy the sounds of your lover’s pleasure, all the while letting your own arousal mount. Resisting the urge to beg Lieve to fuck you raw grows harder by the second, until you’re panting and gasping, your hands moving desperately toward your crotch.");
	
	output("\n\nThe next thing to break your lust-addled stupor is Lieve’s hand grabbing your [pc.hair], pushing you deeper and deeper into her twat as she screams out in pleasure. A moment later and you’re on your back, flailing across the scattered pillows and blankets on the bunker floor. Lieve leaps on you, pulling your [pc.legs] up around her shoulders and burying her face into your crotch. Your eyes roll back, succumbing to overwhelming ecstasy - the venom in your veins responding to her lips and hands roaming all over your [pc.crotch].");

	output("\n\nYour back arches, [pc.hips] thrusting against Lieve’s lips as she");
	if (pc.hasVagina())
	{
		output(" kisses and licks at your");
		if(pc.hasClit()) output(" [pc.clit]");
		else output(" labia");
		output(", working hard to bring you to climax in her wake");
	}
	else if (pc.hasCock()) output(" runs her tongue along your [pc.cock]’s undershaft, using her fingers to jack your ladydick off with startling skill");
	else output(" traces kisses and licks on your barren crotch");
	output(". You’re on the receiving end of a direct hit of red myr venom, straight to your groin. The venom seeps in quickly, spreading out through your [pc.skin] until your lover’s every touch sends orgasmic shockwaves through you. A scream tears through your throat, echoing off the barren bunker walls - you’re sure the whole town can hear you, the whole <i>planet</i> probably, but that doesn’t matter to you: all you can think about is your overwhelming, orgasmic pleasure.");

	output("\n\nIt only takes a few seconds of oral attention to drive you over the edge, spurred on by the burning touch of Lieve’s venom. When the climax passes, you’re left gasping and clawing for breath. You lover grins at you, crawling up your body to plant another kiss on your [pc.lips].");
	
	output("\n\n<i>“The bath house’s got nothing on you,”</i> she teases, running a still-wet finger along the curve of your cheek. <i>“I wouldn’t mind letting you do that again... since you clearly don’t mind working for your high.”</i>");
	
	output("\n\nShe gives you a playful wink and crawls off of you, sashaying her hips on the way over to where her uniform fell off her shoulders. You watch appreciatively as your lover steps into her pants and wiggles them up, removing her ass from view. When the good stuff’s out of sight, you sigh and start going for you own gear. You quickly kit up, finished about the same time Lieve’s got her Federation uniform and coat in a more-or-less presentable condition.");
	
	output("\n\nYou stop to grab a handful of butt through her pants, pressing yourself up behind her close enough that your still-tingling skin sings with pleasure. Lieve smiles over her shoulder and leans back into your arms.");
	
	output("\n\n<i>“I should go round my girls up,”</i> she says after a long, companionable moment. <i>“They’re probably getting bored. Or some of the guards might be starting think they could use a couple more golds for their harem. See you, babe.”</i>");
	
	output("\n\nYou squeeze her butt before she can slip off, and earn yourself a venom-slathered kiss <i>“to go”</i> as she goes.");

	processTime(60 + rand(30));

	for (var i:int = 0; i < 4; i++)
	{
		pc.orgasm();
	}
	imbibeVenomEffects();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function lieveTourTheTown():void
{
	clearOutput();
	lieveHeader(false, true);

	flags["LIEVE_TOWNTOUR"] = 1;
	flags["LIEVE_DATEPOINTS"] = 0;

	output("<i>“So how about that tour?”</i> you ask. <i>“I wouldn’t mind learning more about the town.”</i>");
	
	output("\n\n<i>“Sure!”</i> Lieve says with a smile. <i>“You’ll feel just like a local by the time I’m done with you! Girls, think you’ll be alright on your own for a little bit?”</i>");
	
	output("\n\nMayren and Sierva nod amicably, with the buxom blonde adding, <i>“Have fun!”</i>");
	
	output("\n\nLieve gives her a pat on the head and extends an arm to you, allowing you to loop yours with hers before she takes the lead, bringing you out of the bunker and back onto the dusty road out of the town. The two guards standing at the wire gate salute her and open it up, allowing the two of you to walk past.");
	
	if (pc.characterClass == GLOBAL.CLASS_MERCENARY)
	{
		output("\n\n<i>“You can just leave your post like that?”</i> you ask your guide, first and foremost.");
		if (!pc.isAss()) output(" You don’t want to get her in trouble, after all.");
	
		output("\n\n<i>“This </i>is<i> my post!”</i> Lieve insists. <i>“Well, more or less. The only reason I’m out here and not, say, in the manor house with the other officers is to ‘help offworlders become acquainted with Federation society and bring them to understand our way of life in a positive and appealing manner.’ In other words, I’m a glorified tour guide. Not much else for me to do with the war on pause.”</i>");
	
		output("\n\nYou suppose that answers that.");
	}
	
	output("\n\n<i>“So!”</i> Lieve starts out with a smile, her grip on your arm pulling you");
	if (hasFuckedLieve() || hasFuckedLieveSolo()) output(" affectionately");
	else output(" uncomfortably");
	output(" close against her. <i>“Kressia. The city used to be huge, so close to the Goldie capital that you could spit between the two... if there weren’t all the caves in the way, anyway. We’re under one of the best and easiest accesses to the surfaces the Goldies had, used to be a gentle slope up before they built the big elevator access here, and then the airfield we’re using up top. Lucky for them, they’d already built that Great Elevator back in the capital by the time the Federation pushed in here, or it’d be nothing but Red Myr you offworlders were seeing.”</i>");
	
	output("\n\nShe grins at the thought, pointing you towards the huge building dominating the eastern side of town. Elevators can be seen zipping up and down from the surface, their passengers visible through sweeping glass windows. Most of the traffic, you’d imagine, would be Federation soldiers.");
	
	output("\n\nAt Lieve’s guidance, you find yourself walking that way, passing by military vehicles, soldiers on the street, and a handful of gold myr civilians trying not to be noticed by their occupiers. Your guide takes you down the road a ways, saying, <i>“I gather this is the posher part of town. Past the elevator building are manor houses, a lot of high-class shops for the queen-wannabes and merchant types. Most of ‘em closed down when the Federation shelled the city, but a few are getting back to business now that the fighting’s wound down. Come on, I’ll show you.”</i>");
	
	output("\n\nYou find yourself weaving through progressively smaller, more crowded streets until Lieve spots a small shop at the end of an avenue and guides you into it, saying, <i>“Best place for a drink in Kressia, bar none.”</i> The little corner shop reminds you of a bistro or coffee shop back home at a glance, though the place is decorated with hanging paper-wrapped lamps and silky-looking, free-standing walls that separate the tables from one another. A handful of well-dressed gold myr women are sitting around, half-visible through the paper barriers, sipping on earthen cups and chatting quietly. When you and Lieve enter, though, a hush quickly falls over the store, and you shiver as you feel every eye in the place on you.");
	
	output("\n\nLieve either doesn’t notice, or makes a good show of ignoring it as she leads you over to the counter at the back of the store where a svelte, young gold myr girl is sitting. Lieve smiles at her, but the cashier all but recoils as she’s approached, casting her eyes down to her feet and mumbling a very wooden greeting.");
	
	output("\n\n<i>“Two from your dirtiest kegs,”</i> Lieve says, taking the girl’s reaction in stride. She digs into her uniform coat’s pocket and presses a small silver coin onto the counter. After a moment’s hesitation, the gold myr snatches the coin and motions you towards a corner table. Again, Lieve smiles at her and leads you over to your assigned booth.");
	
	output("\n\nOnce you’re seated, Lieve pulls her coat off over the back of her chair and apologetically says, <i>“Sorry about that, [pc.name]. People here are still... adjusting to the Federation being around. Turns out we’re still not the most popular girls in town.”</i>");
	
	output("\n\nShe sighs and shakes her head. <i>“It’s getting better, though. People are coming out of their houses more, talking to us. A few even trust us enough to let us do the policing, now. We’ve broken up a few brawls, stopped robbers and the like. The Goldies in cities we took years ago are all proper citizens of the Federation now, I’m told. The people living here will be too, in a year or two. They just need time to adjust, that’s all.”</i>");
	
	output("\n\nAs Lieve’s speaking, the girl from the counter comes by and silently deposits two earthen mugs at your table, each full of a murky, bubbly liquid. Lieve raises her drink to you, smiling as the girl departs. You return the gesture and drink, following your companion’s example and holding the mug to your lips until it’s drained.");
	
	output("\n\nThe drink’s bitter and goes roughly down your throat, leaving you feeling scratched and hoarse. You fight down the urge to cough, and in exchange, find your cheeks reddening and eyes watering. It’s like the hardest moonshine you’ve ever tasted.");
	
	output("\n\n<i>“Like I said, best drink in Kressia!”</i> Lieve boasts, slamming her empty mug on the table loud enough to draw back the attention of the other patrons. <i>“Right?”</i>");

	processTime(25 + rand(10));
	
	// [Agree] [Disagree] [More!]
	pc.imbibeAlcohol(20);
	clearMenu();
	addButton(0, "Agree", lieveDrinkAgree, undefined, "Agree", "Hell yeah!");
	addButton(1, "Disagree", lieveDrinkDisagree, undefined, "Disagree", "Yuck!");
	addButton(3, "More!", lieveDrinkMore, undefined, "More!", "");
}

public function lieveDrinkAgree():void
{
	clearOutput();
	lieveHeader(false, true);

	flags["LIEVE_DATEPOINTS"] += 1;

	output("<i>“Whew! That’s some strong stuff!”</i> you agree, finishing off your drink with relish. God damn, that burns!");
	
	output("\n\nLieve laughs and claps you on the shoulder, hard enough to make you sway in your seat. <i>“I know, right? I’ve seen it bowl some of you offworlders right off their feet, too. Kicks like a wetraxxal, doesn’t it?”</i>");
	
	if (!CodexManager.entryViewed("Wetraxxal"))
	{
		output("\n\n<i>“What’s a wetraxxal?”</i>");
	
		output("\n\nLieve just throws her head back and laughs some more. ");
	}
	else output("\n\n");
	output("<i>“Alright, let’s get out of here. Plenty of things left to see!”</i>");
	
	output("\n\nYou and Lieve stand and head for the door. Again, your host offers her arm to you, leading you down one of the streets back towards the town square.");

	processTime(10 + rand(5));
	
	clearMenu();
	addButton(0, "Next", lieveTourTheTownII);
}

public function lieveDrinkDisagree():void
{
	clearOutput();
	lieveHeader(false, true);

	flags["LIEVE_DATEPOINTS"] -= 1;

	output("<i>“Ugh. It tastes like piss,”</i> you grunt, wiping the water from your eyes. Oh, that aftertaste is even worse.");
	
	output("\n\n<i>“That’s the point!”</i> Lieve laughs, rolling her eyes. <i>“What, don’t tell me you offworlders drink something like that sweet golden swill or something?”</i>");
	
	output("\n\nYou can practically feel every other customer in the place glowering at the two of you. <i>“Eh, well, anyway. Let’s get out of here. Plenty more to see in town!”</i> Lieve says, grabbing her coat and standing. You follow her all the way to the door, trying to ignore the unfriendly looks drilling into your back. Lieve sighs, rubbing one of her antennas before pointing out a street back towards the town square and leading you on down.");

	processTime(5 + rand(5));
	
	clearMenu();
	addButton(0, "Next", lieveTourTheTownII);
}

public function lieveDrinkMore():void
{
	clearOutput();
	lieveHeader(false, true);

	flags["LIEVE_DATEPOINTS"] += 2;
	pc.imbibeAlcohol(20);

	output("<i>“Gah, it’s piss!”</i> you laugh, hammering back the rest of your drink. <i>“Let’s get another round!”</i>");
	
	output("\n\n<i>“That’s the spirit!”</i> Lieve laughs, waving over a waitress and ordering again.");
	if (hasFuckedLieve() || hasFuckedLieveSolo()) output(" <i>“I knew I liked you for a reason.”</i>");
	
	output("\n\nAnother pair of drinks comes quickly, and this time, you raise your glass to your companion in a Terran toast. She cocks an eyebrow at you, but follows suit after a moment. <i>“Cheers!”</i> you say, clinking your mugs together before knocking back your drink.");
	
	output("\n\n<i>“Cheers!”</i> Lieve answers, almost more of a question than a toast, but she downs her drink with a relish. You both hiss and groan as the burning liquor goes down, a little less painfully than before. Still, your voice comes as a croak when you try to thank Lieve for the drinks.");
	
	output("\n\nShe grins and digs another small coin out of her coat, placing it very deliberately where the girl at the counter can see it before standing and offering a hand up to you. <i>“Come on. Can’t just sit here and get completely shit-faced, can we? Still have a tour to do!”</i>");
	
	output("\n\nWhile you wouldn’t mind just lounging around and getting wrecked, you suppose the locals wouldn’t be too happy putting up with a drunk offworlder and a rowdy red ant. You grab Lieve’s hand and let her haul you up.");
	if (hasFuckedLieve() || hasFuckedLieveSolo()) output(" She gives you a little wink before shifting her grip on your hand, locking her fingers with yours as she leads you back towards the door.");
	else output(" You thank her and follow your guide towards the door.");
	output(" From there, it’s a short jaunt back to the town square.");

	processTime(15 + rand(5));
	
	clearMenu();
	addButton(0, "Next", lieveTourTheTownII);
}

public function lieveTourTheTownII():void
{
	clearOutput();
	lieveHeader(false, true);

	output("You follow Lieve back to the town square, past the towering, bustling structure of the elevator terminal.");
	
	output("\n\n<i>“Let’s see... merchant row’s next!”</i> your companion decides, leading you across a wide open plaza in the middle of town. On the way, you pass by the ruins of a large statue in the heart of a small park, surrounded with benches and a handful of more relaxed-looking Gold Myr than you’re used to seeing in Kressia. Some of them even look up as you and Lieve pass by and, while none of them smile, you don’t feel the same hostility you did back at the high-class bar.");
	
	output("\n\n<i>“So what’s the story here?”</i> you ask, nodding towards the ruined statue - or what little is left of it: just the feet and, far above you, hands bracing the ceiling, severed at the wrists.");
	
	output("\n\nLieve shrugs, not slowing down. <i>“Was a monument to some kind of Goldie leader. A queen born here in Kressia, I think - her tits and ass were big enough to be, anyway. We were supposed to leave it alone, up until some jackass resistance fighters decided to climb up inside it with scoped rifles and started raining fire down on us. Shootout lasted a few hours - they had almost total cover up there, and most of the troops in town were armed with nothing but their sidearms. Finally managed to round up a couple of the sharpshooters from the expeditionary army and deal with it.”</i>");
	
	output("\n\n<i>“Of course, the rebels managed to set off some gunpowder charges before they died. Took out most of the statue, and sent rubble raining down on everybody.”</i> Lieve shakes her head, you almost think sadly. <i>“Killed more people with falling bits of statues than their guns. Mostly Goldies, too. Big rocks went slamming through roofs, storefronts, you name it. An absolute mess.”</i>");
	
	output("\n\nCurious, you ask where Lieve was during the fight.");
	
	output("\n\n<i>“Wasn’t in town,”</i> she answers. <i>“Everything but the reserves and guard forces were pushed into the trenches, getting ready for the big push on Gildenmere. My company was right on the vanguard. Only heard the story from my trench wives after the fact.”</i>");
	
	output("\n\nShe falls uncharacteristically silent for a little while after that, until you arrive at the promised merchant row on the western side of town. Suddenly, her cheer comes back with a vengeance as she announces: <i>“Anyway! This is merchant row, where you can buy pretty much anything that’s not restricted. Not much in the way of weapons available, sorry, but clothes and general items are on offer. Most of the shops here in town square are open again, and even some offworlders are starting to come down and open businesses here. We’ve even got a captured Goldie queen who’s generously put her merchant collective at the city’s disposal.”</i>");
	
	output("\n\nLieve gives you a mischievous wink at that, and nods to a very lavishly decorated storefront across the way. Several offworlders, mostly male, are eagerly making their way inside as you approach. <i>“There’s also a great dress shop around here, run by some sort of alien, I think. Haven’t had a chance to go there myself, but Mayren and Sierva both raved about it last time I gave them some spending money - dresses were a little too skin-showing for me to wear, but I sure enjoyed seeing them in ‘em!”</i>");
	
	output("\n\nYou can’t help but chuckle at the lascivious myr’s lusty smile as she leads you on down the road. <i>“Of course, the big attraction of this part of town is the bath house. We don’t have anything like it back in Federation territory: public baths, where everyone gets together to scrub down, socialize, just... relax, I guess. Being naked around strangers would normally be unthinkable to a red myr, it’s embarrassing and dishonoring - just for slaves and among lovers. But the Goldies, and some offworlders, seem to love it. My trench wives made me go after a while - well, talked me into it, really - and it was so different than anything I’d done before. I can definitely see why the Goldies flock to the place!”</i>");
	
	output("\n\nAfter a moment’s thought, Lieve stops and turns to you, her eyes practically twinkling. <i>“Hey, what do you say you and I hit the bath house? Shouldn’t be too crowded around now...”</i>");
	
	processTime(25 + rand(10));

	clearMenu();
	addButton(0, "Bath House", lieveTourBathhouse, undefined, "Base House", "Accompany Lieve to the Bath House.");
	addButton(1, "No, Thanks", lieveNoTYBathhouse, undefined, "No, Thanks", "You’re not up for a trip to a bath house right now.");
}

public function lieveNoTYBathhouse():void
{
	clearOutput();
	lieveHeader(false, true);

	output("<i>“No thanks,”</i> you say after a moment’s thought. <i>“Let’s keep going with the tour.”</i>");
	
	output("\n\nLieve chuckles. <i>“Suit yourself. C’mon, I’ve still got one big place to show you!”</i>");

	processTime(2);
	
	clearMenu();
	addButton(0, "Next", lieveTourManorHouse, false);
}

public function lieveTourBathhouse():void
{
	clearOutput();
	lieveHeader(false, true);

	output("<i>“Sounds like fun,”</i> you answer, starting towards the great big white building your guide’s pointed out.");
	
	output("\n\nLieve leads you on up the stairs to the massive double doors. The bath house is built into the side of the wide open cavern that Kressia lies in, and the doors take you into a carefully constructed, vaulted chamber supported by great stone pillars that line the chamber. The interior is a shining white, illuminated by electrical lights disguised as torches hidden away in sconces in the walls. Divans and cushions line the chamber, creating an environment that looks more like some sultan’s harem chamber than a waiting room. A handful of gold and red myr are sitting around: the golds lounging nude or in loose-fitting robes and towels, the reds sitting in their uniforms with their backs rigid, trying not to stare at the half-bare bodies on display.");
	
	output("\n\n<i>“Welcome to Kressia’s bath house,”</i> a voluptuous gold myr woman in a sheer, silky robe that’s almost entirely transparent says, stepping out from behind a desk and approaching you with sashaying hips. A second strip of much thicker silk is wrapped around her head, covering her eyes. <i>“What service may we provide you with today?”</i>");
	
	output("\n\nClearly the bath house’s workers don’t - and can’t - discriminate between their red and gold customers. Lieve smiles at her despite her blindness and says, <i>“Just a normal bath, please. If you have an empty room...”</i>");
	
	output("\n\n<i>“We do. Please, follow me,”</i> the hostess says, turning towards a small hallway across from you. As she moves, one of her hands sensuously brushes across Lieve’s hip, making the red myr’s antenna twitch cutely. You’re not sure if you’ve wandered into a whorehouse or a public bath anymore by the time you’re led to Lieve’s room, a small, circular stone chamber with a pool set into the floor. On the way, you pass several other small chamber, all the same as yours, which contain alternately lone red myr girls hidden by silky curtains, small gatherings of golds, and red myr women surrounded by what you assume are their trench wives, being lavished with attention. From the latter two, happy moans and giggles echo through the halls.");
	
	output("\n\nFinding your private room satisfactory, Lieve presses a few more coins into the hostess’s hands and thanks her. The blind myr smiles radiantly at the two of you, bows in a way that practically makes her dress slip off under the weight of her honey-laden breasts, and disappears through a sheer curtain that seals you and Lieve off from the rest of the house.");
	
	output("\n\n<i>“This place seems... very normal,”</i> you say as the hostess leaves. Less hostile than the rest of the town’s been to the red myr so far, anyway. Aside from the very sensual moans you can hear from the other chambers, even this bath house seems fairly mundane for some of the pleasure planets in the core.");
	
	output("\n\n<i>“Yeah,”</i> Lieve says, setting her coat and gunbelt down on the stone floor. <i>“We’re lucky about that. The women who run the place are some kind of spiritualists, I’m told. Baths are so important to the Goldies that they can’t refuse anyone access - even their enemies. The girls here wear blindfolds so they can’t distinguish between gold and red now that we’re here, though I’m pretty sure they can smell the difference. I sure can.”</i>");
	
	output("\n\nAfter a few seconds, Lieve adds, <i>“That’s why I wanted to take you here, I suppose. People in town are getting used to Federation occupation. Some of the elite, the Goldies that were wealthy and powerful before we came in, still hold a grudge, but the actual people who live here... doesn’t much matter if it’s a gold or a red sitting in the governor’s mansion, as long as the city’s not being bombed or shot up. Anyway, enough of that, let’s get on with the bath!”</i>");
	
	output("\n\nAs if to illustrate her point, Lieve grabs her shirt and hauls it up over her head, tossing it aside. Your eyes are instantly drawn to the warrior ant’s flat, chiseled stomach and up to the small swells of her breasts, each a perfect little handful of tit tipped with a crimson nipple. Her thumbs hook through her belt, flashing you an inviting grin.");

	processTime(20 + rand(10));
	
	if (pc.isNude())
	{
		flags["LIEVE_DATEPOINTS"] += 1;
		clearMenu();
		addButton(0, "Next", lieveTourBathhouseII, false);
	}
	else
	{
		output("\n\n<i>“I’ll look away if you want,”</i> she offers, though you get the distinct feeling she’s more interested in a show.");
		clearMenu();
		addButton(0, "Look Away", lieveTourBathhouseLookAway, undefined, "Look Away", "Ask Lieve to give you some privacy while you undress.");
		addButton(1, "Let Her See", lieveTourBathhouseLetHerSee, undefined, "Let Her See", "No reason to be ashamed of your body. Strip down.");
		addButton(2, "Show Off", lieveTourBathhouseShowOff, undefined, "Give Her A Show", "Give the myr a bit of a show as you undress.");
	}
}

public function lieveTourBathhouseLookAway():void
{
	clearOutput();
	lieveHeader(true, true);

	output("You take Lieve up on her offer and ask her to turn away for a moment. She makes a playful face and turns on a heel, spending her time pulling her pants and boots off. While she’s distracted, you slip off your [pc.gear] and turn towards the steaming bathwater. You tentatively dip your [pc.foot] in, testing the water: it’s nice and warm, but not too hot. It almost sucks you in, drawing you down into the pool until you’re resting on a stone seat inside, the water coming just up to your shoulders.");

	processTime(2);
	
	lieveTourBathhouseII();
}

public function lieveTourBathhouseLetHerSee():void
{
	clearOutput();
	lieveHeader(true, true);

	flags["LIEVE_DATEPOINTS"] += 1;

	output("You answer Lieve’s offer by stripping off your [pc.gear], leaving yourself bare before her. You’re keenly aware of her gaze on you as you strip, but you don’t play to it - you keep it cool and casual, undressing like you normally would and leaving your kit stacked beside Lieve’s. Lieve urges you to go in first, and you agree. You tentatively dip your [pc.foot] in, testing the water: it’s nice and warm, but not too hot. It almost sucks you in, drawing you down into the pool until you’re resting on a stone seat inside, the water coming just up to your shoulders. As you dip in, Lieve finishes undressing, leaving her slim slit and long legs bare for you in turn.");

	processTime(5+rand(3));
	
	lieveTourBathhouseII();
}

public function lieveTourBathhouseShowOff():void
{
	clearOutput();
	lieveHeader(true, true);

	flags["LIEVE_DATEPOINTS"] += 2;

	output("You give Lieve a playful grin and turn around, bending over to give her a view of your [pc.butt] as you start to peel off your [pc.gear]. You shake your hips, wiggling bare flesh for your myr guide. You spin back around, caressing your [pc.chest] and slowly slipping back towards the pool. You lower yourself in with a sensual grace, letting the water suck you in. Lieve watches with relish, cupping one of her own breasts and squeezing her crimson teat between plated fingers. She shimmies out of her pants, leaving her slim slit and long legs bare for you in turn.");
	
	processTime(5+rand(3));

	lieveTourBathhouseII();
}

public function lieveTourBathhouseII(newLine:Boolean = true):void
{
	if (newLine)
	{
		output("\n\n");
	}
	else
	{
		clearOutput();
		lieveHeader(true, true);
	}
	
	output("Lieve follows you into the pool as nude as you are, slipping down into the water and spreading her arms back around the stone edge of the pool. <i>“Nice and hot, right? Kressia’s built over a deep lava flow, heats up an underground lake they drilled down into. Brings up boiling water for the baths. Pretty clever, right?”</i>");
	
	output("\n\nYou resist mentioning they’ve been doing that on Terra for millennia. It seems like quite an accomplishment for the myr.");
	
	output("\n\nLieve cups a handful of water and brings it up to her shoulders, rubbing it into the skin where her chitin plates meet pale flesh. She picks up a small, oval object from the side of the bath and starts to caress her skin with it - the local equivalent of soap, you imagine. She makes something of a show, rubbing it into the recesses where plates meet skin, then down the sheer curves of her breasts, then back up to the other arm, sudsing up her rack before washing it all away. The whole show leaves a glistening sheen on your companion’s chest.");
	
	output("\n\nYou follow her example, taking up another of the small stones and starting to scrub down. You have to admit, washing off all the grime and sweat from your myriad adventures feels nice, especially in the steamy bath with a strangely smooth, almost lotion-like soap spreading across your [pc.skinFurScales]. You can feel your muscles relaxing, all the tension spilling out of you in moments. Oh, that’s nice...");
	
	output("\n\nAfter a few soothing minutes, you feel your eyelids growing heavy with relaxation. You lean back against the edge of the pool, letting the soapy stone wander across your bare body wherever you can get it. Lieve’s gaze on you sends tingles of unbidden arousal through you, her eyes wandering across your [pc.chest] and below, under the crystal clear water.");
	if (pc.libido() >= 70 || hasFuckedLieve() || hasFuckedLieveSolo()) output(" You smile under her attention, letting your soapy fingers play down between your [pc.legs] while you caress your [pc.breast], squeezing your [pc.nipple] between your slippery fingers.");
	else output(" You blush and shift slightly, trying to shield yourself from her probing gaze.");
	
	output("\n\n<i>“Hey,”</i> Lieve says, finally bringing her gaze back up. Once she has your attention, your myr guide slips up onto her knees on the stone seat and turns around. She leans out of the pool, resting on her elbows and moving her hips so that her ass and cunt are just barely below water. <i>“Think you could scrub my back for me? I promise I’ll do you after.”</i>");
	
	output("\n\nThe offer is implicit, but impossible to miss.");
	
	processTime(15 + rand(5));
	
	clearMenu();
	addButton(0, "Scrub Her", lieveTourBathhouseIIScrubHer, undefined, "Scrub Her", "Scrub Lieve’s back, but just with soap and water.");
	addButton(1, "Lick Her", lieveTourBathhouseIILickHer, undefined, "Lick Her", "You’ll get Lieve clean alright, starting with that tight little slit between her legs.");
}

public function lieveTourBathhouseIIScrubHer():void
{
	clearOutput();
	lieveHeader(true, true);

	flags["LIEVE_DATEPOINTS"] -= 1;

	output("You ignore your lascivious companion’s offer, starting to regret taking the lusty ant up on a group bath. You slip up behind Lieve and start to wash her back, scrubbing her plateless back down from shoulder to the first gentle incline of her buttocks. The lower you move, the greater the tension you can feel in your companion’s body - she moans softly when you near her swaying backside, clearly expectant of more... until you move back up, away from her sex. The tension relaxes, and Lieve sighs.");
	
	output("\n\n<i>“Thanks. Couldn’t reach there myself,”</i> she says dryly, though you get the sense she’s at least somewhat trying to disguise her disappointment.");
	
	rand(3 + rand(2));

	clearMenu();
	addButton(0, "Next", lieveTourManorHouse, true);
}

public function lieveTourBathhouseIILickHer():void
{
	clearOutput();
	lieveHeader(true, true);

	flags["LIEVE_DATEPOINTS"] += 3;

	output("Lieve’s been flirting the whole time during this tour of hers. Surprise date, more like it. You might as well reward the lascivious ant for her efforts, lacking subtlety though they may be. You wade across the pool and slip up behind Lieve’s back, getting your hands nice and sudsy before caressing her shoulders, digging into her pale flesh and massaging the tense muscles underneath. She releases a little moan as you start to work from her shoulder blades down her sides, fingers just passing by the flanks of her breasts, then down towards her slim hips.");
	
	output("\n\nYou can feel her body tense as your hands find the first gentle incline of her buttocks, meeting her cheeks and softly squeezing. She gasps sharply when you squeeze her, looking over her shoulder and smiling invitingly at you. Your hands push her forward ever so slightly, getting the crimson-plated beauty to lean out of the pool, raising her behind out of the water and into your waiting face.");

	output("\n\n");
	if (hasFuckedLieve() || hasFuckedLieveSolo()) output("You smile at the familiar sight of your myr lover’s sex rising from the steamy pool.");
	else output(" You can’t help but smile at the revelation of Lieve’s sex, rising from the steamy pool.");
	output(" Water runs in rivulets down her toned thighs and across her red plates, framing her rosy pussy in shimmering liquid. You lean in, letting your roaming hands converge between her legs, slipping open between her thighs to caress the tiny bud of her clit. She sucks in a sharp breath, and you giggle as you see her pussylips twitch at the pleasurable touch. You rub your way around her clit’s hood, gently massaging the tender skin around her buzzer until it’s as crimson as her plates and her whole lower body trembles with anticipation.");
	
	output("\n\nYou let your thumb and pinky move back from her clit, hooking into the folds of Lieve’s sex and spreading her out, just enough to let you lean close and slip your tongue straight in. You start nice and slow, matching your three main digits’ motions to the steady swirling of your tongue.");
	
	output("\n\n<i>“Mmm. You really know how to get a girl clean,”</i> Lieve moans, leaning back into your [pc.tongue]. Her fingers clutch at the pool’s edge, plates slipping along the wet stone as she fights for purchase. <i>“Yeah, that’s the spot...”</i>");
	
	output("\n\nYou dig your hand into one of her ass cheeks, squeezing Lieve between your roaming hands and the pool’s edge. A few more probing licks, and Lieve’s arms give out, sliding her face-first down onto the stone. In so doing, she leaves her slit perfectly even with your face, allowing you to really bury your face between her taut cheeks and start digging into her wet pussy. You keep licking and slurping at Lieve’s slit until she’s openly moaning, cupping her pert tits.");
	
	output("\n\nOut of nowhere, you feel Lieve’s legs squeeze around your [pc.hips], pushing her up and out of the pool. You stumble back as your myr lover hefts herself up onto the stone rim of the bath and turns around to face you, legs spread open invitingly.");
	
	output("\n\n<i>“That’s better,”</i> she smiles, bringing one of her hands down from her tits to the top of your head, gently guiding you back to your place between her thighs. Lieve’s legs wrap around your neck, drawing you back in, and her hands gently stroke your [pc.hair]. With the ant-girl seated like that, and you nestled so far beneath her, it’s easy to wrap your arms around her waist and hold her close in turn. Your tongue slips into her again, not as deep as before, but you’ve got easy access to her clit now, letting you slither your way from her rosy depths to the swell of her pleasure buzzer.");
	
	output("\n\nBetween little gasps and moans, Lieve picks up her own soap-rock and leans over you, rubbing it along your arms and shoulders. You shiver at the lotion-like texture spreading across your [pc.skinFurScales] - you guess she wasn’t lying when she said she’d scrub you in return. You pull yourself in as close as you can to your lover, giving her access to your back as far down as she can reach. The more you lick, the harder Lieve scrubs, wiping away all the grime and sweat remaining on you. Eventually, her arms are wrapped well around your sides, plated fingers doing less scrubbing and more caressing, tenderly stroking your [pc.skin], massaging you as you did for her earlier.");
	
	output("\n\n<i>“Getting close,”</i> Lieve murmurs, chewing her lip and squeezing her thighs around your [pc.face]. You take that as an invitation to redouble your efforts, tonguing Lieve’s rosy cunt until you can taste her girl-cum squirting out onto your [pc.tongue]. You recoil at the potent, musky taste that leaks out around your delving muscle, but suckle it down, lapping up all Lieve has to offer. She’s quickly left panting heavily, chest heaving with orgasmic aftershocks.");
	
	output("\n\nWhen you finally withdraw your tongue, Lieve flops back like a puppet with her strings cut, slumping back against the hard stone. <i>“Whew, that was... a good bath,”</i> she chuckles. <i>“I’m glad I talked you into it.”</i>");
	
	output("\n\nYou laugh and roll your eyes.");

	hasFuckedLieveSolo(true);
	processTime(30 + rand(15));

	clearMenu();
	addButton(0, "Next", lieveTourManorHouse, true);
}

public function lieveTourManorHouse(fromBath:Boolean = true):void
{
	clearOutput();
	lieveHeader(false, true);

	if (fromBath)
	{
		output("As clean as you’re going to get, you follow Lieve out of the bath and collect a towel from a rack nearby. You and your guide wrap yourselves up, drying off and collecting your clothes. <i>“Not a bad place to go after a hard day’s watch,”</i> Lieve says as she pulls her pants up. <i>“I ought to come here more often...”</i>");
	
		if (hasFuckedLieveSolo() || hasFuckedLieve()) output("\n\nYou reach down and grab the myr’s ass through her towel, saying you might just come with her some time.");
	
		output("\n\n<i>“Anyway,”</i> she laughs, buttoning up her shirt, <i>“We’ve still got one more important place to see in town. Shall we?”</i>");
	
		output("\n\nYou finish getting your gear strapped down and nod, letting Lieve lead you back out of the bath house. The blind hostess bows again as you depart, thanking you for your patronage. As you’re leaving, you brush shoulders with a group of perhaps a half dozen Federation troops going in, all laughing and smiling, the scent of booze heavy on them. Lieve gives them a friendly nod, and in turn gets a few cat-calls from the rowdy bunch as they catch sight of you.");
	
		output("\n\n<i>“Cute girl, Scout Thyrsa!”</i> one of them shouts over, raising a bottle of something that looks as viscous as syrup. <i>“Find yourself a new trench wife?”</i>");
	
		output("\n\nLieve makes a three-fingered gesture you assume is equivalent to flipping the other soldier the bird. <i>“Only because I got tired of fucking all your sisters!”</i>");
	
		output("\n\nThe soldier huffs, and her companions laugh and clap her on the back until they’re well through the doors. Lieve rolls her eyes and motions you onwards. <i>“Don’t mind them. Everyone wants a piece of you offworld girls. And the guys, too, but I’m pretty sure Colonel Nehzara and the other officers suck all of them up before they get down to the troops. Or at least, suck them all off until they’re too tired to play.”</i>");
	
	output("\n\nLieve laughs heartily at her own wit, guiding you down to the road towards the northern part of town square. ");
	}

	output("You follow her just a short distance eastwards along the main road until you come to a crossroads, and Lieve leads you north towards a wrought iron gate that separates the city cavern from a long, brightly-lit tunnel that snakes up towards a squat, wide manor house overlooking Kressia.");
	
	output("\n\n<i>“Last but not least, we’ve got the governor’s mansion. Originally belonged to a certain Goldie queen, but now it’s acting as the city’s command post. If you’re planning on staying in Kressia for a while, or maybe you want to do some serious business with us, you’ll want to talk to Marshal Sellera. She can get you travel visas, merchant papers, whatever you need. Plus, I hear she’s quite eager to meet powerful offworlders. She’s been hiring adventurer-types left and right when they come through. Could be work for you, if you’re interested. Even if not, you owe it to yourself to talk to her.”</i>");
	
	output("\n\nAs she’s talking, Lieve walks up to the gate and opens it up with a flourish. A couple of armed guards standing nearby nod to her as she passes through, waving you along after her. It’s a quick walk up the drive to the manor, where you find several armored vehicles circled around near the front door. Several officers are milling about, smoking what look like bright pink cigarettes - a local equivalent, you’re sure. Lieve snaps a salute to one of them, and receives a curt return and a slight nod from the black-chitined woman with what looks like a nine-pointed star on her cap.");
	
	output("\n\n<i>“Scout Thyrsa,”</i> the officer says, taking a long drag from her cig. <i>“I see you’re adapting well to your role as guide. Marshal Sellera’s occupied at the moment, I’m afraid. A few kids fresh out of the academy proved themselves quite... disappointing... on their first night of leave in town. Need to be punished.”</i>");
	
	output("\n\n<i>“Is that right?”</i> Lieve says, letting you hear the humor in her voice. <i>“Well, good old marshal’s quite the disciplinarian, after all.”</i>");
	
	output("\n\n");
	// if Marshal Sellera met: 
	if (flags["MET_SELLERA"] != undefined) output("You imagine so!");
	else output("You’re picking up on some fairly blatant innuendo here, but opt not to push it with a group of strangers.");
	
	output("\n\n<i>“Ah well,”</i> Lieve says after a moment’s laugh. <i>“So, any chance we could swing some honey wine from the basement? I’m");
	if (hasFuckedLieve() || hasFuckedLieveSolo()) output(" treating my girl here to a night on the town, understand?");
	else output(" trying to give Steele here a good first impression of our operation here.");
	output("”</i>");
	
	output("\n\n<i>“That so?”</i> the officer says. <i>“Go ahead. Stone knows we’ve got plenty of the swill lying around.”</i>");
	
	output("\n\nLieve gives her a smile and leads you in through the front door. Inside, you’re greeted by a huge open foyer, richly decorated with tapestries and landscape paintings. There were clearly more hanging on the walls once, now torn down by the new Red Myr occupants. Portraits of the queen who lived here once, perhaps. A wide staircase leads up to a second floor, where you can see several more officers and their attendants moving about, but Lieve leads you around back of the stairs to a small basement access. A smaller stone set of steps take you down under the manor, into a dimly-lit passage that opens into a wine cellar.");
	
	output("\n\n<i>“Take your pick,”</i> Lieve says, ushering you in. <i>“The queen who lived here was one of the most... productive... on the Council. They drank her tit-honey from one side of Gold country to the other. She kept enough down here to keep us swimming in honey for the rest of our lives, and our daughters’. To the victors go the spoils!”</i>");
	
	output("\n\nYou’ve got no idea how myr vintage their honey-booze, and so select a bottle at random from one of the many, many racks against the walls. The bottle’s clear, letting you see the thick yellow drink inside that sloshes viscously when you move it. Even through the cork, you can smell the sweetness in the air around it, making your nose tingle ever so slightly.\n\n");
	//Cheatsy doodle way to wrap that passed variable around the item loot.
	if(fromBath) pc.createStatusEffect("FromBath");
	
	// Stuff for getting a Honey Wine bottle here.
	itemScreen = postWineCellarShitForLieve;
	lootScreen = postWineCellarShitForLieve;
	useItemFunction = postWineCellarShitForLieve;
	
	itemCollect([new HoneyWine()]);
}


public function postWineCellarShitForLieve():void
{
	clearOutput();
	lieveHeader(false, true);
	//End cheaty shit and clean up the cheaty status effect.
	var fromBath:Boolean = pc.hasStatusEffect("FromBath");
	pc.removeStatusEffect("FromBath");
	output("As you exit the wine cellar, you ask Lieve if she has anything left in this little tour of hers.");

	output("\n\n<i>“That’s about it,”</i> she admits,");
	if (flags["LIEVE_DATEPOINTS"] >= 6) output(" putting an arm around your shoulders");
	else output(" stuffing her hands in her coat pockets");
	output(" as the two of you make for the door. <i>“At least for all the important places.”</i>");

	output("\n\nYou nod, and a companionable silence falls over you both as you return down to the path to Kressia, and start back towards Lieve’s bunker.");

	if (flags["LIEVE_DATEPOINTS"] <= 5)
	{
		output("\n\n<i>“So... yeah,”</i> Lieve says, eyes low to the ground as you walk back. <i>“So, uh, look... I know I’m not the best tour guide around. This sort of thing doesn’t exactly come naturally to me...”</i>");

		output("\n\n<i>“Acting as a guide, or...?”</i>");
		
		output("\n\nLieve fidgets a bit. <i>“At, uh... at dating, I guess. I’d normally just bump something like this down to one of my scouts, but you... I just wanted to get to know you better. Have some fun, get a few drinks, maybe see where things go. I know today was kind of lame, but it was worth a try, you know?”</i>");
		
		output("\n\nYou have to admit, the myr version of a date is very different than what you’re used to.");
		
		output("\n\nYour companion makes a grunting noise and rubs at one of her antenna. <i>“I knew this was a terrible idea. Should never have let my wives talk me into it.”</i>");
		
		output("\n\nYou’re already at the edge of town by the time Lieve stops grumbling to herself. <i>“Sorry for wasting your time, [pc.name]. I didn’t... well, look, I hope you at least got something out of all this. Maybe.”</i>");

		output("\n\nYou tell Lieve that, if nothing else, it was a perfectly serviceable tour. She smiles at that, slapping you on the shoulder and turning towards the bunker just ahead. <i>“Well, thanks for walking me back, [pc.name]. I know this wasn’t exactly the best night on the town, but if you aren’t completely tired of me by now, I know my girls would be devastated if the cutest offworlder to come through didn’t come visit again...”</i>");
		
		output("\n\nShe gives you a wan smile and steps through the bunker’s door.");
	}
	else
	{
		output("\n\n<i>“So, did you have fun?”</i> Lieve asks as you walk back. <i>“I know I did.”</i>");
		
		output("\n\nYou smile at your insectile companion and answer that you did. She returns the gesture, wrapping her arm around your shoulder as you walk.");
		
		output("\n\n<i>“I’m glad. You know, I don’t usually do this whole... dating thing. My wives talked me into it; apparently Goldies do it all the time. Doesn’t come naturally to us reds, though. Normally we’re much more forward about this sort of thing. More aggressive. But still...”</i> Lieve pulls you a little closer, letting her hand slip a bit further down your back. <i>“I enjoyed that. Maybe you’ll let me take you out again sometime... or at least");
		if (fromBath) output(" back to");
		output(" the bath house...”</i>");
		
		output("\n\nBy the time she’s done talking, you’re already at the door to Lieve’s bunker. She leans up against the concrete entrance and grins");
		if (pc.tallness < 61) output(" up");
		else if (pc.tallness > 73) output(" down");
		output(" at you. <i>“So... wanna come in for a bit? Let the girls help us relax for a bit?”</i>");
	}
	
	processTime(25 + rand(10));
	
	clearMenu();
	addButton(0, "Sure", lieveTourSureFollow, undefined, "Sure", "Follow her in.");
	addButton(1, "Later", lieveTourMaybeLater, undefined, "Later", "Tell Lieve you’ve got places to be.");
}

public function lieveTourSureFollow():void
{
	clearOutput();
	lieveHeader(false, true);

	output("<i>“Sounds like fun,”</i> you say. Lieve grins, and leads you inside. Seeing your arrival, the two golden trench wives perk up immediately. The bustier of the two leans back in her cushioned seat, spreading her legs and groping one of her breasts until a trickle of honey comes out.");
	
	output("\n\n<i>“Welcome home, mistress,”</i> she purrs.");
	
	output("\n\n<i>“And company,”</i> Sierva adds, reaching over to stroke her companion’s other teat. <i>“How was your date?”</i>");
	
	output("\n\nLieve laughs and shrugs out of her coat, slowly making her way towards her trench wives. <i>“I’m glad you two talked me into it. But now that I’ve done my part, it’s time to do yours.”</i>");
	
	output("\n\nThe golden girls coo and purr. <i>“Our pleasure...”</i>");
	
	processTime(7 + rand(4));

	// [Harem Fuck Scene Here]
	clearMenu();
	if (pc.hasVagina()) addButton(0, "Next", lieveFuckHarem);
	else if (pc.hasCock()) addButton(0, "Next", lieveFuckHaremDickVersion);
}

public function lieveTourMaybeLater():void
{
	clearOutput();
	lieveHeader(false, true);

	output("<i>“Maybe next time,”</i> you answer.");
	
	output("\n\nLieve sighs, but her smile doesn’t fade. <i>“Next time, then, [pc.name]. See you!”</i>");
	
	output("\n\nYou start to turn away from Lieve, but feel a pair of chitinous hands grab your arms, hauling you back around to face her. The red ant pulls you in close, running a plated finger across your cheek before pressing her lips to yours, much more gently than you would expect from the warrior woman, so tenderly you’d think she was afraid to break you. When she pulls back, she’s smiling from ear to ear, teasing one of her antennas with her fingers.");
	
	output("\n\nWordlessly, Lieve slips back into her home, leaving you with your [pc.lips] tingling with the aftershocks of her aphrodisiac venom.");

	processTime(3 + rand(2));
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public static const LIEVE_LATEGOODBYE_NO:uint = 1;
public static const LIEVE_LATEGOODBYE_YES:uint = 2;
public static const LIEVE_LATEGOODBYE_COMPLETE:uint = 3;

public function tryProcLateGoodbye():Boolean
{
	if (hours >= 17 && hasFuckedTrenchWives() && flags["SIERVA_TALK"] != undefined && flags["SIERVA_LATEGOODBYE_RESPONSE"] == undefined)
	{
		lieveTheLateGoodbye();
		return true;
	}
	return false;
}

public function lieveTheLateGoodbye():void
{
	clearOutput();
	showName("\nSIERVA");
	showBust("SIERVA");
	author("Savin");

	output("You head out of the bunker and back out in the cold, dank cavern leading out of Kressia. The guards standing at the city gate nod politely at you, giving no indication they know - or more likely, care - what you and Lieve have been up to. You turn away from the bunker, starting to decide on your next destination, when you hear a whispering voice behind you:");
	
	output("\n\n<i>“Steele. Wait.”</i>");
	
	output("\n\nYou turn, looking over your shoulder back into the bunker’s doorway. One of Lieve’s wives is standing there - Sierva, the tall, dark-haired warrior myr. She’s clutching a blanket around her shoulders, more for warmth than modesty if all the cleavage on display is any indicator. She’s nowhere near as busty as her companion, Mayren, but now that you look at her, Sierva’s far from flat chested. She’d make most human girls jealous with those perfectly rounded D-cups, each tipped with a small copper point just hidden from sight by the blanket.");
	if (pc.biggestTitSize() >= 4) output(" Of course, she can’t hold a candle to your prodigious mounds!");
	
	output("\n\nWhile you’re paused, eyes wandering over her body, Sierva takes the opportunity to approach. As she steps out into the electrical lights hanging from the gate, you can see her face twisted into a mask of nervousness, completely unbecoming someone who was, mere moments ago, sitting naked with her body invitingly on display for you.");

	output("\n\n");
	if (pc.isNice()) output("<i>“Sierva? Are you alright?”</i> you ask, brow furrowing with concern.");
	else if (pc.isMischievous()) output("<i>“You look like you’ve had better days,”</i> you say.");
	else output("<i>“What is it?”</i> you ask impatiently.");
	
	output("\n\nShe steps up close to you, well inside your personal space - close enough that you almost think she’s going to kiss you - before one of her four arms slips out from the blanket. You take an instinctive step back when you see what she’s got, fearing for a split second she’s pulling a knife on you... until the handle turns out to be nothing more than a small stone cylinder, about the length of her hand.");
	
	output("\n\nSierva casts a nervous look between you and the handful of Federation soldiers at the gate before whispering, <i>“Steele, I hate to ask. But after, you know, we’ve gotten closer than most people. I need a favor. I’ll beg you if I have to...”</i>");
	
	output("\n\nShe seems to fight for words, and after a few moments, tries to press the stone rod into your hand. <i>“You’re an offworlder. You can go anywhere you want, almost. Even... even Gildenmere, right?”</i>");
	
	output("\n\nYou suppose you could. Both factions seem more than willing to let you into their territory. <i>“I could,”</i> you answer after a moment’s thought. <i>“Why?”</i>");
	
	output("\n\nA touch of worry fades off Sierva’s face. <i>“If you ever happen to, I suppose find yourself in Gildenmere... all I ask is that you give this to my...”</i> she pauses, struggling to find the words. Finally, she says, <i>“A friend of mine. Please. I’ll do anything you ask.”</i>");
	
	output("\n\n<i>“A friend?”</i> you ask, taking the stone rod from her. It’s a small thing, slender, carved with symbols that your nanomachines can’t make heads or tails of.");
	
	output("\n\nSierva pointedly avoids your eyes. <i>“More than that, but... please? She probably thinks I’m dead. Everyone back home does, I’m sure.”</i>");

	processTime(10 + rand(7));
	
	// [Lieve?] [Friend] [Alright] [No]	
	clearMenu();
	addButton(0, "Lieve?", lieveLateGoodbyeAskLieve, undefined, "Lieve?", "What does Lieve think about this? Has Sierva told her mistress?");
	addButton(1, "Friend?", lieveLateGoodbyeFriend, undefined, "Friend", "Ask Sierva about this ‘friend’ of hers.");
	addButton(2, "Alright", lieveLateGoodbyeAlright, undefined, "Alright", "Promise Sierva you’ll deliver the letter.");
	addButton(3, "No", lieveLateGoodbyeNo, undefined, "No", "Tell Sierva you won’t help her.");
}

public function lieveLateGoodbyeAskLieve():void
{
	clearOutput();

	showBust("SIERVA");
	showName("\nSIERVA");
	author("Savin");

	output("<i>“Have you told Lieve about this?”</i> you ask, eyeing the rod.");
	
	output("\n\nSierva shakes her head. <i>“Please! Don’t tell her!”</i> she says, much louder than before, and quickly covers her mouth with two of her hands. She glances over your shoulder at the guards nearby, who thankfully don’t seem to have heard.");
	
	output("\n\nMore quietly, Sierva says, <i>“Please don’t. Trench wives aren’t allowed to send messages home. Lieve would be furious I even asked you. I might be sending home secrets about the Federal army, or enemy battle plans, or anything.”</i>");
	
	output("\n\n<i>“Are you?”</i>");
	
	output("\n\nShe balks. <i>“N-no! I just want... I just want my somebody to know I’m still alive. That I’ll see her again someday.”</i>");

	processTime(7 + rand(5));
	
	addDisabledButton(0, "Lieve?");
}

public function lieveLateGoodbyeFriend():void
{
	clearOutput();
	
	showBust("SIERVA");
	showName("\nSIERVA");
	author("Savin");

	output("<i>“Tell me about this friend of yours,”</i> you prompt.");
	
	output("\n\nAgain, Sierva avoids your gaze, seemingly hesitant. You stare");
	if (pc.tallness < 61) output(" up");
	output(" down");
	output(" at her until she breaks down and says, <i>“My lover. Well, she was, before this awful war started. She was the music instructor at the thollum I taught at. Beautiful, charismatic, intelligent. I was smitten the moment I laid eyes on her.”</i>");
	
	output("\n\nOh, is that all?");
	
	output("\n\nShe blushes a dark, coppery color and chews on one of her chitinous fingers. <i>“We met, really met, at a camp for the girls. Camping on the surface, not far from here, really. We hit it off wonderfully, and when we came back home...”</i>");
	
	output("\n\n<i>“I get it,”</i> you say, not wanting");
	if (pc.isAss()) output(" to waste more time on her explanation");
	output(" to make her keep talking when she’s clearly uncomfortable");
	output(".");
	
	output("\n\nSierva nods, relieved. <i>“I just want her to know I’m still alive, Steele. If she even is. I was conscripted before she was, but the last letter I got from her said she was being shipped off to training, too. Maybe six months before Lieve captured me.”</i>");

	processTime(7 + rand(5));
	
	addDisabledButton(1, "Friend?");
}

public function lieveLateGoodbyeNo():void
{
	clearOutput();

	showBust("SIERVA");
	showName("\nSIERVA");
	author("Savin");

	if (pc.isAss()) output("<i>“I’m not delivering this for you,”</i> you say flatly");
	else output("<i>“I’m sorry, Sierva. I can’t help you,”</i> you say");
	output(".");
	
	output("\n\nHer shoulder slump as you return the rod to her hands. <i>“I understand. Please, don’t tell Lieve I tried this. She’ll... I don’t know what she’d do.”</i>");
	
	output("\n\nYou tell her you won’t");
	// I've wired this up to be a single-time encounter for now, so...
	if (9999 == 0) output(", this time");
	output(", and add that she should go back inside before her owner misses her. Sierva sighs and does as you bid her, silently making her way back inside.");

	flags["SIERVA_LATEGOODBYE_RESPONSE"] = LIEVE_LATEGOODBYE_NO;

	processTime(10 + rand(5));
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function lieveLateGoodbyeAlright():void
{
	clearOutput();

	showBust("SIERVA");
	showName("\nSIERVA");
	author("Savin");

	output("<i>“Alright, I’ll do it,”</i> you say, putting the rod into your pack. <i>“Now this friend of yours, how do I find her?”</i>");
	
	output("\n\nYou can see a weight lifting off of Sier’s shoulders as she answers, <i>“Thank you, Steele. Thank you so much. Her name is Iaya, and she lived in Gildenmere last time I wrote to her. She’s got the lushest orange hair you’ve ever seen, and a pair of antenna rings. You’ll know her when you see her, I promise.”</i>");
	
	output("\n\nYou suppose that’s enough to go on. A music-inclined, red-headed gold myr. You file that away, and tell Sierva to go back inside before she catches cold.");
	
	output("\n\nShe nods at the instruction, but pauses long enough to plant a small, tender kiss on your cheek. <i>“Thank you. I mean it.”</i>");
	
	output("\n\nYou smile at her as she returns to her mistress.");

	flags["SIERVA_LATEGOODBYE_RESPONSE"] = LIEVE_LATEGOODBYE_YES;

	processTime(10 + rand(5));
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function lieveBloodSample():void
{
	clearOutput();
	lieveHeader(false, true);

	flags["LIEVE_BLOOD_SAMPLE"] = 1;

	output("Surely Lieve can see the benefit of helping out the Xenogen scientists. A myr gene mod for her race would certainly spike the popularity of the reds among offworlders, and get Xenogen on her side. As diplomatically as you can, you ask the perky ant-girl if she wouldn’t mind donating a little blood to the cause.");
	
	output("\n\n<i>“Blood?”</i> Lieve echoes, cocking an eyebrow at you. <i>“What do scientists need my blood for?”</i>");
	
	output("\n\n");
	if (pc.isBimbo()) output("<i>“For, like, science and stuff!”</i> you answer giddily. <i>“They wanna help people like me be more like you!”</i>");
	else output("<i>“They want to make a gene-mod that’ll turn people like me into gold and red myr. The Xenogen scientists just need some samples from a red myr like you to finish it.”</i>");
	
	output("\n\n<i>“Your scientists can do that? Really? That’s... even more amazing than the medicine they gave us after the war ended,”</i> Lieve says. <i>“So you offworlders really can just... change whatever race you are? I’d heard that, but I’m not sure I ever really believed it.”</i>");
	
	output("\n\nYou assure her that they can, and that a few droplets of her blood - plus maybe a few strands of hair and flakes of skin for good measure - could help make sure there’s a galaxy full of wanna-be reds in no time.");
	
	output("\n\nShe grins. <i>“Well, when you put it like that... I guess I ought to help you, huh? It’s practically my patriotic duty.”</i>");
	
	output("\n\nNow that’s the spirit. Lieve pulls the hatchet off of her belt and makes quick work of drawing its blade across one of her fingers. She squeezes several droplets of blood into a vial you hand her before tasking Mayren to go fetch her a bandage. You put a cap on the vial and flash Lieve a smile. Giving her your thanks, you flip the vial into your pack, ready to be delivered to Nevrie back at the DMZ.");
	
	output("\n\n<i>“Hard to believe that’s all it takes,”</i> Lieve says with a chuckle, starting to wrap her finger up. <i>“So, they’re going to be making transmutations for both myr races, aren’t they?”</i>");
	
	output("\n\nYou nod. That’s why you needed her blood, after all. They’re already working on one for the Golds.");
	
	output("\n\nShe nods thoughtfully. <i>“I’m glad. I’ll be interested in seeing what they come up with.”</i>");
	
	if (pc.isFeminine()) output("\n\nWith a teasing wink, she adds <i>“Maybe I’ll see </i>you<i> as a hot little piece of red myr ass some day?”</i>");

	output("\n\n");
	pc.createKeyItem("Red Myr Blood", 0, 0, 0, 0, "A vial of blood sampled from a red myr.");
	output("<b>(Key Item Acquired: Red Myr Blood)</b>");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//War is Hell for the Critical Reading Deprived
//If PC has Sierva’s rod, add to each of the four checkpoints: [Question]
//[Question]
//Ask the guards here about Sierva’s friend, Iaya. It’s a long shot, but...
//At any gate by the North East
public function questionTheWrongGates():void
{
	clearOutput();
	showName("QUESTIONING\nTHE GUARDS");
	showBust("MYR_GOLD_GUARD","MYR_GOLD_GUARD","MYR_GOLD_GUARD");
	output("You approach the guards and show them Sier’s stone rod, asking them if they recognize it, or if they knew an orange-haired soldier by the name of Iaya. Some of the guards take the stone and look it over, but none of them can identify the markings, nor do they recognize the name and description.");
	output("\n\nSighing, you thank them for their time and move on.");
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//At the North East gate
public function questionTheRightGate():void
{
	clearOutput();
	showName("QUESTIONING\nTHE GUARDS");
	showBust("MYR_GOLD_GUARD_HAMMER","MYR_GOLD_GUARD","MYR_GOLD_GUARD");
	output("You approach the guards, eying the strange crests on their vehicle. After a moment’s thought, a hint of recollection teases at your brain and you pull out the stone rod from your pack. Looking it over, you quickly match up one of the strange symbols on the rock to the one printed on the sides of the vehicles clustered around the barricade.");
	output("\n\nA sentry standing a few paces away catches your gaze and stalks over, resting a tremendous warhammer on her shoulder with almost frightening ease. <i>“Offworlders aren’t permitted past this checkpoint,”</i> she informs you cooly. <i>“Please step back.”</i>");
	output("\n\n<i>“Wait, wait,”</i> you say, holding out the rod. <i>“Do you know what this is?”</i>");
	output("\n\nThe soldier twitches her feelers at you and reaches one of her hands out to take it from you. She looks it over a second and says <i>“It’s a soldier’s identification,”</i> she says, using another of her hands to reach under her uniform’s collar and draw out one just like it, hanging from her neck by a small chain. <i>“Where’d you get this?”</i>");
	output("\n\nYou tell her that you’ve visited a Federation city and met one of the trench wives there, who gave it to you. The woman scrunches her nose when you mention the captive myr’s predicament, and she hands the tag back to you. <i>“This belongs to Captain Sierva Marsail. I remember her... she used to command this company, but that was years ago. She was listed as killed in action.”</i>");
	output("\n\nYou assure her that Sierva is indeed alive, and looking to get a message to her lover - whose description you give her. <i>“Yeah, I saw her once. Came looking for the captain a couple weeks after she went missing. I hate to give you bad news, offworlder, but I heard her whole unit got wiped out a few months ago. The reds steamrolled the battalion defending Kressia not long before First Contact and the cease fire.”</i>");
	output("\n\nWait, Iaya’s unit was defending Kressia? Shit...");
	if(pc.isMischievous()) output(" even you can’t manage to laugh at the irony of it.");

	output("\n\n<i>“Sorry, star-walker,”</i> the guard says. <i>“If you end up back that way, tell the captain we’ll be coming to get her... someday. Stay strong.”</i>");
	output("\n\nYou nod and let the guardswoman get back to her post.");
	flags["LEARNED_IAYAS_FATE"] = 1;
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Add [Iaya] to (Lieve:) Trench Wives
//[Iaya]
//Tell Sierva the bad news
public function tellSiervaTheBadNews():void
{
	clearOutput();
	showName("\nSIERVA");
	output("<i>“I’ve got some bad news for you, Sierva,”</i> you whisper, subtly pawning the ID tag back to her while Lieve isn’t looking. <i>“Iaya’s unit got wiped out. I’m sorry.”</i>");
	output("\n\nSierva’s black eyes go wide, and her lips tremble as her fingers close around her myr dog tags. <i>“Oh,”</i> she manages to say, voice cracking. You give her shoulder a squeeze and tell her to stay strong.");
	output("\n\nYou excuse yourself, letting Sierva take the time she needs to process what you’ve told her.");
	processTime(2);
	
	rewardXP(500);
	
	flags["SIERVA_LATEGOODBYE_RESPONSE"] = LIEVE_LATEGOODBYE_COMPLETE;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
