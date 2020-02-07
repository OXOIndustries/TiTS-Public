// Episodes follow the old flag names so:
/*
STEPH_NYAN
STEPH_GOOED
STEPH_COWGIRL
STEPH_COCKED
STEPH_DARGONED
*/

public var STEPH_EPISODE_UIDS:Array;
// This is an attempt to ensure everything gets setup for new episodes!

public function initStephEps():void
{
	STEPH_EPISODE_UIDS = [
	{ 
		uid: "STEPH_NYAN",
		f: stephODEp1, 
		t: "Naleen", 
		ar: undefined, 
		th: "Galactic Huntress - Mhen’ga", 
		tb: "Synopsis: A newly-colonized Mhen’ga, a world of lush jungles and deadly predators.", 
		cost: 10 
	},
	{
		uid: "STEPH_GOOED",
		f: stephODEp2,
		t: "GrayGoo", 
		ar: undefined, 
		th: "Galactic Huntress - Tarkus", 
		tb: "Synopsis: Steph meets one of the strange locals of Tarkus.", 
		cost: 10
	},
	{
		uid: "STEPH_COWGIRL",
		f: stephODEp3,
		t: "Bulls", 
		ar: undefined, 
		th: "Galactic Huntress - New Texas", 
		tb: "Synopsis: Steph visits the popular vacation resort planet of New Texas.", 
		cost: 10
	},
	{
		uid: "STEPH_COCKED",
		f: stephODEp4,
		t: "Nyrea", 
		ar: undefined, 
		th: "Galactic Huntress - Myrellion", 
		tb: "Synopsis: Steph encounters an insectile woman deep in the caves of Myrellion.", 
		cost: 10
	},
	{
		uid: "STEPH_DARGONED",
		f: stephODEp5,
		t: "Korgonne", 
		ar: undefined, 
		th: "Galactic Huntress - Uveto VI", 
		tb: "Synopsis: Steph runs into some of the fuzzy inhabitants of the frozen moon of Uveto VI.", 
		cost: 10
	}
	];
}


public function getStephEpDetailsByUid(episode:String):Object
{
	for (var i:int = 0; i < STEPH_EPISODE_UIDS.length; i++)
	{
		if (STEPH_EPISODE_UIDS[i].uid == episode)
		{
			return STEPH_EPISODE_UIDS[i];
		}
	}

	return null;
}

public function watchStephEpisodeBroadcast(episode:String):void
{
	var bFound:Boolean = false;
	for (var i:int = 0; i < STEPH_EPISODE_UIDS.length; i++)
	{
		if (STEPH_EPISODE_UIDS[i].uid == episode)
		{
			bFound = true;
			break;
		}
	}

	if (!bFound)
	{
		throw Error("Unknown steph irson episode name!");
		return;
	}

	if (flags["STEPH_WATCHED"] == undefined)
	{
		flags["STEPH_WATCHED"] = 1;
		flags["STEPH_FIRST_WATCHED"] = GetGameTimestamp();
		flags["STEPH_DEFAULT_UNLOCKED"] = episode;
	}
	else
	{
		flags["STEPH_WATCHED"]++;
	}
	
	if (flags[episode] == undefined)
	{
		flags[episode] = 1;
	}
	else
	{
		flags[episode]++;
	}
}

public function numUnlockedEpisodes():int
{
	var eps:int = 0;

	for (var i:int = 0; i < STEPH_EPISODE_UIDS.length; i++)
	{
		if (flags[STEPH_EPISODE_UIDS[i].uid] != undefined) eps++;
	}

	return eps;
}

public function numTotalStephEpisodes():int { return STEPH_EPISODE_UIDS.length; }
public function numLockedStephEpisodes():int { return numTotalStephEpisodes() - numUnlockedEpisodes(); }

public function unlockedEpisodeNames():Array
{
	var a:Array = [];

	for (var i:int = 0; i < STEPH_EPISODE_UIDS.length; i++)
	{
		if (flags[STEPH_EPISODE_UIDS[i].uid] != undefined) a.push(STEPH_EPISODE_UIDS[i].uid);
	}

	return a;
}

public function trySendStephMail():void
{
	if (MailManager.isEntryUnlocked("steph_on_demand")) return;
	
	// Cover old saves by effectively injecting the message
	if (flags["STEPH_FIRST_WATCHED"] == undefined)
	{
		flags["STEPH_FIRST_WATCHED"] = GetGameTimestamp();
		
		var defaultEp:String = null;
		
		for (var i:int = 0; i < STEPH_EPISODE_UIDS.length; i++)
		{
			if (flags[STEPH_EPISODE_UIDS[i].uid] != undefined) defaultEp = STEPH_EPISODE_UIDS[i].uid;
		}
		
		flags["STEPH_DEFAULT_UNLOCKED"] = (defaultEp == null ? "STEPH_NYAN" : defaultEp);
	}
	else
	{
		if (GetGameTimestamp() > flags["STEPH_FIRST_WATCHED"] + ((60 * 24 * 3) + rand(240)))
		{
			MailManager.unlockEntry("steph_on_demand", GetGameTimestamp());
			AddLogEvent("<b>New Email from GalacNet VOD (noreply@galacnet.corp)!</b>", "passive");
		}
	}
}

public function stephOnDemandMail():String
{
	var ret:String = "Greetings, sapient!\n\nDo you enjoy your weekly dose of <i>Steph Irson: Galactic Huntress</i>, the galaxy’s most exciting nature show? Now you can own it! GalacNet is proud to announce that we have acquired the license for on-demand home releases of each episode of <i>Galactic Huntress</i> following its live broadcast. Never miss another exciting adventure!\n\n<i>Underneath the message’s text are several promotional images of Steph Irson posing around large alien creatures on a variety of distant worlds. A tiny caption underneath warns that the Confederate Ratings Board is not responsible for the content of live broadcasts, and the on-demand video is presented unedited and unrated.\n\nFurther, even smaller fine print adds:</i>\nAccording to extensive market and behavioral analysis, GalacNet has determined that you would like to receive these notifications! If this message was received in error, please contact our customer service at Marketing@GalacNet.corp to request a re-evaluation of your purchasing and viewing habits!";
	
	return ret;
}

public function stephOnDemandVODs():void
{
	clearOutput();
	showBust("LOGO_GALACTIC_HUNTRESS");
	showName("");
	author("Savin");
	
	output("You bring up the GalacNet On Demand page and log in. You’re quickly bombarded with holographic advertisements, trying to entice you into a dozen different crime dramas, sci-fi adventures, and fantasy classics. You tab through them, over to a tab displaying in bold letters <b>STEPH IRSON: GALACTIC HUNTRESS</b>, superimposed over a picture of the titular hostess giving the peace sign in front of a pair of soft, tan moons that look kind of like a butt when you stare at them. You’re sure that’s not intentional, right?");

	var numUnlocked:int = numUnlockedEpisodes();
	output("\n\nYou have " + numUnlocked + " episode"+ (numUnlocked == 1 ? "" : "s") + " of Steph Irson’s show in your library.");
	var numLocked:int = numLockedStephEpisodes();
	if (numLocked != 0) output(" There "+ (numLocked == 1 ? "is" : "are") + " " + numLocked + " available for purchase.");
	else output(" A handy message icon tells you that your collection is all caught up with Steph’s adventures. Check back later for new episodes to release!");
	
	stephOnDemandMenu();
}

public function stephOnDemandMenu():void
{
	clearMenu();

	var epState:Array = [];

	for (var i:int = 0; i < STEPH_EPISODE_UIDS.length; i++)
	{
		if (flags[STEPH_EPISODE_UIDS[i].uid + "_PURCHASED"] != undefined) 
		{
			addButton(i, STEPH_EPISODE_UIDS[i].t, STEPH_EPISODE_UIDS[i].f, STEPH_EPISODE_UIDS[i].ar, STEPH_EPISODE_UIDS[i].th, STEPH_EPISODE_UIDS[i].tb);
		}
		else if (flags[STEPH_EPISODE_UIDS[i].uid] != undefined)
		{
			if (pc.credits >= STEPH_EPISODE_UIDS[i].cost) addButton(i, "Buy Ep. " + (i + 1), stephBuyEpisode, STEPH_EPISODE_UIDS[i].uid, STEPH_EPISODE_UIDS[i].th, STEPH_EPISODE_UIDS[i].tb + "\n\nCost: " + STEPH_EPISODE_UIDS[i].cost);
			else addDisabledButton(i, "Buy Ep. " + (i + 1), STEPH_EPISODE_UIDS[i].th, STEPH_EPISODE_UIDS[i].tb + "\n\nUnfortunately you can’t afford the episode.\nCost: " + STEPH_EPISODE_UIDS[i].cost);
		}
		else
		{
			addDisabledButton(i, "Unaired Ep. " + (i + 1), "Galactic Huntress - Episode " + (i + 1), "<i>This episode has yet to be aired.</i>");
		}
	}

	addButton(14, "Back", backToSmutMenu);
}

public function stephBuyEpisode(episode:String):void
{
	clearOutput();
	showBust("LOGO_GALACTIC_HUNTRESS_1");
	showName("");
	author("Savin");
	
	output("You add the episode in question to your cart and check out with a click, wiring over the handful of credits and letting your console pull the episode from the extranet onto your local storage. You can now view it at your leisure!");

	flags[episode + "_PURCHASED"] = 1;
	
	clearMenu();

	var epDetails:Object = getStephEpDetailsByUid(episode);
	pc.credits -= epDetails.cost;

	addButton(0, "Watch", epDetails.f, epDetails.ar, epDetails.th, epDetails.tb);
	addButton(14, "Back", stephOnDemandMenu);
}

