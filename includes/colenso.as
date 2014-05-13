//Conspiracy Colenso
//By Nonesuch

//Adjecent room
function colensosAdjacentRoomStuff():Boolean
{
	//First: 
	if(flags["BEEN_TO_COLENSOS"] == undefined)
	{
		output("\n\nTo the south is what appears to be the nest of an ancient air control tower, poking partially out of a rent in the side of the vast starship. Above its dark windows the faded white top of the octagonal structure bristles with satellites of all shapes and sizes, some of them squeaking rustily as they slowly turn. Someone has painted “COLENSO’S JUNK” on the outside in rough, red lettering. It almost looks like an afterthought.");
	}
	else output("\n\nThe sound of old satellites and radio masts groaning in the breeze is all you need to know you’re standing outside Colenso’s again. You could go inside and do some trading with the strange goblin.");
	return false;
}

function colensoMenu():void
{
	clearMenu();
	//[Buy] [Sell] [Prophylactics] [Rumours] [Work]
	addButton(0,"Buy",buyItem,undefined,"Buy","Buy something from Colenso.");
	addButton(1,"Sell",sellItem,undefined,"Sell","Sell something to Colenso.");
	addButton(2,"Prophylactics",askColensoAbootProphylactics,undefined,"Prophylactics","Ask Colenso what he means by \"Prophylactics.\"");
	addButton(3,"Rumors",colensoRumorMillGo,undefined,"Rumors","See if Colenso has heard any interesting rumors.");
	addButton(14,"Back",mainGameMenu);
}


function colensosRoomBonusFunction():Boolean
{
	shopkeep = chars["COLENSO"];
	//Go in first time: 
	if(flags["BEEN_TO_COLENSOS"] == undefined)
	{
		userInterface.showBust("COLENSO");
		userInterface.showName("\nCOLENSO");
		author("Nonesuch");
		flags["BEEN_TO_COLENSOS"] = 1;
		output("You approach the 5’ tall door of the structure. ");
		if(pc.tallness < 60) output("It's tiny by human standards, but you are rather taken by a portal which doesn’t require you to stand on tiptoe to reach the handle for once.");
		else if(pc.tallness < 80) output("You have to hunch yourself down to enter.");
		else output("This is going to be a serious ask. You crouch down and just about manage to squeeze yourself through, your back getting much more intimate with the top of the frame than you’d like.");
		output(" The interior is dull and close – the windows that ring the building bizarrely seem to be opaque on both sides. A motley collection of salvaged monitors and machines crowd the room from all sides, the air filled with their thrum, their cables slathered across the worn concrete. There seems to be a nexus of screens and lamps at the far end on the upper level of the tower; a narrow path through the looming mainframes leads in that direction. You carefully pick your way through the stuffy room towards the yellowish glare.");
		output("\n\nThere’s a small, squat shape sat in front of the dozen or so monitor screens up here, earnestly tapping away on one of four touch pads and keyboards, nestled into a large hollow of clothes and gutted machinery. It seems to be talking to itself.");
		output("\n\n“<i> – still not carrying the story. Have they been gotten to as well? After what happened over at TheTruth3000.net nothing’d surprise me. Gah!</i>” The goblin takes a distracted look up and starts when he sees you standing there. “<i>Bloody hell, you startled me. Who do we have here then?</i>” He squints at you interestedly. “<i>A customer? Or a U.G.C. Black Wing agent, come to find out exactly how much I know?</i>”");
		output("\n\nYou tell him you’ve never even heard of a U.G.C. Black Wing.");
		output("\n\n“<i>Course you haven’t,</i>” the goblin replies with a smile and an exaggerated wink. He has a round, good-natured face to go with his broad shouldered and fleshy frame, built like a green mini-fridge. He seems to be dressed entirely in some sort of thin, malleable metal paper, fashioned into a vest and helmet. His confiding tone seems permanently incredulous, as if the world at large never stops pleasantly outraging him. “<i>So let’s just pretend you’re a customer and I’m a simple scrap merchant who you can offload all your unwanted junk on and who can maybe offer you some prophylactics on the side as well. I can keep that song and dance up if you can. So what can ol’ Colenso do for you, eh?</i>”");
		colensoMenu();
		return true;
	}
	//Repeat: 
	else
	{
		author("Nonesuch");
		output("You ");
		if(pc.tallness > 60) output("squeeze");
		else output("pass");
		output(" through the control tower’s entrance and pick your way through the wheezing, chattering machinery to Colenso’s nest. Colenso looks up sharply from his monitors at your approach but smiles warmly when he sees it’s you.");
		addButton(0,"Colenso",approachColenso);
	}
	return false;
	
}

