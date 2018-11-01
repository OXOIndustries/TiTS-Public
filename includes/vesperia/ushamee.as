/*
 * Chief Ushamee Neykkar - The Lusty Bugpony’s Canadian Vacation
 *
 * #Flags:
 * USHA_MET3		1 if met Ushamee in Room 3, else undefined
 * USHA_STATE		1 == LoverChief, 2 == ChiefWantsItBad, else undefined
 * USHA_SEXED		0-INFINITY, undefined if never sexed 
 * USHA_BUMLOVE		0-INFINITY, undefined if never put it in her bum
 * USHA_VAG			0-INFINITY, undefined if never been in her pussy
 * USHA_ORAL		0-INFINITY, undefined if never done the ol’ lickaroo
 * USHA_MOUNT		0-INFINITY, undefined if never been on top of her
 * USHA_DATE		1-2, last date went on with Usha, undefined if never dated Usha
 */

public function ushameeMeetInviteText():String
{
	var buff:String = "";
	
	buff += "Captain Steele,";
	buff += "\n\nI hope this finds you in continued good health. The med-techs at your company have just cleared me of any signs of infection. Whatever that thing was on <i>Kashima</i>,";
	if (flags["KASHIMA_STATE"] == 2) buff += " we definitely killed it. Thank all the stars for that.";
	else buff += " they say they’ve fully removed it. Hopefully right into the ship’s incinerator!";
	buff += "\n\nWe have a dish on Leitha called <i>reshinn</i> that looks a lot like those slug... tentacle... things... that were coming out of people aboard the ship. Used to be my favorite snack, but I went to go get a bowl of it as soon as I got out of medical and just about threw up at the sight of them. Damn it all.";
	buff += "\n\nConsidering what happened on the <i>Kashima</i>, Nova Security has decided that me and my patrol need an extended vacation. I can’t exactly disagree, though I hope that’s not a prelude to getting rolled out of the company. Wouldn’t be surprised, though.";
	buff += "\n\nAnyway, I’m going to be visiting my brother on Canadia Station for the next while. Come by if you get a chance... we should talk about what happened.";
	buff += "\n\nSincerely,";
	buff += "\nUsha";
	buff += "\n\n<i>Attached below the message are coordinates to Canadia Station.</i>";
	
	return buff;
}

public function ushameeAtRoom3():Boolean
{
	if (MailManager.isEntryViewed("ushamee_meet") && flags["USHA_MET3"] == undefined) return true;
	return false;
}

public function ushameeCanadiaCorridorBonus(btnSlot:int = 0):void
{
	if (!ushameeAtRoom3()) return;
	
	output("\n\nYou see the familiar, burly figure of an amazonian space-centauress at the end of the corridor, currently locked in an argument with a slender local deer-taur boy. Chief Neykkar is shouting and gesticulating wildly, bellowing into the young man’s face. He shrinks back from the towering ‘taur, clutching a datapad to his uniform’s chest.");
	
	if(flags["KIRO_MET_KALLY"] != undefined && flags["KIRO_MET_KALLY"] < 4) addDisabledButton(btnSlot, "Ushamee", "Ushamee", "You need to finish Kiro’s visit first!");
	else addButton(btnSlot, "Ushamee", approachUshameeCorridor, undefined, "Ushamee", "Go talk to the Chief and see what’s going on.");
}

public function ushameeAtBar():Boolean
{
	if (flags["USHA_MET3"] != undefined) return true;
	return false;
}

public function ushameeCanadiaBarBonus(btnSlot:int = 0):void
{
	output("\n\nUsha Neykkar is sitting in a taur-accessible booth near the back of the bar, enjoying a drink and watching the latest leithan all-terrain dash competition on a holopad. Even without her armor and machine gun, she’s still an imposing figure whose sheer size makes her seem to loom over the entire bar, even the other tauric patrons.");

	addButton(btnSlot, "Ushamee", mainMenuUsha, true);
}

public function approachUshameeCorridor():void
{
	clearOutput();
	clearMenu();
	//Defined in kashimaIncident.as
	chiefNeykkarHeader();
	
	output("<i>“Look you little bastard, I said check again!”</i> the leithan amazon growls, grabbing the deer-bodied ‘taur by the collar of his uniform. <i>“So check!”</i>");
	output("\n\n<i>“I’m... I’m sorry, miss,”</i> the young buck whimpers, squirming against her grasp. <i>“It’s like I said, there’s no ship by that name registered at the docks. I’m sorry, but I can check fifty times and it won’t just magically appear!”</i>");
	output("\n\nThe chief snarls, but releases her grasp on his shirt and shoves him back. <i>“Idiot. I’ll go look my own damn self.”</i>");
	output("\n\nShe scowls and canters around towards the docks, starting to walk your way. It takes her a moment for her haze of rage to clear enough to look up and recognize you standing in her way, watching the whole affair.");
	output("\n\n<i>“Oh, it’s you! Steele!”</i>");
	output("\n\nThe scowl on her face disappears in an instant, replaced with a toothy smile. <i>“You actually got my email, huh? Good. Hey, look, did you see a ship -- the </i>Raggedy Mare<i> -- on your way in?”</i>");
	output("\n\nAs if on cue, the deer-morphed guy she was talking to scurries off down the corridor out of sight. You consider for a moment, then shake your head. Not that you pay much attention to the other registries in port, but you sure don’t remember a ship by <i>that</i> name.");
	output("\n\n<i>“Dammit. Shit!”</i> she snaps, kicking one of the walls with a middle leg. Her claws dig into the metal of the docking port, and her arms cross under her chest. <i>“Sorry, it’s my brother’s ship. He’s got a wife down on Vesperia, and the lazy ass is <b>supposed</b> to be here yesterday, but...”</i>");
	output("\n\n<i>“Sorry,”</i> you say with a shrug, putting a hand on the chief’s flank. She heaves out a long sigh and turns back towards the interior of the station, scaly tail coiling around one of her hexapedal legs. <i>“So, you wanted to talk?”</i>");
	
	processTime(1 + rand(2));
	addButton(0, "Next", approachUshameeCorridor2);
}

public function approachUshameeCorridor2():void
{
	clearOutput();
	clearMenu();
	chiefNeykkarHeader();
	
	rooms[currentLocation].removeFlag(GLOBAL.NPC);
	moveTo("CANADA5");
	
	output("The leithan woman guides you over to ");
	if (flags["MET_KALLY"] != undefined) output("the lodge");
	else output("a wood-fronted tavern down the hall, calling itself the Kui Country Bar & Lounge,");
	output(" and takes you to a ‘taur-accessible booth near the back. ");
	if (flags["MET_DEL_SHEMALE"] == undefined) output("One of the serving staff ");
	else output("Del ");
	output("quickly comes over and takes a drink order from you both before leaving you in peace with the brawny space-centauress. Once she’s settled in one her haunches, the chief reaches up and yanks off the elastic tie holding her ebony locks back in a ponytail. Her luxuriously long hair comes spilling down around her shoulders, drawing your attention to the fact that she’s not wearing the armor you remember from your first meeting, but rather a white t-shirt with a picture of a railgun printed atop her ample rack underneath an unbuttoned red flannel shirt, and a blanket made of blue denim wrapped over her bestial lower half.");
	output("<i>“Yeah, I was hoping we could talk. About what happened, and um... what we did.”</i>");
	output("\n\nThe last few words there cause a dark, purplish flush to spread across her cheeks. Your mind immediately flashes back to those last, involuntarily intimate moments aboard the ship, with the parasites wriggling inside of the chief’s gravid belly, peeking their tentacle-like appendages back out of her chocolate-hued pussy.");
	if (flags["FUCKED_CHIEF_NEYKKAR"] != undefined)
	{
		output(" The two of you certainly found a rather lewd way of dealing with her overwhelming parasite problem.");
		output("\n\n<i>“Yeah, we sure did,”</i> s");
	}
	else output("\n\nS");
	output("he chuckles, rubbing at one of her plated ears. <i>“I just... shit, look, I wanted to say thanks, first of all. I don’t think me or my guys would have made it out of there without you. I totally had you wrong when we first met, and now you saved my life. And you’ve seen a lot more of me -- a different side -- than even the people I’ve fought side by side with for years. I don’t know whether to be incredibly embarrassed or seriously aroused by that.”</i>");
	
	processTime(1 + rand(2));
	
	//INSERT CHOICES
	addButton(0, "Embarrassed", embarassedUshamee, undefined, "Embarrassed", "A big, strong amazon like her shouldn’t be showing that side off to you. What happened on the <i>Kashima</i> should stay there.");
	addButton(1, "Aroused", arousedUshamee, undefined, "Aroused", "That was certainly a side of her you’d like to see more of.");
	addButton(2, "No Idea", noIdeaUshamee, undefined, "No Idea", "You can’t exactly speak for how Ushamee should feel.");
}

public function embarassedUshamee():void
{
	clearOutput();
	chiefNeykkarHeader();
	
	output("<i>“Embarrassed, probably,”</i> you answer. <i>“What happened back on the ship should probably stay there.”</i>");
	output("\n\nThe leithan woman sighs and bites her lip, averting her gaze. <i>“Ah, right. You’re right, of course. Better to stay professional.”</i>");
	output("\n\nShe gives you a slight nod and then rests her hands on the table between you, wubbing her fingers together nervously. <i>“So, um, I’ll be here around the station for a while if you want to talk about stuff in general, later. It’s not like I have anywhere better to be on ‘indefinite psychological leave.’ Just don’t expect me to be sober.”</i>");

	processTime(1 + rand(2));
	//Call menu function
	mainMenuUsha();
}