public function stephODEp1():void
{
	clearOutput();
	stephHeader(1);
	
	output("You sprawl out and kick on the first episode of the season. A brief commercial plays, telling you to buy Naughty Wyvern brand fibrecondoms before the screen fades to a superimposed logo of <b>Steph Irson: Galactic Huntress</b>, the popular nature show. The camera pans down from a hazy afternoon sky to an athletic young woman in an almost comically skimpy ranger outfit, with khaki hotpants and low-cut shirt rolled up to expose her midriff and ample cleavage both. Her blonde ponytail bounces excitedly as she jogs along through a jungle underbrush, the camera-drone struggling to keep pace with her.");
	
	output("\n\n<i>“We’re here on newly-colonized Mhen’ga, a world of lush jungles and deadly predators,”</i> the host begins in a thick New Brisbane accent, <i>“and we’re on the hunt for the naleen, the apex predator on this planet. Now, imagine a great big lion right out of Africa, a strong, lightning-fast beauty of a huntress, and combine that with the stealth and venom of a deadly adder, and you’ve got the naleen in a nutshell. I’ll have to be so, so careful dealing with these predators, or I’m dead for sure.”</i>");
	
	output("\n\nFor someone supposedly tracking down a lethal hunter, she seems oddly cheerful about it. She crests a hill, tumbles through a thick bush, and eventually comes to a clearing in the jungle, one of the few places where the sun actually gets through to the ground. Resting atop a large boulder in the center is ");
	//if PC's met the naleen:
	if(flags["TIMES_MET_NALEEN"] != undefined) output("a very familiar kitty-naga in the middle of a quick cat-nap");
	else output("what looks like a giant snake coiled around the rocks at first, but as the camera draws in, is clearly half-serpent and half-catgirl, a woman with deliciously large breasts on a feline torso, long orange hair draped around her half-furred body");
	output(".");
	
	output("\n\n<i>“Holy smokes!”</i> Steph whispers to the camera, angling it at the slumbering predator. Brazenly, the host approaches, creeping along the ground almost at a crawl. Lazily, the kitty-naga opens a single emerald eye, watching her approach. <i>“Lookit this, a NALEEN! They’re the deadliest predators on this planet, with tails so strong they’d crush me dead in a heartbeat. Lemme see if I can stick mah hand up ‘er cloaca!”</i>");

	output("\n\nIs she insane?");
	
	output("\n\n<i>“W-what are you doing, strange little girl?”</i> the naleen hisses as Steph creeps up. The snake-girl rises off the rock, her feline half looming over the show’s hostess menacingly.");
	
	output("\n\n<i>“Uh-oh, she’s noticed me! If I try to run, she’ll hunt me down in an instant! All I can do is lie perfectly still and hope she backs off! As a predator, the naleen shouldn’t bother me if I’m dead still.”</i>");
	
	output("\n\n<i>“...I can hear you,”</i> the busty monster sighs, cocking an eyebrow at Steph as she lies face-down in the dirt, heart-shaped ass swaying just inches in front of the camera.");
	
	output("\n\n<i>“Crikey! Looks like she’s coming in for the kill! All I can do now is try to overpower her!”</i> Steph shouts, leaping to her feet and tackling the naleen, throwing the two of them over the boulder and into the brush. The camera drone speedily follows the brawl as Steph and the naleen tumble around in the dirt, eventually rolling into a wet mud-pit at the edge of the clearing.");
	
	output("\n\n<i>“W-WHAT ARE YOU DOING!? GET OFF ME!”</i> the naleen howls as Stepth straddles her wide hips victoriously, pinning the huntress down and grabbing her massive tail’s slender tip.");
	
	output("\n\n<i>“There we go, got ‘er by the tail! Now let’s take a look at this beauty! Oh, she’s the real deal: lookit these scales. She’s seen some battles, too, see the dents and scars here?”</i> she says, pointing out the various cuts and old wounds on the naleen’s scales, a history of battle engraved in her body. <i>“Ah, ‘ere we go, see the cloaca engorging? When you hold ‘em, naleen can’t decide if you’re trying to kill ‘em or mate with ‘em! Let’s get a closer look!”</i>");
	
	output("\n\nThe camera zooms in on the naleen’s pussy as it visibly engorges, drooling a clear lubricant as Steph pokes a pair of fingers in, stretching the hole several inches wide.");
	
	output("\n\n<i>“D-don’t touch meeeee”</i> the naleen cries, writhing violently under Steph as the show’s host practically shoves her arm into the alien’s sodden box. <i>“...Ooh! Ooohhhh... mmm, yessss, stick your arm riiiiight in, little girl.”</i>");
	
	output("\n\n<i>“There we go!”</i> Steph announces victoriously to the camera, <i>“Elbow-deep in ‘er cloaca. Oh, this is a dream come true! Lookit the way she moves, writhing so gracefully. She’s a real beauty, innit she?”</i>");
	
	output("\n\n<i>“Mmm, you are not so bad yourself,”</i> the naleen coos as Steph’s arm vanishes up to the elbow inside her.");
	
	output("\n\n<i>“One of the most amazing things about these predators is the way they mate. Like some snakes from ol’ Earth, they congregate in huge ‘mating balls,’ just like a great big animal orgy that can last for hours, or even days. I’d give anything to see one of those up close and personal!”</i>");
	
	output("\n\n<i>“Is that so?”</i> the naleen grins, and suddenly her long tail is wrapped around Steph, encircling the hostess from shoulder to toes, leaving nothing but her head visible.");
	
	output("\n\n<i>“Holy smokes! Looks like I forgot the most deadly attack the naleen have: a crushing vice-like grip of the tail. I’ll be dead in seconds if I don’t think of a way out of this; she’ll crush the air right from my lungs.”</i>");
	
	output("\n\n<i>“You are very strange,”</i> the naleen sighs, her feline half rising up to grab Steph’s cheeks, turning her head aside to expose her neck.");
	
	output("\n\n<i>“Uh-oh, looks like I’m a goner! This paralytic venom could spell the end if she bites me!”</i> For someone convinced she’s about to die, Steph’s awfully calm about this.");
	
	output("\n\nThe naleen sighs and bites down, injecting a dose of paralytic venom into the show’s host. With an exaggerated gasp, Steph limply falls into the huntress’s waiting arms. Giggling, the naleen tosses Steph over her shoulder and carries her off, slithering into the forest - and the camera drone dutifully follows, tracking the pair of them for several minutes in the brush until they come to a cave mouth. The naleen slithers in, and the camera switches to nightvision as it follows her through a network of caves and into a large, natural pit in the ground.");
	processTime(4);
	clearMenu();
	addButton(0,"Next",stephODEp1II);
}
public function stephODEp1II():void
{
	clearOutput();
	stephHeader(1, true);
	
	output("<i>“Ugh, mah head!”</i> Steph drawls, rubbing her temples as the naleen plants her at the edge of the pit. <i>“Crickey! Looks like she’s dragged me back to her nest! Oh, but look here! Before she eats me, I’m getting to witness the ultimate alien curiosity: the naleen mating ball!”</i> The camera cranes down to the pit, highlighting dozens - hundreds, even - of writhing bodies intertwined, cocks and breasts bouncing everywhere, no hole left unfucked as kitty-nagas bend and twist to accommodate several mates of either sex at once.");

	output("\n\nWith a chuckle, the naleen gives Steph a little push, sending the New Brisbaner tumbling down the slope and into the heart of the pit... and right into the waiting arms of a particularly well-endowed male naleen whose two cocks are still dripping with juices from his last partner. Steph gives a shrill scream as her clothes are torn away, revealing the clean snatch between her long legs and her bouncing breasts, both quickly gripped by the male as she’s bent over the backs of an entwined couple, ass raised in the air for his inspection. He doesn’t waste a moment before lunging in, cocks ramming into her defenseless pussy and ass - and in glorious HD, all over galactic television.");
	
	output("\n\nSteph writhes and cries out as she’s double-penetrated by the twin-cocked naleen, just in time to have her open mouth filled with a juicy pussy. The camera pans up to reveal the busty huntress from before, fingers mashing Steph’s head into her groin as another male slithers behind <i>her</i>, a pair of cocks vanishing into the naleen’s ass. She coos with delight, vocalizations almost masking Steph’s screams as she’s violated. You can’t hide an unmistakable warmth spreading through your body as you watch the hostess getting fucked");
	if(pc.hasCock()) {
		output(", and you try");
		if(pc.legCount == 1) output(" displacing your [pc.leg]");
		else if(pc.isBiped()) output(" crossing your [pc.legs]");
		else output(" shuffling yourself");
		output(" to hide your growing stiff");
		if(pc.cockTotal() == 1) output("y");
		else output("ies");
	}
	output(". With a grunt, the male naleen finishes inside Steph, pulling out just in time for the camera to zoom in on her backside, the NV-mode making the spooge drooling out of her two stretched holes practically glow.");
	output("\n\nA giddy female, less busty that the first but with an almost inhumanly wide set of hips and a jiggling ass, slithers in under Steph’s ass, slender reptilian tongue lapping up the alien spunk dripping from her cunt as another male lines up his shot, sliding in with the last’s cum as lube. Powerful thrusts send Steph’s bubble butt jiggling as the kitty-naga hammers her holes, squirting the last’s cum out with each mighty blow, right onto the waiting face of the female. The bustier huntress gives an orgasmic cry as the male finishes in her ass, pushing Steph’s face as hard into her groin as she can before tumbling aside, pushed down by another horny male who immediately crams his dual cocks into Steph’s fem-cum slathered gob.");
	
	output("\n\nMales and females both takes turns force-fucking the half-conscious hostess, smearing her with gallons of alien spunk until her gaping holes are a constant waterfall of creamy spooge, glowing in the camera’s eye. The show’s runtime is almost up by the time the huge naleen orgy is winding down; a final male has pulled Steph into his lap, both cocks shoved up her ass as the busty naleen that brought her idly fingers the human girl’s pussy, cooing, <i>“Was it everything you hoped it would be, dear?”</i>");
	
	output("\n\nSteph’s head lolls haplessly, her voice breaking as she orgasms for the... hell, you lost count twenty males ago. Blowing his wad, the male pushes her off his rods, letting Steph flop down atop the coils of slumbering naleen. The camera flies down for a final closeup, showing her spunk-slathered body in its full high-definition beauty; where she should be delivering a final monologue about her exploits, Steph only manages to gurgle weakly, cum drooling down her cheeks.");
	
	output("\n\n<i>“This show brought to you by the Xenogen Biotech firm. Xenogen reminds you that galactic exploration is dangerous, and that natural wildlife is not to be approached without assistance from your friendly local rangers. Xenogen is not responsible for any graphic content witnessed on live galactic broadcasts or the safety of its personnel.”</i>");
	
	processTime(30);
	pc.changeLust(33);
	clearMenu();
	addButton(0,"Next",backToSmutMenu);
}