function approachColenso():void
{
	clearOutput();
	userInterface.showBust("COLENSO");
	userInterface.showName("\nCOLENSO");
	author("Nonesuch");
	output("“<i>’Ello [pc.name]. Come to prise some more information out of me, eh?</i>”");
	colensoMenu();
}

//Prophylactics
function askColensoAbootProphylactics():void
{
	//Cheese and overlay the buy menu with dis shit
	buyItem();
	clearOutput();
	userInterface.showBust("COLENSO");
	userInterface.showName("\nCOLENSO");
	author("Nonesuch");
	output("“<i>Prophylactics?</i>” you inquire with a raised eyebrow.");
	output("\n\n“<i>Yeah.</i>” Colenso indicates a shipping crate on the far side of his nest, filled to the brim with aerosol canisters of various colors. “<i>Got a mate who is well into experimental chemistry. He reckons it’s possible to create scents which most people can’t smell, but drive certain species away. He thought they might be useful to types who go exploring the wastelands. I think that’s what he was trying to say anyway, he was kind of on fire at the time.</i>” He squeezes his thumbs into his forefingers at you meaningfully. “<i>I know what you’re thinking, and you don’t need to worry. I personally scanned every single one to make sure there’s no micro spy-bots in ‘em. Dunno if they actually work, like. Please don’t spray the goblin one in here though, it smells bloody terrible.</i>”");

	//Note: Sexbots have a population control worked into the quest reward so don’t really need one of these.
}

//Prophylactic wears off: You pause. It feels like a pressure in your sinuses has lifted; it takes you a few moments to work out a smell you were barely aware of has dissipated. The prophylactic you were using has worn off.

