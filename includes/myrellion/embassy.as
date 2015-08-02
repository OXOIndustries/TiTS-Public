//The Embassy
public function theEmbassyBonusFunc():Boolean
{
	//JURO
	//=======================
	//First Time
	if(flags["MYRELLION_EMBASSY_VISITED"] == undefined)
	{
		flags["MYRELLION_EMBASSY_VISITED"] = 1;
		output("\n\nAs you enter the \"embassy\" - really a glorified aircraft hangar stuffed with desks, maps, and several disgruntled pioneers looking for entrance to the cities below - a tanuki-like kui-tan dressed in the familiar suit and tie of a U.G.C. government worker waves you over to his desk.");
		//[Kui-tan]
		clearMenu();
		addButton(0,"Kui-tan",approachUGCRepOnMyrel,undefined,"Kui-tan","The kui-tan at the desk seems to be in charge here. You'll need to talk to him to clear security, you reckon.");
		return true;
	}
	else addButton(0,"Juro",talkToAmbassadorJuro,undefined,"Juro","Speak with Juro, the kui-tan diplomat who greeted you when you first arrived.");
	//=========================
	//LYRALLA
	//=========================
	//Unmet
	if(flags["MET_LYRALLA"] == undefined)
	{
		output("\n\nA four-armed woman sits behind a cheap-looking desk, shuffling papers this way and that with one robotic hand. She keeps stealing glances at ");
		if(flags["MET_JURO"] != undefined) output("Juro");
		else output("the nearby kui-tan");
		output(".");
		if(flags["TALKED_WITH_JIRO_ABOUT_AMBASSADOR"] != undefined && flags["MET_LYRALLA"] == undefined) output(" She must be Lyralla, the gold myr ambassador he told you about.");
		addButton(1,"Gold Myr",approachingLyralla,undefined,"Gold Myr","Approach the gold myr diplomat.");
	}
	//Met
	else 
	{
		//Catch Her In The Act
		//Can proc any time after talk scenes make it clear she luuuuuvs Juro.
		if(lyrallaAndJuroInCloset())
		{
			//Room note: 
			if(flags["JURO_LYRALLA_CLOSET_SEEN"] == undefined) output("\n\nLyralla’s desk is empty, and Juro is nowhere to be found. Where could they be? You can faintly hear the occasional giggle emanating from a nearby storage closet.");
			//Repeat:
			else output("\n\nLyralla's desk is empty again, and Juro isn't in sight. They must have escaped to another sensuous closet rendezvous.");
			//[Closet]
			addButton(1,"Closet",catchLyrallaInZeAct,undefined,"Closet","Lyralla and Juro must be in there....");
			removeButton(0);
		}
		else 
		{
			output("\n\nLyralla is sitting behind her desk looking busy as always. You aren’t sure how she does it, but she manages to flash you a friendly glance with her red, cybernetic eye.");
			addButton(1,"Lyralla",approachingLyralla,undefined,"Lyralla","Approach the diplomat from Gildenmere.");
		}
	}
	return false;
}
public function lyrallaAndJuroInCloset():Boolean
{
	//Event enabled!
	if(flags["LYRALLA_AND_JURO_RELATIONSHIP_HINTED_AT"] != undefined)
	{
		//Is cooldown up? If so, no go.
		if(pc.hasStatusEffect("JuroXLyrallaCooldown")) return false;
		//Are they still in the closet from a previous proc? If so, yes.
		if(pc.hasStatusEffect("JuroXLyrallaActive")) return true;
		//Not currently in the closet and no reason not to be. 1/3 chance of starting it.
		if(rand(3) == 0)
		{
			pc.createStatusEffect("JuroXLyrallaActive", 0,0,0,0, true, "", "", false, 60);
			return true;
		}
	}
	return false;
}

public function juroDisplay(nude:Boolean = false):void
{
	author("Savin");
	if(!nude) showBust("JURO");
	else showBust("JURO_NUDE");
	showName("AMBASSADOR\nJURO");
}

