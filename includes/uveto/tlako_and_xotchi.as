import classes.Items.Miscellaneous.ThermalPack;
import classes.Items.Miscellaneous.YTRLube;
import classes.Items.Miscellaneous.Kalocrunch;

public function showTlako(nude:Boolean = false):void
{
	/*
	if(nude) showBust("TLAKO_NUDE");
	else showBust("TLAKO");
	*/
	showBust("TLAKO");
	showName("\nTLAKO");
	author("Frogapus");
}
public function showXotchi(nude:Boolean = false):void
{
	showBust("XOTCHI");
	showName("XOTCHI\nTZALL");
	author("Frogapus");
}

//Office of the Camarilla 
public function officeOfTheCamarillaButtsBonus():Boolean
{
	if (flags["XOTCHI_ROOM_MODE"] == 1)
	{
		xotchiOfficeSpecialTime();
		return true;
	}

	showBust("TLAKO");
	author("Frogapus");
	
	output("A massive billboard arches over the entryway to this office, bearing a sign that slowly scrolls from one side to the other, displaying its message in aggressively cheerful fonts.");
	output("\n\n<i>“The Camarilla welcomes you to Uveto VII Station! Please enjoy your stay!”</i>");
	output("\n<i>“Looking for the latest in Uveto VII fashion? Try Eimear’s Clothes Shop! Eimear’s Clothes Shop - servicing Uveto VII for 20 solar cycles!”</i>");
	output("\n<i>“You can barely spell “style” without Spinarran Silk and Steel! Spinarran Silk and Steel - It’s what separates a Rusher from a drifter colony bum!”</i>");
	output("\n<i>“It’s warm here on Uveto Station, but you’ll need thermal regulation to make planetfall. Try The Last Chance for all of your sub-zero preparations!”</i>");
	output("\n\nUnder the advertisements, in small, quickly scrolling letters, is a wordy message: <i>“The Camarilla is not responsible for death, cryogenic suspension, pregnancy, biological manipulation, sexual assault, or atomic disintegration via protonic drills encountered on the surface of Uveto VII. By entering this station you are agreeing to abide by Camarilla regulations. A full copy of Camarilla regulations may be obtained by contacting your local Camarilla representative.”</i>");
	output("\n\nAs you pass under the billboard, you feel a buzz from your Codex, but a glance at it shows nothing on the display.");
	output("\n\nFlexsteel doors whoosh open, exhaling a gust of balmy air. The interior of the Camarilla office seems less suitable for an ice planet, and closer to a tropical island. Sunken lighting bathes a grassy floor with orange light, while the walls project a somewhat flat display of a sun setting behind an ocean. In a series of shallow steps, the floor gradually rises up to a dais opposite the entrace, atop which sit three one-meter-high doorways. The rest of the walls are lined with jutting benches. You run your [pc.foot] against the floor, confirming that the shiny grass is artificial and look around in bemusement at the synthetic paradise around you.");
	output("\n\n<i>“I’m coming! Don’t be perplexitated! I’ll be there in a moment!”</i> calls out a high voice from the dias.");
	if(flags["TLAKO_BASKETS"] != undefined && flags["TLAKO_BASKETS"] >= 5 && flags["TLAKO_THANKED"] == undefined)
	{
		tlakoThanksScene();
		return true;
	}
	else if(flags["MET_TLAKO"] == undefined)
	{
		output("\n\nOne of the small doors wooshes open, and a small, pink creature shuffles out. ");
		//If toves not yet encountered, 
		if(!CodexManager.entryUnlocked("Toves")) output("Your codex buzzes at you, informing you that this diminutive creature is a tove, a merchant member of the Camarilla corporation. ");
		output("Holding a stack of papers in all four arms, the tove’s head can barely be seen above its cumbersome load. Despite its hurry, it moves slowly on thick hind legs, its broad tail dragging behind it as it scoots to one of the benches. A short leg stomps twice on the floor. The floor clicks as a circular section rises up from it, forming a low desk. The tove dumps the stack of forms on the table and lets out a sigh of relief before looking up at you.");
		output("\n\nThis tove wears a simple, white bustier, forming the suggestion of feminine hips and a chest on her body. She’s covered in candy-pink feathers from the tips of her rabbit-like ears to her thick, raccoon-like tail. The only other color on her is the pale gold tips of the plumage atop her head, matched by her beak and bird-like talons. Standing about three feet high she looks up at you, adjusting the white headband holding her head plumes back, tucking them into place behind an ear.");
		output("\n\nCatching her breath, she turns to look at you.");
		if(pc.tallness > 96) output(" She gapes up at you in stunned silence as her four eyes travel up your towering frame. <i>“Wow! Wow! I didn’t know sapients came that big!”</i>");
		else if(pc.tallness > 48) output(" <i>“Oh goodness! You’re tall, aren’t you?”</i> she chirps in surprise, her four, rose-colored eyes wide.");
		else output(" She glances upwards at you, tilting her head. <i>“You’re a bit shorter than the other sapients on board Uveto Station. You’re almost a tove!”</i> She says with a tweeting giggle.");
		output("\n\nShe blinks, letting out a small squawk.");
		output("\n\n<i>“Awk! I’m sorry! That was terrible customer relations! Let me - let me try that again!”</i> she says, her feathers ruffling up. She stands up to her full three feet of height and closes her eyes as if reciting from memory.");
		output("\n\n<i>“Hello and welcome to the Office of the Camarilla aboard Uveto VII Station. My name is Tlako. How may I accommodate you today?”</i> she asks in a smooth, pleasant voice.");
		output("\n\nYou introduce yourself and she smiles up at you.");
		output("\n\n<i>“Hello, [pc.Name], and welcome to Uveto VII Station,”</i> she says, smoothly. <i>“Would you like to know about the history of Uveto VII Station, the Camarilla, or would you like to schedule an appointment with Sub-Madam Xochi Tzall? Alternatively, I am authorized to offer to you for purchase a Camarilla Welcome Basket full of Wonderful Things that will brighten your stay here on Uveto VII for only 200 credits.”</i>");
		if(silly) output("\n\nYou have no idea how she’s capitalizing the words in her sentences, but it seems to have something to do with inflected enthusiasm.");
		flags["MET_TLAKO"] = 1;
	}
	else
	{
		output("\n\nThe rightmost door wooshes open, revealing the diminutive pink form of Tlako. <i>“Oh! Frabjous!”</i> she squeaks, seeing you. The tove scampers down the dias steps on all six legs, righting herself when she reaches your [pc.feet], looking up at you from her three-foot height.");
		output("\n\nAs before, Tlako wears a simple, white bustier, forming the suggestion of feminine hips and a chest on her body. She’s covered in candy-pink feathers from the tips of her rabbit-like ears to her thick, raccoon-like tail. The only other color on her is the pale-gold tips of the plumage atop her head, matched by her beak and bird-like talons. She looks up at you, smiling as she adjusts the white headband holding her head plumes back.");
		output("\n\n<i>“Hello, [pc.Name],”</i> she says with a giggle, <i>“Welcome to Uveto VII Station. On behalf of the Camarilla, how may I accommodate you?”</i> she asks, grinning. <i>“Would you like to know about the history of Uveto VII Station, the Camarilla, ");
		//If player has not met Xotchi Tzall:
		if(flags["MET_XOTCHI"] == undefined) output("would you like to schedule an appointment with Sub-Madam Xochi Tzall, ");
		output(" or would you like to purchase a Camarilla Welcome Basket full of Wonderful Things that will brighten your stay here on Uveto VII for only 200 credits?");
		//If pc has already bought one:
		if(flags["TLAKO_BASKETS"] != undefined) output("”</i> She smiles up at you so hard that her eyes close. <i>“You already bought one, so don’t feel pressured to buy another,”</i> she says.");
		else output("”</i>");
	}
	CodexManager.unlockEntry("Toves");
	tlakoMenu();
	return true;
}