public function arousedUshamee():void
{
	clearOutput();
	chiefNeykkarHeader();
	
	output("Giving her your most charming smile, you tell the chief that you certainly liked seeing that side of her. And you gotta say: you wouldn’t mind seeing it again, in less dire circumstances.");
	output("\n\n<i>“O-oh? Is that right?”</i> the chief grins, <i>“Well, I’d be lying if I said I wasn’t hoping for that answer.”</i>");
	output("\n\nYou watch as her dusky skin flushes an even darker shade of purple. Usha gives you a surprisingly shy little smile, rubbing at one of her floppy ears and swishing her big reptilian tail against the booth. <i>“So, um, maybe sometime you and I could go somewhere, and see how that pans out.”</i>");
	output("\n\n<i>“You mean like a date?”</i>");
	output("\n\nUsha chuckles, glancing at you with those dark, starry eyes of hers. <i>“I guess so, huh? Could be fun to see how you handle yourself without an army of monsters on your heels.”</i>");
	output("\n\nAnd it might be fun to see how the chief handles you when she doesn’t have a fuck-parasite squirming around inside her.");
	output("\n\n<i>“Then it’s settled. We can talk about when and where soon -- I need a drink!”</i>");
	
	flags["USHA_STATE"] = 1;
	processTime(1 + rand(2));
	//insert menu
	mainMenuUsha();
}

public function noIdeaUshamee():void
{
	clearOutput();
	chiefNeykkarHeader();
	
	output("You answer with a shrug, saying that how she feels is up to her.");
	output("\n\n<i>“Well of course it is!”</i> she huffs, crossing her arms in a way that puffs out her already-big tits. <i>“And let me tell you, I’m a girl who knows what she wants! And what I want... is you. That’s why I called you out here, and that’s what I’m gonna get! So are you in, or am I gonna have to work at it until you give in?”</i>");
	output("\n\nNow that sounds more like the chief you remember. If you’re onboard, maybe you out to ask her out. Or let her ask you out, whichever comes first.");
	
	flags["USHA_STATE"] = 2;
	processTime(1 + rand(2));
	//insert menu
	mainMenuUsha();
}

public function mainMenuUsha(intro:Boolean = false):void
{
	if (flags["USHA_MET3"] != undefined)
	{
		if(intro)
		{
			clearOutput();
			chiefNeykkarHeader();
			
			output("<i>“Back again?”</i> Usha says with a hungry little smile. <i>“Good to see you, [pc.name]! Sit down, take a load off. Let me buy you a drink!”</i>");
			output("\n\nShe grabs ");
			if (flags["MET_DEL_SHEMALE"] == undefined) output("a passing waitress by the shoulder");
			else output("Del by the shoulder as [del.heShe] passes by");
			output(" and orders drinks for the both of you, giving you time to settle into the seat across from her. Once the drinks arrive, Usha turns back to you and dunks a straw into the bubbling black liquor she’s ordered.");
			output("\n\n<i>“So, what’s on your mind, [pc.name]?”</i>");
			
			processTime(2);
		}
	}
	else flags["USHA_MET3"] = 1;
	
	clearMenu();
	addButton(0, "Date", dateUsha, undefined, "Date", "Dating a Bugpony.");
	if (flags["USHA_STATE"] != undefined && pc.lust() >= 33) addButton(1, "Sex", sexUsha, undefined, "Sex", "See if the chief’s up for a roll in the proverbial hay.");
	else if (pc.lust() < 33) addDisabledButton(1, "Sex", "Sex", "You aren’t turned on enough for this.");
	else addDisabledButton(1, "Sex", "Sex", "You should get to know her a little better.");
	addButton(14, "Leave", leaveUsha, undefined, "Leave", "Take your leave of the chief.");
}

public function dateUsha():void
{
	clearOutput();
	clearMenu();
	chiefNeykkarHeader();
	
	output("<i>“So, maybe we could go somewhere?”</i> you suggest. <i>“Know anyplace fun around here?”</i>");
	output("\n\n<i>“On the station? You’re looking at it,”</i> Ushamee chuckles. <i>“But I’ve been all over Vesperia with my brother and his family. Tell you what, rich " + (pc.isMale() ? "boy" : "girl") + ". If you foot the bill, I’ll show you some of the best places down there.”</i>");
	output("\n\nWell, that’s certainly an offer, thought no telling how much Usha’s going to take you for...");
	
	processTime(1);
	//If going on first date and don’t have 250 credits, or don’t have 100 credits you can’t date her
	var dateCost:int = 100;
	if (flags["USHA_DATE"] == undefined || flags["USHA_DATE"] == 2) dateCost = 250;
	if (pc.credits < dateCost) addDisabledButton(0, "Go For It", "Go For It", "You don’t have enough credits to treat her.\n\nCosts " + dateCost + " credits.");
	else addButton(0, "Go For It", goForUsha);
	addButton(1, "Maybe Later", laterUsha);
}

public function goForUsha():void
{
	clearOutput();
	clearMenu();
	chiefNeykkarHeader();
	
	output("<i>“Deal,”</i> you say, standing.");
	output("\n\nUsha chuckles and finishes off her beer, drawing in a long, sharp breath as she does so. <i>“Alright! Now we’re talking. C’mon, there’s a shuttle planetside on the other side of the station.”</i>");
	output("\n\nThe chief pays off the tab and offers you her hand, leading you of of the lodge and around the gentle curve of Canadia Station’s outer ward. The transit station is much more crowded than anywhere else you’ve visited here, and most of them ‘taurs to boot: deers and meese and good old-fashioned horsefolk, all coming and going from the planet’s surface. ");
	if (flags["USHA_DATE"] == undefined)
	{
		output("You’ve heard that Vesperia’s got a serious culture for tauric gene-mods, but seeing a slice of the public really drives home just how many four-legged citizens the planet must have. They easily outnumber the two-legged folk three to one. You and Usha are ushered onto a shuttlecraft by a particularly statuesque moose-bodied woman in a red mountie’s jacket who sweetly guides passengers into appropriate cabins before sealing you in.");
		output("\n\nA couple of minutes later and you’re hurtling through the Vesperian atmosphere, watching with Usha as the rolling green hills and craggy black mountains of the garden world rush closer through the windows. A speaker in your cabin tells you that you’ll be <i>“arriving in Port Victoria shortly. Please secure all your belongings and fasten your harnesses or seat belts.”</i> There’s a moment of intense gravity, dragging you forward in your seat until the shuttle shudders and comes to a stop, landing on to the roof of a large complex in the outskirts of a small city.");
		output("\n\n<i>“Small for Earth, maybe,”</i> Usha mentions as she’s unbuckling herself from the ceiling-mounted ‘taur-harnesses. <i>“Victoria’s one of the largest cities on the planet. My brother and his family live on a farm just a couple miles south of here -- most of the planet’s still rural, and the locals like it that way. Keeps the place beautiful.”</i>");
		output("\n\nUsha smiles, gazing out across the rolling grassy plains surrounding the city, stretching almost to the horizon before giving way to the mountains.");
		output("\n\nBeautiful indeed.");
	}
	else output("\n\nYou and Usha hop aboard the shuttle, escorted by the familiar, matronly figure of the mountie on guard, and are quickly ferried back down to the picturesque grasslands of Vesperia. Port Victoria rushes up to meet you in your planetfall, until you’re disembarking onto the roof of the spaceport. Usha sighs happily and stretches, clearly enjoying the rush of fresh air as the shuttle door slides open.");
	output("\n\n<i>“So, where to?”</i>");
	
	processTime(2 + rand(3));
	if (flags["USHA_DATE"] == undefined || flags["USHA_DATE"] == 2) addButton(0, "Next", firstDateUsha);
	else addButton(0, "Next", secondDateUsha);
}

public function firstDateUsha():void
{
	clearOutput();
	clearMenu();
	chiefNeykkarHeader();
	
	moveTo("GAME OVER");
	
	output("<i>“There’s the gravball arena a couple blocks from here,”</i> Usha suggests as the two of you -- and a crowd of local bulls -- gather onto a spacious elevator and head towards the ground floor. <i>“And I’m pretty sure there’s a game in just a couple hours.”</i>");
	output("\n\nSounds fun. You tell her to lead the way, falling in beside the towering leithan. Happily, the sidewalks on Vesperia are made for ‘taurs, so there’s plenty of room for both of you to walk side by side. Usha’s arm settles around your shoulder, pulling you against her flank and guiding you towards your destination. It isn’t long before you arrive at a wide, flat arena covered in banners for local sports teams and Vesperian lagers.");
	output("\n\nTickets are fairly cheap, you find, but once you’re past the line outside, your date drags you right to the snack line and loads you up with hotdogs and beers and some sort of yellow logs in plastic wrap that she " + (pc.leithanScore() >= 3 ? "assures you are delicious" : "tells you not to eat unless you want to end up puking all night") + ". Since the game isn’t for a little bit -- you can’t quite be lucky enough for an impromptu date to hit right on start time -- the two of you head over to a small concourse near the entrance and sit down, content to spend the intervening time chatting with each other. You certainly have enough to talk about, even after you both decide not to bring up the events of the <i>Kashima</i>: the chief knows a hell of a lot about ships, and once the topic wanders onto your own vessel, well, you’ve got her talking non-stop for what seems at once like the blink of an eye and hours. The only thing that breaks you out of the reverie is the surge of bulky four-legged people starting to brush past you, filing into the stadium from the streets.");
	output("\n\nYou join the human(-ish) tide, taking Usha’s hand to make sure you don’t get separated as you make your way to your seats amidst a low, throbbing din of voices. There’s an electrical air of excitement all throughout the place, even before the lights flash on and the anti-grav generators come alive on the field.");
	output("\n\n<i>“GO BUCKS!”</i> Usha shouts, bouncing on her claws (in a way that does rather hypnotic things to her hefty rack) when the side gates open and the teams come marching out. Gravball is meant to support all the myriad body types in the galaxy, but here on vesperia, there’s one form that clearly dominates the field: ‘taurs. Most members of both teams are big, burly moose-taurs or centaurs, their halves still human rippling with muscle and glistening with sweat. You only see a lone unmodded human out there, along with a snake-bodied man and someone with sprawling feathered wings. None of it really matters once the gravity in the arena upends, and everyone starts free-floating, controlling only by tiny thrusters.");
	output("\n\nThe next couple hours are spent amidst deafening roars of exultation and defeat, watching the home team hammer their grav-ball through the other team’s hoops, then get pushed onto the defensive, until finally a clench overtime spike from the winged vixen manages to carry them to victory. Usha’s cheering and jumping all the while, shouting players names or calling for the referee to suck her dick. Eventually, though, the game comes to an end, and the gravity returns to the field.");
	output("\n\n<i>“Did you see that last throw?”</i> Usha laughs as you file out. <i>“Like, bam! The Maples didn’t even see it coming! Haha!”</i>");
	output("\n\nWhile you’re not exactly a gravball expert, you can certainly tell your date had a hell of a time. You reach over and put an arm around Usha’s hips, pressing your shoulders up against the ‘taur-girl’s slick plates. Her tail curls around to caress you, and you find yourself falling into a companionable silence, listening to Usha rave on about the game until you’re almost back to the spaceport. Before you head back to Canadia Station, though, she insists on you taking her to dinner at a little cafe around the corner from it.");
	output("\n\nA big game apparently demands a big dinner afterwards. It’s not fine dining, but it’s homey and quiet compared to the bustling arena you’ve just left. And intimate, too, you realize as you and Usha stare into each other’s eyes across the table, giggling and smiling over any little thing, right up until you’re finally covering the bill and escorting the ever-so-slightly tipsy ‘taur back to the spaceport.");
	output("\n\n<i>“That was so much fun!”</i> she titters as you’re strapping each other into the shuttle. <i>“Here I thought you’d be " + (pc.isMale() ? "mister" : "miss") + " five-star restaurants and black-dress affairs, but I guess you do know how to let loose and have fun.”</i>");
	output("\n\nAww, after all you’ve been through, and she still thinks you’re some up-tight rich kid, huh?");
	output("\n\n<i>“Hey, I didn’t mean it like that. You’re alright, Steele,”</i> Usha grins, punctuating the thought with a little hiccup. <i>“Sorry. Maybe I’ll make it up to you when we get back.”</i>");
	output("\n\nNow that’s something to look forward to...");
	
	flags["USHA_STATE"] = 1;
	flags["USHA_DATE"] = 1;
	pc.credits -= 250;
	processTime(180 + rand(30));
	addButton(0, "Next", sexUsha);
}

