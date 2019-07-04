public function showNessa(nude:Boolean = false):void
{
	if(flags["MET_NESSA"] == undefined) showName("KAITHRIT\nSCOUT");
	else showName("\nNESSA");
	
	var sBust:String = "KAITHRIT_SCOUT";
	if(nessaBellyRating() >= 20) sBust += "_BELLY";
	if(nude) sBust += "_NUDE";
	showBust(sBust);
}


//Tarkus U.G.C. Scout Authority
//Add to the flight deck of the Nova, 2 spaces east of the LZ. 
public function tarkusScoutAuthorityOffice():Boolean
{
	output("What was once the crew chief’s office overlooking the flight deck has been converted into a U.G.C. scout base, complete with maps and star charts hanging from the walls and a massive board map dominating the center, with landmarks and racial analysis printouts scattered over it. Behind the chief’s desk sits a female kaithrit with her bright orange hair pulled back into a long ponytail.");
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
		output("When you step up to the cat-girl, she looks up from her holoscreen and sighs. <i>“Sorry, there’s not really anywhere to take a taxi to anymore.”</i>");
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
	else addDisabledButton(0,"Novahome","Novahome","You can’t afford the 80 credits it would cost to get a ride to Novahome.");
	if(pc.credits >= 80) addButton(1,"The Lift",tarkusFlyTo,"279","The Lift","Secure a ride to the great lift for the low low price of 80 credits.");
	else addDisabledButton(1,"The Lift","The Lift","You can’t afford the 80 credits it would cost to get a ride to the great lift.");

	if(currentLocation == "279") 
	{
		addDisabledButton(1,"The Lift","The Lift","You’re already at the great lift comm relay!");
	}
	else if(currentLocation == "TARKUS SCOUT AUTHORITY")
	{
		addDisabledButton(0,"Novahome","Novahome","You’re already at the Novahome scout office.");
	}
	if(pc.hasCock() && pc.lust() >= 33) addButton(2,"To Bed",inviteNessaToBed,undefined,"To Bed","Take the kitty to bed.");
	else if(pc.lust() < 33) addDisabledButton(2,"To Bed","To Bed","You aren’t really aroused enough for that.");
	else addDisabledButton(2,"To Bed","To Bed","The Kaithrit is only interested in lovers with penises, it seems. For shame.");
	addButton(14,"Back",mainGameMenu);
}


//Destination -- X Credits
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
		output("<i>“Alright. I’ll upload the coordinates to one of the transports. Just swipe your credit stick here and we’ll have a transport out in a few minutes.”</i>");
		output("\n\nTrue to the cat-girl’s words, a desert-patterned hovercover arrives in minutes, piloted by a simplistic drone pilot that’s already beginning to show signs of corrosion from Tarkus’ toxic atmosphere. You slip into the car, and a moment later you’re on your way, zipping across the junkyards of Tarkus.");
		output("\n\nNot long after, you arrive at your destination, and disembark into the wasteland. The hover-car zips away a minute later, leaving you behind.");
	}
	pc.credits -= 80;
	moveTo(arg);
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

//[DUN] 2 Cum inflation, catgirl (cat ears and tail only, female human for the rest), if it’s repeatable inflated larger each time
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
			output("\n\nYou follow after, admiring the sexy, back-and-forth sway of her hypnotic hips and plump, jiggly asscheeks. You’re pretty sure she knows it too, judging by the way she presses against you at every opportunity");
			if(nessaBellyRating() >= 30) output(", no matter how awkward her cum-packed belly makes her");
			output(".");
			processTime(5);
			//[Next]
			clearMenu();
			addButton(0,"Next",nessaFuckTimeLetsGo);
		}
		else
		{
			output("\n\nFollowing the cute cat to her room, a thought presses on your mind the way her slappable ass smushes into your groin. Nessa fucks like a tiger and has a real respect for virile partners.");
			if (flags["NESSA_ORAL"] == undefined) output(" Kaithrits have pleasing tongues, too.");
			output(" There’s merit in letting this " + (nessaBellyRating() >= 30 ? "walking spunk-bank" : "jizz junkie") + " lead you back into her creampie-hungry cunt, but maybe the sperm-obsessive skank would be up " + (flags["NESSA_ORAL"] == undefined ? "for a different method of earning her cream?" : "for another dive into your crotch?"));
			processTime(5);
			//[Fuck Her] [Oral]
			clearMenu();
			addButton(0,"Fuck Her",nessaFuckTimeLetsGo,undefined,"Fuck Her","Plow Nessa and give her a bellyful of warm [pc.cumNoun] just like the first time.");
			addButton(1,"Oral",penisRouter,[nessaSuckTimeLetsGo,pc.biggestCockVolume()+1,false],"Oral","Get Nessa on her knees to earn her meal a different way.");
		}
	}
}

