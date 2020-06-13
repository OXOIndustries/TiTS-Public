// The Island of Doctor Lessau
//LESSAU_FROSTWYRM_QUEST null = not started, 0 talked to lessau, 1 sample collected, 2 sample delivered, 3 completed
//LESSAU_FROSTWYRM_TFTIMER timer to send the email for the tf being reader
//FROSTWYRM_TF_UNLOCKED = 1 unlocks tf

public function drLessauBonus():Boolean
{
	if (flags["MET_DR_LESSAU"] == undefined)
	{
		output("\n\nBehind the desk is a bizarre mishmash of cat, serpent, bull, and some sort of feathered beast. He doesn’t look like any alien species you recognize. Whatever he is, your entrance prompts him to look up.");
		addButton(0,"Chimera", drLessauIPresume)
	}
	else
	{
		output("\n\nDr. Lessau is here as usual, the chimera tapping away at his terminal until he sees you come in.");
		addButton(0,"Lessau", drLessauIPresume)
	}
	
	return false;
}

public function showLessau(nude:Boolean = false):void
{
	if(!nude) showBust("DR_LESSAU");
	else showBust("DR_LESSAU_NUDE");
	showName("DOCTOR\nLESSAU");
	author("Couch");
}

public function drLessauIPresume():void
{
	showLessau();
	
	if (flags["MET_DR_LESSAU"] == undefined)
	{
		clearOutput();
		
		output("The chimera behind the desk closes the monitor in front of him as you approach. He’s wearing a Steele Tech standard-issue lab coat, worn open to reveal thick orange fur across his chest and shoulders almost like a mantle, as well as around his wrists, matching the luxurious mane that cascades down the center of his back and is parted at his forehead by a pair of massive black bull-like horns. Below the thicker orange fluff, thinner white fur covers the rest of his upper body, the same shade as the feathers of his rather enormous avian wings. Behind him you can see the signature coils of a naga’s tail, black scales with a white underbelly. As if all that wasn’t enough to make him absolutely monstrous in appearance, now that you’re closer you can also see that he has four arms, three of them resting at the desk even as the fourth is raised in greeting.");
		output("\n\n<i>“Ah, welcome. I am Doctor Edward Lessau. Might I have the pleasure of your name, " + pc.mf("Mister", "Miss") + "...?”</i> His tone is surprisingly cultured for someone with such a savage appearance. You’d expect this kind of voice out of the guests at your dad’s formal dinner parties, not someone who looks like a creature you’d see on one of Steph Irson’s shows.");
		output("\n\n<i>“Steele, [pc.name] Steele,”</i> you reply. Lessau’s slitted eyes light up at the name; not just figuratively, you notice.");
		output("\n\n<i>“Ah, [pc.name]! It’s a pleasure to meet you at last.”</i> The chimera’s smile turns a mixture of warm and teasing.");
		
		if(pc.originalRace != pc.race()) output(" <i>“Making good use of my masterwork, I see.”</i>");
		else output(" <i>“Not keen to follow in your father’s footsteps with regards to transformations, I see? Or perhaps you’re just looking for the right species to make proper use of that masterpiece of mine.”</i>");
		
		if (pc.isAss()) output("\n\n<i>“The hell do you mean by that?”</i> you ask.");
		else output("\n\n\Your surprise is visible enough that Lessau sees it and laughs.");
		
		output("\n\n<i>“You didn’t think those microsurgeons that protect you were conjured from thin air, did you? They were created specially for you, twenty years in the making. This may be the first time we’ve met, Captain Steele, but we have each done great things for the other. Without you, and without your father, I would not be here today.”</i>");
		output("\n\nThe chimera looks as though he’s about to say more, but shakes his head after a moment.");
		output("\n\n<i>“Well, I imagine you didn’t come in for a reminder of your recent loss. My apologies. Come, take a look. I have quite a number of transformatives that might interest you, if you yearn to become something truly exotic. We can prepare them for you right here.”</i>");
		
		processTime(3);
		
		flags["MET_DR_LESSAU"] = 1;
	}
	
	drLessauMainMenu();
}

public function metCynthia():Boolean
{
	return (flags["BIOMED_GANGBANGED"] != undefined || flags["MET_CYNTHIA"] != undefined);
}
public function metWalt():Boolean
{
	return (flags["BIOMED_GANGBANGED"] != undefined || flags["MET_WALT"] != undefined);
}

public function drLessauMainMenu():void
{
	clearMenu();

	addButton(0, "Shop", drLessauShop);
	addButton(1, "Talk", drLessauTalk);
	addButton(2, "Appearance", drLessauAppearance);
	addButton(3, "Sex", drLessauSex);
	
	if(bothriocQuestComplete()) bothriocQuestGenealogyButton(4, "Lessau");
	else if(bothriocQuestActive()) bothriocQuestDoctorButton(4, "Lessau");
	
	addButton(14, "Leave", mainGameMenu);
}

public function drLessauShop():void
{
	if (flags["MET_CYNTHIA"] >= 2)
	{
		if (!chars["DRLESSAU"].hasItemByClass(Holstaria)) chars["DRLESSAU"].inventory.push(new Holstaria());
	}
	else chars["DRLESSAU"].destroyItemByClass(Holstaria, -1);
	if (flags["MET_WALT"] >= 2)
	{
		if (!chars["DRLESSAU"].hasItemByClass(Lupinol)) chars["DRLESSAU"].inventory.push(new Lupinol());
	}
	else chars["DRLESSAU"].destroyItemByClass(Lupinol, -1);
	if (flags["DECK13_COMPLETE"] == 1)
	{
		if(!chars["DRLESSAU"].hasItemByClass(GrayMicrobots)) chars["DRLESSAU"].inventory.push(new GrayMicrobots());
	}
	else chars["DRLESSAU"].destroyItemByClass(GrayMicrobots, -1);
	if (flags["MCALLISTER_MYR_HYBRIDITY"] >= 3)
	{
		if(!chars["DRLESSAU"].hasItemByClass(OrangePill)) chars["DRLESSAU"].inventory.push(new OrangePill());
	}
	else chars["DRLESSAU"].destroyItemByClass(OrangePill, -1);
	if (flags["UVETO_DEEPSEALAB_QUEST"] == 5)
	{
		if(!chars["DRLESSAU"].hasItemByClass(CrackleJelly)) chars["DRLESSAU"].inventory.push(new CrackleJelly());
	}
	else chars["DRLESSAU"].destroyItemByClass(CrackleJelly, -1);
	if (flags["FROSTWYRM_TF_UNLOCKED"] != undefined)
	{
		if(!chars["DRLESSAU"].hasItemByClass(FrostwyrmIchor)) chars["DRLESSAU"].inventory.push(new FrostwyrmIchor());
	}
	else chars["DRLESSAU"].destroyItemByClass(FrostwyrmIchor, -1);
	
	shopkeep = chars["DRLESSAU"];
	buyItem();
}

public function drLessauTalk():void
{
	drLessauTalkMenu();
}

public function drLessauTalkMenu():void
{
	clearMenu();
	
	addButton(0, "Why Here", drLessauWhyHere, undefined, "Why Here", "Ask Lessau what the head of the biotech division is doing out on Uveto.");
	addButton(1, "Knew Dad", drLessauKnewDad, undefined, "Knew Dad", "It sounds like Lessau knew your dad pretty well.");
	addButton(2, "Chimera", drLessauWTFRU, undefined, "Chimera", "You’ve never really seen anything quite like the doctor before.");
	if (flags["UVETO_DEEPSEALAB_QUEST"] == 0) addButton(3, "ResearchShaft", drLessauResearchShaft, undefined, "Research Shaft", "Ask Lessau about the sealed research shaft you’ve seen.");
	else if (flags["UVETO_DEEPSEALAB_QUEST"] == 1) addDisabledButton(3, "ResearchShaft", "Research Shaft", "You were already given permission to enter the lab.");
	if (flags["UVETO_DEEPSEALAB_QUEST"] >= 4 && flags["FROSTWYRM_NOT_HOSTILE"] >= 2 && flags["LESSAU_FROSTWYRM_QUEST"] == undefined ) addButton(4, "Frostwyrm", drLessauFrostWyrm, undefined, "Frostwyrm", "You wonder if Lessau can tell you anything about the frostwyrm...");
	else if (flags["LESSAU_FROSTWYRM_QUEST"] == 0) addDisabledButton(4, "Frostwyrm", "Frostwyrm", "You have already talked about the frostwyrm.");	
	else if (flags["LESSAU_FROSTWYRM_QUEST"] == 1) addButton(4, "Frostwyrm", drLessauFrostWyrmGiveSample, undefined, "Frostwyrm", "Give Dr Lessau the sample you collected.");
	
	addButton(14, "Back", drLessauMainMenu);
}