public function approachUGCRepOnMyrel():void
{
	clearOutput();
	juroDisplay();
	flags["MET_JURO"] = 1
	output("As you approach, the ambassador adjusts his spectacles, which hang down from his high-sitting, rounded ears. <i>“Name and ship registration please,”</i> he says, extending a hand for your ship I.D. You give him your name and identification, which he quickly runs through a holo-terminal.");
	output("\n\n<i>“One of Victor Steele’s kids, eh?”</i> he muses as the data runs through. <i>“Ambassador Juro. Good to finally see someone coming through who knows what [pc.heShe]’s doing. Hopefully. I’ll make it simple for you, " + pc.mf("Mister","Miss") + " Steele: this planet’s at war. Our arrival has caused something of a cease-fire between the red and gold-colored locals, but we’re still very much on the brink of a global nuclear exchange. Whatever business you have here, I suggest you conduct it quickly before the peace process breaks down. Xenogen can try and muddy their hands in this all they want, but if you ask me this planet’s going to be glassed within the year.”</i>");

	output("\n\nHe sighs, a long-suffering escape of breath. <i>“If you want to get down to the myrmedion cities, you’ll need to talk to their ambassadors here to get the proper paperwork done: Lyralla with the gold myr,”</i> he points to a golden-plated myr female sitting at the desk beside his: she looks like she’s made of more chrome than chitin, with several cybernetic parts awkwardly bolted onto her natural armor. Quite out of place compared to the rest of the tech here. <i>“And Colonel Nehzara for the red myr,”</i> he points across the thoroughfare to an open side door, leading out to what looks to be a warehouse. A pair of armed, red-chitined myr women stand on either side of the entrance, clad in heavy trench coats and gas masks.");

	output("\n\nThe ambassador returns your credentials and tells you that you’re clear to go. <i>“Is there anything else I can do for you, " + pc.mf("Mister","Miss") + " Steele?”</i>");

	//Unlock Lyralla and Nehz from Embassy menu. - done automatically via flags["MYRELLION_EMBASSY_VISITED"] = 1; in theEmbassyBonusFunc()
	//Go to Ambassador Juro’s talk menu
	jurosTalkMenu(approachUGCRepOnMyrel);
}

//Repeat Talk, Ambassador Juro
public function talkToAmbassadorJuro():void
{
	clearOutput();
	juroDisplay();
	output("<i>“" + pc.mf("Mister","Miss") + " Steele,”</i> the kui-tan ambassador says, standing as you approach. <i>“What can I do for you?”</i>");
	jurosTalkMenu(talkToAmbassadorJuro);
}

public function jurosTalkMenu(currentFunc:Function):void
{
	clearMenu();
	//The Myr
	if(currentFunc == talkToJuroAbootTheNatives) addDisabledButton(0,"The Myr","The Myr","You just finished discussing that.");
	else addButton(0,"The Myr",talkToJuroAbootTheNatives,undefined,"The Myr","Ask Juro about the natives of the planet.");
	//The Fleet
	if(currentFunc == talkToJuroAboutZeFleet) addDisabledButton(1,"The Fleet","The Fleet","You just finished discussing that.");
	else addButton(1,"The Fleet",talkToJuroAboutZeFleet,undefined,"The Fleet","Ask Juro about the armed fleet waiting in orbit");
	//Ambassadors
	if(currentFunc == talkToJuroAboutHisAmbassadors) addDisabledButton(2,"Ambassadors","Ambassadors","You just finished discussing that.");
	else addButton(2,"Ambassadors",talkToJuroAboutHisAmbassadors,undefined,"Ambassadors","Ask Juro about his fellow ambassadors.");
	//Kui-Tan
	if(currentFunc == talkWithJuroAbootHisRace) addDisabledButton(3,"Kui-tan","Kui-tan","You just finished discussing that!");
	else addButton(3,"Kui-tan",talkWithJuroAbootHisRace,undefined,"Kui-tan","You have to admit, it seems strange that a relatively new race would be given a position as important as U.G.C. Ambassador.");
	
	if (pc.hasKeyItem("Orange Myr Data"))
	{
		if (currentFunc == talkWithJuroAbootOrangeMyr) addDisabledButton(4, "OrangeMyr", "Orange Myr", "You just finished discussing that.");
		else addButton(4, "OrangeMyr", talkWithJuroAbootOrangeMyr, undefined, "Orange Myr", "Talk to the kui-tan ambassador about the possibility of peace through genetic manipulation. Maybe the U.G.C. could help distribute the stuff for Steele Tech.");
	}
	
	addButton(14, "Leave", mainGameMenu);
}