//History of Uveto VII
//The Camarilla
//Meet with Xotchi Tzall
//Welcome Basket [Unlocks Tlako option]
//Tlako Herself
//Bye
public function tlakoMenu(arg:* = undefined):void
{
	clearMenu();
	if(arg == askTlakoAboutUvetanHistory) addDisabledButton(0,"History","History","You just did that.");
	else addButton(0,"History",askTlakoAboutUvetanHistory);
	if(arg == askTlakoAboutTheCamarilla) addDisabledButton(1,"Camarilla","Camarilla","You just did that.");
	else addButton(1,"Camarilla",askTlakoAboutTheCamarilla);
	if(arg == xotchiTzallMeeting) addDisabledButton(2,"Meet Xotchi","Meet Xotchi","You just did that.");
	else addButton(2,"Meet Xotchi",xotchiTzallMeeting);
	if(pc.credits >= 200) addButton(3,"W. Basket",buyAStupidSluttyWhaleCumBasket, undefined,"Welcome Basket","Buy a welcome basket for 200 credits.");
	else addDisabledButton(3, "W. Basket","Welcome Basket","You can’t afford this. Tlako told you they cost 200 credits.");
	if(flags["TLAKO_BASKETS"] != undefined) addButton(4,"Tlako Herself",tlakoHerselfTopic);
	else addDisabledButton(4,"Tlako Herself","Tlako Herself","Tlako isn’t comfortable enough with you to discuss this.");
	if(flags["TLAKO_THANKED"] != undefined)
	{
		if(!pc.isTaur() && pc.hasCock()) addButton(5,"Flork Her",florkDatFuckinMuppet,undefined,"Have a florking good time with Tlako.");
		else addDisabledButton(5,"Flork Her","Flork Her","You don’t have the right setup to flork her. You’d need a penis and a non-tauric body.");
	}
	else addDisabledButton(5,"Flork Her","Flork Her","You don’t even know what florking is.");
	addButton(14,"Leave",byeByeToveBimbo);
}

//History of Uveto VII
public function askTlakoAboutUvetanHistory():void
{
	clearOutput();
	showTlako();
	output("You ask the little pink creature about the station itself.");
	output("\n\nThe small creature tilts her head back, taking a deep breath, closing her outermost eyes, then chirping out a brief history.");
	output("\n\n<i>“Initial surveys of Uveto VII deemed it a frozen wasteland, but Akkadi Company investigations revealed it to be both rich in minerals and teeming with marine life below its frozen surface. Subsequent mining operations by both Akkadi and Steele Tech have resulted in near-zero-sum gains, as the planet’s inhospitable atmosphere and hitherto undiscovered wildlife makes mining both difficult and dangerous.”</i>");
	output("\n\n<i>“Akkadi offered Steele Tech a contractual buyout, putting Steele Tech in charge of maintenance and mining operations on the planet’s surface, a job that Steele Tech relegated to its partially-owned subsidiary, RhenWorld.”</i>");
	output("\n\n<i>“As actual planetfall is dangerous in the extreme, the Camarilla built Uveto Station to facilitate planetary incursion via a retrofitted Wabeship Station, with space elevator access to the planet’s surface. Thanks to the Camarilla, all travellers can come and go as they please!”</i> she says with a smile.");
	output("\n\nGiven the mountain of paperwork you navigated to dock here, you’re uncertain if using the station was actually easier. You ask what the Camarilla gets out of it.");
	output("\n\nTlako chirps and smooths down her bustier with all four hands. <i>“In order to maintain Uveto Station, the Camarilla levies a small tax on all incoming and outgoing traffic... with variances based on cargo load,”</i> she adds.");
	output("\n\nYou frown, and she adds in hurriedly. <i>“Primarily for large-scale mining transport. In general, you won’t be charged very much for private transport.”</i>");
	output("\n\n<i>“Here aboard Uveto Station, you can enjoy many of the amenities of a colonized planet. Shops, food, and even, um...”</i> she pulls a small, circular disk from the top of her bustier, scrolling her finger across its screen, <i>“...forniculations are possible here on Uveto Station. Of course, the engineering levels are not accessible for you - as they are built to tove aquatic standards, and exist primarily below the walking deck.”</i>");
	processTime(6);
	tlakoMenu(askTlakoAboutUvetanHistory);
}