public function secondDateUsha():void
{
	clearOutput();
	clearMenu();
	chiefNeykkarHeader();
	
	moveTo("GAME OVER");
	
	output("<i>“I’ve got an idea,”</i> Usha says, leading you towards the edge of the city. <i>“C’mon, it’s not far.”</i>");
	output("\n\nFair enough. You " + (pc.isTaur() ? "trot along beside Usha" : "hop onto Usha’s back") + " and set out to your mystery destination. Usha’s not exactly a master conversationalist, but over the half hour or so you end up walking, you manage to coax her into talking a little about her work with NovaSec.");
	output("\n\n<i>“I joined right out of trade school. Was in a starship engineering apprenticeship, and Nova had a booth at a trade fair at my school. I thought, ‘hey, that sounds cool,’ so I joined up when I got my diploma. Great story, right?”</i>");
	output("\n\n<i>“Riveting.”</i>");
	output("\n\n<i>“Yep. I ended up working on one of their light carries pretty much right off, since I’m a big girl and I need a big ship if I’m gonna be crawling around in the engines. The crew was nice, the jobs were just the right kind of challenging, and the pay was... well, I didn’t starve, anyway. So I stuck around, got damn good at my job. Eventually got transferred to the </i>Nebula<i> as her chief engineer. You got to meet the crew on a weird day, too: the captain and the XO had just gotten hitched -- not to each other, just at the same time for some reason -- so I was in charge of our little tug for just a couple of weeks. My first time commanding, and look what happens.”</i>");
	output("\n\nAt least almost everyone made it out in one piece -- a few mutations aside. The company can’t be too mad at her, considering the circumstances.");
	output("\n\nUsha chuckles, then sighs. <i>“Yeah, I hope so. Would suck to have to go flip burgers or something. Anyway, looks like we’re almost there.”</i>");
	output("\n\nShe points up a nearby hill, to a small stone building sitting over a field of vine trellises. A dozen moose-bodied workers meander around the field, tending to the crop. Usha guides you up the long, winding dirt road that leads up to the vineyard.");
	output("\n\n<i>“So what’s the plan?”</i> you ask while Usha approaches the door, pushing it open. The interior answers your question: there are several trestle tables set up just inside, and something like two dozen people sitting inside, drinking and eating merrily while saucy Latin music plays around them. A fully-human woman in a white-and-black server’s uniform walks up to you with a warm smile, asking if it’s just the two of you today.");
	output("\n\n<i>“Yeah, for tasting and lunch both,”</i> Usha tells her.");
	if (pc.isMischievous()) output("\n\n<i>“Planning on plying me with alcohol?”</i> you tease once the waitress has seated you.");
	else output("\n\n<i>“So what’s this place’s deal?”</i> you ask once you’re seated by the waitress.");
	output("\n\nUsha grins. <i>“It’s a wine tasting! Used to be a big, big deal on Terran. At least that’s what my brother says... so it’s probably a horseshit excuse to get drunk. Still, I’ve always had a good time here, and the food’s pretty decent.");
	if (pc.isTaur()) output(" Just don’t get the ‘taur portions,’ unless you wanna be eating out of a wheelbarrow. They really pile it on!");
 	output("”</i>");
	output("\n\nYou take a look at their menu and make your selection in the intervening moments before the waitress returns with a pair of glasses and a bottle of some local vintage with a very flowery name that, by the time all’s said and done, you probably won’t remember anyway. You just knock it back and enjoy, content to let the leithan girl chat away at you about her brother taking her here and getting them both absolutely trashed, and how they ended up pulling a cart into town for the owner to pay off some ludicrous debt.");
	output("\n\nYour food comes after the fourth sampling of wine. By then, Usha’s got a merry little flush to her cheeks and just can’t stop talking. Her tail is swishing behind her, thumping against the chairs of the table behind her.");
	output("\n\n<i>“Oh my stars finally. I’m starving!”</i> she giggles, digging in like a ravenous animal. She doesn’t talk with her mouth full, at least, giving you a chance to get a few words of your own in during the downtime. You tell her about a few of your own intoxicated adventures" + (flags["REAHA_MYR_SCENE"] != undefined ? ", such as the incident with Reaha and the varmint," : "") + " though you’ve never been anywhere quite like this rustic little retreat. Most of the planets you get to visit are either too dangerous, or too modern to support it. ");
	if (flags["SEEN_TEXAS_SURFACE"] != undefined) output(" Even New Texas has a very different atmosphere. More... full of bull musk and milk, not wine and poutine.");
	output("\n\n<i>“It’s nice, right?”</i> Usha says... or rather, asks. Almost timidly.");
	output("\n\n<i>“Sure,”</i> you tell her. <i>“Mostly because of the company.”</i>");
	output("\n\nUshamee’s upper ears flatten against her scalp, and her dusky skin flushes even darker. She sports a little smile throughout the rest of your meal, though, and once everything’s done and paid for, she takes your hand while two two of you " + (pc.isTaur() ? "trot" : "make your way") + " back to town. Neither of you had all that much to drink in the tasting -- everything came in small little samplers -- but there was enough to leave you both with a pleasant buzz keeping you warm and talkative all the way back to town.");
	output("\n\nJust as you’re getting back to the spaceport, though, Usha yanks hard on your hand, pulling you out of the thinning crowds and into the alley just beside the port. Before you can ask what’s up, your back is shoved up against the wall, and Usha’s lips are pressed against yours. Her hands pin your own on either side of you, leaving you wide open as her tongue molests your [pc.lips].");
	output("\n\n<i>“Sorry,”</i> Usha murmurs after she’s broken the kiss, taking a shy step back from you. <i>“I get real lovey when I’m drunk...”</i>");
	output("\n\nIs that right?");
	
	flags["USHA_STATE"] = 1;
	flags["USHA_DATE"] = 2;
	pc.credits -= 100;
	processTime(140 + rand(30));
	addButton(0, "To Canadia!", toCanadiaUsha, undefined, "To Canadia!", "Quick, back to the space station so you can get some of that bugpony booty.");
	if (pc.hasCock()) addButton(1, "Alley Quickie", quickieUsha, undefined, "Alley Quickie", "Give Usha a way to put all this bottled-up affection to good use.");
	else addDisabledButton(1, "Alley Quickie", "Alley Quickie", "You need a cock for this scene.");
}

public function toCanadiaUsha():void
{
	clearOutput();
	clearMenu();
	chiefNeykkarHeader();
	
	output("You run a hand across Usha’s cheeks, telling that if she feels that way, the two of you ought to get back to space where you can be alone.");
	output("\n\nYour leithan companion grins, swishing her tail along the gravel. <i>“I like that plan. C’mon, race you to the shuttle!”</i>");
	output("\n\nUsha’s bolting off before you can even agree, leaving you to run after her all the way back to New Canadia...");
	
	processTime(1 + rand(2));
	addButton(0, "Next", sexUsha);
}