public function nessaFuckTimeLetsGo():void
{
	clearOutput();
	showNessa(true);
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

	output("\n\nNessa wraps her arms around your neck and lifts her hips, transitioning from a slow grind-fuck to a faster, sweatier bang. Ringlets of her ginger hair cascade around you, making the rest of the world disappear while she kisses you. Sometimes she nips at your neck or licks your ears. Other times she stops smooching long enough to whisper something like, <i>“Not yet... don’t cum yet.”</i> Her asscheeks quiver in your palms, and when she picks up the pace, she stops kissing you entirely, closing her eyes and purring as hard as she can.");
	output("\n\nSquelching and vibrating around you, Nessa’s quim does everything it can to drag you to the brink of orgasm. Even when she’s not squeezing down on you, you can still feel her clit buzzing on your cunt-soaked rod like a vibrator set on low.");
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
		pc.applyCumSoaked();
		
		if(cumSave > 40000) cumSave = 40000 + rand(Math.ceil((pc.cumQ() - 40000) / 2));
	}
	//Merge {noPG}
	output(" Nessa rubs her belly with every fresh ejaculation, watching her skin ");
	if(nessaBellyRating() >= 5) output("grow even tighter");
	else output("grow shiny and tight");
	output(", a dopey smile painted on her face.");

	output("\n\n<i>“Fuuuck, tiger. You did good.”</i>");
	output("\n\nYou grin and sigh, sprawling in the bed.");
	output("\n\n<i>“You did real good,”</i> Nessa adds, <i>“...Real fuckin’ good. Hey, hand me that plug, would ya?”</i> She gestures at a bright pink plug on the edge of her dresser. <i>“");

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

