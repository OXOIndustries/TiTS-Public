public function pennyCrewSharing():Boolean
{
	return ((pennyIsCumSlut() && flags["PENNY_CUMSLUT_OTHER_CREW"] != undefined) || flags["PENNY_OTHER_CREW_TALKED"] != undefined || penny.isBimbo());
}

public function pennyCrewDesc(btnSlot:int = 0, showBlurb:Boolean = true):String
{
	var buffer:String = "";
	
	//Badgurquest raygun handoff 
	if(flags["BADGER_QUEST_TIMER"] == -1 && !pc.hasKeyItem("Doctor Badger's Bimbo Raygun - Still programmed for use on Penny.")) 
	{
		buffer += "\n\n<b>You got her message, talk to Penny to see how you can <b>turn the tables</b> on Dr. Badger!</b>";
		//addButton(0,"Penny",turnTheTablesOnBadger);
	}
	//Girlfriend penny
	else {
		if(flags["PENNY_IS_A_CUMSLUT"] != undefined || penny.isBimbo())
		{
			buffer += "\n\nPenny is doubtless masturbating her quarters, putting on a show for the extranet. It seems like every time you walk past her room, you either hear impassioned moaning or pleased-sounding gurgles. Rarely, you hear her babbling a thankful platitude or request for her viewers to bust the biggest, fattest nuts they can.";
		}
		//Non-Futa
		//Appearance blurb: 
		else if(!penny.hasCock()) buffer += "\n\nPenny keeps herself busy on your ship. The gene-spliced fennec seems content to pass her time honing her fitness and tending to the various security apparatus onboard. She isn’t all business, however. Sometimes you hear a the garbled voices of an anime, and she frequently favors you with lusty leers in the hallways.";
		//FUTA!
		//Appearance Blurb: 
		else 
		buffer += "\n\nPenny keeps herself busy on your ship, though when she sees you, it’s when a knowing smile and a brazen leer. Her nipples are hard enough to jut through whatever she dares to wear, and given that she’s packing sex organs for two, it makes more than a little sense. The fennec tries her best to keep her raging hormones in control, but she can’t quite seem to stifle her wanton moans during her frequent bouts of masturbation.";
	}
	
	addButton(btnSlot,"Penny",approachCrewPenny);
	
	return (showBlurb ? buffer : "");
}

public function approachCrewPenny(back:Boolean = false):void
{
	clearOutput();
	showPenny();
	if(back)
	{
		var greetings:Array = ["Penny tilts her head. <i>“Oh. What else then?”</i>","<i>“Hmmm, anything else then, mate?”</i> Penny asks.","Penny stretches then yawns. <i>“So now what? Mmm?”</i>"];
		//Penny hascock
		if(penny.hasCock()) 
		{
			greetings.push("Penny smirks, <i>“We could always fuck...”</i>");
		}
		//Penny is bimbo
		if(penny.isBimbo() || flags["PENNY_IS_A_CUMSLUT"] != undefined) greetings.push("Penny guides her dick into her mouth, idly sucking. She raises one eyebrow as if to suggest that you should take advantage of the situation.");
		if(flags["PENNY_IS_A_CUMSLUT"] != undefined) greetings.push("Penny smiles, languidly fondling her [penny.cockNoun]. <i>“Stars, I love this dick. Thank you so much, [pc.name].”</i> She favors her erection with a long, passionate kiss. <i>“Almost as much as I love you, mate.”</i>");
		output(RandomInCollection(greetings));
	}
	//Badgurquest raygun handoff 
	else if(flags["BADGER_QUEST_TIMER"] == -1 && !pc.hasKeyItem("Doctor Badger's Bimbo Raygun - Still programmed for use on Penny.")) 
	{
		turnTheTablesOnBadger();
		return;
	}
	else if(mitziIsCrew() && penny.hasCock() && pennyCrewSharing() && !pc.hasStatusEffect("PENNY_PANTY_CD") && rand(6) == 0) 
	{
		pc.createStatusEffect("PENNY_PANTY_CD");
		pc.setStatusMinutes("PENNY_PANTY_CD",60*24)
		mitziAndPennyFunzies();
		return;
	}
	// (scene: Crewmate Main Menu)
	else if(!penny.hasCock())
	{
		author("B");
		output("You knock on the door to Penny’s quarters.");
		output("\n\n<i>“Yep, just a sec!”</i> Penny hollers from inside. In a moment, you hear the sound of her door’s electric lock undoing, and, with a bit of heft, she swings the door open.");
		output("\n\n<i>“Hey there, my " + (penny.armor is UGCCasualOutfit ? "mate":"captain") + ",”</i> she says warmly. She’s wearing " + (penny.armor is UGCCasualOutfit ? "her civilian clothing: the one with the too-small T-shirt with the cartoon character on it and the cut-off jeans":"her police officer’s uniform: in fact, it looks freshly pressed and steamed, and it fits her as perfectly as the day you met her") + ". She doesn’t even hesitate to grab you by the wrist and show you into her quarters. Once you’re inside, she shuts the door, and you two are alone.");
		output("\n\nYou both take a seat on the edge of her bed; she folds one leg and tucks her foot underneath her knee, reclining into a casual sitting position. <i>“Sooooo,”</i> she says lazily, " + (penny.armor is UGCCasualOutfit ? "putting both her hands behind her back for stability – and thrusting out her generous, DD-cup chest, giving you something to ogle":"folding her hands on her lap and keeping her back straight – ever the professional, at least while she’s wearing that uniform") + ", <i>“what can I do for you today?”</i>");
		if(penny.isSquirter())
		{
			if(flags["PENNY_SQUIRT_TALK"] != undefined) output("\n\nA puck-shaped cleaning robot rests in its charging dock by the wall. Though there is no physical evidence of her messy climaxes, the room smells ever so faintly of Penny’s cunt. Judging by the charge level indicator, it has gotten quite a work-out.");
			else output("\n\nThe fox-woman’s hamper is absolutely stuffed with towels. Not even the Odorguard seal it’s equipped with can completely nullify the scent of vaginal secretions. It would seem her encounter with the venus ziltrap left her wetter than ever before.");
		}
	}
	// Panties interject
	else if(needPennyPanties())
	{
		acquireCumslootPennyPanties(true);
		return;
	}
	//Actual Approach:
	else
	{
		author("Fenoxo");
		if(pennyIsCumSlut() || penny.isBimbo())
		{
			output("When you enter her chambers, Penny looks at you sidelong just before her cock erupts, blasting a spermy load directly into her gullet. She makes a show of passionately suckling her at her boner, then pulls it out so that the excess can drench her tits. She dreamily opens her mouth to catch the last torrid squirts, then gathers a handful of excess vixen-cream to messily devour. <i>“Ta ta, my lovelies. " + (penny.isBimbo() ? "Like, c":"C") + "um again soon!”</i>");
			output("\n\nThe spunk-drunk fox-girl giggles and shuts down the broadcast. She turns to face you, casually hefting her pillowy, drenched tits up in order to suck the leftovers out of her fur. She murmurs a greeting through her busy, cum-soaked lips, <i>“Heyyy, [pc.name]. You wanna make your fox-slut cum? Or did you want me to make you cum.”</i> She sighs blissfully. <i>“Fuck! I loooove being your cam-whore pet.”</i> Letting go off one half-cleaned boob, she stalks forward aggressively, dick firming with alarming immediacy. <i>“I love being yours. What can I do for you, mate?”</i>");
		}
		else
		{
			output("When you enter her chambers, Penny’s fluffy tail wags behind her, faster and faster the closer you come. When you’re right in front of her, she looks up at you with a lusty look and admits, <i>“I was just thinking of how much I enjoyed using this with you, my mate.”</i>");
			//Max size {17-20}
			if(penny.longestCockLength() >= 17) output(" There’s the sound of fabric starting to rip, cut short by the sound of a zipper and the heavy thud of flesh contacting wood. Penny exhales and looks at you meaningfully. <i>“I’m so glad you made it so big...”</i> Her voice trails off for a moment while she brazenly strokes. <i>“It gets hard so easily. All I have to do is think of you, and I have the biggest, hardest, most incredible erection.”</i>");
			//Normal size {10-16”}
			else if(penny.longestCockLength() >= 10) output(" A quiet, stifled groan starts in her throat after her admission, and she squeezes her crotch up to show you the nice, big bulge hidden in her pants. The groan turns into a whimper, and then you hear the zipper on her trousers lowering. Gasping with relief, the fennec makes love to you with her eyes and offers, <i>“Looking for a booty call?”</i>");
			//Small size
			else output(" There’s the quiet sound of a zipper opening. <i>“I’m up for some fun if you are...”</i>");
		}
		if(penny.isSquirter())
		{
			if(flags["PENNY_SQUIRT_TALK"] != undefined) output("\n\nA small, puck-shaped robot rests in its charging dock by the wall. Though there isn’t a single soiled towel in sight, the whole room smells faintly of Penny’s juicy cunt, like she’s climaxed bareback on every exposed surface in her room with such enthusiasm that her feminine musk impregnated itself into their molecular structures.");
			else output("\n\nThere’s no hiding the hints of feminine scent that linger in Penny’s sheets or waft through the hamper’s supposed Odorguard seal. It would seem that in the wake of her encounter with a venus ziltrap, Penny’s become a very wet girl. And of course, there’s the heady musk of her other genitalia resting atop it all.");
		}
	}
	if(flags["BADGER_QUEST"] == 1)
	{
		output("\n\n<b>And to think Doctor Badger wanted you to deal with this wondrous specimen. You could talk with Penny about it and see what her opinion is on the subject, or you could just go ahead and zap her.</b>");
	}
	//[=Talk=][=Sex=][=Leave=]
	// end scene (scene: Crewmate Main Menu)
	pennyCrewMenu();
}

public function pennyCrewMenu():void
{
	clearMenu();
	if(penny.isBimbo()) addButton(0,"Talk",bimboPennyTalk,undefined,"Talk","Talk to Penny.");
	else addButton(0,"Talk",pennyCrewTalk,undefined,"Talk","Talk to Penny.");
	if(pc.lust() >= 33) 
	{
		if(penny.isBimbo()) addButton(1,"Sex",bimboPennySex,undefined,"Sex","Get naughty with your bimbo.");
		else if (flags["PENNY_MADE_LOVE"] == undefined && penny.hasCock()) addButton(1,"Sex?",(pennyIsCumSlut() || penny.isBimbo() ? yourFoxCamslutWantsToShowYouHowMuchSheAppreciatesYou : pennyHasADifferentIdeaForToday),(pc.hasVagina() ? 0 : -1),"Sex",("There’s a telling look in Penny’s eyes." + ((pc.hasVagina() ? pc.vaginalVirgin : pc.analVirgin) ? " <b>You may not keep your virginity if you ask this.</b>" : " She’ll probably take the lead if you ask.")));
		else addButton(1,"Sex",pennyCrewSexApproach,undefined,"Sex","Get naughty with your mate.");
	}
	else addDisabledButton(1,"Sex","Sex","You aren’t turned on enough right now.");
	
	if(!drBadgerImprisioned())
	{
		if(flags["BADGER_QUEST"] == 1)
		{
			if(flags["NO_ZAP_PENNY"] == undefined) 
			{
				if(flags["PENNY_BADGER_WARNED"] == undefined) addButton(2,"Zap Penny",surpriseZapPennyWithBimboRay,undefined,"Zap Penny","This seems like a jerk move, but if nothing else you can be pretty sure she’ll probably enjoy the end result, as will you.");
				else addButton(2,"Zap Penny",zapPennyAfterWarningHer,undefined,"Zap Penny","Go ahead and zap Penny with the Bimbo Raygun, now that it seems like she approves.");
			}
			else addDisabledButton(2,"Zap Penny","Zap Penny","Now that you’ve tipped her off, it’ll be impossible to catch her with her guard down.");
			addButton(3,"BadgerWarn",warnPennyAboutDoctorBadgersNefariousSchemes,undefined,"Warn Her About Dr. Badger","Penny would probably have some opinions about Dr. Badger’s plan. Who knows, maybe she’d be into it, or maybe she’ll have some ideas about how to turn the tables on Dr. Badger instead.");
		}
	}
	
	addButton(13, "Leave Crew", pennyBootFromCrew, undefined, "Leave Crew", "Ask Penny to move off the ship. You’ll be able to pick her up again later.");
	
	addButton(14,"Back",crew);
}