//The Camarilla
public function askTlakoAboutTheCamarilla():void
{
	clearOutput();
	showTlako();
	output("You ask Tlako about the Camarilla.");
	output("\n\nShe blinks, and takes a deep breath, her feathers puffing up around her headband and she recites in a pleasant, almost musical voice.");
	output("\n\n<i>“The Camarilla is a united species governmental corporation for toves,”</i> she says with a beatific smile. <i>“The Camarilla encourages competitive business practices both between Camarilla members and with parties outside of the Camarilla. Regulation of the Camarilla is dictated by private vote, bought by a publically available sliding scale of prices. While profits are our primary concern, rest assured that your safety and comfort are also considered.”</i>");
	output("\n\n<i>“Should you wish to file a complaint with the Camarilla, please transmit your complaint via ship-to-ship transmission. As the Camarilla handles a high volume of interstellar communication, we are forced by situation to charge for the processing of your complaints and you will be billed based on the amount of effort needed to resolve your problem. Know that the Camarilla Cares About You.”</i>");
	processTime(3);
	tlakoMenu(askTlakoAboutTheCamarilla);
}

//Meet with Xotchi Tzall
public function xotchiTzallMeeting():void
{
	clearOutput();
	showXotchi();
	output("You ask to meet with Sub-Madam Xotchi Tzall, and Tlako’s face goes blank for a moment.");

	if(flags["MET_XOTCHI"] == undefined)
	{
		output("\n\n<i>“Y-yes, of course,”</i> she says, sounding nervous. She reaches into the top of her white bustier and pulls out a small, white disk. Holding it in one hand, her three other hands dance across its surface, scrolling in three different directions at once.");
		output("\n\n<i>“Understand that the Sub-Madam is a very busy woman and may simply not be... oh debt and pinion rot...”</i> she mutters, as the little white compact begins to beep loudly.");
		output("\n\nThe central door across the room whooshes open and a larger tove stalks into the room. Instead of Tlako’s candy-pink color, this one is covered in yellow-orange feathers, her waist bound with a black corset. A small cluster of black flowers sits pinned atop the blood-red swath of feathers atop her head. Her beak and claws are deep orange, as are her eyes, focused on Tlako as the new tove stalks across the room.");
		output("\n\nShe’s radiating anger one minute, but the second she turns to you, her face is the picture of kindly gratitude. All four of her eyes shine up at you as she smiles. <i>“Salutations and greetings! I hope your trip to Uveto Station was as pleasant as possible " + pc.mf("Mister","Miss") + "--...”</i> She touches a finger to the cluster of black flowers atop her head, and you see the faintest image of an HUD appearing over one of her eyes, <i>“[pc.name]. I am Sub-Madam Xotchi Tzall, the Camarilla liaison here aboard Uveto Station.”</i>");
		output("\n\nYou greet her, glancing at Tlako, who seems to be gradually sidling over to her stack of papers, trying to slip behind them.");
		output("\n\n<i>“My time is very limited, and unfortunately, I can’t chat long. But please know that if you have any questions about the Camarilla while you’re here aboard Uveto Station, please talk to Tlako, my assistant.”</i> She puts the slightest hiss on the last word and the stack of paper flinches.");
		output("\n\n<i>“Please know that while the Camarilla maintains the workings of Uveto station, Anyxine Rhenesunne, the Vice President of RhenWorld Stellar Excavations, is the standing station manager.”</i> Her smile is sweeter than aspartame, but there’s an edge to her tone. <i>“As a Sub-Madam, I manage my people aboard this ship, but do not actually captain any of the residents.”</i> If there was an edge to her voice before, it’s a razor now.");
		output("\n\n<i>“Regardless,”</i> she says with another smile, <i>“I hope your trip here is a profitable one! I encourage you make generous use of the various stores aboard Uveto Station.”</i>");
		output("\n\nShe bids you farewell, and leaves, shooting a poisonous glance at Tlako on her way out.");

		// This doesn't make sense as-is with the expansion content, so I'm just gonna comment this out and dump you back to the interaction menu
		//output("\n\n<i>“The... the Sub-Madam w-will see you now...”</i> says Tlako weakly.");
		
		processTime(5);
		
		flags["MET_XOTCHI"] = 1;
		tlakoMenu(xotchiTzallMeeting);
	}
	else
	{
		output("\n\n<i>“You want to speak to the Sub-madam?”</i> gulps Tlako. <i>“I d-don’t think she’s available, but l-let me see if she’s in ...”</i> The little, pink tove taps her clipboard, and a familiar voice squawks something unintelligible through a speaker.");
		
		output("\n\n<i>“Oh no-I mean-oh good, she’s available!”</i> says Tlako, glancing nervously around the room. <i>“She’s on her way. I’ll just go ... retriculate some agendocuments ...”</i> she says. In a flurry of scattered papers, she gathers up her stack of forms and dashes out through one of the floor-level shutters.");
		
		output("\n\nBarely a minute or two has passed when another door whooshes open and [xotchiName] stalks into the room. The two-foot-tall tove is dressed in her usual black corset, and holding her folding-tablet fan. Her blood-orange feathers bristle, and she glares at the scattered papers on the floor, snatching one up in a scaled talon.");
		
		output("\n\n<i>“And </i>there’s<i> the " + RandomInCollection(["shipping manifest for the freon shipment,", "order form to Innsmouth Hydraulics,", "receipt for the 4,000 defective emitters-naturally, a day after warranty,", "the government requisition for a new assistant,"]) +"”</i> she snarls. She glances around at the other papers littering the room. <i>“I swear by my profit margin I’m going to staple that dryborn to the wall and make her vend her hole for all the money she’s lost me.”</i>");
		
		output("\n\nYou clear your throat, and she looks up at you.");

		xotchiApproachMerge();

		return;
	}
}

