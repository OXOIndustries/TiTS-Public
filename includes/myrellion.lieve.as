public function lieveHeader(isNude:Boolean = false, isSolo:Boolean = false):void
{
	showName("\nLIEVE");
	author("Savin");

	if (isNude)
	{
		if (isSolo) showBust("LIEVE_NUDE");
		else showBust("LIEVE_NUDE", "MYR_NUDE", "MYR_NUDE");
	}
	else
	{
		if (isSolo) showBust("LIEVE");
		else showBust("LIEVE", "MYR", "MYR");
	}
}

public function hasMetLieve():Boolean
{
	if (flags["MET_LIEVE"] != undefined) return true;
	return false;
}

public function hasFuckedLieve():Boolean
{
	if (flags["FUCKED_LIEVE"] != undefined) return true;
	return false;
}

public function hasFuckedTrenchWives():Boolean
{
	if (flags["FUCKED_TRENCHWIVES"] != undefined) return true;
	return false;
}

public function hasFuckedLieveSolo():Boolean
{
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

public function encounterLieve():Boolean
{
	output("The pillbox guarding the gates of Kressia is a small but surprisingly cozy accommodation. The central chamber's got several carpets and cushions spread out, and some chairs lining the walls. A viewport gives a wide view of the craggy approach to Kressia, interrupted by a trio of heavy machine-guns bolted to the concrete.");

	output("\n\nLieve's here, idly watching the approach through the viewslit. Her harem lounges around behind her, looking bored and horny but unwilling to disturb their mistress at present.");
}

public function lieveInitialEncounter():void
{
	clearOutput();
	lieveHeader();

	output("You slip inside the bunker’s open door, following the voice of the red myr woman inside. Or women, by the sounds of things. You hear several distinct, feminine voices inside: two laughing and giggling, a third grumbling as you hear belts clicking and clothes rustling. A few steps down a corridor take you to an open interior with a viewslit looking out over the trench lines. Inside, you see the red myr soldier who poked her head out, her purple hair mussed and her uniform disheveled. To your surprise, a pair of gold myr are lounging next to her, both buck naked and clearly aroused, their large areolae stiff and their bare twats reddened with excitement.");
	
	output("\n\nThe soldier finishes buckling her belt and looks up at you, running a hand through her purple hair. <i>“Sorry about that,”</i> she chuckles, resting a hand on one of the gold myr’s heads. The nude woman makes a wordless sound of pleasure and nuzzles against the red’s chitinous palm. Scratching the golden’s blonde hair, the soldier continues, <i>“Look, the Commandant’s said all you offworlder types can go out into the tunnels even with the lockdown, but if you know what’s good for you, you won’t. Can’t stop you, but I can at least warn you. Goldies mined the tunnels pretty good, and now that the fighting’s done, plenty of scavengers are out looking to loot or breed. Some are myr, some... not.”</i>");
	
	// {if PC’s been in No-Man’s Land before: 
	if (9999 == 0)
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
	if (pc.mf("m", "f") == "m") output(" ready to dismiss you");
	else output(" to run out of things to say");
	output(" until the other gold myr girl with her, a raven-haired warrioress in her own right, slips up behind the red-plated soldier, pressing herself into her companion’s back and murmuring, <i>“Aren’t you going to introduce yourself?”</i>");
	
	if (pc.mf("m", "f") == "m")
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
	
	if (pc.hasCock()) output("\n\n<i>“Steele?”</i> the ravenette smiles. <i>“What a firm, strong name...");
	else output("<i>“Good to meet you, Steele,”</i> Lieve says with a smile, gently stroking the blonde girl’s hair.");
	
	output("\n\n<i>“Oh, and these are my trench wives, Mayren,”</i> she says, patting the blonde’s head, <i>“and Sierva,”</i> she finishes, reaching behind herself to put a hand on the stronger-looking ravenette’s hip. The gold-plated warrior makes a pleasured sound and wraps her arms around Lieve’s waist.");
	
	output("\n\nLieve chuckles and says, <i>“Don’t mind them, they just got themselves a nice helping of my venom. Makes them nice and affectionate, doesn’t it girls?”</i> The two gold myr coo and moan, nuzzling against Lieve.");
	
	output("\n\nTheir mistress grins and turns her attention back to you. <i>“So, since you’re here, anything I can help you with?");
	if (pc.mf("m", "f") == "f" && pc.lust >= 33) output(" Or maybe you’re getting some other ideas...?");
	output("”</i>");

	processTime(30);
	lieveMenu();
}

public function lieveRepeatEncounter():void
{
	clearOutput();

	if (!hasFuckedLieve() && pc.mf("m", "f") == "m")
	{
		output("<i>“Hey again, Steele,”</i> Lieve says, giving you a friendly smile. Her harem girls look up excitedly when you enter, and they quickly go from lounging on the carpet and chairs to curling up around their mistress, getting very friendly with Lieve’s thighs.");
	
		output("\n\nShe smiles and runs a hand through her blonde slave’s hair. <i>“Anything I can help you with, Steele? Or did you just come for the eye candy here?”</i>");
	}
	else if (hasFuckedLieve() && pc.mf("m", "f") == "m")
	{
		output("<i>“Hey again, Steele,”</i> Lieve says, turning to you and resting her shoulder against the side of the bunker. She gives you a friendly smile, and her harem girls make a show of crawling towards you, both with lust-filled and inviting looks writ plain across their faces.");
	
		output("\n\nTheir mistress chuckles, shaking her head at their wanton display. <i>“So, since you’re here, anything I can help you with? If not, it looks like my girls here would certainly like to make the trip worthwhile for you...”</i>");
	}
	else if (!hasFuckedLieve() && pc.mf("m", "f") == "f")
	{
		output("<i>“Hey, [pc.name],”</i> Lieve says, perking up as you approach. She gives you a big, friendly smile and motions you closer. Her harem girls look up and smile at you; there’s little subtlety in the way they shift to make themselves look more appealing and inviting for you, sitting with chests out and legs spread.");
		
		output("\n\n<i>“Need help with anything?”</i> Lieve offers. <i>“Or");
		if (pc.lust() >= 33) output(" did you have something else in mind?");
		else output(" we could just hang out...");
		output("”</i>");
	}
	else
	{
		output("<i>“Hey, [pc.name],”</i> Lieve beams, grabbing you by your [pc.hips] as you approach and pulling you into a fierce kiss that leaves you tingling with a sudden rush of chemical arousal. One of her hands brushes your cheek as she whispers, <i>“Good to see you.”</i>");
	
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
	addButton(0, "Talk", lieveTalkTo);
	addButton(1, "Sex", lieveSexEntry, undefined, "Sex", "See if Lieve's got some steam to blow off. Even if not, looks like her harem girls are desperate for it.");
	addButton(2, "TrenchWives", lieveTalkToTrenchWives, undefined, "Talk To Trench Wives", "Ask Lieve if you can talk to her little harem for a bit.");

	if (!lieveVenomUsed())
	{
		if (pc.mf("m", "f") == "f") addButton(3, "TryVenom", lieveVenomToggle, undefined, "Try Venom", (9999 == 0 ? "You've heard amazing things about red myr venom. How about Lieve give you a taste of hers?" : "You've only dabbled with red myr venom. How about Lieve give you a taste of hers?");
		else addDisabledButton(3, "TryVenom", "Try Venom", "Lieve is only really interested in feminine partners...");
	}
	else
	{
		if (hasFuckedLieveSolo()) addButton(3, "KissHer", lieveKissHer, undefined, "Kiss Her", "Pull Lieve in for a passionate, venom-filled kiss.");
		else addDisabledButton(3, "KissHer");
	}

	addButton(4, "Tour Town", );

	if (hasFuckedLieve()) addButton(5, "Appearance", lieveAppearance);
	else addDisabledButton(5, "Appearance");
}

public function lieveAppearance():void
{
	clearOutput();
	lieveHeader();

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
	showname("SIERVA &\nMAYREN");
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

	addButton(4, "Back", lieveMenu);
}

public function lieveTalkToSierva():void
{
	clearOutput();
	showName("\nSIERVA");
	showBust("SIERVA");
	author("Savin");

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
	
	output("\n\nSierva’s smile fades completely, replaced by a hurt look as she answers, <i>“I was wounded in action. Our battalion was supposed to take back a town from the Federation, a surface access town called Ferenze. The enemy was entrenched, though, and we walked into a solid wall of machinegun fire. I called a retreat when I realized the attack was hopeless, but took a round in the hip on the way back to our line. Ended up falling into a shell crater, left behind and bleeding out. I laid there for hours... the pain was incredible. Even if my troops realized they’d left me behind, there was nothing they could do to help with all those Federation guns aimed at them.");
	
	output("\n\n<i>“That night, though, Lieve found me. She was crawling through no-man’s land to spot for artillery, and by chance happened to take cover in the crater I’d fallen into.”</i> Looking up to her captor with a smile, Sierva adds, <i>“She took pity on me. Dragged me back to a Federation aid station and ordered their medics to patch me up. Another hour, they said later, and I’d have bled out completely.”</i>");
	
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
	addButton(0, "NoMansLand", lieveTalkNoMansLand, undefined, "No Mans Land", "Ask for details about the stretch of territory outside Kressia: No Man's Land.");
	
	if (flags["LIEVE_TALK_NOMANSLAND"] != undefined) addButton(1, "FungalMyr", lieveTalkFungalMyr, undefined, "Fungal Myr", "Try and get more information about the fungus-infected myr.");
	else addDisabledButton(1, "FungalMyr");

	addButton(2, "The War", lieveTalkTheWar, undefined, "The War", "See if Lieve will tell you a little about the war, and her part in it.");

	if (hasFuckedLieveSolo() && flags["LIEVE_TALK_THEWAR"] != undefined) addButton(3, "Her Scars", lieveTalkScars, undefined, "Her Scars", "Ask Lieve about those brutal scars on her back.");
	else addDisabledButton(3, "Her Scars");

	if (flags["LIEVE_TALK_SCARS"] != undefined) addButton(4, "Red Prisoners?", lieveTalkRedPrisoners, undefined, "Red Prisoners?", ""); // 9999
	else addDisabledButton(4, "Red Prisoners");

	if (flags["LIEVE_TALK_PRISONERS"] != undefined) addButton(5, "Myr Fertility", lieveTalkMyrFertility, undefined, "Myr Fertility", ""); // 9999
	else addDisabledButton(5, "Myr Fertility");

	addButton(6, "Trench Wives", lieveTalkTrenchWives, undefined, "Trench Wives", "Ask about Lieve's harem, and Trench Wives in general.");

	addButton(7, "Fed.Army", lieveTalkFedArmy, undefined, "Federation Army", "Have Lieve tell you a little about the Scarlet Federation's military.");
}

public function lieveTalkNoMansLand():void
{
	clearOutput();
	lieveHeader();

	flags["LIEVE_TALK_NOMANSLAND"] = 1;

	output("<i>“Tell me a little about No Man’s Land,”</i> you prompt. <i>“That’s why they’ve got you out here, right?”</i>");
	
	output("\n\n<i>“To keep you off-worlders from blundering out there blindly, anyway,”</i> she answers, adding with a mischievous wink: <i>“Apparently it’s bad PR if too many of you step on landmines or something.”</i>");
	
	// Encountered landmines
	if (9999 == 0) output("\n\nYou blink. <i>“Landmines?”</i>");
	else output("<i>“I’ve noticed a few already,”</i> you grumble.");
	
	output("\n\nShe nods. <i>“We can’t use artillery down here, Steele. Both sides decided to make up for it by mining the space between the front lines, making it hell for the other to advance. There’s gold myr explosive mines, and our venom vapor ones out there. Either one can ruin your day if you’re not careful. If you haven’t already, go in town and see if you can buy a minesweeper. Cunning little device that picks ‘em up before you step on them. Saved my life more than once.");
	
	output("\n\n<i>“They’re not the worst things you’ll find out there, though,”</i> Lieve adds, inviting you to sit down. You do so as Lieve continues talking. Her voice shifts from the guarded friendliness she normally shows you to a more authoritative pitch, as if she’s talking to one of her subordinates. You imagine she’s given this speech several times before.");
	
	output("\n\n<i>“Ever since the cease-fire, we’ve gotten plenty of deep dwelling creatures coming back to the surface caves. Most are interested in looting the equipment and supplies left in No Man’s, others in capturing our patrols or offworlder explorers for... breeding.”</i> Her brow twitches ever so slightly. <i>“The most common threat you’ll face out there are the nyrea. Like us red myr, they’re a warrior race, and damn good at it.”</i>");
	
	output("\n\nShe gives a wry chuckle at that. <i>“We’ve been fighting the nyrea for years up north. They’re more common there, more organized. Here in the heartlands, though, you’ll mostly be fighting lone huntresses");
	if (pc.mf("m", "f") == "m") output(" keen on stealing your sperm");
	else output(" that want to borrow your ass or womb to lay their eggs in");
	output(".”</i>");
	
	output("\n\n<i>“You’ve fought the nyrea before?”</i> you ask.");
	
	output("\n\nLieve nods. <i>“Before the war, Federation troops were mainly fighting off nyrea raids. Back in our territory, the nyrea have a few fairly large city-states. One particularly ambitious queen even tried to form a nyrean country, though that failed spectacularly. Some even decided to join the Federation when it formed - we’ve got a few scout companies of mixed myr and nyrea. The ones that can take their minds off fucking for long enough to be useful, anyway.");
	
	output("\n\n<i>“Speaking of minds full of fucking, you’ll want to keep clear of any myr - of any color - you find out there. The ones that aren’t deserters looking to steal from you are likely to be infested with the myrmedius fungus. I don’t know what it would do to an offworlder, but to myr, it drives us mad with lust. Infected victims can be unpredictable, and will try to force themselves on you. They’re not particularly physically strong, but can still get the better of you if you aren’t careful.”</i>");
	
	output("\n\nYou ask how to recognize an infected myr, to which Lieve answers, <i>“You’ll see them, believe me. They’re surrounded by spore clouds, and the fungus grows all over them. It’s... not pleasant to look at.”</i>");
	
	output("\n\n<i>“Anything else I should be aware of?”</i>");
	
	output("\n\n<i>“There are other creatures out there, but the nyrea and fungal myr are the most common in No Man’s. If you go down in the deep caves, you’ll start seeing bothrioc, wetraxxal, creatures made of a living goo called the ganrael. Any of them can be bad news. Stay clear of them if you can. If not, well, I hope you’re as tough as you look.”</i>");

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

	lieveTalkMenu();
	addDisabledButton(1, "FungalMyr");
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
	
	output("\n\nLieve sighs. <i>“Not me. At least, not for those scars. A little over a year ago, I pulled spotter duty. Nothing out of the ordinary - one of the most important things us scouts do is carry radios into No Man’s Land and spot for artillery. That’s how I met Sierva, even. Dangerous work, and exhausting, but it makes our cannons a hell of a lot more effective. Worth every sweaty, filthy day of curling up in a crater hoping the shells don’t fall just a little bit short and blow me to pieces.");
	
	output("\n\n<i>“It was the tenth time I’d played spotter, back when the fighting was about fifty miles back east. Everything was going fine until I crawled into a ditch... that happened to have a trap door in it.”</i>");
	
	output("\n\nLieve laughs and shakes her head. <i>“What’re the fucking odds? Of all the craters, ditches, and trenches I could have taken cover in, I’d land right on top of a Republic command bunker. Fell straight through the ceiling and onto their map table. There was about a full second of just stunned silence all around before somebody had the bright idea to rifle butt me.”</i> To illustrate her point, Lieve slaps the heel of her hand into her forehead, right to where you can see a very small, almost unnoticeable scar.");
	
	output("\n\n<i>“The goldies were already getting desperate by then. We’d pushed them across the ocean, deep into the heartlands. Even their filthy gas couldn’t stop us, they realized. So some of them went a little darker. They wanted - needed - to know how our troops were spread out. Where we’d hidden our artillery batteries and supply depots. How to hit us hardest, in other words. As you might expect, I wasn’t inclined to tell them.”</i>");
	
	output("\n\nOh.");
	
	output("\n\n<i>“I ended up in a prisoner camp. Golds don’t believe in trench wives, see - they just shove their P.O.W.s into camps with barely enough food and clothes, maybe some tents or shacks if you’re lucky. They herded us around like hysean slugs, staring down from watch towers full of machine guns and floodlights. It was cold, cramped, and full of sickness. If that wasn’t bad enough, Republic Intelligence would make the rounds every few days. Us officers would get dragged off, one after the other, to answer questions.”</i>");
	
	output("\n\nLieve shivers involuntarily, and you find yourself holding her a little closer as a result. <i>“Let’s just say the camp commander was very fond of whips. She had a whole collection she’d parade you through before...”</i>");
	
	output("\n\nYou get the picture.");
	
	output("\n\n<i>“You asked,”</i> Lieve says, forcing herself to smile as she slips out of your arms.");

	lieveTalkMenu();
	addButton(3, "Her Scars");
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
	
		output("\n\nLieve scoffs. <i>“Not every gold breeder can be a queen. Most of them never see a drone in their lives - how would they know?");
		if (pc.hasCock()) 
		{
			output(" Sierva mentioned she’s never seen a dick before yours. She might very well be a goldie breeder just waiting for her chance.");

			output("\n\n<i>“And Mayren?”</i>");
	
			output("\n\n<i>“Ha. The day I believe May’s not found a drone to shack up with is the day my plates turn green.”</i>");
	
			output("\n\nMust be a local expression, you guess. Lieve continues: <i>“");
		}
		output(" Besides, you offworlders are here now. I’ve heard stories about what your medicine can do. Amazing things from the troops that took your fleet’s offer for medical help. A lot of the girls think you might be the cure for our... fertility problems.”</i>");
	
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

	//Unlock "Myr Fertility" talk
	lieveTalkMenu();
	addButton(4, "Red Prisoners?");
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

	lieveTalkMenu();
	addDisabledButton(5, "Myr Fertility");
}

public function lieveTalkTrenchWives():void
{
	clearOutput();
	lieveHeader();

	output("<i>“Tell me about these two,”</i> you prompt, nodding to the gold myr girls clinging to Lieve. <i>“How does a red myr soldier end up with a couple of gold girls hanging on her like that?”</i>");
	
	output("\n\n<i>“With my winning personality, mostly,”</i> Lieve chuckles, running her hand through one of the girls’ hair. <i>“Well, and winning the war, too.”</i>");
	
	output("\n\nYou urge Lieve on, and she most happily obliges. <i>“Trench wives are prisoners of war. We’ve taken more prisoners than we could ever possibly deal with over the last seven years. Thousands and thousands of deserters we’ve picked up, wounded we’ve pulled out of No Man’s Land, and more surrendered soldiers than we could stuff into camps even if we wanted to. But P.O.W.s have to go somewhere, right?”</i>");
	
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
	
	output("\n\n<i>“Well,”</i> Lieve says. <i>“Let’s start with the basics. We train for a period of six weeks, twelve if you’re selected to be an officer or specialist like a radioman or a minesweeper. Basic training is almost all about discipline: making sure we know how to follow orders, how to stay calm under fire and keep your wits about you. That discipline is more important than even fighting skill, when you get right down to it. Federation troops don’t panic when the shells start flying, or when the enemy comes up out of their trenches. The girls we’ve recruited the last few years are even trained for gas and chemical attacks.");
	
	output("\n\n<i>“I’m sure that doesn’t seem like much to you off-worlders, but there’s a hell of a difference between a Federation soldier who’s been drilled to perfection and a gold who’s just been conscripted and had a rifle shoved in her hands for the first time ten minutes before they throw her over the top. There’s nothing more important than discipline, training, and experience for surviving in the trenches when you’re getting shot at and shelled for weeks on end. Basic can give you two of them, at least.”</i>");
	
	output("\n\nCurious, you ask if there’s much more to Federation service than fighting in the trenches.");
	
	output("\n\n<i>“Depends on your aptitudes,”</i> Lieve answers with a shrug. <i>“Girls with technical aptitude, good typists, scientists, anybody with useful skills usually get selected for special service. An army needs a lot of pencil pushers, and there’s thousands of girls working in R&D. We weren’t the first to get nukes by chance, you know. Of course, the position everybody wants these days is to be a fly girl with the air corps. Most of us had never seen the surface before the war, and now we’re sending hundreds of troops into the sky. One step closer to having ourselves a space corps, just like you offworlders.”</i>");

	lieveTalkMenu();
	addDisabledButton(7, "Fed.Army");
}

public function lieveVenomToggle():void
{
	clearOutput();
	lieveHeader();

	output("Taking a step closer to Lieve, you ask what she thinks about using her venom on other people.");
	
	output("\n\n<i>“Well,”</i> she says, crossing her arms, <i>“Most of us reds like to think that’s pretty intimate. Two lovers becoming addicted to each other - literally - and completely reliant on each other.  Not to mention the overwhelming pleasure, even in a casual encounter. It’s not like you build up an immunity to our venom, you understand. It’s not like most drugs... just the opposite.”</i>");
	
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

	pc.lust(50);
	flags["LIEVE_VENOM_USED"] = 1;
	flags["LIEVE_VENOM_ENABLED"] = 1;

	//Sex Menu here.
	lieveSexMenu();
}

public function lieveKissHer():void
{
	clearOutput();
	lieveHeader();

	output("\n\nYou slip up into Lieve’s arms, leaning");
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
	flags["LIEVE_VENOM_ENABLED"] = 1;

	//Sex menu here
	lieveSexMenu();
}

public function lieveSexEntry():void
{
	clearOutput();
	lieveHeader();

	if (!hasFuckedLieve())
	{
		output("Lieve and her girls seem quite friendly, and the display of bare bosoms and the sexy, hungry looks of her harem has you burning up under the collar. After a moment's hesitation, you take a step forward and ask if she's up for it.");

		if (pc.isMasculine()) output("\n\nAfter a moment’s thought, Lieve flashes you a slight smile and says, <i>“I think we can do that. Go on, girls, I know you’ve been wanting to sink your teeth into him since you saw him.”</i>");
		else output("\n\n<i>“I thought you’d never ask,”</i> Lieve answers with a big grin. <i>“Just toss your gear aside and relax, [pc.name]. My girls and I will take good care of you...");
	}
	else
	{
		if (pc.isMasculine())
		{
			output("\n\n<i>“Sure! The girls have been looking forward to more after that last time, haven’t they?”</i> she says, teasing the antenna of a golden-haired slut.");
			
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
}

public function lieveSexMenu():void
{
	clearMenu();
	addButton(0, "Fuck Harem", lieveFuckHarem, undefined, "Fuck Harem", "Take the harem babes up on their implicit offer and join Lieve in fucking them senseless.");
	addButton(1, "Lieve Solo", );
	addButton(2, "Bodyworship", );
}

public function lieveFuckHarem():void
{
	clearOutput();
	lieveHeader(true);

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
	if (!lieveVenomEnabled())
	{
		output("The real question is if you want the full package.”</i> As if to emphasize her point, Lieve leans in and plants a kiss on the nape of your neck, letting her tongue play across your [pc.skin] until you shiver with sensation, her aphrodisiac venom seeping into you. <i>“...Or do I need to hold back? It’s alright, nobody would think less of you if you didn’t want a big, strong ant to turn you into a screaming, blubbering bag of lust... just putty in my hands, cumming again and again and again.”</i>");
	
		output("\n\nThough she’s teasing you, Lieve doesn’t make a move until you answer.");
	}
	else
	{
		output("You wanted my venom, Steele... I hope you’re ready for it. I’m going to enjoy watching you squirm and moan for hours.”</i>");
	output("\n\n//Go straight to venom scene}");

}