//The Myr
//Ask Juro about the natives of the planet
public function talkToJuroAbootTheNatives():void
{
	clearOutput();
	juroDisplay();
	output("<i>“The myr?”</i> the ambassador says when you ask. <i>“You speak as if they’re one species. That’s a dangerous assumption on this world, likely to get you beaten in a back alley if nothing else. The Red and Gold Myr have a common ancestor, certainly, but they’ve evolved in markedly different ways. That both subspecies remain today is truly fascinating from a scientific standpoint. It’s the equivalent of the neanderthal and the Homo sapien evolving alongside each other on Earth, if you’ll accept the comparison. Only the neanderthals developed nuclear weapons.”</i>");

	output("\n\nHe chuckles at his own joke, though his smile quickly fades as an aide drops a stack of paperwork off on his desk. <i>“Damn. At any rate, they’re both fundamentally warlike, aggressive, and highly territorial - though the Gold Myr will say anything to the contrary. The </i>Red<i>s, on the other hand, would tell you that you don’t know the half of it. The Reds are certainly the aggressor state here: they unified some hundred years back under the flag of a military dictatorship before starting a campaign of conquest against the Golds seven years ago. The junta in charge of the Scarlet Federation - well, that’s the best translation we’ve come up with for the Red government, anyway - are fairly brutal by galactic standards, though they have done a remarkable job of keeping a primitive planet-wide society together. Better than humans or ausar could do at a point of comparable technological and societal development.");

	output("\n\n<i>“The Gold Myr have been fighting a strategic withdrawal since the opening salvo. They’ll claim the moral high ground at every opportunity, though they were the first of the two to use chemical weapons,”</i> the ambassador shakes his head sadly. <i>“Barbaric... absolutely barbaric. Fortunately for them, the only airfield on the planet large enough for the U.G.C.’s purposes was immediately on top of their capital. Were it not for that, I have a sinking suspicion that the Fleet wouldn’t have minded overmuch if the Reds finished what they started.”</i>");

	output("\n\nThe ambassador takes his glasses off and rubs one of the lenses on his suit, staring at the haze accumulating on them in the planet’s oppressive humidity. <i>“At any rate, both of myr races have attracted the attention of Xenogen, who are quickly taking control of the situation here on the planet. Both have interesting biological processes which the mega-corporations are keenly interested in. If only for that, we peacemakers have a duty to keep this planet from engulfing itself in nuclear fire, with the comforting guarantee that if we fail, the Fleet will avenge us on the few survivors of the native population.”</i>");

	output("\n\n<i>“Another note,”</i> he adds. <i>“Both races are entirely female-dominated. Males are an exceptional rarity on the planet, and to my understanding are kept solely for breeding purposes. ");
	output(pc.mf("<i>“I’ll caution you, some myr can become quite desperate for male attention. Especially Red Myr breeders. Walk softly, but carry a big stick, " + pc.mf("Mister","Miss") + " Steele.”</i>","<i>“You’ll fit in well enough, " + pc.mf("Mister","Miss") + " Steele, though be wary of the hierarchical society the myrmedion have developed. Unfamiliar females may not receive the most warm welcome.”</i>"));
	processTime(5);
	jurosTalkMenu(talkToJuroAbootTheNatives);
}