public function stephODEp2():void
{
	var x:int = 0;
	if(pc.hasCock()) x = pc.smallestCockIndex();
	else if(pc.hasVagina()) x = rand(pc.totalVaginas());

	clearOutput();
	stephHeader(2);
	
	output("You sprawl out and kick on the second episode of the season. A brief commercial plays, telling you to buy JoyCo brand healing services before the screen fades to a superimposed logo of <b>Steph Irson: Galactic Huntress</b>, a popular nature show. The camera pans down from a bright sunrise to an athletic young woman in an almost comically skimpy ranger outfit, with khaki hotpants and low-cut shirt rolled up to expose her midriff and ample cleavage both. Her blonde ponytail bounces excitedly as she jogs along through a jungle underbrush, the camera-drone struggling to keep pace with her. Despite her obvious humanity, the hostess is sporting a pair of perky kitty-ears atop her sandy hair, which twitch cutely as the camera focuses in on them.");
	output("\n\nA U.G.C. mandated warning appears on the screen in tiny letters:");
	output("\n\n<b>“The U.G.C. Scout Authority apologizes for content in previous episodes of <i>Steph Irson: Galactic Huntress</i>, and warns that interacting with unidentified xeno-biotics can result in erratic and unexpected mutations or grievous injury. Do not attempt anything seen in this series at home, or without professional guidance.”</b>");
	output("\n\nMeanwhile, on screen, the now cat-eared Steph grabs the camera, showing off the rusty wastelands behind her as she narrates: ");
	output("\n\n<i>“We’re here on ancient Tarkus, a world of rough and tumble inhabitants dealing with wild and untamed life and technology,”</i> the host begins in a thick New Brisbane accent, <i>“and we’re on the hunt for the Gray Goo. Now I know I usually go huntin’ for my creatures alive and kickin’, but these goo’re something special: made up of trillions of discarded micromachines, Gray Goo have a kind of network intelligence: the more of ‘em, the smarter they are. They’re very aggressive, though, so I’ll have to be very careful to stay out of their reach if I wanna make it out alive. One touch and I could end up enveloped in goo! Nasty!”</i>");
	output("\n\nHaving spoken her piece, Steph takes off jogging into the mechanical dunes of the Tarkus wastes, deftly maneuvering between piles of discarded trash and ruined tech from ages past, stopping occasionally to lament about the sad state of the planet or to scratch at her twitching cat ears (once even stopping to jump at an errant laser pointer coming from an old mining rig). Eventually, though, with a gasp of surprise and awe, the huntress meets her prey:");
	output("\n\n<i>“Crikey! Look at this!”</i> Steph says, tumbling behind a steel outcropping for cover. <i>“Come on, take a look at this: isn’t she a beaut?”</i>");
	output("\n\nThe camera hovers down behind her shoulder, focusing in as she points to a clearing ahead, in which sits what looks like a voluptuous gray woman, shining brightly in the sunlight, her proportions comically over-exaggerated - were she a <i>“real”</i> girl, you doubt she could stand up under the weight of those tits. Slowly, Steph creeps forward, whispering, <i>“Oh yeah, there’s one now. See how she morphs herself into a humanoid form? It’s just like a bird showing its plumage to attract a mate, but this babe’s got a devious twist to her: give her half a chance and she’ll drain you dry! Gray Goo live off of our bodily fluids, see, and they’ll do anything to get ‘em. I’d better be careful not to alert her to my presence!”</i>");
	output("\n\nSlowly, Steph creeps out of cover, hugging the ground almost like a cartoon character as she sneaks up on the Gray Goo sunbathing in the clearing. The camera putters behind her, giving an excellent view of the host’s ass in her sheer short pants, ever so slightly raised in the air as she creeps toward her prey.");
	output("\n\nNearing the slumbering goo-girl, Steph holds still a hair’s breadth away, camera zooming in for a close-up of the gray’s cute little face as she snores quietly. <i>“Must be in standby mode,”</i> Steph says, relief palpable in her voice. <i>“Look at how she mimics a human. Kinda cute, innit she?”</i>");
	output("\n\nAs she speaks, Steph pulls on a blue rubber glove, giving it a quiet snap before reaching up to the goo. <i>“Let me show just how gooey this creature is. She’s like gelatin to the touch, see-”</i>");
	output("\n\nAs soon as Steph prods the gey goo’s tit, of course, its eyes snap open. The goo sits up, looking around in total confusion before her gaze alights on the galactic huntress, whose hand quickly retracts, owner stumbling away as the goo wakes up.");
	output("\n\n<i>“Oh my gosh! A-are you Steph Irson!?”</i> the goo says suddenly, surging toward Steph, stopping just a few inches away, faces practically pressed together. <i>“Ohmygoshohmygosh! I love your show! Are we on right now? HI MOM! I mean, I don’t really have a mom, but if I did I’d totally say ‘hi’ to her right now!”</i>");
	output("\n\nSteph stares at the goo-girl for a long moment. <i>“W-what?”</i>");
	output("\n\nThe goo circles the galactic bounty hunter, in half-disbelief. <i>“A-and this is what you look like up up close? Oh gosh I’m so happy to meet you! A real person, a star! Eep, I’m nervous! I have all your shirts, Miss Irson, oh and I used to have a Galactic Huntress action figure but a rust monster stole it and used it like a dildo and fucked me with it! That was super fun, though. OH! W-would you sign, uh... I KNOW! Sign my tits!”</i>");
	output("\n\nThe goo makes an exaggerated motion, as if pulling her non-existent shirt up, presenting her gigantic bosom to Steph. Finally recovering from her surprise, the huntress runs a hand through her sandy hair, pulling out a marker from her pocket.");
	output("\n\n<i>“Sure! Anything for an adoring fan!”</i> she beams, as if she’s completely forgotten the mortal peril she’s supposedly in. Steph twirls the pen and pops the cap, asking, <i>“So, who do I sign this to, pretty lady?”</i>");
	output("\n\n<i>“Uh... I don’t know...”</i> the goo says apologetically, rubbing the back of her head in mock consternation, <i>“I don’t really have a name.”</i>");
	output("\n\n<i>“Aw, that’s alright, babe. I’ll call you Carrie! Like my mum!”</i> Steph says with a grin, starting to write on the goo’s tit... only to have her pen... and her hand... sink into her gooey skin.");
	output("\n\nThe goo and Steph both stare at the huntress’s wrist as it vanishes into the goo-girl’s tit. <i>“Oops. I guess I’m hungry! Oh well! This is gonna be super duper fun, Miss Irson, I promise.”</i>");
	output("\n\nSteph manages only to let out a panicked scream as a surge of gray goo rushes up her arm, crashing across her body like a tidalwave, pulling her into the main mass of silvery machines. Her voice is silenced as a million micromachines surround her, dragging the show’s host into the googirl’s body until there’s no trace of her left except her ponytail wiggling around behind the goo’s head, dripping with moist micromachines. Giggling to herself, the goo spins around and strikes a pose, now almost perfectly mirroring Steph’s shapely, athletic form (except for a much larger bust and ass), even pouring herself in to fill out the huntress’s clothes.");
	processTime(4);
	pc.changeLust(5);
	clearMenu();
	addButton(0,"Next",stephODEp2II);
}
public function stephODEp2II():void
{
	clearOutput();
	stephHeader(2, true);
	
	var x:int = 0;
	if(pc.hasCock()) x = pc.smallestCockIndex();
	else if(pc.hasVagina()) x = rand(pc.totalVaginas());
	output("<i>“Say hi to the camera!”</i> The goo titters, bending over and wiggling her ass at the camera drone hovering around her. Winking at the camera over her shoulder, she reaches back and spreads her cheeks, quick and hard enough to rip her short pants and revealing a glistening wet ass and pussy - a human pair - beneath the torn bits of short pants still clinging to the hidden Steph’s hips. The drone zooms in on her slit, catching a bit of lens flare as the dim sun reflects off of Steph’s soaked-wet pussy, showing a thick trail of vaginal secretion trickling down from her spread hole.");
	output("\n\n<i>“Won’t need THESE anymore,”</i> the goo giggles, fingers slipping into her hips and pulling off the ruins of Steph’s shorts, and then her lacy black panties, which the goo pauses to get a nice whiff of. <i>“Oh, she smells just like I thought she would! M-maybe I should keep these...”</i> she says, looking around in mock-guilt before stuffing them into her gooey cleavage.");
	output("\n\nPants gone, the goo shimmies down to the ground, planting her ass on the dusty plain and lifting her long, toned legs up, slowly pulling off her boots one by one, leaving Steph’s long stockings bare to the camera. <i>“Oooh, sexy! Maybe I’ll just leave these on!”</i> the goo giggles, rolling onto her knees and showing off her backside and legs for the camera.");
	output("\n\nThe goo’s absolutely putting on a show of her own, now, crawling toward the camera on all fours, slowly letting her machines tear apart Steph’s shirt to reveal her impressive bust, barely held back by a tight black bra. She exaggerates her movements, making sure her heavy chest is nice and bouncy for the camera as she approaches.");
	output("\n\n<i>“Do you like my tits, galaxy?”</i> the googirl grins, groping her Steph-shaped bosom. <i>“Maybe you want a closer look?”</i>");
	output("\n\nWith a saucy smile, the goo covers her lace-clad breasts with her arms, imitating a show of modesty... only for the bra covering them to tear a moment later from the sheer amount of goo straining beneath it, letting her tits bounce free. Steph’s stiff, small nipples quickly draw the camera drone’s auto-focus.");
	output("\n\n<i>“Oh, no, my big, bouncy tits are exposed! The whole galaxy can see my boobs... how embarrassing...”</i> the goo says with mock shyness, barely able to contain her laughter. <i>“Does that mean I’m a slut now? Oh, I bet so many people are masturbating to me now...”</i>");
	output("\n\nShe giggles to herself, but you’re starting to flush with arousal yourself... and you can only imagine what the rest of the galaxy-wide audience is making of this display!");
	output("\n\nBack on screen, the gray goo encasing Steph Irson has rolled onto her back, spreading her legs for the camera, fingers delving into poor Steph’s gaping cunt, thumb teasing the bud of her clitty. The goo herself is giving the audience a playful grin, clearly enjoying the galactic attention - or at least that of the drone as it buzzes around her, always searching for the best angle. Giving a little gasp of pleasure, her slimy fingers slip into Steph’s folds, spreading her cunt out for its closeup. The drone dutifully flies in, giving you a perfect High-Def view of Steph Irson’s pussy gaped around the googirl’s hand as she starts to jill off.");
	output("\n\n<i>“Are you getting close, galaxy?”</i> the goo grins, fingers moving faster and faster through Steph’s exposed groin. Mimicking Steph’s own accent, she continues, <i>“Well, I sure am! Let’s finish together, everyone!”</i>");
	
	pc.changeLust(33);
	output("\n\nWith a giddy cry of pleasure, the goo-girl lets out a powerful squirt of girl-cum right into the camera drone’s eye, sending it tumbling back as its owner and her gooey captor cum and cum, screaming and bucking their hips on the ground. A few moments later, the screen goes black, followed by an <i>“Experiencing Technical Difficulties”</i> warning superimposed over the <i>Galactic Huntress</i> logo. In the background, though, you can still hear Steph moaning as the goo finishes with her.");
	output("\n\n<i>“So, you’re gonna edit all that out in post, right?”</i> the goo giggles, just as a commercial comes on.");
	
	processTime(19);
	clearMenu();
	addButton(0,"Next",backToSmutMenu);
}