public function nessaSuckTimeLetsGo(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showNessa(true);
	showName("FEED\nTHE KITTY");
	author("William");
	processTime(1+rand(2));

	if (flags["NESSA_ORAL"] == undefined)
	{
		output("Moments before Nessa grind-fucks you into her bed, you grab her shoulders and whirl her around, planting a kiss on the tip of her upturned nose. Blinking, the red-headed cat purrs out <i>“Lovey-dovey type, huh?”</i> before licking your cheek. Her long, ticklish tongue dragging across your [pc.skinFurScalesNoun] is an intimate reminder of how well suited to polishing your pole it is");
		if (pc.balls > 0) output(", and a wonderful example of how it’d feel sliding across the [pc.sack] containing her [pc.cumVisc] prize");
		output(".");
		if (pc.isBimbo() || pc.isBro()) output("\n\n<i>“Nah,”</i> you blurt, <i>“just needed to get your attention.”</i> With a beaming face, <i>“How ‘bout you get on your knees and suck me off? No plugs needed!”</i>");
		else if (pc.isNice()) output("\n\n<i>“I can be,”</i> you reply, smiling, <i>“but I’d like to see more of yours...”</i> you flick your eyes to your crotch, <i>“...down there.”</i>");
		else if (pc.isMisch()) output("\n\n<i>“For sexy catgirls? Always.”</i> You stroke her freckled cheek. <i>“Today, I’d like to give that cute kitty her meal straight from the tap,”</i> you glance down, <i>“with her on her knees and doing what she does best with that tongue.”</i>");
		else output("\n\n<i>“For my favorite cumsluts,”</i> you growl fondly. <i>“Get on your knees; if you make it good for me, you’ll get what you want.”</i>");
		output("\n\nNessa grins, grasping your [pc.hips] and working towards your " + (pc.isTaur() ? "human-horse tether" : "[pc.cocksLight]") + " from multiple angles. <i>“Wouldn’t have to plug up after that, kinda feels like something’d be missing,”</i> she winks. Twisting a finger against your [pc.chestNoun], the kaithrit enjoys the tactility of her hot and bothered lover. <i>“Gotta convince me, tiger.”</i>");
		output("\n\nDoesn’t take long to come up with a response. If - according to Nessa’s lewd comment last time - she wants the raskvel to be jealous, nothing would upset them more than walking around with [pc.cumVisc], spermy leftovers clinging to her skin. Nothing would aggravate their insatiable urges more than seeing some spunky alien cat-slut marked and filled so thoroughly. Really. How can the now-blushing kitty say no to getting that big... round... sloshing belly she wants while also smelling like she spent the entire day sucking off the [pc.raceShort]");
		if (pc.isHerm()) output("-herm");
		output(" those raskvel will never have?");
	}
	else
	{
		output("Spinning the kaithrit in your [pc.arms], you wrap her in your embrace, squeezing her so-very-breedable bubble-butt and breathing hotly into her twitching feline ear. Nessa’s already giving a full-body purr, sighing with delight as she finds your");
		if (pc.isCrotchExposed()) output(" [pc.cocks] " + (pc.isTaur() ? "leaking defenselessly in your undercarriage." : "packing the lush gap between her clothed thighs with hot, bare meat."));
		else output(" bulge, a thick bump that she could use as a masturbatory aid.");
		if (pc.isBimbo() || pc.isBro()) output(" <i>“I want your mouth again,”</i> you hum, <i>“I’m hard <b>and</b> backed up, cutie...”</i>");
		else if (pc.isNice()) output(" <i>“I want your mouth again,”</i> you murmur.");
		else if (pc.isMisch()) output(" <i>“I was missing my scout-cat’s mouth,”</i> you grin.");
		else output(" <i>“Feel how hard I am?”</i> you husk. <i>“I haven’t cum in a good while. It’s time for you to earn it.”</i>");
		output("\n\n<i>“Couldn’t be happier about that.”</i> Nessa pats your " + (pc.isCrotchExposed() ? "[pc.base " + cockIdx + "]" : "bulge") + " affectionately, warming her hand on raw, virile want. <i>“After last time? I expect a bit more. Gonna work out all that yummy cream.”</i> She eyes you with a spermy zeal. <i>“Gonna scoop up any you waste and wear it under my suit like a second uniform.”</i> Gripping your [pc.hips], she thrusts her juicy twat against your crotch, groaning, <i>“and you’re gonna come back, just like you’re doin’ now, to soak me all over again.”</i>");
		if (pc.isBimbo() || pc.isBro()) output("\n\n<i>“Then dig in, kitty-cat!”</i>");
		else if (pc.isNice()) output("\n\n<i>“Then let’s get started.”</i>");
		else if (pc.isMisch()) output("\n\n<i>“Then earn it.”</i>");
		else output("\n\n<i>“Get to work.”</i>");
	}
	output("\n\nAs soon as the last word leaves your mouth, Nessa drops to her knees panting with cum-hungry enthusiasm, leveling her nose to your needy loins.");
	if (flags["NESSA_ORAL"] != undefined) output(" Gotta love how she’s always so quick about it.");
	output(" She sniffs once, then again, nuzzling into your crotch with a pleasant, body-vibrating purr");
	if (!pc.isCrotchExposed()) output("; the kaithrit, well-practiced in stripping down eager lovers, has your [pc.cocks] free in short order");
	output(". " + (pc.isTaur() ? "Crawling under your horse half, she" : "She") + " tongues the " + (pc.hasCocks() ? "undersides" : "underside") + " of your [pc.cockHeads]");
	if (pc.hasCocks()) output(" in sequence");
	output(", cooing ecstatically when the first [pc.cumGem] drop of preseed bubbles to the surface of your throbbing peak.");
	if (pc.cLength(cockIdx) < 6) output("\n\nNessa overwhelms your girth in a two-handed grip, squeezing hard enough to obstruct the liquid flow before releasing, letting it dribble out onto her smattering of freckles. <i>“Not as big as those laquines I see strolling on in ‘n out.”</i> She kisses the [pc.cockHead " + cockIdx + "], audibly gulping the first fresh, [pc.cumVisc] meal. <i>“But you’re actually packing. Guess they missed out on all those cummy ads, huh?”</i>");
	else if (pc.cLength(cockIdx) < 12) output("\n\nNessa’s face is an erotic vista of emotions vying for space. There’s her obvious cock-drunkenness. She’s high on your musk. Then there’s her impatient side, furiously jacking and licking your [pc.cockNoun " + cockIdx + "], quenching itself on [pc.cumVisc] splashes of pre. <i>“Bigger than the raskvel, that’s for sure,”</i> she says evenly, hot appreciation puffing out along your fattened length. <i>“Bigger than kaithrit, most humans... fuck, you really know how to tease a girl! Can’t wait for this to cum again!”</i>");
	else if (pc.cLength(cockIdx) < 18) output("\n\n<i>“Damn, you’re worth at least three kaithrit men and three rodenians together with a dick like this. Anyone ever tell you that? Fucking love it,”</i> Nessa plants kiss after wet, cum-wanting kiss along your pillar of ardor, focusing on all the outstretched veins and your [pc.knotOrSheath " + cockIdx + "] in particular. Clawed, roving hands traverse your beefy exterior, unable to believe that it’s all for her to play with. Glad she likes ‘em big! <i>“You’ve got a beastly cock backed up by all that cum you’re carrying, and that is... damn, it’s just hot. Can’t stand how small my own race is sometimes, always gotta find the modded guys and girls.”</i> She licks at the crest. <i>“Anyone who ever gets this in their face and doesn’t like it is a liar, babe. Love getting it to myself, that’s for sure.”</i>");
	else output("\n\n<i>“Damn, how do you smuggle this thing around, big [pc.boyGirl]?”</i> Nessa grabs your [pc.cock " + cockIdx + "] by the [pc.base " + cockIdx + "], laying your enormous rod over her head and drowning herself in scintillating " + (pc.isHerm() ? "herm-musk" : "musk") + ". [pc.CumColor] runnels of pre spill forth onto her back and dribble down the jiggly curves of her ass. <i>“F-Fuck... I’m not complaining. Makes sense you’ve got something like this, gotta have a big gun for big shots right?”</i> Your chuckling sets off a throbbing tremble that completely overwhelms the kitty-girl in sizzlingly hot, bare dick. <i>“Ain’t gonna be able to fit this deep on my own,”</i> she giggles, pawing reverently at your deific dong, <i>“but I know it’s gonna feel great popping off between my lips.”</i>\n\nYou’ll see about that.");

	addButton(0, "Next", furtherNessaFeeding, cockIdx);
}

