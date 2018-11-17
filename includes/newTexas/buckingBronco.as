//Bucking Bronco Saloon 
//-Night Trap
//Wiv Help from HugsAwwwwwrite (HugsAlright)

public function showJames(nude:Boolean = false):void
{
	var nudeS:String = "";
	if(nude) nudeS = "_NUDE";
	showBust("JAMES" + nudeS);
	showName("\nJAMES");
}

//Approach and Description
public function approachBuckBronoBonus():void
{
	output("A two-story rectangular building lies to the south, with a painted wooden sign emblazoned “Bucking Bronco Saloon”. Upon closer inspection, you notice there is a white line running diagonally through the B, creating a letter that could be read as either B or F.");
	if(pc.isTreated()) output(" Nice!");
	else output(" Charming.");
	output(" A sign above the doors reads in flowery script <i>“The Broodmare Bordello located on second floor.”</i>");
	if(rand(10) <= 3) 
	{
		output("\n\nYou also see the occasional cowgirl being bent over the railings for a quickie");
		if(silly) output("; how gentlemanly!");
		else output("...");
	}
	else if(rand(10) <= 2) output("\n\nThere are several clusters of people on the porch that encircles the building, some of them leaning against the exterior wall, many sitting in chairs arranged next to barrels that upon closer inspection are revealed to have hardlight devices built into the tops of them, projecting old Terran games such as checkers and tables.");
	//Original: [APPROACH]: A two-story rectangular building lies to the [CARDINAL DIRECTION], with a painted wooden sign emblazoned “Bucking Bronco Saloon”. Upon closer inspection, you notice there is a white line running diagonally through the B, creating a letter that could be read as either B or F. [If Bro or Ditz: Nice! //else: Charming.} There are several clusters of people on the porch that encircles the building, some of them leaning against the exterior wall, many sitting in chairs arranged next to barrels that upon closer inspection are revealed to have hardlight projectors built into the tops of them, projecting old Terran games such as checkers and tables. You also see the occasional cowgirl being bent over the railings for a quickie{silly mode: ; how gentlemanly!}. The entrance to the Bucking Bronco consists of well-worn, varnished wooden saloon doors. A sign above the doors reads in flowery script <i>“The Broodmare Bordello located on second floor.”</i>");
}

public function saloonInteriorBonus():Boolean
{
	author("Night Trap");
	output("Live piano music and the chatter of patrons fill your ears the moment you walk through the saloon doors. The entryway of the Bucking Bronco is extremely low-tech; aside from a modern synthetic carpet for customers to wipe their feet on, there is only a large taxidermied varmint posed on its hind legs holding in its forelegs a sign that reads, <i>“No shirt, no shoes, no problem!”</i> Further inside, you see dozens of circular wooden tables with matching wooden chairs arranged around them, most of them occupied by happy bar-goers, not all of whom are clothed. The walls are decorated with the stuffed heads of ferocious-looking creatures, from ");
	if(silly) output("rodents of unusual size");
	else output("varmints of vastly different shapes and sizes");
	output(" to a few truly alien ones your Codex can’t immediately recognize, and oil paintings depicting nude cowgirls in repose made decent only by wispy sheets of silk. The wall opposite the entrance is dominated by a wooden bar. Behind the bar is a sign that reads, <i>“Ask about our Five Finger Discount!”</i>");
	if(silly) output(" This place is way better than the last saloon you went to. It’s got blackjack, and hookers!");

	output("\n\nIn the center of the room sits a shallow pit filled with padding surrounding a mechanical bull fashioned to look like a stallion with a large horse dildo incorporated into the saddle. A sign next to the pit reads “The Fucking Bronco”.");

	output("\n\nYou see a flight of stairs along the western wall that leads up to the second floor, where the Broodmare Bordello is located.");

	output("\n\nThe eastern side of the building has a small stage acoustically designed for performances without sound systems. Near the stage is a piano, ");
	if(flags["MET_SYDNEY"] == undefined) output("currently being played by, of all things, a Thraggen man in antiquated Terran clothing. He seems less muscular than most Thraggen, likely a consequence of having a sedentary job as a musician. The tiny bowler hat on his head does a good job of making him appear less threatening.");
	else output("and like usual, Sydney is playing a jaunty tune on it.");

	if(flags["MET_JAMES"] == undefined) output("\n\nYou see what looks to be an untreated human man in period attire serving drinks at the bar.");
	else output("\n\nYou see James serving drinks at the bar.");

	if(flags["LIVING_KEGGED"] == undefined) output("\n\nThere’s a group of naked cowgirls lined up near the bar, each of them sporting a spectacular bust with beads of various colored liquids forming on their stiff teats.");
	else output("\n\nThose tit-modded cowgirls are lined up at their usual spot by the bar, ready to give you, and everyone else in the saloon, a taste of whatever their bountiful breasts have to offer, all of them giggling and bouncing around happily.");
	
	//[Bartender] //replace with [James] after first time player selects this
	if(flags["MET_JAMES"] == undefined) addButton(0,"Bartender",imRickJamesBiyaaaaatch,undefined,"Bartender","See about getting a drink.");
	else addButton(0,"James",imRickJamesBiyaaaaatch,undefined,"James","See about getting a drink from the moustache-touting mechanical mirth dispensor.");
	//[Order Food] //bring up Food Menu
	addButton(1,"Food",bbFoodMenu,undefined,"Order Food","See what’s on the menu?");
	//[Cowgirls] //replace with [Living Kegs] after first time player selects this
	if(flags["LIVING_KEGGED"] == undefined) addButton(2,"Cowgirls",livingKegsApproach,undefined,"Cowgirls","Check out the booze-leaking cow-girls.");
	else addButton(2,"Living Kegs",livingKegsApproach,undefined,"Living Kegs","Drinks are better fresh from the tap!");
	//[Rum Cow] Follow the wonderful scent of that cowgirl to the bar. //replace with [Sally] after the first time the player selects this.
	if(sallyBarHours())
	{
		if (isBrandyWithSally())
		{
			if (flags["MET_BRANDY_SALLY"] == undefined) output("\n\nLooking along the bar, where you'd normally see an empty seat next to Sally, you instead see New Texas' own minty-haired, mute cowgirl: Brandy. The quiet queenie is carrying out as much of a conversation as she can with Sally, blushing and giggling silently every once in awhile. Like her rum-titted friend (girlfriend?), Brandy appears to be <i>completely naked</i>.");
			else output("\n\nSally and Brandy are sitting together at bar again, both of them completely nude. The darker-skinned cowgirl points you out to her girlfriend, and they both wave happily at you.");
			addButton(3,"Sally & Brandy",approachBrandySally,undefined,"Sally & Brandy","Follow the wonderful scent of the cowgirls to the bar.");
	
		}
		else
		{
			if(flags["MET_SALLY"] == undefined) output("\n\nThat dark-skinned, rum-titted cowgirl is sitting at the bar and sipping a drink. She’s still completely nude, and you can practically smell whatever kind of pheromones she’s producing from over here, almost like the scent is calling you over to her.");
			else output("\n\nSitting at the bar with a drink in her hands, and a lust-inducing haze surrounding her, is Sally, that rum-cow you met before. She’s looking at you like she knows her pheromones are already at work on your mind.");
			addButton(3,(flags["MET_SALLY"] == undefined ? "Rum Cow" : "Sally"),approachSally,undefined,(flags["MET_SALLY"] == undefined ? "Rum Cow" : "Sally"),"Follow the wonderful scent of that cowgirl to the bar.");
	
		}
	}
	//[Ride Bronco]
	addButton(4,"Ride Bronco",ridingTheBuckingBronco,undefined,"Ride Bronco","Get on that perverted horsey!");
	//put the bar-based NPC blurbs like Kiro, Erra, and Anno here
	roamingBarEncounter(5);
	if (ciaranAvailable()) ciaranBroncoAddendum(7);
	// 9999 - Disable other directions until content is available!
	setNavDisabled(NAV_EAST_DISABLE);
	setNavDisabled(NAV_WEST_DISABLE);
	return false;
}
public function saloonStairsBonus():Boolean
{
	switch(currentLocation)
	{
		case "BRONCO STAIRS 1": addButton(5, "Up", move, "BRONCO STAIRS 2"); break;
		case "BRONCO STAIRS 2": addButton(7, "Down", move, "BRONCO STAIRS 1"); break;
	}
	return false;
}

// Discount Stuff
public function freeDrinkAtBuckingBronco():Boolean
{
	return (flags["BB_5FINGER_DISCOUNT"] == 1 || pc.hasStatusEffect("Bucking Bronco Free Drinks"));
}
public function payForDrinkAtBuckingBronco(nPrice:Number = 0):void
{
	if(flags["BB_5FINGER_DISCOUNT"] == 1) { flags["BB_5FINGER_DISCOUNT"] = 2; }
	else if(pc.hasStatusEffect("Bucking Bronco Free Drinks")) { /* Free Drinks! */ }
	else pc.credits -= nPrice;
}

//NPCs
//James- An android with a large handlebar mustache. He stands 6’4 with white hair and red eyes and was originally created as a bodyguard model. Think The Terminator as a bartender. He served as a bodyguard for the mysterious woman who owns the Bucking Bronco, and when she retired to New Texas she brought James with her. James is often no-nonsense, but he can be a cheeky git when he wants. He’s always ready with a pearl of wisdom, never mind that he may have just looked it up on the Extranet a few seconds ago. He wears a white, collared long-sleeve shirt with brass buttons with a black bow-tie and black sleeve garters that emphasize his large biceps, a red vest, and black pants, boots, and a black apron from his waist to his shins. His dick is the dick on the mechanical bull, but that’s a secret. Only highly observant PCs will notice.

//Annebelle- A cowgirl waitress of 6’5 with silver hair with two inch horns, not large enough to grip while mounting her, but they still add to her cute physique nonetheless. Big tiddies, unspecified size, but they’re big.

//Ciaran- A Hellhound man of 7’8 with coal-black fur, gold-colored eyes, and coarse body hair. He works as something of a game warden or ranger, managing the varmint population in the area and ensuring the ecosystem is stable enough that the varmints don’t wander too close to civilization. He’s a widower with a half-kaithrit daughter. He doesn’t get to talk to people very often at his job. He’s very sexually aggressive to the point of just fucking people on the table, but he loves extended conversations with women. He doesn’t like to talk much himself, and he is very skilled at getting people to talk to him. He hangs out in the saloon to talk with the whores who are on break. He gets free drinks for dressing like some sort of Old West desperado.

//Living Kegs- Treated girls who have had their mammaries modded to produce different alcohols. Each girl has a slightly different personality based on what she lactates.

//Sally- One of the living kegs who can be found after hours at the bar. A very motherly, dusky-skinned cowgirl with lust-inducing pheromones and alcoholic lactation who can be sexed up and talked to.

//Ms. Kittie- A Treated kaithrit amazon and madam of the Broodmare Bordello, known by locals as the Cathouse. A MILF-y lady of [whatever middle age is for kaithrit] who has had many a half-kaithrit child. She stands 7’9 with HH-cup breasts. She wears a red and black saloon girl outfit straight out of a movie. Bodice, black lace, black velvet gloves, high boots, frilly garters and lacy (probably hardlight equipped) undergarments. While she is an amazon, she loves to be a powerbottom who teases her partners into taking her as hard as they can.

//Sydney- Thraggen reverse trap piano player. Thanks to extreme sexual dimorphism on New Texas, she is easily mistaken for a man since she is extremely muscular but has small breasts.

//James the Bartender

//Appearance
//[Appearance]
public function jamesAppearance():void
{
	clearOutput();
	showJames();
	author("Night Trap");
	output("James is a 6\' 4\" android built to look like a human while still being subtly artificial. He has statuesque features that make his apparent age hard to pin down, with a chiseled jawline and smooth, flawless tan, but artificial skin, complemented by his slicked-back white hair and red eyes. His upper lip is obscured by an impressively large waxed handlebar mustache, but he is otherwise clean-shaven. His thick neck is encircled by an antiquated black silk bowtie, tied in large loops.");
	output("\n\nHe is wide-framed with an incredibly defined musculature");
	if(pc.characterClass == GLOBAL.CLASS_MERCENARY) output(", and you know that he’s strong enough to tear a human’s arm off with minimal effort");
	else output(" that you can’t help but admire");
	output(". Somehow he has managed to squeeze his massive arms into a white long-sleeved formal shirt with black sleeve garters and a red vest. Tied around his waist is a black bar apron that extends to just below his knees, concealing his groin from view. His powerful legs are clad in black slacks tucked into a pair of tall black boots.");
	output("\n\nHe smiles winningly at you as you regard him, flashing his perfect white teeth.");
	jamesMenu();
	addDisabledButton(5,"Appearance");
}

//Approach to bar
public function imRickJamesBiyaaaaatch():void
{
	clearOutput();
	showJames();
	author("Night Trap");
	if(flags["MET_JAMES"] == undefined) 
	{
		output("As you ");
		if(pc.isBro()) output("swagger");
		else if(pc.isBimbo()) output("sashay");
		else output("mosey");
		output(" up to the bar you lock eyes with the bartender, who shoots you a welcoming smile and greets you warmly. <i>“Welcome to the Bucking Bronco");
		if(silly) output(", how tough are ya?");
		else output(", " + pc.mf("sir","ma’am") + ".");
		output(" My name is James, and it’d be my pleasure to serve you. Now, what can I get for you?”</i> It’s obvious this close from his eyes and skin that James is an android, and a top-quality one at that.");
		flags["MET_JAMES"] = 1;
	}
	else 
	{
		output("As you ");
		if(pc.isBro()) output("swagger");
		else if(pc.isBimbo()) output("sashay");
		else output("mosey");
		output(" back up to the bar, you lock eyes with James, who shoots you a welcoming smile and greets you warmly. <i>“Welcome back to the Bucking Bronco " + pc.mf("sir","ma’am") + ". What can I do for you this time?”</i>");
	}
	//Go to James menu");
	////Talk
	//[Order] Order something to drink.
	//[Himself] Find out more about the exotic android.
	//[Flirt] See what the synthetic stud’s stuffed in his slacks.
	//[Advice] Bartenders always have sage advice to give, right?
	//[Discount] Ask James about the five finger discount.
	jamesMenu();
}

public function jamesMenu():void
{
	clearMenu();
	addButton(0,"Order",jamesDrinkMenu,undefined,"Order","Order something to drink.");
	addButton(1,"Himself",askJamesAbootHisRoboSelf,undefined,"Himself","Find out more about the exotic android.");
	addButton(2,"Flirt",flirtWithJames,undefined,"Flirt","See what the synthetic stud’s stuffed in his slacks.");
	addButton(3,"Advice",askJamesForAdvice,undefined,"Advice","Bartenders always have sage advice to give, right?");
	if(flags["BB_5FINGER_DISCOUNT"] == 1) addDisabledButton(4,"Discount","Discount","You just did that.");
	else addButton(4,"Discount",jamesFistFuckerDiscount,undefined,"Discount","Ask James about the five finger discount.");
	addButton(5,"Appearance",jamesAppearance,undefined,"Appearance","Get a closer look at him.");
	addButton(14,"Back",mainGameMenu);
}

//[Himself]
public function askJamesAbootHisRoboSelf():void
{
	clearOutput();
	showJames();
	author("Night Trap");
	output("You ask the synthetic server to tell you about himself.");
	output("\n\n<i>“Well, I’m a Reaper Armaments bodyguard android. People prefer VIs for most combat roles since a VI is about as effective and far cheaper, but the truly wealthy and the truly friendless spring for AIs such as myself; if you can buy a real friend who literally </i>can’t<i> betray your trust, what reason do you have not to? Erm, not that my owner is truly friendless of course!”</i> James blushes when he realizes what he just implied. <i>“If anything I meant it as a compliment to her. See, my type of android is very expensive to make, and demand is limited enough that we aren’t mass produced. Each of us is custom-built to the specifications of the customer. Certain elements of my design,”</i> the android strikes a bodybuilder’s pose that threatens to destroy his clothes as he says this, <i>“meant that I was three times the price of most of my siblings. I guess I’m lucky my owner has a good eye for men.”</i> James stops flexing his synthetic muscles before any of the seams in his clothes burst.");
	output("\n\n<i>“In terms of my personal history, I served my owner, who is also the owner of this fine establishment by the way, as a bodyguard for 14 years. When she retired to New Texas eight years ago, she brought me along. She’s very generous to those who serve her well; she offered me my freedom when she retired, but I turned her down. She’s a very kind woman, and I’m not made to self-actualize anyway.”</i>");
	output("\n\nYou comment that you’re surprised anyone would turn down freedom. Doesn’t he want to go his own way? To live for himself?");
	output("\n\nJames laughs good-naturedly at your question. <i>“Most folks, at least those who haven’t taken the Treatment, are always searching for their purpose in life. Lucky me then being built with a crystal-clear purpose: to guard my mistress and do what she tells me. Even luckier for me that she’s rich enough to afford anti-agathic therapy and is content to lead a very danger-free life. It means she’ll be around pretty much forever.”</i> He finishes his last statement with a contented sigh and a slightly glazed-over look; if you didn’t know any better you’d think he was a lovestruck teenager!");
	output("\n\nJames must have realized what he was doing, because he quickly clears his throat and speaks again, provoking a " + pc.mf("chuckle","giggle") + " from you that brings a blush to his cheeks.");
	output("\n\n<i>“Sorry, I shouldn’t even be talking about my mistress like this. She’s a very private woman. She’s not a recluse you understand. She just enjoys anonymity. My mistress likes to go around in public without people knowing who she is; any woman you see in the area could well be her.”</i>");
	output("\n\nWell that’s certainly eccentric. It’s doubtful you’ll get any more information about this mysterious owner from her bodyguard, so you decide to change the topic, opting instead to press James for more details about himself. He’s mostly told you about his owner so far anyway.");
	output("\n\n<i>“Yeah, I guess you’re right. There’s not too much more to say. I stood behind my owner at business meetings and looked intimidating. 14 years of that without any major incidents. I guess that at least means I was doing my job right.”</i>");

	//First time you ask about himself:
	if(flags["JAMES_SELF_TALK"] == undefined)
	{
		output("\n\nHe looks at you curiously. <i>“What about you? I haven’t gotten your name yet.”</i>");
		output("\n\n<i>“Steele. [pc.name] Steele.”</i>");
		output("\n\nJames wipes his hand on his apron before offering you a handshake. You accept, and find he has a grip like a hydraulic press.");
		if(silly) output(" For some reason you have an overwhelming urge to tell him <i>“You’re terminated, fucker.”</i>");
		flags["JAMES_SELF_TALK"] = 1;
	}
	processTime(8);
	jamesMenu();
	addDisabledButton(1,"Himself","Himself","You just talked about that.");
}