//Buy a Welcome Basket
public function buyAStupidSluttyWhaleCumBasket():void
{
	clearOutput();
	showTlako();
	output("You ask to buy a Welcome Basket.");
	output("\n\n<i>“Oh yay!”</i> says Tlako, clapping two of her hands together as the other two fish a white compact from her white bustier. <i>“Thank you so very, very much! You don’t even know what it means that you’d buy from me!”</i> she babbles as her pink feathers poof out.");
	output("\n\nThe low door on the far left whooshes open, and a low, hovering table drifts in, bearing a small, plastic basket. It’s wrapped in a crinkly, translucent covering, tied at the top with a bow. Its surface is covered with brightly-colored word balloons, expressing such sentiments as <i>“WOW!”</i> and <i>“AWESOME!”</i> and <i>“AMPHIBIOUS!”</i>");
	output("\n\nTlako holds out her white compact to you, and you tap it, noting that while one side is featureless white, the other is a rapidly-scrolling display of layered symbols.");
	//[First time buying Welcome Basket:
	if(flags["TLAKO_BASKETS"] == undefined)
	{
		output(" <i>“I came up with the idea of a welcome basket for new arrivals a year ago!”</i> she says, holding the basket up to you. <i>“Sub-Madam Xotchi Tzall didn’t think it was a good idea,”</i> she says, her ears drooping a bit. <i>“She said that it was a non-profitable venture.”</i>");
		output("\n\nShe makes a face. <i>“I don’t know how much you know about toves, but that’s pretty much the worst thing you can say around us.”</i>");
		output("\n\nYou take the basket and her face lights up. As you begin unwrapping it, you ask her how many she’s sold.");
		output("\n\n<i>“You’re the first - I mean, that’s the first!”</i> she chirps happily, clasping her four hands together, her pink tail swishing up and down. <i>“I absolutely KNEW they’d eventually take off! It just needed some time!”</i>");
		output("\n\nYou finally get the wrappings off and pull out a trio of items.");
		output("\n\n<i>“It’s Kalocrunch!”</i> she says, pointing up at the silver bag. <i>“Walking through snow and exploring frozen hellscapes can burn you out fast. Kalocrunch has the highest calorie-to-mass index of any food in existence. It’s PERFECT for someone trekking across tundras,”</i> she trills happily.");
		output("\n\n<i>“That’s a Thermal Pack!”</i> she says, as you lift out a small metallic egg. <i>“It’ll generate a microwave field around you for 24 hours. It’ll keep off the worst of the cold down there on Uveto VII. I figured that most people coming through the station are going down there for some reason or another.”</i>");
		output("\n\n<i>“And that’s Yibb-Tstll’s Reflexive Lube! It’s ‘Good for What Rails You!’”</i> she says as you investigate the last item. The small, green capsule bears a picture of a tove with four thumbs up and an unsettling grin across his face. <i>“YTR Lube is the best in defensive lubrication. Pop it in your orifice, and you’ll more easily accommodate girthier insertion for a few days. You know, in case of...”</i> she leans in and whispers conspiratorially, <i>“...surprising anal insertions.”</i>");
	}
	else
	{
		output(" <i>“You know you didn’t have to buy one again,”</i> she says, a reproachful look briefly on her beaked face. <i>“But I’m very glad you did!”</i> she says with a grin. <i>“Every basket bought means I get a little closer to paying back Sub-Madam Xotchi Tzall!”</i>");
		output("\n\n<i>“I don’t know if word got out, but since you bought one, people have been actually coming in to buy them! Thank you so much! If this keeps up, I won’t have to worry about Sub-Madam Xotchi Tzall making me sell my body!”</i> she says, leaning forward to wrap all four of her arms around ");
		if(pc.tallness > 48) output("your [pc.legOrLegs].");
		else output("your midsection.");
		output(" She’s actually flat against you, looking a little awkward. <i>“Am I doing this right? Toves don’t do physical affection. I’m still researching how you touchy-feely races do it.”</i>");
		output("\n\nYou give her a look, but she’s too cheerful to notice. <i>“Thank you again!”</i> Tlako burbles! <i>“I owe Sub-Madam Xotchi Tzall a lot for the first run of these, so you can believe what a relief it is to finally start to move them! You’re a " + (isAprilFools() ? "dogecoin" : "credit") + " saver!”</i>");
		//[Unlocks Tlako Herself
	}
	output("\n\n");
	IncrementFlag("TLAKO_BASKETS");
	pc.credits -= 200;
	processTime(7);
	clearMenu();
	addButton(0, "Next", takeStupidSluttyWhaleCumBasket);
}
public function takeStupidSluttyWhaleCumBasket():void
{
	clearOutput();
	quickLoot(new Kalocrunch(), new YTRLube(), new ThermalPack());
}

