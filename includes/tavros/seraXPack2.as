/* Sera: The Bitchening */

/*

New Flags:
SERA_CREWMEMBER					Sera’s crew member status (0 - off ship, 1 - on ship)
SERA_OBEDIENCE					Sera’s obedience score
SERA_OBEDIENCE_MIN				Sera’s obedience minimum score
SERA_OBEDIENCE_MAX				Sera’s obedience maximum score
SERA_MERCHANT					Sera’s merchant flag
SERA_BUSINESS_SETUP				Timestamp in days for Sera’s new business
SERA_REPAID_LOAN				Debt repayment for Sera’s new business

*/

public function seraRecruited():Boolean
{
	return (flags["SERA_CREWMEMBER"] != undefined);
}
public function seraIsCrew():Boolean
{
	if(seraAtNursery()) return false;
	return (flags["SERA_CREWMEMBER"] == 1);
}
public function seraAtTavros():Boolean
{
	if(seraAtNursery()) return true;
	return (flags["SERA_CREWMEMBER"] == 0);
}
public function seraIsMerchant():Boolean
{
	return (flags["SERA_BUSINESS_SETUP"] != undefined || flags["SERA_MERCHANT"] != undefined);
}


/* Part 1: Acquiring and Training */

// Sentient Acquisitions
// SUGGESTED: North eastern bend of red light district.
// NOTE: If the Sera sex party thing has been completed successfully (EITHER medium or best outcome) talks carry on as if Acquisitions no longer have her on their books.
public function showTeronAndAttica():void
{
	showBust("ATTICA", "TERON");
	showName("ATTICA &\nTERON");
	
	return;
}
public function sentientAcquisitionsIsOpen():Boolean
{
	if(pc.hasStatusEffect("Sentient Acquisitions Closed")) return false;
	return true;
}
public function sentientAcquisitionsBonus():Boolean
{
	clearOutput();
	author("Nonesuch");
	
	if(flags["ENTERED_ACQUISITIONS"] == undefined)
	{
		showBust("ATTICA", "TERON");
		
		output("With a slight amount of apprehension you pass through the pale glare of the shop’s facade. The interior is done up in a sharp, minimalist chic, all polished wood floors and spindly furniture done up in blacks, whites and grays. On either side of the counter two tall, insectile humanoids are standing face-to-face. Their faces are pale skinned and their limbs armored in black chitin, the same color as their liquid, pupil-less eyes. They are good looking in an austere, androgynous kind of way, complimented by their sharp business dress. If they’re conversing, they’re doing it very quietly. They each have a ruff of wide, diaphanous feathers around their necks that flutter at each other vigorously, like hummingbird wings. There’s something not quite right about them; their movement distracts and tugs at your eye, insisting you look at them closer. Color spreads across and below the shimmering surfaces, impossibly thin and infinitely deep at the same time...");
		output("\n\nThe two creatures seem to notice you and in a single movement brush their feathers back, clipping them behind their necks into some sort of hood attached to their shoulders.");
		output("\n\n<i>“Sorry about that, rue collar, we didn’t see you standing there,”</i> says one in a brisk, dry tone which buzzes slightly at the edges. Your codex beeps urgently.");
		output("\n\n<i>“Tarratch. Semi-restricted insectoid race, noted for ability to transfix sentient beings, psychic feeding habits and proclivity for piracy. Should not be approached under any circumstances.”</i>");
		
		CodexManager.unlockEntry("Tarratch");
		
		output("\n\nThe figure behind the counter wiggles its fingers in mock horror, making the other one laugh.");
		output("\n\n<i>“Yes, rue collar, we’re Tarratch, but we’re not interested in sticking a straw in your ear or in stealing your children. I am Teron, and this is my swarm-mate-partner-sister Attica. We are Sentient Acquisitions’ representatives on this station.”</i>");
		output("\n\n<i>“It is a shame,”</i> goes on Attica. The only difference you can tell between her and her brother is that she has a small insect abdomen above the rise of her behind, and a faintly raised chest discernible beneath her blouse. Her thin and very long tongue flicks in and out of her mouth as she talks. <i>“You are our first customer, but we have nothing much to show you yet. In the future we hope to be able to present to you many fine acquisitions perfectly suited to improve your spaceship, home or business environments.”</i> She deliberately looks you up and down and grins coyly. <i>“And if you do some acquiring of your own out there on the frontier, we can offer rates on freshly appropriated stock which put our rivals to shame.”</i>");
		
		processTime(2);
		
		flags["ENTERED_ACQUISITIONS"] = 1;
		
		// [Acquisitions] [Leave]
		clearMenu();
		addButton(0, "Acquisitions", sentientAcquisitionsAsk);
		addButton(14, "Leave", sentientAcquisitionsLeave);
		
		return true;
	}
	
	output("You enter Sentient Acquisitions. As ever, Teron and Attica are lounging with studied elegance over the counter.");
	output("\n\n<i>“" + (flags["ACQUISITIONS_SLAVE_PURCHASES"] == undefined ? "Yes, rue collar?" : "Our favorite customer!") + "”</i> Teron says, matching grins appearing on the tarratch’s faces as they see you come in. <i>“Is there something you need?”</i>");
	
	addButton(0, "Acquisitions", sentientAcquisitionsAsk);
	
	return false;
}
public function sentientAcquisitionsLeave():void
{
	clearOutput();
	author("Nonesuch");
	showBust("ATTICA", "TERON");
	
	output("As politely as you can, you say you have to be somewhere else.");
	output("\n\n<i>“Of course,”</i> murmurs Teron. He and his sister gaze at you with their black, pupil-less eyes with a kind of amused malice as you make for the door. <i>“But don’t be afraid to come back if ever you want to talk business, rue collar. There will be things here that interest you. Count on it.”</i>");
	
	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
	
	return;
}
public function sentientAcquisitionsAsk(fromBack:Boolean = false):void
{
	clearOutput();
	author("Nonesuch");
	showTeronAndAttica();
	
	if(!fromBack)
	{
		output("<i>“Just to be clear on this,”</i> you say. <i>“By acquisitions, you mean slaves?”</i>");
		output("\n\n<i>“Indentured servants,”</i> Teron corrects. <i>“We pride ourselves on being specialist recruitment consultants, yes. We aim to find our stock positions that they are most well suited for – carefully adjusting attitudes and expectancies where necessary - and treat them with the utmost care whilst they are in our possession.”</i> He clenches his fist and jaw in polite disgust. <i>“The facilities this place used to have were barbaric. They apparently chained their stock up in the basement and pumped them full of addictive pheromones in order to keep them suppressed! Perhaps I should not expect anything better from humans.");
		// PC human-looking:
		if(pc.isHuman() || pc.isHalfHuman()) output(" No offence.");
		output("”</i>");
		output("\n\n<i>“And how do you... acquire them?”</i>");
		output("\n\n<i>“Repossession, mostly.”</i> Attica places a delicate emphasis on “mostly”. <i>“We are silent partners in a number of loan and mod companies. If a mod-happy deadbeat cannot pay their monthly installments... well, it’s difficult to repossess someone’s eye stalks specifically isn’t it?”</i>");
		output("\n\n<i>“The female who sold the rights of this place to us was not just a brute but a fool,”</i> Teron murmurs, a salacious smile spreading across his long, elegant face. <i>“Frontier rushes are a time of hasty business decisions; of people mortgaging themselves to the hilt to come out here with a spaceship; of new, beautiful and deliciously naive sentients. The acquisitions that will be flowing through this spaceport in the months to come will be a wonder to behold.”</i> He sighs. <i>“But right now there is little to try and tempt you with, rue collar.");
		// Sera taken:
		if(flags["SERA_ACQUIRED_DATE"] != undefined) output(" With our problem case gone, we are simply waiting for the trade from the frontier to start trickling in. Come back in a month’s time or so, we’ll have many fresh and exotic pieces of property to show you.");
		// Sera still on:
		else if(!seraRecruited() && seraInDebt()) output(" All we have on our books currently is this horned girl, and that’s a dubious case at best.");
		output("”</i>");
	}
	else
	{
		output("<i>“So... any acquisitions currently available?”</i>");
		output("\n\nTeron reaches a thin arm out and twists a screen mounted on the counter to face you.");
		output("\n\n<i>“As listed, " + (flags["ACQUISITIONS_SLAVE_PURCHASES"] == undefined ? "rue collar" : "friend") + ". Simply select an option and we’ll walk you through the finest possessions on offer.”</i>");
	}
	processTime(1);
	
	var btnSlot:int = 0;
	var acqList:Array = [];
	acqList.push(["Mostly?", sentientAcquisitionsAskMostly]);
	if(flags["SERA_ACQUIRED_DATE"] == undefined && !seraRecruited() && seraInDebt()) acqList.push(["Horned Girl", sentientAcquisitionsAskHornedGirl]);
	
	// [Horned girl] [Mostly?] [Leave]
	clearMenu();
	for(var x:int = 0; x < acqList.length; x++)
	{
		if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Leave", sentientAcquisitionsLeave);
			btnSlot++;
		}
		
		addButton(btnSlot, acqList[x][0], acqList[x][1], btnSlot);
		btnSlot++;
		
		if(acqList.length > 14 && (x + 1) == acqList.length)
		{
			while((btnSlot + 1) % 15 != 0) { btnSlot++; }
			addButton(btnSlot, "Leave", sentientAcquisitionsLeave);
		}
	}
	addButton(14, "Leave", sentientAcquisitionsLeave);
	
	return;
}

public function sentientAcquisitionsAskMostly(btnSlot:int = 0):void
{
	clearOutput();
	author("Nonesuch");
	showTeronAndAttica();
	
	output("<i>“And how do you get the rest of your stock?”</i>");
	output("\n\n<i>“From the frontier,”</i> replies Attica calmly. <i>“Nobody misses pirates. And newly discovered species do not have the same rights as Core-ward races, at least not before the U.G.C. or whoever else signs them up to a bill of protection. They are also an exotic novelty collectors pay highly for.”</i>");
	output("\n\n<i>“We at Sentient Acquisitions merely serve the galactic market interests the best we can,”</i> carries on Teron with a noble air. <i>“but there are some tarratch swarms that are in it for the acquiring itself. Right collars have... certain needs... which rue collar species are perfect for satiating.”</i> The two of them eye you silently for a moment. <i>“If you stumble upon one of our recruitment teams out there on virgin soil, just turn around and let them get on with their business,”</i> suggests Teron dogmatically. <i>“They won’t be interested in you unless you force them to be.”</i>");
	
	processTime(1);
	
	addDisabledButton(btnSlot, "Mostly?");
	
	return;
}

public function sentientAcquisitionsAskHornedGirl(btnSlot:int = 0):void
{
	clearOutput();
	author("Nonesuch");
	showTeronAndAttica();
	
	var inDebt:Boolean = ((seraInDebt() && pc.statusEffectv1("Sera Credit Debt") > 9000) || (flags["SERA_PARTY_INVITE"] == 3 && seraInfluence() <= 90));
	
	output("<i>“Horned girl?”</i>");
	output("\n\n<i>“Yes. Amongst many other things.”</i> Teron plucks a tablet screen off the counter and taps it a few times. <i>“Bought quite a number of expensive mods this human did, and then a shop on this self same station on top of it. ‘The Dark Chrysalis.’ I don’t think she looked at the fine print of her rent agreement closely, if at all. These succulent young rue collars, they never think it’s going to happen to them. Until it does.”</i>");
	if(!inDebt) output("\n\nHe shrugs.");
	output("\n\n<i>“She is heavily in debt, but we’re not minded to chase it yet – we’ve done the due background check on her and by all accounts she would make for a </i>terrible<i> indentured servant. And who knows, maybe her shop really will enable her to pay it down.”</i> His immaculate sneer tells you exactly how likely he thinks that is.");
	if(!inDebt) output(" <i>“And she is currently paid up. Maybe if she’d bought a bunch of stuff over the counter recently, maxed her credit out, we’d start getting more serious with her.”</i>");
	else output(" <i>“Because she’s missed her last couple of monthly installments though, there is a buy-out clause available if you’re seriously interested in owning her.”</i>");
	
	processTime(1);
	
	// [Back] [Buy Out]
	clearMenu();
	// Thinking 15k smackers
	if(!inDebt) addDisabledButton(0, "Buy Out", "Buy Out", "Perhaps if you pushed a certain someone further into debt somehow, this might become possible?");
	else if(pc.credits >= 15000) addButton(0, "Buy Out", sentientAcquisitionsBuyOutSera, undefined, "Buy Out", "Buy out Sera’s contract.\n\nCosts 15,000 credits.");
	else addDisabledButton(0, "Buy Out", "Buy Out", "You don’t have the funds to contemplate this.");
	addButton(14, "Back", sentientAcquisitionsAsk, true);
	
	return;
}
public function sentientAcquisitionsBuyOutSera():void
{
	clearOutput();
	author("Nonesuch");
	showTeronAndAttica();
	
	output("You grin. Owning Sera? What a perfectly delicious thought.");
	output("\n\n<i>“Sure, I’ll buy her out. Where do I sign?”</i>");
	output("\n\nTeron pauses, staring at you. For the first time it seems you’ve caught him off-guard.");
	output("\n\n<i>“Are you absolutely sure? We do not accept refunds, and if you are patient we would be able to provide you with much more appropriate companions for that kind of money. We could help you a bit towards setting her on the path of willing obedience, but it would pain me to give our very first customer an unruly servant. And this one is far off the scale of unruliness.”</i>");
	
	processTime(1);
	
	clearMenu();
	// [Yes] [No]
	if(pc.hasGenitals()) addButton(0, "Yes", sentientAcquisitionsBuyOutSeraYes);
	else addDisabledButton(0, "Yes", "Yes", "This relationship requires genitals to work properly!");
	addButton(1, "No", sentientAcquisitionsBuyOutSeraNo);
	
	return;
}
public function sentientAcquisitionsBuyOutSeraNo():void
{
	chars["SERA"].removeStatusEffect("Dedicked");
	chars["SERA"].removeStatusEffect("Hymenified");
	chars["SERA"].removeStatusEffect("Tickled Pink");
	
	clearOutput();
	author("Nonesuch");
	showTeronAndAttica();
	
	output("<i>“On second thought...”</i>");
	output("\n\nTeron nods primly.");
	output("\n\n<i>“A sensible decision friend, trust me.”</i> He sighs. <i>“Finding someone suitable to palm her off on is going to be a struggle. There’s always one piece of stock it’s impossible to shift – she is definitely going to be one of those.”</i>");
	
	clearMenu();
	addButton(0, "Next", sentientAcquisitionsAsk, true);
	
	return;
}
public function sentientAcquisitionsBuyOutSeraYes():void
{
	clearOutput();
	author("Nonesuch");
	showTeronAndAttica();
	
	output("The tarratch’s entrepreneurialism swiftly overtakes his doubt. A tablet and stylus is pushed into your hands, displaying a splurge of information about your purchase as well as a picture of her. It’s an old one – she doesn’t have purple skin, and has brown, perfectly normal human eyes. That self-assured smirk though. That’s definitely Sera. You imagine her expression when she realizes what you’ve done, and you feel a fairly similar expression to one she’s wearing in the picture climb onto your own face.");
	output("\n\n<i>“Before you sign, " + pc.mf("Mr.", "Ms.") + " Steele...”</i> Teron points at several tick boxes above the blank at the bottom. <i>“You are our first customer, and you have immediately volunteered to take a problem case off our hands. I’d like to offer our sincere gratitude by providing some popular mod options for your acquisition, pro bono. The obedience collar comes as standard on this category of servant, but many acquirers");
	if(pc.hasCock()) output(" - particularly of the male persuasion -");
	output(" prefer to have hermaphrodite stock de-phallused. We can have that done, quickly and painlessly. Female human stock also have a bodily quirk that if present supposedly attests to their inexperience. An... um...”</i>");
	output("\n\n<i>“Vacuum seal,”</i> says Attica, grinning.");
	output("\n\n<i>“Right. The vacuum seal. We can have that reapplied to your purchase if you wish. Finally, purple is such a bold, tempestuous color for an indentured servant, don’t you think? Perhaps " + pc.mf("sir", "madam") + " would prefer their purchase in a nice, suitable pink.”</i>");
	
	// Can TiTS support a multiple choice form? Well anyway
	// [Dedicked Y/N] [Hymenified Y/N] [Tickled Pink Y/N] [Next]
	output("\n\n<u><b>Acquisition Adjustments</b></u>");
	output("\n<b>Penis:</b> " + (!chars["SERA"].hasStatusEffect("Dedicked") ? "Keep the Same" : "Remove Penis"));
	output("\n<b>Vagina:</b> " + (!chars["SERA"].hasStatusEffect("Hymenified") ? "Keep the Same" : "Regrow Hymen"));
	output("\n<b>Skin:</b> " + (!chars["SERA"].hasStatusEffect("Tickled Pink") ? "Keep the Same" : "Change to Pink"));
	
	clearMenu();
	if(pc.hasCock()) addButton(0, "Penis", sentientAcquisitionsBuyOutSeraYesPenis);
	else addDisabledButton(0, "Penis", "Penis", "At least one member of this relationship requires a penis!");
	addButton(1, "Vagina", sentientAcquisitionsBuyOutSeraYesVagina);
	addButton(2, "Skin", sentientAcquisitionsBuyOutSeraYesSkin);
	addButton(13, "Don’t Sign", sentientAcquisitionsBuyOutSeraNo);
	addButton(14, "Next", sentientAcquisitionsBuyOutSeraYesNext);
	
	return;
}
public function sentientAcquisitionsBuyOutSeraYesPenis():void
{
	if(!chars["SERA"].hasStatusEffect("Dedicked")) chars["SERA"].createStatusEffect("Dedicked");
	else chars["SERA"].removeStatusEffect("Dedicked");
	
	sentientAcquisitionsBuyOutSeraYes();
	
	return;
}
public function sentientAcquisitionsBuyOutSeraYesVagina():void
{
	if(!chars["SERA"].hasStatusEffect("Hymenified")) chars["SERA"].createStatusEffect("Hymenified");
	else chars["SERA"].removeStatusEffect("Hymenified");
	
	sentientAcquisitionsBuyOutSeraYes();
	
	return;
}
public function sentientAcquisitionsBuyOutSeraYesSkin():void
{
	if(!chars["SERA"].hasStatusEffect("Tickled Pink")) chars["SERA"].createStatusEffect("Tickled Pink");
	else chars["SERA"].removeStatusEffect("Tickled Pink");
	
	sentientAcquisitionsBuyOutSeraYes();
	
	return;
}
public function sentientAcquisitionsBuyOutSeraYesNext():void
{
	clearOutput();
	author("Nonesuch");
	showTeronAndAttica();
	
	output("<i>“Very good,”</i> murmurs Teron, watching you make your choices. <i>“Now just sign here.”</i> You scribble your signature in the blank text box at the bottom of the electronic contract. A few moments later the tablet beeps blandly as money is transferred out of your account. <b>You now own Sera.</b>");
	output("\n\nThe two Tarratch buzz and shift around you as you get up, looking at you with their liquid black eyes with a kind of possessive reverence, unhappy to see you go. Teron offers you his hand. Despite having fingers as thick as matchsticks, his grip is dry and strong when you shake.");
	output("\n\n<i>“Come along to the Dark Chrysalis in a few hours,”</i> he says. <i>“We shall have your purchase ready for pick up then. Thank you once again, " + pc.mf("Mr.", "Ms.") + " Steele – I very much hope this is the beginning of a long and prosperous relationship between us.”</i>");
	output("\n\nYou leave, thinking of the Dark Chrysalis’s (now former) proprietor – her air of total self-possession, her fits of rage, her wonderful, curvy, brazenly displayed body. Making her into a willing slave will be tough, but you relish the challenge in front of you.");
	
	processTime(5);
	
	pc.credits -= 15000;
	pc.createStatusEffect("Sentient Acquisitions Closed", 0, 0, 0, 0, true, "", "", false, 180);
	flags["SERA_ACQUIRED_DATE"] = GetGameTimestamp();
	IncrementFlag("ACQUISITIONS_SLAVE_PURCHASES");
	
	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
	
	return;
}

// PC goes to Dark Chrysalis after three hours
public function seraIsRepoed():void
{
	// Update Sera!
	if(chars["SERA"].removeStatusEffect("Dedicked"))
	{
		chars["SERA"].makeBallsInternal();
		chars["SERA"].removeCocks();
	}
	if(chars["SERA"].removeStatusEffect("Hymenified"))
	{
		//chars["SERA"].vaginalVirgin = true;
		chars["SERA"].vaginas[0].hymen = true;
	}
	if(chars["SERA"].removeStatusEffect("Tickled Pink"))
	{
		chars["SERA"].skinTone = "bright pink";
		chars["SERA"].nippleColor = "maroon";
	}
	// Update Sera inventory!
	chars["SERA"].inventory.length = 0;
	// Reset Sera conditions!
	chars["SERA"].lust(0, true);
	chars["SERA"].minutesSinceCum = 0;
	if(flags["SERA_NO_SEX"] != undefined) flags["SERA_NO_SEX"] = undefined;
	pc.removeStatusEffect("Dark Chrysalis Closed");
	pc.removeStatusEffect("Sera Credit Debt");
	
	clearOutput();
	author("Nonesuch");
	showBust(seraBustDisplay(), "ATTICA", "TERON");
	showName("\nREPO!");
	
	output("There is some sort of commotion going on inside the Dark Chrysalis. You think you know what might be causing it. Grinning, you enter – and instinctively duck as a small marble satyr leaves simultaneously, at head height and considerable velocity.");
	output("\n\n<i>“What the FUCK is this bullshit? What the SHIT have you bug-cunts done to me?”</i> Sera is practically shaking with anger, pulling at the thin, silver collar which has replaced the choker around her neck, her livid eyes rolling between Teron and Attica, who are standing on either side of her, arms calmly behind their backs, their feather ruffs quivering gently. The fact that there are two of them seems to be the only thing stopping the succubus attacking them; she can’t focus her hatred on one long enough before feeling the need to turn and spit and swear at the other.");
	if(chars["SERA"].skinTone == "bright pink") output(" If you didn’t know better you’d think the way her skin is now a bright pink is down to pure rage. She stands out in the gloomy store, an incongruously cheerful color amongst the devilish knickknacks and flickering candles.");
	if(!chars["SERA"].hasCock()) output(" You notice her big, proudly displayed dick is gone. She looks diminished and not quite so sure of herself without it.");
	output("\n\n<i>“We’ve already explained. Multiple times,”</i> replies Attica calmly. She taps a slather of papers on the counter. <i>“As per the agreements you made with Mods4U and Tavros Rental Space, your failure to meet payment deadlines has caused a buy-out clause to become available. It has been activated. You have been repossessed.”</i>");
	output("\n\n<i>“By fucking WHO?”</i> As one the tarratch silently turn to look at you, framed in the doorway. Yellow, reptilian eyes bore holes in you.");
	// PC submitted to Sera:
	if(seraIsMistress())
	{
		output("\n\n<i>“[pc.Him]?! But [pc.he]’s a... that’s my...”</i> Sera puts her hands over her face and laughs, in a groaning, despairing way. <i>“Right, so this is just a bad dream. A fucktoy of mine makes me their slave with the help of some overgrown moths.”</i> She feverishly claws at her arm. <i>“Good one, subconscious! You can let me out now!”</i>");
	}
	// Otherwise:
	else
	{
		output("\n\nVarious emotions wage war over Sera’s round, pretty face as she stares at you unblinkingly. For a while it seems sheer disbelief might overwhelm her anger.");
		output("\n\n<i>“So,”</i> she says thickly. <i>“You decided that what you wanted most in this shop you couldn’t get over the counter? So nice of you to tell me what you were planning, you disgusting " + pc.mf("prick", "cow") + ".”</i>");
	}
	output("\n\n<i>“Your possessions will be sold and put towards paying off your debt,”</i> says Attica briskly. <i>“For now, you will accompany your new owner...”</i> At the last word Sera finally reaches a decision about which of the repo-sects she most wants to kill. She rushes at Attica screaming, teeth and claws bared.");
	output("\n\n<i>“That’s enough!”</i> The female tarratch’s feathers unfurl and vibrate vigorously, and the succubus freezes, staring into the buzzing, shifting, hypnotizing fan. You avert your eyes.");
	output("\n\n<i>“You will listen to me now, worthless rue collar, and you will listen carefully. You shall learn to show gratitude to your new owner. [pc.He] has paid off the debt you so carelessly ran up, and removed all obligations from your life except one: To serve [pc.him] well. Believe me when I say there are far worse owners you could have ended up with – we were drawing up a list of them when [pc.he] stepped in. You shall learn to show gratitude to your new owner mostly, though, because that collar you are now wearing will shock you if you raise your hands against [pc.him], or if you travel outside [pc.his] ship without permission. Do you understand?”</i> As Attica speaks Teron steps over to you, pressing into your side as he hands you a small, steel remote and a briefcase.");
	output("\n\n<i>“Your documentation and starter pack,”</i> he murmurs, as you both look at Sera, slack-jawed and staring into the hypnotic ruff, her mouth working, trying and failing to form words. <i>“I’m sure you’ll find one or two things of interest in there. The remote controls her collar. You can use that to let her outside your ship, or zap her if she’s bad. Keep it somewhere safe. The best of luck to you, " + pc.mf("Mr.", "Ms.") + " Steele – you will need it.”</i> He pats you on the back as Attica points imperiously at the door. In a daze Sera swivels and walks over to you. You depart the Dark Chrysalis, your new crewmate in tow.");
	
	if(!pc.hasKeyItem("Acquisitions Starter Kit"))
	{
		output("\n\n<b>You have obtained a Sentient Acquisitions Starter Kit!</b>");
		pc.createKeyItem("Acquisitions Starter Kit", 0, 0, 0, 0, "A collar-and-remote bundle from Sentient Acquisitions.");
	}
	
	processTime(5);
	
	clearMenu();
	addButton(0, "Next", seraIsRepoedPtII);
	
	return;
}
public function seraIsRepoedPtII():void
{
	moveTo(shipLocation);
	showLocationName();
	
	clearOutput();
	showSera();
	author("Nonesuch");
	
	output("You are almost back to the landing bay before the tarratch’s hypnosis fades; in this time you have the opportunity to look Sera over carefully. In the light outside her gloomy shop it’s even more obvious what a fantastic body she has. Her large, flawless boobs and bum, each impossibly round and pert, bounce as she walks,");
	if(chars["SERA"].hasCock()) output(" her prestigious dick bobbing back and forth,");
	output(" drawing plenty of attention on Tavros’s wide corridors. You find yourself feeling rather proud of owning such a fine-looking slave.");
	if(!chars["SERA"].hasCock()) output(" She looks even better, at least to your eyes, without that big, ugly dick she used to have bobbing around in front of her.");
	output(" Sentient Acquisitions have even gone to the trouble of redressing her. She still has her glowing harness, but it has been subtly rearranged into a slightly frilled corset. Similarly, she still has thigh high stockings, but instead of imposing leather they are now silk fishnets, replete with stilettos on her feet. Her horns, eyes and claws continue to make her look pretty imposing, but she definitely looks more come-hither than coming-to-get-you now.");
	if(chars["SERA"].skinTone == "bright pink") output(" Teron was right – coloring her skin pink on top of this accentuates her new look perfectly. She actually looks quite sweet when she gets angry now.");
	output("\n\nHer stilettos clack faster and more purposefully as she comes to her senses, and you ponder how to break the ice. But she does that for you.");
	// PC submitted to Sera:
	if(seraIsMistress())
	{
		if(!pc.isBimbo())
		{
			output("\n\n<i>“If this was your bright idea to have your very own pet domme on your ship,”</i> she says, voice thick with rage, <i>“let me assure you that it was the worst idea you have ever had. Do you honestly think I am going to play games with you after what you’ve just done?”</i>");
			output("\n\n<i>“I wouldn’t worry about that. One of the reasons you’re here is I got bored with you being in charge all the time,”</i> you say lightly. <i>“This seemed like the only way to get you to learn a little humility. We’re both going to have a lot of fun exploring our new roles, I think.”</i>");
		}
		else
		{
			output("\n\n<i>“So what happened then? Did they just come up to you in the corridor, give you a clipboard and use a bunch of one syllable words to make you think this would be a fantastic idea?”</i> Sera snarls. <i>“Where do you even get your money from, you dumb bimbo? And why did you think being in charge was going to be a great idea? You’re fucking made to have someone like me do the thinking for you. We were doing fine, and now you’ve ruined everything!”</i>");
			output("\n\nYou feel sad that your toy isn’t as happy about this exciting new arrangement as you are.");
			output("\n\n<i>“Aww c’mon Sera, don’t be sulky!”</i> You pause and squeeze her tightly in a big hug. <i>“Just think, you won’t have to bother your head about that silly little shop anymore. All you’ll have to concentrate on is having loooooaaaads of fun with me!”</i>");
			output("\n\n<i>“Great,”</i> moans the succubus. <i>“Not only a slave, but a slave to a fucking idiot.”</i>");
		}
	}
	// Otherwise:
	else
	{
		output("\n\n<i>“Let’s get one thing straight,”</i> she says, voice thick with rage. <i>“I hate you. I hate what you’ve done to me.");
		if(!chars["SERA"].hasCock() || chars["SERA"].skinTone == "bright pink")
		{
			output(" Did you really think");
			if(!chars["SERA"].hasCock()) output(" cutting off my dick");
			if(!chars["SERA"].hasCock() && chars["SERA"].skinTone == "bright pink") output(" and");
			if(chars["SERA"].skinTone == "bright pink") output(" painting me pink");
			output(" was going to automatically turn me into your doormat?");
			// PC masculine:
			if(pc.mf("m", "f") == "m") output(" Typical fucking thinking from a pig.");
		}
		output(" Nobody controls me, particularly not some " + pc.mf("creep", "cow") + " who decides buying me like a piece of meat is a clever idea. I might not be able to hurt you, but I am going to make any time you spend around me so miserable you will have no choice but to ditch me at the earliest opportunity. That’s a promise.”</i>");
		if(pc.isBimbo())
		{
			output("\n\nYou feel sad that your toy isn’t as happy about this exciting new arrangement as you are.");
			output("\n\n<i>“Aww c’mon Sera, don’t be sulky!”</i> You pause and squeeze her tightly in a big hug. <i>“Just think, you won’t have to bother your head about that silly little shop anymore. All you’ll have to concentrate on is having loooooaaaads of fun with me!”</i>");
			output("\n\n<i>“Great,”</i> moans the succubus. <i>“Not only a slave, but a slave to a fucking idiot.”</i>");
		}
		else
		{
			output("\n\n<i>“We’ll see,”</i> you reply mildly. <i>“Way I see it, you running up all that debt was a cry for help. Underneath all the tough talk and attitude I think there’s a little girl asking for a bit of structure and discipline in her life. In time I think you will make a fine pet, which is why I’m more than happy to provide that structure and discipline.”</i>");
		}
	}
	if(!pc.isBimbo())
	{
		output("\n\nThis answer fills her with so much rage she almost chokes on it and says nothing else all the way back to your ship. You show her to her room – a relatively comfortable berth near the FTL drive. You catch her wrist as she stomps inside and look her in the eye.");
		output("\n\n<i>“You’re welcome to entertain yourself however you wish,”</i> you say levelly. <i>“But no masturbating. You cum when your [pc.master] tells you you can, understood?”</i> Her response is to slam the door so hard in your face you’re amazed it doesn’t come off its hinges.");
	}
	else
	{
		output("\n\nShe says nothing else all the way back to your ship. It pushes through the layers of cotton wool swaddling your mind that maybe you and Sera have not started off on the right foot. How you might go about setting that right occurs in a particularly deep glow of arousal as you are showing her to her room - a relatively comfortable berth near the FTL drive. You are smiling happily to yourself as she stomps inside.");
		output("\n\n<i>“Hey,”</i> you say to her. <i>“I want you to have fun when you’re aboard. But no, you know, seeing the man in the pink boat, ok hun? I want us to have lots of fun together, and it’ll be soooo much better if you stay good when I’m not around.”</i> Her response is to slam the door so hard in your face you’re amazed it doesn’t come off its hinges.");
	}
	
	processTime(12);
	flags["SERA_CREWMEMBER"] = 1;
	
	currentLocation = "SHIP INTERIOR";
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	return;
}

// Enter Dark Chrysalis next
public function mods4UChrysalisBonus():void
{
	author("Nonesuch");
	showBust("CHRYSALIS_DRONE");
	
	if(flags["MET_CHRYSALIS_DRONE"] == undefined)
	{
		output("The Dark Chrysalis looks considerably different from when you were last in here. The bric-a-brac cluttering the shelves has been tidied up, someone has done a thorough dusting, and strip lighting has been installed. It’s much less menacing and easier to see where you are, but you dare say it has lost some of its character too. Behind the counter a female model droid turns her blue lamp eyes and frozen, cheerful face to you.");
		output("\n\n<i>“Hello and welcome to the Dark Chrysalis, a subsidiary of Mods4U,”</i> she chirps. <i>“If you would like to purchase something, please consult the touch menu in front of me. If you have questions, do not hesitate to ask.”</i>");
		
		flags["MET_CHRYSALIS_DRONE"] = 1;
	}
	// Enter Dark Chrysalis repeat
	else
	{
		output("You enter the new, cleaned up and robot-stationed Dark Chrysalis.");
		output("\n\n<i>“Welcome to the Dark Chrysalis (a subsidiary of Mods4U), valued customer!”</i> twitters the droid behind the counter. <i>“How may I help you?”</i>");
	}
	
	// Saendra Futa-fication Variant
	if(saendraAtDarkChrysalis())
	{
		// Add to DC store descript:
		output("\n\nSaendra is leaning against the counter, her twin tails wagging ever so slightly. She is looking about the place brow crinkled, evidently bemused.");
		// [Saendra]
		addButton(1, "Saendra", mods4UChrysalisSaendra);
	}
	
	addButton(0, "Buy", mods4UChrysalisBuy);
	//Only displayed if PC had a discount previously
	if(flags["SERA_TIT_FUCK_LUCKY_DIP"] != undefined) addButton(5, "Discount?", mods4UChrysalisDiscount);
	
	return;
}
public function mods4UChrysalisBuy():void
{
	// All items inc. “top shelf” items displayed at standard price
	chars["CHRYSALISDRONE"].inventory = chrysalisInventory();
	shopkeep = chars["CHRYSALISDRONE"];
	
	if(flags["ZODEE_GALOQUEST"] != undefined)
	{
		if(flags["PURCHASED_SERAS_GALO"] == undefined)
		{
			if(!chars["CHRYSALISDRONE"].hasItemByClass(GaloMax)) chars["CHRYSALISDRONE"].inventory.push(new GaloMax());
		}
		else chars["CHRYSALISDRONE"].destroyItemByClass(GaloMax, -1);
	}
	
	buyItem();
}
public function mods4UChrysalisDiscount():void
{
	clearOutput();
	author("Nonesuch");
	showBust("CHRYSALIS_DRONE");
	showLocationName();
	
	output("<i>“You’re displaying these at full price. I had an, uh, arrangement with the previous owner,”</i> you say, hopefully. <i>“A discount.”</i>");
	output("\n\n<i>“I am afraid that any arrangement you had with the previous owner is null and void,”</i> replies the droid brightly. She whirrs slightly. <i>“Further, providing you with Class D gene mods without custom tariffs 12A through 15G(ii) is a felony. It is just as well the Dark Chrysalis (a subsidiary of Mods4U) is under new management, valued customer. You could have gotten into serious trouble otherwise.”</i>");
	
	processTime(1);
	addDisabledButton(5, "Discount?");
	
	return;
}
public function mods4UChrysalisSaendra():void
{
	clearOutput();
	showBust(saendraBustDisplay(), "CHRYSALIS_DRONE");
	showName("\nSAENDRA");
	author("Nonesuch");

	output("<i>“Hey,”</i> you say, approaching your fluffy lover and grabbing a handful of her ass. <i>“Ready for this?”</i>");
	output("\n\n<i>“I - yes,”</i> she says, distracted. She turns back to the check-out droid behind the counter. <i>“So this place has changed hands, then. What happened to the cree- the former owner? Sera?”</i>");
	output("\n\n<i>“I am not legally obliged to disclose that information,”</i> replies the droid brightly. <i>“How may the Dark Chrysalis (a subsidiary of Mods4U) help you today, madam?”</i>");
	output("\n\n<i>“We came to buy something,”</i> you chip in. <i>“Saendra here is interested in growing a dick. Got something that could do that?”</i>");
	output("\n\n<i>“Certainly!”</i> the blue-eyed bot chirps. After a moment’s computing it reaches beneath the counter and deposits a hypo-spray on top. <i>“That will be 1000 credits.”</i>");
	output("\n\nYou pay the money and Saendra stuffs the mod down her cleavage.");
	output("\n\n<i>“Please read the label before using, valued customer,”</i> warns the VI. <i>“Mods4U and associates are not liable for overuse of our products. Thank you, and come again.”</i> You follow the half ausar to the door. She turns her slightly bemused expression to you.");
	output("\n\n<i>“You wouldn’t know what happened to Sera, would you?”</i> she says.");
	output("\n\n<i>“I’m sure wherever she is now, she’s getting the help she needs,”</i> you say, stifling a grin with some difficulty.");
	output("\n\n<i>“Hmm.”</i> Saendra considers you shrewdly for a moment longer. <i>“She certainly did need a lot of that. Still, it’s a shame she’s gone - she was a really good fuck. Psychopaths usually are.”</i> Her attention shifts to the item wedged between her baps. <i>“Well, we’ve got it. Let’s do this... somewhere with some privacy, alright? Meet me at the </i>Phoenix<i> and we’ll... we’ll do it. Together.”</i>");
	
	processTime(3);
	flags["SAENDRA GONNA GO GET A COCK"] = 2;
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	return;
}

// Sera Follower Stuff:

// Talks and Intros
// Crew blurb
public function seraOnShipBonus(btnSlot:int = 0):String
{
	var bonusText:String = "";
	
	if(pc.hasStatusEffect("Sera Morning Sickness") || (flags["SERA_PREGNANCY_TIMER"] >= 30 && flags["SERA_PREGNANCY_TIMER"] < 90 && hours >= 6 && hours < 10 && rand(3) == 0))
	{
		bonusText += "\n\nYou hear the distinct sound of someone throwing up, followed by a moaned <i>“Fuck thiiiiiiis”</i> in the direction of Sera’s room. Probably best to leave her alone for a while.";
		pc.createStatusEffect("Sera Morning Sickness", 0, 0, 0, 0, true, "", "", false, 120);
		addDisabledButton(btnSlot, "Sera", "Sera", "She seems to be sick or something...");
	}
	else
	{
		bonusText += "\n\nThe";
		if(flags["SERA_QUIT_SMOKING"] == undefined) bonusText += " whiff of cigarette smoke and the";
		bonusText += " occasional muffled, sardonic laugh tells you that Sera is in her room - although Void knows what she’s gotten up to on your ship in your absence.";
		// [Sera]
		addButton(btnSlot, "Sera", approachServantSera, true, "Sera", "Visit the demoness.");
	}
	
	return bonusText;
}

// Sera Salary hotfix
public function seraSalaryCheck():Boolean
{
	// Already completed merchant arc (no more debt!)
	if(flags["SERA_REPAID_LOAN"] != undefined || (flags["SERA_BUSINESS_SETUP"] != undefined && (days - flags["SERA_BUSINESS_SETUP"] >= 365))) return false;
	// Other checks
	if(flags["SERA_SALARY_RESOLVED"] != undefined || seraInDebt() || shipLocation != "TAVROS HANGAR") return false;
	
	clearOutput();
	showBust("");
	showName("INCOMING\nMESSAGE...");
	author("Jacques00");
	
	output("Before you open the door to Sera’s room, your codex gives you an urgent beep. It looks like you have a new private holo-message... addressed from Sentient Acquisitions. Curious, you press the “Confirm” button to open the missive. A few quiet seconds pass for connection to decrypt and the video becomes visible to you. The projected image is that of the two tarratch shopkeepers, Teron and Attica, arms crossed and formal.");
	output("\n\nTeron starts off with a slow nod. <i>“Hello, dear customer. I hope all is well and you are enjoying your purchase... However, there is an important matter in which we require resolving at the utmost haste.”</i>");
	output("\n\nAttica follows, <i>“Our records currently show that the rue collar, originally filed as one ‘Sera Landon’, is in a questionable financial state.”</i>");
	output("\n\n<i>“Yes, upon purchase, the rue collar was of legal indentured servant status, but due to a glitch in the bookkeeping, it appears that she has already paid off her debts in full, and her contract has since been null and void, prior to your date of purchase. Given the conditions, this mix up has provided an issue with the legality of your purchase--especially with the regulations set in place by the U.G.C., you see.”</i> Teron takes a pause for you to reflect on the details, then continues. <i>“While errors in record libraries are something that is expected, if we honor the timestamps, we will have to refund your purchase, revert the rue collar’s physical and mental alterations, return her properties and possessions, and redact her registration to you. Because this falls under a gray area of the client contract, we have decided that we will put the choice in the rue collar’s owner’s hands--meaning you.”</i>");
	output("\n\n<i>“Note that this shifts related legal responsibilities to you as the client.”</i>");
	output("\n\n<i>“Correct. If you decide to keep her indentured to you, we will simply update our records as having never received the payments on our end, which would leave any monetary discrepancies between you and her debt handlers. This will undoubtedly drop her reputation in the merchant circles as well.”</i>");
	output("\n\n<i>“We have provided an instant-action form to make your choice as quick and painless as possible. Choose wisely, dear customer,”</i> Attica gestures. Below the video is a form with two options and a signature confirmation box.");
	output("\n\nIt looks like you have a choice to make: Do you want Sera to go back to being your dominant mistress? Or do you want this matter under wraps and keep Sera as your subserviant slave?");
	
	processTime(5);
	
	clearMenu();
	addButton(0, "Mistress", seraSalaryCheckOption, "mistress", "Revert To Mistress", "Revert Sera back to being your dominant Mistress.");
	addButton(1, "Slave", seraSalaryCheckOption, "slave", "Keep As Slave", "Keep Sera as your submissive slave.");
	//addButton(4, "No Change", seraSalaryCheckOption, "nothing", "No Change", "Do not change anything about Sera.\n\n<i>(This may cause inconsistencies with some of her content.)</i>");
	
	return true;
}
public function seraSalaryCheckOption(response:String = "none"):void
{
	clearOutput();
	author("Jacques00");
	clearMenu();
	
	switch(response)
	{
		case "mistress":
			showName("YES, MY\nMISTRESS...");
			
			output("Of course, you can’t say no to your Mistress. It should always be a yes -- “Yes, Mistress”. Mistress Sera, how you’ve missed that title. Having sampled her as a slave was not all it was cracked up to be, so this is probably for the best, you reflect. Choosing to get a refund for her contract and signing your name, you confirm your choice.");
			output("\n\n<i>“Excellent, you find value in the letter of the law... or pehaps you just prefer being the bottom is better for the relationship?”</i> Teron jests. <i>“We will be over shortly to make the proper changes and it will be as if the transaction never took place. See you soon, friend.”</i> The hologram blinks out.");
			output("\n\nWith the decision made, all you have to do is wait...");
			
			processTime(3);
			
			addButton(0, "Next", seraSalaryCheckOption, "mistress next");
			break;
		case "mistress next":
			showBust(seraBustDisplay(), "ATTICA", "TERON");
			showName("YES, MY\nMISTRESS...");
			
			output("Not soon after, the two tarratch arrive at your " + (seraIsCrew() ? "ship" : "nursery apartments") + " and you invite them in.");
			output("\n\n<i>“Let’s get this over with quickly, shall we?”</i> Teron suggests, <i>“Where is the rue collar located?”</i>");
			output("\n\nYou lead the two aliens to the front of Sera’s room and knock on her door.");
			output("\n\n<i>“The fu--! Uh, I mean, yes, [pc.master]?”</i> Sera answers begrudgingly.");
			output("\n\nYou respond with, <i>“Mistress Sera, we have visitors I’d like you to meet.”</i>");
			output("\n\n<i>“‘Mistress’ Sera? W-what are you on about?”</i> Sera seems confused. A loud rustle can be heard as she rushes to the door. With a woosh, the door opens and you are met face-to-face with the bright-eyed demoness. <i>“What did you call me?”</i>");
			output("\n\nYou say nothing and sidestep out of the way. In your place, the two tarratch step forward. Attica’s feathers retract, shift, and vibrate into a familiar fan-like shape.");
			output("\n\n<i>“Oh, SHIT.”</i> Sera’s expression changes from confusion to panic. <i>“FUCK. FUCK. FUCK. Not again! Get the hell away fr--!”</i> With Sera’s guard down, Attica’s hypnotizing ability hits her with great effect and she instantly becomes subject to the tarratch’s beck and call. Attica removes the thin, silver collar from the demoness’ neck and gracefully returns it to you.");
			output("\n\n<i>“Come, rue collar. Let us fix you,”</i> Teron commands. Like a hapless puppy, Sera follows. As the three are led out " + (seraIsCrew() ? "the airlock" : "to the elevator") + ", Teron turns to you. <i>“Not to worry, her belongings are being shipped back to ‘The Dark Chrysalis’ as we speak. Things will be as they once were, more or less.”</i> Glancing at the now-unworn collar in your hand, he adds, <i>“You can keep the starter kit by the way--think of it as a consolation gift; for the trouble. Perhaps you can find it useful in the future.”</i>");
			output("\n\n<i>“As for the refund, dear customer...”</i> Attica politely mentions while tapping a handheld data slate. Your codex gives a few positive beeps, letting you know that <b>you have been refunded 15,000 credits");
			if(flags["SERA_BUSINESS_SETUP"] != undefined && flags["SERA_REPAID_LOAN"] == undefined && !pc.hasStatusEffect("Sera Debt Repaid")) output(" along with an additional 15,000 credits reimbursed for the loan you gave her");
			output(".</b> <i>“Apologies for any inconvenience this may have caused.”</i>");
			output("\n\n<i>“Give us a few hours to get her fully situated,”</i> Teron says, before parting ways. <i>“Thank you for your cooperation in fixing this error. I hope we do business again in the future... unless you are interested in signing a contract for yourself?”</i> he smiles. <i>“Farewell, friend.”</i>");
			output("\n\n(<b>Sera is no longer a part of your crew. You can find her again at The Dark Chrysalis.</b>)");
			
			processTime(32);
			
			currentLocation = (seraIsCrew() ? shipLocation : "NURSERYE14");
			
			// Reset Sera flags
			if(flags["SERA_ACQUIRED_DATE"] != undefined) flags["SERA_ACQUIRED_DATE"] = undefined;
			if(flags["SERA_OBEDIENCE"] != undefined) flags["SERA_OBEDIENCE"] = undefined;
			if(flags["SERA_OBEDIENCE_MIN"] != undefined) flags["SERA_OBEDIENCE_MIN"] = undefined;
			if(flags["SERA_OBEDIENCE_MAX"] != undefined) flags["SERA_OBEDIENCE_MAX"] = undefined;
			if(flags["SERA_MERCHANT"] != undefined) flags["SERA_MERCHANT"] = undefined;
			if(flags["SERA_BUSINESS_SETUP"] != undefined)
			{
				if(flags["SERA_REPAID_LOAN"] == undefined && !pc.hasStatusEffect("Sera Debt Repaid")) pc.credits += 15000;
				flags["SERA_BUSINESS_SETUP"] = undefined;
			}
			if(flags["SERA_REPAID_LOAN"] != undefined) flags["SERA_REPAID_LOAN"] = undefined;
			if(flags["SERA_CREWMEMBER"] != undefined) flags["SERA_CREWMEMBER"] = undefined;
			// Revert Sera!
			if(!chars["SERA"].hasCock()) chars["SERA"].createCock();
			chars["SERA"].cocks[0].cLengthRaw = 12.5;
			chars["SERA"].balls = 2;
			chars["SERA"].ballSizeRaw = 2;
			chars["SERA"].ballFullness = 100;
			chars["SERA"].vaginas[0].hymen = false;
			chars["SERA"].skinTone = "light purple";
			chars["SERA"].nippleColor = "cerulean";
			// Revert Sera inventory!
			chars["SERA"].inventory = chrysalisInventory();
			chars["SERA"].sellMarkup = 1.2;
			chars["SERA"].buyMarkdown = 0.8;
			// Reset Sera conditions!
			chars["SERA"].lust(0, true);
			chars["SERA"].minutesSinceCum = 9000;
			if(flags["SERA_NO_SEX"] != undefined) flags["SERA_NO_SEX"] = undefined;
			pc.removeStatusEffect("Sera Credit Debt");
			pc.removeStatusEffect("Sera Debt Repaid");
			pc.removeStatusEffect("Seranigans Punishment");
			pc.removeStatusEffect("Seranigans");
			pc.removeStatusEffect("Seranigans Event");
			
			if(flags["ACQUISITIONS_SLAVE_PURCHASES"] != undefined)
			{
				flags["ACQUISITIONS_SLAVE_PURCHASES"]--;
				if(flags["ACQUISITIONS_SLAVE_PURCHASES"] <= 0) flags["ACQUISITIONS_SLAVE_PURCHASES"] = undefined;
			}
			
			if(!pc.hasKeyItem("Acquisitions Starter Kit"))
			{
				pc.createKeyItem("Acquisitions Starter Kit", 0, 0, 0, 0, "A collar-and-remote bundle from Sentient Acquisitions.");
			}
			
			pc.credits += 15000;
			flags["SERA_SALARY_RESOLVED"] = 1;
			
			pc.createStatusEffect("Dark Chrysalis Closed", 1, 0, 0, 0, true, "", "", false, 180);
			pc.createStatusEffect("Sentient Acquisitions Closed", 0, 0, 0, 0, true, "", "", false, 180);
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "slave":
			showName("STAY, MY\nSLAVE...");
			
			output("Now that you think about it, you rather like Sera as a submissive... She should have a taste of her own medicine anyway--for humility’s sake, of course. Choosing to keep her contract active and signing your name, you confirm your choice.");
			output("\n\n<i>“Ah, a true [pc.master] this one is. You definitely value dominance over some petty government regulations, I see.”</i> Teron grins. <i>“Very well, I will make the necessary changes to our records and spread the word of her subservience around. Your rue collar’s future is now set soley in your hands.”</i>");
			output("\n\n<i>“No further action is needed here. Thank you for your cooperation.”</i> Attica adds.");
			output("\n\n<i>“It was a pleasure doing business with you and I hope we continue to do more in the future. Stay well, friend.”</i> Teron concludes. The hologram blinks out.");
			output("\n\nYou exhale a breath of accomplishment, then proceed to meet Sera.");
			output("\n\n(<b>Sera will continue to be your slave.</b>)");
			
			processTime(3);
			
			// Reset Sera flags
			flags["SERA_PARTY_INVITE"] = 3;
			if(flags["SERA_INFULENCE"] > 190) flags["SERA_INFULENCE"] = 190;
			if(flags["SERA_SALARY_PAID"] != undefined) flags["SERA_SALARY_PAID"] = undefined;
			
			flags["SERA_SALARY_RESOLVED"] = -1;
			
			addButton(0, "Next", approachServantSera, true);
			break;
		case "nothing":
			showName("IGNORE\nMESSAGE");
			
			output("You decide to cut the connection and ignore the message entirely. Nothing can be that urgent, right?");
			
			flags["SERA_SALARY_RESOLVED"] = 0;
			
			addButton(0, "Next", approachServantSera, true);
			break;
		default:
			output("Nothing to see here!");
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

public function approachServantSera(introText:Boolean = false):void
{
	// Sera Salary hotfix check
	if(seraSalaryCheck()) return;
	
	// Sera actually on Tavros instead
	if(flags["SERA_CREWMEMBER"] == 0)
	{
		approachServantSeraOnTavros(introText);
		return;
	}
	if(!disableExploreEvents() && flags["SERA_PREGNANCY_TIMER"] >= 195)
	{
		seraPregMoveToTavros();
		return;
	}
	
	var obedience:Number = seraObedience();
	
	clearOutput();
	showSera();
	author("Nonesuch");
	
	clearMenu();
	// Untrained Sera
	if(flags["SERA_OBEDIENCE_MIN"] <= 0)
	{
		if(introText)
		{
			// Jerked Off Blurb
			// Plays if Sera exceeds max arousal when PC not there
			// If she goes an hour after reaching 50 with the player out of the room she disobeys and gets off herself. -8 Obedience
			if(obedience >= 0 && obedience <= 80 && chars["SERA"].lust() >= 100 && chars["SERA"].minutesSinceCum >= 180)
			{
				output("Sera is lounging on her bunk with a big smirk on her face,");
				if(chars["SERA"].hasCock()) output(" her cock limp on the sheets,");
				output(" the very picture of contentment. There are a number of balled up tissues flung into the far corners of her disheveled cabin. It doesn’t take a genius to work out what she’s been doing.");
				if(obedience >= 0 && obedience <= 40)
				{
					output("\n\n<i>“I fantasized about pushing you out of an airlock,”</i> she says. <i>“It was amaaaaazing.”</i> She looks at you with half-lidded, insolent eyes. <i>“You don’t get it, do you? You don’t control me.”</i>");
				}
				else
				{
					output("\n\n<i>“I fantasized about tattooing my name on your ass,”</i> she says. <i>“You were begging me to do it.”</i> She gets up on her elbows and looks at you with half-lidded, saucy eyes. <i>“What are you going to do about that, huh </i>master?<i>”</i>");
					output("\n\nYou could swear she’s deliberately trying to antagonize you.");
				}
				processTime(1);
				chars["SERA"].orgasm();
				chars["SERA"].createStatusEffect("Sera Masturbated");
				seraObedience(-8);
			}
			// Approach blurb
			else if(obedience >= 0 && obedience <= 20)
			{
				output("Sera is flopped on her single bunk, nails flicking over the glow of an extranet tablet. She looks up at you with profound dislike as you enter her room.");
				output("\n\n<i>“Fuck do you want?”</i>");
				processTime(1);
				if(flags["SERA_OBEDIENCE_MAX"] < 40) flags["SERA_OBEDIENCE_MAX"] = 40;
			}
			else if(obedience > 20 && obedience <= 40)
			{
				output("Sera’s eyes flick up from her extranet tablet to meet yours when you enter her room.");
				if(flags["SERA_SERVANT_INTRO"] == undefined)
				{
					output(" The exaggerated indifference has faded from her demeanor; she seems tense and watchful, saying nothing as she waits to see what you’ve got in store for her.");
					flags["SERA_SERVANT_INTRO"] = 1;
				}
				else
				{
					output(" She says nothing, waiting tersely and tensely to see what you’ve got in store for her.");
				}
				processTime(1);
				if(flags["SERA_OBEDIENCE_MAX"] < 60) flags["SERA_OBEDIENCE_MAX"] = 60;
			}
			else if(obedience > 40 && obedience <= 60)
			{
				if(flags["SERA_SERVANT_INTRO"] < 2)
				{
					output("Sera smiles when you enter, a suggestion of impish coyness curling her lip.");
					output("\n\n<i>“Come for a visit again, M- ?”</i> her eyes widen slightly as she bites down on the last word. You grin.");
					output("\n\n<i>“What was that?”</i>");
					output("\n\n<i>“Nothing.”</i> She’s retreating back into watchful sullenness.");
					output("\n\n<i>“Hmm.”</i> You think it’s time to push the training forward. You go back to the silver briefcase and retrieve the collar remote. <i>“I understand. You’ve learned enough now to know my title by heart, but you need some help properly saying it. So here’s a new rule: You will call me [pc.master] from now on, or receive a zap. Got that?”</i> You place your finger on the cheery red button on the rectangular control.");
					output("\n\n<i>“What? No! Fuck you, assh- ow!”</i> You press down and are rewarded by Sera jerking spasmodically. She tugs at her collar furiously. <i>“You’re such a fucking d- ahgh! Fine!”</i> She glares at you, gritting her teeth. <i>“I’ll call you [pc.master] from now on, </i>[pc.master]<i>.”</i> The amount of derision she packs into those two syllables makes it abundantly clear the things she’d rather call you, but you nod, letting pride radiate off you.");
					output("\n\n<i>“Good girl!”</i> You think a tiny, just the tiniest shiver runs over the flawless valleys and bluffs of her body when you say that.");
					output("\n\n<i>“Was there anything else, [pc.master]?”</i> she says in a sarcastically sweet tone, looking at you with a sideways scowl.");
					processTime(2);
					flags["SERA_SERVANT_INTRO"] = 2;
				}
				else
				{
					output("Sera smiles and bounces on her bunk with sarcastic, sardonic excitement when you enter the room.");
					output("\n\n<i>“It’s [pc.master]! What does [pc.master] want to do today, [pc.master]?”</i>");
					processTime(1);
				}
				if(flags["SERA_OBEDIENCE_MAX"] < 80) flags["SERA_OBEDIENCE_MAX"] = 80;
			}
			else
			{
				if(flags["SERA_SERVANT_INTRO"] < 3)
				{
					output("Sera smiles toothily when you enter her room.");
					output("\n\n<i>“[pc.Master],”</i> she croons, licking her lips provocatively. This time there’s no denying it – she is genuinely pleased to see you, ready to be tested and provoked by you, ready to rail against you and ultimately be overcome and put in her place by you. She has adapted and evolved under your tutelage, and you in turn have learnt slowly but surely what it takes to keep her on your leash. You return her leer commandingly.");
					output("\n\n<i>“Time for a new rule, pet. No more foul language. Good girls don’t swear like sailors – it reflects badly on their [pc.master]. They are nice and polite. They ask to take it up the ass with a please, they don’t cuss during no matter how much they whorishly enjoy it, and they say thank you afterwards. Understood?”</i>");
					output("\n\n<i>“That’s just bullsh- horse- poppycock!”</i> rages Sera. <i>“You’ve taken so much away from me, and now you’re taking that? You petty b... balloon!”</i> It’s exactly as you thought. You can see a perverse joy in her stropping, the fling of her limbs and cute pout, a private delight in this new, unfair rule to rage against. You remain impassive though – this isn’t the moment to rub it in her face. Not yet.");
					output("\n\n<i>“Yes. And you will obey it,”</i> you say coolly. <i>“Or be punished.”</i> Your slave can’t disguise the shudder, somewhere between fear and ecstasy, which quivers through her at these words.");
					output("\n\n<i>“I f- flipping hate you,”</i> she growls, anger and delight shimmering through her voice.");
					processTime(2);
					flags["SERA_SERVANT_INTRO"] = 3;
				}
				else
				{
					output("Sera smiles toothily when you enter her room, flinging her extranet tablet to one side.");
					output("\n\n<i>“How are you planning on blighting my existence today, [pc.master]?”</i> she purrs, provocatively raising her eyebrow.");
					processTime(1);
				}
			}
		}
		else
		{
			output("You consider your demonic slave-in-training. What, if anything, do you intend to do with her?");
		}
		
		// [Appearance] [Tease] [Buttfuck] [Punish]
		addButton(0, "Appearance", seraAppearance);
		
		if(pc.hasCock()) addButton(1, "CuntTease", seraBitchTrainingTease, undefined, "Cunt Tease", "Tease your demonic slave.");
		else if(chars["SERA"].hasCock() && pc.hasVagina()) addButton(1, "CockTease", seraBitchTrainingFemTease, undefined, "Cock Tease", "Cock-tease your futa slave, and maybe give her some release.");
		else addDisabledButton(1, "Tease", "Tease", "The possible genital combinations are not present for you to try this!");
		
		if(pc.hasVagina() && chars["SERA"].hasCock()) addButton(2, "Ride", seraBitchTrainingRide, undefined, "Ride", "Vaginally test-ride her cock.");
		else if(!pc.hasVagina() && !chars["SERA"].hasCock()) addDisabledButton(2, "Ride", "Ride", "Sera needs to have a cock and you need to have a vagina to try this!");
		else if(!chars["SERA"].hasCock()) addDisabledButton(2, "Ride", "Ride", "Sera needs to have a cock for you to try this!");
		else addDisabledButton(2, "Ride", "Ride", "You need a vagina to try this!");
		
		if(pc.hasCock()) addButton(3, "Buttfuck", seraBitchTrainingButtfuck, undefined, "Buttfuck", "Train Sera to be your little buttslut.");
		else addDisabledButton(3, "Buttfuck", "Buttfuck", "You need a penis to try this!");
		
		addButton(4, "Punish", seraBitchTrainingPunish, true, "Punish", "Punish Sera for being a bad slave.");
		
		addButton(13, "Boot", evictServantSera, undefined, "Evict Sera", "Boot her off the ship, put her up at your Nursery. This will probably adversely affect her training.");
	}
	// Trained Sera
	else
	{
		if(introText)
		{
			// Subsequent [Sera]
			if(pc.hasStatusEffect("Sera Debt Repaid"))
			{
				output("<i>“Hey, [pc.master].”</i> Sera is considering her make-up in a pocket mirror. She traces the line of an arching eyebrow. <i>“Pockets feeling heavier?”</i>");
				output("\n\n<i>“You paid me back,”</i> you say. <i>“With interest, even.”</i>");
				output("\n\n<i>“You didn’t think I would, did you?”</i> the succubus sneers, snapping the compact closed. <i>“It’s alright, you can admit it. It was just sugar liberally applied to one of your hos to you, wasn’t it? Another chain around my ankle, maybe. But not to me.”</i> Teeth and various forms of luminescence flash at you fiercely. <i>“I paid it off so I could tell myself I did. That I could make a business work, if I put my ass into it. And now my indenture-hood is just this thing. Not the be all and end all. It’ll be over soon enough. And then...”</i> there’s a lot going on in that tight, toothy expression hiked across her face. Anger. Pride. A lot of lust. <i>“...perhaps <b>I</b> will be the one who gives <b>you</b> the loan? Or two. Or three. Who knows where that might lead us... [pc.Master].”</i>");
				output("\n\nHearing your pussy cat growl like this is giving you a sincere desire to fuck her silly. In a big pile of credits, possibly.");
				
				// + Lust
				pc.lust(50);
				pc.removeStatusEffect("Sera Debt Repaid");
			}
			// [Sera] 7 days after you funded her
			else if(flags["SERA_MERCHANT"] == undefined && flags["SERA_BUSINESS_SETUP"] != undefined && (days - flags["SERA_BUSINESS_SETUP"] >= 7))
			{
				output("You enter Sera’s room, and are confronted with - you. The you in the tall, thin rectangle of synth-glass standing opposite the door grins back seductively, before shape-shifting before your eyes -");
				if(pc.hairColor != "turquoise") output(" your [pc.hair] turning turquoise");
				else output(" your turquoise hair turning tar black");
				output(",");
				if(!InCollection(pc.eyeType, [GLOBAL.TYPE_SNAKE, GLOBAL.TYPE_DEMONIC, GLOBAL.TYPE_DRACONIC])) output(" your [pc.eyes] becoming brilliant yellow and reptilian");
				else output(" your reptilian eyes growing extra pupils");
				output(",");
				if(!pc.isNaga()) output(" your [pc.legOrLegs] melting into a huge, sinuous snake tail");
				else output(" your naga half branching out terrifyingly into an armored arachnid body");
				output("...");
				output("\n\n<i>“Oh, hey [pc.master].”</i> Sera is sorting through the many delivery boxes now stacked around her room. Kaleidoscopic holo-letters, spelling out ONE STOP POP UP MOD SHOP, float over her head. <i>“I ain’t exactly gonna be Mrs. Reliable, careening all across the frontier with you,”</i> she sighs, examining a bottle of Semen’s Friend. <i>“But that’s alright - the corporation fronts have ‘reliable’ sewn up anyway. I will offer racey stuff, a constantly changing catalogue, good advice delivered hard, and most importantly gosh. Darn. Discounts.”</i> She grins at you lopsidedly. <i>“After something?”</i>");
				
				// [Buy] added to main Sera hub
				flags["SERA_MERCHANT"] = 1;
				seraBitcheningStoreRandomize();
			}
			else if(pc.hasStatusEffect("Seranigans") && pc.statusEffectv1("Seranigans") != 0)
			{
				switch(pc.statusEffectv1("Seranigans"))
				{
					case 1:
						output("<i>“Oh, hey [pc.master],”</i> says Sera, not looking up from her holo-device. A smirk is twitching the corner of her mouth. <i>“Wanna screw? I didn’t think you were interested in me anymore. I’m told your... tastes... are a bit more specialized these days.”</i>");
						break;
					case 2:
						output("<i>“You got some pretty neat shit tucked away on here, don’t you [pc.master]?”</i> observes Sera. She’s lying back on her bunk and gazing at the ceiling, but the facade of insouciance is spoiled somewhat by the big, vindictive smirk on her face. <i>“Such a rich brat thing - acquire stuff because you wannit wannit wannit daddy I’m gonna scweam, then once you do you stick it away in a closet, never to see the light of day again.”</i> She rolls onto her side, laughing reptilian eyes meeting yours. <i>“At least until you get a toy that can play with all your <i>other</i> toys.”</i>");
						break;
					case 3:
						output("<i>“What do you think?”</i> Sera asks casually, holding up a strappy top covered in eerie, shifting patterns to her bust as you step into her room. <i>“This - or do you think this brings out the yellow of my eyes better?”</i> She picks out another top from the small pile on her bed, flourishing it so the flashing GIANT BITCH logo is visible. <i>“Or... well, it doesn’t really matter. I’ll wear them and if I don’t like them, I’ll buy some more. I <i>love</i> being a rich " + pc.mf("prick", "cunt") + "’s trophy slut.”</i>");
						break;
					case 4:
						output("<i>“Woooo!”</i> Sera saunters down the landing ramp, bottle of wine in hand. <i>“That auto-pilot of yours - took a bit of persuading, but it knew how to have a good time eventually. The rings ‘n asteroid belts in this system!”</i> She opens up her arms and blows out of her cheeks. The wine sloshes dangerously. <i>“Fucking cool! I’m not interested in space cos I’m not, you know, a nerd, but woooow!”</i> She takes a pull from the bottle, her brow furrowing when she catches your expression. <i>“Got a problem? Face on you like a bag of smashed dicks.”</i> She gestures at the ship, almost falling over as she does. <i>“‘S aaall yours now. Lead the way, cap’n!”</i>");
						output("\n\nShe laughs filthily as she swaggers back on board.");
						break;
					case 5:
						output("Stepping into Sera’s room, you are greeted with a passable imitation of the sound you made jumping out of the shower, followed by an aria of filthy laughter.");
						output("\n\n<i>“You do something with your hair, [pc.master]? Or is it your skin?”</i> Sera sniggers, delighted eyes dancing over your frame. <i>“It’s not the color I’d choose, but hey, if it works for you...”</i>");
						break;
				}
				pc.createStatusEffect("Seranigans Punishment", (pc.statusEffectv1("Seranigans")), 0, 0, 0, true, "", "", false);
				pc.removeStatusEffect("Seranigans");
				pc.removeStatusEffect("Seranigans Event");
			}
			else
			{
				output("<i>“Oh, hello [pc.master],”</i> purrs Sera, laying her holo-device to one side. She stretches herself out on her bed, giving you an unadulterated view of your property");
				if(flags["SERA_PREGNANCY_TIMER"] >= 110) output(" - and her swelling, pregnant belly");
				else output(", claws slowly sliding up a [sera.skinColor] thigh");
				output(". Her expression is one of simmering, provocative mischief. <i>“How are you intending on blighting my existence today?”</i>");
			}
			processTime(1);
		}
		else
		{
			output("You consider your obedient demoness-slave. What, if anything, do you intend to do with her?");
		}
		
		// [Appearance] [Talk] [Sex] [Punish]
		addButton(0, "Appearance", seraAppearance);
		
		if(flags["SERA_MERCHANT"] != undefined)
		{
			addButton(1, "Buy", seraBitcheningStore, "buy");
			addButton(2, "Sell", seraBitcheningStore, "sell");
		}
		else if(flags["SERA_BUSINESS_SETUP"] != undefined)
		{
			addDisabledButton(1, "Locked", "Locked", "Sera needs more time before this option is available.");
			addDisabledButton(2, "Locked", "Locked", "Sera needs more time before this option is available.");
		}
		
		addButton(3, "Talk", seraBitcheningTalk);
		
		if(pc.hasStatusEffect("Seranigans Punishment")) addButton(4, "Punish", seraBitcheningPunishMenu, undefined, "Punish", "Punish Sera for being a bad slave.");
		else addDisabledButton(4, "Punish", "Punish", "She’s not done anything to deserve one. But she will. Eventually.");
		
		addButton(5, "Sex", seraBitcheningSexMenu, undefined, "Sex", "Approach your slave for some sex.");
		
		addButton(13, "Boot", evictServantSera, undefined, "Evict Sera", "Boot her off the ship, put her up at the Nursery.");
	}
	
	if(flags["SERA_TALKS_IMPREGNATE"] >= 2) addDisabledButton(6, "Impregnate", "Impregnate", "You and Sera have already agreed to make this possible.");
	else if(!pc.hasGenitals()) addDisabledButton(6, "Impregnate", "Impregnate", "You will probably need genitals for this...");
	else if(!pc.isHerm() && (!chars["SERA"].hasGenitals() || (pc.hasCock() && !chars["SERA"].hasVagina()) || (pc.hasVagina() && !chars["SERA"].hasCock()))) addDisabledButton(6, "Impregnate", "Impregnate", "Maybe if your genitals were compatible for breeding with hers, this would be possible...");
	else if(flags["SERA_DISABLE_IMPREGNATE"] != undefined && (flags["SERA_DISABLE_IMPREGNATE"] + 7) > days) addDisabledButton(6, "Impregnate", "Impregnate", "Better to wait a bit before bringing it up again.");
	else if(!canImpregnateSera()) addDisabledButton(6, "Impregnate", "Impregnate", "Better to get a little further down the road with her before bringing it up.");
	else addButton(6, "Impregnate", seraBitcheningImpregnate, undefined, "Impregnate", "Is that allowed by the terms of her contract?");
	
	if(flags["SERA_PREGNANCY_TIMER"] >= 110) addButton(7, "Belly Rubs", seraPregBellyRubs, undefined, "Belly Rubs", "Rub her belly...");
	
	// Option turns up in her main menu after she has been barred for >3 days
	if(flags["SERA_NO_SLEEP"] != undefined)
	{
		if((days - flags["SERA_NO_SLEEP"]) <= 3) addDisabledButton(9, "Debar", "Debar", "Sera is probably still upset. You can’t do this yet.");
		else addButton(9, "Debar", seraBitchImpregnateBedResponse, "debar", "Debar", "Having her sleep with you would be nice, actually. Is it possible to entice her back?");
	}
	
	addButton(14, "Leave", crew);
	
	return;
}

// Obedience Training Plan
// Obedience
// Can go up or down, but starts at 0 and once it reaches 80 via Tease or Ride final scene it’s locked, like Whitney. Can be hidden or displayed somewhere, up to editor’s discretion.
// PC can make her fully obedient by: a) Teasing her female bits at 80 obedience and med/high arousal or b) Riding her male bits at 80 obedience and med/high arousal.
public function seraObedience(add:Number = 0):Number
{
	if(flags["SERA_OBEDIENCE"] == undefined) flags["SERA_OBEDIENCE"] = 0;
	if(flags["SERA_OBEDIENCE_MIN"] == undefined) flags["SERA_OBEDIENCE_MIN"] = 0;
	if(flags["SERA_OBEDIENCE_MAX"] == undefined) flags["SERA_OBEDIENCE_MAX"] = 20;
	
	if(add != 0) flags["SERA_OBEDIENCE"] += add;
	
	if(flags["SERA_OBEDIENCE"] < flags["SERA_OBEDIENCE_MIN"]) flags["SERA_OBEDIENCE"] = flags["SERA_OBEDIENCE_MIN"];
	if(flags["SERA_OBEDIENCE"] > flags["SERA_OBEDIENCE_MAX"]) flags["SERA_OBEDIENCE"] = flags["SERA_OBEDIENCE_MAX"];
	
	return flags["SERA_OBEDIENCE"];
}

// Arousal
/*
She has a hidden arousal stat which affects how well each action you take with her goes. 
Starts at 0. Goes up by 2 with every passing hour. Caps at 50. 
0-20 = Low Arousal
21-40 = Med Arousal
41-50 = High Arousal
If she goes an hour after reaching 50 with the player out of the room she disobeys and gets off herself. -8 Obedience
Note: Probably just use her lust stat (with 0, 33, 66, 100 to define arousal points) instead to define her arousal!

Tease/Anal/Punish

Tease: Increases arousal. Option to get her off or deny at end.
	Get off
		Sera’s Arousal		Obedience Change
		Low					-4
		Medium				+1
		High				+8
	Deny: Does nothing but increase arousal, but too high = she gets off anyway, - 4 Obedience.
Anal
		Sera’s Arousal		Obedience Change
		Low					-5
		Medium				0
		High				+8
Punish: - 8 Obedience normally. If used directly after she gets herself off +14 Obedience.
	More punish options open the higher obedience goes. Spank, Jizz Rations.
*/

// Tease (Female Bits)
public function seraBitchTrainingTease():void
{
	var obedience:Number = seraObedience();
	
	// Final
	// Requires: 80 Obedience, Medium/High Arousal
	if(obedience >= 80 && chars["SERA"].lust() >= 33 && pc.lust() >= 33)
	{
		seraBitchTrainingTeaseFinale();
		return;
	}
	
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	// First
	if(flags["SERA_BITCHENING_TEASE"] == undefined && obedience <= 40)
	{
		output("Ignoring Sera for the moment, you open the natty, silver “starter kit” the Tarratch gave you. As you were told there are many bits and bobs in here which might help you with the wilful hellion you now own, but what you are particularly looking for is – ah.");
		output("\n\nYou grin at Sera as you withdraw a pair of handcuffs, the same silver color as her collar, and dangle them in front of her.");
		output("\n\n<i>“So what you’re saying is, you’ve never even done rope work before,”</i> she sneers in response. <i>“Do you think a half hour of amateur fumbling is going to make me putty in your hands? You’re dealing with an expert, [pc.boy]. Anything you try is going to look absolutely pathetic.”</i>");
		output("\n\nYou ignore her bluster and drop onto the bed next to her, deliberately pushing your weight into her side. She tenses up as you take her hands and cuff them behind her back, forcing her high, plentiful boobs outwards. You slide around so that your [pc.chest] is pushing into her back, your hands roaming across her warm, flawless [sera.skinNoun]; waiting for her muscles to relax, forcing her to get used to your presence. You breathe gently on her neck as you cup one of her breasts, brushing over the nub of an erect nipple, pressing " + (pc.cocks.length == 1 ? "your hardening cock" : "each of your hardening cocks") + " into the rise of her round butt, enjoying the fine, pliant give of your slave at your leisure as you work your way downwards. You feel something moving fretfully by your thigh and swiftly reach down to catch her tail, trapping it in your armpit.");
		output("\n\n<i>“Look,”</i> she snaps, shifting irritably in your grasp, <i>“if you’re going to fuck me just do it. Don’t embarrass us both by trying foreplay. I’m not going to enjoy this, whatever you do.”</i> Again you say nothing. You slide your hand across the plain of her lower stomach,");
		if(chars["SERA"].hasCock()) output(" momentarily grasp her thick, semi-erect cock and give it a playful tug,");
		output(" and then with a soft “ah”, as if you’ve just discovered something important, squeeze between the warmth of her thighs and touch her bare pussy.");
		output("\n\n<i>“Pretty wet, for a girl who isn’t enjoying this,”</i> you murmur in her ear, gently parting her folds and sinking a finger into her delta.");
		output("\n\n<i>“That’s how it always is, jerk,”</i> she retorts. <i>“To do with the mods I took, not you.”</i> You fancy there is just the slightest tremble in her voice and you grin, sinking another finger in as you carefully explore her moist, silky folds.");
		if(chars["SERA"].vaginas[0].hymen)
		{
			output(" Your fingers touch an obstruction, a membrane stretched across her vagina proper. Sera tenses up slightly as you do.");
			output("\n\n<i>“Of all the things you’ve done to me, that’s got to be the creepiest,”</i> she snarls. <i>“Gonna fantasize you’re taking my virginity? I’ve had things up me that would make you piss yourself. I’m going to remind you of that when you decide to break it.”</i> You " + (!pc.isBimbo() ? "laugh softly" : "giggle") + ".");
			output("\n\n<i>“It’s there as a reminder,”</i> you tell her. <i>“I’m not going to use that hole until you ask me to. When I do break it, it’ll be because you were begging me to do it.”</i>");
			output("\n\n<i>“In your fucking dreams!”</i>");
		}
		output("\n\nYou travel upwards and easily find the sturdy nub of her clit, protruding out of her lips as it is. You circle and then gently play with it, nudging and sliding over it as you continue to run your fingers over her silky, gooey pink slit.");
		if(chars["SERA"].hasCock()) output(" As you do so you slide your other hand upwards, grasping her cock and begin to jerk her, tightening, softening and bending your grasp around her thick meat.");
		output("\n\n<i>“Why... why are you doing this?”</i> Sera grunts, flexing her arms helplessly against her bonds. <i>“If you’re going to fuck me, fuck me! Get it over with!”</i> You ignore her and continue to use your questing fingers to work her pussy into a lather");
		if(chars["SERA"].hasCock()) output(" and her prick into a full, straining erection");
		output(". It’s easy enough to turn such a highly sexed creature on but you pay careful attention to her, trying to note what movement of your hands particularly makes her tighten her muscles, arch her back, gasp with involuntary pleasure.");
		if(pc.isBimbo())
		{
			output("\n\n<i>“Doesn’t this feel goooood?”</i> you purr into Sera’s ear. Feeling her wriggle and squirm is turning you on");
			if(pc.hasVagina()) output(", your [pc.vaginas] moistening until " + (pc.vaginas.length == 1 ? "it is" : "they are") + " in almost the same state as your slave’s");
			output(". You feel a warm, benevolent glow towards her for making you feel nice, however unwillingly. <i>“Isn’t it nice when good friends play together? I don’t know why you have to be such a silly head and act grumpy all the time.”</i>");
			output("\n\nFinally you are flicking");
			if(chars["SERA"].hasCock()) output(", pumping");
			output(" and fingering her wickedly enough for her breath to be whistling through her teeth and flexing her thighs, her pussy juices running down your hand in rivulets");
			if(chars["SERA"].hasCock()) output(" and pre-cum forming on her cock end");
			output(".");
			output("\n\n<i>“F- fuck! Get me off then! Do it!”</i> she cries out.");
		}
		
		pc.lust(15);
	}
	// 0-40
	else if(obedience <= 40)
	{
		output("You grin at Sera as you pull out the handcuffs out of the silver briefcase, dangling them teasingly in front of her.");
		output("\n\n<i>“Oh goodie, it’s amateur fumble hour again,”</i> she sighs. <i>“Why do you bother with this shit? I’m here for you to get your creepy little nuts off, not for you to imagine you can ever do the same for me.”</i> You ignore her bluster and drop onto the bed next to her, deliberately pushing your weight into her side. She tenses up as you take her hands and cuff them behind her back, forcing her high, plentiful boobs outwards. You slide around so that your [pc.chest] is pushing into her back, your hands roaming across her warm, flawless [sera.skinColor] skin; waiting for her muscles to relax, forcing her to get used to your presence. You breathe gently on her neck as you cup one of her breasts, brushing over the nub of an erect nipple, pressing your hardening [pc.eachCock] into the rise of her round butt, enjoying the fine, pliant give of your slave at your leisure as you work your way downwards.");
		output("\n\nYou feel something moving fretfully by your thigh and swiftly reach down to catch her tail, trapping it in your armpit. She shifts uncomfortably as you slide your hand across the plain of her lower stomach,");
		if(chars["SERA"].hasCock()) output(" momentarily grasp her thick, semi-erect cock and give it a playful tug,");
		output(" and then squeeze between the warmth of her thighs and touch her bare pussy.");
		output("\n\nAs ever, it’s wet and eager despite her protestations. You travel upwards and easily find the sturdy nub of her clit, protruding out of her lips as it is. You circle and then gently play with it, nudging and sliding over it as you continue to run your fingers over her silky, gooey pink slit.");
		if(chars["SERA"].hasCock()) output(" As you do so you slide your other hand upwards, grasping her cock and begin to jerk her, tightening, softening and bending your grasp around her thick meat.");
		output("\n\nSera grunts, flexing her arms helplessly against her bonds. She knows it’s useless to struggle or to exhort you to fuck her, so she attempts to take your teasing with as much decorum as she can muster. It’s a game, and you enjoy playing it. You use your questing fingers to work her pussy into a lather");
		if(chars["SERA"].hasCock()) output(" and her prick into a full, straining erection");
		output(" as ever paying careful attention to her, trying to note what movement of your hands particularly makes her tighten her muscles, arch her back, gasp with involuntary pleasure despite herself.");
		if(pc.isBimbo())
		{
			output("\n\n<i>“Doesn’t this feel goooood?”</i> you purr into Sera’s ear. Feeling her wriggle and squirm is turning you on");
			if(pc.hasVagina()) output(", your [pc.vaginas] moistening until " + (pc.vaginas.length == 1 ? "it is" : "they are") + " in almost the same state as your slave’s");
			output(". You feel a warm, benevolent glow towards her for making you feel nice, however unwillingly. <i>“Isn’t it nice when good friends play together? I don’t know why you have to be such a silly head and act grumpy all the time.”</i>");
			output("\n\nFinally you are flicking");
			if(chars["SERA"].hasCock()) output(", pumping");
			output(" and fingering her wickedly enough for her breath to be whistling through her teeth and flexing her thighs, her pussy juices running down your hand in rivulets");
			if(chars["SERA"].hasCock()) output(" and pre-cum forming on her cock end");
			output(".");
			output("\n\n<i>“F- fuck! Get me off then! Do it!”</i> she cries out.");
		}
		
		pc.lust(15);
	}
	// 41-80
	else
	{
		output("You grin at Sera as you pull out the handcuffs out of the silver briefcase, dangling them teasingly in front of her.");
		output("\n\n<i>“Going to ‘reward’ me, are you?”</i> she purrs. She shifts her hips upwards on the bed, displaying her trim, gleaming pussy to you");
		if(chars["SERA"].hasCock()) output(" and letting her tumescent prick flop volubly onto the duvet");
		output(". <i>“It’d better be good. I’ve been ever so good today.”</i>");
		output("\n\nYou drop onto the bed next to her, deliberately pushing your weight into her side, quietly reveling in the tiny sigh she makes as you do. You’ve drilled this game into her enough times that she’s entirely relaxed as you take her hands and cuff them behind her back; but it wouldn’t be a game if she wasn’t competing against you, constantly seeking an advantage. She thrusts her boobs out more than is strictly necessary by her posture, draws another low sigh out, pushes her [sera.skinColor], warm-smelling flesh into your hands as you gaze over your shoulder in a mocking, sultry manner, sneering wickedly.");
		output("\n\n<i>“Better get on with it,”</i> she whispers. <i>“Wouldn’t want you to jizz everywhere before you’ve even tried to do anything with me.”</i>");
		output("\n\nYou squeeze one of her breasts in response, sinking your fingers deep into the softness there, making her exaggeratedly catch her breath. It is honestly difficult to not get aroused by the nearness of her exquisitely crafted body and her teasing. [pc.EachCock] hardens against her round behind");
		if(pc.hasVagina()) output(" as your " + (pc.vaginas.length == 1 ? "pussy juices itself" : "pussies juice themselves") + " eagerly");
		output(" to the sight and sound of her. But you do your best to put your own heat out of mind for now, concentrating closely on your prize slut. You keep one hand clasped around her boob as you slide your other down flawless [sera.skinColor] skin; you brush over the nub of an erect nipple at the same time as you swab the flat plain of her stomach, inexorably sinking downwards.");
		if(chars["SERA"].hasCock()) output(" You grasp her cock and wring it gently, gently applying pressure to the areas of the dense, blunt flesh that you know are the most sensitive. It only takes a few seconds of your touch for it to strain upwards urgently, reacting to you exactly like a slave’s tool should.");
		output(" Finally, you squeeze between the warmth of her thighs and touch her bare pussy.");
		output("\n\nIt’s wet and eager as ever, beading lustily onto your fingers, conditioned now to practically sit up and beg for you. You travel upwards and easily find the sturdy nub of her clit, protruding out of her lips as it is. You circle and then gently play with it, nudging and sliding over it as you continue to run your fingers over her silky, gooey pink slit.");
		if(chars["SERA"].hasCock()) output(" As you do so you slide your other hand upwards, grasping her cock and begin to jerk her, tightening, softening and bending your grasp around her thick meat.");
		output(" Sera grunts, flexing her hands in her bonds. She knows it’s useless to struggle or to exhort you to fuck her, but she’s since worked out a better way of fighting back. She pushes her pear of a behind back into you, sinuously writhing her form so it melds with your own, rubbing " + (pc.cocks.length == 1 ? "your erect cock" : "each of your erect cocks") + " and [pc.nipples] insistently, trying the very best she can to make you focus on your own lust rather than hers.");
		output("\n\nYou grit your teeth and focus on working her pussy into a lather");
		if(chars["SERA"].hasCock()) output(" and her prick into a full, straining erection");
		output(". You know now exactly how to touch her, what parts of her soaked folds to touch to excite and engorge her, make her nerve clusters bloom and blood vessels reach needily to the surface of her skin. You tighten your grip on her breast, rubbing her erect nipple between your fingers as you inundate a similar stubborn nub in her pussy with attention, stroking and circling her clit insistently. It’s difficult to tell how much she’s exaggerating her moans and gasps, but they are full-blooded and there’s nothing artificial about the way she’s pumping her thighs into your hand. The spaded tip of the tail trapped against your side touches your ear, and you suddenly feel light-headed.");
		output("\n\n<i>“Go on,”</i> says a teasing voice. <i>“Do it.”</i>");
		
		pc.lust(35);
	}
	
	processTime(6);
	
	// [Release] [Deny]
	clearMenu();
	// If PC lust >75%:
	if(obedience > 40 && pc.lustQ() > 75)
	{
		addDisabledButton(0, "Release");
		addDisabledButton(1, "Deny");
		addButton(14, "Uh-Oh...", seraBitchTrainingTeaseCum);
	}
	else
	{
		addButton(0, "Release", seraBitchTrainingTeaseRelease);
		addButton(1, "Deny", seraBitchTrainingTeaseDeny);
	}
	
	return;
}
public function seraBitchTrainingTeaseRelease():void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	var obedience:Number = seraObedience();
	
	if(flags["SERA_BITCHENING_TEASE_RELEASE"] == undefined || obedience <= 20)
	{
		// Low Arousal:
		if(chars["SERA"].lust() < 33)
		{
			output("You are happy enough to comply, upping the pace of your ministrations, lapping your fingers deep into the ripe, split fruit of the succubus’s sex");
			if(chars["SERA"].hasCock()) output(" as you jerk her straining cock relentlessly");
			output(". Sera arches her back and cries out triumphantly as she reaches her climax, her plush butt pressing into [pc.eachCock] as her pussy spasms and spurts around your sticky fingers");
			if(chars["SERA"].hasCock()) output(", her cock hardening and seizing up in your grasp, forcefully fountaining cum upwards, spattering onto the bed and her thighs");
			output(".");
			output("\n\n<i>“Ahhhh...”</i> she sighs when she’s done, flopping down onto the cover and looking up at you with complacent disregard as you take her cuffs off. <i>“That was a pretty professional jerk off, I’ll give you that. Shame you’re such a massive " + pc.mf("creepazoid", "cow") + ", really – I could have used nice, attentive hands like yours, once.”</i> She closes her inhuman eyes and disappears into a doze.");
			
			processTime(2);
			// -4 Ob, Ar reset
			seraObedience(-4);
			chars["SERA"].orgasm();
		}
		// Medium Arousal:
		else if(chars["SERA"].lust() < 66)
		{
			output("You concentrate, continuing to lap your fingers deep into the ripe, split fruit of the succubus’s sex");
			if(chars["SERA"].hasCock()) output(" and jerk her straining cock relentlessly");
			output(", trying to keep her as close to the edge as you can without clearing it.");
			output("\n\n<i>“Say ‘Please may I cum, [pc.master]’,”</i> you breathe. <i>“Then I’ll let you.”</i>");
			output("\n\n<i>“No! Fuck you!”</i> Sera grits out. You slow your hands down just slightly for about eight seconds and then pick it up again. You don’t know how long you can keep this up – your fingers are sticky and sore and she is champing at the bit, thrusting herself as hard as she can against you, trying to get herself off via her own steam.");
			output("\n\n<i>“Say it,”</i> you insist. <i>“Please may I cum, [pc.master]. It’s so easy... and it’s so close...”</i> The two of you struggle against each other for a while longer - a fretful, dirty battle neither is willing to concede. In the pit of one of her heavy pants you think you hear Sera whisper something. It could have been “please”?... She lunges her hips forward with a triumphant shout, arching her back as she flexes her way to orgasm. Her plush butt presses into [pc.eachCock] as her pussy spasms and spurts around your sticky fingers");
			if(chars["SERA"].hasCock()) output(", her cock seizing up in your grasp, forcefully fountaining cum upwards, spattering onto the bed and her thighs");
			output(".");
			output("\n\n<i>“Ahhhh...”</i> she sighs when she’s done, flopping down onto the cover and looking up at you with complacent disregard as you take her cuffs off. <i>“I told you it was a waste of time, but then I suppose you can’t help being such a massive " + pc.mf("creepazoid", "cow") + ". It’s a shame, too – you’ve got such nice, attentive hands. I could have found a use for you, once.”</i> You say nothing in return, simply gazing at her levelly. You think she’s talking a bit too loud, bit too fast. Maybe you’re imagining it. It could have been any sound she made in the spur of the moment, rearranged by your ears into something you wanted to hear. What you are certain about is she doesn’t look you in the eye before she disappears into a deep, post-coital doze.");
			
			processTime(2);
			// +1 Ob, Ar reset
			seraObedience(1);
			chars["SERA"].orgasm();
		}
		// High Arousal:
		else
		{
			output("You concentrate, continuing to lap your fingers deep into the ripe, split fruit of the succubus’s sex");
			if(chars["SERA"].hasCock()) output(" and jerk her straining cock relentlessly");
			output(", trying to keep her as close to the edge as you can without clearing it.");
			output("\n\n<i>“Say ‘Please may I cum, [pc.master]’,”</i> you breathe. <i>“Then I’ll let you.”</i>");
			output("\n\nSera says nothing, gritting her teeth determinedly. She is deep in the moment; her eyes closed, her muscles knotted up, her arousal so fierce it looks almost painful. You sense an advantage and slow your hands down just slightly for about eight seconds before picking up again. You don’t know how long you can keep this up – your fingers are sticky and sore and she is champing at the bit, thrusting herself as hard as she can against you, trying desperately hard to get off by her own steam. You agonize her, stroking her button");
			if(chars["SERA"].hasCock()) output(" and shifting your grip up her shaft");
			output(" as carefully and deliberately as you can.");
			output("\n\n<i>“Say it,”</i> you insist. <i>“Please may I cum, [pc.master]. It’s so easy... and it’s so close...”</i> Sera’s back is arched, her bound claws snatching helplessly at the air, saliva shining on her parted lips. The two of you struggle against each other for a while longer.");
			output("\n\n<i>“Please let me cum!”</i> Sera cries out at last, the words coming out in an urgent jumble. Immediately you up your rhythm, briskly revving");
			if(chars["SERA"].hasCock()) output(" and cranking");
			output(" her to the high you’ve been keeping just out of her reach. Her eyes roll and her limbs spasm as her pussy clenches up and soaks your fingers");
			if(chars["SERA"].hasCock()) output(", her cock seizing up in your grasp, forcefully fountaining cum upwards, spattering onto the bed and her thighs");
			output(". It’s a pretty breathtaking orgasm, even seen and felt second-hand – her plush butt presses into [pc.eachCock] whilst she throws her frame into each ecstatic contraction, her cuffed hands seeming to force more energy into every other part of her body.");
			output("\n\nYou gently lay her down on her side on a non-soaked part of the bed when she’s finally done, letting the low hum of your voice soundtrack her woozy come down.");
			output("\n\n<i>“See how nice it is when you are a good girl? When you listen to your [pc.master] and follow [pc.his] instructions? You enjoy yourself so much more when you accept my help in becoming an obedient pet.”</i>");
			output("\n\n<i>“Fuck you,”</i> says a tiny, grumpy voice from the other side of the bed. You are grinning as you gently remove her cuffs and leave her to doze.");
			
			processTime(2);
			// +8 Ob, Ar reset
			seraObedience(8);
			chars["SERA"].orgasm();
		}
	}
	else if(obedience <= 40)
	{
		// Low Arousal:
		if(chars["SERA"].lust() < 33)
		{
			output("You are happy enough to comply, upping the pace of your ministrations, lapping your fingers deep into the ripe, split fruit of the succubus’s sex");
			if(chars["SERA"].hasCock()) output(" as you jerk her straining cock relentlessly");
			output(". Sera arches her back and cries out triumphantly as she reaches her climax, her plush butt pressing into [pc.eachCock] as her pussy spasms and spurts around your sticky fingers");
			if(chars["SERA"].hasCock()) output(", her cock hardening and seizing up in your grasp, forcefully fountaining cum upwards, spattering onto the bed and her thighs");
			output(".");
			output("\n\n<i>“Ahhhh...”</i> she sighs when she’s done, flopping down onto the cover and looking up at you with complacent disregard as you take her cuffs off. <i>“That was a pretty professional jerk off, I’ll give you that. Shame you’re such a massive " + pc.mf("creepazoid", "cow") + ", really – I could have used nice, attentive hands like yours, once.”</i> She closes her inhuman eyes and disappears into a doze.");
			
			processTime(2);
			// -4 Ob, Ar reset
			seraObedience(-4);
			chars["SERA"].orgasm();
		}
		// Medium Arousal:
		else if(chars["SERA"].lust() < 66)
		{
			output("You concentrate, continuing to lap your fingers deep into the ripe, split fruit of the succubus’s sex");
			if(chars["SERA"].hasCock()) output(" and jerk her straining cock relentlessly");
			output(", trying to keep her as close to the edge as you can without clearing it.");
			output("\n\n<i>“Say ‘Please may I cum, [pc.master]’,”</i> you breathe. <i>“Then I’ll let you.”</i>");
			output("\n\nSera says nothing, gritting her teeth determinedly. She is deep in the moment; her eyes closed, her muscles knotted up, her arousal so fierce it looks almost painful. You sense an advantage and slow your hands down just slightly for about eight seconds before picking up again. You don’t know how long you can keep this up – your fingers are sticky and sore and she is champing at the bit, thrusting herself as hard as she can against you, trying desperately hard to get off by her own steam. You agonize her, stroking her button");
			if(chars["SERA"].hasCock()) output(" and shifting your grip up her shaft");
			output(" as carefully and deliberately as you can.");
			output("\n\n<i>“Say it,”</i> you insist. <i>“Please may I cum, [pc.master]. It’s so easy... and it’s so close...”</i> Sera’s back is arched, her bound claws snatching helplessly at the air, saliva shining on her parted lips. The two of you struggle against each other for a while longer.");
			output("\n\n<i>“Please let me cum!”</i> Sera cries out at last, the words coming out in an urgent jumble. Immediately you up your rhythm, briskly revving");
			if(chars["SERA"].hasCock()) output(" and cranking");
			output(" her to the high you’ve been keeping just out of her reach. Her eyes roll and her limbs spasm as her pussy clenches up and soaks your fingers");
			if(chars["SERA"].hasCock()) output(", her cock seizing up in your grasp, forcefully fountaining cum upwards, spattering onto the bed and her thighs");
			output(". It’s a pretty breathtaking orgasm, even seen and felt second-hand – her plush butt presses into [pc.eachCock] whilst she throws her frame into each ecstatic contraction, her cuffed hands seeming to force more energy into every other part of her body.");
			output("\n\nYou gently lay her down on her side on a non-soaked part of the bed when she’s finally done, letting the low hum of your voice soundtrack her woozy come down.");
			output("\n\n<i>“See how nice it is when you are a good girl? When you listen to your [pc.master] and follow [pc.his] instructions? You enjoy yourself so much more when you accept you are becoming an obedient pet.”</i>");
			output("\n\n<i>“Fuck you,”</i> says a tiny, grumpy voice from the other side of the bed. You are grinning as you gently remove her cuffs and leave her to doze.");
			
			processTime(2);
			// +1 Ob, Ar reset
			seraObedience(1);
			chars["SERA"].orgasm();
		}
		// High Arousal:
		else
		{
			output("You concentrate, continuing to curl your fingers into the succubus’s cunt");
			if(chars["SERA"].hasCock()) output(" and jerk her straining cock relentlessly");
			output(", trying to keep her as close to the edge as you can without clearing it. She is practically streaming warm lube around your digits, her hips thrusting into your palm, her head thrown back and eyes closed, all snark and obstinacy forgotten.");
			output("\n\n<i>“What do you say?”</i> you demand coolly. She says nothing but moans lowly, a pleading sound. You grin, [pc.eachCock] hardening");
			if(pc.hasVagina()) output(" and your [pc.vaginas] moistening");
			output(" to the sound.");
			output("\n\n<i>“What do you say?”</i> you repeat.");
			output("\n\n<i>“Please may I cum, [pc.master]!”</i> she cries out, color blooming in her cheeks. Immediately you up your rhythm, briskly revving");
			if(chars["SERA"].hasCock()) output(" and cranking");
			output(" her to the high you’ve been keeping just out of her reach. Her eyes roll and her limbs spasm as her pussy clenches up and soaks your fingers");
			if(chars["SERA"].hasCock()) output(", her cock seizing up in your grasp, forcefully fountaining cum upwards, spattering onto the bed and her thighs");
			output(". It’s a pretty breathtaking orgasm, even seen and felt second-hand – her plush butt presses into [pc.eachCock] whilst she throws her frame into each ecstatic contraction, her cuffed hands seeming to force more energy into every other part of her body.");
			output("\n\nYou gently lay her down on her side on a non-soaked part of the bed when she’s finally done.");
			output("\n\n<i>“Good girl,”</i> you say softly. She looks up at you, panting lightly, sweat dappling her naked skin. She looks completely different in this moment – an unsure, muddled look in her eyes, her features naked and soft without the scorn which usually guards and tightens them. You decide to step back and allow her to enjoy the glow of being a good girl for now.");
			
			processTime(2);
			// +8 Ob, Ar reset
			seraObedience(8);
			chars["SERA"].orgasm();
		}
	}
	else
	{
		// Low Arousal:
		if(chars["SERA"].lust() < 33)
		{
			output("It is perfectly lovely in the moment, driven by the heft of her warm flesh and the sensual fireworks show she’s treating you to, to consent and send her flying down that hill. You up the pace of your ministrations, lapping your fingers deep into her pussy");
			if(chars["SERA"].hasCock()) output(" as you jerk her straining cock relentlessly");
			output(", touching the spots you know will drive her inhuman eyes up into their sockets. Sera arches her back and cries out triumphantly as she reaches her climax, her plush butt pressing into [pc.eachCock] as her pussy spasms and spurts around your sticky fingers");
			if(chars["SERA"].hasCock()) output(", her cock hardening and seizing up in your grasp, forcefully fountaining cum upwards, spattering onto the bed and her thighs");
			output(".");
			output("\n\n<i>“Ahhhh...”</i> she sighs when she’s done, flopping down onto the cover and looking up at you with lazy, happy complacency. <i>“So good. So obedient.”</i>");
			output("\n\nYou fervently hope, taking off her cuffs as she drifts off into a peaceful doze, that she was referring to herself rather than you.");
			
			processTime(2);
			// Ob -4, Ar reset
			seraObedience(-4);
			chars["SERA"].orgasm();
		}
		// Medium/High Arousal:
		else
		{
			output("You concentrate, continuing to curl your fingers into the succubus’s cunt");
			if(chars["SERA"].hasCock()) output(" and jerk her straining cock relentlessly");
			output(", trying to keep her as close to the edge as you can without clearing it. Eventually Sera abandons any conscious motive, drawn irresistibly into the soaking heat you’ve stoked between her legs, thrusting her thighs against you instinctively");
			if(chars["SERA"].hasCock()) output(", her cock straining backwards, oozing pre-cum plaintively");
			output(". She practically streams warm lube around your digits, her hips thrusting into your palm, her head thrown back and eyes closed, all needle and obstinacy forgotten.");
			output("\n\n<i>“What do you say?”</i> you demand coolly. She says nothing but moans lowly, a pleading sound. You grin, [pc.eachCock] hardening");
			if(pc.hasVagina()) output(" and your [pc.vaginas] moistening");
			output(" to the sound.");
			output("\n\n<i>“What do you say?”</i> you repeat.");
			output("\n\n<i>“Please may I cum, [pc.master]!”</i> she cries out, color blooming in her cheeks. Immediately you up your rhythm, briskly revving");
			if(chars["SERA"].hasCock()) output(" and cranking");
			output(" her to the high you’ve been keeping just out of her reach. Her eyes roll and her limbs spasm as her pussy clenches up and soaks your fingers");
			if(chars["SERA"].hasCock()) output(", her cock seizing up in your grasp, forcefully fountaining cum upwards, spattering onto the bed and her thighs");
			output(". It’s a pretty breathtaking orgasm, even seen and felt second-hand – her plush butt presses into [pc.eachCock] whilst she throws her frame into each ecstatic contraction, her cuffed hands seeming to force more energy into every other part of her body.");
			output("\n\nYou gently lay her down on her side on a non-soaked part of the bed when she’s finally done.");
			output("\n\n<i>“Good girl,”</i> you say softly. She looks up at you, panting lightly, sweat dappling her naked skin. She looks completely different in this moment – an unsure, muddled look in her eyes, her features naked and soft without the scorn which usually guards and tightens them.");
			if(chars["SERA"].lust() < 66) output(" You decide to step back and allow her to enjoy the glow of being a good girl for now.");
			else
			{
				output("\n\n<i>“Thank you, [pc.master],”</i> she says, suddenly looking up at you. The sense of naked befuddlement remains. <i>“It was getting... that was... you seem to know when... yeah, thanks.”</i> You curl a hand around her ear and jaw-line");
				if(pc.isBimbo())
				{
					output(" fondly.");
					output("\n\n<i>“I like having fun with you too, silly-head,”</i> you giggle. <i>“You’ve got sharp claws for a pet kitty cat, but that’s what makes it so much fun.”</i>");
				}
				else output(" fondly, enjoying the prize of overcoming her: the sight of the proud demon girl with all her aggro and mind games cast aside, a doe-eyed puddle of pliant flesh who practically purrs to your touch.");
			}
			output("\n\nAfter a few moments she slips into a doze, and you undo her shackles before getting up.");
			
			processTime(9);
			// Ob +8, Ar reset
			seraObedience(8);
			chars["SERA"].orgasm();
		}
	}
	
	pc.lust(15);
	
	IncrementFlag("SERA_BITCHENING_TEASE");
	IncrementFlag("SERA_BITCHENING_TEASE_RELEASE");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	return;
}
public function seraBitchTrainingTeaseDeny():void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	clearMenu();
	
	var obedience:Number = seraObedience();
	var punish:Boolean = false;
	
	if(flags["SERA_BITCHENING_TEASE_DENY"] == undefined || obedience <= 40)
	{
		if(chars["SERA"].hasCock()) output("You keep shifting your hands over her double sex");
		else output("You keep curling your fingers into her");
		output(" with a deceptively steady rhythm, feeling the evidence of her excitement trickling warmly down your fingers, enjoying the heave of her soft flesh against your [pc.chest] and [pc.eachCock]. You keep schlicking");
		if(chars["SERA"].hasCock()) output(" and coiling");
		output(" her until her neck is thrown back, her mouth open, all but tasting the incoming orgasm... and then stop dead.");
		// Low/Medium Arousal:
		if(chars["SERA"].lust() < 66)
		{
			output("\n\n<i>“What... what are you doing? Go! Finish!”</i> she demands angrily, face flushed, flexing her thick hips almost in a panic against your still hands. You let them linger on her sex teasingly for a moment and then withdraw.");
			output("\n\n<i>“That’s enough for today I think,”</i> you say breezily, getting up. <i>“If you’re a really good girl, I’ll let you cum next time. And you know what constitutes a good girl, don’t you?”</i>");
			output("\n\nSera’s response is loud, inventive, colorful, and goes on for the length of time it takes you to unlock her hands.");
			// +15 Ar
			chars["SERA"].lust(35);
		}
		// High Arousal:
		else
		{
			output("\n\n<i>“That’s enough for today I th-”</i> A gush of fluid soaks your hand");
			if(chars["SERA"].hasCock()) output(" and jizz spurts into the air");
			output(" Sera keeps flexing her thick hips against your digits, bumping back into you as she throws her head back and laughs ecstatically. You curse to yourself: you pushed her too far!");
			output("\n\n<i>“Ungh! Good going, " + (pc.isBimbo() ? "you dumb bimbo" : pc.mf("creep", "cow")) + ",”</i> she crows. <i>“You even suck at being an asshole! Mmm... face it, you were born to be a bottom bitch, keeping your hands nice and warm for a mistress who can properly direct your talents. Trying to deny me! What a clumsy embarrassment you are.”</i>");
			output("\n\nYou decide silence is probably the smartest tactic here. You keep a stiff lip as you release her cuffs, resolving to learn from your mistake and never give her the opportunity to taunt you again.");
			// -4 Ob, Ar reset
			seraObedience(-4);
			chars["SERA"].orgasm();
			punish = true;
		}
	}
	else
	{
		output("You steady yourself and");
		if(chars["SERA"].hasCock()) output(" keep shifting your hands over her double sex");
		else output(" keep curling your fingers into her");
		output(" with a deceptively steady rhythm, feeling the evidence of her excitement trickling warmly down your fingers, enjoying the heave of her soft flesh against your [pc.chest] and [pc.eachCock]. Eventually Sera abandons any ulterior motive, drawn irresistibly into the soaking heat you’ve stoked between her legs. You’ve got her in the palm of your hand and you glory in it, drinking in her high scent, her neck is thrown back, her mouth open, all but tasting the incoming orgasm...");
		// Low/Medium Arousal:
		if(chars["SERA"].lust() < 66)
		{
			output(" and then you stop dead.");
			output("\n\n<i>“No... [pc.master], no!”</i> she whines in bitter frustration, humping your frozen hand" + (!chars["SERA"].hasCock() ? "" : "s") + ".");
			output("\n\n<i>“That’s enough for today I think,”</i> you say breezily, getting up. <i>“If you’re a really good girl, I’ll let you cum next time. And you know what constitutes a good girl, don’t you?”</i>");
			if(obedience > 40 && obedience <= 60) output("\n\n<i>“For fuck sake,”</i> she growls, looking up at you with a heady mixture of anger and helpless lust. You are smiling quietly to yourself as you undo her restraints.");
			else if(obedience > 60 && obedience <= 80) output("\n\n<i>“For... flip’s sake,”</i> she says, closing her eyes as she censors herself, savoring the control she exists under now. You are smiling quietly to yourself as you undo her restraints.");
			// Ar +15
			chars["SERA"].lust(35);
		}
		// High Arousal:
		else
		{
			output("\n\n<i>“That’s enough for today I th-”</i> A gush of fluid soaks your hand");
			if(chars["SERA"].hasCock()) output(" and jizz spurts into the air");
			output(" Sera keeps flexing her thick hips against your digits, bumping back into you furiously. You curse to yourself: you pushed her too far!");
			output("\n\n<i>“Ahahahaaa... were you trying to deny me there, [pc.master]?”</i>");
			output("\n\n<i>“Of course not,”</i> you say loftily, disengaging your hands. <i>“You deserved your reward.”</i>");
			output("\n\n<i>“Hmm.”</i> Sera looks at you over her shoulder as if she’s seeing you with an illusion partially dispelled. A tail spade caresses your ear. <i>“Of course I did. [pc.Master].”</i>");
			// Ob -4, Ar reset
			seraObedience(-4);
			chars["SERA"].orgasm();
			punish = true;
		}
	}
	
	pc.lust(15);
	
	processTime(2);
	IncrementFlag("SERA_BITCHENING_TEASE");
	IncrementFlag("SERA_BITCHENING_TEASE_DENY");
	
	addButton(0, "Next", mainGameMenu);
	if(punish) addButton(1, "Punish", seraBitchTrainingPunish, undefined, "Punish", "Punish Sera for being a bad slave.");
	
	return;
}
public function seraBitchTrainingTeaseCum():void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	output("You can’t help yourself... you gasp as you seize up and cum, rutting reflexively against her [sera.skinColor] behind as [pc.eachCock] surges cum up her back and onto the quilt");
	if(pc.hasVagina()) output(", your [pc.vaginas] clenching up and wetting " + (pc.vaginas.length == 1 ? "itself" : "themselves") + " in sympathy");
	output(", lost in the sight and sound of the succubus.");
	output("\n\n<i>“Oh deeeaaaar,”</i> coos Sera with wicked triumph, adroitly clenching her butt-cheeks to milk your cock for all its worth. <i>“[pc.Master] has gone and messed [pc.him]self before [pc.he] could do anything at all with me! What a shaaaaame.”</i> She puts on a mockingly questioning tone. <i>“I wonder – should [pc.master] really be the one in charge if [pc.he] has so little control over [pc.him]self, let alone anyone else?”</i>");
	output("\n\n<i>“I’ll make you pay for that next time,”</i> you say with as much confidence as you can muster, once the juicy, guiltily pleasurable pulses have finished and you have disengaged yourself, dripping, from her overwhelmingly hot body. But you don’t think you’re convincing either of you.");
	
	processTime(2);
	// -7 Obedience
	seraObedience(-7);
	pc.orgasm();
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	return;
}
public function seraBitchTrainingTeaseFinale():void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	var fits:int = pc.cockThatFits(chars["SERA"].vaginalCapacity(0));
	if(fits < 0) fits = pc.smallestCockIndex();
	
	output("You grin at Sera as you pull out the handcuffs out of the silver briefcase, dangling them teasingly in front of her.");
	output("\n\nSera doesn’t say anything this time; skin flushed and gently biting her lip, she gets on all fours and pushes her butt out, sliding her hand between her thighs to trail wetness from her bare pussy");
	if(!chars["SERA"].hasCock()) output(" along her stomach");
	else output(" along her thickening erection");
	output(", giving you the eyes as she does. You feel a surge of triumphant passion at the sight: your once obstinate, obnoxious demon girl wantonly advertising her need to you. It’s time to finish this.");
	output("\n\nYou drop onto the bed next to her, deliberately pushing your weight into her side, quietly reveling in the tiny sigh she makes as you do. You’ve drilled this routine into her enough times that she’s entirely relaxed as you take her hands and cuff them behind her back. She thrusts her boobs out more than is strictly necessary by her posture, draws another low sigh out, pushes her warm-smelling [sera.skinColor] flesh into your hands as you gaze over your shoulder in a mocking, sultry manner, sneering wickedly.");
	output("\n\n<i>“Better get on with it,”</i> she whispers. <i>“Wouldn’t want you to jizz everywh-”</i> You don’t let her finish. You grasp her behind the head and kiss her roughly, mashing your [pc.lips] into hers as you take one of her breasts and squeeze it, sinking your fingers deep into the softness there, rolling your fingertips over an erect nipple. Her hot breath touches the back of your throat as she responds, opening her mouth to wrap her tongue wetly around yours whilst writhing her body against your form, trying as ever to lose you in the wonderful shift and touch of her body.");
	output("\n\nYou are beyond playing that game, though – you know who here really needs this. You suddenly heft her forwards, taking your kiss with it as you splay her hips, allowing you to push your thickening [pc.cock " + fits + "] between her thighs, using the delightful, soft friction there to become fully erect. She gasps into your mouth as you touch her sopping heat with it, flexing your [pc.hips] to rub it teasingly over her entrance, smoothing back and forth across the stubborn nub of her bulging clit.");
	if(!chars["SERA"].hasCock()) output(" You keep your hand where it is, molding it ruthlessly into her breast, trapping her nipple in alternating squeezes and caresses.");
	else output(" You let your hand sink down her exquisitely crafted body and grasp her cock, wringing it with flicks of the wrist, applying pressure to the areas of the dense, blunt flesh that you know are the most sensitive. It only takes a few seconds of your touch for it to strain upwards urgently, reacting to you exactly like a slave’s tool should.");
	output("\n\nShe grasps the significance of what you are doing and feebly struggles, pushing her bound hands into your stomach and whipping her tail against your back, but you both know it is just for show, a front which disappears as you rhythmically rub your hard cock along her soaked, puffy mons. You grasp her breast");
	if(chars["SERA"].hasCock()) output(" and cock");
	output(" tightly, trapping her in yourself for long moments as you slowly, tortuously masturbate her with gentle thrusts of your hips; glorying in the sight and sound of her, neck arched, mouth open and eyes closed, unable to do anything but emit tight gasps and frost your [pc.cock " + fits + "] to a shine with her excitement. You lightly pick up the pace, bumping into her bulging clit with your [pc.cockhead " + fits + "] insistently.");
	output("\n\n<i>“Whose bitch are you?”</i> Sera says nothing. You slow down");
	if(chars["SERA"].hasCock()) output(", quitting rubbing her straining dick as you do so");
	output(", and she whimpers a bit. You pick up the pace again, knowing through long experience exactly how fast to go to keep her pinned on the edge, trapped in a moment of intense heat.");
	output("\n\n<i>“Whose bitch are you?”</i> you husk again.");
	output("\n\n<i>“You... nngh... you. I’m your bitch. Now please...”</i> You reposition yourself, grasping her arms to push her butt out so that your cockhead is at the very entrance of her cunt, parting her lips with it ever-so-gently.");
	output("\n\n<i>“Please is a good word,”</i> you say softly. <i>“Is there anything else you want to say? Because I think otherwise we’re done for today.”</i> You withdraw and she practically barks with frustration, her arms tensing up in your grasp. Still relentlessly compressing her nipple");
	if(chars["SERA"].hasCock()) output(" and cock");
	output(" you push your erection all the way through her thighs before sliding it backwards, letting her feel every lubricated inch of it on her button.");
	
	pc.cockChange();
	
	output("\n\n<i>“F-fuck! Fine! Fuck me, [pc.master]! Please fuck me like the bitch I am, you complete cunt!”</i> she cries out, batting her fists in pure frustration against your stomach. You laugh fondly.");
	output("\n\n<i>“Good girl.”</i> You position your cock in front of her entrance again and with one exultant thrust penetrate her wet heat");
	if(pc.cLength(fits) < 11.5) output(" up to the quick, your abdomen meeting her wide, jiggling buttocks");
	output(".");
	if(chars["SERA"].vaginas[0].hymen)
	{
		output(" Something gives in front of your cock and Sera gasps and tenses up slightly in pain. You grin, glorying in this moment.");
		output("\n\n<i>“What a good girl,”</i> you croon. <i>“Keeping your virginity safe all this time for your rightful [pc.master] to take. Shame about the filthy mouth, but that’s what " + pc.mf("masters", "mistresses") + " are for – to fuck all of that impropriety right out of your pretty little head.”</i>");
	}
	
	if(chars["SERA"].vaginas[0].hymen) flags["SERA_VIRGINITY_TAKEN"] = 1;
	chars["SERA"].cuntChange(0, pc.cockVolume(fits));
	
	output("\n\nHer pussy is delightful, long and practically frictionless with lubrication but wonderfully tight from disuse. It parts and clings to your [pc.cock " + fits + "] as you thrust deep into her, intent on stretching wide and owning every inch. You keep your hands where they are, continuing to ruthlessly grope her sensitised nipples");
	if(chars["SERA"].hasCock()) output(" and jerking her cock with hard, powerful pistons of the wrist");
	output(". Sera squirms her curvy body wonderfully around you, bending your meat this way and that inside herself, panting heavily and moaning with each drive of your [pc.hips] into her. Despite all this, and the fact she was hovering on the edge even before you started dicking her, she still can’t seem to reach orgasm. You grin hugely as you realize what the issue is.");
	output("\n\n<i>“You can’t do it, can you? Not now. Not without me telling you to.”</i> Her inhuman eyes roll up to meet yours, pleading. <i>“Cum,”</i> you say commandingly, as you spear");
	if(pc.cLength(fits) >= 18) output(" as much of your huge cock into her as you can");
	else output(" every inch of your cock into her");
	output(". Immediately Sera tenses up, howling in gratification as her pussy tightens up around you, dribbling femjizz onto " + (pc.balls <= 0 ? "the sheets" : "your [pc.balls]"));
	if(chars["SERA"].hasCock()) output(", her cock spurting lines of creamy white filth the length of the bed");
	output(". You keep pumping into her as she writhes in the throes of orgasm, keeping a steady pace and grip on your own ardour. You aren’t done yet.");
	output("\n\nThrough the long minutes of the fierce, lush rutting that follows you reposition her, letting your hands roam over her body as you push and pull her this way and that, only ever pulling your cock free of the soaking suck of her sex in order to drive into it even harder from another angle. You bounce her big, soft behind in your " + (!pc.isNaga() ? "lap" : "coils") + " face-to-face for a time, your fingers in her mouth as you lick then chew upon her cherry-like nipples, waiting for the grunts to turn into groans around your digits before ordering her to cum again. Sera contracts in helpless delirium on top of your [pc.cock " + fits + "], breasts");
	if(chars["SERA"].hasCock()) output(" and dick");
	output(" bouncing as she squirts around you, your bodies grinding into each other urgently.");
	output("\n\nFinally you bend her over, pushing her face into the duvet as you pummel into her raised, supplicant behind for all you are worth. You admire the sight before you, the long, sweat-dappled pear shape of your slave, her cuffed hands clutching up as you ram into the tight stem of her sex, her [sera.skinColor] bum jiggling delightfully with each impact of your [pc.hips], her tail wagging fitfully. This position clearly suits her, your [pc.cock " + fits + "] curling into her in a way which makes her twinge and coo. It pleases you that despite all her prior attitude and arrogance, this is the posture she actually enjoys the best – ass up, face down, taking it like an obedient bitch should.");
	if(flags["SERA_BITCHENING_BUTTFUCK"] != undefined) output(" No wonder she makes such a good buttslut.");
	output(" The thought makes your heat rise, and you allow it to now, fucking into her hard as your cock begins to bulge, the obscene sound of your hips");
	if(pc.balls > 0) output(" and [pc.balls]");
	output(" smacking into her filling your ears. Her tail whips excitedly back and forth in front of your vision and you grasp its tip, bringing it down to press against the pucker of her anus.");
	output("\n\n<i>“Does the slut want to shamelessly wet herself around my cock again?”</i> you breathe, with some difficulty now your heart is beating its way out of your chest and your own high is at the door. <i>“She’s going to have to ask nicely if so.”</i>");
	output("\n\n<i>“Please, [pc.master],”</i> comes the muffled, moaned response. You sink the blunt, spaded tip into her behind, and when she tenses up and shrills with orgasm you join her, your straining prick dilating and then unloading its thick payload deep in her, pulsing again and again as her contracting pussy milks you for all it is worth.");
	if(pc.cumQ() >= 2000) output(" You keep pumping, profoundly enjoying the release as you surge quarts of cum into her, obeying the innate impulse to bury your copious amounts of seed deep, packing her womb and tunnel full. By the time you are finished she looks two months pregnant, her stomach bulging with it.");
	output("\n\nWhen you are finally done you withdraw, enjoying Sera’s tired groan and the trails of jizz which come oozing out of her pulverised, gaping twat as you do so. You lie down, undo her cuffs and gently pull her onto your [pc.chest], enjoying the warmth of the afterglow with her.");
	output("\n\n<i>“Maybe – maybe you aren’t such a bad dom after all, " + pc.mf("creep", "cow") + ",”</i> she whispers, a ghost of her old smirk on her face. You look down at her fondly. The backchat and attitude will never entirely leave her – she needs that in some essential way – but the assertiveness in her eyes is now overlaid with infatuation and you know what is in your arms now is a completely willing, if fairly unruly pet.");
	output("\n\nAfter you’ve cuddled her a bit longer you get up, redress and get back to it, taking a glow of deep self-satisfaction with you.");
	
	processTime(32);
	
	knockUpSeraChance();
	chars["SERA"].orgasm();
	pc.orgasm();
	
	IncrementFlag("SERA_BITCHENING_TEASE");
	IncrementFlag("SERA_BITCHENING_SEXED");
	flags["SERA_OBEDIENCE_MIN"] = 80;
	seraObedience(8);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	return;
}

// Tease (FemPC variant)
// No-cock vag-havers get this. No, herms don’t get to choose because continuity headaches.
public function seraBitchTrainingFemTease():void
{
	var obedience:Number = seraObedience();
	var vIdx:int = rand(pc.vaginas.length);
	
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	// First
	if(flags["SERA_BITCHENING_TEASE"] == undefined && obedience <= 40)
	{
		output("<i>“On all fours,”</i> you say breezily. Sera insolently stares at you for as long as she thinks she can get away with before complying, slowly shifting around on the bed so her hands and knees are sunk into the quilt. You work your way around her, enjoying the sight of her plump [sera.skinColor] butt in the air and her juicy thick cock dangling heavily downwards. It is this latter article that you wrap a hand around and begin to slowly jerk, letting the fingers of your other hand roam up the shallow valley of her back, gently sinking them into one of her generous breasts.");
		output("\n\n<i>“So, what,”</i> sneers Sera, almost laughing as her male sex swells and hardens underneath your touch, <i>“you bought me so you could jerk me off? Could’ve done that without ruining my life, you know. Would’ve been all for it. Got some well-practiced wrists there.”</i> You brush over the nub of an erect nipple and bend down to her ear before responding, never stopping your grip shifting up and down her hot meat, tightening and loosening rhythmically.");
		output("\n\n<i>“This is the only way you will be getting release in the foreseeable future, dear,”</i> you breathe. <i>“Not when I’m riding you and certainly not by whacking off like a hormonal teenager; like this, bent over and getting a nice milking from your [pc.master].”</i>");
		output("\n\n<i>“You’re fucking insane,”</i> the demon snaps, craning her head away from you. <i>“Fumble over my dick while breathing through your mouth if you like, not as if I can stop you. But if you think you’re going to make it mean more than the palm of my hand you’re mistaken, sick " + pc.mf("prick", "bitch") + ".”</i>");
		output("\n\nYou ignore her bluster and deliberately push your [pc.chest] into her side, waiting for her muscles to relax, forcing her to get used to your presence, enjoying the fine, pliant give of your slave all the while. You slowly coil her, feeling all the way up and down her shaft, trying to seek out particularly sensitive spots that make her twitch and bulge in your grip. With the other hand you slide back down, over her big round bottom and between the warmth of her thighs to touch her bare pussy.");
		output("\n\n<i>“Pretty hard and wet, for a girl who isn’t enjoying this,”</i> you murmur in her ear, gently parting her folds and sinking a finger into her delta.");
		output("\n\n<i>“That’s how it always is, jerk,”</i> she retorts. <i>“To do with the mods I took, not you.”</i> You fancy there is just the slightest tremble in her voice and you grin, sinking another finger in as you carefully explore her moist, silky folds, tantalizing her female sex before withdrawing, picking up the pace of her date with Rosie Palms as you do.");
		output("\n\nSera tries to say something else, but it’s lost in a breathless grunt as you knead her full, straining erection with everything you’ve got, whipping your tight grip up and down it, circling first one erect nipple then the other as you do. It’s easy enough to turn such a highly sexed creature on but you pay careful attention to her, trying to note what movement of your hands particularly makes her tighten her muscles, arch her back, tail flick spasmodically, gasp with involuntary pleasure.");
		output("\n\n<i>“F- fuck! Get me off then! Do it!”</i> she cries out at last.");
		
		pc.lust(15);
	}
	// 0-40
	else if(obedience <= 40)
	{
		output("Grinning, you tell her to get on all fours.");
		output("\n\n<i>“Oh goodie, it’s amateur fumble night again,”</i> Sera sighs. <i>“Why do you bother with this shit? Slithering over me like the world’s creepiest ona-hole. It’s embarrassing.”</i>");
		output("\n\nYou ignore her bluster and patiently wait for her to assume the position - on her bed, bum in the air, ample breasts and cock dangling downwards. You clamber up there yourself and deliberately press your weight into her side, stroking a finger down the curving depression of her spine, waiting for the tenseness in her muscles to dissipate. Once you feel she’s used to your presence, you dip your hand below her flat stomach and grasp her, as ever, semi-erect dick.");
		output("\n\nYou know there’s a grain of truth to her sniping - you’ve going to have to be able to really push her buttons if this mode of training is going to work. So as you shuffle your grip up and down her increasingly hard and hot meat, you let your other hand travel over the succubus’s fantastically modified body: over the peachy rise of her behind, across her nipples, along the nape of her neck and behind her pointed ears, trying to listen closely to when her breath catches or when her muscles tense up again to what you are doing. Sera accepts this in what she probably imagines is stoical, long-suffering silence, eyes closed, tail flicking spasmodically and jerking her hips into your tight grip as she increasingly gets into it.");
		output("\n\nYou lead your hand backwards to the moist cleft of her female sex, opening and caressing her inner lips. It’s easy to find the sturdy nub of her clit, protruding out of her lips as it is. You circle and then gently play with it, nudging and sliding over it as you continue to jerk her, tightening, softening and bending your grasp around her thick cock. When her pussy is practically frothing with arousal, you switch your focus to the sensitive nubs of her nipples, playing and sliding over them with sex-slicked fingers.");
		output("\n\nFinally you are fingering and pumping her wickedly enough for her breath to be whistling through her teeth and flexing her thighs, cock dark and arching urgently in the shifting, softening, tightening swivel of your hand.");
		output("\n\n<i>“F- fuck! Get me off then! Do it!”</i> she cries out.");
		
		pc.lust(15);
	}
	// 41-80
	else
	{
		output("<i>“On all fours,”</i> you say briskly.");
		output("\n\n<i>“My cock-obsessed ‘[pc.master]’ has come to give me a handjob,”</i> Sera purrs. <i>“Isn’t that nice.”</i> She holds your gaze with her luminescent eyes and rolls onto one side on the bed, letting her breasts shift and her hefty cock flop volubly onto the covers. <i>“Go on and reward me, then,”</i> she husks. <i>“I’ve been ever so good lately.”</i>");
		output("\n\nYou drop onto the bed next to her, deliberately pushing your weight into her side, quietly reveling in the tiny sigh she makes as you do. You’ve drilled this game into her enough times that she’s entirely relaxed as you clasp your hand around the girth of her penis; but it wouldn’t be a game if she wasn’t competing against you, constantly seeking an advantage. She pushes her boob out more than is strictly necessary when you cusp it, draws another low sigh out, letting her warm-smelling [sera.skinColor] flesh swell into your hands as she gazes over her shoulder in a mocking, sultry manner, sneering wickedly.");
		output("\n\n<i>“Better get on with it,”</i> she whispers. <i>“It’d be terrible to discover you enjoy this far more than I do, wouldn’t it?”</i>");
		output("\n\nYou squeeze the breast in your hand response, sinking your fingers deep into the softness there, making her exaggeratedly catch her breath. It is honestly difficult to not get aroused by the nearness of her exquisitely crafted body and her teasing, [pc.eachVagina] juicing " + (pc.vaginas.length == 1 ? "itself" : "themselves") + " up eagerly to the touch, sight and sound of her. But you do your best to put your own heat out of mind for now, concentrating closely on your prize slut. Your fingers catch and caress the nipple of the breast you have clasped as you begin to shift your grip up and down her girthy dick, quickly pulling it to full-veined mast with slow, steady pumps of the wrist.");
		output("\n\nYou know by now exactly which areas on her dense, blunt meat to concentrate pressure on, where to send the pads of your fingers curling to, to make her twelve inch monster strain urgently downwards, reacting to your touch exactly as a slave’s tool should. When it’s there, thrumming with barely-contained imperative and Sera’s breath is hissing through her teeth, you soften your kneading slightly, keeping her positioned there near the edge whilst your other hand goes roaming. You cusp her plump balls, swollen with single-minded need, give them a gentle, teasing squeeze. Then you slide your hand between her thick thighs and touch her bare pussy, trace her wet lips and then easily find the sturdy nub of her clit, protruding eagerly outwards as it is. You circle and then gently play with it, nudging and sliding over it as you continue to run your fingers tantalizingly down and up her cock.");
		output("\n\nSera grunts, muscles knotted in her neck, claws clutching the duvet helplessly. She knows it’s useless to affect indifference or to exhort you to fuck her - but she’s since worked out a better way of fighting back. She sinuously writhes her form, butt and breasts jiggling, drawing you further and further into the delight of touching and teasing her over-sexed form. You’re feeling hot and slightly unfocused when blunt pressure snakes into the entrance of your [pc.vagina " + vIdx + "], spreading your lips and pressing against your sensitive inner walls. Your [pc.lips] form an “o” shape as Sera skilfully slides her tail tip over your [pc.clit] and then spears inwards, filling it with firm warmth, the sly succubus having kept her lithe dick-tipped appendage limp beneath you, waiting on tenterhooks all along.");
		output("\n\nIn the heat of the moment it’s too pleasurable to climb down and force her to stop - you continue to jerk her whilst she spears her thick, ropy tail into your increasingly wet sex, sensation shivering into your core. You grit your teeth and try and keep focused, tightening your grip on her heaving breast, rubbing her erect nipple between your fingers as you rub her engorged frenulum closely. It’s difficult to tell how much she’s exaggerating her moans and gasps, but there’s nothing artificial about the way she’s pumping her thighs into your hand, translating that into writhing her tail into you. She gazes over her shoulder, yellow eyes slit, and caresses your g-spot. You suddenly feel very light-headed.");
		output("\n\n<i>“Go on,”</i> says a teasing voice. <i>“Do it.”</i>");
		
		pc.lust(35);
	}
	
	processTime(6);
	
	// [Release] [Deny]
	clearMenu();
	// If PC lust >75%:
	if(obedience > 40 && pc.lustQ() > 75)
	{
		addDisabledButton(0, "Release");
		addDisabledButton(1, "Deny");
		addButton(14, "Uh-Oh...", seraBitchTrainingTeaseFemCum, vIdx);
	}
	else
	{
		addButton(0, "Release", seraBitchTrainingTeaseFemRelease);
		addButton(1, "Deny", seraBitchTrainingTeaseFemDeny);
	}
	
	return;
}
public function seraBitchTrainingTeaseFemRelease():void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	var obedience:Number = seraObedience();
	
	if(flags["SERA_BITCHENING_TEASE_RELEASE"] == undefined || obedience <= 20)
	{
		// Low Arousal:
		if(chars["SERA"].lust() < 33)
		{
			output("You are happy enough to comply, upping the pace of your ministrations, jerking her bulging cock relentlessly until the succubus arches her back and cries out triumphantly as she reaches her climax, plush breast heaving in your hand as her cock seizes up in your grasp again and again, spurting a fountain of cum onto the duvet, spattering onto the bed and her thighs.");
			output("\n\n<i>“Ahhhh...”</i> she sighs when she’s done, flopping down onto the cover next to the generous mess she’s made and looking up at you with complacent disregard, oozing cock lolling. <i>“That was a pretty professional jerk off, I’ll give you that. Shame you’re such a massive " + pc.mf("creepazoid", "cow") + ", really – I could have used nice, attentive hands like yours, once.”</i> She closes her yellow eyes and disappears into a doze.");
			
			processTime(1);
			// -4 Ob, Ar reset
			seraObedience(-4);
			chars["SERA"].orgasm();
		}
		// Medium Arousal:
		else if(chars["SERA"].lust() < 66)
		{
			output("You concentrate, slowing the relentless jerking of her bulging cock just slightly, trying to keep her as close to the edge as you can without clearing it.");
			output("\n\n<i>“Say ‘Please may I cum, [pc.master]’,”</i> you breathe. <i>“Then I’ll let you.”</i>");
			output("\n\n<i>“No! Fuck you!”</i> Sera grits out. You wind your hand down almost all the way for about eight seconds, down to a teasing fondle along her swollen frenulum and then pick it up again. You don’t know how long you can keep this up – your wrist is sore and she is champing at the bit, thrusting herself as hard as she can into your grip, trying to get off via her own steam.");
			output("\n\n<i>“Say it,”</i> you insist. <i>“Please may I cum, [pc.master]. It’s so easy... and it’s so close...”</i> The two of you struggle against each other for a while longer - a fretful, dirty battle neither is willing to concede. In the pit of one of her heavy pants you think Sera whisper something. It could have been “please”?... She lunges her hips forward with a triumphant shout, arching her back as she flexes her way to orgasm. Her plush breast heaves in your hand as her cock seizes up in your grasp again and again, spurting a fountain of cum onto the duvet, spattering onto the bed and her thighs.");
			output("\n\n<i>“Ahhhh...”</i> she sighs when she’s done, flopping down onto the cover next to the mess she’s made and looking up at you with complacent disregard. <i>“I told you it was a waste of time, but then I suppose you can’t help being such a massive " + pc.mf("creepazoid", "cow") + ". It’s a shame, too – you’ve got such nice, attentive hands. I could have found a use for you, once.”</i> You say nothing in return, simply gazing at her levelly. You think she’s talking a bit too loud, bit too fast. Maybe you’re imagining it. It could have been any sound she made in the spur of the moment, rearranged by your ears into something you wanted to hear. What you are certain about is she doesn’t look you in the eye before she disappears into a deep, post-coital doze.");
			
			processTime(2);
			// +1 Ob, Ar reset
			seraObedience(1);
			chars["SERA"].orgasm();
		}
		// High Arousal:
		else
		{
			output("You concentrate, slowing the relentless jerking of her bulging cock just slightly, trying to keep her as close to the edge as you can without clearing it.");
			output("\n\n<i>“Say ‘Please may I cum, [pc.master]’,”</i> you breathe. <i>“Then I’ll let you.”</i>");
			output("\n\nSera says nothing, gritting her teeth determinedly. She is deep in the moment; her eyes closed, her muscles knotted up, her arousal so fierce it looks almost painful. Sensing an advantage, you wind your hand down almost all the way for about eight seconds, down to a teasing fondle along her swollen frenulum and then pick it up again. You don’t know how long you can keep this up – your wrist is sore and she is champing at the bit, thrusting herself as hard as she can into your grip, trying to get off via her own steam. You catch an erect nipple between your fingers and rub them together.");
			output("\n\n<i>“Say it,”</i> you insist. <i>“Please may I cum, [pc.master]. It’s so easy... and it’s so close...”</i> Sera’s back is arched, claws scrunching the sheets, saliva shining on her parted lips. The two of you struggle against each other for a while longer.");
			output("\n\n<i>“Please let me cum!”</i> Sera cries out at last, the words coming out in an urgent jumble. Immediately you up your rhythm, briskly cranking her to the high you’ve been keeping just out of her reach. Her eyes roll and her limbs spasm as her cock seizes up in your grasp, forcefully spattering cum onto the bed in an uncontrolled fountain, a dribble of pussy juice rolling down her thigh. It’s a pretty breathtaking orgasm, even seen and felt second-hand – her plush breast heaves into your hand whilst she throws her frame into each ecstatic contraction.");
			output("\n\nYou gently lay her down on her side on a non-soaked part of the bed when she’s finally done, letting the low hum of your voice soundtrack her woozy come down.");
			output("\n\n<i>“See how nice it is when you are a good girl? When you listen to your [pc.master] and follow [pc.hisHer] instructions? You enjoy yourself so much more when you accept my help in becoming an obedient pet.”</i>");
			output("\n\n<i>“Fuck you,”</i> says a tiny, grumpy voice from the other side of the bed. You are grinning as you get up and leave her to doze.");
			
			processTime(2);
			// +8 Ob, Ar reset
			seraObedience(8);
			chars["SERA"].orgasm();
		}
	}
	else if(obedience <= 40)
	{
		// Low Arousal:
		if(chars["SERA"].lust() < 33)
		{
			output("You are happy enough to comply, upping the pace of your ministrations, jerking her bulging cock relentlessly until the succubus arches her back and cries out triumphantly as she reaches her climax, plush breast heaving in your hand as her cock seizes up in your grasp again and again, spurting a fountain of cum onto the duvet, spattering onto the bed and her thighs.");
			output("\n\n<i>“Ahhhh...”</i> she sighs when she’s done, flopping down onto the cover next to the generous mess she’s made and looking up at you with complacent disregard, oozing cock lolling. <i>“That was a pretty professional jerk off, I’ll give you that. Shame you’re such a massive " + pc.mf("creepazoid", "cow") + ", really – I could have used nice, attentive hands like yours, once.”</i> She closes her inhuman eyes and disappears into a doze.");
			
			processTime(1);
			// -4 Ob, Ar reset
			seraObedience(-4);
			chars["SERA"].orgasm();
		}
		// Medium Arousal:
		else if(chars["SERA"].lust() < 66)
		{
			output("You concentrate, slowing the relentless jerking of her bulging cock just slightly, trying to keep her as close to the edge as you can without clearing it.");
			output("\n\n<i>“Say ‘Please may I cum, [pc.master]’,”</i> you breathe. <i>“Then I’ll let you.”</i>");
			output("\n\nSera says nothing, gritting her teeth determinedly. She is deep in the moment; her eyes closed, her muscles knotted up, her arousal so fierce it looks almost painful. Sensing an advantage, you wind your hand down almost all the way for about eight seconds, down to a teasing fondle along her swollen frenulum and then pick it up again. You don’t know how long you can keep this up – your wrist is sore and she is champing at the bit, thrusting herself as hard as she can into your grip, trying to get off via her own steam. You catch an erect nipple between your fingers and rub it slowly.");
			output("\n\n<i>“Say it,”</i> you insist. <i>“Please may I cum, [pc.master]. It’s so easy... and it’s so close...”</i> Sera’s back is arched, claws scrunching the sheets, saliva shining on her parted lips. The two of you struggle with each other on the precipice for a while longer.");
			output("\n\n<i>“Please let me cum!”</i> Sera cries out at last, the words coming out in an urgent jumble. Immediately you up your rhythm, briskly cranking her to the high you’ve been keeping just out of her reach. Her eyes roll and her limbs spasm as her cock seizes up in your grasp, forcefully spattering cum onto the bed in an uncontrolled fountain, a dribble of pussy juice rolling down her thigh. It’s a pretty breathtaking orgasm, even seen and felt second-hand – her plush breast heaves into your hand whilst she throws her frame into each ecstatic contraction.");
			output("\n\nYou gently lay her down on her side on a non-soaked part of the bed when she’s finally done, letting the low hum of your voice soundtrack her woozy come down.");
			output("\n\n<i>“See how nice it is when you are a good girl? When you listen to your [pc.master] and follow [pc.hisHer] instructions? You enjoy yourself so much more when you accept my help in becoming an obedient pet.”</i>");
			output("\n\n<i>“Fuck you,”</i> says a tiny, grumpy voice from the other side of the bed. You are grinning as you get up and leave her to doze.");
			output("\n\nYou concentrate, slowing the relentless jerking of her bulging cock just slightly, trying to keep her as close to the edge as you can without clearing it. She is practically dripping pre-cum, and small trickles of female excitement are working their way down her hips; she is thrusting herself into the carefully judged rub of your palm, her head thrown back and eyes closed, all snark and obstinacy forgotten.");
			
			processTime(2);
			// +1 Ob, Ar reset
			seraObedience(1);
			chars["SERA"].orgasm();
		}
		// High Arousal:
		else
		{
			output("<i>“What do you say?”</i> you demand coolly. She says nothing but moans lowly, a pleading sound. You grin, [pc.eachVagina] moistening");
			if(pc.hasCock()) output(" and [pc.eachCock] hardening");
			output(" to the sound.");
			output("\n\n<i>“What do you say?”</i> you repeat, closing your fingers around a cherry-like nipple.");
			output("\n\n<i>“Please may I cum, [pc.master]!”</i> she cries out, color blooming in her cheeks. Immediately you up your rhythm, briskly cranking her to the high you’ve been keeping just out of her reach. Her eyes roll and her limbs spasm as her cock seizes up in your grasp, forcefully spattering cum onto the bed in an uncontrolled fountain, a small waterfall of pussy juice rolling down her thighs. It’s a pretty breathtaking orgasm, even seen and felt second-hand – her plush breast heaves into your hand whilst she throws her frame into each ecstatic contraction.");
			output("\n\nYou gently lay her down on her side on a non-soaked part of the bed when she’s finally done.");
			output("\n\n<i>“Good girl,”</i> you say softly. She looks up at you, panting lightly, sweat dappling her naked skin. She looks completely different in this moment – an unsure, muddled look in her eyes, her features naked and soft without the scorn which usually guards and tightens them. You decide to step back and allow her to enjoy the glow of being a good girl for now.");
			
			processTime(2);
			// +8 Ob, Ar reset
			seraObedience(8);
			chars["SERA"].orgasm();
		}
	}
	else
	{
		// Low Arousal:
		if(chars["SERA"].lust() < 33)
		{
			output("It is perfectly lovely in the moment, driven by the pump of her ropey, coiling tail and the heft of her luscious body, to consent and send her flying down that hill. You up the pace of your ministrations, jerking her straining cock relentlessly, touching the spots and squeezing the bands of flesh you know will drive her inhuman eyes up into their sockets. Sera arches her back and cries out triumphantly as she reaches her climax, her tail burying itself as deep as it can into your [pc.vagina " + rand(pc.vaginas.length) + "], plush breast heaving in your hand as her prestigious dick seizes up in your grasp and flexes copious amounts of cum onto the duvet, spattering onto her thighs.");
			output("\n\n<i>“Ahhhh...”</i> she sighs when she’s done, flopping down onto the cover and looking up at you with lazy, happy complacency. <i>“So good. So obedient.”</i>");
			output("\n\nYou fervently hope, taking off her cuffs as she drifts off into a peaceful doze, that she was referring to herself rather than you.");
			
			processTime(1);
			// Ob -4, Ar reset
			seraObedience(-4);
			chars["SERA"].orgasm();
		}
		// Medium/High Arousal:
		else
		{
			output("You steady yourself and keep shifting your hands over her double sex with a deceptively steady rhythm, feeling the evidence of her excitement thrumming hotly under your fingers, enjoying her attempts to pleasure you distantly. Eventually Sera abandons any ulterior motive, drawn irresistibly into the urgent heat you’ve stoked between her legs, her tail squirming inside of you only to the rhythm you’re setting with the flick of your wrist. You catch it and pull it out of you, masturbating its ropy flesh at the same time, a movement that makes her gasp in enjoyment. You’ve got her in the palm of your hand and you glory in it, drinking in her high scent, her neck is thrown back, her mouth open, all but tasting the incoming orgasm.");
			output("\n\n<i>“What do you say?”</i> you demand coolly. She says nothing but moans lowly, a pleading sound. You grin, [pc.eachVagina] moistening");
			if(pc.hasCock()) output(" and [pc.eachCock] hardening");
			output(" to the sound.");
			output("\n\n<i>“What do you say?”</i> you repeat, closing your fingers around a cherry-like nipple.");
			output("\n\n<i>“Please may I cum, [pc.master]!”</i> she cries out, color blooming in her cheeks. Immediately you up your rhythm, briskly cranking her to the high you’ve been keeping just out of her reach. Her eyes roll and her limbs spasm as her cock seizes up in your grasp, forcefully spattering cum onto the bed in an uncontrolled fountain, a small waterfall of pussy juice rolling down her thighs. It’s a pretty breathtaking orgasm, even seen and felt second-hand – her plush breast heaves into your hand whilst she throws her frame into each ecstatic contraction.");
			output("\n\nYou gently lay her down on her side on a non-soaked part of the bed when she’s finally done.");
			if(chars["SERA"].lust() < 66) output("\n\nYou decide to step back and allow her to enjoy the glow of being a good girl for now.");
			else
			{
				output("\n\n<i>“Thank you, [pc.master],”</i> she says, suddenly looking up at you. The sense of naked befuddlement remains. <i>“It was getting... that was... you seem to know when... yeah, thanks.”</i> You curl a hand around her ear and jaw-line");
				if(pc.isBimbo())
				{
					output(" fondly.");
					output("\n\n<i>“I like having fun with you too, silly-head,”</i> you giggle. <i>“You’ve got sharp claws for a pet kitty, but that’s what makes it so much fun.”</i>");
				}
				else output(" fondly, enjoying the prize of overcoming her: the sight of the proud demon girl with all her aggro and mind games cast aside, a doe-eyed puddle of pliant flesh who practically purrs to your touch.");
			}
			output("\n\nAfter a few moments she slips into a doze, and you undo her shackles before getting up.");
			
			processTime(9);
			// Ob +8, Ar reset
			seraObedience(8);
			chars["SERA"].orgasm();
		}
	}
	
	pc.lust(15);
	
	IncrementFlag("SERA_BITCHENING_TEASE");
	IncrementFlag("SERA_BITCHENING_TEASE_RELEASE");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	return;
}
public function seraBitchTrainingTeaseFemDeny():void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	var obedience:Number = seraObedience();
	var punish:Boolean = false;
	
	if(flags["SERA_BITCHENING_TEASE_DENY"] == undefined || obedience <= 40)
	{
		output("You coil her hot cock with a deceptively steady rhythm, feeling the evidence of her excitement thrumming under your fingers, enjoying the heave of her soft flesh against your [pc.chest] and other hand. You keep pulling her until her neck is thrown back, her mouth open, all but tasting the incoming orgasm... and then stop dead.");
		// Low/Medium Arousal:
		if(chars["SERA"].lust() < 66)
		{
			output("\n\n<i>“What... what are you doing? Go! Finish!”</i> she demands angrily, face flushed, flexing her thick hips almost in a panic, attempting to get some friction out of your still hands. You let them linger on her sex teasingly for a moment and then withdraw.");
			output("\n\n<i>“That’s enough for today I think,”</i> you say breezily, getting up. <i>“If you’re a really good girl, I’ll let you cum next time. And you know what constitutes a good girl, don’t you?”</i>");
			output("\n\nSera’s response is loud, inventive, colorful, and goes on for the length of time it takes for you to get up and leave.");
			// +15 Ar
			chars["SERA"].lust(35);
		}
		// High Arousal:
		else
		{
			output("\n\n<i>“That’s enough for today I th--”</i> Her prick arches and swells in your grip, and the next moment generous streams of jizz are guttering out of it. Sera keeps flexing her thick hips, bumping back into you as she throws her head back and laughs ecstatically. You curse to yourself: you pushed her too far!");
			output("\n\n<i>“Ungh! Good going, " + (pc.isBimbo() ? "you dumb bimbo" : pc.mf("creep", "cow")) + ",”</i> she crows. <i>“You even suck at being an asshole! Mmm... face it, you were born to be a bottom bitch, keeping your hands nice and warm for a mistress who can properly direct your talents. Trying to deny me! What a clumsy embarrassment you are.”</i>");
			output("\n\nYou decide silence is probably the smartest tactic here. You keep a stiff lip as you let her go and get up, resolving to learn from your mistake and never give her the opportunity to taunt you again.");
			// -4 Ob, Ar reset
			seraObedience(-4);
			chars["SERA"].orgasm();
			punish = true;
		}
	}
	else
	{
		output("You steady yourself and keep shifting your hands over her double sex with a deceptively steady rhythm, feeling the evidence of her excitement thrumming hotly under your fingers, enjoying her attempts to pleasure you distantly. Eventually Sera abandons any ulterior motive, drawn irresistibly into the urgent heat you’ve stoked between her legs, her tail squirming inside of you only to the rhythm you’re setting with the flick of your wrist. You catch it and pull it out of you, masturbating its ropy flesh at the same time, a movement that makes her gasp in enjoyment. You’ve got her in the palm of your hand and you glory in it, drinking in her high scent, her neck is thrown back, her mouth open, all but tasting the incoming orgasm...");
		// Low/Medium Arousal:
		if(chars["SERA"].lust() < 66)
		{
			output(" and then you stop dead.");
			output("\n\n<i>“No... [pc.master], no!”</i> she whines in bitter frustration, humping your frozen hands.");
			output("\n\n<i>“That’s enough for today I think,”</i> you say breezily, getting up. <i>“If you’re a really good girl, I’ll let you cum next time. And you know what constitutes a good girl, don’t you?”</i>");
			if(obedience > 40 && obedience <= 60) output("\n\n<i>“For fuck sake,”</i> she growls, looking up at you with a heady mixture of anger and helpless lust. You are smiling quietly to yourself as you undo her restraints.");
			else if(obedience > 60 && obedience <= 80) output("\n\n<i>“For... flip’s sake,”</i> she says, closing her eyes as she censors herself, savoring the control she exists under now. You are smiling quietly to yourself as you undo her restraints.");
			// Ar +15
			chars["SERA"].lust(35);
		}
		// High Arousal:
		else
		{
			output("\n\n<i>“That’s enough for today I th--”</i> Her cock arches in your hand and then spurts a huge load of cum practically the length of Sera herself, flexing repeatedly in your hot hand. You curse to yourself: you pushed her too far!");
			output("\n\n<i>“Ahahahaaa... were you trying to deny me there, [pc.master]?”</i>");
			output("\n\n<i>“Of course not,”</i> you say loftily, disengaging your hands. <i>“You deserved your reward.”</i>");
			output("\n\n<i>“Hmm.”</i> Sera looks at you over her shoulder as if she’s seeing you with an illusion partially dispelled. A wet tail spade caresses your ear. <i>“Of course I did. [pc.Master].”</i>");
			// Ob -4, Ar reset
			seraObedience(-4);
			chars["SERA"].orgasm();
			punish = true;
		}
	}
	
	pc.lust(15);
	
	processTime(2);
	IncrementFlag("SERA_BITCHENING_TEASE");
	IncrementFlag("SERA_BITCHENING_TEASE_DENY");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	if(punish) addButton(1, "Punish", seraBitchTrainingPunish, undefined, "Punish", "Punish Sera for being a bad slave.");
	
	return;
}
public function seraBitchTrainingTeaseFemCum(vIdx:int = 0):void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	output("You can’t help yourself... you gasp as you seize up around her tail and cum, rutting reflexively around her [sera.skinColor] appendage behind as your [pc.vagina " + vIdx + "] clenches up again and again, dribbling [pc.girlCum] onto the quilt, lost in the exquisite movements of the succubus.");
	output("\n\n<i>“Oh deeeaaaar,”</i> coos Sera with wicked triumph, collapsing onto her side and clutching her own engorged dick, gloatingly watching you as she writhes her tail into you. <i>“[pc.Master] has gone and got [pc.him]self all in a tizzy before [pc.he] could do anything at all with me! What a shaaaaame.”</i> She puts on a mockingly questioning tone. <i>“I wonder – should [pc.master] really be the one in charge if [pc.he] has so little control over [pc.him]self, let alone anyone else?”</i>");
	output("\n\n<i>“I’ll make you pay for that next time,”</i> you say with as much confidence as you can muster, once the juicy, guiltily pleasurable pulses have finished and you have disengaged yourself, dripping, from her overwhelmingly hot body. But you don’t think you’re convincing either of you.");
	
	processTime(2);
	// -7 Obedience
	seraObedience(-7);
	pc.orgasm();
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	return;
}

// Ride
public function seraBitchTrainingRide():void
{
	var obedience:Number = seraObedience();
	var vIdx:int = pc.cuntThatFits(chars["SERA"].cockVolume(0));
	if(vIdx < 0) vIdx = pc.biggestVaginaIndex();
	var tinyVag:Boolean = (pc.vaginalCapacity(vIdx) < chars["SERA"].cockVolume(0) || pc.vaginas[vIdx].looseness() < 4);
	
	if(flags["SERA_TALKS_IMPREGNATE"] >= 2)
	{
		seraBitchImpregnateRide(vIdx, tinyVag);
		return;
	}
	
	// Final
	// Requires: 80 obedience, medium/high lust
	if(obedience >= 80 && chars["SERA"].lust() >= 33 && pc.lust() >= 33)
	{
		seraBitchTrainingRideFinale(vIdx);
		return;
	}
	
	clearOutput();
	showSera(true);
	author("Nonesuch");
	clearMenu();
	
	// First
	if(flags["SERA_BITCHENING_RIDE"] == undefined)
	{
		output("<i>“On your back,”</i> you order. Sera rolls over lazily on her bunk, making it look like a whim of hers rather than a follow of your command.");
		output("\n\n<i>“Got an itch, bitch?”</i> she smirks. She opens her thick [sera.skinColor] hips to give her fat dick room. Given the spotlight, there’s no denying it is a magnificent, intimidating member; a hairless base reaching upwards into a full foot of veined bulge that’s never entirely flaccid, framed by two well-formed, swollen balls. It’s small wonder she’s spent most of her adult life trying to stick it into anything that twitches. You would if you owned that");
		if(pc.hasCock())
		{
			output(" even on top of the one");
			if(pc.cocks.length != 1) output("s");
			output(" you already have");
		}
		output(", too. The muscles in her thigh clench and it rears upwards, almost at her command.");
		output("\n\n<i>“Think you can stop drooling long enough to remember what it is you wanted to do with me?”</i> the succubus sneers. Idly she wraps her fingers around the base of her dick and flicks the ring of one of her nipple piercings, considering you with sensuous, heavy-lidded disdain. <i>“So this is it, is it? You took my fucking life away, just so you could imagine yourself " + pc.mf("king", "queen") + " shit of turd mountain, and then get some hot dick up you? Could’ve given you that, if you’d just asked nicely.”</i> She sniffs, hand gently caressing her cock, tightening it into a full erection. <i>“I should tell you to fuck off, but it’s not like I’ve got anything better to do, so if you want to have a suck, you may as well go ahead. Do a decent enough job and you might just get me in the mood to wreck that prissy little pussy of yours, who knows...”</i>");
		output("\n\n<i>“");
		// Hard/Nice:
		if(pc.isAss() || pc.isNice()) output("Do please be quiet.");
		// Misc:
		else output("Your penis is saying a lot of silly things, dear. Try and get a handle on it, ok?");
		output("”</i> You’re not having those wandering hands of hers for what you’ve got planned, and you rummage around in your Starter Kit for a solution. It has one; a very straightforward and satisfying one. Sera rolls her eyes when you dangle the silver handcuffs in front of her teasingly.");
		output("\n\n<i>“So what you’re saying is, you’ve never even done rope work before,”</i> she jeers. When you sit on the bed next to her, pushing your [pc.chest] into her side, she sits up and allows you to cuff her hands behind her back, but keeps up her constant diatribe. <i>“Do you think throwing some chains on me are going to suddenly make me pleased about being a slave, you " + (pc.isBimbo() ? "stupid bimbo" : pc.mf("sick creep", "psycho bitch")) + "? Couldn’t you have just bought a dildo like anyone else? Or can you not get wet unless you’re making someone’s life a misery?...”</i> She doesn’t stop until you’ve shifted around back to the front and slapped her lightly across the face. Outrage chokes her long enough for you to get a few words in.");
		output("\n\n<i>“This is how things are going to be, pet,”</i> you breathe. You trail a finger up the big, straining cock she’s done such a nice job of getting erect, pushing her slowly backwards onto the sheets as you do. You continue talking as you");
		if(!pc.isNude()) output(" dispose of your [pc.gear] and");
		output(" push your [pc.vagina " + vIdx + "] against it, sliding slowly up and down, rubbing the heat and hardness of the demon dick over [pc.eachClit] and your inner lips rhythmically, teasing her at the same time as pushing wetness and arousal into your own sex. <i>“I am going to fuck you rotten plenty of times, you don’t have to worry about that. But toys don’t get to cum without permission. So you keep it nice and bottled up for our milking sessions, ok?”</i> You gently circle her bulging crown with a pinkie. <i>“Then... maybe then, if you’re good and ask politely... I’ll give you release.”</i>");
		output("\n\n<i>“Shove it up your ass,”</i> snarls Sera throatily, yellow eyes flicking between your teasing finger and your face. <i>“I get off when I want, where I want. If you use me, I’m gonna cream-pie the fuck out of you. Least you fucking deserve.”</i> With your other hand, you lazily lift the collar control; you always keep it close by when you’re dealing with your demon slave. You play with the big, red button at its center. The bound succubus beneath you tenses up, muscles in her proud face clenching as she glares at the device.");
		output("\n\n<i>“Then you’ll get punished,”</i> you say simply. You prop yourself up so you are balanced above her, the bulb of her cockhead pushing open the lips of your [pc.vagina " + vIdx + "]. <i>“And you won’t enjoy it anywhere </i>near<i> as much. Remember...”</i> You sink downwards, closing your eyes as you finally envelop that fat, pent-up cock in your wet pussy, the thick bulb of it spreading you wide.");
		output("\n\nYou go slowly at first, enjoying the sensation of Sera’s hard, veiny flesh pressing against your slick walls, rotating your [pc.hips] to bend it back and forth.");
		if(tinyVag) output(" A foot-long fuck-pole is far too much for your tight pussy, really - but you are determined. With each rock of your thighs you work yourself a little looser, able to swallow just a little bit more of your slave’s big dick. The sensation is intense, clenching up your muscles and shivering through your skin, but with each thrust it becomes easier, your sex " + (!pc.isSquirter(vIdx) ? "oozing" : "slavering") + " with deep excitement at being packed out and stretched like this.");
		else output(" Your well-used twat is easily able to glove Sera’s foot-long fuck-pole, which seems to take her by surprise. She grunts as you encompass her almost down to the base easily - cooing with enjoyment at once again filling that wonderful, ravenous hole of yours up with stern cock - before beginning to jounce your [pc.hips] on top of her briskly.");
		
		pc.cuntChange(vIdx, chars["SERA"].cockVolume(0));
		
		output("\n\nSera grits her teeth and gasps occasionally as you ride her, pert, ample breasts heaving as she flexes her own hips, ineffectually trying to fuck you back.");
		output("\n\n<i>“...how do subs even enjoy this?”</i> she barks, back arching, clawed hands pulling angrily at her binds. <i>“So uncomfortable... so frustrating...”</i>");
		output("\n\nYou " + (!pc.isBimbo() ? "laugh softly" : "giggle") + ", the pleasure pulsing up from your [pc.vagina " + vIdx + "] elevated by how you’re making the succulent demoness squirm. She’s your toy now, and you want nothing more to use her relentlessly whilst watching that pretty face of hers tighten up in pure, sexual frustration... but you should pace yourself. Even as your need heightens, and you");
		if(!tinyVag) output(" slap your [pc.butt] down on her [sera.skinColor] thighs again and again, kneading her cock in your cavernous cunt ruthlessly, screwing yourself to orgasm");
		else output(" you work the top half of her cock ruthlessly hard, beads of [pc.femcum] rolling down it, screwing yourself upwards to orgasm");
		output(", it’s in your mind that she is not used to being denied, that you need to treat her carefully to form some control over her.");
		output("\n\n<i>Only the one then,</i> you think to yourself deliriously as your [pc.nipples] " + (pc.hasErectNipples() ? "harden up" : "dribble [pc.femcum]") + " and you clamp your hands down on Sera’s trembling shoulders. <i>Just the one...</i>");
		// Low/Medium Arousal:
		if(chars["SERA"].lust() < 66)
		{
			output("\n\nIt comes like a crashing wave, and you snarl and grunt your high out on top of your succubus slave, your [pc.vagina " + vIdx + "] clenching up around her rod to send pleasure whiplashing through your frame. She groans and writhes around, heightening your own ecstasy as her dick pulls and nudges this way and that into you, a steady stream of filth hissing out between her clenched teeth... but, as you come down, cheeks burning and after-tremors tickling through you, you can feel her dick is still ramrod straight and eagerly primed. You sigh beatifically and thrust your [pc.hips] teasingly, making her twitch.");
			output("\n\n<i>“You’re a good girl for being so obedient,”</i> you coo, slowly lifting yourself off, allowing your juices to " + (!pc.isSquirter() ? "drip down" : "splash down copiously") + " on her groin and her round, tightened up balls. <i>“I’ll be sure to give you a wonderful milking session, if you keep it up.”</i>");
			output("\n\n<i>“Oh, shut up and get these cuffs off me!”</i> snaps Sera gutturally. <i>“If this is the game you want to play, it’s real easy. Just looking at you crawling all over me is enough to make me never want to nut again.”</i> You cuddle into her deliberately when you sit her up and unlock them, making sure she feels the " + ((pc.hasBreasts() || pc.tone <= 70) ? "softness" : "hardness") + " of your [pc.chest]. She squirms away from you the moment she’s free.");
			output("\n\nStill, you quietly think you’ve made a bit of progress here.");
			output("\n\nAfter you’ve rested a bit you put your [pc.gear] back on and leave her be.");
			
			chars["SERA"].lust(35);
			seraObedience(8);
		}
		// High Arousal:
		else
		{
			output("\n\nIt comes like a crashing wave, and you snarl and grunt your high out on top of your succubus slave... she arches her back, and with a single throaty groan of her own pumps into you as far as she can go. You gasp as you feel your [pc.vagina " + vIdx + "] fill out with hot demon spunk.");
			output("\n\n<i>“Ungh! Doesn’t that feel good, you nasty little slut,”</i> she husks. <i>“Using me like a dildo... ahh! Maybe that’ll learn you...”</i> You’re too caught up in your own orgasm to be able to stop, and you simply seize on the delirious shared orgasm and ride it out, enjoying it for what it is. Sera’s cock flops out of your stuffed hole once it’s done, trailing cum after it. She sneers up at you, deeply pleased with yourself.");
			output("\n\n<i>“You’ve got fuck all technique, " + pc.mf("boy", "girl") + ",”</i> she brays. <i>“You couldn’t deny a child fireworks! I’ll slay that pussy any time you like, but if you think I’m not going to pack it full of my cum you’ve got another think coming.”</i>");
			output("\n\n<i>“You’ll learn obedience,”</i> you say as coldly as you can manage, sitting down on the bunk. <i>“One way or another.”</i> A derisive laugh meets this.");
			output("\n\nAfter you’ve rested a bit you put your [pc.gear] back on and leave her be.");
			
			chars["SERA"].lust(35);
			pc.loadInCunt(chars["SERA"], vIdx);
			chars["SERA"].orgasm();
			seraObedience(-6);
		}
		processTime(11);
		pc.orgasm();
		
		addButton(0, "Next", mainGameMenu);
	}
	// 0-40
	else if(obedience <= 40)
	{
		output("You take the handcuffs out of your metal suitcase and dangle them teasingly in front of Sera. She rolls her eyes but - after insolently staring at you for as long as she thinks she can get away with - she assumes the position, sitting up and putting her hands behind her back.");
		output("\n\nAfter you’ve securely fastened and tightened her wrists together, you take off your [pc.gear] and gently push into her from the front, her hard nipples and piercings pressing against your [pc.chest], making her lie back on the sheets. You exhale softly as you slide your [pc.vagina " + vIdx + "] slowly up and down her semi-erect cock, rubbing the heat and hardness of the demon dick over [pc.eachClit] and your inner lips rhythmically, teasing her at the same time as pushing wetness and arousal into your own sex. She may be watching you do all this with a face full of thunder, but she cannot deny her own hyper-sexed nature; it requires the minimum of teasing on your part to make her foot-long cock stand up on end, ready and eager to please.");
		output("\n\n<i>“Remember pet...”</i> you breath, circling her bulging crown with a pinkie. <i>“No cumming.”</i>");
		output("\n\n<i>“Get off and then fuck off, " + pc.mf("creep", "bitch") + ",”</i> is her terse response. You smile at her winningly as you sink downwards, closing your eyes as you envelop that fat, pent-up cock in your wet pussy, the thick bulb of it spreading you wide.");
		
		pc.cuntChange(vIdx, chars["SERA"].cockVolume(0));
		
		output("\n\nYou go slowly at first, enjoying the sensation of Sera’s hard, veiny flesh pressing against your slick walls, rotating your [pc.hips] to bend it back and forth.");
		if(tinyVag) output(" A foot-long fuck-pole is far too much for your tight pussy, really - but you are determined. With each rock of your thighs you work yourself a little looser, able to swallow just a little bit more of your slave’s big dick. The sensation is intense, clenching up your muscles and shivering through your skin, but with each thrust it becomes easier, your sex " + (!pc.isSquirter(vIdx) ? "oozing" : "slavering") + " with deep excitement at being packed out and stretched like this.");
		else output(" Your well-used twat is easily able to glove Sera’s foot-long fuck-pole, which seems to take her by surprise. She grunts as you encompass her almost down to the base easily - cooing with enjoyment at once again filling that wonderful, ravenous hole of yours up with stern cock - before beginning to jounce your [pc.hips] on top of her briskly.");
		output("\n\nSera grits her teeth and gasps occasionally as you ride her, pert, ample breasts heaving as she flexes her own hips, ineffectually trying to fuck you back. She doesn’t say anything though, apparently determined to suffer in silence.");
		output("\n\nYou " + (!pc.isBimbo() ? "laugh softly" : "giggle") + " at her, the pleasure pulsing up from your [pc.vagina " + vIdx + "] elevated by how you’re making the succulent demoness squirm. Watching that proud, pretty face of hers tighten up in pure, sexual frustration never gets old... but you should pace yourself. Even as your need heightens, and you");
		if(!tinyVag) output(" slap your [pc.butt] down on her [sera.skinColor] thighs again and again, kneading her cock in your cavernous cunt ruthlessly, screwing yourself to orgasm");
		else output(" you work the top half of her cock ruthlessly hard, beads of [pc.femcum] rolling down it, using it to screw yourself to orgasm");
		output(", it’s in your mind that she is not used to being denied, that you need to treat her carefully to form some control over her.");
		output("\n\n<i>Only the one then,</i> you think to yourself deliriously as your [pc.nipples] " + (pc.hasErectNipples() ? "harden up" : "dribble [pc.femcum]") + " and you clamp your hands down on Sera’s trembling shoulders. <i>Just the one...</i>");
		// Low/Medium Arousal:
		if(chars["SERA"].lust() < 66)
		{
			output("\n\nIt comes like a crashing wave, and you snarl and grunt your high out on top of your succubus slave, your [pc.vagina " + vIdx + "] clenching up around her rod to send pleasure whiplashing through your frame. She groans and writhes around, heightening your own ecstasy as her dick pulls and nudges this way and that into you, a steady stream of swear words hissing out between her clenched teeth... but, as you come down, cheeks burning and after-tremors tickling through you, you can feel her dick is still ramrod straight and eagerly primed. You sigh beatifically and thrust your [pc.hips] teasingly, making her twitch.");
			output("\n\n<i>“You’re a good girl for being so obedient,”</i> you coo, slowly lifting yourself off, allowing your juices to " + (!pc.isSquirter() ? "drip down" : "splash down copiously") + " on her groin and her round, tightened up balls. <i>“You’ll earn yourself a wonderful milking session sometime, if you keep it up.”</i>");
			output("\n\n<i>“Oh, shut up and get these cuffs off me!”</i> snaps Sera gutturally. <i>“If this is the game you want to play, it’s real easy. Just looking at you crawling all over me is enough to make me never want to nut again.”</i> You cuddle into her deliberately when you sit her up and unlock them, making sure she feels the " + ((pc.hasBreasts() || pc.tone <= 70) ? "softness" : "hardness") + " of your [pc.chest]. She squirms away from you the moment she’s free. Still, you quietly think you’ve made a bit of progress here.");
			output("\n\nAfter you’ve rested a bit you put your [pc.gear] back on and leave her be.");
			
			chars["SERA"].lust(35);
			seraObedience(8);
		}
		// High Arousal:
		else
		{
			output("\n\nIt comes like a crashing wave, and you snarl and grunt your high out on top of your succubus slave... she arches her back, and with a single throaty groan of her own pumps into you as far as she can go. You gasp as you feel your [pc.vagina " + vIdx + "] fill out with hot demon spunk.");
			output("\n\n<i>“Ungh! Doesn’t that feel good, you nasty little slut,”</i> she husks. <i>“Using me like a dildo... ahh! Maybe this’ll learn you...”</i> You’re too caught up in your own orgasm to be able to stop, and you simply seize on the delirious shared orgasm and ride it out, enjoying it for what it is. Sera’s cock flops out of your stuffed hole once it’s done, trailing cum after it. She sneers up at you, deeply pleased with yourself.");
			output("\n\n<i>“You’ve got fuck all technique, " + pc.mf("boy", "girl") + ",”</i> she brays. <i>“You couldn’t deny a child fireworks! I’ll slay your pussy any time you want, but if you think I’m not going to pack it full of cum you’ve got another think coming.”</i>");
			output("\n\n<i>“You’ll learn obedience,”</i> you say as coldly as you can manage, sitting down on the bunk. <i>“One way or another.”</i> A derisive snort meets this.");
			output("\n\nAfter you’ve rested a bit you put your [pc.gear] back on and beat a tactical retreat.");
			
			chars["SERA"].lust(35);
			pc.loadInCunt(chars["SERA"], vIdx);
			chars["SERA"].orgasm();
			seraObedience(-6);
		}
		processTime(11);
		pc.orgasm();
		
		addButton(0, "Next", mainGameMenu);
	}
	// 41-80
	else
	{
		output("You take the handcuffs out of your metal suitcase and dangle them teasingly in front of Sera.");
		output("\n\n<i>“Want a piece, do you?”</i> she smirks, lounging back on her elbows and splaying her smooth hips, allowing her semi-tumescent herm cock to flop onto the sheets with an audible thump. <i>“Knock yourself out, " + pc.mf("boy", "girl") + "friend,”</i> she breathes, vindictiveness edging her stagey, leisured tones. <i>“It’s always fun watching you ride that stuck-up attitude of yours out on me.”</i>");
		output("\n\nShe’s definitely shifted her tactics, given up on her old surliness; she gasps theatrically when you grasp her wrists and firmly buckle them behind her back, coos when you shift back around and push her down, trapping her beneath your [pc.hips]. She grins up toothily when you brush the base of her dick with your [pc.vagina " + vIdx + "], and she clenches her thigh; her massive prick rears upwards like a well-trained animal, erect almost on request. You give her a cool raise of the eyebrow and gently lead your pussy up her shaft, bumping your [pc.clit] along her bulging flesh until it keens with pleasure.");
		output("\n\n<i>“Remember pet,”</i> you say, clasping her shoulders. <i>“No cumming.”</i>");
		output("\n\n<i>“That’s impossible, isn’t it?”</i> she leers. <i>“You cum your silly brains out after thirty seconds alone with me. Oh, you’re talking about me! Well. I’ll guess we’ll just have to see...”</i> the last word is a drawn out, pleasured sigh as you sink your [pc.vagina " + vIdx + "] down on her big, smooth head.");
		
		pc.cuntChange(vIdx, chars["SERA"].cockVolume(0));
		
		output("\n\nYou go slowly at first, enjoying the sensation of Sera’s hard, veiny flesh pressing against your slick walls, rotating your [pc.hips] to bend it back and forth within you.");
		if(tinyVag) output(" A foot-long demon fuck-pole is far too much for your tight pussy, really - but you are utterly determined. With each rock of your thighs you work yourself a little looser, able to swallow just a little bit more of your slave’s big dick. The sensation is intense, clenching up your muscles and shivering through your skin, but with each thrust it becomes easier, your sex " + (!pc.isSquirter(vIdx) ? "oozing" : "slavering") + " with deep excitement at being packed out and stretched like this.");
		else output(" Your well-used twat is easily able to glove Sera’s foot-long fuck-pole. She opens her mouth in pure enjoyment as you encompass her almost down to the base easily - cooing with enjoyment at once again filling that wonderful, ravenous hole of yours up with stern cock - before beginning to jounce your [pc.hips] on top of her briskly.");
		output("\n\nShe never stops grinning up at you, luminescent eyes bobbing as you bounce up and down on her");
		if(pc.hasBreasts()) output(", [pc.chest] jouncing as ecstasy pulses through you");
		output(". She’s used to this treatment now and scornfully displaying it, attempting to make a mockery of your use of her. Time to up the ante, you think. Her mouth opens as you take hold of her tit piercings, playing with them with cruel gentleness, sliding your fingers over the hardening nubs of her nipples, the bite of the lip this finally draws from her heightening the pleasure of your fast-approaching orgasm. When it’s on top of you, you crook a finger into each brass ring and pull firmly upwards, delighting in the gasped curse this draws.");
		output("\n\nYou snarl and sigh your high out on top of your succubus slave, your [pc.vagina " + vIdx + "] clenching up around her rod, release whiplashing through your frame. Sera does her level best to keep her cool, but she cannot stop arching her back, gritting her teeth, caught up in the agonizing pleasure of it. It surely occurs to her to just let go and surge her rich, rude load deep into you... but, as you come down, cheeks burning and after-tremors tickling through you, you can feel her dick is still ramrod straight and eagerly primed. The arrogant smirk is beaming back up at you by the time you’re done.");
		output("\n\n<i>“Enjoy yourself?”</i>");
		output("\n\n<i>“Reasonably, pet,”</i> you sigh, and give her a teasing flex of your [pc.hips], making her twitch. <i>“But one time isn’t really enough, is it?”</i>");
		output("\n\n<i>“Don’t...”</i> she growls, and then closes her eyes and grits her teeth again as you begin to ride her afresh, working her cock ruthlessly deep within you.");
		
		processTime(10);
		pc.lust(30);
		
		// [pb]
		addButton(0, "Next", seraBitchTrainingRidePtII, vIdx);
	}
	
	IncrementFlag("SERA_BITCHENING_RIDE");
	
	return;
}
public function seraBitchTrainingRidePtII(vIdx:int = 0):void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	output("Your initial lust bitten, you slow yourself right down, taking all the time in the world to enjoy your slave’s dick");
	if(pc.isSquirter(vIdx)) output(", your over-juiced pussy slathering it and her tender balls in [pc.femcum]");
	output(". You gently clench it within you with rolls of the thighs, letting your hands roam over her fabulously perverse body as you do, tweaking and stroking her breasts, her lips, her horns, her ears; murmuring how proud you are of her for holding it back this long, letting your own occasional gasp of pleasure echo into her ears. Sera takes it all stoically, breath huffing through her clenched teeth, apparently ignoring your words and wandering hands, but unable to stop tensing up her trapped arms and arching her back from time to time, apparently lost in the fierce arousal you’ve pressed upon her. Is she learning to love this, being trained to deny herself, becoming the perfect fuck toy? Or is she simply holding herself back so when she does make a mess of your pussy, it’s absolutely cataclysmic? So difficult to tell beneath all those layers of campiness and aggression she employs. You clutch her soft, heavy breasts and begin to hump her intensely again as a new high approaches.");
	// Low/Medium Ar:
	if(chars["SERA"].lust() + 30 < 100)
	{
		output("\n\nIt comes like a crashing wave, and you snarl and grunt your high out on top of your succubus slave, your [pc.vagina " + vIdx + "] clenching up around her rod to send pleasure whiplashing through your frame. She groans and writhes around, heightening your own ecstasy as her dick pulls and nudges this way and that into you, a steady stream of swear words hissing out between her clenched teeth... but, as you come down, cheeks burning and after-tremors tickling through you, you can feel her dick is still ramrod straight and eagerly primed. You sigh beatifically and thrust your [pc.hips] teasingly, making her twitch.");
		output("\n\n<i>“You’re a good girl for being so obedient,”</i> you coo, slowly lifting yourself off, allowing your juices to " + (!pc.isSquirter() ? "drip down" : "splash down copiously") + " on her groin and her round, tightened up balls. <i>“You’ll earn yourself a wonderful milking session sometime, if you keep it up.”</i>");
		output("\n\n<i>“How nice,”</i> she replies nonchalantly, rubbing her wrists after you take the cuffs off. <i>“So pleasant to have a silly sl- sorry, [pc.master] as obsessed with dick as you.”</i> Her nipples are nubby spikes and her face is as flushed as her thickly erect dick though, and she gazes at your departing body with naked, helpless lust. She’s getting worse at disguising her intoxication with your sadistic little games.");
		
		chars["SERA"].lust(35);
		seraObedience(8);
	}
	// High Arousal:
	else
	{
		output("\n\nYour [pc.vagina " + vIdx + "] quivers, your juices running liberally down her rod as you throw your head back, the heat of it making you gasp. It’s then that Sera thrusts her own hips upward and with an exultant crow unloads herself into you, surging cum into your pussy, packing it out with slimy warmth. Caught between anger and irresistible lust, you have no choice but to ride it out, bucking into her hard.");
		output("\n\n<i>“Ahh...”</i> she croons when it’s over, looking up at you with profoundly smug satisfaction. <i>“I love spending time with ‘[pc.master]’. [pc.HisHer] adorable attempts at domination make [pc.himHer] such a good fuck. Be a dear and take these cuffs off now, will you? My arms are starting to ache.”</i>");
		output("\n\n<i>“Maybe I’ll fit you with a cock-ring,”</i> you say, dispassionately raising yourself up and parting your oozing sexes, allowing her cum to dollop back onto her groin and tummy. <i>“Since you’re being so disobedient.”</i> Sera scoffs and rolls over, displaying her high bum to you as she carelessly dragging herself clean on her sheets.");
		output("\n\n<i>“So you have tools to blame instead of yourself next time? It’d suit you.”</i>");
		output("\n\nYou give her what you hope is a stern stare");
		if(!pc.isNude()) output(", redress,");
		output(" and sweep out of her quarters.");
		
		chars["SERA"].lust(35);
		pc.loadInCunt(chars["SERA"], vIdx);
		chars["SERA"].orgasm();
		seraObedience(-6);
	}
	
	processTime(5);
	
	pc.orgasm();
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	return;
}
public function seraBitchTrainingRideFinale(vIdx:int = 0):void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	var tinyVag:Boolean = (pc.vaginalCapacity(vIdx) < chars["SERA"].cockVolume(0) || pc.vaginas[vIdx].looseness() < 4);
	
	output("You smile at Sera and, without saying a word, twirl a finger. The fantastically augmented human flips over onto her back immediately, grinning back... maybe just a little too eagerly.");
	output("\n\n<i>“Ooh, has [pc.master] come for a nice long ride on the Sera train?”</i> she coos, twiddling and tweaking her nipple piercings as she gazes up at you. <i>“I do so enjoy [pc.hisHer], hmm, dominating me.”</i> You are barely listening to her banter, so obvious that it’s all bluff; instead you are paying close attention to her body language, to the quiver beneath her [sera.skinColor] skin, the way her cock is angrily erect just at the sight of you, the anticipation tightening up her muscles and flushing her cheeks. She’s perfect right now, practically crying out for you to take control and use her as hard as you wish.");
	output("\n\nYou feel a steely rush of lust, an urge to force her to admit how much she now enjoys sitting in the palm of your hand. Outwardly, though, you display nothing. You stare her straight in the sulfuric eyes as you climb onto the bed, push your [pc.chest] into her plush boobs as you reach around and cuff her hands securely behind her with a practiced click. You recede, spreading your hands slowly down the softness of her inner thighs, taking your time, reveling in the way the succubus’s poise becomes more and more stretched. Her lips part, slight gasps escape her as you ever-so-gently lead two fingers up her burningly erect cock. It’s beading clear pre, she’s that turned on. Could she cum just from this? Maybe - but she doesn’t.");
	output("\n\n<i>“You’re in luck, dear. I’m in the mood right now,”</i> you husk, leading your [pc.vagina " + vIdx + "] up the hot, stern flesh of her dick, luxuriating in the increasing wetness and heat which pulses through it. <i>“I think I’ll fuck you until you can’t even remember your name.”</i> You perch on top of her bulbous head, gently rotating your [pc.hips], teasing the most sensitive part of her achingly erect male sex. She seems to be in a daze, mouth open and eyes glazed, lost in the tantalizing movement of it. <i>“And what are you going to do?”</i>");
	output("\n\n<i>“Cum,”</i> mumbles Sera. <i>“I mean - not cum. [pc.Master].”</i>");
	output("\n\n<i>“Very good!”</i> you smile widely. She grins back, naked enjoyment shining on her features. Handcuffed and at your disposal.");
	output("\n\nShe lets out a long, drawn-out sigh when you part your pussy lips and sink slowly down onto it. The urge to ride her as hard as you can is almost overwhelming, but you hold that urge back firmly. You go as slowly as you possibly can at first, enjoying the sensation of Sera’s hard, veiny flesh pressing against your slick walls, rotating your [pc.hips] to bend it back and forth within you.");
	if(!tinyVag) output(" You can manipulate her dick however you want in your well-used twat - making her groan hoarsely as you take her down to the base easily, bending it this way and that, clenching your thighs to tighten up on her thick girth. Dreamily you fantasize about using mods to shrink her right down, giving her a small, cute girl dick, humiliating and oh-so sensitive, teasing her forever more... your [pc.vagina " + vIdx + "] " + (!pc.isSquirter(vIdx) ? "beads" : "gushes") + " [pc.femcum] freely at the thought.");
	else output(" You’re used to taking her dick now, it no longer intimidates you - despite how massive the end of it feels in your tight, wet fuck-pocket. It’s intense, getting packed out like this - but is it ideal? Dreamily you fantasize about using mods to shrink her right down, giving her a small, cute girl dick, humiliating and oh-so sensitive, teasing her forever more... your [pc.vagina " + vIdx + "] " + (!pc.isSquirter(vIdx) ? "beads" : "gushes") + " [pc.femcum] freely at the thought.");
	
	pc.cuntChange(vIdx, chars["SERA"].cockVolume(0));
	
	processTime(16);
	
	// [pb]
	clearMenu();
	addButton(0, "Next", seraBitchTrainingRideFinalePtII, vIdx);
	
	return;
}
public function seraBitchTrainingRideFinalePtII(vIdx:int = 0):void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	output("Her mouth hangs open, luminescent eyes bobbing as you methodically work her in your depths, sensually screwing yourself up towards a shimmering release.");
	output("\n\n<i>“Ohh,”</i> she finally groans as the minutes drag out, need roughening her voice. <i>“C’mon [pc.master], don’t tease me like this! If you’re gonna use me, fucking use me...”</i> You close your eyes, basking in the helpless arousal you can hear in her voice, allowing the tenseness within you to release in a glorious high, [pc.vagina " + vIdx + "] quivering and clenching around her cock. When the last pulse of bliss has shaken through you, you lazily open your eyes, reach down and pinch one of Sera’s erect nipples. You bite your lip at the way this makes her gasp and jerk her cock into your tender walls.");
	output("\n\n<i>“You swore, bad girl,”</i> you murmur. <i>“You know what I think when you’re bad?”</i> you rotate your [pc.hips] around her fuck-pole rhythmically, hypnotically. <i>“That you don’t deserve release. That I should fit you with a nice, tight cock ring, maybe a urethra plug as well. Keep you pent up and on the edge for a week.”</i>");
	output("\n\n<i>“No!”</i> she cries, head thrown back, teeth clenched. <i>“I’m good, can’t you feel how f- gosh darn good I am?”</i>");
	output("\n\n<i>“Say it,”</i> you hiss. You’re riding her harder now, the sheer arousal you feel from torturing her like this driving you on, [pc.femcum] filming her swollen balls and thick thighs. <i>“Tell me what a good girl you are... and maybe... just maybe...”</i>");
	output("\n\n<i>“I’m your good girl!”</i> she wails, humping upwards into your [pc.vagina " + vIdx + "] desperately. <i>“I belong to you! Just... please let me cum!”</i> You bite your [pc.lips] in high ecstasy, the fervid writhing and thrusting of your slave’s cock inside you enflaming your senses. You crook a finger into each brass ring of Sera’s tit piercings and pull firmly upwards, the gasp this draws making your coursing, rampant orgasm all the better. As you come down, cheeks burning and after-tremors tickling through you, you can feel her dick is still ramrod straight and eagerly primed. You " + (!pc.isBimbo() ? "laugh" : "giggle") + ", glorying in the state of the demoness, mouth open and eyes rolled back, but still hard as rock within you. It’s possible, just possible, that you’ve rapped it into her hard enough that she cums only on your instruction that that’s the only time she <i>can</i> cum. The thought turns you on, quite frankly.");
	output("\n\n<i>“Just a little more, baby,”</i> you breathe, beginning to rotate your hips on top of her again, squeezing that juicy, obedient dick with your pussy muscles once again. <i>“Your [pc.master] hasn’t quite finished with you yet... but we’re close...”</i> The response is a long, husky moan, which drives you to start fucking her with fervent bounces of your [pc.ass] again.");
	output("\n\nYou slow down, you speed up, you tease every bit of Sera’s luscious body you can reach with your cusping, pinching fingers. This is your reward for all the time and energy you poured into training this foul-mouthed hellion into your perfect cock-bitch, and you bask in it. The pleasure builds into one, final, pulsing orgasm, which you ride out with " + pc.mf("roaring", "squealing") + " ecstasy, clutching the succubus’s [sera.skinColor]’s plump breasts and bending her cock for all it is worth, " + (!pc.isSquirter(vIdx) ? "oozing" : "squirting") + " [pc.femcum] all around it. And yet, when you finally catch your breath, when you finally withdraw, trailing your juices, it’s still pointing straight at the ceiling, still red-raw with denied release, her balls still achingly swollen. She’s too fucked to do anything but gaze at you pleadingly. What a <i>good</i> girl.");
	output("\n\nHolding her gaze, you gently push your loosened, leaking twat against the base of it, enveloping it in your folds; then you deliberately slide upwards, pushing it backwards as you put wet, warm pressure on its sensitive, fleshy underside.");
	output("\n\n<i>“Cum,”</i> you breathe. She opens her mouth and spasms, her cock flexing underneath your slick labia again and again, arching her back against her bonds as she spurts flumes of cum the length of her body, gleefully painting her face and tits in her own filth.");
	output("\n\nWhen she’s down you lie down, undo her cuffs and gently pull her onto your [pc.chest], enjoying the warmth of the afterglow with her.");
	output("\n\n<i>“Maybe – maybe you aren’t such a bad dom after all, " + pc.mf("creep", "cow") + ",”</i> she whispers, a ghost of her old smirk on her face. You look down at her fondly. The backchat and attitude will never entirely leave her – she needs that in some essential way – but the assertiveness in her eyes is now overlaid with infatuation and you know what is in your arms now is a completely willing, if fairly unruly pet.");
	output("\n\nAfter you’ve cuddled her a bit longer you get up, redress and get back to it, taking a glow of deep self-satisfaction with you.");
	
	processTime(25);
	
	pc.loadInCunt(chars["SERA"], vIdx);
	chars["SERA"].orgasm();
	pc.orgasm();
	
	flags["SERA_OBEDIENCE_MIN"] = 80;
	seraObedience(8);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	return;
}


// Buttfuck
public function seraBitchTrainingButtfuck():void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	var obedience:Number = seraObedience();
	var cIdx:int = pc.cockThatFits(chars["SERA"].analCapacity());
	if(cIdx < 0) cIdx = pc.smallestCockIndex();
	
	// 0-40
	if(flags["SERA_BITCHENING_BUTTFUCK"] == undefined || obedience <= 40)
	{
		output("You rummage around in the steel briefcase of your Sentient Acquisitions “starter kit”. Ah: perfect. You grin at Sera as you withdraw the bottle of lube, knowing for all that she’s flopped on her bunk with an air of boredom she is watching your every move closely.");
		output("\n\n<i>“Going to assume that means you want to put it up my butt,”</i> she sighs. Her lip curls. <i>“Seems like the thing to do, since you’ve fucked me in the ass every other way there is.”</i> She shifts over and watches dispassionately as you divest yourself of your [pc.gear] before pooling clear, clinging oil into your hands and curling them around [pc.oneCock], slathering the slickness around it at the same time as drawing warmth and pressure into your groin, quickly making it sternly erect.");
		output("\n\n<i>“On all fours, pet.”</i> After insolently staring you in the face for a while longer Sera obliges. The view from the back is certainly a lot better than the expression currently souring the one from the front; the cute pink of her asshole peeks out between the generous, round hills of her buttocks, above the neat lips of her pussy");
		if(chars["SERA"].hasCock()) output(" and the dangling fruit of her cock and balls");
		output(". Gently you touch her rose, penetrating inwards with your oily fingers. She is delightfully tight, clinging to your digits instinctively before slowly relaxing as you probe deeper.");
		if(pc.isBimbo()) output("\n\n<i>“You’re new to this, aren’t you hun?”</i> you giggle. <i>“Aww, all this time you’ve been doing people in the butt and you never thought to let someone return the favor.”</i> You feel bubbly excitement at the fact you’re going to introduce your pet to something new. <i>“Don’t worry babe, I just know you’re going to love it!”</i>");
		else output("\n\n<i>“You’re actually new to this, aren’t you?”</i> you breathe. <i>“All this time you’ve been sodomizing anything that moves, and never thought to let someone return the favor.”</i> You adopt a mockingly curious tone. <i>“Is it because secretly you knew you’d love being done up the bum, and couldn’t think of a dominant enough way of doing it?”</i>");
		output("\n\n<i>“Get on with it!”</i> she snaps. You flop your slick erection into the valley of her behind, clasp her hips and steadily run it up and down her crack, working the plentiful oil into her [sera.skinColor] flesh, letting it slide down, teasingly running it along her labia");
		if(chars["SERA"].hasCock()) output(" and touching her plump balls and the base of her hanging cock");
		output(". She shifts, agitated, as you bump into the tough button of her clit with your cock head.");
		output("\n\n<i>“Couldn’t you just- ?”</i> she says, with uncharacteristic hesitancy.");
		output("\n\n<i>“Do you in the pussy instead?”</i> you carefully stretch her wet lips wide with it");
		if(chars["SERA"].vaginas[0].hymen) output(", pressing against her hymen");
		output(". <i>“I will " + (chars["SERA"].hasCock() ? "pet" : "hun") + " – but you’re going to have to ask if you ever want me to put it there. " + (chars["SERA"].vaginas[0].hymen ? "You are a virgin, after all" : "Nicely") + ".”</i>");
		output("\n\n<i>“Fuck off!”</i> she spits. You shrug, smirk, and trail " + (pc.cocks.length == 1 ? "your straining cock" : "one of your straining cocks") + " back to the wrinkle of her anus. It’s oiled and gently parted now, the plump flesh surrounding it lavish with lubricant – and it feels fantastically tight when you clutch her hips and slowly but firmly penetrate it.");
		output("\n\nYou have to go slow – Sera is definitely new to this, grunting and growling with discomfort every slick inch you introduce into her constrictive backside, tensing up hard around you every couple of seconds. As slow and stop-start as it is you rather enjoy this learning process, the heat and rings of contraction around your hard cock, giving small words of encouragement to her every time she manages to holster some more of it and remains relaxed when you push back in. She doesn’t respond, but you find yourself fantasizing how good this will feel when she is finally able to take it like a champ; finding this area of callowness in your otherwise experienced succubus and breaking her in is satisfying.");
		// Cock > 11.5 inches:
		if(pc.cLength(cIdx) >= 11.5)
		{
			output("\n\n<i>“F- fucking One!”</i> she cries out as you gently but firmly push yet more of your prestigiously sized dick through her back door. <i>“You’re going to kill me with that thing. If you want to do this can you not make your dick a size which is halfway reasonable?”</i>");
			output("\n\n<i>“This from the girl who used to stick twelve inches up anything that walked through her door without so much as a how do you do,”</i> you " + (!pc.isBimbo() ? "laugh" : "giggle") + ". You lower your voice. <i>“You must have wondered why your sluts kept coming back for it? You’re on the receiving end now – and you’re going to learn to love it. Trust me.”</i>");
		}
		output("\n\nFinally, a small push");
		if(pc.cLength(cIdx) < 11.5) output(" presses your " + (pc.balls > 0 ? "[pc.balls]" : "[pc.thighs]") + " up against her plush butt");
		else output(" slides as much of your over-sized cock into her pretty butthole as you think it’s safe to");
		output(". ");
		if(pc.hasKnot(cIdx)) output(" Your enflamed knot throbs with arousal, willing you to shove it in too - but you hold back on that. Too much, too soon.");
		output(" You stay like that for a few moments, let her get used to the full extent of your hard meat spreading her, and then gently pull in and then out, glorying in the clinging tightness of it, slowly picking up the pace.");
		
		pc.cockChange();
		
		output("\n\n[sera.SkinColor] hands clutch the duvet as you begin to lose yourself in it, your " + (pc.balls > 0 ? "[pc.ballsNoun]" : "hips") + " clapping a merry rhythm on the succubus’s bouncing ass with each returning thrust into that delightfully tight hole. From her hips, you send your hands sliding down her torso, reaching towards her breasts.");
		// Low arousal:
		if(chars["SERA"].lust() < 33) output("\n\n<i>“Don’t,”</i> comes a hate-filled snarl from the other end, muffled by the sheets it’s buried in. <i>“Take what you came here for, but don’t fucking touch me otherwise.”</i> Your hands freeze - but your heat has risen to the point where it’s impossible to be put off your stroke. If she’s determined not to enjoy herself, that’s her problem, you guess. You’re certainly getting what you want out of pounding the tight, clenching tunnel of her ass.");
		// Medium arousal:
		else if(chars["SERA"].lust() < 66) output("\n\n<i>“Don’t...”</i> grunts Sera, muffled by the sheets she’s got her teeth buried in. Emboldened, you cusp her big, pert breasts, gently tweaking and stroking her nipples until they are hard and protuberant as cherries, all the while using those flawless hills as leverage to pound into the tight clenching tunnel of her ass.");
		// High arousal:
		else output("\n\nTeeth buried into the sheets, Sera offers no resistance as your hands travel upwards; a surreptitious check below the steady piston of your cock reveals her distended pussy is gleaming wet with arousal. Grinning, you cusp her big, pert breasts, gently tweaking and stroking her nipples until they are hard and protuberant as cherries, all the while using those flawless hills as leverage to pound into the tight clenching tunnel of her ass. As your heat rises you think you hear a few muffled “whuff”s and “huh”s from the other end of the bed; they don’t sound much like discomfort.");
		output("\n\nYou spear your way in deep as your [pc.cockNoun " + cIdx + "] bulges up and then releases. A sigh of deepest satisfaction leaves your [pc.lips] as you pump your load into Sera’s upturned butt, which jiggles with each returning thrust of your clenching [pc.hips]");
		if(pc.balls > 0) output(" and [pc.balls]");
		output(".");
		if(pc.cumQ() >= 2000) output(" You go on and on, working out every last drop from your bountiful cock, until [pc.cum] is spurting around your girth and the succubus’s belly is rotund, her guts packed with your warmth.");
		output(" When you’ve pulsed your last you pull slowly outwards, fingers trailing down her boobs, enjoying the way her virgin tunnel sucks at your prick all the way out.");
		// Low arousal:
		if(chars["SERA"].lust() < 33)
		{
			output("\n\n<i>“Well, that was about as unpleasant as I imagined being ass-fucked by " + (pc.isBimbo() ? "a stupid bitch" : pc.mf("an utter creep", "a psycho bitch")) + " would be,”</i> says Sera, her voice clipped with angry humiliation. She lies sideways on the bed and considers you with yellow, reptilian loathing. <i>“You know how I cope with this? By imagining I’m doing it to you. Only my dick is covered in barbed wire.”</i>");
			if(pc.isMischievous()) output("\n\n<i>“Stop being so butthurt,”</i> you smirk. You duck a viciously thrown pillow, and beat a tactical retreat.");
			else output("\n\nYou shrug; floating on a delightful post-coital throb, you find it difficult to much care about your slave’s bitterness. " + (!pc.isNude() ? "You pull your [pc.gear] back on and leave" : "After a few moments more rest you get up and leave") + ".");
			
			chars["SERA"].lust(35);
			seraObedience(-5);
		}
		// Medium arousal:
		else if(chars["SERA"].lust() < 66)
		{
			output("\n\nSera takes a few moments to recover, but when she does, rolling onto her side to consider you, she does it with an air of deep loathing. <i>“Well, that was about as unpleasant as I imagined being ass-fucked by " + (pc.isBimbo() ? "a stupid bitch" : pc.mf("an utter creep", "a psycho bitch")) + " would be,”</i> she says. <i>“You know how I cope with this? By imagining I’m doing it to you. Only my dick is covered in barbed wire.”</i>");
			output("\n\nYou consider her in your relaxed, post-coital throb and don’t say anything; you’re thinking about how, just for a few moments in the heat of the moment, she lost her candour. You think that maybe there is someone who would enjoy receiving anal quite a lot hiding somewhere in that prickly fortress of hers, if you could just coax her out. For now, after you’ve spent a few more moments dozing, " + (!pc.isNude() ? "you pull your [pc.gear] back on and leave" : "you get up and leave") + ".");
			
			chars["SERA"].lust(35);
		}
		// High arousal:
		else
		{
			output("\n\nSera takes a short while to recover, tail and ass still raised with your [pc.cum] oozing slowly down one hip. You grin at the sight, relaxing in your own post-coital throb.");
			output("\n\n<i>“That wasn’t so bad, was it?”</i> you say lowly. <i>“I think somebody enjoyed that more than they were expecting. I think with a little bit of training, your [pc.master] will have an excellent buttslut on their hands.”</i>");
			output("\n\n<i>“Feel free to fuck off anytime,”</i> she responds eventually, turning on one side to consider you with reptilian loathing. You are still smiling to yourself as you " + (!pc.isNude() ? "pull your [pc.gear] back on and leave" : "get up and leave") + ".");
			output("\n\n");
			
			chars["SERA"].orgasm();
			seraObedience(8);
		}
	}
	// 41-80
	else
	{
		output("Sera watches, hand on chin, as you retrieve the bottle of lube from the starter kit.");
		output("\n\n<i>“It’s going up my ass again, I see,”</i> she sighs, stretching out on her bed, all leisured disinterest. <i>“Heaven forbid [pc.master] do something that was pleasurable for me, for once.”</i>");
		output("\n\n<i>“You know that if you want it in your pussy,”</i> you reply, slathering your [pc.cock " + cIdx + "] in oil, working hard, veined heat into it, <i>“all you’ve got to do is ask nicely.”</i>");
		output("\n\n<i>“Oh no,”</i> says Sera with a sniff, shifting onto her haunches and presenting the flawless, peachy swell of her behind. <i>“I’m here for you after all, ‘[pc.master]’. You knock yourself out.”</i>");
		output("\n\nYou clamber onto the bed, lay one hand on a soft buttock and rub soothingly as you penetrate the cute pink wrinkle of her asshole with oily fingers. She’s definitely getting better at this; it resists you only for a moment before allowing you to sink almost down to the knuckle into her delightfully tight and clinging passage. The succubus remains still and says nothing, arms folded on the duvet and apparently unperturbed when you add first one, then two more fingers in her warm depths, opening her up and getting her used to girth. It’s only when you flop your slick erection into the valley of her behind and shift your hand down to her exposed pussy, tracing her outer lips and gently stroking the tough button of her clit that she twitches agitatedly.");
		// Intelligence > 40%:
		if(pc.IQ() > 40) output(" It’s obvious that behind that diffident tone of hers is a fear that you might make her really enjoy this; any pang of pleasure is a guilty confession. Lust surges down to your [pc.groin] at the thought.");
		output("\n\n<i>“Could you get on with - ?”</i> her snippy request catches in her throat as you grip her hips and sink your [pc.cock " + cIdx + "] past her sphincter. After only a moment’s resistance you are able to push your [pc.cockHead " + cIdx + "] inwards, and with careful, back and forth sawing you’re able to slide a considerable amount of your [pc.cock " + cIdx + "] into her upturned butt. The sensation seizing it up once you’ve found a nice rhythm - withdrawing so that your bulging head can feel the tight ring of her asshole and then flexing your [pc.hips] to holster yourself back into her hot depths - is so good you struggle powerfully with an urge to completely let go of your lust. The walls of her colon, oiled by the passage of your cock, cling to it sweetly as it withdraws, and is fervidly tight as you close your grip on her thighs and press your hard meat back home... made all the more lush by the sight of the peachy, fertile [sera.skinColor] behind you’re penetrating, rippling slightly to your exertions. You want nothing more than to fuck that wildly, discard any other thoughts to pump every ounce of your heavy arousal into that wonderful piece of ass that you own.");
		
		pc.cockChange();
		
		output("\n\nBut you deliberately keep your movements slow and sensual, and as you spear inwards between her buttocks you let your hands roam down Sera’s crouched form. You slip your fingers back down to her pussy, burrowing inside to caress its slick entrance whilst sending your other hand shifting down her flank to cup a breast, finding the tough nub of her nipple, increasing the pace at which you drive your [pc.cock " + cIdx + "] home and the closeness with which you knead the sensitive tips of the succubus’ juicy body very slowly.");
		// Low arousal:
		if(chars["SERA"].lust() < 33)
		{
			output("\n\nSera barely seems to notice your exertions; she remains statuesque, arms folded, waiting with silent, glacial patience for you to finish. The most you drag out of her is an irritated hiss when you squeeze her boob maybe a little too hard.");
			output("\n\nUltimately the lust fogging your own senses becomes too heavy for you to keep sight of your goal of making her feel real pleasure from this; you clutch her hot, soft form and lose yourself in the succulent rhythm, your " + (pc.balls > 0 ? "[pc.ballsNoun]" : "hips") + " clapping a merry rhythm on the succubus’s bouncing ass with each returning thrust into that delightfully tight hole.");
			output("\n\nYou spear your way in deep as your [pc.cockNoun " + cIdx + "] bulges up and then releases. A sigh of deepest satisfaction leaves your [pc.lips] as you pump your load into Sera’s upturned butt, which jiggles with each returning thrust of your clenching [pc.hips]");
			if(pc.balls > 0) output(" and [pc.balls]");
			output(".");
			if(pc.cumQ() >= 2000) output(" You go on and on, working out every last drop from your bountiful cock, until [pc.cum] is spurting around your girth and the succubus’s belly is rotund, her guts packed with your warmth.");
			output(" When you’ve pulsed your last you pull slowly outwards, fingers trailing down her boobs, enjoying the way her cum-slicked tunnel still clings to your prick all the way out.");
			output("\n\nYou flop back onto the bed when you’re done, enjoying the post-coital buzz. Sera flops onto one side and considers you dispassionately.");
			output("\n\n<i>“Enjoy yourself? So pleased.”</i> She picks up her extranet device and goes back to flicking through it, feet dangling in the air, the small trail of [pc.cum] working its way down her thigh");
			if(pc.cumQ() >= 5000) output(" and her distinctly swollen belly");
			output(" roundly ignored. <i>“You can see yourself out, I’m sure.”</i>");
			
			chars["SERA"].lust(35);
			seraObedience(-5);
		}
		// Medium arousal:
		else if(chars["SERA"].lust() < 66)
		{
			output("\n\nYou think Sera’s facade of disinterest is melting under your anal assault; you can see it in the increasing tenseness of her limbs and the small gasps and grunts of exertion. Under one heavy thrust of your hips into the tight squeeze of her ass she suddenly abandons her folded arms to clutch at the duvet and gasps. A small trickle of moisture warms the fingers that are craning into her pussy");
			if(chars["SERA"].hasCock()) output(", and her thick cock jerks upwards");
			output(".");
			output("\n\nA lusty thrill of triumph leaps in your belly and you speed up,");
			if(!chars["SERA"].vaginas[0].hymen) output(" reaching into her wet depths with two fingers until you are up the knuckle, curling at her slick walls relentlessly, feeling the hard surge of your [pc.cock " + cIdx + "] through them");
			else output(" stretching her hymen with your two fingers before switching your attentions to her clit, curling at it relentlessly, feeling the hard surge of your [pc.cock " + cIdx + "] translate through her soft flesh");
			output(". The succubus bites into the duvet, trying to disguise the exhalations you’re drawing out of her perhaps, but there’s really no questioning what tone they’re in now; femcum steadily dribbles down your mired hand, and when you reach forward to cusp her big, pert breast for leverage, the nipple you find is as hard and protuberant as a cherry, and tweaking it makes a throaty groan vibrate through the sheets.");
			output("\n\nYou keep her there, fingering her whilst thrusting firmly into her tight, oiled behind for as long as you can resist - trying fiercely to connect pure pleasure with the feeling of your cock opening and using her back passage - before finally ceding control to your own raging lust. You clutch her hot, soft form and lose yourself in the succulent rhythm, your " + (pc.balls > 0 ? "[pc.ballsNoun]" : "hips") + " clapping a merry rhythm on the succubus’s bouncing ass with each returning thrust into that delightfully tight hole.");
			if(pc.hasKnot(cIdx)) output(" With one final, hard push, you spread her ring with your [pc.knot " + cIdx + "]. After one breathless moment where you’re not sure it will fit, you’re in - well and truly embedded into your bottom bitch. Sera keens and swears repeatedly as you pump into her, knot pulsing with fierce arousal from the flesh stretched tightly around it.");
			output("\n\nYou spear your way in deep as your [pc.cockNoun " + cIdx + "] bulges up and then releases. A sigh of deepest satisfaction leaves your [pc.lips] as you pump your load into Sera’s upturned butt, which jiggles with each returning thrust of your clenching [pc.hips]");
			if(pc.balls > 0) output(" and [pc.balls]");
			output(".");
			if(pc.cumQ() >= 2000) output(" You go on and on, working out every last drop from your bountiful cock, until [pc.cum] is spurting around your girth and the succubus’s belly is rotund, her guts packed with your warmth.");
			output(" When you’ve pulsed your last you pull slowly outwards, fingers trailing down her boobs, enjoying the way her cum-slicked tunnel still clings to your prick all the way out.");
			output("\n\nSera drops onto one side to recover, your seed slowly oozing out of her gaped asshole, lips parted and looking slightly dazed. You grin at the sight, enjoying your own post-coital buzz.");
			output("\n\n<i>“We’re getting there, aren’t we?”</i> you say lowly. <i>“Despite how much you want to deny it. We’re pretty close to transforming you into a fully fledged buttslut.”</i>");
			output("\n\n<i>“You are so full of " + ((flags["SERA_SERVANT_INTRO"] == undefined || flags["SERA_SERVANT_INTRO"] < 3) ? "shit" : "sh- crap") + " [pc.master], anyone ever told you that?”</i> replies Sera, twisting her lip at you. You think you detect a hint of fondness in there though, and there’s certainly no denying the pinkness of her cheeks.");
			
			chars["SERA"].lust(35);
		}
		// High arousal:
		else
		{
			output("\n\nYou think Sera’s facade of disinterest is melting under your anal assault; you can see it in the increasing tenseness of her limbs and the small gasps and grunts of exertion. Under one heavy thrust of your hips into the tight squeeze of her ass she suddenly abandons her folded arms to clutch at the duvet and gasps. A small trickle of moisture warms the fingers that are craning into her pussy");
			if(chars["SERA"].hasCock()) output(", and her thick cock jerks upwards");
			output(".");
			output("\n\nA lusty thrill of triumph leaps in your belly, and you speed up the pump of your [pc.cock " + cIdx + "] into her warm, clinging innards - but withdraw your digits from her cunt almost all the way, trailing over her protuberant clit teasingly. You keep the barest of touches on her slippery button, just enough to tantalize her, whilst ramming your bulging dick home, angling downwards to push into her vaginal walls");
			if(chars["SERA"].hasCock()) output(" and prostate");
			output(". The succubus bites into the duvet, trying to disguise the exhalations you’re drawing out of her perhaps, but there’s really no questioning what tone they’re in now; femcum steadily dribbles down your mired hand, and when you reach forward to cusp her big, pert breast for leverage, the nipple you find is as hard and protuberant as a cherry, and tweaking it makes a throaty moan vibrate through the sheets.");
			output("\n\nYou " + pc.mf("growl", "purr") + " in triumph and remove your fingers from her female sex altogether, one hand clutching her plush tit and the other holding onto her thigh, exulting in the wetness you feel on your " + (pc.balls > 0 ? "[pc.balls]" : "hips") + " when you clap into her bouncing ass with each returning thrust into that delightfully tight hole");
			if(chars["SERA"].hasCock()) output(" and the way her cock strains fervently beneath her, almost touching her taut belly");
			output(". Sera gasps and swears incoherently, sweat dappling her back, irrepressibly turned on by the merciless press and stretch of your cock - but not quite enough to get off. Exactly where you want her.");
			if(pc.hasKnot(cIdx)) output(" With one final, hard push, you spread her ring with your [pc.knot " + cIdx + "]. After one breathless moment where you’re not sure it will fit, you’re in - well and truly embedded into your bottom bitch. Sera keens and swears repeatedly as you pump into her, knot pulsing with fierce arousal from the flesh stretched tightly around it.");
			// 41-60:
			if(obedience <= 60)
			{
				output("\n\nYou keep her there on that plateau for as long as you are able before finally ceding control to your own raging lust. You clutch her hot, soft form and spear your way in deep as your [pc.cockNoun " + cIdx + "] bulges up and then releases. A sigh of deepest satisfaction leaves your [pc.lips] as you pump your load into Sera’s upturned butt, which jiggles with each returning thrust of your clenching [pc.hips]");
				if(pc.balls > 0) output(" and [pc.balls]");
				output(".");
				if(pc.cumQ() >= 2000) output(" You go on and on, working out every last drop from your bountiful cock, until [pc.cum] is spurting around your girth and the succubus’s belly is rotund, her guts packed with your warmth.");
				output(" When you’ve pulsed your last");
				if(pc.hasKnot(cIdx)) output(" and your [pc.knot " + cIdx + "] finally deflates");
				output(" you pull slowly outwards");
				if(pc.cumQ() >= 2000) output(", fingers trailing down her boobs, enjoying the way her cum-slicked tunnel still clings to your prick all the way out");
				output(".");
				output("\n\nSera drops onto one side to recover, your seed slowly oozing out of her gaped asshole, lips parted and looking slightly dazed. You grin at the sight, enjoying your own post-coital buzz.");
				output("\n\n<i>“We’re getting there, aren’t we?”</i> you say lowly. <i>“Despite how much you want to deny it. We’re pretty close to transforming you into a fully fledged buttslut.”</i>");
				output("\n\n<i>“You are so full of " + ((flags["SERA_SERVANT_INTRO"] == undefined || flags["SERA_SERVANT_INTRO"] < 3) ? "shit" : "sh- crap") + " [pc.master], anyone ever told you that?”</i> replies Sera, twisting her lip at you. You think you detect a hint of fondness in there though, and there’s certainly no denying the pinkness of her cheeks.");
			}
			// 61-80:
			else
			{
				output("\n\nYou slow yourself down a little, exulting in the results of all your hard work and the wonderful, oily cling of the round [sera.skinColor] behind you’re mired in, willing this to go on for as long as possible.");
				output("\n\n<i>“No! Faster!”</i> grits Sera, sheets bunched in her fists. You can practically hear the anticipation of orgasm stiffening her words. <i>“Please! [pc.master]!”</i>");
				output("\n\n<i>“Clench up first,”</i> you breathe. <i>“That’s it...”</i> You groan as her hot tunnel tightens up intensely around your [pc.cock " + cIdx + "], and you reward her by increasing the flex of your [pc.hips], reaming her jiggling ass, confident now in your well-trained demon whore to not only take it but enjoy every stroke. You switch hands; one finds her other nipple and closes around it intently, the other gives her jiggling butt a well deserved swat. The whimper this draws out of her only spurs you on.");
				output("\n\n<i>“Which stuck-up bitch is on her knees and having all of her prissiness fucked out of her ass?”</i> you husk. Your hand lands with a clap on her other buttock. <i>“Whose slut is loving every second of it? Answer me!”</i>");
				output("\n\n<i>“Fuck! Me! Give it to me, you cunt!”</i> howls Sera, sweat running down her back in rivulets. <i>“Fucking give it to me if you think you’ve got it!”</i> You respond by reaching forward, clutching her horns, and surge to your juicy high by pounding her rippling tunnel in a frenzy.");
				output("\n\nA sigh of deepest satisfaction leaves your [pc.lips] as you pump your load into Sera’s upturned butt, which jiggles with each returning thrust of your clenching [pc.hips]");
				if(pc.balls > 0) output(" and [pc.balls]");
				output(".");
				if(pc.cumQ() >= 2000) output(" You go on and on, working out every last drop from your bountiful cock, until [pc.cum] is spurting around your girth and the succubus’s belly is rotund, her guts packed with your warmth.");
				output(" When you’ve pulsed your last");
				if(pc.hasKnot(cIdx)) output(" and your [pc.knot " + cIdx + "] finally deflates");
				output(" you pull slowly outwards, fingers trailing down her boobs, enjoying the way her cum-slicked tunnel still clings to your prick all the way out.");
				output("\n\nSera drops onto one side to recover, your seed slowly oozing out of her gaped asshole, lips parted and looking slightly dazed. You grin at the sight, enjoying your own post-coital buzz. She doesn’t resist when you gently tug her into your arms and cuddle her, stroking the line of her oval chin.");
				output("\n\n<i>“That wasn’t </i>too<i> bad,”</i> she murmurs at last, once she’s regained her breath. <i>“Give it a 6 out of 10. Keep doing this, and we might even make you into a halfway decent dom.”</i>");
				output("\n\nYou give her an affectionate squeeze before");
				if(!pc.isNude()) output(" putting your [pc.gear] back on and");
				output(" leaving her to doze.");
			}
			
			chars["SERA"].orgasm();
			seraObedience(8);
		}
	}
	
	processTime(21);
	pc.orgasm();
	IncrementFlag("SERA_BITCHENING_BUTTFUCK");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	return;
}

// Punishments
public function seraBitchTrainingPunish(fromMenu:Boolean = false):void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	
	output("What punishment will you deal to Sera?");
	
	clearMenu();
	
	addButton(0, "Spank", seraBitchTrainingPunishSpank, fromMenu);
	
	if(seraObedience() >= 40 && pc.hasCock()) addButton(1, "Cum Ration", seraBitchTrainingPunishCumRation, fromMenu);
	else if(seraObedience() < 40 && !pc.hasCock()) addDisabledButton(1, "Cum Ration", "Cum Ration", "Sera is not obedient enough and you need a penis to try this!");
	else if(pc.hasCock()) addDisabledButton(1, "Cum Ration", "Cum Ration", "Sera is not obedient enough to try this!");
	else addDisabledButton(1, "Cum Ration", "Cum Ration", "You need a penis to try this!");
	
	addButton(14, "Back", approachServantSera);
	
	return;
}
// Spank
public function seraBitchTrainingPunishSpank(fromMenu:Boolean = false):void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	
	var obedience:Number = seraObedience();
	var seraMasturbated:Boolean = (chars["SERA"].hasStatusEffect("Sera Masturbated"));
	
	// 0-40
	if(obedience <= 40)
	{
		output("You tell her you’re going to spank her for being bad.");
		output("\n\n<i>“Fucking why?”</i> she snarls, hackles raised.");
		// Chosen immediately after PC used “deny” to get her off:
		if(!fromMenu)
		{
			output("\n\n<i>“For getting off against my instructions,”</i> you reply evenly.");
			output("\n\n<i>“That was YOUR fault, you complete cretin!”</i> she howls, outraged. <i>“You’re seriously going to punish me because you just utterly embarrassed yourself?”</i>");
			output("\n\n<i>“Just lie in my lap and take it with a bit of dignity,”</i> you sigh, " + (pc.hasLegs() ? "sitting" : "placing") + " yourself down on the bunk. Sera knows she can’t disobey, and after spending as long as she thinks she can get away with while away from you, she sidles over and places the dense weight of her stomach on the top of your [pc.hips].");
			output("\n\n<i>“You can spunk as much money on enslaving people as you like,”</i> she says, looking over her shoulder at you with fierce dislike. <i>“But it doesn’t stop you being a fucking incompetent dom.”</i>");
		}
		// Chosen immediately after Sera masturbated:
		else if(seraMasturbated)
		{
			output("\n\n<i>“For getting off against my instructions,”</i> you reply evenly.");
			output("\n\n<i>“That’s just fucking bullshit,”</i> she growls, not looking at you. You think you detect in her tone the faintest tremble of contrition; certainly right now she looks like a brat who’s been caught with her hands in the kitchen cabinet.");
			// Intelligence >40:
			if(pc.IQ() > 40) output(" You suspect if punishing Sera is to have any effect at all this is definitely the time to do it. She has spent most of her adult life equating sexual licentiousness with domination, after all.");
			output("\n\nYou " + (pc.hasLegs() ? "sit" : "place") + " yourself down on the bunk and pat your lap, staring at her levelly. After a moment and grumbling under her breath the succubus slides and over and place the dense weight of her stomach on the top of your [pc.hips].");
		}
		// Chosen otherwise:
		else
		{
			output("\n\n<i>“For calling me names, for having a foul mouth, for doing nothing but hanging around in bed messing about on the extranet...”</i> you count the offences off on your fingers.");
			output("\n\n<i>“Right, so basically you’re going to punish me for being who I am,”</i> strops Sera. <i>“Message to " + pc.mf("king creepazoid", "queen psycho-bitch") + ": I’m not your fucking doormat. You can’t force me to like being here.”</i>");
			output("\n\n<i>“Just lie in my lap and take it with a bit of dignity,”</i> you sigh, " + (pc.hasLegs() ? "sitting" : "placing") + " yourself down on the bunk. Sera knows she can’t disobey, and after spending as long as she thinks she can get away with while away from you, she sidles over and places the dense weight of her stomach on top of your [pc.hips].");
		}
		// Standard
		if(!seraMasturbated)
		{
			output("\n\nYou smooth your hand over the round, [sera.skinColor] hill of one of Sera’s buttocks. Though she’s obviously prouder of her rack and");
			if(!chars["SERA"].hasCock()) output(" (formerly, at least)");
			output(" her dick, she really does have a very fine ass – blooming out from her thick thighs into a round and flawless peach, framed by her stockings and frilly corset perfectly to draw attention to it, pillow-soft and practically begging for a good spanking. You make sure to trap her restless tail beneath you before beginning.");
			output("\n\n<i>“This is what’s going to happen,”</i> you say. <i>“You’re going to keep count. Every time I ask a question, you’re going to answer it. Every time I don’t, you’re going to sound the number of spanks we’re up to. Understand?”</i>");
			output("\n\nSilence. You raise your open hand and bring it down with a resounding, satisfying smack on her rump.");
			output("\n\n<i>“Understand?”</i> Still nothing but resentful silence.");
			// Hard/Misc:
			if(!pc.isNice()) output(" You play with the idea of collar-zapping her but then realize you’d have to get up in order to avoid shocking yourself.");
			output(" Sighing inwardly, you decide to get on with it regardless. Eyeing her untouched buttock, you raise your hand again.");
			output("\n\nSmack. Slap. Smack. You build up a steady rhythm, alternating between each cheek and changing the force with which you land your blows, trying to keep her guessing. Sera tenses up each time your palm lands on her rump, sending little shockwaves rippling across it, but other than that she remains stoic in the face of her punishment. For your part, sitting here and giving her a good paddling is perfectly pleasant – there’s something infinitely satisfying about the sound of a spanked behind, burying your hand into her plumpness, and in the rosy glow you swiftly bring out on it. It arouses you enough to send heat worming its way down to your [pc.groin], but not enough to urge you on to do anything else.");
			output("\n\nFinally, after you have caused two fetching hand marks to stand out on her ass, you decide she’s had enough. You give her burning bum a comforting pat and tell her she can get up.");
			output("\n\n<i>“Finally,”</i> she says with supreme indifference. She slides off you and kneels on the bed, gazing at you with a faintly disgusted sneer. <i>“Get your rocks off on beating someone who can’t fight back? I hope it was worth it, you fucking fascist.”</i>");
			output("\n\n<i>“I did it for you, not me,”</i> you say primly. The derisive snort that follows tells you exactly what she thinks about that.");
			
			// Ob -8
			seraObedience(-8);
		}
		// After Sera masturbated
		else
		{
			output("\n\nYou smooth your hand over the round, [sera.skinColor] hill of Sera’s buttock. Though she’s obviously prouder of her rack and");
			if(!chars["SERA"].hasCock()) output(" (formerly, at least)");
			output(" her dick, she really does have a very fine ass – blooming out from her thick thighs into a round and flawless peach, framed by her stockings and frilly corset perfectly to draw attention to it, pillow-soft and practically begging for a good spanking. You make sure to trap her restless tail beneath you before beginning.");
			output("\n\n<i>“This is what’s going to happen,”</i> you say. <i>“You’re going to keep count. Every time I ask a question, you’re going to answer it. Every time I don’t, you’re going to sound the number of spanks we’re up to. The better you do it, the faster we’ll be done. Understand?”</i>");
			output("\n\nSilence. You raise your open hand and bring it down with a resounding, satisfying smack on her rump.");
			output("\n\n<i>“Understand?”</i>");
			output("\n\n<i>“Ow! Fine. Bloody Mari,”</i> comes the embittered voice from her face-down head. Again the tone of childish resentment, of someone who knows they’ve broken the rules but isn’t happy about facing the consequences. You raise your hand, eyeing her untouched buttock, and after adjudging enough time has passed for her to relax slightly clap it into that soft mound of flesh, causing her to jerk.");
			output("\n\n<i>“Ah! One.”</i> Smack.");
			output("\n\n<i>“Why am I punishing you?”</i>");
			output("\n\n<i>“Because I disobeyed.”</i> Slap.");
			output("\n\n<i>“Three.”</i> Smack.");
			output("\n\n<i>“What are you not going to do in the future?”</i>");
			output("\n\n<i>“Flick off when you’re not around.”</i> Spank.");
			output("\n\nYou build up a steady rhythm, alternating between each cheek and changing the force with which you land your blows, asking questions irregularly, keep her guessing and listening to you. Sera tenses up each time your palm lands on her rump, sending little shockwaves rippling across it. At first she answers you in a belligerent grumble, but she slowly loses that as you go on, eventually keeping time and answering in a slightly quiet, dozy voice. Maybe it’s just too much effort to keep the bitterness going in these circumstances. For your part, sitting here and giving her a good paddling is perfectly pleasant – there’s something infinitely satisfying about the sound of a spanked behind, burying your hand into her plumpness, and in the rosy glow you swiftly bring out on it. It arouses you enough to send heat worming its way down to your [pc.groin], but not enough to urge you on to do anything else.");
			output("\n\nFinally, after you have caused two fetching hand marks to stand out on her ass, you decide she’s had enough. You give her burning bum a comforting pat and tell her she can get up. It takes her a moment to do so, as if she was waking from a stupor, but by the time she gets off you and sits back up her expression of poisonous acrimony is emphatically back in place.");
			output("\n\n<i>“We done now? Or are you going to make me write lines for breathing too hard?”</i>");
			output("\n\n<i>“No,”</i> you say soothingly. <i>“You took your punishment like a good girl. Good girls get treats. Girls who keep being bad again and again will get much worse punishments than a rosy behind. Remember that in the future.”</i>");
			output("\n\nShe may be grinding her teeth hard enough for you to hear as you get up, but privately you think you’re making progress.");
			
			// Ob +14
			seraObedience(14);
		}
	}
	// 41-60
	else if(obedience <= 60)
	{
		output("You tell her you’re going to spank her for being bad.");
		// Not After Sera Masturbated
		if(!seraMasturbated)
		{
			output("\n\n<i>“[pc.Master]’s fucked up again, so [pc.master] has decided to take it out on me,”</i> Sera sighs, rolling her eyes. <i>“What a brilliant [pc.master] [pc.he] is.”</i>");
			output("\n\n<i>“Just lie in my lap and take it with a bit of dignity,”</i> you say, " + (pc.hasLegs() ? "sitting" : "placing") + " yourself down on the bunk. Sera knows she can’t disobey, and after delaying for as long as she thinks she can get away with she sidles over and places the dense weight of her stomach on top of your [pc.hips].");
			output("\n\nYou smooth your hand over the round, [sera.skinColor] hill of Sera’s buttock. Though she’s obviously prouder of her rack and");
			if(!chars["SERA"].hasCock()) output(" (formerly, at least)");
			output(" her dick, she really does have a very fine ass – blooming out from her thick thighs into a round and flawless peach, framed by her stockings and frilly corset perfectly to draw attention to it, pillow-soft and practically begging for a good spanking. You make sure to trap her restless tail beneath you before beginning.");
			output("\n\n<i>“This is what’s going to happen,”</i> you say. <i>“You’re going to keep count. Every time I ask a question, you’re going to answer it. Every time I don’t, you’re going to sound the number of spanks we’re up to. The better you do it, the faster we’ll be done. Understand?”</i>");
			output("\n\nSilence. You raise your open hand and bring it down with a resounding, satisfying smack on her rump.");
			output("\n\n<i>“Understand?”</i>");
			output("\n\n<i>“Ow! Fine. Bloody Mari,”</i> comes an embittered response from her face-down head. Again the tone of childish resentment, of someone who knows they’ve broken the rules but isn’t happy about facing the consequences. You raise your hand, eyeing her untouched buttock, and after adjudging enough time has passed for her to relax slightly clap it into that soft mound of flesh, causing her to jerk.");
			output("\n\n<i>“Ah! One.”</i> Smack.");
			output("\n\n<i>“Why am I punishing you?”</i>");
			output("\n\n<i>“Because I disobeyed, apparently.”</i> Slap.");
			output("\n\n<i>“Three.”</i> Smack.");
			output("\n\n<i>“What are you not going to do in the future?”</i>");
			output("\n\n<i>“Fuck if I know. Not cough too loud when you’re around.”</i> Spank.");
			output("\n\nYou build up a steady rhythm, alternating between each cheek and changing the force with which you land your blows, asking questions irregularly, keep her guessing and listening attentively to your voice. Sera tenses up each time your palm lands on her rump, sending little shockwaves rippling across it. At first she answers you in a belligerent grumble but that fades as you go on, eventually keeping time and answering in a slightly quiet, dozy voice. Maybe it’s just too much effort to keep the bitterness going in these circumstances. For your part, sitting here and giving her a good paddling is perfectly pleasant – there’s something infinitely satisfying about the sound of a behind being spanked, burying your hand into her plumpness, and the rosy glow you swiftly bring out on it. It arouses you enough to send heat worming its way down to your [pc.groin], but not enough to urge you on to do anything else.");
			output("\n\nFinally, after you have made two fetching hand marks stand out on her ass, you decide she’s had enough. You give her burning bum a comforting pat and tell her she can get up. It takes her a moment to do so, as if she was waking from a stupor, but by the time she gets off you and sits back up her expression of poisonous acrimony is emphatically back in place.");
			output("\n\n<i>“You got it out of your system now? Or are you going to rap my knuckles because you fell down the stairs today?”</i>");
			output("\n\n<i>“You took your punishment like a good girl,”</i> you say soothingly. <i>“Good girls get treats. Girls who keep being bad over and over will get much worse punishments than a rosy behind. Remember that in the future.”</i>");
			output("\n\nShe’s grinding her teeth hard enough for you to hear as you get up.");
			
			// Ob -8
			seraObedience(-8);
		}
		// After Sera Masturbated
		else
		{
			output("\n\n<i>“Oh dear, have I?”</i> murmurs Sera, sprawled on her bed, a smirk twitching her lips. <i>“I get up to so many bad things in this hole out of sheer boredom it’s difficult to know which one [pc.master] has decided to punish me for. But then this is never really about me, is it?”</i> She slides a thigh up the bed, making her butt stand out, her eyes yellow slits. <i>“Let’s get to it.”</i>");
			output("\n\nIt’s difficult to tell from her tone whether she’s mocking you or simply being coy. You suspect it’s a bit of both. Silently you sit yourself down, and sinuously Sera settles herself in your lap face down. As ever you send your hand roaming over her round behind first, admiring your property before raising your arm. Smack.");
			output("\n\n<i>“One.”</i>");
			output("\n\n<i>“Why are you being punished?”</i>");
			output("\n\n<i>“Because I’m a dirty slut.”</i> Ok... that’s new. You give yourself time to think as you slowly raise your hand again. You watch her flesh ripple as it lands on her untouched buttock.");
			output("\n\n<i>“Why are you a dirty slut?”</i>");
			output("\n\n<i>“Because I disobeyed you.”</i> Smack.");
			output("\n\n<i>“How did you disobey me?”</i>");
			output("\n\n<i>“By getting off when you weren’t around.”</i> Smack.");
			output("\n\n<i>“How else are you a dirty slut?”</i> you say, slowly and deliberately. She’s silent for a few moments, and you give her a meaty enough swat to make her start.");
			output("\n\n<i>“I looked at porn.”</i> Smack.");
			output("\n\n<i>“How else are you a dirty slut?”</i> you repeat.");
			output("\n\n<i>“I... went on cam and put on a show for a couple of guys in a forum. Said my [pc.boy]friend couldn’t satisfy me. Made them cum in three minutes flat.”</i> She can’t see you roll your eyes in exasperation, however her sadistically complacent tone suggests she’s picturing it.");
			output("\n\nYou make her count and keep asking probing questions, but you don’t get much more than that. There’s a definite undercurrent of pleasure to Sera’s answers; maybe she just enjoys taunting you with her indiscretions, but the way it increases as the session goes on, her last couple of responses coming out in gulps and rasps of enjoyment, betray her a bit. As does the way her pussy gleams below her reddened cheeks.");
			output("\n\nOnce you’ve tanned her to the point her bottom practically glows, your hand imprints clearly visible on her soft flesh, you give her a comforting rub and let her get up. She sits herself carefully down and looks at you with virtually the same expression as before, teasing and coy, with just a hint of post-coital satisfaction.");
			output("\n\n<i>“Are you going to be a good girl from now on?”</i>");
			output("\n\n<i>“Of course [pc.master],”</i> she murmurs. You both know she won’t be, and you are beginning to think that neither of you wants her to be.");
			
			// Ob +14
			seraObedience(14);
		}
	}
	// 61-80
	else
	{
		output("With a grin, you tell her you’re going to spank her for being bad.");
		// Not After Sera Masturbated
		if(!seraMasturbated)
		{
			output("\n\nSera’s brow crinkles.");
			output("\n\n<i>“Why?”</i>");
			output("\n\n<i>“For swearing,”</i> you say. The brow crinkles further.");
			output("\n\n<i>“No I didn’t.”</i> She doesn’t sound entirely confident, but she’s looking at you with a familiarly sulky expression. <i>“You aren’t playing fair.”</i>");
			output("\n\n<i>“Yes you did,”</i> you say with as much authority as you can muster, sitting yourself down on her bunk. <i>“Now lay yourself down and take it with a bit of dignity.”</i> She glares at you for a bit longer - more than a little angry with you - but ultimately she isn’t so sure of herself that she doesn’t crawl over and assume the position on your " + (!pc.isNaga() ? "lap" : "coils") + " after a few moments.");
			output("\n\nAs ever you send your hand roaming over her round behind first, admiring your property before raising your arm. Smack.");
			output("\n\n<i>“One.”</i>");
			output("\n\n<i>“Why are you being punished?”</i>");
			output("\n\n<i>“For swearing.”</i> Smack... Smack.");
			output("\n\n<i>“Three.”</i>");
			output("\n\n<i>“What will you remember to do in the future?”</i>");
			output("\n\n<i>“Do bad things so [pc.master] doesn’t have to make things up in order to spank me.”</i> This earns her a harder blow than normal, although it takes a bit of effort on your part not to laugh.");
			output("\n\nYou build up a steady rhythm, alternating between each cheek and changing the force with which you land your blows, asking questions irregularly, keep her guessing and listening attentively to your voice. Sera tenses up each time your palm lands on her rump, sending little shockwaves rippling across it. At first she answers you in a belligerent grumble but that fades as you go on, eventually keeping time and answering in a slightly quiet, dozy voice. Maybe it’s just too much effort to keep the bitterness going in these circumstances. For your part, sitting here and giving her a good paddling is perfectly pleasant – there’s something infinitely satisfying about the sound of a behind being spanked, burying your hand into her plumpness, and the rosy glow you swiftly bring out on it. It arouses you enough to send heat worming its way down to your [pc.groin], but not enough to urge you on to do anything else.");
			output("\n\nFinally, after you have made two fetching hand marks stand out on her ass, you decide she’s had enough. You give her burning bum a comforting pat and tell her she can get up. It takes her a moment to do so, as if she was waking from a stupor, but by the time she gets off you and sits back up her expression of sulky pique is back in place.");
			output("\n\n<i>“Are you going to be a good girl from now on?”</i>");
			output("\n\n<i>“As likely as I was before you whaled on me,”</i> she murmurs. You acknowledge that is as good as you’re going to get by letting it go.");
			
			// Ob -8
			seraObedience(-8);
		}
		// After Sera Masturbated
		else
		{
			output("\n\nSera returns your grin with interest.");
			output("\n\n<i>“Going to lay down the law on your poor, defenceless slave, are we?”</i> She strokes her side as she holds your eye, choosing her next words carefully. <i>“Come and do it then if you’ve got the balls, you" + (pc.isBimbo() ? " dumb" : "") + " fucking " + (pc.isBimbo() ? "bimbo" : pc.mf("pig", "psycho-bitch")) + ".”</i> Without betraying any emotion, you sit down on her bunk and pat your " + (!pc.isNaga() ? "lap" : "coils") + ". Sera holds back for as long as she can, eyeing you with an insolent smirk before slowly crawling over and sliding her belly onto your thighs. It’s reciprocal, in its own, darkly delicious way; she is deliberately trying to wind you up, increase the size of her punishment, making it really worthwhile for both you and her. A mixture of affection and vexation glows in your breast; when you raise your hand, it’s with a determination to transfer that glow to Sera’s behind.");
			output("\n\nSMACK.");
			output("\n\n<i>“Why are you being punished?”</i>");
			output("\n\n<i>“Because I’m a bad girl.”</i> Slap.");
			output("\n\n<i>“2.”</i> Smack.");
			output("\n\n<i>“Why are you a bad girl?”</i>");
			output("\n\n<i>“Because I got off when you weren’t around.”</i> Spank.");
			output("\n\n<i>“What did you think of when you were getting off, you nasty slut?”</i>");
			output("\n\n<i>“Tying you up and making you pay for every single time you’ve denied me.”</i> Smack.");
			output("\n\nShe quickly drifts off into that pliant sub-state of hers, answering your questions in a dozy, peaceful voice she uses nowhere else. Having her butt whupped like this seems to be cathartic for her now; she answers any question you pose her truthfully, without a hint of mischief or slyness. Aside from the physical satisfaction to be had from spanking your unruly bitch - of laying your palm into her round tush and making the flesh there ripple, of sadistically waiting until she relaxes slightly before hitting her again - you feel an overarching gratification from having this amount of control over her, of laying bare every secret and desire she has.");
			output("\n\n<i>“You enjoy this, don’t you?”</i> you husk eventually, raising your hand one last time. <i>“Getting your ass spanked by me.”</i>");
			output("\n\n<i>“Yes,”</i> says Sera calmly. <i>“I do.”</i> SMACK. You soothe the two dark handprints you’ve made stand out on her peachy bottom with your hand before speaking next.");
			output("\n\n<i>“It’s not much of a punishment then, is it? Maybe next time you are going to have to ask for me to do it.”</i> Sera slides herself off your lap and lies on her side, too sore to sit down immediately, gathering her wit before replying.");
			output("\n\n<i>“If that were the case I guess I would have to do something really bad first,”</i> she says, in a musing tone. <i>“Blow a hole in your ship. Pick up shipments of drugs whilst you’re on shore. Then maybe I’d ask.”</i> You stroke her under the chin.");
			output("\n\n<i>“Good girl.”</i> She shudders with pleasure.");
			
			// Ob +14
			seraObedience(14);
		}
	}
	
	processTime(21);
	pc.lust(15);
	chars["SERA"].lust(5);
	chars["SERA"].removeStatusEffect("Sera Masturbated");
	IncrementFlag("SERA_BITCHENING_PUNISH_SPANK");
	
	clearMenu();
	addButton(0, "Next", approachServantSera);
	
	return;
}
// Cum Rations
// 40+ Obedience and cock owners only. Same rules to spanking apply
public function seraBitchTrainingPunishCumRation(fromMenu:Boolean = false):void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	
	var obedience:Number = seraObedience();
	var cIdx:int = rand(pc.cocks.length);
	var seraMasturbated:Boolean = (chars["SERA"].hasStatusEffect("Sera Masturbated"));
	
	// First
	// 0-40
	if(flags["SERA_BITCHENING_PUNISH_RATION"] == undefined || obedience <= 40)
	{
		output("You say nothing, allowing the silence in Sera’s bunk to draw out as you rummage around in your starter kit. You have to give the tarratch credit; “starter kit” completely undersells what is a truly remarkable treasure trove of devices for the sadistically-minded owner of an unruly slut. That impression is reaffirmed when you encounter a bottle of clear liquid taped to a large doggie bowl, pull it out and read the instructions on the back. Sera watches with a deepening scowl, yellow eyes flicking between the widening smirk on your face and the objects in your hand.");
		output("\n\n<i>“The fuck are those?”</i>");
		output("\n\nMuch better to demonstrate, you think. You hold her gaze as you unscrew the bottle and raise it to your lips. The liquid is oily and tasteless, but... Mmm. You growl in enjoyment as you feel heat sink down to your groin, [pc.eachCock] bulging and rearing up in eager anticipation.");
		if(!pc.isCrotchExposed()) output(" You discard your [pc.lowerGarments] briskly, allowing your hardened prick to loll outwards.");
		output("\n\n<i>“Just some aphro, then?”</i> Sera says, relaxing visibly and shaking her head with a sneer. <i>“Do you really need that to get it up these days? Guess your heart’s not in it anymore.”</i>");
		output("\n\n<i>“Come here and suck me off,”</i> you reply bluntly. <i>“You’re being punished.”</i>");
		// Not after having masturbated:
		if(!seraMasturbated)
		{
			output("\n\n<i>“I’ve done nothing wrong, though!”</i> Sera exclaims, sneer opening into an outraged snarl.");
			output("\n\n<i>“I can hear a lot of whining and not a lot of sucking,”</i> you reply primly. Surly, reptilian eyes glare daggers at you for a while longer, and then with as much reluctance as she can put on show the demoness saunters over, flops down in front of you and takes hold of your [pc.cock " + cIdx + "].");
		}
		// After having masturbated:
		else
		{
			output("\n\n<i>“Oh dear, am I?”</i> she trills, smirking coyness restored. <i>“And [pc.master] wants to do it by putting [pc.his] dick in my mouth? What a smart and imaginative [pc.master] [pc.he] is.”</i> She clacks her teeth together meaningfully.");
			output("\n\n<i>“Less simpering, more sucking,”</i> you say, managing to keep a stern face. Keeping her eyes locked with yours, Sera slides off her bed and crawls over to you, heavy, bare boobs swaying from side to side as she comes. She deliberately flourishes her three inch claws as she takes hold of your [pc.cock " + cIdx + "].");
		}
		output("\n\nYou exhale lowly, keeping your gaze fixed on the [sera.skinColor] shrew as she works the base of your cock, coaxing pleasure and heat further and further along it before,");
		if(!seraMasturbated) output(" with a look of complete disdain,");
		else output(" with a toothy, provocative sneer upwards,");
		output(" she spreads her silky, wet lips over its bulging head. You slide your hand through powder blue hair as more and more of your length is swallowed into the hot knead of her mouth with each returning bob of her head.");
		output("\n\nOnce you’re over the initial, wet, juicy joy over it though, it’s difficult to escape the fact that she’s not that good at it. Her teeth catch on your sensitive hardness and it keeps flopping out because she’s going at it too briskly and loosely. You tsk");
		if(pc.cLength(cIdx) >= 11.5) output(" once you realize she has neither the will nor the aptitude to engulf any more than about a third of your huge length");
		output(", pull out, and give her a light cock-slap across the cheeks.");
		output("\n\n<i>“All this time demanding blowjobs off anyone who came close, and you never learnt to do it properly yourself?”</i> you chide. <i>“For someone who fancies themselves a succubus, it’s nowhere near good enough.”</i>");
		if(!seraMasturbated)
		{
			output("\n\n<i>“Let the buyer fucking beware then,”</i> she replies sullenly. <i>“I have to give you oral. Doesn’t mean I have to do a good job.”</i>");
			output("\n\nYou sigh wearily and point downwards silently. You try and give her murmured advice when she resumes, but she stoically ignores you and continues blowing and tugging you in the same lackluster manner. The shit you put up with... luckily the oil you drank has pushed enough heat and desire into your loins for it not to matter. You take matters into your own hands, get a firm grip of her curved horns and pump into her wet mouth until the sweet pressure is irresistible. Again she copes poorly, coughing and choking her outrage around your [pc.cock " + cIdx + "], but you hold steady, making sure it stays where it is, determined that she at least learn how to take a moderate face fucking.");
		}
		else
		{
			output("\n\n<i>“Oh, well, [pc.master],”</i> she coos, leering up at you and fluttering her lashes. <i>“I’m sure you could teach me all about sucking cock like a little bitch. What exactly am I doing wrong?”</i>");
			output("\n\nYou return her smirk, reveling quietly in her arousing mixture of insolence and obedience, and point downwards silently. You give her murmured instructions when she resumes, pumping your [pc.hips] gently so she gets used to taking");
			if(pc.cLength(cIdx) < 11.5) output(" the full thrust");
			else output(" most of the thrust of your massive");
			output(" extent, directing her to pucker up and drag her lavish tongue back along your underside as you pull outwards. Really, she does know all about this - it’s just a case of reversing perspectives. Soon enough most of her amateurish mistakes have disappeared, and you’re pumping your [pc.cock " + cIdx + "] slowly into a sensuous, tooth-free suck, her hand surrounding your thick base in shifting, tightening pressure. There’s plenty more she could be doing -");
			if(pc.balls > 0) output(" your " + (pc.balls == 1 ? "[pc.sack] remains" : "[pc.balls] remain") + " criminally un-kneaded and un-licked,");
			if(pc.balls > 0 && pc.hasKnot(cIdx)) output(" and");
			if(pc.hasKnot(cIdx)) output(" she makes no attempt to savor your swollen knot beyond a press of her lips, and");
			output(" you doubt she’s ready for a deep-throating - but it’s a good start.");
			output("\n\nShe gazes up at you with unblinking, teasing eyes the whole time, and eventually it’s a provocation you cannot deny. You take a firm hold of her curved horns and pump into her wet mouth until the sweet pressure is irresistible. She copes poorly to begin with, coughing and choking around your [pc.cock " + cIdx + "], but you hold steady, and she quickly manages to adapt, keeping her lips a steady, wet “oh” for you to fuck.");
		}
		output("\n\nAt the last moment you pull out. You breath heavily, simmering in your built-up heat waiting for Sera to ask the obvious question.");
		output("\n\n<i>“That’s it then? Punishment over?”</i> she stares up at you past your saliva-shone rod");
		if(pc.hasBreasts()) output(" and [pc.chest]");
		output(" with quizzical, reptilian eyes. <i>“Thought you’d at least jizz on my tits or something.”</i>");
		output("\n\n<i>“Polishing my cock’s a privilege, not a punishment,”</i> you reply magisterially. You take hold of your [pc.cock " + cIdx + "] and pick up the discarded doggie bowl, close your eyes and rub yourself to your long-awaited orgasm. You gasp at how plentiful it is - your cock bulges up and then releases a huge spray of hot [pc.cum] onto the red plastic, followed by many more. The oil seems to have temporarily boosted your virility");
		if(pc.cumQ() < 2000) output(" to a remarkable degree");
		else output(" even beyond what you commonly expect");
		output(". You sigh with huge satisfaction when you’re finished, the soup-bowl sized vessel");
		if(pc.cumQ() < 2000) output(" quite full");
		else output(" full up to the brim, leaking thickly down the sides");
		output(". You place it down in front of her.");
		output("\n\n<i>“This stuff,”</i> you say, wagging the bottle of oil teasingly, <i>“gives me the capacity to cum fully nutritious semen for a while. That,”</i> you go on, indicating the doggie bowl, <i>“contains all the vitamins and minerals needed to keep a pet slut fighting fit for a whole day. Which is just as well, because you aren’t getting anything else today. </i>That<i> is your punishment.”</i>");
		if(!seraMasturbated)
		{
			output("\n\n<i>“That’s horrible,”</i> says Sera, in an unusually level tone. She looks at the bowl of [pc.cum] in front of her almost academically. <i>“You’re horrible, you know that? Really and seriously horrible in every way.”</i>");
			output("\n\n<i>“Only when you deserve it.”</i> You duck just in time as the bowl is thrown at you and gives the wall behind you a wet, impromptu redecorating.");
			output("\n\n<i>“Fuck off!”</i>");
			output("\n\nYou stare at her in silent exasperation and then leave. You can’t back down now - but equally you cannot exactly stand over her and force her not to eat anything today. Maybe next time you should choose the moment you spring this bit of sadism on her more carefully.");
			
			// Ob -8
			seraObedience(-8);
		}
		else
		{
			output("\n\n<i>“Wow,”</i> says Sera, looking at the bowl. She dips a talon into it, draws it up, watches the [pc.cum] oozing off of it. <i>“Those bug-cunts - they really were a piece of work, huh? Wish I’d known about this stuff when I had my own collection of sluts.”</i> She sounds awed; in what part to the cum supplement and what to the sheer monstrousness of your punishment, it’s difficult to tell.");
			output("\n\n<i>“Well, now you do know about it,”</i> you smile in response. <i>“So you aren’t going to be bad again, are you?”</i>");
			output("\n\n<i>“I don’t know, [pc.master],”</i> she growls in response. She licks her claw clean with an ostentatious curl of her tongue as she spreads her hand over a high, ample breast. <i>“Might wind up enjoying this so much I’ll have to chain you up and turn you into my personal cum pump. Would you like that?”</i>");
			output("\n\n<i>“Drink,”</i> you order. <i>“It’ll be much better warm. Mouth only.”</i>");
			output("\n\nThe succubus is defiantly cheeky as ever, but the red of deserved humiliation is clear to see on her cheeks as, after a moment’s pause, she lowers her head over the big, thick helping of cock cream. You sit back, the dull throb of post-coital pleasure amplified immensely by the sound of wet licks and lip smacks down in front of you. It’s enough to make [pc.eachCock] swell again, think about giving her a second helping... but no. Discipline, that’s the key.");
			output("\n\nYou give her a fond scratch behind the collar and leave her to it.");
			
			// Ob +14
			seraObedience(14);
		}
		processTime(21);
	}
	// 41-66
	else if(obedience <= 66)
	{
		output("<i>“Seems you’ve been a naughty pup again,”</i> you sigh,");
		if(!pc.isCrotchExposed()) output(" unfastening your [pc.lowerGarments] and");
		output(" picking up the bottle of oil to take an ostentatious swig. Heat immediately powers its way down to your groin, [pc.eachCock] bulging up readily. <i>“So the only sustenance you’re going to get today is what you can get by pleasing your [pc.master].”</i>");
		if(!seraMasturbated)
		{
			output("\n\n<i>“Aw c’mon!”</i> howls Sera. <i>“It’s fucking gross and I’ve not done anything wrong!”</i>");
			output("\n\n<i>“Less lowing, more blowing,”</i> you order. Surly, reptilian eyes glare daggers at you for a while longer, and then with as much reluctance as she can put on show the demoness saunters over, flops down in front of you and takes hold of your [pc.cock " + cIdx + "].");
		}
		else
		{
			output("\n\n<i>“Oh man,”</i> groans Sera. Embarrassment muddles her self-possessed smirk and a rather fetching blush blooms on her cheeks. <i>“Can’t you just slap me around a bit instead? That’s so gross and I’m not even that good at it.”</i>");
			output("\n\n<i>“Either you be good in general,”</i> you affirm, <i>“or you’ll get good at this.”</i> She bites her lip slightly to that. A moment later she slides off her bed and crawls over to you, heavy, bare boobs swaying from side to side as she comes. She deliberately flourishes her three inch claws as she takes hold of your [pc.cock " + cIdx + "].");
		}
		output("\n\nYou exhale lowly, keeping your gaze fixed on the [sera.skinColor] shrew as she works the base of your cock, coaxing pleasure and heat further and further along it before,");
		if(!seraMasturbated) output(" with a look of complete disdain,");
		else output(" with a toothy, provocative sneer upwards,");
		output(" she spreads her silky, wet lips over its bulging head. You slide your hand through powder blue hair as more and more of your length is swallowed into the hot knead of her mouth with each returning bob of her head.");
		output("\n\nOnce you’re over the initial, wet joy of it though, it’s difficult to escape the fact that she’s not that good at it. Her teeth catch on your sensitive hardness and it keeps flopping out because she’s going at it too briskly and loosely. You tsk");
		if(pc.cLength(cIdx) >= 11.5) output(" once you realize she has neither the will nor the aptitude to engulf any more than about a third of your huge length");
		output(", pull out, and give her a light cock-slap across the cheeks.");
		output("\n\n<i>“All this time demanding blowjobs off anyone who came close, and you never learnt to do it properly yourself?”</i> you chide. <i>“For someone who fancies themselves a succubus, it’s nowhere near good enough.”</i>");
		
		pc.maxOutLust();
		
		if(!seraMasturbated)
		{
			output("\n\n<i>“Let the buyer fucking beware then,”</i> she replies sullenly. <i>“I have to give you oral. Doesn’t mean I have to do a good job.”</i>");
			output("\n\nYou sigh wearily and point downwards silently. You try and give her murmured advice when she resumes, but she stoically ignores you and continues blowing and tugging you in the same lackluster manner. The shit you put up with... luckily the oil you drank has pushed enough heat and desire into your loins for it not to matter. Eventually you take matters into your own hands, get a firm grip of her curved horns and pump into her wet mouth until the sweet pressure is irresistible. Again she copes poorly, coughing and choking her outrage around your [pc.cock " + cIdx + "], but you hold steady, making sure it stays where it is, determined that she at least learn how to take a moderate face fucking.");
		}
		else
		{
			output("\n\n<i>“Oh, well, [pc.master],”</i> she coos, leering up at you and blinking her lashes. <i>“I’m sure you could teach me all about sucking cock like a little bitch. What exactly am I doing wrong?”</i>");
			output("\n\nYou return her smirk, reveling quietly in her arousing mixture of insolence and obedience, and point downwards silently. You give her murmured instructions when she resumes, pumping your [pc.hips] gently so she gets used to taking");
			if(pc.cLength(cIdx) < 11.5) output(" the full thrust");
			else output(" most of the thrust of your massive");
			output(" extent, directing her to pucker up and drag her lavish tongue back along your underside as you pull outwards. Really, she does know all about this - it’s just a case of reversing perspectives. Soon enough most of her amateurish mistakes have disappeared, and you’re pumping your [pc.cock " + cIdx + "] slowly into a sensuous, tooth-free suck, her hand surrounding your thick base in shifting, tightening pressure. There’s plenty more she could be doing -");
			if(pc.balls > 0) output(" your [pc.balls] remain criminally un-kneaded and un-licked,");
			if(pc.balls > 0 && pc.hasKnot(cIdx)) output(" and");
			if(pc.hasKnot(cIdx)) output(" she makes no attempt to savor your swollen knot beyond a press of her lips, and");
			output(" you doubt she’s ready for a proper deep-throating - but it’s a good start.");
			output("\n\nShe gazes up at you with unblinking, teasing eyes the whole time, and eventually it’s a provocation you cannot deny. You talk a firm curved horns and pump into her wet mouth until the sweet pressure is irresistible. She copes poorly to begin with, coughing and choking around your [pc.cock " + cIdx + "], but you hold steady, and she quickly manages to adapt, keeping her lips a steady, wet “oh” for you to fuck.");
		}
		output("\n\nAt the last moment you pull out. Pulse pounding behind your brow and clutching your urgently erect [pc.cock " + cIdx + "], you pick up her doggie bowl, close your eyes and rub yourself to your long-awaited orgasm. Your cock bulges up and then releases a huge spray of hot [pc.cum] onto the red plastic, followed by many more. Above anything else the effect this temporary TF has on you is ecstatic - it’s just wonderful to stand here and offload juicy surge after surge of hot, thick cum from your clenching " + (pc.balls <= 0 ? "dick" : "[pc.balls]") + ". You sigh with huge satisfaction when you’re finished, the soup-bowl sized vessel");
		if(pc.cumQ() < 2000) output(" quite full");
		else output(" full up to the brim, leaking thickly down the sides");
		output(". You place it down in front of Sera.");
		// Cum honey/chocolate/fruit:
		if(InCollection(pc.cumType, GLOBAL.FLUID_TYPE_HONEY, GLOBAL.FLUID_TYPE_MILKSAP, GLOBAL.FLUID_TYPE_CUMSAP, GLOBAL.FLUID_TYPE_CHOCOLATE_MILK, GLOBAL.FLUID_TYPE_STRAWBERRY_MILK, GLOBAL.FLUID_TYPE_NECTAR, GLOBAL.FLUID_TYPE_VANILLA, GLOBAL.FLUID_TYPE_CHOCOLATE_CUM, GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT, GLOBAL.FLUID_TYPE_FRUIT_CUM, GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM, GLOBAL.FLUID_TYPE_PEPPERMINT)) output("\n\n<i>“Aren’t I a kind master?”</i> you smirk. <i>“A bowl of sweet syrup from your sugar " + pc.mf("daddy", "mommy") + ", barely a punishment at all. Imagine how much worse this would be if I didn’t cum [pc.cum].”</i>");
		// Otherwise:
		else output("\n\n<i>“A big bowl of a succubus’s favorite treat,”</i> you smirk. <i>“More than enough to get you through the day. Aren’t I a kind master?”</i>");
		if(!seraMasturbated)
		{
			output("\n\nIn response and without a flicker of emotion, Sera picks up the bowl, stands up and strides into her bathroom unit. There’s a flush. You sigh, shrug exasperatedly and leave. You can’t back down now - but equally you cannot exactly stand over her and force her not to eat anything today. Maybe next time you should choose the moment you spring this bit of sadism on her more carefully.");
			
			// Ob -8
			seraObedience(-8);
		}
		else
		{
			output("\n\n<i>“Yeah, you’re a real hero alright,”</i> replies Sera sullenly. You sit down on her bunk and wait pointedly. Eventually, with a screw of the mouth, she lowers her head over the big, thick helping of cock cream. You sit back, the dull throb of post-coital pleasure amplified immensely by the sound of wet licks and lip smacks down in front of you. It’s enough to make [pc.eachCock] swell again, think about giving her a second helping... but no. Discipline, that’s the key here.");
			output("\n\nYou give her a fond scratch behind the collar and leave her to it.");
			
			// Ob +14
			seraObedience(14);
		}
		processTime(21);
	}
	// 67-80
	else
	{
		output("<i>“Seems you’ve been a naughty pup again,”</i> you sigh,");
		if(!pc.isCrotchExposed()) output(" unfastening your [pc.lowerGarments] and");
		output(" picking up the bottle of oil to take an ostentatious swig. Heat immediately powers its way down to your groin, [pc.eachCock] bulging up readily. <i>“So the only sustenance you’re going to get today is what you can get by pleasing your [pc.master].”</i>");
		if(!seraMasturbated)
		{
			output("\n\n<i>“That’s not fair,”</i> replies Sera, grimacing.");
		}
		else
		{
			output("\n\n<i>“Ooh dear,”</i> croons Sera, lounging on her bunk and eyeing you up, trailing her claws along the rise of her thigh. <i>“And I am sooooo hungry from all the evil I’ve been up to.”</i> Her eyes narrow and she traces her purple lips with her tongue, making them shine. <i>“Guess I’m going to tap " + (pc.balls <= 0 ? "that nasty cock" : "those juicy balls") + " of yours for every last drop.”</i>");
		}
		output("\n\n<i>“You and I both know it’s not even a punishment anymore,”</i> you say, probing, <i>“it’s a reward.”</i>");
		output("\n\n<i>“What I know,”</i> she snaps, <i>“is that if you don’t play fair I don’t play at all.”</i>");
		output("\n\nOh well. You wait unmoving, and eventually, with as much surly reluctance as she can muster, the demoness saunters over, flops down in front of you and takes hold of your [pc.cock " + cIdx + "].");
		
		pc.maxOutLust();
		
		// Same as 41-60
		if(!seraMasturbated)
		{
			output("\n\nYou exhale lowly, keeping your gaze fixed on the [sera.skinColor] shrew as she works the base of your cock, coaxing pleasure and heat further and further along it before, with a look of complete disdain, she spreads her silky, wet lips over its bulging head. You slide your hand through powder blue hair as more and more of your length is swallowed into the hot knead of her mouth with each returning bob of her head.");
			output("\n\nOnce you’re over the initial, wet joy of it though, it’s difficult to escape the fact that she’s not that good at it. Her teeth catch on your sensitive hardness and it keeps flopping out because she’s going at it too briskly and loosely. You tsk");
			if(pc.cLength(cIdx) >= 11.5) output(" once you realize she has neither the will nor the aptitude to engulf any more than about a third of your huge length");
			output(", pull out, and give her a light cock-slap across the cheeks.");
			output("\n\n<i>“All this time demanding blowjobs off anyone who came close, and you never learnt to do it properly yourself?”</i> you chide. <i>“For someone who fancies themselves a succubus, it’s nowhere near good enough.”</i>");
			output("\n\n<i>“Let the buyer fucking beware then,”</i> she replies sullenly. <i>“I have to give you oral. Doesn’t mean I have to do a good job.”</i>");
			output("\n\nYou sigh wearily and point downwards silently. You try and give her murmured advice when she resumes, but she stoically ignores you and continues blowing and tugging you in the same lackluster manner. The shit you put up with... luckily the oil you drank has pushed enough heat and desire into your loins for it not to matter. Eventually you take matters into your own hands, get a firm grip of her curved horns and pump into her wet mouth until the sweet pressure is irresistible. Again she copes poorly, coughing and choking her outrage around your [pc.cock " + cIdx + "], but you hold steady, making sure it stays where it is, determined that she at least learn how to take a moderate face fucking.");
			output("\n\nAt the last moment you pull out. Pulse pounding behind your brow and clutching your urgently erect [pc.cock " + cIdx + "], you pick up her doggie bowl, close your eyes and rub yourself to your long-awaited orgasm. Your cock bulges up and then releases a huge spray of hot [pc.cum] onto the red plastic, followed by many more. Above anything else the effect this temporary TF has on you is ecstatic - it’s just wonderful to stand here and offload juicy surge after surge of hot, thick cum from your clenching " + (pc.balls <= 0 ? "dick" : "[pc.balls]") + ". You sigh with huge satisfaction when you’re finished, the soup-bowl sized vessel");
			if(pc.cumQ() < 2000) output(" quite full");
			else output(" full up to the brim, leaking thickly down the sides");
			output(". You place it down in front of Sera.");
			// Cum honey/chocolate/fruit:
			if(InCollection(pc.cumType, GLOBAL.FLUID_TYPE_HONEY, GLOBAL.FLUID_TYPE_MILKSAP, GLOBAL.FLUID_TYPE_CUMSAP, GLOBAL.FLUID_TYPE_CHOCOLATE_MILK, GLOBAL.FLUID_TYPE_STRAWBERRY_MILK, GLOBAL.FLUID_TYPE_NECTAR, GLOBAL.FLUID_TYPE_VANILLA, GLOBAL.FLUID_TYPE_CHOCOLATE_CUM, GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT, GLOBAL.FLUID_TYPE_FRUIT_CUM, GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM, GLOBAL.FLUID_TYPE_PEPPERMINT)) output("\n\n<i>“Aren’t I a kind master?”</i> you smirk. <i>“A bowl of sweet syrup from your sugar " + pc.mf("daddy", "mommy") + ", barely a punishment at all. Imagine how much worse this would be if I didn’t cum [pc.cum].”</i>");
			// Otherwise:
			else output("\n\n<i>“A big bowl of a succubus’s favorite treat,”</i> you smirk. <i>“More than enough to get you through the day. Aren’t I a kind master?”</i>");
			output("\n\nIn response and without a flicker of emotion, Sera picks up the bowl, stands up and strides into her bathroom unit. There’s a flush. You sigh, shrug exasperatedly and leave. You can’t back down now - but equally you cannot exactly stand over her and force her not to eat anything today. Maybe next time you should choose the moment you spring this bit of sadism on her more carefully.");
			
			// Ob -8
			seraObedience(-8);
		}
		else
		{
			output("\n\nYou exhale lowly, keeping your gaze fixed on the [sera.skinColor] shrew as she works the base of your cock, coaxing pleasure and heat further and further along it. She leers up at you as she does it, licking her lips in ludicrous, pornographic fashion. Maybe you’re imagining it, but is there an element of real, aroused need heightening her theatrics? Such thoughts are momentarily pushed out of your head when she spreads her silky, wet lips over its bulging head, ever so slowly and yet with powerful, controlled suction. She lets go with a raspberry sound, grins up at you and then does it again, deeper this time. It’s throbbing, sweat-inducing perfection and you feel an almost unstoppable urge to orgasm there and then... but no. Letting it all go in adolescent giddiness and not savoring this kind of suck would be an outrage. You slide your hand through powder blue hair as more and more of your length is swallowed into the hot knead of her mouth with each returning bob of her head.");
			output("\n\nSoft roiling pleasure inundates");
			if(pc.cLength(cIdx) < 11.5) output(" your [pc.cock " + cIdx + "]");
			else output(" the top half of your massive cock");
			output(", shifting and caressing it magically until it feels like it’s made out of sensitive oak. Keeping hold of your lust with some difficulty, you gaze down at her. The minx who would always stare back challengingly is gone; she’s got her eyes closed and is utterly lost in moving her head back and forth and around your [pc.cock " + cIdx + "], one hand lovingly stroking the base");
			if(pc.hasKnot(cIdx)) output(" and knot");
			if(pc.balls > 0) output(" whilst the other gently caresses your [pc.balls]");
			output(", sensuously bathing your sex in pleasure, her opened, luscious lips undulating over it.");
			if(chars["SERA"].hasCock()) output(" Her own cock, you notice, is erect itself, keening upwards for the oral pleasure happening above that it cannot experience.");
			output("\n\n<i>“You like that, don’t you?”</i> you husk. No response; just more wonderful, wet pleasure on your [pc.cockHead " + cIdx + "]. You withdraw from her mouth and bat her across the nose with your glistening length. She blinks out of her reverie, surprised.");
			output("\n\n<i>“You like it, don’t you?”</i> you insist with a grin. <i>“Sucking cock like a little bitch, in your words. You love the taste of being on the receiving end, don’t you?”</i>");
			output("\n\n<i>“I - don’t ruin it,”</i> replies Sera roughly, cheeks flushed. She follows the bob of your [pc.cock " + cIdx + "] almost self-consciously, rearing her thick lips up to your gently leaking end, the breath of her words puffing it. You notice her nipples are as erect as tiny spikes. <i>“It’s not as if - seems like we got a winning combination here. I give you oral, and - ?”</i> You brush your cock against her lips slowly, tantalizing her with the heavy smell of your pre, and then pull away as she rears her neck, attempting to engulf it in your mouth.");
			output("\n\n<i>“Beg for it,”</i> you order. <i>“Or you get nothing.”</i> You can almost see the internal battle unfold in front of you - that small, fading part of Sera that wants to tell you to get fucked, twisting and tightening the face of the emerging Sera that desperately wants this to go on. You sigh theatrically and turn");
			if(!pc.isCrotchExposed() && pc.hasLowerGarment()) output(", making as if to pull your [pc.lowerUndergarment] back up");
			output(".");
			output("\n\n<i>“I guess you don’t want feeding that badly, then. Guess--”</i>");
			output("\n\n<i>“No!”</i> The satanically beautiful, curvy harridan inhales, and then looks up at you imploringly, hands on the undersides of her ample breasts, presenting them as she gives you eerily reptilian doe eyes. <i>“Please [pc.master],”</i> she breathes. <i>“May I suck your dick?”</i>");
			output("\n\n<i>“You may,”</i> you murmur proudly, swinging your [pc.cock " + cIdx + "] back to her and closing your eyes as wet, kneading pressure immediately slides back down your shaft. <i>“But let it all out. You’re not getting your big, hot load today unless I can hear how much you enjoy being [pc.master]’s obedient semen demon, ok?”</i>");
			output("\n\nIt’s wonderfully wet, sloppy yet tight; whenever it gets almost too much you pull out of her mouth, and without direction she lavishes your hard, veined meat");
			if(pc.balls > 0) output(" and bulging balls");
			output(" with her long tongue instead, curling it all around every inch, using all of her new expertise to fully prime her meal.");
			output("\n\nEach time she takes a great slurping lick of your underside");
			if(pc.balls > 1) output(" or testicles");
			output(" she gives a hungry moan, heaving her jiggling boobs to give muffled voice to how much she enjoys doing it. It’s absurdly theatrical but that doesn’t stop your tremendous enjoyment of it, how you’ve coaxed such willing submission out of this once hard, self-centered woman.");
			output("\n\nYou grasp her hard, rough horns, steadily bracing her a distance away from you so that all she can reach is your bulging cock head, softly instructing her to cup her breasts again. You hold her like that for a time, locking eyes with her, both of you enjoying her lavishing your slit and bell-end with the tip of her rough, hot tongue.");
			output("\n\n<i>“Gonna give your bitch what she needs?”</i> she husks, toothily leering up at you, fingers circling her nipples. <i>“Got the guts to take charge, big " + pc.mf("boy", "girl") + "?”</i> She gives your bulging head a long, luscious lick, sending pleasure tingling all the way up your spine. <i>“Seems like you talk a lot about being on top, but I’m the one doing all the w--”</i> You push your [pc.hips] forward at the same time as you pull her head forward, forcefully introducing " + (pc.cLength(cIdx) >= 11.5 ? "most" : "all") + " of your [pc.cock " + cIdx + "] to " + (pc.cLength(cIdx) < 11.5 ? "the back of her throat" : "her gullet") + ". She gags once and then gets a masterful handle on the reflex, her throat clenching wetly around your " + (pc.cLength(cIdx) < 11.5 ? "sensitive bell-end" : "length") + ", practically begging you to use it. Which, once you’ve pulled out once and sunk back into it again to ascertain the demoness can indeed take it, is exactly what you do.");
			output("\n\nObscene, sloppy, slurping noises fill the room, your " + (pc.balls <= 0 ? "[pc.hips]" : "[pc.balls]") + " slapping against her pretty chin, down which a steady stream of saliva and pre-cum runs");
			if(pc.cLength(cIdx) >= 11.5) output(", her neck bulging up with each sweet pump");
			output(". As you thrust and clench up your [pc.lowerBody] to pile-drive your musky, saliva-lubed dick into that deep, hidden slut tunnel you consider how much abuse, vitriol and sneering has poured from it over the years. The “gack!” and “schlop”s you’re drawing from it now are infinitely more pleasant, at least to your ears. You draw your [pc.cock " + cIdx + "] outwards slowly so that your [pc.cockHead " + cIdx + "] touches the inside of her lips, allowing her to recover momentarily; she slides her tongue along the sternly bulging underside and “mmm”s deeply, impatient with horny, whorish hunger, trying to drive you on. Wonderful.");
			output("\n\nYou hold her up and penetrate her tight silky " + (pc.cLength(cIdx) < 11.5 ? "mouth" : "throat") + " right up to the quick with half a dozen more intense, deliberate thrusts, with each one stating unequivocally what its primary function now is: polishing your cock from head to base to a worshipful shine. When the need tightening [pc.eachCock] is finally far too much you pull out. With immense effort you keep your hands steady, grab the bowl and with a single slide of your hand and throaty gasp, finally unload. What feels like gallons of pressurized [pc.cum] surges up your duct and fountains noisily into the bowl, a clenching, dizzying orgasm which goes on and on.");
			if(pc.cumQ() >= 5000)
			{
				output(" You’ve got plenty left over once you’ve filled the vessel to the brim, and you stand over Sera. The succubus, panting back her breath from your brutal face fuck, gladly accepts this extra gift;");
				if(chars["SERA"].hasCock()) output(" own cock needily erect,");
				output(" she cups her big tits and lets you paint them with your seed, quivering and laughing slightly as you go on to give her cruel, pretty features and brilliant hair the heavy pasting of musky [pc.cumNoun] they so richly deserve.");
			}
			output("\n\nYou take huge, shuddering breaths once you’ve spurted your last, [pc.groin] aching mightily, exhausted, shaken and profoundly satiated. The sight you’re met with when you finally wipe the sweat from your eyes is Sera, sat in front of her bowl");
			if(pc.cumQ() < 5000) output(", giving you a silent, coy crook of the eyebrow");
			else output(", giving you a perfectly coy look despite the heavy amounts of cum drooling down her face");
			output(".");
			output("\n\n<i>“Is Sera going to be a good cum slut from now on?”</i> you ask. <i>“Good ones get to lick the spoon.”</i>");
			output("\n\n<i>“Yes, [pc.master],”</i> she trills, hands on knees, pert boobs out, the picture of wide-eyed dishonesty. You present your leaking cock and murmur your enjoyment as a hot, wet tongue licks it quite clean, flicking over your slit to get every last drop. By the time you’ve");
			if(!pc.isCrotchExposed() && pc.hasLowerGarment()) output(" re-adjusted your [pc.lowerGarment]");
			else output(" put your [pc.gear] back on");
			output(" Sera is knelt over her bowl of [pc.cumNoun], tail in the air, the sound of wet lapping and horny “mmm”s filling the room. You watch the show for a while before giving her upturned ass a loving squeeze and leaving her to it.");
			
			// Ob +14
			seraObedience(14);
		}
		processTime(36);
	}
	
	pc.orgasm();
	
	chars["SERA"].lust(5);
	chars["SERA"].removeStatusEffect("Sera Masturbated");
	IncrementFlag("SERA_BITCHENING_PUNISH_RATION");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	return;
}


/* Part 2: Fully Trained Interactions */

// Seranigans
// Every 24 hours, Trained Sera has a chance of pulling one of the below.
// Once it’s triggered timer is frozen until PC trips it, i.e. there’s only ever at most one in play at any time.
// Non- merchant Sera has 25% chance, Merchant Sera 10%. Once tripped, it opens up Sera’s punishment menu.
public function seranigansCheck(totalAttempts:int = 1):void
{
	if(flags["SERA_CREWMEMBER"] != 1 || pc.hasStatusEffect("Seranigans")) return;
	if(totalAttempts < 1 || pc.hasStatusEffect("Seranigans Event")) return;
	
	var chance:int = 1000;
	if(!seraIsMerchant()) chance = 500;
	else chance = 200;
	var prob:int = Math.round((1 - Math.pow((1 / 2), totalAttempts)) * chance);
	var iEvent:int = (1 + rand(5));
	
	if(rand(1000) <= prob)
	{
		//AddLogEvent(("SERANIGANS TRIGGERED : " + iEvent + "!"), "words", minutes);
		pc.createStatusEffect("Seranigans Event", iEvent, 0, 0, 0, true, "", "", false);
	}
}
public function seranigansRainbowtoxColors():Array
{
	return ["lime green", "fluorescent pink", "fluorescent yellow", "purple", "concrete gray"];
}
public function seranigansTrigger(sEvent:String = "none"):Boolean
{
	if(!seraRecruited()) return false;
	if(!pc.hasStatusEffect("Seranigans Event") || pc.hasStatusEffect("Seranigans")) return false;
	
	var eventList:Array = [];
	
	switch(pc.statusEffectv1("Seranigans Event"))
	{
		case 1:
		case 3:
			if(sEvent == "computer")
			{
				eventList.push("computer");
				if(pc.credits >= 500) eventList.push("credit");
			}
			break;
		case 2:
			if(sEvent == "storage") eventList.push("storage");
			break;
		case 4:
			if(sEvent == "hijacked") eventList.push("hijacked");
			break;
		case 5:
			if(sEvent == "shower") eventList.push("shower");
			break;
	}
	
	if(eventList.length > 0)
	{
		seranigansEvent(eventList[rand(eventList.length)]);
		return true;
	}
	
	return false;
}
public function seranigansEvent(sEvent:String = "none"):void
{
	clearOutput();
	showBust("");
	showName("\nUH...");
	author("Nonesuch");
	clearMenu();
	
	switch(sEvent)
	{
		// Your Easily Guessed Password
		// Tripped when PC uses ship computer
		case "computer":
			output("You sit yourself down at your desk and boot your computer up. You frown as the screen goes blank for several long moments, stretching out to almost a minute. Why is it taking so long to load? Once you are finally able to access the system, you find out - <b>somebody</b> has gotten in there and downloaded what looks like every piece of scat and extreme-body porn readily available on the extranet, terabyte after terabyte of it. Oh Void, even the shortcuts have been turned into diminutive, 3D animations of... you howl in disgust. This is going to take ages to revert!");
			
			processTime(1);
			
			// [pb]
			addButton(0, "Next", seranigansEvent, "porn");
			break;
		case "porn":
			output("After a long, unpleasant hour, you have finally ascertained an extremely graphic video of triple-centenarians intimately enjoying each other isn’t going to leap out at you every time you click on one of your apps. You glower as you change your password. <b>Somebody</b> on your ship is seriously asking for it.");
			
			// +1 Hour, set lust to 0
			processTime(55 + rand(11));
			pc.lust(0, true);
			pc.createStatusEffect("Seranigans", 1, 0, 0, 0, true, "", "", false);
			
			// Next [Sera]
			addButton(0, "Next", mainGameMenu);
			break;
		// Your Shit
		// Tripped when PC accesses storage IF anything inside storage
		case "storage":
			output("You pull open your storage compartment - and are forced to step back as a bunch of stuff comes tumbling out. Didn’t you organize all this so you could easily get at what you wanted? It looks like <i>somebody</i> has been in here, torn everything out and then shoved it back in willy nilly. And for fuck sake, all these scuffs and dents! What were they doing, playing hockey with it?");
			output("\n\nYou tidy everything back away. It’s the work of half an hour, as compared to the minute it probably took to turn it all inside out. You glower at your abused belongings. <b>Somebody</b> on your ship has gotten right up your " + (pc.hasCock() ? "wick" : "vagina") + ".");
			
			processTime(30 + rand(11));
			pc.createStatusEffect("Seranigans", 2, 0, 0, 0, true, "", "", false);
			
			// Next [Sera]
			addButton(0, "Next", mainGameMenu);
			break;
		// Your Credit Card
		// Tripped when PC uses ship computer AND PC has at least 500 credits
		case "credit":
			output("You access your computer and spend a few moments browsing your e-mails. You frown as a few advertisements from unfamiliar companies catch your eye. Why would these clothing and piercing companies be contacting you? Wait a minute, what the hell are all these confirmation-of-sale messages?!");
			output("\n\nAfter a panicked few minutes, you ascertain that <b>somebody</b> has used your personal information in order to register credit chits, which they have then maxed out on all sorts of ridiculous tat. You manage to cancel some but not all of the purchases - the rest of it is already blithely winging its way to your next port of call. The banks and companies are apologetic when you furiously contact them, but all of them note that chits registered by indentured servants are legally the responsibility of their owner.");
			output("\n\nYou grind your teeth as you examine the damage done to your bank balance and credit rating. <i>Somebody</i> on your ship is gonna pay for this.");
			
			processTime(5);
			// -300 credits
			pc.credits -= 300;
			pc.createStatusEffect("Seranigans", 3, 0, 0, 0, true, "", "", false);
			
			// Next [Sera]
			addButton(0, "Next", mainGameMenu);
			break;
		// Your Ship
		// Tripped when PC returns to ship square on any planet
		case "hijacked":
			rooms[shipLocation].removeFlag(GLOBAL.SHIPHANGAR);
			moveTo(shipLocation, true);
			showLocationName();
			
			output("Mind on the alien sights and sounds you’ve recently experienced, you meander back to your... you stare. Where is your ship? You wave your hands in a juddering panic at the gaping hole where it once stood, as if that will magic it back into existence. You race around the docking area, futilely attempting to locate it, speaking to every official you can collar. Nobody noted anything unusual - it seems <b>someone</b> on your crew got departure clearance and then cleared off with it.");
			output("\n\nThere’s nothing you can do but to wait and desperately hope they come back...");
			
			processTime(15);
			pc.createStatusEffect("Seranigans", 4, 0, 0, 0, true, "", "", false);
			
			// Next [Sera]
			addButton(0, "Wait", seranigansEvent, "hijacked wait");
			break;
		case "hijacked wait":
			showLocationName();
			
			output("While the comms, GPS tracking, and status log to your ship are cut, your codex shows that it is still active. At least it’s still working.");
			output("\n\nYou decide to wonder around for about an hour, concerned but hopeful... When you return, you find that not much has changed.");
			// PC returns to ship square before 2 hours have gone by:
			output("\n\nThis is where your ship was. It’s gone now. Harried-looking officials can only shrug at you.");
			
			processTime(55 + rand(11));
			
			// Next [Sera]
			addButton(0, "Wait", seranigansEvent, "hijacked return");
			break;
		case "hijacked return":
			rooms[shipLocation].addFlag(GLOBAL.SHIPHANGAR);
			generateMap();
			showLocationName();
			
			output("You take another hour wait...");
			output("\n\nStill nothing.");
			output("\n\nWhen this event tries your patience, you turn and head towards the office to report your vehicle missing--However, from behind you, a loud sound of incoming thrusters and the clunk of landing gear catch your attention...");
			// PC returns to ship square after 2 hours:
			output("\n\nOh thank the One. Thank absolutely everything. Your ship is now standing where it was, looking slightly worse for wear, but with all the important bits still attached.");
			
			processTime(55 + rand(11));
			
			// Next [Sera]
			addButton(0, "Next", approachServantSera, true);
			break;
		// Your Shower
		// Tripped when PC with hair uses shower
		case "shower":
			// Roll first to determine which of [pc.hair], [pc.lips] and [pc.skin] it affects.
			// Additional 2 30% rolls to determine if it affects either of the others.
			// Apply random color to each body part before rolling scene.
			
			var tfList:Array = [];
			var partsList:Array = [
					["hair", RandomInCollection(seranigansRainbowtoxColors())],
					["lips", RandomInCollection(seranigansRainbowtoxColors())],
					["skin", RandomInCollection(seranigansRainbowtoxColors())],
				];
			
			if(pc.hairColor != partsList[0][1]) tfList.push(partsList[0]);
			if(pc.lipColor != partsList[1][1]) tfList.push(partsList[1]);
			if(pc.skinTone != partsList[2][1]) tfList.push(partsList[2]);
			
			var currIdx:int = tfList.length;
			var tempVal:*;
			var randIdx:int = -1;
			
			// Shuffle array
			while (0 !== currIdx)
			{
				randIdx = rand(currIdx);
				currIdx--;
				
				tempVal = tfList[currIdx];
				tfList[currIdx] = tfList[randIdx];
				tfList[randIdx] = tempVal;
			}
			
			// Failsafe
			if(tfList.length <= 0)
			{
				output("It’s just a prank, bro!");
				showerOptions([0, "ship"]);
				return;
			}
			
			output("You enter your shower, turn it on, and for long seconds just stand there with your eyes closed, allowing the hot spray of water to wash away the stress and stickiness of being a space frontiers");
			if(pc.isFemboy()) output("boi");
			else if(pc.isShemale()) output("shemale");
			else output(pc.mfn("man", "woman", "person"));
			output(". Purest pleasure! It’s only after you open your eyes and happen to glance in the bathroom mirror through the steam that you realize that something isn’t right. ");
			switch(tfList[0][0])
			{
				case "hair": output("Was your [pc.hairNoun]"); break;
				case "lips": output("Were your lips"); break;
				case "skin": output("Was your [pc.skinNoun]"); break;
			}
			output(" always " + tfList[0][1] + "...?");
			output("\n\nWith a panicked shout you leap out of the shower, grab a towel and roughly rub at the affected body part. Too late - the dye isn’t coming out, indeed is merrily spreading right across your " + tfList[0][0] + " in response to your attempts to scour it.");
			if(tfList.length > 1 && rand(10) < 3)
			{
				output(" Even worse, the water also hit your " + tfList[1][0]);
				if(tfList.length > 2 && rand(10) < 3)
				{
					output(" and your " + tfList[2][0] + " - they’re a fetching " + tfList[1][1] + " and " + tfList[2][1] + ", respectively, now.");
					switch(tfList[2][0])
					{
						case "hair": pc.hairColor = tfList[2][1]; break;
						case "lips": pc.lipColor = tfList[2][1]; break;
						case "skin": pc.skinTone = tfList[2][1]; break;
					}
				}
				else
				{
					output(" -");
					if(tfList[1][0] == "lips") output(" they’re");
					else output(" it’s");
					output(" a fetching " + tfList[1][1] + " now.");
				}
				switch(tfList[1][0])
				{
					case "hair": pc.hairColor = tfList[1][1]; break;
					case "lips": pc.lipColor = tfList[1][1]; break;
					case "skin": pc.skinTone = tfList[1][1]; break;
				}
			}
			output("\n\nFuriously you re-enter the shower and examine the dripping, guilty nozzle. <b>Someone</b> on your ship has slathered it in Rainbotox - and got you real good.");
			switch(tfList[0][0])
			{
				case "hair": pc.hairColor = tfList[0][1]; break;
				case "lips": pc.lipColor = tfList[0][1]; break;
				case "skin": pc.skinTone = tfList[0][1]; break;
			}
			
			processTime(15 + rand(11));
			pc.shower();
			pc.createStatusEffect("Seranigans", 5, 0, 0, 0, true, "", "", false);
			
			// Next [Sera]
			addButton(0, "Next", mainGameMenu);
			break;
		default:
			output("Nothing to see here!");
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
	
	return;
}

// Talk
public function seraBitcheningTalk():void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	
	// First
	if(flags["SERA_SERVANT_INTRO"] == undefined || flags["SERA_SERVANT_INTRO"] < 4)
	{
		output("<i>“Just wanna talk,”</i> you say, pulling a chair over. Sera’s wicked grin retreats behind a guarded scowl.");
		// If PC submitted to her AND used her talk options then
		if(seraIsMistress() && (flags["SERA_TALKS_PAST"] != undefined || flags["SERA_TALKS_PRESENT"] != undefined || flags["SERA_TALKS_DEMONS"] != undefined || flags["SERA_TALKS_FURRIES"] != undefined))
		{
			output("\n\n<i>“Why?”</i> she replies sullenly. <i>“I already told you about me. How else would you have known about my debt, and done this to me otherwise?”</i>");
			if(pc.isBimbo()) output("\n\n<i>“Wanna hear it again!”</i> you reply sunnily. <i>“Your voice is sexy. And now I can listen to it all I want!”</i>");
			else output("\n\n<i>“Change of perspective,”</i> you reply. <i>“Humor me.”</i>");
		}
		else
		{
			output("\n\n<i>“Why?”</i> she replies sullenly. <i>“I’m your fuck toy now, that’s all that matters. You don’t need to know how it got to this.”</i>");
			if(pc.isBimbo()) output("\n\n<i>“Don’t say that!”</i> You reach forward and pull her into a big hug. <i>“How my fuck toys tick is, like, sooo important to me. And anyway, your voice is really sexy. I wanna listen to it more.”</i>");
			else if(pc.isNice()) output("\n\n<i>“There’s more to you than being my fuck toy,”</i> you say patiently. <i>“I’d like to hear about it.”</i>");
			else if(pc.isMischievous()) output("\n\n<i>“I don’t need to, but I want to,”</i> you say, lip quirking. <i>“And I’m not the one wearing the electric collar. So c’mon. Let’s chat.”</i>");
			else output("\n\n<i>“I want to know what makes you tick,”</i> you say dryly, <i>“so I know exactly what buttons to press, if need be. I’m sure you did similar with your own slaves, once.”</i>");
			output("\n\nGrudgingly Sera scooches herself up against the wall, hugging her knees and gazing at you sidelong.");
			output("\n\n<i>“Do something for me first. Tell me who you are, really, and what you’re doing on the frontier. Please?”</i> she throws in at the end.");
			output("\n\nShe’ll find out sooner or later - if she hasn’t already gotten most of the details from the extranet - so you fill her in. She nods tersely as you explain your father’s quest, his bequeathments and how far you’ve so far gotten.");
			output("\n\n<i>“What a fun and generous dad you had,”</i> she sighs at last. <i>“Alright then, if you insist. What do you want to know?”</i>");
		}
		
		processTime(1);
		
		flags["SERA_SERVANT_INTRO"] = 4;
	}
	// Repeat !Merchant Sera
	else if(!seraIsMerchant())
	{
		output("You say you want to chat.");
		output("\n\nSera sighs exasperatedly, provocative grin replaced with that guarded, sulky scowl of hers. Still, she’s well trained. Duly she scooches herself up against the wall, hugs her knees and gazes at you sidelong.");
		output("\n\n<i>“If you insist. What do you want to know?”</i>");
	}
	// Repeat
	else
	{
		output("You say you want to chat.");
		output("\n\n<i>“Sure!”</i> Sera loses the minx persona, instead rearranging herself so she’s sitting cross-legged on her bed, tail curled around her. <i>“Shoot.”</i>");
	}
	
	seraBitcheningTalkMenu();
}
public function seraBitcheningTalkMenu():void
{
	// [Early Life] [Recent Life] [Demons] [Furries]
	clearMenu();
	addButton(0, "Early Life", seraTalkTopics, "early life");
	addButton(1, "Recent Life", seraTalkTopics, "recent life");
	addButton(2, "Demons", seraTalkTopics, "demons");
	addButton(3, "Furries", seraTalkTopics, "furries");
	if(flags["SERA_TALKS_AMBITION"] == undefined && flags["SERA_TALKS_PAST"] != undefined && flags["SERA_TALKS_PRESENT"] != undefined && flags["SERA_TALKS_DEMONS"] != undefined && flags["SERA_TALKS_FURRIES"] != undefined)
	{
		addButton(4, "Ambition", seraBitcheningTalkAmbition);
	}
	else if(flags["SERA_TALKS_AMBITION"] == 1 && flags["SERA_BUSINESS_SETUP"] != undefined)
	{
		addButton(4, "Business", seraBitcheningTalkBusiness);
	}
	else if(flags["SERA_TALKS_PAST"] != undefined || flags["SERA_TALKS_PRESENT"] != undefined || flags["SERA_TALKS_DEMONS"] != undefined || flags["SERA_TALKS_FURRIES"] != undefined)
	{
		addDisabledButton(4, "Locked", "Locked", "You need to find out more about Sera before this option is available.");
	}
	
	addButton(14, "Back", approachServantSera);
}
// Ambition
// Appears after all other talk options used
public function seraBitcheningTalkAmbition(response:String = "intro"):void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	
	switch(response)
	{
		case "intro":
			output("It’s obvious from what she’s said that, in her own way, Sera is very driven. The question is, what did she envisage the end-point of all this debt, escaping from her family and modding to be? You ask her what she aimed to achieve.");
			output("\n\n<i>“You would laugh if I said ‘shopkeeper’, would you?”</i> she mutters resentfully, still not looking at you full-on. You shrug neutrally, waiting.");
			output("\n\n<i>“All I wanted was a place of my own, where I could turn a bit of dough enabling people to achieve the same thing I did. Become more than what they were born as. Become what they always felt like inside. Maybe it looked bigger than the Chrysalis in my head...”</i> grinning a bit now, she puts her arms out in front of her. <i>“A whole emporium of specialized mods and fu... far out stuff from human culture. Inspire people, y’know? Get them thinking a bit beyond the one-dose-inclusive package bullsh... boring mods the big corps belch out by the dozen. Doing that, and meeting other mod artists, and being independent, and having a little harem... yeah. that’s what I wanted.”</i> She stares morosely down at " + (chars["SERA"].hasCock() ? "her dick" : "where her dick once was") + ". <i>“And now I don’t have any of it. Because when it came to the bit about actually earning money, it turned out I just sucked. I’m better off being a kept piece of ass, because I can’t be trusted with it. Life delivers its messages pretty damn hard if you’re poor.”</i>");
			
			processTime(2);
			
			// [Agree] [Encourage]
			clearMenu();
			addButton(0, "Agree", seraBitcheningTalkAmbition, "agree", "Agree", "She’s right, she can’t be trusted with money. Encourage her to embrace the life of a tart.");
			addButton(1, "Encourage", seraBitcheningTalkAmbition, "encourage", "Encourage", "She shouldn’t let go of her dreams so easily. Maybe all she needed to become a good vendor was closer management?");
			break;
		case "agree":
			output("<i>“At least you’ve come to terms with it,”</i> you say, gently tucking blue hair back behind an ear. <i>“And, you know: you do make a really good trophy slut.”</i>");
			output("\n\n<i>“Yeah... I am pretty good at being someone you want to either pet or slap around at the end of the day, aren’t I [pc.master]?”</i> she says, smiling and looking you in the face at last. <i>“I should concentrate on that. It’s gonna be a viable career path for me, one way or another.”</i>");
			
			processTime(1);
			
			// [Ambition] removed
			flags["SERA_TALKS_AMBITION"] = 0;
			
			clearMenu();
			addButton(0, "Next", approachServantSera);
			break;
		case "encourage":
			output("<i>“Don’t be so down on yourself,”</i> you say, gently tucking blue hair back behind an ear. <i>“I don’t think you were a bad shopkeeper. It’s just your start-up costs, on top of all the modding work you had done, got you in way too deep. That’s all paid off now, so you could start again if you wanted.”</i>");
			output("\n\n<i>“You think so?”</i> Sera replies, smiling and looking you in the face at last. <i>“So... I mean, your dad left you pretty well off, and you’ve been earning money hand over fist since you started raping... sorry, scouting the frontier. Do you think... could you see yourself giving me a start-up loan? I still have most of my suppliers’ information. I could run a gene mod service out of your ship. I mean, if you think about all the freshly discovered planets we visit - the people who never even thought transforming themselves was possible...”</i>");
			
			processTime(1);
			
			// [Sure] [Later] [No]
			clearMenu();
			if(pc.credits >= 15000) addButton(0, "Sure", seraBitcheningTalkAmbition, "encourage sure", "Sure", "It might very well be money shoveled down a hole, but it’ll make her happy.\n\nCosts 15,000 credits.");
			else addDisabledButton(0, "Sure", "Sure", "You need 15,000 credits handy to do this.");
			addButton(1, "Later", seraBitcheningTalkAmbition, "encourage later", "Later", "Maybe think about giving her a loan later.");
			addButton(2, "No", seraBitcheningTalkAmbition, "encourage no", "No", "Shut this down right now.");
			break;
		case "encourage no":
			output("<i>“No,”</i> you say firmly. <i>“No more loans.”</i>");
			output("\n\n<i>“Yeah,”</i> sighs Sera, wilting. <i>“Guess you’re right. Gonna have to concentrate on my bitch game, if I’m ever to get the funds to try it again.”</i>");
			
			processTime(1);
			
			// [Ambition] removed
			flags["SERA_TALKS_AMBITION"] = -1;
			
			clearMenu();
			addButton(0, "Next", approachServantSera);
			break;
		case "encourage later":
			output("<i>“Maybe,”</i> you say carefully, thinking about your bank balance. <i>“If you’re REALLY good.”</i>");
			output("\n\n<i>“How many");
			if(pc.balls > 0) output(" ball strokes");
			else if(pc.hasCock()) output(" handjobs");
			else if(pc.hasVagina()) output(" pussy licks");
			else output(" rimjobs");
			output(" would you say it’s gonna take for you to give me it?”</i> says Sera, grin widening. <i>“I want an estimate.”</i>");
			output("\n\nYou don’t reply, but hope your expression conveys ‘a lot’.");
			
			processTime(1);
			// [Ambition] remains in same form
			
			clearMenu();
			addButton(0, "Next", approachServantSera);
			break;
		case "encourage sure":
			output("<i>“Oh...”</i> you keep her in suspense for a moment, enjoying the look of intense anticipation on her face. <i>“...why not. But!”</i> you continue sharply, her plush boobs pressing into your [pc.chest] as she immediately bear hugs you, <i>“you are going to pay it back. And you aren’t going to waste it all on mods that YOU happen to like. Alright?”</i>");
			output("\n\n<i>“Thank you so much, [pc.master]! And yes, yes, of course.”</i> A firm look has appeared on Sera’s face by the time she’s disentangled herself from you. <i>“I’m gonna make it work this time. I don’t have rent to pay, I just need to work out how to connect with my suppliers, and then - yeah. I’m gonna work my butt off to get this off the ground, I promise you that!”</i>");
			output("\n\nYou get out your device, sort out a new business account for her and then divert 15,000 credits into it from your own account. It turns out to be remarkably straightforward, as legally she’s basically a subsidiary of you. By the time you’re done, Sera’s delighted smile has taken on a more familiar, sly and mischievous bend.");
			output("\n\n<i>“Sure you don’t want me to throw in a few sex toys when I’m making my first orders? I know how you like to experiment... alright, alright,”</i> she says, catching your own expression. She pulls her own holo pad over in a business-like manner. <i>“If you’ll excuse me - I’ve got a few messages to send.”</i>");
			
			processTime(3);
			// Deposit PC in main ship menu. Convert Sera to Merchant Sera
			flags["SERA_TALKS_AMBITION"] = 1;
			pc.credits -= 15000;
			flags["SERA_BUSINESS_SETUP"] = days;
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

// Merchant Sera
// [Business?] appears in her talk menu after she’s been funded
public function seraBitcheningTalkBusiness():void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	
	var daysPassed:Number = (days - flags["SERA_BUSINESS_SETUP"]);
	
	// If <7 days
	if(daysPassed <= 7)
	{
		output("You ask if she’s made any progress with setting up her mobile shop.");
		output("\n\n<i>“Some,”</i> she replies, fiddling with her holo-pad. <i>“It’s been pretty hard to work out a decent supply line solution, since we’re zipping around all over the place out here, and not in civilized space either.");
		if(annoIsCrew()) output(" But one of your other sluts you’ve got cooped up on here, the one with white hair, she had some pretty good ideas for getting around that.");
		else output(" But I’ve got a couple ideas of how to get around that.");
		output(" I’m just waiting to hear back from my contacts now.”</i> She pauses. <i>“Give me a bit of time, [pc.master].”</i>");
		
		processTime(1);
	}
	// If 7-40 days
	else if(daysPassed <= 40)
	{
		output("You ask how her mobile shop is doing.");
		output("\n\n<i>“Alright,”</i> she replies guardedly. <i>“It’s been tough to adapt to being, y’know, mobile, and - constantly bargaining with the suppliers, sorting out drops and so on is stressful, not gonna lie. Sometimes we’re on a planet and nothing shifts at all no matter what I put out, and I start thinking this whole thing was a horrible mistake. Then we go somewhere else and there’s a shi... gosh darn run on just everything, and THEN I stress that I didn’t bring enough of everything and have missed out on a bunch of sales.”</i>");
		output("\n\nShe fiddles with her hair, smiling wryly.");
		output("\n\n<i>“But it keeps me on my toes, and thinking lots - I like that. Give me a few more weeks. I’ll let you know then if it was a complete disaster then.”</i>");
		
		processTime(2);
	}
	// If >40 days
	else
	{
		output("You ask how her mobile shop is doing.");
		output("\n\n<i>“Yeah, alright.”</i> The succubus says it casually, but she’s not particularly good at hiding her feelings from you. Her tail spade flips around on the sheets excitedly and she’s sporting a small, happy smile. <i>“Turning a profit, anyway. Think I’ve gotten the knack of predicting what customers on particular planets want to see. You gotta be able to <i>see</i>, just from the way an alien looks and moves what they’re likely to be into, and what kinda sales technique they’re gonna respond to. I think that’s - that’s what I’ve learned most of all from this. You know, the whole enslaving me and Stockholm-ing me into behaving thing.”</i> The smile on her face is genuine. <i>“That, alright, you can sell stuff to some people by being an aloof, demonic bitch. But, if you can swallow your pride - others respond better if you smile and ask ‘em if they’ve got any kids.”</i>");
		
		processTime(2);
	}
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function seraBitcheningStoreInventory(totalDays:int):void
{
	if(flags["SERA_MERCHANT"] == undefined) return;
	
	// Rotate inventory every 7th day
	var nWeeks:int = Math.round(((days % 7) + totalDays) / 7);
	
	if(nWeeks > 0) seraBitcheningStoreRandomize();
}
public function seraBitcheningStoreRandomize():void
{
	chars["SERA"].inventory.length = 0;
	chars["SERA"].inventory.push(
		// Group A
		new (RandomInCollection(Estrobloom, Tittyblossom, JunkTrunk, ManUp, ManDown, Condensol, Virection)),
		// Group B
		new (RandomInCollection(DendroGro, BumpyRoad, KnotAProblem, Circumscriber, Equilicum, SemensFriend, SweetTreat)),
		// Group C
		new (RandomInCollection(Clippex, Lactaid, Chocolac, MightyTight, Anusoft, MagicMilker, Pussybloom, Pussyblossom, Muffstick)),
		// Group D
		new (RandomInCollection(Throbb, Gush, RubberMade, ClearYu, Dumbfuck, Rainbotox)),
		// Group E
		new (RandomInCollection(TerranTreats, AusarTreats, Nepeta, DracoGuard, OvirAce, NukiCookies)),
		// Group F
		new (RandomInCollection(MinoCharge, Bovinium, Lucifier, Sylvanol, DoveBalm, Hornitol))
	);
}
public function seraBitcheningStore(response:String = "buy"):void
{
	// Buy Blurb
	chars["SERA"].keeperBuy = "<i>“This is what I’m peddling this week,”</i> says Sera, reaching over and pulling out a drawer of her desk. Samples of differently colored mods are displayed inside.";
	// First time:
	if(flags["SERA_SERVANT_INTRO"] == undefined || flags["SERA_SERVANT_INTRO"] < 5)
	{
		chars["SERA"].keeperBuy += " <i>“Real talk: You gotta pay, [pc.master], even if you are my boss, bank manager and pimp rolled into one. I’m taking this seriously.”</i>";
		flags["SERA_SERVANT_INTRO"] = 5;
	}
	chars["SERA"].keeperBuy += "\n\nWhat would you like to buy?\n";
	
	chars["SERA"].keeperSell = "You ask the demon-lady if she would be willing to purchase any of your items.";
	chars["SERA"].keeperSell += "\n\n<i>“Sure, I’ll buy any resellable drugs you might have”</i>";
	chars["SERA"].keeperSell += "\n\nWhat would you like to sell?\n";
	
	// Merchant Sera Mechanics
	// Sera works similarly to CoC’s Benoit: Her stock is 6 items chosen randomly from 6 separate pools that change from week to week. She sells everything at a 0.8 rate.
	chars["SERA"].sellMarkup = 0.8;
	chars["SERA"].buyMarkdown = 0.8;
	
	if(flags["ZODEE_GALOQUEST"] != undefined)
	{
		if(flags["PURCHASED_SERAS_GALO"] == undefined)
		{
			if(!chars["SERA"].hasItemByClass(GaloMax)) chars["SERA"].inventory.push(new GaloMax());
		}
		else chars["SERA"].destroyItemByClass(GaloMax, -1);
	}
	
	shopkeep = chars["SERA"];
	shopkeepBackFunctor = approachServantSera;
	
	switch(response)
	{
		case "buy": buyItem(); break;
		case "sell": sellItem(); break;
		// Failsafe
		default:
			clearOutput();
			output("It’s just a prank, bro!");
			clearMenu();
			addButton(0, "Next", shopkeepBackFunctor);
			break;
	}
}
// 365 days after you lent her the money, when PC checks ship computer
public function seraBitcheningDebtCheck():Boolean
{
	if(flags["SERA_REPAID_LOAN"] != undefined || !seraRecruited()) return false;
	if(flags["SERA_BUSINESS_SETUP"] == undefined || (days - flags["SERA_BUSINESS_SETUP"] < 365)) return false;
	
	clearOutput();
	showBust("");
	showName("CREDITS\nRECEIVED");
	author("Nonesuch");
	
	output("You login, check your email and the usual feeds, the standard routine. You don’t even notice the difference to your account balance when you glance at it at first. What the... where did all that money come from?! A slightly more alert scroll through your recent comings and goings reveals that you’ve received 18,000 credits from a subsidiary account that you apparently set up a year ago. <b>Someone</b> on your ship has... paid you back?");
	
	processTime(3);
	
	pc.credits += 18000;
	flags["SERA_REPAID_LOAN"] = 1;
	pc.createStatusEffect("Sera Debt Repaid");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	return true;
}


// Sex Scenes
public function seraBitcheningSexMenu():void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	
	output("How would you like to fuck your slave?");
	
	var btnSlot:int = 0;
	
	clearMenu();
	
	if(chars["SERA"].hasCock())
	{
		if(pc.hasStatusEffect("Sera Tease Cooldown")) addDisabledButton(btnSlot++, "CockTease", "Cock Tease", "Probably best to let her recharge. Build that frustration up.");
		else addButton(btnSlot++, "CockTease", seraBitcheningSexTeaseM, undefined, "Cock Tease", "There’s no longer an objective to it, but it’s still fun to make her beg, right?");
	}
	
	if(chars["SERA"].hasVagina())
	{
		if(pc.hasStatusEffect("Sera Tease Cooldown")) addDisabledButton(btnSlot++, "CuntTease", "Cunt Tease", "Probably best to let her recharge. Build that frustration up.");
		else addButton(btnSlot++, "CuntTease", seraBitcheningSexTeaseF, undefined, "Cunt Tease", "There’s no longer an objective to it, but it’s still fun to make her beg, right?");
	}
	
	if(pc.hasVagina() && chars["SERA"].hasCock()) addButton(btnSlot++, "Ride", seraBitcheningSexRide, undefined, "Ride", "Vaginally ride her cock.");
	else if(!pc.hasVagina() && !chars["SERA"].hasCock()) addDisabledButton(btnSlot++, "Ride", "Ride", "Sera needs to have a cock and you need to have a vagina to try this!");
	else if(!chars["SERA"].hasCock()) addDisabledButton(btnSlot++, "Ride", "Ride", "Sera needs to have a cock for you to try this!");
	else addDisabledButton(btnSlot++, "Ride", "Ride", "You need a vagina to try this!");
	
	if(pc.hasCock()) addButton(btnSlot++, "Buttfuck", seraBitcheningSexButtfuck, undefined, "Buttfuck", "Have Sera be your little buttslut.");
	else addDisabledButton(btnSlot++, "Buttfuck", "Buttfuck", "You need a penis to try this!");
	
	if(pc.hasCock()) addButton(btnSlot++, "Titfuck", seraBitcheningSexTitfuck, undefined, "Titfuck", "Fuck Sera’s chest cleavage.");
	else addDisabledButton(btnSlot++, "Titfuck", "Titfuck", "You need a penis to try this!");
	
	if(pc.cockTotal() >= 2) addButton(btnSlot++, "Double P.", seraBitcheningSexDoublePenetration, undefined, "Double Penetration", "Fuck both of Sera’s holes.");
	else addDisabledButton(btnSlot++, "Double P.", "Double Penetration", "You need at least two penises to try this!");
	
	addButton(14, "Back", approachServantSera);
	
	return;
}

// Ride
// Requires moderately spaced vagina
public function seraBitcheningSexRide():void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	var obedience:Number = seraObedience();
	var vIdx:int = pc.cuntThatFits(chars["SERA"].cockVolume(0));
	if(vIdx < 0) vIdx = pc.biggestVaginaIndex();
	var tinyVag:Boolean = (pc.vaginalCapacity(vIdx) < chars["SERA"].cockVolume(0) || pc.vaginas[vIdx].looseness() < 4);
	
	output("You smile at Sera and, without saying a word, twirl a finger. The fantastically augmented human flips over onto her back immediately, grinning back.");
	output("\n\n<i>“Has [pc.master] come for a nice long ride on the Sera train?”</i> she coos, twiddling and tweaking her nipple piercings as she gazes up at you, generous erection pointing upwards. <i>“I do so enjoy watching you squirt yourself silly on me.”</i>");
	output("\n\nHer words are one thing; the quiver beneath her [sera.skinColor] skin, the way her cock is already urgently erect, the anticipation tightening up her muscles and flushing her cheeks are another. You both know who’s in charge here, and you show it by climbing onto the bed, pushing your [pc.chest] into her plush boobs and cuffing her hands securely behind her with a practiced click. You recede, spreading your hands slowly down the softness of her inner thighs, taking your time, reveling in the way the succubus’s poise becomes more and more stretched. Her lips part, slight gasps escape her as you ever-so-gently lead two fingers up her burningly erect cock. It’s beading clear pre, she’s that turned on. Could she cum just from this? Maybe - but she doesn’t.");
	output("\n\n<i>“You’re in luck, slave. I’m in the mood right now,”</i> you husk, leading your [pc.vagina " + vIdx + "] up the hot, stern flesh of her dick, luxuriating in the increasing wetness and heat which pulses through your sex. <i>“I think I’ll fuck you until you can’t even remember your name.”</i> You perch on top of her bulbous head, gently rotating your [pc.hips], teasing the most sensitive part of her achingly erect male sex. She seems to be in a daze, mouth open and eyes glazed, lost in the tantalizing movement of it. <i>“And what are you going to do?”</i>");
	output("\n\n<i>“Cum,”</i> mumbles Sera. <i>“I mean - not cum. [pc.Master].”</i>");
	output("\n\n<i>“Very good!”</i> you smile widely. She grins back, naked enjoyment shining on her features. Handcuffed and at your disposal.");
	output("\n\nShe lets out a long, drawn-out sigh when you part your pussy lips and sink slowly down onto it. You go as slowly as you possibly can at first, enjoying the sensation of Sera’s hard, veiny flesh pressing against your slick walls, rotating your [pc.hips] to bend it back and forth within you.");
	if(!tinyVag) output(" You can manipulate her dick however you want in your spacious twat - making her groan hoarsely as you take her down to the base easily, bending it this way and that, clenching your thighs to tighten up on her thick girth. Dreamily you fantasize about using mods to shrink her right down, giving her a small, cute girl dick, humiliating and oh-so sensitive, teasing her with it forever more... your [pc.vagina " + vIdx + "] " + (!pc.isSquirter(vIdx) ? "beads" : "gushes") + " [pc.femcum] freely at the thought.");
	else output(" You’re used to taking her dick now, it no longer intimidates you - despite how massive the end of it feels in your tight, wet fuck-pocket. It’s intense, getting packed out like this - but is it ideal? Dreamily you fantasize about using mods to shrink her right down, giving her a small, cute girl dick, humiliating and oh-so sensitive, teasing her with it more... your [pc.vagina " + vIdx + "] " + (!pc.isSquirter(vIdx) ? "beads" : "gushes") + " [pc.femcum] freely at the thought.");
	
	pc.cuntChange(vIdx, chars["SERA"].cockVolume(0));
	
	processTime(5 + rand(2));
	
	// [pb]
	clearMenu();
	addButton(0, "Next", seraBitcheningSexRidePtII, vIdx);
	
	return;
}
public function seraBitcheningSexRidePtII(vIdx:int = 0):void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	output("Her mouth hangs open, luminescent eyes bobbing as you methodically work her in your depths, sensually screwing yourself up towards a shimmering release.");
	output("\n\n<i>“Ohh,”</i> she finally groans as the minutes drag out, need roughening her voice, shoulders flexing against her bonds. <i>“C’mon [pc.master], don’t tease me like this! If you’re gonna use me, fucking use me...”</i> You close your eyes, basking in the helpless arousal you can hear in her voice, allowing the tenseness within you to release in a glorious high, [pc.vagina " + vIdx + "] quivering and clenching around her cock. When the last pulse of bliss has shaken through you, you lazily open your eyes, reach down and pinch one of Sera’s erect nipples sharply. You bite your lip at the way this makes her gasp and jerk her cock into your tender walls.");
	output("\n\n<i>“You swore, bad girl,”</i> you murmur. <i>“You know what I think when you’re bad?”</i> you rotate your [pc.hips] around her fuck-pole rhythmically, hypnotically. <i>“That you don’t deserve release. That I should fit you with a nice, tight cock ring, maybe a urethra plug as well. Keep you pent up and on the edge for a week.”</i>");
	output("\n\n<i>“I’m a good girl!”</i> she cries, head thrown back, teeth clenched. <i>“I’m so gosh darn good! Can’t you feel how f- very polite and obedient I am?”</i> She humps her swollen balls and thick thighs upwards, yellow eyes fixed on your face and [pc.chest], focused solely on your pleasure.");
	output("\n\n<i>“Ooh...”</i> you sigh, pleasure trembling through you, fingers caressing your [pc.nipples]");
	if(pc.isLactating()) output(" until [pc.milk] dribbles freely down your breast, dripping down onto the fervent flesh of your slave");
	output(". <i>“Bit more like that and I might start believing you...”</i>");
	output("\n\nSera grits her teeth and thrusts upwards into your [pc.vagina " + vIdx + "] as hard as she can, tormented by the sight of you embedded on her well-trained cock. You bite your [pc.lips] in high ecstasy, the fervid writhing and thrusting of your slave’s sweet futa penis inside you inflaming your senses. You crook a finger into each brass ring of Sera’s tit piercings and pull firmly upwards, the gasp this draws making your coursing, rampant orgasm all the better. As you come down, cheeks burning and after-tremors tickling through you, you can feel her dick is still ramrod straight and eagerly primed. You " + (!pc.isBimbo() ? "laugh" : "giggle") + ", glorying in the state of the demoness, mouth open and eyes rolled back, but still hard as rock within you. It’s utterly ingrained in her that she cannot cum without instruction, no matter how much she wants to. You did that; with stern hand and expert caress you wrought this foul-mouthed hellion into your own perfect pussy-bitch, and now you’re reaping the wonderful rewards.");
	output("\n\nA long, husky moan escapes her cerulean lips, and you’re driven to start fucking her with energetic bounces of your [pc.ass] again.");
	output("\n\nYou slow down, you speed up, you tease every protrusion of Sera’s luscious body you can reach with your cusping, pinching fingers.");
	if(pc.isLactating())
	{
		output(" [pc.Milk] continues to course down from your engorged nipples, warm pleasure spreading within your [pc.boobs] as you continue to ride her big, juicy cock, and you don’t deny it - you caress");
		if(pc.hasFuckableNipples()) output(", finger");
		output(" and tug at your [pc.nipples] until with a delighted squeal your breasts tremble in squishy boobgasm, spraying Sera’s chest and face with [pc.milkVisc] fluid.");
	}
	output("\n\nThe pleasure builds into one, final, pulsing orgasm, which you ride out with " + pc.mf("roaring", "squealing") + " ecstasy, clutching the succubus’s plump, [sera.skinColor] breasts and bending her cock for all it is worth, " + (!pc.isSquirter(vIdx) ? "oozing" : "squirting") + " [pc.femcum] all around it. And yet, when you finally catch your breath, when you finally withdraw, trailing your juices, it’s still pointing straight at the ceiling, still red-raw with denied release, her balls still acutely swollen. She’s too fucked to do anything but gaze at you pleadingly. What a <i>good</i> girl.");
	output("\n\nHolding her gaze, you gently push your loosened, leaking twat against the base of it, enveloping it in your folds; then you deliberately slide upwards, pushing it backwards as you put wet, warm pressure on its sensitive, fleshy underside.");
	output("\n\n<i>“Cum,”</i> you breathe. She opens her mouth and spasms, her cock flexing underneath your slick labia again and again, arching her back against her bonds as she spurts flumes of cum the length of her body, gleefully painting her face and jiggling tits in her own filth.");
	output("\n\nWhen she’s down you lie down, undo her cuffs and gently pull her onto your [pc.chest], enjoying the warmth of the afterglow with her.");
	output("\n\n<i>“That was a pretty good f- screw, [pc.master],”</i> she murmurs, eyes unfocused and unabashed grin on her lips. <i>“May I have another?”</i> You let your hands roam over her warm, soft, curvy body, luxuriating in her lack of resistance to being treated as your fuck-pet, and the fact she practically purrs when you slide your hand over her horns.");
	output("\n\nAfter you’ve cuddled her a bit longer you get up, redress and get back to it, taking a glow of deep self-satisfaction with you.");
	
	processTime(25 + rand(11));
	
	chars["SERA"].lust(35);
	chars["SERA"].orgasm();
	pc.orgasm();
	
	IncrementFlag("SERA_BITCHENING_RIDE");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	return;
}

// Buttfuck
// Requires not unreasonably sized dick
public function seraBitcheningSexButtfuck():void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	var cIdx:int = pc.cockThatFits(chars["SERA"].analCapacity());
	if(cIdx < 0) cIdx = pc.smallestCockIndex();
	
	output("Sera watches, hand on chin, as you retrieve the bottle of lube.");
	output("\n\n<i>“I’m in for an ass-pounding, am I?”</i> she coos. You slather your [pc.cock " + cIdx + "] in oil, working hard, vein heat into it, watching as she picks herself up onto her hands and knees, arching her back to present the peachy swell of her behind, giving you the eyes over her shoulder. <i>“Go on then. Give it to me hard. Remind me who’s in charge, because sometimes, you know... I do forget.”</i>");
	output("\n\nYou clamber onto the bed, lay one hand on a soft buttock and penetrate the cute pink wrinkle of her asshole with oily fingers. It resists you only for a moment before allowing you to sink almost down to the knuckle into her delightfully tight and clinging passage. The succubus remains still and says nothing, arms folded on the duvet and apparently unperturbed when you add first one, then two more fingers in her warm depths, opening her up and getting her used to girth. It’s only when you flop your oil-slickened erection into the valley of her behind and shift your hand down to her exposed pussy, tracing her outer lips and gently stroking the tough button of her clit that she twitches agitatedly.");
	output("\n\n<i>“You so in love with the sight of my poop-tube that you’ve forgotten what to do w- ?”</i> her breath catches in her throat as you grip her hips and sink your [pc.cock " + cIdx + "] past her sphincter. Demandingly you push your [pc.cockHead " + cIdx + "] inwards, and with careful, back and forth sawing you’re able to slide a considerable amount of your [pc.cock " + cIdx + "] into her upturned butt. The sensation seizing it up once you’ve found a nice rhythm - withdrawing so that your bulging head can feel the tight ring of her asshole and then flexing your [pc.hips] to holster yourself back into her hot depths - is so good you struggle powerfully with an urge to let go of your lust straight away. The walls of her colon, oiled by the passage of your cock, cling to it sweetly as it withdraws, and is fervidly tight as you close your grip on her thighs and press your hard meat back home... made all the more lush by the sight of the peachy, fertile [sera.skinColor] behind you’re penetrating, rippling slightly to your exertions. You want nothing more than to fuck that wildly, discard any other thoughts to pump every ounce of your heavy arousal into that wonderful piece of ass that you own.");
	
	pc.cockChange();
	
	output("\n\nBut you deliberately keep your movements slow and sensual, and as you spear inwards between her buttocks you let your hands roam over Sera’s knelt form. You slip your fingers back down to her pussy, burrowing inside to caress its slick tunnel whilst sending your other hand shifting down her flank to cup a breast, finding the tough nub of her nipple, increasing the pace at which you drive your [pc.cock " + cIdx + "] home and the closeness with which you knead the sensitive tips of the succubus’ juicy body very slowly.");
	output("\n\nMany patient hours were spent training your slave into a well-broken-in buttslut, and they were spent well. The succubus grunts and groans to the heavy thrust of your [pc.hips], but you can hear they are born of frustration at how moderate the pace of your fucking is. Girl juice liberally warms the fingers craning into her pussy");
	if(chars["SERA"].hasCock()) output(", and her thick cock jerks spasmodically to your every push");
	output(".");
	output("\n\n<i>“C’mon, you piece of shit!”</i> she growls, muffled into the sheets. <i>“I thought you came here to fuck me raw! Stop pussy-footing around!”</i>");
	output("\n\nYou give her a meaty slap on the backside for impertinence - and then comply, tensing up your muscles to pump your [pc.cock " + cIdx + "] as hard as you can into her warm, clinging innards, angling downwards to push into her vaginal walls");
	if(chars["SERA"].hasCock()) output(" and prostate");
	output(". Sera clutches big handfuls of duvet with her hands and teeth; when you reach forward to cusp a big, pert breast for leverage, tweaking the hard, cherry-like nipple, a throaty moan vibrates through the sheets.");
	output("\n\nOne hand clutching her plush tit and the other holding onto her thigh,you exult in the wetness you feel oiling your " + (pc.balls > 0 ? "[pc.balls]" : "hips") + " when you slap into her bouncing ass with each returning thrust into that delightfully tight hole");
	if(chars["SERA"].hasCock()) output(" and the way her cock strains fervently beneath her, almost touching her taut belly");
	output(". Sera gasps and swears incoherently, sweat dappling her back, irrepressibly turned on by the merciless press and stretch of your cock - but not quite enough to get off. Exactly where you want her.");
	// Knot:
	if(pc.hasKnot(cIdx)) output(" With one final, hard push, you spread her ring with your [pc.knot " + cIdx + "]. After one breathless moment where you’re not sure it will fit, you’re in - well and truly embedded into your bottom bitch. Sera keens and swears repeatedly as you pump into her, knot pulsing with fierce arousal from the flesh stretched tightly around it.");
	output("\n\nYou slow yourself down a little, exulting in the results of all your hard work and the wonderful, oily cling of the round [sera.skinColor] behind you’re mired in, willing this to go on for as long as possible.");
	output("\n\n<i>“No! Faster!”</i> grits Sera, sheets bunched in her fists. You can practically hear the anticipation of orgasm stiffening her words. <i>“Please! [pc.master]!”</i>");
	output("\n\n<i>“I shouldn’t need to tell you,”</i> you breathe. Your throaty words turn into a groan as her hot tunnel obediently tightens up intensely around your [pc.cock " + cIdx + "]. <i>“That’s it...”</i> You reward her by increasing the flex of your [pc.hips], reaming her jiggling ass, confident now in the well-trained demon whore to not only take it but enjoy every stroke. You switch hands; one finds her other nipple and closes around it intently, the other gives her jiggling butt another well-deserved swat. The whimper this draws out of her only spurs you on.");
	output("\n\n<i>“Who does this ass belong to?”</i> you husk. Your hand lands with a clap on her other buttock. <i>“Whose stuck-up bitch is loving every second of getting her butt filled with dick? Answer me!”</i>");
	output("\n\n<i>“Fuck! You! Give it to me, you cunt!”</i> howls Sera, sweat running down her back in rivulets. <i>“Fucking give it to me if you think you’ve got it!”</i> You respond by reaching forward, clutching her horns, and surge to your juicy high by pounding her rippling tunnel in a frenzy.");
	output("\n\nA sigh of deepest satisfaction leaves your [pc.lips] as you pump your load into Sera’s upturned butt, which jiggles with each returning thrust of your clenching [pc.hips]");
	if(pc.balls > 0) output(" and [pc.balls]");
	output(". ");
	if(pc.cumQ() >= 5000) output("You go on and on, working out every last drop from your bountiful cock, until [pc.cum] is spurting around your girth and the succubus’s belly is rotund, her guts packed with your warmth.");
	output(" When you’ve pulsed your last");
	if(pc.hasKnot(cIdx)) output(" and your [pc.knot] finally deflates");
	output(" you pull slowly outwards, fingers trailing down her boobs, enjoying the way her cum-slicked tunnel still clings to your prick all the way out.");
	output("\n\nSera drops onto one side to recover, your seed slowly oozing out of her gaped asshole, lips parted and looking slightly dazed. You grin at the sight, enjoying your own post-coital buzz. She doesn’t resist when you gently tug her into your arms and cuddle her, stroking the line of her oval chin.");
	output("\n\n<i>“I love it when you get angry like that,”</i> she murmurs at last. <i>“Feels like I’m doing my job.”</i>");
	output("\n\nYou give her an affectionate squeeze before");
	if(!pc.isNude()) output(" putting your [pc.gear] back on and");
	output(" leaving her to doze.");
	
	processTime(30 + rand(11));
	
	chars["SERA"].lust(35);
	chars["SERA"].orgasm();
	pc.orgasm();
	
	IncrementFlag("SERA_BITCHENING_BUTTFUCK");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	return;
}

// Titfuck
public function seraBitcheningSexTitfuck():void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	var cIdx:int = rand(pc.cocks.length);
	
	output("Your eyes linger on your succubus concubine’s breasts. Sculpted by state-of-the-art mods into something like perfection, those curving, flawless, impossibly perky EE-cups beg to be touched, their plump, erect [sera.nippleColor] nipples squeezed and nibbled. Once upon a time they were a cruel provocation, flaunted openly but never to be felt pressed against you - unless you were willing to submit to their owner’s sniggering, vindictive desires. It all belongs to you now, though. To do with as you wish. The thought makes [pc.eachCock]");
	if(pc.isCrotchExposed()) output(" openly surge" + (pc.cocks.length == 1 ? "es" : "") + " into erection");
	else if(!pc.isCrotchExposedByLowerUndergarment()) output(" tent your [pc.lowerUndergarment] eagerly");
	output(".");
	output("\n\n<i>“See something you like, [pc.master]?”</i> Sera smirks. She puts her hands behind her horns and stretches, cat-like. Her boobs protrude, the ample flesh quivering restlessly. <i>“Gawping like a brat who’s been told how to disarm the childlock on his dex.”</i>");
	output("\n\n<i>“Kneel in front of me,”</i> you instruct");
	if(!pc.isCrotchExposed()) output(", peeling off your [pc.lowerGarments] and allowing your densely erect cock" + (pc.cocks.length == 1 ? "" : "s") + " to spill out as you do");
	output(". The heavily modified human affects impishness but knows she must obey; slithering off her bed, crawling on the floor towards you with exaggerated jounces of her hips and shoulders like the demonic pet she is.");
	output("\n\n<i>“I do so love my boobs,”</i> she croons, grinning up at you wickedly as she massages them, flesh plumping out between her claws, shifting inwards to rub at her nipples. You grunt your approval as she reaches out with one hand to grip your [pc.cock " + cIdx + "] at the " + (!pc.hasKnot(cIdx) ? "base" : "knot") + ", leaning forward to teasingly, fleetingly licking the underside. <i>“Got such a nice heft to them. You push them out, bounce them this way and that, and idiots will stare, and drool, and then do anything you tell them... except you, [pc.master]. Of course.”</i> Lusty evil radiates up from in front of your [pc.legOrLegs].");
	// Massive cum production:
	if(pc.cumQ() >= 2000)
	{
		output("\n\nYour libido, bloated further by the shift of her fingers along your thick shaft, urge you to ram yourself between the teasing bitch’s pillows and go nuts... but to make this as good as it could possibly be, you really need some lubrication. And you know exactly how you’re going to get it.");
		output("\n\n<i>“Keep doing that,”</i> you growl. <i>“That’s it...”</i> you sigh as Sera moves her grip up and down your [pc.cock " + cIdx + "], pleasure thrumming through it, more and more intense with each shift of her hand.");
		output("\n\n<i>“Thought you were going to fuck my tits?”</i> she says, luminescent eyes narrowing. <i>“You gotten so lazy you can’t even be bothered to crank your own meat?”</i>");
		output("\n\n<i>“Language,”</i> you reply brusquely, rearing your dick out of her hand in order to land her a good cock-slap across the cheeks. You slap the [pc.cockHead " + cIdx + "] back down onto her solar plexus. <i>“Grip down here and then bring it up...”</i> She does as you ask, squeezing your");
		if(pc.balls > 0) output(" [pc.balls]");
		else if(pc.hasKnot(cIdx)) output(" [pc.knot]");
		else output(" base");
		output(" before slowly slipping her hot, smooth palm upwards. She flinches and gasps as you allow your pent-up lust to rise to the surface, your cock-eye dilating and oozing a thick load of pre-cum onto her soft skin in response to her hand’s movements. It’s a bare few drops relative to the load you’ve got stored up in your overstuffed");
		if(pc.balls > 0) output(" ball" + (pc.balls == 1 ? "" : "s"));
		else output(" semen gland");
		output(", but that’s almost a liter of [pc.cumFlavor] lube you trickle down her cleavage.");
		output("\n\n<i>“I see,”</i> Sera half-coos, half-hisses, drifting her slut-claws through the coating mess you’ve poured down the parting of her ample breasts. She locks eyes with you as she licks her nails clean. <i>“You’re always one step ahead in your awfulness, aren’t you [pc.master]? It makes me very horny.”</i> Wordlessly you slap your [pc.cock " + cIdx + "] wetly between her tits; still leering up at you, she squeezes her ample, oily flesh around it and slowly begins to move them up and down.");
	}
	// Lactation:
	else if(pc.isLactating())
	{
		output("\n\nYour libido, bloated further by the shift of her fingers along your thick shaft, urge you to ram yourself between the teasing bitch’s pillows and go nuts... but to make this as good as it could possibly be, you really need some lubrication. And, after a moment’s thought, you decide how you’re going to get it.");
		output("\n\n<i>“They are a pretty nice set of tits, slut,”</i> you smirk, raising your hands up to your own [pc.boobs], massaging them as you speak. <i>“But your [pc.master]’s are better. Know why?”</i>");
		output("\n\n<i>“Because they belong to you?”</i> replies Sera, in an insolently sugary tone. You keep your eyes locked on her, drinking in the sight of her on her knees in front of you slowly jerking your [pc.cock " + cIdx + "] as you continue to mash your breasts, allowing your lust to inflame your senses. The heavy, liquid warmth in your boobs is never far from the surface, and when you seize your [pc.nipples], knead them closely, it gleefully rises to an ecstatic point. Your [pc.lips] part and you gasp as your boobs quiver in orgasm, spraying [pc.milk] in wonderful long gouts, painting the succubus whore at your [pc.feet] in [pc.milkColor] goodness, making her gasp and twitch.");
		output("\n\n<i>“No,”</i> you sigh. Hands on boobs, you lean forward and squeeze a good, long quantity of your [pc.milk] directly down the crack of her cleavage. <i>“It’s because I can do that with them.”</i>");
		output("\n\n<i>“I see,”</i> Sera half-coos, half-hisses, wiping [pc.milkNoun] off her eyes. She locks eyes with you as she licks her claws clean. <i>“You’re always one step ahead in your awfulness, aren’t you [pc.master]? It makes me very horny.”</i> Wordlessly you slap your [pc.cock " + cIdx + "] between her tits; still leering up at you, she squeezes her ample, wet flesh around it and slowly begins to move them up and down.");
	}
	// No massive cum production OR lactation:
	else
	{
		output("\n\nYour libido, bloated further by the shift of her fingers along your thick shaft, urge you to ram yourself between the teasing bitch’s pillows and go nuts... but to make this as good as it could possibly be, you really need some lubrication. What you really need is... distracted, you cast your eyes around the room.");
		output("\n\n<i>“Looking for this?”</i> Sera wiggles the small bottle in her hand. Sly, reptilian eyes remain on you as she raises the tip to the crease of her cleavage and trickles a stream of the warm, coating lube between her boobs. <i>“I try and keep it around. I don’t know why,”</i> she purrs, casually brushing her fingers up the underside of her breast, glossing her [sera.skinColor] flesh to a high sheen, <i>“but whenever you come in here I assume you’re going to do something awful with me.”</i> Wordlessly you slap your [pc.cock " + cIdx + "] wetly between her tits; still leering up at you, she squeezes her ample, oily flesh around it and slowly begins to move them up and down.");
	}
	output("\n\nUp and down go Sera’s boobs, plumping right around your erect prick, a well-oiled sleeve of smooth flesh which caresses every bulging, hot inch. For long, rich moments you simply stand and let her do the work, working her arms assiduously to rub ever greater amounts of tightly-packed urge into you. For all her feigned duplicity, there’s color in those " + (pc.isLactating() ? "[pc.milkNoun]" : "[pc.cumNoun]") + " spattered [sera.skinColor] cheeks");
	if(chars["SERA"].hasCock()) output(", her own sizable dick is at half-mast");
	output(" and her fingers are constantly wandering across her large, erect nipples. You sigh and close your eyes, murmuring her on as she ups the pace, mashing slickened softness into your cock-flesh stringently with brisk flicks of her wrists, burying your [pc.cockHead " + cIdx + "] in pillowy warmth as she pushes it upwards.");
	output("\n\n<i>“You like that?”</i> she husks, a certain wildness creeping into her tone. <i>“You like having me on my knees in front of you, debasing me like this?”</i> Her spaded tail flicks this way and that. <i>“You like using me as your cocksleeve, not giving the slightest f- ?”</i>");
	// Big dick:
	if(pc.cLength(cIdx) >= 11.5)
	{
		output("\n\nSera’s open mouth, with the usual stream of bitchy aggro pouring out of it, has been a tempting target for some time, and you can’t ignore it any longer. You growl as you dig your fingers into her breasts whilst simultaneously thrusting upwards, your missile of a dick easily long enough to reach past her big, cushiony tits and spring your [pc.cockHead " + cIdx + "] right between her moist lips, immediately silencing her.");
		output("\n\nHer eyes widen, and for a few blessed moments she’s frozen; enough time for you to take control of proceedings, roughly mashing the wonderful softness of her tits around the base of your shaft whilst thrusting the beading end past her lips and teeth, opening her willful gob up and pushing into the wet hotness within.");
		output("\n\n<i>“Got such a sweet mouth on you,”</i> you growl, intense lust pulsing behind your brow as you get the angle just right, gliding through her");
		if(pc.cumQ() >= 2000) output(" [pc.cumNoun]");
		else if(pc.isLactating()) output(" [pc.milkNoun]");
		else output(" oil");
		output("-slicked cleavage to spear all of your cock-end right past her lips. <i>“Shame the amount of trash that comes out of it.”</i>");
		output("\n\n<i>“Only so you give it to me like you can,”</i> she hisses after you recede outwards with a saliva-flecked ‘pop’, hot breath billowing over your [pc.cockHead " + cIdx + "]. Clawed hands press over your own, and she slathers your sensitive ends in hot, shifting demon tongue.");
		output("\n\nGive it to her good you do, tit-flesh bulging between your fingers as you pump aggressively between her [sera.skinColor] mounds, rubbing her boobs up and down your shaft as you do, like the most perfectly shaped ona-hole in the galaxy, ordering her to hollow her cheeks around the protuberant tip. She does with a shudder and a muffled whimper, tongue slicking up the underside as you ram it deep into her mouth.");
	}
	// If else:
	else
	{
		output("\n\nReaching down and seizing Sera’s boobs yourself, tweaking her protuberant nipples hard before sinking your fingers deep into the soft flesh, transforms her bile into a juicy, surprised squeal. You hold her steady as you jackhammer your [pc.hips] into her breasts, waves of motion spreading across the topside each time your [pc.cockHead " + cIdx + "] gophers into view between them. Obscene, oily ‘pat-pat-pat’s fills the room, accompanied by your throaty groans and Sera’s heavy breathing. It’s like the most shapely ona-hole in the galaxy.");
	}
	output("\n\nYou glory in the shifting sensations of soft, squishy boob");
	if(pc.cLength(cIdx) >= 11.5) output(" and hot, wet mouth");
	output(" blanketing and shifting around your [pc.cock " + cIdx + "] at base and tip, arousal tightening up your shaft");
	if(pc.balls > 0) output(" and [pc.balls]");
	output(" until it becomes unbearable. You grip her horns as you cum like a rocket, locking her in place so she takes every last spurt of [pc.cum] in the pretty, evil face. High on submission, the succubus goads you on with kneads of her breasts around your throbbing cock, closing her eyes and opening her mouth in response to the [pc.cumVisc] rain you fountain across her visage.");
	// Small load:
	if(pc.cumQ() < 2000)
	{
		output(" Plentiful gobbets spatter against her forehead and cheeks, many more into her mouth, gulped away with one, wet swallow. She sends her tongue dancing over your tender, gently throbbing head then, wicking away what remains. By the time you’re done, your [pc.cock " + cIdx + "] is polished quite clean whilst her face and front is covered in your filth. Exactly how it should be.");
	}
	// Large load:
	else
	{
		output(" There’s plenty to give her, and you’re sure that she gets every last drop. Painting her face completely [pc.cumColor] with wonderful, fecund pulses; then her hair; then making her present her thoroughly abused tits so that they can receive a");
		if(chars["SERA"].hasCock()) output(" fresh");
		output(" coating; then, when she opens her gleeful eyes, you sink deep into her mouth and unload with a deeply satisfied groan, swelling her cheeks out with the last of it. She clutches your thickly oozing spent dick as she dutifully swallows, before sending her tongue dancing over your tender, gently throbbing head, wicking away what remains. By the time you’re done your [pc.cock " + cIdx + "] is polished quite clean, whilst she is covered from horns to tail in your filth. Exactly how it should be.");
	}
	output("\n\n<i>“Mmm...”</i> she purrs, her voice scissors slicing through silk, stroking a [pc.cum] and " + (!pc.isLactating() ? "oil" : "[pc.milk]") + " spattered breast");
	if(!pc.isCrotchExposed()) output(" as she watches you pull up your [pc.lowerGarments]");
	output(". <i>“I love it when you get all rough and selfish, [pc.master]. It’s so imperious and admiral-y.");
	// Space camper van:
	if(9999 == 9999) output(" Course, that’s where that little fantasy ends, isn’t it? Admiral Space Camper Van.”</i> She sighs, pointedly gazing around her cramped, spartan quarters.");
	else output("”</i>");
	
	processTime(25 + rand(11));
	
	chars["SERA"].lust(35);
	//chars["SERA"].orgasm();
	pc.orgasm();
	
	IncrementFlag("SERA_BITCHENING_SEXED");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	return;
}

// A99’s DP Scene
// Requirements: This scene requires that Sera be completely submissive, and you must have already taken her virginity.
public function seraBitcheningSexDoublePenetration():void
{
	clearOutput();
	showSera(true);
	author("Archangel99");
	
	var cIdx:int = pc.biggestCockIndex();
	var cIdx2:int = pc.biggestCockIndex2();
	
	output("You saunter into the room to the sight of your succubus slave lying on her bed and playing a game on her tablet. She immediately sits up when she notices you enter the room, and bows her head submissively. <i>“Hello [pc.Master]. How may I service you today?”</i> she says, a salacious grin spreading across her face. As always, there’s still a little fire. But, you wouldn’t have it any other way.");
	output("\n\nYou grin, and bend over to take the cuffs out of the case, wiggling your [pc.hips] as you stand up. You turn, and spin the cuffs around your finger, motioning for Sera to turn around with the index finger of the other hand. Her perfectly formed breasts and butt jiggle as she obeys your command. She reaches back and spreads her asscheeks, revealing the pink star of her asshole and her dripping pussy.");
	output("\n\n<i>“Come on, [pc.Master]. Use this toy any way you want!”</i> she says, the grin still on her face, her eyes boring into yours, filled with lust.");
	output("\n\nYou pick up the bottle of lube, get rid of your [pc.gear], and walk over to her. You cuff her to the bed with the ease of long practice, then lean over her and lick the side of her neck all the way up to the tips of her demonic ears. She shivers and moans as she feels your wet, [pc.tongue] snaking up the side of her neck and her sensitive ears. But the moment your stiffening [pc.cocks] presses into her butt cleavage, she coos with delight and wiggles her hips,");
	if(chars["SERA"].hasCock()) output(" Her dick swaying from side to side as she does so,");
	output(" egging you on.");
	output("\n\nYou chuckle, finding it funny how the previously dominant Sera has now become your slave, turning into putty in your hands with just a touch or a kiss.");
	output("\n\nYou rear back and slap her ass, watching the flesh jiggle. She squeals when you do so, jerking forwards into the bedpost, which has the added effect of flattening her tits quite nicely, making the flesh of her breasts spill out to the sides.");
	output("\n\nSera pants, aroused by the thoughts of what you plan to do to her. <i>“You got the lube... I’m guessing you wanna stick it up my butt again, [pc.master]?”</i> she says.");
	output("\n\n<i>“Even better,”</i> you reply with a grin.");
	output("\n\nShe grins knowingly and arches her back, presenting her ass to you. You caress her butt, marveling, again, at how perfectly it’s been sculpted, practically begging to be fucked and spanked. You pop the cap of the lube and spread some on your fingers, allowing some to drip down on top of her asshole. She tenses as she feels the cold drops, but relaxes when it warms up a bit.");
	output("\n\nThen, you lower your index finger to her backdoor and press insistently. Her asshole can’t resist your lube covered finger and puts up only a token resistance as it slides in. Sera moans softly when she feels your finger start to move in and out, then gasps as you add another finger to the one already in her ass, slowly finger-fucking her tight hole. With your other hand, you tease her clit, eliciting a whimper of pleasure from your pet. You pull your fingers out after a little while. Can’t have your little slut cumming just from a little anal fingering...");
	output("\n\nYou pick up the bottle of lube from the floor and slather it over your [pc.cockHead " + cIdx + "] and press it to her ass, grabbing your other [pc.cock " + cIdx2 + "] and aligning it with her dripping pussy.");
	output("\n\n<i>“Yes, [pc.master]! Fuck me!”</i> Sera croons. You slap her ass hard in reply, Sera groaning in pain and pleasure as your slap leaves a red imprint on her smooth, [sera.skinColor] bum. <i>“You swore. Need I remind you over and over again?”</i> You growl into her ear.");
	output("\n\nSera lets loose a breathy hiss through her teeth. <i>“Sorry, [pc.master]. I just get so... Excited when it’s playtime...”</i> You shake your head and slowly push your [pc.cockNounComplex] into her pussy and ass.");
	output("\n\nThe experience is divine. The walls of both her pussy and ass ripple around your [pc.cocks] with a near vice-like tightness, almost making you lose control. She moans loudly as your cocks sink into her holes, slumping forwards as her legs go nerveless from your double penetration. She gasps when you finally bottom out and stop, letting her adjust to your girth.");
	
	pc.cockChange();
	
	output("\n\nShe pants lustily, her anal and vaginal walls wringing your [pc.cocksNounSimple] for all they’re worth, trying to milk you of your [pc.cum]. You slap her ass as you pull out, making her tighten up wonderfully around your [pc.cockNounComplex]. This time, it’s your turn to moan as your senses are assaulted by the sheer tightness of her holes. You slam roughly back in, a hand grabbing and using her spaded tail as leverage.");
	
	//chars["SERA"].buttChange(pc.cockVolume(cIdx));
	if(chars["SERA"].vaginas[0].hymen) flags["SERA_VIRGINITY_TAKEN"] = 1;
	chars["SERA"].cuntChange(0, pc.cockVolume(cIdx2));
	
	output("\n\nYour other hand goes to her breasts, and fondles one before grabbing and pinching a nipple. She gasps, and pushes back into you, trying to get as much of your [pc.cocks] into her as possible. You don’t hold back, and pull out before ramming back in, your thrusts now slapping out a steady rhythm against her ass, accompanied by the sounds of Sera vocalizing in complete bliss. <i>“Yes, yes! Use me like the cheap slut I am, master! Fill me with your seed! Give it to me, give it all to me!”</i> she screams. You grab her chin and tilt it up to face you, and you notice her eyes are glazed over with ecstasy. They lock onto yours briefly before staring back into space.");
	output("\n\nYou prop yourself up to fuck her properly like the bitch she is, getting as deep as you can with your thrusts.");
	if(chars["SERA"].hasCock()) output(" Her dick twitches as you slam into her prostate, causing her to moan like a whore, her demonic dick drooling pre onto the bedsheets. Noticing that and feeling a little generous, you let go of her nipples and grab her dick instead, pumping your fist up and down her length, using her own pre as lube. Who doesn’t like a reach around, right? She half moans, half screams as she feels your hands on her dick, caressing and stroking every inch of it.");
	if(pc.hasTailCock()) output("\n\nNot a moment too soon, your [pc.tailCock] twitches in response, and slithers over the perfect globes of her ass, up around her back, and taps her on the side of her face. She turns, mouth opening to ask a question, and is instead treated to a mouth full of [pc.tailCock]. She grunts in surprise around the girth filling her mouth, her eyes wide with surprise and a little panic. Once she realizes what it is, she settles down and lets the tailcock use her mouth like it’s personal onahole.");
	output("\n\nAfter a few more minutes of slamming into her tight holes, you feel Sera’s sphincter and vagina tighten and spasm around your [pc.cocksNounSimple]. <i>“Don’t you dare cum until I tell you to do so, you little slut,”</i> you growl into her ear. She grimaces as she tries to control her urges, and you pick up the pace, roughly fucking her until you feel an all too familiar twitch in your " + (pc.balls > 0 ? "[pc.sack]" : "[pc.cock " + cIdx + "]") + ", signaling your imminent explosion. You hold out as long as you can, then let the feeling rush through [pc.eachCock], [pc.cum] blasting out and painting her colon and vagina [pc.cumColor].");
	if(pc.hasTailCock()) output(" Your [pc.tailCock] isn’t far behind, blowing it’s load into her mouth.");
	output(" Her eyes roll back as she’s overwhelmed by your immense virility. <i>“Cum!”</i> you yell, remembering Sera’s predicament at the last moment.");
	output("\n\nHer sphincter and vagina clamp down around your [pc.cocksNounSimple] as she cums to the feeling of your [pc.cum] filling her up to the brim. She cums quite hard, femcum drenching your [pc.legOrLegs],");
	if(chars["SERA"].hasCock()) output(" and her dick blows rope after rope of sticky jizz onto the cabin wall and bedsheets,");
	output(" warm proof of her intense, mind-blowing orgasm.");
	output("\n\nYou pull out of her, and she simply collapses, too drained by the extreme pleasure and rough fucking to do much else. Her holes gape a little, [pc.cumColor] seed dripping out and forming a large puddle on the bed. You " + (!pc.isBimbo() ? "chuckle" : "giggle") + " as you admire your handiwork, your demon slave panting on the bed while your cum drips out of her ass and pussy.");
	if(pc.hasTailCock()) output(" She coughs up some of the seed deposited in her mouth by your tail cock, then swallows it instead.");
	output("\n\nYou unlock the cuffs, toss them back into the case, and pick up the insensate succubus before setting her down on a relatively clean part of the bed and joining her. <i>“Damn... I’m gonna be sore for days, [pc.master],”</i> she groans, then smiles. <i>“We should do this more often...”</i> she whispers into your [pc.ear]. You grin back lazily. She lays her head on your [pc.chest] and smiles up at you. She looks so... normal. No sneering, dominatrix bitch. Just a woman who’s radiating unconditional love from her glowing yellow eyes. You stroke her head softly and snuggle closer for a quick nap.");
	output("\n\nBuying Sera out? Best idea EVER. But of course, all good things must come to an end...");
	output("\n\nYou wake after about an hour to find Sera leering at you like a halloween pumpkin. <i>“Hello [pc.master],”</i> she grins, flashing her sharp teeth. <i>“You gonna go for round two or you gonna get outta here and leave me in peace?”</i>");
	output("\n\n<i>“As much as I’d love to stay and fuck your brains out again, I’ve got things to see and people to do,”</i> you reply, before getting off the bed, putting your [pc.gear] back on, and walking to the door. <i>“Try not to blow up the ship while I’m gone, hmm?”</i>");
	output("\n\nYou hear a loud raspberry in lieu of a reply as you shut the door.");
	
	processTime(30 + rand(11));
	
	knockUpSeraChance();
	chars["SERA"].orgasm();
	pc.orgasm();
	
	IncrementFlag("SERA_BITCHENING_SEXED");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	return;
}

// Tease (M)
// Make both teases available to all PCs because why not. Should not appear at all if dick removed. 12 hour cooldown
public function seraBitcheningSexTeaseM():void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	output("<i>“On all fours,”</i> you say briskly.");
	output("\n\n<i>“My cock-obsessed [pc.master] has come to give me a handjob,”</i> Sera purrs. <i>“Isn’t that nice.”</i> She holds your gaze with her luminescent eyes and rolls onto one side on the bed, letting her breasts shift and her hefty cock flop volubly onto the covers. <i>“Please,”</i> she husks. <i>“I’ve been ever so good recently.”</i>");
	output("\n\nYou drop onto the bed next to her, deliberately pushing your weight into her side, quietly reveling in the tiny sigh she makes as you do. She’s entirely relaxed as you clasp your hand around the girth of her penis; but it comes, of course, with the standard reel of theatrics. She pushes her boob out more than is strictly necessary when you cusp it, draws another low sigh out, letting her [sera.skinColor], warm-smelling flesh swell into your hands as she gazes over her shoulder coyly, sneering wickedly.");
	output("\n\n<i>“Better get on with it,”</i> she whispers. <i>“It feels like an eternity since I got release...”</i>");
	output("\n\nYou squeeze the breast in your hand response, sinking your fingers deep into the softness there, making her exaggeratedly catch her breath. It is impossible to not get aroused by the nearness of her exquisitely crafted body and her teasing,");
	if(pc.hasVagina()) output(" [pc.eachVagina] juicing " + (pc.vaginas.length == 1 ? "itself" : "themselves"));
	if(pc.hasVagina() && pc.hasCock()) output(" and");
	if(pc.hasCock()) output(" [pc.eachCock] stiffening up");
	output(" eagerly to the touch, sight and sound of her. But you do your best to put your own heat out of mind for now, concentrating closely on your prize slut. Your fingers catch and caress the nipple of the breast you have clasped as you begin to shift your grip up and down her girthy dick, quickly pulling it to full-veined mast with slow, steady pumps of the wrist.");
	output("\n\nYou know by now exactly which areas of her dense, blunt meat to concentrate pressure on, where to send the pads of your fingers curling to, to make her twelve inch monster strain urgently downwards, reacting to your touch exactly as a slave’s tool should. When it’s there, thrumming with barely-contained imperative and Sera’s breath is hissing through her teeth, you soften your kneading slightly, keeping her positioned there near the edge whilst your other hand goes roaming. You cusp her plump balls, swollen with single-minded need, give them a gentle, teasing squeeze. Then you slide your hand between her thick thighs and touch her bare pussy, trace her wet lips and then easily find the sturdy nub of her clit, protruding eagerly outwards as it is. You circle and then gently play with it, nudging and sliding over it as you continue to run your fingers tantalizingly down and up her cock.");
	output("\n\nSera grunts, muscles knotted in her neck, claws clutching the duvet helplessly. She knows it’s useless to affect indifference or to exhort you to fuck her - and in the place where she is now, she’d much rather play up to it anyway. She sinuously writhes her form, butt and breasts jiggling, tail flopping restlessly around on the sheets, drawing you further and further into the delight of touching and teasing her over-sexed form.");
	//If fem PC:
	if(pc.isFemale()) output(" Even if she were minded to try the old trick with her tail, you’re wise of it. You catch the writhing appendage and masturbate its ropy flesh at the same time, forcing its engorged penis-head out of the spade-tip, a movement that makes her gasp in enjoyment.");
	output("\n\nYou ratchet up the pace, " + (pc.hasErectNipples() ? "rubbing an erect nipple between your fingers" : "firmly jerking her tail") + " as you whip your tight grip over her engorged frenulum again and again. It’s difficult to tell how much she’s exaggerating her moans and gasps, but there’s nothing artificial about the way she’s her thighs tremble above your hand. She gazes over her shoulder, yellow eyes slit.");
	output("\n\n<i>“Please,”</i> she groans.");
	
	processTime(5 + rand(2));
	
	pc.lust(35);
	
	// [Deny] [Release]
	clearMenu();
	addButton(0, "Deny", seraBitcheningSexTeaseMDeny);
	addButton(1, "Release", seraBitcheningSexTeaseMRelease);
	
	return;
}
// Deny
public function seraBitcheningSexTeaseMDeny():void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	output("You look into her eyes, thinking of the endless backchat, acting up and generally just being the biggest bitch in the galaxy... you continue coiling her hot meat, drinking in her high scent, her neck thrown back, her mouth open, all but tasting the incoming orgasm... and then you stop dead.");
	output("\n\n<i>“No... [pc.master], no!”</i> she whines in bitter frustration, humping your frozen hand" + (!chars["SERA"].hasCock() ? "" : "s") + ".");
	output("\n\n<i>“That’s enough for today I think,”</i> you say breezily, getting up and giving her a brisk slap on the behind. <i>“If you continue to be a really good girl, I’ll let you cum next time.”</i>");
	output("\n\n<i>“For... flip’s sake,”</i> she says, closing her eyes as she censors herself, savoring the control she exists under now. Her burningly erect penis is practically " + (chars["SERA"].skinTone == "bright pink" ? "magenta" : "navy") + " with bottled-up lust.");
	
	processTime(2);
	
	chars["SERA"].lust(35);
	
	IncrementFlag("SERA_BITCHENING_TEASE");
	pc.createStatusEffect("Sera Tease Cooldown", 0, 0, 0, 0, true, "", "", false, 720);
	
	clearMenu();
	addButton(0, "Next", approachServantSera);
	
	return;
}
// Release
public function seraBitcheningSexTeaseMRelease():void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	output("You have to let your succubus slave taste it <i>some</i> times, and you judge this to be a good opportunity. You glory in her being in the palm of your hand, drinking in her high scent, her neck thrown back, her mouth open, all but tasting orgasm.");
	output("\n\n<i>“Say it,”</i> you demand coolly. She says nothing but moans lowly, a pleading sound. You grin,");
	if(pc.hasVagina()) output(" [pc.eachVagina] moistening");
	if(pc.hasVagina() && pc.hasCock()) output(" and");
	if(pc.hasCock()) output(" [pc.eachCock] hardening");
	output(" to the sound. You know you don’t have to say it again.");
	output("\n\n<i>“Please may I cum, [pc.master]!”</i> she cries out, color blooming in her cheeks. Immediately you up your rhythm, briskly cranking her to the high you’ve been keeping just out of her reach. Her eyes roll and her limbs spasm as her cock seizes up in your grasp, forcefully jetting cum onto the bed in an uncontrolled fountain, a small trickle of pussy juice rolling down her thighs in sympathy. It’s a pretty breathtaking orgasm, even seen and felt second-hand – her plush breast heaves into your hand whilst she throws her frame into each ecstatic contraction.");
	output("\n\nYou gently lay her down on her side on a non-soaked part of the bed when she’s finally done.");
	output("\n\n<i>“Thank you, [pc.master],”</i> she says looking at you, happy, rosy grin on her face. <i>“It was getting... that was... you seem to know when... yeah, thanks.”</i> You curl a hand around her ear and jaw-line fondly, and she practically purrs to your touch.");
	
	processTime(2);
	
	chars["SERA"].orgasm();
	
	IncrementFlag("SERA_BITCHENING_TEASE");
	pc.createStatusEffect("Sera Tease Cooldown", 0, 0, 0, 0, true, "", "", false, 720);
	
	clearMenu();
	addButton(0, "Next", approachServantSera);
	
	return;
}

// Tease (F)
public function seraBitcheningSexTeaseF():void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	output("You grin at Sera as you pull out the handcuffs out of the silver briefcase, dangling them teasingly in front of her.");
	output("\n\n<i>“Ooh, it’s reward time, is it?”</i> she purrs. She shifts her hips upwards on the bed, displaying her trim, gleaming pussy to you");
	if(chars["SERA"].hasCock()) output(" and letting her tumescent prick flop volubly onto the duvet");
	output(". <i>“Of course it is. I’ve been ever so good lately...”</i>");
	output("\n\nYou drop onto the bed next to her, deliberately pushing your weight into her side, quietly reveling in the tiny sigh she makes as you do. You’ve drilled this game into her enough times that she’s entirely relaxed as you take her hands and cuff them behind her back; but it comes, of course, with the standard reel of theatrics. She pushes her boob out more than is strictly necessary when you cusp it, draws another low sigh out, letting her [sera.skinColor], warm-smelling flesh swell into your hands as she gazes over her shoulder coyly, sneering wickedly.");
	output("\n\n<i>“Better get on with it,”</i> she whispers. <i>“It feels like an eternity since I got release...”</i>");
	output("\n\nYou squeeze one of her breasts in response, sinking your fingers deep into the softness there, making her exaggeratedly catch her breath. It is impossible to not get aroused by the nearness of her exquisitely crafted body and her teasing --");
	if(pc.hasCock()) output(" [pc.eachCock] hardening against her round behind");
	if(pc.hasCock() && pc.hasVagina()) output(" and");
	if(pc.hasVagina()) output(" [pc.eachVagina] moistening");
	output(" to the sight and sound of her. But you do your best to put your own heat out of mind for now, concentrating closely on your prize slut. You keep one hand clasped around her boob as you slide your other down flawless [sera.skinColor] skin; you brush over the nub of an erect nipple at the same time as you swab the flat plain of her stomach, inexorably sinking downwards, sliding between the warmth of her thighs and touching her bare pussy.");
	output("\n\nIt’s wet and eager as ever, beading lustily onto your fingers, conditioned now to practically sit up and beg for you. You travel upwards and easily find the sturdy nub of her clit, protruding out of her lips as it is. You circle and then gently play with it, nudging and sliding over it as you continue to run your fingers over her silky, gooey pink slit.");
	if(chars["SERA"].hasCock()) output(" As you do so you slide your other hand upwards, grasping her cock and begin to jerk her, tightening, softening and bending your grasp around her thick meat.");
	output(" Sera grunts, flexing her hands in her bonds. She knows it’s useless to struggle or to exhort you to fuck her, and in the place where she is now, she’d much rather play up to it anyway. She pushes her pear of a behind back into you, sinuously writhing her form so it melds with your own");
	if(pc.hasCock()) output(", rubbing " + (pc.cocks.length == 1 ? "your erect cock" : "each of your erect cocks") + " and");
	output(" [pc.nipples] insistently, drawing you further and further into the delight of touching and teasing her over-sexed form.");
	output("\n\nYou know now exactly how to touch her, what parts of her soaked folds to touch to excite and engorge her, make her nerve clusters bloom and blood vessels reach needily to the surface of her skin. You tighten your grip on her breast, rubbing her erect nipple between your fingers as you inundate a similar stubborn nub in her pussy with attention, stroking and circling her clit insistently. It’s difficult to tell how much she’s exaggerating her moans and gasps, but they are full-blooded and there’s nothing artificial about the way she’s pumping her thighs into your hand. The spaded tip of the tail trapped against your side touches your ear.");
	output("\n\n<i>“Right there!”</i> she whines. <i>“Yes, [pc.master]!”</i>");
	
	processTime(5 + rand(2));
	
	pc.lust(35);
	
	// [Deny] [Release]
	clearMenu();
	addButton(0, "Deny", seraBitcheningSexTeaseFDeny);
	addButton(1, "Release", seraBitcheningSexTeaseFRelease);
	
	return;
}
// Deny
public function seraBitcheningSexTeaseFDeny():void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	output("You keep curling your fingers into her with a deceptively steady rhythm, feeling the evidence of her excitement trickling warmly down your fingers, enjoying the heave of her soft flesh against your [pc.chest]");
	if(pc.hasCock()) output(" and [pc.eachCock]");
	output(". You’ve got her in the palm of your hand and you glory in it, drinking in her high scent, her neck is thrown back, her mouth open, all but tasting the incoming orgasm... and then you stop dead.");
	output("\n\n<i>“No... [pc.master], no!”</i> she whines in bitter frustration, humping your frozen hand" + (!chars["SERA"].hasCock() ? "" : "s") + ".");
	output("\n\n<i>“That’s enough for today I think,”</i> you say breezily, getting up. <i>“If you continue to be a really good girl, I’ll let you cum next time.”</i>");
	output("\n\n<i>“For... flip’s sake,”</i> she says, closing her eyes as she censors herself, savoring the control she exists under now. Her pussy is puffy and inflamed, dripping with pure frustration, as you undo her restraints.");
	
	processTime(2);
	
	chars["SERA"].lust(35);
	
	IncrementFlag("SERA_BITCHENING_TEASE");
	pc.createStatusEffect("Sera Tease Cooldown", 0, 0, 0, 0, true, "", "", false, 720);
	
	clearMenu();
	addButton(0, "Next", approachServantSera);
	
	return;
}
// Release
public function seraBitcheningSexTeaseFRelease():void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	output("You have to let your succubus slave taste it <i>some</i> times, and you judge this to be a good opportunity. You glory in her being in the palm of your hand, drinking in her high scent, her neck thrown back, her mouth open, all but tasting orgasm.");
	output("\n\n<i>“Say it,”</i> you demand coolly. She says nothing but moans lowly, a pleading sound. You grin,");
	if(pc.hasVagina()) output(" [pc.eachVagina] moistening");
	if(pc.hasVagina() && pc.hasCock()) output(" and");
	if(pc.hasCock()) output(" [pc.eachCock] hardening");
	output(" to the sound. You know you don’t have to say it again.");
	output("\n\n<i>“Please may I cum, [pc.master]!”</i> she cries out, color blooming in her cheeks. Immediately you up your rhythm, briskly frigging her to the high you’ve been keeping just out of her reach. Her eyes roll and her limbs spasm as her pussy clenches up and soaks your fingers");
	if(chars["SERA"].hasCock()) output(", her cock seizing up in your grasp, forcefully fountaining cum upwards, spattering onto the bed and her thighs");
	output(". It’s a pretty breathtaking orgasm, even seen and felt second-hand – her plush butt presses " + (pc.hasCock() ? "into [pc.eachCock]" : "onto your body") + " whilst she throws her frame into each ecstatic contraction, her cuffed hands seeming to force more energy into every other part of her body.");
	output("\n\nYou gently lay her down on her side on a non-soaked part of the bed when she’s finally done.");
	output("\n\n<i>“Good girl,”</i> you say softly. She looks up at you, panting lightly, sweat dappling her naked skin. She looks completely different in this moment – an unsure, muddled look in her eyes, her features naked and soft without the scorn which usually guards and tightens them.");
	output("\n\n<i>“Thank you, [pc.master],”</i> she says, suddenly looking up at you and smiling. <i>“It was getting... that was... you seem to know when... yeah, thanks.”</i> You curl a hand around her ear and jaw-line fondly, and she practically purrs to your touch.");
	
	processTime(2);
	
	chars["SERA"].orgasm();
	
	IncrementFlag("SERA_BITCHENING_TEASE");
	pc.createStatusEffect("Sera Tease Cooldown", 0, 0, 0, 0, true, "", "", false, 720);
	
	clearMenu();
	addButton(0, "Next", approachServantSera);
	
	return;
}


// Punishments
// Ghosted out if a Seranigan hasn’t played. Shuts once PC has used one.
public function seraBitcheningPunishMenu():Boolean
{
	clearOutput();
	showSera();
	author("Nonesuch");
	
	output("Sera has been a bad girl. How do you punish her?");
	
	clearMenu();
	
	addButton(0, "Spank", seraBitcheningPunishSpank);
	
	if(pc.hasCock()) addButton(1, "Cum Ration", seraBitcheningPunishCumRation);
	else addDisabledButton(1, "Cum Ration", "Cum Ration", "You need a penis to try this!");
	
	if(getPlanetName().toLowerCase() == "tavros station" && (pc.hasItemByClass(LeatherLeash) || pc.hasItemInStorageByClass(LeatherLeash))) addButton(2, "Walkies", seraBitcheningPunishWalkies, true);
	else if(pc.hasItemByClass(LeatherLeash) || pc.hasItemInStorageByClass(LeatherLeash)) addDisabledButton(2, "Walkies", "Walkies", "You need to be on Tavros to do this!");
	else if(getPlanetName().toLowerCase() == "tavros station") addDisabledButton(2, "Walkies", "Walkies", "You need to have a leash to do this!");
	else addDisabledButton(2, "Walkies", "Walkies", "You need to have a leash and be on Tavros to do this!");
	
	addButton(14, "Back", approachServantSera);
	
	return true;
}
public function seraBitcheningPunishEnd():void
{
	chars["SERA"].removeStatusEffect("Sera Masturbated");
	pc.removeStatusEffect("Seranigans Punishment");
	approachServantSera();
	
	return;
}

// Spank
public function seraBitcheningPunishSpank():void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	
	output("<i>“Since you’ve been a bad slut,”</i> you say in a level tone, perching yourself on her bed, <i>“you can lie yourself right here.”</i>");
	output("\n\nSera’s shit-eating smirk widens.");
	output("\n\n<i>“Going to lay down the law on your poor, defenceless slave, are we?”</i> She strokes her side as she holds your eye, insolently doing nothing for long seconds, before eventually crawling over and sliding her belly onto your thighs. It’s reciprocal, in its own, darkly delicious way; she is deliberately trying to wind you up, increase the size of her punishment, making it really worthwhile for both you and her. A mixture of affection and vexation glows in your breast; when you raise your hand, it’s with a determination to transfer that glow to Sera’s behind.");
	output("\n\nSMACK.");
	output("\n\n<i>“Why are you being punished?”</i>");
	output("\n\n<i>“Because I’m a bad girl.”</i> Slap.");
	output("\n\n<i>“2.”</i> Smack.");
	output("\n\n<i>“Why are you a bad girl?”</i>");
	output("\n\n<i>“Because of all the naughty stuff I did.”</i> Spank.");
	output("\n\n<i>“What else, you nasty slut?”</i>");
	output("\n\n<i>“All the... bad thoughts I’ve been having...”</i> Smack.");
	output("\n\nShe quickly drifts off into that pliant sub-state of hers, answering your questions in a dozy, peaceful voice she uses nowhere else. Having her butt whupped like this seems to be cathartic for her now; she answers any question you pose her truthfully, without a hint of mischief or slyness. Aside from the physical satisfaction to be had from spanking your unruly bitch - of laying your palm into her round tush and making the flesh there ripple, of sadistically waiting until she relaxes slightly before hitting her again - you feel an overarching gratification from having this amount of control over her, of laying bare every secret and desire she has.");
	output("\n\n<i>“You enjoy being a slave, don’t you?”</i> you husk eventually, raising your hand one last time. <i>“You enjoy licking the boots of the [pc.guy] who bought you out and tans your ass.”</i>");
	output("\n\n<i>“Yes,”</i> says Sera calmly. <i>“I do.”</i> SMACK. You soothe the two dark handprints you’ve made stand out on her peachy bottom with your hand before speaking next.");
	output("\n\n<i>“Are you going to be obedient now?”</i> Sera slides herself off your lap and lies on her side, too sore to sit down immediately.");
	output("\n\n<i>“Of course, [pc.master],”</i> she says eventually in a sugary tone. <i>“Spanking me silly has really shown me the errors of my ways.”</i> You stroke her under the chin.");
	output("\n\n<i>“Good girl.”</i> She shudders with pleasure.");
	
	processTime(21);
	
	pc.lust(35);
	chars["SERA"].lust(35);
	
	IncrementFlag("SERA_BITCHENING_PUNISH_SPANK");
	
	clearMenu();
	addButton(14, "Back", seraBitcheningPunishEnd);
	
	return;
}

// Cum Rations
public function seraBitcheningPunishCumRation():void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	
	var cIdx:int = rand(pc.cocks.length);
	
	output("<i>“Seems you’ve been an awful bitch again,”</i> you sigh,");
	if(!pc.isCrotchExposed()) output(" unfastening your [pc.lowerGarments] and");
	output(" picking up the bottle of cum nutrient oil to take an ostentatious swig. Heat immediately powers its way down to your groin, [pc.eachCock] bulging up readily. <i>“So the only sustenance you’re going to get today is what you get out of pleasing your [pc.master].”</i>");
	output("\n\n<i>“Ooh dear,”</i> croons Sera, lounging on her bunk and eyeing you up, trailing her claws along the rise of her thigh. <i>“And I am sooooo hungry from all the evil I’ve been up to.”</i> Her eyes narrow and she traces her cerulean lips with her tongue, making them shine. <i>“Guess I’m going to tap " + (pc.balls <= 1 ? "that nasty cock" : "those juicy balls") + " of yours for every last drop.”</i>");
	output("\n\nYou exhale lowly, keeping your gaze fixed on the [sera.skinColor] shrew as she works the base of your cock, coaxing pleasure and heat further and further along it. She leers up at you as she does it, licking her lips in ludicrous, pornographic fashion. Maybe you’re imagining it, but is there an element of real, aroused need heightening her theatrics? Such thoughts are momentarily pushed out of your head when she spreads her silky, wet lips over its bulging head, ever so slowly and yet with powerful, controlled suction. She lets go with a raspberry sound, grins up at you and then does it again, deeper this time. It’s throbbing, sweat-inducing perfection and you feel an almost unstoppable urge to orgasm there and then... but no. Letting it all go in adolescent giddiness and not savoring this kind of suck would be an outrage. You slide your hand through powder blue hair as more and more of your length is swallowed into the hot knead of her mouth with each returning bob of her head.");
	output("\n\nSoft roiling pleasure inundates");
	if(pc.cLength(cIdx) < 11.5) output(" your [pc.cock " + cIdx + "]");
	else output(" the top half of your massive cock");
	output(", shifting and caressing it magically until it feels like it’s made out of sensitive oak. Keeping hold of your lust with some difficulty, you gaze down at her. The minx who would always stare back challengingly is gone; she’s got her eyes closed and is utterly lost in moving her head back and forth and around your [pc.cock " + cIdx + "], one hand lovingly stroking the base");
	if(pc.hasKnot(cIdx)) output(" and knot");
	if(pc.balls > 0) output(" whilst the other gently caresses your [pc.balls]");
	output(", sensuously bathing your sex in pleasure, her opened, luscious lips undulating over it.");
	if(chars["SERA"].hasCock()) output(" Her own cock, you notice, is erect itself, keening upwards for the oral pleasure happening above that it will never experience.");
	
	pc.maxOutLust();
	
	output("\n\nShe loves the taste of your dick, and just watching her is enjoyable enough, but that being the case makes this hardly a punishment. Her status has to be reaffirmed. After a few more moments of simmering in that wonderful, wet pleasure on your [pc.cockHead " + cIdx + "], you tighten your grip on her hair and withdraw from her mouth. She blinks out of her reverie, slightly surprised.");
	output("\n\nYou brush your cock against her lips slowly, tantalizing her with the heavy smell of your pre, and then pull away as she rears her neck, attempting to engulf it in your mouth. Her nipples are as erect as tiny spikes.");
	output("\n\n<i>“Beg for it,”</i> you order. <i>“Beg for me to nut down your throat, like the well-broken-in cumslut you are. Or you get nothing.”</i> Nowadays, it’s only the tiniest hesitation on Sera’s part that allows you to sigh heavily and turn");
	if(!pc.isCrotchExposed() && pc.hasLowerGarment()) output(", making as if to pull your [pc.lowerUndergarment] back up");
	output(".");
	output("\n\n<i>“I guess you don’t want feeding that badly, then. Guess--”</i>");
	output("\n\n<i>“No!”</i> The satanically beautiful, curvy harridan inhales, and then looks up at you imploringly, hands on the undersides of her ample breasts, presenting them as she gives you eerily reptilian doe eyes. <i>“Please [pc.master],”</i> she breathes. <i>“May I suck your dick?”</i>");
	output("\n\n<i>“You may,”</i> you murmur proudly, swinging your [pc.cock " + cIdx + "] back to her and closing your eyes as wet, kneading pressure immediately slides back down your shaft. <i>“But remember - you don’t get your big, hot load today unless I can hear how much you enjoy being [pc.master]’s obedient semen demon, ok?”</i>");
	output("\n\nIt’s wonderfully wet, sloppy yet tight; whenever it gets almost too much you pull out of her mouth, and without direction she lavishes your hard, veined meat");
	if(pc.balls > 1) output(" and bulging balls");
	output(" with her long tongue instead, curling it all around every inch, using all of her new expertise to fully prime her meal.");
	output("\n\nEach time she takes a great slurping lick of your underside");
	if(pc.balls > 1) output(" or testicles");
	output(" she gives a hungry moan, heaving her jiggling boobs to give muffled voice to how much she enjoys doing it. It’s absurdly theatrical but that doesn’t stop your tremendous enjoyment of it, how you’ve coaxed such willing submission out of this once hard, self-centered woman.");
	output("\n\nYou grasp her hard, rough horns, steadily bracing her a distance away from you so that all she can reach is your bulging cock head, softly instructing her to cup her breasts again. You hold her like that for a time, locking eyes with her, both of you enjoying her lavishing your slit and bell-end with the tip of her rough, hot tongue.");
	output("\n\n<i>“Gonna give your bitch what she needs?”</i> she husks, toothily leering up at you, fingers circling her nipples. <i>“Got the guts to take charge, big [pc.boy]?”</i> She gives your bulging head a long, luscious lick, sending pleasure tingling all the way up your spine. <i>“Seems like you talk a lot about being on top, but I’m the one doing all the w-”</i> You push your [pc.hips] forward at the same time as you pull her head forward, forcefully introducing " + (pc.cLength(cIdx) >= 11.5 ? "most" : "all") + " of your [pc.cock " + cIdx + "] to " + (pc.cLength(cIdx) < 11.5 ? "the back of her throat" : "her gullet") + ". She gags once and then gets a masterful handle on the reflex, her throat clenching wetly around your " + (pc.cLength(cIdx) < 11.5 ? "sensitive bell-end" : "length") + ", practically begging you to use it. Which, once you’ve pulled out once and sunk back into it again to ascertain the demoness can indeed take it, is exactly what you do.");
	output("\n\nObscene, sloppy, slurping noises fill the room, your");
	if(pc.balls <= 0) output(" [pc.hips]");
	else output(" [pc.balls]");
	output(" slapping against her pretty chin, down which a steady stream of saliva and pre-cum runs");
	if(pc.cLength(cIdx) >= 11.5) output(", her neck bulging up with each sweet pump");
	output(". As you thrust and clench up your [pc.legOrLegs] to pile-drive your musky, saliva-lubed dick into that deep, hidden slut tunnel you consider how much abuse, vitriol and sneering has poured from it over the years. The “gack!” and “schlop”s you’re drawing from it now are infinitely more pleasant, at least to your ears. You draw your [pc.cock " + cIdx + "] outwards slowly so that your [pc.cockHead " + cIdx + "] touches the inside of her lips, allowing her to recover momentarily; she slides her tongue along the sternly bulging underside and “mmm”s deeply, impatient with horny, whorish hunger, trying to drive you on. Wonderful.");
	output("\n\nYou hold her up and penetrate her tight silky " + (pc.cLength(cIdx) < 11.5 ? "mouth" : "throat") + " right up to the quick with half a dozen more intense, deliberate thrusts, with each one stating unequivocally what its primary function is: polishing your cock from head to base to a worshipful shine. When the need tightening [pc.eachCock] is finally far too much you pull out. With immense effort you keep your hands steady, grab the bowl and with a single slide of your hand and throaty gasp, finally unload. What feels like gallons of pressurized [pc.cum] surges up your duct and fountains noisily into the bowl, a clenching, dizzying orgasm which goes on and on.");
	if(pc.cumQ() >= 5000)
	{
		output(" You’ve got plenty left over once you’ve filled the vessel to the brim, and you stand over Sera. The succubus, panting back her breath from your brutal face fuck, gladly accepts this extra gift;");
		if(chars["SERA"].hasCock()) output(" own cock needily erect");
		output(", she cups her big tits and lets you ice them with your seed, quivering and laughing slightly as you go on to give her cruel, pretty features and brilliant hair the heavy pasting of musky [pc.cum] they so richly deserve.");
	}
	output("\n\nYou take huge, shuddering breaths once you’ve spurted your last, [pc.groin] aching mightily, exhausted, shaken and profoundly satiated. The sight you’re met with when you finally wipe the sweat from your eyes is Sera is sat in front of her bowl,");
	if(pc.cumQ() < 5000) output(" giving you a silent, coy crook of the eyebrow");
	else output(" giving you a perfectly coy look despite the heavy amounts of cum drooling down her face");
	output(".");
	output("\n\n<i>“Is Sera going to be a good cumslut from now on?”</i> you ask. <i>“Good ones get to lick the spoon.”</i>");
	output("\n\n<i>“Yes, [pc.master],”</i> she trills, hands on knees, pert boobs out, the picture of wide-eyed dishonesty. You present your leaking cock and murmur your enjoyment as a hot, wet tongue licks it quite clean, flicking over your slit to get every last drop. By the time you’ve");
	if(!pc.isCrotchExposed() && pc.hasLowerGarment()) output(" re-adjusted your [pc.lowerGarment]");
	else output(" put your [pc.gear] back on");
	output(" Sera is knelt over her bowl of [pc.cum], tail in the air, the sound of wet lapping and horny “mmm”s filling the room. You sit and watch the show; giving her upturned ass a loving squeeze");
	if(chars["SERA"].balls >= 2) output(" and her balls a teasing tweak");
	output(" when she’s finally finished.");
	
	processTime(36);
	
	chars["SERA"].lust(35);
	pc.orgasm();
	
	IncrementFlag("SERA_BITCHENING_PUNISH_RATION");
	
	clearMenu();
	addButton(14, "Back", seraBitcheningPunishEnd);
	
	return;
}


// Leash
// Add to Inessa’s menu. 100 credits. Accessory slot
// Tooltip: Of course, your run-of-the-mill leashes these days are wireless. This 20 foot long tether of strong, flexible black leather tipped with an adaptable steel clasp is for traditionalists - or for owners who want to make very clear who the party at the other end belongs to. The leather retracts back into a satisfyingly hefty steel handle and can be frozen at any length at the press of a button, allowing for close control.

// Walkies
// Requires Leash in inventory, doesn’t need to be equipped since that’s a faff.
// If PC has other usable accessories in inventory (possibly link to ship storage also?)
private var seraWalkItemsSel:Object = {
	SchoolgirlOutfit:		0x1,
	SchoolgirlCostume:		0x2,
	anySchoolgirl:			0xf,

	GravCuffs:				0x10,
	anyCuffs:				0xf0,
	
	Whip:					0x100,
	BioWhip:				0x200,
	anyWhip:				0xf00,

	select:0
};
public function seraBitcheningPunishWalkies(initialize:Boolean = false):void
{
	if(initialize) seraWalkItemsSel.select = 0;
	
	clearOutput();
	showSera();
	author("Nonesuch");
	
	output("Yes, a good, healthy bout of exercise and public humiliation will do your wayward pet the world of good. You have your leash with you - the question is, is there anything else you want to embellish this little lesson with?");
	
	seraBitcheningPunishWalkAcc();
	
	return;
}
public function seraBitcheningPunishWalkAcc():void
{
	output("\n\n<u><b>Accessories</b></u>");
	output("\n* Leather Leash");
	
	if (seraWalkItemsSel.select & seraWalkItemsSel.SchoolgirlOutfit) output("\n* " + (StringUtil.toDisplayCase(seraWalkItemsSel.itemSchoolgirlOutfit.longName)));
	if (seraWalkItemsSel.select & seraWalkItemsSel.SchoolgirlCostume) output("\n* " + (StringUtil.toDisplayCase(seraWalkItemsSel.itemSchoolgirlCostume.longName)));
	if (seraWalkItemsSel.select & seraWalkItemsSel.GravCuffs) output("\n* " + (StringUtil.toDisplayCase(seraWalkItemsSel.itemGravCuffs.longName)));
	if (seraWalkItemsSel.select & seraWalkItemsSel.Whip) output("\n* " + (StringUtil.toDisplayCase(seraWalkItemsSel.itemWhip.longName)));
	if (seraWalkItemsSel.select & seraWalkItemsSel.BioWhip) output("\n* " + (StringUtil.toDisplayCase(seraWalkItemsSel.itemBioWhip.longName)));
	
	output("\n\n");
	
	// Multiple options can be chosen. Either whip, and either s.girl outfit can be used
	// [S.Girl O.] [Cuffs] [Whip] [Lets Go]
	clearMenu();
	if(pc.hasItemByClass(SchoolgirlOutfit) || pc.hasItemInStorageByClass(SchoolgirlOutfit))
 	{
		if(!seraWalkItemsSel.itemSchoolgirlOutfit) seraWalkItemsSel.itemSchoolgirlOutfit = new SchoolgirlOutfit();
		if(seraWalkItemsSel.select & seraWalkItemsSel.SchoolgirlOutfit) addDisabledButton(0, seraWalkItemsSel.itemSchoolgirlOutfit.shortName, StringUtil.toDisplayCase(seraWalkItemsSel.itemSchoolgirlOutfit.longName), "This item is already being used.");
		else if(seraWalkItemsSel.select & seraWalkItemsSel.anySchoolgirl) addDisabledButton(0, seraWalkItemsSel.itemSchoolgirlOutfit.shortName, StringUtil.toDisplayCase(seraWalkItemsSel.itemSchoolgirlOutfit.longName), "There is already a similar item being used.");
		else addButton(0, seraWalkItemsSel.itemSchoolgirlOutfit.shortName, seraBitcheningPunishWalkAccSelect, seraWalkItemsSel.SchoolgirlOutfit, StringUtil.toDisplayCase(seraWalkItemsSel.itemSchoolgirlOutfit.longName), "Use this item.");
 	}
	if(pc.hasItemByClass(SchoolgirlCostume) || pc.hasItemInStorageByClass(SchoolgirlCostume))
	{
		if(!seraWalkItemsSel.itemSchoolgirlCostume) seraWalkItemsSel.itemSchoolgirlCostume = new SchoolgirlCostume();
		if(seraWalkItemsSel.select & seraWalkItemsSel.SchoolgirlCostume) addDisabledButton(5, seraWalkItemsSel.itemSchoolgirlCostume.shortName, StringUtil.toDisplayCase(seraWalkItemsSel.itemSchoolgirlCostume.longName), "This item is already being used.");
		else if(seraWalkItemsSel.select & seraWalkItemsSel.anySchoolgirl) addDisabledButton(5, seraWalkItemsSel.itemSchoolgirlCostume.shortName, StringUtil.toDisplayCase(seraWalkItemsSel.itemSchoolgirlCostume.longName), "There is already a similar item being used.");
		else addButton(5, seraWalkItemsSel.itemSchoolgirlCostume.shortName, seraBitcheningPunishWalkAccSelect, seraWalkItemsSel.SchoolgirlCostume, StringUtil.toDisplayCase(seraWalkItemsSel.itemSchoolgirlCostume.longName), "Use this item.");
	}
	
	if(pc.hasItemByClass(GravCuffs) || pc.hasItemInStorageByClass(GravCuffs))
	{
		if(!seraWalkItemsSel.itemGravCuffs) seraWalkItemsSel.itemGravCuffs = new GravCuffs();
		if(seraWalkItemsSel.select & seraWalkItemsSel.GravCuffs) addDisabledButton(1, seraWalkItemsSel.itemGravCuffs.shortName, StringUtil.toDisplayCase(seraWalkItemsSel.itemGravCuffs.longName), "This item is already being used.");
		else addButton(1, seraWalkItemsSel.itemGravCuffs.shortName, seraBitcheningPunishWalkAccSelect, seraWalkItemsSel.GravCuffs, StringUtil.toDisplayCase(seraWalkItemsSel.itemGravCuffs.longName), "Use this item.");
	}
	
	if(pc.hasItemByClass(Whip) || pc.hasItemInStorageByClass(Whip))
	{
		if(!seraWalkItemsSel.itemWhip) seraWalkItemsSel.itemWhip = new Whip();
		if(seraWalkItemsSel.select & seraWalkItemsSel.Whip) addDisabledButton(2, seraWalkItemsSel.itemWhip.shortName, StringUtil.toDisplayCase(seraWalkItemsSel.itemWhip.longName), "This item is already being used.");
		else if(seraWalkItemsSel.select & seraWalkItemsSel.anyWhip) addDisabledButton(2, seraWalkItemsSel.itemWhip.shortName, StringUtil.toDisplayCase(seraWalkItemsSel.itemWhip.longName), "There is already a similar item being used.");
		else addButton(2, seraWalkItemsSel.itemWhip.shortName, seraBitcheningPunishWalkAccSelect, seraWalkItemsSel.Whip, StringUtil.toDisplayCase(seraWalkItemsSel.itemWhip.longName), "Use this item.");
	}
	if(pc.hasItemByClass(BioWhip) || pc.hasItemInStorageByClass(BioWhip))
	{
		if(!seraWalkItemsSel.itemBioWhip) seraWalkItemsSel.itemBioWhip = new BioWhip();
		if(seraWalkItemsSel.select & seraWalkItemsSel.BioWhip) addDisabledButton(7, seraWalkItemsSel.itemBioWhip.shortName, StringUtil.toDisplayCase(seraWalkItemsSel.itemBioWhip.longName), "This item is already being used.");
		else if(seraWalkItemsSel.select & seraWalkItemsSel.anyWhip) addDisabledButton(7, seraWalkItemsSel.itemBioWhip.shortName, StringUtil.toDisplayCase(seraWalkItemsSel.itemBioWhip.longName), "There is already a similar item being used.");
		else addButton(7, seraWalkItemsSel.itemBioWhip.shortName, seraBitcheningPunishWalkAccSelect, seraWalkItemsSel.BioWhip, StringUtil.toDisplayCase(seraWalkItemsSel.itemBioWhip.longName), "Use this item.");
	}
	
	if(seraWalkItemsSel.select) addButton(13, "Reset", seraBitcheningPunishWalkies, true, "Reset Accessories", "Try taking different items.");
	else addDisabledButton(13, "Reset");
	addButton(14, "Let’s Go", seraBitcheningPunishWalkiesGo, undefined, "Let’s Go", "Ready to go!");
	
	return;
}
public function seraBitcheningPunishWalkAccSelect(itemFlag:int):void
{
	seraWalkItemsSel.select |= itemFlag;
	
	seraBitcheningPunishWalkies();
	
	return;
}

public function seraBitcheningPunishWalkiesGo():void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	
	var hasSchoolgirl:Boolean = (seraWalkItemsSel.select & seraWalkItemsSel.anySchoolgirl) != 0;
	var hasCuffs:Boolean = (seraWalkItemsSel.select & seraWalkItemsSel.anyCuffs) != 0;
	var hasWhip:Boolean = (seraWalkItemsSel.select & seraWalkItemsSel.anyWhip) != 0;
	
	// S.Girl O.
	if(hasSchoolgirl)
	{
		output("You are gratified by the deep red which blooms right across Sera’s cheeks when she clocks the outfit you’re handing her.");
		output("\n\n<i>“Oh noooooo,”</i> she groans in genuine, despairing embarrassment. <i>“Anything else? Nurse? Bunny? Listen, I’ll stop messing with your stuff from now on, I really will, just don’t make me-”</i>");
		output("\n\n<i>“Put. It. On.”</i> You sit down and watch, allowing her to see the look of gloating enjoyment on your face as slowly, she puts on the tight white shirt - just about managing to button it up around her bust - then pulls on the white, frilly knickers and finally reaches around the too-short tartan skirt. Plush [sera.skinColor] flesh is bursting out of it in a number of places, but frankly that makes it all the more enjoyable. The blush remains unabated.");
		output("\n\n<i>“So that’s it then, yeah?”</i> she says quickly");
		if(hasCuffs) output(", as you press into her thinly cottoned side and firmly cuff her hands behind her back");
		output(". <i>“We’ll fuck now and then I can take it off? Because let me tell you, being made to wear this is definitely, definitely -”</i> She trails off, biting her lip as she gazes wide-eyed at the sturdy metal handle in your hand.");
	}
	// Cuffs only
	else if(hasCuffs)
	{
		output("<i>“Put your hands behind your back.”</i>");
		output("\n\nSera pouts, but does as you ask, unresisting as you firmly cuff her. It’s clear from her demeanor that she expects some teasing from you, maybe a spanking. No biggie, right? The smugness drains right off her face, replaced by a blank, wide-eyed expression when she clocks the sturdy metal handle in your hand.");
	}
	// No accessories
	else
	{
		output("The smugness drains right off Sera’s face, replaced by a blank, wide-eyed expression when she clocks the sturdy metal handle in your hand.");
	}
	output("\n\n<i>“We’re going for a walk.”</i> You breathe in her spicy, smoky scent");
	if(flags["SERA_BITCHENING_PUNISH_WALKIES"] != undefined) output(" again");
	output(" as you firmly clip the leash’s end to the hasp at the back of her collar. <i>“What you tearing around this ship is telling me is that you need fresh air, quality time with [pc.master] - and a good, long reminder of who you are.”</i>");
	output("\n\nYou stand back and allow the leather line to play out, four feet, five feet... and then carefully depress the trigger. Sera jerks slightly, blue hair bouncing as the tether goes taut. You grin, shamelessly enjoying how this makes");
	if(pc.balls <= 0) output(" warmth sink down to your groin");
	else output(" makes your [pc.balls] swell");
	output(". The succubus looks up at you piteously and opens her mouth. You cut her off with an unforgiving gesture.");
	output("\n\n<i>“No speaking without being spoken to from now on.”</i> You rise and indicate the open door with a nod. Slowly, tail drooping");
	if(hasCuffs) output(" and boobs bouncing, exaggerated by her bound hands");
	output(", Sera rises and click-clacks over to it. You follow, slowly allowing the leash to play out. <i>“If you’re asked a question, either by me or anyone else, you will answer it, politely and truthfully. Do that and don’t dawdle, otherwise...”</i>");
	if(hasWhip) output(" You allow the bulbous whip-end to dangle downwards, before giving her a small, playful, warning swat on the shoulder with it. She jumps and squeaks. Void-damn, the judder of impact... the sound she makes and the small welt it leaves... every part of that action is so sadistically satisfying.");
	else output(" Yellow eyes cast down to the silver remote in your hand, finger toying with the main button.");
	output("\n\n<i>“Yes... " + pc.mf("sir", "ma’am") + ",”</i> she says in a small voice.");
	if(pc.hasGenitals())
	{
		if(pc.hasCock() && pc.hasVagina()) output(" [pc.EachCock] hardens and [pc.eachVagina] moistens");
		else if(pc.hasCock()) output(" [pc.EachCock] hardens");
		else output(" [pc.EachVagina] moistens");
		output(" to that tone.");
	}
	
	processTime(5);
	
	// [pb]
	clearMenu();
	addButton(0, "Next", seraBitcheningPunishWalkiesGoPtII);
	
	return;
}
public function seraBitcheningPunishWalkiesGoPtII():void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	
	moveTo("LIFT: RESIDENTIAL DECK");
	showLocationName();
	
	var hasSchoolgirl:Boolean = (seraWalkItemsSel.select & seraWalkItemsSel.anySchoolgirl) != 0;
	var hasCuffs:Boolean = (seraWalkItemsSel.select & seraWalkItemsSel.anyCuffs) != 0;
	
	output("You maintain a brisk but casual pace as you exit your ship into the empty hangar and head towards the elevator, lead trailing behind you, giving her plenty of time to get used to how fast she has to click-clack on her high heels behind you to stop her collar tightening. For your part, you keep a soft grip on the lock - it wouldn’t do at all to be dragging her around like a trawler net of fish - but whenever you feel the tether is playing out a bit too long, you give it a little squeeze. Having a feel of that delicious weight at the other end, at the same time as chivvying her along.");
	output("\n\nYou don’t take her to the Merchant Deck, where she can see what’s happened to the Dark Chrysalis. You aren’t <i>that</i> cruel. The two of you are hardly going to stand out much near the red light district anyway. Instead, you get the lift to take you to the floor above. Sera’s expression is blank, her slit eyes turned to the ceiling, but in the cramped space of the lift you can hear her breath come thick and fast; you don’t think she realizes how hard she’s biting her own lip. You give her a comforting squeeze on the boob as the door slides open, and you step confidently out into the well-lit hubbub of the Res Deck.");
	output("\n\nSome passersby stare; some cough shocked laughs into their hands; many ignore you, inured to such sights in this bustling mooring place of many different alien cultures. A");
	if(hasSchoolgirl) output(" school-girl-outfitted");
	else output(" bare-breasted");
	if(hasCuffs) output(", cuffed");
	output(" bitch and their [pc.raceShort] [pc.master] isn’t the most outrageous thing to ever stroll around these tasteful plazas, although you get the distinct impression that it’s deemed much more suitable for the seedy, seething deck below. Whatever. Let the disapproval blaze. You stop to have a look at the holo-board, silently pointing at the ground next to you; gratifyingly Sera kneels next to you after only a slight pause.");
	output("\n\n<i>“Back straight. Good girl.”</i> You ruffle her hair fondly. She whimpers slightly in response, eyes fixed steadfastly on the middle distance, definitely not on any of the onlookers drinking in her round [sera.skinColor] ass. With a jerk of the leash, you carry on, intent on taking in as much of the deck as possible.");
	
	processTime(12);
	
	// If more than two met, limit to two chosen at random
	var witness:Array = [];
	var passerA:Function = null;
	var passerB:Function = null;
	
	if(rivalIsActive()) witness.push(seraBitcheningPunishWalkiesWitnessRival);
	if(flags["AINA_DAY_MET"] != undefined) witness.push(seraBitcheningPunishWalkiesWitnessAina);
	if(flags["SEEN_FYN"] == true) witness.push(seraBitcheningPunishWalkiesWitnessFyn);
	if(flags["MET_SEMITH"] == true) witness.push(seraBitcheningPunishWalkiesWitnessSemith);
	if(flags["SERA_IN_JARDI_THREESOME"] > 0) witness.push(seraBitcheningPunishWalkiesWitnessJardi);
	
	if(witness.length > 0)
	{
		passerA = witness[rand(witness.length)];
		if(eventQueue.indexOf(passerA) == -1) eventQueue.push(passerA);
	}
	if(witness.length > 1)
	{
		passerB = passerA;
		while(passerB == passerA)
		{
			passerB = witness[rand(witness.length)];
		}
		if((witness.length >= 4 || rand(2) == 0) && eventQueue.indexOf(passerB) == -1) eventQueue.push(passerB);
	}
	
	if(eventQueue.indexOf(seraBitcheningPunishWalkiesNext) == -1) eventQueue.push(seraBitcheningPunishWalkiesNext);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	return;
}
// Aina met
public function seraBitcheningPunishWalkiesWitnessAina():void
{
	moveTo("RESIDENTIAL DECK 8");
	showLocationName();
	
	clearOutput();
	showSera();
	author("Nonesuch");
	
	var hasWhip:Boolean = (seraWalkItemsSel.select & seraWalkItemsSel.anyWhip) != 0;
	
	output("<i>“[pc.name]! Hi!”</i> You hear Aina long before you see her; the steady clop-clop-clop falters and then speeds up when she sees you coming the other way. The centauress’s initial friendly grin turns into a puzzled frown, further embellished by a blush, when she fully takes the two of you in. <i>“What are you - ? Who is - ?”</i>");
	output("\n\n<i>“Hey Aina,”</i> you say brightly. <i>“Lovely today, isn’t it? I’m just taking my bitch out for a stroll. Say hello, Sera.”</i>");
	output("\n\n<i>“‘lo,”</i> a voice mumbles behind you.");
	if(hasWhip) output(" You let your whip unravel and crack it meaningfully against the marble floor, making her jerk.");
	else output(" You give her a nibble of voltage from the remote, making her jerk.");
	output("\n\n<i>“Hello, miss!”</i> Sera squeaks, more clearly.");
	output("\n\n<i>“And how are you?”</i>");
	output("\n\n<i>“I- uh... I-I’ve gotta go,”</i> mumbles Aina, face as red as a beetroot. With no idea where to put her eyes or her hooves, she jerks around and trots off in the exact opposite direction she had been heading.");
	
	processTime(4);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	return;
}
// Fyn met
public function seraBitcheningPunishWalkiesWitnessFyn():void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	
	moveTo("RESIDENTIAL DECK 6");
	showLocationName();
	
	var hasSchoolgirl:Boolean = (seraWalkItemsSel.select & seraWalkItemsSel.anySchoolgirl) != 0;
	
	output("<i>“What’s all this then?”</i>");
	output("\n\nOne moment you’re on your own in a quiet spot of the Northern Plaza; the next Fyn the vildarii is standing by your side, taking in the two of you with interest.");
	output("\n\n<i>“I had no idea you were into that kind of activity, [pc.name],”</i> he says, rich voice rising and falling to precisely convey the right amounts of interest, politeness and mischievousness. <i>“");
	if(fynRelationshipStatus() >= 1) output("Or at least - not with you at <b>that</b> end of the leash. ");
	output("Who’s this?”</i>");
	output("\n\n<i>“");
	if(fynRelationshipStatus() >= 1) output("I enjoy all sorts of things. And t");
	else output("T");
	output("his is Sera, my pet,”</i> you reply brightly. <i>“Say hello, Sera.”</i>");
	output("\n\n<i>“Hello, s... sir,”</i> mumbles the succubus, eyes fixed on the ground.");
	output("\n\n<i>“My, haven’t you got her well trained!”</i> Fyn strolls around your pet, taking her in with an experienced, glittering eye. <i>“Nice, healthy skin, body-contoured collar,");
	if(hasSchoolgirl) output(" sexy outfit,");
	output(" wonderful. Could stand to have a sunnier disposition whilst serving her [pc.master] so obediently, though.”</i> He claps you merrily on the shoulder. <i>“If you need lessons - bit of time with some specialist equipment - you know where to come. I guarantee I could have a pet with plenty of potential like this balancing stuff on her nose within a week.”</i>");
	output("\n\nHe sails off with a wave and a saucy wink.");
	
	processTime(4);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	return;
}
// Semith met
public function seraBitcheningPunishWalkiesWitnessSemith():void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	
	moveTo("RESIDENTIAL DECK 4");
	showLocationName();
	
	output("You run into Semith the vulkrim along the Eastern Plaza, engrossed in his holo-pad. The besuited little devil gives you a distracted grin at first glance, a more interested gaze at the second.");
	output("\n\n<i>“Hello, [pc.name]. What a toothsome piece of candy you’ve got yourself there! How did you come by that? A cruiser raid? Prisoner rehabilitation scheme? Debt acquisition?”</i> He draws back with a self-admonishing hiss. <i>“Sorry. It’s rude to ask, isn’t it? It’s just... seeing a bright young thing like you busily acquiring exotic possessions, it takes me right back to my salad days.”</i> He sighs heavily, flagrantly eyeing Sera. <i>“And - if you don’t mind me saying - she looks a lot like what female vulkrimi look like, at least as the archives have it.”</i>");
	output("\n\n<i>“Not at all,”</i> you reply. <i>“Say thank you to the nice man for saying you look like a scorpion demon blow-up doll, Sera.”</i>");
	output("\n\n<i>“Th... thank you, sir,”</i> says Sera lowly, staring at the floor.");
	output("\n\n<i>“Charming,”</i> grins Semith, returning to his device. <i>“Please do carry on, [pc.name]. Liven up this dullard’s paradise.”</i>");
	
	processTime(3);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	return;
}
// Jardi met
public function seraBitcheningPunishWalkiesWitnessJardi():void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	
	moveTo("RESIDENTIAL DECK 2");
	showLocationName();
	
	var hasWhip:Boolean = (seraWalkItemsSel.select & seraWalkItemsSel.anyWhip) != 0;
	
	output("<i>“M-mistress?!”</i> A pale, petite rahn is staring at you from across the concourse, goggle-eyed.");
	output("\n\n<i>“Oh One...”</i> moans Sera. <i>“Anything but this. PLEASE.”</i> The leash tugs backwards in your hand. You firmly lock it.");
	output("\n\n<i>“Mistress, I, I thought I recognized you");
	if(chars["SERA"].skinTone == "bright pink") output(", even though your skin is");
	output("...”</i> Jardi pauses once she’s hurried over, almond eyes flicking between the two of you, unsure of what to say. <i>“I don’t understand. Why aren’t you still in hiding? Did- did [pc.name] capture you?”</i> You have to laugh.");
	output("\n\n<i>“What have you been telling Jardi over the extranet?!”</i> Sternly, you " + (hasWhip ? "crack the whip" : "draw the leash in closer") + ". <i>“Tell her the truth, bitch. Now.”</i>");
	output("\n\n<i>“The- the truth is...”</i> Sera’s brilliant eyes roll, but there’s no escape here. Nothing but the cleansing burn of humiliation. <i>“The truth is that I’m not on the run,”</i> she mutters at last. Gently you put your finger underneath her chin and raise it, so she’s looking the rahn in the eye. <i>“There’s no pirates or... any of the other stuff I said. What happened was, I ran up a whole bunch of debt that [pc.name] cleared. So I - I belong to [pc.him] now.”</i>");
	output("\n\n<i>“And...”</i> Jardi, hands clutched together, still looks very confused. She turns to you. <i>“...you’re happy with this?”</i>");
	output("\n\n<i>“Very much so!”</i> you reply with all the brightness you can muster. <i>“It was tough work, breaking her into her new arrangement - and she still needs plenty of discipline, as you can see - but it’s ultimately been a satisfying and pleasurable experience for us both. Isn’t that right, bitch?”</i>");
	output("\n\n<i>“Yes, [pc.master],”</i> whispers Sera. You could cook toast with her cheeks right now.");
	output("\n\n<i>“Lovely seeing you,”</i> you tell the petite, white rahn. She looks down, embarrassed and demure, and the memory of a flood of fluid hitting sheets fills your ears. <i>“And perhaps if you’re interested in a similar arrangement... we can talk more.”</i> You breeze on, tugging the leash briskly.");
	output("\n\n<i>“Human relationships are so WEIRD,”</i> reaches your ears before you get completely out of earshot.");
	
	processTime(5);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	return;
}
// Rival met
public function seraBitcheningPunishWalkiesWitnessRival():void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	
	moveTo("RESIDENTIAL DECK 3");
	showLocationName();
	
	output("<i>“You! - what are you doing?”</i>");
	output("\n\nYour cousin, slim and sharply dressed, is standing in the middle of the Residential thoroughfare, staring at you - or more specifically slightly beyond you, at the individual on the end of your leash. It’s a slight shock to see [rival.himHer] in a setting where you don’t want to kill [rival.himHer], but you immediately decide to style it out.");
	if(!pc.isBimbo())
	{
		output("\n\n<i>“Taking one of my bitches for a walk. Say hello to my cousin, Sera.”</i>");
		output("\n\n<i>“Hi,”</i> mutters Sera, staring at the ground.");
		output("\n\n<i>“I’ve been collecting them,”</i> you tell [rival.name]. You crook your eyebrow at [rival.himHer]. <i>“Why, you interested?”</i>");
	}
	else
	{
		output("\n\n<i>“Taking one of my pets for a walk!”</i> you say brightly. <i>“Say woof woof to my lovely cousin, Sera!”</i>");
		output("\n\n<i>“Hi,”</i> mutters Sera, staring at the ground.");
		output("\n\n<i>“I love my good little pets and I’ve been collecting them!”</i> you enthuse to [rival.name]. <i>“Do you want to be one? I’ll take good care of you!”</i>");
	}
	output("\n\n<i>“No! God no.”</i> [rival.name] is still staring at Sera, expression frozen, foot tapping impulsively; [rival.hisHer] usual snap and sting are completely absent. <i>“Well! I suppose I should get back out to the frontier. Seems you’ve basically thrown in the towel, if this is how you’re wasting your time.”</i>");
	output("\n\n<i>“What are <i>you</i> doing here?”</i> you inquire.");
	output("\n\n<i>“Nothing! None of your business!”</i> [rival.heShe] strides away without another word. [rival.HeShe] can’t stop [rival.himHer]self from shooting a couple of glances back over [rival.hisHer] shoulder at the pair of you, though.");
	
	processTime(5);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	return;
}
// Walkies Merge
public function seraBitcheningPunishWalkiesNext():void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	
	moveTo("RESIDENTIAL DECK 2");
	showLocationName();
	
	var hasSchoolgirl:Boolean = (seraWalkItemsSel.select & seraWalkItemsSel.anySchoolgirl) != 0;
	
	output("Casually presenting your well-trained pet to the public like this has only made the domineering arousal saturating your [pc.groin] all the more brazen and fiery, and along the quieter southern balustrade you decide to do something about it. What use is an obedient fuck-pet if you can’t have them satiate you as and when you demand it, after all? You lead her behind a holo-board advertising new apartments. Her breath, hot and heavy, is in your ears as you turn and calmly consider the succulent succubus");
	if(hasSchoolgirl) output(" school girl");
	output(" slut.");
	
	processTime(15);
	
	// [Male oral] [Female oral]
	clearMenu();
	if(pc.hasCock() && pc.hasVagina())
	{
		addButton(0, "Male Oral", seraBitcheningPunishWalkiesOral, "male");
		addButton(1, "Female Oral", seraBitcheningPunishWalkiesOral, "female");
		addButton(2, "Rimjob", seraBitcheningPunishWalkiesOral);
	}
	else if(pc.hasCock())
	{
		addButton(0, "Male Oral", seraBitcheningPunishWalkiesOral, "male");
		addButton(1, "Rimjob", seraBitcheningPunishWalkiesOral);
	}
	else if(pc.hasVagina())
	{
		addButton(0, "Female Oral", seraBitcheningPunishWalkiesOral, "female");
		addButton(1, "Rimjob", seraBitcheningPunishWalkiesOral);
	}
	else
	{
		addButton(0, "Next", seraBitcheningPunishWalkiesOral);
	}
	
	return;
}
public function seraBitcheningPunishWalkiesOral(response:String = "none"):void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	
	var hasCuffs:Boolean = (seraWalkItemsSel.select & seraWalkItemsSel.anyCuffs) != 0;
	var hasWhip:Boolean = (seraWalkItemsSel.select & seraWalkItemsSel.anyWhip) != 0;
	
	switch(response)
	{
		// Male oral
		case "male":
			var cIdx:int = rand(pc.cocks.length);
			
			output("<i>“Watching you whorishly display yourself gets me very hard,”</i> you whisper");
			if(!pc.isCrotchExposed()) output(", briskly unfastening your [pc.lowerGarments]");
			output(". [pc.EachCock] springs out readily, hot and semi-erect. <i>“So now you will do what you do best.”</i>");
			output("\n\n<i>“Yes, [pc.master].”</i> No back-chat, no pouting, no smirking; the Sera that would do that has retreated far away, replaced by one that is a vessel of submissiveness, one that happily accepts the need to serve and be punished. She kneels and");
			if(!hasCuffs)output(" uses her hands to stroke your [pc.cock " + cIdx + "] straining erect before enveloping the bulging head in her mouth");
			else output(", with only her mouth available to her, licks the underside of your [pc.cock " + cIdx + "], stroking you straining erect with her lips and tongue. It’s a pleasant sight - particularly when you wag your cock around, making her awkwardly bob her head to try and catch it - but eventually you let her envelop the bulging head in her mouth");
			output(".");
			output("\n\nYou voice your enjoyment with deep exhalations and groans as her head bobs, pushing that spry sleeve of wet silk further and further down your shaft, making it feel like it’s filling with hot iron. You jerk the leash upwards to make sure she gets");
			if(pc.cLength(cIdx) >= 11.5) output(" as far down your massive dick as she can");
			else output(" all the way down to your " + (pc.hasKnot(cIdx) ? "[pc.knot]" : "base") + ", nose pressing into your crotch");
			output(". You’re a short distance away from the main drag, towards the apartments still under construction, but surely anyone who looks clearly towards the advertisement you’re behind will be able to see your [pc.legOrLegs], and the pretty pair of [sera.skinColor] knees in front of them. It sends a lightning-like thrill through your veins, intensifying the pleasure of a good, deep suck. Undoubtedly this all occurs to Sera, too; the breath whistles out of her nose as she hollows her cheeks around your [pc.cock " + cIdx + "], the phosphorescence of her eyes flicking incessantly towards the lights of the plaza.");
			output("\n\n");
			if(hasCuffs) output("Hands cuffed behind her back makes this a bit challenging for her, so as your lust intensifies you help her out.");
			else output("Goddamn...");
			output(" You grip her horns and face-fuck her with firm thrusts of your hips, reaching as far into that dripping, warm hole of hers as you can. You draw a string of wonderfully obscene dribbly slurps out of her until you drown them out with an ecstatic surge of [pc.cum]. You hold your slave steady by her sturdy handlebars as you clench up again and again, your cum gushing forth in almost uncontrolled gouts. Sera’s throat works diligently as, eyes closed, she swallows every last drop down like a champ, perhaps mindful of getting it all over her and then having to walk back covered in it.");
			output("\n\nYou withdraw your throbbing cock away from her lips at last, giving her hair a fond stroke when she catches the last [pc.cumColor] drops with a craning tongue.");
			break;
		// Female oral
		case "female":
			var vIdx:int = rand(pc.vaginas.length);
			
			output("<i>“Watching you whorishly display yourself gets me very wet,”</i> you whisper");
			if(!pc.isCrotchExposed()) output(", briskly unfastening your [pc.lowerGarments]");
			output(", parting your [pc.thighs] and displaying the evidence of [pc.eachVagina]. <i>“So now you are going to take care of it.”</i>");
			output("\n\n<i>“Yes, [pc.master].”</i> No back-chat, no pouting, no smirking; the Sera that would do that has retreated far away, replaced by one that is a vessel of submissiveness, one that happily accepts the need to serve and be punished. She kneels and flicks at your [pc.clit] with the tip of her tongue, rolling over it until it is bulging out of its hood before moving further upward, lips pressing into your soft flesh as she licks along the line of your sensitive channel.");
			if(hasCuffs) output(" It’s slightly awkward for her, what with her hands firmly cuffed behind her back, but it does make her amusing to watch. As well as pushing her plush boobs out in a very pleasing manner.");
			output("\n\nYou voice your enjoyment with deep sighs and groans as her head moves, lapping at the entrance of your [pc.vagina " + vIdx + "] with long, lavish drags of her tongue until [pc.femcum] is " + (pc.isSquirter(vIdx) ? "dribbling" : "coursing") + " readily down her chin. You jerk the leash upwards impatiently as your lust blossoms, forcing her to get her wriggling, hot mouth muscle up into your cunt proper and caressing you within.");
			output("\n\nYou’re a short distance away from the main drag, towards the apartments still under construction, but surely anyone who looks clearly towards the advertisement you’re behind will be able to see your [pc.legOrLegs], and the pretty pair of [sera.skinColor] knees in between them. It sends a lightning-like thrill through your veins, intensifying the pleasure of a good, worshipful munch. Undoubtedly this all occurs to Sera, too; the breath whistling out of her nose tickles your mound as she drags her tongue over your g-spot repeatedly, the phosphorescence of her eyes flicking incessantly towards the lights of the plaza.");
			output("\n\n");
			if(hasCuffs) output("Hands cuffed behind her back makes this a bit challenging for her, so as your lust intensifies you help her out.");
			else output("Goddamn...");
			output(" You grip her horns and face-fuck her with firm thrusts of your hips, [pc.ass] jouncing as you force as much of your [pc.vagina " + vIdx + "] around her mouth as you can. With a string of wonderfully obscene dribbly slurps she licks you to a pulsating orgasm. You hold your slave steady by her sturdy handlebars as you clench up again and again,");
			if(!pc.isSquirter(vIdx)) output(" smearing her plush lips with [pc.femcum]");
			else output(" almost making her choke on the fragrant stream of [pc.femcum] she’s sourced");
			output(". Sera’s face moves diligently against you, licking every inch of your tender sex eyes closed, perhaps mindful of not having to walk back with a face like a glazed donut.");
			output("\n\nYou step away at last, giving her hair a fond stroke when she polishes your [pc.clit] with a craning tongue.");
			break;
		default:
			output("<i>“Watching you whorishly display yourself gets me very horny,”</i> you whisper");
			if(!pc.isAssExposed()) output(", briskly unfastening your [pc.lowerGarments]");
			output(", bending your rear-end toward her face. <i>“So now you are going to take care of it.”</i>");
			output("\n\n<i>“Yes, [pc.master].”</i> No back-chat, no pouting, no smirking; the Sera that would do that has retreated far away, replaced by one that is a vessel of submissiveness, one that happily accepts the need to serve and be punished. She kneels and flicks at your [pc.asshole] with the tip of her tongue, rolling over its sensitive edge. With a pause, she presses her lips into one of your [pc.butts], raining it in kisses before resuming her oral stimulation.");
			if(hasCuffs) output(" It’s slightly awkward for her, what with her hands firmly cuffed behind her back, but it does make her amusing to watch. As well as pushing her plush boobs out in a very pleasing manner.");
			output("\n\nYou voice your enjoyment with deep sighs and groans as her head moves, tickling your rim with long, lavish drags of her tongue until a shiver shoots up your spine. You jerk the leash upwards impatiently as your lust blossoms, forcing her to get her wriggling, hot mouth muscle up into your asshole proper and caressing you within.");
			output("\n\nYou’re a short distance away from the main drag, towards the apartments still under construction, but surely anyone who looks clearly towards the advertisement you’re behind will be able to see your [pc.legOrLegs], and the pretty pair of [sera.skinColor] knees in between them. It sends a lightning-like thrill through your veins, intensifying the pleasure of a good, worshipful munch. Undoubtedly this all occurs to Sera, too; the breath whistling out of her nose tickles your mound as she drags her tongue over your sensitive spot repeatedly, the phosphorescence of her eyes flicking incessantly towards the lights of the plaza.");
			output("\n\n");
			if(hasCuffs) output("Hands cuffed behind her back makes this a bit challenging for her, so as your lust intensifies you help her out.");
			else output("Goddamn...");
			output(" You grip her horns and face-fuck her with firm thrusts of your hips, [pc.ass] jouncing as you force as much of your [pc.asshole] around her mouth as you can. With a string of wonderfully obscene slurps she licks you to a pulsating orgasm. You hold your slave steady by her sturdy handlebars as you clench up again and again");
			if(pc.ass.wetness() <= 3) output(".");
			else if(pc.ass.wetness() <= 6) output(", smearing her plush lips with lubricant");
			else output(", almost making her choke on the stream of lube she’s sourced");
			output(". Sera’s face moves diligently against you, licking every inch of your tender ring eyes closed");
			if(pc.ass.wetness() > 3) output(", perhaps mindful of not having to walk back with a face like a glazed donut");
			output(".");
			output("\n\nYou step away at last, giving her hair a fond stroke.");
			break;
	}
	output("\n\n<i>“Can we go home now?”</i> she asks, kneeling in front of you with big, solemn eyes. <i>“Please?”</i>");
	output("\n\n<i>“Speak when spoken to,”</i> you chide, making her gasp and quiver with");
	if(hasWhip) output(" a firm clip to the backside with the whip");
	else output(" a firm zap with the control");
	output(". <i>“And we’ll see.”</i>");
	output("\n\nThere’s nothing like a bout of al fresco oral to make you feel at peace with the galaxy, and you take your time strolling through the crystal gardens, well aware of the stares and low whistles you continue to draw wherever you go. Eventually though, you lead your trophy back to the elevator, and at last to the anonymity of your personal hangar. You make her kneel before you enter your ship.");
	output("\n\n<i>“What do you say?”</i>");
	output("\n\n<i>“Thank you for disciplining me, [pc.master],”</i> Sera replies lowly. She does, for once in her life, look thoroughly sorry. <i>“And for the... fresh air");
	if(response == "male" || response == "female") output(". And " + (response == "male" ? "cum" : "pussy juice"));
	output(",”</i> she even throws in.");
	output("\n\n<i>“Good girl.”</i> You draw her into your arms, giving her a comforting hug as you head inside, before sending the her back to her room with a tap on the ass.");
	output("\n\nYou suspect the memory of this punishment will not fade easily.");
	
	processTime(27);
	
	chars["SERA"].lust(35);
	pc.orgasm();
	pc.exhibitionism(1);
	
	currentLocation = "SHIP INTERIOR";
	
	clearMenu();
	addButton(0, "Next", seraBitcheningPunishWalkiesEnd);
	
	return;
}
// Walkies End
public function seraBitcheningPunishWalkiesEnd():void
{
	IncrementFlag("SERA_BITCHENING_PUNISH_WALKIES");
	seraWalkItemsSel.select = 0;
	
	chars["SERA"].removeStatusEffect("Sera Masturbated");
	pc.removeStatusEffect("Seranigans Punishment");
	
	// Seranigans chance set to 0 for 96 hours
	pc.createStatusEffect("Seranigans", 0, 0, 0, 0, true, "", "", false, 5760);
	
	mainGameMenu();
	
	return;
}


// [Boot]
public function evictServantSera():void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	
	// Untrained
	if(flags["SERA_OBEDIENCE_MIN"] <= 0)
	{
		output("Narrowed reptilian eyes watch as you fiddle around with the silver remote. It takes a while to comprehend what you’re trying to do, but once you’ve worked out how to enter the location of the Tavros nursery it makes a series of encouraging beeps.");
		output("\n\n<i>“" + ((flags["SERA_SERVANT_INTRO"] == undefined || flags["SERA_SERVANT_INTRO"] < 3) ? "Fuck" : "F- flip are you doing?") + "”</i> growls Sera, waiting tensely.");
		output("\n\n<i>“Moving you off the ship,”</i> you explain. <i>“You will go to Tavros, take the lift up to the Nursery and stay there. Don’t try anything else - your collar is programmed to give you shocks every thirty seconds if you do.”</i>");
		output("\n\n<i>“You’re giving up, you mean,”</i> leers the succubus, visibly relaxing. She props her face up in her hands and adopts a sugary coo. <i>“Gotten tired of playing " + pc.mf("Billy Big Balls", "Tammy Tin Tits") + " already? All gotten a bit too much for diddums? It’s ok - I don’t mind being a thrown toy, if it gets me out of YOUR pram.”</i>");
		output("\n\n<i>“I will come back for you later,”</i> you say as evenly as you can, <i>“and your training will resume then.”</i> Sera laughs sardonically, rolling away on the bed from you. She’s singing a filthy song about a fanfir and Fenchurch Spaceport at the top of her lungs as she leaves.");
		
		processTime(7);
		// -5 Ob every day she spends off the ship
	}
	// Trained
	else
	{
		output("<i>“I’m moving you off the ship,”</i> you tell her, clicking instructions into the silver remote. <i>“Go to Tavros, take the lift up to the Nursery and stay there. I don’t need to tell you not to try anything else, do I?”</i>");
		output("\n\nSera visibly deflates.");
		// !Merchant Sera:
		if(flags["SERA_MERCHANT"] == undefined)
		{
			output("\n\n<i>“You’ll come and fetch me soon, though?”</i> she pleads. She licks her bottom lip and toys with her nipples, gazing at you sultrily. <i>“You wouldn’t leave your favorite slave alone for very long, would you? I mean - imagine what she might get up to in a </i>Nursery<i>.”</i>");
			output("\n\nYou stroke her chin, enjoying tormenting her by not saying a word.");
		}
		// Merchant Sera:
		else
		{
			output("\n\n<i>“Oh. Well - I guess I can continue to run the business from there. May even be easier.”</i> She packs her stuff up and heads to the door, stopping only to give you a farewell kiss, which swiftly turns into a lascivious frenching. <i>“Come and get me once you’re ready to get nasty again,”</i> she husks in your ear.");
		}
		
		processTime(6);
	}
	
	output("\n\n(<b>Sera is no longer on your crew. You can find her again in Tavros Station.</b>)");
	flags["SERA_CREWMEMBER"] = 0;
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	return;
}
public function seraOnTavrosObedience(totalDays:int):void
{
	// -5 Ob every day she spends off the ship
	if(flags["SERA_CREWMEMBER"] == 0 && flags["SERA_OBEDIENCE_MIN"] <= 0) seraObedience(-(5 * totalDays));
	
	return;
}

// Put her room on second floor of Nursery
public function seraOnTavrosBonus(btnSlot:int = 0):String
{
	var bonusText:String = "";
	
	bonusText += "\n\nA door with a digital sign is marked ‘Sera’s Apartment’.";
	if(seraAtNursery())
	{
		bonusText += " The door is ajar and the room is unoccupied. Sera must be in another location in the nursery.";
		addDisabledButton(btnSlot, "Sera", "Sera", "Perhaps she is somewhere else in the nursery...");
	}
	else
	{
		pc.removeStatusEffect("Sera at Nursery");
		
		if(flags["SERA_PREGNANCY_CHECK"] != undefined)
		{
			bonusText += " The door is closed. You recall that Sera is in the natal unit, so it is probably best to";
			if((flags["SERA_PREGNANCY_CHECK"] + 1) >= days)
			{
				bonusText += " wait a day";
				if(flags["SERA_PREGNANCY_CHECK"] == days) bonusText += " or two";
			}
			else bonusText += " check with Briget";
			bonusText += " before visiting her again.";
			addDisabledButton(btnSlot, "Sera", "Sera", "Sera is currently away giving birth.");
		}
		else if(pc.hasStatusEffect("Sera Mommy Time"))
		{
			bonusText += " The door is closed, leaving Sera some private time to recover and bond with her newborn.";
			addDisabledButton(btnSlot, "Sera", "Sera", "Sera is still recovering from giving birth. Best to meet with her a bit later.");
		}
		else if(pc.hasStatusEffect("Sera Morning Sickness") || (flags["SERA_PREGNANCY_TIMER"] >= 30 && flags["SERA_PREGNANCY_TIMER"] < 90 && hours >= 6 && hours < 10 && rand(3) == 0))
		{
			bonusText += " You hear the distinct sound of someone throwing up, followed by a moaned <i>“Fuck thiiiiiiis...”</i> from Sera’s room. Probably best to leave her alone for a while.";
			pc.createStatusEffect("Sera Morning Sickness", 0, 0, 0, 0, true, "", "", false, 120);
			addDisabledButton(btnSlot, "Sera", "Sera", "She seems to be sick or something...");
		}
		else
		{
			if(flags["SERA_OBEDIENCE_MIN"] <= 0) bonusText += " Maybe you are in the mood to retrieve and train the demoness some more?";
			else
			{
				bonusText += " Perhaps you should pay your recruit a little visit";
				if(flags["SERA_MERCHANT"] != undefined) bonusText += " and maybe take a peek at her inventory";
				bonusText += "?";
			}
			addButton(btnSlot, "Sera", approachServantSeraOnTavros, true, "Sera", "Pay Sera a visit.");
		}
	}
	
	return bonusText;
}
// At her room
public function approachServantSeraOnTavros(introText:Boolean = false):void
{
	// Sera Salary hotfix check
	if(seraSalaryCheck()) return;
	
	clearOutput();
	author("Nonesuch");
	clearMenu();
	
	if(seraPregnancyIsDue())
	{
		output("Sera’s room is empty. It looks slightly more dishevelled than usual, although that’s a difficult thing to judge.");
		output("\n\n...How long has she been pregnant for, again?");
		if(flags["SERA_PREGNANCY_CHECK"] == undefined) output("\n\n<b>Perhaps you should check in with " + (flags["BRIGET_MET"] == undefined ? "the head nurse" : "Briget") + " about that.</b>");
		// [Sera] option added to Briget’s menu
		addButton(14, "Leave", mainGameMenu);
		return;
	}
	
	generateMapForLocation("NURSERYSERA");
	
	showSera();
	
	if(introText)
	{
		// Untrained
		if(flags["SERA_OBEDIENCE_MIN"] <= 0)
		{
			output("Sera rolls her eyes at you as you enter her room. It’s horrifically untidy, an achievement given she only owns what the Nursery staff have loaned her. She’s wearing a staid outfit of jeans and t-shirt, presumably forced upon her for the sake of the children by " + (flags["BRIGET_MET"] == undefined ? "the head nurse" : "Briget") + ".");
			output("\n\n<i>“Welcome, great and honorable [pc.master] that enslaved me only to then abandon me in this pastel-shaded booze-less hellhole,”</i> she yawns. <i>“You here to fuck me? I almost welcome it, it’s that boring around here.”</i>");
			
			processTime(1);
			if(flags["MET_SERA_IN_NURSERY"] == undefined) flags["MET_SERA_IN_NURSERY"] = 1;
		}
		// Trained
		else
		{
			// !Merchant Sera:
			if(flags["SERA_MERCHANT"] == undefined)
			{
				if(flags["SERA_PREGNANCY_TIMER"] >= 195)
				{
					output("<i>“Hey [pc.master]! I knew you’d come and visit.”</i>");
					output("\n\nSera puts down her holopad and grins up at you when you enter her room. Though she’s clad in her modest jeans and blouse outfit she still stretches herself out for you, letting you take in her heavy, rounded belly and milk-swollen tits. Going off the state of her room, pregnancy has intensified her predilection for untidiness more than anything.");
					output("\n\n<i>“Cuz I knew you can’t get enough of drinking in your handiwork,”</i> she husks, feline and serene.");
				}
				else
				{
					output("<i>“You’ve come to pick me up, haven’t you?”</i> says Sera the second you enter her room. It’s horrifically untidy, an achievement given she only owns what the Nursery staff have loaned her. She’s wearing a staid outfit of jeans and t-shirt, presumably forced upon her for the sake of the children by " + (flags["BRIGET_MET"] == undefined ? "the head nurse" : "Briget") + ". <i>“C’mon. Let’s blow this popsicle stand. Please? [pc.master]?”</i>");
				}
				// [Recruit] [Leave]
			}
			// Merchant Sera:
			else
			{
				if(flags["SERA_PREGNANCY_TIMER"] >= 195)
				{
					output("<i>“Hey [pc.master]! How’s it going?”</i>");
					output("\n\nSera puts down her holopad and grins up at you when you enter her room. She’s sat on her side in bed, resting her large, round belly, surrounded by slews of packaged gene mods and promotional material. Going off the state of her room, pregnancy has intensified her predilection for untidiness more than anything.");
				}
				else
				{
					output("<i>“I told you not to - oh. Hey, [pc.master].”</i>");
					output("\n\nSera blinks up from her holopad at you as you enter her room. It’s horrifically untidy, stacks and slews of packaged gene-mods and promotional material everywhere you look. She’s wearing a staid outfit of jeans and t-shirt, presumably forced upon her for the sake of the children by " + (flags["BRIGET_MET"] == undefined ? "the head nurse" : "Briget") + ".");
				}
				// [Recruit] [Buy] [Leave]
			}
			
			processTime(1);
			if(flags["MET_SERA_IN_NURSERY"] == undefined) flags["MET_SERA_IN_NURSERY"] = 1;
		}
	}
	
	addButton(0, "Appearance", seraAppearance);
	if(flags["SERA_MERCHANT"] != undefined)
	{
		addButton(1, "Buy", seraBitcheningStore, "buy");
		addButton(2, "Sell", seraBitcheningStore, "sell");
	}
	if(flags["SERA_PREGNANCY_TIMER"] >= 195) addButton(3, "Talk", seraPregTalk);
	if(flags["SERA_PREGNANCY_TIMER"] >= 195) addDisabledButton(4, "Recruit", "Recruit", "She is currently being taken care of at the nursery and is far too pregnant to board your ship.");
	else addButton(4, "Recruit", seraOnTavrosRecruit, undefined, "Recruit", "Put her back on board your ship.");
	if(flags["SERA_PREGNANCY_TIMER"] >= 110) addButton(7, "Belly Rubs", seraPregBellyRubs, undefined, "Belly Rubs", "Rub her belly...");
	addButton(14, "Leave", mainGameMenu);
	
	return;
}
public function seraOnTavrosRecruit():void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	
	// Untrained
	if(flags["SERA_OBEDIENCE_MIN"] <= 0)
	{
		output("<i>“C’mon,”</i> you say, clicking the remote. <i>“You’re coming back on board.”</i>");
		output("\n\nSera taps her holopad. A small display of neon fireworks go off around her deadpan scowl, the trailing lights combining into the words I AM SO EXCITED!! above her head. She then flounces out of the room without a word.");
		output("\n\nDamn, she really <i>was</i> bored.");
		
		processTime(2);
	}
	// Trained
	else
	{
		// !Merchant Sera:
		if(flags["SERA_MERCHANT"] == undefined)
		{
			output("<i>“Yes!”</i>");
			output("\n\nSera is out the door and halfway to the lift by the time you’re partway through telling her to come back aboard. Hopefully not because she wants a head-start on whatever prank she’s probably been working on the whole time she was here.");
		}
		// Merchant Sera:
		else
		{
			output("<i>“Thank God.”</i> She snaps closed her holopad and begins to pack her stuff up. <i>“I’ll be back on board by the time you want to leave [pc.master],”</i> she says, pulling several large suitcases out from under her bed.");
			output("\n\n<i>“The staff here are such a bunch of dullards,”</i> she complains, clicking away. <i>“");
			if(ChildManager.numChildrenAtNursery() < 3) output("They’ve got exactly nothing to do and they still bitch about fetching my orders up.");
			else output("As if looking after a few brats is so hard that fetching my orders up is a massive ask.");
			output(" You come to bust me out of this popsicle stand? Or do you want to look at what’s on offer this week?”</i>");
		}
		
		processTime(2);
	}
	
	output("\n\n(<b>Sera has rejoined your crew!</b>)");
	flags["SERA_CREWMEMBER"] = 1;
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	return;
}

