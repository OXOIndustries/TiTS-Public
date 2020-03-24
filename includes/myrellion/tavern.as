//The Tavern - The Golden Peak
//IMPORTANT NOTE
//The first time the PC enters the Myrellion Tavern, KaraQuest 1 triggers! Go to that doc for sweet deets. 
//https://docs.google.com/document/d/1G_hmZvUYehxytaCG2hL3n4CIBZWKMkLMx556ElHigNM/edit#heading=h.tuevrq58epfp

public function goldenPeakBonusFunction():Boolean
{
	//Embry xmas stuff GOOOO!
	if(MailManager.isEntryUnlocked("emrby_xxxmas_invite") && pc.hasGenitals() && isChristmas() && flags["EMBRY_XMAS_2018_VISIT_PROC"] == undefined)
	{
		embryBarRedirect2018Xmas();
		return true;
	}

	if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) output(" Throw in a few more shady characters and a fist fight, and it’d feel like home!");
	output(" A holoscreen is set up just over the bar, showing reruns of Steph Irson: Galactic Huntress.");

	//First time - Kara quest first time proc
	if(flags["BEEN_TO_MYRELLION_BAR"] == undefined)
	{
		karaFirstTimeBarStuff();
		return true;
	}
	if(pc.hasStatusEffect("Myr Venom Withdrawal") && rand(10) == 0)
	{
		sluttyMcSlutOral();
		return true;
	}
	//if(flags["MET_CANDICE"] == undefined) addButton(0,"Bartender",approachTheBartenderAtTheBar,undefined,"Bartender","See if you can get a decent drink on this ant-infested mudball.");
	//else addButton(0,"Candice",approachTheBartenderAtTheBar,undefined,"Candice","See if you can get a drink or some fun from Candice.");
	if(flags["MET_EMBRY"] == undefined) addButton(0,"Waitress",callWaitress,undefined,"Waitress","Call a waitress to order some food.");
	else addButton(0,embry.short,callWaitress,undefined,embry.short,"Call her over. Maybe you can get some food or something.");
	if(shadeAtTheBar())
	{
		//Shade Repeat Encounters
		//Add to Bar Description
		if(flags["SHADE_DISABLED"] == -1)
		{
			output("\n\nShade, the kaithrit bounty hunter, is sitting at a corner table, looking down into her empty beer mug. She seems to be deep in thought and ignoring the hustle and bustle around her. The holoterminal blinks from time to time, reflecting light off her face but she pays it no mind.");
			addDisabledButton(1,"Shade","Shade","Now is probably not a good time to interact with her. She needs some time to herself...");
		}
		else
		{
			output("\n\nShade, the kaithrit bounty hunter, is sitting with her boots propped up on a corner table, silently watching the rest of the bar. A couple of empty beers are stacked up on her table, surrounding a portable holoterminal dominating half the table. At a glance, it looks like Shade’s researching local bounties.");
			if(flags["KQ2_SHADE_ENCOUNTERED"] == 1 && shadeIsLover()) addButton(1,"Shade",kq2ShadeFollowUp,undefined,"Shade","Meet Shade so she can have a word with you...");
			else if(shadeQuestNeedsTurnIn()) addButton(1,"Shade",getPaidByShade4Kara,undefined,"Shade","Collect your portion of the pay from Shade.");
			else addButton(1,"Shade",shadeApproach,undefined,"Shade","Go talk to Shade, the bounty hunter you met previously.");
		}
	}
	//Add Liliana's shit to the bar.
	lilianaBonusShits(2);
	roamingBarEncounter(3);
	if (biancaAtBar("myrellion") && biancaBarBonus(4)) return true;
	addButton(5,"Watch Screen",stephIrson4Go,undefined,"Watch Screen","That Steph Irson episode won’t watch itself!");
	vendingMachineButton(7, "J'ejune");
	
	return false;
}

public function showCandice():void
{
	author("Savin");
	if(flags["MET_CANDICE"] == undefined) showName("\nBARTENDER");
	else showName("\nCANDICE");
	showBust("CANDICE");
}