public function quickieUsha():void
{
	clearOutput();
	clearMenu();
	chiefNeykkarHeader();
	
	output("<i>“That so?”</i> you tease, tracing your fingers along Usha’s dusky cheek, until you reach one of her lush lips. She nibbles on your fingertip, staring at you with lustful, lidded eyes. That’s the stuff. You lean back against the brick wall and run your other hand over your [pc.chest], down your [pc.belly], and finally to your crotch. " + (!pc.isNude() ? " You shimmy out of your [pc.lowerGarment], letting your [pc.cockBiggest] taste the air. " : "") + "You wrap your fingers around your shaft, slowly stroking it, watching the chief’s eyes widen with desire.");
	output("\n\nYou don’t need to prompt her any further. Usha grins at you and slinks down onto her knees, resting her hands on your [pc.hips] and the [pc.cockHeadBiggest] of your dick on her glistening lips.");
	if (pc.exhibitionismRaw >= 33) output("\n\nA shiver of excitement runs up your spine. You can’t help but glance out of the alley to the bustle of people walking past. Any one of them could look your way and see what you’re doing... and you’re sure some of them must! ");
	else output("\n\nYou shudder, realizing all of a sudden that you’re only hidden by a few nearby trashcans. Anybody on the sidewalk could just look down the alley and see what the two of you are doing! ");
	output("\n\nUsha seems entirely oblivious to the potential onlookers as she flicks her tongue around your [pc.cockHeadBiggest], getting a taste of you before sliding her head down your length, taking your [pc.cockBiggest] to the base in one long bob of her head.");
	output("\n\nDamn, that’s good. You moan, gripping the sides of Usha’s head and guiding her down your shaft. Slowly at first, then faster, working with her to get her sucking your cock as hard as she can. Your [pc.hips] pump forward, slapping your [pc.knot]" + (pc.balls > 0 ? "and [pc.balls]" : "") + " against her lips and chin, letting the sounds of flesh pounding flesh echo through the alley. Her hands keep caressing your thighs, when they’re not teasing her breasts through her shirt" + (pc.balls > 0 ? "or cupping your [pc.balls]" : "") + ". Usha moans softly around her mouthful of dick, making no effort to conceal that she’s enjoying the act too.");
	output("\n\nAll you need to do now is lean back and let her work, caressing Usha’s raven hair and petting her top-ears and groaning as she milks your [pc.cockBiggest] with her throat. Thick ropes of glistening spittle bridge your [pc.knot] to her lips at the nadir of ever motion, dripping down into the valley of her cleavage as she speeds up her face-fucking. With the speed and vigor she’s working with, it doesn’t take long before the muscles in your ass and crotch tense, presaging the inevitable. Usha senses it coming, flashing you a smile and a wink with her starry blue eyes in the moment before your [pc.cockBiggest] throbs and cum, pumping [pc.cum] down her throat. ");
	if (pc.cumQ() > 1000) output("Her cheeks bloat, trying to keep up with your prodigious orgasm and failing explosively. Spunk drools out around your member, splattering her tits and the pavement beneath your [pc.feet].");
	else output("She struggles to keep up, swallowing the product of every penile pulse until your [pc.balls] " + (pc.balls > 1 ? "have" : "has") + " emptied into her stomach.");
	output("\n\nWhen you’re done, Usha lets your [pc.cockBiggest] slide out of her mouth, still dribbling and slathered with her spittle. She blinks, glances out of the alley, and flushes about as dark as you’ve ever seen her. <i>“Oh, man, what am I doing... this is your fault, making me embarrass myself like this...”</i>");
	output("\n\nShe doesn’t <i>sound</i> upset, though, and her tail is still swishing behind her. You reach down and stroke her cheek, telling her that she’s a good, dirty girl while you clean yourself up. Though blushing, Usha stands up and wipes her lips off on the back of her hand.");
	output("\n\n<i>“C’mon, let’s get back to the station. You owe me a round two,”</i> she grins, taking you by the hand and leading you back towards the shuttles...");
	
	pc.orgasm();
	pc.exhibitionism(1);
	
	processTime(15 + rand(5));
	addButton(0, "Next", sexUsha);
}

public function laterUsha():void
{
	clearOutput();
	chiefNeykkarHeader();
	
	output("<i>“On second thought, I’m liking the bar here,”</i> you tell her, taking a long draw from your drink. Usha just throws her head back and laughs, loud enough that a few patrons nearby turn and stare at her.");
	output("\n\nWhen she’s done, the leithan rubs at her upper ears and shakes her heads. <i>“Yeah-huh. It’s alright, I guess you upper-crusts are cheap by nature. ");
	if (flags["USHA_STATE"] != undefined) output("<i>“If you wanna skip the romance and just get down and dirty, I’m game. Maybe that’s more your speed!”</i> ");
	else output("<i>“So, now that that’s done, how about I buy your cheap ass a drink instead?”</i>");
	
	mainMenuUsha();
}

public function sexUsha():void
{
	clearOutput();
	clearMenu();
	chiefNeykkarHeader();
	
	moveTo("SHIP INTERIOR");
	
	if (flags["USHA_SEXED"] == undefined)
	{
		output("<i>“So, do you have a place nearby we could get away to, just the two of us? Or maybe you’d rather come back to my ship?”</i>");
		output("\n\nThe chief grins, setting her drink down and drinking you in with those big, starry eyes of hers. <i>“Thought you’d never ask. Let’s go back to your ship... my little room here’s barely big enough for " + (pc.isTaur() ? "one ‘taur" : "me") + ", let alone the two of us. Lemme just pick up our tab here...”</i>");
	}
	else
	{
		output("<i>“How ‘bout we get out of here?”</i> you suggest, giving the chief your sauciest smile.");
		output("\n\n<i>“I was hoping you’d say that,”</i> she answers, her tail thrashing against the booth. <i>“Lemme grab the tab, and then you’re all mine!”</i>");
		
	}
	output("\n\nUsha taps her Codex against a little display on the table, gives you a little nod, and stands, rising to her full amazonian height to " + (pc.tallness < 68 ? "tower over you" : "reach even your lofty stature") + ". Grinning, she " + (pc.isTaur() ? "offers you a hand, hooking her arm around yours." : "pats her flank and kneels her rearmost legs down, making a clear invitation. You saunter over and swing your [pc.leg] over her plated rear, pulling yourself up onto Usha’s back and wrapping your arms around her upper half’s slender waist.") + " The two of you trot on back towards the [PCShipName], punctuating every twist and turn of the docking arms with gropes and teases, planting kisses all along the chief’s neck and cheeks as you hold her close.");
	output("\n\nUshamee’s cheeks are flushed a sultry dark purple by the time you arrive back at your ship. Home sweet home. Her upper ears are flush with her scalp, and her long, sinuous tail swishes along the deck and entwining between her legs. Even from where you are, you can smell the slowly swelling lust emanating from the chief’s backside, hanging more heavily in the air with every step. You’re starting to love the smell of leithan-bitch arousal, and no matter how much Usha tries to hide it, her womanly musk starts suffusing the atmosphere until you, too, are as flush as your tauric companion, almost ready to tear your gear off and ravish that lush pussy of hers.");
	output("\n\nYou can’t get through the airlock quickly enough.");
	output("\n\nWhen you’re finally stumbling into your ship, you slip away from Usha, disentangling yourself from her strong arms and leading her back to your bedroom with a coy crook of your finger. Over your shoulder, you hear her husky breathing and the sound of clothes hitting the deck. Her claws clitter-clack over the deck, and you can hear her tail slapping against damn near everything that gets in range. It’s a miracle she doesn’t knock something over before you’ve finally led her into into your cabin, and the door seals closed behind you.");
	output("\n\nYou turn, and are greeted by the succulent sight of the chief standing naked before you, her dusky breasts rising and falling with steady, heavy breaths. They’re wonderfully full and heavy, and unrestrained as they are, every step the chief takes make them jiggle and bounce enticingly. You can’t help yourself but to saunter up to the big, beautiful woman and sink your hands into those melons, rolling her sin-black nipple between your fingers and cupping up the meaty mounds they capstone. Usha grins, wrapping her strong arms around your shoulders and neck, holding you close while you molest her chest.");
	output("\n\nAfter a good, long minute of you teasing her teats, Usha finally works up the willpower to put her hands on yours, guiding them off her breasts and down to her hips. <i>“Why don’t you put those hands to better use?”</i> she purrs, using her tail to fan those sweet, sweet pheromones from her drooling mare-slit. Already, you can see puddles of her excitement forming on the deck between her hind legs, adding to the musky aura of needy leithan that hangs heavily in your room.");
	output("\n\nLooks like she’s ready for you to make the first move...");
	
	//add buttons here
	if (pc.hasCock()) addButton(0, "Fuck Her", fuckUsha, undefined, "Fuck Her", "Get behind that aromatic hindquarters of hers and give the chief a good, hard plowing.");
	else addDisabledButton(0, "Fuck Her", "Fuck Her", "You must have a cock for this scene.");
	if (!pc.hasCock()) addButton(1, "Trade Oral", oralUsha, undefined, "Trade Oral", "Trade a litle oral loving with your leithan paramour.");
	else addDisabledButton(1, "Trade Oral", "Trade Oral", "You must NOT have a cock for this scene.");
	if (pc.hasCock() && pc.isTaur()) addButton(2, "Mount her", mountUsha, undefined, "Mount Her", "Thrust yourself up on Usha’s back and give her the hard, ‘taur-on-‘taur fucking she deserves!");
	else addDisabledButton(2, "Mount Her", "Mount Her", "You must be a ‘taur and have a cock for this scene.");
}