public function stephODEp3():void
{
	clearOutput();
	stephHeader(3);
	
	output("You sprawl out and kick on the third episode of the season. A brief commercial plays, telling you to purchase New Texan-brand breast milk before the screen fades to a superimposed logo of <b>Steph Irson: Galactic Huntress</b>, a popular nature show. Beneath the title script, a warning appears in large red letters: <i>“This Show Rated X, Adults Only, by the Galactic Entertainment Ratings Board for Graphic, Sexual, and Disturbing Imagery. You Have Been Warned.”</i>");
	output("\n\nThe camera pans down from a wide-angled shot of the vast, sweeping plains of New Texas to finally focus on the hostess, Steph, sitting atop a simple wooden fence at the field’s edge, one leg crossed over the other, showing off the toned calves beneath her sheer short-shorts. To her right and left are a pair of prodigiously-endowed cow-girls, their massive breasts bare, resting atop the fence-posts as they look placidly off into the distance behind the camera, both chewing on what looks like lettuce from a shared to-go box.");
	output("\n\n<i>“Welcome to a special edition of </i>Galactic Huntress<i>,”</i> Steph Irson says, as ever in her strong New Brisbane accent. As the camera zooms in on her face, you’re treated to a close-up view of the perky cat-ears now resting atop her hair, as well as the odd, almost metallic-gray color of her lips and irises. Every time she blinks or speaks, the colors seem to shift and swim, as if alive and moving.");
	output("\n\nShe continues: <i>“Today we’re coming back toward the core for a look at some more domesticated species. It’s always important to remember that, though the frontier is a wild and untamed place, full of wonders and mysteries and strange new life, each of the worlds you and I would call the Core were, once upon a time, just as wild as Mhen’ga or Tarkus. Today we’re on New Texas, once an inhospitable world that humanity carved out into an idyllic paradise. Rather than relying on advanced technology as many colonies do, NT’s retained its peaceful, farm-like appearance. This planet’s green fields and friendly farm-hands go on for as far as the eye can see.”</i>");
	output("\n\nSmiling at the camera as it zooms back out, Steph puts a friendly hand on the shoulders of the two cow-girls beside her. One of them moos quietly, looking up at her. <i>“Here we’ve got New Texas’s native inhabitants. Generations of traditional genetic modifications have given them a cute, bovine appearance -- and a whole new meaning to sexual dimorphism. Males and females of New Texas are wildly different physically and mentally. We’re going to see just how so!”</i>");
	output("\n\nSteph hops nimbly from the fence post and takes one of the cow-girls by the arm, giving her a gentle tug towards the camera’s left. The cow moos, her floppy ears perking up. <i>“Milk time?”</i> she asks, obediently following along behind Steph.");
	output("\n\n<i>“Milk time, big girl!”</i> Steph coos, petting the cow on the head. Turning back to the camera, Steph explains, <i>“Human milk is the colony’s primary export. The slightly modified milk produced here is excellent for your health, highly nutritious, and if I’m in luck in a few minutes, absolutely delicious! Gotta admit, never tried cow-girl milk before, so I guess I’m in for a new experience today. Isn’t that right, cutie?”</i>");
	output("\n\n<i>“Moo!”</i> the cow-girl cheers as the camera follows Steph into a barn at the end of the fence. The pair of them step through a small side door and into what looks like a stable full of cow-girls just like the one on Steph’s arm, all bent over harness-like apparatuses with long tubes leading from their breasts to pumpers in the stall corners. The audio is temporarily drowned out with loud moos, low groans, and cries of pleasure. More than one cow the huntress passes has a vibrator or other toy lodged in her cunt, helping her along towards the orgasmic pleasure of lactic release.");
	output("\n\nEventually, Steph leads the cow to an empty stall, followed dutifully by her camera drone. <i>“Now, let’s take a gander at the milking tech at this particular ranch. These lovely ladies produce more milk in their chests than an old-Earth dairy cow per day, and that all has to go somewhere: and that somewhere is here. C’mon, sweetheart, let’s get you saddled up!”</i>");
	output("\n\nThe cow grins and hurriedly steps up into the harness hanging down from the ceiling. With a little help from Steph, she’s soon putting almost all of her weight on the two cords of the harness, one under her chest and the other just above the groin, which leaves her bent-over with her big, milky breasts hanging down for easy access. The cow moos in excitement as Steph moves to her side and crouches down; the camera finds itself angled just perfectly to catch a glistening bead of excitement pearling on the lips of the cow’s sex.");
	output("\n\n<i>“Right. Now, normally milking here’s done by pneumatic suction,”</i> Steph says, pulling a pair of blue gloves on over her hands, <i>“But I like to get a bit more hands-on, don’t I?”</i>");
	output("\n\nFlashing the camera a grin, Steph drags a bucket underneath the cow’s hanging bosom and reaches up to up one of the cow-girl’s tits. The cow groans, her fluff-tipped tail swishing happily as Steph’s hands work onto both her boobs, squeezing and massaging the huge, soft mounds. Steph’s quickly rewarded with a little spurt of milk trickling from the cow’s teat, a pair of white streams pouring down into the bucket. The cow-girl shudders and moos quietly while her body sways in the harness as she’s milked and her legs tremble with pleasure.");
	output("\n\n<i>“The girls on NT just love getting milked,”</i> Steph narrates as her hands continue to rhythmically massage the cow’s tits. <i>“Generations of selective breedings, genetic manipulation, and a special, top-secret drug called the Treatment have made the local women into the ultimate milk-cows. Just a couple minutes of this, and I’ll have a full bucket of creamy, delicious milk. Won’t I, cutie?”</i>");
	output("\n\n<i>“Uh-huh!”</i> the cow smiles listlessly, eyes almost crossed. Steph works the swollen teats harder, pumping squirt after squirt into the steel bucket until, as the camera drone zooms in on it, you can see the white sea nearly cresting the lip of the bucket. For every tug and squeeze Steph lavishes on the cow’s teats, the bovine beauty answers with a quiet whimper or low moo of pleasure, groaning and gasping until you’re sure the busty cow’s about to cream herself.");
	output("\n\nWhen she does, you’re treated to a shrill cry of ecstasy as the cow cums, her whole body wracked with spasmic shudders that nearly send milk spraying everywhere. And what milk there is! As she climaxes, the cow’s tits work themselves into high gear, spraying what looks like gallons into the over-laden bucket. After several minutes of orgasmic milking, Steph steps back and hefts the bucket up from under the twitching, blissed-out cowgirl.");
	output("\n\n<i>“Now, let’s take a taste, shall we?”</i> she grins, bringing the bucket up to her lips and drinking deep. When she lowers it, she’s grinning from kitty-ear to kitty-ear, a great big milk moustache on her upper lip.");
	output("\n\n<i>“Croickey! That’s amazing!”</i> Steph says, clearly surprised. <i>“I think I’ll be switching brands at home if all the girls have your talented teats!”</i>");
	output("\n\n<i>“Glad you liked it,”</i> the cow-girl murmurs, half asleep in her afterglow.");
	processTime(10);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",stephODEp3II);
}