//Tlako Herself
public function tlakoHerselfTopic():void
{
	clearOutput();
	showTlako();
	output("You take a seat and ask the little pink creature about herself.");
	output("\n\n<i>“Me? I’m just a run-of-the-mill bureaucrat!”</i> Tlako says, looking up at you.");
	output("\n\nYou pat the seat next to you and ask her what she means by that.");
	output("\n\n<i>“Oh, in tove society, it’s considered a poor investment to raise more than two children,”</i> she begins as she clambers up onto the bench next to you, her legs kicking as she takes her seat. <i>“So when a third child is born, they’re given to the government to raise,”</i> she says, looking up at you with a smile. <i>“I’m a third child.”</i>");
	output("\n\nYou reflect on your own childhood and how big a role your father played in it.");
	switch(flags["PC_UPBRINGING"])
	{
		// pc Nature = Athletic:
		case GLOBAL.UPBRINGING_ATHLETIC:
			output(" You remember kicking off the wall of a zero-g court, and the burst of joy at catching the ricocheting grav ball that your father threw to you.");
			break;
		// pc Nature = Bookworm:
		case GLOBAL.UPBRINGING_BOOKWORM:
			output(" Quite suddenly you recall the faint buzz of the old lamp in your father’s library, being picked up by him and carried to your bed after falling asleep in a pile of books.");
			break;
		// pc Nature = Pampered:
		case GLOBAL.UPBRINGING_PAMPERED:
			output(" You run your thumb across your fingernails, remembering the spa days you and your father would schedule. You remember the long hours of talking about nothing in particular over massages, saunas, and manicures.");
			break;
		// pc Nature = Austere:
		case GLOBAL.UPBRINGING_AUSTERE:
			output(" You remember the cabin by the purple lake on Dorlin IV, the long hours spent with your father, enjoying the silence of the woods around you, and all those times he fished you out of the lake.");
			break;
		// pc Nature = Slutty:
		/*case GLOBAL.UPBRINGING_SLUTTY:
			output(" You remember blushing as your father coached you on how to score the perfect date. It seemed awkward at the time, but it turned out to be the most useful advice you got.");
			break;*/
		// pc Nature = Balanced:
		case GLOBAL.UPBRINGING_BALANCED:
		default:
			output(" Unbidden, your fingers touch a small spot on your midsection. You remember a year spent building a treehouse under the twin suns of a garden planet. You fell, hitting several branches on your way down. Your father was there in a flash, picking you up and carrying you to the nearest med station.");
			break;
	}
	output(" You try to imagine life without that memory, and you wince.");

	output("\n\n<i>“Oh, it’s really not that bad,”</i> she says, gesturing energetically. <i>“You see, tove children that grow up with their parents get billed for the cost of raising them once they’re adults. Bureaucrats don’t get billed - we just work for the government. That’s my job here on Uveto Station - I’m a Camarilla-assigned assistant for Sub-Madam Xotchi Tzall, since this is largely a government endeavor.”</i>");
	output("\n\nYou ask her if she likes working for her.");
	output("\n\n<i>“It’s an assigned job,”</i> she says, making a face. <i>“Whether I like it or not, I have to do it. The Welcome Basket project was my ticket for a promotion. If it had worked, I might have gotten promoted. As it stands, I just owe Sub-Madam Xotchi Tzall a LOT of money.”</i> Her ears droop at the last statement.");
	output("\n\nYou pat the small creature on the head, and surprisingly, she makes a musical trill. <i>“Ooh! That’s nice! It feels like preening!”</i> she says, smiling brightly.");
	output("\n\n<i>“It wouldn’t be so bad, but Sub-Madam Xotchi Tzall was going to make me start working it off next. I had some savings, but I still had to take a loan from her for the rest of it. She figured I wasn’t going to sell any, so she made me mod my body so that I can start working it off.”</i>");
	output("\n\n<i>“I mean... it’s not a bad modification,”</i> she says, when she catches your expression. <i>“It’s just a little one that doesn’t even show,”</i> her feathers poof out a bit. <i>“And it makes sense. I mean, if I lost her money, the least I could do is make it up to her by servicing visitors with a fuck hole.”</i> She shrinks down, her head tucked against her ruffled feathers, eyes looking off to the side.");
	output("\n\n<i>“I’m... I’m only telling you this because you were nice enough to buy the first Welcome Basket. You don’t need to buy any more. I just know more people will want one!”</i> she says, clenching a fist and looking determined.");
	processTime(8);
	tlakoMenu(tlakoHerselfTopic);
}

//Bye
public function byeByeToveBimbo():void
{
	clearOutput();
	showBust("TLAKO");
	author("Frogapus");
	output("You bid the little pink tove goodbye and leave the gaudy and oddly-humid office.");
	leaveTlakoButton();
}