public function furtherNessaFeeding(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showNessa(true);
	showName("FEED\nTHE KITTY");
	author("William");
	processTime(3 + rand(5));
	// sceneTag: processTime by 3-7\rand minutes

	output("Starting from below, she rolls out an exquisitely coarse carpet and drags the tip from [pc.base] to [pc.cockHead], every muscle in her body at once tensing and relaxing to the taste of [pc.cumFlavor] cock-drool. Saucy peach lips purse around " + (pc.hasCocks() ? "one of your tips" : "your tip") + ", savoring the appetizer of your musky banquet. Your meat slowly vanishes into her maw");
	if (pc.cocks[cockIdx].cType == GLOBAL.TYPE_EQUINE) output("; the flare of your thickened horsemeat billows out just before entry, folding back before popping inside");
	output(". Every inch of orally claimed [pc.dickSkin " + cockIdx + "] earns the horny catgirl another spurt that pushes on the buttons of her libido. " + (pc.isTaur() ? "Nessa’s sultry gurgles excite your mind as vacuuming kisses and suckles tap into your inner reservoir, causing you to let down in such volume that if she worked long enough she could get a precumflation!" : "Reaching down, you thread Nessa’s hair between your [pc.fingers] like rich veins of copper, stopping only to scratch that supremely delicate skin behind her twitching ears. The sexy growl that groans through your trembling manhood scratches your itch in return, and you can practically feel a [pc.cumVisc] flow through your dick and pool in her mouth, just before puffing out her cheeks."));
	output("\n\nFor her part, Nessa seems to be enjoying this more than anything else, swiveling her head and her tongue around your [pc.cockHead " + cockIdx + "], sliding, gliding, squishing, and drumming at <i>those</i> spots in particular. Yeah, she knows how to get you to moan. When the powerful tremble spills out from your squirming thighs to your [pc.chestNoun], you’re like a sink tap on full blast. When she pulls off for air, overflowing pre puddles at her knees or squirts out across her face.");

	if (pc.cocks[cockIdx].cType == GLOBAL.TYPE_CANINE) output("\n\n<i>“Knot’s already swelling up, tiger.”</i> Nessa pokes and prods at your breeder’s anatomy. It’s hotter and firmer than your dick, strong enough to heft this fertile kaithrit upon its bulbous shape. <i>“Gonna ravage my mouth ‘n knot it? " + pc.catDog("You’re not an ausar or anything, but I hope you’ve got the gumption to try and breed this hole. Can’t let all that sperm go to waste!","Big pup like you oughta give it a shot. Don’t wanna waste any, y’know?", false) + "”</i> The most loving licks polish your tapered animal-dong. <i>“Always had a thing for hounds...”</i> She looks up. <i>“Especially the alphas.”</i>");
	else if (pc.cocks[cockIdx].cType == GLOBAL.TYPE_EQUINE) output("\n\n<i>“F-Fuck... this thing tastes so... uggmmmhhhhhhh...”</i> Nessa’s body ignores her brain’s signals, throwing itself to the task of total cock worship. Down your veiny equine beast she goes, licking your [pc.dickSkin " + cockIdx + "] until her delightful tongue goes numb, slathering your medial ring and fleshy flare in spicy kaithrit spit. <i>“Fat, blunt fucking cock, just like all those laquines... this is so hot...”</i> She hefts your rod and smears the lathered shaft all over her face until she’s an erotic mess. <i>“Ho-fuck... I just love this dick... gonna love having it make my throat its glory hole.”</i>");
	else if (pc.cocks[cockIdx].cType == GLOBAL.TYPE_FELINE) output("\n\n<i>“Ooh, bringing me a real treat with this, huh? Trying to score some points with every cat in the galaxy, show’ ‘em a bit ‘a home?”</i> Nessa’s delightful little tongue brushes all the nubs on your [pc.cockColor " + cockIdx + "] cat-cock, slurping up all the fluid between the pleasure-nodules. <i>“Having these things rubbing against my throat is gonna be nice.”</i> A chirping sound erupts from her when a wad of spoo splashes her cheek. If she keeps talking like that, you’re gonna feel more than nice.");
	else if (pc.cocks[cockIdx].cType == GLOBAL.TYPE_SIREN)
	{
		if (flags["NESSA_SUCKED_STINGERDICK"] == undefined) output("\n\n<i>“Hmm... never seen a dick like this before. What are these tendrils-”</i> Nessa squeaks when her hand gets stung. <i>“Got a biter huhhh... woah, that’s potent. I gotta suck this?”</i> She eyes your dick hesitantly, then licks her lips. <i>“I <b>get</b> to suck this dick. Probably the most interesting thing I’m going to do on this craphole.”</i>");
		else output("\n\n<i>“Still packing this venomous guy huh? I’d kill to see some vids of other people you’ve dicked with this thing,”</i> Nessa grins, palming around your phallic stingers, <i>“...see what kinda sluts they turn into with a mouthful of this feel-good juice.”</i>");
		flags["NESSA_SUCKED_STINGERDICK"] = 1;
	}
	else output("\n\n<i>“I’m gonna cum just from sucking this thing, I know it. Knowing you could go off at any time and make me into a worthless little cum-dump... mmm.”</i> The full pressure of Nessa’s lungs tugs at your inflating cumslit. She’s doing everything in her power to stimulate you into a mighty release. <i>“Can’t believe how good it feels to just be full of dick, taking every chance to breathe, waiting for it to cum deep down inside me... might actually be better than getting it in my pussy. ‘Specially when this one tastes so good.”</i>");
	if (pc.hasCocks()) output("\n\n<i>“And you’ve got extra,”</i> she giggles cutely, firming her penis-pleasers to your second dick" + (pc.cocks.length > 2 ? " and then the rest" : "") + ". <i>“Fuck yes. You’ve got everything a girl could want. Fuck ‘em in every hole, or hose them in cum while filling them. Seriously...”</i> She strokes your [pc.multiCocks] imploringly, focusing on all their unique features. <i>“...You’re gonna ruin me for others. You better be bringing these around to me when you’re horny.”</i>");

	output("\n\nRipping her goggles off and tossing them to the side, Nessa undoes the fasteners of her jumpsuit amid the littering of personal effects. B-cup titflesh spills out like a lazy wave of titillation, sending a much bigger one through your [pc.cocksLight]. Her blowjob isn’t messy - well, it is, but not in the way one would think. She knows how to vent your penile pressure like no other. Cruel fingers firm against your bulging urethra, closing off the flow until pockets of backed-up fluid develop within the shaft. Paralyzing euphoria scours through your body in the masochistically tense moments before she pulls out.");
	output("\n\nIt’s almost a shame that you let it all out over her like that. The kaithrit wipes her cum-rag of a face down your [pc.cocksLight], curtaining your beefy " + (pc.hasCocks() ? "masts" : "mast") + " in glistening gunk. She one-ups herself repeatedly, working her inhuman tongue in ways that you’re quickly becoming addicted to. How long did it take you to notice just how <i>soft</i> her face is? And her lips? Her hair, too. It’s as if she was born for this task.");
	output("\n\nYou sigh in total, quivering bliss, " + (pc.isTaur() ? "lurching forward and close to falling. Even her ears are dead-set on provoking reactions, the way they tickle your taur-belly" : "increasing the rate of your head-scritching") + ". <i>“You’re doing great.”</i> Praising her comes easy - it’s all you can manage.");
	output("\n\nNessa answers with a conspiratorial coo. An agile hand tucks itself between her legs, frigging at her aroused cunt. Below the slurping reverie lurks the familiar wet splashing sound of feminine excitement. The crisp scent of alien desire wafts up into your nose, forcing you to haul off and thrust against her head, which feels the full aggression of your premature spurt. <i>“Heyyy, can’t be going off that early!”</i> she groans.");
	if (pc.balls > 0)
	{
		output("\n\n<i>“Here, let me calm you down,”</i> she says, purring louder than ever.");
		output("\n\nRight away you realize that what she’s doing isn’t exactly going to calm you down, but it’s an appreciably slower pace. Transitioning from knob-polisher to ball-worshiper, the kaithrit hefts your [pc.sack] into the palm of her hand, surprising you with an indelicate lick to the vulnerable stash of [pc.cumNoun]. <i>“Mmmm...”</i> Sounds of feline contentment ripple through your clenching nutsack below gently kneading fingers and between red-hot, dog-like licks. Pillowy lips squeeze against your succulent " + (pc.balls == 1 || pc.hasStatusEffect("Uniball") ? "orb" : "orbs") + ", sucking on the outline of your spunk factory with the single-mindedness of a brainless whore.");
		output("\n\nYour sack reflexively contracts, drawing upwards to your loins, heaving and sloshing with sperm just out of the covetous kaithrit’s reach. Fondly squeezing hands tease out all the tension in your clutching muscles. Spooge undulates just behind protective walls, like valuable treasure waiting for a brave adventurer to claim it. Crushing tautness relaxes, and in its place comes a familiar sagging feeling. Simultaneously you feel tight, heavy, until you look down to realize just how <i>full</i> you’ve gotten thanks to Nessa.");
		output("\n\nCalm... you could never be calm with Nessa wrapping herself in your churning warmth, bathing your spunk-stash in slaver and making the wobbling contents the permanent topic of her racing thoughts. [pc.CumVisc] seed bloats the " + (pc.scrotumType() == GLOBAL.FLAG_SCALED ? "scaly" : (pc.scrotumType() == GLOBAL.FLAG_FURRED ? "fuzzy" : "fleshy")) + " circumference of your cushiony " + (pc.balls == 1 || pc.hasStatusEffect("Uniball") ? "sphere" : "spheres") + ", working overtime to satisfy the requisition laid upon " + (pc.balls == 1 || pc.hasStatusEffect("Uniball") ? "it" : "them") + ". Saturated by your strongest scents, she licks and laps, polishing every inch of your " + (pc.ballSize() < 8 ? "weighty" : (pc.ballSize() < 16 ? "heavy" : "tremendous")) + " [pc.ballsNoun] until " + (pc.balls == 1 || pc.hasStatusEffect("Uniball") ? "it shines like a crown jewel." : "they shine like crown jewels."));
	}
	output("\n\nAt the apex of her cadence, Nessa rears back, opens wide, and impales herself on your [pc.cockNoun " + cockIdx + "]. Inch after saliva-slick inch disappears into her stretched mouth, stuffing her slender face with your beefy rod. Liquid fervor pours into her throat, beginning the process of ballooning her elastic gut. The heartbeat of a bitch in heat pounds its way up her esophageal cavern and straight through the [pc.cockHead " + cockIdx + "] flattening her uvula. Her body twists about and her pussy-tickling hand goes limp to the left of her thigh, lost in the intense sensation of brimming with dick.");
	if (pc.cLength(cockIdx) < 14)
	{
		output("\n\nThe spitted scout-slut suckles at your invading " + (pc.cLength(cockIdx) < 7 ? "prick" : "slab") + " until the outline of your pillar makes itself apparent at the front of her neck. You can feel it before you see it, and she’s going deeper, forcing her mind to grant your dick passage. Gravity carries you far enough that your");
		if (pc.hasKnot(cockIdx)) output(" knot presses firmly to her lips");
		else if (pc.hasSheath(cockIdx)) output(" sheath crinkles around her lips");
		else output(" crotch presses firmly to her lips");
		if (pc.balls > 0) output(" and the heavy bulk of your ballsack is pulsing joyfully atop her chin");
		output(".");
	}
	else output("\n\nNessa bobs her head up and down as she gorges herself on your fist-thick [pc.cockNoun " + cockIdx + "]. The slick, swollen shaft sinks into her throat at the behest of clinging cheeks. Hot slaver leaks out from her overstrained lips, losing their natural color as her body grapples with having " + num2Text(int(pc.cLength(cockIdx))) + " inches crammed into it. She gags and coughs, overflowing with drool and pre. Water beads at the edges of her happy, violet eyes. Asphyxiation-by-[pc.cockNoun " + cockIdx + "] shocks her into a convulsive orgasm, halting your progress halfway through her throat -- you can feel the outline you make on her lithe frame before you spot it. Her flattened, luscious tongue wiggles somewhere in the shadow of your big, hard boner, but you’re not going to get much further, alas.");
	if (pc.hasCocks()) output("\n\nUnslotted but not inactive, your extra " + (pc.cocks.length > 2 ? "dicks cover" : "dick covers") + " the kitten’s head in a phallic veil, drooling solid ropes of [pc.cumColor] into her hair. When she gets started, she’s going to be getting a series of cummy cock-slaps. The look on her face tells you she can’t wait to be knocked senseless by " + (pc.cocks.length > 2 ? "them" : "it") + ". It’ll make the cumming inflation all the sweeter.");
	output("\n\nTransfixed on your unmistakably virile mass, the cat-slut abandons her previous inhibitions and fires all engines. Her U.G.C. funded exercise shows in her endurance and physique. Yes, sometimes she gags, rarely she coughs, but she knows how to hold her breath, and her elasticity ensures that she’s always got a sieve of vital oxygen fueling her forwards and backwards on your thick dick from [pc.base " + cockIdx + "] to [pc.cockHead " + cockIdx + "].");
	output("\n\nPre-lubed friction squeezes possessively <i>and</i> obsessively on your phallus, widening your channel and her own. She’s giving it to herself rough and deep, deepthroating your member until excess slime is shining her cherry-sized nipples. " + (pc.isTaur() ? "Crumpling forward, you stabilize yourself with the side of her bed, at the same time forcing more of your expressive organ nearer to her belly." : "You find yourself so enamored by her skill that you grasp the kaithrit from either side of her head, thumbing circles into and around her ears.") + " It feels like you’re fucking a pussy, maybe an executive-class Tamani product. Nessa’s plunging you further with slow, determined thrusts of her braced jaw, shifting only so that you have the pleasure of reaching previously untouched nerves.");
	output("\n\nYou can sort of it feel it in the back of your gut when she facially humps you. Your prostate is a lever that she’s figured out how to remotely tug. It’s not true. It can’t be. But the proof is in the sex-juice streaming from her nasal passages and the corners of her ‘O’-shaped lips. Gushing goo flows across her nimble surface, striping her as Tarkus’ premiere oral slut. The next time she takes you [pc.knotBallsHilt " + cockIdx + "]-deep, she halts there, eyes completing their swivel into the back of her head. She shudders on the spot, sending ripples through the puddled girlcum surrounding her.");
	output("\n\nJust before you think you need to get in on the action, she regains her senses long enough to haul back and restart. You don’t have to do anything but dazedly watch your penis disappear inside her, emerging in a fresh coat of ecstasy. Nessa madly thrusts her head and neck until you’re rocking in tune with her force");
	if (pc.balls > 0) output(", causing your weighty nutsack to swing up and clap into her chin");
	output(".");
	output("\n\n...And then she’s gone again. Before you know it you’ve taken her insensate head in your [pc.hands] and slammed your [pc.hips] into her. The kaithrit’s malleable throat has molded perfectly to your shape, making each belly-bound stroke faster and harder than the last. It doesn’t take any effort on your part or hers. You’re swimming into her, feelings of more intense fullness crushing you in the confines of her premium suck-hole.");
	var tentacles:int = pc.tentacleCockCount(true, [cockIdx]);
	if (tentacles > 0)
	{
		output("\n\nNow that she’s vulnerable and in desperate need of more than a facefucking, you will your prehensile tentacle-" + (tentacles > 1 ? "cocks" : "cock") + " into action. " + (tentacles == 1 ? "It" : "One") + " slithers between her thighs, plying the cushy gap and squirming effortlessly into her touch-sensitive snatch. If she didn’t feel like her entire being was being fucked, it most certainly is now.");
		if (tentacles > 1) output((tentacles == 2 ? "The other" : "Another") + " has little difficulty weaving through the valley on the back of your other stalk, crawling through her asscheeks and burrows into her capacitive colon.");
		output(" No matter the awkwardness, the undulating " + (tentacles == 1 ? "tentacle has" : "tentacles have") + " a way of distending her with inch after inch of slickened dickvine. The botanical " + (tentacles == 1 ? "mass" : "masses") + " slither across her deepest regions, ready to pump her rapt, attentive body with an immense offering.");
	}
	output("\n\nThe inevitable bloom of climax spreads like the tightening grasp of an octopus’ tendrils. Arousal coils around reproductive tubes, stroking them to a scorching friction. There’s nothing but pleasure as you whimper and squirm, railing the sexy kaithrit’s face in rapid, drilling humps. Both of her cat tails wind around your [pc.legOrLegs] and squeeze tight - an automatic action, to be sure.");
	output("\n\nLoads stacked atop heavy, heated loads begin their journey into Nessa.");
	if (pc.cocks[cockIdx].cType == GLOBAL.TYPE_EQUINE) output(" There’s an odd twist in her posture that immediately follows the billowing of your cum-sealing flare, which has properly expanded to accomplish its biological purpose.");
	output("With no care for her comfort, you rear back and ram yourself into the taxi-kitten’s maw");
	if (pc.cLength(cockIdx) < 18 && pc.hasKnot(cockIdx)) output(", successfully plugging the gap with your [pc.cockColor " + cockIdx + "] knot");
	output(".");
	if (pc.cLength(cockIdx) >= 18)
	{
		output(" Sadly, you can’t fit every inch of your rut-thickened dong inside");
		if (pc.hasKnot(cockIdx)) output(", least of all your [pc.knot " + cockIdx + "]");
		output(", but you’ve already penetrated the narrow band of her stomach!");
	}

	var cumSave:Number = pc.cumQ();
	if (cumSave < 10000)
	{
		output("\n\nCumming into the fathomless depths of someone’s throat is a common luxury, and it never gets old. Gouts of [pc.cum] shoot into Nessa’s stomach. [pc.CumVisc], spurting climax pools into her gullet, stretching the elastic kaithrit fucknugget into a pleasing fecund form. The cream she so badly wanted is spilling into her, throbbing on top of her heart, between her lungs. Your dick is felt everywhere, inflating and deflating. Her nut-stuffed gut swells outwards, ruining her lithe, athletic waistline and fattening it instead with jizz-flated curves.");
		if (tentacles > 0) output(" Your tenta-cocks are seeing to it that she gets a healthy filling downstairs, too.");
		output(" She fills before your very eyes, expanding from the weight of [pc.cumFlavor] seed. You withdraw slowly, so that you have the pleasure of giving her a fresh taste of her favorite meal");
		if (pc.isLactating()) output("; the drooly outstroke drawing your attention to the [pc.milk] squirting " + (pc.isChestExposed() ? "over Nessa’s head." : "into your [pc.chestCover]."));
		if (pc.hasDickNipples())
		{
			if (!pc.isChestExposed()) output("The rigid stiffnesses stabbing out from your chest demand you tug off your upper armor; you do so.");
			output(" Roused at the most critical moment, your [pc.dickNipples] are already spurting, so to make good on your earlier promise, you aim the firm tit-cocks downward and unleashing your exotic payload in alternating torrents.");
		}
		if (pc.hasCocks()) output(" Having been divided between [pc.cockCount] dicks, your orgasm wasn’t entirely focused into the moaning kaithrit. But hey, it’ll feel good under her suit!");
	}
	else
	{
		output("\n\nNessa’s a picky cat, and in you she chose well. Maybe too well by the lovely choking sounds she’s making as molten geysers of [pc.cum] burst into her stomach. Not one internal organ resists the crashing waves of your [pc.cumVisc] spunk. Your [pc.toes] curl in bliss, and Nessa... she’s hanging in there. Soon, she’ll be rolling somewhere. The downpour of hot sperminess is lost in the expanding horizons of her waistline, going from lithe and agile to fat, fecund, and very pregnant. Orgasm bursts regardless of her need to breathe and live, wringing thought-destroying climaxes out of the kaithrit while she experiences the all-consuming joy of being someone’s oral fuckpuppet.");
		if (pc.hasCocks()) output("\n\nThat feeling is enhanced by your other " + (pc.cocks.length > 2 ? "cumspouts" : "cumspout") + " firing off divvied loads of [pc.cumColor] seed upwards and into her hair. Not only does she look the part of a total, dominated slut, but she’s going to smell like one. She’s going to look like one. Torrents of accumulating gunk coat her in a lasting reminder of her kinky pastime.");
		output("\n\nHolding tight to her ginger hair, your [pc.cumColor] gushes of [pc.cumNoun] have bloated her rapidly engorged midriff to its inhuman limit. Her throat, already full of dick, is now accommodating an ascending column of spooge, every subsequent load you fire off driving it ever upwards and burdening her with more superheated goop. <i>This is exactly what she wanted,</i> you remind yourself. This is <b>precisely</b> what this slut was made for, and with that thought held deep in your [pc.chest], you pull back and slam into the pregnable gap, renewing the visceral liquid pressure spouting from her nostrils and jizz-filled gaps of her overstretched lips.");
		if (pc.isLactating()) output(" You’re cumming so hard that even your [pc.milkyNipples] are squirting. Your thumping heart is the hand pulling on the bowstring of your body, each beat firing off [pc.cumNoun] and [pc.milkVisc] [pc.milkNoun].");
		output(" Either way, your jittery thrusts see to it that she gets it all and more.");
		if (tentacles > 0) output(" Downstairs, your tenta-cocks are ensuring that she gets the filling she deserves.");
		if (pc.hasDickNipples())
		{
			output("\n\nStirred by orgasm and determined to add to the mix, your [pc.dickNipples] twitch with pure pangs of pleasure");
			if (!pc.isChestExposed()) output(" in the damnable obscurity of your clothing - freeing them is a simple matter");
			output(". All it takes to get your nipplecocks spurting their exotic loads is a firm twist that annihilates your mind with the pleasure of multi-angled ejaculation, each goopy wad of tit-sperm raining down on the liquid-soaked kaithrit.");
		}

		if (cumSave >= 20000)
		{
			output("\n\nIt’s still going. By the time Nessa looks like a gabilani at the end of her twelve-hour shift, you realize that your endless orgasm is refusing to abate, even when you yourself are about to join her in the sweet vacancy of orgasmic rest. Lanced on your girth, she radiates an indolent kind of giddiness, so very happy to be worn like the cocksleeve she is. Pulling her lips off your cock is like trying to get a stubborn ring off one’s finger. She flops backwards immediately, fountains of spoo launching out of her mouth in an obscene display, raining down her face and webbing it shut in a mask of [pc.cumGem] spunk.");
			output("\n\nYou’re still far from done, and to make sure she looks the part of your personal cum-dumpster, you aim at the insensate cat and shoot until she’s the centerpiece of an expansive puddle. Slick stuff fires onto the sopping-wet cat while you maximize your enjoyment with depraved fantasies. Whatever helps you <b>unload,</b> whatever helps you make the next shot a bit thicker, that’s what you’re doing.");
			if (tentacles > 0) output((tentacles == 1 ? "Your tentacle pops out of her cunt and concentrates its" : "Your tentacles pop free and concentrate their") + " spermy barrage on her, spurting and spurting... and spurting...");
			output(" By the time your mythical release fades into benignness and you fall to your knees spent and heaving... you’ve made sure Nessa is 99.9% [pc.cumNoun].");
		}
	}

	// sceneTag: Cumflate Nessa if High or Hyper cum. There's a flag for this somewhere, so look at the original stuff!
	if(cumSave > 40000) cumSave = 40000 + rand(Math.ceil((pc.cumQ() - 40000) / 2));
	nessaBellyRating(cumSave);

	// sceneTag: PC lust maximizes
	pc.maxOutLust();

	addButton(0, "Next", nessasDessertTime, pc.cumQ() >= 20000);
}