public function fuckUsha():void
{
	clearOutput();
	clearMenu();
	chiefNeykkarHeader(true);
	
	output("Leaning up and giving Usha a parting kiss on the lips, you release your grip on her and start making your way around her long, reptilian body. You trace a hand along her flanks all the way, enjoying the warmth and smoothness of armored plates, until you finally reach her rump and give it a sharp but playful spank. Usha gasps and canters forward, grabbing the footposts of your bed to steady herself. Whether by intent or by fuck-hungry instinct, her tail curls up over her back, baring everything she’s got.");
	output("\n\nYou drink deep of her needy scent, finding yourself staring down the gulf between a pair of slick, thick black lips. Her sex is almost pear-shaped, narrowing around the hood of a broad, black clitoris, and drawing your eyes upwards to a sinfully dark, silky-soft looking donut ring above it.");
	output("\n\nDrawn forward by your mounting desires and the intoxicatingly alien appearance of the leithan’s sex, you grasp at her broad flanks and pull your face in close enough to run your tongue experimentally around one of her dark pussy-lips. The taste is otherworldly, rich and earthy and so thick that your [pc.tongue] comes away bridged by a thick rope of slime. The Chief moans throatily, her six legs buckling underneath her. " + (pc.tallness < 8*12 ? "She slinks down onto her knees to give you better access to her titanic rump, putting it right about on crotch level with you. " : "Thanks to your immense height, the towering taur is just the perfect height for you to fuck.") + "");
	output("\n\n<i>“Come on, don’t be a fucking tease,”</i> your leithan lover huffs from what feels like a mile away. Tough as she might be, you can definitely hear the whimper of pleasure she’s trying to hold back as your tongue plays around in her vaguely-equine sex. Her tail weakly swats at your cheek, not quite enough to really sting. <i>“I can’t do anything from up here, you ass. If you’re gonna make this all foreplay, come back around or something!”</i>");
	output("\n\nIf you didn’t know any better, you’d say she sounds awfully self-conscious about being the only one getting off at the moment. Grinning to yourself behind the shielding mass of leithan butt, you flick your tongue back out across the Chief’s black sex, adding a couple of fingers to the mix and probing knuckle-deep into her drooling slit. She grunts, stamps her legs, and flicks her tail at you some more, but ultimately her protestations give way to moans and gasps of pleasure. Her pussy winks at you, clenching around what it desperately wishes was a huge, throbbing leithan erection spearing it. Instead, all you give it are progressively more fingers, adding on until your whole fist is pulling her womanhood open -- and even that feels like it pales in comparison to the kinds of meat this buxom beauty was made to take!");
	
	//BIG OL DICK PATH
	if (pc.biggestCockLength() >= 24)
	{
		if (pc.biggestCockLength() >= 36) output("\n\nWell, you’ll give her a run for her money! As monstrously hung as you are, even a mighty leithan’s quim is barely enough to contain your manhood. You have every intention of leaving her a gaped, orgasming mess by the time you’re done!");
		else output("\n\nShe looks like a perfect fit for someone as ludicriously endowed as you!");
		output("\n\nWhen it’s all said and done, the opportunity to slam your [pc.cockBiggest] into a leithan’s wet-and-ready pussy sends a thrill through you: finally, someone who can actually take all of your incredible length! No more bottoming out in a girl after just the tip, oh no. Leithans are built to take ‘em, and considering Usha’s a big girl even among her own towering kind, you’re sure that horsebutt of hers can take all you’ve got to offer!");
		output("\n\nLicking your lips with anticipation, you shuck your remaining gear and grab your [pc.cockBiggest], pumping the meaty shaft to full mast with Usha watching you over her shoulder every step of the way. Her eyes widen with what you assume to be animalistic lust as she’s shown the full extent of what you’re packing.");
		if (pc.biggestCockLength() >= 36)
		{
			output("\n\n<i>“Holy shit,”</i> she gasps as you swing your mammoth erection to bear on her cunny, dropping the [pc.cockHeadBiggest] to rest right on the lips of her black quim. <i>“What kind of cock-drugs have you been taking!?”</i>");
			output("\n\n<i>“The kind that make you perfect for pounding naughty leithans into the ground,”</i> you answer with a smirk.");
		}
		else
		{
			output("\n\n<i>“Woah,”</i> the Chief says, eyeing you with clear appreciation. <i>“Never would have expected something like that on " + (pc.tallness <= 72 ? "a little thing like you." : "anybody but a leithan!") + "”</i>");
			output("\n\nYou grin with the raw compliment on your immense physique, even as you’re busy hefting your member up and aligning it with the leithan’s black slit.");
		}
		output("\n\n<i>“Ready?”</i> you ask, stirring your cockhead around in the musky swamp of Usha’s horsecunt.");
		output("\n\nShe shivers visibly, locking her fingers around the big, dark mounds of her pornstar’s rack, nodding hurriedly over her shoulder. <i>“Q-quit pussyfooting and put it in already!”</i>");
		output("\n\nWell, if that’s what she wants! You reach forward, digging your fingers into the amazon’s plated flanks and use them like anchors to pull yourself in. Inch by inch, your [pc.cockBiggest] sinks into the silken slit of Usha’s quim, spreading the slick, hot walls wide open around your animalistic girth. The sheer force of your entry, even as slow as it is, makes the Chief gasp and stagger forward. Her forelegs give out, and her upper body collapses onto your bed. She grabs her own tits and starts playing with them, wrestling for some control of the pleasure she’s getting while you steadily fuck your way into the steamy embrace of her quim.");
		output("\n\n<i>“O-oh <b>fuck!</b>”</i> she cries out, clawing her fingers into your blanket. <i>“S-so big... take it slow!”</i>");
		output("\n\nYou can’t go much slower, unless she wants you to cum before you’re half way in. Then again, the way her pussy’s clenching and squirting around your shaft, something tells you she doesn’t <i>want</i> you to slow down. Quite the opposite. Giving her a reassuring rub on the haunch, you allow the buxom amazon a second of stillness to adjust to your pussy-stretching presence... before you grab two handfuls of ass and ram yourself in to the hilt.");
		output("\n\n<i>“Gah!”</i> she screams, knees buckling. She staggers, groping helplessly at the blankets until she’s slinking onto her forelegs’ knees, body still rocking with the ecstatic shockwaves of your surprise attack. You can’t help but appreciate the way her big tits spread out like clay on the bed, and the spastic way her twat squeezes and cums around your shaft, spraying your thighs with thick, musky leithan fem-cum. <i>“B-" + (pc.isMale() ? "bastard" : "bitch") + "! I said-”</i>");
		output("\n\nYou shush her, affectionately rubbing her up-raised rump. Her tail weakly swats at your face, trying to punish you for taking her down like that... but ending up just caressing your cheek like a lover’s tender hand. With your cock buried to the hilt in her gaping twat and your hands sensuously massaging her broad behind, Usha can’t seem to muster the will to do anything more but moan and grope at her chest -- she can’t even get up! Considering the way her body’s still clenching like mad around your member, you can clearly see just how weak-kneed you’ve made her with one thrust!");
		output("\n\nNow that she’s down on the deck, ass in the air and wetter than a whole gang of ausar cum-sluts, you can finally go to work. Still squeezing and caressing her horse-like ass, you gingerly rock your entire body back, hips and all, to drag your behemoth cock back through her slick passage. The lusty leithan moans ecstatically, squirting even more girl-juice around your shaft to ease your movements. She’s a veritable lube-factory back here, so wet that you’re practically sliding right out of her, as far as the awkward angle can take you, before hammering back home.");
		output("\n\nThe first few thrusts like that make Usha scream a mix of profanities and condemnations that only a star-sailor like her could come up with, but that’s just a passing phase; her body completely betrays her, convincing you of her absolute enjoyment by treating your cock like a king inside her, caressing and squeezing it in her lube-bath slit like nothing you’ve felt before. So you fuck her harder, steadily picking up speed until you’re baring down on the prostrate leithan, fingers dug into her hips and pounding away.");
		output("\n\n<i>“Oh fuck! Oh fuckohfuckohfuck!”</i> she screams, flailing her tail and scrambling her legs weakly on the ground as you hammer her cunt amid a geyser of juices. <i>“H-Harder! Faster! Don’t let up!”</i>");
		output("\n\nNow that’s what you like to hear. You give her a smart smack on the ass for good measure, keeping her embroiled in pleasurable sensation while you fuck the eager cock-sleeve you’ve made. Usha’s pussy feels absolute tailor-made for your [pc.cockBiggest], conforming to its every ridge and contour like a glove as its owner squeezes you again and again, rhythmically massaging your entire shaft from crown to base.");
		output("\n\nThe way she’s treating your prick, it’s not long before you feel the inevitable, wonderful pressure start churning in your [pc.balls]. You grunt, trying to hold it back, to take every second of ecstasy you can from the perfect pussy between the chief’s ample haunches, but your baser side simply won’t be denied.");
		output("\n\n<i>“Gonna-”</i> you manage to grunt out between gritted teeth. Usha gasps, suddenly squirming under you, but your lusts take full control. You slam your hips against her ass, burying yourself to the hilt and leaving her a cumming mess on the floor for you to pump full of [pc.cum]. She lets out an orgiastic cry of pleasure as your [pc.cockBiggest] throbs and spurts, letting loose a thoroughly-milked load of [pc.cumNoun] deep into her womb.");
		output("\n\nWhen the orgasm passes, Usha’s left panting, gasping for breath, resting her bunny-eared head on the bed while you pump her sodden slit full of cum. Her chest heaves, making those amazing tits of hers jiggle and quake with every breath, and her twat is a waterfall of lurid juices even before you finally pull out of her, unleashing a waterfall of spooge.");
		if (pc.leithanScore() >= 3) output("\n\n<i>“W-what did... ugh,”</i> the chief finally manages to say when you’re thoroughly-spent cock flops out of her gaping slit. A rush of [pc.cumNoun] comes with it, splattering in thick clumps across the deck. <i>“Gimme some warning next time... should really ask before you dump a load in a girl like that!”</i> ");
		else
		{
			output("\n\n<i>“Ugh,”</i> the chief finally manages to say when you’re thoroughly-spent cock flops out of her gaping slit. A rush of [pc.cumNoun] comes with it, splattering in thick clumps across the deck. <i>“I’m gonna be leaking your load all day, aren’t I?”</i>");
			output("\n\nConsidering that from where you’re standing, her backside looks like she just took a kui-tan cumbath... yeah, pretty much.");
		}
		output("\n\nShe huffs, slowly staggering up onto all sixes. When she does, the real result of your lusty interlude cums rushing out of her wide-open sex, all but pouring back onto the deck. She blushes darkly, biting her lip as her thick slit discharges the leftovers of your fucking... though you know that there’s still plenty left inside, sloshing around in her slippery channel.");
		output("\n\n<i>“Shut up,”</i> she snaps, even though you’ve not said a word. Still, her tail curls around your shoulders, giving you an affectionate squeeze while her pussy slowly leaks the lion’s share of your mixed juices back out, smearing her thighs with a murky [pc.cumColor] glaze.");
		output("\n\nEventually, Usha releases you, walks over to the side of your bed, and folds her legs underneath her body, putting her almost at the perfect height for her to roll onto her side and lay her humanoid half into your bed.");
		output("\n\nAfter a long, quiet moment, she finally calls over <i>“You coming or what?”</i>");
		output("\n\nYou grin to yourself and saunter over to the bed, sliding in behind Usha and snuggling up to the big amazon’s muscular back. One of your arms wraps around her, hand settling on one of the leithan’s sweat-slicked breasts.");
		output("\n\nHer tail curls around, caress your [pc.leg]. <i>“I’ll be out of your hair in... in a little bit...”</i> she yawns.");
		output("\n\nYeah, yeah. It isn’t long before she’s fast asleep, and you’re not far behind...");
		
		if (flags["USHA_VAG"] == undefined) flags["USHA_VAG"] = 0;
		flags["USHA_VAG"] += 1;
		
		pc.orgasm();
		addButton(0, "Next", sexMerge);
	}
	//NOT QUITE BIG OL’ DICK PATH
	else
	{
		output("\n\nThere’s no way you’re going to be able to fill that pussy. ");
		if (pc.biggestCockLength() >= 6) output("You’re not small by any means, but the Chief’s hole is so wide-open and cock-hungry that you doubt you’d be able to touch more than one wall at a time! ");
		else output("Your comparatively tiny cock would barely feel like more than a finger for her, and you’d be tossing a hotdog down a hallway for your own pleasure! ");
		output("So you turn your sights elsewhere, tracing your gaze up her powerhouse of a rear. As much as her slavering pussy might try to draw your attention back, you find yourself more and more fixated on the puffy black ring riding above it. ");
		if (flags["USHA_BUMLOVE"] == undefined) output("\n\n<i>“H-hey! What’re you-”</i> Usha gasps as you trace a finger around her pucker. <i>“That’s...”</i>");
		else output("\n\n<i>“G-going back there again, huh?”</i> Usha grunts as you start to tease the rim of her ass. <i>“Who said you could-”</i>");
		output("\n\nYou cut her off by sliding a finger in, spreading out the clenching little hole. It’s nice and tight, feeling about as stretchy and accommodating as a human pussy -- a much better fit for you than the gaping slit beneath it. Her butt squeezes gently around your finger, massaging you like a hot, silky glove. Usha grunts uncomfortably at first, but the way she bites her lip and scrapes her feet along the deck, you don’t doubt she enjoys a little anal play.");
		output("\n\nPulling your digit out, you toss aside what gear you’ve still got on, grabbing your [pc.cockBiggest] and moving your [pc.hips] in line with the leithan’s own. Her tail lifts and curls around your waist, locking you tight against her and pulling you in until your [pc.cockHeadBiggest] is pushing against the silken-soft donut of her ass.");
		output("\n\n<i>“Just take it gentle back there,”</i> Usha finally sighs, trying to relax her clenching muscles. <i>“I don’t wanna be walkin’ funny when you’re done!”</i>");
		output("\n\nYou promise you’ll be the perfect gentle" + (pc.isMale() ? "" : "wo") + "man with her ass as you start to softly grind your hips in. Usha gasps and clutches at her tits, biting hard on her lip to suppress what you imagine to be a hell of a moan. For your part, you grunt and gasp as your [pc.cockBiggest] is slowly submerged into the puffy black ring and the softly roiling heat inside.");
		output("\n\nThe pressure is incredible, crushing down on you with all the might the titanic amazon to be able to muster. She’s not inherently all that tight, but her musculature is incredible -- even back here! Still, you’re able to make slow but steady progress against the leithan’s instinctive attempts to push you out. You’d worry you’re doing something wrong, if that juicy cunny of hers wasn’t splattering your thighs with fem-slime while she pinches her big black nipples and uses her tail to hold you close. It takes what feels like an eternity -- and agonizingly pleasurable eternity -- before you’re fully buried inside her, probing her colon with your cockhead.");
		output("\n\nAfter a few moments, Usha finally relaxes enough for you to try and move. You know to take it nice and easy with her, gently rocking your hips back and forth and letting the steamy embrace of leithan ass work wonders on your dick. The way her muscles contract and squeeze with every inch you move is heavenly, a sure sign of her own enjoyment. Usha lets out a sultry moan, groping at her massive tits and pushing back against your thrusts with steadily growing fervor. A few moments of that treatment, and you’re not sure who’s fucking who anymore: she’s got you grabbed firm, holding you right where she wants to with her tail while her mighty tauric frame pounds back against your [pc.cockBiggest], taking it to the hilt with ease again and again.");
		output("\n\nResigning yourself to your fate, you hook your fingers into the Chief’s plated flanks and hold on as the leithan butt-slut takes you for a ride!");
		output("\n\n<i>“D-didn’t I say to take it easy!?”</i> she grunts over her shoulder, even as she’s pinching a black nipple and using four of her legs to pump her ass back against you. <i>“Can’t believe I’m... ahhh... letting you...”</i>");
		output("\n\n" + (pc.isAss() ? "<i>“Oh, give it up already!”</i> you snap back, slapping the amazon right on her rump. <i>“You love it!”</i> " : "<i>“Yeah, yeah,”</i> you moan through gritted teeth, trying not to let the vice-like grip of her backdoor just milk you to orgasm right then and there. ") + "For someone claiming to be an anal novice, Usha’s definitely got some serious talent back there! She huffs at you, feigning offense, but a thrust of your [pc.hips] that drives your [pc.cockBiggest] " + (pc.balls > 0 ? "balls-" : "") + "deep turns her voice into a whining moan of pleasure.");
		output("\n\nUsha’s clawed little feet scrape heavily against the deck, grinding her brick house of a behind against you just as hard as you’d imagine a creature as huge as she is would. Her pussy is a veritable furnace, rubbing ceaselessly " + (pc.balls > 0 ? "against your churning balls" : "against your thighs") + " and smearing you with a growing coat of musky leithan excitement. Her tail squeezes you tight, never letting you do much more than move your own hips against hers, doubling the speed of her anal violation. Her former protestations have long since faded away, replaced by grunts of approval, then cries of your name and how much she wants you to fuck her harder, faster, deeper.");
		output("\n\n<i>“Keep it up, Steele,”</i> she all but screams, throwing her head back and stamping her powerful legs. <i>“You’re finally... finally making this feel pretty good!”</i>");
		output("\n\n<i>“Is that all?”</i> you quip, reaching a hand down and shoving a few fingers effortlessly into her equine-like quim.");
		output("\n\nShe shrieks, fingers disappearing into the yielding flesh of her chest as she succumbs to the sudden pleasure. <i>“Fine! It’s fucking great!”</i> she growls, moving a little faster. You shove your arm deeper, going full-fist into her silken slit. <i>“Better than great! Amazing!”</i>");
		output("\n\nYou grin, trying to ignore how close you are to climax. Something inside you demands you make sure the amazon orgasm first, to make her eat her words about this being the wrong way. Then again, the way she’s moaning and gushing slime all over your crotch from her gaping pussy, you don’t think she’s got much resistance left. All there’s left to do, really, is hold out longer than she can: fight back your basest desires and hammer yourself deep inside.");
		
		addButton(0, "Next", fuckUshaBumPart2);
	}
}