//Tlako Thanks [Unlocks on the day after pc buys 5 Welcome Baskets AND pc has triggered Tlako Herself.]
public function tlakoThanksScene():void
{
	showTlako();
	flags["TLAKO_THANKED"] = 1;
	output("\n\nThe rightmost door wooshes open, revealing the diminutive pink form of Tlako. The little pink tove looks up at you. <i>“You have no idea how much of a " + (isAprilFools() ? "dogecoin" : "credit") + " saver you are,”</i> she says with a warm smile. <i>“I’ve finally paid off Sub-Madam Xotchi Tzall for the loan on the Welcome Baskets. People are actually buying them now, and I even received a missive from the Camarilla Department of Intraorganization - I’m being considered for a promotion! And that’s all thanks to you! You’re just so amazing!”</i>");
	output("\n\n<i>“I was looking up ways to thank you, and I was wondering if you wanted to make use of my implant,”</i> she says, a little embarrassed. <i>“Is that an okay thing to offer? I mean, it’d only work if you had something to put in it. It’s not a pleasure organ for me like it is for you folks, so I wouldn’t feel it in the same way as you might, but if it’s something you’d like, I’d be happy to let you, um...”</i> she glances at her handheld, <i>“...flork me.”</i>");
	clearMenu();
	//[pc has two legs and a cock]
	if(!pc.isTaur() && pc.hasCock()) addButton(0,"Flork Her",florkDatFuckinMuppet,undefined,"Flork Her","There’s never a bad time for florking!");
	else addDisabledButton(0,"Flork Her","Flork Her","You don’t have the right setup to flork her. You’d need a penis and a non-tauric body.");
	addButton(14,"Back",turnDownATovejob);
}

