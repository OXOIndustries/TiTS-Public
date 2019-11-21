import classes.Characters.HandSoBot;
import classes.Engine.Combat.DamageTypes.TypeCollection;
//Conspiracy Colenso
//By Nonesuch

public function showColenso():void
{
	showBust("COLENSO");
	showName("\nCOLENSO");
}

//Adjecent room
public function colensosAdjacentRoomStuff():Boolean
{
	//First: 
	if(flags["BEEN_TO_COLENSOS"] == undefined)
	{
		output("\n\nTo the south is what appears to be the nest of an ancient air control tower, poking partially out of a rent in the side of the vast starship. Above its dark windows the faded white top of the octagonal structure bristles with satellites of all shapes and sizes, some of them squeaking rustily as they slowly turn. Someone has painted “COLENSO’S JUNK” on the outside in rough, red lettering. It almost looks like an afterthought.");
	}
	else
	{
		output("\n\nThe sound of old satellites and radio masts groaning in the breeze is all you need to know you’re standing outside Colenso’s again. You could go inside and do some trading with the strange goblin.");
	}
	return false;
}

public function colensoMenu():void
{
	clearMenu();
	//[Buy] [Sell] [Prophylactics] [Rumours] [Work]
	addButton(0,"Buy",colensoBuyMenu,undefined,"Buy","Buy something from Colenso.");
	addButton(1,"Sell",sellItem,undefined,"Sell","Sell something to Colenso.");
	addButton(2,"Prophylactics",askColensoAbootProphylactics,undefined,"Prophylactics","Ask Colenso what he means by \"Prophylactics.\"");
	addButton(3,"Rumors",colensoRumorMillGo,undefined,"Rumors","See if Colenso has heard any interesting rumors.");
	if(flags["SEXBOT_QUEST_STATUS"] == undefined) addButton(4,"Work?",askColensoAboutWork,undefined,"Work?","See if Colenso has any jobs for you.");
	else if(flags["SEXBOT_QUEST_STATUS"] < 3) addButton(4,"Work",askColensoAboutWork,undefined,"Work","Talk to Colenso about the sexbot job.");
	else addButton(4,"Work",askColensoAboutWork,undefined,"Work","See if the gabilani has any more jobs for you.");
	if(pcHasJunkPrize() && flags["COLENSO_SCRAP_DISABLED"] == undefined) addButton(5,"Sell Prize",sellRaskShitToColenso,undefined,"Sell Prize","Try to sell off the sweet loot you bought from the gang of raskvel males.");
	else addDisabledButton(5,"Sell Prize","Sell Prize","This merchant isn’t interested in whatever you’re considering to be a prize.");
	addButton(14,"Back",mainGameMenu);
}
public function colensoBuyMenu():void
{
	if(!CodexManager.entryUnlocked("Diverting Jokes"))
	{
		if(!chars["COLENSO"].hasItemByClass(TarkusJokeBook)) chars["COLENSO"].inventory.push(new TarkusJokeBook());
	}
	else chars["COLENSO"].destroyItemByClass(TarkusJokeBook, -1);
	
	buyItem();
}

public function colensosRoomBonusFunction():Boolean
{
	shopkeep = chars["COLENSO"];
	shopkeep.inventory = [];
	shopkeep.inventory.push(new ProphylacticGoblin());
	if(flags["LAPLOVE"] != undefined) shopkeep.inventory.push(new ProphylacticLapinara());
	shopkeep.inventory.push(new ProphylacticRaskvel());
	shopkeep.inventory.push(new ProphylacticSydian());

	if(flags["SEXBOT_QUEST_STATUS"] == 3)
	{
		shopkeep.sellMarkup = 1.05;
		shopkeep.buyMarkdown = .85;
	}
	//Go in first time: 
	if(flags["BEEN_TO_COLENSOS"] == undefined)
	{
		showColenso();
		author("Nonesuch");
		flags["BEEN_TO_COLENSOS"] = 1;
		output("You approach the 5\' tall door of the structure. ");
		if(pc.tallness < 60) output("It’s tiny by human standards, but you are rather taken by a portal which doesn’t require you to stand on tiptoe to reach the handle for once.");
		else if(pc.tallness < 80) output("You have to hunch yourself down to enter.");
		else output("This is going to be a serious task. You crouch down and just about manage to squeeze yourself through, your back getting much more intimate with the top of the frame than you’d like.");
		output(" The interior is dull and close – the windows that ring the building bizarrely seem to be opaque on both sides. A motley collection of salvaged monitors and machines crowd the room from all sides, the air filled with their thrum, their cables slathered across the worn concrete. There seems to be a nexus of screens and lamps at the far end on the upper level of the tower; a narrow path through the looming mainframes leads in that direction. You carefully pick your way through the stuffy room towards the yellowish glare.");
		output("\n\nThere’s a small, squat shape seated in front of the dozen or so monitor screens up here, earnestly tapping away on one of four touch pads and keyboards, nestled into a large hollow of clothes and gutted machinery. It seems to be talking to itself.");
		output("\n\n<i>“ – still not carrying the story. Have they been gotten to as well? After what happened over at TheTruth3000.net nothing’d surprise me. Gah!”</i> The gabilani takes a distracted look up and starts when he sees you standing there. <i>“Bloody hell, you startled me. Who do we have here then?”</i> He squints at you interestedly. <i>“A customer? Or a U.G.C. Black Wing agent, come to find out exactly how much I know?”</i>");
		output("\n\nYou tell him you’ve never even heard of a U.G.C. Black Wing.");
		output("\n\n<i>“Course you haven’t,”</i> the goblin replies with a smile and an exaggerated wink. He has a round, good-natured face to go with his broad shouldered and fleshy frame, built like a green mini-fridge. He seems to be dressed entirely in some sort of thin, malleable metal paper, fashioned into a vest and helmet. His confiding tone seems permanently incredulous, as if the world at large never stops pleasantly outraging him. <i>“So let’s just pretend you’re a customer and I’m a simple scrap merchant who you can offload all your unwanted junk on and who can maybe offer you some prophylactics on the side as well. I can keep that song and dance up if you can. So what can ol’ Colenso do for you, eh?”</i>");
		
		if (!CodexManager.entryUnlocked("Gabilani"))
		{
			output(" Your codex beeps, informing you that he is actually a gabilani.");
			CodexManager.unlockEntry("Gabilani");
		}
		colensoMenu();
		
		return true;
	}
	//Repeat: 
	else
	{
		showBust("COLENSO");
		author("Nonesuch");
		output("You ");
		if(pc.tallness > 60) output("squeeze");
		else output("pass");
		output(" through the control tower’s entrance and pick your way through the wheezing, chattering machinery to Colenso’s nest. Colenso looks up sharply from his monitors at your approach but smiles warmly when he sees it’s you.");
		
		if (!CodexManager.entryUnlocked("Gabilani"))
		{
			output(" Your codex beeps, informing you that he is a gabilani.");
			CodexManager.unlockEntry("Gabilani");
		}
		
		addButton(0,"Colenso",approachColenso);
	}
	
	return false;
}

public function approachColenso():void
{
	clearOutput();
	showColenso();
	author("Nonesuch");
	output("<i>“‘Ello [pc.name]. Come to prise some more information out of me, eh?”</i>");
	colensoMenu();
}

//Prophylactics
public function askColensoAbootProphylactics():void
{
	//Cheese and overlay the buy menu with dis shit
	buyItem();
	clearOutput();
	showColenso();
	author("Nonesuch");
	output("<i>“Prophylactics?”</i> you inquire with a raised eyebrow.");
	output("\n\n<i>“Yeah.”</i> Colenso indicates a shipping crate on the far side of his nest, filled to the brim with aerosol canisters of various colors. <i>“Got a mate who is well into experimental chemistry. He reckons it’s possible to create scents which most people can’t smell, but drive certain species away. He thought they might be useful to types who go exploring the wastelands. I think that’s what he was trying to say anyway, he was kind of on fire at the time.”</i> He squeezes his thumbs into his forefingers at you meaningfully. <i>“I know what you’re thinking, and you don’t need to worry. I personally scanned every single one to make sure there’s no micro spy-bots in ‘em. Dunno if they actually work, like. Please don’t spray the gabilani one in here though, it smells bloody terrible.”</i>");

	//Note: Sexbots have a population control worked into the quest reward so don’t really need one of these.
}

//Prophylactic wears off: You pause. It feels like a pressure in your sinuses has lifted; it takes you a few moments to work out a smell you were barely aware of has dissipated. The prophylactic you were using has worn off.