// Actually Buying a Drink
// !!!!!!!!!!!!!!Embry now does this!!!!!!!!!!!!
public function buyADrinkFromCandice(drink:String):void
{
	clearOutput();
	showEmbry();
	output("You give [embry.name] your order.");

	output("\n\n<i>“Sure thing!”</i> she says, skipping off to fetch your drink, returning a moment later with your order. She slides a " + drink + " to you, and you spend the next few minutes ");
	if(drink != "Nyrean Knot" || drink != "Fire Pepper") output("nursing your drink, slowly sipping it down");
	else 
	{
		output("kicking back your shot and recovering from the ");
		if(drink == "Nyrean Knot") output("Knot");
		else output("Pepper");
		output("’s intense kick. Whew, that burns!");
	}
	output(".");
	output("\n\nYou transfer a few credits over with your Codex to cover your tab, and [embry.name] takes off to help another customer.");

	if(drink == "Chitin Cracker")
	{
		pc.imbibeAlcohol(25);
		pc.credits -= 10;
	}
	//[15] Ausar Chaser - 15 Booze, +5 energy if ausar or half-ausar
	else if(drink == "Ausar Chaser")
	{
		pc.imbibeAlcohol(15);
		pc.credits -= 15;
		if(pc.isAusar()) pc.energy(5);
	}
	//[25] Miniature Rahn - 13
	else if(drink == "Miniature Rahn")
	{
		pc.credits -= 25;
		pc.imbibeAlcohol(13);
	}
	//[35] Nyrean Knot - 40 booze
	else if(drink == "Nyrean Knot")
	{
		pc.credits -= 35;
		pc.imbibeAlcohol(40);
	}
	//[100] Queen's Honey - 7 booze, 10 energy, 
	else if(drink == "Queen's Honey")
	{
		pc.credits -= 100;
		pc.imbibeAlcohol(7);
		pc.energy(10);
	}
	//[120] Fire Pepper - 33 booze, +20 lust
	else if(drink == "Fire Pepper")
	{
		pc.credits -= 120;
		pc.imbibeAlcohol(33);
		pc.changeLust(20);
	}
	processTime(6);
	if((pc.isSmashed() && rand(4) == 0) || pc.statusEffectv2("Alcohol") >= 100)
	{
		smashedEpilogueToDrinkBuyFromCandice();
	}
	else 
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//PC too drunk for his own good
//Append to above.
public function smashedEpilogueToDrinkBuyFromCandice():void
{
	output("\n\nYour whole world goes topsy-turvey when you try to stand. You find yourself rushing for the bathroom, barely making it before you chuck. You spend the next few minutes firmly planted in the stall, puking your guts up.");
	output("\n\nUgh. You splash some water on your face and head back out into the tavern, carefully leaning on the walls as you go.");
	//Clear pending drinking.
	pc.setStatusValue("Alcohol",1,0);
	processTime(4);
	//Super smashed
	if(pc.statusEffectv2("Alcohol") >= 90) reallySmashedEpilogueToDrinkingWithCandice();
	else
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//PC REALLY FUCKING DRUNK, SON
//Append above
public function reallySmashedEpilogueToDrinkingWithCandice():void
{
	output("\n\nWell, you <i>try</i> to stagger back. Instead, you take one clumsy step and fall flat on your face, blacking out before you hit the deck.");

	//[Next]
	clearMenu();
	addButton(0,"Next",reallySmashedEpiloguetoDrinkingWithCandicePartII);
}

public function reallySmashedEpiloguetoDrinkingWithCandicePartII():void
{
	clearOutput();
	author("Savin");
	//PC's been to New Texas, either fucked Shade or has a Cunt Tail, and has Reaha on Crew
	if(flags["NEW_TEXAN_CUSTOMS_MET"] != undefined && ((flags["SEXED_SHADE"] != undefined && pc.hasCock()) || pc.hasCuntTail()) && reahaIsCrew())
	{
		showBust(reahaBustDisplay());
		showName("\nREAHA");
		output("You wake up to a loud, head-pounding... pounding. You blink yourself awake and struggle to your [pc.feet] as... something... hammers the door to the bathroom. You take a second to take inventory: you’re on your ship, you’ve got your equipment, and your chest is splattered with blood, puke, and beer. Oof.");
		output("\n\n<i>BANG</i> goes the bathroom door.");
		output("\n\nOh, shit, what <i>is</i> that!? You stumble away from the door and grab your [pc.rangedWeapon] and level it at the door. As you’re going for your weapon, though, you notice something huge and firm in your pack that wasn’t there before. You fish it out, and find yourself blinking at... an egg?");

		if(CodexManager.entryUnlocked("Cunt Snakes")) output(" A cunt-snake egg, at that!");
		if(pc.hasCuntTail()) output(" When the hell did you lay that?");
		else if(flags["SEXED_SHADE"] != undefined && pc.hasCock()) output("Did Shade lay that? And if so, why do you have it?");
		else output("What the <i>fuck</i>!?");

		output("\n\nThe door pounds again, straining on its sliding track. You ready yourself for anything, setting the egg aside and steeling yourself. Another BANG, and the door flies open, revealing... a huge, fangy blue critter twice the size of a shepherd dog, covered in spikes and claws. It hisses at you and lunges, too fast to aim at. You just swat it, desperately punching it in the face as it comes flying. The creature squeals and tumbles back");
		if(!CodexManager.entryUnlocked("Varmints")) output(", just in time for your codex to identify it as a New Texan <i>“varmint”</i> creature.");
		else output(", giving you enough time to realize it’s a... a New Texas varmint!?");
		output(" You rush forward and kick the varmint towards the door. It yelps and goes running, all the way to your gangplank. It’s an effort to get the creature off the ship, but with a little work, you set it loose on the tarmac... and immediately hear screams of alarm as it goes rushing off through the crowded street.");
		output("\n\nYou take a step off the ship and wipe the sweat from your brow. How the hell did that get in your bathroom, and why? What did you get up to while you were blacked out, anyway?");
		output("\n\nAs you’re wondering, you hear a voice from overhead call out, <i>“");
		//Normal Reaha
		if(!reahaIsCured()) output("[pc.Master]! Heeeeelp!");
		//if Treated Reaha: 
		else if(chars["REAHA"].isTreated()) output("Hey! Up here!");
		else output("[pc.name]! Heeeeelp!");
		output("”</i>");
		output("\n\nYou turn around and follow the sound up to the roof of your ship. Reaha’s sitting on the roof, buck naked");
		//Normal & Treated
		if(!reahaIsCured() || chars["REAHA"].isTreated()) output(" as usual");
		output(", and shivering pitifully.");
		output("\n\n<i>“C-can I come down now?”</i> she whines, <i>“It’s been hours!”</i>");
		output("\n\nYou blink. <i>“Uh. Sure,”</i> you say, opening your arms to catch her. She comes plummeting down a moment later, and you both grunt as she flops into your waiting arms.");
		output("\n\n<i>“What were you doing up there?”</i> you ask, setting Reaha down.");
		output("\n\nShe stares at you a moment. <i>“Y-you don’t remember?”</i> When you shake your head, she beams. <i>“Don’t, uh, don’t worry about it, then! I was just sun bathing!”</i>");
		output("\n\nSays the pale, ginger cow-girl. You try to get some answers out of her, but she’s dead silent on the matter. Finally, frustrated, you give her a great big spank on the ass and send her running off into the ship.");
		output("\n\nAs she’s going, you notice a thick cake of spunk plastering her ass and thighs. What the.... You shake your head and try to forget it. You need to drink less...");
		processTime(189);
		if(pc.isMischievous()) output(" or more");
		output(".");
		currentLocation = shipLocation;
		clearMenu();
		
		flags["REAHA_MYR_SCENE"] = 1;
		
		addButton(0,"Next",mainGameMenu);
	}
	//PC's fucked Shade
	else if(flags["SEXED_SHADE"] != undefined)
	{
		output("You wake up in an amazingly comfortable bed, naked and with a cold washcloth over your forehead, your cheeks still wet from being cleaned. You blink in the light, slowly coming to recognize the interior of Shade’s ship.\n\nYour ");
		if(!pc.isNude()) output("clothes");
		else output("items");
		output(" are neatly stacked on a chair beside the bed, and you’re pretty sure you’ve been through a bath or shower at some point. The clock alerts you to the passage of three hours. Whew, what a ");
		if(hours < 3 || hours > 16) output("night");
		else output("day");
		output(". At least Shade’s not here to chastise you");
		if(pc.isNice()) output(", even if you would like to thank her for the motherly treatment");
		output(". You pack your gear up and head out shortly.");
		processTime(189);
		//PC in Shade's ship
		currentLocation = "602";
		clearMenu();
		pc.shower();
		addButton(0,"Next",mainGameMenu);
	}
	//PC has no friends in the bar or lovers applicable
	else
	{
		showName("SPACER’S\nROW");
		output("You wake up in an alley some hours later, covered in vomit and regretting your life choices. When the hell did you become such an alcoholic? Damn.");
		output("\n\nYou stagger up, barely restraining yourself from barfing again. You check yourself over");
		if(pc.credits >= 5) 
		{
			output(", and quickly realize you’ve been looted for five credits. Bastards!");
			pc.credits -= 5;
		}
		else
		{
			output(" and it looks like your stuff is still there. Maybe you didn’t have enough credits to bother stealing.");
		}
		processTime(189);
		//PC in back alley
		currentLocation = "608";
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	generateMapForLocation(currentLocation);
}

/*function bartenderFlirt():void
{
	author("Savin");
	showBust("PLACEHOLDER");
	showName("\nBARTENDER");
	
	//PC Hasn't bought a drink:
	if(9999 == 9999)
	{
		output("You look the cute halfbreed up and down, eyes playing across all the lush, tanned skin on display. <i>“How about your number, first of all?”</i>");
		output("\n\nShe crosses her arms under her cut-off halter and gives you a look. <i>“C’mon, " + pc.mf("mister","miss") + ", I’m trying to work here... at least get a couple drinks first.”</i>");
	}
	//PC has bought at least 1 drink first. First Time. Once every 3 hours...
	else if(9999 == 0)
	{
		output("You look the cute halfbreed up and down, eyes playing across all the lush, tanned skin on display. <i>“How about your number, first of all?”</i>");
		output("\n\nThe bar girl giggles and casts a furtive look around, presumably to make sure her boss isn’t close at hand. Safe in the knowledge she’s the only person working at the moment, she flashes you a conspiratorial smile and says, <i>“Well... you’re cute, and it is about time I took a break... tell you what, why don’t we skip the boring parts and have some </i>real<i> fun?”</i>");
		output("\n\nBehind her, you can see her long, golden tail flick up excitedly. Her back end wiggles excitedly under her booty shorts, threatening to knock over the liquor stacked up behind the bar.");
		output("\n\nYou nod eagerly, and are quick to follow her out of the bar’s back door, down into the alleyway behind it.");
	}
	//Repeat Quickie. Once every 3 hours.
	else
	{
		output("You look the cute halfbreed up and down, eyes playing across all the lush, tanned skin on display. <i>“How about some more fun?”</i>");
		output("\n\nCandice looks around to make sure her boss isn’t anywhere nearby, then gives you a playful wink and sets her rags down on the bar. <i>“Well... I had fun last time, and I think I could squeeze in a quick break. Sound good?”</i>");
		output("\n\nYou nod eagerly, and are quick to follow her out of the bar’s back door, down into the alleyway behind it.");
	}
}*/

//[Watch Screen]
//STEPH IRSON 4 GO (See Steph's Doc)
public function stephIrson4Go():void
{
	clearOutput();
	stephHeader(4);
	
	flags["STEPH_WATCHED"] = 1;
	
	output("You take a seat at the bar and pick up the remote sitting unattended, flicking the Super-HD viewscreen nearby over to another channel. The first thing you stumble upon is the start of the latest episode of <b>Steph Irson: Galactic Huntress</b>, a popular nature show. Beneath the title script, a warning appears in large red letters: <i>“This Show Rated X, Adults Only, by the Galactic Entertainment Ratings Board due to graphic, sexual, and disturbing imagery. You have been warned.”</i> A smaller notice underneath announces <i>“This show brought to you by the New Texas Council for Entertainment,”</i> followed by a cute cartoon image of an overly-busty cow-girl giving you a wink and a thumbs up.");
	output("\n\nThe title card fades away, replaced with a shaky camera shot that’s exploding with obviously digital color - a small disclaimer at the screen’s bottom tells you that the camera is operating in nightvision mode, with computer coloration added in real time by the producer A.I. The view resolves into a picture of the show’s host, Steph Irson, wearing her familiar khaki short-shorts and shirt, straining against the sheer size of her massive bust. The hostess doesn’t look much like the iconic nature presenter you remember growing up: she’s sporting a pair of cute little cat ears atop her head that twitch and fidget as she moves, and her lips and eyes glisten with a metallic gray. Perhaps most noticeable, though, is her immense bust, more than double in size over the perky D-cups she sports in her promotional material. You don’t think that shirt of hers is going to hold up to much - even a deep breath might burst those buttons and let her tits pop free on galactic TV. A big three-optic night vision rig is stuck on her forehead, awkwardly hooked around her kitty-ears.");
	output("\n\n<i>“We’re here on Myrellion, one of the most dangerous and unforgiving worlds in the new Planet Rush,”</i> Steph whispers to the camera drone. Her New Brisbaner accent, at least, is more recognizable than her body these days. <i>“It’s pitch black here in the caverns below the surface, where all intelligent life on this world lives!”</i> She taps her night vision goggles for emphasis, grinning at the camera. <i>“But we’re on even footing now, thanks to our friends at Xenogen, who’re nice enough to give me these cute goggles!”</i>");
	output("\n\nShe bounces giddily, causing her bovine-like bosom to jiggle like gelatin under her shirt. <i>“Now, we’re here to find what’s gotta be the coolest species here on Myrellion, a planet full of insect-type creatures: the nyrea! A nyrea queen, to be precise! Nyrea flip what you and I know about biological sex right on its head, cuz the females have pseudo-penises and the males have genital slits just like pussies. Er, I mean vaginas!”</i>");
	output("\n\nSteph chuckles and turns away from the camera, start to walk through the narrow, winding caverns. The camera drone follows, keeping her thick, booty-short-straining behind in view for the audience. <i>“Nyrean females vie for dominance among their own kind like old-earth predators, with submissive losers being forced to carry alphas’ eggs after the fight. Eggs they get through reverse sex with a male: inserting their pseudo-penis in his genital slit and extracting semen from little sacs inside him. Pretty nifty, huh? So today, I’m on the hunt for the biggest, baddest alpha nyrea I can find and see if we can get this strange, unique twist on mating on camera for you viewers at home! I’ve done a little scouting, and I think I’ve found a pretty likely place to find one: a deep cavern just up the tunnel here, covered in glowing moss and cave drawings.”</i>");
	output("\n\nA few moments later and the Huntress has arrived at the cave in question: a big crack in the wall surrounded by softly glowing blue moss that’s been artificially arranged into a swirling pattern around the cavern entrance, several concentric circles that make the passage seem much bigger and more intimidating than it actually is. A few small bushes grow from the ground nearby, forming a sweeping approach to the cave, almost like a manor house’s cultivated garden. Steph wasn’t kidding when she said nyrean queen!");
	output("\n\n<i>“Right, ‘ere we are, then. I’m gonna have to be incredibly careful from here on out, unless I want to end up with a belly full of eggs. Nyrea are aggressive breeders, and alphas love to make other people carry their eggs for them - I’m just a walking incubator to these ovipositing beauties. I’m just shivering thinking about it,”</i> Steph adds, hugging her arms around herself. In the ultra-HD color on screen, you can’t help but notice a dark splotch suddenly form on her shorts between her legs. The camera drone immediately focuses in on it, until Steph reaches out and gives it a swat.");
	output("\n\n<i>“Alright, it’s about time to go get a look at a big, bad nyrean queen. Follow me!”</i> Steph whispers, adjusting her goggles and starting to creep towards the darkened tunnel entrance.");
	output("\n\nJust as she’s about to step through the cavern entrance, a woman steps out, smacking right into Steph and sending both of them tumbling to the ground. The camera zooms in on the alien woman, an insectile girl with a pair of big, bare breasts over a natural corset of chitin and long, elfin ears growing from her head. She lands on her ass with an <i>“oomph,”</i> rubbing her head where Steph bonked into her.");
	processTime(6);
	clearMenu();
	addButton(0,"Next",stephIrsonEpisode4Part2);
	addButton(1,"StopWatching",mainGameMenu);
}

public function stephIrsonEpisode4Part2():void
{
	clearOutput();
	stephHeader(4);
	
	output("<i>“Ah, I’m sorry, I didn’t... I didn’t see you there!”</i> the alien girl groans, blinking hard.");
	output("\n\n<i>“Crikey! It’s a nyrea!”</i> Steph shouts, leaping to her feet. <i>“Are you getting this, camera? A live nyrean female, right in front of me. I’ve gotta subdue ‘er quick, or I’m gonna get stuffed with eggs!”</i>");
	output("\n\nThe alien girl blinks. <i>“B-but I’m a male...”</i>");
	output("\n\nBefore the alien not-female can finish her sentence, Steph’s on her like a sack of bricks, barreling her back to the cave floor and pinning her wrists to the ground. The nyrea squirms under Steph’s grasp, trying and failing to get her - his? - face out of Steph’s massive tits. All he ends up succeeding at is spreading his legs around Steph’s waist, and the camera dutifully zips around and sticks itself under Steph’s big, upturned booty, showing off the smooth gash between the nyrea’s legs, drooling moisture as his submission instinct kicks into overdrive.");
	output("\n\n<i>“Nooooo, I already have a mistress,”</i> the nyrea cries, flopping helplessly back. <i>“Don’t egg me! Queen Taivra will be so mad if I come back full of eggs.”</i>");
	output("\n\nSteph rises to her knees, straddling the defeated insect boy. <i>“What do you mean egg </i>you<i>? You’re the one who was gonna stuff </i>me<i> with eggs!”</i>");
	output("\n\n<i>“I’m a male!”</i> the nyrea huffs, crossing his arms under his D-cups tits. As if to emphasize the point, the camera swings back around to a view of Steph’s backside, resting just over the male’s genital slit, her khaki shorts soaking up a little of his rampant moisture.");
	output("\n\nSteph blushes and scrambles off. <i>“So... you’re not gonna try and fuck me silly?”</i>");
	output("\n\n<i>“No! What... what kind of weirdo do you think I am?”</i>");
	output("\n\n<i>“I dunno. It’s, like, really out of the ordinary that you’re <b>not</b>,”</i> Steph admits. <i>“Everything else I meet does,”</i> she adds, twirling a lock of golden hair.");
	output("\n\nThe nyrea blinks, but accepts Steph’s hand and pulls herself to her feet. <i>“I guess it’s the same everywhere. Even where you offworlders are from, huh?”</i>");
	output("\n\nSteph giggles. <i>“I don’t mind anymore, really. You sorta get used to everybody wanting to use you like a fucktoy eventually.”</i>");
	output("\n\n<i>“Tell me about it!”</i> the nyrea smiles, folding her arms behind her back in a way that compels the camera to zoom in on her thrust-out chest, giving you a view of cream-pale flesh and black nipples that are still nice and stiff. <i>“Ugh, I’m so sick of...”</i>");
	output("\n\nA moment later, the camera zooms up over her shoulder as another nyrea steps out, voice echoing off the stone: <i>“And what a marvelous fucktoy it is.”</i> The second nyrea is clutching a long spear and wearing padded chainmail that just barely conceals her bust... and the massive, half-hard cock bulging between her legs. The camera zooms in, ducking under Steph’s ass to get an angle on the beast that’s only just restrained by the nyrea’s chainmail bikini bottom. <i>“If you two had kept wrestling much longer, I might have had to start jacking off. But now that I have your attention, I guess you can take care of my big, thick problem here with your... cute little fucktoy of a breeder body, can’t you?”</i>");
	processTime(6);
	pc.changeLust(3);
	clearMenu();
	addButton(0,"Next",stephIrsonEpisode4Part3);
	addButton(1,"StopWatching",mainGameMenu);
}

public function stephIrsonEpisode4Part3():void
{
	clearOutput();
	stephHeader(4, true);
	
	output("The nyrea takes a long step forward, her hips swaying seductively towards Steph. <i>“Besides, I can’t have just anybody running up and attacking my favorite little beta bitch, can I?”</i> she coos, swatting the male on the ass as she passes by. <i>“Why don’t you slip out of the fuck-me outfit and spread your legs. Iryn here’s just finished giving me a ripe, fertile clutch of eggs that are desperate for somewhere to go...”</i>");
	output("\n\nSteph gulps, taking a defensive step back. <i>“Aww, c’mon!”</i> she groans, though the camera doesn’t fail to catch her thumbs hooking into her belt and yanking her pants down, revealing the silver lips of her pussy. It looks like Steph’s gotten used to her inevitable fate these days...");
	output("\n\n<i>“Ah, what an eager slut,”</i> the nyrean alpha grins, planting her spear head-first in the ground and stepping forward to plant a hand on Steph’s waist. Her other hand snakes down to her shaft, starting to stroke the bulge in her panties as she slowly works them off her hips. They clatter to the ground, letting a foot of turgid, arm-thick meat flop free between her legs. Steph’s eyes go wide at the sight of it, and the camera pans to show her silvery pussy already gleaming with excitement. She takes another step back, followed immediately by the nyrea alpha, whose cock jumps when Steph’s bare leg brushes against it.");
	output("\n\n<i>“There’s a good girl,”</i> the amorous alpha coos, slipping her chitin-clad digits down to grab Steph’s bubble butt. <i>“Now just relax, and let me flood that sweet alien pussy of yours with eggs...”</i>");
	output("\n\nBefore the Galactic Huntress and the nyrean alpha can get too far, however, her male submissive catches the camera’s attention, creeping up behind his mistress. The male takes a nervous step forward, looks at the camera, and then charges his mistress from behind, slamming into both her and Steph and sending them both tumbling into the nearest bush.");
	output("\n\n<i>“Suck it, whores!”</i> the male cheers as they go tumbling. <i>“That’s for filling me with so many eggs all those years!”</i>");
	output("\n\nThe camera darts down after Steph, diving into the bush - and what looks like a chasm hidden beneath it. Steph screams, falling through thick vines into what amounts to a pit filled with squirming roots and strange, brightly-colored juices. She lands suspended over the pit of slime, arms and legs tangled in a mass of vines. The nyrea is nowhere to be seen.");
	output("\n\n<i>“Whew, that was a close one, wasn’it?”</i> Steph says, breathing a sigh of relief. <i>“I was gonna get egged for sure. Mhen’ga all over again, right? And I");
	if (silly) output(" totes");
	else output(" totally");
	output(" could have broken my neck falling like that!”</i>");
	processTime(6);
	pc.changeLust(3);
	clearMenu();
	addButton(0,"Next",stephIrsonEpisode4Part4);
	addButton(1,"StopWatching",mainGameMenu);
}

public function stephIrsonEpisode4Part4():void
{
	clearOutput();
	stephHeader(4, true);
	
	output("She starts to move, trying to get up out of the mass of vines... when the very roots around her start to move, squirming around her limbs. One of the tips come into sight, drawing the camera’s eye: it’s tipped with a bulbous, purple crown that splatters Steph’s cheek with moisture as it moves. In the dim light, you could be forgiven for thinking that it was a great big tentacle cock.");
	output("\n\n<i>“Crikey!”</i> Steph squeals, struggling against the viney hold on her limbs. More tentacles squirm down from on high, dangling down around her, crawling across her body, tearing away the straining cloth of her shirt and wrapping around her huge tits, squeezing a squirt of milk out of her teats. She yelps, making the mistake of opening her mouth as a particularly daring vine brushes past her cheek. Sensing the defenseless opening, it darts in eagerly, plugging her maw with a squirming mass of green vine.");
	output("\n\nAs it fucks its way into Steph’s mouth, a small disclaimer appears at the bottom of the screen, telling you that the U.G.C. Scout Authority and the Entertainment Board are not responsible for the content of live television, and that the species colloquially called <i>“cock vines”</i> should be avoided at all costs. <b>Viewer discretion is advised</b>.");
	output("\n\nThe camera zooms in on Step’s mouth as the tentacle vine squirms past her silver lips, plunging deep down her throat. Her eyes go wide, filled with panic, and the tentacle in her mouth swells and discharges, liquid visibly surging through it and into Steph. More tentacles slither down her body as the first works, lifting her upright and spreading her legs wide. Her boobs bounce gaily, squirting milk over the vines and the camera drone, splattering the lens for a moment. By the time it cleans itself off, a pair of particularly wide-tipped vines have latched onto the bovine aussie’s teats, suckling the milk from her oversized bosom and engorging themselves on her tremendous bounty. More vines coil around her long legs and thick thighs, splaying them and crawling their way slowly but surely towards the glistening silver lips of her drooling cunt.");
	output("\n\nSteph struggles feebly against her tentacle restraints, her resistance slowly fading away to limp submission as the tentacles drain her milk and pump her full of their own juices. Her silvery-blue eyes roll back as a particularly meaty tentacle squirms its way into her cunt, spreading her wide over its turgid length. Its bulbous head vanishes, only visible as it bulges her gut with the sheer depth and size of its penetration. She screams in pleasure around the squirming vine, her body convulsing around the twin tentacles. The camera shifts in for a close up of Steph’s pussy, and the trickle of white goop spilling out around the vine - the tentacle creature’s seed, no doubt, filling her womb beyond capacity.");
	output("\n\nHer whole body goes stiff a second later, drawing the drone around to her big, jiggly backside as a third, smaller vine spreads her cheeks in a desperate bid to get at her last unfilled hole. Its bulbous, cock-like head spurts a thick coat of white spunk over Steph’s ass, using its own cum as lube to worm its way through her clenched behind. She screams again as the vine vanishes inside her, completing the three-way fucking she’s fallen into with a powerful, thigh-drenching orgasm.");
	processTime(6);
	pc.changeLust(5);
	clearMenu();
	addButton(0,"Next",stephIrsonEpisode4Part5);
	addButton(1,"StopWatching",mainGameMenu);
}

public function stephIrsonEpisode4Part5():void
{
	clearOutput();
	stephHeader(4, true);
	
	output("The tentacles are relentless, single-minded in their motions to pump Steph full of creamy, viscous seed. Her belly swells with the sheer volume of plant-spunk flooding into her womb and both ends of her gut, distending even more as the tentacles visibly squirm inside her, straining her body to its limits. Minutes fly by in vigorous fucking, the tentacles drilling deeper and deeper into Steph’s abused body, joined by even more small vines that worm their way into her holes beside their larger cousins. Every root and vine in the bush seems to be trying to wriggle its way into her, to give the Huntress its load of thick, creamy plant spunk.");
	output("\n\nBy the time they’re done with her, Steph’s as white as a sheet, slathered with plant spooge from head to toe and still trickling milk as the vines latched onto her breasts release her. She sputters and coughs as the vine in her mouth withdraws, giving her a final money-shot across her cheeks in glorious close-up high definition. Her eyes flutter as the last squirts of cum plaster her gray lips, and her tongue laps it up with lazy hunger. She gives a full body shiver, drawing the camera’s eye towards her crotch as the tentacles buried in her twat slowly slither out, drawing out another screaming orgasm from the show’s host as they pop out, splattering her thighs with thier cum and hers.");
	output("\n\nSteph slumps against the restraints still around her limbs, breathing hard and shivering with the aftershocks of repeated orgasm, completely at the plant’s mercy. However, it seems done with her now that she’s utterly filled with the vines’ seed. The camera follows her as the tentacles draw her limp body back up through the bush over the pit and deposit her back on the surface, plopping her back on the stone cavern floor in a pool of white, creamy spunk. You can see one tentacle, however, still outside the pit, attached firmly to the Galactic Huntress’s backside.");
	output("\n\n<i>“Oof,”</i> Steph groans, rolling onto her hand and knees, ass in the air and face to the camera. <i>“Well, that’s it for another episode of </i>Steph Irson<i>... ugh, what’s that on my... uh, </i>Steph Irson’s Galactic Huntress<i>. Join us next week for... agh, what the-”</i> she gasps as the tentacle behind her flicks up, its bulbous purple cockhead peeking up to look at the camera, drooling from its cumslit. The camera flies over to take a look, showing where the tendril’s cockhead shifts into plant-like vine... and then travels down to join with Steph’s backside, just over her ass, foliage merging with flesh. She moans, and the tail squirms around, batting at the camera until it flies back.");
	output("\n\n<i>“We’ll, um, next week we’ll be... uh,”</i> Steph slurs, her new cock-tail vanishing between her legs. <i>“We’ll be- gaaaaahhhhhh!”</i>");
	output("\n\nThe tail plunges into her, pumping vigorously into her backside. She gives a startled squeal, slumping forward onto her big, milky jugs as her new appendage gets used to her. The camera feed fades to black, telling you to tune in next week for another exciting episode of <i>Steph Irson, Galactic Huntress</i>.");
	output("\n\nHow the hell is this on public television still?");
	if (pc.libido() >= 40) output(" Not that you’re complaining...");
	
	watchStephEpisodeBroadcast("STEPH_COCKED");
	
	processTime(6);
	pc.changeLust(7);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

/*Room Descript Additions

Esbeth Hospital
//After bit about doors leading east
A vending machine sits next to the office's door, advertising <i>JoyCo Power-up Potions</i>. 

The Mess
//Add to bottom of description
A long line of raskvel are crowded around a big, yellow vending machine. A big, in-your-face logo on it advertises <i>JoyCo Power-up Potions</i>. 

Ellie's Gift Shop
//Add new pg to end of room descript.
A row of vending machines sit at the back of the gift shop, advertising <i>JoyCo Power-up Potions</i>.

Myrellion Bar
//Add new pg to end of room descript.
A dinged-up vending machine has been shoved into the corner. A big, in-your-face logo on it advertises <i>JoyCo Power-up Potions</i>. 
*/