//Rumours
function colensoRumorMillGo():void
{
	clearOutput();
	userInterface.showBust("COLENSO");
	userInterface.showName("\nCOLENSO");
	author("Nonesuch");
	if(flags["ASKED_COLENSO_ABOUT_HIS_THEORIES"] == undefined) 
	{
		output("Musingly, you tell the goblin that he seems very well connected.");
		output("\n\n“<i>I could tell you things that would make your hair turn wh");
		if(pc.hairColor != "white" && pc.hairColor != "silver" && pc.hairColor != "ivory") output("ite");
		else output("wh – even whiter");
		output(", " + pc.mf("mate","luv") + ",</i>” says Colenso seriously. “<i>And I don’t even care that you’re a secret government agent. You turning up is just proof that I’m getting to the bottom of the laquine hole. And maybe once you realise the extent of the stuff that’s going down in the galaxy, you’ll turn rogue for me and take ‘em down from the inside.</i>”");
	}
	//Repeat
	else
	{
		output("You ask Colenso if he’s heard any good rumours recently.");
	}

	//[Randomly selected. Could easily add more in the future]
	var choices:Array = [0,1,2,3,4,5];
	var select:int = choices[rand(choices.length)];
	if(select == 0) output("\n\n<i>\"Been picking up a lot of activity on the pirate band-waves around Tarkus,</i>” says Colenso, leaning back on his chair comfortably. “<i>Sounds like a crew of them are planning on severing the planet tie, trying to make off with one. Would be an apocalypse-level event if they did.</i>”\n\n“<i>You seem remarkably calm about it,</i>” you reply cautiously.\n\n“<i>Cos the goblin high command would never allow it to happen. They’ve constructed a laser kill-sat so accurate they’ll be able to burn the swine to a crisp within five feet of the tie without touching it at all. Course,</i>” he goes on darkly, “<i>once you’ve built and used technology like that, bit hard to put it away again afterwards, right? I’m already building a giant mirror to go over this place, and if I were you I wouldn’t get too chummy with any important raskvel in the future.</i>”");
	else if(select == 1) output("\n\n<i>\"Human spacer message boards are all going mental right now because the " + pc.mf("son","daughter") + " of an old frontier hero of theirs is supposedly voyaging out here to find " + pc.mf("his","her") + " dad’s long lost fortune.</i>” Colenso rolls his eyes at you, inviting you to join in with his incredulity. “<i>I’ve done a bit of due diligence on this Steele feller. There’s no way he could have had a kid at the age he’s said to have had, the guy’s DNA was practically soup by then. The way I hear it though, he did manage to knock some poor girl up – only thanks to the genes pumped into her the kid came out as green goo. Living, thinking, ‘orrible goo. So in shame he locked her away somewhere, then found some other young chump who looked roughly like him and brainwashed " + pc.mf("him","her") + " into thinking " + pc.mf("he","she") + " was his " + pc.mf("son","daughter") + " instead. Grafted his fingerprints on and everything. Whoever’s out there now is as much this Victor Steele guy’s " + pc.mf("son","daughter") + " as I am yours! Messed up, eh?</i>”");
	else if(select == 2) output("\n\n<i>\"They’re putting those V-KO units everywhere now. I bet you’ve met one yourself. Robot servants of a giant corporation that tend to you when you are at your most vulnerable. Every planet one giant Petri-dish for their newest experimental drugs.</i>” Colenso shakes his head sadly at the gullibility of the galaxy at large. “<i>You know they react to certain commands? Most folks just try and work out which ones will make them have it off with you. Me, I’m more interested what happens if you give em commands like “begin invasion”. Or “release virus”. Or “electro”.</i>”");
	else if(select == 3) output("\n\n<i>\"They still telling the one about the ausar creating the star gates in human schools?</i>” Colenso chuckles to himself merrily. “<i>It’s a good un. I mean if goblins had been the first ones out in space, we’d probably be saying everything we found out here that was super advanced was created by us as well. You’ve met ausar, right? Good doggies that want nothing more than someone to scratch ‘em behind the ear. I mean if they messed around with that kind of technology they’d probably wind up swapping their bollocks for fannies or something.</i>” The thick-set goblin taps one of his monitors meaningfully. “<i>The star gates were already out here, " + pc.mf("mate","luv") + ". The ausar just copied the design. Which raises the question: Who made them? Bloke I met online is convinced that it was a race of giant robot space fleas who return every 50,000 years or so to completely wipe us out. He’s got piles of evidence for it.</i>” He looks uncharacteristically embarrassed. “<i>I, er, reckon that might be a bit farfetched, though.</i>”");
	else if(select == 4) output("\n\n<i>\"You hear about them aliens whose males can become pregnant?</i>” says Colenso conspiratorially. “<i>Venarians and bruchandus. They say you can give em butt babies if you know how to treat em.</i>”\n\n“<i>You’re saying they don’t exist?</i>”\n\n“<i>Oh they exist, right enough. They ain’t aliens though; they’re humans. Some human supremacist on a remote space station is reshaping and brainwashing captives wholesale, intent on flooding the galaxy with Earthling genetic material. Over generations they will go back to looking like tan mammal beanpoles, and by the time anyone realises what’s going on they’ll be everywhere.</i>” He shakes his head admiringly at you. “<i>I got to hand it to your lot. Canny, ruthless ol’ species you belong to.</i>”");
	else if(select == 5) output("\n\n<i>\"You ever wonder why every race in the galaxy seems fixated with having it off with each other?</i>” says Colenso.\n\n“<i>Beats being fixated with killing each other,</i>” you suggest.\n\n“<i>Well yeah,</i>” replies the thickset goblin dismissively, “<i>but that would actually make sense, wouldn’t it? People tend to fear things that are different to em, not want to bang em rotten. It’s all a bit convenient, innit. Everyone being basically into the same kind of things, and having the right kind of equipment to stick into each other. Some races from planets thousands of light years apart can even interbreed! Completely ridiculous when you think about it even for a moment.</i>”\n\n“<i>And you have a rational explanation for it?</i>”\n\n“<i>Horny precursors,</i>” Colenso says, tapping the counter assertively. “<i>Piles of evidence for it. Probably the same guys who made the star gates. They seed the galaxy with genetically modified sentients that are the kind of things they like, crucially making sure none of em as smart as they are. Then they just wait for all their cute creations to come of age before taking em over. They probably did it for millennia before getting wiped out by something or other.</i>” He nods at you, profoundly pleased with himself. “<i>S’right. You and me, we’re just the aftermath of some extinct alien’s harem fantasy.</i>”");
	processTime(10);
	colensoMenu();
}