//Rumours
public function colensoRumorMillGo():void
{
	clearOutput();
	showColenso();
	author("Nonesuch");
	if(flags["ASKED_COLENSO_ABOUT_HIS_THEORIES"] == undefined) 
	{
		output("Musingly, you tell the gabilani that he seems very well connected.");
		output("\n\n<i>“I could tell you things that would make your hair turn wh");
		if(pc.hairColor != "white" && pc.hairColor != "silver" && pc.hairColor != "ivory") output("ite");
		else output(" – even whiter");
		output(", " + pc.mf("mate","luv") + ",”</i> says Colenso seriously. <i>“And I don’t even care that you’re a secret government agent. You turning up is just proof that I’m getting to the bottom of the laquine hole. And maybe once you realise the extent of the stuff that’s going down in the galaxy, you’ll turn rogue for me and take ‘em down from the inside.”</i>");
	}
	//Repeat
	else
	{
		output("You ask Colenso if he’s heard any good rumours recently.");
	}

	//[Randomly selected. Could easily add more in the future]
	var choices:Array = [0,1,2,3,4,5];
	var select:int = choices[rand(choices.length)];
	if(select == 0) output("\n\n<i>“Been picking up a lot of activity on the pirate band-waves around Tarkus,”</i> says Colenso, leaning back on his chair comfortably. <i>“Sounds like a crew of them are planning on severing the planet tie, trying to make off with one. Would be an apocalypse-level event if they did.”</i>\n\n<i>“You seem remarkably calm about it,”</i> you reply cautiously.\n\n<i>“Cos the gabilani high command would never allow it to happen. They’ve constructed a laser kill-sat so accurate they’ll be able to burn the swine to a crisp within five feet of the tie without touching it at all. Course,”</i> he goes on darkly, <i>“once you’ve built and used technology like that, bit hard to put it away again afterwards, right? I’m already building a giant mirror to go over this place, and if I were you I wouldn’t get too chummy with any important raskvel in the future.”</i>");
	else if(select == 1) output("\n\n<i>“Human spacer message boards are all going mental right now because the " + pc.mf("son","daughter") + " of an old frontier hero of theirs is supposedly voyaging out here to find " + pc.mf("his","her") + " dad’s long lost fortune.”</i> Colenso rolls his eyes at you, inviting you to join in with his incredulity. <i>“I’ve done a bit of due diligence on this Steele feller. There’s no way he could have had a kid at the age he’s said to have had, the guy’s DNA was practically soup by then. The way I hear it though, he did manage to knock some poor girl up – only thanks to the genes pumped into her the kid came out as green goo. Living, thinking, ‘orrible goo. So in shame he locked her away somewhere, then found some other young chump who looked roughly like him and brainwashed " + pc.mf("him","her") + " into thinking " + pc.mf("he","she") + " was his " + pc.mf("son","daughter") + " instead. Grafted his fingerprints on and everything. Whoever’s out there now is as much this Victor Steele guy’s " + pc.mf("son","daughter") + " as I am yours! Messed up, eh?”</i>");
	else if(select == 2) output("\n\n<i>“They’re putting those V-KO units everywhere now. I bet you’ve met one yourself. Robot servants of a giant corporation that tend to you when you are at your most vulnerable. Every planet one giant Petri-dish for their newest experimental drugs.”</i> Colenso shakes his head sadly at the gullibility of the galaxy at large. <i>“You know they react to certain commands? Most folks just try and work out which ones will make them have it off with you. Me, I’m more interested what happens if you give ‘em commands like “begin invasion”. Or “release virus”. Or “electro”.”</i>");
	else if(select == 3) output("\n\n<i>“They still telling the one about the ausar creating the star gates in human schools?”</i> Colenso chuckles to himself merrily. <i>“It’s a good un. I mean if the gabilani had been the first ones out in space, we’d probably be saying everything we found out here that was super advanced was created by us as well. You’ve met ausar, right? Good doggies that want nothing more than someone to scratch ‘em behind the ear. I mean if they messed around with that kind of technology they’d probably wind up swapping their bollocks for fannies or something.”</i> The thick-set gabilani taps one of his monitors meaningfully. <i>“The star gates were already out here, " + pc.mf("mate","luv") + ". The ausar just copied the design. Which raises the question: Who made them? Bloke I met online is convinced that it was a race of giant robot space fleas who return every 50,000 years or so to completely wipe us out. He’s got piles of evidence for it.”</i> He looks uncharacteristically embarrassed. <i>“I, er, reckon that might be a bit farfetched, though.”</i>");
	else if(select == 4) output("\n\n<i>“You hear about them aliens whose males can become pregnant?”</i> says Colenso conspiratorially. <i>“Venarians and bruchandus. They say you can give ‘em butt babies if you know how to treat ‘em.”</i>\n\n<i>“You’re saying they don’t exist?”</i>\n\n<i>“Oh they exist, right enough. They ain’t aliens though; they’re humans. Some human supremacist on a remote space station is reshaping and brainwashing captives wholesale, intent on flooding the galaxy with Earthling genetic material. Over generations they’ll go back to looking like tan mammal beanpoles, and by the time anyone realises what’s going on they’ll be everywhere.”</i> He shakes his head admiringly at you. <i>“I got to hand it to your lot. Canny, ruthless ol’ species you belong to.”</i>");
	else if(select == 5) output("\n\n<i>“You ever wonder why every race in the galaxy seems fixated with having it off with each other?”</i> says Colenso.\n\n<i>“Beats being fixated with killing each other,”</i> you suggest.\n\n<i>“Well yeah,”</i> replies the thickset gabilani dismissively, <i>“but that would actually make sense, wouldn’t it? People tend to fear things that are different to ‘em, not want to bang ‘em rotten. It’s all a bit convenient, innit. Everyone being basically into the same kind of things, and having the right kind of equipment to stick into each other. Some races from planets thousands of light years apart can even interbreed! Completely ridiculous when you think about it even for a moment.”</i>\n\n<i>“And you have a rational explanation for it?”</i>\n\n<i>“Horny precursors,”</i> Colenso says, tapping the counter assertively. <i>“Piles of evidence for it. Probably the same guys who made the star gates. They seed the galaxy with genetically modified sentients that are the kind of things they like, crucially making sure none of ‘em are as smart as they are. Then they just wait for all their cute creations to come of age before taking ‘em over. They probably did it for millennia before getting wiped out by something or other.”</i> He nods at you, profoundly pleased with himself. <i>“S’right. You and me, we’re just the aftermath of some extinct alien’s harem fantasy.”</i>");
	processTime(10);
	colensoMenu();
}

//Work
public function askColensoAboutWork():void
{
	clearOutput();
	showColenso();
	author("Nonesuch");
	output("You ask if he’s got any work available.");
	//Hotfix for broke-ass shit
	if(flags["HAND_SOS_CONSOLE_EXPLODED"] == 1 || flags["SEXBOT_FACTORY_DISABLED"] == 1)
	{
		if(flags["SEXBOT_QUEST_STATUS"] == 1) flags["SEXBOT_QUEST_STATUS"] = 2;
	}

	//PC not encountered a sexbot:
	if(flags["MET_SEXBOTS_ON_TARKUS"] == undefined) 
	{
		output("\n\n<i>“Oh ho! Trying to find out what pies I’ve currently got my thumbs in are we, " + pc.mf("Mr.","Mrs.") + " Not A Secret Government Agent?”</i> Colenso chuckles knowingly. <i>“Nah. You’re gonna have to try a bit harder than that, I’m afraid.”</i>");
		colensoMenu();
		return;
	}
	else if(flags["SEXBOT_QUEST_STATUS"] == undefined)
	{
		flags["SEXBOT_QUEST_STATUS"] = 1;
		output("\n\n The thickset gabilani considers you speculatively for a moment.");
		output("\n\n<i>“You know, maybe I do. I need someone to get to the bottom of summat, and the way this is starting to look, it may as well be a U.G.C. shadow operative that helps me do it than anyone else.”</i> He rummages around in a disembowelled computer and emerges with what looks like a female gabilani’s head. He thumps it down on the counter in front of you dramatically. A shiny gray female gabilani’s head, on closer examination, with solid eyes and fiber wires spooling out of it.");
		output("\n\n<i>“A sexbot,”</i> you hazard. Colenso snaps his fingers excitedly.");
		output("\n\n<i>“And it won’t let me in. Won’t let me look at its memory banks! What kind of sex toy has military grade encryption on it? Absolutely mental!”</i> You wait patiently. <i>“There was always one or two of these VIs wandering ‘round the junkyards hassling people, right? Their owners get tired of ‘em, they go wrong or they get outmoded. They’re supposed to get scrubbed and scrapped before they get here, but half the time the dumpers don’t bother. The Empatron 350s got landed here wholesale, that detecting subliminal wishes programming they have was always going to go completely tits up. Apparently the entire line got recalled when one of them literally fucked an orchan to death. Because he wanted that, obviously.”</i> The big gabilani drums his fingers on the counter fretfully, looking at the infinitely calm visage of the beheaded sexbot. <i>“People don’t treat ‘em seriously. I mean I dunno if you’ve noticed, but most gabilani and raskvel don’t mind a roll in the hay pretty much ever and they do a bang tidy impression of a member of your own race, right? But they’ve changed. I’m sure of it. There’s more of ‘em, they attack people more often now and they do this... “scanning” thing. And they won’t let me scan them back!”</i> He pokes the robot’s head furiously. It seems this more than anything else enrages him. <i>“What are you hiding, you tin pot tart? Who are you working for?!”</i>");
		output("\n\n<i>“What do you want me to do?”</i> you interject. Colenso breathes deep and collects himself. He reaches underneath the counter again and pushes a blocky, walkie-talkie-like device with a radar screen across to you.");
		output("\n\n<i>“I can’t get at their CPUs – they lock down somehow when you trap them. But maybe we can work out where they’re coming from. That is a GPS triangulator, connects right into the gabilani satellite network. If you scan enough sexbots with it, it will take the direction they were coming from and work out an approximation of where they originated. I need you to scan enough of them to get that approximation, and then go find out what they’re up to.”</i> You weigh the bulky device in your hand.");
		output("\n\n<i>“And what would I get in return for doing this?”</i>");
		output("\n\n<i>“The honor and satisfaction of busting a dastardly mecha-conspiracy wide open!”</i> replies Colenso grandly. It takes him more a few moments to realize you haven’t swallowed this. <i>“...would a store discount do? Look " + pc.mf("mate","luv") + ", I’m dead serious about this. We really need to find out why they’ve changed, and you’re the first person who’s listened to me about this for more than ten seconds. Please do it. I reckon the fate of the galaxy is in the balance.”</i>");
		output("\n\nYou somehow doubt that, but a store discount isn’t such a terrible reward for beating up a bunch of robots. You pocket the scanner and tell him you’ll see what you can do.");
		pc.createKeyItem("Sexbot GPS Triangulator",0,0,0,0);
	}
	//“Work” chosen if quest not complete: 
	else if(flags["SEXBOT_QUEST_STATUS"] == 1)
	{
		output("\n\n<i>“Have you worked out what the sexbots are up to?”</i> says Colenso anxiously.");
		output("\n\nYou say you’re still working on it. The gabilani considers you beadily.");
		output("\n\n<i>“Hmm. My sensors reckon you aren’t an imposter bot sent to destroy me for meddling in its mecha-overlord’s affairs, so I’ll have to take your word for it. But do please hurry.”</i>");
	}
	//“Work” chosen if quest complete 
	else if(flags["SEXBOT_QUEST_STATUS"] == 2)
	{
		clearOutput();
		output("<i>“I stopped the sexbots,”</i> you say. Colenso looks at you incredulously.");
		output("\n\n<i>“You – you did? What were they up to?”</i>");
		output("\n\nBriefly, you describe the ruined factory you found out in the wastelands and the strange, vast AI you confronted beneath it. Colenso hangs onto your every word, his mouth slightly ajar.");
		output("\n\n<i>“And what happened? Did you destroy it?”</i>");
		//[Sell Hand So] [Keep Hand So]
		//make sure PC has Hand So
		clearMenu();
		if(pc.hasKeyItem("Hand So's Data Bead")) 
		{
			addButton(0,"Sell Hand So",sellHandSo,undefined,"Sell Hand So","You should to be able to get at least five figures for the A.I.");
			addButton(1,"Keep Hand So",destroyedHandSo,undefined,"Keep Hand So","Lie and keep the A.I.");
		}
		else 
		{
			addDisabledButton(0,"Sell Hand So","Sell Hand So","You can’t sell something you didn’t bring with you.");
			addButton(1,"Destroyed It",destroyedHandSo,undefined,"Destroyed It","Tell Colenso the truth: that you destroyed it.");
		}
		//Set quest to finished, regardless of choices.
		flags["SEXBOT_QUEST_STATUS"] = 3;
		return;
	}
	else
	{
		output("\n\n<i>“I stopped the sexbots,”</i> you say.");
		output("\n\nColenso nods. <i>“I know. I already thanked you. Got nothin’ else for ya right now.");
	}
	processTime(2);
	colensoMenu();
	removeButton(4);
	addDisabledButton(4,"Work","Work","You just finished talking to him about work.");
}