public function fuckUshaBumPart2():void
{
	clearOutput();
	clearMenu();
	chiefNeykkarHeader(true);
	
	output("The next few seconds stretch out like an eternity -- a lifetime spent indulging in unspeakable pleasures of the flesh that have your whole body on edge, tingling with the pent-up need to spill your seed into the welcoming embrace of the leithan’s bowels. Finally, though, Usha lets out a shrill scream and her pussy clenches hard around your fist, drawing your [pc.arm] deeper and deeper in with its sudden, violent contractions. At the same time, her dark asshole gives you a firm but surprisingly gentle squeeze, a mere echo of the tumultuous chaos that’s going on between her legs. But it’s enough -- more than enough by a Jovian mile -- to pull you over the edge with her.");
	output("\n\nYou cum. Not a gentle, loving climax, but a violent eruption of pent-up [pc.cum] that seems to tear its way out of your fatigued body. You can’t even manage a scream, not even a grunt of effort, just a silent gasp of pleasure as you’re drawn as deep into the cock-hungry leithan as you’ve ever been and forced to plaster her silken insides with every last drop of [pc.cum] you have to your name.");
	output("\n\n<i>“Oh, <b>fuck!</b>”</i> Usha grunts, even as you’re still spasming and squirting the aftershots of your orgasm " + Math.floor(pc.biggestCockLength()) + " inches deep inside her ass. <i>“Fuck, Steele... that was... you were...”</i>");
	output("\n\nYou manage a ragged groan, gradually realizing that at some point in the proceedings the chief’s cantered back had slammed you against a bulkhead, crushing you between her massive body and the unyielding steel. Every bone in your body starts feeling sore a moment later, like you’ve been running track for ten hours straight.");
	output("\n\nEither not noticing, or not acknowledging, your condition, the Chief unfurls her tail and steps forward, leaving you to support yourself for the first time in what might have been several minutes. You almost collapse, only keeping upright by grabbing two big handfuls of leithan rump. She gasps, glancing over her shoulder with a noticeable dark-grey flush on her cheeks. You glance down, and see that your unintended grope has somehow massaged a nice, thick, [pc.cumColor] trickle to come out of her black donut, dripping viscously to the floor.");
	if (flags["USHA_BUMLOVE"] == undefined)
	{
		output("\n\n<i>“Unf. I hope you’re proud of yourself, Steele,”</i> she says with a roll of her starry eyes. <i>“Taking a poor girl’s anal virginity like that... and somehow I think I’ll be feeling your load slipping around back there all day! You’re lucky that felt so good, or I might just make you clean it up!”</i>");
		output("\n\nSomehow, you don’t doubt it.");
		output("\n\nWearily, you persuade your fingers to release the Chief’s ass and start fumbling for your gear. While you’re catching your breath, your newly-christen lover canters around and grabs you by the shoulders. You look up just in time to get your face mashed between the biggest, softest pair of tits you’ve seen in what feels like an eternity.");
		output("\n\n<i>“That wasn’t half bad,”</i> she admits, planting a kiss on your forehead.");
	}
	else
	{
		output("\n\n<i>“What did I say about gentle?”</i> the amazon huffs, trying to sound annoyed even as she’d dripping a mix of your cum and hers all over her thighs. <i>“Ought to keep you pinned to that bulkhead until you’ve cleaned up this mess with your tongue.”</i>");
		output("\n\nYou roll your eyes, letting her pretend to be all tough and put out about the whole thing. Whatever makes her happy. Still and all, after a few moments of awkward silence, you’re treated to a busty hug from the towering hunk of leithan.");
		output("\n\n<i>“You’re lucky I’m starting to like it rough,”</i> she chuckles.");
	}
	output("\n\nUsha runs a hand across your [pc.hair], finally letting you come up for breath out of her tits. When she lets you go, the big leithan canters around and goes over to your bed, folding her legs underneath her body beside it. She’s almost at the perfect height for her to roll onto her side and lay her humanoid half into your bed.");
	output("\n\nAfter a long, quiet moment, she finally calls over <i>“You coming or what?”</i>");
	output("\n\nYou grin to yourself and saunter over to the bed, sliding in behind Usha and snuggling up to the big amazon’s muscular back. One of your arms wraps around her, hand settling on one of the leithan’s sweat-slicked breasts.");
	output("\n\nHer tail curls around, caress your [pc.leg]. <i>“I’ll be out of your hair in... in a little bit...”</i> she yawns.");
	output("\n\nYeah, yeah. It isn’t long before she’s fast asleep, and you’re not far behind...");

	IncrementFlag("USHA_BUMLOVE");
	
	pc.orgasm();
	
	addButton(0, "Next", sexMerge);
}