public function drLessauWhyHere():void
{
	clearOutput();
	showLessau();
	
	output("<i>“So what’s the head of Steele Tech’s biomedical division doing in a backwater like this?”</i> you ask.");
	output("\n\n<i>“Ah, yes, that. This planet, as I’m sure you’re aware, is lush with psionically gifted lifeforms owing to the abundant savicite. Other such planets exist, but Uveto is one of the few with such diversity and genetic closeness to the coreworld races. It presents a treasure trove of potential advancements in adapting those gifts to humans or ausar. Such a breakthrough would far surpass any progress that Xenogen has made on that front.”</i>");
	output("\n\n<i>“It also gives us an opportunity to test treatments for environmental adaptation. The local ausar have of course modified themselves to an extent, but there’s potential for far more. Some of the employees have expressed interest in gaining the physical traits of the ice chimeras, not to mention the more humanoid races...”</i> Lessau trails off, noticing he’s begun to ramble.");
	output("\n\n<i>“In essence, Captain, there’s dozens of reasons to be here. When we’ve unraveled enough of this planet’s mysteries, I’m sure we’ll move on.”</i>");
	
	processTime(1);
	drLessauTalkMenu();
}

public function drLessauKnewDad():void
{
	clearOutput();
	showLessau();
	
	output("You ask Lessau if he knew your father, a query that prompts the chimera’s ears to flatten and his gaze to shift briefly downward.");
	output("\n\n<i>“I knew him quite well, yes, though chiefly in the final decades. I first met him some two centuries ago, when I was a student. He came to see my professor, who like myself studied nanomedicine, to acquire his own microsurgeons. They were experimental, far less refined and far less safe than yours, but he made a convincing argument for testing them on the frontier. I remember feeling a sense of power about him that I’ve not seen since...”</i> Lessau trails off, looking you over. <i>“...Though perhaps I see it now.”</i>");
	output("\n\n" + (pc.isAss() ? "You stand with arms folded, tapping your foot impatiently at his assessment." : "You fidget a bit, not quite sure exactly what he’s looking for.") + " Soon enough he finishes gazing and resumes his story.");
	output("\n\n<i>“I didn’t interact with him much at that time, of course, only incidentally. Still, he reached out to me twenty years ago, when it became clear his health was in decline. He wanted a new head of the biotechnology division of Steele Tech, and wanted me to head it.”</i>");
	output("\n\nYou ask why dad reached out to Lessau instead of his mentor, prompting a deep frown from the chimera. <i>“Yes, well, he would have, but she was already acquired by Xenogen. They would not be willing to let her go at any price.”</i>");
	output("\n\n<i>“You make it sound like she’s property,”</i> you reply. Lessau fixes you with as serious a look as you’ve ever seen from anyone.");
	output("\n\n<i>“You don’t leave Xenogen, [pc.name]. Not if they find you useful, or if you grow too knowledgeable about what they do behind closed doors.");
	//Done the M'henga or Myrellion Xenogen quests
	if (flags["SECOND_CAPTURED_ZIL_REPORTED_ON"] == 1 || flags["NEVRIE_QUEST"] == 2 || flags["NEVRIE_QUEST"] == 3) output(" I would caution you against doing any more for them than you already have, or you too may find yourself considered an asset too important to let roam free.");
	output("”</i>");
	output("\n\nLessau lets the statement hang, seemingly unwilling to go into more lurid detail. The moment eventually passes, and Lessau returns to his story after a moment to collect himself.");
	output("\n\n<i>“At the time Steele Tech was mostly a mining company. The biotechnology division was woefully underdeveloped and underfunded, so we began from almost nothing. Between Victor’s generous funding and some fortunate breakthroughs, we’ve managed to develop at a brisk pace since then. We even bought the rights to a terran transformative and improved it. Sadly it did little to help Victor’s condition, but it proved the commercial viability of our department as well. Sales of Humana+ have been brisk... or Terran Treats, as I gather most people call them.”</i> Lessau grumbles a bit at the mention of the more popular name.");
	output("\n\n<i>“The real goal, however, was in a concept I had spent decades drafting and refining, but lacked the funding to develop until Victor’s intervention. With his aid I produced my masterwork: microsurgeons that do more than just protect against known diseases, they adapt, they innovate when faced with the unknown. More importantly, they house within them a full transcript of your original genome from birth. No matter how you alter yourself, no matter what mutations you undergo, you will always be able to return to what you once were.”</i>");
	//Player has used something that irreversibly changes Steele
	if (pc.isTreated() || flags["GALOMAX_DOSES"] != undefined)
	{	
		output("\n\n<i>“And, of course, you went and found one of the only things in the galaxy beyond their ability to repair. I suppose I should have expected as much from a Steele.”</i>");
		
		output("\n\nYou just give Lessau an innocent look, ");
		if (pc.IQ() >= 33) output("pretending not to know what he’s annoyed at");
		else output("not understanding what he’s unhappy about");
		output(". After a moment the chimera gives a defeated sigh, one of his extra hands coming up to rub at the bridge of his nose.");
		
		output("\n\n<i>“If, somehow, you manage to claim your fortune in that condition, given enough time I may be able to undo the damage you’ve done to yourself. I’ll need to do a hard reset on your genome, and lord knows what else might have to be done to deal with the neural patterns....”</i> The doctor trails off into irritated mutterings before looking back up at you.");
		output("\n\n<i>“For the foreseeable future, however, I’m afraid you’re stuck with it.”</i>");
	}
	
	processTime(3);
	
	clearMenu();
	addButton(0, "“Knew Dad”", drLessauDadIck, undefined, undefined, "You know dad was an incorrigible sex hound...");
	addButton(14, "Back", drLessauTalk);
}

//You know, I'm starting to think Vic's reputation is exaggerated
public function drLessauDadIck():void
{
	clearOutput();
	showLessau();
	
	output("It’s kind of a squicky question, but you can’t help but ask. You know he did it with damn near everyone else.");
	output("\n\n<i>“So, did you and dad ever...?”</i>");
	output("\n\nYou trail off as Lessau gives a hearty laugh.");
	output("\n\n<i>“He asked, certainly! But no, I did not. It was not that I was unwilling; your father was quite the charmer. It would have contributed further to his declining health, with the amount of mutations I’ve undergone that would have been communicable.”</i>");
	output("\n\n<i>“You, on the other hand...”</i> With this the doctor’s smile turns surprisingly playful.");
	output("\n\n<i>“You present no such issues. If you’d like to claim territory your father never could, I wouldn’t mind enjoying the fruits of your journey.”</i>");
	output("\n\nWell, that certainly sounds like an invitation!");
	
	processTime(1);
	
	clearMenu();
	addButton(0, "Sex", drLessauSex);
	addButton(14, "Back", drLessauTalk);
}

public function drLessauWTFRU():void
{
	clearOutput();
	showLessau();
	
	output("<i>“So, what " + (pc.isAss() ? "the hell are you supposed to be anyway" : "are you, exactly") + "”</i> you ask, looking over the massive blend of traits that go into Lessau’s chimeric form. <i>“You look like " + (pc.isAss() ? "a snake fucked an ox and then that fucked a spider or something" : "one of those old Terran legends") + ".”</i>");
	output("\n\n<i>“Oh? Oh, yes, all this.”</i> Lessau gestures to himself with one of his hands. <i>“I enjoy switching forms every few months, this has become one of my new favorites. It’s based off the Terran myths of the chimera, though with a few tweaks. The discovery of Mhen’ga and its naleen helped enormously with refining the synthesis, enough so to make this blend reproductively viable. But if you’re asking what I originally am, I was born as a human.”</i>");
	output("\n\n<i>“And the four arms?”</i> you ask, folding your own. In response Lessau lifts his two left arms, letting you see how the paired shoulders function and move independently.");
	output("\n\n<i>“These are a new addition. I’m testing if the Brundle Limitation can be overcome by forgoing legs. Results so far are promising...”</i> Lessau looks over at his raised arms, which have begun mimicking each other’s actions to his visible annoyance. <i>“...for the most part.”</i>");
	
	processTime(1);
	
	clearMenu();
	addButton(0, "Okay", drLessauTalk);
	addButton(1, "Dangers", drLessauDangers, undefined, "Dangers", "Did he say every few months? That doesn’t seem safe...");
	
}