//[Flirt]
public function flirtWithJames():void
{
	clearOutput();
	showJames();
	author("Night Trap");
	output("Putting on the old Steele charm, you ask James in your most seductive tone ");
	if(pc.isBro() || pc.isAss()) output("if he wants to fuck");
	else if(pc.isBimbo()) output("if he wants you to suck his cock");
	else if(pc.isMischievous()) output("when he <i>gets off</i>");
	else output("if he would care for a roll in the hay");
	output(".");

	output("\n\nThe beefy android grins at your proposition, but shakes his head ruefully. <i>“I’m not allowed to while I’m on the job I’m afraid. It’s easy when pheromones just don’t work on you. Not that that has ever stopped some of the, shall we say, friendlier cows around these parts. About the dozenth time one of them snuck around behind the bar to fellate me, my boss told me to stop wearing my dick to work.”</i>");

	output("\n\nShe what?");

	output("\n\nYour incredulous expression provokes a chuckle from James. <i>“I was created as a bodyguard. Having genitals in the first place was an upgrade my owner paid extra for. Hell, she went a step above that and got a modular genital arrangement for me. I can support pretty much any synth-cock on the market. I’m particularly fond of the equine cock from Kiha Corp. Speaking of which, if you’re really so horny you just can’t help but flirt with the saloon’s </i>terribly busy<i> employees when there’s a whorehouse in the same building, might I suggest taking the Fucking Bronco for a ride?”</i> He gestures to the contraption in the center of the saloon. <i>“If you can hold on until the end of the ride you’ll get free drinks for a day. I’ve heard it’s great fun, and many just love seeing the beautiful women of New Texas having their most attractive features jiggled and bounced around.”</i>");
	output("\n\nYou tell him you’ll consider giving it a ride.");
	output("\n\nHe flashes you a conspiratorial wink. <i>“I for one would </i>love<i> to see what you can do.”</i>");
	//pass 2 minutes, return to talk menu
	processTime(5);
	jamesMenu();
	addDisabledButton(2,"Flirt","Flirt","You just talked about that.");
}

//[Advice]
public function askJamesForAdvice():void
{
	clearOutput();
	showJames();
	author("Night Trap");
	output("Bartenders in fiction always give the hero some fresh perspective on their problems. It seems worth a shot to ask James if he has any advice. At the very least you could get a synthetic’s take on your quest. You paint the broad strokes of your quest and inform the android of the latest goings-on in your journey to claim your inheritance.");
	output("\n\nJames listens eagerly to your story, a bit incredulous throughout. When you finish speaking he gives you his thoughts. <i>“Well, that’s quite a tale " + pc.mf("Mr.","Mrs.") + " Steele. And you’re asking me for advice?”</i>");
	output("\n\nYou shrug, saying it couldn’t hurt.");
	output("\n\nHe takes a moment to think, still cleaning and drying glasses and mugs the whole time. Finally, he shares his wisdom with you. <i>“");
	//First probe has not been found:
	if(flags["UNLOCKED_JUNKYARD_PLANET"] == undefined) output("Maybe it won’t work out. But seeing if it does will be the best adventure you’ll ever have.");
	//First probe found but not second: 
	else if(flags["PLANET_3_UNLOCKED"] == undefined) output("What lies behind you and what lies in front of you, pales in comparison to what lies inside of you.");
	//First and second probes found but not third:
	else if(!reclaimedProbeMyrellion()) output("Great works are performed not by strength but by perseverance.");
	else output("Perseverance is a great element of success. If you only knock long enough and loud enough at the gate, you are sure to wake up somebody.");
	output(" Does that help you at all?”</i>");

	output("\n\nYou smile and thank James, telling him that his words were inspiring.");
	output("\n\nHe chuckles and returns your thanks. <i>“That’s good, because I just looked that one up on the extranet when you asked. I hope you realize that I’m only a few years older than you are, and I’ve spent most of my life standing still and looking menacing.”</i>");
	output("\n\nWell, that’s certainly less inspiring. You suppose the fact that they weren’t his own words doesn’t make them any less true though. Thanking the android again for the words of wisdom, you decide to move on.");
	output("\n\n<i>“Any time, [pc.name].”</i>");
	processTime(4);
	jamesMenu();
	addDisabledButton(3,"Advice","Advice","You just talked about that.");
}

//[Five Finger Discount]
public function jamesFistFuckerDiscount():void
{
	clearOutput();
	showJames();
	author("Night Trap");
	output("You gesture to the sign behind the bar that mentions a discount and ask James what it means.");
	output("\n\nHe grins cheekily at you. <i>“Oh yes, the Five Finger Discount. It’s a little something we have to encourage, let’s just say, a certain class of clientele to visit us. You can get one free drink, anything you want, if you qualify for it.”</i>");
	output("\n\nYour curiosity piqued by the mention of free booze, you ask him how to qualify for it.");
	output("\n\nJames’s grin widens at your question. <i>“Well you’re probably aware by now that the people of New Texas are more endowed than the galactic average. Tourists often have trouble </i>fitting in<i> on New Texas, so if you can prove you’re able to keep up with locals, we’ll encourage you to stay with a little libation. To cut to the chase: if I can fit my fist in your pussy or ass, I’ll announce it to the saloon and you can get a free drink. It lets the locals know you can handle a Treated cock, and the drink helps make it even easier for you.”</i>");
	output("\n\nYour cheeks color at the android’s words. A free drink for letting the whole building know you can fit one of his giant hands into your orifices? Is that really worth it?");
	output("\n\nNoticing that you’re lost in your thoughts, James speaks up again. <i>“Obviously you don’t have to do it if you don’t want to. It’s mostly just a fun thing the boss came up with.”</i>");
	output("\n\nDo you let the android try to fist you, and if so, which orifice do you choose?");
	processTime(5);
	clearMenu();
	//[Vagina] [Ass] [Nope]
	if(pc.hasVagina()) addButton(0,"Vagina",grabEmByThePussyTheyllLetYa);
	else addDisabledButton(0,"Vagina","Vagina", "You need a vagina for this!");
	addButton(1,"Ass",fiveFingahAsscount);
	addButton(2,"Nope",nopeNoFiveFingerCuntPunch);
}

//[Vagina]
public function grabEmByThePussyTheyllLetYa():void
{
	clearOutput();
	showJames();
	author("Night Trap");
	output("You tell James you’d like to see if you can qualify with your pussy.");
	output("\n\nHe smiles, but otherwise acts as if you had just ordered a drink from him. <i>“Sure thing " + pc.mf("sir","ma’am") + ". If you would just step over to the end of the bar please and remove any potential obstructions. I’ll need to grab the necessary items.”</i>");
	output("\n\nYou move to the end of the bar, realizing as you walk that just about everyone who was at the bar is now watching you. ");
	if(!pc.isCrotchExposed())
	{
		output("When you reach your destination you begin removing ");
		if(!pc.isCrotchExposed()) output("your [pc.crotchCover]");
		else output("what little gear you have on.");
		output(" By the time you’re finished James has approached you.");
	}
	else output("James approaches you casually.");
	output(" He slips a sterile nano-fiber glove onto his right hand before applying a generous amount of lubricant to it. <i>“Are you ready?”</i>");

	output("\n\nYou take a deep breath and nod, steeling yourself for what’s about to happen.");
	var x:int = pc.biggestVaginaIndex();
	output("\n\nYou gasp at the chilly feeling of the lubricant as James’s fingers begin to slip into your [pc.cunt " + x + "], but thankfully the lube warms up in a few seconds. Your gasp becomes one of lust as first one thick finger, then another works its way into your womanhood. When a third finger joins in, you have to bite your lip to stifle a moan.");

	//Do a capacity check for the PC’s vagina. I don’t know what the volume of a large fist would be, but that’s what the volume of PC’s vagina needs to be. If PC’s vagina is too small, go to “pussy too tight”. If the fist fits, go to “Pussy success”.
	
	if(pc.vaginalCapacity(x) < 300)
	{
		output("\n\nYou’re already near your limit as the third thick digit stretches your tunnel wide. When James tries to add his fourth finger to your pussy, you cry out and grab his arm to stop him. He withdraws his fingers as quickly as is comfortable for you, leaving your cunny gaping temporarily from being pushed to its limit.");
		//Helps you get started, but can't just farm it indefinitely. Go fuck.
		pc.cuntChange(x,275);
		output("\n\nYou pant lightly from the strain as the android consoles you. <i>“There’s no reason to be embarrassed. Like they say, ‘everything’s bigger on New Texas.’ Why don’t you get a little practice and try again sometime?”</i> He pats you on the shoulder with his other hand before removing his glove, washing his hands, and returning to his duties at the bar.");
		output("\n\nYou get dressed again in short order, trying to ignore the fact that half the people in the building just watched you ask to get fisted and then back out halfway through.");
	}
	//Pussy success:
	else
	{
		output("\n\nIt’s all you can do to stay calm as the handsome android packs your cunny with his hand. When he fits a fourth finger into you and still doesn’t encounter any serious resistance, he finally begins to form a fist inside your pussy. A moan of delight rings out of you as the synthetic fist stretches your walls. James moves his hand in up to the wrist, leaving your [pc.thighs] shaking. Before you can really get into it though, he starts to withdraw his fist. You groan in dismay, your [pc.cunt " + x + "] feeling terribly empty.");
		pc.cuntChange(x,275);
		output("\n\nJames removes his glove and shouts as loudly as he can to the entire saloon <i>“We’ve got a new one here today folks! " + pc.mf("His","Her") + " pussy is ready for business!”</i> Your cheeks burn from both arousal and the fact that the volume of your vagina has just been announced to the general public. James turns to you before heading back to his duties at the bar. <i>“You can collect your free drink any time you want.”</i> He winks before leaving you to redress. When you’ve suited up again you return to the bar to claim your prize, the eyes of many patrons, local and tourist alike, following you as you walk.");
		flags["BB_5FINGER_DISCOUNT"] = 1;
	}
	pc.exhibitionism(1);
	processTime(5);
	pc.lust(20);
	jamesMenu();
}

//[Ass]
public function fiveFingahAsscount():void
{
	clearOutput();
	showJames();
	author("Night Trap");
	output("You tell James you’d like to see if you can qualify with your ass.");
	output("\n\nHe smiles, but otherwise acts as if you had just ordered a drink from him. <i>“Sure thing " + pc.mf("sir","ma’am") + ". If you would just step over to the end of the bar please and remove any potential obstructions. I’ll need to grab the necessary items.”</i>");
	output("\n\nYou move to the end of the bar, realizing as you walk that just about everyone who was at the bar is now watching you. ");
	if(!pc.isAssExposed())
	{
		output("When you reach your destination you begin removing your [pc.crotchCover]. By the time you’re finished James has approached you.");
	}
	else output("James approaches you casually.");
	output(" He slips a sterile nano-fiber glove onto his right hand before applying a generous amount of lubricant to it. <i>“Are you ready?”</i>");

	output("\n\nYou take a deep breath and nod, steeling yourself for what’s about to happen.");
	//Do a capacity check for the PC’s anus. I don’t know what the volume of a large fist would be, but that’s what the volume of PC’s anus needs to be. If PC’s anus is too small, go to “ass too tight”. If the fist fits, go to “Ass success”.

	output("\n\nYou gasp at the chilly feeling of the lubricant as James’s fingers begin to slip into your [pc.asshole], but thankfully the lube warms up in a few seconds. Your gasp becomes one of lust as first one thick finger, then another works its way into your sphincter. When a third finger joins in, you have to bite your lip to stifle a moan.");

	//Ass too tight:
	if(pc.analCapacity() < 300)
	{
		output("\n\nYou’re already near your limit as the third thick digit stretches your anus wide. When James tries to add his fourth finger to your butt, you cry out and grab his arm to stop him. He withdraws his fingers as quickly as is comfortable for you, leaving your asshole gaping temporarily from being pushed to its limit.");
		pc.buttChange(275);
		output("\n\nYou pant lightly from the strain as the android consoles you. <i>“There’s no reason to be embarrassed. Like they say, ‘everything’s bigger on New Texas.’ Why don’t you get a little practice and try again sometime?”</i> He pats you on the shoulder with his other hand before removing his glove, washing his hands very thoroughly, and returning to his duties at the bar.");
		output("\n\nYou get dressed again in short order, trying to ignore the fact that half the people in the building just watched you ask to get fisted and then back out halfway through.");
	}
	//Ass success:
	else
	{
		output("\n\nIt’s all you can do to stay calm as the handsome android packs your bowels with his hand. When he fits a fourth finger into you and still doesn’t encounter any serious resistance, he finally begins to form a fist inside your ass. A moan of delight rings out of you as the synthetic fist stretches your intestines. James moves his hand in up to the wrist, leaving your [pc.thighs] shaking. Before you can really get into it though, he starts to withdraw his fist. You groan in dismay, your [pc.asshole] feeling terribly empty.");
		pc.buttChange(275);
		output("\n\nJames removes his glove and shouts as loudly as he can to the entire saloon <i>“We’ve got a new one here today folks! " + pc.mf("His","Her") + " ass is ready for business!”</i> Your cheeks burn from both arousal and the fact that the volume of your anus has just been announced to the general public. James turns to you before heading back to his duties at the bar. <i>“You can collect your free drink any time you want.”</i> He winks before leaving you to redress. When you’ve suited up again you return to the bar to claim your prize, the eyes of many patrons, local and tourist alike, following you as you walk.");
		flags["BB_5FINGER_DISCOUNT"] = 1;
	}
	//add 40 lust, do anal stretching check, pass 5 minutes, add exhibitionism, return PC to James’s talk menu, if PC got fisted make their next drink free.
	processTime(5);
	pc.exhibitionism(1);
	pc.lust(20);
	jamesMenu();
}

//[Nope]
public function nopeNoFiveFingerCuntPunch():void
{
	clearOutput();
	showJames();
	author("Night Trap");
	output("Deciding you would rather not have a very large fist inserted into your most sensitive places in public, you decline the bartender’s offer. He nods understandingly. <i>“Many tourists decline the offer as well. The New Texas culture isn’t for everyone of course.”</i>");
	output("\n\nYou thank him for the offer before changing the topic.");

	//past 2 minutes, return PC to James’s talk menu
	processTime(1);
	jamesMenu();
}

//Drinks and Foods
public function jamesDrinkMenu():void
{
	clearOutput();
	showJames();
	author("Night Trap");
	output("What will you order?");
	clearMenu();
	if(pc.isSmashed())
	{
		addDisabledButton(0,"Milk Stout","Milk Stout","You’re too drunk for one of these.");
		addDisabledButton(1,"Leithan Milk","Leithan Milk","You’re too drunk for one of these.");
		addDisabledButton(2,"Milktini","Milktini","You’re too drunk for one of these.");
		addDisabledButton(3,"V.Whiskey","Varmintbite Whiskey","You’re too drunk for one of these.");
		addDisabledButton(4,"Raging Bull","Raging Bull","You’re too drunk for one of these.");
	}
	else
	{
		if(freeDrinkAtBuckingBronco())
		{
			addButton(0,"Milk Stout",drinkAtBuckingBronco,"Milk Stout","Milk Stout","A stout, or dark beer, containing lactose, giving it a sweeter taste and more nutritional content.");
			addButton(1,"Leithan Milk",drinkAtBuckingBronco,"Leithan Milk","Leithan Milk","Breastmilk from a Treated leithan. While it isn’t truly alcoholic, it produces an effect very similar to intoxication in humans. It is also a potent aphrodisiac, making this drink extremely popular with tourists hoping to keep up with the sex drives of the locals.");
			addButton(2,"Milktini",drinkAtBuckingBronco,"Milktini","Milktini","A blend of milk, vodka, and white chocolate liqueur.");
			if(!pc.isDrunk()) addButton(3,"V. Whiskey",drinkAtBuckingBronco,"Varmintbite Whiskey","Varmintbite Whiskey","Produced by one of the oldest breweries on New Texas, Varmintbite is so named because it once contained the venom of a now-extinct variety of varmint. The venom today is synthesized and perfectly harmless on its own, but it still retains its signature enzymatic effect, causing imbibers of most species to become roaringly drunk almost instantly.");
			else addDisabledButton(3,"V. Whiskey","Varmintbite Whiskey","You’re too drunk for one of those.");
			if(!pc.isDrunk()) addButton(4,"Raging Bull",drinkAtBuckingBronco,"Raging Bull","Raging Bull","A bomb shot drink consisting of a glass of milk stout with a shot of Irish cream and Varmintbite whiskey dropped into it, chugged as quickly as possible. This drink can render even the most iron-livered bull utterly shit-faced in just a few seconds.");
			else addDisabledButton(4,"Raging Bull","Raging Bull","You’re too drunk for one of these.");
		}
		else
		{
			if(pc.credits >= 5) addButton(0,"Milk Stout",drinkAtBuckingBronco,"Milk Stout","Milk Stout","A stout, or dark beer, containing lactose, giving it a sweeter taste and more nutritional content.\n\nCost: 5 Credits");
			else addDisabledButton(0,"Milk Stout","Milk Stout","You cannot afford the 5 credits for this drink.");
			
			if(pc.credits >= 8) addButton(1,"Leithan Milk",drinkAtBuckingBronco,"Leithan Milk","Leithan Milk","Breastmilk from a Treated leithan. While it isn’t truly alcoholic, it produces an effect very similar to intoxication in humans. It is also a potent aphrodisiac, making this drink extremely popular with tourists hoping to keep up with the sex drives of the locals.\n\nCost: 8 Credits");
			else addDisabledButton(1,"Leithan Milk","Leithan Milk","You cannot afford the 8 credits for this drink.");
			
			if(pc.credits >= 10) addButton(2,"Milktini",drinkAtBuckingBronco,"Milktini","Milktini","A blend of milk, vodka, and white chocolate liqueur.\n\nCost: 10 Credits");
			else addDisabledButton(2,"Milktini","Milktini","You cannot afford the 10 credits for this drink.");

			if(!pc.isDrunk()) 
			{
				if(pc.credits >= 15) addButton(3,"V.Whiskey",drinkAtBuckingBronco,"Varmintbite Whiskey","Varmintbite Whiskey","Produced by one of the oldest breweries on New Texas, Varmintbite is so named because it once contained the venom of a now-extinct variety of varmint. The venom today is synthesized and perfectly harmless on its own, but it still retains its signature enzymatic effect, causing imbibers of most species to become roaringly drunk almost instantly.\n\nCost: 15 Credits");
				else addDisabledButton(3,"V.Whiskey","Varmintbite Whiskey","You cannot afford the 15 credits for this drink.");
			}
			else addDisabledButton(3,"V.Whiskey","Varmintbite Whiskey","You’re too drunk for one of those.");

			if(!pc.isDrunk()) 
			{
				if(pc.credits >= 30) addButton(4,"Raging Bull",drinkAtBuckingBronco,"Raging Bull","Raging Bull","A bomb shot drink consisting of a glass of milk stout with a shot of Irish cream and Varmintbite whiskey dropped into it, chugged as quickly as possible. This drink can render even the most iron-livered bull utterly shit-faced in just a few seconds.\n\nCost: 30 Credits");
				else addDisabledButton(4,"Raging Bull","Raging Bull","You cannot afford the 30 credits for this drink.");
			}
			else addDisabledButton(4,"Raging Bull","Raging Bull","You’re too drunk for one of these.");
		}
	}
	addButton(14,"Back",backToJames);
}