//The Fleet
//Ask Juro about the armed fleet waiting in orbit
public function talkToJuroAboutZeFleet():void
{
	clearOutput();
	juroDisplay();
	output("The kui-tan gives you a wry smirk. <i>“The humans have a charming expression for them... the ‘Sword of Damocles,’ I believe. Once Xenogen realized the potential for exploiting the locals - sorry, I mean, ‘investing in the success of more primitive species’ - they pulled enough muscle in Parliament to steam a small battle group into planetary orbit to ensure the safety of the embassy here. Or more accurately,”</i> he laughs, <i>“to ensure the local population doesn’t resort to weapons of mass destruction in their petty war while U.G.C. citizens are here on the planet’s surface. Both governments have been informed that if they do, whoever survives the nuclear fire has nothing to look forward to other than kinetic bombardment from the fleet.”</i>");
	output("\n\nHe shakes his head. <i>“Not the most diplomatic of approaches, but unfortunately necessary. Our first scouts arrived in the Myrellion system the very day the Scarlet Federation was intending to unleash their first salvo of nuclear weapons. Luckily for them, extraterrestrial contact temporarily took more of their interest than eradicating all life on the planet.”</i> With a sigh, the ambassador adds: <i>“Hopefully the prefab space station I’ve requested from Colonial Affairs will arrive before that changes. A Steele Tech model, I’d like to add.”</i>");
	processTime(2);
	jurosTalkMenu(talkToJuroAboutZeFleet);
}

//Ambassadors
//Ask Juro about his fellow ambassadors
public function talkToJuroAboutHisAmbassadors():void
{
	clearOutput();
	juroDisplay();

	output("<i>“Ah, of course. Planetary diplomacy is hardly an independent venture, is it?”</i> the kui-tan chuckles, rubbing at one of his raccoon-like ears.");
	output("\n\n<i>“I’m lucky enough to be joined by two myrmedion ambassadors, one from each of the two subspecies. They’ve been indispensable in keeping the peace process alive. Lyralla is our ambassador to the Council of Queens,”</i> he says, inclining his head to the cyber-modded Gold Myr in the desk nearest his. <i>“I haven’t asked for specifics since she arrived, but I’m led to understand she was injured in a rocket or artillery blast immediately after First Contact. One of the medical officers from the Terran command ship saw it happen, and was kind enough to have her brought aboard and repaired. Myr medical technology is somewhat more advanced than that of a comparable period in human history, but her injuries were well beyond the capabilities of the locals nonetheless. She volunteered to work at the embassy here, between physical therapy and cybernetic tuning.”</i>");
	output("\n\n<i>“Lyralla’s a good woman. Dedicated, effective, and otherwise pleasant to work with. In the event we succeed in our mission of peace here on Myrellion, I sincerely hope she’ll consider joining the Confederate Diplomat Corps.”</i> He smiles at that, casting an unprofessionally affectionate glance Lyralla’s way. She catches it and smiles back, though she’s quickly distracted by another offworlder. The ambassador continues: <i>“On the other hand, we have Colonel Nehzara, representing the Scarlet Federation. If I’m to understand correctly, she’s the daughter of one of the Supreme Commanders in the Federation’s ruling body, though I wouldn’t assume she reached this position via nepotism. If you believe her boasting, she led the capture of seventeen different Council-controlled cities and fortifications, not to mention defeating several Gold Myr regiments in close combat. If military acumen is what the Reds respect, then they certainly hold Colonel Nehzara in high regard.”</i>");
	output("\n\nThe kui-tan gives a wary look across the way, toward the Commander’s office. <i>“Of course, she and her government are holding the entire planet hostage, and she’s </i>very<i> well aware of the fact. Nehzara’s arrogant, ruthless, calculating. I’ll give her credit, though: she gets things done. I don’t want to look too deep into her methods, but whenever someone or something within the Federation threatens the peace process, she’s been quick to resolve the issue. More so than any of the Gold Myr I’ve worked with - even Lyralla.”</i>");
	output("\n\n<i>“Last but not least, we have the bothrioc ambassador, Ara Kei Enya. She... well, I’ll call her she, for ease of reference. Bothrioc don’t quite have genders as you and I understand them. She represents a goodly portion of her race, one of the many that live in the deeper warrens beneath myrmedion territory. Unlike the two warring factions, Ara Kei has had the presence of mind to attempt to unify her race in the face of extraterrestrial contact. Respectable, but her species is inherently solitary, and it will take a great deal of effort to reconcile that. Doubly so with the fractured nature of the planet as a whole. Still, it’s refreshing to see someone around here who understands that it is through unity, not dominance, that Myrellion can step onto the galactic stage.”</i>");
	output("\n\nHe chuckles. <i>“Of course, I say that while she’s one of the most famous dominatrixes on the planet, with a harem some few dozen strong. Still, the point stands, if shakily.”</i>");
	processTime(4);
	jurosTalkMenu(talkToJuroAboutHisAmbassadors);
}