public function drLessauDangers():void
{
	clearOutput();
	showLessau();
	
	output("You point out that if he’s changing his form every few months, Lessau ought to be the same sort of genetic mess that Victor was.")
	output("\n\n<i>“And I would be indeed, were I unprotected. Fortunately, any piece of technology as complex as yours requires a prototype. My microsurgeons are slightly less refined than yours, but they share the same general set of functions. At present I’m using them as a testbed for developing new features that I hope to be able to pass on to yours someday.”</i>");
	if (flags["DECK13_COMPLETE"] == 1) output("\n\n<i>“In fact, I’ve just recently been working on that rather interesting data you acquired from Bell-Isle Grunmann. It may be ancient technology, but the emergent intelligence properties of those microbots is quite remarkable. Imagine having the Codex and all its data held within your very bloodstream, or having the ability to store your mind as an AI while regrowing your body from the ground up, and perhaps you begin to see the possibilities. All of this will take quite some time before it’s ready to test, but your discovery promises to be a monumental advancement.”</i>");
	
	processTime(1);
	
	drLessauTalkMenu();
}

public function drLessauAppearance():void
{
	clearOutput();
	showLessau();
	
	output("You can only assume that Dr. Lessau was human at one point, but it’s impossible to tell under the mountain of gene mods he’s undergone, which have turned him into a creature similar to the mythic chimera. From the waist down his lower body is a massive serpent’s tail, normally spiraled into a coil underneath him to keep him at a few inches over six feet. The bulk of the tail’s scales are pitch black, save for a strip of white that runs down the front. His upper body is thickly muscled and covered in a thin layer of white fur that sports a thicker layer of orange around his shoulders and collar. Matching thick orange bands of fur are wrapped around each of his four wrists. Despite the thickness of his muscles, his hands are lean and nimble, the fingers tipped in sharp feline claws. His head is that of a lion, including an orange mane that cascades down his back as hair, but a pair of massive black horns stretch out from underneath the hair, more like a bull’s horns than a goat’s in how they angle up and forward. Adorning his back are a set of white feathered wings.");
	output("\n\nThe doctor stands nude save for a lab coat worn open. He shows no obvious sexual endowments at first glance");
	if (flags["DRLESSAU_SEXED"] != undefined) output(", but you know from experience he’s packing a cock just as monstrous as he is in a well-hidden genital slit");
	output(".");
}

public function drLessauSex():void
{
	clearOutput();
	showLessau();
	
	output("You reach over the desk and run a finger across the fluff along Lessau’s chest.");
	output("\n\n<i>“Think you can step away from your work for a bit to enjoy the results, doctor?”</i>");
	output("\n\nThe chimera gives a broad smile at this, switching off the holoterminals to leave his desk bare. <i>“I think I can take a break, certainly. What did you have in mind? I must warn you, though, I can be rather rough.”</i>");
	
	clearMenu();
	if (pc.blockedVaginas() < pc.totalVaginas() || pc.hasCock()) addButton(0, "Get Oral", drLessauOral, undefined, "Get Oral", "He looks like he’s got a pretty impressive tongue. Put it to work.")
	else addDisabledButton(0, "Get Oral", "Get Oral", "You need a cock or vagina for this.");
	if (pc.hasVagina() && pc.biggestVaginalCapacity() > chars["DRLESSAU"].cockVolume(0) && pc.blockedVaginas() == 0) addButton(1, "Take Vaginal", drLessauVag, undefined, "Take Vaginal", "Have him fuck you. You get the feeling he might get a little riled up, though...");
	else if(pc.blockedVaginas() > 0) addDisabledButton(1,"Take Vaginal","Take Vaginal","Sex while you've got a blocked-up vagina might be a bad idea.");
	else addDisabledButton(1, "Take Vaginal", "Take Vaginal", "You need a vagina of sufficient size for this.");
	addButton(14, "Back", drLessauMainMenu);
}

public function drLessauOral():void
{
	clearOutput();
	showLessau();
	
	output("You ask Lessau if he wouldn’t mind putting that long, flexible tongue of his to work, in response to which the chimera pats his desk invitingly. You take the offer, hauling yourself up ");
	if (pc.legCount > 1)
	{
		if (pc.legCount > 3 || !pc.hasLegs()) output("and position your lower body to sit in front of him.");
		else output("and swinging your legs around to sit in front of him.");
	}
	else output("after slithering around so your coils drape across his.");
	output(" Two hands take hold of your hips, while two more set to relieving you of your gear so that you’re left completely nude.");
	
	var i:int = -1;
	
	if (pc.hasCock() && (pc.blockedVaginas() >= pc.totalVaginas() || rand(2) == 0))
	{
		i = pc.biggestCockIndex();
		
		output("\n\nThe chimera’s breath is hot against your [pc.cockHead " + i + "] as he examines your cock up close. You feel the tip of his tongue flick over your cumslit, circling around it in a display of oral dexterity that has you hungry to feel what it’s like to be buried in his mouth. Lessau isn’t ready to let you have that yet, though. Instead he runs his tongue down your shaft all the way to the [pc.base " + i + "], taking a few sweeping licks of the sensitive underside. ");
		if (pc.hasStatusEffect("Genital Slit")) output("You gasp when his tongue suddenly delves into your cock’s normally untouched container, teasing it open to let a wave of your masculine musk billow forth from the depths of your slit.");
		else if (pc.hasSheath(i)) output("You gasp when his tongue suddenly delves into your cock’s normally untouched container, teasing it open to let a wave of your masculine musk billow forth from the depths of your sheath.");
		
		if (pc.cocks[i].cType == GLOBAL.TYPE_HUMAN) output("\n\n<i>“A touch vanilla for my tastes, [pc.name].”</i> Lessau says with a teasing smile as he draws back. <i>“Though I cannot deny that you work quite well with it, as I’m sure you would with anything else you chose to bear between your legs.”</i>");
		else output("\n\n<i>“A fitting choice of shape, [pc.name].”</i> Lessau says as he draws back, licking his lips. <i>“You have excellent tastes, though I imagine you would be just as delicious with anything you chose to wield.”</i>");
		
		output("\n\nWith not a further word he opens his jaws and swallows your shaft. There’s a moment of fright at his fangs, but they prove safer than they appear - or perhaps the doctor is just that experienced at sucking dick. Any hesitation vanishes when that tongue wraps itself around you in a tight spiral, licking and sucking at every inch of your [pc.cockNoun " + i + "] that disappears down the chimera’s gullet until his nose is pressed to your belly. You give a heady groan, letting yourself go limp and just enjoy the hot, wet sensations wreathing your dick.");
		output("\n\nYour relaxation is interrupted by a gasp of surprise as Lessau’s tongue slips out from under your dick to get at ");
		if (pc.balls > 0) output("your balls. The way the tip feels when it caresses your sack is absolutely heavenly, each brush feeling like it stimulates your nuts to churn faster, get even more ready with the cum that’s quickly forming into a thick pressure just behind your dick, one you strive to hold back just a little longer.\n\n")
		else output("the patch of smooth [pc.skinFurScalesNoun] that sits just below. You don’t immediately grasp why until he digs his tongue in at just the right angle and you suddenly feel a glorious pressure on your prostate, a stimulating sensation that feels like it spurs your body onward into making even more cum, getting even more ready for when you can’t hold it in anymore.\n\n");
		
		if (pc.hasVagina()) output("But Lessau’s not done stimulating you yet. His tongue slips lower, into the feminine folds sitting under your cock. The sheer length and dexterity of it makes it almost like a tentacle as it probes your pussy without interrupting the suction on your dick for even a second. Gods, being sucked off and eaten out at the same time is amazing! ");
		output("You find yourself gripping Lessau’s mane, ");
		if (pc.tongueType != GLOBAL.TYPE_HUMAN) output("your own exotic tongue hanging out of your mouth as you’re left ");
		output("panting in an effort to hold out just a bit longer.");
		
		output("\n\nFinally you cum, letting out a long, loud groan as you fill the chimera’s mouth with your [pc.cumNoun]. "); 
		if (pc.cumQ() > 1000) output("Amazingly, ");
		output("Lessau swallows it all, gulping down your seed with incredible suction."); 
		if (pc.cumQ() > 1000) output(" You can practically see each spurt working its way down his throat, with no apparent discomfort on his part. His stomach’s not even swelling, it all seems to just be disappearing down that marvelous gullet."); 
		output(" It feels like your " + (pc.balls > 0 ? "balls are" : "prostate is") + " completely drained by the time he lets go, the aching yet wonderful feeling of being totally spent."); 
		if (pc.hasVagina()) output(" Below your dick your pussy adds its own juices to the orgasm, making a puddle on Lessau’s desk that he’s quick to lap up in a rather feline manner.");
	}
	else
	{
		i = pc.pickUnblocked();
		
		output("\n\nLessau’s tongue starts at your delta, teasing the more sensitive [pc.skinFurScalesNoun] that sits just above [pc.oneVagina]. It’s just enough to tickle, leaving you off-guard for when he opens his mouth and blows a hot breath over your nether lips. Your " + (pc.totalClits() > 1 ? "clits pop" : "clit pops") + " out immediately, stiffening at the sudden warmth. That moment of vulnerability is all Lessau needs, and his tongue seizes [pc.oneClit] with a display of the oral dexterity that only a prehensile tongue can offer. His mouth envelops your clit, his fangs gently grazing your sensitive nub with an expertise that suggests more than a few of the female lab assistants outside have gotten to experience this before you.");
		output("\n\nLost in the pleasure, you hardly notice what Lessau’s tongue is doing until it slips into your pussy, drawing forth a gasp as that long, thin tongue snakes its way deep into those [pc.vaginaColor " + i + "] depths. His lips stay right where they are, sucking away at your clit while his tongue coaxes your [pc.girlCum] to the surface.");
		if(pc.wetness() > 2) output(" Your pussy is more than happy to oblige, of course, practically flooding in short order.");
		output(" You’re left with little to do but " + (pc.femininity < 50 ? "groan" : "moan"));
		if (pc.hasBreasts()) output(", fondle your breasts,");
		output(" and try to relax while awaiting the inevitable orgasm.");
		
		output("\n\nYet it doesn’t come. You get tantalizingly close, so close you can taste it, before the clit-sucking stops and Lessau’s tongue withdraws. You’re left quivering and confused, dialing down just a bit before the chimera lifts a hand and spreads your lips wide, baring the freshly glistening [pc.vaginaColor " + i + "] to the air.");
		output("\n\n<i>“A beautiful womanhood, [pc.name].”</i> Lessau says as he looks up at you with a glint in his eye that indicates he knows full well how close you were to cumming. <i>“" + (pc.vaginas[i].type == GLOBAL.TYPE_HUMAN ? "A little vanilla in form, but the taste is delectable" : "You’ve acquired quite the delicious endowment for yourself") + ".”</i>");
		output("\n\n<i>“You tease,”</i> you reply, <i>“get back in there!”</i>");
		output("\n\nHe does, almost. Certainly he delves back in, but rather than slipping into your pussy you feel his tongue run up the right side of your exposed snatch, then the left. Back and forth he licks, his tonguetip flicking your clit each time he switches sides. His fingertips stay in place, keeping you spread, keeping it easy for him to lick and suck at your petals while letting your [pc.girlCumNoun] flow freely. Gods, that tongue feels amazing");
		//"Vanae or otherwise cilia-laden pussy"
		if (pc.vaginaHasFeelers(i)) output(", especially when it teases your feelers");
		output("!");
		output("\n\nIt’s more than enough to cum from. You throw your head back in an exultant groan as your pussy clenches and turns even juicier, leaving a puddle on the doctor’s desk that he happily licks up in a way that makes him look even more catlike.");
	}
	
	output("\n\n<i>“I trust my care was to your satisfaction?”</i> Lessau asks, though a breathless nod is all the response you can muster. Once you’ve recovered, you reclaim your gear and give the doctor a kiss of thanks on your way out.");
	
	processTime(15);
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", drLessauMainMenu)
}