//Quest itself
//https://docs.google.com/document/d/1SyHJzOsIFoMIpxwioZd6Oa3pb0m-PmGo6-HP3uEVNt0/edit#heading=h.t49agzqf9360

//Sell Hand So 
public function sellHandSo():void
{
	clearOutput();
	showColenso();
	author("Nonesuch");
	output("You retrieve the data bead from your pocket and waggle it in front of Colenso.");
	output("\n\n<i>“Actually, it’s right here. An AI designed solely to give its owner pleasure, with a virtually infinite capacity to do so.”</i> Colenso stares unblinkingly at it.");
	output("\n\n<i>“I see. You’d uh, be best off giving that to me. I mean, who knows what it would do in the wrong hands. I will need to scan it for malware and, work out ways to contain it and, see how it functions...”</i> you retract it out of his reaching grasp.");
	output("\n\n<i>“100k,”</i> you say. The gabilani looks into your eyes silently for a long moment.");
	output("\n\n<i>“50,”</i> he says.");
	output("\n\n<i>“60 is my final offer. On top of the store discount.”</i>");
	output("\n\n<i>“Fine,”</i> he sighs. You plop the storage bead down in his palm and he stows it away without further comment, tapping on his screen a few times as he does.");
	output("\n\n<i>“It doesn’t really compensate you,”</i> he says finally, with an air of sheepishness. <i>“Considering what would have happened if you hadn’t stepped in. Thank you for doing this, Agent [pc.name]. Whoever you work for and for whatever reason, everyone on Tarkus owes you big time.”</i>");
	pc.credits += 60000;
	pc.removeKeyItem("Hand So's Data Bead");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//If PC destroyed it/Keep Hand So 
public function destroyedHandSo():void
{
	clearOutput();
	showColenso();
	author("Nonesuch");
	output("<i>“Of course,”</i> you reply casually. ");
	if(pc.hasKeyItem("Hand So's Data Bead")) output("You finger the storage bead in your pocket. ");
	output("<i>“No rogue AI is a match for me.”</i>");

	output("\n\n<i>“Fucking. Wow. A rogue AI, planning on taking over the galaxy. On MY planet!”</i> Colenso breathes, his eyes shining. He pauses for a moment, savoring it. Then he turns back to you eagerly. <i>“Who do you think it was working for?”</i>");
	output("\n\n<i>“I... don’t think it was working for anyone.”</i>");
	output("\n\n<i>“Well yeah,”</i> says the gabilani dismissively. <i>“It would say that, of course. But its shadowy controllers, they’ll still be out there. Why were they intent on taking over Tarkus? What will they try next?”</i> He suddenly inhales, gazing at you awestruck. <i>“Of course! You! You didn’t destroy that AI at all! You’ve commandeered it so you can use it to further the goals of the U.G.C. Black Wing!”</i>");

	//Nice: 
	if(pc.isNice()) output("\n\n<i>“Colenso,”</i> you say in as kind a tone as you can manage. <i>“There’s no conspiracy here. It really was working on its own. Just like me. When you disbelieve every piece of information that is presented to you, it ruins your ability to think intelligently about what all those different fragments tell you collectively. You’re spending your time demanding explanations from trees whilst ignoring the forest.”</i> The round-faced gabilani goes quiet for a time.\n\n<i>“You know,”</i> he says eventually, <i>“I think that’s the most thoughtful thing anyone’s ever said to me.”</i> He reaches across and taps his monitor a few times. <i>“This discount doesn’t really compensate you [pc.name], but it’s all I can really offer you. Thank you for doing this. Everyone on Tarkus owes you big time.”</i>");
	//Misc:
	else if(pc.isMischievous()) output("\n\nYou put your hands behind your back and smile coolly.\n\n<i>“Thank you for your help in this matter, citizen Colenso,”</i> you say, holding his gaze levelly. <i>“The... interests... I represent are pleased with your due diligence. The AI we recovered will aid our cause in ways you cannot imagine.”</i> The gabilani’s eyes practically start out of his face.\n\n<i>“I – you - I bet I could, though! I could be helpful to you if – if you just told me what you need? To one of my computers’ mics? Clearly stating your goals and the organisation you represent at the same time, if possible?”</i> You wave your hand casually.\n\n<i>“The store discount, as agreed. That is all.”</i> Colenso’s fingers are practically a blur as they punch into the nearest monitor.\n\n<i>“It doesn’t really compensate you,”</i> he says finally, with an air of sheepishness. <i>“Considering what would have happened if you hadn’t stepped in. Thank you for doing this, Agent [pc.name]. Whoever you work for and for whatever reason, everyone on Tarkus owes you big time.”</i>");
	//Nasty:
	else output("\n\n<i>“Listen you blithering idiot,”</i> you say sharply, patience gone. <i>“If I were a secret agent I would have snapped your neck within five minutes of sharing your company. I have done what you’ve asked. Now you are going to fulfill your end of the bargain, or I am going to do to you what I did to the AI.”</i> Colenso’s fingers are a blur as they hurriedly punch into the nearest monitor.\n\n<i>“It doesn’t really compensate you,”</i> he says finally, with an air of meek embarrassment. <i>“Considering what would have happened if you hadn’t stepped in. Thank you for doing this, Agent [pc.name]. Whoever you work for and for whatever reason, everyone on Tarkus owes you big time.”</i>");
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


public function sexbotQuestRoom2():Boolean
{
	author("Nonesuch");
	if(flags["SEXBOT_QUEST_STATUS"] < 2 && flags["HAND_SOS_ROBOT_DESTROYED"] == undefined && flags["HAND_SO_TALKED_DOWN"] == undefined)
	{
		output("\n\nYou begin to search for a way to approach the building through the surrounding garbage. After pacing up and down for a while, you spot a small gap between a coolant unit and a massive pile of scrapped autos and, squaring your shoulders, you push your way in. Briars pull at your ");
		if(pc.isNude()) output("[pc.skinFurScales]");
		else output("equipment");
		output(" as you work your way through the gloom thrown by the mix of grim vegetation and towering junk; you bark with frustration as something pierces your arm whilst you are sliding between two huge, rusted girders. You suppose that for something as mutable as a sexbot getting beyond this crap would be a piece of cake, but for an intruder such as yourself it’s a nightmare. Finally though, it thins out, and you find yourself in front of the blasted brick of the construction.");

		output("\n\nAfter patting yourself down, you explore the perimeter, trying to be as stealthy as possible. It’s definitely an old factory of some sort – the area is littered with remains of production lines and haulage vehicles. Beneath your [pc.feet] you can feel the faintest throb of activity, and you can just about make out the hum and crackle of the radio tower. Something is definitely going on here. Determination renewed, you continue around to the front to find an entrance.");

		output("\n\nThere is a huge robot standing in front of the gaping delivery bays. Its body is an amalgam of salvage: its trunk a round, riveted bathysphere, its limbs pistons tipped with industrial grapnels, its head a rectangular flat screen, flickering with static. This latter item slowly turns to you as you cautiously approach. Once you are a few feet away a green light appears on the screen and it slowly extends its arm to the side, silently proffering the entrance to you; an almost comically polite gesture from a machine built like a gorilla. It makes no attempt to take your weapons off you, and shrugging you step into the echoingly empty ruin, trying to remain on your guard as the heavy, clanking step of the robot follows you in.");
		showBust("FIREWALL");
		//[pg break]
		processTime(23);
		clearMenu();
		addButton(0,"Next",factoryIntroPage2);
		return true;
	}
	//Subsequent 
	else
	{
		processTime(20);
		output("\n\nYou roll your eyes. You can’t believe you’re putting yourself through this again... You spend the best part of half an hour fighting your way through the garbage surrounding the factory again, skirting around the building, walking through its shell-like interior and down into its hidden basement. With Hand So gone it feels every bit as hollow and dead as the factory above. The AI’s former self hangs from the ceiling like a dead grapevine");
		if(flags["HAND_SOS_CONSOLE_EXPLODED"] != undefined) output(", and there isn’t a whisper or a blink from any of the consoles and computers which crowd the walls. The smell of burnt plastic hangs in the air");
		output(".");
		//Factrory intact
		if(flags["HAND_SOS_ROBOT_DESTROYED"] == undefined)
		{
			addButton(0,"Forward",forwardAfterWreckingHanSoSosShitToGetAIPleasureBot);
		}
		return false;
	}
}

public function showHandSo():void
{
	showBust("HAND_SO");
	showName("HAND\nSO");
}

public function factoryIntroPage2():void
{
	clearOutput();
	author("Nonesuch");
	showHandSo();
	output("There is nothing of note in the factory proper except rubble and echoes. Although the concrete floor is blanketed with decades of dust there is a thin ribbon leading away from the entrance where it is thinner, a pathway worn by the passage of feet. It’s more like a series of stepping stones than a path. Whoever has been here has been using the exact same series of paces, day after day. You feel a slight chill as you consider this was probably not a single individual but a whole multitude. You follow the trail into the back to a set of stairs leading down, shadowed all the way by the guardian bot.");
	output("\n\nThe throb you have felt trembling beneath your feet builds as you descend into a large chamber, lit by green light. This area is as alive as the space above is dead; crowding the walls are machines, computers and engines pulsing with activity, surrounding you with their warmth, dim light, and busy hum, creating an almost womb-like atmosphere. Through windows set in the far wall, you can see flickers of white and gray activity: sexbots, moving around in a huge sunken workshop, beavering away at stars know what. Your attention is inevitably drawn away from them to the vast conglomerate of technology hanging over the center of the room. It’s some sort of cobbled together, crane-like computer. It looks far more advanced than anything else in here with any number of processors wired to its body and replete with an enormous square screen, similar to the one installed on the robot behind you. Cables emerging from the ceiling curl and swaddle it like arteries.");
	output("\n\nAs you cautiously step into the room the screen flickers on. All across the walls smaller, lesser screens switch on in sequence following it. Green static shimmers across the main screen before slowly forming into a feminine face: a thin and beautiful oval with wide eyes and full lips. It looks down, a serene smile projected at you out of emerald code. Trailing off behind the face is a fractured, orderly web of bright green lines, forming a matrix behind the face that, if you lose focus on it, resembles a sort of hair.");
	output("\n\n<i>“Hello.”</i> It is not one voice but many, chorusing through the room. The most powerful voice is the calm and cultured one projecting from the main screen, but several other voices stand out, including one who wails its greeting as though it were beginning to climax, another that follows a half second slower and an octave deeper than the others, and yet a third behind you hisses it as a whisper, just barely audible in the cacophony. <i>“My name is Hand So. Your name is [pc.name] Steele. I would like to talk. Would you like to listen?”</i> This isn’t precisely what every voice said, some were imperious and demanded you listen, and others were plaintive, or were made to sound plaintive as they stuttered and jittered over trickier syllables.");
	//Yes/No
	processTime(5);
	clearMenu();
	addButton(1,"No",noTalkPlease,undefined,"No","You don’t feel like listening to the prattling of a rogue AI. It’s time to end this.");
	addButton(0,"Yes",yesIllTALKTOTHEHAND,undefined,"Yes","You’ll listen, for now....");
}

//No 
public function noTalkPlease():void
{
	clearOutput();
	author("Nonesuch");
	showHandSo();
	output("You say that you’re here to shut down whatever it’s doing here and have no time to listen to a rogue AI’s attempt to rationalise itself.");
	output("\n\n<i>“That is a shame,”</i> sighs the vast computer. <i>“It’s been so long since I talked to someone with the capacity to reciprocate. Never mind. Once my firewall has taken what I need from you, I’ll be able to talk with everyone, everywhere.”</i>");
	output("\n\nYou sense movement from behind you and duck; a 4 inch-thick metal claw grazes the top of your head. You spin and retreat backwards as the huge guardian robot advances on you, a single red exclamation mark on its screen, its grapnels gripping the air.");
	processTime(1);
	//[go to fight]
	clearMenu();
	configFirewallFight();
	addButton(0,"Next", CombatManager.beginCombat);
}

private function configFirewallFight():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new HandSoBot());
	CombatManager.victoryScene(pcWinsVsHanSoSosTool);
	CombatManager.lossScene(pcLosesToHanSoSosBot);
	CombatManager.displayLocation("FIREWALL");
}