//Kui-Tan
//You have to admit, it seems strange that a relatively new race would be given a position as important as U.G.C. Ambassador. 
public function talkWithJuroAbootHisRace():void
{
	clearOutput();
	juroDisplay();
	output("Juro chuckles, and adjusts the glasses stuck atop his short little nose. <i>“I’ll take that in the nicest possible light, and try not to be too offended. Yes, it’s true that the kui-tan are a relatively new race on the galactic scene, but given over a century of membership in the U.G.C., I think we’re more than up to the task of a little interplanetary diplomacy. Indeed, our home system had two inhabited planets with two different species. Not unlike the Myr, though happily we didn’t have any sort of land connection to worry about. No chance of war until well after we’d developed interplanetary flight, and by then our races were good enough friends by radio that it wasn’t an issue.”</i>");
	output("\n\nJuro shakes his head wearily, shuffling some of the paperwork piled up on his desk. <i>“At any rate, to answer your original question - or statement, as it were - I’m not ashamed to admit that my government has taken quite an interest in Myrellion. Enough of one to push the Confederate Diplomatic Corps to assign me here.”</i>");
	output("\n\n<i>“Why the interest?”</i> you ask.");
	output("\n\nHe shrugs in answer, taking a moment before saying, <i>“Understand that kui-tan have some of the highest virility rates of any sapient species in the galaxy, and that both sexes have what you would consider masculine genitalia and the ability to father children. Myrellion has a dangerous lack of males, and a generations-old reproductive problem that has rendered most females sterile, and the population in a constant state of decline. An issue made dangerously clear in what I will optimistically label the aftermath of a seven year long global conflict. Even if this office succeeds in preventing the locals from obliterating themselves, it’s entirely likely that the Myr will simply die out in a few generations regardless. Mass casualties from the conflict have left both factions on the brink of permanent degradation in their genetic pools. In short, Myrellion is a prime candidate for a kui-tan colony once stability is ensured between the local governments, and given Xenogen Biotech’s mutual interest here, could be both a profitable and pleasant planet within a few generations.”</i>");
	//[Next] [Myr Women]
	processTime(2);
	clearMenu();
	addButton(0,"Next",talkToAmbassadorJuro);
	addButton(1, "Myr Women", myrWomenTalkWithKuitanJuro, undefined, "Myr Women", "So what you mean is... the kui-tan are here to steal myrellion’s women?");
}

//[Myr Women]
//So what you mean is... the kui-tan are here to steal myrellion’s women?
public function myrWomenTalkWithKuitanJuro():void
{
	clearOutput();
	juroDisplay();
	//+Misch
	pc.addMischievous(2);
	output("Juro flushes darkly as you speak, quickly fidgeting with his glasses and trying to both sit down and shift his legs at the same time. <i>“Uh, well, you must understand that such an arrangement is beneficial both to the local population as well as for the kui-tan. We are best suited to helping the myr recover from their dwindling numbers, especially if Xenogen repairs the mass sterility that afflicts members of both factions. With my peoples’ help, the myr could be repopulated, or even be expanding, within the span of a generation or two.”</i>");
	output("\n\nYou chuckle at the flustered kui-tan’s answer.");
	addDisabledButton(1, "Myr Women");
}

//[Amb. Lyralla] (First Time)
//Ambassador Lyralla represents the Gold Myr Council here at the DMZ. You’ll need to talk to her to gain clearance into Council territory. 