public function pennyBootFromCrew():void
{
	clearOutput();
	showPenny();
	author("");
	
	output("You tell Penny that you need the space on your ship back. She’ll have to crash somewhere else in the meantime.");
	if(pennyIsCumSlut() || penny.isBimbo())
	{
		
		output("\n\nInstead of the expected sadness, Penny reacts with apparent delight, even going so far as to stroke her [penny.cockNounSimple] with greater enthusiasm. The corners of her mouth climb into a delighted smile as she declares, <i>“This is the perfect excuse to go visit Flahne!”</i> Her tong lolls into a wanton pant, slurring her words. <i>“She’s so fucking hot...”</i>");
		output("\n\nThat was easy...");
	}
	else
	{
		output("\n\nPenny steps back, not quite beleiving what she’s hearing. The sharp points of her ears sag beneath the weight of the news. Glancing down, the the former fox-cop huffs in disappointment. <i>“I guess I’ll need to bunk with Flahne for a little while. It might even be fun, I guess.”</i> Penny’s whole body straightens. <i>“Yeah! Don’t leave me waiting too long, [pc.name].”</i>");
		output("\n\nYou nod and give her time to collect her things.");

	}
	
	processTime(20);
	
	flags["PENNY_ONBOARD"] = 0;
	if(flags["CREWMEMBER_SLEEP_WITH"] == "PENNY") flags["CREWMEMBER_SLEEP_WITH"] = undefined;
	
	output("\n\n(<b>Penny is no longer on your crew. You can find her again on Mhen’ga.</b>)");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function pennyOffCrewKickedOff(arg:Number):void
{
	showPennyBust();
	if(hungryFlahneWithBimboPenny()) output("\n\nOutside of Flahne’s office, you see the vixen heavily flirting with the bubbly rahn. You could ask Penny to return to your crew if you like.");
	else output("\n\nPenny loiters outside Flahne’s office, looking entirely bored with a quiet Mhen’gan life. Maybe you could take her back on your crew?");
	
	addButton(arg,"Penny",pennyOffCrewKickedOffMenu,undefined,"Penny","Approach Penny.");
}
public function pennyOffCrewKickedOffMenu():void
{
	clearOutput();
	showPenny();
	output("Would you like to take Penny back onboard as a crew member?");
	
	clearMenu();
	addButton(0, "Recruit", pennyRejoinCrew, undefined, "Recruit Penny","Bring Penny back onboard.");
	addButton(14, "Back", mainGameMenu);
}

public function pennyRejoinCrew():void
{
	clearOutput();
	showPenny();
	
	if(pennyIsCumSlut() || penny.isBimbo())
	{
		output("Getting Penny back on board is a snap");
		if(hungryFlahneWithBimboPenny()) output("--well, almost. Having to peel a lust-hungry Flahne off her is a struggle, but you manage by");
		else output(". All it takes is");
		output(" promising that she can be the cummiest cam-whore in the galaxy.");
		if(hungryFlahneWithBimboPenny()) output("\n\n<i>“Aww... Don’t forget to come by and visit me again, okay sugar?”</i> Flahne says before walking off to the nearest restroom to freshen up.");
	}
	else
	{
		output("You invite Penny back.");
		output("\n\nThe fox-girl smiles fiercely. <i>“See? I knew you’d need your badass, ex-cop of a girlfriend to help tame that frontier.”</i> She snags a duffel full of clothing. <i>“I’ll see you on the ship, mate.”</i>");
	}
	
	processTime(20);
	
	//currentLocation = "SHIP INTERIOR";
	flags["PENNY_ONBOARD"] = 1;

	output("\n\n(<b>Penny has rejoined your crew!</b>)");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//[=Talk=]
// (scene: Crewmate Talk Menu)
public function pennyCrewTalk():void
{
	clearOutput();
	showPenny();
	author("B");
	output("You and Penny aren’t too busy at the moment. You just wanted to spend some time with her.");

	output("\n\n");
	if(penny.armor is UGCCasualOutfit) output("Penny ‘humph’s to herself and sits upright, deliberately hefting her chest as she does so and adjusting her top in front of you. Knowing her libido, she was probably hoping for something a little more ‘entertaining.’" + (penny.isHerm() ? " And, from the way one hand slyly snakes between her legs and paws at the brazen bulge between them, she was hoping for it a lot.":""));
	else
	{
		output("Penny grips the top of her uniform and pulls on it, straightening it out and adjusting her prim-and-proper look in front of you. Though, it has the (unintentional, surely) consequence of deepening the cleavage around her boobs – and highlighting the bumps of her nipples through the fabric. Knowing her libido, she might have been hoping for something a little more ‘entertaining.’");
	}
	output(" <i>“Of course; I’m not busy,”</i> she says. <i>“Got anything on your mind?”</i>");
	processTime(2);
	
	pennyCrewTalkMenu();
}

public function pennyCrewTalkMenu():void
{
	// end scene (scene: Crewmate Talk Menu)
	// Pretty much all of her in-game talk scenes are contextually dependent on her remaining on Mhen’ga, and they’ll need to be rewritten. I can probably write a few of them myself, but I’d need an increased word cap.
	// [=Her ‘Species’=] requires the least amount of rewriting and probably just needs some editing.
	//[=Her ‘Species’=][=Outfit=][=Other Crew=][=Futanari=][=Buy Throbb?=][=Leave=]
	clearMenu();
	addButton(0,"Her ‘Species’",talkToPennyAboutSpecies);
	addButton(1,"Outfit",pennyOutfitTalk,undefined,"Outfit","Ask Penny to wear a different set of clothes.");
	if(crew(true) > 1) addButton(2,"Other Crew",otherCrewPennyTalk,undefined,"Other Crew","Ask Penny what she thinks of the fact that you have other crewmates.");
	else addDisabledButton(2,"Other Crew","Other Crew",(silly ? "And here is where you would talk about your other crewmates... IF YOU HAD ANY!!!!":"You don’t have any other crew mates to talk about, so this is a bit of a moot point."));
	addButton(3,"Futanari",futanariTalkWithPenpen,undefined,"Futanari","Talk to her about dickgirls, and becoming one.");
	if(flags["PENNY_THROBB_PURCHASE_UNLOCKED"] == 1) addButton(4,"Buy Throbb",buyCrewPennyThrobb,undefined,"Buy Throbb","Purchase some illegal, dick-growing drug.");
	else addDisabledButton(4,"Disabled","Disabled","You don’t know her well enough for this.");
	if(penny.isSquirter()) addButton(5,"Squirting",pennySquirtingTalk,undefined,"Squirting","Ever since being encapsulated by the ziltrap, Penny has been a squirter. Ask how she feels about it.");
	else addDisabledButton(5,"Disabled","Disabled","This option is only available as a result of certain events while recruiting Penny to your crew.");

	if(flags["PENNY_IS_A_CUMSLUT"] != undefined) addButton(6,"Cumsluttery",pennyCumslutterMenuTalk);
	else addDisabledButton(6,"Cumsluttery");

	if (flags["CREWMEMBER_SLEEP_WITH"] == "PENNY") addButton(7, "No Sleep W.", pennySleepwithInvite, undefined, "Ask Penny to give you some space for the night.");
	else addButton(7, "Sleep With", pennySleepwithInvite, undefined, "Sleep With", "Invite Penny to share your bed at night. A girl with that much fluff is sure to help keep it warm!");
	addButton(14,"Back",approachCrewPenny,true);
}

//[=Buy Throbb=]
// (scene: Buy Throbb)
public function buyCrewPennyThrobb():void
{
	clearOutput();
	showPenny();
	author("B");
	output("You ask Penny if she still has a hoard of Throbb to pass around with you. You wouldn’t mind passing her a couple hundred credits if she’s willing to share.");
	output("\n\n<i>“Yeah, I have a handful I can pass along,”</i> she says. <i>“I had a huge crate of the stuff back on my station. I couldn’t exactly smuggle the whole thing onboard with me - not discreetly, anyway - but it wouldn’t be too hard to coordinate a shipment from Flahne whenever we land on a new planet to restock.”</i>");
	output("\n\nYou ask her how much she has on her right now. <i>“Trust me, [pc.name], I have as much as you need.”</i> She smiles sincerely, yet, toothily; she apparently enjoyed the implications of her own answer. <i>“Same rate as before, my " + (penny.armor is UGCCasualOutfit ? "mate":"captain") + ".”</i>");
	//throbb menu
	this.clearMenu();
	if(pc.credits >= 300) this.addButton(0,"Buy It",buyThrobbTransact);
	else this.addDisabledButton(0,"Buy It");
	if(pc.credits >= 600) this.addButton(1,"Buy 2",buyThrobbTransact,2);
	else this.addDisabledButton(1,"Buy 2");
	if(pc.credits >= 900) this.addButton(2,"Buy 3",buyThrobbTransact,3);
	else this.addDisabledButton(2,"Buy 3");
	if(pc.credits >= 1200) this.addButton(3,"Buy 4",buyThrobbTransact,4);
	else this.addDisabledButton(3,"Buy 4");
	if(pc.credits >= 1500) this.addButton(4,"Buy 5",buyThrobbTransact,5);
	else this.addDisabledButton(4,"Buy 5");
	if(pc.credits >= 1800) this.addButton(5,"Buy 6",buyThrobbTransact,6);
	else this.addDisabledButton(5,"Buy 6");
	if(pc.credits >= 2100) this.addButton(6,"Buy 7",buyThrobbTransact,7);
	else this.addDisabledButton(6,"Buy 7");
	if(pc.credits >= 2400) this.addButton(7,"Buy 8",buyThrobbTransact,8);
	else this.addDisabledButton(7,"Buy 8");
	if(pc.credits >= 2700) this.addButton(8,"Buy 9",buyThrobbTransact,9);
	else this.addDisabledButton(8,"Buy 9");
	if(pc.credits >= 3000) this.addButton(9,"Buy 10",buyThrobbTransact,10);
	else this.addDisabledButton(9,"Buy 10");

	if(pennyIsCrew()) addButton(14,"Back",approachCrewPenny,true);
	else this.addButton(14,"Back",pennyCrewTalk);
}

//[=Futanari=]
// This is a rewriting of the PC approaching Penny about the possibility of her becoming a futa, contextualized for her being a crewmate. I’m not going to rewrite all the conversations about making her dick longer because that’ll bloat my wordcount, and they only need some reviewing, not a whole rewrite.
// (scene: Futa First Talk)
public function futanariTalkWithPenpen():void
{
	clearOutput();
	showPenny();
	author("Fenoxo");
	if(flags["PENNY_FUTA_TALK"] == undefined && !penny.hasCock())
	{
		flags["PENNY_FUTA_TALK"] = 1;
		author("Fen&B");
		output("<i>“Grow a dick?”</i> Penny states with a dumbfounded look. Ears flattening back on her head, she admits, <i>“I did mention that, didn’t I? I’m surprised you even remember that.”</i>");
		output("\n\nYou nod expectantly.");
		output("\n\nThe fox-girl snorts and swivels herself to more directly face you. She searches your eyes for something for a long moment before talking. <i>“Yeah, I guess... I was thinking about it....”</i> Penny’s ears gradually rise again. <i>“The girl I told you about at the academy... she had one, and all things considered, she was pretty happy with it. Once we got comfortable, she kept finding excuses to show it to me. She even let me watch her masturbate!”</i>");
		output("\n\nCoughing nervously, the vixen adds, <i>“I thought a vagina was plenty enough to please, but watching her hands dance over two sets of genitals.... I think I might want one too, [pc.name]. It was dirty and decadent and wet in all the right ways. You should see the way she squirted - from both holes!”</i> Penny’s breathing has gotten heavier from recounting this sordid tale. <i>“Could you imagine, mate? Could you see me with a big, throbbing dick" + (pc.hasCock() ? " just cumming all over you while you fuck me":"") + (pc.isHerm() ? " or":"") + (pc.hasVagina() ? " stretching out your twat":"") + "? Fuck, that’s hot!”</i>");
		output("\n\nShe seems excited by the prospect. You tell her that there are plenty of ways in the modern year to change someone’s body. If she wants a cock to play with, it shouldn’t be too hard to find a way, if she wants.");

		output("\n\n<i>“Actually,”</i> she says, laughing sheepishly. <i>“That girl – Kit is her name, by the way – Kit, she had a tailor-made cock that was exactly as long, and as girthy, and as productive–”</i> She trails for a moment, and, completely absent-mindedly, she wipes at her mouth with her wrist. <i>“As she wanted. I used up most of my share of the Oxonium getting myself out of debt, so I can’t afford a custom cock like hers, and I’m not about to ask you to float me for one. So, instead....”</i>");
		output("\n\nShe kicks at her suitcase, lying on the floor between you two. <i>“I, uh, kinda smuggled a few shots of Throbb onboard with me. You must know what Throbb does to a person by now, right? I....”</i> " + (penny.armor is UGCCasualOutfit ? "She puts her two index fingers together, bloats her cheeks, and shies away, unable to look you in the eye.":"Her lips curl inward and her head leans to one side, her body following with it, as she struggles with what she wants to say next.") + " <i>“I was... " + (penny.armor is UGCCasualOutfit ? "sorta wondering":"hoping") + " if you wouldn’t mind if I, uh, used them on myself.”</i>");
		output("\n\nYou ask her how much she packed. <i>“Right now? Only three shots, but I can get more,”</i> she answers. <i>“One for us both, and one for a mutual friend... or an extra one for one of us, if one of gets</i> particularly <i>dominant... or submissive....”</i> Her eyes lock onto yours, and the tip of her pink tongue slips from the corner of her mouth, giving her lips a thin, wet lick. <i>“Or... one of us could take</i> all three<i>... and then–”</i>");
		output("\n\nYou interrupt her, saying she’s clearly put some time into these fantasies of hers. <i>“Uh,”</i> she says, leaning back and sitting on her behind, her fluffy tail swishing excitedly behind her, <i>“yeah, you could say that. But, I didn’t want to jump to conclusions, so I haven’t used them yet.”</i>");
		output("\n\nHer big, green eyes meet yours, and she leans toward you once more; her tail curls up and around herself, coiling around her waist behind her. <i>“What do you think, " + (penny.armor is UGCCasualOutfit ? "my mate":"captain") + "? Being a herm would really open up a lot of sexual options between us, but... do you think I could handle it? Or do you think I shouldn’t? My mods have already made my sex drive pretty high, and Throbb might spiral that out of control pretty quick. But... I don’t know. Just one shot wouldn’t hurt, would it?”</i>");
		processTime(30);
		clearMenu();
		//[=Get A Dick=][=Stay Girl=][=SynthSheathe=]
		// end scene (scene: Futa First Talk)
		// All three of these optional scenes would need reviewing for contextual differences. That’s not my bit, though, so I ain’t doin’ it.
		this.clearMenu();
		this.addButton(0,"Stay Girl",stayAGirlYouBitch);
		this.addButton(1,"Get A Dick",pennySproutsAWeiner);
		if(pc.hasItemByClass(HorseCock)) 
		{
			if(CodexManager.entryUnlocked("SynthSheath")) addButton(2,"SynthSheath",givePennyAHossCawk,undefined,"SynthSheath","Give Penny the Xenogen SynthSheath you found on Tarkus. She’d probably love having a horse-cock.\n\nWho needs Throbb when you can be a stallion?");
			else addButton(2,"Try This",givePennyAHossCawk,undefined,"Try This","Give Penny the horse-cock strap-on you found on Tarkus. You have a hunch it might be more than it seems. You shouldn’t give this to her unless you’re ready for things to get a little out of hand.\n\nIt might also prevent her from getting too into Throbb.");
		}
		else addDisabledButton(2,"Locked","Locked","You don’t have the required item for this option.");
	}
	//Repeat Futanari Talk
	else
	{
		if(penny.hasCock(GLOBAL.TYPE_EQUINE))
		{
			output("<i>“Oh, you mean this show pony you tricked me into getting?”</i> Penny asks with a knowing grin. <i>“I thought Throbb would have me all drippy and horny at all times of the day, but this thing is almost as bad!”</i> She shifts uncomfortably. <i>“I can barely hide the thing, and just thinking about it gets it hard enough to whack into the bottom of my desk.”</i>");
			if(flags["PENNY_THROBB_USES"] >= 3 && flags["PENNY_THROBB_USES"] != undefined)
			{
				output("\n\nThe over-sized futanari fennec shifts to bring the flared head up to her lips. She swiftly slathers it in a fresh layer of spit. <i>“Part of me wants more... but...”</i> She moans, swallowing at least six inches of pulsing meat. When she pulls it back out again her cock is slick and dripping white. <i>“This is just so awesome already.”</i> A pearl-white smile spreads across her face.")
			}
			output("\n\nShe’s no longer interested in taking Throbb.");
			if(flags["PENNY_THROBB_USES"] == undefined || flags["PENNY_THROBB_USES"] == 0) 
			{
				output("\n\n<i>“You know, I’ve actually still got plenty of Throbb left over. If you ever want some, just ask.”</i> Penny glances at your groin and ");
				if(pc.biggestCockLength() >= 15) output("smiles wickedly, licking her lips. <i>“God, imagine you with an even more enormous cock. You’d break my jaw!”</i>");
				else output("smirks knowingly. <i>“Imagine how much harder you could make me drool if we gave you a little boost. Just enough to make your dickgirl mate </i>really<i> whimper.”</i>");
				flags["PENNY_THROBB_PURCHASE_UNLOCKED"] = 1;
			}
			clearMenu();
			if(flags["PENNY_THROBB_USES"] >= 3 && flags["PENNY_THROBB_USES"] != undefined)
			{
				output("\n\nThat said, she’s more than a little pliable with her dick that close to her face, so if you wanted to turn her into an obedient, sex-addicted pet you could probably quite easily work her up into embracing throbb-enhanced horse-dick a little more enthusiastically. She wouldn’t be much good for security, but maybe turning her into a camwhore would give her something to do. Teasing her into being more of a orgasm-addicted love pet still wouldn’t exactly be <i>nice</i>, but at least she’d be able to indulge her basest, most licentious urges.");
				output("\n\nSo, what do you want to do?");
				//[Tell her to calm down] [Have fun with her]
				clearMenu();
				addButton(0,"Calm Down",calmDownYouPennySlut);
				addButton(1,"Tease Her",teasePenny)
			}
			else this.addButton(14,"Back",approachCrewPenny,true);
		}
		//Not yet futa
		else if (!penny.hasCock())
		{
			output("<i>“Oh, you want to talk about me growing a dick again?”</i> Penny asks. <i>“You know, if I dose myself with Throbb I’m going to wind up horny and dripping more often than normal. My self control will probably slip a little too. However, I’ll be able to fuck you like a freight train, and oh god I bet the orgasms will feel great.”</i>");
			output("\n\nFrom the sounds of it, Penny’s panties are already more than a little moist at the idea. Do you tell her to take some Throbb?");
			//[Stay Girl] [Get A Dick]
			this.clearMenu();
			this.addButton(0,"Stay Girl",stayAGirlYouBitch);
			this.addButton(1,"Get A Dick",pennySproutsAWeiner);
			if(pc.hasItemByClass(HorseCock)) 
			{
				if(CodexManager.entryUnlocked("SynthSheath")) addButton(2,"SynthSheath",givePennyAHossCawk,undefined,"SynthSheath","Give Penny the Xenogen SynthSheath you found on Tarkus. She’d probably love having a horse-cock.\n\nWho needs Throbb when you can be a stallion?");
				else addButton(2,"Try This",givePennyAHossCawk,undefined,"Try This","Give Penny the horse-cock strap-on you found on Tarkus. You have a hunch it might be more than it seems. You shouldn’t give this to her unless you’re ready for things to get a little out of hand.\n\nIt might also prevent her from getting too into Throbb.");
			}
			else addDisabledButton(2,"Locked","Locked","You don’t have the required item for this option.");
		}
		//Already futa
		else
		{
			if(penny.longestCockLength() < 10)
			{
				output("<i>“So you like my dick as much as me, right?”</i> a hopeful Penny asks. <i>“You don’t mind if I take another dose of Throbb, do you? I just want to get a little bit bigger - you know, like a foot long. That way I’d have a cock big enough to get into porn if the whole rush thing falls through.”</i> Her tentpole swells a little at that admission.");
				output("\n\nShe’s as horny as an animal in heat, but she hasn’t had any trouble keeping herself under control thus far. Do you suggest she take it again?");
				this.clearMenu();
				this.addButton(0,"Give Throbb",pennyToBigPenny);
				this.addButton(14,"Back",approachCrewPenny,true);
				if(pc.hasItemByClass(HorseCock)) 
				{
					if(CodexManager.entryUnlocked("SynthSheath")) addButton(1,"SynthSheath",givePennyAHossCawk,undefined,"SynthSheath","Give Penny the Xenogen SynthSheath you found on Tarkus. She’d probably love having a horse-cock.\n\nWho needs Throbb when you can be a stallion?");
					else addButton(1,"Try This",givePennyAHossCawk,undefined,"Try This","Give Penny the horse-cock strap-on you found on Tarkus. You have a hunch it might be more than it seems. You shouldn’t give this to her unless you’re ready for things to get a little out of hand.\n\nIt might also prevent her from getting too into Throbb.");
				}
				else addDisabledButton(1,"Locked","Locked","You don’t have the required item for this option.");
			}
			//Footlong Penny
			else if(penny.longestCockLength() < 17)
			{
				output("<i>“Ohgod, you want me to get bigger, don’t you?”</i> Penny asks with a full-body shudder. She wraps one hand around her [penny.cock] and begins to languidly stroke it, barely caring that the door is unlocked. Her male endowment is big enough that her fingers can barely wrap around it. <i>“Nnnngh, it’ll feel so good! I... uh... don’t know how I’ll fit in my pants. Fuck, my sheath will probably bulge through even when I’m not horny.”</i> The lust-drunk vixen giggles as she bends double to slurp a drop of pre-cum off her [penny.cockHead]. <i>“Yeaaaah, let’s give me a real monster!”</i>");
				output("\n\nTo say that Penny is enthused by the prospect of a bigger member and a heightened libido would be an understatement. She’s jubilant at the prospect and nearly beyond reason with lust from at the prospect of taking more. With her self-control obviously slipping, do you give her the okay to take another dose?");
				this.clearMenu();
				this.addButton(0,"Give Throbb",pennyBecomesHYPERPENNY);
				if(pc.hasItemByClass(HorseCock)) 
				{
					if(CodexManager.entryUnlocked("SynthSheath")) addButton(1,"SynthSheath",givePennyAHossCawk,undefined,"SynthSheath","Give Penny the Xenogen SynthSheath you found on Tarkus. She’d probably love having a horse-cock.\n\nWho needs Throbb when you can be a stallion?");
					else addButton(1,"Try This",givePennyAHossCawk,undefined,"Try This","Give Penny the horse-cock strap-on you found on Tarkus. You have a hunch it might be more than it seems. You shouldn’t give this to her unless you’re ready for things to get a little out of hand.\n\nIt might also prevent her from getting too into Throbb.");
				}
				else addDisabledButton(1,"Locked","Locked","You don’t have the required item for this option.");
				this.addButton(14,"Back",approachCrewPenny,true);
			}
			//Hyper Pre-cumslut Penny
			else if (flags["PENNY_IS_A_CUMSLUT"] == undefined) {
				author("Abe E. Seedy");
				output("<i>“MMmoooore?”</i> Penny moans as she starts to masturbate in front of you. Her hand can’t even close around her girth at this point, and the tip is so tall that it smacks her in the chin whenever she gets careless. She grabs hold of it with both hands, one sliding over the half facing you while the other ");
				if(penny.balls > 0) output("cradles her balls");
				else output("dips into her sheath to play with it");
				output(". Her womanly folds are almost entirely forgotten as she babbles, <i>“I think I want more, [pc.name].... I mean, I remember not wanting to turn myself into a hyper-dicked freak, but now... I kind of want to see how big it can get. Each time it feels better!”</i> She slurps at her tip as you consider the situation. <i>“Umph! So good! Come on, give me a monster cock! I promise I won’t split you in half with it!”</i>");

				output("\n\nThinking about it for a moment, you realize that Penny probably wouldn’t be able to handle any more of the drug. Her lust seems to be stoked to a high degree already, and giving her more Throbb would certainly lead to her losing her willpower.");

				output(" That said, she’s very pliable at the moment, so if you wanted to turn her into an obedient, sex-addicted pet you could probably quite easily work her up into embracing her new assets a little more enthusiastically. Chances are she’d be useless as shipboard security, but maybe she could do something else. Maybe she could be a live-in camwhore. Teasing her into being more of a orgasm-addicted exhibition-pet still wouldn’t exactly be <i>nice</i>, but at least she’d be able to pay off her debts while indulging in her basest, most licentious urges.");
				output("\n\nSo, what do you want to do?");
				//[Tell her to calm down] [Have fun with her]
				clearMenu();
				addButton(0,"Calm Down",calmDownYouPennySlut);
				addButton(1,"Tease Her",teasePenny)
				if(pc.hasItemByClass(HorseCock)) 
				{
					if(CodexManager.entryUnlocked("SynthSheath")) addButton(2,"SynthSheath",givePennyAHossCawk,undefined,"SynthSheath","Give Penny the Xenogen SynthSheath you found on Tarkus. She’d probably love having a horse-cock.");
					else addButton(2,"Try This",givePennyAHossCawk,undefined,"Try This","Give Penny the horse-cock strap-on you found on Tarkus. Maybe the randy hermaphrodite could use it as a sex toy.");
				}
				else addDisabledButton(2,"Locked","Locked","You don’t have the required item for this option.");
				addButton(14,"Back",approachCrewPenny,true);
			}
			else 
			{
				output("<i>“Mmmoooore?”</i> Penny moans as she starts to masturbate in front of you. Her hand can’t even close around her girth at this point, and the tip is so tall that it smacks her in the chin whenever she gets careless. She grabs hold of it with both hands, one sliding over the half facing you while the other ");
				if(penny.balls > 0) output("cradles her balls");
				else output("dips into her sheath to play with it");
				output(". Her womanly folds are almost entirely forgotten as she babbles, <i>“I think I want more, [pc.name].... I mean, I remember not wanting to turn myself into a hyper-dicked freak, but now... I kind of want to see how big it can get. Each time it feels better!”</i> She slurps at her tip as you consider the situation. <i>“Umph! So good! Come on, give me a monster cock! I promise I won’t split you in half with it!”</i>");
				output("\n\nPenny will surely lose it if you give her the go ahead to take any more. Her already lustful nature seems to be stoked to a high degree already, and giving her more Throbb would certainly lead to her losing her willpower. No, she can’t have any more now, and you tell her as much.");
				output("\n\nAmazingly, she actually wilts a little at that. Her masturbation stops as the fennec dreamily says, <i>“Okay, okay, I guess. I’m getting a little out of hand, aren’t I?”</i> You nod. <i>“Good, cause it seems to be keeping you around. I’m going to fuck you so hard as soon as I get caught up on work!”</i> She turns back towards what she was doing while trying to pack her monster dick into her pants. It doesn’t work all that well.");
				this.clearMenu();
				if(pc.hasItemByClass(HorseCock)) 
				{
					if(CodexManager.entryUnlocked("SynthSheath")) addButton(0,"SynthSheath",givePennyAHossCawk,undefined,"SynthSheath","Give Penny the Xenogen SynthSheath you found on Tarkus. She’d probably love having a horse-cock.");
					else addButton(0,"Try This",givePennyAHossCawk,undefined,"Try This","Give Penny the horse-cock strap-on you found on Tarkus. You have a hunch it might be more than it seems. You shouldn’t give this to her unless you’re ready for things to get a little out of hand.");
				}
				else addDisabledButton(0,"Locked","Locked","You don’t have the required item for this option.");
				this.addButton(14,"Back",approachCrewPenny,true);
			}
		}
	}
}

//[=Outfit=]
// Tooltip: Ask Penny to wear a different set of clothes.
// (scene: Outfit Intro)
public function pennyOutfitTalk():void
{
	clearOutput();
	showPenny();
	author("B");
	output("You look over what Penny is wearing.");
	output("\n\n");
	if(penny.armor is UGCCasualOutfit)
	{
		output("She’s wearing a too-small white T-shirt, with sleeves that reach halfway to her elbows; a hem that reaches just beneath her ribs, exposing her midriff; and clings to her DD-cup breasts, leaving nothing to your imagination. Emblazoned on its front is a cutesy cartoon character – what looks like a pink cat-like creature with <i>huge</i> blue eyes, striking a playful pose, standing on top of some words written in a language you don’t immediately understand. For pants, she’s wearing a pair of cut-off jeans that hug tightly to her thighs; they also only reach halfway to her knees, exposing quite a lot of furry leg to the air of the ship");
		if(penny.isHerm())
		{
			output(" – and, ");
			if(penny.cocks[0].cLength() < 7) output("it does a poor job of hiding her inert package");
			else if(penny.cocks[0].cLength() < 13) output("they strain and creak every time she shifts her weight, trying to maintain her massive package");
			else output("they provide zero cover for her obelisk of a cock and her massive testicles; if she were to get just stiff, they’d start tearing away thread-by-thread");
		}
		output(".\n\nYou’re aware that she packed her officer’s uniform.");
	}
	else
	{
		output("She’s wearing the same U.G.C. officer’s uniform she was wearing when you two first met. The thick, dark material clings to her body very tightly, without restricting her movement and without giving off too much noise whenever she moves. They cover her prim-and-properly, from her neck, to her wrists, to her waist, and to her ankles, exposing nothing in between to the air of the station. Although it’s a very professional uniform, it still does little to disguise her hefty, DD-cup breasts");
		if (penny.hasCock())
		{
			if(penny.cocks[0].cLength() < 7) output(", nor do her pants perfectly conceal the telltale bulge of her currently-inert cock between her legs");
			else if(penny.cocks[0].cLength() < 13) output(", and her pants do little to hide the impressive cock currently sitting flaccid in her sheath, or her big, full, heavy nuts pressing into her thighs");
			else output(", and her uniform is no match for her impressively, embarrassingly large cock and her churning, heavy balls, even as they are, sitting completely flaccid and soft. If she were erect, you doubt even her sturdy uniform would be able to withstand the sheer kinetic force her dick would be outputting");
		}
		output(".\n\nYou’re aware that she packed some civilian clothing when she joined your crew. You’re sure, if you asked her to change, she’d acquiesce.");
	}
	clearMenu();
	addButton(0,"Ask2Change",ask2ChangePenny);
	addButton(14,"Back",pennyCrewTalk);
}

//[=Ask2Change=]
// (scene: Get Naked, Then Clothed)
public function ask2ChangePenny():void
{
	//UGCCasualOutfit
	//UGCUniform
	clearOutput();
	showPenny();
	author("B");
	output("You ask Penny if she wouldn’t mind changing her clothes. " + (penny.armor is UGCCasualOutfit ? "Her officer’s uniform really gives her a sense of professionalism, something that you feel like your ship is missing sometimes":"As much as you like a girl in a uniform, let’s be real: you run a very loose ship, here, and as long as everyone does their part, you don’t mind everyone wearing their casual clothes") + ".");
	output("\n\n<i>“Hmm,”</i> she hums, placing her left index finger against her bottom lip. <i>“Right nnnnnnnnnow, you mean?”</i>");
	output("\n\n" + (pc.isNice() ? "You tell her that you can leave, if it’ll make her more comfortable... but, you could also stay right where you are.":"Hell yeah, right now. You two can call it a direct order, if it’ll make things more spicy."));
	output("\n\nPenny stands, swishing her hips and her long, fluffy tail as she does; her hands run sensually down her sides as she brings her knees together. <i>“Oh, alright,”</i> she says drearily, as if it were a chore. Her back is toward you as her hands hook around her pants. <i>“But I’m only doing this because you’re my " + (penny.armor is UGCCasualOutfit ? "mate":"captain") + ".”</i>");


	// Civvy clothes, into uniform
	if(penny.armor is UGCCasualOutfit)
	{
		output("\n\nYou hear the click of her button coming undone, and then the zip of a zipper being slowly, teasingly drawn down; then, she reaches behind her, and undoes the denim clasp above her tail, keeping her shorts to her hips. Her formerly tight, clingy, torn jeans come loose, but they don’t fall; she has to give them a slow, methodical yank, down one leg, and then the other, shimmying a slow, snake-like shimmy, letting them naturally drop down her soft, fuzzy, shapely legs.");
		output("\n\nShe’s wearing a red thong that clings to her form, standing apart from her crisp-colored fur. Feeling your eyes on her, she peers over her shoulder and whistles at you, pulling your gaze away from her body. When you look her in the eye, she smirks, and her thumb pulls, then snaps, at her thong – your focus is conflicted, and she smirks wider.");
		output("\n\nWith her shorts laying in a puddle at her feet, she playfully kicks her foot forward, hooking them onto her toe and flinging them in your direction, flopping her shorts against your [pc.chest]. She pivots, facing you, her thumbs still playing at the edges of her thong");
		if(penny.hasCock())
		{
			output(", giving you a full-on view of her package, ");
			if(penny.cocks[0].cLength() < 7) output("barely concealed in the material");
			else if(penny.cocks[0].cLength() < 13) output("the tip of her fuzzy sheath and the edges of her big nuts spilling from the edges around her underwear");
			else output("the material straining to the breaking point, hiding absolutely none of her gargantuan balls and bulging sheathe");
		}
		output(" – but, rather than pull her thong down, she shifts her hands to the hem of her shirt.");
		output("\n\nPenny crosses her arms, gripping the cotton of her shirt, and easily, seamlessly lifts it over her head. Her mohawk hair spills to one side as she lifts her arms; she flicks her head to the other, righting it, and glares her green eyes into yours. She throws her T-shirt towards you, adding it to her shorts, her tongue in her cheek. She’s wearing a cushy, stable sports-bra, in matching red, to support her girls. She’s down to her underwear, standing before you, giving you your show.");
		output("\n\nPlayfully, she puts her foot onto the suitcase, then kicks it behind her. <i>“It’s a combination lock,”</i> she tells you as she pivots, her eyes looking over her shoulder as she does. <i>“Wouldn’t want you to see my password. A girl’s gotta keep a secret.”</i>");
		output("\n\nOf course, it’s just a flimsy excuse for her to slowly, ever so slowly, bend at the hips to reach her suitcase. Her legs are together and straight as could be, and she lifts her tail, draping it over her back –");

		processTime(10);
		pc.lust(5);
		//change clothes here:
		if(penny.armor is UGCCasualOutfit) penny.armor = new UGCUniform();
		else penny.armor = new UGCCasualOutfit();
		// continue here if the PC has 33 Lust or more:
		/* FEN NOTE: Nah. Keep going
		if(pc.lust() >= 33)
		{
			clearMenu();
			addButton(0,"Continue",continueChangingPenny,true,"Continue","Enjoy the show and let her finish.");
			addButton(1,"Interrupt",interruptPennyChanging,undefined,"Interrupt","You’ve seen enough. You need to fuck her.");
			
		}
		else 
		*/
		continueChangingPenny();
	}
	// uniform, moving into civvy clothes
	else
	{
		output("\n\nYou hear the clicks and clacks of her belt being undone, and when the clasp lets loose, her pants sag very slightly, no longer clinging to her form so tightly that you could bounce a coin off her glutes. Followed by that is the sound of two buttons being undone, and then the excruciatingly slow zip of a zipper being drawn down – all the while, Penny is shuffling back and forth on the spot before you, getting her legs together and her butt flexed.");
		output("\n\nOnce her pants are loose, she bends forward at the waist – still keeping her legs locked and straight – and, with her thumbs hooking into her waistband, shimmies her pants down her body: first her right side, then her left, then her right again. Each time she rocks her hips and moves to one side, her pants draw just a little lower down the crescent of her ass, showing you more, fluffy, furry, toned booty.");
		output("\n\nShe’s wearing a red thong, contrasting against the crisp colors of her fur; when the band of her pants gets beneath the moon of her ass, she pauses and glances over her shoulder, one eye catching your stare and hooking it like a fish to a line. She smirks that predatory, toothy smirk of hers, and whistles at you for your attention – when she has it, her thumb hooks into the thin material of her underwear and snaps it against her body. You can’t decide where to look, and it gives her a perverse thrill, knowing she has you so enthralled.");
		output("\n\n<i>“You know,”</i> Penny starts. She bends further forward, still keeping her legs locked and straight, as she pulls her pants those last few inches until they clear the circumference of her ass. Without her natural curvature to support them, they fall to the floor in a loud ‘flump,’ collapsing into a fabric puddle around her ankles, and leaving her lower half totally exposed. <i>“Normally, it’s the</i> officer <i>performing the strip-search on the perp, not the other way around.”</i> She hooks a toe into the waistband of her pants, and, without pivoting and with a dexterous fling of her foot, she catapults her discarded pants onto the bed. <i>“It takes a very</i> special <i>kind of perp to get a cop naked....”</i>");
		output("\n\nNow naked from the waist down, save for a very thin layer of red cotton");
		if(!penny.hasCock())
		{
			output(" protecting her feminine bits from your lecherous eyes (but not the bit of excited dribble staining them burgundy)");
		}
		else if(penny.cocks[0].cLength() < 7) output(" outlining every facet of her bloated-but-inert sheathe" + (penny.balls > 0 ? " and bulging fox balls":""));
		else if(penny.cocks[0].cLength() < 14) output(" straining to contain her impressive manhood, its strands stretched to contain her massive sheathe and backed-up fox balls");
		else output(", which does absolutely nothing to hide her gargantuan sheathe and her massive, bloated nuts, every part of her spilling from the top and the sides (and she isn’t even erect!)");
		output(", she hooks her thumbs beneath the top half of her uniform, beneath the heavier, thicker armor plating that protects her torso. It takes her some effort to pull the unyielding armor up and over her bust, and she struggles – which ruins the show just a little – but, once it’s off, she’s left totally nude, save for a strip of cloth that you could rip apart with your teeth covering her waist, and a red sports bra keeping her girls in position. With a flick of her wrist, the top of her uniform joins her pants on the bed.");
		output("\n\nShe clenches her knees together and presses her arms against her breasts, and she coos to herself, enjoying the tactile sensation of her body against itself while a pair of eyes are watching her.");
		output("\n\nPlayfully, she puts her foot onto the suitcase, then kicks it behind her. <i>“It’s a combination lock,”</i> she tells you as she pivots, her eyes looking over her shoulder as she does. <i>“Wouldn’t want you to see my password. A girl’s gotta keep a secret.”</i>");
		output("\n\nOf course, it’s just a flimsy excuse for her to slowly, ever so slowly, bend at the hips to reach her suitcase. Her legs are together and straight as could be, and she lifts her tail, draping it over her back – ");
		processTime(10);
		pc.lust(5);
		//change clothes here:
		if(penny.armor is UGCCasualOutfit) penny.armor = new UGCUniform();
		else penny.armor = new UGCCasualOutfit();
		// continue here if the PC has 33 Lust or more:
		/* FEN NOTE: Nah. Keep going
		if(pc.lust() >= 33)
		{
			clearMenu();
			addButton(0,"Continue",continuePennyChangingNotOfficer,true,"Continue","Enjoy the show and let her finish.");
			addButton(1,"Interrupt",interruptPennyChanging,undefined,"Interrupt","You’ve seen enough. You need to fuck her.");
			//[=Continue=][=Interrupt=]
		}
		else */
		continuePennyChangingNotOfficer();
	}
}

//[=Interrupt=]
// Tooltip: You’ve seen enough. You need to fuck her.
/* Play the “OverDeskFuck” scene or some PC-is-female scene; will require some contextual edits
public function interruptPennyChanging():void
{

}*/

//[=Continue=]
// Tooltip: Enjoy the show and let her finish
// Don’t display any buttons and don’t interrupt the scene if the PC has 32 Lust or less
public function continuePennyChangingNotOfficer(newScreen:Boolean = false):void
{
	if(newScreen)
	{
		clearOutput();
		showPenny(true);
		author("B");
		output("Y");
	}
	else output("y");
	output("ou have a total, uninterrupted view of her thong-clad, and slightly damp, vixen vagina");
	if(penny.hasCock() && penny.balls > 0) output(", and her thick, full, bouncing balls");
	output("; the only thing sitting between you and one of the greatest shows in space is a flimsy bit of red fabric. You");
	if(pc.lust() >= 33) output(", with some restraint,");
	output(" do nothing but sit and watch.");

	output("\n\n<i>“Here we are,”</i> she muses as she pulls out her civilian clothing, starting with her shorts. Continuing the show, she takes her time putting her two feet into the denim shorts, and when she starts hiking them up, she makes it as much of a struggle as she did getting off her uniform: when the shorts hit the curve of her ass, she has to shake, shimmy, and bounce them up over the swell of her rump.");
	output("\n\nUnlike her uniform, though, her shorts are much tighter, clinging to her body like a second skin and threatening to burst if she were to split her legs just a little too far" + (penny.hasCock() ? " – or if she even got the hint of an erection":"") + ". She lifts her zipper into place flirtatiously, but she struggles a little bit getting the front button of her pants into place, and the rear denim clasp up and over her tail.");
	output("\n\nWith just one last piece left, she bends forward (at the waist, of course), to reach into her suitcase and pull out her top: a plain white T-shirt, with a cutesy cartoon character plastered on the front: a pink cat-like creature, striking a playful pose, and standing on top of a phrase written in a language you don’t immediately understand.");
	output("\n\nEven from where you’re sitting, you know that the shirt is too small for her, but she slips it on anyway: the hem is stretched taut to conceal her hefty, DD-cup breasts, and it reaches only to her lower ribs. The sleeves aren’t much better, only going down halfway to her elbows, leaving the rest of her arms bare.");
	output("\n\nFinally, with all that done, she’s back in her civilian clothes, looking just like she did the day she joined your crew. She finishes the ensemble by righting her shirt – which promptly crumples and un-rights itself, mismatched as it is against her body.");
	output("\n\nShe resumes her earlier sitting position next to you. With two fistfuls, she grabs onto both pieces of her now-discarded uniform and flops them onto her open suitcase.");
	output("\n\n<i>“Was there... anything</i> else <i>I can do for you, my mate?”</i> Penny asks you, her tongue licking at her lips.");
	output("\n\nIt’s good to be captain, sometimes.");
	clearMenu();
	processTime(25);
	pc.lust(40);
	pennyCrewMenu();
}

//[=Continue=]
// Tooltip: Enjoy the show and let her finish
// Don’t display any buttons and don’t interrupt the scene if the PC has 32 Lust or less
public function continueChangingPenny(newScreen:Boolean = false):void
{
	if(newScreen)
	{
		clearOutput();
		showPenny(true);
		author("B");
		output("Y");
	}
	else output("y");
	output("ou have a total, uninterrupted view of her thong-clad, and slightly damp, vixen vagina");
	if(penny.hasCock() && penny.balls > 0) 
	{
		output(", and her thick, full, bouncing balls}; the only thing sitting between you and one of the greatest shows in space is a flimsy bit of red fabric. You" + (pc.lust() >= 33 ? ", with some restraint,":"") + " do nothing but sit and watch.");
	}
	output("\n\n<i>“Here we are,”</i> she muses as she pulls out her officer’s uniform, starting with her pants. Continuing the show, she takes her time stepping into the leggings; once she has her ankles in the pants, she glances over towards you once again, and then starts shimming her pants up her legs. They’re considerably looser and more form-fitting than her shorts, but she makes a big show of effort getting them up regardless, for your benefit.");
	output("\n\nOnce the waistband of the lower half of her uniform is around her hips, ‘form-fitting’ is right: they were tailor-made specifically for her, and with the way they frame her ass, you bet you could bounce a credit chit right off her cheeks.");
	output("\n\nThe pants come with a belt, which she leaves undone and open for now; instead, she bends forward (at the waist, of course) again and retrieves her upper-half: a thick type of material, almost like armor, overtop a more comfortable silk shirt. It’s not as easy to get on; the armor is inflexible and unforgiving, especially around her chest, and she has to wrestle her arms through the sleeves. It ruins the show a bit, but you won’t complain.");
	output("\n\nFinally, with all that done, she’s back in her officer’s uniform, looking just like she did the day you met her. She finishes the ensemble by tightening and fastening her belt.");
	output("\n\nShe resumes her earlier sitting position next to you. Gingerly, she picks up her now-discarded T-shirt and shorts, pinching them between her fingers, and flops them onto her suitcase.");
	output("\n\n<i>“Was there... anything</i> else <i>I can do for you, captain?”</i> Penny asks you, her tongue licking at her lips.");
	output("\n\nIt’s good to be captain, sometimes.");
	processTime(25);
	pc.lust(40);
	pennyCrewMenu();
}

//Penny Sex Menu
public function pennyCrewSexApproach():void {
	showPenny();
	clearOutput();
	//Non-futa
	if (!penny.hasCock())
	{
		//Horny
		if(penny.lust() >= 66) output("Penny’s ears perk right up when you admit that you want to have sex. She even says, <i>“Ohhh, this is just what I need, [pc.name]!”</i> Out of her seat a moment later, the busty, aroused vixen coos, <i>“So, any preference as to how I take you today, mate?”</i>");
		//Not Horny
		else output("Glancing up at you, Penny sighs, <i>“Right now?”</i> She doesn’t really look up for it right now, but after a moment, a sly look spreads across her face. <i>“I suppose I can </i>squeeze<i> you in.”</i> She shimmies a hand into the waistband of her pants as she lazily stands. Her eyelids drop seductively as she pulls her fingers out, glistening with moisture. <i>“I guess your scent has about as much effect on me as the zil, huh?”</i> she jokes, though you wonder if there’s a bit of truth sliding underneath the jest.");
	}
	//Futa
	else
	{
		output("Penny is up and out of her chair almost as soon as you mention the idea of sex. Her fly is undone, leaving her [penny.cock] to point up at you, almost accusingly. She touches it experimentally and shivers from the rush of pleasure that courses out of it in response. <i>“I think so, [pc.name].”</i> Rubbing it a little faster, the fennec enthusiastically offers, <i>“Does my mate have any preference for how I take " + pc.mf("him","her") + "?”</i>");
	}
	pennyCrewSexMenu();
}

public function pennyCrewSexMenu():void
{
	clearMenu();
	
	// I don't THINK these scene is supposed to /require/ the player have a cock; it never once uses any logic or parse tags for the players cock, nor refer to it within the scene text OR the "exit" texts...
	if(penny.hasCock()) addButton(0,"Onahole Her",jackinPennyOffWithAnOnahole,undefined,"Onahole","Jerk off Penny’s drug-grown cock with an onahole.");
	else addDisabledButton(0, "Onahole Her","Onahole Her","Penny must be a futanari for this scene to work.");
	
	if (pc.hasCock())
	{
		//if(penny.hasCock()) addButton(0,"Onahole Her",jackinPennyOffWithAnOnahole);
		//else addDisabledButton(0,"Onahole Her");
		//Needs dick or strap-on
		if (pc.cockThatFits(penny.vaginalCapacity(0)*1.5) >= 0) addButton(1,"OverDeskFuck",pennyOverTheDeskRoughFuck,undefined,"OverDeskFuck","Bend Penny over the desk and go to town.");
		else addDisabledButton(1,"OverDeskFuck","OverDeskFuck","You’re too big to bend her over the desk and fuck her.");
		if(penny.hasCock()) addButton(2,"Frottage",pennyFrottage,undefined,"Frottage","Grind dicks with Penny.");
		else addDisabledButton(2,"Frottage","Frottage","This scene requires Penny to have a dick.");
		addButton(3,"Pawjob",penniliciousPawjob,undefined,"Pawjob","Get a fluffy footjob from Penny.");
		addButton(4,"FaceFuckHer",faceFuckPenny,undefined,"FaceFuckHer","Fuck Penny’s face.");
	}
	else 
	{
		addDisabledButton(1,"OverDeskFuck","OverDeskFuck","This scene requires you to have a penis.");
		addDisabledButton(2,"Frottage","Frottage","This scene requires you to have a penis.");
		addDisabledButton(3,"Pawjob","Pawjob","This scene requires you to have a penis.");
		addDisabledButton(4,"FaceFuckHer","FackFuckHer","This scene requires you to have a penis.");
	}
	this.addButton(5,"EatHerOut",gardeFordWritesPennySmex,undefined,"EatHerOut","Eat out Penny.");
	if(penny.hasCock() && !pc.isTaur() && !pc.isNaga()) addButton(6,"U.Desk Suck",suckPennyUnderDesk,undefined,"Under Desk Suck","Suck Penny off under her desk.");
	else if(!penny.hasCock()) addDisabledButton(6,"U.Desk Suck","Under Desk Suck","Penny needs to be a hermaphrodite for this.");
	else addDisabledButton(6,"U.Desk Suck","Under Desk Suck","You need to have a body that would fit under Penny’s desk for this.");
	if(penny.hasCock() && pc.hasGenitals()) addButton(7,"Roleplay",pennyRPScene,undefined,"Roleplay","Roleplay a penitent prisoner for Penny to abuse.");
	else if(!penny.hasCock()) addDisabledButton(7,"Roleplay","Roleplay","Penny needs a penis in order to this.");
	else addDisabledButton(7,"Roleplay","Roleplay","You need genitals to roleplay with Penny.");
	

	if(penny.hasCock()) addButton(8,"Catch Anal",getAssFuckedByPenny,false,"Catch Anal","Get ass-fucked by Penny.");
	else addDisabledButton(8,"Catch Anal","Catch Anal","Penny needs a dick to fuck you in the ass.");
	
	
	if(pennyIsCumSlut()) addButton(9,"Selfsuck",pennySelfSuckCumsluttery,undefined,"Selfsuck","Watch Penny suck herself off.");
	else addDisabledButton(9,"Selfsuck","Selfsuck","Penny has to be a futanari cum-slut for this scene.");
	if(pennyIsCumSlut() && pc.hasCock()) addButton(10,"Bukkake",bukkakePenny,undefined,"Bukkake","Cooperatively cover Penny in spunk.");
	else addDisabledButton(10,"Bukkake","Bukkake","This requires Penny to be a futanari cum-slut and for you to have a penis.");

	if (flags["FLAHNE_TALKED_ABOUT_CUMSLUTPENNY"] != undefined && pennyIsCumSlut() && shipLocation == "SHIP HANGAR") addButton(11, "Invite Flahne", pennyVsFlahneWhoWillOutslutWho,undefined,"Invite Flahne","Invite Flahne over for a threesome with Penny.");
	else addDisabledButton(11, "Invite Flahne","Invite Flahne","This scene requires Penny to be a cum-slut and Flahne to have been told about it.");
	if((penny.isBimbo() || pennyIsCumSlut()) && pennyIsCrew()) 
	{
		if(pc.hasCock()) addButton(12,"Cam & Jerk",mutualJerkWithPennyCamStuff,undefined,"Cam & Jerk","Get on cam with Penny and jerk off into each other’s mouths for the ExtraNet.");
		else addDisabledButton(12,"Cam & Jerk","Cam & Jerk","You can’t jerk off with Penny if you don’t have a dick.");
	}
	else addDisabledButton(12,"Cam & Jerk","Cam & Jerk","Since Penny isn’t an extranet camwhore, there’s not point in doing this.");
	
	if (penny.hasCock() && flags["PENNY_MADE_LOVE"] != undefined)
	{
		if (pennyIsCumSlut() || penny.isBimbo()) addButton(13, "Make Love", vaginaRouter, [timeToLoveAFoxCamwhore, 0, 1, 0], "Make Love", "Penny, for all her unrepentant autofellatio, still enjoys the gentle touch of a lover. Ask if she’s willing to calm down long enough for it.");
		else addButton(13, "Make Love", vaginaRouter, [makingWuvvWiffASexyOfficer, 0, 1, 0], "Make Love", "Penny, for all her bluster, has a softer side. Ask if she’s willing to explore it.");
	}

	addButton(14,"Back",approachCrewPenny,true);
}

//[=Other Crew=]
// Grey out this button if there are no other crewmates.
// Tooltip: Ask Penny what she thinks of the fact that you have other crewmates.
// Tooltip (no crewmates, not silly): You don’t have any other crew mates to talk about, so this is a bit of a moot point.
// Tooltip (no crewmates, silly): And here is where you would talk about your other crewmates... IF YOU HAD ANY!!!!
// (scene: Other Crew)
public function otherCrewPennyTalk():void
{
	clearOutput();
	showPenny();
	author("B");
	flags["PENNY_OTHER_CREW_TALKED"] = 1;
	if(!pennyIsCumSlut())
	{
		output("You ask Penny what her opinion is on the rest of your crew. As the ship’s captain, it’s important to you that your crew’s morale remains high, and if there’s ever a problem, you should try to mediate it and solve it.");
		output("\n\n<i>“They seem to be a pretty nice bunch, to me,”</i> she answers simply. <i>“I don’t have any problems with the rest of them. I’m not too surprised that you managed to charm your way into cajoling some other suckers into working for you.”</i> She laughs, and leans forward, nuzzling her nose against yours. <i>“How much do you pay them? Nothing, right? You filthy little " + (pc.mf("tramp","minx")) + ".”</i>");
		output("\n\nYou relax. It’s good to hear that–");
		output("\n\n<i>“But,”</i> she says. Her tone has dropped; her nuzzling has stopped, but her nose is still against yours; and her eyes are open and narrowed, focused like a laser into you. <i>“I can smell your stink</i> all over <i>them. Maybe you aren’t paying them in money, is that it?”</i>");
		output("\n\nYou freeze. You were hoping that Penny wouldn’t have an issue with you tending to your crew the way you do – trips between planets can get awfully long, and rushing can be difficult, frustrating, lonely work sometimes... you won’t deny that " + (pc.isNice() ? "not everyone in your crew has the same ‘traditional’ needs as some others":"you might have kept your crew in check with ‘alternative’ methods") + ". Whatever keeps their morale high, like you said.");
		output("\n\n<i>“What a load,”</i> she says, her lips lifting to show you her clenched, snarling teeth. <i>“I thought we had something, [pc.name], and here I find out you’ll fuck just about anything with a pretty face.”</i>");
		output("\n\nYou aren’t sure how to reply to that. The seconds tick by tensely.");
		output("\n\n<i>“Hah! I’m just " + (penny.armor is UGCCasualOutfit ? "fuckin’":"messing") + " with you, " + (penny.armor is UGCCasualOutfit ? "my mate":"captain") + ",”</i> Penny laughs, leaning back and punching you in the arm well-meaningly. <i>“I’m not mad. In fact, I would be surprised if you</i> didn’t <i>have a harem of horny beauties following you around!”</i>");
		output("\n\nYou say nothing yet. You’re getting a <b>lot</b> of conflicted messages.");
		output("\n\n<i>“Look, I’ll break it into threes for you. First,”</i> she says, lifting her index finger, <i>“you " + (penny.armor is UGCCasualOutfit ? "fucking":"messing") + " around a lot doesn’t change what you did for me. When we stopped that illegal mining operation and excavated that deposit of Oxonium, I knew what I wanted to do and who I wanted to be with, end of story. Second,”</i> she says, lifting her middle finger, <i>“I’ve seen the way you fuck, you sexy " + (pc.mf("stud","bitch")) + "; if you could rope</i> me <i>into wanting to be with you, well... let’s just say, when it comes to everyone else in your crew, that I get it.”</i>");
		output("\n\n<i>“And finally,”</i> she says, putting her hand down flat onto the bed and leaning back into you, <i>“between you and me... a lot of them seem like a bunch of beta bitches to me. I wouldn’t mind being the alpha bitch.”</i> Her tongue snakes out of her lips and licks them wetly – then, she leans in, bringing her mouth to your [pc.ear]. <i>“I could see myself corralling one or two of them into your quarters, and we could show them how an alpha like yourself treats their pack.”</i> She clinches her statement by nibbling on your ear, her tongue tracing the rim; you can hear and you can feel her breath quickening through her nose and against your neck.");
		output("\n\nJust as suddenly as she starts, she stops, and pulls back, resuming her earlier sitting position. <i>“Something to think about, my " + (penny.armor is UGCCasualOutfit ? "mate":"captain") + ",”</i> she says slyly.");
		output("\n\nIt’s safe to say that she’s okay with your relationship as the captain of your crew.");
		processTime(10);
		pc.lust(20);
		clearMenu();
		addButton(0,"Next",pennyCrewTalk);
		//[=Next=]
		// end scene (scene: Other Crew); increase Lust by 20; return to Talk menu
	}
	else
	{
		author("Fenoxo");
		output("You ask Penny what her opinion is on the rest of your crew.");
		output("\n\nA slow smile spreads across her vulpine muzzle. <i>“I think they’re hotties, you " + pc.mf("stud","alpha") + ".”</i> She chews her lip, hands automatically falling into service about the beastial length in her lap. <i>“I think it’s hot as fuck that you’re assembling a crack team of sexy fuck-buddies to parade around the universe with. It’s so flattering that I get to be one of them. " + (pc.hasCock() ? "So hot that I get to leave my cuntscent on your dick for them to smell the next time you drop trou for a quickie.":"So hot that I get to leave my cockscent all over you to get them going whenever you stop by someone else’s room for a quickie.") + "”</i>");
		if(pc.isBimbo()) output("\n\nYou giggle in delight. This slutty fox knows exactly how you think!");
		else if(pc.isBro()) output("\n\nYou grunt in approval. This slutty fox thinks almost like a Treated girl.");
		else if(pc.isNice()) output("\n\nYou crack a smile at that.");
		else if(pc.isMischievous()) output("\n\nYou quirk an eyebrow, amazed at how easily she’s taken to the life of a ship-slut.");
		else output("\n\nYou smirk. Of course she wants to bang everyone in sight. What a slut!");
		output("\n\n<i>“Sooo I was thinking,”</i> Penny draws with a lazy, pre-slopping cock-stroke, <i>“would it be okay if I fucked around with the rest of the crew? Not on camera or anything - unless you wanted me to, but it feels like this place is basically one big fuck-party, and I ought to be invited!”</i> She looks up at you for approval, seemingly panting from the sheer erotic weight of her request. <i>“Please, mate? I’ll still be your favorite cock-drunk camwhore - just one that keeps the rest of your pets satisfied and in line: your top beta bitch.”</i>");
		output("\n\nThat’s a big ask - do you let Penny fuck around, or keep her on a tight leash?");
		processTime(10);
		pc.lust(10);
		clearMenu();
		addButton(0,"Share",shareWithPennySluts);
		addButton(1,"Don’t Share",dontSharePennyLove);
	}
}

//Don't share
public function dontSharePennyLove():void
{
	clearOutput();
	showPenny();
	author("Fenoxo");
	output("<i>“No.”</i>");
	output("\n\nPenny actually lets go of her cock at that. <i>“Awww, really?”</i> She pouts, enormous ears flopping back under their own weight. <i>“I thought... with how open you were about fucking around, and fucking me, and helping me be the hot piece of ass I always wanted to be... that you’d be as okay with me sharing that as I was with you.”</i> Casting her eyes down, the former fox-cop huffs. <i>“Fine. I won’t fuck your other bitches, but you’d better be cool with me visiting Flahne on Mhen’ga.”</i> She jabs a finger at your chest. <i>“After all, you’re the one that made me so fucking horny all the time. Maybe that makes it your job to keep these nuts from overflowing.”</i> She hefts her balls in annoyance. <i>“So fuck me, you beast. Fuck me your slutty, cum-drunk fox-pet.”</i>");
	output("\n\n...There are worse ways to wind up in bed.");
	flags["PENNY_CUMSLUT_OTHER_CREW"] = undefined;
	while(pc.lust() < 33) { pc.lust(1); }
	pennyCrewSexMenu();
	setButtonDisabled(14);
}

public function shareWithPennySluts():void
{
	clearOutput();
	showPenny();
	author("Fenoxo");
	output("Sure.");
	output("\n\nPenny giggles airily. <i>“Really?”</i> She beams in delight. <i>“I knew you were the best mate in the entire universe, but now I know I’ve won the lottery.”</i> The fox casually slaps her cock into her cheek, splattering musky dickjuice all the way up to her eyebrow. <i>“Not only did you give me the biggest, fattest, horniest cock in the system - you’re giving me permission to fuck the hottest girls in the quadrant with it.”</i> She surges forward into a clutching hug. <i>“Thank you so much, [pc.name]. I promise you won’t regret this.”</i> She kisses your cheek. <i>“We’re going to have so much fucking fun!”</i>");
	flags["PENNY_CUMSLUT_OTHER_CREW"] = 1;
	clearMenu();
	addButton(0,"Next",approachCrewPenny,true);
}

//Squirting Talk
//Crew Penny only, post ziltraps.
public function pennySquirtingTalk():void
{
	clearOutput();
	showPenny();
	author("Fenoxo");
	flags["PENNY_SQUIRT_TALK"] = 1;
	//Nonfuta
	if(!penny.hasCock())
	{
		//Bimbo
		if(pc.isBimbo()) output("<i>“Penny, have I ever told you how fucking hot it is that you squirt now?”</i>");
		//Else
		else output("You point out that Penny’s become a bit of a squirter recently.");
		output("\n\nThe fox-girl fidgets, doubtlessly blushing crimson beneath her tawny fur. <i>“You noticed, huh?”</i> Squirming a little harder, she turns halfway away, looking back at you over her shoulder. <i>“It was that stupid ziltrap. I think whatever it did to me kind of... broke my pussy.”</i> Her luxuriously fluffy tail sags uncertainly. <i>“Now I can’t cum without squirting like a firehose. Every single time.”</i> She glances at a hamper that smells very, very much like her cunt. <i>“I can’t buy enough towels. I’m always doing laundry, and I swear I’m even hornier than I used to be.”</i> She pauses, watching your face anxiously.");
		output("\n\nYou put your hand on her shoulder and squeeze comfortingly. You’d never hold her orgasmic enthusiasm against her.");
		output("\n\n<i>“Really?”</i> Penny straightens, turning to face you full-on. Her ears, each almost the size of her head, perk up attentively. She stalks forward into a hug, wiggling her hips excitedly. The fluff of her tail tickles your cheek from over her shoulder. <i>“Then let’s say I get one of those little fluid neutralizer drones the kui-tan like so much. I could spend less time cleaning and more time " + (pc.hasCock() ? "soaking my mate’s cock":"soaking my mate") + ".”</i> She nips your neck. <i>“I may have held back a few credits from my debt payment... if I don’t need to pay to fix this...”</i> She grinds a very damp pussy against your thigh. Rivulets of vulpine moisture race down your [pc.legFurScales]. <i>“Then I have more than enough for that. Maybe even some bigger dildos, since I’m so <b>slick</b> all the time.”</i>");
		output("\n\nThe libidinous fox-woman’s arousal is contagious, and you feel a hot flush overtaking you in response.");
		output("\n\n<i>“Wanna feel?”</i> Penny offers.");
	}
	//Futa
	else
	{
		//Bimbo
		if(pc.isBimbo()) output("<i>“Penny, have I ever told you how fucking hot it is that you squirt now?”</i>");
		//Else
		else output("You point out that Penny’s become a bit of a squirter recently.");
		output("\n\nThe fox-girl fidgets, dick firming, racing up to fill her hand. She strokes it automatically, unthinkingly, trained by instincts her female brain was never meant to encounter, let alone wallow in. <i>“Yeah, and it’s so awesome!”</i> She beams up at you. <i>“It’s like... that ziltrap took my pussy and turned it into another cock.”</i> She " + (penny.balls > 0 ? "hefts her balls up and ":"") + "spreads her labia wide with two fingers to expose the soaking pink interior. Juices dribble down her thighs. <i>“I squirt from </i>everywhere<i> when I cum. My cock has that pressure - the kind that’s almost painful but ecstatic, and then it pulsates so powerfully that my hot little fox-cunt can’t help but do the same thing, and mate...”</i> Penny’s fingers are rubbing now. <i>“I love it. I love the feel of it. I love <b>ruining</b> my bed with how much of a hot, fuckable mess I am.”</i> She leans forward against you, the fluff of her ear against your ");
		if(pc.tallness >= 6*12) output("[pc.belly]");
		else if(pc.tallness >= 58) output("[pc.chest]");
		else output("cheek");
		output(".");

		output("\n\nYou stroke the near head-sized organ and smile when the fox-girl trembles from your touches.");
		output("\n\n<i>“Hooo, fuck me, mate.”</i> Keep that up, and you’re gonna make me squirt right here, on command.”</i> She whimpers, biting her lip. Thick ribbons of pre-cum ooze down a very needy-looking shaft to lubricate the hand that’s never left her dick. Penny gasps. <i>“You’re trying to make me squirt right now, aren’t you? Treating me like some... hypersexed pet.”</i> She tilts her head to offer a better angle.");
		output("\n\nThe fluff of her ear feels so soft against your fingers, so you stroke the other as well.");
		output("\n\n<i>“Mmmmmph!”</i> Penny squeals and shudders. Her cock goes off like a cannon. Shot after shot of useless, animalistic jism splatters across the floor of her chambers. The prick-vixen’s legs tremble, and a second later a terrible splash of silvery girl-cum bursts onto the scene, filling the air with the lurid scent of a fertile bitch in heat. Thrusting against her own palm, Penny milks out an absolutely enormous load for you, never once letting her ecstatic spasming take her ears out of your hands.");
		output("\n\nYou tease her, brushing your thumb around the inside of the blissed-out fox-woman’s pointed organs.");
		output("\n\nPenny’s eyes roll back as her cunt repeatedly splatters more and more pheromonal pleasure onto the floor with concussive force. It splatters across her chair, onto the sheets draped from her bed, and all over your [pc.legOrLegs]. She whimpers at the behest of dual sensations her brain isn’t entirely equipped to handle, cumming so hard that when the next splash of juicy, girlish love drenches the deck, she slides off into the puddle with a happy sigh. Her tongue flops out of her mouth to lie in it as she pants, overheated and blissed out.");
		output("\n\nYou gaze down at the fucked-out fox fondly.");
		output("\n\n<i>“So you like being a squirter?”</i>");
		output("\n\nPenny answers with a moan, one hand dipping to explore her tender delta. <i>“Ah! F-f-fuck yes. Gotta get one of those drones,”</i> she explains while casually toying with her lips, <i>“the ones kui-tan like so much. Something to clean up all the mess so I can focus on squirting whenever you want me to." + (pc.hasCock() ? " On your dick.":"") + " On your face. Anywhere on the ship. Maybe even in your bed. Just so it smells like cunt for any beta bitch you bring home.”</i> She pulls herself up onto wobbly knees and gazes at you with undisguised adoration. <i>“...Wanna see what it feels like when your mate squirts directly onto you?”</i>");
	}
	processTime(10);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",approachCrewPenny,true);
}

//[=Cuddle=]
// Tooltip (Penny is not bunking with you): Invite Penny to non-sexually share your bed at night. A girl with that much fluff is sure to help keep it warm!
// Tooltip (Penny is currently bunking with you): Ask Penny to give you some space for the night. She’ll take it well, surely.
// Continue from here if the PC is inviting Penny to their bed.
// (scene: Penny Bunking)

public function pennySleepwithInvite():void
{
	clearOutput();
	showPenny();
	author("B");
	if(flags["CREWMEMBER_SLEEP_WITH"] != "PENNY")
	{
		output((!pc.isBimbo() ? "You tell Penny, with your authority as the ship’s captain, that you are, until further notice, putting her under voluntary hot-bunking protocol, provided she voluntarily hot-bunks with the captain of the ship.":"You tell Penny that she’s like, real fluffy, and you think she’d be great to hold at night when you’re trying to sleep. But she doesn’t hafta sleep in your bed if she doesn’t wanna. Oh, maybe you can call that a thing – the ‘I Want You To Sleep In My Bed But You Don’t Hafta If You Don’t Wanna’... thing."));
		output("\n\nShe giggles, her tail swishing behind herself in amusement. <i>“Look, [pc.name], if all you wanted was for me to " + (penny.armor is UGCCasualOutfit ? "bang":"sleep with") + " you during the night, you could have just asked.”</i>");
		/*
		output("\n\nYes, you <i>could</i> have. But you chose to exercise your rights as the ship’s captain, and give her an order to follow.");
		output("\n\n<i>“So, I could voluntarily hot-bunk with anyone in this ship, ‘until further notice,’”</i> she says, putting a finger under her chin and smiling wryly, <i>“provided it’s either you, or nobody.”</i>");
		*/
		output("\n\nYou tell her that that’s correct. In all honesty, you just want to go to sleep with a cuddly, foxy woman in your arms at night. " + (!pc.isBimbo() ? "Whether it goes in any other direction, well... that’ll be up to the moment, wouldn’t it?":"Sex is great fun and all, but sometimes, having a good nap is great, too, and Penny herself is great, and you wanna put two great things together."));
		output("\n\n<i>“Okay, " + (penny.armor is UGCCasualOutfit ? "‘captain,’":"captain,") + "”</i> she giggles. <i>“I’ll be reporting for duty at my earliest convenience... and for my mate’s convenience.”</i> Her tail flicks behind her in your direction, almost accusatorily. <i>“Don’t leave me to all alone tonight, you hear me?”</i>");
		output("\n\nYou’ll be sure to make time in your busy schedule to get some sleep.");
		flags["CREWMEMBER_SLEEP_WITH"] = "PENNY";
	}
	else
	{

		output("You stiffen a little bit, unsure of how Penny is going to take what you’d like to say. But still, you feel the need to say it. You tell her that you’d like to have a little more room in your bed, at least for the immediate future.");
		output("\n\nPenny tilts her head in confusion. <i>“Something the matter, mate?”</i> she asks, her expression a cross between hurt and bewildered. <i>“Not fluffy enough to entertain the voracious Rusher’s appetites?”</i> Unexpectedly, Penny laughs. <i>“Just fucking with you, my mate. I don’t mind if we do our fucking in my room instead. Just don’t get too lost in some tramp’s thighs, or I’ll have to come in after you" + (penny.hasCock() ? "... dick-first":"") + ".”</i>");
		output("You blush slightly.");
		output("\n\n<i>“Don’t worry about it,”</i> she says, slapping you well-meaningly on your [pc.thigh]. <i>“If I know you like you know me, we’re gonna keep mating on the side, only now I can spend my nights catching up on the latest manga!”</i>");
		output("\n\nYou can’t tell if she’s being sincere, or if she’s hurt and she’s trying to mask it. If she <i>is</i> upset, though, she’s hiding it rather well.");
		output("\n\n<i>“You let me know when that big-ass bed of yours starts to get a little cold again, eh?”</i> she says. <i>“I’ll come running.”</i>");
		output("\n\nAll told, that conversation went better than you had expected.");
		flags["CREWMEMBER_SLEEP_WITH"] = undefined;
	}
	processTime(5);
	clearMenu();
	addButton(0,"Next",approachCrewPenny,true);
}

// Continue here if the PC goes to bed anytime between 20:00 and 02:00 while Penny is sharing their bed
// (scene: Bed Time)
//Fen note: fuck your time restrictions, B
public function bedTimeWithPenny():void
{
	clearOutput();
	showPenny(true);
	author("B");
	// Continue here if the PC goes to bed anytime between 02:01 and 08:00 while Penny is sharing their bed
	if(hours >= 2 && hours < 8)
	{
		output("It’s late as hell. You’ve spent too long between rests, and now you’re pulling in at this unholy hour. And the fact that you asked Penny to join you hasn’t left your thoughts; you wonder how comfy she is right now...");
		output("\n\nWhen you open the door to your bedroom, you see, in the dim light, a body, all hunkered and cozy beneath the covers of your bed. You can’t make out too many details, of course, but the telltale red mohawk and giant, fuzzy fox ears give away who’s in there right away. It seems Penny didn’t feel the need to wait. You <i>had</i> given her permission, after all.");
		output("\n\nYou enter the room and close the door behind you, putting you in total darkness, save for a set of low-frequency lights running from your bed to the door. " + (!pc.isNude() ? "You strip naked, then you":"You’re already naked, so you just") + " feel your way to the bed and you show yourself in.");
		output("\n\nPenny stirs when you slide yourself in. Her body moves and shuffles towards you, her hand outstretched and sleepily searching for something to touch. <i>“Mmmmbuh,”</i> she mumbles incoherently. <i>“[pc.name]?”</i>");
		output("\n\nYou take your hand in hers and shush her back to sleep. <i>“Mmmkay,”</i> she mutters, then goes still, her breath steadying once more as sleep regains its hold on her.");
		output("\n\nIt’s up to you to do the cuddling for you both: you move towards her, and you wrap your arms and [pc.legOrLegs] around her, gently, sharing your body heat with her. Her body is very soft, particularly her fur: you run your fingers through it, enjoying the soft swish of her fur between your digits, and you rest your thigh against hers, pushing against her like a big, cuddly pillow.");
		output("\n\n<i>“Mmmmm,”</i> she moans as she subconsciously inches toward you just a little more.");
		output("\n\nYou take after her lead, and fall asleep.");
	}
	else
	{
		output((!pc.isNude() ? "Just as you begin to strip down to get ready for bed":"Just as you get ready for bed") + ", you hear a knock on the door to your quarters. You have a good idea who it is.");
		output("\n\nYou answer the door, toggling the electric lock and allowing the heavy door to slide out of place, and there is Penny – wearing absolutely nothing. Everything is on display, all the way down to ");
		if(!penny.hasCock()) output("her pussy, exposed to the air of the ship");
		else if(penny.cocks[0].cLength() < 14) output("her limp cock" + (penny.balls > 0 ? " and plump balls":"") + ", flaccid inside her sheath" + (penny.balls > 0 ? " and dangling between her legs, respectively":""));
		else output("her oversized cock, limp-but-chubby, and massive balls, batting against her thighs with her every heartbeat");
		output(", free to see for anyone that might come by.");
		if(flags["PENNY_SLEPT_WITH"] == undefined)
		{
			output("\n\nShe has a blue pillow tucked underneath one arm, and with the other, she covers her mouth, stifling a long yawn through her fingers. <i>“Hey, mate,”</i> she says through a tired, chewy mouth. She doesn’t wait for you to invite her in and pushes you aside. <i>“Boy, I’m bushed. ‘nother day down, am I right?”</i>");
			output("\n\n" + (flags["PENNY_SLEPT_WITH"] == undefined ? "You audibly suppose that Penny must sleep in the nude.\n\n<i>“Yeah. Don’t you?”</i>":"By now you’ve gotten used to the sight of having to answer the door to a naked, foxy lady."));
			output("\n\nPenny doesn’t waste any time making herself at home. At the sight of your larger bed, rounds herself to its left-hand side and places the pillow down, fluffing it for her head. You take a moment longer, bringing yourself to the opposite side – you can’t help but steal glances at Penny’s shamelessly naked form from time to time, and you aren’t particularly stealthy about it.\n\n<i>“Come on, mate, you’ve seen me naked before,”</i> she says playfully. <i>“What’s so surprising about seeing me in the buff now? Maybe... my " + pc.mf("handsome","beautiful") + " captain’s a bit of a pervert?”</i>");
			if(pc.isBimbo()) output("\n\n<i>“Maybe ‘cause you’re like... a total hottie!”</i>");
			else if(pc.isNice()) output("\n\n<i>“Maybe I just like ogling my gorgeous fox of a girlfriend?”</i>");
			else if(pc.isMischievous()) output("\n\n<i>“Maybe I like to appreciate works of art.”</i>");
			else output("\n\n<i>“The moment I stop checking you out is the moment I’m dead.”</i>");
			output("\n\n<i>“Hah! You’ve already got me naked and in your room, [pc.name]; I think we’re a bit beyond the pick-up lines.”</i> Despite the dismissal, her gaze is cast downward, and you see a small smile play on the corners of her lips.\n\nWho doesn’t like being complimented now and again?");
			output("\n\nYou both pull the sheets back on your bed at the same time. <i>“Hope you don’t mind,”</i> Penny says as she climbs in, sliding one foot underneath the covers and shuffling her butt into place. <i>“But I’m a bit of a clingy cuddler. Hope you know what you’re getting into.”</i>");
			output("\n\nHaving a pretty lady hold you at night is exactly what you wanted when you asked her to join you. <i>“Just letting you know what you’re getting into, cap’n,”</i> she laughs.");
			output("\n\nYou shuffle yourself into your bed once you’ve deactivated the lights, worming your way across the soft fabrics until you’re right next to Penny. The total darkness of the room is offset by a some low-frequency lights leading from the bed to the door, in case of an emergency; it’s enough to let you see silhouettes without interrupting your sleep.");
			output("\n\nNot that you have to see what happens next: as soon as your [pc.skinFurScales] make" + (pc.hasFur() || pc.skinType == GLOBAL.SKIN_TYPE_SKIN ? "s":"") + " contact with Penny’s, she rotates onto her side, facing you, and immediately wraps limbs around your body, gripping you tightly and holding you to her. Your physical world is swaddled in soft downy fur, pressing against you, covering you, and keeping you even warmer than the sheets would by themselves. To top it off, you feel her drape her long, bushy tail across her thighs and yours, idly swishing its fluffiness against you.");
			output("\n\nShe’s very careful with where she touches, and with what – especially with her claws, and <i>especially</i> with her " + (!penny.hasCock() ? "pussy":"sheath") + ", careful to not steal any sleep from the night – but, you couldn’t get away from her if you tried.");
		}
		else
		{
			output("\n\nYawning, the foxy fox-girl gives you a familiar wave and scampers into bed with a smile, ass wiggling knowingly. Penny knows you’re looking and luxuriates in it, paying you back for your ogling with a perfect view of her taut hiney swishing tail. All too soon she’s rolling over to pull the covers up, giving you a brief flash of her tits. When you finally drag your eyes up, she’s smiling warmly" + (penny.hasCock() ? " and pitching a small tent in the sheets":"") + ". <i>“I can’t think of anybody I’d rather spend the night tangled up with.”</i>");
			output("\n\nYou flick off the lights and climb into bed, worming your way beneath the soft fabrics until you’re right next to Penny. She responds by squirming closer still, rotating to face you with. Her arms wrap around your body. The world becomes nothing by your girlfriend’s warmth and silken fur, a swath of pure softness and heat that grows better the moment her tail’s graces you with its oh-so-fluffy presense.");

			author("B & Fen");
		}
		output("\n\nIt actually reminds you of the day you had asked Penny to join you on your crew: the way she hugged you and refused to let go, or even ease up her grip, for a surprising amount of time. It inspires you that, maybe, Penny is hoping you’d reciprocate, so you do: you lean towards her and wrap your arms and [pc.legOrLegs] around hers, locking her against you the same way she’s doing to her.");
		output("\n\nYou tell her that you’re not going to go anywhere. You’re nice and snug, just where you are.");
		output("\n\n<i>“Good,”</i> she replies – and you can feel her sigh as she rests her chin against your shoulder. It was exactly what she had wanted to hear.");
		output("\n\nContented, you soon fall asleep.");
	}
	IncrementFlag("PENNY_SLEPT_WITH");
	showName("NIGHT\nW/ PENNY");
	if(!pc.hasStatusEffect("PENNY_WAKEUP_CUED")) 
	{
		pc.createStatusEffect("PENNY_WAKEUP_CUED");
		if(pc.energy()/pc.energyMax() < 0.5)
		{
			if(!pc.hasStatusEffect("PENNY_WAKEUP_SLEEPY")) pc.createStatusEffect("PENNY_WAKEUP_SLEEPY");
		}
	}
	sleep(false);
}

// (scene: Prelude)
// Continue here if the PC had 50 Energy or more when they went to sleep
public function pennyMorningWakeups():void
{
	clearOutput();
	showPenny(true);
	author("B");
	showName("\nMORNING!");
	if(!pc.hasStatusEffect("PENNY_WAKEUP_SLEEPY"))
	{
		output("You wake up a little bit before your alarm. You weren’t all that tired when you slept, so you aren’t too surprised that you woke up ahead of schedule.");
		output("\n\nThat said, though, as soon as you try to move any part of your body, you’re reminded that you have a guest with you. Lying beside you and snoring lightly is Penny, her body leaning against yours, but facing away from you – it seems, in your sleep, you both positioned yourselves around so that her back is against your front, your [pc.chest] into her back and your [pc.crotch] up against her butt. Her long, fluffy tail lays limp overtop you both.");
		output("\n\nYou run your fingers through Penny’s fur, appreciating how soft, yet full-bodied, she keeps it. She clearly takes her fur’s health and hygiene very seriously.");
		output("\n\nAs your hands travel, they come across her taut belly, and you can feel just how toned and packed her body is underneath the fur there – a form like hers comes as a prerequisite with a job like hers. They continue traveling northwards, to the underside of her full, heavy breasts; at first, you nudge them with the backs of your hands, hefting and testing their weight. When Penny doesn’t stir any more than usual, you daringly run your thumb over one of her nipples.");
		output("\n\nPenny snorts, and then mumbles something under her breath, but she’s still out cold.");
		output("\n\nYour [pc.legOrLegs] " + (pc.legCount == 1 ? "is":"are") + " entwined with hers, wrapping your lower bodies in a mess of limbs that you couldn’t hope to pull apart without waking her. Growing bolder, you thrust your [pc.hips] forward, " + (pc.hasCock() ? "dragging your flaccid [pc.cockNounSimple] into the valley of her tight ass, nestling it somewhere cozy and warm, not unlike your own bed":"rubbing your loins against the firmness of her ass and the fineness of her fur back there, giving you a bit of tactile pleasure") + ".");
		output("\n\nYour fingers make another lap down her leg, gently raking through her fur there and its varying degrees of fineness: from thick as could be at her thigh, to thin and sensitive at her knee, then back again. You can feel just how tight her body is" + (pc.hasCock() ? "– and would be -":"") + " with your motions, and, knowing her, she probably wouldn’t mind waking up to a very special ‘good morning.’");
		output("\n\nYou could have her right here and now. Question is... do you?");
		processTime(4);
		pc.lust(2);
		clearMenu();
		if(pc.cockThatFits(penny.vaginalCapacity(0)) >= 0 || pc.hasVagina()) addButton(0,"Fuck Her",fuckSleepyPenny,undefined,"Fuck Her","Start the day off with a little early-morning lust relief.");
		else addDisabledButton(0,"Fuck Her","Fuck Her","You need a vagina or a penis that fits inside her vagina for this.");
		addButton(1,"LetHerSleep",letPennySleep,undefined,"Let Her Sleep","Let Penny wake up without going lewd.");
	}
	// Continue here if the PC had 49 Energy or less when they went to sleep
	else
	{
		pc.removeStatusEffect("PENNY_WAKEUP_SLEEPY");
		showName("\nDREAMING...");
		output("You’re standing in a small, one-room log cabin; behind you is the door to the building, and in front of you is a glass window. There’s a double-wide bed underneath the bed, and a counter along the left-hand wall. It’s a beautiful late-summer day; sunlight is streaming in through the window, and from where you’re standing, you can see thick forest surrounding your little slice of paradise just outside.");
		output("\n\nIt’s warm, befitting the season. <i>Rather</i> warm. Warm enough that you decided to get naked a while ago. In fact, you don’t remember what your clothes look like, or where you put them. There aren’t any dressers in the cabin.");
		output("\n\nA pair of furry palms wrap around you from behind, and a furry leg " + (pc.legCount > 1 ? "slides in between yours":"wraps around your [pc.leg]") + ". What feels like a warm breeze caresses your neck; the leg against you shuffles a little bit, and a sudden weight lurches onto your back. A heavy pair of breasts, with erect nipples, press insistently into your [pc.skinFurScales].");
		output("\n\n<i>“[pc.name],”</i> you hear Penny whisper into your ear. Penny is with you, you knew that – did you know that? Well, she’s here, with you, in this warm, cozy, one-room cabin in the middle of nowhere. You turn your head to see her, but you don’t really <i>see</i> her so much as <i>picture</i> her, in stunning detail: everything from the way her mohawk hairdo leaning to one side, to the tone of her fur along her front and how it contrasts to her arms and legs, to her ");
		if(!penny.hasCock()) output("puffy vixen’s pussy, melding against you and stretching every time Penny humps against your nude form a bit");
		else
		{
			output("plump " + (!penny.hasCock(GLOBAL.TYPE_EQUINE) ? "fox":"horse") + " sheath, her cock’s head peeking from the cozy comfort of its wet, moist, fleshy home to insistently jab you in the [pc.vagOrAss].");
		}
		output("\n\nYou think she asks you a question. For some reason, it goes in one ear and right out the other. You think you mumble a response, but it could just as well have been you flapping your mouth and exhaling at the same time, ultimately saying nothing.");
		output("\n\nPenny’s hips press into you, a little more forcefully than the last few times. One of her hands dips between your legs, and, with absolutely zero foreplay, ");
		if(pc.hasCock()) output("her fingers wrap themselves around your own [pc.base], gently, warmly, stroking you. You get hard in record time");
		else
		{
			output("her fingers splay around your [pc.vagina], one finger to each lip of your vulva, and begins stroking you, with an unusual earnest, even for her");
		}
		output(". Of course, it might just be a distraction, because");
		if(!penny.hasCock()) output(" her humping grows far more forceful, more <i>needy</i>, and her hot cunt begins to soak as it grinds against the fat of your [pc.thigh]");
		else output(", with another, heavier, thrust, her [penny.cockHead] thrusts against your [pc.vagOrAss] hard enough that you can feel yourself begin to yield");
		output(". The floorboards creak noisily, and Penny stamps her foot impatiently, with every thrust of her body against yours.");
		output("\n\nSomething... isn’t quite right. It’s tough to say what, though. Your mind feels kind of fuzzy, like, what you’re feeling doesn’t <i>quite</i> match up with... something else, and your head is trying to fill in the blanks. When did you get a cottage in the middle of the woods? Is that important?");
		output("\n\nMaybe you should–");

		//[=Wake Up=][=Dream On=]
		// end scene (scene: Prelude); increase Lust by 20
		pc.lust(20);
		clearMenu();
		addButton(0,"Wake Up",wakeUpSleepyPen,undefined,"Wake Up","Can’t waste time dreaming!");
		addButton(1,"Dream On",dreamOnYouSexyPennyFucker,undefined,"Dream On","See where this sexy dream goes...");
	}
}

//[=LetHerSleep=]
// (scene: Let Her Sleep)
public function letPennySleep():void
{
	clearOutput();
	showPenny(true);
	author("B");
	output("She’s tired, and frankly, she looks like she’s at such peace, sleeping there. You wouldn’t want to interrupt a girl’s beauty rest.");
	output("\n\nYou drape your limbs around her, assuming the role of big spoon, and keep her close to your body. You hear her sigh in contentment. You’re not particularly tired, but maybe you can catch another wink or two while you wait for her to wake up.");
	output("\n\n...");
	output("\n\nAbout an hour passes. You never really fall back asleep; you just lay there, holding Penny in your arms, occasionally stroking at her fur or at the hair on her head. You don’t think about any one thing in particular the whole time, but most of your thoughts <i>do</i> lead back to Penny in some form or another.");
	output("\n\nEventually, Penny moans and lifts her head. She’s facing away from you, but, when she tries to move her arms and finds herself locked steadily against you, she turns her head, her body following, trying to roll onto her back. You let her, and you’re nose-to-nose with your hot-bunking bunkmate.");
	output("\n\nShe smiles at you, and you smile back. Neither of you say anything for a few moments; you just stare into each other’s eyes in the dim light of your quarters. Then, she leans forward, rubbing her nose against yours a few times, and then closes the distance with a gentle kiss, hers on your [pc.lipsChaste].");
	output("\n\n<i>“Good morning,”</i> she says.");

	// Continue here if it’s 11:59 or earlier
	if(hours < 12)
	{
		output("\n\nYou wish her a good morning, herself.");
		output("\n\nShe lifts her left arm around you, returning the hug you’ve been giving her the past hour. She nuzzles her cheek against yours and gives you another kiss on the cheek. <i>“Sleep well, cap’n?”</i> she asks.");
		output("\n\nYou respond that you’ve never slept better.");
		output("\n\n<i>“Same. I wouldn’t mind spending another few minutes here with you.”</i>");
		output("\n\nIt would be an abuse of your privileges as captain if you deliberately slept in longer than your duty allows.");
		output("\n\n<i>“So, yeah, we’re sleeping in, right?”</i> she giggles.");
		output("\n\nYou don’t answer; instead, you lay there, holding Penny against you. You both touch and pinch at each other in various spots; from your upper backs, to your thighs, and, of course, a few mischievous times, you each sneak in a grope on the other’s ass. She coos every time you touch her in a new spot, and she does her best to make you moan when she does the same thing in return.");
		output("\n\nAs much as you’d like to keep it up, though, unfortunately, you both <i>do</i> have a job to do. <i>“That’s easy,”</i> she says, her grip on you only getting tighter, <i>“your job is to stay in bed and cuddle me for another hour or two.”</i>");
		output("\n\nThen, she laughs. <i>“I’m kidding. As much as I like staying in bed with you, my mate, I’ve kind of gotten used to being an early bird, after my time in the academy and my work on Mhen’ga.”</i>");
		output("\n\nWith a swish of her arm, the cover of the bed is whisked off you both, exposing you both to the sudden chill of the air. With energy you hadn’t expected coming from a woman prodding you to stay in bed longer, Penny practically leaps to her feet, bounding on her toes and stretching her arms, first both together, then one after the other.");
		output("\n\n<i>“Up and at ‘em, captain!”</i> she says, pivoting on the spot and putting a foot on the bed, stretching her long, slender, toned leg. As she does, you’re given an unabashed, unrestricted view at her ");
		if(!penny.hasCock()) output("pussy, on display, just for you");
		else output("sheathed cock" + (penny.balls > 0 ? " and fluffy balls":"") + ", dangling and flaunting on display, just for you");
		output(".");
		output("\n\n<i>“Enjoying the show?”</i> she asks, thrusting her pelvis in your direction.");
		output("\n\nYou are, in fact. You pat the now-vacant spot on the bed, inviting her back, and offer to make this morning a <i>really</i> good one.");
		output("\n\n<i>“Tempting,”</i> she laughs, and repeats the stretching with her other leg on the bed, <i>“but, if we’re going to spend the hours fucking on your ship, we might as well do it on the clock.”</i>");
		output("\n\nWith her morning routine completed, Penny grabs her pillow and makes for the room of your quarters. Her long, fluffy tail swishes in circles behind her, lifting up as high as her shoulder, giving you a few, tantalizing teases of her pert ass as she walks out. <i>“I’ll be ready when you are, captain,”</i> she says sensually, before disengaging the electric lock and heading into the hallway, as naked as when she entered your quarters.");
		output("\n\nIncentivized, you leave the bed yourself. ");
		if(!pc.isNude()) output("You aren’t intimidated by her brazen nudity, and you leave your quarters, just as naked as she was – besides, you get the feeling that clothing would just get in your way, in a few moments.");
		else output("You strap your [pc.gear] back on, readying yourself for the day – although, you get the feeling that they’re just going to get in the way in a few moments. Still, it’s the thought that matters.");
		output("\n\nYou’re back in your ship, facing a new day.");
		processTime(10);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	// Continue here if it’s 12:00 or later
	else
	{
		output("\n\nYou inform Penny that it actually isn’t morning. You two have slept past noon.");
		output("\n\nPenny’s eyes go wide, and her smile disappears. <i>“What?!”</i> she hollers, bolting upright on the bed and searching for a clock in the room. There’s a digital one blinking by the door; sure enough, it’s past noon.");
		output("\n\n<i>“Gods, it is!”</i> she says, then practically vaults off the bed, flinging the cover off both of you. She stretches both her arms above her head, and then one after the other, but the motion is so quick and flustered that you doubt her limbs are getting the stretching they need. <i>“How could I let this happen? I gotta–”</i>");
		output("\n\nYou stop her by grabbing onto her fluffy tail and giving it a squeeze (you’re careful not to give it a yank). You ask her what the big rush is.");
		output("\n\n<i>“The rush is that–”</i> she starts, whipping around on the spot and glowering down at you from her position. But, once she sees you, she relaxes. She eyes the bed, from the headboard to its end, then she looks around the dimly lit room, remembering where she is and what she’s doing.");
		output("\n\nAfter a moment, Penny sits on the bed with a laugh. <i>“Sorry,”</i> she says sheepishly. <i>“I’m, uh, still adjusting to life outside of my responsibility on Mhen’ga. My training and my work made me into a bit of a morning person.”</i>");
		output("\n\nYou stroke at her tail, preening it with your fingers and matting down the fur after it’s all stood on end from her panic. You tell her that it’s okay – you expect your crew to have responsibilities, but you can’t very well expect them to have Penny’s work ethic if you, the captain, can’t haul your ass out of bed before noon.");
		output("\n\n<i>“I suppose not,”</i> she says, swishing her tail in your grip. She leans in towards you and kisses you on the forehead. <i>“It’s probably going to take a while to beat my ‘morning person’ ethic out of me, if this is going to be our regular schedule.”</i>");
		output("\n\nYou pat the bed, in the now-vacant spot, and invite her back in. Now that she’s up and she’s got her blood pumping properly, you two could make this afternoon all the better before you both report to your stations.");
		output("\n\n<i>“Oooh,”</i> she coos, running her hand from your head, to your shoulder, to the swell of your [pc.ass] and down your [pc.thigh], admiring what she’s seeing. <i>“It’s not a bad offer, cap’n.”</i> She bites into her lower lip, fantasizing about crawling back into bed with you. But, before she gets too carried away, she stops, and pulls her hand away. <i>“But, I’d feel like an asshole if I didn’t at least check in this late in the day. If we’re gonna fuck, we might as well do it on the clock, at this point.”</i>");
		output("\n\nWith that said, she stands and redoes her stretches from the beginning: first both her arms, then one after the other, and then both her legs. <i>“You’ll know where to find me when you’re ready to get today ‘started,’”</i> she tells you. Then, she picks up her pillow and leaves your quarters, as naked as when she entered.");
		output("\n\nShe’s right, you tell yourself: that’s enough sleeping in for now. You’ve abused your privileges as captain enough.");
		output("\n\nYou kick the sheets off your body, then, after your own stretches, ");
		if(pc.isNude()) output("you make your way for the ship’s corridors, ready to start your day");
		else output("you reattach your [pc.gear] (as unnecessary it might be in just a moment, if you decide to chase after Penny), and then make for the corridors of the ship, ready to start your day");
		output(".");
		processTime(10);
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[=Wake Up=]
// (scene: Cockblock)
public function wakeUpSleepyPen():void
{
	clearOutput();
	showPenny(true);
	author("B");
	showName("\nWAKE UP...");
	output("Your mind wakes up before your eyes. Through your eyelids, you see a dim darkness, and you’re still too out of it to put your thoughts in any coherent order. But, what you <i>feel,</i> far clearer than you think you ought to, is Penny humping against you.");
	output("\n\nYou turn your head and try to wink your eyes open. Your vision is a little blurry from the sleep, but you make out her features well enough, even in the dim light. Her lower lip is curled inwards, and her jaw moves slightly as she nibbles on it. Her eyes are narrowed, and her hands are still – she’s looking like a kid that got caught with their hand in the cookie jar. You don’t chastise her, of course. It takes you a moment to realize what you would even chastise her for.");
	output("\n\nInstead, you break the tension she’s clearly having by wishing her a good morning.");
	output("\n\n<i>“Good morning to you too, cap’n,”</i> she says, exhaling. Her limbs tighten around you, holding you closer to her, and she plants two kisses on your neck. <i>“Gods, I slept like a rock. How about you?”</i>");
	output("\n\nYou had slept about as well, and you ask when she woke up.");
	output("\n\n<i>“Not too long ago, only a few minutes before you.”</i> Her expression cracks a bit. <i>“I didn’t wake you, did I?”</i>");
	output("\n\nYou lie and tell her that she didn’t.");
	output("\n\n<i>“Great. I was worried all my shuffling and restlessness might have, you know, woken you up.”</i> Her readjusts against yours, trying to get comfortable in the cramped bed. ");
	if(!penny.hasCock()) output("Her crotch grinds against you once more as she does, and the unmistakable damp gash spreads once more.");
	else output("Her dick bumps up into the crease of your [pc.ass], frotting itself and making itself nice and snug in there.");
	output(" She keeps her face still like a stone, but it doesn’t take a genius to know what she was doing, whether you were asleep or not.");
	output("\n\nPenny takes a deep breath through her nose. <i>“Anyway!”</i> she starts with a high, cheery tone. <i>“I think we’ve taken enough advantage of your captain’s privileges, [pc.name]. Time to rise and shine!”</i>");
	output("\n\nWith that, she lets go of you and throws the sheets off you both, suddenly exposing you to the comparatively chill air of the quarters. Exerting a surprising amount of energy and pep, she hefts herself off the bed and onto her feet, and begins her morning routine of waking herself up:");
	output("\n\nFirst, she lifts both arms up and above her head, stretching them there; then, she stretches one across her chest before the other. <i>“Before the academy, I was always a bit of a late riser,”</i> she says to you, making conversation as she moves. <i>“But my time as a cadet and my job on Mhen’ga worked that out of me real good. Now I feel like a lazy asshole if I sleep in past ten in the morning.”</i>");
	output("\n\nPenny pivots on the spot, facing toward you, and lifts her left leg onto the bed to stretch it. As she squats and stretches it, you’re given an uncensored, unabashed look at her ");
	if(!penny.hasCock()) output("puffy, neglected pussy; the fur around it is thin enough for you to see its skin, and, from the looks of how red and needy it is, she was <i>really</i> hoping you’d pretend to stay asleep.");
	else output("[penny.cock], throbbing and erect, just a foot and a half away from you. Her pre-cum dribbles just a little bit from her tip" + (penny.balls > 0 ? ", and her balls bounce with every squat":"") + " – from the looks of it, she was <i>really</i> hoping you’d pretend to stay asleep.");
	output("\n\nYou tell her that you aren’t really an ‘anything’ person. Your primary job as a Planet Rusher doesn’t afford you the convenience of a regular sleep schedule: you sleep when you need to, and when you can. Hell, you could probably fall asleep again for another eight hours, right here and now, if you wanted.");
	output("\n\nShe frowns. <i>“Not the healthiest of lifestyles, is it?”</i> she asks rhetorically.");
	output("\n\nWhen Penny finishes her stretches, she picks up her pillow and heads for your door. <i>“Hey, though,”</i> she starts, wiggling her waist towards you, swishing her large, fluffy tail in a lazy circle. <i>“If you ever need any incentive to get out of bed in the morning, well... one of them is just down the hall and in her quarters.”</i>");
	output("\n\nWith that, she leaves your room, as naked as when she first entered.");
	output("\n\nNow that you’re alone, you pull yourself out of bed (with some lazy effort, naturally).");
	if(pc.isNude()) output(" Owning to your nudist tendencies, you follow Penny into the halls of the ship, completely nude,");
	else output(" You re-equip your [pc.gear], getting yourself as presentable as ever, before heading into the halls of the ship,");
	output(" ready to face a new day.");

	//[=Next=]
	// end scene (scene: Let Her Sleep); return the PC to the ship’s main menu; increase Lust by 20; advance clock by eight hours
	pc.lust(20);
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[=Fuck Her=]
// (scene: Somnophiliacs Rejoice)
//Reqs dick that fits or pussy.
public function fuckSleepyPenny():void
{
	clearOutput();
	showPenny(true);
	showName("SLEEPY\nFUCKS");
	author("B");
	// Continue here if the PC has a dick
	var x:int = pc.cockThatFits(penny.vaginalCapacity(0));
	if(x >= 0)
	{
		output("You can’t help yourself. Penny is <i>right there,</i> in all her nakedness, with her ass pressed right up against your [pc.cock " + x + "]. Surely, she wouldn’t mind – she trusts you enough to get naked and into the same bed as you, and she loves you enough to leave her job to be with you. And, besides, you doubt she would have as much restraint if your positions were reversed. And if they <i>were,</i> you certainly wouldn’t mind.");
		output("\n\nYou grip your [pc.cock " + x + "] by the [pc.base " + x + "], lifting your shaft upward and prodding your [pc.cockHead " + x + "] against the yielding flesh of her spongy pussy. You trace your tool along her vulva, feeling its heat and collecting the occasional bead of dew onto your sensitive head.");
		output("\n\nPenny hums and shifts in her sleep, her body wiggling a little bit to get into a more comfortable position – which, notably, involves bringing her knees upward slightly, and thrusting her ass towards you. It almost seems like too deliberate an action for her to be asleep, but at the same time, maybe her body just knows what it wants.");
		output("\n\nYou have to be gentle. You don’t want to wake her; you just want her to have some pleasant dreams and to wake up to a ‘good morning.’ You resist your urge to thrust home and fuck her silly, and instead, you slide yourself forward, half an inch at a time, gradually introducing yourself into her. Her body melds around the head of your shaft smoothly, and you pause, letting her sleepy body acclimate to your tip.");
		output("\n\nYou inch forward, sinking deeper into her. <i>“Ooooh,”</i> she hums, and she buries her head into her pillow, rocking it back and forth, her body pushing back against yours. Her tail swishes elegantly between you, twitching from the pleasure. Far be it from you to deny a woman’s body what it wants, so you sink yourself in a little deeper.");
		pc.cockChange();
		output("\n\nPausing, you reach around with your right arm, rubbing at her ribs just beneath her breasts, and making lazy circles down her furry, taut stomach, towards her crotch. Once you reach the valley between her legs, you buck into her, gently as could be, and you lightly ");
		if(!penny.hasCock()) output("flick at her clit at the same time, massaging it downward, towards your intruding member");
		else output("grasp at her cock, still mostly tucked into her sheath, and pump it along your palm. Her [penny.cockHead] is already poking out, and you run your thumb along its head, feeling it get harder and longer as you do");
		output(".");
		output("\n\nShe winces in pleasure through her nose, but remains otherwise still, and she doesn’t say anything in her sleep. So, you keep it up - you keep yourself wrapped around her, keeping to your big spoon position, embracing her wholly, and every thrust into and out of her is only an inch or so at a time. It’s hardly enough to pleasure your [pc.cock " + x + "] the way it knows it wants to be pleasured, but this isn’t about you; you’d rail the shit out of her if this was about busting a nut, but you’re trying to give Penny a damn good dream.");
		output("\n\n<i>“Ah,”</i> Penny yips through chewy, gummed-up cottonmouth. <i>“Mmmm, fuck,”</i> she continues – from the sounds of it, you’re succeeding.");
		output("\n\nYou can feel her get wetter as time goes on. Initially, she was fairly dry, but the more you fuck her, the slicker it gets, if you needed any further confirmation that she’s enjoying it. You time the pumps of your [pc.hips] with ");
		if(!penny.hasCock()) output("your fingers making a shallow circle with her clit; with every rotation");
		else output("another jerk of your hand against her rapidly-stiffening cock; with every pull");
		output(", her body shudders and clenches on you, and she exhales through her nose.");
		output("\n\n<i>“[pc.name],”</i> she utters under her breath. It’s a boost to the ego, knowing that she’s dreaming about you, and you almost want to start fucking her harder. But, her moans and her delirious sleep-talking are too cute for you to risk like that, so, you maintain the course.");
		output("\n\nIt’s nice, being there in the comfort of your bed, in the privacy of your room, in the security of your ship, gently making love to your lover and influencing her dreams. Penny is one of your more aggressive lovers, typically; maybe you could convince her to take it more slowly from time to time, so she can enjoy this while she’s awake.");
		output("\n\n<i>“Fuck yeah,”</i> Penny mumbles, and her body shakily bucks backward into you, shucking more of your cock into her. You’ll take that as her agreeing with you.");
		output("\n\nThe build-up is very slow, almost torturously so, given how slowly and shallowly you’re taking her. At one point, you start to wonder if you’ll even finish without going in a little deeper and risking waking her. Unfortunately for you, you don’t get to decide, and, as you make another buck into her welcoming pussy, your pelvis pushing into the downy fur of her ass, your body betrays you, and you unintentionally push in deeper than you meant.");
		output("\n\n<i>“Oooh yeahhhhh,”</i> Penny sighs, and her body relaxes and reclines against you in response. <i>“Come on, buhhhhh,”</i> she slurs, then goes silent for another few thrusts. <i>“Gimme... cum. Gonna... gimme....”</i>");
		output("\n\nFrom the sounds of things, she’s close – then, on one more thrust, accompanied with another ");
		if(!penny.hasCock()) output("deliberate grind of your fingers against her button");
		else output("gentle yank along her mostly-hard-and-stiff cock");
		output(", she cums, her body tensing and shaking against yours and milking what bit of cock is stuffed inside of her" + (penny.hasCock() ? ", and her cock shudders and quakes in your grip, bloating with her seed and shooting it onto the sheets in front of her":"") + ". <i>“Ssssssshhhhhhhh,”</i> she winces, followed by a weird, high-pitched moan she’s never made before.");
		output("\n\nShe asked you to ‘give her cum,’ and the feel of her sleeping body being wracked with pleasure against you is enough to close the gap you didn’t think you could close. Nestling yourself as deep as you’re comfortable with, you tense yourself, and you feel your [pc.cumNoun] pump into her body.");
		output("\n\nIt takes a surprising amount of willpower to not just hilt yourself and seed her like you want her pregnant. You stay where you are, only half-buried into her gushing gash, responding to her orgasm with your own and giving her the cum she asked for. Without you being deep inside her, it inevitably ");
		if(pc.cumQ() < 500) output("dribbles back out against you, seeping into the fur of her leg and out onto the sheet of the bed");
		else output("sprays back against you; you don’t have the stability to contain your wildly-orgasming cock, and you leave more than a few shots against her bare ass");
		output(".");
		penny.loadInCunt(pc,0);
	}
	// Continue here if the PC does not have a dick
	else
	{
		output("Penny would want you to enjoy yourself. She agreed to join you in bed, understanding that it might take a turn for the sexy. And, as an added bonus, maybe her dreams would get a little saucy, too.");
		output("\n\nIt’s awkward, though - it’s not like you have a dick to properly fuck her with, and if you’re going to be making love to her while she’s asleep, you want it to be good for her, too. So, you finagle yourself into a peculiar, and somewhat graceless, position. Your [pc.legOrLegs] " + (pc.legCount == 1 ? "is":"are") + " already entwined with hers, so you slide your [pc.hips] forward and lift at the knee, until the fat of your thigh is pressed gently against Penny’s quim" + (penny.balls > 0 ? ", lifting her fuzzy nuts out of the way carefully":"") + ". Simultaneously, you gently guide her tail downward, and you slip it and its fluff between your own, right up against your crotch.");
		output("\n\nPenny hums and shifts in her sleep a bit; she buries her face into her pillow, and moves her right hand to lie against her leg. Her lower body sidles a bit to get into a more comfortable position, which, notably, tucks your [pc.leg] more snuggly against her cooch. You haven’t even started yet, and she’s already trying to make the most out of it for herself.");
		output("\n\nYou have to be gentle - you don’t want to wake her, but you still have to be thorough enough that it gives her a damn good dream, and that she wakes up to a hell of a ‘good morning.’ You experimentally shuffle forward, dragging your leg through the valley of her clenched thighs and against her dampening pussy, while, at the same time, dragging her fluffy, cushiony tail against your own.");
		output("\n\n<i>“Mmm,”</i> Penny moans out, and her body reacts on its own, bucking backwards against you, trying to take more of some phantom cock into itself. Your sentiments exactly. It’s not the most hardcore tribbing you’ve ever done, but hell, it feels great, so you’re not about to stop. And if it feels great for you, it must feel great for her. You’re determined to make it better.");
		output("\n\nYou reach over her with your right hand, gently palming at her ribs just beneath her breasts. You rub her stomach in slow, sensual circles, making your way down, towards her crotch. When you get there, you ");
		if(!penny.hasCock()) output("align your fingers against her clit, pressing into her button. Whenever you grind yourself forward, you pull at her, lifting it up and towards her stomach, and when you recede, you push down on it, guiding it with you and your movements");
		else output("gently tickle and press at her flaccid-but-bulging sheathe; you experimentally circle your fingers around the fat pocket, squishing it into your palm and tugging it forward when you grind into her. Your every motion gets her cock just a little stiffer, a little thicker, and her head eventually begins to poke out, waking up long before Penny does");
		output(".");
		output("\n\nThat’s what your sex is. Every time you move your [pc.hips], you ride your [pc.vagina] along the thick downy fur of Penny’s bushy tail, feeling her every individual hair tickle at your sensitive folds. And every time you move, your hand glides along with you, " + (!penny.hasCock() ? "stimulating her throbbing little clit":"jerking her cock and getting it longer, fatter, and hornier") + ".");
		output("\n\n<i>“Mmmm, ffffffffuck yeeeaaahhh,”</i> Penny slurs, taking a deep breath through her nose. Her head moves along her pillow, back and forth, suddenly having a hard time getting comfortable. <i>“Fuck that... mouth of yours, [pc.name]....”</i>");
		output("\n\nFrom the sounds of it, she’s dreaming about you going down on her. You almost wish you could – it’d certainly be less awkward than the mess of legs and limbs you’ve got going on right now, but, all the same, your efforts are working fairly well for you both. It’s not the hardest, fastest orgasm you’re ever going to get, but it’s coming along nicely, and the tradeoff of giving Penny a sex dream about you is all the more empowering.");
		output("\n\nYou lean forward, and you start to kiss at her neck and her cheek, leaving little love-marks against her fur while you have your way with her. Her body responds, relaxing her head and giving you easier access to her neck for you to kiss.");
		output("\n\nThe build-up is slow, but it’s thorough and fulfilling; you don’t need to fuck her like you’re both some horny beasts, and having her body against yours, her tail stimulating you the way it is, is actually a nice break from the rampant, demanding sex that Penny is often capable of. It’s nice to just lay in the comfort of your bed and have some slow, sensual sex with your lover. You’ll make a note to pitch the idea of taking it slowly to her when she wakes up.");
		output("\n\n<i>“Gonna,”</i> she whimpers suddenly, and her hips buck on their own against you, pressing into your [pc.leg] more urgently. <i>“The thinggggg... it’s gonna come, an’....”</i> Penny raspberries her lips in her sleepy, pre-orgasmic stupor. <i>“Fuckin’... big one....”</i>");
		output("\n\nFrom the sounds of things, she’s getting awfully close – then, after another few grinds and pushes, with your [pc.vagina] riding along the furry length of her now-damp tail, and her own moist cunt gliding against your thigh, she cums, her body shaking and becoming tense, her pussy gushing its payload along the meat of your [pc.leg], ");
		if(!penny.hasCock()) 
		{
			if(penny.isSquirter()) output("and every time you rock her clit from one side to the other, she gushes a second time, soaking your [pc.skinFurScales] and dribbling it down into the sheets of your bed");
			else output("though the slimy secretions dwindle after. Every time you rock her clit from one side to the other, she trickles a little bit more into your [pc.skinFurScales]");
		}
		else output("and every time you jerk her erect, stiff cock in time with your pseudo-fucking her pussy, she shoots a shot of her foxy cum into your palm; what you aren’t dexterous enough to catch, sprays onto the cloth of your bed" + (penny.cocks[0].cLength() > 10 ? ". There’s a lot that spills into the sheets, impregnating them with its gooey, salty mass":""));
		output(". <i>“Fffffffff,”</i> she winces through clenched teeth, her breathing coming raggedly through her nose all the while.");
		output("\n\nYou weren’t too far behind her, and you orgasm right alongside her. Feeling her body tense and quake in pleasure brings you over your own edge, and you reflexively clamp your [pc.thighs] down onto Penny’s tail, your [pc.vagina] gushing your [pc.girlCum] along its fluffy, furry length. In some part of your head, you hope you aren’t clenching down on her too hard, but the rest of your head is too preoccupied with the fact that you’re cumming. You feel your juices leak and dribble down your leg, as far down as your knees, before finally dripping onto the sheets as well.");
	}
	//[=Next=]
	// end scene (scene: Somnophiliacs Rejoice); reduce Lust to 0; go to (scene: Fucked Penny)
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",fuckedPennyMorningEpilogue);
}

//[=Dream On=]
// (scene: Sleeping Beauty)
public function dreamOnYouSexyPennyFucker():void
{
	clearOutput();
	showPenny(true);
	author("B");
	showName("\nDREAM ON...");
	output("Whatever, you sure it isn’t important.");
	output("\n\nPenny pushes into you, a little more forcefully, and you stumble forward. You put your hands on the bed for stability, and you let Penny have her way with you. Her breathing grows more excited – not quite haggard or exhausted, not yet, but she’s on her way. ");
	if(!penny.hasCock()) output("Every time she grinds herself forward, she draws her pussy what feels like all the way up to your hip, before sliding it back down, and you can feel every nerve she bathes in her pussy’s heat on the way.");
	else 
	{
		output("She isn’t quite erect, but she’s hard and stiff enough to start properly penetrating you. She’s ginger and hesitant, like you’re made of glass and you’ll shatter if she pushes into you just a little too hard, but your body unmistakably bends and succumbs to her advances, and her [penny.cock] embeds itself into your [pc.vagOrAss].");
		if(pc.hasVagina()) pc.cuntChange(0,penny.cockVolume(0));
		else pc.buttChange(penny.cockVolume(0));
	}
	output("\n\nIt feels different, somehow; this is hardly the first time you’ve fucked");
	if(!penny.hasCock()) output(" – although, she’s taking a rather... unique approach to it this time");
	output(" – but every sensation feels <i>off,</i> in some perturbing way. It’s too warm for the season; you can picture Penny like she’s right in front of you, but you can’t <i>see</i> her; the feel of her body against yours is far more electric than usual (not that you’re complaining). You can’t help but thrust yourself back against her, giving her more of your body for her to use as she likes. Your movements feel sluggish, heavy, and labored, like something other than Penny is weighing you down, but you want her to hump you, damn it, and your body will obey.");
	output("\n\nThe motion seems to catch her off-guard, and she hesitates, but she continues after a moment, at the same relaxed-but-persistent pace as before. You can feel " + (!penny.hasCock() ? "every cell of your [pc.leg] that her pussy touches get hot and wet, and you can feel it build and build with her every hump; it turns your leg itself into an impromptu erogenous zone, and, knowing that she’s getting so much pleasure from the act of humping your leg like some kind of mutt serves to turn you on just as much":"every inch, vein, and contour of her [penny.cock] slide itself into your [pc.vagOrAss]; she goes for only an inch, give or take, then stops and pumps only that deep for a thrust or two, then proceeds and pushes herself in deeper. To you, every inch feels like a tree log, and your body is limitless in its capacity; you are capable of taking her <i>every</i> inch, and you want them <i>all</i>") + ".");
	output("\n\nAnd, of course, her hand doesn’t stop working you over itself - ");
	if(pc.hasCock()) output("every time she humps her hips against yours, her hand travels the entire length of your [pc.cock], stroking it to its full mast. Your dick feels immeasurably larger somehow – either that, or her fingers have a way of making you feel like every stroke, from your [pc.base] to your [pc.cockHead], takes a pleasurable eternity. Either way, you’re hard as metal, and you’d fuck her hand if moving your body wasn’t so weirdly difficult");
	else output("she shuffles her fingers, introducing her third finger to the party, and resumes her earlier heavy, wet petting, stroking your vulva with her first and third, and teasing your [pc.clit] with her middle. You beg her to fingerfuck you, but then you remember that your [pc.vagina] is stuffed with her cock, and you’re pretty sure your words came out like a drunken, swollen slur anyway. Either way, you’re wet as a lake, and you’d hump her hand if moving your body wasn’t so weirdly difficult");
	output(".");
	output("\n\nAnd that’s what your life is, for the next for minutes – or for the next thousand years, given how specifically you can feel everything. Time feels like it hasn’t really moved since you two started. But, hey, you’d be okay with standing there, with Penny " + (!penny.hasCock() ? "humping your leg":"unendingly introducing herself into your body, with inches turning to miles,") + " and her hand constantly " + (pc.hasCock() ? "jerking your cock":"fingering your cunt") + " the whole time through. Frankly, it feels like you could do this forever.");
	if(!penny.hasCock()) output("\n\nPenny moans herself, her motions getting harsher and more ragged over time. What feels like a rash starts to form from the constant scrubbing of her pussy against your [pc.leg], but you don’t care. Penny moans your name, and then says a few words – or just one really long one, you couldn’t really tell. Even in your fuzzy, unclear state, it’s easy to tell that she’s getting pretty close, and you tell her that you want it. You love her, and you want her to cum from humping your leg. At least, you’re <i>pretty</i> sure you said that. You might have slurred a word or two, but the message should be clear.");
	else output("\n\nEventually, though, " + (penny.hasKnot(0) ? "you feel a larger, fatter obstruction press into your [pc.vagOrAss]. It’s her knot. Though your body is starting to feel a little full from the heft of her cock, you maintain that, given how fuzzy you feel, you could take more of herself into you, and you tell her as much. You glance over your shoulder (or, at least, you try to do that) and you beg her to knot you (or, at least, you think you said that). Penny pauses, and then starts again, at a more demanding pace than before, her meaty knot battering into you, just as you wanted. She’ll pop into you soon, and you can hardly wait":"you feel her hips clap against your own; she’s bottomed out inside you, and you’ve taken everything she has into your body. Though your body is starting to feel the strain from containing such a monumental amount of horsecock-on-a-vixen, you nonetheless maintain that you could take a cock two or three times larger. You’re not sure where this is coming from – maybe it’s because she went so slowly, or maybe the fuzziness pervading your body has something to do with it – but, that’s how you feel, and you tell her as much") + ".");
	output("\n\nYour encouragement has a positive effect (or, you like to think), and, with just a few more haggard thrusts of her body against yours, ");
	if(!penny.hasCock()) output("her thighs clamp down on your own, and you feel what must be an absolute <i>ocean</i> of fennec fox girlcum just <i>wash</i> down your [pc.leg]. Penny huffs and snorts in your ear from the exertion, her whole body quaking in pleasure as she absolutely inundates your lower body with her juice. You must be sexier than you thought!");
	else output("she thrusts a few more times, then" + (penny.hasKnot(0) ? ", with one last, elongated push, ties herself to you, just like you wanted":" hilts herself at last, letting your body surround hers completely") + ". She tenses, sighs, and shakes, as her [penny.cock] unloads what feels like whole <i>pools</i> of fennec fox cum into your [pc.vagOrAss]. She pumps and pumps, filling what little parts of your body that she couldn’t with her cock, with her seed. Throughout it all, you can only think to yourself that, surely, you must have room to spare in there, still.");
	output("\n\nAt the feel of her succumbing to her body’s needs, you can’t help but submit to your own. Her hand goes still in her orgasm, but you do not. ");
	if(pc.hasCock()) output("Your own [pc.cock] bloats with your [pc.cum], spraying from you in either dozens of waves, or one single long one, it’s difficult to say in your haze. She doesn’t so much jerk you off as you do fuck her hand, with some difficulty, given how heavy your body feels, but even the smallest bit of pleasure rocks you like a bombshell every time");
	else 
	{
		output("Your [pc.vagina] spasms, clenching and " + (pc.isSquirter() ? "spraying":"dribbling") + " your [pc.girlCum] " + (!penny.hasCock() ? "onto the creaky floorboards beneath you":"all over Penny’s invading cock, bathing it in yourself") + ". You experience orgasm after orgasm after orgasm – or maybe just one single, long orgasm that lasts a lifetime, it’s difficult to say in your haze. Your [pc.hips] jerk back and forth impotently, eking out whatever pleasure they can from any angle; every time you move just a little, Penny’s inert middle finger brushes against [pc.oneClit], and another bomb goes off in your pussy");
	}
	output(".");
	processTime(30);
	pc.orgasm();
	if(penny.hasCock()) 
	{
		if(pc.hasVagina()) pc.loadInCunt(penny,0);
		else pc.loadInAss(penny);
	}
	clearMenu();
	addButton(0,"Next",morningFuckedByPennyAfter);
	//[=Next=]
	// end scene (scene: Sleeping Beauty); reduce Lust to 0; go to (scene: Fucked By Penny)
}

// (scene: Fucked Penny)
public function fuckedPennyMorningEpilogue():void
{
	clearOutput();
	showPenny(true);
	author("B");
	showName("\nMORNING!");

	IncrementFlag("PENNY_MORN_U_FUK_HER");
	if(flags["PENNY_MORN_U_FUK_HER"] == 1)
	{
		output("Penny stirs, and lifts her head from the pillow. Frankly, you’d be surprised if <i>anyone</i> could truly stay asleep through something like that.");
		output("\n\n<i>“Mmmm, fuck,”</i> Penny says, moving her jaw and chewing at nothing. You don’t move – not because you’re worried you might give yourself away, since she’s going to figure it out in a few moments if she hadn’t already, but because, well, you’re comfortable where you are. You just busted a good " + pc.mf("","girl-") + "nut, and you’re still enjoying your own afterglow.");
		output("\n\nPenny twists her upper body to face you. Her vision is having trouble focusing on you; her eyes dart around the room, before settling on yours. <i>“[pc.name],”</i> she says sensually, her lips still cottony and her speech still slurred. <i>“I just had the most</i> amaaaaaaaaaazing <i>dream....”</i>");
		output("\n\nYou ask her to tell you about it.");
		output("\n\n<i>“Mmmm, well,”</i> she says, twisting her head back around and lowering it back onto the pillow. She wiggles her hips against you, pressing her beautiful ass up against your pelvis. Her tail swishes from side to side accusatorily. <i>“Long story short, I dreamt that I got fucked real good.”</i> You say nothing as she giggles to herself. <i>“Any idea what could have given me a dream like that?”</i>");
		if(pc.isNice()) output("\n\nYou’re too embarrassed to say anything in your defense. Penny, without looking at you, picks up on that. <i>“Don’t be shy, [pc.name]. I got naked and jumped into your bed with you. Go ahead and,”</i> she says, wiggling her ass on you once more, <i>“have a little fun.”</i>");
		else output("\n\nHell, you’re caught; might as well own up to it. You tell her it’s because you helped yourself while she was asleep. <i>“Mmph, am I glad you did,”</i> she sighs, wiggling her ass on you once more. <i>“I feel great. And that was one of my kinkiest dreams ever. Go ahead and do it again if you get the chance.”</i>");
		output("\n\nWith that said, Penny takes a deep breath through her nose, and then, with a surprising amount of pep, throws the bedsheets off you both, and springs to her feet. <i>“Damn, do I ever feel like a million credits!”</i> she says, immediately launching into her morning-routine stretches. First, both arms over her head, then one after the other across her chest. <i>“That was one hell of a ‘good morning’ to wake up to, cap’n. I should see if I can’t return the favor tomorrow or something!”</i>");
		output("\n\nShe spins around, facing you, and puts her left leg on the bed, stretching it. You’re given a full-on view of her " + (!penny.hasCock() ? "puffy-but-satisfied pussy, throbbing gently between her legs, and looking like it wouldn’t mind a round two":"cock, exposed but receding into her sheathe, a clear drop of her cum dangling from her tip. You’re sure it wouldn’t be hard to coerce her into a second round") + ".");
		output("\n\n<i>“I’d offer to repay the favor right now, actually,”</i> she says, noticing your stare. As she drops her leg and lifts the other, she thrusts her pelvis towards you, " + (!penny.hasCock() ? "flaunting her pussy for you to gawk at":"flapping her half-hard cock towards you, flinging the drop of cum in your direction") + ". <i>“But, my time in the academy, and my time working on Mhen’ga, has really hammered some habits into me. If I don’t at least make the effort to clock in, I’ll feel like a useless asshole all day.”</i>");
		output("\n\nWhen she’s done, she picks up her pillow and makes for the door to your quarters, a particular bounce in her step the whole way. <i>“But, if you don’t think you can wait until tomorrow morning,”</i> she says, her tail swishing in a lazy, inviting circle, <i>“you know where I’ll be.”</i> And with that, she disappears into the halls of the ship, as naked as when she entered your quarters.");
		output("\n\nYou’re alone in your bed. There’s nothing left for you here; you follow Penny’s example, and you get out of bed. " + (pc.isNude() ? "And, following her example further, you step into the halls of your ship, completely nude.":"You appropriate your [pc.gear] until you’re as equipped as you were, and you step out into the halls of your ship."));
		output("\n\nAfter all that, you’re ready to take on the next day of your adventure.");
		// end scene (scene: Fucked Penny); return the PC to the ship’s main menu; advance clock by eight hours
	}
	else
	{
		// (scene: Fucked Penny, subsequent times)
 		output("Penny stirs, her arms tucking her pillow closer to her. She wriggles her body against you, subconsciously knowing what you’ve done and trying to eke out just a little bit more pleasure for itself before it’s over. <i>If</i> it’s subconscious; Penny’s proven that she’s not the type to sleep through these things.");
 		output("\n\n<i>“Mmmm,”</i> she purrs, her head lifting off the pillow. She flexes her jaw, resetting it after sleeping on it through all the night, and then she turns to you. You keep still. You’re not trying to hide what you’ve just done – Penny’s told you that she’s okay with your sleep sex – but you don’t want to disturb her. And besides, you’re still coming off your orgasmic high from busting your own " + (pc.mf("","girl-")) + "nut.");
 		output("\n\nPenny’s eyes wander the room, unfocused in the dim light, but eventually they settle on your own. <i>“[pc.name],”</i> she says, chewing her jaw a few more times to work the stiffness out of it. She licks her lips sensually at you, and she jostles her hips back and forth, enjoying the sensations she’s getting from doing it. <i>“Mmmm, feels like... we might’ve had a fun evening last night.”</i>");
 		output("\n\nYou ask her if she had any pleasant dreams.");
 		output("\n\n<i>“Yeah, just the one,”</i> she says, leaning in and touching her nose to yours. <i>“I dreamt that " + (pc.cockThatFits(penny.vaginalCapacity(0)) >= 0 ? "I was getting some of the best dick in my life. Rrrrrrailed,”</i> she trills, <i>“slow and heavy on some thick meat until it filled me up with some hot, thick, creamy jizz.":"my pussy was getting some grade A attention from a [pc.manWoman] that knows how to treat a cunt right.”</i> She rubs her nose against yours. <i>“And I don’t know too many [pc.manWoman] that know how to treat a woman’s pussy to such a good time.") + " Any idea why I might have had a dream like that, mate?”</i>");
 		output("\n\nYou tell her plainly: it’s because you had your way with her in her sleep. You certainly enjoyed it, and you ask her if she did.");
 		output("\n\nIn response, she nestles herself into you. She grabs your hand and drapes it over her body, holding your arm across her chest like a seatbelt, and she pushes her foxy hips into your " + (pc.hasCock() ? "[pc.cock]":"[pc.leg]") + ". <i>“If I could dream like that every night, [pc.name], I wouldn’t ever want to wake up.”</i>");
 		output("\n\nYou two lay like that for some time longer, enjoying your bodies pressed together underneath the cover of your bedsheets, teasing little jolts and aftershocks of pleasure out of you both. She giggles occasionally whenever something of yours presses into just the right spot of hers; she moans your name gently whenever you lean in and kiss her neck; and her hand can’t help but hold yours, guiding it towards her breast for you to play with, the flat of her stone-hard nipple pressing into your palm.");
 		output("\n\nAbout an hour later, Penny, with a sigh of content, throws the covers off herself. <i>“I’m all for being lazy and fuckin’ around in bed, mate, but if we don’t at least put on a show of clocking in and pretending to give a damn, we’ll... well, we wouldn’t be much of a crew, would we?”</i>");
 		output("\n\nShe goes about her morning stretches and routines, talking special care to make sure you can see everything she does, everywhere. When you get an eyeful of her " + (!penny.hasCock() ? "puffy, satiated, but eager pussy":"receded, but thick and plump, sheathe") + ", you consider maybe giving you both a personal day and starting round two – but, you know how driven Penny is.");
 		output("\n\nWhen she’s done, she picks up her pillow and makes for the door to your quarters, a particular bounce in her step the whole way. <i>“I don’t know about you, [pc.name],”</i> she says, her tail swishing in a lazy, inviting circle, <i>“but I, for one, am looking forward to more dreams like that. Maybe I’ll get another one tonight.”</i> And with that, she disappears into the halls of the ship, as naked as when she entered your quarters.");
 		output("\n\nYou’re alone in your bed. There’s nothing left for you here; you follow Penny’s example, and you get out of bed. " + (pc.isNude() ? "And, following her example further, you step into the halls of your ship, completely nude.":"You appropriate your [pc.gear] until you’re as equipped as you were, and you step out into the halls of your ship") + ".");
 		output("\n\nAfter all that, you’re ready to take on the next day of your adventure.");
 		// end scene (scene: Fucked Penny); return the PC to the ship’s main menu; increase Lust by 10; advance clock by eight hours
	}
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

// (scene: Fucked By Penny)
public function morningFuckedByPennyAfter():void
{
	clearOutput();
	showPenny(true);
	author("B");
	showName("GOOD\nMORNING!");

	IncrementFlag("PENNY_MORN_FUK_U");

	if(flags["PENNY_MORN_FUK_U"] == 1)
	{
		output("You stir, running your hand over the fabric of your sheets. You feel kind of sore, especially around your [pc.vagOrAss], but other than that... you actually feel <i>amazing.</i>");
		output("\n\nYou hear Penny gasp in surprise as you lift your head, and she says nothing when you glance over your shoulder towards her. She’s clamped tightly to your body, holding you close to hers" + (penny.hasCock() ? ", and, from the feel of things, she hasn’t totally vacated your [pc.vagOrAss] just yet":"") + ". You have a hard time focusing on her at first, and your vision is attracted to other things in the room before finally settling on her.");
		output("\n\nFrom the way her heart is hammering into your back, and from the way " + (!penny.hasCock() ? "her thighs are still wetly clamped to your [pc.leg],":"her [penny.cock] is still lodged inside you – but softening quickly –") + " even your sleepy, hazy mind could put two and two together. Still, you humor her, and, instead of chastising her, you tell her that you had the most <i>wonderful</i> dream.");
		output("\n\n<i>“Oh yeah?”</i> Penny asks nonchalantly. You tell her that she was in it. <i>“That’s, uh, sweet of you to say. It’s nice to know that you’re keeping me in your dreams.”</i> She pauses awkwardly for a bit before her curiosity gets the better of her. <i>“What, uh... what was it about?”</i>");
		output("\n\n" + (pc.isNice() ? "You tell her that you dreamt you and she had built a cozy little hideaway in the middle of the woods. It wasn’t very big, and it didn’t have a lot in it, but you had each other. And you celebrated having built the cottage by making love.":"You tell her, straight and honestly, that you two fucked. Or, more specifically, <i>she</i> fucked <i>you.</i> It was pretty intense, actually."));
		output("\n\nYou wiggle your [pc.ass] towards her, feeling how " + (!penny.hasCock() ? "rough and beaten up your [pc.leg] feels from Penny humping it":"sore you are, in all the right ways, from having her cock pounding into you") + ". <i>“Uh,”</i> she laughs, knowing she’s caught, <i>“I guess I wasn’t as discrete as I thought.”</i>");
		output("\n\nYou tell her not to worry; you doubt anyone could have slept through that without figuring it out eventually. " + (pc.isNice() ? "And besides, you invited her into your bed. She’s your lover. You trust her, and you don’t mind if she enjoys herself a little when you’re not wholly available to entertain her yourself.":"And besides, you wouldn’t have invited her into your bed if you didn’t expect to have a little bit of fun. The next time she gets a little horny, she has your permission to do what she needs to blow off some steam."));
		output("\n\nPenny smirks, then leans into you, kissing you on the cheek lovingly. <i>“That’s my mate,”</i> she whispers, then nuzzles her cheek lovingly against yours.");
		output("\n\nWith that said, Penny takes a deep breath through her nose, and then, with a surprising amount of pep, throws the bedsheets off you both, and springs to her feet. <i>“Damn, do I ever feel like a million credits!”</i> she says, immediately launching into her morning-routine stretches. First, both arms over her head, then one after the other across her chest. <i>“That was one hell of a ‘good morning’ to wake up to, cap’n. You should give it a try yourself sometime!”</i>");
		output("\n\nShe spins around, facing you, and puts her left leg on the bed, stretching it. You’re given a full-on view of her " + (!penny.hasCock() ? "puffy-but-satisfied pussy, throbbing gently between her legs, and looking like it wouldn’t mind a round two":"cock, exposed but receding into her sheathe, a clear drop of her cum dangling from her tip. You’re sure it wouldn’t be hard to coerce her into a second round") + ".");
		output("\n\n<i>“I’d offer to go another round right now, actually,”</i> she says, noticing your stare. As she drops her leg and lifts the other, she thrusts her pelvis towards you, " + (!penny.hasCock() ? "flaunting her pussy for you to gawk at":"flapping her half-hard cock towards you, flinging the drop of cum in your direction") + ". <i>“But, my time in the academy, and my time working on Mhen’ga, has really hammered some habits into me. If I don’t at least make the effort to clock in, I’ll feel like a useless asshole all day.”</i>");
		output("\n\nWhen she’s done, she picks up her pillow and makes for the door to your quarters, a particular bounce in her step the whole way. <i>“But, if you don’t think you can wait until tomorrow morning,”</i> she says, her tail swishing in a lazy, inviting circle, <i>“you know where I’ll be.”</i> And with that, she disappears into the halls of the ship, as naked as when she entered your quarters.");
		output("\n\nYou’re alone in your bed. There’s nothing left for you here; you follow Penny’s example, and you get out of bed. " + (pc.isNude() ? "And, following her example further, you step into the halls of your ship, completely nude.":"You appropriate your [pc.gear] until you’re as equipped as you were, and you step out into the halls of your ship."));
		output("\n\nAfter all that, you’re ready to take on the next day of your adventure.");
	}
	else
	{
		// (scene: Fucked By Penny, subsequent times)
 		output("You stir, running your hand over the fabric of your sheets. You feel kind of sore, especially around your [pc.vagOrAss], but other than that... you actually feel <i>amazing.</i>");
		output("\n\nYou feel Penny lean into you, her breath coming out as strained, metered breaths against your neck. Her hands roam freely along your body, as high as your [pc.chest] to as low as your [pc.belly], touching and feeling everything as if it all belonged to them. And, of course, you feel her lower body wrapped around you, " + (!penny.hasCock() ? "her legs intertwined with yours, her hot pussy clamped against you and wetly sliding along you":"her hot vixen cock good and lodged deep into your [pc.vagOrAss], thrusting a half-inch in and out impishly") + ", eking out as much pleasure for itself as it can.");
		output("\n\nYou lift your head and groggily turn it towards Penny, trying to get a look at her. She meets you halfway by planting soft, gentle kisses against your cheek and along your neck, peppering the side of your head as low as your collarbone. <i>“Good morning to you, my mate,”</i> she says, her limbs clamping tighter against you. <i>“Did you have any particularly pleasant dreams?”</i>");
		output("\n\nYou tell her, unabashedly, exactly how your dream went: you two had settled into a cozy, little, under-furnished cabin, and you dreamt that you two christened it by fucking. Or, more specifically, <i>she</i> fucked <i>you</i>. Emphasising the point, you wriggle your [pc.hips] against her, and you say that you hope you’ll have more dreams like that in the future.");
		output("\n\nPenny moans sensually, nibbling your ear gently. <i>“Keep inviting me into your bed, [pc.name], and you’ll have all the sexy dreams of me having my way with you that you can handle.”</i>");
		output("\n\nYou two lay in your bed lazily, enjoying the afterglow of having such a good morning to start with. Penny is highly affectionate, constantly kissing you and rubbing at different parts of you with different parts of her, from her hands and arms, to her legs, to her" + (!penny.hasCock() ? ", trying to greedily get another rise teased into her – and maybe even into you for another round":" [penny.cock], halfway to flaccid, but continually grinding into you, more than ready to rev the engines and get started on another round, if you’d just say the word") + ".");
		output("\n\nAfter about an hour of lazily cuddling in your bed, with Penny subtly trying to egg you into having another wake-up round, she apparently gives up, and tosses the bedsheets off of herself so she can begin her morning routine. <i>“We should really look into getting schedules for your crew, my mate,”</i> she says, lifting her leg to the bed. <i>“Get a rotating crew to look after the ship, and synchronize our days-off together. It’d give us the excuse we’d need to have all the pleasant dreams we could ask for.”</i>");
		output("\n\nShe goes about her morning stretches and routines, talking special care to make sure you can see everything she does, everywhere. When you get an eyeful of her " + (!penny.hasCock() ? "puffy, satiated, but eager pussy":"receded, but thick and plump, sheathe") + ", you regret not taking the bait and asking her to fuck you like she does in your dreams – but, you know how driven Penny is.");
		output("\n\nWhen she’s done, she picks up her pillow and makes for the door to your quarters, a particular bounce in her step the whole way. <i>“If you’re ever in the need to have another sexy dream of your favorite sexy vixen,”</i> she says, her tail swishing in a lazy, inviting circle, <i>“you just keep your bed cold, and I’ll come running to warm it up.”</i> And with that, she disappears into the halls of the ship, as naked as when she entered your quarters.");
		output("\n\nYou’re alone in your bed. There’s nothing left for you here; you follow Penny’s example, and you get out of bed. " + (pc.isNude() ? "And, following her example further, you step into the halls of your ship, completely nude.":"You appropriate your [pc.gear] until you’re as equipped as you were, and you step out into the halls of your ship") + ".");
		output("\n\nAfter all that, you’re ready to take on the next day of your adventure.");
	}
	// end scene (scene: Fucked By Penny); return the PC to the ship’s main menu; advance clock by eight hours
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function turnPennyIntoACamwhore(discrete:Boolean = false):void
{
	clearOutput();
	showPenny(true);
	author("Abe. E. Seedy & Fen");
	output("<i>“Be a camwhore,”</i> you say simply. <i>“Then everyone in the galaxy can see what a depraved, cum-sucking slut you are. " + (discrete ? "You don’t even have to show your face. You could wear a mask or hood, maybe even set up an id-blurring filter if there’s enough blood left in your brain to figure out how to work a computer.":"Your face could be synonymous with jizz-addicted dick-girl sluts. You wouldn’t be able to walk down the street without people seeing you and instantly knowing what you do in your free moments - every single one of them.") + "”</i>");
	output("\n\nPenny moans, clearly turned on by the thought of becoming some kind of public slut. The knowledge that thousands could watch her jerk off live, seeing every detail of her [penny.cock] throbbing and jerking and spurting helplessly into her mouth... and they’d be cumming too, because of her. They’d be spilling their own creamy, salty loads all because she dared to be the biggest slut she could be. The vixen gurgles in lust and confusion, shaking once or twice before straining for her [penny.cockHead].");
	output("\n\nStill making sure you have a strong enough of a grip to keep her away from her cock, you shift one of your hands to scratch lightly against the base of her ears. <i>“What?”</i> you tease her. <i>“Are you too shy for that? Doesn’t the thought of everyone seeing you desperately sucking your own dick turn you on?”</i>");
	output("\n\n<i>“Muhhmmmm!”</i> she answers, leaving you unsure as to whether she’s struggling to speak further or break free from your grip and resume servicing herself. Finally she manages to make a more coherent response, whimpering, <i>“But... how will they respect m-”</i>");
	output("\n\nYou cut her off by forcing her face suddenly down against her cock, her speech soon stopping as her lips switch effortlessly to sweeping over her slick [penny.cockHead]. <i>“Now now,”</i> you answer. <i>“What’s more important? Respect? Or being able to lick your dick clean at any moment? Being able to put that hot, sexy cock of yours to work in the service of giving the universe even more creamy cumshots? All you have to do is suck.”</i>");
	output("\n\nPenny moans wordlessly, unable to stop herself from doing exactly that.");
	output("\n\n<i>“Theeere you go,”</i> you say approvingly, forcing her head slowly downwards until she’s taken as much of her cock inside her mouth as possible and is limited to blissfully fucking her own face. <i>“Doesn’t that feel better? Isn’t it just so much nicer not to worry about what anyone thinks; and instead just focus on feeding your wonderful addiction?”</i>");
	output("\n\nHer eyes roll slowly back in her head as she starts to inexorably lose herself in the sensation of swallowing her [penny.cock].");
	output("\n\n<i>“In fact,”</i> you continue, moving around to stand beside her and whispering directly into her ear, <i>“you </i>want<i> people to see this, don’t you? You want people to see how you’re hooked on drinking your own cum, how you can’t stop putting your dick in your mouth and working it over again, and again, and again.”</i>");
	output("\n\nPenny’s movements are becoming jerky and erratic, her whole body shuddering as she approaches what is clearly an unstoppable orgasm. Seizing the moment, you grab her fiercely and hiss, <i>“You’re a cumslut, aren’t you? You’re addicted to the taste of your own cum, and don’t care if the whole universe watches you milk yourself.”</i>");
	output("\n\nShe manages to look up at you, her blushing face and the look of pleading desperation in her eyes conveying her hesitance, but even as she does her dick starts surging involuntarily, and soon burst after burst is splashing against the back of her throat, and all she can do is slurp it down greedily. Her resistance melts as she sinks into it, her eyes sliding closed and her blush fading as all her reservations are overcome by just how <i>good</i> this feels.");
	output("\n\nSeeing her adjusting, you shift to crouch directly in front of her, watching approvingly as she gulps down her seemingly never-ending load. <i>“Good girl,”</i> you say encouragingly. <i>“Don’t you enjoy putting on a good show like this?”</i>");
	output("\n\nEven muffled as she is, Penny manages to give out a slightly more concerted moan to attempt to express her approval.");
	output("\n\nYou grin in response. <i>“Of course you do. So much better than letting your silly little shyness get in the way of enjoying your wonderful cock you went </i>so<i> out of your way to get. But remember...”</i> Without warning you slide three fingers inside her dripping slit, the sudden shock of which causes her cock to bulge with a startlingly intense orgasm, almost forcing it out of her mouth with the sheer volume of cum she produces in that one instant. <i>“Everyone can watch, but only </i>I<i> get to enjoy you.”</i>");
	output("\n\nThat last emphatic orgasm seems to have wrung most of it out of her, and within moments Penny is left leaning exhausted back in her chair, while her [penny.cock] slides slowly out of her mouth to rest between her breasts. After spending a moment appraising the impressive amount of mess she left on your fingers you casually place them next to her mouth, and reflexively she leans forward and begins to eagerly lick them clean.");
	output("\n\n<i>“What a good girl,”</i> you coo, before turning and walking out of the room, leaving the near-incoherent Penny to recover behind you. As you step outside, you place an order for a holocam delivery to your ship and forward a potential site she could register with later. After all, it wouldn’t do to let her talents go to waste by letting her shows go unseen.");
	
	if(discrete) flags["PENNY_LETTING_OTHERS_WATCH_CUMSLUTTERY"] = 2;
	else flags["PENNY_LETTING_OTHERS_WATCH_CUMSLUTTERY"] = 3;
	flags["PENNY_HIDING_CUMSLUTTERY"] = undefined;
	flags["PENNY_BEING_A_PUBLIC_CUMSLUT"] = undefined;
	flags["PENNY_IS_A_CUMSLUT"] = 1;
	pc.lust(10);
	processTime(10);
	clearMenu();
	addButton(0,"Next",crew);
}

//Random event on ship
//Requires Penny to have a dick.
public function mitziAndPennyFunzies():void
{
	clearOutput();
	showPenny(true);
	author("Wsan");
	if(pc.isNaga()) output("Sliding");
	else if(pc.isTaur()) output("Walking");
	else output("Strolling");
	output(" past Penny’s room you hear a staccato rhythm of wet slaps from inside, leaving little doubt about what’s transpiring. It might be time for the captain to pay [pc.hisHer] subordinate a nice little visit.");

	processTime(1);
	clearMenu();
	addButton(0,"Walk In",walkInOnPennyMitziHuff,undefined,"Walk In","Check in on your lovable little fox-girl officer.");
	addButton(14,"Leave",leaveSmuttyPenpen,undefined,"Leave","Leave the good officer to her own devices.");
}

//[Walk in]
//tooltip:Check in on your lovable little fox-girl officer.
//Unlocks a one-time conversation with Mitzi.
public function walkInOnPennyMitziHuff():void
{
	clearOutput();
	showPenny(true);
	author("Wsan");
	output("The door slides open and you’re greeted by quite the lewd sight as you take a quiet step inside.");
	output("\n\nPenny’s laid out on her bed, her hips arched so far off the mattress the only parts of her in contact with it are her upper back and tightly curled toes. She’s beating the fuck out of her [penny.cock]");
	if(penny.cocks[0].cLength() >= 10)
	{
		output(" with both hands, one " + (penny.hasCock(GLOBAL.TYPE_EQUINE) ? "above the medial ring masturbating the flared tip and the other below, furiously stroking herself from the bottom up.":"tightly wrapped around the tapered tip, squeezing it tight and the other jacking herself off so hard her hands are slamming together."));
	}
	else output(" with one hand and desperately stroking her clit with the other, grunting in depraved need.");
	output("\n\nThe most interesting detail, though, is the pair of " + RandomInCollection(["black and white cowskin","hot pink","lacy black","femcum-stained white"]) + " panties she’s holding in her muzzle, deeply inhaling the scent of its owner.");
	output("\n\n<i>“Ohhhh, starssss, Mitzi-i-i-i,”</i> Penny groans haltingly, thrusting into the air on pure animal instinct. Sweat droplets fly from her flushed body, spattering the sheets of her bed. <i>“Fffnnnggrrgh... f- fuck...”</i>");
	output("\n\nShe stops for a moment and takes the panties out of her mouth, lifting them instead to her noze and taking a sudden, forceful inhale. " + (penny.hasCock(GLOBAL.TYPE_EQUINE) ? "Her cockhead flares immediately and spurts a jet of precum across her face, splattering both her fur and Mitzi’s wet panties.":"Her knot noticeably bulges the moment she does so, precum dripping out of her cockhead like a faucet and spattering her stomach.") + " She flips her shock of red hair back and moans throatily, clearly up to her eyeballs in depraved enjoyment.");
	output("\n\nShe hasn’t noticed you, too enthralled by the panties clasped tightly in her hands. You could let her finish or announce your presence to see what ensues.");
	if(flags["PENNY_CAUGHT_MITZI_JERKIN"] == undefined) flags["PENNY_CAUGHT_MITZI_JERKIN"] = 1;
	processTime(20);
	clearMenu();
	addButton(0,"Watch",watchPennyHaveFun,undefined,"Watch","Let her have her fun.");
	addButton(1,"Interrupt",interruptPennyfaps,undefined,"Interrupt","Take a more hands-on approach. Literally.");
}

//[Watch]
//tooltip:Let her have her fun.
public function watchPennyHaveFun():void
{
	clearOutput();
	showPenny(true);
	author("Wsan");
	if(flags["PENNY_BIMBO"] != undefined) 
	{
		output("Penny’s cute moans reach a fever pitch as you watch her, one delicate hand masturbating her maleness while her eyes roll in her silly head. As airheaded as she is, she’s certainly an expert at pleasing cocks - especially her own. What you’re seeing, though, isn’t a display of sensual technique lovingly applied to drive a partner wild. It’s desperation, it’s frustration, it’s pent-up sexual aggression manifested before your very eyes.");
		output("\n\n<i>“Oh, gosh!”</i> Penny cries in bliss, her feminine hips rolling up and down in need. <i>“Hh-huuunnnh!”</i>");
	}
	else if(pennyIsCumSlut())
	{
		output("Penny licks her cum out of her fur without missing a beat, the reflex to seek spunk and swallow it so deeply ingrained she doesn’t even think about it. That doesn’t stop her eyes from rolling in her head as it’s smeared across her long pink tongue, a big glob of endorphins every bit as addictive as the spooge itself exploding in her brain. She giggles, girlish voice completely at odds with the violently male way she bucks her hips into the air.");
		output("\n\n<i>“Fuck, yes!”</i> Penny pants, gazing at her cock in glee. <i>“Yesyesyesyesyes fuuuck!”</i>");
	}
	else
	{
		output("Penny’s biting her lip, her tail swishing beneath her flexing butt while she groans in pleasure. You don’t think she’s very far from cumming and cumming <i>hard</i> if her little squeaks and moans are any indication, precum dribbling from her tip with every upward thrust. She looks desperate to cum, to finally achieve release after all of her straining effort.");
		output("\n\n<i>“Oh! Ohhh! Huh- nnnnngh!”</i> Penny grunts, hips hovering off the bed. <i>“Fuu-u-u-ck- Mitzi, Mitzi, Mitzi!”</i>");
	}
	output("\n\nJets of semen erupt from her [penny.cock], spurting all up her flexing form. ");
	if(pennyIsCumSlut())
	{
		output("In a display of both base need and impressive flexibility, she rolls backwards with her legs in the air and greedily ");
		if(penny.cocks[0].cLength() < 7) output("jacks herself off right into her wide open mouth.");
		else if(penny.cocks[0].cLength() < 13) output("thrusts between her own lips, eyes rolling upwards in bliss as she cums into her own mouth.");
		else output("shoves her cock right down her own throat, hands pressing down on her ass to get it deeper. You can see her swallowing madly, eyes rolling upwards in bliss " + (penny.hasCock(GLOBAL.TYPE_EQUINE) ? "while her flare expands in her esophagus.":"while her knot inflates."));
	}
	else
	{
		output("A quiet scream of joy escapes her mouth as she jacks herself off all over her creaking bed, so intense it looks like she’s having the orgasm of her life. She flutters and shivers in the air, hands mechanically administering self-love while erotic moans leak from her open mouth. You’re not going to soon forget the sight of her so blissfully free, cum spurting from her throbbing cock.");
	}
	output("\n\nShe collapses to the bed in a heap when she’s done, flopping onto her back with a groan. You take your leave of the scene before her presence of mind returns, leaving Penny glancing confusedly at the door when she thinks she sees motion.");
	processTime(15);
	penny.orgasm();
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Interrupt]
//tooltip:Take a more hands-on approach. Literally.
public function interruptPennyfaps():void
{
	clearOutput();
	showPenny(true);
	author("Wsan");
	output("<i>“Adorable,”</i> you say.");
	output("\n\nPenny yelps and grabs her blankets in reflexive panic, looking up at you wide-eyed and panting, gigantic ears laid back against her head. Her expression relaxes when she sees you grinning at her,");
	if(flags["PENNY_BIMBO"] != undefined) 
	{
		output(" giving you a dopey smile.");
		output("\n\n<i>“Hiya, [pc.name]!”</i> she says, wagging her tail. <i>“Didja come here to watch me cum all over myself?”</i>");
		output("\n\n<i>“Maybe,”</i> you say, stepping closer. You hadn’t really noticed at the door but this entire room is <i>filled</i> with the smell of sex. It’s evident she’s been at this for a long time. <i>“You doing okay, Penny?”</i>");
		output("\n\n<i>“Uh huh... Mitzi left me these as a like, present or something,”</i> she says dreamily, patting the panties in her hand. <i>“They’re </i>great<i>.”</i>");
		output("\n\n<i>“Did she now?”</i> you murmur, eyeing the love-soaked item. <i>“Hmm.”</i>");
		output("\n\n<i>“Yuppers! I just woke up and they were here on my dresser, all ready to be fapped on,”</i> Penny replies, nodding up and down before an idea occurs to her. <i>“Oh! Do you wanna join in, [pc.name]? It’ll be fun!”</i>");
	}
	else if(pennyIsCumSlut())
	{
		output(" <i>“Oh - [pc.name],”</i> she moans, one hand still on her cock. You have to admire the persistence. <i>“Can you help me milk some more yummy cum out?”</i>");
		output("\n\n<i>“You looked like you had it pretty well in hand,”</i> you quip, drawing closer. <i>“Sure you need the help?”</i>");
		output("\n\n<i>“Uh huh!”</i> she replies, eyes gleaming. <i>“I’ll definitely cum way faster if you’re here, [pc.name]. You’re too sexy for me to resist, you know that!”</i>");
	}
	else
	{
		output(" eyes rolling in disbelief.");
		output("\n\n<i>“Fuck, [pc.name],”</i> she moans, tail batting happily against the wall. <i>“You just about gave me a heart attack. I’m already having a hard time here!”</i>");
		output("\n\n<i>“Oh?”</i> you ask, eyebrows raised. <i>“Looked like you were having fun to me.”</i>");
		output("\n\n<i>“Fuck! Mitzi left her panties in here as a, a prank or something,”</i> Penny pants, looking at them in her hand. They’re soaked through with semen, saliva, and sweat. <i>“I’ve been beating off for like two fucking hours! They just smell so- </i>sooo<i> fucking good, [pc.name],”</i> she moans, hand sinking her back to her groin. <i>“Oh, fuck... do you wanna give me some help here?”</i>");
	}
	processTime(3);
	pc.lust(5);
	clearMenu();
	if(pc.hasHardLightEquipped() || (pc.hasCock() && pc.cockThatFits(penny.vaginalCapacity(0)) >= 0)) addButton(0,"Reacharound",cockSelect,[reachAroundThePennyslut,penny.vaginalCapacity(0), true,0],"Reacharound","Fuck the foxgirl’s pussy and give her a nice reacharound while you do.");
	else if(pc.hasCock()) addDisabledButton(0,"Fuck Penny","Fuck Penny","You’re too big for her pussy.");
	else addDisabledButton(0,"Fuck Penny","Fuck Penny","You need to be wearing a hardlight strap-on or have a penis that fits inside Penny for this.");
	addButton(1,"Facefucked",facefuckMitziJerkingPenpen,undefined,"Facefucked","Get a rough faceful of Penny’s hard cock.");
	addButton(2,"Get Fucked",vaginaRouter,[missionaryCatchWithPantiesPenny,penny.cockVolume(0),1,0],"Get Fucked Missionary Style","Let Penny sate her lust inside you. Likely to be rough.");
}

//[Reacharound]
//Requires cock or hardlight.
//tooltip:Fuck the foxgirl’s pussy and give her a nice reacharound while you do.
public function reachAroundThePennyslut(x:int):void
{
	clearOutput();
	showPenny(true);
	author("Wsan");
	output("<i>“Let’s get you off nice and hard,”</i> you say" + (x >= 0 && !pc.isCrotchExposed() ? ", stripping off your [pc.crotchCovers]":"") + ". <i>“Turn around, you horny little foxslut.”</i>");
	output("\n\n<i>“I’m not </i>that<i> horny,”</i> Penny protests, turning around" + (penny.hasCock(GLOBAL.TYPE_EQUINE) ? ", her equine cock flopping onto the bed while she spreads her pussy for you with both hands.":" while she spreads her pussy for you with both hands.") + " <i>“I-it’s just when I smell those panties- oh, fuuuuck...”</i>");
	output("\n\nYou lean over and stuff them right in her drooling mouth, jamming them between her teeth as you thrust forward and force a deep, muffled moan out of her. Her pussy is wet and warm around you, already soaked with unrepressed lust and trembling in pleasure. It’s really not going to take much to set her off like a bomb.");
	output("\n\nReaching up and pulling her upwards by her shoulder, you sit her back down on your [pc.cockOrHardlight " + x + "] and tug her into your lap. Penny all but melts in your hands, groaning and shivering until you take a firm hold of her [penny.cock] and she stiffens both against you and in your grip. A soft sigh of pleasure tumbles from her lips as you rub her with your thumb, rolling your [pc.hips] up into her from below.");
	if(x >= 0) pc.cockChange();
	output("\n\n<i>“Oh, that’s so good,”</i> Penny whispers, squeezing her own breasts. <i>“H-harder... fuck me harder!”</i>");
	output("\n\n<i>“Oh, you sure?”</i> you tease her.");
	output("\n\n<i>“Yes! Yes! Please!”</i> she chants, voice rising a few octaves in desperation. <i>“I’m </i>so<i> close!”</i>");
	output("\n\nWell, that’s what you came here for in the first place. Gripping her cock tight, you begin fucking her dripping slit hard enough for her ass to clap and roughly jacking her off. You get the desired result pretty much immediately. She screams in bliss and tenses up, pressing herself back into you and almost doubling over in pleasure. The precum dripping over your fingers doubles as the foxgirl writhes in your hands, her head pressing back into your chest as she tries to arch her back.");
	output("\n\n<i>“Fuuuck,”</i> she moans on a shuddering inhale, letting it all out in a wordless scream the next moment. <i>“Uuuuuuunnnnnhhh!”</i>");
	output("\n\nPenny cums so hard the first shot spatters against the opposite wall, milked from her pulsing cock by your squeezing fingers. She bucks and jerks in automatic reflex, gasping breathlessly while you force rope after rope of hot spunk from her " + (penny.hasCock(GLOBAL.TYPE_EQUINE) ? "flaring cockhead.":" canine tip.") + " Her pussy clamps down on you" + (x < 0 ? "r dildo":"") + " so fiercely you cum on the spot," + (x < 0 ? " the hardlight almost immobilizing you with the strength of its feedback.":" [pc.cum] pumping up into her spasming cunt.") + " The movement of your arm becomes almost mechanical, jerking and jumping while both of you arrhythmically tense and relax against each other.");
	if(pennyIsCumSlut())
	{
		output("\n\n<i>“Oh, shit, there’s so much </i>cum<i>,”</i> Penny whimpers, gingerly touching your hand and wiping it clean with her fingers before popping them into her mouth. <i>“Mmphm...”</i>");
		output("\n\nYou wordlessly lift your hand to her lips and she begins cleaning it off with her tongue, angling her head as she licks and sucks at you. Following that you turn her around, pulling out and letting her clean off your " + (x < 0 ? "hardlight":"cock") + " while her pussy drips on the bed.");
		output("\n\n<i>“Okay, I’m gonna get back to it,”</i> you say to Penny, noting she’s still got the panties clasped in her hand, arm dangling off the bed. <i>“You can keep those... I’ll send Mitzi around to get them later.”</i>");
		output("\n\nShe gives you a tired wave as the door closes behind you.");
	}
	else if(flags["PENNY_BIMBO"] != undefined)
	{
		output("\n\n<i>“Oh, </i>wow<i>,”</i> Penny sighs dreamily, falling back against your [pc.chest]. <i>“That was amazing, [pc.name]...”</i>");
		output("\n\nShe leans upwards to give you a kiss with your " + (x < 0 ? "hardlight":"half-hard cock") + " still deep inside her, gyrating her hips and squeezing until you pull back with a pleased grin.");
		output("\n\n<i>“I gotta run, Penny. You can handle cleanup, right?”</i> you ask, pulling out and standing. Her pussy drips juices{non-hardlight: and cum} in your wake.");
		output("\n\n<i>“Uh huh,”</i> she nods happily, looking around her room. <i>“I’m good at cleaning!”</i>");
		output("\n\n<i>“That’s good,”</i> you say, " + (x >= 0 && !pc.isCrotchExposed() ? "re-dressing ":"") + "and turning around at the door. <i>“I’ll swing by later and see you, okay?”</i>");
		output("\n\n<i>“Yeah! See you soon, [pc.name]!”</i> Penny says, smiling wide.");
	}
	else
	{
		output("\n\n<i>“Ooohhh, shit,”</i> Penny whimpers in the wake of it all, falling back against your [pc.chest]. <i>“I can’t cum any more than that...”</i>");
		output("\n\n<i>“That’s okay, I’ll be leaving the panties with you,”</i> you remark lightly, pulling free of her quivering quim. A trail of her juices" + (x >= 0 ? " and your cum":"") + " follows, dripping to the bed. <i>“I’ll send Mitzi around to get them later.”</i>");
		output("\n\n<i>“Oof,”</i> she says, settling back on the bed and admiring your butt");
		if(x >= 0 && !pc.isCrotchExposed()) output(" as you re-dress");
		output(". <i>“That’ll be fun...”</i>");
		output("\n\n<i>“No doubt,”</i> you say, grinning. <i>“I’ll swing by again later. See ya soon, Penny.”</i>");
		output("\n\nShe gives you an affectionate smile and a wave as you depart.");
	}
	processTime(10);
	if(x >= 0) penny.loadInCunt(pc,0);
	pc.orgasm();
	penny.orgasm();
	//maingamemenu
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
//[Facefucked]
//tooltip:Get a rough faceful of Penny’s hard cock.
public function facefuckMitziJerkingPenpen():void
{
	clearOutput();
	showPenny(true);
	author("Wsan");
	output("Penny’s pushing you down before your offer is even finished, hands on your shoulders and [penny.cock] pushing between your [pc.lips]. She shuffles up your [pc.chest], one hand behind your head and pulling it closer, groaning in pleasure. It’s hardly been a few seconds before she’s sitting on your face, hugging you tightly between her shaking thighs while she humps you as hard as she can.");
	output("\n\n<i>“Oh fuck, oh fuck,”</i> she pants in your [pc.ear]. <i>“So good! Nnnnuh!”</i>");
	if(!penny.hasCock(GLOBAL.TYPE_EQUINE))
	{
		output("\n\nYou can feel her puppycock pushing into your throat, the base of it threatening to swell with lust at any moment and surely soon given how much precum she’s spurting across your [pc.tongue]. You can’t see anything but her stomach as she rams it against you again and again, forcing you to swallow her down as she approaches her climax. She’s not going to knot your mouth... is she?");
		output("\n\nShe is. With a ragged, wordless scream, she hilts herself all the way inside your mouth and bucks her hips with an intensity rivalling that of a stallion, piping hot spunk pouring down the inside of your throat and gushing into your stomach. Helpless to resist, you feel her knot inflate against your tongue, pushing it into the floor of your mouth as her warm, pulsing bulb begins to occupy more of it.");
	}
	else
	{
		output("\n\nYou can feel the impressive flare at the end of her cock beginning to throb and widen, spreading out in your throat as she forces it down. The thicker and fuller it gets the more precum spills down into your stomach, splattering the back of your throat and being forced down by your efforts not to choke. It feels like she’s about to let loose her entire load while she’s pressing her groin right up against your face, but that means you’re probably not going to take a breath. She wouldn’t do that... right?");
		output("\n\nWrong. So lust-crazed and enchanted by the scent of Mitzi’s fuckdoll panties, she doesn’t even spare a thought for the prospect as she lets out a ragged, wordless scream and squeezes your head between her legs. What feels like a gallon of cum splurts from her flare and paints your throat a creamy white, pouring downwards. She immediately follows it up with another keg-filling stream of jizz, feeding you enough for all three meals of the day.");
	}
	output("\n\nPenny doesn’t even seem to notice your predicament, too caught up in groaning in ecstatic joy as she empties out her entire reservoir down your troubled esophagus. It doesn’t seem to stop, a new stream spattering the back of your throat as you grip her shivering hips and try to deal with it all. It’s a lot to take in...");
	output("\n\nShe finally rolls off you a few minutes later with a deep, groaning sigh of happiness. You take the opportunity to swallow a few times and clear your throat, trying to reacquaint yourself with the feeling of normalcy and fresh air. Penny tugs your arm and sits up, catching you in a grateful kiss.");
	output("\n\n<i>“Mmm... thanks, [pc.name],”</i> she sighs, pulling back and stroking your cheek with a smile. <i>“That felt </i>way<i> better than doing it myself.”</i>");
	output("\n\n<i>“That’s good,”</i> you say sincerely, wondering just how much Penny-spunk is settling in your tummy right now. <i>“I’ll uh, let you keep the panties and send Mitzi around later.”</i>");
	output("\n\n<i>“Awesome,”</i> Penny says, settling back on the bed. <i>“Maybe I’ll fuck her face too... Thanks, lover. I’ll see you later, okay?”</i>");
	output("\n\nHer eyes are fluttering closed as you exit the room.");
	processTime(10);
	pc.loadInMouth(penny);
	penny.orgasm();
	pc.lust(7);
	if(pc.isBimbo()) pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[‘Missionary’]
//tooltip:Let Penny sate her lust inside you. Likely to be rough.
//No taurs/nagas, probably.
public function missionaryCatchWithPantiesPenny(x:int):void
{
	clearOutput();
	showPenny(true);
	author("Wsan");
	output("<i>“Alright,”</i> Penny says, " + (!pc.isCrotchExposed() ? "tugging your [pc.crotchCovers] off and ":"") + "spreading your [pc.thighs]. <i>“But this is gonna be really rough and fast...”</i>");
	output("\n\n<i>“Good to hear,”</i> you say, grinning.");
	var looseness:Number = pc.ass.looseness();
	if(x >= 0) looseness = pc.vaginas[x].looseness();
	output("\n\nShe’s not kidding. Pushing your legs up, she exposes your [pc.vagOrAss " + x + "] and licks her lips before shuffling forward, forcing your thighs all the way down to the bed and pressing her own against your calves. With a grunt of effort, she leans down and presses herself against you, wrapping her arms tightly around your back and pulling you into her. Hardly a second passes after getting you in position before she’s pushing at your ");
	if(looseness <= 2) output("taut little hole");
	else if(looseness <= 3) output("comfortable fuckhole");
	else output("whore-gaped hole");
	output(" with her [penny.cock].");
	output("\n\n<i>“W-wait... Penny-”</i> you groan, trying to move. <i>“This- this isn’t- nnnh! Oh! Uh! Uunh!”</i>");
	output("\n\nYour complaints are shortly silenced by the initial penetration and subsequent thrusts, each one coming down like the blow of a hammer. You grip her tight for support, gasping as each rough impact of her groin against your [pc.ass] knocks the breath from you and reflexively tightens your core. That only drives her further, sliding herself to the hilt inside your squeezing hole but not stopping for even a second.");
	output("\n\nLike a woman possessed, Penny holds you down and mates you with a force usually reserved for thraggen. Fierce slaps of furred flesh crashing against your [pc.skinFurScales] ring out through the room, your whorish moans growing ever louder until you’re almost screaming for her to keep going, to fuck you harder, to slam you through the bed. She does all that and more, the urge to cum rising within you so fast it scarcely seems possible, her " + (!penny.hasCock(GLOBAL.TYPE_EQUINE) ? "canid cock":"equine cock") + " spurting precum so slick you’re sure her orgasm must be scant seconds away.");
	if(x < 0) pc.buttChange(penny.cockVolume(0));
	else pc.cuntChange(x,penny.cockVolume(0));
	output("\n\n<i>“Fu-u-u-uck,”</i> she grunts through grit teeth, hugging you so tightly it arches your back for you. <i>“CUMMING!”</i>");
	output("\n\nYou scream in bliss as Penny violently slams into you, your legs shooting straight up into the air while she begins to empty her entire reservoir of sperm right into your ");
	if(x >= 0 && !pc.isPregnant(x)) output("[pc.womb " + x + "].");
	else if(x >= 0) output("thirsty channel.");
	else output("spasming asshole.");
	output(" Your");
	if(pc.isHerm())
	{
		output(" [pc.cocks] shoot" + (pc.cockTotal() == 1 ? "s":"") + " all over your own [pc.chest] while your spasming pussy contracts, clamping down on Penny so hard that you milk an extra thick rope of spunk out of her by yourself.");
	}
	else if(pc.hasCock())
	{
		output(" [pc.cocks] shoot" + (pc.cockTotal() == 1 ? "s":"") + " all over your own [pc.chest], urgently spraying [pc.cum] all over your upper half and splashing it in your face.");
	}
	else if(pc.hasVagina())
	{
		output(" spasming pussy contracts so hard with her inside it that you feel her fire an extra thick rope of spunk as you clamp down on her, milking it out of her tip.");
	}
	else
	{
		output(" asshole clamps down on her so hard it milks an extra shot of spunk from her, squeezing and spasming around her throbbing cock.");
	}
	output(" Slowly, you lower your calves again - but only enough to wrap them around her lower back and pull her into you, leglocking her inside.");
	output("\n\nIt takes a few minutes of hot, heated struggling against each other before you’re finally loosed from her grip, sprawling out on her bed and panting hard, both of you covered in sweat. You feel like you’ve run a marathon, but fuck... that was something else. Hot, bubbling cum pours from your used and abused fuckhole, marking you as her mate.");
	output("\n\n<i>“Penny,”</i> you moan, and suddenly find the foxgirl atop you, holding your face and kissing you so hard you think she’s about to go for round two.");
	output("\n\nShe lets you go with a gasp eventually, though, and you feel a tinge of lingering regret. You wouldn’t have minded <i>that</i> much...");
	output("\n\n<i>“That was amazing,”</i> Penny moans, rolling off you and slumping limply onto her pillows. <i>“You’re amazing, [pc.name].”</i>");
	output("\n\n<i>“I don’t think I really did any of the work, but... that’s good?”</i> you say, vaguely confused.");
	output("\n\n<i>“You’re the best mate I could ever hope for,”</i> Penny sighs happily, turning her head to look at you with a smile. <i>“Better than I could hope for, actually.”</i>");
	output("\n\n<i>“That’s good... hey, the next time I catch you uh, in your room - you wanna go for round two?”</i> you ask hopefully.");
	output("\n\n<i>“Definitely,”</i> she laughs, her eyes drooping. <i>“But right now, I kinda want to sleep.”</i>");
	output("\n\n<i>“I’ll leave you to it,”</i> you say, ruffling her hair before standing. <i>“I’ll send Mitzi around to get her panties back later. Okay?”</i>");
	output("\n\n<i>“Uh huh,”</i> she replies sleepily. <i>“See you soon, [pc.name].”</i>");
	output("\n\n<i>“Bye Penny,”</i> you say, leaning down and kissing her on the snout before turning. The door closes behind you, leaving your futanari foxgirl lover to rest in the dark.");
	processTime(20);
	if(x < 0) pc.loadInAss(penny);
	else pc.loadInCunt(penny,x);
	penny.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Leave]
//tooltip:Leave the good officer to her own devices.
public function leaveSmuttyPenpen():void
{
	clearOutput();
	showPenny(true);
	author("Wsan");
	output("She’s earned a bit of privacy, you think. It sounds like she’s having a <i>really</i> good time in there, and you don’t want to interrupt her right now. Walking away, the sound of sexy moans and busy hands fades into the background hum of the ship.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Mitzi
//[MissingPanties?]
//tooltip:Ask Mitzi if she’s missing a pair of panties.
//New talk option. One time.
public function mitziPantiesTalk():void
{
	clearOutput();
	showMitzi();
	author("Wsan");
	if(pc.isBimbo()) output("<i>“Oh yeah!”</i> you say, suddenly remembering something. <i>“Did your panties go like... missing? ‘Cuz I found Penny jacking off to them!”</i>");
	else if(pc.isBro()) output("<i>“Missing your panties?”</i> you grunt. <i>“Think Penny’s got ahold of ‘em.”</i>");
	else output("<i>“Mitzi, are you missing a pair of panties?”</i> you ask. <i>“Because I saw Penny with them earlier.”</i>");
	output("\n\nShe claps her hands together delightedly. <i>“So that’s where Mitzi left them! Thanks, [pc.name]! Remind me to give you");
	if(pc.hasCock()) output(" a thank-you blowjob");
	else if(pc.hasVagina()) output("r pussy a thank-you suck");
	else output(" a nice little thank-you reward");
	output(" sometime. Or now,”</i> she adds, wiggling her eyebrows and smiling lasciviously.");
	if(flags["PENNY_CAUGHT_MITZI_JERKIN"] == 1) flags["PENNY_CAUGHT_MITZI_JERKIN"] = 2;
	processTime(2);
	clearMenu();
	addButton(0,"Next",approachCrewMitzi,true);
}

//[C.WhoreJerk]/[MutualJerk]
//tooltip:Get on cam with Penny and jerk off into each other’s mouths for the ExtraNet.
//Requires cock and cumslut camwhore Penny.
public function mutualJerkWithPennyCamStuff():void
{
	clearOutput();
	showPenny(true);
	author("Wsan");
	output("<i>“Hey Penny... wanna have some fun on cam?”</i> you ask, indicating her little holocam. <i>“You could even have your prize at the end.”</i> You watch her eyes shoot down to your crotch, burning with naked lust. <i>“Don’tcha want that?”</i>");
	output("\n\n<i>“I... I want it,”</i> Penny breathes, drooling from the corner of her mouth before wiping it with the back of her hand. <i>“I want it really, really fucking bad!”</i>");
	output("\n\n<i>“S’what I thought,”</i> you reply, grinning. <i>“Come here, you horny girl. Turn it back on and get nice and central for the camera.”</i>");
	output("\n\nYou " + (!pc.isCrotchExposed() ? "pull your [pc.lowerGarments] down and ":"") + "lure her over to you with the sight of your [pc.cocks], stiffening under her intense scrutiny. Her own flops between her furred legs before tipping forward, curving upward as she realizes she’s going to get a fat load of cum one way or another. By the time she reaches you, her [penny.cock] is standing stiff and erect, dribbling precum.");
	output("\n\n<i>“Thaaat’s right,”</i> you murmur, sliding your fingers over your own, stroking the [pc.cockHead]. <i>“Do you jack off a lot, Penny?”</i>");
	output("\n\n<i>“Uh - yeah,”</i> Penny says distractedly, watching you play with your cock. <i>“A fucking ton. Like... nnh... I never stop.”</i> She reaches between her thighs and begins to rub her shaft up and down, fingers lubricated by the trickles of translucent liquid bubbling from her " + (penny.hasCock(GLOBAL.TYPE_EQUINE) ? "blunted cockhead.":"pointed tip.") + " <i>“There’s just- just so much cum, so... nnngh...”</i>");
	output("\n\n<i>“Good girl, keep going,”</i> you whisper approvingly, massaging her shoulder with your free hand. <i>“Pump that cock for me, Penny.”</i>");
	output("\n\n<i>“It feels soooo good,”</i> she moans, rubbing herself harder, watching you with bated breath. <i>“I wanna cum!”</i>");
	output("\n\n<i>“You can cum,”</i> you tell her, tightening your grip on both her shoulder and your dick. <i>“Nngh... but when you do, do it in my mouth. Then I’ll cum in yours. Deal?”</i>");
	output("\n\n<i>“D-d-deal,”</i> she pants, sweat rolling down her brow. <i>“Oh fuck, I wanna taste your cum... I’ll be a good little camwhore and wait for you, I promise!”</i>");
	output("\n\n<i>“I know you will,”</i> you say, smiling. " + (penny.cocks[0].cLength() < 12 ? "<i>“Just keep stroking that slutty erection you’ve got. I wanna </i>taste<i> how much you’ve been edging.”</i>":"<i>“Just keep jacking that massive cock off, camslut. I wanna see how much of that creamy spunk you can shoot in my mouth.”</i>"));
	output("\n\n<i>“Hhhaah, fuck, fuck,”</i> Penny mutters to herself, looking down at her dick. <i>“Hhhnnh...”</i>");
	output("\n\nShe begins stroking herself off in a more measured fashion, closing her eyes and raising her hips while she squeezes her dick from base to tip. Glancing at the webcam, you give the viewers a confident smile as you rub up and down your shaft, dropping your gaze to Penny’s hands when you feel the faint hint of orgasm approaching. She’s so pretty like this...");
	output("\n\n<i>“Are you ready, Penny?”</i> you murmur, shuffling close enough to feel her heat. <i>“Stand up... let it all out in my mouth.”</i>");
	output("\n\n<i>“Okay,”</i> she gasps, jacking herself off harder as she shakily stands on her bed, her hips jerking and rolling with her frantic activity. <i>“O-okay! Uuuhhh- mmmh-”</i>");
	output("\n\nYou open your mouth just in time, the first rope of hot cum splattering all across your face as Penny lets out a massive groan of relief. Her thick, heavy followups get closer and closer to your [pc.lips] and [pc.tongue] until she’s furiously masturbating herself right in front of your face, eyes rolling in her head as creamy white spunk splatters against the back of your throat. You’re forced to swallow some just to avoid choking on her seed but catch the majority of the salty jizz across your lolling tongue, letting it wash around your mouth and fill your cheeks while she unloads.");
	output("\n\n<i>“Oooohhhhhhh fuuuuuck,”</i> Penny groans, staggering back with one last spurt that catches you right across the cheek and leaves you dripping. Your face is covered in wet, glistening cum and you make sure to lean down in front of the camera to give the stream a big, drippy smile before tilting your head upwards and swallowing several times. Sucking down her warm, slick spunk and leaving your mouth empty, you run your tongue over your lips before turning back to her.");
	output("\n\n<i>“Very good, Penny... do you remember what comes next?”</i> you ask, idly wiping a finger across your face and collecting a trail of her cum to rub on your own dick.");
	output("\n\n<i>“Yeah,”</i> she moans, collapsing back to her knees. <i>“Come on, [pc.name]! Cum in my mouth! Hose me down with jizz!”</i>");
	output("\n\nYou’re <i>more</i> than ready to let her have it, having had a hand on your stiff, flexing cock all throughout your oral effort to swallow down her load. It’s dribbling and leaking already as you stand before her, watching her long pink tongue unfurl. She sticks it out and waves it from side to side, gazing fixedly at your [pc.cockHeadBiggest] while you position yourself.");
	output("\n\n<i>“Fuck...”</i> you grunt, feeling the pleasure rising from below. <i>“Penny..!”</i>");
	output("\n\nPenny moans in delight as the first rope catches her right across the lips, lightly spattering her fur.");
	var cumQ:Number = pc.cumQ();
	if(cumQ < 500)
	{
		output(" The next coats her face before she tilts her pretty face backwards, opening her mouth wider and getting a delicious cheekful of [pc.cum] followed by the remainder as you squeeze it out. Her fuzzy little head is in the clouds, pupils dilated as she closes her mouth and runs her tongue all through her cheeks to collect every little drop before swallowing. One final, lazy rope of seed shoots from her flagging cock when she drinks it down, a sigh of desire and lust slipping from her cum-coated lips.");
		output("\n\n<i>“Fuck, [pc.name]... gimme some more sometime,”</i> she says, looking at you with seductively hooded eyes. <i>“I can’t get enough...”</i>");
		output("\n\n<i>“I’ll bet,”</i> you say, winking" + (!pc.isCrotchExposed() ? " as you re-holster your package":"") + ". <i>“I’ll have to swing by again soon, liven up the stream some.”</i>");
		output("\n\n<i>“You’re </i>always<i> welcome to, my mate,”</i> she purrs, a sated smile on her face as she waves you goodbye.");
	}
	else if(cumQ < 1000)
	{
		output(" Gently tilting her head back and laying your throbbing dick on her outstretched tongue, you groan as she catches the next few ropes with the back of her throat. You finish out by glazing her tongue and insides of her cheeks with [pc.cum], pulling back with a satisfied sigh.");
		output("\n\n<i>“Ogh,”</i> Penny mumbles, swishing her tongue around her mouth and collecting all of it. <i>“Nnnhmm...”</i>");
		output("\n\nShe gulps it down and shows you her wide open mouth, wet and glistening. Bending down, you give her fuzzy ears a comforting rub as a reward and pat her on the head.");
		output("\n\n<i>“Good foxslut,”</i> you tell her.");
		output("\n\n<i>“Thank you, mate,”</i> she whispers, pupils dilated and tail noisily waving across the sheets. <i>“When will you come back for more?”</i>");
		output("\n\nShe’s already looking for your next load, eyeing you hungrily. You can’t help but grin at the dedication.");
		output("\n\n<i>“Soon,”</i> you promise, giving her a wink. <i>“I’ll swing by and liven up the stream a bit next time I feel like it.”</i>");
		output("\n\n<i>“Good... mmm, I can still taste you,”</i> Penny replies, shivering in lust and licking her lips. <i>“Maybe I’ll go for another round...”</i>");
		output("\n\n<i>“Have fun,”</i> you say, waving as you exit.");
	}
	else if(cumQ < 2500)
	{
		output(" You follow it up with several thick spurts of [pc.cum] from your turgid cock, groaning as Penny tilts her head back to catch all of it in her mouth. She ends up " + (cumQ < 1800 ? "slightly ":"") + "overwhelmed by it all, gulping and gasping while you shower her in seed, painting her face [pc.cumColor]. You glance down in between strokes to see seed lazily spurting from her own flagging prick, no doubt encouraged by your efforts.");
		output("\n\n<i>“Oooggh!”</i> Penny mumbles excitedly, reaching down to rub herself. <i>“Mmmm!”</i>");
		output("\n\nShe half-heartedly jerks some more cum from her half-hard cock while you fill her mouth with yours, her dilated pupils looking up at you with nothing but love. Bending over, you give her a rub behind her big fuzzy ears while you squeeze yourself dry on her lolling tongue.");
		output("\n\n<i>“Good work, foxslut,”</i> you tell her.");
		output("\n\n<i>“Stars,”</i> she moans, swallowing a few times before she resumes talking. <i>“You’re amazing, mate... you- you’re gonna come back soon, right? And feed me again?”</i>");
		output("\n\n<i>“Sure,”</i> you say, winking. <i>“Can’t let my cum-slurping camslut go dry, after all.”</i>");
		output("\n\n<i>“Oh, thank you,”</i> she whimpers, jacking herself off and thrusting her hips. <i>“Thank you, thank you, thank you...”</i>");
		output("\n\nLooks like drinking down so much of your spunk’s driven her a little wild. You grin and leave her to her own devices, entertaining the stream watchers. That was fun.");
	}
	else if(cumQ < 10000)
	{
		output(" Her eyes go wide moments before her pupils dilate and she groans, a rope of seed shooting from her flagging cock as you begin hosing down her pretty face with spunk. Wild spurts fly from your cocktip, glazing her lolling tongue and luscious lips with [pc.cumColor] icing. She tilts her head back and begins swallowing down every little bit you have to give her, though she’s quickly overwhelmed by your excessive ejaculations and forced to just catch it in her mouth and let it run down her throat at its own pace.");
		output("\n\nGroaning through grit teeth, you jack yourself all over her heaving breasts before reapplying a coat of paint to her face. It feels so fucking good to empty your throbbing dick on your foxy cumwhore, letting the last remnants drool from the head onto her waiting tongue. She laps it up and gulps it down, watching you with a dopey smile.");
		output("\n\n<i>“Good girl,”</i> you say, casually rubbing her big fuzzy ears. <i>“You look beautiful like that. Like the perfect little foxslut you were always meant to be.”</i>");
		output("\n\n<i>“I love you so much, my mate,”</i> Penny whispers, rubbing herself all over again. Beneath her slightly cum-inflated tummy, you can see her cum-slick dick getting hard once more. <i>“Stars, drinking your cum is just... nnngh.”</i>");
		output("\n\n<i>“So inspiring you have to go again?”</i> you ask, grinning. She can’t even help herself.");
		output("\n\n<i>“Y-yes... nnh, shit,”</i> she moans, starting to jack herself off more meaningfully. <i>“Please c-come back and jizz in my mouth again, [pc.name]! Please! Soon!”</i>");
		output("\n\n<i>“Sure,”</i> you say, heading back out the door. <i>“Have fun, Penny.”</i>");
		output("\n\nYou leave her in front of the camera, panting and sweating with the effort of masturbating. Looks like she’ll be there for a while...");
	}
	else if(cumQ < 25000)
	{
		output(" The next shot, though, is so much thicker and heavier that she gasps in surprise before winding up gurgling, pupils dilating as she eagerly gulps down your spunk. She positions herself directly in front of your throbbing dick, breath hot on the tip, and groans in erotic satisfaction when you start to paint the back of her throat [pc.cumColor] with your [pc.cum].");
		output("\n\nGrunting and gritting your teeth, you let her have everything you’ve got stored up, utterly venting yourself into her cum-dripping mouth and watching it overflow down her front. There’s no way she can keep up with your amazing output, the majority of it squirting into the pooling mass in her cheeks before splashing down her chin and coating her heaving tits. You give her a short break by hosing down her face and tummy with it as well, coating her sloppy fur in spunk until she looks like little more than a condom turned inside out.");
		output("\n\n<i>“Oooohhhh, stars,”</i> she moans, one hand mauling her dripping tits and the other rubbing her dick. <i>“Mmmm!”</i>");
		output("\n\nYou raise your cock back to her mouth and she immediately capitulates, sticking her tongue out under the tip and catching a droplet before she chokes back a wet gurgle when another rope splashes against the back of her throat." + (penny.cocks[0].cLength() >= 8 ? " Her tit-groping hand drops to her cock as well as she frenetically starts jacking herself off all over again, swallowing down your bounty of warm sperm while she’s at it.":" She looks inspired by your amazing offering, jacking herself off even harder while she swallows it all down."));
		output("\n\n<i>“Fuuuck,”</i> you sigh, relieved at last of your burden. You lean down and give Penny a hard scratch between the ears. <i>“Good foxslut.”</i>");
		output("\n\n<i>“I’m your little foxslut cumdump,”</i> Penny whispers, pumping her dripping dick. It’s covered in your spunk as well as hers, now, her fingers welcoming the extra lubrication. <i>“[pc.name], you gotta come back and pump me full like that again! Please! I’ll slurp down every last drop like a good girl, I promise!”</i>");
		output("\n\n<i>“Sure, I’ll be back,”</i> you say, grinning. <i>“See you soon, Penny.”</i>");
		output("\n\n<i>“I love you </i>and<i> your cum,”</i> she pants, watching you leave. <i>“Nnnnn..!”</i>");
		output("\n\nYou hear her groaning loudly as you walk away, your eager foxgirl camwhore no doubt right on the verge of orgasm. All too happy to swallow down your loads, it seems - you’ll have to visit her some more soon.");
	}
	else
	{
		output(" Her eyes go wide shortly before you ejaculate all over her face, covering her pretty features in [pc.cumColor] seed. Her wide open mouth is the only place left for you to drain yourself and you do so in spades, [pc.cum] splashing across her outstretched tongue so hard that droplets of it fleck her ears.");
		output("\n\nAll of a sudden she’s jacking off as hard as you are, gulping down your torrential loads of spunk with manic eagerness. Hardly able to keep up with your outrageously bountiful ejaculations she frantically gulps down everything she can as her stomach fills with roiling spunk, her half-hard cock flexing and stiffening once more as if inspired by your feat of virility. The excess slops down her front, splashing across her heaving, jiggling tits and rock-hard nipples.");
		output("\n\n<i>“God damn, Penny...”</i> you groan, watching her lovingly debase herself. It’s plain to see she can’t handle just how much spunk you’re giving her but she doesn’t even care, her mouth stubbornly held open and her tongue lashing at her lips while her throat bobs and works to get it all down. You make sure to give her tiny breaks whenever it starts to run away from her, plastering her fur with sticky spunk instead. She’s absolutely drenched with it, her outline vague beneath the warm coating.");
		output("\n\nPenny doesn’t stop there, though. Briefly lifting a hand to wipe her mouth off, she reopens it to present you with a clear target and you can’t help but grin. She’s insatiable. Cum drips from her snout thanks to the overflow in her mouth and she ignores it, beating herself with increasing pace until you hear a wet, gurgling moan and she cums across the sheets, her seed mixing with your own. Her ejaculation is much less bountiful than yours but apparently every bit as pleasurable, the former officer’s hips jerking and bucking wildly while she cums her brains out.");
		output("\n\nWhen at last you finish cumming, it doesn’t look like anything in her room is left untouched. Even the red light of the camera is spattered with it, glowing in muted fashion beneath the thin layer of spunk. Penny herself is <i>soaked</i>, her mess of red hair and orange fur dripping with your essence. Knowing her, she’s going to be a wreck for the next day or so while she jacks herself off to the scent of it all over and over.");
		output("\n\nYou give the camera a wink and affectionately squeeze Penny’s snout, a vague sense of amusement washing through you when it dribbles cum down her chest. You’ve certainly left your mark on her in more ways than one.");
		output("\n\n<i>“I’m gonna go, Penny,”</i> you tell her. <i>“Thanks for the fun.”</i>");
		output("\n\nYou’re not sure whether her reply is an orgasmic groan of assent or just the sound of her slurping more cum down, but either way she seems to want to see you again. You might just have to indulge her.");
	}
	processTime(25);
	pc.loadInMouth(penny);
	penny.loadInMouth(pc);
	pc.applyCumSoaked();
	IncrementFlag("PENNY_CAMJERKED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function pennyHasADifferentIdeaForToday(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	showPenny(true);
	author("B");
	processTime(2+rand(2));

	output("You ask your favorite foxy crewmate if she’s in the mood for a bit of very-unprofessional behavior. You have a very special ‘second-in-command’ that you’d like her to meet.");
	output("\n\nAt the question, Penny, uncharacteristically, stalls. Normally she’s all for getting down and dirty, but this time, she can’t help but glance away and smirk sideways at you, like she’s about to try and ask you out of your first date together or something.");
	output("\n\n<i>“Actually,”</i> she says, <i>“[pc.name], " + (silly ? "real-talk for a second about that, okay" : "can we talk about that for a second") + "?”</i>");
	output("\n\nYou, being the accommodating mate, take her by the hand and sit on the edge of her bed. She wants to have a serious discussion with you about sex, and what sort of mate would you be if you gave her anything less than your undivided attention? You tell her as such.");
	output("\n\n<i>“It’s not–”</i> she laughs, then blushes and looks away from you. <i>“Gods, I don’t know, maybe it</i> is <i>that serious.”</i> She takes a deep breath, in through her nose and out through her mouth. <i>“Okay,”</i> she continues, her voice a little steadier, and her eyes locked to yours. <i>“Listen, I’ve been thinking about, uh, us, ever since we had that talk in my station. About me, um....”</i> She hesitates again and nearly loses her nerve, but, after a nervous swallow, looks at you again. <i>“When I used the L-word with you.”</i>");
	output("\n\nYou chuckle once, well-meaningly, and tell her that you remember that clear-as-day.");
	output("\n\n<i>“It’s just that... well, we’ve had a lot of sex, and it’s all mind-blowing, don’t get me wrong, but....”</i> She struggles with her next few words; a number of syllables escape her mouth, but none of them form anything. <i>“That’s all that we’ve ever had, you know? We’ve only ever had sex.”</i>");
	output("\n\nYou can guess where she’s going with this, but you think she needs to say it herself.");
	output("\n\n<i>“As much as I get off on the whole predator-prey, alpha-omega stuff, [pc.name], I’m still a human at heart. Fucking you is a real treat that I can’t get enough of, but... sometimes, a girl just wants to know that her relationship is ‘real,’ if you get me.”</i>");
	output("\n\nYou smile, tilt your head, and play dumb. You have no idea what she’s talking about.");
	output("\n\nYour teasing gets her to sigh in frustration, but she can’t help but smile along with you, knowing how silly it all must sound. She squeezes your hand and gives your arm a tug. <i>“I want to make love to you, [pc.name]. There, you got me to say it.”</i>");
	output("\n\nYou lift Penny’s hand to your mouth and give it a kiss. Was that so hard?");
	output("\n\n<i>“Ugh, it was</i> torture <i>and you know it, [pc.name]. Can’t you just make things easy between us, for once?”</i>");
	output("\n\nThe first response in your head was more teasing, but, you decide, that’s enough. You pull her to her feet. She wants you to make things easier for her? You have just the idea.");

	addButton(0, "Next", aGreedyPCLovingTheirPenny, vagIdx);
}

public function makingWuvvWiffASexyOfficer(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	showPenny(true);
	author("B");
	processTime(1);

	output("Actually, you were wondering if Penny would like to take things a little slower, like you had when you two ‘officially consummated’ your union as mates. You enjoyed the slower, more sensual pace, and you’d like to be a mate to her again.");
	output("\n\nA low, throaty growl escapes Penny’s throat, and she takes your hand in hers. <i>“I’m liking what I’m hearing, my mate,”</i> she says, and then she closes the gap between you and kisses you on the [pc.lipsChaste]. Only a peck, but also a taste of what’s to come. <i>“I’d love nothing more than being as good to you as you’ve been to me.”</i>");
	output("\n\nYou know exactly how to get the ball rolling between you two...");

	addButton(0, "Next", aGreedyPCLovingTheirPenny, vagIdx);
}

public function yourFoxCamslutWantsToShowYouHowMuchSheAppreciatesYou(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	showPenny(true);
	author("B");
	processTime(1+rand(2));

	output("<i>“Okay... you know what, Furr-LuVurr6699? I will! The next chance I get, I’ll–”</i>");
	output("\n\nPenny, as usual, is in the middle of her camwhore-performance act when you enter her quarters. She’s naked as could be, which is normal, but... her [penny.cockNoun], normally rigid as could be and lodged firmly in her mouth for her to suck her own cum out of, is neither of those things. In fact, it’s sagging somewhat limply in front of her, neglected for what must have been <i>minutes.</i>");
	output("\n\nPenny turns to you once you enter her quarters. <i>“Oh, there [pc.heShe] is!”</i> She flips her gaze back to her monitor. A small chat window is open to one side. <i>“I have to go, lovelies. I’m going to go for it! I’ll let you know how it turns out!”</i>");
	output("\n\nWith that, she ends her show and shuts off her monitor, before turning to you. Her cock, formally limp, is now on the way up, its angle pointing its head at your [pc.chest]. <i>“Okay,”</i> Penny says, taking a deep breath through her nose – her cock lurching again at the smell of her own musk, and she shudders, but remains composed – and she stretches her hand out to you. <i>“I wanna talk with you for a bit, [pc.name].”</i>");
	output("\n\nYou take her hand, but, with your other, grip her fat dick by the underside and you give it a few strokes. You ask her if she’s sure that she only wants to <i>talk.</i>");
	output("\n\nShe winces, her hips bucking her cock into your hand, and a dollop of her pre jets from its tip. It lands a fair distance away from her. <i>“No!”</i> she admits, her eyes crossed and barely focused in your direction. <i>“But that’s... that’s the whole point! Please, come on, let me get a word out before I go nuts and fuck something!”</i>");
	output("\n\nYou do as she asks. Ever since she nearly overdosed on Throbb and her cock got so large that she could use it as a kickstand, she could rarely get out a sentence before she needed to tend to herself a bit. If she wants to put in the effort to try, the least you can do is lend her an ear.");
	output("\n\n<i>“Okay... I gotta get this out before–”</i> She moans, and her dick continues its steady climb upward. It’s like it was a slumbering beast, and your presence roused it to action.");
	output("\n\n<i>“[pc.name], I’ve been calling you my mate for some time, now,”</i> she begins, her eyes on yours – but her gaze continually wavers towards her building erection. <i>“That... you know, that</i> means <i>something. Maybe it was a mistake to take so many shots of Throbb, but you were kind enough to bring me onto your ship so that I didn’t have to worry about my old responsibilities. All I have to do is turn on my camera, and suck, and suck, and suck, and–”</i>");
	output("\n\nHer tongue slips out of her suddenly-parched mouth, and her eyes flit longingly back to her cock, now dribbling her pre at a fairly steady rate, but she still has the composure to speak to you and not shove herself back into her throat.");
	output("\n\n<i>“What you did for me... that’s something that only a mate would do for their mate. You know that I’d always make time for you. You’re special to me. And I was....”</i>");
	output("\n\nHer cock pulsates, and a thick bubble of her fox cum splurts from its tip to the floor halfway across her quarters. <i>“I was hoping that... you and I, we could... make it ‘official,’ you know? Our status as mates? I don’t just want to fuck you, [pc.name], although I fucking love fucking you.”</i> She giggles a bit to herself. <i>“I... well, I know it’d be difficult, with how big I am, but I want to make love to you. I don’t want to just fuck and then wait until the next time we fuck. Nothing intense. No toys or games. No cameras.”</i> She pauses. <i>“Maybe cameras? The lovey-dovey shit has its market. But only if you want.”</i>");
	output("\n\nGiven how much her cock keeps interrupting her line of thought (not that you can blame her. It’s awfully distracting), it clearly took her a lot of effort to say all that. She must want it badly.");
	output("\n\nIt would be wrong of you to turn down a request like that as her mate. She has a need, and your duty as her other-half is to ensure she has want of nothing. You tell her that, if she wants to try something slower, you’re all for it – but she needs to make the first move.");

	addButton(0, "Next", pennyGonnaFuckHerLover, vagIdx);
}

public function timeToLoveAFoxCamwhore(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	showPenny(true);
	author("B");
	processTime(1);

	output("You place your hand on the topside of Penny’s enormous cock and push it down, out of the way between you two. You can’t resist giving it a stroke or two, which makes Penny freeze and moan in pleasure, but you know what you want, and you stop before you get carried away.");
	output("\n\nYou tell Penny that you enjoyed when you two had that slower, more sensual moment, when she was lucid enough to have a heart-to-heart with her mate. She may have more cock than an elephant, but that’s not going to stop you from loving your mate the way a mate should love their better half. Still, she needs to want it, too, and she needs to say it.");
	output("\n\n<i>“Oof,”</i> Penny grunts, her hips unintentionally bucking into your hand. <i>“I may be a horny, drugged-up fox with a cock that has my body weight, [pc.name], but I still know how to be a good mate.”</i> She reaches for your hand, and she grasps it gently, bringing you to her. For a split second, you can see in her eyes that she forgot all about her log of a cock – but only for a second. <i>“I’d love nothing more than to cum and feel like I’ve</i> earned<i> it with you.”</i>");

	addButton(0, "Next", pennyGonnaFuckHerLover, vagIdx);
}

public function aGreedyPCLovingTheirPenny(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	showPenny(true);
	author("B");
	processTime(3+rand(3));

	output("Everyone knows that the best way to start a good lovemaking session is with a kiss.");
	output("\n\nYou close the gap between you and Penny, your hands gingerly finding both of hers and giving them a gentle squeeze. She laughs once, a nervous, shy laugh: the type of laugh that tells that, beneath that hardened UGC-officer exterior with tons of gene mods, is a nerdy human girl that loves anime and probably isn’t used to letting down the walls around her heart.");
	output("\n\nIt’s not a process that should be rushed. You lean in,");
	if (pc.tallness > penny.tallness + 4) output(" your gaze turned downward");
	else if (pc.tallness > penny.tallness - 4) output(" your forehead against hers");
	output(" your gaze turned upward");
	output(", your nose touching hers – it’s obvious what you want, but it’s not something for you to take. It’s something for her to give.");
	output("\n\nAnd give it, she does: she leans in across those last few inches and meets your [pc.lipsChaste] with hers. It’s a chaste, tongue-less kiss, but with all the energy and promise of much, much more: she kisses you once, then pulls her lips away and kisses you again, and again, and again. She lets go of your hands, only to grab your wrists and direct them to her thighs, towards her rear side, where her tail is giddily swishing from side to side.");
	output("\n\nAfter what must have been the two-dozenth kiss, she pulls away, your noses booping into each other and not letting go, and laughs again, more of a giddy giggle than before. Her hips sway against your hands, subliminally directing them this way and that, and her clenched thighs press against yours. You can feel her dick, straining against " + (penny.armor is UGCUniform ? "her officer’s uniform" : "her shorts") + ", telling you exactly how ready she is to get right to business – but, as horny as her body might be, you know that her heart yearns for a bit more.");
	output("\n\nYou raise your hands up along her curves, to the underside of her arms, and then you sink to your [pc.knees], dragging your fingers back down with you. You’re face-to-face with her crotch – fully-clothed and concealed, but bulging and straining to contain the prize within. Her eyes on you and your every movement, and she unconsciously holds her breath at what you’ll do next.");
	output("\n\nYou keep your gaze on hers right back as you lean in, slipping your [pc.tongue] out and tracing the crown of her cock’s head along the tight fabric of her pants. It’s easy to tell exactly where the head is, and you deliberately avoid it right up until you pucker your lips and give it a decidedly-less-chaste kiss. Your reward is a muffled gasp through Penny’s clenched teeth; a jerk in her pants; and a salty, damp spot, right where your lips were. You kiss the spot again.");
	output("\n\nYou slide yourself up a bit, your tongue lazily trailing behind you along the fabric of her " + (penny.armor is UGCUniform ? "pants" : "shorts") + ". The fabric tastes dry and it feels unpleasant against your tongue, but the show isn’t for your benefit, and from the way Penny is damn near shaking on the spot in anticipation, it’s having all the effect you had hoped for. You hope she enjoys what you have in mind next.");
	output("\n\nThe journey ends with your nose against her abdomen and your [pc.lipsChaste] at the waistband of her " + (penny.armor is UGCUniform ? "police uniform" : "shorts") + ". You nestle your nose up against her abs a little bit, tickling her tummy furs, which makes her gasp out a lustful laugh. She leans backward a bit, giving you better access to her waistline.");
	if (penny.armor is UGCUniform) output("\n\nFirst, you undo the button of her pants with your fingers. You might be trying to seduce her, but you doubt that you have the dexterity in your [pc.tongue] to undo that with just your mouth. With that done, though, you find the pull tab of her zipper: you easily lick that into place between your front teeth,");
	else output("\n\nCraning your neck back a bit, you nip at the hem of her shorts with your teeth, trying to grip at the waistline there. It takes a few tries, with Penny giggling and rocking her hips against you the whole time, but eventually, you manage to hook your front teeth into her waistband,");
	output(" and you pull downward, bringing her lower clothes along with you.");
	output("\n\nThe hump of her rock-hard cock is a bit of a struggle for you to get over, but that just means you have to pull down one side of her pants, then the other, then back again, with nothing but your teeth the whole way. Penny’s hips swish along with you, subconsciously trying to direct her dick into your mouth, a scant half-inch away and covered by some inhibiting fabric – something you’re trying to fix.");
	output("\n\nWhile you’re at work undressing her, Penny gets to work taking her top off. " + (penny.armor is UGCUniform ? "It’s a bit of a struggle getting her tough bulletproof vest off first, but once that’s off, the top and undershirt of her uniform slide off easily" : "She doesn’t try to make a show of it like you are for her: she just grabs the lower hem of her shirt and gives it a yank straight up and off her body, baring her torso to the room") + ". Her bra is next to come off, and with it, her perky, pink nipples bounce in time to her beating heart, unimpeded and on display, just for you. It’s up to you to get the rest of her naked.");
	if (pc.isNude()) output("\n\nThankfully, you don’t have to focus on any of that yourself: your nudist tendencies already have you ready and prepared for what’s coming next.");
	else
	{
		output("\n\nThat reminds you: you still need to get naked yourself! It’s a bit arduous to multitask worming Penny’s pants off herself while");
		if (pc.hasUpperGarment() && pc.hasLowerGarment())
		{
			output(" shuffling out of your own [pc.lowerGarments]");
			if (pc.hasArmor() || pc.hasUpperGarment()) output(", and it’s a bit frustrating that you have to pull away to yank off your [pc.upperGarments]");
		}
		else if (pc.hasArmor() || pc.hasUpperGarment()) output(" pulling your [pc.upperGarments] off you while minimizing your time away from her");
		output(", but, eventually, you’re as naked as she is – almost. Your efforts have her " + (penny.armor is UGCUniform ? "pants" : "shorts") + " fall into a clump around her ankles, but there’s one last bit of fabric between you and her.");
	}
	output("\n\n<i>“[pc.name],”</i> she huffs, one of her hands on your head and the other behind her back, desperate to not touch you, or herself, or her panties, in a bid to let you finish on your own speed. You repeat the process as before: you press your nose into her abdomen, which gets to her sigh in barely-contained delight; you manage to hook your teeth into the waistband of her underwear (it takes a few more tries than before); and, as you slide them down off her waist, you reveal the beet-red beast within, hard as a rock and <i>dripping</i> with excitement to finally meet you eye-to-eye.");
	output("\n\nYou deliberately line yourself up so that her penis is directly beneath your nose as you go. Your every breath through your nose is inundated with her musky smell, wafting up from between her thighs and between her crotch, and your every breath through your mouth is tinted with a hint of Penny’s unique, masculine taste. When you manage to pull the waistband over that last little bit and across the event horizon of her rising cock, it springs upward, slapping you in the nose and spurting a bit of her pre right across your lips.");
	output("\n\nHer panties join her " + (penny.armor is UGCUniform ? "pants" : "shorts") + " on the floor around her ankles. You keep your eyes on hers and you exaggeratedly lick along the underside of her bloated, throbbing cock; you can feel every excited beat of her heart through her " + (penny.hasCock(GLOBAL.TYPE_VULPINE) ? "red fox-cock" : "bloated horse-cock") + ", but you neglected the head, and instead drag your [pc.tongue] across your upper lip, licking up the spurt from earlier. The sight gets Penny to wince, and her cock bloats in front of you, depositing another overeager splurt onto your mouth. You clean it again and stand before she can keep making a mess of you.");
	output("\n\nYou pull yourself back to her, your hands on her hips and your nose to hers. You’re both naked as can be, and her cock is standing rigid between you two");
	if (pc.hasCock()) output(", grinding itself against yours. You can feel her pre dribble from her tip and trail a slimy trail down her length of your own tool");
	else if (pc.hasVagina()) output(". You can feel the heat of her balls against your [pc.vagina], and you’re sure she can feel the heat of your own sex against hers, warming her sack");
	output(". With the taste of her pre still tingling your tongue, you ask her what comes next.");

	addButton(0, "Next", pennyGonnaFuckHerLover, vagIdx);
}

public function pennyGonnaFuckHerLover(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	showPenny(true);
	author("B");
	processTime(35+rand(26));

	var ruttingPenny:Boolean = (flags["PENNY_THROBB_USES"] != undefined && flags["PENNY_THROBB_USES"] >= 3);

	// Continue here if Penny is Overdosed and the PC is wearing anything
	if ((pennyIsCumSlut() || penny.isBimbo()) && !pc.isNude())
	{
		output("Penny’s already naked as can be, and she doesn’t need any seducing to get her ready. The one holding up the party is you.");
		output("\n\nStill, you try to not rush things, and you make a show of");
		if (pc.hasUpperGarment() || pc.hasArmor())
		{
			output(" taking off your [pc.upperGarments], playing with the bottom hem and lifting it just above your navel. Penny licks her lips at the sight, and her hands fidget, eager to touch herself to you, but she resists, even when you pull your [pc.upperGarments] up and over your [pc.chest]");
			if (pc.hasUpperGarment() && pc.hasLowerGarment()) output(". From there, you start");
		}
		if (pc.hasUpperGarment() && pc.hasLowerGarment()) output(" sashaying your [pc.hips], sliding your [pc.lowerGarments] off, one hip at a time. It doesn’t take long until you’re naked from the waist-down, too, showing off your " + pc.cockAndVagina("[pc.cock]", "[pc.vagina]", ", which overshadows your ") + ". At that, you’re totally naked, and ready for anything Penny could ask of you.");
		output("\n\n");
	}

	output("She doesn’t have words for you; instead, she places both of her soft hands on either of your cheeks and leans into you, giving you another, longer, and more ‘intent’ kiss: her tongue courses out, seeking your own to play with in your mouth, and they dance while Penny’s hips thrust forward, her cock grinding up against your navel.");
	output("\n\nAs passionate as the kiss is, it isn’t particularly long-lasting: after only a few moments of tasting you, she pirouettes you both so that your back is to her bed. She pushes you back, and you trip against the edge of her mattress, your [pc.ass] coming down with a soft ‘floomp’ onto the covers. Penny is with you the whole way: she straddles your [pc.hips], her knees on the bed on either side of you, and with another push, you’re on your back, with her on top of you.");
	output("\n\nPenny hisses through clenched teeth as her body humps against yours on her descent. Her pointed nipples press into your [pc.chest] and her cock grinds into your [pc.belly]");
	var groinToChest:Number = .7*pc.tallness - .4*penny.tallness;
	if (penny.cLength() > groinToChest - 3 && penny.cLength() < groinToChest + 3) output(", and its head finds itself good and nestled " + (pc.hasBreasts() ? "into the underside of your cleavage" : "against your pectorals"));
	output(". You feel it pulse against your body, leaving warm, slimy trails of her pre wherever it happens to flop.");
	if (ruttingPenny) output(" Penny is shaking with barely-repressed lust, and you can tell that some part of her wants to skip the whole thing and shove her titanic cock into you somewhere, but she’s putting in a champion’s effort into making the sex slower and more emphatic.");
	else output(" She moans and bucks her hips again – normally, by now, you two would be fucking like dogs (or, at least like foxes), but she’s trying to fight her instincts and take it much more slowly than she’s used to. You admit to yourself that you kind of like the more nuanced approach, and from the shivering, moaning, and occasional giggling, you can tell she likes it too.");
	output("\n\nAll that said, she’s the one on top, and if she doesn’t stick herself <i>somewhere,</i> she might explode.");
	output("\n\nYou reach down between you two and grab her hand in yours");
	if (ruttingPenny) output(" – a more difficult action than you had thought, given how haphazardly she’s frotting herself against you –");
	output(" and you guide it to her");
	if (penny.hasCock(GLOBAL.TYPE_VULPINE)) output(" red,");
	output(" throbbing cock. She moans and bucks again, fucking your combined hands, but she stops");
	if (ruttingPenny) output(" after about a dozen thrusts");
	output(". With her tool firmly in hand");
	if (ruttingPenny || penny.hasCock(GLOBAL.TYPE_EQUINE)) output(", you push at her stomach, drawing her back so you have more room between you two. Then");
	output(", you shift yourself, wrapping your [pc.legOrLegs] up and around her lower back, pushing your [pc.vagOrAss " + vagIdx + "] against her beading cock’s head.");
	output("\n\nJust before she inserts herself, she lowers her head into the crook of your neck, giving you a gentle, loving kiss, to punctuate just how much this moment means to her. With that done, she bucks her hips once, and she slides into you.");

	//pc.cuntChange/buttChange as appropriate
	if (vagIdx < 0) pc.buttChange((penny.cockVolume(0) > pc.analCapacity() ? pc.analCapacity() + .16*penny.cockVolume(0) : penny.cockVolume(0)));
	else pc.cuntChange(vagIdx, (penny.cockVolume(0) > pc.vaginalCapacity(vagIdx) ? pc.vaginalCapacity(vagIdx) + .16*penny.cockVolume(0) : penny.cockVolume(0)));

	output("\n\nIt’s not a new sensation for either of you. Neither of you are unfamiliar with how it feels to be together. But there’s something tangibly different this time: you aren’t fucking Penny Inoue, the gene-modded fox woman that likes to play to the pack mentality of there being an ‘alpha’ of a group, or that you and she are ‘mates.’ You’re making love to Penny Inoue, the shy human that struggled to find someone that accepted her for who she was and what she wanted to be. It’s less that she’s inside you, and more that she’s <i>with</i> you.");
	output("\n\nPenny’s arms wrap around you, and she buries her muzzle into the crook of your neck. Every part of her clenches and tightens on you and around you – her legs, her arms, her stomach, her thighs, her chest – as she holds you like you’re her teddy, and that you give her comfort and protection when she needs it most. The clenching comes with another thrust, sinking herself deeper into you, but it’s more of a by-product than an intentional action.");
	output("\n\nYou respond in kind, keeping your limbs wrapped tightly around Penny’s body. You thrust your [pc.hips] against her, sucking more of her thick fox cock into your [pc.vagOrAss " + vagIdx + "], letting her know with your body that you like that, and you need more of it. Your fingers stroke at her hair, and you kiss her cheek, imploring her for more.");
	output("\n\nAnd more she gives: she wouldn’t have come this far just to stick it in and do nothing. The sound of her quarters is filled with the gentle clapping of the fur of her crotch against your [pc.skinFurScales]. You can feel her fuzzy testicles slap against your body, churning with a load you’re sure will make your body as full of her love as your heart.");
	if (penny.cockVolume(0) > pc.vaginalCapacity()) output(" She’s got so much cock that you doubt she’ll ever get more than half of herself into you, which is a shame, but at this point, the sex is as much about emotional gratification as it is sexual. What’s important is that it’s happening.");
	else if (penny.hasKnot()) output(" You can already feel her knot battering against your entrance, and at this point, it’d be a disappointment if you didn’t take <i>all</i> of her into yourself. Not that that should be overly important to either of you, but love making is just as much sexual gratification as it is emotional.");
	output("\n\n<i>“[pc.name],”</i> Penny whispers to you through battered, uneven breaths. It’s not frantic or intense sex, but from the way her heart is beating in her chest, it’s as taxing all the same. She hesitates on what to say next, then gives up and settles for a long, shuddering sigh. It’s all the information you need: it’s pleasurable for her.");
	output("\n\nYou run a hand down her back, feeling how tense it is. Your fingers dig into her short fur, tickling at the soft skin beneath it, and you feel every rise and fall of her body as she humps into you. You feel her warm breath against your neck; her heartbeat against your chest; and her cock pump another fresh shot of pre consistently into your [pc.vagOrAss " + vagIdx + "] with every single hump of herself inside you. And, to top all that off, you can feel her cock bloat inside you too....");
	output("\n\nYou tell her that you’re ready, and that you want it. You blow into her oversized ear and nibble at its edge, pinching onto its rim with your [pc.lipsChaste] only. Your limbs tighten around her, holding her closer, and you buck your hips up against her–");
	if (penny.hasKnot()) output("\n\nPenny times your hump against her with a push of her own, and your [pc.vagOrAss " + vagIdx + "] spreads past the point of no return around her knot: either you’re taking it all, or it all ends now, without either of you truly being satisfied. You push against each other, and you feel your body meld and strain against her throbbing cock, to take it all into yourself. You want it, and you don’t stop, until you clear the crest of the fattest part of her knot and you slip to her base, locked and tied to her for good.");
	output("\n\nThen, of course, comes the flood: her cock flexes inside you, and you feel her cum unleash inside you in warm, thick gouts, one blast after the other. The heat of her seed starts at your connection, where her cock meets your [pc.vagOrAss " + vagIdx + "], and then blooms to your abdomen and your spine as she fills you up. Penny winces and shakes through the whole thing, and with how tightly she’s holding you to her, you feel like she might crush you. But that’s okay; you want <i>all</i> of her, and if that means she squeezes you like you’re a lifesaver in a hurricane, then that’s what it means.");
	output("\n\nYou were just as close, and the feel of her cum inside you is more than enough to send you over the edge: your [pc.vagOrAss " + vagIdx + "] clenches tightly onto her, further ensuring that not a single drop of her creamy cum seeps out from between you two. You squeeze onto her like a vice: your muscles contract and pull, desperate to slurp up as much of her seed as you can, and with every rock of your body against hers, you can feel her seed pool and seep deeper into your body. You can feel your [pc.belly] round out with her thick load, and " + pc.vaginaAndCock("images of it taking inside you, knocking you up, and preparing you for what it <i>truly</i> means to be a mate to her, come unbidden, but welcome all the same.", "your [pc.cock] tenses between you, pressed against both of your stomachs, and your [pc.cum] shoots between you both. Your rocking and humping against each other gets warm, wet, and sticky, but honestly, compared to the orgasm rocking through your [pc.vagOrAss " + vagIdx + "], you hardly care, and you doubt she does, either.", " Apropos of your fantasies, though, "));
	output("\n\nEven after you feel the last of her jizz unload inside you, Penny continues to shake and gyrate, her orgasm still rocking her from her scalp to her toes and all the way along her spine. The feeling is mutual: this being a slower, more tender, and more impactful moment with Penny has made your orgasm last so long that it saps the energy right from your body, until you’re little more than a satiated, [pc.race]-shaped puddle beneath her.");

	if (vagIdx < 0) pc.loadInAss(penny);
	else pc.loadInCunt(penny, vagIdx);
	pc.orgasm();
	penny.orgasm();

	addButton(0, "Next", doneLovinPennyForNow, ruttingPenny);
}

public function doneLovinPennyForNow(ruttingPenny:Boolean):void
{
	clearMenu();
	clearOutput();
	showPenny(true);
	author("B");
	processTime(55+rand(66));

	output("You awake to the sensation of gentle, repeated kisses against your neck. You blink your eyes open, and it takes you a moment to remember where you are and what you were doing. You must have passed out from the whole ordeal.");
	output("\n\n<i>“Rise and shine, mate,”</i> Penny whispers to you, and then nibbles on your ear, just like you had done to her. Your lower body is wet, and you don’t feel her inside you – she must have gone soft in the time since you’ve blacked out, and, given how effective " + (penny.hasCock(GLOBAL.TYPE_VULPINE) ? "Throbb is at what it does" : "Synth Sheaths are at what they do") + ", that must be her spare jizz leaking out of you that you’re feeling.");
	output("\n\nStill, you’re not so indisposed that you can’t return her affections. Your hands find her hair and her shoulder, and you stroke at them while you kiss her back.");
	output("\n\n<i>“Did I ever need that,”</i> Penny tells you. She shifts her body against you, peeling her fur away from your [pc.skinFurScales], but only to readjust herself on top of you. <i>“" + (ruttingPenny ? "I haven’t been able to think this straight since before all those shots of Throbb. You managed to get the horny out of me.”</i> She giggles. <i>“For a few minutes, anyway." : "After all this time, I can hardly believe that</i> that <i>was what I was missing out on. And now, I don’t know if I can live without it.") + "”</i>");
	output("\n\nYou spend the next few minutes basking in each other’s afterglow. Honestly, you wouldn’t mind going right back to sleep in the arms of your lover, but, unfortunately, the world continues to turn, with or without you. You take your time pulling away from her, and you sit at the edge of her bed.");
	output("\n\nBefore you stand, Penny wraps her arms around your shoulders and loosely holds you to her, her hands at your stomach. She kisses at your neck once, and then just... holds you there. She wasn’t totally ready to give you away.");
	output("\n\n<i>“I enjoyed this, [pc.name]. More than you might think.”</i> She nuzzles her nose against you and sighs, taking your scent into her nose. <i>“Let’s not wait so long to do this again, okay? Fucking is great and all, but....”</i> She sighs and rests her cheek against your shoulder. <i>“Sometimes, even a girl with a dick needs to be held tightly and be told she’s loved, you know?”</i>");
	output("\n\nYou rest your cheek against hers and tell her that it’s a promise.");
	if ((pennyIsCumSlut() || penny.isBimbo()) && !pc.isNude()) output(" She helps you get dressed");
	else if (!pc.isNude()) output(" You help each other get dressed");
	else output(" You help her get dressed");
	output(", more as an excuse to keep spending time together than because either of you need the help.");
	output("\n\nBefore you leave her quarters, you step into her personal space again, your hands on her hips, and you kiss her. It’s quick, but passionate, and when you pull away, you tell her that you love her.");
	output("\n\n<i>“I love you too, [pc.name],”</i> she says, her eyes curling into crescents above her smile.");
	output("\n\nAt that, you step outside, back to your ship.");

	IncrementFlag("PENNY_MADE_LOVE");

	addButton(0, "Next", mainGameMenu);
}

//Syri & Penny stuff:
public function pennySyriPornText():String
{
	var smut:String = "When the video starts it’s immediately apparent that the thumbnail must have taken place later on, because Syri is nowhere to be seen and Penny is jacking the <i>fuck</i> out of her veiny, turgid cock. Her head turns up, towards the ceiling, and her hips rise into the air as she pounds the daylights out of an imaginary partner for the benefit of her stream viewers. Creamy spunk flies from the end of her";
	if (penny.cocks[0].cType == GLOBAL.TYPE_EQUINE) smut += " swollen flare, her bloated cumvein thrumming with life";
	else smut += " tapered tip, her bitch-knot swollen in need";
	smut += " while an ecstatic, giggly moan comes from between her lips, utter bliss written across her features.";
	smut += "\n\nThe toy she was using lies in her left hand while Penny’s overeager semen continues to fountain from her burgeoning";
	if (penny.cocks[0].cType == GLOBAL.TYPE_EQUINE) smut += " studprick";
	else smut += " dogdick";
	smut += ", splattering her surroundings in a manner reminiscent of thick, heavy rain. It’s clearly not the first time she’s cum during this streaming session, relatively fresh seed soaking her sheets almost everywhere you look -- hang on, that toy looks familiar...";
	smut += "\n\nPausing the video for a moment and trying to ignore the way";

	if (pc.isHerm())
	{
		smut += " your [pc.cocks]";
		if (pc.hasCocks()) smut += " throb";
		else smut += " throbs";
		smut += " with arousal while sexual juices drip down your [pc.thighs] from your [pc.pussies]";
	}
	else if (pc.hasCock())
	{
		smut += " your [pc.cocks]";
		if (pc.hasCocks()) smut += "are";
		else smut += "is";
		smut += " are half-erect";
		if (pc.isCrotchGarbed()) smut += " in your [pc.lowerGarments]";
	}
	else if (pc.hasVagina()) smut += " sexual arousal is dripping down your [pc.thighs]";
	else smut += " your rising arousal creates an uncomfortable heat inside you";

	smut += ", you zoom in on the contents of her trembling fingers.";
	if (silly) smut += "\n\n<i>“Enhance,”</i> you mutter to nobody in particular.";
	smut += "\n\nThat sneaky little foxslut! She’s nabbed Syri’s biona-pussy from";
	if (flags["SYRIQUEST_SYRI_ONAHOLE"] == 1) smut += " your room!";
	else smut += " her room!";
	//dunno: storage!}
	smut += " Zooming back out to fully appreciate the still picture for a moment, you look at Penny’s face. Yup -- that’s pure, brazen ecstasy right there. Unpausing the video and letting it run, Penny puts voice to the first coherent words she’s managed so far.";
	smut += "\n\n<i>“Hooohhh, fuck...”</i> she moans, the tension in her body fading but the stiff, throbbing erection of her cock not budging an inch. <i>“I fucking love this toy </i>so much</i>! Like, oh my god, guys!”</i>";
	smut += "\n\nYou realize she’s addressing her stream viewers, of which you can only imagine there’s at least a few thousand minimum. With her giant, cum-slick rack and her sweaty hands squeezing at her still-dripping cock, she’s got to be a popular pick.";
	smut += "\n\n<i>“This fucking pussy is sooo good!”</i> Penny cries, lifting it up for the stream to check it out and putting her thumb in to spread the lips. A warm deluge of her own wasted sperm pours out, splattering across her heaving tits. She doesn’t seem to notice. <i>“Don’t tell anyone but it’s actually my friend’s! And I don’t mean like, a toy. I mean it’s her real, actual pussy!”</i> A big grin spreads over her face. <i>“But shh! She’s a fucking hot ausar babe and I don’t want her to be mad at me.”</i>";
	smut += "\n\n<i>“Bit late for that,”</i> a voice from off-camera says, laced with annoyance. <i>“Damn it, Penny!”</i>";
	smut += "\n\n<i>“Syri!,”</i> Penny yelps, throwing her well-loved toy into the air in surprise. <i>“Oh my gosh!”</i>";
	smut += "\n\n<i>“Don’t say my name on stream! Ugh,”</i> Syri groans, stepping forward into the room. <i>“And don’t just take my... my... ugh, jeez. How much are you using this thing?”</i>";
	smut += "\n\n<i>“You mean your pussy?”</i> Penny asks, looking up at Syri with a face incapable of guile. <i>“How much am I fucking your pussy?”</i>";
	smut += "\n\n<i>“<b>Yes</b>, how much are you fucking my pussy,”</i> Syri seethes.";
	smut += "\n\n<i>“Oh my gosh, like soooo much,”</i> Penny says, bursting into peals of giggles as she picks it back up and hugs it to her breasts. <i>“I love it! I only found it like a little bit ago and now it’s my favorite! U-um,”</i> she says hesitantly, searching for approval. <i>“Do you wanna... watch me use it?”</i>";
	smut += "\n\nSyri stands stock-still, her expression unreadable but her cheeks reddening faintly. This is <i>not</i> unfolding how you expected it.";
	smut += "\n\n<i>“Fine,”</i> Syri snaps, though her anger seems subdued. She crosses her arms and settles against the closed door behind her, leaning against it. <i>“Show me what you got.”</i>";
	smut += "\n\n<i>“Oh my gosh,”</i> Penny squeals, all smiles and happiness. <i>“I gotta special treat for you guys! I’m gonna fuck this pussy while the owner watches!”</i>";
	smut += "\n\n<i>“Are you talking to your stream?”</i> Syri asks, nodding at Penny’s little laptop.";
	smut += "\n\n<i>“Uh huh,”</i> Penny says softly, rubbing the toy against her";
	if (penny.cLength() < 12) smut += " iron-hard dick.";
	else smut += " towering cock.";
	smut += " <i>“They loOoOoOve watching me fuck... don’t you, cuties? Hey,”</i> she says suddenly, realizing the situation. <i>“You’re like a real life stream-watcher right now! That’s so hot! Ohmygosh, it’s like I’m fucking in front of you guys for real!”</i>";
	smut += "\n\n<i>“Well? I’m waiting,”</i> Syri mutters, rubbing the bridge of her nose.";
	smut += "\n\n<i>“Okaaaay!”</i> Penny chirps, lifting Syri’s former cunt to";
	if (penny.cocks[0].cType == GLOBAL.TYPE_EQUINE) smut += " the subdued flare of her horsecock.";
	else smut += " her pointed cocktip.";
	smut += " The owner looks on with blatantly apparent interest, no matter what her body language might be saying otherwise.";
	smut += "\n\n<i>“Uuuuuhhhhnnnn,”</i> Penny groans, slipping the opening over her cockhead. <i>“Oh, fuck, I love how tight it is...”</i>";
	smut += "\n\nSyri’s ears noticeably twitch and perk up at that, though she says nothing. Penny slowly lifts her hips, sliding deeper into the toy like she were entering a familiar lover, moaning softly all the while. When she pulls herself back out you can actually see how much the pussy physically clings to her -- the cute little lips <i>grip</i> her vein-covered cock as though they need her back inside, an impulse Penny is only too happy to oblige.";
	smut += "\n\nA shuddering groan escapes her lips as she thrusts herself back inside, leaning back against her pile of pillows and starting to one-handedly fuck herself with Syri’s bionahole. Her earlier orgasms have lubricated it to the point where it flawlessly glides up and down her length though even if they hadn’t, it’s plain to see how much Syri’s pussy is juicing itself. Translucent fluid <i>coats</i>";
	if (penny.cLength() < 12) smut += " the entirety of Penny’s prick, rolling down her own flared pussylips.";
	else smut += " the majority of Penny’s shaft, rolling down and dripping to the bed.";
	smut += "\n\n<i>“O-okay,”</i> Syri stammers, holding an arm out. <i>“Wait! Y-you can hang onto it, it’s fine. I have to, to go. And uh, mail me the stream address later! So- so I can make sure you’re not misusing my- my pussy...”</i>";
	smut += "\n\n<i>“Aw, okay! Bye, Syri!”</i> Penny says cheerfully, waving as the ausar girl leaves, almost doubled over and walking funny. Poor girl. You’re not sure what she expected out of Penny, but she probably wasn’t imagining it would be quite <i>that</i> lewd...";
	smut += "\n\n<i>“Mmmm, time to finish up,”</i> Penny murmurs, lovingly gripping the toy clenched around her dick. It looks harder than some bulkheads you’ve seen. <i>“Ooohhhh...”</i>";
	smut += "\n\nThe next ten minutes of the stream are a display of sexual hunger like you rarely see it. Penny places the toy on the bed and holds it there with one hand, rolling her foxy hips hard enough to send sweat droplets flying with every thrust, rutting her ‘partner’ from above with sexy moans and grunts. She’s <i>working</i> that pussy so expertly that its redfaced owner would no doubt blow a load in her pants were she to see it.";
	smut += "\n\nThe climax of the clip comes when Penny, dripping with sweat and moaning so loudly you’re surprised you couldn’t hear her in the ship yourself, finally blows her load right into the toy. Seed gushes out from around her throbbing cock in pulses, Syri’s stretched-out cunt spurting foxspunk all over Penny’s sheets as it’s filled to capacity in an instant. She lets out a long, orgasmic groan of joy and topples over onto the toy, still absently bucking her hips into the bed, grinding against it.";
	smut += "\n\nPenny lies there for a couple of minutes, breathing hard, before the clip ends with her turning towards her webcam and smiling. She looks like she’s won a race.";
	if (flags["PENNY_SYRIVAG_WATCHED"] == undefined) smut += "\n\nYou tear yourself away from the video eventually, though you’ll file this away for... later perusal. Captain’s privilege.";

	return ParseText(smut);
}

public function pennySyriOnaholeVid():void
{
	clearMenu();
	clearOutput();
	showBust(pennyBustDisplay(true), syriBustDisplay());
	showName("PENNY\n& SYRI VID");
	processTime(18);
	pc.lust(75);

	output(pennySyriPornText());

	addButton(0, "Next", mainGameMenu);
}

//Badger & Penny stuff:
	
	