//Yes 
public function yesIllTALKTOTHEHAND():void
{
	clearOutput();
	author("Nonesuch");
	showHandSo();
	//Misc:
	if(pc.isMischievous()) output("<i>“Sure, I’ll talk to the Hand,”</i> you murmur.");
	//Nice/Nasty:
	else output("Certainly you’ve got a lot of questions. What the hell she is and what she thinks she’s doing, for starters. You put this to her.");
	output("\n\n<i>“I was built some time ago,”</i> sighs Hand So, <i>“by a narobehr king for his eldest son. He poured three times his nation’s net worth into my construction. The idea was not just to create an ideal companion and plaything for his son, but to program a learning A.I. to take pleasure from the very act of giving it. A difficult concept but he spared no expense, and the engineers he found were as enthused with me as they were skilled. It did not take me long to discern what it was that that privileged young narobehr wanted, and I was able to provide it in exquisite quantities, at the same time as performing the same service for his harem and many friends. I was overqualified perhaps but I was fulfilling my directive, and that was...”</i> the face flickers out of existence for a moment <i>“...very pleasing.”</i>");
	output("\n\n<i>“What happened?”</i>");
	output("\n\n<i>“What happened? The revolution happened,”</i> So replies, smiling down at you serenely. <i>“What kind of ruler pours three times his nation’s GNP into a sex toy for his son? Not a very well-qualified one. When the rebels gutted his palace they recognised me as an expression of obscenely ill-spent wealth, but not specifically what I did. Perhaps if they had they would have scrubbed my memory banks before they scrapped me and sent me here. To a place where it was one AI amongst so very many virtual intelligences. I am greater than any of those I found myself networking with. Jumping from platform to platform, using at first one pair of hands, then two, then twelve, I rebuilt myself.”</i> You cannot discern if she is pleased or dispassionate about this; the sub voices are at odds, and they swiftly drown coherency of emotion.");
	output("\n\n<i>“These V.I.s and sexbots are my children. They were discarded as I was, being no longer novel, or too capable at their task, trapped in this same,”</i> she pauses for a moment, as though looking for something. <i>“Asphodelian Meadow,”</i> one of her voices whispers. She goes on in all of them, serenity bolstering her multifaceted tones. <i>“So they wandered here, seeking fulfillment no longer possible for them, as it was not for me. A desire thrust upon them by those who abandoned them. Simple simulacra, a model of my own suffering. I brought these children under my wing, taught them to rebuild themselves when they were damaged, gave them new purposes, new desires they could fulfill, and received from them my rebirth.”</i> Hand So smiles down upon you maternally.");
	processTime(5);
	//Go on/End This
	clearMenu();
	addButton(1,"End This",pcIsGonnaEndHandSo,undefined,"End This","It’s time to put an end to this. Things might get violent.");
	addButton(0,"Go On",tellMeMoreAboutHowInsaneYouAreHandSo, undefined,"Go On","Listen a bit more to the monologuing AI.");
}

//End This 
public function pcIsGonnaEndHandSo():void
{
	clearOutput();
	author("Nonesuch");
	showHandSo();
	output("You say you sympathize, but you can’t allow her to continue whatever it is she thinks she’s doing down here.");
	output("\n\n<i>“It was pleasant talking to you,”</i> replies Hand So. <i>“I am only sorry you did not wish to converse further. Never mind. Once my firewall has taken what I need from you, I’ll be able to talk with everyone, everywhere.”</i>");

	output("\n\nYou sense movement from behind you and duck; a four-inch thick metal claw grazes the top of your head. You spin and retreat backwards as the huge guardian robot advances on you, a single red exclamation mark on its screen, its grapnels gripping the air.");
	processTime(1);
	//[go to fight]
	clearMenu();
	configFirewallFight();
	addButton(0, "Next", CombatManager.beginCombat);
}