//Flork her
public function florkDatFuckinMuppet():void
{
	clearOutput();
	showTlako(true);
	output("You keep your amusement to yourself to keep the tove from feeling bad and happily agree that florking her would be a fun way to celebrate her windfall.");
	output("\n\nWhile she taps at her handheld, locking the front entrance, you work out the logistics of the scenario. You look at the benches alongside the room and consider that at her size, she’s probably light enough to lift during sex.");
	output("\n\nShe looks up at you shyly. <i>“Um, but please go easy on me - ");
	if(flags["FLORKED_TLAKO"] == undefined) output("I haven’t used it before.");
	else output("It still feels a little weird at first.");
	output("”</i> she says, her feathers ruffling up.");

	output("\n\nYou assure her that you will and lead her to the bench, reaching down to ");
	if(pc.tallness > 48) output("pick up");
	else output("heft");
	output(" the round fluffball off the artificial grass. She chirps in surprise at being lifted, her tail trailing along the grass behind her.");
	output("\n\nYou set her down on the bench next to you");
	if(!pc.isCrotchExposed()) output(" and undo the front of your [pc.lowerGarments]");
	output(". You pull out [pc.oneCock], letting her inspect it.");

	if(flags["FLORKED_TLAKO"] == undefined) 
	{
		output("\n\n<i>“It looks soft, though,”</i> Tlako says, tilting her pink head from one side to the other. <i>“Does it squish inside me?”</i>");
		output("\n\nYou inform her that it gets hard with stimulation.");
		output("\n\n<i>“Like this?”</i> she asks, reaching forward with one of her scaled hands. She grazes your shaft softly, as if cautiously petting a strange animal, and chirps loudly as your dick twitches lightly.");
		output("\n\n<i>“It moved!”</i> she says, looking at you, her eyes wide. <i>“Is it supposed to move like that?”</i>");
		output("\n\nYou stifle a laugh and confirm that yes, it’s supposed to move, and that it’s a good sign.");
	}
	output("\n\n<i>“I see...”</i> the tove says. Sitting on her haunches next to you, she reaches forward with all four hands, grasping different places along your length, and stroking it cautiously.");
	output("\n\nYou groan and lean back as your cock stiffens in her four-fold grip. <i>“Just like that,”</i> you tell Tlako.");
	output("\n\nThe tove lets out a satisfied trilling noise, her movements birdlike as she tilts her head this way and that, continuing the stroking motion, letting out a musical whistle as you grow in her grip.");
	output("\n\n<i>“Wow!”</i> she breathes. <i>“That’s so neat!”</i>");
	output("\n\n<i>“It’s ready now,”</i> you smile.");
	output("\n\nShe looks up at you, a faint trace of nervousness on her face. She looks down at your cock and clicks her beak, her expression steeling with resolve. <i>“Yes, let’s do this!”</i> she chirps.");
	output("\n\nYou reach over to her gently, sliding your hand under her tail. Her feathers poof out and you pause.");
	output("\n\n<i>“I’m good,”</i> she says, looking at you over her shoulder. <i>“You can keep going.”</i>");
	output("\n\nYour fingers push through her plush feathers and soon discover ");
	if(flags["FLORKED_TLAKO"] == undefined) output("a");
	else output("the");
	output(" small bud at the base of her tail. You touch it lightly, and Tlako’s feathers ruffle out so much that only her ivory bustier keeps her from looking spherical.");
	output("\n\n<i>“It feels weird...”</i> she mutters, and you ask if she wants to stop.");
	output("\n\n<i>“It’s not bad,”</i> she says, her feathers slowly smoothing down. <i>“Please... a little more.”</i>");
	output("\n\nYou push your fingers against it, and ");
	if(flags["FLORKED_TLAKO"] == undefined) output("to your surprise, ");
	output("you encounter wetness. You comment on this and she tilts her head in curiosity.");
	if(flags["FLORKED_TLAKO"] == undefined) output("\n\n<i>“Is that a good thing?”</i> she asks. <i>“I imagine that self-lubrication is a good thing. It’s probably the same tech with the YTR Lube. Hold on,”</i>");
	else output("\n\n<i>“I hope it’s okay,”</i> she says sheepishly. <i>“I wasn’t sure when you’d be back, so I’ve been using extra YTR lube daily just in case. Wait, hold on,”</i>");
	output(" she says, leaning forward on the bench, her hands gripping the end of it, her bushy tail flopped over her back, revealing her plush haunches to you.");
	output("\n\nYou assure her lubrication is a very good thing before pushing your finger up into it. To your pleasant surprise it easily accommodates a finger, and then two, and then three. It looks like whoever implanted this in her made sure she’d be able to handle anything put into her.");
	output("\n\nTlako grunts a bit, letting out a soft chitter. <i>“It feels like... pushing a finger really deep against your belly. It’s not bad, though,”</i> she states. ");
	if(flags["FLORKED_TLAKO"] == undefined) output("There’s a pause, and then, <i>“There’s another part to this, right, though? I’m gonna take your penis inside my hole, right?”</i>");
	else output("She takes a breath, her feathers settling down slightly. <i>“Okay, I’m ready to take you inside now. Are you ready?”</i>");
	output("\n\nBy way of answer, you pick her up by her waist and hold her up over your stiff cock. She chirps, looking down. <i>“Do you think I can handle that?”</i> she asks nervously.");
	output("\n\nHer lubricant drips down your wrist, and you smile, assuring her that she can.");
	output("\n\nSlowly, you lower her down, the tip of your cock at the entrance of her fuckhole.");
	output("\n\n<i>“Do it,”</i> she says, looking up at you with an expression of nervous excitement, her four pink eyes meeting your [pc.eyes].");
	output("\n\nYou push her down, feeling her hole stretch around you, watching her carefully. A look of surprise crosses her face at first, then she lets out a low, shuddering breath. <i>“Hoooookay. I got this,”</i> she says.");
	output("\n\nYou take her down further, and further, and further, ");
	var x:int = pc.cockThatFits(500);
	if(x < 0) x = pc.smallestCockIndex();
	if(pc.cocks[x].cLength() > 8) output("until you see the bulge of your cock pushing out against her fluffy belly. <i>“Is that... you?”</i> she breathes. <i>“That’s... woah... I took all of that?”</i> she rubs softly at the bulge with one of her hands. You feel the pressure against your cockhead and moan in pleasure.");
	else output("until her fluffy rump rests against your hips, your cock buried inside the tove. She churrs, roosting down, giving her hips a wiggle, and rubbing the slick walls of her fuck hole around your dick.");
	pc.cockChange();
	output("\n\n<i>“Did that feel good?”</i> she asks. <i>“Am I making you feel good?”</i>");
	output("\n\nYou nod and, after making sure she’s ready for the next part, hold her by her waist and begin to slide her up and down your dick.");
	output("\n\n<i>“I... woah! Hee! This is fun!”</i> she burbles, squeaking each time you plunge her down. Her hole is permanently slippery, it seems, and produces a constant stream of lube down your dick, oozing down");
	if(pc.balls > 0) output(" your [pc.balls]");
	output(".");
	output("\n\n<i>“I think I can get some muscles working down there, too,”</i> she says, as you pump her up and down, treating Tlako like a living onahole.");
	output("\n\nShe tenses her body, flexing her muscles, and you feel her tighten around you. The effort makes her squeak a bit, panting in rhythm with you. She’s not experiencing the same rush of pleasure as you, but she certainly seems to be enjoying herself, given the happy smile on her face.");
	output("\n\nYou thrust her up and down, the little pink tove bouncing up and down on your cock as you feel pressure building inside you.");
	output("\n\n<i>“I’m gonna... gonna...”</i> you gasp.");
	output("\n\n<i>“Oooh! Y-youou’re g-onna c-um, ri-ight?”</i> she pants, her words broken by her bouncing ride. <i>“Cu-um inside me! I wanna see-ee what tha-at feels luh-like! Please cum insi-ide me! Ple-ee-ease!”</i>");
	output("\n\nHer pleading and her tightness are enough to send you over the edge. You slam her down as far she’ll go and fire ");
	var cumQ:Number = pc.cumQ();
	if(cumQ >= 1000) output("a torrent of jizz into her. Her fuckhole isn’t meant to store such a massive quantity of [pc.cum], it seems, and most of it spurts out around your cock, spattering against your thighs and across her pink, feathered rump.");
	else if(cumQ >= 50) output("jet after jet of [pc.cum] inside her, a dribble of it oozing out around your dick. It looks like her fuckhole wasn’t built for storage.");
	else output("a spurt of [pc.cum] into her fuckhole. It seems that even her graft can handle such a small amount, and you barely feel it surge around your own dick.");
	output("\n\n<i>“Ohhhhhh...”</i> she says, looking shocked as you unload your seed deep inside her fuckhole.");
	output("\n\n<i>“That’s... really warm...”</i> she says, still looking surprised. You gasp, your dick still buried inside the Tlako.");
	output("\n\nYou tremble, your tired arms holding her up as she muses over the feeling of cum slowly dripping out of her.");
	if(pc.hasKnot(x)) 
	{
		output("\n\nShe wiggles a bit from side to side, and gives you a bemused look. <i>“You can put me down now,”</i> she says. <i>“If you’re done, that is,”</i> she adds with a hint of uncertainty.");
		output("\n\nYou chuckle a bit, and inform her that your knot is swollen inside her.");
		output("\n\n<i>“A knot?”</i> she gasps. <i>“It got tied up into a knot? Oh bankruptcy! That can’t be good! Oh, we need to get you to a medical specialist right away! I’m sorry - I had no idea my graft would do that! I’m so sorry!”</i>");
		if(pc.isNice()) output("\n\nYou immediately inform the tove that a knot is a portion of a penis that swells during sex, and can lock a partner in place for a period of time after. Tlako listens wide-eyed to your explanation and nods, looking greatly relieved by the time you finish.");
		else if(pc.isMischievous()) output("\n\nYou grin and decide to toy with the tove for a bit, putting on a show of being panicked as well. You exclaim that it’s never been tied in a knot before, and it must have tied itself to her. She panics, her feathers puffing out more and more with every word, looking terrified. Finally, with a boisterous laugh, you tell her the truth, explaining that it’s a part of your sexual organ, and that it’s a perfectly normal swelling. She frowns when you finish, letting out a low, angry whistle. <i>“So very rude!”</i> She huffs, the plume of feathers atop her head curling up like a cockatiel’s.");
		else output("\n\nYou roll your eyes at her and let out an exasperated sigh. In a few, terse words, you explain that it’s not an actual knot - it’s a temporary swelling of your cock, and that she really shouldn’t jump to such foolish conclusions. Her ears droop as you chastise her.");
	}
	output("\n\nWhen you finally soften enough to slip out of her, you put her down on your lap, where she looks up at you with a hopeful expression on her face. Finally at rest, you wipe your hands off against the bench, looking up to meet her gaze once you’ve caught your breath.");
	if(flags["FLORKED_TLAKO"] == undefined) output("\n\nShe’s wearing a somewhat perplexed expression on her bird-like face. You ask her what’s on her mind, and she answers, <i>“N-nothing - not really. I mean, it’s just, you looked like you were having a really, really nice time. I’m a little sad that I don’t get a chance to feel good.”</i> Her ears droop for a moment, then perk back up as she smiles, <i>“I should look into that. Toves don’t feel sexual pleasure, but maybe I could figure out something you could do for me, too - you know, if you’re feeling it.”</i>");
	else 
	{
		output("\n\nShe reaches over to your hand, tugging it to her as she bobs her head. <i>“Now me,”</i> she says softly. <i>“I looked into it - toves aren’t wired to feel sexual pleasure, but some kinds of physical contact feels good. Like, you could preen me... that is, if you want to...”</i> she says, bobbing her head gently.");
		output("\n\nYou smile and raise your hand to her head and begin stroking her. She reaches up to remove her headband, and you run your fingers through her plumage, beginning at her beak, sliding up between her ears, and down the back of her neck. She makes a humming noise as you do, her eyes closed in pleasure.");
		output("\n\nYou spend a good chunk of time like this, enjoying the oddly meditative act of petting Tlako. When your arms are finally tired for the second time, she smiles and leans forward to hug you, less awkwardly this time.");
	}
	output("\n\n<i>“Thank you very much for that, too. I’m glad I got to ");
	if(flags["FLORKED_TLAKO"] == undefined) output("try that out");
	else output("do that again");
	output(" with you,”</i> she says with a smile. You get dressed and she unlocks the front door, slipping her headband back on.");
	processTime(40);
	if(pc.hasKnot(x)) processTime(20);
	pc.orgasm();
	IncrementFlag("FLORKED_TLAKO");
	leaveTlakoButton();
}

