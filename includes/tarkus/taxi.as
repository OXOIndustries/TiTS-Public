public function showNessa(nude:Boolean = false):void
{
	if(flags["MET_NESSA"] == undefined) showName("KAITHRIT\nSCOUT");
	else showName("\nNESSA");
	if(!nude) showBust("KAITHRIT_SCOUT");
	else if(nude) showBust("KAITHRIT_SCOUT_NUDE");
}


//Tarkus U.G.C. Scout Authority
//Add to the flight deck of the Nova, 2 spaces east of the LZ. 
public function tarkusScoutAuthorityOffice():Boolean
{
	output("What was once the crew chief’s office overlooking the flight deck has been converted into a U.G.C. scout base, complete with maps and star charts hanging from the walls and a massive board map dominating the center, with landmarks and racial analysis printouts scattered over it. Behind the chief’s desk sits a buxom kaithrit with her bright orange hair pulled back into a long ponytail.");
	addButton(0,"Scout",tarkusScoutMenu,undefined,"Scout","Talk to the scout about security transportation to different parts of the planet.");
	//[Scout] (PC hasn’t fixed any comm arrays)
	return false;
}

public function tarkusScoutMenu():void
{
	clearOutput();
	author("Savin");
	showNessa();
	if(flags["TARKUS_DESTROYED"] != undefined)
	{
		output("When you step up to the cat-girl, she looks up from her holoscreen and sighs. <i>“Sorry, there's not really anywhere to take a taxi to anymore.”</i>");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	else if(flags["TARKUS_TAXI_STOP_UNLOCKED"] == undefined)
	{
		output("When you step up to the cat-girl, she looks up from her work on a holoscreen and gives you an apologetic grin. <i>“Sorry, friend, we’re just getting set up here on Tarkus. All the junk’s sending up so much interference that it’s taking ages to set up proper comm beacons, so there’s no transports going out yet.”</i>");
		output("\n\n<i>“Ah. Sorry to bother you,”</i> you say, turning to leave.");
		output("\n\n<i>“No worries. Come on back if any comm arrays go up, and we’ll be able to get you anywhere they cover.”</i>");
		processTime(1);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//[Scout] (PC has fixed a comm array)
	else
	{
		//NEW INTRO
		if(nessaBellyRating() > 10) 
		{
			output("When you step up to the catgirl, the evidence of your previous tryst is plain as day.");
			if(nessaBellyRating() < 20) output(" She’s got a little belly-bump.");
			else if(nessaBellyRating() < 40) output(" She got a big, obviously belly-bump.");
			else if(nessaBellyRating() < 80) output(" She’s got a tremendously swollen middle.");
			else output(" Her belly is obscenely bulged, almost spherical.");
			output(" If you didn’t know it was entirely liquid, you’d think she was pregnant");
			if(nessaBellyRating() >= 40) output(" with a swarm of alien babies");
			output(".");
		}
		else 
		{
			output("When you step up to the ");
			if(flags["MET_NESSA"] == undefined) output("catgirl");
			else output("Nessa");
			output(", she looks up from her work on a holoscreen and gives you a big grin. <i>“Hey there! Welcome to the Scout Authority base. We’re running light transports out into the wasteland now that comm arrays are coming online. So, where can we take you, " + pc.mf("sir","ma’am") + "?”</i>");
		}
		tarkusTransitMenu();
	}
}

public function remoteTarkusScoutMenu():void
{
	clearOutput();
	showNessa();
	output("You jab in a few commands, and a moment later, a holographic kaithrit appears onscreen. <i>“Need a lift?”</i> she offers.");
	output("\n\nYou nod.");
	output("\n\n<i>“No problem. Where do you want to go?”</i>");
	tarkusTransitMenu();
}

public function tarkusTransitMenu():void
{
	clearMenu();
	if(pc.credits >= 80) addButton(0,"Novahome",tarkusFlyTo,"TARKUS SCOUT AUTHORITY","Novahome","Secure a lift to Novahome for the low low price of 80 credits.");
	else addDisabledButton(0,"Novahome","Novahome","You can't afford the 80 credits it would cost to get a ride to Novahome.");
	if(pc.credits >= 80) addButton(1,"The Lift",tarkusFlyTo,"279","The Lift","Secure a ride to the great lift for the low low price of 80 credits.");
	else addDisabledButton(1,"The Lift","The Lift","You can't afford the 80 credits it would cost to get a ride to the great lift.");

	if(currentLocation == "279") 
	{
		addDisabledButton(1,"The Lift","The Lift","You're already at the great lift comm relay!");
	}
	else if(currentLocation == "TARKUS SCOUT AUTHORITY")
	{
		addDisabledButton(0,"Novahome","Novahome","You're already at the Novahome scout office.");
	}
	if(pc.hasCock() && pc.lust() >= 33) addButton(2,"To Bed",inviteNessaToBed,undefined,"To Bed","Take the kitty to bed.");
	else if(pc.lust() < 33) addDisabledButton(2,"To Bed","To Bed","You aren't really aroused enough for that.");
	else addDisabledButton(2,"To Bed","To Bed","The Kaithrit is only interested in lovers with penises, it seems. For shame.");
	addButton(14,"Back",mainGameMenu);
}


//{Destination -- X Credits}
public function tarkusFlyTo(arg:String):void
{
	clearOutput();
	author("Savin");
	showNessa();
	if(currentLocation == "TARKUS SCOUT AUTHORITY")
	{
		output("<i>“Alright. I’ll upload the coordinates to one of the transports. Just swipe your credit stick here and head back out into the flight deck. Can’t miss out transports right outside.”</i>");
		output("\n\nYou do so, transferring your payment to the Scout Authority and walking back into the hangar. Several small hover-cars are arrayed there, all desert-patterned and manned by simplistic drone pilots. One of them hails you with a wave of its mechanical arm. You slip into the car, and a moment later you’re on your way, zipping across the junkyards of Tarkus.");
		output("\n\nNot long after, you arrive at your destination, and disembark into the wasteland. The hover-car zips away a minute later, leaving you behind.");
	}
	else
	{
		output("<i>“Alright. I’ll upload the coordinates to one of the transports. Just swipe your credit stick here and we'll have a transport out in a few minutes.”</i>");
		output("\n\nTrue to the cat-girl's words, a desert-patterned hovercover arrives in minutes, piloted by a simplistic drone pilot that's already beginning to show signs of corrosion from Tarkus' toxic atmosphere. You slip into the car, and a moment later you’re on your way, zipping across the junkyards of Tarkus.");
		output("\n\nNot long after, you arrive at your destination, and disembark into the wasteland. The hover-car zips away a minute later, leaving you behind.");
	}
	pc.credits -= 80;
	currentLocation = arg;
	generateMapForLocation(currentLocation);
	processTime(15);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function eastTransitStationBonus():Boolean
{
	if(flags["TARKUS_TAXI_STOP_UNLOCKED"] == undefined)
	{
		output("\n\nA forgotten comm relay is sitting here, its antennas corroded with rust. If you knocked all the crud loose, it could probably get a signal again, allowing you to call for transport.");
		addButton(0,"Fix Comms",fixCommsOnTarkus);
	}
	else
	{
		output("\n\nThe comm relay you fixed is sitting here, holoscreen illuminated. You could use it to call for a taxi if you wanted.");
		addButton(0,"Call Taxi",remoteTarkusScoutMenu);
	}
	return false;
}

public function fixCommsOnTarkus():void
{
	clearOutput();
	output("A few well placed kinetic repairs knock the crust loose from the antennas. The screen lights up. Perfect!");
	flags["TARKUS_TAXI_STOP_UNLOCKED"] = 1;
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[DUN] 2 Cum inflation, catgirl (cat ears and tail only, female human for the rest), if it's repeatable inflated larger each time
//Offbeatr Reward - Bryan
//Fen idea; Kaithrit cat-girl taxi slut on Tarkus.
//New Option - To bed
//Nessa

public function inviteNessaToBed():void
{
	clearOutput();
	showNessa();
	output("<i>“Sure, but you’ll need to go through a security screening first. That’s a privileged location, you see,”</i> the cat-like kaithrit replies");
	if(nessaBellyRating() >= 20) output(", rubbing her still-distended belly");
	output(".");
	//Done this before.
	if(flags["MET_NESSA"] != undefined) output("\n\nAgain? <i>“Yeah, sure.”</i>");
	//First time
	else output("\n\nShe sure has a funny idea of foreplay! <i>“Sure.”</i>");
	//Merge
	output("\n\nThe red-headed taxi-girl smirks and gestures to a full-body scanner. <i>“Step on in.”</i>");
	output("\n\nYou do as you are bid, grinning at her while the high-tech security scanner gives you a once-over. A high-pitched ‘ding’ signals that it has finished, and you walk back over to ");
	if(flags["MET_NESSA"] != undefined) output("Nessa");
	else output("the taxi-cat");
	output(".");

	var rejected:Boolean = false;
	//Mimbranes!
	if(attachedMimbranes() > 0) 
	{
		output("\n\nHer expression sours as she looks over her console, and she flicks her eyes up to regard you nervously, then back down to the monitor. Something on your scan has clearly unnerved her.");
		rejected = true;
	}
	//Parasite
	else if(pc.hasParasiteTail()) 
	{
		output("\n\nHer expression sours as she reviews her console, and her eyes keep flicking back toward your [pc.butt]. She must see something on her display she doesn’t like. Maybe your [pc.tails]?");
		rejected = true;
	}
	//Gigantor dick
	else if(pc.shortestCockLength() > 30) 
	{
		output("\n\nHer eyebrows climb so high up her forehead that they look ready to leap off and make a run for it. Her eyes are riveted to the bottom half of her monitor, and she mouths, <i>“Mother of god...”</i> Seeing you staring, she glances back up and blushes.");
		rejected = true;
	}
	//Too small
	else if(pc.longestCockLength() <= 7) 
	{
		output("\n\nShe giggles as looks over something on her monitor, covering her mouth and apologizing, <i>“S-sorry, I just thought of something funny.”</i> Her eyes flick down to your crotch, then back up at your face. She’s struggling not to laugh.");
		rejected = true;
	}
	//Not enough cum
	else if(pc.cumQ() < 3000) 
	{
		output("\n\nShe spends a long time looking at the monitor but ultimately shakes her head, dissatisfied with something. Whatever it is, she doesn’t look very happy when she looks back your way.");
		rejected = true;
	}
	//A-Okay
	if(!rejected) output("\n\nShe spends a long time looking over the monitor. Sometimes she smiles, and at least once her cheeks blush cherry. You wonder what she could possibly see on a security screening that would have her react in such a manner... unless it’s one of the models that generates a full, detailed body scan in 360 degrees.");
	//Any rejection:
	else
	{
		output("\n\n<i>“What is it?”</i> you ask, looking for some kind of answer. It seems clear she intends to reject you.");
		//Mimbutt & //Tail Parasites
		if(attachedMimbranes() > 0 || pc.hasParasiteTail()) output("\n\nNervously curling her finger in her hair, the kaithrit, glances around to make sure that the two of you are alone in her room. <i>“Parasites. The kind that aren’t exactly legal to be transporting around. Look, I’m not so well off that I could do without your business, but I’m not getting any closer to you until you get those things taken care of. Find a medical droid, quick.”</i>");
		//Dick too big and no suitable dick
		//Gigantor dick
		else if(pc.shortestCockLength() > 30) output("\n\nFanning her neck, the kaithrit glances down at your bulging crotch and smiles. <i>“It’s not that there’s anything wrong with you...”</i> She bites her lip and sighs. <i>“I’m the problem. You’ve got all that awesome dick, and there’s no way I can take it without splitting in half. If it ever gets a little more manageable, look me up.”</i>");
		//SMALL DIX SHAMEZ
		//Too small
		else if(pc.longestCockLength() <= 7) 
		{
			output("\n\nSmirking, the kaithrit answers matter-of-factly, <i>“Your dick");
			if(pc.cockTotal() > 1) output("s are");
			else output(" is");
			output(" too small to ride this ride, tiger. Come back when you’re at least thiiiis big.”</i> She holds her hands approximately seven inches apart.");
		}
		//Lacking in cum storage!
		else if(pc.cumQ() < 3000) 
		{
			output("\n\nThe kaithrit sighs, <i>“Sorry, but you don’t have enough... uhm... chutzpah for me.”</i>");
			output("\n\n<i>“What?”</i>");
			output("\n\nShe waves her arm in frustration. <i>“You aren’t virile enough, bucko. I like to be able to measure how much my lovers enjoy me in liquid volume. Stock up!”</i>");
		}
		//Any rejection
		output("\n\nDamn, she’s picky.");
		processTime(5);
		clearMenu();
		addButton(14,"Back",tarkusScoutMenu);
	}
	//Success only from here on out
	if(!rejected)
	{
		output("\n\n<i>“So-?”</i> you ask, trying not to leer at the cute kitty-cat’s substantial rear end.");
		output("\n\nThe kaithrit circles from behind her console, and lays a clawed hand possessively on your chest. <i>“You’ve been cleared for take-off, tiger.");
		if(flags["MET_NESSA"] != undefined) output(" You ready to help me re-fuel?");
		output("”</i> She slides her finger down to your [pc.belly], then veers off to your hand, cooing, <i>“Let’s get you on your way,”</i> while pulling you into a back room.");
		if(flags["MET_NESSA"] == undefined) 
		{
			output(" <i>“My name’s Nessa, by the way.”</i>");
			output("\n\n<i>“[pc.name],”</i> you answer when you");
			flags["MET_NESSA"] = 1;
		}
		else output("\n\nYou");
		output(" follow after, admiring the sexy, back-and-forth sway of her hypnotic hips and plump, jiggly asscheeks. You’re pretty sure she knows it too, judging by the way she presses against you at every opportunity");
		if(nessaBellyRating() >= 30) output(", no matter how awkward her cum-packed belly makes her");
		output(".");
		processTime(5);
		//[Next]
		clearMenu();
		addButton(0,"Next",nessaFuckTimeLetsGo);
	}
}

public function nessaFuckTimeLetsGo():void
{
	clearOutput();
	showNessa();
	output("The bed is a little small (and the room a little dingy), but the cock-hungry kaithrit in front of you is more than pleasing enough to make up for it. Nessa spins and pulls, dragging you off-balance and pushing you into the bed. You bounce once, and then she’s on top of you,");
	if(!pc.isCrotchExposed()) output(" stripping off your [pc.lowerGarments] in a rush and");
	output(" aggressively running her claws down your [pc.chest]. She checks her hands just as they’d be about to scrape across your [pc.nipples] and grins wickedly.");
	output("\n\nYou’d let her do it too. Her crotch is dripping all over your [pc.cocks], a hot little vice just waiting to wrap around");
	if(pc.cockTotal() > 1) output(" one of them");
	else output(" you");
	output(" and take you to heaven. You aren’t sure when she managed to open up the groin seal on her jumpsuit, but then again, you don’t really care either. ");
	if(nessaBellyRating() >= 30) output("You’re going to get to pack even more spunk into this jizz-drizzling cum-balloon of a cat. ");

	var x:int = -1;
	for(var y:int = 0; y < pc.cockTotal(); y++)
	{
		//No biggest cock yet! Set it uuuup
		if(x == -1) x = y;
		//See if the new cock is better!
		else
		{
			//If new dick is longer and under 30"
			if(pc.cocks[y].cLength() < 30 && pc.cocks[y].cLength() > pc.cocks[x].cLength()) x = y;
		}
	}
	
	var cumSave:Number = pc.cumQ();

	output("You reach up and grab hold of her ass, marvelling at its sheer size relative to her diminutive frame. Your fingers sink nicely into the squeezable cat-butt, and her twinned tails flutter about happily, brushing your wrists with her silky fur. Pulling her down, you revel in the touch of her molten slit against your surging [pc.cockNoun " + x + "], grinding through the drippy valley happily.");

	output("\n\nA razor-sharp claw-tip digs into your shoulder, and Nessa half growls half purrs, <i>“Whoah there tiger. Let me.”</i>");
	output("\n\nYou don’t let go of her sweet little booty, but you stop being so forceful, letting her wriggle as she will. At that, Nessa begins to properly purr. It’s a full-body vibration that you can feel all the way down by her thighs - and in her cunt. She rocks her hips, and with a practiced, one-handed motion, she aims your cock straight at her pussy. A vibrating velvet heaven envelops you, and her dribbling cunt-lips slap down on your crotch, sealing the entirety of your cock within her.");
	if(pc.cocks[x].cLength() >= 12 && nessaBellyRating() < 10) output(" The head visibly distends her fair-skinned belly, a clearly-outlined declaration of your mate’s inhuman elasticity.");
	pc.cockChange();
	output("\n\nYou reflexively groan and lift your hips, lifting the big-butted cat-slut up high on your altar of cock.");
	output("\n\n<i>“Whoah there, tiger,”</i> Nessa purrs, patting your chest. <i>“Don’t pop yet. It’ll be better if you work up a bigger, thicker load.”</i> She pushes down and swivels her hips, slowly working your [pc.cock " + x + "] from every angle");
	if(pc.cockTotal() == 2) output(", drenching the other in her free-flowing pussy juice");
	else output(", drenching the others in her free flowing pussy juice");
	output(". For a kaithrit, she’s entirely too good at riding you cow-girl. Bending low, ");

	if(nessaBellyRating() < 10)
	{
		output("she lets her petite, B-cup breasts press");
		if(pc.biggestTitSize() > 1) output(" to yours");
		else output(" to your chest");
	}
	else output("she presses her spooge-inflated gut and b-cup breasts against you");
	output(". Nipples like ripe cherries squish down, and lips as warm and soft as fire-roasted marshmallows meet yours for a saucy kiss. Her tongue dances in slow circles around yours, her exotic, almost spicy saliva making your whole mouth tingle.");

	output("\n\nNessa wraps her arms around your neck and lifts her hips, transitioning from a slow grind-fuck to a faster, sweatier bang. Ringlets of her auburn hair cascade around you, making the rest of the world disappear while she kisses you. Sometimes she nips at your neck or licks your ears. Other times she stops smooching long enough to whisper something like, <i>“Not yet... don’t cum yet.”</i> Her asscheeks quiver in your palms, and when she picks up the pace, she stops kissing you entirely, closing her eyes and purring as hard as she can.");
	output("\n\nSquelching and vibrating around you, Nessa’s quim does everything it can to drag you to the bring of orgasm. Even when she’s not squeezing down on you, you can still feel her clit buzzing on your cunt-soaked rod like a vibrator set on low.");
	if(pc.balls > 0)
	{
		output(" Your [pc.balls] ache");
		if(pc.balls == 1) output("s");
		output(" with need, and you can’t stop them from clenching tight against you whenever this two-tailed mynx’s vibrations become too much.");
	}
	else output(" Your body aches with need, and you can’t stop your dick from lurching with the clenching spasms of near-orgasm.");
	output(" Squeezing hard on Nessa’s ass, you let her know that you can’t hold back any longer - that you’re going to cum soon, and that there’s no stopping it.");

	output("\n\nSomehow, Nessa purrs even louder. Her asscheeks vibrate in your palms, and the lewd clap of her cunt bouncing on your [pc.cock " + x + "] becomes a rapid drumroll. You feel the gates inside you open up, releasing the torrential flood of jizz within your [pc.balls]. A veritable geyser of seed rockets through your bulging boner, blasting your white-hot ecstasy into her willing cunt. Nessa’s purrs cut off the moment your [pc.cum] floods her passage, and she releases a distinctly feline howl of pleasure. Clamping her hips and her pussy down on you, the quivering sex-kitten joins you in orgasm, flexing and stretching to ensure every inch of spurting cock is firmly sealed inside.");

	//Knot and less than 40L jizz
	if(cumSave < 40000)
	{
		if(pc.hasKnot(x)) 
		{
			output("\n\nNot a single droplet escapes between your knot and the too-tight seal of her lips. The kaithrit’s ");
			if(nessaBellyRating() >= 0) output("pre-filled");
			else output("rapidly ballooning");
			output(" vaginal canal refuses to let the pressure of your lurid load stop her from securing every single drop.");
		}
		//No knot and less than 40L jizz
		else output("\n\nYou don’t feel any [pc.cum] leak from the too-tight seal of her netherlips. This kaithrit seems determined to trap every single drop inside her vaginal canal, no matter how much pressure your lurid load creates.");
	}
	//TOO MUCH CUM
	else
	{
		output("\n\nDespite the too-tight seal of the kaithrit’s netherlips, she can’t possibly contain the flood ");
		if(nessaBellyRating() < 3) output("that you’re spraying into her");
		else output("- both within and without");
		output(". [pc.CumNoun] slops out of her with every squirt, soaking you in the bed in [pc.cumColor] mess.");
		//Add cum splatter flag for PC, cause fuck showers.
		applyCumSoaked(pc);
		
		if(cumSave > 40000) cumSave = 40000 + rand(Math.ceil((pc.cumQ() - 40000) / 2));
	}
	//Merge {noPG}
	output(" Nessa rubs her belly with every fresh ejaculation, watching her skin ");
	if(nessaBellyRating() >= 5) output("grow even tighter");
	else output("grow shiny and tight");
	output(", a dopey smile painted on her face.");

	output("\n\n<i>“Fuuuck, tiger. You did good.”</i>");
	output("\n\nYou grin and sigh, sprawling in the bed.");
	output("\n\n<i>“You did real good,”</i> Nessa adds, <i>“... Real fuckin’ good. Hey, hand me that plug, would ya?”</i> She gestures at a bright pink plug on the edge of her dresser. <i>“");

	if(nessaBellyRating() <= 0) output("I’m gonna savor this. See if I can get some of those raskvel bitches jealous.");
	else output("If you keep doing this, I’m going to wind up being the Novahome’s biggest spunk-bank.");
	output("”</i>");
	//BELLY EXPANDO!
	nessaBellyRating(cumSave);

	//Set flag that tracks how much she’s got stored up.
	//Vent 100mL an hour so really productive PCs can blow her up forever.
	output("\n\nPopping off of you, Nessa swiftly stuffs the plug you hand her into her puffy cunt-lips, sealing all that [pc.cum] inside her. <i>“Perfect job, tiger. Give me a call if ever need to take another ride to my bedroom.”</i> She tosses you your things, and reaches for her jumpsuit.");
	//[Next]
	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function nessaBellyRating(arg:Number = 0):Number
{
	if(flags["NESSA_BELLY"] == undefined) flags["NESSA_BELLY"] = 0;
	if(arg > 0) flags["NESSA_BELLY"] += arg;
	return flags["NESSA_BELLY"]/1000;
}