public function talkWithJuroAbootOrangeMyr():void
{
	clearOutput();
	juroDisplay();

	output("<i>“I’d like to talk to you about something, ambassador,”</i> you say, bringing up McAllister’s data on your Codex.");
	
	output("\n\n<i>“Of course, "+pc.mf("mister","miss")+" Steele,”</i> Juro says, motioning to the seat across from him. <i>“What can I do for you?”</i>");
	
	output("\n\nYou smile and place your Codex on the desk between the two of you, and say that you’re more interested in what you can do for him - or rather, for Myrellion at large. The kui-tan’s black nose fidgets, and he adjusts his glasses while he picks up the Codex and starts to read.");
	
	output("\n\n<i>“Hmm, what’s this? I’m not scientist, but this appears to be genetics information. A comparison between red and gold myrmedions at the genetic level, and... ah, hybridity,”</i> he says, sighing slightly and setting your Codex aside. <i>“I met what you’ve deemed here an ‘orange’ myr once already since arriving on this planet. A Federation officer came into the medical center here in the demilitarized zone perhaps two weeks after the First Contact fleet arrived, seeking advanced medical aid, much as many other myr like her. I’d not have paid her any particular attention, if she had not been carrying a young child in her arms. Three years old, I would say, and bundled up in a blanket that hid all but her face.”</i>");
	
	output("\n\n<i>“While she waited for her turn with our doctors, this officer came to my desk and started talking to me. Again, I thought nothing of it at first: she questioned me about travel offworld, and the reception of alien races among my people, and other races in the Confederate core. Many myr have requested travel visas from us: I dare say the diplomatic corps will be backlogged with the them for years to come. She was, however, the first Federation officer I had seen ask - many, many gold myr and some red deserters had filed for passage offworld, but never a uniformed Federation officer. Curious, I asked her why that was.”</i>");
	
	output("\n\nJuro sighs and sits down, steepling his furry fingers. He’s silent for a moment, perhaps the longest pause you’ve heard the quick-talking ambassador take yet, before saying <i>“She had her child, a daughter, in her lap at that moment. I’ll never forget the sadness and fear in her face when she unbundled her: the girl had a body of dark orange plates, a shock of red hair, two arms... and her mother informed me, was a naturally-born hermaphrodite of some description. The child was, in the eyes of gold and red, an abomination. A mutation caused by unnatural union between the races. She told me she had been attacked several times since giving birth, that she feared for her child’s safety.”</i>");
	
	if (pc.isNice()) output("\n\n<i>“That’s horrible,”</i>");
	else output("\n\n<i>“Shit,”</i>");
	output("you say. <i>“What happened to her?”</i>");
	
	output("\n\n<i>“I arranged for her passage off world, diplomatic priority,”</i> Juro says simply. <i>“That’s beside the point, however. This formula... the people of Myrellion are not yet ready for integration. Neither the Republic nor the Federation would admit to it, of course. They both will claim they only want peace, that they have every intention of getting along with their sister race. But the fact of the matter is that hatred runs deep here, "+pc.mf("mister","miss")+" Steele. I’m afraid your orange myr solution will cause more harm than good, especially to the poor girls that take it. I have little desire to be the cause of a lynching.”</i>");
	
	output("\n\nYou grit your teeth and take your Codex back. <i>“Come on, ambassador, it can’t be that bad. If it was, why are you even bothering to try and help?”</i>");
	
	output("\n\nJuro scowls. <i>“Because I </i>do<i> have hope, "+pc.mf("mister","miss")+" Steele. But diplomacy is not an overnight achievement, and is certainly not achieved with some miracle drug that you presuppose to have any chance at impacting the generations of mistrust and disdain that has formed between two nations at war. I understand and appreciate your desire to help, "+pc.mf("mister","miss")+" Steele, but an idealistic and oversimplified view of the world is not going to do Myrellion any favors.”</i>");
	
	output("\n\nOuch.");
	
	output("\n\n<i>“Come on, ambassador. At least make it available to people. Even you have got to be able to see showing the myr how closely related they really are is a start towards peace. Sure, it’ll be a system shock to see hybrids out there, but the myr have got to find a common ground. Maybe an orange myr could be it.”</i>");
	
	output("\n\nJuro sighs and rubs at his temples. <i>“Doubtful, but... it would be unfair to the myrmidon not to give them that chance, I suppose. Please forward the data to my office, and I’ll ensure it makes its way to the medical staff here in the demilitarized zone. I make no promises for them, but I will at least make the data and whatever samples your company sends us available to the medical center.”</i>");
	
	output("\n\nYou smile and thank the ambassador, shaking his furry hand. At least that’s a chance for something better than war for Myrellion.");

	pc.removeKeyItem("Orange Myr Data");
	flags["MCALLISTER_MYR_HYBRIDITY"] = 4;

	jurosTalkMenu(talkWithJuroAbootOrangeMyr);
}