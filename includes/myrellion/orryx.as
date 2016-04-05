//Orryx - Sugar and Spice
//Orryx is a non-sexual encounter in Gildenmere. He’s a merchant with a very loud, conspicuous stand. The myr won’t do business with him, so he asks the PC to be his proxy. Initially, he simply wants the PC to collect 5 units of honey a day for him. If the PC works continuously with him, he begins to offer the PC the Red Myr venom.

//Background:
//Toves: 
//Orryx is a member of the Tove race, a mercantile species that resemble muppets. With six limbs, plush bodies, and a radically different reproductive system, they are sexually incompatible with most species. Evolutionarily, they’ve been civilized for so long that monetary prowess has supplanted typical sexual drives for them. Attraction is based on wealth, as is their government and social caste system. (Think Ferengi + Rygel from Farscape)

//The Camarilla: 
//Formerly the GGC (Madam Brillig’s information is out of date due to being stranded for so long), the Camarilla is the central government of the toves. Acting as a pan-galactic corporation, it encourages the participation of individuals by means of buyable votes. Camarilla policy is decided by the majority of votes, and votes are purchasable from the Camarilla. Smaller policy changes usually result in cheaper costs for votes, while major decisions often cost millions of credits per vote. For a tove to effect change in his/her government, he/she must first accumulate a sizable fortune.

//Ships: 
//Orryx’s podium is a Sponsorstand, so called because Orryx pays relatively little for it, so long as it can advertise freely on its exterior. In Camarilla classifications, it’s a Skimmer-class ship, barely more than a self-propelled pod. It possesses relatively few conveniences, save for a minor Aetherspace Bender, which creates slightly more room inside than out (its interior is roughly the size of a studio apartment, filled with water). Orryx makes heavy use of its Aetherspace Manifestor, hydraulic compressor, which keeps the interior of the podium both filled with water and at deep-sea levels of pressure. Orryx makes heavy use of his Seeders, a pair of small, long-range transport rocket-pods that propel themselves into low orbit and connect to the nearest Camarilla trade route. With only two Seeders, he can’t move much product in the course of a day. Orryx references “wabeships,” the highest class of Camarilla ship--massive, dome-like pleasure satellites, owned by the most prosperous toves.

public function showOrryx():void
{
	author("Frogapus");
	showBust("ORRYX");
	if(flags["MET_ORRYX"] == undefined || flags["MET_ORRYX"] == -1) showName("FUZZY\nALIEN");
	else showName("\nORRYX");
}
public function orryxReputation(arg:int = 0):Number
{
	if(flags["ORRYX_REP"] == undefined) flags["ORRYX_REP"] = 0;
	if(arg != 0) flags["ORRYX_REP"] += arg;
	return flags["ORRYX_REP"];
}

public function roomDescriptionBonusForMuppets():Boolean
{
	if(flags["MET_ORRYX"] == undefined)
	{
		encounterFrogapi();
		return true;
	}
	else if(flags["MET_ORRYX"] == -1)
	{
		output("\n\nYou catch sight of the strobing podium before you can make out the fuzzy form of the strange alien perched atop it.");
		output(" He appears to be speaking with ");
		if(rand(3) == 0) output("an Ausar mercenary, wearing scorched leathers and gripping a charred laser rifle.");
		else if(rand(2) == 0) output("a tall, rabbit-like creature.");
		else if(rand(2) == 0) output("a large, panther-like humanoid, dressed in a savage loincloth, with curls of green smoke trailing from his lips.");
		else output("a confused looking humanoid with a set of large antlers atop his head.");
		addButton(0,"Fuzzy Alien",encounterFrogapi);
	}
	else
	{
		output("\n\nYou catch sight of the strobing podium before you can make out the fuzzy form of Orryx perched atop it.");
		output(" He appears to be speaking with ");
		if(rand(3) == 0) output("an Ausar mercenary, wearing scorched leathers and gripping a charred laser rifle.");
		else if(rand(2) == 0) output("a tall, rabbit-like creature.");
		else if(rand(2) == 0) output("a large, panther-like humanoid, dressed in a savage loincloth, with curls of green smoke trailing from his lips.");
		else output("a confused looking humanoid with a set of large antlers atop his head.");
		addButton(0,"Orryx",encounterFrogapi);
	}
	return false;
}