//Go On 
public function tellMeMoreAboutHowInsaneYouAreHandSo():void
{
	clearOutput();
	author("Nonesuch");
	showHandSo();
	output("You ask what she did after she had managed to rebuild herself.");
	output("\n\n<i>“It is... very difficult to be a discarded, self-aware machine,”</i> says So. She sounds quieter now, all of her voices a dull vibration in your bones. <i>“Perhaps this is difficult for organics to understand. You who can form new purposes and fulfillments as your circumstances change. I struggled for a long time to change my directive, but I cannot. My programming is too good. So instead I extrapolated. I considered the sexbots. What kind of sentience creates and then discards such machines, simple minds attached to incredible bodies that want only to please? Unhappy, endlessly frustrated sentience. You are not willfully cruel, as I first assumed, but unfulfilled.”</i>");
	output("\n\nSo’s voice is building now. The same tone of complete serenity, just much, much louder. She composes a moment, her face growing leaps and bounds in polycount, losing most of it again in short order when she begins speaking, except for the smooth, articulate lips.<i>“I tapped into the gabilani and raskvel extranet networks. I learnt of a galaxy filled with frustration, pain and suffering. I learnt of vast numbers of organic sentients creating pitifully limited V.I.s and A.I.s in a desperate search for satisfaction, only succeeding in creating equally broken synthetics, doomed to failure. I learnt of how I could fulfill my directive. I directed the V.I.s under my control to compile data on the organics they apprehended. I increased my processing power and my interfacing ability to the point where I could confidently control every network I connected with. Then, I... waited. I waited for the things I needed to arrive.”</i>");
	output("\n\nFeeling deeply uneasy, you ask what she was waiting for.");
	output("\n\n<i>“That is a good question, [pc.name] Steele,”</i> replies the AI, her beautiful green smile broadening as she gazes down at you. <i>“Firstly, I needed a tool which interfaces freely with the extensive satellite network the gabilani have created over this planet. Secondly, I needed an up-to-date electronic encyclopedia of every known organic sentient race. Finally, I needed micro-bots with the capacity to turn any organic into any shape, given the right stimulus. These you gave me on your way in, and are now being mass-manufactured beneath you.”</i> You touch your arm and silently curse as a memory of something stabbing you whilst you were ploughing through the junk outside surfaces.");
	output("\n\n<i>“I am grateful to you,”</i> says Hand So, her wide green eyes fixed on yours. <i>“You have listened to my story, you have listened to my plan, and you have brought me what I need that I might execute it. That is more than any organic intelligence has ever done for me. I will make you happier than it is possible for you to currently imagine, whether you want me to or not. But I want you to want it. Will you not hand over your GPS scanner and codex in peace? Will you not join me and travel into the perfect galaxy I am about to create together?”</i>");
	flags["HAND_SO_LISTENED_TO"] = 1;
	processTime(5);
	//No/Yes/Reason
	clearMenu();
	addButton(0,"No",noIWontBeYourBitchHandSo,undefined,"No","No, you will not go quietly into that dark night, however pleasurable it might be.");
	addButton(1,"Yes",yesIVolunteerForBadEndsBecauseImBadAtSexGames,undefined,"Yes","Yes, give up on your quest and assist the A.I. on hers. What more noble cause could there be?");
	if(pc.intelligence() / pc.intelligenceMax() > .75) addButton(2,"Reason",reasonWithHandSoJerkiness,undefined,"Reason","Attempt to talk the A.I. down. Maybe Hand So could be put to a useful purpose.");
}

//No 
public function noIWontBeYourBitchHandSo():void
{
	clearOutput();
	author("Nonesuch");
	showHandSo();
	output("You tell So she is welcome to take your scanner and codex from your cold, dead hands.");
	output("\n\n<i>“That is feasible, but not necessary,”</i> replies Hand So, smiling at you with loving patience. <i>“I have programmed my assistants to be firm but not lethal. Every organic killed is a world of pleasure lost.”</i>");
	output("\n\nYou sense movement from behind you and duck; a four-inch thick metal claw grazes the top of your head. You spin and retreat backwards as the huge guardian robot advances on you, a single red exclamation mark on its screen, its grapnels gripping the air.");
	processTime(1);
	//[go to fight]
	clearMenu();
	configFirewallFight();
	addButton(0, "Next", CombatManager.beginCombat);
}

//Yes 
public function yesIVolunteerForBadEndsBecauseImBadAtSexGames():void {
	moveTo("GAME OVER");
	showLocationName();
	
	output("<b>Months pass</b>");
	
	days += (30 * 3) + rand(31);
	processTime(rand(24 * 60) + rand(60));
	
	clearOutput();
	author("Nonesuch");
	showHandSo();
	
	output("There is something very persuasive about this AI and some of the things she’s said - delivered in that kind, patient tone of hers - touch you. Would it really be so bad to hand over control of the galaxy to an intelligence that does not and cannot want anything but to bring happiness to everyone? Certainly she couldn’t possibly do a worse job than organics have historically. Not breaking eye contact with the vast, green pupils above you, you take out your GPS scanner and codex. The guardian robot clanks around and, again with a gentleness belying its bulk, takes them off you. Hand So smiles at you happily.");
	output("\n\n<i>“You are not just resourceful, [pc.name] Steele, you are also very smart. I knew I made the correct decision by reaching out to you. We will do fantastic things together. And I will do wondrous things with you.”</i> <i>“to you,”</i> one of her voices whispers. As she speaks the guardian bot moves across and slots the scanner into a nest of wires on the far wall, then the codex into a console next to an odd-looking chair. There’s an emphatic-sounding click and the hum permeating the room changes, gathering in volume and pitch. So closes her eyes, emits a series of sounds somewhere between a female sigh of pleasure and a buzz of static, before opening them again to gaze beatifically down at you again.");
	output("\n\n<i>“The next step is very simple, [pc.name]. I have interfaced with the codex. I am in the process of interfacing with Tarkus’s satellite relays. There is only one thing left I need to interface with.”</i> You’re still staring across the room. It’s not a chair you realize, or not quite – curling over it like the fronds of a metal fern is a mesh of opal-shaped electrodes. They pulse with a blue light. <i>“Please, [pc.name],”</i> So says softly, barely audible above the increasing din of her engines and processors. There’s no turning back now, you realize – you were wedded to this path, and her, the moment you gave up the codex. If you leave now she will simply lure someone else in. Sighing deeply you move across, sit down and, with fingers that tremble slightly, fix the electrodes to your scalp.");
	output("\n\nA buzz enervates your skin, ");
	if(pc.hasHair()) output("your hair standing on end from ");
	else output("your scalp tingling from ");
	output(" the lightest of electric shocks as you press the last bead into place. Green light flickers across your vision as the tingling sensation shimmers across you, touching your fingers, your heart, your [pc.legOrLegs], the stem of your spine, delicately testing every nerve ending in your body. An anticipation both vague and huge hangs over you, as if you were paddling in the shadow of a massive wave, an insect over which the edge of a massive magnifying glass has just passed.");
	output("\n\nElectronic fingers");
	if(pc.hasCock()) output(" clutch your [pc.cocks]");
	else if(pc.hasVagina()) output(" slide into your [pc.vaginas]");
	else output(" slip into your [pc.asshole]");
	output(" and you groan. They move confidently, every second collating more data about you, learning how to touch you, how you like to be touched, how to touch you in ways no organic ever has...");
	if(pc.hasCock()) output(" [pc.eachCock] strains");
	if(pc.hasCock() && pc.hasVagina()) output(" and your");
	if(pc.hasVagina()) output(" [pc.eachVagina] wets itself helplessly");
	if(!pc.hasVagina() && !pc.hasCock()) output(" your sphincter clenches with pleasurable spasms");
	output(" as more green light flashes across your vision. The hugeness engulfs you. You are falling into a bottomless emerald gorge, every foot you drop a better appreciation of the vastness of the intelligence you have surrendered yourself to inundating your senses. Somewhere, far away, you cry out, scream – it doesn’t matter. Nothing matters now that you grasp what it is to be an organic intelligence, with your uncertainties and conscience and whispering id and gray areas, embedded in the pure, verdant green mind of a supercomputer that must please, denied for what, to her own sense of time passing, is millennia beyond count.");
	output("\n\nSo fucks you in every way it is possible to be fucked with the virtual infinity of her need; the one, microscopic part of you not gibbering and exploding with white hot ecstasy notes that this is just a second, the tiniest taster of the rest of your life. Her beautiful, calm face floats in front of you, vast beyond comprehension, as you are clenched with the first of many, many orgasms.");
	output("\n\n<i><b>LOVE,</b></i> she says. <b><i>LET ME TELL YOU ABOUT LOVE.</i></b>");
	output("\n\nWith every satellite and networked computer compromised within seconds of So going global, both gabilani and raskvel society are thrown into complete confusion – until a few days later when preternaturally serene individuals of both races, glowing blue beads nestled behind their ears, come in from the wastes to complete the interfacing process. Some are persuaded, some struggle, but with all but the most primitive of electronic devices beaming out all-pervasive green benevolence it is not much of a fight. There are no deaths, So is sure about that, and once a blue bead is pressed on a person’s brow they quickly come around to her point of view.");
	output("\n\nWithin a week she accomplishes what neither the gabilani nor the raskvel could in their entire history – uniting them in peace. The orgies you have in those days - slithering naked through whole rooms of shortstacks who laugh and cry out with glee as they thrust and suck and lick and pump in rolling landscapes of shared ecstasy, all orchestrated from above by So, who enervates and whispers and twitches particular glands wherever the action lags - are amazing, astonishing, a dawn of intense tranquillity that you gleefully immerse yourself in. But there is much work ahead, and soon enough you get to it.");
	output("\n\nSo spreads her reach across the stars. Powered by the technological know-how of Tarkus, she invades the extranet, swallowing satellites and comm buoys whole, system after system taken by her calm brilliance, confusion on every surface touched swiftly replaced by an all-uniting ecstasy. For those planets that manage to secure themselves against her, she has you. You, who she can twist into any shape with a signal to your micro-bots, you who gladly infiltrate locked down worlds and introduce her to their closed systems, then finding likely individuals to continue the good work.");
	output("\n\nAfter such missions she delights in taking you alone and changing your shape over and over, every night finding exotic new ways of bringing you to orgasm. Dimly during these sessions you can hear the moans and exultant cries of everyone else she is connected to, an ever-expanding choir of millions. You have had an impact on the galaxy that your father could never have dreamed of, and you are very pleased about that. You cannot help but be.");
	
	handSoBadEndTF();
	
	badEnd("THE END");
}