public function drLessauVag():void
{
	var x:int = pc.cuntThatFits(chars["DRLESSAU"].cockVolume(0));
	if(x < 0) x = rand(pc.totalVaginas());
	
	clearOutput();
	showLessau(true);
	
	output("You tell Lessau that you’re feeling a little itchy, letting a hand fall indicatively to your rapidly moistening nethers. You ");
	if (pc.hasCock()) output("can feel [pc.eachCock] stiffening, but right now you want to indulge your feminine lusts, and you "); 
	output((flags["DRLESSAU_SEXED"] == undefined ? "hope" : "know") + " the doctor can deliver the good, hard fucking [pc.eachVagina] needs.");
	
	output("\n\nWithin moments you find yourself wrapped in coils of thick ebony-scaled muscle as Lessau slips around his desk with astonishing alacrity. "); 
	if (pc.legCount < 2) output("You grin at him and wrap your own tail around his in turn to remind him that you’re also packing a sexy snake half. "); 
	output("The coils envelop you from the waist down, allowing Lessau’s hands to come up and relieve you of your gear.");
	output("\n\nTwo hands go to your [pc.chest], gently tracing their clawtips over your ");
	if (pc.skinType == GLOBAL.SKIN_TYPE_FUR) output("furry ");
	else if (pc.skinType == GLOBAL.SKIN_TYPE_SCALES) output("scaly ");
	output("chest with a purr of approval from the chimera. He " + (pc.hasBreasts() ? "gives your breasts a light squeeze" : "caresses the muscles") + ", his claws having just the right level of sharpness so that they’re not painful but rather deliciously stimulating.");
	
	//flat or small breasts
	if (pc.biggestTitSize() <= 3)
	{
		if (pc.biggestTitSize() >= 1 && pc.mf("m","f") == "f") output("\n\n<i>“Quite cute.”</i> Lessau cups your breasts in his upper hands, letting his palms rub against your [pc.nippleColor] nipples. <i>“Nice and light and perky, the perfect size for an adventurous sort like yourself.”</i>");
		else output("\n\n<i>“Very nice, [pc.name]. You take good care of yourself.”</i> Lessau traces your muscles with his fingers, admiring the " + (pc.tone >= 60 ? "firm, hard musculature on display" : "svelteness of your frame") + ".");
		output(" His lower hands are left free to roam, and roam they do, running along your sides and tracing the " + (pc.hipRating() >= 6 ? "lithe" : "thick") + " curves of your hips. The chimera’s claws are just as gentle here as their counterparts up top, even when he gives your ass a smack to relish " + (pc.tone >= 60 ? "the firm crack of tight muscle" : "the plush softness of your backside") + ".");
	}
	//medium to large breasts
	else
	{
		if (pc.biggestTitSize() <= 6) output("\n\n<i>“Oh, these are quite lovely indeed.”</i> Lessau looks rather pleased at how he can lay both of his pairs of hands on your breasts at once with a little room to spare, giving them space to explore and caress your [pc.skinFurScalesNoun]. Fingertips brush your [pc.nippleColor] buds, drawing a torrid groan from your lips as the chimera shows just how precise he can be when touching your oh-so-sensitive aerolae.");
		else output("\n\n<i>“Certainly indulging, aren’t you, [pc.name]?”</i> Lessau seems delighted as he brings both sets of hands up to caress your exceptional breasts. One pair focuses chiefly on just hefting them a little as if weighing your tits, fingertips roaming along the undersides of your jiggling melons. The other pair stays higher, tracing your cleavage before slowly descending to the [pc.nippleColor] nips that sit proudly upon your chest. You arch your back a bit at the contact, which only serves to further press your breasts into those deliciously warm, furry hands.");
		if (pc.milkFullness >= 30) output(" Lessau lifts one of your jugs at the first drops of [pc.milkNoun] his attention to your nipples produces, taking your teat into his mouth for a long, slow suck. You shudder, your [pc.milkNoun] spilling forth at the coaxing of his lips and tugging of his tongue. He continues to fondle you even as he sucks, four wonderful hands teasing and stroking and making you oh so sopping <i>wet</i>.");
	}
	
	output("\n\nYou hardly notice the chimera preparing to mount you until he pushes inside. It’s monstrous: the head is blunt and flared like a horse’s, but the flare is formed of a ring of soft, rubbery barbs that grip and dig into each and every fold you have on the way in. Your pussy lips clamp tight around the shaft as they swallow the head, ");
	if (pc.vaginas[x].looseness() >= 4) output("even a gaped cunt like yours ");
	output("stretched in a wonderful way by this beast’s big, fat, animalistic cock. Lessau for his part growls in pleasure, taking it slow for the first few inches before a good firm thrust crams his dick in down to the barbed medial ring. You gasp, the barbs catching your " +(pc.totalClits() > 1 ? "clits between them and rubbing them" : "clit between them and rubbing it") + " from both sides every time either of you move your hips even slightly. He pauses here for a bit just to enjoy the sounds you’re making and let you settle down a little bit, before another thrust pops that ring of barbs into your soaking twat along with another few inches of chimera cock.");
	
	pc.cuntChange(x,chars["DRLESSAU"].cockVolume(0),true,true,false);
	
	output("\n\nSoon you feel his tip kiss your innermost lips, the concave head fitted perfectly to your cervix. But there’s still an inch to go, and as it slides in that kiss turns into a glorious pressure upon your womb. You tilt your head back and let out an exultant " + (pc.femininity < 50 ? "groan" : "moan") + ". Lessau for his part seems to be having difficulty maintaining his usual cultured tone, descending into bestial growling");
	if (pc.milkFullness >= 30) output(" that sends wonderful vibrations rolling along your tit");
	output(". You can’t help but grin, proud of having such an effect on him.");
	
	output("\n\n<i>“Thaaaat’s it, you beast,”</i> you purr, <i>“now <b>fuck</b> me!”</i>");
	output("\n\nLessau’s perfectly happy to obey");
	if (pc.milkFullness >= 30 && pc.biggestTitSize() > 3) output(" as he lets go of your tit to growl");
	output(", drawing his hips back until his medial ring pops out and then ramming all the way back in. His barbs are perfectly placed along his cock so that every single inch of your cunt gets raked by them. You howl in ecstasy at the sensation, answered with a snarl from Lessau. The next thrust comes quickly as he starts fucking you fast and hard, ravaging you with his monster dick and gripping you with new roughness that stops just shy of his claws digging in. The intelligence in his eyes is gone, clouded over with a thick fog of animal lust, all of it focused on rutting your pussy until you won’t be able to [pc.walk] straight for days after this. You laugh, relishing the way you’ve turned a brilliant scientist into a savage monster through the power of your pussy.");
	
	output("\n\nNot that you’re much different from him after the first round of spunk hits your cunt. It’s thick, it’s gooey, and it’s very, <b>very</b> plentiful. You gasp in delight at the first surge filling your womb to the brim, croon at the second as it blooms into a pleasant stretching, and let out a shuddering groan at the third as your stomach begins to bulge outward. Four, five, " + (flags["DRLESSAU_SEXED"] == undefined ? "how much is he going to <b>cum</b>?" : "fuck <b>yes</b>, more, <b>more</b>!") + " Your hands go to your belly as it swells into a thick pregnant bulge, mercifully stopping when it’s the size of a volleyball.");
	if (pc.hasCock()) output(" Your cock spurts without even being touched, painting both of your fronts in [pc.cumColor].");
	
	output("\n\nYou only have a moment to relax, though, before the chimera starts again. You gasp in shock at this, squirming, but his tail has you trapped tight");
	if (pc.legCount == 1) output(", and you’ve gotten tangled up with him in your earlier pleasure, now unable to untie yourself on your own");
	output(". Lessau’s savage state hasn’t subsided in the least, and he plows you harder than ever. That flared head serves as a perfect seal to keep all his sticky seed buried deep in your cunt, not allowing even a single drop to escape. You couldn’t focus on getting it out ");
	if (flags["DRLESSAU_SEXED"] >= 1) output("even if you wanted to ");
	output("anyway, not with the barbs raking your pussy, stimulating it into gripping that cock even harder.");
	
	output("\n\nThere’s no words from either of you this time, merely the sounds of grunting and growling and " + (pc.femininity < 50 ? "groaning" : "moaning") + " as you find yourself well and truly rutted. Nor is there much warning that you’re going to be filled again, not until the beast fucking you snarls and slams his cock all the way to the hilt, pressing his cumslit against your inner lips. The second load builds on the first, each spurt making your stomach swell a little further until you’re looking positively gravid. You let out " + (flags["DRLESSAU_SEXED"] == undefined ? "an insensate groan, feeling limp. You only have just long enough to think to yourself that you might have bitten off more than you can chew before he starts on round three..." : "a lusty purr, reaching around his back to tease him onward, ready for round three..."));

	processTime(15);
	if (pc.milkFullness >= 30) pc.milked(100);
	pc.loadInCunt(chars["DRLESSAU"],x);
	pc.loadInCunt(chars["DRLESSAU"],x);
	pc.loadInCunt(chars["DRLESSAU"],x);
	pc.orgasm();
	
	clearMenu();
	addButton(0,"Next",drLessauAfter)
}