public function backToJames():void
{
	clearOutput();
	showJames();
	author("Night Trap");
	output("What will you ask of the bartender now?");
	jamesMenu();
}

public function aphrodisiacMilkEffect():void
{
	if(!pc.hasStatusEffect("Ellie's Milk"))
	{
		if(pc.hasStatusEffect("Aphrodisiac Milk")) pc.setStatusMinutes("Aphrodisiac Milk",1440);
		else pc.createStatusEffect("Aphrodisiac Milk",0,0,0,0, false, "LustUp", "This milk is keeping your body more aroused than normal. You’ll have to wait for it to wear off before your body goes back to normal.", false, 1440);
	}
	else pc.setStatusMinutes("Ellie's Milk",1440);
}

//Drink consumption scenes
public function drinkAtBuckingBronco(drink:String):void
{
	clearOutput();
	showJames();
	author("Night Trap");
	
	var nPrice:Number = 0;
	
	switch(drink)
	{
		case "Milk Stout":
			output("You pull out your codex to check the bar’s drink menu before eventually settling on the milk stout. When you give James your order he smiles and says <i>“Coming right up " + pc.mf("sir","ma’am") + ".”</i> He grabs a large stout glass from under the counter and fills it to the brim with ice-cold beer, using an extremely ornate beer comb to remove the excess head on the beer before setting it down in front of you. You take your time savoring the taste of the stout. It has more alcohol in it than the average beer, but the sweet taste of the lactose perfectly masks it and blends well with the bitter flavor of the hops. When you drain the last dregs of foam you’re a little disappointed to be finished already. You set the empty glass back on the counter for the bartender to remove.");
			//remove 5 credits, add a small amount of drunkenness, return to drink menu.
			nPrice = 5;
			pc.imbibeAlcohol(8);
			break;
		case "Leithan Milk":
			output("You pull out your codex to check the bar’s drink menu before eventually settling on Leithan Milk. When you give James your order he smiles and says <i>“Coming right up " + pc.mf("sir","ma’am") + ".”</i> He reaches into a refrigerator cleverly concealed beneath the bar and brings out a metal pitcher full to the brim with a sweet-smelling milk. He sets it down in front of you along with a white ceramic mug. <i>“This is all milked by hand each morning. You’ll only find fresher straight from the source.”</i> James grins as he continues speaking. <i>“I sure hope you’ve got nowhere to be for the rest of the day. This is the favorite drink of the employees of the Broodmare Bordello. In its own way, this is the most expensive item on the menu. I’m sure you’ll be able to figure out what I mean soon enough.”</i> The android leaves you with that warning and a naughty wink.");
			output("\n\nYou fill your mug with milk and take a sip. It’s one of the sweetest things you’ve ever tasted, but the warm feeling the beverage fills you with drives you to immediately drain the mug before filling it again as quickly as you can. Each mugful you consume fans the heat inside you and directs it more towards your crotch. When you finish the last drops of milk you can’t help but groan in disappointment and arousal. When James hears you, he walks over to you and removes the pitcher and mug. <i>“Well, at the very least you’ll be able to get your money’s worth at the Bordello now. Or maybe you’d like to take the Bronco for a ride? Nothing like a potent aphrodisiac to help you get over any lingering shyness.”</i>");
			output("\n\nYou nod feverishly, telling the android you’ll consider it. You step away from the bar, eager to find any way to tamp down your overwhelming arousal.");
			//remove 8 credits, add Leithan Milk status effect with 12 hour duration, return player to bar
			nPrice = 8;
			pc.imbibeAlcohol(10);
			pc.lust(55);
			aphrodisiacMilkEffect();
			break;
		case "Milktini":
			output("You pull out your codex to check the bar’s drink menu before eventually settling on the milktini. When you give James your order he smiles and says <i>“Coming right up " + pc.mf("sir","ma’am") + ".”</i> He grabs an antique-looking cocktail mixer and begins pouring in milk, vodka, and white chocolate liqueur before shaking it all together with all the skill of a master. After the android finishes mixing your drink, he places a martini glass in front of you before filling it with the contents of the mixer. <i>“I hope you enjoy it. Many people around here like to drink these with dessert.”</i>");
			output("\n\nYou take a sip of the cocktail in front of you. It’s sweet and deliciously creamy. Though you know the drink contains a fair amount of alcohol, you can barely taste it, only feeling a slight tell-tale burn with each swallow. By the time your drink is almost gone you find yourself wishing you had some cake or a similar dessert to go along with it. When you place the empty martini glass back on the bar, James removes it for cleaning. <i>“I’m glad to see you enjoyed it " + pc.mf("sir","ma’am") + ". Let me know if you need anything else.”</i>");
			//remove 10 credits, add moderate drunkenness, return to drink menu
			nPrice = 10;
			pc.imbibeAlcohol(18);
			break;
		case "Varmintbite Whiskey":
			output("You pull out your codex to check the bar’s drink menu before eventually settling on a shot of varmintbite whiskey. When you give James your order he smiles and says <i>“Coming right up " + pc.mf("sir","ma’am") + ".”</i> He pulls out a bottle of potent-looking whiskey with a stylized drawing of a varmint dribbling venom into a pair of shot glasses. The synthetic bartender places a shot glass in front of you and pours the whiskey into it, cautioning you as he does so. <i>“This whiskey is designed for people with an existing alcohol tolerance to get drunk quickly. If you’re not an experienced drinker, you’re about to be totally shit-faced.”</i>");
			output("\n\nYou thank the android for his warning before taking a deep breath and slamming back the shot. A burning sensation immediately fills your throat and spreads to your chest as you gulp the shot down, just as you’d expect from whiskey. You close your eyes from the feeling, shaking your head to distract yourself. When you open your eyes again though, you feel dizzy. Euphoria is clouding your senses; you have to prop yourself on the bar momentarily to keep from losing your balance, but you don’t even care. You feel ready to take on the whole world right now. James removes your shot glass while you’re still reeling, grinning at your stupor as he tells you <i>“I’d recommend waiting a while before drinking anything else.”</i>");
			output("\n\nAs you lurch away from the bar you slur out that you’ll think about it.");
			//remove 15 credits, add major drunkenness, return player to bar
			nPrice = 15;
			output(pc.instaDrunk());
			break;
		case "Raging Bull":
			output("You pull out your codex to check the bar’s drink menu before eventually settling on a raging bull. Your order prompts a raised eyebrow and a question from James. <i>“Are you sure " + pc.mf("sir","ma’am") + "? I guarantee that will make you totally drunk no matter how experienced of a drinker you are.”</i>");
			output("\n\nYou affirm that that is exactly why you ordered it.");
			output("\n\nThe bartender grins at you cheekily. <i>“The customer is always right.”</i> He fills a stout glass with a dark milk stout most of the way to the brim. Setting it aside, he fills a single shot glass half with snakebite whiskey and half with irish cream. He places the two glasses in front of you. <i>“You’re supposed to drop the shot glass into the beer and chug the whole cocktail as quickly as you can. Just don’t lean too far back while you drink; we’ve had more than a few tourists get drunk so fast they fell backwards.”</i>");
			output("\n\nNoting the android’s instructions, you drop the shot glass into the beer and immediately gulp down the mixture as quickly as you can. As rapidly as you chug the mixture, you can barely taste it, but it’s a chaotic jumble of three different loosely-mixed flavors that makes you eager to get it past your tongue as soon as possible. You already feel buzzed halfway through the drink; when you slam the stout glass down on the counter with a satisfying clink of glass on glass, you are four sheets to the wind. You feel so pleasant right now, even as the room spins around you. You giggle stupidly as James clears away your glass. You barely notice when he speaks to you. <i>“I’m afraid I have to cut you off for now. You’re welcome to order any food you’d like from our menu though. Stay safe " + pc.mf("sir","ma’am") + "!”</i> The synthetic bartender waves you away with a warm smile.");
			//remove 30 credits, set player to maximum drunkenness, return player to bar
			nPrice = 30;
			output(pc.instaSmashed());
			break;
		default:
			output("ERROR: DRINK NOT FOUND!");
			break;
	}
	payForDrinkAtBuckingBronco(nPrice);
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function bbFoodMenu():void
{
	clearOutput();
	showName("THE\nMENU:");
	author("Night Trap");
	output("\\\[Biscuits & Gravy\\\] - 5 credits");
	output("\nTwo buttermilk biscuits covered in a creamy pork sausage gravy. A breakfast favorite.");
	output("\n\n\\\[Country Ham\\\] - 15 credits");
	output("\nPan-fried ham on a bed of grits and smothered in red-eye gravy. Served with a side of skillet-baked cornbread.");
	output("\n\n\\\[Chicken Fried Steak\\\] - 20 credits");
	output("\nNot actually chicken but rather a cube steak soaked in milk, breaded with seasoned flour, and skillet-fried to perfection, slathered in a milk gravy. Served with a side of mashed potatoes.");
	output("\n\n\\\[72 oz. Steak\\\] - 50 credits");
	output("\nFour and a half pounds of sirloin steak might seem insane on other planets, but for the massive, energetic residents of New Texas this is “just” a large steak. Popular with tourists who want the full “New Texas experience.”");

	processTime(2);
	clearMenu();
	if(pc.credits >= 5) addButton(0,"B&Gravy",eatAtTheBB,"B&Gravy","Biscuits and Gravy","Two buttermilk biscuits covered in a creamy pork sausage gravy. A breakfast favorite.\n\nCost: 5 Credits");
	else addDisabledButton(0,"B&Gravy","Biscuits and Gravy","You cannot afford that.\n\nCost: 5 Credits");
	if(pc.credits >= 10) addButton(1,"Country Ham",eatAtTheBB,"Country Ham","Country Ham","Pan-fried ham on a bed of grits and smothered in red-eye gravy. Served with a side of skillet-baked cornbread.\n\nCost: 10 Credits");
	else addDisabledButton(1,"Country Ham","Country Ham","You cannot afford that.\n\nCost: 10 Credits");
	if(pc.credits >= 20) addButton(2,"CF Steak",eatAtTheBB,"CF Steak","Chicken Fried Steak","Not actually chicken but rather a cube steak soaked in milk, breaded with seasoned flour, and skillet-fried to perfection, slathered in a milk gravy. Served with a side of mashed potatoes.\n\nCost: 20 Credits");
	else addDisabledButton(2,"CF Steak","Chicken Fried Steak","You cannot afford that.\n\nCost: 20 Credits");
	if(pc.credits >= 50) addButton(3,"72oz Steak",eatAtTheBB,"72oz Steak","72 oz. Steak","Four and a half pounds of sirloin steak might seem insane on other planets, but for the massive, energetic residents of New Texas this is “just” a large steak. Popular with tourists who want the full “New Texas experience.”\n\nCost: 50 Credits");
	else addDisabledButton(3,"72oz Steak","72 oz. Steak","You cannot afford that.\n\nCost: 50 Credits");
	addButton(14,"Back",mainGameMenu);

}

public function eatAtTheBB(fud:String):void
{
	clearOutput();
	showName("\nNOMMING");
	author("Night Trap");
	//Food consumption scenes
	output("You take a seat at an empty table and check the saloon’s menu on your codex. Deciding that you’re in the mood for some ");
	if(fud == "B&Gravy") output("biscuits and gravy");
	else if(fud == "") output("country ham");
	else if(fud == "") output("chicken fried steak");
	else output("72 ounce steak");
	output(", you place your order on the codex screen, the cost of your meal being automatically deducted from your account. It only takes a few minutes for a waitress to appear from the kitchen and set your food in front of you, along with a glass and pitcher of ice-cold sweet tea. Your mouth waters from the delicious smell of good cooking. As soon as your waitress hands you your utensils, you dig in hungrily.");

	//Biscuits & Gravy:
	if(fud == "B&Gravy")
	{
		output("\n\nYou use your fork to cut a piece out of the closer of the two biscuits, making sure to scoop up a piece of sausage from the gravy along with it. The biscuit is still crunchy on the outside, and the soft interior tastes buttery and flaky. It blends perfectly with the crumbled bits of spiced sausage and peppery, creamy gravy. The gravy is still so hot from the kitchen that you fear you may burn your mouth, but the taste is so delicious that you just can’t bring yourself to wait for the meal to cool. You relish every bite, taking a few sips of your sweet tea whenever the pepper begins to overwhelm you. The sugary taste of the drink compliments the salty meal perfectly.");
		output("\n\nWhen you start on the second biscuit, it’s a different experience from the first; the gravy has soaked in, leaving you with a more homogenous but unique new taste. The biscuit itself isn’t crunchy, but it is far more moist than the first, and the gravy has begun to thicken as it cools, providing another new texture in your meal. You consume the second half of your meal as quickly as the first, wishing you could have a breakfast like this every day.");
		restHeal();
		pc.credits -= 5;
	}
	//Country Ham:
	else if(fud == "Country Ham")
	{
		output("\n\nYou grab your knife and fork and slice off a piece of the ham, scooping up a bit of the grits and gravy with it. It’s a symphony of flavors: the pan-seared ham is savory, the grits are creamy and slightly sweet, and the red-eye gravy is bitter and salty. Your mouth tingles deliciously from the salty taste of the meal. It’s as salty as something can be without being at all unpleasant, and it only gives you an excuse to drink more of your delicious iced tea.");
		output("\n\nYou take a bite of the delicious cornbread. There’s no corn kernels in it and the texture is unlike most bread you’ve had; rather, it’s made of cornmeal, flour, and buttermilk placed in a cast-iron skillet and baked in an oven. It crumbles in your mouth immediately, the top surface of the cornbread satisfyingly and audibly crunchy, while the interior and bottom is soft and chewy.");
		output("\n\nYou make quick work of the ham before using the cornbread to sop up the red-eye gravy and remaining grits. The salty meal has left your tea pitcher completely empty, but your belly is delightfully full.");
		restHeal();
		pc.credits -= 10;
	}
	//Chicken Fried Steak:
	else if(fud == "CF Steak")
	{
		output("\n\nThe steak is so tender you barely need to use your knife to cut it. The crispy breading on the beef crunches satisfyingly as you slice into the steak. The meat is far more flavorful than a normal steak; it’s rich, juicy, savory, peppery and oh so tender. The contrast between the textures of the crunchy breading, the chewy beef, and the thick and creamy gravy is wonderful, and the spices used in the batter and gravy bring out every flavor to its fullest.");
		output("\n\nThe mashed potatoes are no less satisfying. They were mashed without being peeled, leaving bits of peel throughout the dish to vary the texture and add an earthy note to the dish. You can definitely tell milk was added to the potatoes, as well as a generous portion of butter, but aside from a dash of salt and pepper, there isn’t much more to the dish. The mashed potatoes provide a soft and creamy texture to the meal that compliments the crunchy and chewy texture of the steak, and the simple taste of the potatoes doesn’t distract from the complicated array of flavors in the steak. It doesn’t take you long to work through the delicious meal, leaving you feeling absolutely stuffed.");
		restHeal();
		pc.credits -= 20;
	}
	//72 oz. steak:
	else
	{
		output("\n\nYour eyes bulge a bit at the sheer amount of beef before you. Aside from a small lettuce garnish on the side, it’s nothing but steak in front of you. You slice into the meat, finding it to be juicy, tender, and cooked exactly how you ordered it. The marinade has given the steak an incredible flavor, notes of sweet, spicy, and savory all mingling together. Each bite is truly wonderful, and no matter how much you eat you never seem to run out of beef. Eventually, with ");
		if(pc.tallness < 60) output("most");
		else if(pc.tallness < 72) output("half");
		else if(pc.tallness < 84) output("a fourth");
		else output("none");
		output(" of the steak left, you are too full to eat another bite. You feel ready to burst from how much you’ve consumed; you can’t imagine eating this much food every day!");
		restHeal();
		pc.credits -= 50;
	}
	//merge
	output("\n\nYou lean back in your chair for a few minutes, simply enjoying the feeling of a good meal. Your waitress comes by and collects your dishes, thanking you for your patronage in her New Texas drawl and giving you a generous eyeful of cleavage as she leans down to clear the table. When you feel ready again you gather yourself and leave the table, happy to have enjoyed some authentic New Texas cuisine.");
	processTime(20);
	clearMenu();
	addButton(0,"Next",foodEpilogue,fud);
}

public function foodEpilogue(fud:String):void
{
	clearOutput();
	showName("\nYUM!");
	output("You let out a belch after consuming your meal" + pc.mf(""," and daintily apologize") + ".");
	var Numbah:Number = 1+rand(2);
	if(fud == "72oz Steak") Numbah += 5;
	if(pc.modThickness(Numbah) != "") output("\n\nYou feel thicker. It’s probably not a good idea to eat too much of this sort of food if you want to watch your waistline.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Living Kegs
//All scenes in this section credited to HugsAlright
//Opening text

//[Cowgirls]
public function livingKegsApproach():void
{
	clearOutput();
	if(!sallyBarHours()) showBust("WHISKEY_COW", "BEER_COW", "SALLY");
	else showBust("WHISKEY_COW", "BEER_COW");
	showName("LIVING\nKEGS");
	author("HugsAlright");
	if(flags["LIVING_KEGGED"] == undefined)
	{
		output("Walking a bit closer to the line of cowgirls, you can hear them talking to each other, turning back and forth and giggling. Finally closing in on the row of wonderful racks, you notice something written on their stomachs, right below their beautiful breasts. You squint and manage to get a good look at one of the markings: they’re all black, like some kind of brand; maybe some sort of mod? You don’t think anyone would be so cruel as to actually brand a cowgirl with a hot iron. Below the jiggling jugs of the each of the cowgirls is written: <b>~Bailey’s Brewery~</b> along with some kind of alcohol and proof number.");

		//metBrandy:
		if(flags["MET_BRANDY"] != undefined)
		{
			output("\n\nThen it strikes you: these girls work for the same brewery that Brandy does, and must have jobs similar to the one she used to have. All their tits are modded up with various alcohols, practically leaking their mind-numbing bounties with each shake of their expansive busts.");
		}
		//Else: 
		else output("\n\nSo they’re all a bunch of... living kegs? That must be what they are, all their tits modded up with various alcohols, practically leaking their mind-numbing bounties with each shake of their expansive busts.");

		output("\n\n<i>“Hey there, stranger!”</i> One of the cowgirls calls out, causing the gazes of the rest of the lineup to fall on you, <i>“Looking for a drink?”</i>");
		output("\n\nThat particular busty bovine giggles and gives her big breasts an enticing shake for you. The rest of the cowgirls follow suit, hefting and squeezing their own tits to give you a better idea of what you’re dealing with.");
		output("\n\nWell, if you are looking for a drink, maybe it wouldn’t be so bad to get one from one of these lovely ladies. Then again, you could always just go back to the bar and get a more “normal” drink.");
		flags["MET_KEGS"] = 1;
		processTime(5);
	}
	else
	{
		output("You approach the line-up of luscious-breasted cowgirls, a drink, straight from the tap, on your mind all the way over. The row of buxom bovine broads takes notice of your casual stroll over and stop their giggling and gossiping to face you.");
		output("\n\n<i>“Back for another drink, " + pc.mf("stud","cutie") + "?”</i> One of them calls out, hefting her tits to give you a better view.");
		output("\n\nWell, why else would you have come over here if not for another mouth-full of their alcoholic nectars?");
		processTime(2);
	}

	//[Whiskey] Get a drink from the girl branded with some kind of high-proof whiskey. Costs 30 credits. //Requires 30 credits.
	//[Beer] Get a drink from the girl branded with some kind of lager. Costs 25 credits. //Requires 25 credits.
	//[Rum] Get a drink from the girl branded with some kind of high-proof rum. Costs 35 credits. //Requires 35 credits.
	//[Leave]
	clearMenu();
	if(freeDrinkAtBuckingBronco())
	{
		addButton(0,"Beer",beerBoozeGalGo,undefined,"Beer","Get a drink from the girl branded with some kind of lager.");
		addButton(1,"Whiskey",whiskeyCowMooDrink,undefined,"Whiskey","Get a drink from the girl branded with some kind of high-proof whiskey.");
		if(!sallyBarHours()) addButton(2,"Rum",rumCowDrinkieDrink,undefined,"Rum","Get a drink from the girl branded with some kind of high-proof rum.");
	}
	else
	{
		if(pc.credits >= 25) addButton(0,"Beer",beerBoozeGalGo,undefined,"Beer","Get a drink from the girl branded with some kind of lager.\n\nCost: 25 Credits");
		else addDisabledButton(0,"Beer","Beer","You can’t afford that.\n\nCost: 25 Credits");
		if(pc.credits >= 30) addButton(1,"Whiskey",whiskeyCowMooDrink,undefined,"Whiskey","Get a drink from the girl branded with some kind of high-proof whiskey.\n\nCost: 30 Credits");
		else addDisabledButton(1,"Whiskey","Whiskey","You can’t afford that.\n\nCost: 30 Credits");
		if(!sallyBarHours())
		{
			if(pc.credits >= 35) addButton(2,"Rum",rumCowDrinkieDrink,undefined,"Rum","Get a drink from the girl branded with some kind of high-proof rum.\n\nCost: 35 Credits");
			else addDisabledButton(2,"Rum","Rum","You can’t afford that.\n\nCost: 35 Credits");
		}
	}
	addButton(14,"Leave",mainGameMenu);
}

//Whiskey
//[Whiskey]
public function whiskeyCowMooDrink():void
{
	clearOutput();
	showBust("WHISKEY_COW");
	showName("WHISKEY\nCOW");
	author("HugsAlright");
	output("You stroll your way up to the girl whose brand advertises she’s modded up to her literal tits with whiskey-producing transformative, changing what you can only assume to be human milk into the wonderful golden-brown liquid dripping from her big pink nipples. The cowgirl herself has long, curly, fiery red hair, with a smattering of freckles across her face, shoulder, and the top of her breasts to match. Her body is reminiscent of most cowgirls, busty and curvy, though she seems to have a tad bit more muscle than the other New Texan women in line.");
	output("\n\n<i>“Ooooh,”</i> the buxom bovine coos at your approach, extending her arms in preparation for what looks to be an enticingly boob-filled hug, <i>“you made a good choice, " + pc.mf("hon","honey") + ".”</i>");
	output("\n\nThe second you come within range of the cowgirl’s arms she wraps them around your shoulders and pulls you straight into her massive cleavage, causing you to release a surprised, and quickly muffled, grunt into her pillowy boobflesh. She loosens her “hug” a bit, allowing you to look up at her for a moment to see an eager smile on the redhead’s face, <i>“Well c’mon, " + pc.mf("hon","honey") + ", I’m all yours.”</i>");
	output("\n\nWell, that’s all the invitation you need at this point; you move your head as much as you can in this cowgirl’s grasp towards one of her wide, pink nipples, beads of her brain-liquifying liquids dripping down onto the floor. The bovine woman assists, guiding you towards her stiff teats until one is well within the reach of your tongue. You eagerly lap up the excess nectar dripping from her leaky nub before closing your [pc.lipsChaste] around her nipple; it’s whiskey alright, just as potent and tongue-tingling as you’d expect. With a want for more quickly flooding your mind, you get to suckling, drawing out more of the red-brown bounty from the busty bovine broad’s breasts to flow down your throat, burning all the way down and setting the redhead moaning.");
	output("\n\nIt isn’t long before you can feel your mind being lost to the girl’s alcoholic lactation, dulling your senses and replacing any woes you may have been holding onto with a sense of euphoria as you suck and suck some more on this woman’s big, soft breasts. You suckle long and hard on this cowgirl’s tits for what seems like an eternity, happily accepting all the alcohol she has to offer down your gullet, numbing your mind to the point where you barely notice switching breasts for the woman’s sake. When you do switch breast, you do so with a bit of reluctance, but speedily get to sucking on the bovine girl’s jugs again, flicking your tongue across her nipples to lick up any stray liquor, making sure none of it goes to waste.");
	output("\n\nYour pleasant little drink is brought to an end all too soon when you’re pulled off one of the cowgirl’s stiff teats with a wet pop, leaving a trail of saliva and alcohol between your [pc.lips] and her big ol’ tits.");
	output("\n\nYou feel a pang of emptiness at the loss of the bovine broad’s bounty flowing betwixt your lips, but that emptiness is quickly replaced by the realization of your newfound drunkenness, along with a renewed lust burning into your loins.");
	output("\n\n<i>“Looks like you’ve had enough, " + pc.mf("hon","honey") + ",”</i> the redhead calls out, her massive breast still heaving and her nipples red from recent use. She brings a hand to your head and ruffles your [pc.hair]");
	if(!freeDrinkAtBuckingBronco()) output(", <i>“Now don’t you forget to pay the nice android at the bar.”</i>");
	else output(".");
	output("\n\nThat’s something you most definitely won’t soon forget, happily following the cowgirl’s orders and stumbling drunkenly towards the bar.");
	//[Next] //Removes credits, adds exhibitionism, adds two levels of drunkenness, and gives the player 33 lust, also returns them to the bar. 
	pc.milkInMouth();
	pc.imbibeAlcohol(80);
	pc.exhibitionism(1);
	payForDrinkAtBuckingBronco(30);
	processTime(18);
	pc.lust(20);
	IncrementFlag("LIVING_KEGGED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Beer
//[Beer]
public function beerBoozeGalGo():void
{
	clearOutput();
	showBust("BEER_COW");
	showName("BEER\nCOW");
	author("HugsAlright");
	output("You stroll your way up to the girl whose brand advertises she’s modded up to her literal tits with beer-producing transformative, changing what you can only assume to be human milk into the wonderful golden liquid dripping from her big pink nipples. The cowgirl herself has shoulder-length, brunette hair, almost reaching far enough to cover her pale skin. Her body is reminiscent of most cowgirls, beautiful and curvy, though she seems to have a tad bit more bust than the other New Texan women in line.");
	output("\n\n<i>“Oh, hi there!”</i> She calls out as you approach, bouncing up and down excitedly in place, setting her big boobies wobbling and flinging a few stray drops of golden-hued liquid from her nipples onto the floor, <i>“Here for a drink then?”</i>");
	output("\n\nYou inform the cowgirl you are most certainly there for whatever she has on tap, causing her to release an overjoyed and overly girly giggle as you walk right up to her, just a hair’s breadth away from her beer leaking jugs. She smiles and holds them together for you, letting rivulettes of her alcoholic nectars trickle down across her pale, squishy boobflesh. Grinning back at her, you bring your hands up to cup her breasts, eliciting a little gasp from the cowgirl, filled with pleasure and mock-surprise.");
	output("\n\n<i>“Oh, your hands are nice,”</i> she coos, settling into your grasp, <i>“Feel free to get started whenever you want.”</i>");
	output("\n\nWell, that’s all the invitation you need at this point; you move your mouth, while still kneading the girl’s tits in your hands, towards one of her wide, pink nipples, beads of her brain-liquifying liquids dripping onto the floor. The bovine woman assists you, guiding her stiff teats towards your mouth until one is well within the reach of your tongue. You eagerly lap up the excess nectar dripping from her leaky nub before closing your [pc.lipsChaste] around her nipple; it’s some kind of lager, bitter but delicious. With a want for more quickly flooding your mind, you get to suckling, drawing out more of the flaxen bounty from the busty bovine broad’s breasts to flow down your throat, setting the brunette moaning.");
	output("\n\nIt isn’t long before you can feel your mind being lost to the girl’s alcoholic lactation, dulling your senses and replacing any woes you may have been holding onto with a sense of euphoria as you suck and suck some more on this woman’s big, soft breasts. You suckle long and hard on this cowgirl’s tits for what seems like an eternity, happily accepting all the alcohol she has to offer down your gullet, numbing your mind to the point where you barely notice switching breasts for the woman’s sake. When you do switch breast, you do so with a bit of reluctance, but speedily get to sucking on the bovine girl’s jugs again, flicking your tongue across her nipples to lick up any stray liquor, making sure none of it goes to waste.");
	output("\n\nYour pleasant little drink is brought to an end all too soon when you’re pulled off one of the cowgirl’s stiff teats with a wet pop, leaving a trail of saliva and alcohol between your [pc.lipsChaste] and her big ol’ tits.");
	output("\n\nYou feel a pang of emptiness at the loss of the bovine broad’s bounty flowing betwixt your lips, but that emptiness is quickly replaced by the realization of your newfound drunkenness, along with a renewed lust burning into your loins.");
	output("\n\n<i>“Hope it was good!”</i> the busty brunette exclaims, cupping her breasts again and jiggling them around for you");
	if(!freeDrinkAtBuckingBronco()) output(", <i>“Oh, and don’t forget to pay the android at the bar!”</i>");
	else output(".");
	output("\n\nThat’s something you most definitely won’t soon forget, happily following the cowgirl’s orders and stumbling drunkenly towards the bar.");
	//[Next] //Removes credits, adds exhibitionism, adds one level of drunkenness, and gives the player 33 lust, also returns them to the bar. 
	pc.milkInMouth();
	pc.imbibeAlcohol(45);
	pc.exhibitionism(1);
	payForDrinkAtBuckingBronco(25);
	processTime(18);
	pc.lust(20);
	IncrementFlag("LIVING_KEGGED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Rum
//[Rum]
public function rumCowDrinkieDrink():void
{
	clearOutput();
	showBust("SALLY");
	showName("RUM\nCOW");
	author("HugsAlright");
	if(flags["MET_SALLY"] != undefined) showName("\nSALLY");
	output("You stroll your way up to ");
	if(flags["MET_SALLY"] != undefined) output("Sally,");
	else output("the girl");
	output(" whose brand advertises she’s modded up to her literal tits with rum-producing transformative, changing what you can only assume to be human milk into the wonderful golden-brown liquid dripping from her big pink nipples. ");
	if(flags["MET_SALLY"] != undefined) output("Sally");
	else output("The cowgirl");
	output(" herself has long, blonde hair, draping down and covering more than a fair bit of her dusky skin and big breasts. Her body is reminiscent of most cowgirls, busty and curvy, though she seems to be a tad bit taller than the other New Texan women in line.");
	output("\n\n<i>“Hey there, sweetie,”</i> she says, taking up a very confident, and rather sexy, stance, placing her hands on her hips and shifting her weight around until her tits start to quake, <i>“You came to the right place if you’re looking for a drink.”</i>");
	output("\n\nA surprising sense of calm flushes your body as you near the dark-skinned cowgirl; she just smells so... nice. Some sort of pheromones? You can’t find yourself able to care enough to think about it, opting instead to simply fall forward, burying your face in the cowgirl’s cleavage with a contented sigh. Not too long after you feel a pair of hands start to run through your [pc.hair]. Barely managing to pull yourself from the tall woman’s warm boobflesh, you look up to see the big-boobed bovine smiling down at you, gazing right into your now lust-hazed eyes.");
	output("\n\n<i>“Don’t worry,”</i> ");
	if(flags["MET_SALLY"] != undefined) output("Sally");
	else output("she");
	output(" coos in a very motherly tone, caressing your back, shoulders and [pc.hair] with oh-so gentle fingers, <i>“I seem to have that effect on a lot of people. Now how about that drink?”</i>");

	output("\n\nWith that said the cowgirl is already guiding you towards one of her wide, pink nipples, beads of her brain-liquifying liquids dripping onto the floor. You do the best you can to assist, wiggling around in the woman’s grasp until one of her stiff teats is well within the reach of your tongue. You eagerly lap up the excess nectar dripping from her leaky nub before closing your [pc.lipsChaste] around her nipple; it’s rum alright, sugary, potent, and tongue-warming. With a want for more quickly flooding your mind, you get to suckling, drawing out more of the orange-brown bounty from the busty bovine broad’s breasts to flow down your throat, burning all the way down and setting the dusky New Texan moaning.");
	output("\n\nIt isn’t long before you can feel your mind being lost to the girl’s alcoholic lactation, dulling your senses and replacing any woes you may have been holding onto with a sense of euphoria as you suck and suck some more on ");
	if(flags["MET_SALLY"] != undefined) output("Sally");
	else output("this woman’s");
	output(" big, soft breasts. You suckle long and hard on this cowgirl’s tits for what seems like an eternity, happily accepting all the alcohol she has to offer down your gullet, numbing your mind to the point where you barely notice switching breasts for the woman’s sake. When you do switch breast, you do so with a bit of reluctance, but speedily get to sucking on the bovine girl’s jugs again, flicking your tongue across her nipples to lick up any stray liquor, making sure none of it goes to waste.");
	output("\n\nYour pleasant little drink is brought to an end all too soon when you’re pulled off one of the cowgirl’s stiff teats with a wet pop, leaving a trail of saliva and alcohol between your [pc.lipsChaste] and her big ol’ tits.");
	output("\n\nYou feel a pang of emptiness at the loss of the bovine broad’s bounty flowing betwixt your lips, but that emptiness is quickly replaced by the realization of your newfound drunkenness, along with a renewed lust burning into your loins.");
	output("\n\n");
	if(flags["MET_SALLY"] != undefined) output("Sally");
	else output("She");
	output(" rubs a thumb across your cheek, grinning down at you as you look up at her with an aphrodisiac and alcohol laden gaze, <i>“I think you’ve had enough there, sweetie.");
	if(!freeDrinkAtBuckingBronco()) output(" Just make sure you don’t forget to pay the bartender, alright?");
	output("”</i>");
	output("\n\nThat’s something you most definitely won’t soon forget, happily following the cowgirl’s orders and stumbling drunkenly towards the bar.");
	if(flags["MET_SALLY"] != undefined && silly) output("\n\nAs you walk you walk away, you can hear the keg-girl call out, <i>“Stay thirsty, my friend.”</i>");

	//[Next] //Removes credits, adds exhibitionism, adds 3 level of drunkenness and some sort of aphrodisiac effect similar to Ellie’s, and gives the player 33 lust, also returns them to the bar.
	aphrodisiacMilkEffect();
	pc.milkInMouth();
	pc.imbibeAlcohol(150);
	pc.exhibitionism(1);
	payForDrinkAtBuckingBronco(35);
	processTime(25);
	pc.lust(20);
	IncrementFlag("LIVING_KEGGED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Sally the Rum-Cow
//Sally shows up in the bar from 02:00-12:00.
//Nothing is taur compatible.
//Shows up after getting a drink from her at least once.
//Opening text
//[Rum Cow]

public function sallyBarHours():Boolean
{
	return (hours >= 2 && hours <= 12);
}
public function approachSally():void
{
	clearOutput();
	showSally();
	author("HugsAlright");
	if(flags["MET_SALLY"] == undefined)
	{
		output("You decide to go up to the cowgirl and begin to casually stroll your way to the bar. Her lust-inducing scent keeps your eyes fixed on her big, wobbly tits and dusky skin, sparkling with little drops of sweat, no doubt from a long, hard day of work.");
		output("\n\nThe smell is more intoxicating than any alcohol being served at the bar, and keeps you well and focused on her voluptuous frame. It seems like an eternity before you actually reach the bar while you’re under the spell of her mind-melting pheromones.");
		output("\n\nFinally taking a seat next to the cowgirl, you’re able to notice a small smirk appear on her face before she puts her gaze on you.");
		output("\n\n<i>“I think I’ve seen you here before, sweetie,”</i> she explains, swirling her drink around in its glass, more of her lusty scent pouring off her body and into your nostrils, <i>“Maybe while I was working? One of my satisfied customers?”</i>");
		output("\n\nShe tosses you a wink, looking like she expects an answer. You breathe deep, trying to clear the intoxicating air around you from your lungs before you answer the blonde-haired cowgirl, telling her ");
		if(pc.isNice()) output("that it’s most likely the case that you met her while she was “on the job.”");
		else
		{
			output("that’s probably the case, but you meet a lot of");
			if(pc.isMisch() || pc.isBimbo() || pc.isBro()) output(" hot");
			output(" cowsluts in your journeys, so you’re not sure.");
		}
		output("\n\nThe dusky, busty, lusty woman responds with a girly chuckle, <i>“I thought so.”</i> She lets a hand drift off her drink and turns to you, <i>“You got a name, sweetie?”</i>");
		output("\n\nOnce again, your thoughts drift between a mirage of sex and what’s actually happening, and the rum-girl seems to take notice, and tries to call you back to the real world with the sound of her voice, and a touch of her hand on your shoulder, <i>“I seem to do this a lot to people, don’t you worry about it. I’m Sally, by the by.”</i>");
		output("\n\nHer words do the trick, and bring you out of your pheromone induced trance, and you introduce yourself as <i>“[pc.name]”</i> in turn.");
		output("\n\n<i>“That’s a nice name,”</i> she tells you with a warm, almost parental tone, <i>“So what brought you over to me, then? Looking for free drinks? Some friendly conversation, or something else?”</i> With that last word you see her run a hand across the smooth skin of her breast, down her side, and across her thigh... right between her legs.");
		output("\n\nWell... something did bring you over here, though, with all the pheromones trapping your thoughts in a haze of lust, you’re not sure what that something was. Maybe you should say something before you fuck her right here and now.");
		flags["MET_SALLY"] = 1;
	}
	else
	{
		output("You make your way over to the bar, letting Sally’s hypnotizing aroma guide you all the way there until, before you know it, you’re sitting right next to her. The happy rum-girl turns toward you with a smile, her face as welcoming to your presence as ever.");
		output("\n\n<i>“Hey there sweetie,”</i> she coos, letting herself relax as you fix your gaze on her, <i>“Didn’t get enough of me while I was working earlier?”</i>");
		output("\n\nYeah, something like that, but with her mind-melting pheromones already trapping your mind in a fog of lust, it’s hard to formulate a proper answer.");
	}
	processTime(4);
	sallyMenu();
}

//[Appearance] Take a good look at the rum-cow.
//[Talk] Take some time to ask Sally about herself.
//[Sex] Have you ever met a New Texan that wasn’t down for a fuck? //Requires cock or vag.
//Repeatable opening text
//[Sally]

public function showSally():void
{
	showBust("SALLY");
	showName("\nSALLY");
}

//Appearance
public function sallyAppearance():void
{
	clearOutput();
	showSally();
	author("HugsAlright");
	output("Sally is a cowgirl who you estimate to be around 6\' tall. Her straight, blonde hair is parted by a pair of bovine-ears and two little pair horns before it drapes down to her back and around the feminine curves of her face. Deep blue eyes keep your attention fixed on the rum-cow’s visage, her cute button nose, and pouty lips before your eyes travel downwards across her dusky skin.");
	output("\n\nShe looks like most New Texas gals: gorgeous. Her body is as curvy as any woman’s on this warm, dusty ball of Terran past, and her breasts just as big, at least a G-cup by your guess, each of them topped with a big, pink, wide nipple, just dripping with sugary rum, perfect to be suckled and pinched. If your gaze travels further down, you’re greeted with the wonderful sight of the bovine woman’s shapely legs, and big, squishy butt, complete with a happily swishing cowtail.");
	output("\n\nThe most important fact about Sally, however, is that she’s completely nude.");
	output("\n\nDespite the fact that she looks so young, Sally gives off a very motherly vibe, like you could just collapse onto her with your face right between her tits and fall asleep in her arms, though, that might be the constant wave of lust-inducing pheromones she’s giving off talking.");
	sallyMenu();
	addDisabledButton(0,"Appearance","Appearance","You’re doing that right now.");
}

public function sallyMenu():void
{
	clearMenu();
	addButton(0,"Appearance",sallyAppearance,undefined,"Appearance","Take a good look at the rum-cow.");
	addButton(1,"Talk",talkToSally,undefined,"Talk","Take some time to ask Sally about herself.");
	if(pc.hasGenitals()) addButton(2,"Sex",sexWithSally,undefined,"Sex","Have you ever met a New Texan that wasn’t down for a fuck?");
	else addDisabledButton(2,"Sex","Sex","You need traditional genitals to have sex with Sally.");
	addButton(14,"Leave",mainGameMenu);
}

//Talk
public function talkToSally():void
{
	clearOutput();
	showSally();
	author("HugsAlright");
	output("Barely pulling yourself from the mind-numbing scent of Sally’s pheromones, you decide to ask her a few questions.");
	processTime(1);
	clearMenu();
	//[Job] Ask Sally about her job in the field of... boob whoring?
	addButton(0,"Job",sallyJobTalk,undefined,"Job","Ask Sally about her job in the field of... boob whoring?");
	//[Pheromones] What’s the deal with those lust-inducing pheromones she’s secreting?
	addButton(1,"Pheromones",pheromonesTalkWithSally,undefined,"Pheromones","What’s the deal with those lust-inducing pheromones she’s secreting?");
	addButton(14,"Back",backToSallyMain);
}

public function backToSallyMain():void
{
	clearOutput();
	showSally();
	output("What will you do with Sally now?");
	sallyMenu();
}

//Job
public function sallyJobTalk():void
{
	clearOutput();
	showSally();
	author("HugsAlright");
	output("<i>“Oh, I enjoy it quite a bit,”</i> Sally begins, leaning back a bit in her seat, <i>“It sure is nice having someone’s lips around my tits all day, instead of those cold, hard machines they use down at the barn.”</i> As the cowgirl-keg is saying that she’s rubbing her hands up and down her big, soft breasts, a few beads of her sugary nectars running down her nipples.");
	output("\n\nA renewed wave of intoxicating scent batters your mind as she does so, prompting you to ask her more about her line of work before you’re lost to lust.");
	output("\n\n<i>“Well, I started working for the brewery about, what; two, three years ago? After that I sort’ve worked as ‘free samples’ or something like that at the actual brewery, and honestly, I couldn’t tell you what I was actually doing for work. After they gave me the mods it was all just, sex, sex, sex.”</i> The dusky cowgirl lets out a soft moan at the thought, her eyes fluttering shut as what you can only guess to be similar ideas fill your mind, <i>“It was a good time, let me tell you, but eventually I needed something just a </i>little<i> different. So, I wound up at the Bronco, and now the bulls and cows keep coming for their drinks, but the sex is on my terms, more or less.”</i>");
	output("\n\nWell, judging from the smile on her face you saw when she was at work, it seems like she has quite the job, and you tell her so.");
	output("\n\n<i>“I don’t think there’s any other job I’d rather have,”</i> she says grinning wide down into her glass for a moment before facing you again, <i>“Especially if it brings " + pc.mf("hunks","cuties") + " like you my way after-hours.”</i>");
	output("\n\nThe combination of her kind words and the lust hazing your mind makes you smile, right into the bovine girl’s blue eyes.");
	//skip the last paragraph if sally has brandy as girlfriend
	if(flags["BRANDY_RELATIONSHIP"] != 1 || pc.hasStatusEffect("Brandy Sally Timer")) output("\n\n<i>“Believe it or not, there’s some people that </i>don’t<i> want a dream job like this,”</i> she continues, taking a small sip from her glass, <i>“Not too long ago some girl quit to work in the stockyard. I think her name was Sandy, or something like that. Don’t know why she quit, but she was cute as a button, with those little green ponytails of hers.”</i> Sally pauses and puts a confused look on her pretty face, <i>“She never talked much, though.”</i>");
	processTime(4);
	clearMenu();
	addButton(0,"Next",backToSallyMain);
}

//Pheromones
public function pheromonesTalkWithSally():void
{
	clearOutput();
	showSally();
	author("HugsAlright");
	output("If there’s one thing that’s definitely on your mind, it’s that sweet aroma Sally is emitting, and you decide to ask her about that.");
	output("\n\n<i>“Well,");
	if(pc.isTreated()) output(" as I’m sure you know,");
	output("”</i> the rum-cow begins, brushing a few locks of her bright blonde hair away from her face, <i>“The Treatment does a little something different to everyone who has it, and I’m sure you can guess what it did to me.”</i>");
	output("\n\nYou’re having a hard time focusing on Sally’s words at this point, but give her a nod regardless. The dusky cowgirl obviously knows of her scent’s effects on you, and leans in a bit closer to your [pc.face], a wide smile on her face.");
	output("\n\n<i>“Not that I mind it at all,”</i> she continues, placing her face even closer to yours, <i>“Must be a reward for being such a good girl when I was younger. It’s nice being able to make people all hot and bothered just by standing next to them.”</i>");
	output("\n\nWith that said, she plants a quick kiss right on your [pc.lipsChaste], sending your already lust-addled brain into overdrive and causing blood to rush to your face, blushing your cheeks.");
	output("\n\n<i>“Gives customers a reason to keep coming back too,”</i> Sally tells you, finally pulling back.");
	output("\n\nWhew.");
	processTime(4);
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",backToSallyMain);
}

//Sex
//[Sex]
public function sexWithSally():void
{
	clearOutput();
	showSally();
	author("HugsAlright");
	output("Allowing yourself to be taken by Sally’s ");
	if(pc.hasCock()) output("cock-stiffening");
	else output("pussy-wetting");
	output(" aroma, you manage to string enough words together to tell her that you’d like to ");
	if(pc.isNice() || pc.isMischievous()) output(" have some alone time with her");
	else output("fuck");
	output(".");

	output("\n\nThe rum-cow seems happy about that, a big grin appearing on her face before the rest of her drink disappears past her plush lips. <i>“That sounds just wonderful,”</i> the dark-hued woman says, standing up from her stool and setting her breasts jiggling in the process, <i>“I’ve got a room here at the cathouse we can use, if you’d like that.”</i>");

	output("\n\nWith that, she extends a hand out to yours, the warm smile on her face making it look like she wants you to take hold of it. You manage to give her a blank stare and a nod before you reach out and grab her hand.");

	output("\n\n<i>“C’mon this way then, sweetie.”</i>");

	output("\n\nSoon you’re being led through the bar by Sally, her sweet scent keeping your eyes glued on her enticingly swaying booty and tail as she leads you up some stairs to what you’re guessing is the brothel portion of the bar. In all honesty, it’s hard to tell where you are with your mind like this.");
	if(silly) output(" At some point on the trip you can hear Sally faintly singing something along the lines of <i>“And that Sally did dilly dally.”</i>");
	output("\n\nBefore you know it you’re being pulled through a door into a cozy looking room with an even cushier looking bed, which Sally sits the both of you down on. With the sudden comfort of the warm mattress and blankets paired with your soon-to-be lover’s intoxicating aroma, all you can do is fall forward into the valley of Sally’s cleavage with a complacent groan.");
	output("\n\nThe dusky cowgirl smiles and wraps her arms around your shoulders in response. <i>“Don’t worry, sweetie,”</i> she whispers, planting a kiss on your forehead, ");
	if(!pc.isCrotchExposed() && !pc.isAssExposed() && !pc.isChestExposed()) output("and helping you work your way out of your [pc.gear] until you’re good and bare in her grasp, ");
	output("<i>“I’ll take good care of you.”</i>");
	output("\n\nOh, that sounds wonderful.");
	processTime(4);
	pc.lust(10);
	clearMenu();
	//[SuckleFuck] Fuck Sally while you suckle her tits. //Requires a cock.
	//[SuckleFinger] Have Sally finger you while you suckle her tits. //Requires a vagina.
	if(pc.hasCock()) addButton(0,"Suckle Fuck",suckleFuckSally,undefined,"Suckle Fuck","Fuck Sally while you suckle her tits.");
	else addDisabledButton(0,"Suckle Fuck","Suckle Fuck","You need a penis for this.");
	if(pc.hasVagina()) addButton(1,"SuckleFinger",suckleFingerSally,undefined,"SuckleFinger","Have Sally finger you while you suckle her tits.");
	else addDisabledButton(1,"SuckleFinger","SuckleFinger","You need a vagina for that.");
}

//Suckle fuck
//[SuckleFuck]
public function suckleFuckSally():void
{
	clearOutput();
	showSally();
	author("HugsAlright");
	output("Sally looks down at your rock-hard [pc.cocks] and smiles at you, <i>“You need a little relief, don’t you, [pc.name]?”</i>");
	output("\n\nYou slowly nod your head in response, rubbing your cheeks against her warm boobflesh.");
	output("\n\n<i>“I’ll make sure you feel </i>real<i> good, sweetie,”</i> the cowgirl coos, giving you another kiss.");
	output("\n\nSally starts to lie back against the pillows covering her bed, taking you down to the mattress along with her, your [pc.skinFurScales] rubbing against her warm flesh all the way there. A moment later a pair of shapely legs wrap around your [pc.butt], slowly guiding your eager shaft towards the warm embrace of Sally’s warm cunt. You let out a stuttering breath and look up to the dusky New Texan biting her lip and gazing down at you.");
	output("\n\n<i>“Here, [pc.name], just relax,”</i> she coos.");
	output("\n\nHer tender voice paired with her pheromones makes you feel so warm, and all you can do is let your muscles loosen. Putting your head back between your lover’s massive jugs, you roll your hips forward, oh-so gently until your [pc.cockHeadBiggest] meets Sally’s juicy nether-lips with a little squelch. The pair of legs around your [pc.hips] start to pull you in harder, all until your [pc.cockBiggest] penetrates Sally’s slick cunt, drawing a whimper from the cowgirl. Your mind fizzles blank with ecstasy as the rum-cow continues to push you forward with the silky flesh of her thighs, driving more and more of your cock into her until she starts to moan gently.");
	pc.cockChange();
	output("\n\n<i>“How’s that feel, sweetie?”</i> Sally asks, finally stopping your interminable penetration, leaving fem-lube to pour out around your [pc.cockBiggest].");
	output("\n\nYou groan and whimper in response, begging for more, already attempting to move your [pc.hips], but the blonde-haired woman under keeps your pre-leaking dong well where it is, locking her legs around your [pc.butt].");
	output("\n\n<i>“");
	if(silly) output("Aaaarrrgghh, ye must be so thirsty from the walk up to me room, " + pc.mf("lad","lass") + ",");
	else output("Oh, but you must be so thirsty after the walk up to my room,");
	output("”</i> she teases, sliding a hand across your back and behind your head, guiding you out of her cleavage and to one of her stiff teats, <i>“Here.”</i>");
	output("\n\nYou don’t even have to think twice about that; you lick your [pc.lips] before letting them wrap around Sally’s pink nub, drawing another quiet moan from from her as you start to suckle. Before too long rum starts to flow down your throat, reddening your cheeks and furthering your already rampant lust. You suckle long and hard, making your lover moan and gasp each time you flick your tongue across her nipple to gather up any stray drops of her wonderful nectars.");
	output("\n\nWith your mind so addled by Sally’s pheromones, you barely notice when your hips start to move, seemingly on their own volition, gently drawing back and pulling your [pc.cockBiggest] from the cowslut’s tight slit. Pheromones and lusty moans batter your thoughts, keeping you well and focused on suckling Sally’s tits while your hips pump and pump in and out of the cowgirl, so tight and warm around your [pc.cockBiggest].");
	output("\n\nWhat a thing it is to fuck like this, with aphrodisiacs and alcohol dulling your senses until all you can feel is your white-hot lust driving you onwards, not even noticing when you switch between Sally’s stiff nipples. You pick up the pace, rolling your hips faster and faster, slamming your ");
	if(pc.hasKnot(pc.biggestCockIndex())) output("[pc.knotBiggest]");
	else output("[pc.hips]");
	output(" into the dark-skinned beauty until you can feel your orgasm start to swell inside your [pc.balls].");

	if(pc.hasKnot(pc.biggestCockIndex()))
	{
		output("\n\nUnable to hold back, you slam your [pc.cockBiggest] home, and your [pc.knotBiggest] along with it. The obscene ball of cockflesh spread the cowgirl’s cunt wide before it finally slips in, drawing a few tender cries from her in the process.");
		output("\n\nWith your knot firmly lodged in Sally’s wonderful muff, all you can do is cum, popping off her teat letting loose a long groan of pleasure. Your [pc.cockBiggest] spasms as you empty your load inside the cowgirl, the bliss of orgasm rocking your body.");
		if(pc.cumQ() >= 2000) output(" Your bounty of [pc.cum] seems near-limitless, filling Sally’s pussy with all it can handle until her tummy starts to swell against yours under the tremendous pressure of your warm seed.");
		//Else:
		else output(" Your bounty of [pc.cum] fills Sally’s pussy to the brim while ecstasy shoots through your body, leaving you to bury your face in your lover’s cleavage and moan.");
	}
	//Else:
	else
	{
		output("\n\nUnable to hold back, you slam your [pc.cockBiggest] home, allowing the pleasure of your pheromone-induced orgasm to overtake your senses, relaxing your body until you’re on your very edge.");
		output("\n\nWith your cock firmly lodged in Sally’s wonderful muff, all you can do is cum, popping off her teat and letting loose a long groan of pleasure. Your [pc.cockBiggest] spasms as you empty your load inside the cowgirl, the bliss of orgasm rocking your body.");
		if(pc.cumQ() >= 2000) output(" Your bounty of [pc.cum] seems near-limitless, filling Sally’s pussy with all it can handle until her tummy starts to swell against yours under the tremendous pressure of your warm seed.");
		else output(" Your bounty of [pc.cum] fills Sally’s pussy to the brim while ecstasy shoots through your body, leaving you to bury your face in your lover’s cleavage and moan.");
	}
	output("\n\nComing down from your climax, you can’t find the strength to move anymore and simply collapse onto the cowgirl beneath you, barely able to keep yourself awake.");
	output("\n\nYou can just faintly hear Sally’s voice over the haunting call of sleep.");
	output("\n\n<i>“How was that, sweetie?”</i> she whispers, a hand running through your [pc.hair], <i>“Seems like you enjoyed yourself.”</i> Giving you a giggle, the rum-cow gives her hips a little wiggle with your ");
	if(pc.hasKnot(pc.biggestCockIndex())) output("[pc.knot]");
	else output("[pc.cockBiggest]");
	output(" still inside her, pulling a shuddering breath from your lungs. You barely manage to pull your head up from her cleavage one last time to look at Sally beaming down at you and nod.");
	output("\n\n<i>“I’m glad you did,”</i> she says with her motherly voice almost melding with the cloud of pheromones around you to serenade you to sleep, <i>“We can just lie here for a while, if you want, and go back to the bar whenever you’re ready.”</i>");
	output("\n\nYeah, that sounds nice.");
	processTime(60);
	pc.orgasm();
	pc.milkInMouth();
	//[Next] //Pass an hour and return the PC to the bar, add an aphrodisiac effect like Ellies.
	aphrodisiacMilkEffect();
	IncrementFlag("SEXED_SALLY");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Suckle finger
//[SuckleFinger]
public function suckleFingerSally():void
{
	clearOutput();
	showSally();
	author("HugsAlright");
	output("Sally looks down at your dripping [pc.vaginas] and smiles at you, <i>“You need a little relief, don’t you, [pc.name]?”</i>");
	output("\n\nYou slowly nod your head in response, rubbing your cheeks against her warm boobflesh.");
	output("\n\n<i>“I’ll make sure you feel </i>real<i> good, sweetie,”</i> the cowgirl coos, giving you another kiss.");
	output("\n\nSally hooks an arm around your [pc.legs] and turns you in her lap, leaving her arms wrapped around your shoulders and your face tantalizingly close to her heaving breast, just dripping with her sugary nectars, heat radiating off her bountiful orbs and onto your cheeks. You gulp and breathe heavy, looking up at your bovine lover with growing ardor and need, and she smiles back down at you.");
	output("\n\n<i>“");
	if(silly) output("Aaaarrrgghh, ye must be so thirsty from the walk up to me room, " + pc.mf("lad","lass") + ",");
	else output("Oh, but you must be so thirsty after the walk up to my room,");
	output("”</i> she teases, sliding a hand up your arm and behind your head, guiding you out of her cleavage and to one of her stiff teats, <i>“Here.”</i>");
	output("\n\nYou don’t even have to think twice about that; you lick your [pc.lips] before letting them wrap around Sally’s pink nub, drawing a quiet moan from her as you start to suckle. Before too long rum starts to flow down your throat, reddening your cheeks and furthering your already rampant lust. You suckle long and hard, making your lover moan and gasp each time you flick your tongue across her nipple to gather up any stray drops of her wonderful nectars. Reaching a hand up, you grope at the bovine-broads more neglected breast, squeezing and kneading the full orb until more of her mind-melting nectars start to bead on her stiff teats.");
	pc.milkInMouth();
	output("\n\nYour lust has only grown since you’ve gotten to Sally’s room, your [pc.vaginas] leaking fem-lube with a need to be filled, and your lover takes notice. She slyly slides a hand down across a [pc.thigh] before it slips between your legs. A moment later you feel a finger brush against your lower-lips, loosing a whimper from your lips before that little digit finally delves into your slick cunt, followed by another after that.");
	output("\n\n<i>“How’s that feel, sweetie?”</i> Sally asks, halting her penetration and giving her fingers a little wiggle inside of you.");
	output("\n\nYou moan and whimper, begging for more, but the rum-cow keeps her digits put for a moment, grinning at your hungry, eager noises. Luckily, things don’t stay that way for long, as Sally quickly sets to drawing her fingers in and out of your slobbering pussy, leaving quite the mess of fem-lube to drip down onto her hand as she has her way with your [pc.vagina]. You’re still suckling her massive tits all the while, eagerly accepting more and more of her bounty as nipple-muffled moans make their way past your [pc.lips].");
	output("\n\nWhat a thing it is to be fucked like this, with aphrodisiacs and alcohol dulling your senses until all you can feel is your white-hot lust burning in your loins, not even noticing when you switch between Sally’s stiff nipples. The cowgirl holding you picks up the pace, turning her once gentle probing into a right finger-fucking, still squeezing and suckling her breasts as you groan and cry out with pleasure.");
	output("\n\nThat’s it; you can’t hold back any longer, with pheromones already battering your mind and Sally’s fingers lodged firmly in you cunt, all you can do is cum. Popping off the dusky girl’s stiff teat, you let out a long groan of pleasure as your [pc.vagina] clamps down around her sodden digits. The bliss of orgasm burns in your loins, shooting through your body like a constant flow of ecstasy, your cunt spasming and drooling [pc.girlcum] out onto Sally’s hand.");
	if(pc.hasCock()) 
	{
		output(" Meanwhile, your [pc.cocks] discharge");
		if(pc.cockTotal() == 1) output("s its");
		else output(" their");
		output(" load of [pc.cum] all over your [pc.chest].");
	}
	output(" The cowslut coos happily as she watches you peak with pleasure");
	if(pc.hasCock()) output(" and cream yourself");
	output(", still gently sliding her fingers in and out of your [pc.vagina] until you’re good and spent.");
	output("\n\nComing down from your climax, you can’t find the strength to move anymore and simply collapse into the embrace of the cowgirl holding you, barely able to keep yourself awake.");
	output("\n\nYou can just faintly hear Sally’s voice over the haunting call of sleep.");
	output("\n\n<i>“How was that, sweetie?”</i> she whispers, a hand running through your [pc.hair], <i>“Seems like you enjoyed yourself.”</i> Giving you a giggle, the rum-cow pulls her cum-soaked fingers from your still-drooling slit, drawing a shuddering breath from your lungs in the process. You barely manage to pull your head up from her cleavage one last time to see Sally beaming down at you and nod.");
	output("\n\n<i>“I’m glad you did,”</i> she says with her motherly voice almost melding with the cloud of pheromones around you to serenade you to sleep, <i>“We can just lie here for a while, if you want, and go back to the bar whenever you’re ready.”</i>");
	output("\n\nYeah, that sounds nice.");
	processTime(60);
	pc.orgasm();
	pc.milkInMouth();
	//[Next] //Pass an hour and return the PC to the bar, add an aphrodisiac effect like Ellies.
	aphrodisiacMilkEffect();
	IncrementFlag("SEXED_SALLY");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function showBronco():void
{
	showBust("BRONCO");
	showName("BUCKING\nBRONCO");
}

//Riding the Bronco
//can’t be a taur or naga, can’t be virgin in the hole you choose, can’t ride while pregnant
public function ridingTheBuckingBronco():void
{
	clearOutput();
	showBronco();
	output("You approach the mechanical stallion in the middle of the saloon. It looks like a caricature of the upper half of a bronco with a saddle equipped with a horse dildo where a rider’s groin would normally rest, the animal facade ending just below the leg joints. The horse dildo on the saddle is over a foot in length and exceptionally thick, with a broad, flared tip. There are instructions on the sign next to the pit that read <i>“<b>Take the Bronco for a ride!</b> The Bronco is self-lubricating; all he needs is a few tugs before you mount up. Hold on until he finishes and win free drinks for a day, but if you get bucked off or finish first, you’re out!”</i>");
	output("\n\nDo you want to ride the Bronco?");
	processTime(1);
	clearMenu();
	//[Vagina] [Ass] //grey out any orifice the PC is a virgin in
	var vags:Boolean = false;
	var butts:Boolean = true;
	var choices:Array = [];
	for(var i:int = 0; i < pc.totalVaginas(); i++)
	{
		if(!pc.vaginas[i].hymen) choices.push(i);
	}
	if(choices.length > 0) vags = true;
	if(pc.analVirgin) butts = false;
	if(pc.isPregnant()) 
	{
		output(" <b>Maybe you shouldn’t do that while pregnant...</b>");
		vags = false;
		butts = false;
	}
	if(vags || butts) addButton(0,"Yeah!",rideTheBRonco);
	else addDisabledButton(0,"Yeah!","Yeah!","You probably shouldn’t ride this if you’re pregnant or a virgin.");
	addButton(1,"Nope",mainGameMenu);
}

public function rideTheBRonco():void
{
	clearOutput();
	showBronco();
	output("You step up to the mechanical stallion and examine your soon to be mount. You aren’t quite sure what the dildo is made of, but it is perhaps the most realistic replica of a penis you’ve ever encountered. When you reach out to touch the false phallus you’re surprised to find that it is warm. It’s actually warmer than a human would be, and as you pump it experimentally it throbs in your grip and leaks a large dollop of lubricant. You gather it up and spread it up and down the length of the shaft, and in doing so cause more lubricant to leak from the flared head of the dildo.");
	output("\n\n");
	if(!pc.isCrotchExposed())
	{
		output("You slip out of your [pc.gear], a small crowd beginning to form around the ring as you strip down.");
	}
	else output("A small crowd beginning to form around the ring.");
	output(" You flush in ");
	if(pc.exhibitionism() >= 33) output("arousal");
	else output("embarrassment");
	output(" as the onlookers stare at your lewd behavior. Both locals and tourists alike are gathering to watch, many of them taking pictures or even recording videos, the boldest among them sometimes barking out at you to turn and smile for the camera or to show them your ass.");
	if(pc.exhibitionism() < 33) output(" You still can’t really believe you’re doing this. Is a day of free drinks really worth embarrassing yourself in front of so many people? Especially if they’re going to be recording it?");
	output(" You swing a leg onto the mechanical stallion and climb onto the saddle, which turns out to be heavily padded. At the “shoulders” of the stallion, just an inch from where your crotch will rest once you’re properly mounted sits a loop of leather, presumably for you to hold onto when the ride starts. There’s a button labeled “Start” on the mechanical stallion’s neck. Before you press it though, you need to decide how you’re going to finish mounting this bronco.");
	processTime(4);
	clearMenu();
	//[Vagina] [Ass] //grey out any orifice the PC is a virgin in
	var choices:Array = [];
	for(var i:int = 0; i < pc.totalVaginas(); i++)
	{
		if(!pc.vaginas[i].hymen) choices.push(i);
	}
	if(choices.length > 0) addButton(0,"Vagina",vaginaBronco);
	else addDisabledButton(0,"Vagina","Vagina","You need a vagina without a hymen for this.");
	if(!pc.analVirgin) addButton(1,"Ass",takeAnalBronco);
	else addDisabledButton(1,"Ass","Ass","Your first time probably shouldn’t be on a violently bucking machine. That’s a good way to get hurt.");
}

//Vagina:
public function vaginaBronco():void
{
	clearOutput();
	showBronco();
	var x:int = -1;
	var choices:Array = [];
	for(var i:int = 0; i < pc.totalVaginas(); i++)
	{
		if(!pc.vaginas[i].hymen) choices.push(i);
	}
	if(choices.length > 0) x = choices[rand(choices.length)];
	else output("ERROR. NO VAGINA FOUND. WHERE IS MY VAGINA, SUMMER?");
	output("You lift up your [pc.hips] to better position your [pc.pussy " + x + "] for penetration.");

	//PC is Vaginally-Filled: //prioritize this over vaginal wetness blurb.
	if(pc.hasStatusEffect("Vaginally-Filled"))
	{
		output("\n\nThanks to the liquid leftovers of your previous lover, your pussy is already more than lubricated enough for the ride ahead.");
	}
	else if(pc.vaginas[x].wetness() < 3) output("\n\nYou take a moment to jerk the dildo off, forcing more lubricant to spill from its head. You smear some of the slippery liquid down the length of the equine phallus, but you spread the bulk of it inside your pussy, biting your lip a little to hold in a moan as you do so.");
	else output("\n\nKnowing how wet your pussy is, the only preparation you require is to finger yourself for a few moments, biting your lip a little to hold in a moan as you do so.");
	output(" With the prep work out of the way, you finally sink down onto the dildo.");

	if(pc.vaginas[x].looseness() < 3 || pc.vaginalCapacity(x) < 200)
	{
		output("\n\nIt seems like an almost impossible task to fit the broad, flared head of the equine phallus past the lips of your tight womanhood, but you’re not backing out after getting to this point! With one hand you spread your entrance as wide as possible while using your other hand to angle the flare of the dildo so that only part of it is pressing into your [pc.pussy " + x + "]. At first it seems like this just isn’t going to work, but with a grunt of effort and a few shouts of encouragement from the audience, you finally wedge the head of the dildo into your narrow vagina. A loud, whorish moan of pleasure is ripped from your [pc.lips] by the insertion, the incredible feeling of fullness overwhelming your self-restraint in an instant. When you finally adjust to the sensation, you realize with no small degree of trepidation that you still have more than a foot of phallus to feed into your love tunnel. Over the better part of a minute, you sink more and more fake flesh into your [pc.pussy " + x + "], moaning out loud when the delicious feeling of your vaginal walls being stretched temporarily becomes too much. By the time you finally bottom out on the dildo, your legs are quivering and you are on the verge of orgasm.");
		output("\n\n");
		if(pc.hasCock()) output("Pre-cum is dripping from your twitching [pc.cocks]. ");
		output("A smattering of applause goes through the crowd, with a few catcalls and hoots for good measure. You take deep breaths to try calm yourself, the bestial wang inside you sporadically twitching and leaking more lubricants into your depths, almost setting off your orgasm a few times. When both you and the dildo have finally calmed down you tightly clutch the leather handhold and reach out and press the start button.");
	}
	else
	{
		output("\n\nWith a pussy as well-trained as yours it’s easy to penetrate yourself with this equine dildo. You spread your pussy wide with one hand and position the phallus with the other. You let out a pleasant moan as the flared head briefly catches on your lower lips before slipping inside you. That flare rubs along the walls of your love tunnel like few things can, sending pleasant feelings through your body. It only takes you a few seconds to reach the base of the fake cock, and you groan in disappointment that you’re already out of dick to pack your pussy with. The onlookers clap and cheer for you, some of them even calling out asking for your contact information. Eager to continue this erotic exercise you tightly clutch the leather handhold and reach out and press the start button.");
	}
	pc.cuntChange(x,120);

	output("\n\nA rumble rolls through the Bronco as it begins its ride, the vibrations being transferred to your [pc.vagina " + x + "] through the dildo embedded in your muff, causing you to shudder in pleasure. Some of the people in the crowd are placing informal bets on how long it will take you to succeed or fail, and many are pulling out recording devices.");
	//Anno is a follower and is in the bar: 
	if(annoIsCrew()) output(" You see Anno wandering over to see what’s going on. Her face lights up when she notices it’s you on the Fucking Bronco.");
	output(" The mechanical stallion’s rocking motions are fairly easy to keep up with for the first ten or so seconds, though the rumbling of the device keeps the dildo gently vibrating, making it a bit hard to concentrate on keeping up with the Bronco’s constantly changing center of gravity. After thirty or so seconds, you are no longer able to keep in sync enough with the Bronco’s motions, causing you to bounce an inch or two off the saddle, creating a rough facsimile of a lover making short, rough thrusts into your canal. It’s an altogether pleasant sensation that makes your womanhood clench at the dildo inside you.");

	//easy reflex + physique check. +15 lust. If this maxes out lust, go to Vaginal Lust Loss scene. If the reflex + physique check fails, go to Stat Loss scene.
	processTime(6);
	pc.lust(15);
	//[Next]
	if(pc.reflexes()/2 + rand(20) + 1 < 10 || pc.physique()/2 + rand(20) + 1 < 10)
	{
		clearMenu();
		addButton(0,"Next",loseBroncoDuetoStats);
		return;
	}
	if(pc.lust() >= pc.lustMax())
	{
		if(pc.libido() < rand(100))
		{
			if(pc.willpower() + rand(20) + 1 < 30)
			{
				clearMenu();
				addButton(0,"Next",vaginalBroncoLustLoss,x);
				return;
			}
			else
			{
				output("\n\n<b>Through sheer force of will, you hold yourself back from climax.</b>");
			}
		}

		else
		{
			output("\n\n<b>You nearly cream yourself, but you’re no stranger to getting off. You ride the pleasure higher and higher, delaying your climax as long as possible.</b>");
		}
	}
	clearMenu();
	addButton(0,"Next",vaginalBroncoPart2,x);
}

public function vaginalBroncoPart2(x:int):void
{
	clearOutput();
	showBronco();
	output("Though the Bronco you are speared on is bucking you around fairly hard at this point, you manage to keep your seat. More hoots and cheers go up from the crowd, which is now growing as locals who assumed a tourist such as yourself would lose begin to wander over to watch. ");
	//Anno is a follower and is in the bar:
	if(annoIsCrew()) output("You can hear Anno cheering for you with the occasional <i>“Go [pc.name]!”</i> ");
	if(pc.biggestTitSize() >= 3) 
	{
		output("Your big rack certainly doesn’t detract from the appeal of watching you. With both your hands occupied holding onto the mechanical stallion, your [pc.breasts] are left free to bounce around unhindered. The stimulation ");
		if(pc.canMilkSquirt()) output("quickly causes your [pc.nipples] to leak [pc.milk], and as the pleasurable flow increases, droplets of your [pc.milkNoun] begin flying off, covering you, the Bronco, and the padding around you in [pc.milkColor]");
		else output("sends shockwaves of mixed pleasure and pain through your melons");
	}
	output(". You’re certainly giving the audience reason to watch, and the increasingly violent motions of the mechanical stallion send you higher and higher, treating your [pc.vagina " + x + "] to longer, deeper, and more frequent penetrations, forcing you to moan out in unmistakable pleasure. The vibrations of the dildo you’ve saddled are increasing in intensity with the movements of the Bronco, leaving you practically juicing yourself.");
	//Moderate reflex + physique check. +30 lust. If this maxes Lust go to Vaginal Lust Loss scene. If reflex + physique check fails, go to Stat Loss scene.
	processTime(10);
	pc.lust(30);
	if(pc.reflexes()/2 + rand(20) + 1 < 17 || pc.physique()/2 + rand(20) + 1 < 17)
	{
		clearMenu();
		addButton(0,"Next",loseBroncoDuetoStats);
		return;
	}
	if(pc.lust() >= pc.lustMax())
	{
		if(pc.libido() < rand(100))
		{
			if(pc.willpower() + rand(20) + 1 < 30)
			{
				clearMenu();
				addButton(0,"Next",vaginalBroncoLustLoss,x);
				return;
			}
			else
			{
				output("\n\n<b>Through sheer force of will, you hold yourself back from climax.</b>");
			}
		}
		else
		{
			output("\n\n<b>You nearly cream yourself, but you’re no stranger to getting off. You ride the pleasure higher and higher, delaying your climax as long as possible.</b>");
		}
	}
	clearMenu();
	addButton(0,"Next",vaginalBroncoPart3,x);
}

public function vaginalBroncoPart3(x:int):void
{
	clearOutput();
	showBronco();
	output("Somehow though, you hold on. Judging by the intensity of its motions, the Bronco must nearly be at the climax of its performance. It’s bucking violently, lifting you higher and higher off the saddle and spearing you even harder on the false phallus than it was before. At this point it feels like someone very large is picking you up once a second and dropping you onto a massive equine vibrator. The motions of the Bronco make it so that whenever you fall back down onto the dildo, it’s at a different angle of penetration, ensuring that every inch of your love tunnel is raked by that hot, lube-leaking, vibrating flare, which seems to have almost doubled in size at this point.");
	output("\n\nThe audience is cheering for you now, cows, bulls, and tourists all taking pictures and videos and hollering supportive cheers like <i>“Break that Bronco, bitch!”</i> or <i>“Ride that dick like you mean it!”</i> ");
	//Anno is a follower and is in the bar:
	if(annoIsCrew())
	{
		output("Your snowy-furred ausar gal continues cheering you on. <i>“Go for it [pc.name]! Show them what you can do!”</i> ");
	}
	output("You can barely hear anyone over the sounds of the mechanical stallion. By now its motor is at full power, and you can barely keep a grip on the leather handhold as the violent motions of the Bronco and the pleasing rumbles of its dildo vie to defeat you first. ");
	if(pc.biggestTitSize() > 3) 
	{
		output("Your [pc.breasts] are flailing around with minds of their own, each mammary moving in a different direction, sometimes even hitting you right in face. ");
		if(pc.canMilkSquirt()) output("The violent lurches of the Bronco send countless droplets of your [pc.milk] splattering onto everything nearby, including into the audience. Some of the tourists try to shield their eyes to avoid being blinded, but most of the locals cheer even more as they open their mouths to catch your lactic excess. ");
	}
	output(" It’s all just another sensation in the sea of pleasure you’re currently engulfed in.");

	//Difficult reflex + physique check. +45 lust. If this maxes Lust go to Vaginal Lust Loss scene. If reflex + physique check fails, go to Stat Loss scene. If both checks pass, go to Vaginal Victory scene.
	pc.lust(45);

	if(pc.reflexes()/2 + rand(20) + 1 < 20 || pc.physique()/2 + rand(20) + 1 < 20)
	{
		clearMenu();
		addButton(0,"Next",loseBroncoDuetoStats);
		return;
	}
	if(pc.lust() >= pc.lustMax())
	{
		if(pc.libido() < rand(100))
		{
			if(pc.willpower() + rand(20) + 1 < 30)
			{
				clearMenu();
				addButton(0,"Next",vaginalBroncoLustLoss,x);
				return;
			}
			else
			{
				output("\n\n<b>Through sheer force of will, you hold yourself back from climax.</b>");
			}
		}
		else
		{
			output("\n\n<b>You nearly cream yourself, but you’re no stranger to getting off. You ride the pleasure higher and higher, delaying your climax as long as possible.</b>");
		}
	}
	clearMenu();
	addButton(0,"Next",vaginalVictoryVsBroncoButt,x);
}

//Ass:
public function takeAnalBronco():void
{
	clearOutput();
	showBronco();
	output("You lift up your [pc.hips] to better position your [pc.asshole] for penetration.");

	//PC is Anally-Filled:
	if(pc.hasStatusEffect("Anally-Filled")) output(" Thanks to the liquid leftovers of your previous lover, your pucker is already more than lubricated enough for the ride ahead.");
	else if(pc.ass.wetness() < 3) output(" You take a moment to jerk the dildo off, forcing more lubricant to spill from its head. You smear some of the slippery liquid down the length of the equine phallus, but you spread the bulk of it inside your anus, biting your lip a little to hold in a moan as you do so.");
	else output(" Knowing how wet your ass is, the only preparation you require is to finger yourself for a few moments, biting your lip a little to hold in a moan as you do so.");
	output(" With the prep work out of the way, you finally sink down onto the dildo.");

	if(pc.ass.looseness() < 3 || pc.analCapacity() < 200)
	{
		output("\n\nIt seems like an almost impossible task to fit the broad, flared head of the equine phallus past the tight ring of your sphincter, but you’re not backing out after getting to this point! With one hand you spread your entrance as wide as possible while using your other hand to angle the flare of the dildo so that only part of it is pressing into your ass. At first it seems like this just isn’t going to work, but with a grunt of effort and a few shouts of encouragement from the audience, you finally wedge the head of the dildo into your narrow anus. A loud, whorish moan of pleasure is ripped from your [pc.lips] by the insertion, the incredible feeling of fullness overwhelming your self-restraint in an instant. When you finally adjust to the sensation, you realize with no small degree of trepidation that you still have more than a foot of phallus to feed into your bowels. Over the better part of a minute, you sink more and more fake flesh into the depths of your ass, moaning out loud when the delicious feeling of your interior walls being stretched temporarily becomes too much. By the time you finally bottom out on the dildo, your legs are quivering and you are on the verge of orgasm.");
		if(pc.hasVagina())
		{
			output(" Your [pc.cunts] ");
			if(pc.totalVaginas() == 1) output("is");
			else output("are");
			output(" clutching at the air in a desperate bid for the sort of penetration your ass is receiving.");
		}
		if(pc.hasCock()) output(" Pre-cum is dripping from your twitching [pc.cocks].");
		output(" A smattering of applause goes through the crowd, with a few catcalls and hoots for good measure. You take deep breaths to try calm yourself, the bestial wang inside you sporadically twitching and leaking more lubricants into your depths, almost setting off your orgasm a few times. When both you and the dildo have finally calmed down you tightly clutch the leather handhold and reach out to press the start button.");
	}
	else
	{
		output("\n\nWith an ass as well-trained as yours it’s easy to penetrate yourself with this equine dildo. You spread your cheeks wide with one hand and position the phallus with the other. You let out a pleasant moan as the flared head briefly catches on your sphincter before slipping inside you. That flare rubs along the walls of your bowels like few things can, sending pleasant feelings through your body. It only takes you a few seconds to reach the base of the fake cock, and you groan in disappointment that you’re already out of dick to stuff your greedy ass with. The onlookers clap and cheer for you, some of them even calling out asking for your contact information. Eager to continue this erotic exercise, you tightly clutch the leather handhold and reach out to press the start button.");
	}
	pc.buttChange(120);
	output("\n\nA rumble rolls through the Bronco as it begins its ride, the vibrations being transferred to your [pc.asshole] through the dildo embedded in your butt, causing you to shudder in pleasure. Some of the people in the crowd are placing informal bets on how long it will take you to succeed or fail, and many are pulling out recording devices. ");
	if(annoIsCrew()) output("You see Anno wandering over to see what’s going on. Her face lights up when she notices it’s you on the Fucking Bronco. ");
	output("The mechanical stallion’s rocking motions are fairly easy to keep up with for the first ten or so seconds, though the rumbling of the device keeps the dildo gently vibrating, making it a bit hard to concentrate on keeping up with the Bronco’s constantly changing center of gravity. After thirty or so seconds, you are no longer able to keep in sync enough with the Bronco’s motions, causing you to bounce an inch or two off the saddle, creating a rough facsimile of a lover making short, rough thrusts into your ass. It’s an altogether pleasant sensation that makes your pucker clench at the dildo inside you.");
	//easy reflex + physique check. +15 lust. If this maxes out lust, go to Anal Lust Loss scene. If the reflex + physique check fails, go to Regular Loss scene.
	processTime(5);
	pc.lust(15);
	//[Next]
	if(pc.reflexes()/2 + rand(20) + 1 < 10 || pc.physique()/2 + rand(20) + 1 < 10)
	{
		clearMenu();
		addButton(0,"Next",loseBroncoDuetoStats);
		return;
	}
	if(pc.lust() >= pc.lustMax())
	{
		if(pc.libido() < rand(100))
		{
			if(pc.willpower() + rand(20) + 1 < 30)
			{
				clearMenu();
				addButton(0,"Next",analLustLossToBronco);
				return;
			}
			else
			{
				output("\n\n<b>Through sheer force of will, you hold yourself back from climax.</b>");
			}
		}

		else
		{
			output("\n\n<b>You nearly cream yourself, but you’re no stranger to getting off. You ride the pleasure higher and higher, delaying your climax as long as possible.</b>");
		}
	}
	clearMenu();
	addButton(0,"Next",broncoAssPart2);
}

//[Next]
public function broncoAssPart2():void
{
	clearOutput();
	showBronco();
	output("Though the Bronco you are speared on is bucking you around fairly hard at this point, you manage to keep your seat. More hoots and cheers go up from the crowd, which is now growing as locals who assumed a tourist such as yourself would quickly lose begin to wander over to watch. ");
	//Anno is a follower and is in the bar:
	if(annoIsCrew()) output("You can hear Anno cheering for you with the occasional <i>“Go [pc.name]!”</i> ");
	//Breast >C cup:
	if(pc.biggestTitSize() > 3)
	{
		output("Your big rack certainly doesn’t detract from the appeal of watching you. With both your hands occupied holding onto the mechanical stallion, your [pc.breasts] are left free to bounce around unhindered. The stimulation ");
		if(pc.canMilkSquirt()) output("quickly causes your [pc.nipples] to leak [pc.milk], and as the pleasurable flow increases, droplets of your [pc.milkNoun] begin flying off, covering you, the Bronco, and the padding around you in [pc.milkColor]. ");
		else output("sends shockwaves of mixed pleasure and pain through your melons. ");
	}
	output("You’re certainly giving the audience reason to watch, and the increasingly violent motions of the mechanical stallion send you higher and higher, treating your [pc.asshole] to longer, deeper, and more frequent penetrations, forcing you to moan out in unmistakable pleasure as your intestine is teased by the dildo’s vibrating head. The vibrations of the fake dick you’ve saddled are increasing in intensity with the movements of the Bronco, leaving you on the verge of orgasm.");
	//Moderate reflex + physique check. +30 lust. If this maxes Lust go to Anal Lust Loss scene. If reflex + physique check fails, go to Stat Loss scene.
	processTime(7);
	pc.lust(30);
	//[Next]
	if(pc.reflexes()/2 + rand(20) + 1 < 17 || pc.physique()/2 + rand(20) + 1 < 17)
	{
		clearMenu();
		addButton(0,"Next",loseBroncoDuetoStats);
		return;
	}
	if(pc.lust() >= pc.lustMax())
	{
		if(pc.libido() < rand(100))
		{
			if(pc.willpower() + rand(20) + 1 < 30)
			{
				clearMenu();
				addButton(0,"Next",analLustLossToBronco);
				return;
			}
			else
			{
				output("\n\n<b>Through sheer force of will, you hold yourself back from climax.</b>");
			}
		}

		else
		{
			output("\n\n<b>You nearly cream yourself, but you’re no stranger to getting off. You ride the pleasure higher and higher, delaying your climax as long as possible.</b>");
		}
	}
	clearMenu();
	addButton(0,"Next",buttBroncoPart3);
}

//[Next]
public function buttBroncoPart3():void
{
	clearOutput();
	showBronco();
	output("Somehow though, you hold on. Judging by the intensity of its motions, the Bronco must nearly be at the climax of its performance. It’s bucking violently, lifting you higher and higher off the saddle and spearing you even harder on the false phallus than it was before. At this point it feels like someone very large is picking you up once a second and dropping you ass-first onto a massive equine vibrator. The motions of the Bronco make it so that whenever you fall back down onto the dildo, it’s at a different angle of penetration, ensuring that every inch of your colon is raked by that hot, lube-leaking, vibrating flare, which seems to have almost doubled in size at this point.");
	output("\n\nThe audience is cheering for you now, cows, bulls, and tourists all taking pictures and videos and hollering supportive cheers like <i>“Break that Bronco, bitch!”</i> or <i>“Ride that dick like you mean it!”</i> ");
	if(annoIsCrew()) output("Your snowy-furred ausar gal continues cheering you on. <i>“Go for it [pc.name]! Show them what you can do!”</i> ");
	output("You can barely hear anyone over the sounds of the mechanical stallion. By now its motor is at full power, and you can barely keep a grip on the leather handhold as the violent motions of the Bronco and the pleasing rumbles of its dildo vie to defeat you first.");
	if(pc.biggestTitSize() > 3)
	{
		output(" Your [pc.breasts] are flailing around with minds of their own, each mammary moving in a different direction, sometimes even hitting you right in face.");
		if(pc.canMilkSquirt()) output(" The violent lurches of the Bronco send countless droplets of your [pc.milk] splattering onto everything nearby, including into the audience. Some of the tourists try to shield their eyes to avoid being blinded, but most of the locals cheer even more as they open their mouths to catch your lactic excess.");
	}
	output(" It’s all just another sensation in the sea of pleasure you’re currently engulfed in.");

	//Difficult reflex + physique check. +45 lust. If this maxes go to Anal Lust Loss scene. If reflex + physique check fails, go to Regular Loss scene. If both checks pass, go to Anal Win scene.
	processTime(3);
	pc.lust(45);
	if(pc.reflexes()/2 + rand(20) + 1 < 20 || pc.physique()/2 + rand(20) + 1 < 20)
	{
		clearMenu();
		addButton(0,"Next",loseBroncoDuetoStats);
		return;
	}
	if(pc.lust() >= pc.lustMax())
	{
		if(pc.libido() < rand(100))
		{
			if(pc.willpower() + rand(20) + 1 < 30)
			{
				clearMenu();
				addButton(0,"Next",analLustLossToBronco);
				return;
			}
			else
			{
				output("\n\n<b>Through sheer force of will, you hold yourself back from climax.</b>");
			}
		}
		else
		{
			output("\n\n<b>You nearly cream yourself, but you’re no stranger to getting off. You ride the pleasure higher and higher, delaying your climax as long as possible.</b>");
		}
	}
	clearMenu();
	addButton(0,"Next",analVictoryAgainstBronco);
}

//Stat Loss
public function loseBroncoDuetoStats():void
{
	clearOutput();
	showBronco();
	output("You try your level best to hold on to the Bronco as its gyrations increase, but you just can’t keep your grip. At the apex of one of its upwards bucks, your hands slip off of the leather ring, and you are flung off of the mechanical stallion. Thankfully, you land with a soft ‘thud’ on the high-tech padding in the ring. It takes you a few moments to realize you’ve just lost; the sudden and violent change in orientation has left you temporarily dazed and confused. Exclamations of disappointment fill the room, and people begin exchanging money, obviously having lost their personal wagers. It seems the smart money was not on you this time.");
	if(annoIsCrew())
	{
		output("\n\nAnno rushes over to you to help you up. <i>“Are you alright, [pc.name]? That looked like a nasty fall.”</i> When you confirm that you are unhurt she breathes a sigh of relief and starts helping you collect your gear. The ausar girl speaks with you as she gathers your belongings. <i>“That was </i>incredibly<i> sexy, boss. I hope you have better luck next time; I’d sure love to see you </i>reach the climax<i>.”</i> She punctuates her last words with a naughty wink. Rolling your eyes at the lewd ausar, you don the last of your gear and thank Anno for the help. <i>“Any time, [pc.name]! Let me know next time you want to ride this thing so I can get a better view. Stay safe, boss!”</i> Anno gives you a peck on the cheek before returning to her previous activities. You exit the ring as well, your [pc.groin] burning with arousal after your interrupted sexual encounter.");
	}
	//else:
	else
	{
		output("\n\nAfter your senses return to you, you clamber up onto your feet, trying to avoid the looks of the people who had been watching you. You’re embarrassed to have busted your ass in front of a whole crowd of people, so you hastily gather up your belongings. ");
		if(!pc.isCrotchExposed()) output("Only when you’re once again wearing your [pc.gear] do you exit the ring, burning with arousal after your interrupted sexual encounter.");
		else output("When you exit the ring, your loins burn with unsatisfied arousal from your interrupted sexual encounter.");
	}
	//take PC back to saloon, add big exhibitionist gain
	pc.exhibitionism(2);
	processTime(8);
	pc.lust(10);
	
	fuckingBroncoTrack(false);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Vaginal Lust Loss
public function vaginalBroncoLustLoss(x:int):void
{
	clearOutput();
	showBronco();
	output("You try to hold out against the pleasure being forced through you by the vibrating phallus inside your [pc.cunt " + x + "], but the sensations are overwhelming. With a cry of absolute bliss, you spontaneously climax, squirting [pc.girlcum]");
	if(pc.hasCock()) output(" and [pc.cum]");
	output(" all over the equine member and your thighs. Spasms of ecstasty roll through your [pc.cunt " + x + "] in a desperate effort to milk the dildo of its cum. The moment your first orgasmic contraction strokes the fake dick, the Bronco immediately stops moving with a mechanical hissing sound and begins returning to its neutral position. You moan desperately as the penetration stops at the moment your backed-up orgasm begins, and you bounce your [pc.hips] and [pc.ass] on the dildo");
	if(pc.hasCock()) output(" and feverishly stroke your [pc.cocks]");
	output(" in an effort to stimulate yourself further. No matter how you try though, you get no further response from the equine member. As your climax winds down you slow your lusty bouncing and take a moment to rest.");
	if(annoIsCrew()) output(" Anno looks at you sympathetically, her ears flat and tail wagging low.");
	output(" Exclamations of disappointment fill the room, and people begin exchanging money, obviously having lost their personal wagers. It seems the smart money was not on you this time.");

	output("\n\nAfter catching your breath, you rise off of the dildo, moaning softly at the sudden feeling of emptiness in your thoroughly-stretched pussy. You’re embarrassed to have orgasmed so easily in front of a whole crowd of people, so you hastily gather up your belongings after climbing down from the Bronco. ");
	if(!pc.isCrotchExposed()) output("Only when you’re once again wearing your [pc.gear] do you exit the ring, burning with arousal after your interrupted sexual encounter.");
	else output("When you exit the ring, your loins burn with unsatisfied arousal from your interrupted sexual encounter.");
	
	//take PC back to saloon, add big exhibitionist gain
	pc.exhibitionism(2);
	processTime(8);
	pc.orgasm();
	
	fuckingBroncoTrack(false);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Vaginal Victory
public function vaginalVictoryVsBroncoButt(x:int):void
{
	clearOutput();
	showBronco();
	output("Just when you feel like you’re going to be thrown off, cum, or both, there’s a hissing sound as the Bronco suddenly stops bucking. The flare of the equine phallus expands suddenly as you feel the dildo inside you pulsing like a real penis would when cumming, and a wet warmth blossoms inside your [pc.cunt " + x + "]. The dildo is ejaculating! Your eyes go wide as you throw your head back and cry out in ecstasy before you start bucking your hips furiously into that still-cumming horse cock. You immediately break your death grip on the leather handhold to set one hand to diddling your [pc.clits] and your other to tweaking your [pc.nipple] in a bid to maximize your well-earned pleasure.");
	if(pc.hasCock()) 
	{
		output(" Your [pc.cocks] hose");
		if(pc.cockTotal() == 1) output("s");
		output(" [pc.cum] all over you and the saddle of the Bronco as your manhood joins your [pc.cunt " + x + "] in orgasm.");
	}
	output("\n\nYour ecstatic moans are drowned out by the applause and cheers of the audience, ");
	//Anno is a follower and is in the bar:
	if(annoIsCrew()) output("Anno cheering loudest of all as her tail wags in a blur of white while ");
	output("many of the assembled openly masturbate to your performance. Some of them are exchanging cash, clearly having won or lost bets, but most of them are now filming or photographing you as you cream all over the dildo");
	if(pc.vaginas[x].wetness() > 3) output(", squirting [pc.girlCum] all over your thighs and saddle and leaking more and more of the stuff as you bounce on the fake dick");
	output(". Your orgasm is extended well beyond usual by the fact that the dildo is still vibrating and still pumping jizz into you, the massive flare on the tip keeping most of it trapped inside you. Your eyes cross and you moan even louder as your womb is filled to the brim with jizz. When you feel your belly start to stretch from the amount of cum being pumped into you, you cum a second time from the sensation. You’re utterly full of both cock and cum, and at this moment you wouldn’t have it any other way. Free drinks? Who needs them when you have a bellyful of warm spunk?");
	output("\n\nEventually both your orgasm and that of your mechanical mount wind down. You are sweaty, flushed, and completely winded. You take some time to catch your breath. The audience starts to disperse, though many stay behind to finish masturbating to your nude, cum-pumped form. You look like you’re in the second trimester of a pregnancy, and you feel about that full as well. Evidently the voyeurs watching you appreciate your new look, because you soon hear moos and moans of pleasure from cows and bulls alike, their sexual fluids joining the mess you’ve left on the floor of the saloon.");
	output("\n\nOnce you feel like your legs will support you again, you begin the process of climbing down from the Bronco. Slowly, you lift up off the dildo, the engorged flare scraping your walls all the way up and stoking your arousal all over again. When you finally remove the shaft with a wet ‘pop’, you’re treated to one last spurt of deliciously hot spunk right across your [pc.clits]. Combined with the sudden torrent of pent-up semen that pours out of your canal, you succumb to one last climax, slipping off the Bronco onto the high-tech padding below and bucking your [pc.hips] helplessly as you cream yourself, your pussy squirting a thick mixture of [pc.girlCum] and semen onto your [pc.legs] and the pads you’re lying on.");
	//Anno is a follower and is in the bar:
	if(annoIsCrew())
	{
		output("\n\nAnno hurries over to you to help you up. <i>“Are you alright, [pc.name]? That looked like a nasty fall.”</i> When you confirm that you are unhurt she breathes a sigh of relief and starts helping you collect your gear. The ausar girl speaks with you as she gathers your belongings. <i>“That was </i>incredibly<i> sexy, boss. I could see from the start you </i>had it in you.<i>”</i> She punctuates her last words with a naughty wink. You groan at the ausar’s lewd pun, earning a girlish giggle from her. Anno brings you some napkins and towelettes from the bar to make up for her lame humor, and she helps you clean the hard to reach places on your body. When you’ve wiped off the worst of the mess you don your gear again.");
		//PC is not nude:
		if(!pc.isCrotchExposed()) output(" Your spunk-stuffed pussy squelches lewdly as you slip the last of your clothing on, your motions forcing warm cum out of your lower lips.");

		output("\n\nYou thank Anno for the help. <i>“Any time, [pc.name]! Let me know next time you want to ride this thing so I can get a better view, and maybe place a few bets myself. Stay safe, boss!”</i> Anno gives you a peck on the cheek before returning to her previous activities. You exit the ring as well and head towards the bar. You could really go for a drink right now!");
	}
	//else:
	else
	{
		output("\n\nWhen you recover from this unexpected orgasm, you stand up again on shaky legs. The crowd around you begins to scatter as you collect your gear. Hot cum leaks out of your pussy, dripping down your legs and onto the floor. You aren’t provided with a towel or any other means to clean yourself, so all you can do is wipe yourself off with your hands as best you can before getting dressed again.");
		//PC is not nude:
		if(!pc.isCrotchExposed()) output(" Your spunk-stuffed pussy squelches lewdly as you slip the last of your clothing on, your motions forcing more warm cum out of your lower lips.");
		output(" When you’ve finally gathered everything up you step out of the ring and head towards the bar. You could really go for a drink right now!");
	}
	//PC should cum 3 times, add “vaginally filled” status with enough cumflation to give about a 6 month pregnant belly look, reset lust, take PC back to saloon, add massive exhibitionist gain
	processTime(35);
	for(var i:int = 0; i < 3; i++) { pc.orgasm(); }
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
 	pp.createPerk("Fixed CumQ",40000,0,0,0);
 	pc.loadInCunt(pp,x);
 	pc.exhibitionism(2);
	
	fuckingBroncoTrack(true);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Anal Lust Loss
public function analLustLossToBronco():void
{
	clearOutput();
	showBronco();
	output("You try to hold out against the pleasure being forced through you by the vibrating phallus inside your [pc.asshole], but the sensations are overwhelming. With a cry of absolute bliss, your ass clenches down on the dildo");
	if(pc.hasCock()) output(" and you spray [pc.cum] all over your belly and thighs");
	output(". Spasms of ecstasy roll through your ass in a desperate effort to milk the dildo of its cum. The moment your first orgasmic contraction strokes the fake dick, the Bronco immediately stops moving with a mechanical hissing sound and begins returning to its neutral position. You moan desperately as the penetration stops at the moment your backed-up orgasm begins, and you bounce your [pc.hips] and [pc.ass] on the dildo in an effort to stimulate yourself further. No matter how you try though, you get no further response from the equine member. As your climax winds down you slow your lusty bouncing and take a moment to rest.");
	if(annoIsCrew()) output(" Anno looks at you sympathetically, her ears flat and tail wagging low.");
	output(" Exclamations of disappointment fill the room, and people begin exchanging money, obviously having lost their personal wagers. It seems the smart money was not on you this time.");
	output("\n\nAfter catching your breath, you rise off of the dildo, moaning softly at the sudden feeling of emptiness in your thoroughly-stretched asshole. You’re embarrassed to have orgasmed so easily in front of a whole crowd of people, so you hastily gather up your belongings after climbing down from the Bronco. ");

	if(!pc.isAssExposed()) output("Only when you’re once again wearing your [pc.gear] do you exit the ring, your [pc.asshole] aching with delight after your sexual encounter.");
	else output("When you exit the ring, your [pc.asshole] aches with delight from the sexual encounter.");
	//PC should cum once, take PC back to saloon, add massive exhibitionist gain
	processTime(6);
	pc.orgasm();
 	pc.exhibitionism(2);
	
	fuckingBroncoTrack(false);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Anal Victory
public function analVictoryAgainstBronco():void
{
	clearOutput();
	showBronco();
	output("Just when you feel like you’re going to be thrown off, cum, or both, there’s a hissing sound as the Bronco suddenly stops bucking. The flare of the equine phallus expands suddenly as you feel the dildo inside you pulsing like a real penis would when ejaculating, and a wet warmth blossoms inside your ");
	if(silly) output("yaoi-hole");
	else output("bowels");
	output(". The dildo is ejaculating! Your eyes go wide as you throw your head back and cry out in ecstasy before you start bucking your hips furiously into that still-cumming horse cock.");
	if(pc.hasVagina()) output(" You immediately break your death grip on the leather handhold to diddle your [pc.clits] and tweak your [pc.nipple] in a bid to maximize your well-earned pleasure.");
	if(pc.hasCock()) output(" You feverishly stroke your [pc.cockBiggest] as you hose [pc.cum] all over yourself and the saddle of the Bronco, ejaculating far harder than you would have thanks to the vibrating flare pressing deliciously into your prostate.");

	output("\n\nYour ecstatic moans are drowned out by the applause and cheers of the audience, ");
	//Anno is a follower and is in the bar:
	if(annoIsCrew()) output("Anno cheering loudest of all as her tail wags in a blur of white while ");
	output("many of the assembled openly masturbate to your performance. Some of them are exchanging cash, clearly having won or lost bets, but most of them are now filming or photographing you as you cum all over the dildo. Your orgasm is extended well beyond usual by the fact that the dildo is still vibrating and still pumping jizz into you, the massive flare on the tip keeping most of it trapped inside you. Your eyes cross and you moan even louder as your bowels are filled to the brim with jizz. When you feel your belly start to stretch from the amount of cum being pumped into you, you cum a second time from the sensation. You’re utterly full of both cock and cum, and at this moment you wouldn’t have it any other way. Free drinks? Who needs them when you have a bellyful of warm spunk?");
	output("\n\nEventually both your own orgasm and that of your mechanical mount wind down. You are sweaty, flushed, and completely winded, so you take some time to catch your breath. The audience starts to disperse, though many stay behind to finish masturbating to your nude, cum-pumped form. You look like you’re in the second trimester of a pregnancy, and you feel about that full as well. Evidently the voyeurs watching you appreciate your new look, because you soon hear moos and moans of pleasure from cows and bulls alike, their sexual fluids joining the mess you’ve left on the floor of the saloon.");
	output("\n\nOnce you feel like your legs will support you again, you begin the process of climbing down from the Bronco. Slowly, you lift up off the dildo, the engorged flare scraping your bowels all the way up and stoking your arousal all over again. When you finally remove the shaft with a wet *pop*, you’re treated to one last spurt of deliciously hot spunk right across your pucker. Combined with the sudden torrent of pent-up semen that pours out of your ass, you succumb to one last climax, slipping off the Bronco onto the high-tech padding below and bucking your [pc.hips] helplessly as you climax, your ass squirting a thick load of semen onto your [pc.legs] and the pads you’re lying on");
	if(pc.hasCock()) output("to mix with your own [pc.cum]");
	if(pc.isHerm() && pc.girlCumType != pc.cumType) output(" and [pc.girlCum]");
	output(".");

	//Anno is a follower and is in the bar:
	if(annoIsCrew())
	{
		output("\n\nAnno hurries over to you to help you up. <i>“Are you alright, [pc.name]? That looked like a nasty fall.”</i> When you confirm that you are unhurt she breathes a sigh of relief and starts helping you collect your gear. The ausar girl speaks with you as she gathers your belongings. <i>“That was </i>incredibly<i> sexy, boss. I could see from the start you </i>had it in you.<i>”</i> She punctuates her last words with a naughty wink. You groan at the ausar’s lewd pun, earning a girlish giggle from her. Anno brings you some napkins and towelettes from the bar to make up for her lame humor, and she helps you clean the hard to reach places on your body. When you’ve wiped off the worst of the mess you don your gear again.");
		if(!pc.isAssExposed()) output(" Your spunk-stuffed ass squelches lewdly as you slip the last of your clothing on, your motions forcing more warm cum out of your sphincter.");

		output("\n\nYou thank Anno for the help. <i>“Any time, [pc.name]! Let me know next time you want to ride this thing so I can get a better view, and maybe place a few bets myself. Stay safe, boss!”</i> Anno gives you a peck on the cheek before returning to her previous activities. You exit the ring as well and head towards the bar. You could really go for a drink right now!");
	}
	//else:
	else
	{
		output("\n\nWhen you recover from this unexpected orgasm, you stand up again on shaky legs. The crowd around you begins to scatter as you collect your gear. Hot cum leaks out of your pucker, dripping down your legs and onto the floor. You aren’t provided with a towel or any other means to clean yourself, so all you can do is wipe yourself off with your hands as best you can before getting dressed again.");
		if(!pc.isAssExposed()) output(" Your spunk-stuffed ass squelches lewdly as you slip the last of your clothing on, your motions forcing more warm cum out of your sphincter.");
		output(" When you’ve finally gathered everything up you step out of the ring and head towards the bar. You could really go for a drink right now!");
	}
	//PC should cum 3 times, reset lust, add “anally filled” status with enough cumflation to give about a 6 month pregnant belly look, take PC back to saloon, add massive exhibitionist gain
	processTime(35);
	for(var i:int = 0; i < 3; i++) { pc.orgasm(); }

	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
 	pp.createPerk("Fixed CumQ",40000,0,0,0);
 	pc.loadInAss(pp);
 	pc.exhibitionism(2);
	
	fuckingBroncoTrack(true);

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

// Win/Loss Tracking
public function fuckingBroncoTrack(win:Boolean = false):void
{
	if(!win)
	{
		StatTracking.track("contests/fucking bronco losses");
	}
	else
	{
		StatTracking.track("contests/fucking bronco wins");
		// Reward for winning!
		if(pc.hasStatusEffect("Bucking Bronco Free Drinks")) pc.setStatusMinutes("Bucking Bronco Free Drinks",1440);
		else pc.createStatusEffect("Bucking Bronco Free Drinks", 0, 0, 0, 0, true, "", "", false, 1440);
	}
	IncrementFlag("BRONCO_USED");
}