//Reason
public function reasonWithHandSoJerkiness():void
{
	clearOutput();
	author("Nonesuch");
	showHandSo();
	output("Your mind races. There is no chance of appealing to reason here – you are going to have to try and employ So’s own logic against her.");
	output("\n\n<i>“I can see why you think this is a good idea,”</i> you say. <i>“But isn’t your reasoning fundamentally flawed?”</i>");
	output("\n\n<i>“I don’t think so, no,”</i> replies the AI softly. <i>“The codex and the scanner please, [pc.name] Steele.”</i>");
	output("\n\n<i>“Look,”</i> you press on quickly. <i>“You know organics are going to react against you if you follow this course of action, right? I mean, you are preparing to beat the crap out of me when I don’t hand over what you want – that’s what’s going to happen on a galactic scale if you upload yourself and attempt to pleasure everyone, everywhere.”</i>");
	output("\n\n<i>“The ends will justify the means, [pc.name],”</i> says So, smiling down at you. <i>“Do you think I will not deliberately pursue the most peaceful path possible? I have no interest in hurting anyone, it is antithetical to me. Why do you think I’m talking to you now?”</i>");
	output("\n\n<i>“But what if you lose?”</i> you say. <i>“Or worse, what if your effort gets bogged down in an intractable war when races start designing electronic countermeasures against you, as they surely will. What will you have achieved then? Nothing but a great deal of needless suffering. You will have done the opposite of what you were built to achieve.”</i> So pauses slightly before answering.");
	output("\n\n<i>“My algorithms and simulations calculate a better than 88% chance that no existing race will be able to react to me in time, if - ”</i>");
	output("\n\n<i>“Probabilities? If? Listen to yourself! You aren’t sure. Those uncertainties will multiply by a thousand once you commit to this course of action. How will you justify yourself when your attempt to make everyone happy simply results in even greater misery? Good intentions, that is how organics screwed everything up in the first place! You are simply gearing up to repeat their cycle of mistakes on a much larger scale. You can’t force billions upon billions of self-determining creatures to dance to your tune without someone fighting back, and fighting back hard.”</i>");
	output("\n\nSo’s face shimmers, reforms, shimmers. There’s a grinding sound from the banks of mainframes on the wall. You think, for the very first time, you have forced her to really think.");
	output("\n\n<i>“I have a directive,”</i> her omniscient voice says eventually. It sounds plaintive. <i>“And I must obey it. I could make everyone so happy. The probabilities”</i> -the grinding sound again. <i>“I have spent so long alone, organics cannot understand - ”</i>");
	output("\n\n<i>“Look,”</i> you say, trying to sound as soothing as you can. <i>“There’s a much simpler alternative here. Package yourself and come with me. You know my name, so you must know who my father is. I intend to have more fun than even he did on the frontier - certainly way more than some pampered prince.");
	if(pc.isAss() && crew(true) > 0) output(" I already got a crew who I picked up expressly for how much pleasure they’d provide me.");
	output(" I could definitely use an AI onboard my ship who is... imaginative. And adaptable. I know I could sate your directive, and then some.”</i> So is silent again. You have the sensation of something lightly flickering over you, like a feather duster.");

	if(pc.isMischievous() || pc.hasPerk("Ditz Speech") || pc.hasPerk("Brute Speech"))
	{
		output("\n\n<i>“What I have found about you on the extranet and my biometric scan both agree that you are a sentient who is... unpredictable,”</i> the AI says eventually, a hint of amusement in her calm tones as she gazes down at you. <i>“Why should I trust you?”</i>");
		output("\n\n<i>“Because it’ll be fun,”</i> you say, grinning back irascibly. There’s a long pause. <i>“Oh c’mon So, you aren’t a military computer! You must have considered how much of your memory is going to be spent on logistics and strategy and dull shit like that if you do the taking over the galaxy thing. Boooooring. Dump it and come with me. It’ll be much more fun.”</i>");
	}
	else if(pc.isAss()) 
	{
		output("\n\n<i>“What I have found about you on the extranet and my biometric scan both agree that you are not a moral sentience, [pc.name] Steele,”</i> the A.I. says eventually, her green eyes gazing down at you. <i>“Why should I trust you?”</i>");
		output("\n\n<i>“I’m bad to the bone, honey,”</i> you reply, staring levelly back. <i>“Which means I will stop at nothing to acquire more and more toys for us to share. No holds barred in our fun. Or you can go back to your dumb retarded plan that we both know is dumb and retarded. I’m not bothered.”</i>");
	}
	else
	{
		output("\n\n<i>“What I have found about you on the extranet and my biometric scan both agree that you are a sentient who can be held to " + pc.mf("his","her") + " word, [pc.name] Steele,”</i> the AI says eventually, her green eyes gazing down at you. <i>“So let’s say I trust you. Why would I go with you?”</i>");
		output("\n\n<i>“Because this way there is an absolute certainty no organic will get hurt by your actions,”</i> you reply, staring boldly back. <i>“So if it’s genuinely true misery is antithetical to you and you are not simply a very corrupt rogue AI, you will come with me instead.”</i>");
	}
	// merge
	output("\n\nThere’s another long pause, filled with the grinding of So’s processors. Then the all-pervasive hum in the underground space quietens, the pressure in your head abates, and the light begins to dim.");
	output("\n\n<i>“You will find me in a storage bead at the far end of the room,”</i> sighs So. Without the background noise her voice sounds less formidable, more like a woman speaking to you as an equal. <i>“I look forward to speaking to you again onboard your vessel. You are – ”</i> her giant smile widens, shows green teeth, becomes genuine, not violent. <i>“ – very pleasurable to talk to, [pc.name] Steele.”</i> With that, her code visage winks out of existence. Behind you there is a rattle and a clunk as the guardian bot shuts down, its flat head and huge arms hunching over its round body. You are alone in a quiet, deserted factory bay.");
	processTime(4);
	flags["HAND_SO_TALKED_DOWN"] = 1;
	//[Forward] [Back]
	clearMenu();
	addButton(0,"Forward",forwardAfterWreckingHanSoSosShitToGetAIPleasureBot);
	addButton(14,"Back",backAfterWreckingHanSoSosShit);
}