public function oralUsha():void
{
	clearOutput();
	clearMenu();
	chiefNeykkarHeader(true);
	
	//99999
	if (pc.leithanScore() >= 3) output("There’s no more awkward couple than lesbian leithans, but you’re going to give it a shot.\n\n");
	output("Slipping out of Usha’s arms, you start to walk around her lengthy frame, brushing your hands along her scales and armored plates as you go. She follows you with her eyes for a while, craning her neck until you’re right behind her. <i>“Hey, why don’t you let me-”</i> she starts to say, right up until your eyes settle on the puffy black lips of her pussy; you just can’t resist the urge to slip a finger right in. She gasps, scratching her clawed feet on the deck and instinctively bucking back against your hand.");
	output("\n\nYou smirk, positioning yourself directly behind the towering titan of a woman and slinking down on your [pc.knees], putting your [pc.face] so close to the teardrop-shaped slit that your nose brushes against the swollen black clit sitting proudly at its top. Usha’s whole sex winks at you when you do, giving you a first-hand show of her dusky lips and the lush pink flesh inside them. It’s hard not to just dive into the perfect, equine sex on offer, but you restrain yourself -- a pussy this luscious, this wet and ready for you, needs to be handled with a gentle touch. At least, at first -- you’ve got every intention of making Usha scream before too long!");
	output("\n\n<i>“What, did you fall in back there?”</i> your lover grunts, putting her hands on her hips. <i>“Don’t be a tease. Get going already!”</i>");
	output("\n\nYou answer her with a firm but gentle grope of her ass, digging your fingers into the soft flesh right where her flank’s armor ends. She sucks in a sharp breath, tail swinging with surprise. That quiets her long enough for you to finally bring your hands to bear on her thick pussylips, using your thumbs to pull the pair apart and reveal the deep, wet hole they hide. You " + (flags["USHA_VAG"] == undefined ? "can only imagine" : "know full well") + " how much cock a woman like her could take, with a body as long as hers and a slit this big and welcoming. She’d be a perfect match for any " + (flags["SEEN_TEXAS_SURFACE"] == undefined ? "ultraporn stud" : "New Texas bull") + ", not to mention the leithan boys that must line up around the block for a chance to sink themselves into a pretty quim like this.");
	output("\n\nSlowly drawing yourself back to the present, you manage to stop admiring the Chief’s twat long enough to lean in and flick your [pc.tongue] out across its thick, meaty lips. You trace a circle from bottom to top, stopping to lick and kiss around the thumb-sized bud of her clit, and back down again. You can feel its owner shiver, barely holding back a moan, and are quickly treated to your first thick, earthy taste of leithan excitement. The taste sends your heart aflutter in your chest, and moreover, compels you to keep licking deeper and deeper, munching your way right into the sodden embrace of the horsecunt before you. Regardless of how utterly smeared your face gets, you push yourself deeper, caressing every last inch of the Chief’s tender slit you can possibly reach.");
	output("\n\n<i>“Gah! W-what’re you...”</i> she starts to whine, pushing her rump back against your face hard enough that you’re afraid you might actually pop your head right into her! <i>“Ah, that feels amazing.”</i>");
	output("\n\nYou bet it does, if how positively drenched you’re getting is any indication. Maybe you’re the first person to ever slow down and take it nice and gentle with this pretty slit? That, or she’s way more sensitive than a big, tough amazon like her has any business being!");
	output("\n\nThe way you’ve got her moaning and leaking, shivering and groping at her big ol’ tits... it all only serves to make you hornier; ready to fuck this stallion of a woman, hard and sloppy until you’re both a mess. But the way your bodies are arranged just won’t let it be, so you content yourself with the surety that if she likes what you’re doing this much, you’re sure to give her the orgasm of a lifetime.");
	output("\n\nPulling your face back and coming up for air, you wipe away some of the thick slime that’s built up on your [pc.lips] before planting your soggy hands on her flanks, staring down her pussy one last time before you get to see it split open. It’s so perfect, so dark and meaty and heavenly-smelling... you almost hate to defile it. With a nod of affirmation to yourself, you clench your hand into a duck-bill shape and plant your fingertips between the leithan’s lips.");
	output("\n\n<i>“Wait! Let me-”</i> she starts saying, trailing off into a cry of pleasure as you slide your arm forward. Her pussylips part like silken curtains, gently hugging your wrist as you spear her sex. Even her gasp of pleasure fades into a wordless, almost soundless moan the deeper you go, further and further into the clenching embrace of her sex until you’re pressing your shoulder into the Chief’s ass and still not finding bottom!");
	output("\n\nFrom what sounds like a mile away, you can vaguely hear the Chief trying to form words -- and failing, descending into blubbering little moans of pleasure when you ball your fingers up into a fist, stretching her out just as wide as a proper leithan’s cock, and maybe just as deep. The sudden motion is rewarded by a trickle of sweet, sweet slime drooling out around your arm, splattering your [pc.legs] and the deck below you. She’s starting to form a puddle down there, basting her back pair of feet in her own juices!");
	output("\n\nAnd all that just from the first push? You grin wickedly to yourself as you start to pull your arm back -- just a foot at first, before pile-driving it back home again. The tauric beauty over you cries out again, grabbing helplessly at her tits as you start to assault her juicy pussy harder and harder. Before long you’re practically punching her, driving your lubed-up fist shoulder-deep again and again, over and over until she’s screaming in pleasure and cumming her brains out in a shower of thick fem-cum. You turn your face away just in time to avoid the worst of the blast, but there’s no you can avoid getting positively covered in Usha’s fragrance now!");
	output("\n\nYour lusts only drive you more wild after that, prompting you to just keep pounding away through the Chief’s body-rocking orgasm, loving the way her silky channel clenches and grabs at you, trying to milk your arm like a proper cock. If you were " + (pc.isMale() ? "properly equipped" : "a boy") + ", you’ve got no doubt you’d be blowing your load right about now, pumping the needy amazon full of your [pc.cumNoun]. And you’re equally sure she’d love every drop, if her greedy pussy is any indication.");
	output("\n\nA few more minutes of your vigorous fist-fucking has Usha barely hanging on, knees wobbling and chest heaving, collapsed on your bed. She’s like a desperate slut now, with her ass in the air for you while she cums again and again. The last of her haughty restraint evaporates with a cute little whine and Usha collapses onto her front two knees, leaning against the wall and letting you do with her what you please. Though most of your vision is blocked by the leithan’s titanic ass, you make sure to glance around her flanks to take in the way her pillowy breasts spill like putty against bed, huge and soft and easily shaped by the way her chest presses against it. Mmm, you’re suddenly tempted to give up this assault to go play with those beauties... with nipples as big and hard as hers, you know they’ve got to be so sensitive you could have her cumming again just from playing with them.");
	output("\n\nIn fact, the way your loins are flaring with needy desire... you might have to do just that! As much as getting the chief on her knees in a fuck-hungry mess is fulfilling some deep fantasies, she can’t really return the favor from back here. Resigning yourself to the fact, you pound one more orgasm out of Usha, eliciting a wail of overbearing pleasure from her now-hoarse throat before you stumble back, getting your arm free of her silken embrace.");
	
	addButton(0, "Next", oralUsha2);
}