public function stephODEp3II():void
{
	clearOutput();
	stephHeader(3);
	
	output("Steph sets her big bucket down, cracks her knuckles, and wipes the milk from her lips. <i>“Right, then. That’s a Texan sheila for you. Now, we’re going to have to be a little more careful up ahead: we’re on a quest to find a bull. Now, these bovine ladies we’ve met so far are typical of their sex here: quiet, content, eager to please. But the studs here on New Texas are a bit more aggressive. They’re slightly outnumbered by the females, with each bull able to sate his base urges on a whim, spreading their wild oats freely among all the girls. But the Treatment’s made ‘em big, burly, and eager to go toe-to-toe on a hairpin.”</i>");
	output("\n\nAs she’s talking, Steph’s walks out of the stall and back into the barn proper. Her “quest” takes her all the way to the other end of the barn, where in the background of her narration, you can see a huge, muscular man pounding away at one of the harnessed-up cowgirls, plunging his cock into her spread pussy as the automated milkers work their magic on her. Seeing the proceedings out of the corner of her gray eye, Steph freezes mid-step, hunching down and whispering to the camera drone, <i>“Alright, here we go. I’m going to have to be very, very careful not to earn this bull’s ire. Small words, a non-threatening tone.... I absolutely do not want to be seen as a threat, especially during what must be mating season here on New Texas.”</i>");
	output("\n\nIn proper <i>Galactic Huntress</i> fashion, Steph starts to creep up toward the bull, stealthily making her way up behind his pistoning hips. The camera drone floats around to get a better picture of him: mostly human, but freakishly tall, with massive bull horns growing from his brow. The man’s muscular to the point of a bodybuilder, with a thick layer of body hair that clings tightly to his darkly tanned skin. His jaw is locked in a frown of effort, and he’s grunting deeply, almost like a real bull. Every powerful hip-thrust sends the cow-girl rocking in her harness, her assflesh rippling with the impacts.");
	output("\n\n<i>“G’day, mate!”</i> Steph says suddenly from the stud’s side, leaning against the stall wall.");
	output("\n\n<i>“‘Sup,”</i> he answers, not breaking pace nor looking up.");
	output("\n\nInching closer, Steph asks, <i>“Got a sec to answer some questions, big boy? For the viewers at home?”</i>");
	output("\n\n<i>“Working,”</i> he grunts, slapping the cow-girl on the ass. She shrieks, a large red-mark left on her behind.");
	output("\n\nSteph pouts. <i>“C’mon, you’re the first stud I’ve seen all day.”</i>");
	output("\n\nThe bull finally looks away from the jiggling cow-butt between his legs and glowers at the huntress. <i>“Lady, I’m balls-deep in a bitch right now. Can you wait like, five minutes?”</i>");
	output("\n\n<i>“That doesn’t make for exciting television, now does it?”</i> Steph says, arms crossed. As she does so, her camera drone shudders and re-focuses on the gap between the stud and his brood-cow, zooming in on his huge cock pounding her spread pussy and giving you a gloriously high-def view of the fem-cum spurting out around his rod. Now <i>that</i>’s some good television.");
	output("\n\n“You sure I can’t borrow you for a minute?” Steph purrs, her feline ears perking up atop her head as one of her arms reaches out to caress the thick, tense muscles on the Treated man’s arm.");
	output("\n\nThe stud hilts himself in the cow and grunts with bestial enthusiasm, his breath hot and heavy as the camera drone focuses in on him, and then on thoroughly-bred cow beneath him. With another feral grunt, the bull takes a step back from the well-fucked cow-slut and letts a torrent of spooge pour out of her packed pussy, a waterfall of white that very nearly splatters on the camera drone. When it recovers, you’re treated to a full-frontal view of the stud’s cock: a huge equine phallus almost as long as his arm dangling between his muscular legs.");
	output("\n\nHe turns to Steph with a toothy grin and grabs the Huntress’s ass in both hands, pulling the khaki-clad hostess up against himself. Steph makes a pathetic little yelp as she’s all but hauled off of her feet, her bare legs rubbing up against the bull’s half-hard prick - which immediately smears her tanned flesh with thick, white cream.");
	output("\n\nThe bull grabs the camera drone as it passes by, making it chirp and buzz at him as he pulls its camera around to look him right in the face. <i>“Want some exciting television, viewers? I hear this slut tapes live, don’tcha?”</i>");
	processTime(10);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",stephODEp3III);
}