//Work
function askColensoAboutWork():void
{
	clearOutput();
	userInterface.showBust("COLENSO");
	userInterface.showName("\nCOLENSO");
	author("Nonesuch");
	output("You ask if he’s got any work available.");
	//PC not encountered a sexbot:
	if(9999 == 0) 
	{
		output("\n\n“<i>Oh ho! Trying to find out what pies I’ve currently got my thumbs in are we, " + pc.mf("Mr.","Mrs.") + " Not A Secret Government Agent?</i>” Colenso chuckles knowingly. “<i>Nah. You’re gonna have to try a bit harder than that, I’m afraid.</i>”");
		colensoMenu();
		return;
	}
	else if(flags["SEXBOT_QUEST_STATUS"] == undefined)
	{
		flags["SEXBOT_QUEST_STATUS"] = 1;
		output("\n\n The thickset goblin considers you speculatively for a moment.");
		output("\n\n“<i>You know, maybe I do. I need someone to get to the bottom of summat, and the way this is starting to look, it may as well be a U.G.C. shadow operative that helps me do it than anyone else.</i>” He rummages around in a disembowelled computer and emerges with what looks like a female goblin’s head. He thumps it down on the counter in front of you dramatically. A shiny grey female goblin’s head, on closer examination, with solid eyes and fibre wires spooling out of it.");
		output("\n\n“<i>A sexbot,</i>” you hazard. Colenso snaps his fingers excitedly.");
		output("\n\n“<i>And it won’t let me in. Won’t let me look at its memory banks! What kind of sex toy has military grade encryption on it? Absolutely mental!</i>” You wait patiently. “<i>There was always one or two of these VIs wandering round the junkyards hassling people, right? Their owners get tired of em, they go wrong or they get outmoded. They’re supposed to get scrubbed and scrapped before they get here, but half the time the dumpers don’t bother. The Empatron 350s got landed here wholesale, that detecting subliminal wishes programming they have was always going to go completely tits up. Apparently the entire line got recalled when one of them literally fucked an orchan to death. Because he wanted that, obviously.</i>” The big goblin drums his fingers on the counter fretfully, looking at the infinitely calm visage of the beheaded sexbot. “<i>People don’t treat em seriously. I mean I dunno if you’ve noticed, but most goblins and raskvel don’t mind a roll in the hay pretty much ever and they do a bang tidy impression of a member of your own race, right? But they’ve changed. I’m sure of it. There’s more of ‘em, they attack people more often now and they do this...”scanning” thing. And they won’t let me scan them back!</i>” He pokes the robot’s head furiously. It seems this more than anything else enrages him. “<i>What are you hiding, you tin pot tart? Who are you working for?!</i>”");
		output("\n\n“<i>What do you want me to do?</i>” you interject. Colenso breathes deep and collects himself. He reaches underneath the counter again and pushes a blocky, walkie-talkie-like device with a radar screen across to you.");
		output("\n\n“<i>I can’t get at their CPUs – they lock down somehow when you trap them. But maybe we can work out where they’re coming from. That is a GPS triangulator, connects right into the goblin satellite network. If you scan enough sexbots with it, it will take the direction they were coming from and work out an approximation of where they originated. I need you to scan enough of them to get that approximation, and then go find out what they’re up to.</i>” You weigh the bulky device in your hand.");
		output("\n\n“<i>And what would I get in return for doing this?</i>”");
		output("\n\n“<i>The honor and satisfaction of busting a dastardly mecha-conspiracy wide open!</i>” replies Colenso grandly. It takes him more a few moments to realise you haven’t swallowed this. “<i>... would a store discount do? Look " + pc.mf("mate","luv") + ", I’m dead serious about this. We really need to find out why they’ve changed, and you’re the first person who’s listened to me about this for more than ten seconds. Please do it. I reckon the fate of the galaxy is in the balance.</i>”");
		output("\n\nYou somehow doubt that, but a store discount isn’t such a terrible reward for beating up a bunch of robots. You pocket the scanner and tell him you’ll see what you can do.");
	}
	//“Work” chosen if quest not complete: 
	else if(flags["SEXBOT_QUEST_STATUS"] == 1)
	{
		output("\n\n“<i>Have you worked out what the sexbots are up to?</i>” says Colenso anxiously.");
		output("\n\nYou say you’re still working on it. The goblin considers you beadily.");
		output("\n\n“<i>Hmm. My sensors reckon you aren’t an imposter bot sent to destroy me for meddling in its mecha-overlord’s affairs, so I’ll have to take your word for it. But do please hurry.</i>”");
	}
	//“Work” chosen if quest complete 
	else if(flags["SEXBOT_QUEST_STATUS"] == 2)
	{
		clearOutput();
		output("“<i>I stopped the sexbots,</i>” you say. Colenso looks at you incredulously.");
		output("\n\n“<i>You – you did? What were they up to?</i>”");
		output("\n\nBriefly, you describe the ruined factory you found out in the wastelands and the strange, vast AI you confronted beneath it. Colenso hangs onto your every word, his mouth slightly ajar.");
		output("\n\n“<i>And what happened? Did you destroy it?</i>”");
		//[Sell Hand So] [Keep Hand So]
		//9999 - make sure PC has Hand So
		return;
	}
	else
	{
		output("\n\n“<i>I stopped the sexbots,</i>” you say.");
		output("\n\nColenso nods. <i>\"I know. I already thanked you. Got nothin' else for ya right now.");
	}
	processTime(2);
	colensoMenu();
}