public function nessasDessertTime(hyper:Boolean):void
{
	clearMenu();
	clearOutput();
	showNessa(true);
	showName("FEED\nTHE KITTY");
	author("William");
	// sceneTag: processTime by 10-19\rand minutes
	processTime(10 + rand(10));

	output("You are calm, and your breathing is slow and steady. You must have passed out for a hot second. When you come to, Nessa is laid back on her bed, rubbing her " + (nessaBellyRating() < 30 ? "plump" : "massive") + " gut with the relish of a pregnant woman high on hormones. It almost pains you to realize that you didn’t actually seed her meadow, but merely gave her the temporary silhouette of a natural broodmother.");
	output("\n\n<i>“Fuuuuckkkk,”</i> she rolls to the side, unable to avoid burping. <i>“That was worth it. Unf, not gonna be able to get up for a few minutes... you can see yourself out, right?”</i> You stand");
	if (!pc.isNude()) output(", fixing your clothes");
	output(". <i>“And you can see yourself back when you need to offload some cargo, yeah?”</i>");
	output("\n\nSure. And what about her? How’s that bulk treating her?");
	if (hyper) output("\n\n<i>“Love it, babe,”</i> she grins, cradling her stomach, eyes glazed by euphoria. <i>“Gonna get back to work in a bit... you know, the usual. Working this job kinda sucks and being on Tarkus sucks even worse, but [pc.guyGirl]s like you make it worth it. Thanks.”</i>\n\nAlways glad to help!");
	else output("\n\n<i>“Mmnnf, I feel like I should’a been born a goo with how much I love being stupidly heavy. So fucking good. All that cum just churning away inside me, making me feel warm, making me feel like I can’t move. Nothing better than finding virile lovers and getting them to dump all this nut into me. About the only fun thing there is to do on this shithole planet. Thanks, by the way. Can’t wait to get it again.”</i>\n\nYou grin and sigh, making your way out to the background noise of sated kaithrit.");

	pc.orgasm();
	flags["NESSA_ORAL"] = 1;

	// sceneTag: PC cums, reduce lust to 0.
	// [Next] \\ Back to Game
	addButton(0, "Next", mainGameMenu);
}

public function nessaBellyRating(arg:Number = 0):Number
{
	if(flags["NESSA_BELLY"] == undefined) flags["NESSA_BELLY"] = 0;
	if(arg > 0) flags["NESSA_BELLY"] += arg;
	
	var nessaBelly:Number = flags["NESSA_BELLY"];
	var bellyMax:Number = 100000;
	if(!silly && nessaBelly > bellyMax) nessaBelly = bellyMax;
	
	return nessaBelly/1000;
}