public function leaveTlakoButton():void
{
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].westExit);
}

//No thanks
public function turnDownATovejob():void
{
	clearOutput();
	showTlako();
	output("\n\nYou chuckle and assure the little tove that thanks are all that you need, patting her head. She lets out a musical whistle as you do, blinking up at you. <i>“Okay,”</i> she says, <i>“but the offer is on the table.”</i>");
	processTime(1);
	tlakoMenu();
}

/*
Items:
Items introduced in Tlako’s Welcome Basket
Kalocrunch
Kalocrunch - This Camarilla-brand high-calorie snack food might be delicious, but is probably terrible for you. The silver packet displays a picture of a happy kui-tan stuffing her cheeks with tiny shapes. The "crunch" comes from the fact that it’s a blend of salt, solidified fat, and crystallized sugar. Now in Teriyaki!
	You crunch down on a mouthful of geometrically-shaped Kalocrunch, moderately surprised at the burst of flavor across your tongue. You wouldn’t say it’s delicious--it’s salty and sweet and crunchy at the same time. But despite that, you keep eating until you’ve finished the bag. You’re not particularly proud of yourself, and that probably wasn’t good for you, but you are immensely satisfied.
	[+2 thickness, -2 tone +30 Energy.]*/

//Kalocrunch

//Yibb-Tstll’s Reflexive Lube
//Yibb-Tstll’s Reflexive Lube! - This Camarilla-brand lubricant is applied as a suppository and is supposedly "Good for What Rails You!" The small, green capsule bears a picture of a tove with four thumbs up and an unsettling grin across his face. It will help you accommodate larger insertions at your backdoor. 
//	Use: You push the small, green capsule into your rear, feeling it slip surprisingly well into your bud. It dissolves instantly, bringing a slippery, lubed feeling to your asshole. That was... weird, but it seems to have worked.
//	[+2 to Anal wetness for 3 days]

//YTRLube

//Thermal Pack
//Thermal Pack - This disposable device is roughly the size of an egg. Upon activation, it emits a microwave field around you to protect you from some of the negative effects of the cold. It probably can’t handle the deep freezes of a snowstorm, though.
//	Use: You squeeze the top and bottom of the silver egg together. With a soft hum, it begins to float slowly around you, orbiting you like a tiny moon. Around its center, a red ring glows brightly, bathing you with a mild heat.
//	[Negates Freezing Cold Damage for 24 hours]

//ThermalPack