//Quest itself
//https://docs.google.com/document/d/1SyHJzOsIFoMIpxwioZd6Oa3pb0m-PmGo6-HP3uEVNt0/edit#heading=h.t49agzqf9360

//Sell Hand So 
function sellHandSo():void
{
	clearOutput();
	userInterface.showBust("COLENSO");
	userInterface.showName("\nCOLENSO");
	author("Nonesuch");
	output("You retrieve the data bead from your pocket and waggle it in front of Colenso.");
	output("\n\n“<i>Actually, it’s right here. An AI designed solely to give its owner pleasure, with a virtually infinite capacity to do so.</i>” Colenso stares unblinkingly at it.");
	output("\n\n“<i>I see. You’d uh, be best off giving that to me. I mean, who knows what it would do in the wrong hands. I will need to scan it for malware and, work out ways to contain it and, see how it functions...</i>” you retract it out of his reaching grasp.");
	output("\n\n“<i>100k,</i>” you say. The goblin looks into your eyes silently for a long moment.");
	output("\n\n“<i>75,</i>” he says.");
	output("\n\n“<i>90 is my final offer. On top of the store discount.</i>”");
	output("\n\n“<i>Fine,</i>” he sighs. You plop the storage bead down in his palm and he stows it away without further comment, tapping on his screen a few times as he does.");
	output("\n\n“<i>It doesn’t really compensate you,</i>” he says finally, with an air of sheepishness. “<i>Considering what would have happened if you hadn’t stepped in. Thank you for doing this, Agent [pc.name]. Whoever you work for and for whatever reason, everyone on Tarkus owes you big time.</i>”");
	//9999
}