public function drLessauAfter():void
{
	clearOutput();
	showLessau();
	
	if (flags["DRLESSAU_SEXED"] == undefined)
	{
		output("You wake up being cradled tenderly in a warm embrace of fur, scales, and feathers. You open your eyes to find yourself in Lessau’s arms, the chimera nuzzling your [pc.hair].");
		output("\n\n<i>“Are you alright, [pc.name]?”</i> he asks, to which you nod. He relaxes his hold at this, allowing you to look down. You’re still pretty stuffed, and it seems like his seed is particularly thick and sticky, so it’s only coming out in a slow trickle despite your inflated midsection.");
		output("\n\n<i>“I must apologize. When I’m excited my instincts can sometimes get the best of me. I’m well-trained in keeping anger under control, but lust... not so much.”</i>");
		
		output("\n\n<i>“" + (pc.isAss() ? "Well shit" : "Well") + ",”</i> you reply, <i>“can’t say you didn’t warn me.”</i> Your hand descends to your belly, rubbing it tenderly. <i>“" + (pc.isAss() ? "Goddamn, man, think you jizz enough?" : "I didn’t expect this much, though."));
		if (pc.hasCock() && pc.cumQ() > 1000) output(" Even I don’t always cum this much. I mean, I do sometimes, but still.");
		output("”</i>");
		
		output("\n\nLessau just laughs, letting you go once you can stand on your own.");
		output("\n\n<i>“I have a shower you can use. Fortunately my seed is water-soluble, so it should come out easily. I’d join you, but given your reputation I imagine that would swiftly turn counterproductive.”</i> That last statement comes with a teasing look, not that you can argue with him. None of the other lab techs seem all that surprised either to see you come out of Lessau’s office naked and looking pregnant as he shows you to the shower, promising to have your gear ready for you when you come out.");
		output("\n\nAs promised, holding the nozzle to your pussy soon turns the slow trickle of chimera cum into a flood. It’s enough that you’re pretty sure you cum again somewhere in there just from letting it all out. Even afterward you lean against the shower wall just to soak, the water’s blissful warmth something to cherish on this icy world.");
		output("\n\nEven after cleaning up and reclaiming your gear, you feel a little weak in the hips after such a rough fucking. That said, it <b>was</b> pretty fun. Maybe doing this again wouldn’t be such a bad idea.");
	}

	else
	{
		output("You lose track of how many times you let Lessau fuck you. By the time you’re done you look positively pregnant, stopping only because you’re both exhausted. The reprieve causes Lessau to come back to his senses, the animal lust in his eyes fading.");
		output("\n\n<i>“Are you alright, [pc.name]?”</i> he asks, reaching around you with his arms and wings to support you.");
		output("\n\n<i>“Fuck <b>yes</b> I am,”</i> you purr, running a hand along your gravid belly. A particularly kinky part of your mind fantasizes about having a thrashing monstrous spawn in there. <i>“" + (pc.hasCock() && pc.cumQ() > 1000 ? "Not every day I get to fuck someone who cums like I do" : "Void, you cum so much") + ", and honestly? Getting fucked by a monster is <b>awesome</b>.”</i>");
		output("\n\nHe seems pleased at you being so satisfied, giving you a kiss that you eagerly return. Your lips part just as you’re about to try slipping him some tongue, to your disappointment.");
		output("\n\n<i>“I think you’re at your limit, [pc.name].”</i> Lessau says with a mirthful smile. <i>“You should go clean up and clean yourself out first if you still hunger for more of this monster.”</i>");
		output("\n\nYou concede, making your way to the shower. You can’t help but " + (pc.exhibitionism() >= 33 ? "grin at" : "be embarrassed by the looks of") + " the lab techs as you walk by, most of whom blush or give thumbs-up. The" + (pc.exhibitionism() >= 33 ? " returned" : "") + " grins on the faces of the latter group tell you that you’re definitely not the only one getting some chimera action around here.");
		if (pc.exhibitionism() >= 66)
		{
			output(" Maybe you can get them to join in sometime, or at least watch you going at it with their boss. It’s good to get to know your");
			if(9999 == 9999) output(" future");
			output(" employees, after all.");
		}
		output("\n\nThe warmth of the shower soon soothes away the eager heat in your loins, leaving only the delicious ache that comes from being well and truly fucked. You’re definitely going to have to do this again sometime.");
	}
	
	processTime(45);
	IncrementFlag("DRLESSAU_SEXED");
	
	pc.shower();
	
	clearMenu();
	addButton(0, "Next", drLessauMainMenu)
}

public function steeleBiomedBusinessHours():Boolean
{
	return (hours >= 9 && hours <= 17);
}
public function steeleBiomedBonus():Boolean
{
	if(steeleBiomedBusinessHours())
	{
		output("Steele Tech’s biomedical division has a cozy office feel to it, white walls and dark wood paneling complementing the dark blue carpeting. A large holoprojector table dominates the center of the room, the large central display showing a planetary map with highlighted points of interest, while smaller displays ringing the edges of the table serve as personal consoles for many of the researchers. Other researchers are off in cubicles along the walls that provide a bit more privacy. Bookcases dot the walls; most are filled with textbooks, but you see a few shelves dedicated to tabletop gamebooks. You also notice that almost all of the researchers are modded to at least some degree, many heavily so. Most are women, though there are a few men as well.");
		output("\n\nAn office door along the south wall is currently open just a crack. Set to the right of the door is an embossed metal sign labeled with a small copy of the Steele Tech logo, below which is the inscription “Dr. Lessau, Head Researcher”.");
		
		if(flags["MET_DR_LESSAU"] != undefined)
		{
			if(pc.hasStatusEffect("BioMed Gangbang Cooldown")) addDisabledButton(0, "Gangbang", undefined, "Maybe you should give your employees some time to cool off before trying this again.");
			else if (pc.blockedVaginas() > 0) addDisabledButton(0,"Gangbang","Gangbang","A gangbang while you have part of your anatomy blocked is a bad idea.");
			else if (pc.hasVagina() || pc.hasCock()) addButton(0, "Gangbang", steeleBiomedGangbang, undefined, undefined, "Get to know your employees more intimately. You will end up with at least one cock inside you.");
			else addDisabledButton(0, "Gangbang", undefined, "You need a cock or vagina for this.");
		}
	}
	else
	{
		output("The Steele Biomedical offices are down to a skeleton crew at night. A few researchers have stayed late to work on their own projects, but most of the consoles are off or asleep. Even the ceiling lights are dimmed, lending the office a quiet feeling. The lights of the head researcher’s office, though, remain on even at this hour.");
	}
	
	return false;
}