public function oralUsha2():void
{
	clearOutput();
	clearMenu();
	chiefNeykkarHeader(true);
	
	output("The moment you do, an absolute flood of fem-cum comes pouring out; easily a gallon of thick lube splatters all over the deck, drenching Usha’s hindquarters and your [pc.legs]. You blink in surprise at just how wet the Chief’s gotten -- leithan-on-leithan fucking must be brutal if they need that much lube!");
	output("\n\n<i>“Oh. Ohhhh wow,”</i> Usha manages to moan out, still slumped against the bed. <i>“That was... you’re an animal, Steele! Nobody’s ever fucked me like " + (flags["USHA_ORAL"] == undefined ? "that before" : "you do") + "!”</i>");
	output("\n\nYou’re sure of that much, at least. Giving her a pat on the behind, you make your way back around to her front, just as she’s mustering up the strength to pull her head back from its rest.");
	output("\n\nAnd right into your [pc.vagOrAss], presented for her inspection. You flash her a grin, wiggling your hips and bracing your hands against the footboard, all but thrusting your [pc.butt] in her face. Usha splutters and leans back on herself, grabbing your [pc.hips] to keep you from pursuing her.");
	output("\n\n<i>“Just... just gimme a second here,”</i> she groans, still breathing hard. <i>“I’d almost forgotten...”</i>");
	output("\n\nAlmost forgotten you? Tsk, she should have known better: no way she’s getting to cum like that without returning the favor! Ushamee gives you the closest thing she can to a scowl -- really more of a lusty pout -- and adjusts her grip on you so that her thumbs are on your ass-cheeks, pulling them apart to show off your [pc.vagOrAss].");
	output("\n\n<i>“Fine. Just... don’t expect much. I’m still new to handling anything other than a dick.”</i>");
	output("\n\nYou assure her that she’ll do fine, if she starts with a few loving little licks...");
	output("\n\n<i>“Does that mean I get to shove my fist up there after?”</i> she huffs before leaning in and giving you an experimental lick. A shudder of pleasure rocks you, following by a spreading tingle of excitement as Usha starts to explore your body with her mouth and hands. She’s as gentle as... well, not a nine-foot amazon, that’s for sure... as she caresses your hole and the surrounding flesh with her tongue, using her hands to massage and squeeze your [pc.butt], keeping you nice and spread out for her. For someone claiming no experience, she knows how to make you feel like you’re floating on a cloud of lust.");
	output("\n\nA solid minute of her oral treatment has you gasping, clawing at the board with your nails and desperate for more. Another minute, and she’s got you begging for it, bucking your hips against her face to try and persuade her to push forward. But she doesn’t, seemingly content to just tease around your [pc.vagOrAss] and never go further. At least, not until you’re almost as much of a mess as she was, barely able to keep standing with the way your [pc.legs] are wobbling.");
	output("\n\nOnly when she’s exacted a suitable vengeance for the way you surprise-fisted her does the Chief finally push her tongue forward into your desperate hole. Your body opens up for her without a hint of hesitation or resistance, not in the state you’re in. You just relax your [pc.vagOrAss] and let her slither inch after inch of alien tongue into your lusty body to play around in your over-sensitive passage. She licks all around your insides, too, slathering your walls with spit even as her lips are passionately kissing your" + (pc.hasVagina() ? "s" : " ass") + ".");
	output("\n\nAnd just like that, you feel all the fight go out of your body, completely surrendering to the amazon’s oral assault. Your [pc.legs] buckle, but as strong as she is, she easily supports you right where you stand, taking your weight on her hands and face. All you can do is grind your [pc.hips] against lush lips, letting yourself be carried to orgasm in the amazon’s arms.");
	output("\n\nWhen your climax arrives, it comes hard. A sudden and explosive release that’s been pent up for what feels like an eternity comes crashing down on you in cascades of roiling, mind-melting pleasure. Usha keeps her tongue going the whole time, massaging your spasming insides until with a final, shuddering gasp, you fall back into her arms in utter contentment.");
	output("\n\n<i>“Could have been worse,”</i> she chuckles, catching your head in her pillowy tits. With no deadly danger hanging over your heads this time, you snuggle back against the leithan’s chest, letting yourselves catch your breath in each other’s arms...");
	
	IncrementFlag("USHA_ORAL");
	
	pc.orgasm();
	
	addButton(0, "Next", sexMerge);
}
public function mountUsha():void
{
	clearOutput();
	clearMenu();
	chiefNeykkarHeader(true);
	
	if(pc.originalRace == "half-leithan") output("You were born for this, to mount luscious beauties like Usha and drive your [pc.cockBiggest] deep into their slavering, hungry wombs. ");
	else output("You’ve long since changed yourself into the perfect form for just this occasion, ready and eager to thrust yourself deep inside this leithan beauty to spear her womb and flood it with your " + (pc.hasPerk("Potent") ? "potent " : "") + "seed. ");
	output("You canter around the chief’s tauric body, caressing the black and yellow leithan chitin of her flanks.");
	output("\n\nYour eyes are inevitably drawn to the lush black lips of her sex and the dark donut above it. Usha’s pussy is nice and wide, perfectly tear-drop shaped and smeared with slimy, sweet-smelling leithan arousal. You drink the smell in, letting it burn into your mind and set your heart ablaze. Blushing over her shoulder, Usha curls her tail up and over her back, completely exposing herself to you, making way for your manhood. Before the fun starts, though, you can’t help but reach down and give her rump an appreciative grope, brushing your fingers along the thick black lips of her sex.");
	output("\n\nShe gasps, and your fingers come away smeared with slime that bridges their tips to the chief’s pussy. You lick your fingers clean, getting a taste for the thick, rich lubricant the amazonian warrior is swamped with. <i>“Stop perving out!”</i> Usha snaps, whacking your hand with her tail. <i>“I’m ready for you, damn it!”</i>");
	output("\n\n<i>“Alright, alright,”</i> you answer, rubbing your wrist. While she recovers, you shake your hips, making your dick bob below your lower body, just out of reach. You can feel just how hard you are, with the pillar of turgid meat slapping against your [pc.belly]. Usha curls her tail back out of the way and wiggles her hips enticingly, giving you the last bit of motivation you need. You step back, aligning yourself with the leithan’s hindquarters, and take a running lunge up onto her. She yelps, knees buckling and hands grasping at the bed as your bestial weight settles atop her, [pc.legs] grasping at her toned flanks and [pc.chest] pushing against her back.");
	output("\n\nUsha’s feet scramble on the deck, bucking under your massive weight. <i>“O-oh <b>fuck</b>!”</i> she gasps, feeling your tumescent manhood prodding blindly at her silken slit. <i>“I feel it! I feel-”</i>");
	output("\n\nHer words twist into a roar of pleasure as your [pc.cockBiggest] finds its mark, ramming into the sodden channel between her legs. Your lover’s pussy grasps hard around your spearing length, like a hot silk glove giving you a handy every inch of the way until you’re utterly buried inside her" + (pc.balls > 0 ? " and your [pc.balls] are bouncing on her rump" : "") + ". Her tail curls around one of your [pc.legs], pulling you as close against herself as she can while juices pour like a waterfall around your shaft. Damn, but she was ready for this!");
	output("\n\nYou grab a handful of tit and squeeze, making her clench down all the harder on your [pc.cockBiggest]. Her back arches against your [pc.chest], hands desperately grabbing at your human half’s hips and your own hands, trying to find something to hold on to while you hammer your [pc.hips] against her plated ass, pounding in that amazonian cunny. The sheer force of your fucking sends the pair of you staggering around the cabin, pushed Usha’s chest against one of the bulkheads and spreading her malleable tits out in a lake of quaking grey flesh.");
	output("\n\nThe sight of her body bouncing against the wall, feeling her breasts flow like dough through your fingers and her velvety pussy squeeze you so tightly... it all combines to drive you absolutely wild with lust. It isn’t long before you feel the rush of need building in your loins, the insatiable desire for release -- the absolute biological imperative to spill your seed into Usha’s eager womb.");
	output("\n\nBy the way her cunt is contracting and splattering the deck with fem-spunk, she’s clearly ready for you; your [pc.balls] churn" + ( pc.balls > 1? "" : "s") + " in answer, swelling with rising orgasm. The bliss of climax burns through you, raging in your loins until you can contain it no longer. With a feral roar, you slam your [pc.hips] flush with the chief’s mighty rump, burying your [pc.cockBiggest] as deep as you can into the leithan’s silken cunny before you bust your nut and flood her womb with [pc.cumNoun].");
	output("\n\nUsha screams as the first gush of steaming hot [pc.cumNoun] bastes her insides. " + (pc.leithanScore() >= 3 ? "<i>“D-did you...”</i> she whines, shuddering as you just keep pouring cum into her. <i>“Asshole! You’re lucky I’m not in heat!”</i>" : "<i>“Ugh,”</i> she grunts, shivering in a way that makes her tits positively quake in your hands while you dump spunk into her. <i>“Dammit. You could at least ask before you bust a nut in a girl!”</i>") + "");
	output("\n\nShe tries to glare at you over her shoulder, but one good squeeze of her bust turns her look into a lustful moan and a final clench around your member. Her cheeks are still nice and flushed by the time your softening member droops out of her, unleashing a small flood of your mixed juices. You give Usha’s supple flanks a parting squeeze with your lower legs before skittering back and dropping onto the deck with a mighty <i>THUNK</i>.");
	output("\n\nUsha canters around to face you, a cocky little half-smile on her face. <i>“Nothing like a good, hard breeding to make my day,”</i> she smirks, leaning in and planting a kiss on your lips. <i>“Especially one from you!”</i>");
	if (pc.isMischievous())
	{
		output("\n\n<i>“Aww, you do think I’m special,”</i> you tease, giving her a swat on the rear. ");
		output("\n\nUsha huffs and returns it with an affectionate punch on the shoulder. <i>“Behave, pervert.”</i>");
		output("\n\nYou just chuckle and watch as the big amazon trots back towards the bed. Her puffy black slit is still parted from yoru coupling, richly pink inside and smeared with [pc.cumColor]. Little trickles of your seed leak out from her lips, staining the floor behind her everywhere she walks.");
	}
	else output("\n\nUsha steps back, letting her hands linger on your bare flesh for a moment longer before she turns back towards the bed.");
	output("\n\nYou follow the cum-stuffed leithan over to your bed, where she flops down on her side and pats the bed, inviting you to join her. You take the other side of the bed, nestling against Usha’s back and wrapping an arm around her chest, settling a hand on one of her sweat-slicked breasts. She makes a soft, happy sound under her breath, and her head nuzzles back against your [pc.chest]. The two of you end up drifting off to sleep, nestled in each other’s arms...");
	
	IncrementFlag("USHA_MOUNT");
	
	pc.orgasm();
	
	addButton(0, "Next", sexMerge);
}

public function sexMerge():void
{
	clearOutput();
	clearMenu();
	chiefNeykkarHeader(true);
	
	output("You wake up some time later, feeling a lingering warmth that clings to your [pc.skinFurScales] and a thick scent of sex that still hangs in the air. You sit up, groggily rubbing at your eyes, and find Usha sitting on her haunches in front of the little mirror in your bathroom, sensually brushing out her lush black hair like some ancient Godiva model.");
	output("\n\nIt takes her a moment to notice you stirring. When she does, Usha pulls her hair back into a ponytail and flashes you a little smile. <i>“Hey, sleepyhead. Have fun groping my tits all night?”</i>");
	output("\n\nWell... You give that huge leithan butt of hers an affectionate spank and tell her to get dressed");
	if (pc.isMischievous())
	{
		output(" -- unless she wants to lounge around like another playboy harem babe.");
		output("\n\n<i>“You wish!”</i> Usha snorts.");
	}
	else output(".\n\n<i>“You’re one to talk,”</i> your lover laughs, pointing at your naked crotch.");
	output(" She saunters over and wraps you in a hug, pressing her big, bare breasts against your [pc.chest] and locking her lips with you. You just shut up and kiss her back, content in your lover’s embrace. Eventually, though, Usha insists on going back to the bar, and you suppose you have things to do as well.");
	
	IncrementFlag("USHA_SEXED");
	
	//if between 22:00-23:59 set to 8am
	if (hours >= 22) processTime((((23 - hours) + 8) * 60) + (60 - minutes) + rand(15));
	//else if between 00:00-05:00 set to 8am
	else if (hours < 5) processTime(((7 - hours) * 60) + (60 - minutes) + rand(15));
	//else just pass 3 hours
	else processTime(3 * 60 + rand(15));
	
	currentLocation = "CANADA5";
	
	addButton(0, "Next", mainGameMenu);
}

public function leaveUsha():void
{
	clearOutput();
	clearMenu();
	chiefNeykkarHeader();
	
	output("<i>“I’ll see you around, Usha,”</i> you say, standing.");
	output("\n\nThe leithan girl sighs and flicks a lock of raven hair behind one of her tapered ears. <i>“Aww, going already? Nice talking to you, [pc.name]. I’ll be here if you need me.”</i>");
	output("\n\nShe gives you a nod and raises her glass... before knocking back what’s left in one go.");
	
	processTime(2 + rand(2));
	addButton(0, "Next", mainGameMenu);
}