//If PC destroyed it/Keep Hand So 
function destroyedHandSo():void
{
	clearOutput();
	userInterface.showBust("COLENSO");
	userInterface.showName("\nCOLENSO");
	author("Nonesuch");
	output("“<i>Of course,</i>” you reply casually. ");
	if(9999 == 0) output("You finger the storage bead in your pocket. ");
	output("“<i>No rogue AI is a match for me.</i>”");

	output("\n\n“<i>Fucking. Wow. A rogue AI, planning on taking over the galaxy. On MY planet!</i>” Colenso breathes, his eyes shining. He pauses for a moment, savouring it. Then he turns back to you eagerly. “<i>Who do you think it was working for?</i>”");
	output("\n\n“<i>I... don’t think it was working for anyone.</i>”");
	output("\n\n“<i>Well yeah,</i>” says the goblin dismissively. “<i>It would say that, of course. But its shadowy controllers, they’ll still be out there. Why were they intent on taking over Tarkus? What will they try next?</i>” He suddenly inhales, gazing at you awestruck. “<i>Of course! You! You didn’t destroy that AI at all! You’ve commandeered it so you can use it to further the goals of the U.G.C. Black Wing!</i>”");

	//Nice: 
	if(pc.isNice()) output("\n\n“<i>Colenso,</i>” you say in as kind a tone as you can manage. “<i>There’s no conspiracy here. It really was working on its own. Just like me. When you disbelieve every piece of information that is presented to you, it ruins your ability to think intelligently about what all those different fragments tell you collectively. You’re spending your time demanding explanations from trees whilst ignoring the forest.</i>” The round-faced goblin goes quiet for a time.\n\n“<i>You know,</i>” he says eventually, “<i>I think that’s the most thoughtful thing anyone’s ever said to me.</i>” He reaches across and taps his monitor a few times. “<i>This discount doesn’t really compensate you [pc.name], but it’s all I can really offer you. Thank you for doing this. Everyone on Tarkus owes you big time.</i>”");
	//Misc:
	else if(pc.isMischievous()) output("\n\nYou put your hands behind your back and smile coolly.\n\n“<i>Thank you for your help in this matter, citizen Colenso,</i>” you say, holding his gaze levelly. “<i>The... interests... I represent are pleased with your due diligence. The AI we recovered will aid our cause in ways you cannot imagine.</i>” The goblin’s eyes practically start out of his face.\n\n“<i>I – you - I bet I could, though! I could be helpful to you if – if you just told me what you need? To one of my computers’ mics? Clearly stating your goals and the organisation you represent at the same time, if possible?</i>” You wave your hand casually.\n\n“<i>The store discount, as agreed. That is all.</i>” Colenso’s fingers are practically a blur as they punch into the nearest monitor.\n\n“<i>It doesn’t really compensate you,</i>” he says finally, with an air of sheepishness. “<i>Considering what would have happened if you hadn’t stepped in. Thank you for doing this, Agent [pc.name]. Whoever you work for and for whatever reason, everyone on Tarkus owes you big time.</i>”");
	//Nasty:
	else output("\n\n“<i>Listen you blithering idiot,</i>” you say sharply, patience gone. “<i>If I were a secret agent I would have snapped your neck within five minutes of sharing your company. I have done what you’ve asked. Now you are going to fulfil your end of the bargain, or I am going to do to you what I did to the AI.</i>” Colenso’s fingers are a blur as they hurriedly punch into the nearest monitor.\n\n“<i>It doesn’t really compensate you,</i>” he says finally, with an air of meek embarrassment. “<i>Considering what would have happened if you hadn’t stepped in. Thank you for doing this, Agent [pc.name]. Whoever you work for and for whatever reason, everyone on Tarkus owes you big time.</i>”");
	//99999
}