public function stephODEp3III():void
{
	clearOutput();
	stephHeader(3, true);
	
	output("<i>“Hey, I’m not a-”</i> Steph starts to say, getting cut off when the bull bucks her onto the milker. His free hand all but rips her shirt off by the back, leaving tattered fragments of cloth hanging limply from Steph’s shoulders.");
	output("\n\n<i>“Why don’t you interview this?”</i> he chuckles, aiming the camera drone down to watch as he cranes Steph’s head into the thighs of the cow-girl he was just fucking, rubbing the huntress’s nose into the cream-packed slit between them. The cow immediately starts to moan, arching her back and clutching at her over-sized jugs - you can’t see the action up close, but something tells you Steph isn’t exactly resisting the bull’s direction.");
	output("\n\nThe stud chuckles and steps back, keeping one hand firmly planted on Steph’s back as he circles around, giving you - and the hundreds of thousands of other viewers across the galaxy - an ultra-HD panoramic of Steph Irson lapping up his cum from the cow’s twat. <i>“Always wanted to do a porno,”</i> he laughs, almost boomingly loud so close to the drone’s microphone.");
	output("\n\nHe lets go of Steph’s back, and grunts approvingly when she stays right where he put her, making his bovine bottom moan and squirm between the attentions of the milker and Steph’s apparently very talented tongue. The bull makes quick work of the rest of Steph’s clothing, yanking away her tattered top and pulling her khaki booty shorts down around her ankles, revealed a pussy with silver-gray lips.");
	output("\n\n<i>“Woah, what do we have here?”</i> the bull says, crouching down behind the bent-over huntress and focusing the drone in on her drooling sex. <i>“Nice and smooth and painted up...”</i> he reaches forward to tease a finger along her lips, tracing a thick digit around her sex before plunging a pair of them inside her... and then the rest in quick succession, burying himself to the wrist.");
	output("\n\n<i>“Damn, babe, that’s some fine work you’ve got done down her. Fuckin’ stretchy as hell... it’s like you were just </i>made<i> for takin’ big dicks, huh?”</i>");
	output("\n\nSteph yelps something, trying to sit up but finding herself trapped in the iron grasp of the cow-girl’s thighs. The bovine babe’s legs are wrapped around Steph’s shoulders, the camera reveals, pulling the huntress deeper and deeper into the cow’s cunny... and the growing lake of moisture pooling under her ass, drool and cum and feminine excitement mixing into what you can only imagine to be an heady aroma. Steph must be going insane down there...");
	output("\n\n<i>“Fuck it, guess I don’t need to get you warmed up after all,”</i> the bull laughs, pulling his fist out of Steph’s cunt and standing up, leaving her silver lips so agape it looks like you could just roll a bowling ball into her. The bull grabs his mammoth dick and hefts it up, flopping the hardening equine erection right onto Steph’s bubble butt. The huntress yelps and cries out - you’re not sure if in pleasure or alarm, as her words are drowned out in cow-girl pussy.");
	output("\n\nSpeaking of cow-girls, the babe Steph’s eating out takes the opportunity to let out a bellowing <i>“Mooooo!”</i> and throw her head back in a sign of ultimate pleasure, spraying Steph down with a geyser of fem-spunk and discharged bull-seed in what looks like an orgasm of legendary proportions.");
	output("\n\nA moment later and the cow flops heavily onto her back, completely still. <i>“Damn,”</i> the bull grunts, craning the camera up to look at the blissed-out look on his partner’s face, eyes rolled back up and mouth agape. <i>“Guess you know how to handle a cow... Heh, I bet you’d like some of that same treatment, wouldn’t you, slut?”</i>");
	output("\n\n<i>“I AM NOT A-”</i> Steph finally manages to say, digging her head out from the cow-girl’s thick, cum-splattered thighs. The camera automatically zooms in on her face, giving you a perfect look at her wet cheeks and the rivulets of white spilling down from her silver lips.");
	output("\n\nThe bull cuts her off with a rough spank that makes her ass jiggle under his heavy rod, and Steph’s words coil into a scream of pleasure.");
	output("\n\n<i>“Don’t think I heard you, slut,”</i> the bull grunts, digging his fingers into Steph’s behind and massaging her ample ass, squeezing and kneading until she’s moaning and quivering in his grasp. <i>“Ready for me to make you a real cow, yet?”</i>");
	output("\n\nSteph answers with a wordless moan, grinding back against the bull and wiggling her firm behind. The immense stud just laughs and starts to move his hips, sliding his still-slick shaft between her asscheeks. As he does so, he moves his hands from the huntress’s butt to the passed-out cow’s tits, yanking the milker pumps off of her plump breasts with a squirt of white cream that rains down all over Steph.");
	output("\n\n<i>“Smile for the camera, babe,”</i> the bull grunts, bringing the camera around to look Steph in her spunk-splattered face. As he does so, he reaches up and attaches to milkers to her perky handfuls of boobs. She immediately starts to moan, arching her back as the suction cups try and drain her of... nothing.");
	output("\n\nThe bull grunts and cocks an eyebrow, as if he can’t understand why there’s not a flood of white cream pouring out of Steph’s tits. It hits him a moment later, and he laughs heartily, giving her a smack on the ass for emphasis. <i>“Oh, right. Hah, been ages since I found a slut who didn’t just turn into a milky mess when I hooked her up. But I bet you wanna fix that, don’t ya? You want the whole New Texas experience... for your viewers at home.”</i>");
	output("\n\nHe reaches over to where several articles of clothing are hanging on the wall and fishes a small bottle out of the cow-girl’s purse, rolling in in his hand for the camera to reveal the big, friendly words <i>“BOVINIUM”</i> labeled on it. <i>“Some of the cows here take these if they’re not all the way satisfied with what the Treatment gives ‘em,”</i> the bulls says, opening the bottle and tipping out a cute little gummy cow into his hand. <i>“Just in case they want bigger tits or even more milk. Sounds about right up your alley.”</i>");
	output("\n\nSteph’s eyes go wide as the big, burly bull looms over her... but you notice she doesn’t seem to resist as he places his gummy-laden hand over her lips, tipping the candies into the Huntress’s mouth.");
	output("\n\nThe Huntress starts to change bodily: her once-perky tits are expanding, and her thighs, ass, and hips are plumping up like a proper New Texan cow. You watch with mounting arousal as Steph’s body changes in front of the camera, her tits growing and growing with added weight. They fill out to a pair of huge, jiggling jugs - perfect circles resting high on her chest, with tan skin only emphasizing the puffy pink teats at their tips.");
	output("\n\nTips that start to bud with moisture. Steph groans as the suction tubes latched onto her expanding bust start to coax out a trickle of... of milk! Those candies really are making her just like a good little cow, thick and milky and moaning as she’s drained of what her body’s now producing. The bull grins, reaching forward to sink his hand into Steph’s super-soft boob, squeezing until she cries out. And, you note, her hand starts to slip down towards her cunt, which the camera drone shows to be all but drooling with excitement.");
	output("\n\n<i>“What’s that, babe? Need a little attention down there?”</i> the bull growls, grabbing Steph’s hand before she can start to masturbate, making her moan as her body’s subjected to irresistible pleasure from the milker. She’s like a limp, leaking doll in his hands, tiny and helpless as the stud picks her up, turns her around so she’s facing her camera drone, and drops her down on his flared cockhead.");
	output("\n\n<i>“Alright, let’s finish this! You following me, camera drone?”</i> he laughs, slamming Steph down on his cock. The drone dutifully zooms in on the action, focused in as his massive shaft spreads Steph wide. You watch as the Huntress is bounced up and down by his bucking hips, her gut distending to make room for the sheer mass of cock inside her cunt, stretching and compacting as the bull fucks her brains out. Steph cries out, grabbing at the stud’s arms, her tits, anything she can to steady her bouncing, jiggling, orgasming body.");
	output("\n\nSteph’s climax is as loud as it is wet, heralded by a scream of pleasure at the bottom of one of the bull’s bucks, when every inch of cockflesh that can be is crammed into her. The camera watches close as her pussy sprays out a thick load of femcum, splattering the camera lens with that and a geyser of milk sloshing out from her heavy, bouncing tits and through the milker’s tubes.");
	output("\n\nSatisfied that he’s put the huntress in her place, the bull takes a step forward and presses Steph into the wall of the stall, squishing her between his body and the hard boards. With her immobilized, he’s free to grip her hips and start pounding, thrusting as hard and deep as he can to get himself off in the bovinified-Steph’s sodden box. He doesn’t take all that long to reach his peak when he puts his mind to it, and soon he’s grunting with effort, balls visibly clenching as he prepares to cum.");
	output("\n\nAt the last moment, the bull pulls out, leaving Steph’s pussy gaping. He grabs his cock and aims it over her like a hose, letting the mammoth tool loose to spray a torrent of thick seed over Steph’s back and ass, practically plastering her to the wall with his sticky load. By the time he’s done, Steph looks like a snow-woman, completely covered in white spunk. The bull grins, slaps her ass, and turns to leave...");
	output("\n\n... Only to turn back, grab the camera drone right out of the air, and give it a toothy grin. <i>“That’s it for this week’s episode of </i>Galactic Slutress<i>. Tune in next week to watch this big-titted bimbo get fucked by something else. Oh - and hi, mom!”</i>");
	output("\n\nThe camera feed cuts out, and a commercial break cuts in.");
	
	pc.changeLust(10);
	processTime(29);
	clearMenu();
	addButton(0,"Next",backToSmutMenu);
}

public function stephODEp4():void
{
	clearOutput();
	stephHeader(4);
	
	output("You sprawl out and kick on the fourth episode of the season. A brief commercial plays, advertising RhenWorld Stellar Excavations as an exciting career opportunity for anyone for anyone looking to see the frontier of the galaxy. After a brief splash of a pair of handsome leithans galloping over a rocky alien world, the screen fades in to the logo of <b>Steph Irson: Galactic Huntress</b>, a popular nature show. Beneath the title script, a warning appears in large red letters: <i>“This Show Rated X, Adults Only, by the Galactic Entertainment Ratings Board due to graphic, sexual, and disturbing imagery. You have been warned.”</i> A smaller notice underneath announces <i>“This show brought to you by the New Texas Council for Entertainment,”</i> followed by a cute cartoon image of an overly-busty cow-girl giving you a wink and a thumbs up.");
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
	addButton(0,"Next",stephODEp4II);
}

public function stephODEp4II():void
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
	addButton(0,"Next",stephODEp4III);
}

public function stephODEp4III():void
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
	addButton(0,"Next",stephODEp4IV);
}

public function stephODEp4IV():void
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
	addButton(0,"Next",stephODEp4V);
	addButton(1,"StopWatching",backToSmutMenu);
}

public function stephODEp4V():void
{
	clearOutput();
	stephHeader(4, true);
	
	output("The tentacles are relentless, single-minded in their motions to pump Steph full of creamy, viscous seed. Her belly swells with the sheer volume of plant-spunk flooding into her womb and both ends of her gut, distending even more as the tentacles visibly squirm inside her, straining her body to its limits. Minutes fly by in vigorous fucking, the tentacles drilling deeper and deeper into Steph’s abused body, joined by even more small vines that worm their way into her holes beside their larger cousins. Every root and vine in the bush seems to be trying to wriggle its way into her, to give the Huntress its load of thick, creamy plant spunk.");
	output("\n\nBy the time they’re done with her, Steph’s as white as a sheet, slathered with plant spooge from head to toe and still trickling milk as the vines latched onto her breasts release her. She sputters and coughs as the vine in her mouth withdraws, giving her a final money-shot across her cheeks in glorious close-up high definition. Her eyes flutter as the last squirts of cum plaster her gray lips, and her tongue laps it up with lazy hunger. She gives a full body shiver, drawing the camera’s eye towards her crotch as the tentacles buried in her twat slowly slither out, drawing out another screaming orgasm from the show’s host as they pop out, splattering her thighs with thier cum and hers.");
	output("\n\nSteph slumps against the restraints still around her limbs, breathing hard and shivering with the aftershocks of repeated orgasm, completely at the plant’s mercy. However, it seems done with her now that she’s utterly filled with the vines’ seed. The camera follows her as the tentacles draw her limp body back up through the bush over the pit and deposit her back on the surface, plopping her back on the stone cavern floor in a pool of white, creamy spunk. You can see one tentacle, however, still outside the pit, attached firmly to the Galactic Huntress’s backside.");
	output("\n\n<i>“Oof,”</i> Steph groans, rolling onto her hand and knees, ass in the air and face to the camera. <i>“Well, that’s it for another episode of </i>Steph Irson<i>... ugh, what’s that on my... uh, </i>Steph Irson’s Galactic Huntress<i>. Join us next week for... agh, what the-”</i> she gasps as the tentacle behind her flicks up, its bulbous purple cockhead peeking up to look at the camera, drooling from its cumslit. The camera flies over to take a look, showing where the tendril’s cockhead shifts into plant-like vine... and then travels down to join with Steph’s backside, just over her ass, foliage merging with flesh. She moans, and the tail squirms around, batting at the camera until it flies back.");
	output("\n\n<i>“We’ll, um, next week we’ll be... uh,”</i> Steph slurs, her new cock-tail vanishing between her legs. <i>“We’ll be- gaaaaahhhhhh!”</i>");
	output("\n\nThe tail plunges into her, pumping vigorously into her backside. She gives a startled squeal, slumping forward onto her big, milky jugs as her new appendage gets used to her. The camera feed fades to black, telling you to tune in next week for another exciting episode of <i>Steph Irson, Galactic Huntress</i>.");
	output("\n\nMan, you gotta wonder how Steph is staying on public television.");
	if (pc.libido() >= 40) output(" Not that you’re complaining...");
	
	processTime(6);
	pc.changeLust(7);
	clearMenu();
	addButton(0,"Next",backToSmutMenu);
}