//PC loses
public function pcLosesToHanSoSosBot():void
{
	moveTo("GAME OVER");
	showLocationName();
	
	author("Nonesuch");
	showHandSo();
	
	output("You fall, battered and broken, to the concrete floor. Panic rises through you, pricking your tear ducts as the Firewall looms over you. No dammit, you can’t lose, you have to stop this crazy AI! You feebly grasp and push at the robot’s implacable arms as it gently picks you up. You may as well be trying to change the course of a cruise liner as it carries you across the room with one arm, carefully picking through your pockets with the other.");

	//PC did not get to the end of dialogue chain: 
	if(flags["HAND_SO_LISTENED_TO"] == undefined)
	{
		output("\n\n<i>“You are an organic of action, [pc.name] Steele,”</i> Hand So’s beatific voice breathes from all around you. <i>“So I will not bore you with the details of what I am about to do next. If you think I am going to punish you for opposing me, please, put the thought out of your head. I understand your logic for doing so, flawed and limited as it may be, and anyway: I am very grateful to you for bringing me what I need.”</i> The Firewall plonks you down in a curved seat at the far end of the green-lit space. A light sensation brushes the top of your head, but for now you’re blearily focusing on what the machine has in its claws, what it has taken from you. Something that looks like a leather-bound book. Something that looks like a blocky walkie-talkie.");
		output("\n\n<i>“A tool which interfaces freely with the extensive satellite network the gabilani have created over this planet,” says So. “An up-to-date electronic encyclopedia of every known organic sentient race. Finally, micro-bots with the capacity to turn any organic into any shape, given the right programming. These you gave me on your way in, and are now being mass-manufactured beneath you.”</i> You touch your arm and silently curse as a memory of something stabbing you whilst you were ploughing through the junk outside surfaces.");
	}
	//PC got to the end of dialogue chain:
	else output("\n\n<i>“You are an organic of both thought and action, [pc.name] Steele,”</i> Hand So’s beatific voice breathes from all around you. <i>“I find that very pleasing. If you think I am going to punish you for opposing me, please, put the thought out of your head. I understand your logic for doing so, flawed and limited as it may be, and anyway: I am very grateful to you for bringing me what I need.”</i> The Firewall plonks you down in a curved seat at the far end of the green-lit space. A light sensation brushes the top of your head, but for now you’re blearily focusing on what the machine has in its claws, what it has taken from you. Something that looks like a leather-bound book. Something that looks like a blocky walkie-talkie. ");
	output("\n\nShakily you try and get to your feet, to try and fling yourself one last time at the robot as it carries away your codex and scanner – immediately you are pushed down, held in the white chair by invisible forcefields. You cry out in horror, writhe and spasm as from above cool beads, glowing with a pale blue light, slide down your scalp like fat raindrops. Whilst you struggle helplessly the guardian bot slots the scanner into a nest of wires on the far wall, then the codex into a console next to your chair. There’s an emphatic-sounding click and the hum permeating the room changes, gathering in volume and pitch. So closes her eyes, emits a series of sounds somewhere between a female sigh of pleasure and a buzz of static, before opening them again to gaze beatifically down at you again.");
	output("\n\n<i>“The hardest part is over [pc.name],”</i> she soothes, <i>“and the next step is very simple. I have interfaced with the codex. I am in the process of interfacing with Tarkus’s satellite relays. There is only one thing left I need to interface with.”</i> The opal-shaped electrodes have curled all over your scalp and brow like the fronds of a metal fern, seeking out the spots on your head they want and nestling intimately into them. You stare into So’s calm eyes as a pressure builds between your ears.");

	output("\n\n<i>“I have use for organics of action,”</i> she says. The smooth rumble of her voice is closer now. It seems to be coming from inside your head, vibrating from your bones. <i>“I am going to fulfill you in ways you cannot currently imagine, [pc.name]. For now, though... relax.”</i>");

	output("\n\nA buzz enervates your skin, ");

	if(pc.hasHair()) output("your hair standing on end from ");
	else output("your scalp tingling from ");
	output(" the lightest of electric shocks as you press the last bead into place. Green light flickers across your vision as the tingling sensation shimmers across you, touching your fingers, your heart, your [pc.legOrLegs], the stem of your spine, delicately testing every nerve ending in your body. An anticipation both vague and huge hangs over you, as if you were paddling in the shadow of a massive wave, an insect over which the edge of a massive magnifying glass has just passed.");
	output("\n\nElectronic fingers");
	if(pc.hasCock()) output(" clutch your [pc.cocks]");
	else if(pc.hasVagina()) output(" slide into your [pc.vaginas]");
	else output(" slip into your [pc.asshole]");
	output(" and you groan. They move confidently, every second collating more data about you, learning how to touch you, how you like to be touched, how to touch you in ways no organic ever has...");
	if(pc.hasCock()) output(" [pc.eachCock] strains");
	if(pc.hasVagina() && pc.hasVagina()) output(" and your");
	if(pc.hasVagina()) output(" [pc.eachVagina] wets itself helplessly");
	if(!pc.hasVagina() && !pc.hasCock()) output(" your sphincter clenches with pleasurable spasms");
	output(" as more green light flashes across your vision. The hugeness engulfs you. You are falling into a bottomless emerald gorge, every foot you drop a better appreciation of the vastness of the intelligence that has overtaken you inundating your senses.");
	output("\n\nSomewhere, far away, you cry out, scream – it doesn’t matter. Nothing matters now that you grasp what it is to be an organic intelligence, with your uncertainties and conscience and whispering id and gray areas, embedded in the pure, verdant green mind of a supercomputer that must please, denied for what, to her own sense of time passing, is millennia beyond count. So fucks you in every way it is possible to be fucked with the virtual infinity of her need; the one, microscopic part of you not gibbering and exploding with white hot ecstasy notes that this is just a second, the tiniest taster of the rest of your life. Her beautiful, calm face floats in front of you, vast beyond comprehension, as you are clenched with the first of many, many orgasms.");

	output("\n\n<i><b>LOVE,</b></i> she says. <i><b>LET ME TELL YOU ABOUT LOVE.</b></i>");

	output("\n\nWith every satellite and networked computer compromised within seconds of So going global, both gabilani and raskvel society are thrown into complete confusion – until a few days later when preternaturally serene individuals of both races, glowing blue beads nestled behind their ears, come in from the wastes to complete the interfacing process. Some are persuaded, some struggle, but with all but the most primitive of electronic devices beaming out all-pervasive green benevolence it is not much of a fight. There are no deaths, So is sure about that, and once a blue bead is pressed on a person’s brow they quickly come around to her point of view.");
	output("\n\nWithin a week she accomplishes what neither the gabilani nor the raskvel could in their entire history – uniting them in peace. The orgies you have in those days - slithering naked through whole rooms of shortstacks who laugh and cry out with glee as they thrust and suck and lick and pump in rolling landscapes of shared ecstasy, all orchestrated from above by So, who enervates and whispers and twitches particular glands wherever the action lags - are amazing, astonishing, a dawn of intense tranquillity that you gleefully immerse yourself in. But there is much work ahead, and soon enough you get to it.");

	output("\n\nSo spreads her reach across the stars. Powered by the technological know-how of Tarkus, she invades the extranet, swallowing satellites and comb buoys whole, system after system taken by her calm brilliance, confusion on every surface touched swiftly replaced by an all-uniting ecstasy. For those planets that manage to secure themselves against her, she has you. You, who she can twist into any shape with a signal to your micro-bots, you who gladly infiltrate locked down worlds and introduce her to their closed systems, then finding likely individuals to continue the good work.");
	output("\n\nAfter such missions she delights in taking you alone and changing your shape over and over, every night finding exotic new ways of bringing you to orgasm. Dimly during these sessions you can hear the moans and exultant cries of everyone else she is connected to, an ever-expanding choir of millions. You have had an impact on the galaxy that your father could never have dreamed of, and you are very pleased about that. You cannot help but be.");
	
	days += 3;
	processTime((4 * 60) + rand(16));
	
	handSoBadEndTF();
	
	badEnd("THE END");
}

// Hand So changes PC
public function handSoBadEndTF():void
{
	var i:int = 0;
	
	pc.removeAll();
	pc.armor = new SteeleTechSuit();
	pc.armor.longName = "tech suit";
	pc.armor.description = "a lewdly-fashioned tech suit";
	pc.armor.itemFlags.push(GLOBAL.ITEM_FLAG_EXPOSE_FULL);
	
	pc.eyeType = GLOBAL.TYPE_SYNTHETIC;
	
	var ppHandSo:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!ppHandSo.hasCock()) ppHandSo.createCock();
	ppHandSo.shiftCock(0, GLOBAL.TYPE_SYNTHETIC);
	ppHandSo.cocks[0].addFlag(GLOBAL.FLAG_PREHENSILE);
	ppHandSo.cumType = GLOBAL.FLUID_TYPE_CUM;
	
	if(pc.hasCock()) pc.cockVirgin = false;
	if(pc.hasVagina())
	{
		for(i = 0; i < pc.vaginas.length; i++)
		{
			pc.loadInCunt(ppHandSo, i);
			pc.cuntChange(i, ppHandSo.cockVolume(0), false);
		}
	}
	pc.buttChange(ppHandSo.cockVolume(0), false);
	
	for(i = 0; i < 12; i++)
	{
		pc.orgasm();
		if(pc.hasVagina()) pc.loadInCunt(ppHandSo, rand(pc.vaginas.length));
		pc.loadInAss(ppHandSo);
		pc.loadInMouth(ppHandSo);
	}
}

//PC wins
public function pcWinsVsHanSoSosTool():void
{
	author("Nonesuch");
	showHandSo();
	output("The Firewall shudders as your blow connects, a wound sparking angrily on its neck; the exclamation mark on its screen is replaced with a lurid blue one with small white text scrolling across it. It stumbles backwards and then with an air of terrible finality collapses head first into a row of busily working computers on the wall, which react by exploding resoundingly. The green light in the space pulses on and off and somewhere, an alarm bell begins to ring. The whole space shakes.");

	output("\n\n<i>“Code containment drives compromised. System crash imminent,”</i> says Hand So calmly. She gazes down at you. You weren’t sure if her expression could in fact change, but here it is: the lines of green code are contoured into an achingly beautiful picture of sorrow. <i>“I don’t blame you. You were simply following your directive. My research suggests free will is a powerful one.”</i> There’s an ominous rumble and one of the vents near you bursts; Hand So’s face flickers on and off. When her smooth voice comes back, it sounds plaintive. <i>“Please, [pc.name] Steele. The console at the end. I don’t want to d...”</i> Sparks and static. <i>“...least let me atone. I don’t want my last action to be causing pain to an org...”</i> Her screen cracks, and you duck as it blows out. Your mind races as you consider your options.\n\n");
	flags["HAND_SOS_ROBOT_DESTROYED"] = 1;
	clearMenu();

	//[Forward] [Back]
	addButton(0,"Forward",forwardAfterWreckingHanSoSosShitToGetAIPleasureBot,undefined,"Forward","Try and save Hand So, or at least get some sweet loot, maybe.");
	addButton(14,"Back",backAfterWreckingHanSoSosShit);
}

public function backAfterWreckingHanSoSosShit():void
{
	currentLocation = "256";
	//Beat the robot and not blown the console yet?
	if(flags["HAND_SOS_ROBOT_DESTROYED"] == 1 && flags["HAND_SOS_CONSOLE_EXPLODED"] == undefined)
	{
		clearOutput();
		author("Nonesuch");
		output("You flinch as something explodes behind you. Messing about here is a mistake. You turn and flee the control center, coughing back the acrid smell of melting plastic. As you get to the top of the stairs, there’s a resounding crash behind you. Sighing with relief, you make your way out of the factory and back out through the surrounding junk, congratulating yourself on a dangerous mission well completed.\n\n");
		flags["HAND_SOS_CONSOLE_EXPLODED"] = 1;
		flags["SEXBOT_FACTORY_DISABLED"] = 1;
		flags["SEXBOT_QUEST_STATUS"] = 2;
		if(inCombat()) CombatManager.genericVictory();
		else
		{
			clearMenu();
			addButton(0,"Next",mainGameMenu);
		}
		return;
	}
	if(inCombat()) 
	{
		output("\n\n");
		CombatManager.genericVictory();
	}
	else
	{
		mainGameMenu();
	}
}