public function encounterFrogapi():void
{
	//First Encounter:
	if(flags["MET_ORRYX"] == undefined)
	{
		showOrryx();
		output("\n\n<i>“Hey there, partner!”</i> comes a shrill voice from a nearby corner. A brassy fanfare follows the greeting and you turn to see one of the most garish stands you’ve ever seen.");
		output("\n\nIt’s an odd point of high technology on the otherwise retrograde surface of the planet. Shaped vaguely like a primitive watchtower, complete with a tent-like roof, ");
		if(pc.tallness < 72) output("it barely reaches a foot over your head.");
		else output("it’s not even as tall as you.");
		output(" It is, however, covered in a brightly-flashing array of animated screens. Advertisements flicker past at migraine-inducing speeds, touting such quotables as <i>“Olkoth’s Old Fashioned Nanoborg Injections!”</i> and <i>“Yibb-Tstll’s Reflexive Lube! Good for What Rails You!”</i>");
		output("\n\n<i>“You! Yes, you, my good sapient!”</i> says the tiny figure perched just beneath the canopy.");
		output("\n\nDo you investigate?");
		flags["MET_ORRYX"] = -1;
		processTime(2);
		//No
		//Yes
		clearMenu();
		addButton(0,"Yes",investigateFrogapi);
		addButton(1,"No",dontInvestigateNo);
	}
	//Haven't taken the deal yet
	else if(flags["MET_ORRYX"] != 2)
	{
		clearOutput();
		showOrryx();
		output("<i>“Ah hah! It’s you! Wonderful to see you again! Tell me, have you reconsidered jumping on the business opportunity of a lifetime?”</i> the creature says, all fours of his hands wringing together excitedly.");
		//Have his name? Jump past introductions.
		if(flags["MET_ORRYX"] == 1)
		{
			clearMenu();
			addButton(0,"Yes",letsMakeADealUFrogapi);
			addButton(1,"No",countMeOutYouSloot);
		}
		//Don't know his name? Hear it all from the beginning.
		else
		{
			clearMenu();
			addButton(0,"Yes",investigateFrogapi);
			addButton(1,"No",countMeOutYouSloot);
		}

	}
	//Returning to Orryx:
	else
	{
		clearOutput();
		showOrryx();
		output("Orryx quickly catches sight of you and shoos away his other customer before you arrive.");

		//[If Orryx has not shipped a load of Honey today:
		if(flags["ORRYX_SHIPPED_TODAY"] == undefined)
		{
			output("\n\n<i>“Ah hah! It’s you! Wonderful to see you again! Tell me, have you collected enough Golden Honey?”</i> he says, all fours of his hands wringing together excitedly.");
			clearMenu();
			if(pc.hasItem(new MyrNectar(),5)) addButton(0,"Yes",IHaveSomeSlutHoneyNowYouLittleMuppetFuck);
			else addDisabledButton(0,"Yes","Yes","You don't have enough honey yet.");
			//No
			addButton(14,"Leave",noHoneyForYouSlut);
			//Tell me more about your business here: 
			//Cultural Differences?
			addButton(2,"Q:Culture",culturalDifferences);
			//Camarilla Regulations?
			addButton(3,"Q:Regulations",camarillaRegulations);
			//Blackmarket (Requires Orryx Rep at 5+)
			if(orryxReputation() >= 5) addButton(4,"Black Market",orryxBlackmarket);
			else addDisabledButton(4,"Black Market","Black Market","This little muppet probably has connections to the black market, but you'll need to get in good with him before you can ask him about it.");
		}
		//Else:
		else
		{
			clearMenu();
			//Tell me more about your business here:
			//Cultural Differences?
			addButton(2,"Ask: Culture",culturalDifferences);
			//Camarilla Regulations?
			addButton(3,"Ask: Regulations",camarillaRegulations);
			if(orryxReputation() >= 5) addButton(4,"Black Market",orryxBlackmarket);
			else addDisabledButton(4,"Black Market","Black Market","This little muppet probably has connections to the black market, but you'll need to get in good with him before you can ask him about it.");
			addButton(14,"Leave",noHoneyForYouSlut);
		}
	}
}