//STEPH IRSON!
//[Watch Screen]
//It looks like the TV is currently running the latest episode of <i>Steph Irson: Galactic Huntress</i> if you'd care to watch. 
public function stephODEp5():void
{
	clearOutput();
	stephHeader(5);
	
	output("You sprawl out and kick on the fifth episode of the season. A brief commercial plays before the episode starts, telling you this program is brought to you by TamaniCorp, the galaxy’s leading manufacturer of personal pleasure products and fertility enhancements. An image of a bubbly pink woman in barely-modest skankware flashes you a thumbs up and jiggles her tits at the camera before it fades out, and the new title card of the program comes in: a large pair of fleshtone twin planets with the words <b>Steph Irson: Galactic Huntress</b> superimposed over them. Beneath the title script, a warning appears in large red letters: “<i>This Show Rated X, Adults Only, by the Galactic Entertainment Ratings Board for Graphic, Sexual, and Disturbing Imagery. You Have Been Warned.</i>”");
	output("\n\nA smaller notice underneath announces <i>“This show brought to you by the Council for Interspecies Understanding on Myrellion,”</i> printed over the image of both a red and a gold-colored ant-person holding hands.");
	output("\n\nAfter a moment, the introduction fades out, replaced by a crackling white of static. You briefly think that something’s gone futzy with the quantum connection, but before someone can go up and give the screen a good bonking, the fuzzy white resolves into a more recognizable shape: a torrent of snow, blasting past a shaky camera at breakneck speeds. After a few seconds of staring at vague shapes obscured by a thick glaze of ice and snow, something off-screen grabs the camera drone and wipes away at the caked-on ice, clearing it off enough for you to see what’s going on.");
	output("\n\nA woman is crouching on the top of a snowbank when the camera refocuses, bundled up in a heavy fur-lined coat with the show’s logo on one huge, jutting boob and that of the Confederate Scout Authority on the other. Though the figure is so heavily clothed that you can’t see an inch of flesh, the outrageously curvaceous figure, swivelling cat-ears, and wriggling vine-like tail poking out the back of her pants leave little room for doubt that you’re looking at Steph Irson, the much-mutated host of the show.");
	output("\n\nSatisfied with her work on the drone, Steph releases it and pulls up a pair of goggles from her gray eyes. <i>“Welcome to Uveto Seven, everyone!”</i> she shouts over the howl of the blizzard, barely audible without a hell of a lot of boosting from the drone that leaves her sounding husky and strained. <i>“Thanks to our friends at RhenWorld Stellar Excavations, we’re taking a break from the dangerous and untamed frontier to look coreward at some of the galaxy’s least understood sapients. As you can probably see, Uveto is a totally hostile world. I can barely, like, feel any of my limbs and I’m wearing three heat belts! Because it’s so cold and stormy, and the natives remain resistant to uplifting, there’s been very little proper study done here on the frozen moon. But we’re here to change that!”</i>");
	output("\n\nShe gives a big thumbs up to the camera drone and twists around, gazing out over the seemingly endless plains of snow stretching out in every direction. Under the light of the massive gas giant in the heavens, the whole moonscape seems to take on a reddish-white hue. Pretty, in its way, but also as foreboding as a blood moon. Steph wraps her arms around herself and starts creeping forward. <i>“So today, we’re on the hunt for a Korgonne! They’re a cute little race of caniforms, fluffy and pudgy as they come, but super fierce when provoked. I’ve gotta be slow and careful if I don’t wanna end up bushwhacked and dragged off to who-knows-where. Remember: if you get stuck or lost out here, you’re on your own gettin’ back!”</i>");
	output("\n\nWhile she’s talking, Steph slinks forward, bent just enough that the camera drone gets confused and zooms in on her big, jiggly behind as she moves. Her butt strains the fabric of even her heavy winter gear, swaying hypnotically with every motion. The green, plant-like tail poking out of the back of her pants wiggles at the drone, idly pawing at it with a big, bulbous purple crown shaped suspiciously like a fat dick.");
	output("\n\nThe drone wobbles and zips back out of reach before the willful tail can interfere with it too much, panning out to reveal a ridge of icy outcroppings that form a valley just ahead of where Steph’s going. She waves for the drone to follow her, pausing at a small crevasse a few yards later. <i>“Oh, here we go!”</i> she cheers, wiping away some crusted ice near the entrance. <i>“Tribal drawings! Aww, they’re so cute! We must be gettin’ close to korgonne territory now, see?”</i>");
	output("\n\nShe grabs the drone and uses it like a hand-held, showing you a pair of charcoal drawings on the rock. Two tiny, crude dog-people are shown with immaculately drawn phalluses ganging up on some kind of cat-woman, drilling her from either end while making what looks like a high-five over her arched back. Tribal unity at its best, you guess.");
	processTime(7);
	//[Next]
	clearMenu();
	//+Korgonne busts in background
	addButton(0,"Next",stephODEp5II);
}

public function stephODEp5II():void
{
	clearOutput();
	showBust(stephBustDisplay(5, true),"KORGONNE_MALE_NUDE","KORGONNE_MALE_NUDE");
	author("Savin");
	
	output("Steph giggles and turns towards the crevasse, which is only a hair more than a foot wide you notice. She starts trying to squeeze, but predictably her over-sized tits catch on the rock, making her squirm and strain to pull herself into the tight passage. Though the wind’s still howling, you’re half-sure you hear a <i>“Moo!”</i> under her breath before, with a grunt of effort, she pulls herself through. A pair of buttons go flying, beaning the camera drone; when it catches back up to her, Steph’s coat is open-fronted enough to show off a healthy dose of milky cleavage heaving under her khaki top.");
	output("\n\nPoking out of the crevasse’s far end, Steph glances around what seems to be a deep caldera - a basin below the ice around the plains, shielded from the storm. Pillars of dark obsidian lance up from the ground all around her, and smoke is rising from somewhere nearby. A village, maybe? <i>“Tight squeeze! Meant to keep biggies like me out. I bet we’re-”</i>");
	output("\n\n<i>“YOU!”</i> a sharp, high-pitched voice shrieks from somewhere off camera. Steph spins around, taking the drone with her to look up at the top of a nearby snowbank. A half-dozen small, squat, fur-covered creatures are standing atop it with spears and axes in their hands. <i>“");
	if(silly) output("MUCH TRESPASS. VERY INTRUDE!");
	else output("UNWELCOME ALIEN. AVALANCHE OF MISTAKE!");
	output("”</i>");
	output("\n\n<i>“What.”</i> Steph blinks at them. <i>“Oh! They’re korgonne! Ohmygod they’re even cuter in person. Don’tcha just wanna run up and hug them!?”</i>");
	output("\n\nOne of the creatures barks <i>“");
	if(silly) output("NO HUG. VERY FIERCE. SO INTIMIDATE!");
	else output("NO NO! STUPID ALIEN. MISTAKE!");
	output("”</i> and waves her spear threateningly at Steph. Several of the others step forward, growling at her through blue-hued lips. <i>“");
	if(silly) output("YOU GO NOW. FLEE! KORGONNE STRONKEST!");
	else output("FADE OR CONSEQUENCE. FURY OF BLIZZARD!");
	output("”</i>");

	output("\n\nRather than being intimidated, Steph squeals and claps her hands, bouncing on the spot. The sheer weight of her huge, milky tits thrusting around pops another button off her coat, letting her expansive rack spill forward until the top ends of her silver nipples are showing. She barely notices, though her tail throbs and starts rubbing at her thighs eagerly. Guess she’s been exposed on camera so much by now that she barely notices anymore.");
	output("\n\nThe korgonne, however, do. Very much so, if the sudden tents forming in the males’ heavy hide pants are anything to go on. The one female at the head of the pack takes one look over her shoulder and howls, <i>“NO! NO, PERVERTS! FIGHT, NO FUCK.”</i>");
	output("\n\nThey yip at her and start waving their spears around - until she reaches over and smacks one of them on the head with some kind of leather strap off her belt. The struck korgonne whines and recoils, and the others surge towards their female leader, shoving her out of the way and rushing towards Steph with savage smiles and shameless boners peeking out as they start to unbuckle their belts.");
	output("\n\n<i>“Ahh! They <b>do</b> want hugs!”</i> Steph squeals delightedly, sprawling onto her knees with her arms wide open to accept all the fluffy puppy hugs she can get.");
	output("\n\nIn the blink of an eye the five horny dog-boys have barreled her into the ground and ripped her bodice, letting Steph’s huge breasts spill free into their fuzzy embraces. She’s so stacked that one korgonne is able to all but body-hug each tit, covering it in soft fluff and stiff red canine cock, rubbing against her bared flesh with bestial abandon. The three not able to get a hold of her tits go for the holes: one grabs her pants and starts ripping; another plugs his red rocket between Steph’s lips with a howl of ecstasy. Steph herself yelps, flailing haplessly; she’s completely overwhelmed.");
	output("\n\nThe fifth and final korgonne, seemingly left high and dry, grabs Steph’s tail and drops trou between her legs, laughing to himself before plugging the cock-tipped end into the naked ass of the one drilling Steph’s silver cunny. He yelps and yips, snarling at his friend, but a sudden wild-eyes look of pleasure as the cock-tail starts wriggling shuts him up right quick. With that done, the aggressor laughs and flops onto his ass, grabbing Steph’s feet and locking them around his own dick and starting to jack off with them. Consolation prize.");
	output("\n\nThe camera drone buzzes around, sweeping from one side of the vigorous gang-bang to the other. Several bare furry asses are pounding away at Steph, making her ample curves jiggle obscenely. She moans and gasps, bucking against the many bodies writhing overtop her. Her tail, at least, seems quite happy with its predicament, thrusting deep into the unlucky dog-boy’s ass to the same rhythm that he’s pounding his knot over and over into Steph’s pussy with. He can’t find purchase in her gaping, sodden fuck-hole - even a turgid canid bitch-breaker can’t plug her plump gray pussy.");
	output("\n\nYou’re treated to long, lusty minutes of furry bodies humping away at the show’s host, fucking her into the dusty snow. Eventually, Steph stops struggling and starts moaning lustily, gripping at the fluffy bodies on top of her and slurping her way up and down the shaft in her mouth. Her hips wiggle and thrust back against the dick trying and failing to knot her, right up until the poor pup grunts and shudders, and the camera drone dutifully zooms in to watch a waterfall of creamy white spurt out around his knot. Steph gasps and giggles, reaching down to pet the korgonne between his low-tucked ears... until she gets distracted by a sudden eruption of puppy-cream between her soles, and then another into the pillowy depths of her cleavage. A little geyser of milk squirts out of her silvered nipples as the two top-mounted korgonne work themselves over the edge, leaving Steph an insensate, moaning mess. She’s not far behind them now!");
	processTime(8);
	pc.changeLust(33);
	clearMenu();
	addButton(0,"Next",stephODEp5III);
}