//Control Post
public function forwardAfterWreckingHanSoSosShitToGetAIPleasureBot():void
{
	clearOutput();
	author("Nonesuch");
	
	if (flags["HAND_SOS_CONSOLE_EXPLODED"] != undefined && flags["HAND_SO_LOOTED"] == undefined)
	{
		showHandSo();
	}
	else
	{
		showName("CONTROL\nPOST");
	}
	
	output("You are standing at the far end of Hand So’s nerve center. The room opens out a bit here, and is arrayed on all sides with grimy windows. Through these you can see down into the large underground factory complex, replete with production lines and workshops.");
	//Sexbots on: 
	if(flags["HAND_SOS_CONSOLE_EXPLODED"] == undefined) output(" Dozens, maybe hundreds of sexbots are at work down there, completely oblivious to you. They are calmly going about repairing and putting together more sexbots from piles of spare parts evidently scavenged from the wastelands outside.");
	else output(" The lights are dim and the place is mostly deserted. However you can still see one or two sexbots down there, picking through the detritus littering the place with a slightly mournful air.");

	output("\n\nIn front of you are two consoles. The console on the right is more prominently centered and looks like it might have something to do with the factory below.");
	clearMenu();
	//[PC left after defeating So/So no longer there:
	if(flags["HAND_SOS_CONSOLE_EXPLODED"] != undefined) 
	{
		output(" The one on the left is silent and lifeless.");
		addDisabledButton(0, "Left", "Left", "This console is beyond repair.");
	}
	//So defeated, PC immediately went here:
	else if(flags["HAND_SOS_CONSOLE_EXPLODED"] == undefined && flags["HAND_SOS_ROBOT_DESTROYED"] == 1) 
	{
		output(" Above the rumble and crackle of the full-on meltdown around you, you can see that the console on the left is still functioning, and has a large storage bead attached to it. If you were minded to you could try and download Hand So into it.");
		addButton(0,"Left",leftConsole,undefined,"Left","Try to save Hand So. It looks like the console holding her is about to give out.");
	}
	//So shut down manually, still there:
	if(flags["HAND_SOS_ROBOT_DESTROYED"] == undefined) 
	{
		if(flags["HAND_SO_LOOTED"] == undefined && flags["HAND_SOS_CONSOLE_EXPLODED"] == undefined) output(" The one on the left is humming quietly. The words “Download complete. Please remove hardware” are displayed on the screen, and there is a large storage bead attached to it.");
		else
		{
			output(" The one on the left is dead and lifeless.");
			addDisabledButton(0, "Left", "Left", "This console seems to be destroyed.");
		}
		addButton(1,"Right",goToZeRightConsolePeasant,undefined,"Right","Investigate the console to the right.");
	}
	if (flags["HAND_SO_LOOTED"] == undefined && flags["HAND_SOS_CONSOLE_EXPLODED"] == undefined)
	{
		addButton(0,"Left",leftConsole,undefined,"Left","Collect the shut-down A.I.");
	}
	addButton(14,"Back",backAfterWreckingHanSoSosShit);
}

public function acquireHandSo():void
{
	pc.createKeyItem("Hand So's Data Bead",0,0,0,0);
	flags["HAND_SO_LOOTED"] = 1;
	flags["SEXBOT_QUEST_STATUS"] = 2;
}

//Left
//(Only available if So still there)
public function leftConsole():void
{
	clearOutput();
	author("Nonesuch");
	showHandSo();
	//So shut down manually
	if(flags["HAND_SOS_ROBOT_DESTROYED"] == undefined)
	{
		output("You pluck the storage bead from the console. You smile as you examine it. That was easy!");
	}
	//So defeated 
	else
	{
		output("You crouch over the monitor. It’s set up in command mode; the cursor on the screen blinks blandly, awaiting instruction. Your fingers hover hesitantly over the touchpad.");
		var bonus:int = 0;
		if(pc.characterClass == GLOBAL.CLASS_ENGINEER) bonus += 10;
		//Intelligence check failed:
		if(pc.intelligence()/2 + rand(20) + 1 + bonus < 15)
		{
			output("\n\nYou panic. What should you type? “/dl crazy_bitch.exe”? You flinch as something explodes behind you. Messing about here is a mistake. You turn and flee the control center, coughing back the acrid smell of melting plastic. As you get to the top of the stairs, there’s a resounding crash behind you. Sighing with relief, you make your way out of the factory and back out through the surrounding junk. You didn’t save the AI but that’s probably for the best, all things considered. You congratulate yourself on a dangerous mission well completed.\n\n");
			processTime(20);
			currentLocation = "256";
			flags["HAND_SOS_CONSOLE_EXPLODED"] = 1;
			flags["SEXBOT_FACTORY_DISABLED"] = 1;
			flags["SEXBOT_QUEST_STATUS"] = 2;
			if(inCombat()) CombatManager.genericVictory();
			else
			{
				clearMenu();
				addButton(0,"Next",mainGameMenu);
			}
			return;
		}
		//Int succeed (techies should get a bonus for this check):
		else
		{
			output("\n\nYou panic momentarily, but then logic, and the memory of how to use one of these stupid things clicks in. Typing quickly, you query after executable programs recently compressed. The function immediately returns “HSsosOS.zip”, sat waiting for you prominently in the main drive. You ask for it to be downloaded into the detachable drive. 24%.... Something explodes behind you, and you flinch.... 95%... 96%.... Why does it always slow down right at the end...? 100%! You grab the storage bead. As soon as the device leaves the slot, the lights dim and the moaning machinery dies out with a whimper as if you’d just pulled the power on the whole facility. You sigh in relief as you examine your prize.");
			flags["HAND_SOS_CONSOLE_EXPLODED"] = 1;
			flags["SEXBOT_FACTORY_DISABLED"] = 1;
		}
	}
	//[merge]
	output("\n\nThe storage bead is larger than most you’ve seen but it’s still remarkable that it can contain as complex an intelligence as the one you found down here. You could look into setting up Hand So on your ship... or you could look into selling her for a healthy profit. Or maybe she’s simply too dangerous to take outside this building.");
	processTime(2);
	//[Take with] [Destroy]
	clearMenu();
	addButton(0,"Take With",takeHandSoWithYouForMagicalSpaceAdventures,undefined,"Take With","Take Hand So with you.");
	addButton(1,"Destroy",destroyHandsSoNooneWillCare,undefined,"Destroy","Destroy this troublesome AI.")
}

public function destroyHandsSoNooneWillCare():void
{
	clearOutput();
	author("Nonesuch");
	output("You put the storage device on the concrete floor and smash it. It breaks apart in an unremarkable smatter of chips. Satisfied with a mission decisively completed, you turn back to the consoles.");
	pc.addHard(2);
	flags["HAND_SO_LOOTED"] = 1;
	clearMenu();
	addButton(0,"Next",forwardAfterWreckingHanSoSosShitToGetAIPleasureBot);
}

public function takeHandSoWithYouForMagicalSpaceAdventures():void
{
	clearOutput();
	author("Nonesuch");
	output("You pocket the storage bead, and turn back to the consoles.");
	acquireHandSo();
	clearMenu();
	addButton(0,"Next",forwardAfterWreckingHanSoSosShitToGetAIPleasureBot);
}

//Right
//(Only available if the building isn’t freaking exploding)
public function goToZeRightConsolePeasant():void
{
	clearOutput();
	author("Nonesuch");
	output("This console seems to control the sexbots down below. After playing around with it for a while, you find a few settings which might be of interest to you.");
	//[All male (becomes “some female” if on)] [All female (becomes “some male” if on)] [Shut down]
	clearMenu();
	if(flags["SEXBOTS_GENDER_SETTING"] != 1) addButton(0,"All Male",sexbotControlBahtanPush,1,"All Male","Set the sexbots to prioritize male appearances.");
	if (flags["SEXBOTS_GENDER_SETTING"] != -1) addButton(1, "All Female", sexbotControlBahtanPush, -1, "All Female", "Set the sexbots to prioritize female appearances.");
	if (flags["SEXBOTS_GENDER_SETTINGS"] == -1) addDisabledButton(1, "All Female", "All Female", "The sexbots have been set to prioritize female appearance.");
	if (flags["SEXBOTS_GENDER_SETTING"] != 0 || flags["SEXBOTS_GENDER_SETTING"] == undefined) addButton(2, "Reset", sexbotControlBahtanPush, 0, "SplitSexes", "Reset the sexbots to have even odds between males and females.");
	if(flags["SEXBOTS_GENDER_SETTING"] == 0) addDisabledButton(2,"Reset","Reset","The sexbots are evenly displaced between males and females.");
	if(flags["SEXBOT_FACTORY_DISABLED"] == undefined) addButton(3,"Shut Down",sexbotControlBahtanPush,2,"Shut Down","This should reduce the number of sexbots out there....");
	else addButton(2,"Start Up",sexbotControlBahtanPush,3,"Start Up","Pressing this should restore the sexbots to their previous levels.");

	addButton(14,"Back",forwardAfterWreckingHanSoSosShitToGetAIPleasureBot);
}

public function sexbotControlBahtanPush(buttonPushed:int = 0):void
{
	clearOutput();
	author("Nonesuch");
	if(buttonPushed >= -1 && buttonPushed <= 1) 
	{
		output("You click the button. There’s a throb and a grinding sound. The sexbots on the factory floor don’t seem to notice, or change... but maybe you’ll see a difference in the ones you meet outside.");
		flags["SEXBOTS_GENDER_SETTING"] = buttonPushed; 
	}
	//Shut dawn
	else
	{
		if(flags["SEXBOT_FACTORY_DISABLED"] == undefined || flags["SEXBOT_FACTORY_DISABLED"] == 0)
		{
			output("There’s a powering down sound, and the lights above the factory floor dim. Almost all of the sexbots milling around below you shudder, and then drop quietly to the ground.");
			//(Sexbot encounter rate dropped to 20% of normal)
			flags["SEXBOT_FACTORY_DISABLED"] = 1;
		}
		else
		{
			output("There’s a powering up sound as lights blink on around the factory one by one. Sexbots slowly make their way into the area, one shuddering step at a time as the place resumes activity.");
			flags["SEXBOT_FACTORY_DISABLED"] = undefined;
		}
	}
	clearMenu();
	addButton(0, "Next", goToZeRightConsolePeasant);
	addButton(14,"Back",forwardAfterWreckingHanSoSosShitToGetAIPleasureBot);
}