public function steeleBiomedGangbang():void
{
	clearOutput();
	showBust("WALT_NUDE", "CYNTHIA_NUDE");
	showName("STEELE\nBIOMED");
	author("Couch");
	clearMenu();
	
	output("You glance around the room, licking your lips at all the exotic beauties on display. Why not let them get to know their");
	output(" future");
	output(" boss? Besides, you’re feeling ");
	if (pc.hasVagina() && pc.hasCock()) output("hard and wet");
	else if (pc.hasVagina()) output("wet and eager to fuck");
	else output("a little stiff");
	output(", and you think these brave scientists have what it takes to satisfy the craving in your loins.");
	
	if (flags["BIOMED_GANGBANGED"] == undefined) 
	{
		output("\n\nYou start by reaching for a cute-looking wolf boy - originally an ausar, you’re guessing - giving him a round of ear-scratching. The attention quickly causes him to look up after the initial shiver, right into a perfect view of your " + pc.mf("undercleavage", "chest and teasing smirk") + ".");
		output("\n\n<i>“Up for some fun?”</i> you ask as you keep your hand in place, continuing to scratch his ears. Your other hand reaches up to");
		if (!pc.isChestExposed()) output(" pull your [pc.upperGarments] away to bare your [pc.chest]");
		else output(" run along your naked [pc.chest] invitingly");
		output(", making it clear exactly what kind of fun you’re interested in. You cast your gaze around the room in an open invitation, hoping someone else will be bold enough to come forward. To your delight, you soon feel a pair of large, fur-covered hands slip under your arms to lay over your chest, and a pair of gigantic breasts squish against your back.");
		if (pc.hasWings()) output(" Ooh, <i>damn</i> that feels good against your wingpoints.");
		
		output("\n\n<i>“");
		if(pc.tone >= 60 && pc.biggestTitSize() < 1) output("Mmm, </i>nice<i> tone, boss.");
		else if (pc.tone < 60 && pc.biggestTitSize() < 1) output("Well now, this isn’t a build we see too often around here.");
		else if (pc.biggestTitSize() < 10) output("Now aren’t you a cutie?");
		else if (pc.biggestTitSize() < 20) output("Ooh, we got ourselves some big girls here.");
		else output("Hot damn, boss, you’re as big as they come, ain’tcha?");
		output("”</i> The voice of the girl pressed against your back comes with a midwestern accent that makes you think of a New Texan, a thought given further support by the wet sensation against your back. You turn your head, seeing thick, muscular arms covered in dark brown fur and a fully bovine face grinning at you. <i>“Want a closer look?”</i>");
		
		output("\n\nYou nod, reluctantly letting go of the wolf’s ears to turn and properly face");
		if(!metCynthia()) output(" the giant of a minotauress");
		else output(" the giant minotauress, Cynthia");
		output(". She’s huge in every way: eight feet tall, biceps almost as thick as your head, and extravagant curves when it comes to bust and hips alike that manage not to look exaggerated thanks to how thick and buff she is. The thick black nubs sitting proudly upon her furry breasts are leaking trickles of creamy milk, prompting you to go in for a drink. The primal moo it elicits from the minotauress is every bit as delicious as the milk itself, one of those meaty arms slipping around your back to hold you in place.");
		if(!metCynthia())
		{
			output("\n\n<i>“New Texan?”</i> you ask between gulps, prompting the minotauress to smirk.");
			output("\n\n<i>“Not even close, boss. What, you think those bimbos are the only cowgirls out there? Naw, I just like being big and beefy. And-”</i> She’s briefly cut off by giving a long, exultant moo as you give her teat a particularly firm suck.");
		}
		else output("\n\nShe gives a long, exultant moo as you give her teat a particularly firm suck.");
		output(" <i>“Oh yeah... having udders is just the </i>best<i>.”</i>");
	}
	
	else
	{
		output("\n\nYou slip under the table at an unoccupied spot, making your way around to where Walt is sitting. The wolf is distracted by his work until he feels your hands unzipping his pants, prompting him to look down.");
		
		output("\n\n<i>“Shush,”</i> you whisper, putting a finger to your lips. He complies for the moment, allowing you to open his fly and get a taste of his sheath. He’s deliciously musky compared to an ausar, so much so that you can practically taste it when you slip your tongue inside his sheath, earning a lupine growl from Walt. Soon his shaft begins to emerge, all eight inches of red meat brimming with that wonderful masculine scent. You bring your tongue up in a long sweep from his knot to his tip");
		if (pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output(", followed by briefly spiraling it around his dick, quietly laughing at the way he shudders");
		output(".");
		
		output("\n\nSoon you set to blowing him properly, enjoying the rich, primal taste of canine cock, not to mention the way Walt has to increasingly struggle to keep his composure. One of his hands slip under the table to run his fingers " + (pc.hasHair() ? "through your hair" : "across your head") + ", gently scratching just like you would to him. You continue unabated, driving him to further growls and whines that more and more risk blowing your cover. You look forward to it, of course, not relenting until you get a proper cumming howl out of Walt. All thoughts of being caught disappear under the flood of canine cum that fills your mouth, making you focus entirely on swallowing gulp after hot, sticky gulp.");
		output("\n\nWhen you’re finished you open your eyes to see Walt looking up, Cynthia looking down at the two of you with a teasing smirk.");
		output("\n\n<i>“Told you you could just ask if you wanted to fuck us again, [pc.name]. No need to sneak around.”</i>");
		
		if (pc.isNice()) output("\n\nYou give a sheepish grin")
		else if (pc.isMischievous()) output("\n\n<i>“Aw, but sneaking’s fun sometimes,”</i> you reply");
		else output("\n\n<i>“I do what I want,”</i> you reply");
		output(" as you emerge from under the desk, swallowing to get most of the dregs of wolf cum out of your mouth. This prompts a laugh from the minotauress, who promptly wraps one of those massive arms around your back and pulls you in against her chest.");
		
		output("\n\n<i>“Alright, then, why don’t you wash that jizz down?”</i>");
		output("\n\nYou quickly accept the invitation, wrapping your lips around one of those fat black teats and setting to gulping down that delicious cowgirl milk. Cynthia lets out a lusty moo, her hands roaming along your body to start stripping you of your gear.");
		output("\n\n<i>“Thaaaat’s it, [pc.name]... oh yeah, suck my udders just like that.”</i>");
	}

	processTime(10);
	clearMenu();
	addButton(0, "Next", steeleBiomedGangbangII);
}

public function steeleBiomedGangbangII():void
{
	clearOutput();
	showBust("WALT_NUDE", "CYNTHIA_NUDE");
	showName("STEELE\nBIOMED");
	author("Couch");
	
	output("Distracted by your indulgence, you give a muffled grunt of surprise as " + (!metWalt() ? "the wolf" : "Walt") + " slips your remaining gear off to get at your [pc.hips]. A sweep of his tongue along your [pc.vagOrAss] makes you shiver, prompting him to keep going, each lick digging a little deeper in.");
	output("\n\nMore of their coworkers join in now, assisting " + (!metCynthia() ? "the minotauress" : "Cynthia") + " with going for a feel of your [pc.chest], your ass, ");
	if(pc.hasTail()) output("your tail" + (pc.tailCount > 1 ? "s":""));
	output((pc.hasWings() ? "your wings, " : "") + "any and every part of your body. There’s scales, fur, even downy feathers stroking your body, surrounding you on all sides with colors and forms of all varieties. Stars, everyone here is just so exotic!");
	output("\n\n<i>“Alright, alright, let’s not crowd " + pc.mf("him", "her") + ",”</i> the minotauress says after a bit of this. <i>“You’ll all get a turn, let’s do this all nice and orderly-like.”</i> She looks down at you with a grin as the rest of her coworkers draw back a bit."); 
	if (!metCynthia()) output("<i>“Name’s Cynthia, by the way. Pleasure to meet you, boss.”</i>");
	
	output("\n\nAt her command, one of the scientists switches off the central display to leave the table bare. Cynthia pulls you down onto the table, your head resting comfortably on those pillowy cowtits. Her hands slide down to spread both your legs and hers.");
	output("\n\n<i>“Alright, boys and girls,”</i> you say with a broad grin of your own, <i>“come and get it!”</i>");
	output("\n\n" + (!metWalt() ? "The wolf boy from before" : "Even though he just came, Walt") + " is the first to mount you, cramming his cock deep into your waiting [pc.vagOrAss] with an open howl. You gasp in delight, clenching reflexively around him as he starts fucking you with firm, steady strokes. Each thrust plunges to exactly the right depth that you feel that knot stretch you even wider every time he bottoms out, teasing at popping inside but never quite taking that last step that would lock you up for anyone else to enjoy.");
	output("\n\n<i>“Ooh, good boy,”</i> you purr, <i>“fuck me just like that. Give me that dirty dog dick!”</i>");
	output("\n\n<i>“Yes " + pc.mf("sir", "ma’am") + ",”</i> he replies" + (!metWalt() ? ", the first words you’ve yet heard from him" : "") + ". <i>“I’ll do my best.”</i>");
	output("\n\n<i>“" + (!metWalt() ? "That’s Walt, by the way." : "That boy’s got some awesome stamina.") + "”</i> Cynthia whispers as her hands slide back up to your chest, " + (pc.biggestTitSize() < 1 ? "caressing your muscles" : "kneading your tits") + " while you lie back and enjoy the fucking. You can see more lining up behind him, both the remaining boys and quite a few dick-wielding girls.");
	output("\n\nIt’s not much longer before Walt cums, filling you with that deliciously hot lupine spunk. You join him in howling, feeling his knot heat up and swell " + (pc.hasVagina() ? "just outside your pussy lips" : "right at the edge of your backdoor") + ". He certainly doesn’t lack for volume nor duration, jet after jet of creamy canine cum spurting into your waiting depths. It leaks freely from your [pc.vagOrAss] as he pulls out" + (pc.hasVagina() ? ", even flowing down to run over your tailhole as well" : "") + ". The next one quickly steps up, this one a lizard girl packing a pair of matching reptilian pricks. This time Cynthia gets to moo as one of the cocks goes into her waiting cunt, the other pressing into your freshly cum - lubed ass.");
	
	if (pc.hasCock())
	{
		output("\n\nAt the same time another girl, this one showing some scorpion traits, mounts you and starts rubbing [pc.oneCock] between her thighs. The anal plowing you’re getting from her coworker has a trickle of [pc.cumColor] drooling from your tip every time you feel that reptilian dick grind against your prostate, and she delights in scooping it up with a finger, rubbing your [pc.cum] all over your [pc.cockHead] until it’s thoroughly glazed.");
		output("\n\n<i>“Nice to meet you, boss,”</i> the scorpion-girl says with a wink as she lifts her hips to guide your cock into her waiting alien cunt, letting out a lusty groan as she slides down inch by inch. <i>“" + (pc.cocks.clength <= 12 ? "Mmmyeah, fill me up" : "Oh fuuuuuck, so big") + "...”</i> She’s laden with soft little barbs all along her tunnel, almost like a kaithirit’s cock in reverse.");
		if(pc.hasCockFlag(GLOBAL.FLAG_NUBBY)) output(" You can’t help but lick your lips at the sensation of her nubs flicking and grinding against yours every time she moves her hips.");
		if (pc.hasVagina()) 
		{
			output(" You notice her stinger is looking less and less like a weapon by the moment, revealing a sleek indigo cock concealed within.");
			output("\n\n<i>“Want me to use this on you while I’m riding?”</i> she asks as she notices your gaze on her tail. You give her a beckoning smirk, reaching past her and spreading your pussy lips. She’s quick to obey, curling her tail around and slipping it inside you with practiced ease. You give a groan of delight, relishing the rare opportunity to fuck and be fucked by the same person at the same time. Other herms are great, but they can’t give you this kind of experience.")
		}
	}
	
	else
	{
		output("\n\nAt the same time another girl, this one showing some scorpion traits, kneels over you and curls her tail around to in front of her. She licks and sucks on her own stinger, showing off how it conceals a sleek indigo-colored cock as big as the one plundering your ass right now.");
		if (pc.hasVagina()) output("\n\n<i>“Ready for some double penetration action, boss?”</i> the scorpion-girl asks with a wink as she curls her tail back around behind her. You just spread [pc.oneCunt] and give a beckoning smile, followed by a croon of delight as that tailcock plunges into your freshly-fucked cunt. The scorpion-girl looks proud at your reaction, her hands coming up to draw her hair back as her tail starts to fuck you in a steady rhythm.");
	}
	
	output("\n\nShe sets to working herself in time with the anal pounding you’re getting, while Cynthia has long since stopped trying to make introductions in favor of mooing away under you. You look up to see that two more of the scientists have come around to start sucking on her tits")
	if (pc.milkFullness >= 30) output(", just before two more start doing the same for you. You let out an exultant moo of your own, your new attendees gulping down every last drop of [pc.milkNoun] you have to give");
	output(".");
	
	output("\n\n<i>“Oh yeah,”</i> Cynthia moans, <i>“drink it </i>all<i>! You know how I like it, moo-ooooh yeah!”</i>");
	output("\n\n<i>“She really is a total milk slut,”</i> Walt says as he slips up beside you, running a hand along your side as he admires the two of you.");
	if (pc.milkFullness >= 30) output(" <i>“Looks like you are too, hm?”</i>\n\n<i>“Maaaybe,”</i> you reply with a wink, followed by a coo of delight at a particularly good suck. ");
	else output("\n\n");
	output("You reach over with an arm to pull Walt in for a kiss, setting to making out as you’re fucked" + (pc.milkFullness >= 30 ? ", sucked, and everything in-between" : "") + ". He quickly shows his experience working a muzzle, that strong canine tongue slipping dominantly into your mouth while his lips stay firmly pressed to yours, coaxing them open enough so that those on the sides of you are given a real show of your wet, sloppy, wonderfully savage kiss.");
	output("\n\nYou hardly even notice when the lizard-girl hisses, packing your ass with a fresh load of thick, sticky cum. It’s only when she pulls out that you glance past the pile already on top of you to see that there’s still quite a number waiting their turn. The less patient ones have started in on each other, filling the room with the sounds of sex. It’s music to your ears as you lounge back and get ready for the real reaming yet to come.");
	
	if (pc.milkFullness >= 30) pc.milked(100);
	
	processTime(30);
	clearMenu();
	addButton(0, "Next", steeleBiomedGangbangIII);
}

public function steeleBiomedGangbangIII():void
{
	clearOutput();
	showBust("WALT_NUDE", "CYNTHIA_NUDE");
	showName("STEELE\nBIOMED");
	author("Couch");
	
	output("Hours pass before you rouse from your sexual stupor. You’ve fucked practically everyone in the room, most of them at least twice and some far more than that. " + (pc.hasVagina() ? "Both of your holes feel" : "Your ass feels") + " thoroughly used and your belly looks thick and pregnant, your stomach having long since given up on complaining about all the cum you’ve taken in your greedy lust. The desk under you is soaked and there’s still a multicolored river of a dozen different types of semen bubbling forth from between your legs.");
	output("\n\n<i>“Oof...”</i> you hear Cynthia groan from underneath you, her own belly somewhat less bloated than yours but still noticeably swollen with cum. <i>“Nothing like a good gangbang, huh boss?”</i>");
	output("\n\n<i>“" + (flags["BIOMED_GANGBANGED"] == undefined ? "You all can call me [pc.name]" : "I told you, call me [pc.name]") + ",”</i> you reply a little dreamily, still basking in the afterglow. Cynthia chuckles at this, managing to find the strength after a bit to ease the both of you to your feet.");
	output("\n\n<i>“Well then, [pc.name], let’s get you cleaned up before Lessau comes out here. He doesn’t mind if we fuck, but he’ll get pissed if we leave the place dirty afterwards.”</i> She takes a brief look around the room; most of her coworkers are cuddling with one another or have returned to their consoles as if they hadn’t just partaken in a massive orgy. <i>“The rest of you, this place had better be as neat as it was when [pc.name] came in here by the time I get back.”</i>");
	output("\n\n<i>“Yes ma’am,”</i> Walt replies, setting the rest of the team to work as you’re escorted to take a shower with the beefy minotauress. Cynthia lets out one last moo when she squeezes the overflowing cum out of her womb, a high-pressure torrent of spunk spraying from her cunt and into the shower drain while she leans heavily against the wall. You opt to take it slower, having plenty of time to let yourself drain while you clean up all the cum, milk, and feminine juices that you’ve been doused with all over. It takes long enough that by the time you’re done you almost feel like going for another grab of those cowtits, but Cynthia folds an arm over her chest just when you’re about to try.");
	output("\n\n<i>“Sorry, [pc.name], I’m tuckered out. Even these milk tanks need to refill every now and then. Tell you what, though: you want to have a party like this again, all you gotta do is ask. Pretty sure there won’t be a girl or guy in the house who’s not up for it.”</i>");
	output("\n\nIt’s an offer you’ll definitely have to consider, even as you reclaim your gear from an office that looks just as pristine as when you first came in. It’s enough to leave you wondering just how often they get it on if they’re that good at cleaning up from it. It’s definitely a bit of corporate culture you’ll have to see about spreading, leaving you with renewed vigor to continue your journey and earn that title.");
	
	if (pc.hasVagina()) 
	{
		for (var x:int = 0; x < pc.totalVaginas(); x++) 
		{	
			pc.cuntChange(x, waltCockVolume())
			pc.loadInCunt(undefined, x)
		}
	}
	pc.buttChange(waltCockVolume());
	pc.loadInAss(getWaltPregContainer());
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.exhibitionism(2);
	IncrementFlag("BIOMED_GANGBANGED");
	pc.createStatusEffect("BioMed Gangbang Cooldown",0,0,0,0,true,"","",false,720);
	processTime(140);
	clearMenu();
	addButton(0, "Next", mainGameMenu)
}
//unlocks the elevator for the deepsea lab quest
public function drLessauResearchShaft():void
{
	clearOutput();
	showLessau();
	var frostwyrmWins:int = 0;
	if (flags["FROSTWYRM_VICTORY_COUNT"] != undefined && flags["FROSTWYRM_VICTORY_COUNT"] > 0) frostwyrmWins += flags["FROSTWYRM_VICTORY_COUNT"];
	
	output("You ask Lessau about the sealed research shaft you’ve seen. The mention of it makes Lessau noticeably nervous.");
	output("\n\n<i>“That was sealed just before you arrived, in fact. We’re waiting on a hazard team to arrive to address the situation.”</i>");
	output("\n\n<i>“Oh? What situation?”</i> you ask, your curiosity now piqued. Lessau freezes, growls at himself, then sighs.");
	output("\n\n<i>“A short time before you arrived, there was an accident that damaged the casing of one of our deepsea facility’s power conduits. That in itself was an inconvenience, if a hazardous one to the native life. However, before it could be repaired it drew the attention of one of the native bioforms, a minor predator of small fish, that began feeding on the electricity from the exposed conduit. Within minutes it bloated to enormous size and broke into the facility to begin drawing on the generator directly. We managed to evacuate, but as we did Typhon, the station’s AI, reported that he was being attacked as well. I don’t know what kind of condition he or the facility are in now. All reports from down there have stopped.”</i>");
	output("\n\nYou ask if you can go down to check it out yourself. You <i>are</i> kind of in the adventuring business, after all. Lessau looks aghast, even if he’s not surprised.");
	output("\n\n<i>“Absolutely not! We have no idea what the situation is down there, it would be insane to let you go.”</i>");
	output("\n\nYou point out that if the creature was growing that rapidly, they might not have time for the hazard team to arrive now. You’re here now, and you’re pretty undeniably badass.");
	if (frostwyrmWins > 0)
	{
		output(" You beat the frostwyrm, after all.");
		if (frostwyrmWins > 1) output(" " + num2Text(frostwyrmWins,true)+ " times!");
	}
	output(" Lessau sighs at this rationale.");

	output("\n\n<i>“Just like your father...if you’re going to go, make sure you bring some kind of thermal or freezing weaponry. The creature’s adapted to the ocean floor, it will be used to relatively stable temperatures compared to most life on this planet. I’ll authorize you for permission, but be warned that you likely won’t be able to return until you’ve dealt with the situation. Stay safe, [pc.name], I have no desire to lose you over this.”</i>");
	output("\n\nYou assure Lessau that you’ll be fine, giving him a thumbs-up as you leave his office. Time to go check out the research shaft.");
		
	flags["UVETO_DEEPSEALAB_QUEST"] = 1;
	
	processTime(5);
	
	drLessauTalkMenu();
}
//starts the frostwyrm tf quest
public function drLessauFrostWyrm():void
{
	clearOutput();
	showLessau();
	
	output("You ask Lessau about the frostwyrm, the planet’s apex predator.");
	output("\n\n<i>“Ah, those...I can’t tell you how much I’ve wanted a blood sample from them. Unfortunately, based on what native legends say of it, the blood crystallizes shortly after being exposed to the air, or on the creature’s death the moment its psionic field breaks down. We know it possesses an enormous amount of savicite in its bloodstream, and its DNA would be immediately ruined by the crystallization. In order to get a sample you would have to subdue...one...alive.”</i>");
	output("\n\nThe chimeric doctor trails off and sighs, using one of his hands to facepalm. <i>“And now you’re going to go do it, aren’t you.”</i>");
	output("\n\nYou just whistle innocently.");
	output("\n\n<i>“Well, I certainly can’t stop you, so here.”</i> Lessau taps at his console for a few moments, summoning a drone which hands you an object a bit like a metal frisbee with a glass dome in the middle. <i>“Take this sample extractor. Apply it to an open wound and let it fill up, it will extract the blood sample and apply regenerative foam to the injury. Hopefully that will keep it somewhat pacified. If you do decide to face it, be careful. I would hate to lose you over this.”</i>");
	output("\n\nYou tell the doctor that you’ll do your best, putting the extractor away.");
	output("\n\n");
	
	flags["LESSAU_FROSTWYRM_QUEST"] = 0;
	pc.createKeyItem("Blood Extractor", 0, 0, 0, 0, "");
	processTime(5);	
	drLessauTalkMenu();
}
//give the frostwyrm sample to get the tf created
public function drLessauFrostWyrmGiveSample():void
{
	clearOutput();
	showLessau();
	
	output("You place the filled extractor on Lessau’s desk as you walk in, a triumphant grin on your face. Lessau for his part looks downright stunned.");
	output("\n\n<i>“You continue to amaze me, [pc.name].”</i> Lessau manages after a bit. <i>“I’ll have this looked at right away.”</i>");
	output("\n\nYou also inform Lessau about the frostwyrm’s telepathy, which if anything is even more shocking to him than the blood sample.");
	output("\n\n<i>“You mean to tell me these creatures are sapient? No hunter has had communication with a frostwyrm before now, we’ve only been able to guess at their level of intelligence. If they can communicate at a humanoid level, it changes things greatly.”</i>");
	output("\n\n<i>“I’m sure the whole team will be ecstatic to work on this project, but we will need some time to process the sample and develop a transformative agent. I’ll ensure you’re notified immediately.”</i>");
	
	flags["LESSAU_FROSTWYRM_TFTIMER"] = GetGameTimestamp();
	flags["LESSAU_FROSTWYRM_QUEST"] = 2;
	pc.removeKeyItem("Vial of Frostwyrm Blood");
	processTime(5);	
	drLessauTalkMenu();
}
	
//does frostwyrm tf email need to be sent
public function drLessauFrostWyrmCheckToReceiveEmail(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	if (flags["LESSAU_FROSTWYRM_TFTIMER"] != undefined)
	{
		if (GetGameTimestamp() > (flags["LESSAU_FROSTWYRM_TFTIMER"] + (24 * 60)))
		{
			var timestamp:int = GetGameTimestamp() + deltaT;
			flags["LESSAU_FROSTWYRM_TFTIMER"] = undefined;
			flags["LESSAU_FROSTWYRM_QUEST"] = 3;
			flags["FROSTWYRM_TF_UNLOCKED"] = 1;
			
			resendMail("lessau_frostwyrm_tf", timestamp);
		}
	}	
}
//frostwyrm tf email
public function drLessauFrostwyrmTFEmail():String
{
	var eText:String = "";
	
	eText += "[pc.name],"
	eText += "\n\nI’m pleased to inform you that the clinical trials for Frostwyrm Ichor have begun, and the test subjects are delighted with the results. You can come acquire some from my office whenever you like."
	eText += "\n\nI’ve reached out to Anyxine about opening diplomacy with the frostwyrms in light of their sapient status. It may be difficult, not to mention dangerous, but their sheer power and what knowledge they may possess of this planet’s secrets make the possibility of an alliance too tempting to resist. If you discover any information that may be of assistance, feel free to speak to either of us about it."
	eText += "\n\nI’ve also sent a memo to corporate informing them of your contribution. They are very impressed with you, [pc.name]. Keep up the good work."
	eText += "\n\nDr. Lessau"
	eText += "\nHead Researcher, Uveto"
	eText += "\nSteele Tech Biomedical Division"
	
	return doParse(eText);
}