public function stephODEp5III():void
{
	clearOutput();
	showBust(stephBustDisplay(5, true),"FROSTWYRM");
	author("Savin");

	//Display Frostwyrm and Steph busts; -Korgonne busts
	output("When the fuck-happy puppy-folk have finished, Steph’s frontside is glazed in white from her lips, through her heaving milky rack, and right down to her pussy and thighs. The five korgonne flop off of her one by one, panting and leaking seed as they go soft in the chill. The drone pans around, looking over the sordid affair, before re-focusing on the last man standing... or rather, woman sitting.");
	output("\n\nThe female korgonne is sitting on the top of the rise where she’d been pushed aside, legs splayed and fingers greedily pumping into a thick, blue-lipped slit between them. Her hide vest is popped open, letting her other hand grope and squeeze one of her hefty breasts while she diddles herself to the gangbang winding down below her. She’s moaning softly, breath coming in erratic, steamy mists as she brings herself to a shuddering, voyeuristic climax. With a final, gasping yip, she flops onto her back, arches it, and lets loose a misty squirt of fem-cum across her thighs before going still.");
	output("\n\nAs the action calms down, though, shadow spreads across the caldera. The drone twists around, slowly panning up the rocky side of the basin. The earth shakes, and ice and snow go flying from the cliffs above; when it clears, a titanic shape is perched on the edge, a pair of majestic pale wings spreading behind it across the span of a gravball field. A quartet of glowing red eyes burn like embers over a muzzle of axe-blade teeth paired to claws that look every bit as sharp as monoblades.");
	output("\n\nThe creature rears up on the hind pair of its six legs and lets out a deafening howl that echoes across the ice plains. The sheer force of its bellowing voice sends the camera drone tumbling back, smacking into the ice and skidding into the snowbank. When its vision refocuses, the pack of korgonne are all on their feet, grabbing their pants and weapons and booking it double-time over the hill. But poor Steph is completely out of it, flopped on her back with her tits out and cum leaking from both ends. All she can do is gasp as the dragon-like alien leaps down into the basin, crashing into the snow with earth-shaking force; its legs crunch the icy surface on either side of Steph, grinding it to powder in the landing.");
	output("\n\nThe Galactic Huntress shrieks and goes scrambling back, finally snapped out of her fuck-sated reverie. But she’s not going anywhere with the frost drake looming over her; one mighty paw pins her to the earth by the legs, trapping her beneath the beast’s scaly undercarriage. Its embering eyes narrow at her, and its great long neck cranes down until its fanged maw is mere inches from the hostess’s face.");
	output("\n\nFor a moment, you expect the worst to follow, right on interstellar television! Instead, thankfully, the beast’s nose stops mere inches from Steph’s own, its eyes drilling like lasers into her fearful gaze. The camera attempts to zoom in for a better look, half buried in the snow as it is, focusing in and out until it can see the silver of Steph’s eyes... and something more, a vacuous, inky darkness spreading in them.");
	output("\n\n<i>“W-what!?”</i> Steph mewls, blinking rapidly. <i>“You can...”</i>");
	output("\n\nThe creature growls softly, and Steph’s back arches as if she’d been shocked. Her whole body writhes - not in pain, but in pleasure, if the way her nipples stiffening and leaking her milky burden are anything to go by.");
	output("\n\n<i>“What are you - aahh! I can’t... So good!”</i>");
	output("\n\nThe way she’s babbling, you feel like somehow you’re only getting half the conversation. Is the microphone busted?");
	output("\n\n<i>“Okay! Okay!”</i> Steph gasps, flopping back. She gives a nervous look between the feral beast overtop her and the camera drone. Biting her lip, Steph hooks her hands under her legs and curls herself up at the monster, presenting her still-stuffed pussy to it like an eager whore. The drake growls, shifting its massive weight to reveal a dick every bit as massive and reptilian as you’d expect from such a monster, peeking out of a deep-seated slit in its hide quarters. It grows and grows, from a tapered tip already as big as your fist to a tree-trunk shaft that throbs with bestial desire.");
	//output("\n\nThe camera feed crackles, and you hear a pair of disembodied voices:");
	output("\n\nThe frosty drake’s front legs slam into the ground on either side of Steph, and its broad flanks rock forward until its titanic cockhead is grinding heavily against her sex. ");
	//not seen Tarkus ep: 
	if(flags["STEPH_GOOED"] == undefined) output("By some miracle, ");
	else output("Thanks to her gray-gooification, ");
	output("Steph’s silver quim parts for the battering ram of a monster-cock, stretching wide to accommodate its girth. Steph’s breath catches in her throat, lips twisting into a silent gasp of unspeakable pleasure. The wyrm snarls and inches its hips forward, force-feeding more and more cockmeat into the helpless - yet seemingly willing - starlet.");
	output("\n\nSteph’s belly is bulging before long, struggling to take the sheer size of breeding tool sawing into her slit. The wyrm’s breath comes in foggy huffs over her, billowing around them so hard that the camera has trouble penetrating");
	if(silly) output(" - unlike the wyrm!");
	else output(".");
	output(" What little it does catch, though, shows Steph’s face in a rapture of mind-broken bliss, and the beast huffing and puffing with what could only be described as a fiendish smile across its jowls.");

	output("\n\nEventually the creature’s body moves so close to Steph that her legs are pressed deeper against her breasts, rubbing her bloated belly against the dragon’s armored underside. She squeals and gasps, bent and stuffed and leaking in so many ways that it’s almost comical - yet somehow taking more and more of the beast. Steph’s mouth hangs open, tongue lolling out, and her eyes are completely rolled back; she’s out of it, cumming and gasping and left utterly insensate.");

	output("\n\nSuddenly the wyrm rolls its head back and roars. Its wings unfurl, kicking up a gale of snow that blinds the camera for a long moment. The drone bleeps in panic and goes tumbling, dislodged from the snow and sent flying in the maelstrom. It impacts heavily on the rocks, the view reeling skyward for a moment before the stabilizers managed to right the poor thing and get it back on target.");

	output("\n\nWhen it does, the winged behemoth is nowhere to be seen, leaving only a sea of steaming whiteness pooling around Steph’s ass and filling the deep gashes in the ice where its claws had been moments ago. The hostess’s stomach is still straining against the tatters of her now-ruined coat, stuffed so full of the beast’s seed that her stomach quivers like pure fluid with every little panting breath.");

	output("\n\nThe drone zips over to her like a loyal hound, floating over the cum-slathered hostess to give the audience a long, slow pan of her naked body. She moans weakly and pushes herself up onto her elbows - even that small motion is enough to cause a high-pressure squirt of dragon-cum to spew from her abused cunt, splattering across her thighs and making her shudder with pleasure.");

	output("\n\n<i>“O-oh stars,”</i> she murmurs, eyes blinking rapidly. The dusky color you’d seen before is gone now, resumed by the steel gray she had before. <i>“Thanks for tuning in to another episode of </i>Galactic Huntress<i>. I’m your host, Steph Irson, and... ahh!”</i>");

	output("\n\nThe drone gets thumped away by something, and two pairs of furry arms grab Steph’s shoulders, hauling her away. Off-screen, a yipping voice cries, <i>“Seconds! Much fuck; so breed!”</i>");
	output("\n\n<i>“BREED!”</i> several other voices echo.");
	output("\n\n<i>“Tune in next week for - oh no!”</i> Steph yelps as several dark doggy-cocks flop onto her face, even as she’s being hauled off. Before one of them can plug itself in her lips, she manages to shout <i>“Uh, commercials! See ya next time!”</i>");
	output("\n\n...Somehow she didn’t seem too distressed about her fate, there. Maybe she liked the korgonnes’ “hugs” a little too much...");
	
	pc.changeLust(10);
	processTime(10);
	clearMenu();
	addButton(0,"Next",backToSmutMenu);
}