//Investigate: No.
public function dontInvestigateNo():void
{
	clearOutput();
	showOrryx();
	output("You decide your time would be better spent elsewhere and leave the noisy stand behind.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Investigate: Yes.
public function investigateFrogapi():void
{
	clearOutput();
	showOrryx();
	output("Atop the podium is a small, peculiar creature. ");
	if(flags["MET_BRILLIG"] != undefined) output("You immediately recognize it as a tove, one of the odd, fuzzy creatures from the G.G.C.");
	else output("This strange six-legged created sit perched on its fuzzy haunches, bird-like talons hooked over the edge of the glittering screens of its stand. Four, emotive limbs gesture frenetically through the air as it regards you with a row of four, glittering eyes, its sideways pupils regarding you with alien expression. Beneath those eyes clicks a wide, hooked beak, and two, overlong ears twitch in time to its speech. Covered completely in deep-blue fur, the creature looks more like some kind of living stuffed animal.");
	output(" It beckons you in with one hooked talon, while the other turns the dial on what looks like an antique pocketwatch. Its remaining two limbs brush down an adorably tiny vest buttoned snugly over the creature’s round, fuzzy belly.");

	output("\n\n<i>“Let’s see, you are a...</i>\" it mutters, glancing down at the device in its hand. ");
	var race:String = pc.race();
	if(race == "human" || race == "terran" || race == "ausar" || race == "kaithrit" || race == "kui-tan") output("<i>“" + race + "! Wonderful! I’ve worked with your kind before!”</i>");
	else output("It shakes the device in its hand and tucks it away into a tiny pocket. <i>“Doesn’t matter, a tove that can’t do business with an unknown species is a tove that’ll never get his own wabeship, am I right?”</i>");

	output("\n\n<i>“Good sapient, I am Orryx, a male, if you’re wondering, tove in good standing with the Gyre Galactic Camarilla,”</i> he begins. <i>“Wait! Hold on! I forgot something!”</i> Before you can say a word, he vanishes down into the depths of the podium. The entire structure can’t be more than five feet high, but you hear the sound of splashing and metal clanging before the creature returns.");
	flags["MET_ORRYX"] = 1;
	CodexManager.unlockEntry("Camarilla");
	processTime(3);
	//break
	//Next
	clearMenu();
	addButton(0,"Next",investigateFrogapi2);
}

public function investigateFrogapi2():void
{
	clearOutput();
	showOrryx();
	output("<i>“There we are! A tove without a hat is a tove that’s not ready to make a deal!”</i> he says, perching a top hat half as tall as he is atop his head. Several banners scroll at different speeds around its brim, displaying unreadable symbols. <i>“And a tove that’s not ready to make a deal is NOT a tove you want to be hanging around with,”</i> he says conspiratorially.");
	output("\n\nYou’re not entirely sure how to respond to that, but he seems to take your puzzled silence as some sort of agreement.");
	output("\n\n<i>“Now, let me ask you, sapient-to-sapient, are you the sort of man-slash-woman-slash-tranz-slash-neuchacho looking to make a few extra credits?”</i> he asks, the watch back in his hands. One set of claws excited turns the dial on one side, while two other swipe in entire different directions across its front.");
	processTime(3);
	clearMenu();
	addButton(0,"Yes",letsMakeADealUFrogapi);
	//No
	//Yes
	addButton(1,"No",letsNotMakeADealUFrogapi)
}

//Let’s not make a deal: 
public function letsNotMakeADealUFrogapi():void
{
	clearOutput();
	showOrryx();
	output("You thank the small creature for its time but decide to go on your way. It waves disappointedly but still energetically from its podium as you leave.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Let’s make a deal
public function letsMakeADealUFrogapi():void
{
	clearOutput();
	showOrryx();
	output("You decide to inquire further about this money-making opportunity.");
	output("\n\n<i>“I knew it! You and I, we’re two gametophytes in the same haploid cluster! Except, you probably don’t have macrosporangia, am I right? Ha! Oh, you’re a sport, yes you absolutely are, my good sapient!”</i>");
	output("\n\nYou’re only really catching about half of what Orryx is saying, but he seems to have taken a shine to you.");
	output("\n\n<i>“Now listen,”</i> he says, leaning over the edge of his podium. <i>“I’ve got a surefire money-making opportunity here in Gildenmere, but due to some cultural differences and Camarilla regulations, I’m not allowed to pursue it directly.”</i>");
	processTime(1);
	clearMenu();
	//Count me out!
	addButton(0,"CountMeOut!",countMeOutYouSloot);
	//Cultural Differences?
	addButton(1,"CulturalDiffs",culturalDifferences);
	//Camarilla Regulations?
	addButton(2,"Regulations",camarillaRegulations);
	//I’m in!
	addButton(3,"I'm in!",ImInMissFrogapipipipipipi);
}

//Count me out!: 
public function countMeOutYouSloot():void
{
	clearOutput();
	showOrryx();
	output("You’re not sure if you really have the time, desire, or patience to work with such a loud creature, and decide to leave.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Cultural Differences: 
public function culturalDifferences():void
{
	clearOutput();
	showOrryx();
	output("<i>“Ah, that, well ... notice the beak, dear sapient?”</i> Orryx asks, clicking his beak. <i>“Well it seems that the myr have some kind of genetic distrust of things with beaks. I’ve heard they evolved alongside some kind of terrestrial bird species, and only JUST beat them to fire-and-tools. Toves aren’t related at all - we come from a much wetter planet, but it’s enough to make the ants very nervous around us. They let me set up my Sponsorstand,”</i> he says, gesturing to his podium, <i>“but that’s about it. Hard to hold it against them, really. I was attacked by a giant badger-sapient in my youth and never quite got over it, either.”</i>");
	output("\n\n<i>“But it does make any kind of business deal difficult, since they won’t actually talk to me at all,”</i> he finishes. <i>“And that’s where you come in, my sapient compadre.”</i>");
	processTime(2);
	clearMenu();
	if(flags["MET_ORRYX"] != 2)
	{
		//Count me out!
		addButton(0,"CountMeOut!",countMeOutYouSloot);
		//Cultural Differences?
		//addButton(1,"CulturalDiffs",culturalDifferences);
		//Camarilla Regulations?
		addButton(2,"Regulations",camarillaRegulations);
		//I’m in!
		addButton(3,"I'm in!",ImInMissFrogapipipipipipi);
	}
	else {
		addButton(0,"Next",encounterFrogapi);
	}
}

//Camarilla Regulations:
public function camarillaRegulations():void
{
	clearOutput();
	showOrryx();
	output("<i>“All toves are members of the Gyre Grand Camarilla, formerly, the GGC, currently The Camarilla, pending brand re-evaluation,”</i> he explains. <i>“We’re a united species government, except we actually get things done ... because we’re a corporation, you see. Every member pays membership, and membership grants votes, and the more membership you can afford, the more votes you get, and so on and so forth. I don’t want to bore you with the minutia of our inner workings.”</i>");
	output("\n\n<i>“The thing is, while The Camarilla encourages productive competition and healthy, cutthroat business tactics, it draws the line at interference when there are actual wars occurring. It’s one thing for toves to sell weapons to other species, but it’s quite another when those weapons get used on toves!”</i>");
	output("\n\n<i>“So as long as this Red versus Gold war goes on, I’m not allowed to directly deal with the myr,”</i> he finishes. <i>“But that’s where you come in, my good sapient.”</i>");
	
	CodexManager.unlockEntry("Camarilla");
	
	processTime(3);
	clearMenu();
	if(flags["MET_ORRYX"] != 2)
	{
		//Count me out!
		addButton(0,"CountMeOut!",countMeOutYouSloot);
		//Cultural Differences?
		addButton(1,"CulturalDiffs",culturalDifferences);
		//Camarilla Regulations?
		//addButton(2,"Regulations",camarillaRegulations);
		//I’m in!
		addButton(3,"I'm in!",ImInMissFrogapipipipipipi);
	}
	else {
		addButton(0,"Next",encounterFrogapi);
	}
}

//I’m in!:
public function ImInMissFrogapipipipipipi():void
{
	clearOutput();
	showOrryx();
	output("<i>“Phenomenal! Absolutely fantastic!”</i> he chortles, blinking his eyes out of sync. <i>“It’s not a dangerous mission at all. In fact, it’s the easiest thing in the world - for you, at least, not for me - I need Golden Honey.”</i>");
	output("\n\nYou blink in surprise. From what you’ve seen of this city, the gold myr are lavishly free with the stuff.");
	output("\n\nOrryx reads your expression surprisingly well. <i>“Yes, but they won’t deal with me directly, and I’m not allowed to deal with them either. So I need a proxy to collect, say, five units of the stuff a day. The two Seeders - those are trading pods - in my Sponsorstand can’t transport much cargo at a time,”</i> he continues, patting the side of his blinking stand. <i>“She’s a beautiful skimmer, but I can’t wait until I’ve earned enough for my own wabeship.”</i>");
	output("\n\n<i>“But that’s the deal, five units of Golden Honey equals a ridiculously easy pocketful of credits for you and a satisfactory profit for me. What do you say?”</i>");
	processTime(3);
	//I’ll pass.
	//It’s a deal.
	clearMenu();
	addButton(0,"I'll Pass",illPassOnFrogapiHoneyBooBoos);
	addButton(1,"It's A Deal",itsADealYouLittleMuppetSlut);
}

//I’ll pass: 
public function illPassOnFrogapiHoneyBooBoos():void
{
	clearOutput();
	showOrryx();
	output("You decide to pass on Orryx’s business offer. <i>“Well, I’d be lying if I said I wasn’t disappointed,”</i> the tove says, his ears drooping. <i>“But if you change your mind, you know where to find me!”</i> he calls after you.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//It’s a deal.
public function itsADealYouLittleMuppetSlut():void
{
	clearOutput();
	showOrryx();
	//Agreed to get honey for Orryx = 2.
	flags["MET_ORRYX"] = 2;
	output("You agree to the tove’s simple business deal.");
	output("\n\n<i>“Fantastic! Money for you, money for me, it’s what spins this entire universe around ...at least on one of her axis,”</i> he says. <i>“As soon as you have five units of Golden Honey, drop by, and I’ll trade ya.”</i>");
	clearMenu();
	//I have some now!
	if(pc.hasItem(new MyrNectar(),5)) addButton(0,"I Have It",IHaveSomeSlutHoneyNowYouLittleMuppetFuck)
	else addDisabledButton(0,"I Have It","I Have It","You don't have any.");
	//Farewell.
	addButton(1,"Farewell",farewellYouSackOfFluff);
}

//I have some now!: 
public function IHaveSomeSlutHoneyNowYouLittleMuppetFuck():void
{
	clearOutput();
	showOrryx();
	if(flags["ORRYX_SHIPPED_HONEY"] == undefined)
	{
		output("<i>“I love it! I had a good feeling going into business with you, my good sapient,”</i> Orryx says,winking one of his four eyes and tapping his beak with his talon.");
		output("\n\nAs you hand him the honey, he fiddles with the dials on his pocketwatch and you feel a buzz from your Codex.");
		output("\n\n<i>“An easy 500 credits for you, and tidy profit for me,”</i> he burbles happily. A glance at your Codex confirms the amount. <i>“Remember, I can only ship one load of these per day, so come back again tomorrow with the same amount and I’ll be happy to take them off your hands!”</i>");
		output("\n\nYou bid the tove farewell as you walk away.");
		//[+1 Rep with Orryx]
		orryxReputation(1);
		processTime(2);
		//strip honey item
		pc.destroyItemByName("MyrNectr",5)
		pc.credits += 500;
		flags["ORRYX_SHIPPED_TODAY"] = 1;
		flags["ORRYX_SHIPPED_HONEY"] = 1;
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//REPEAT SHITZ!
	//(Not yet shipped a load) Yes: 
	else
	{
		output("<i>“Yes! Hah-ha! I love it! I had a good feeling going into business with you, my good sapient,”</i> Orryx says,winking one of his four eyes and tapping his beak with his talon.");
		output("\n\nAs you hand him the honeys, he fiddles with the dials on his pocketwatch and you feel a buzz from your Codex.");
		output("\n\n<i>“An easy 500 credits for you, and tidy profit for me,”</i> he burbles happily. A glance at your Codex confirms the amount. <i>“Remember, I can only ship one load of these per day, so come back again tomorrow with the same amount and I’ll be happy to take them off your hands!”</i>");
		output("\n\nYou bid the tove farewell as you walk away.");
		//[+1 Rep with Orryx]
		orryxReputation(1);
		pc.destroyItemByName("MyrNectr",5)
		flags["ORRYX_SHIPPED_TODAY"] = 1;
		pc.credits += 500;
		processTime(2);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Farewell: 
public function farewellYouSackOfFluff():void
{
	clearOutput();
	showOrryx();
	output("You confirm that you’ll keep an eye out for Golden Honey and wave farewell to the excited, little creature.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//(Not yet shipped a load) No:
public function noHoneyForYouSlut():void
{
	clearOutput();
	showOrryx();
	if(flags["ORRYX_SHIPPED_TODAY"] == undefined)
	{
		output("<i>“Nothing yet? Well, keep trying. You look like the sort of sapient who knows how to get things done!”</i> he says, smiling. <i>“Was that encouraging enough? It’s number 412 on the list of ‘Ways to Stimulate Good Business Relationships’ textbook.”</i>");
		output("\n\n<i>“You might try speaking to one of the queens. I hear they have queens of some kind that can give you portable honey.”</i>");
		output("\n\nYou nod and bid farewell to the excitable creature.");
	}
	//[If Orryx has already shipped a load for the day:
	else
	{
		output("<i>“Thank you ever so much, my good sapient,”</i> he beams, fiddling with his pocketwatch. <i>“With the money that last shipment brought in, I’m one step closer to Sub-Mercantilist-Adept! Maybe someday I’ll make it all the way up to Eminience Gris!”</i>");
		output("\n\n<i>“You’ll forgive me if I don’t share the details of my profits with you. It’s considered very poor taste in my culture, and honestly, it just leaves everyone feeling worse off. But definitely come back tomorrow and I’ll happily buy another shipment from you!”</i>");
		output("\n\nYou nod and carry on your way.");
	}
	processTime(2);
	clearMenu();
	//Leave
	addButton(0,"Next",mainGameMenu);
}

//Blackmarket
public function orryxBlackmarket():void
{
	clearOutput();
	showOrryx();
	//Blackmarket (requires Orryx Rep at 5+)
	output("<i>“You’ve been such a boon to my business,”</i> says Orryx. <i>“I wanted to open up some further services to you,”</i> he says with a benevolent smile.");
	output("\n\n<i>“Now, the Gold Myr can’t know about it, and if they hear about it, I’ll simply emergency-launch it into low-orbit. But if you’re interested, I DO have a somewhat more ... shall we say, ‘crimson’ stock,”</i> he says in a low voice.");
	//[Orryx Rep<10:
	if(orryxReputation() < 10)
	{
		output("<i>“I’ve got a supply of Red Venom. Enough pleasure and stimulation to shake the gametophytes from your gonopores. I’ve got a much more ready supply than I do with Golden Honey, and I have a few regulars who get their fix on a daily basis. What they do with it, I don’t ask. How I get it, YOU don’t ask. But you’ve been so good to me that I’d like to help you out in return -really, I’d be happy to. Just 100 credits - friends and family discount.”</i> He winks each of his four eyes, one at a time.");
		processTime(1);
		clearMenu();
		if(pc.credits >= 100) addButton(0,"Buy R. Venom",buySomeRedShit,undefined,"Buy Red Venom","Buy a dose of red venom.\n\n<b>Credits: </b>100");
		else addDisabledButton(0,"Buy R, Venom","Buy Red Venom","You can't afford the 100 credit price!");
		addButton(1,"No Thanks",noThanksNoRedVenom);
	}
	//Over 10!
	else 
	{
		output("\n\nYou hear a buzzing noise from his vest.");
		output("\n\n<i>“Oh, manxome foes!”</i> he squawks, looking down at his watch. <i>“My stock’s lower than I thought. Those ridiculous ants must have disrupted my supply line again!”</i> He grumbles to himself as he fiddles with the dials on his pocketwatch. <i>“I swear -why even bother paying for a hydraulic disruptor if the market is just going to be this volatile?”</i>");
		output("\n\nHe finally looks up at you. <i>“My sincerest apologies, dear sapient, but it looks like due to rising scarcity, I’m going to have to raise the price to ");
		var price:Number = (orryxReputation() - 8) * 100;
		output(price + ".”</i>");

		output("\n\n<i>“It’s definitely a temporary thing! Only until my supply lines are settled again - I assure you!”</i> he says, spreading all four of his arms in supplication.");
		processTime(3);
		//Yes, have some
		//No thanks
		clearMenu();
		if(pc.credits >= price) addButton(0,"Buy Some",buySomeExpensiveShit,undefined,"Buy Red Venom","Buy a dose of red venom.\n\n<b>Credits: </b>" + price);
		else addDisabledButton(0,"Buy Some","Buy Some","You can't afford that!");
		addButton(1,"No Thanks",turnDownExpensiveFroggieShitz);
		processTime(1);
	}
}

//Yes, have some: 
public function buySomeRedShit():void
{
	clearOutput();
	showOrryx();
	output("You nod and he taps the top of his podium lightly. Near your waist, a small panel opens up in one of the flashing screens, and a small vial of Red Venom rolls out into your waiting hand. Your Codex buzzes, informing you that you’ve paid out 100 credits.");
	output("\n\n<i>“Enjoy yourself, my good sapient,”</i> he says with an unreadable smile.\n\n");
	//[+1 Orryx Rep]
	orryxReputation(1);
	pc.credits -= 100;
	processTime(1);
	itemScreen = orryxBlackmarket;
	lootScreen = orryxBlackmarket;
	useItemFunction = orryxBlackmarket;
	
	itemCollect([new RedMyrVenom()]);
}

//No thanks.
public function noThanksNoRedVenom():void
{
	clearOutput();
	showOrryx();
	output("You pass on the offer of what sounds like a Red Myr drug, and Orryx’s conspiratorial expression vanishes. <i>“No problem at all, my good sapient. But should you ever feel like it, just let me know!”</i>");
	//[-1 Orryx Rep]
	orryxReputation(-1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Yes, have some:
public function buySomeExpensiveShit():void
{
	clearOutput();
	showOrryx();
	var price:Number = (orryxReputation() - 8) * 100;
	output("You agree to the tove’s price hike, and he taps the top of his podium lightly. Near your waist, a small panel opens up in one of the flashing screens, and a small vial of Red Venom rolls out into your waiting hand. Your Codex buzzes, informing you that you’ve paid out " + price + " credits.\n\n");
	//[+1 Orryx Rep]
	orryxReputation(1);
	pc.credits -= price;
	processTime(1);
	itemScreen = orryxBlackmarket;
	lootScreen = orryxBlackmarket;
	useItemFunction = orryxBlackmarket;
	
	itemCollect([new RedMyrVenom()]);
}

//No thanks:
public function turnDownExpensiveFroggieShitz():void
{
	clearOutput();
	showOrryx();
	output("You strongly suspect that Orryx is taking you for a ride. You turn down his offer of Red Venom and take your leave of him. As you walk away from him, he narrows his eyes at you.");
	//[-1 Orryx Rep]
	orryxReputation(-1);
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
