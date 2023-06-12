public function showMaja(nude:Boolean = false):void
{
	var nudeS:String = "";
	if(nude) nudeS = "_NUDE";
	showBust("MAJA"+nudeS);
	showName("\nMAJA");
}
public function majaTrust():Boolean
{
	return (flags["MAJA_TRUST_TALK"] != undefined);
}

public function majaPlaceholder():PregnancyPlaceholder
{
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.shiftCock(0, GLOBAL.TYPE_CANINE);
	pp.cocks[0].cockColor = "cerulean";
	pp.cocks[0].cLengthRaw = 24;
	pp.balls = 2;
	pp.ballSizeRaw = 27;
	pp.createPerk("Fixed CumQ",8008,0,0,0);
	
	pp.createVagina();
	pp.vaginas[0].loosenessRaw = 2;
	pp.vaginas[0].wetnessRaw = 3;
	pp.vaginas[0].bonusCapacity = 50;
	return pp;
}

//Approach
public function tamedTamelingsBonus():Boolean
{
	author("Gardeford");
	if(flags["MET_MAJA"] == undefined)
	{
		flags["MET_MAJA"] = 1;
		showMaja();
		output("You crack open the heavy leather door, noting paintings of bear-like creatures on the inside, stepping into a smallish welcome area. A second entryway leads to what looks like a much larger cavern, but from the angle you’re at you can only see a section of fencing. Various animal noises emanate from that direction. Chunks of varnished wood form a makeshift desk at the back of the room, with a");
		if(silly) output(" spherical... Is that a dog toy?");
		else output(" rather beaten looking call bell.");

		output("\n\nNo shopkeeper is readily visible, so you ");
		if(silly) output("squeak the toy");
		else output("ring the bell");
		output(" and cough. An excited bark and shuffling noise can be heard in the larger back area, along with the slight distress of a number of beasts. You cock an eyebrow, focusing on the entryway just in time to see a stocky little korgonne rush through the doorway.");
		output("\n\nThe ");
		if(silly) output("Peppy pupper");
		else output("pint-sized dog-girl");
		output(" pants as she shuffles into the room, her legs restricted by a heavily quilted skirt. I-cup breasts, almost comical in size on the short woman, jiggle enticingly with the hurried movement. Her leather top does a surprisingly good job of containing the hefty pillows, bunching them into delicious looking ");
		if(silly) output("bread loaves");
		else output("cleavage");
		output(".");

		output("\n\n<i>“");
		if(!korgiTranslate()) output("Here! Maja come! Hold horses! Will help-Ooof");
		else output("I’m coming! Hold your horses. I was just feeding the-Ooof");
		output(",”</i> she barks as she runs, slipping on a patch of straw and falling flat on her face. At least, she would have if her chest didn’t hit the ground first. She bounces once, scrambling to her feet in almost the same motion. She makes it to the desk, rubbing her bust and trying her hardest to make it look like the fall didn’t hurt.");
		output("\n\n<i>“How can ");
		if(!korgiTranslate()) output("Maja");
		else output("I");
		output(" help?”</i> she asks. Halfway through, she seems to notice she isn’t talking to another korgonne, and narrows her eyes.");

		output("\n\n<i>“");
		if(!korgiTranslate()) output("Why alien here? What want?");
		else output("Oh. An offworlder. What do you want?");
		output("”</i> she grumbles, looking wary.");

		output("\n\n<i>“");
		if(pc.isNice()) output("I’m just looking around. My name is [pc.name]. Your chief’s daughter gave me the password after I rescued her, and I’ve been having fun so far. What do you do down here, besides sit around and look pretty?");
		else if(pc.isMischievous()) output("I’m [pc.name]. I got the password from your chief’s daughter after I rescued her, so I’m having a look around the place. Why do they have a cute thing like you shut up down here?");
		else output("I’m [pc.name]. I rescued your chief’s daughter. She gave me the password. What’s a hot piece of ass like you doing cooped up down here anyway?");
		output("”</i> you ask in response. The stocky korgonne’s tail swiftly flutters with movement at your praise, but she brings it back under control with a little effort.");

		output("\n\n<i>“");
		if(!korgiTranslate()) output("You rescue Ula? Maja heard about you. Still need prove self. Some alien say nice, but no act nice");
		else output("So you’re the one who rescued Ula? I heard about you. I still dont trust you. Some aliens do nice things, but then expect nasty things in return");
		output(",”</i> she says, her hackles smoothing out. She still watches you with a wary intensity. It looks like you’ll need to prove yourself to this Maja somehow.");

		output("\n\n<i>“");
		if(!korgiTranslate()) 
		{
			output("This shop is tamed tamelings! You take animal, have help in icefields! They help fend off ");
			if(silly) output("dumb cat-dogs");
			else output("milodan");
			output(" or ugly pup-stealers. Return after done. Aliens call it rent-thing");
		}
		else output("Anyway, welcome to tamed tamelings. I take care of the hold’s livestock and hunting animals. You can take them out to help you on the fields as long as you return them safe and sound. I think you people call it renting");
		output(",”</i> she explains while you think.");
		majaMenu();
		return true;
	}
	else if(pc.hasStatusEffect("MAJA_FUCK_RECOVERY")) 
	{
		output("Various bags and crates of animal feed are littered along the back wall to feed the creatures further into the shop. Carts, leashes, and reins hang from the walls in abundance, but without anyone to mind the shop, you’re left with nothing to do but admire the supplies.\n\nMaja is still recovering from your last bout of sexual activities.");
		return false;
	}
	//Repeat
	else
	{
		output("Maja, the korgonne beast tamer, stands behind her desk. Various bags and crates of animal feed are littered along the back wall, and the hard-working dog-girl sorts through them diligently. Every so often, she carts a load of food into the back room, feeding the mounts and companion animals kept in the hold’s basement. Her massive cleavage jiggles as she works, reined in by her sturdy leather top.");
		addButton(0, "Maja", repeatMajaApproach, undefined, "Maja", "Speak with the proprietor of this shop.")
		return false;
	}
}

public function repeatMajaApproach(back:Boolean = false):void
{
	clearOutput();
	showMaja();
	author("Gardeford");
	if(back) output("Is there something else you’d like to ask of Maja?");
	else
	{
		output("She ");
		//trust talked
		if(majaTrust()) output("smiles excitedly");
		else output("narrows her eyes");
		output(" when she sees you,");

		output("\n\n<i>“");
		if(!korgiTranslate())
		{
			output("How Maja help ");
			if(majaTrust()) output("[pc.name]");
			else output("alien");
			output(" today?");
		}
		else
		{
			output("So how can I help you today, ");
			if(majaTrust()) output("[pc.name]");
			else output("[pc.Mister] offworlder");
			output("?");
		}
		output("”</i>");
	}
	majaMenu();
}

public function majaMenu():void
{
	clearMenu();
	addButton(0,"Appearance",majaAppearance,undefined,"Appearance",(silly ? "Take a gander at that fiiiine ass doggo." : "Take a look at Maja."));
	//[rent](ask Maja what beasts she has available for rent)
	addButton(1,"Rent",majaRentButton,undefined,"Rent","Ask Maja what beasts she has available for rent.");
	//[return](return your rented animal)
	if(canReturnMajaPet()) addButton(2,"Return",returnPetToMajaMenu,undefined,"Return","Return a rented beast to its home.");
	else addDisabledButton(2,"Return","Return","You need to have rented a beast and have its leash on hand (or at least in your inventory) in order to return it.");
	//[talks](talk with Maja{, and maybe get on her better side}.
	addButton(3,"Talk",talkToMaja,undefined,"Talk","Talk with Maja" + (!majaTrust() ? ", and maybe get on her better side" : "") + ".");
	//[sex]({maybe you should get her to trust you before asking about sex./Help Maja out with her own beast.}
	if(majaTrust()) 
	{
		if(pc.lust() >= 33) addButton(4,"Sex",majaSexyTimes,undefined,"Sex","Help Maja out with her own beast.");
		else addDisabledButton(4,"Sex","Sex","You aren’t turned on enough for this.");
	}
	else addDisabledButton(4,"Sex","Sex","Maybe you should get her to trust you before asking about sex.");
	addButton(14,"Leave",mainGameMenu);
}

//Appearance
public function majaAppearance():void
{
	clearOutput();
	showMaja();
	author("Gardeford");
	output("You take a closer look at the korgonne beast tamer.");
	output("\n\nThe thick leather top she wears strains to hold in her massive chest, leaving her cleavage looking like a crevasse between two gargantuan bread loaves.");
	if(flags["SEXED_MAJA"] != undefined) output(" You know for a fact that her mammoth mammaries are also tipped by suckable sapphire nipples.");
	output(" Various animal cleaning and leatherworking tools are stuffed into holsters on the heavy skirt wrapped around her waist. Enough tools adorn the network of pockets that the skirt weighs heavily around her knees, reducing her to a determined waddle as she moves between work areas.");

	output("\n\nGolden brown fur covers nearly her entire body, leaving only a small circle of white on the center of her chest. She stands at an even five feet, a decent size for a korgonne, but her disproportionate bust makes her look shorter. The rest of her frame is lithe and fit, subtly muscled beneath the layer of fur. Squeezably ");
	if(silly) output("THICC");
	else output("thick");
	output(" hips and a tight, round butt keep her skirt on her waist despite the weight of her tools.");
	if(flags["SEXED_MAJA"] != undefined) output(" You recall that the heavy skirt also hides two feet of beryl bitch-cock and a pair of hefty volleyballs to match.");
	output(" Her arms can hardly reach past her titanic endowments, leaving her oddly off balance whenever she reaches for objects around the room. Her tail seems about average compared to the other korgonne you’ve seen, wagging happily as she goes about her work.");
	output("\n\n" + (flags["SEXED_MAJA"] == undefined ? "You don’t know what the stocky beast-tamer is packing down below, and the skirt she wears is heavy enough to obscure even a guess.":"You know precisely what lies beneath that heavy skirt. Nigh on two whole feet of sapphire doggycock, and a pair of volleyball-sized cream spheres to supply it. Her original sex remains hidden behind them, a puffy cerulean slit with a clit the size of a small jewel."));
	clearMenu();
	addButton(0,"Next",repeatMajaApproach,true);
}

//Rent
public function majaRentButton():void
{
	clearOutput();
	showMaja();
	author("Gardeford");
	//first time, else just a menu.
	if(flags["MAJA_RENT"] == undefined)
	{
		flags["MAJA_RENT"] = 1;
		if(pc.isBimbo()) output("<i>“So, like, what kinda animals do you have down here? Anything cute? Fluffy ones make the <b>best</b> pillows,”</i> you say, staring at the stocky korgonne’s bust and licking your [pc.lips]. Maja blushes and makes an attempt to cover her chest with her arms.");
		else if(pc.isBro()) output("<i>“So Is this where you keep those bear things?”</i> you crane your neck toward the back door, trying to catch a glimpse of the mighty beasts.");
		else output("<i>“So what animals do you have available? Some extra help sounds like it could be useful,”</i> you ask, looking toward the back door.");
		output(" The busty dog-girl nods proudly, tail wagging unchecked behind her. She scrambles around behind the desk before reaching for a set of keys on her belt.");

		output("\n\n<i>“");
		if(!korgiTranslate()) output("Yesyes! I tame. Make kor’diiaks listen. Also tame nog’wich, and grunches. All are ready for huntings");
		else output("Definitely! My ancestors tamed the first kor’diiaks used by our clan. I don’t do much hunting anymore, but I keep all of the animals we have in check. Kor’diiaks, nog’wiches, and even grunches");
		output(",”</i> The excited Korg lists off, her eyes full of fiery passion. It looks like you’re spoiled for choice.");

		if(!majaTrust()) 
		{
			output("\n\n");
			output("<i>“");
			if(!korgiTranslate()) output("But kor’diiaks not for outsider. No trustings. You can have grunch,");
			else output("But I don’t think I trust you with our prized hunting animals. You can have a Grunch for now,");
			output("”</i> she says matter-of-factly, jingling a single key loose from the ring.");
		}
		output("\n\nShe motions for you to follow as she waddles back into the rear cave. The thin passage leads to a larger, curved cavern filled with fenced cages all along the back wall. Pens for the korgonne’s animals are stocked with plenty of beasts, large and small. Maja takes you right past a few that seem to be nothing more than simple livestock, fuzzy things that shift around when you approach.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Those just gibgles. Make tasty drinkings and foods,");
		else output("Those are just gibgles. You can make some tasty drinks from their milk and they make a mean steak, but they’re worthless on the ice,");
		output("”</i> She says, continuing straight on to a much larger pen. This one contains much larger, hexapedal bear-like creatures. The beasts are covered in shaggy fur, with bare spots for their eyes, and a large, skewer-like horn atop their heads. At the moment the creatures are tearing into hunks of meat nearly as large as they are, dragging it toward piles of bedding to be slowly chewed.");

		output("\n\n<i>“");
		if(!korgiTranslate()) output("Here kor’diiaks. Is lunch time. Huntings just finished. Much success!");
		else output("Here are the big guys. They just finished a hunt, so we let them reap some of the rewards,");
		output("”</i> she says, leading you past the ");
		if(silly) output("feasty beasties");
		else output("monstrous creatures");
		output(". The next fenced area is even larger, containing a well worn trail around the outer edge. A creature that looks something like a deer combined with a leopard trots by you, a long tongue snaking out from its mouth to give Maja a lick. You can see varying sizes of the same creature in the back of the area, some looking to be closer to horses in size. Beautiful sapphire dots stand out on their snowy fur, spattered seemingly at random over their bodies.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Nog’wich good smellers. Sniff out big shinies. Many many in mines. Old nog’wich much good for ridings,");
		else output("These are the nog’wich. They have very good noses for sniffing out minerals and avoiding active lava flows. The younger ones are a favorite of miners, but the older ones grow too big to maneuver in the mines, so they’re used for scouting. They’re also good with kids,");
		output("”</i> she explains, reaching out to pet the top of the creature’s muzzle. The graceful creature nuzzles against her hand like a cat, emitting a soft cooing noise before pulling away and darting along the track. More nog’wich approach her as you travel to the next pen, sticking their heads through to receive pets. Some adventurous ones stay long enough for you to rub their rounded ears.");

		output("\n\nYou expect the final pen to extend into an even deeper cavern, given the trend of the last three, but you find it to be no larger than the waiting room where Maja keeps her desk. Inside, a gaggle of awkward looking lizard-like creatures mill about in the enclosed space. Eyes like saucers flit around, settling on you for a half second before moving on. One of the creatures makes a move to approach the fence, but trips on its own legs and falls with a thunk. Three others surrounding it bounce five feet straight into the air, landing with unbelievable grace to face their fallen companion.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Grunch not much smart. Needings small pen. Otherwise giving selves many hurts. Need many watchings. Small ones have " + (silly ? "spit of danger!":"acid spits."));
		else output("Grunch arent the smartest things, but they try. They hurt themselves if they have too much space to move around and no one to look after them. The little ones can spit acid from their mouths if you point them at something you need melted. We still have to take care of them after they grow up though. They get attached to the miners they grew up with, and they taste like garbage, so we can’t cook them.");
		output("”</i> Maja watches as the creatures sniff each other before returning to aimlessly wandering their pen.");

		output("\n\nBefore you know it you’ve come all the way around the cavern and end up right back in Maja’s waiting room.\n\n");
		processTime(20);
	}
	else output("Maja gestures toward her animals. ");
	output("<i>“");
	if(!korgiTranslate()) output("Do you want any for ridings?");
	else output("Would you like to rent any of them?");
	output("”</i>");
	processTime(2);

	clearMenu();
	addButton(14,"Back",repeatMajaApproach,true);
	//[Kor’diiaks](big guys, make travel in ice faster. Probably reduce the chances for random encounters, but not for things like frostwyrms.)[Nog’wich](medium sized mount, slightly faster than a kor’diiak, but doesn’t reduce encounter chance.)[Grunch](It’s a mount. Doesn’t go to fast, but increases run away effectiveness.)[Shoulder Grunch](A smaller grunch that can sit on your shoulder. Spits gobs of acid that (reduce armor/are more effective against armored targets).){silly:[MGBK](Miniature Giant Baby Kor’diiak. Take it.)}[no](all good for now)
	addItemButton(0, new KordiiakLeash(), purchaseTameling, new KordiiakLeash());
	if(!majaTrust()) setButtonDisabled(0);
	addItemButton(1, new NogwichLeash(), purchaseTameling, new NogwichLeash());
	addItemButton(2, new ShoulderGrunchLeash(), purchaseTameling, new ShoulderGrunchLeash());
	addItemButton(3, new GrunchLeash(), purchaseTameling, new GrunchLeash());
	if(silly)
	{
		addItemButton(4, new MiniatureGiantBabyKordiiak(), purchaseTameling, new MiniatureGiantBabyKordiiak());
		if(!majaTrust()) setButtonDisabled(4);
	}
	if(flags["MAJA_RENTING"] != undefined)
	{
		output("\n\n<b>You will not be able to rent a new animal until you return the old one.");
		setButtonDisabled(0);
		setButtonDisabled(1);
		setButtonDisabled(2);
	}
}

public function purchaseTameling(arg:ItemSlotClass):void
{
	clearOutput();
	showMaja();
	author("Gardeford");
	if(!korgiiCredits() && !(arg is GrunchLeash)) //allow grunch passthrough
	{
		output("You pull out a few " + (isAprilFools() ? "dogecoins" : "credit chits") + ", prepared to give the stocky korgonne whatever kind of payment she needs for riding the animals. Maja gives you a confused look, glancing at the chits and back up to you.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Korgs no take space money. Much sorry, but Maja have no use for silly money sticks. Can still have grunch though. Grunch is on the house, not even needings to bring back if don’t want,");
		else output("Sorry, but I cant accept your alien money sticks. I guess you could still have a grunch for now if you want. I don’t really even mind if you bring it back, they grow like weeds,");
		output("”</i> she apologizes, offering the freebie with a sympathetic jingle of her keys.");
		clearMenu();
		addButton(0,"Next",repeatMajaApproach,true);
		return;
	}
	else if(pc.credits < arg.basePrice)
	{
		output("You realize after a moment that <b>you can’t afford such extravagance.</b> Oh well.");
		clearMenu();
		addButton(0,"Next",majaRentButton);
		return;
	}
	if(!(arg is GrunchLeash) && !(arg is ShoulderGrunchLeash) && !(arg is MiniatureGiantBabyKordiiak)) flags["MAJA_RENTING"] = arg.description;
	pc.credits -= arg.basePrice;
	eventQueue.push(majaRentButton);
	//Kor'diiak
	if(arg is KordiiakLeash)
	{
		output("<i>“I’d like to take a kor’diiak out,”</i> you say, handing Maja a " + (isAprilFools() ? "dogecoin" : "credit chit") + ". She gives the small piece of tech a thoughtful look, stowing it in a small box on her desk. She separates a large silver key from her ring and scurries to the back pens. A minute later she comes back, leading one of the hulking bear-like creatures by a thick-roped collar. It huffs inquisitively in your direction, and Maja transfers the leash to your hands.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Here go! Kor’diiak will do a protect. Big scary to bad guys. He make sure many get home safe, so you make sure he get home safe.”</i>");
		else output("Here you are, this big guy ought to protect you out on the ice. Or anywhere cold really. He’s helped a lot of korgonne get back safe from hunts. He’ll have your back, so you make sure to have his.”</i>");
	}
	else if(arg is NogwichLeash)
	{
		output("<i>“I think I’ll take a nog’wich today,”</i> you say handing maja a " + (isAprilFools() ? "dogecoin" : "credit chit") + ". She takes the small tech chip and stows it away in a small box on her desk, giving an approving nod as she closes it. She takes her key ring and scurries off into the back room, coming back a few minutes later with a horse-sized nog’wich on a fine leather leash. The creature eyes you up and down before brushing against you and purring. From such a large creature the effect if more like an engine.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Normally would give smaller nog’wich for huntings, but aliens can be all shapes or even sizes. I give you one of biggest nog’wich. Then you can give rides if finding lost aliens,");
		else output("Normally only the smaller nog’wich go out for hunts, but I figure since there are all kinds of aliens out there I’d give you one of the biggest one we have who’s still in her prime. I think she likes you,");
		output("”</i> she says, handing the leash off to you.");
	}
	//Grunch
	else if(arg is GrunchLeash)
	{
		output("<i>“I guess I’ll stick with a grunch today,”</i> you say, a little hesitant based on the shopkeeper’s obvious bias about them. She gives you a");
		if(majaTrust()) output(" sympathetic");
		else output(" curt");
		output(" nod and heads into the back room, separating a drab key from her ring. She comes back a minute later leading one of the droopy lizards you saw in the pens. It hardly seems to take notice of you, but takes a step closer when Maja hands over its leash. It shivers periodically, seemingly more from fear than cold.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Return if want, or not. Maja has too many grunch.");
		else output("Return it if you want. I’ve got plenty, and they aren’t really used except to prank new scouts.");
		output("”</i>");
	}
	//Shoulder grunch
	else if(arg is ShoulderGrunchLeash)
	{
		output("<i>“I guess I’ll take a shoulder grunch for now,”</i> you say, a little hesitant based on the shopkeeper’s feelings about them. She nods, seperating a small key from her ring as she heads back into the pen area. A minute later she returns with a parrot sized winged lizard on one arm. It looks at you, its head listing lazily to one side, and burps.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Go ahead and take. Maja no want stinky lizard. Keep if want,");
		else output("Go ahead and keep this one if you want it. It’s just gonna grow up and take up space here, so maybe you can get some better use out of it,");
		output("”</i> she says as she heaps the lizard onto your shoulder. It makes a clucky whistling sound, looking around the room as if trying to discern what changed.");
	}
	else if(arg is MiniatureGiantBabyKordiiak)
	{
		output("You look to the left and right to make sure no one is watching, leaning close to whisper your request in Maja’s ear.");
		output("\n\n<i>“Tell him this is [pc.name] Steele, requesting a miniature giant baby kor’diiak delivered to this location.”</i> Maja nods curtly, spinning around on her stool and opening a small door in the stone wall. She pulls out a corded telephone, speaking a phrase into the receiver. The cave begins to shake, and a massive korgonne fist smashes through the ceiling, bathed in rays of shadowy light. You hold out your hands, and the fist drops a basketball sized kor’diiak into your hands. It yips playfully, poking at your fingers with its tiny horn. When you look away you find Maja sitting at her desk, with no sign of the damage caused to the cave. What could have come over you?");
	}
	else
	{
		output("Maja goes vanishes into the back and returns with your brand-new rental pet.");
	}
	output("\n\n");
	
	quickLoot(arg);
}

public function canReturnMajaPet():Boolean
{
	//Bear:
	if(flags["MAJA_RENTING"] == "a kor’diiak bear leash")
	{
		if(pc.hasItemByClass(KordiiakLeash) || pc.accessory is KordiiakLeash) return true;
	}
	//Cathorse
	if(flags["MAJA_RENTING"] == "a nog’wich leash")
	{
		if(pc.hasItemByClass(NogwichLeash) || pc.accessory is NogwichLeash) return true;
	}
	//Acid spitboi
	if(pc.hasItemByClass(ShoulderGrunchLeash) || pc.accessory is ShoulderGrunchLeash) return true;
	if(pc.hasItemByClass(GrunchLeash) || pc.accessory is GrunchLeash) return true;
	return false;
}
public function returnPetToMajaMenu():void
{
	var btnSlot:int = 0;
	
	clearMenu();
	if(flags["MAJA_RENTING"] == "a kor’diiak bear leash" && (pc.hasItemByClass(KordiiakLeash) || pc.accessory is KordiiakLeash))
	{
		addButton(btnSlot++, "Kor’diiak", returnPetToMaja, "kor’diiak", "Return Kor’diiak", "Return the kor’diiak to its home.");
	}
	if(flags["MAJA_RENTING"] == "a nog’wich leash" && (pc.hasItemByClass(NogwichLeash) || pc.accessory is NogwichLeash))
	{
		addButton(btnSlot++, "Nog’wich", returnPetToMaja, "nog’wich", "Return Nog’wich", "Return the nog’wich to its home.");
	}
	if(pc.hasItemByClass(GrunchLeash) || pc.accessory is GrunchLeash)
	{
		addButton(btnSlot++, "Grunch", returnPetToMaja, "grunch", "Return Grunch", "Return the grunch to its home.");
	}
	if(pc.hasItemByClass(ShoulderGrunchLeash) || pc.accessory is ShoulderGrunchLeash)
	{
		addButton(btnSlot++, "S.Grunch", returnPetToMaja, "shoulder grunch", "Return Shoulder Grunch", "Return the shoulder grunch to its home.");
	}
	addButton(14, "Back", majaMenu);
}
public function returnPetToMaja(beast:String = ""):void
{
	clearOutput();
	showMaja();
	author("Gardeford");
	switch(beast)
	{
		case "kor’diiak":
			output("You lead the large bear-like beast waiting outside the door back into Tamed Tamelings. It immediately bounds over to maja, giving her a big lick and knocking her off balance so she falls back into her chair.");
			output("\n\n<i>“Oof, guess you missed ");
			if(!korgiTranslate()) output("Maja");
			else output("me");
			output(",”</i> she says, patting the shaggy creature affectionately. She leads him back to the pens, coming back a minute later with a huge grin.");
			output("\n\n<i>“");
			if(!korgiTranslate()) output("Much thankings! Hopefully he did many helpings,");
			else output("Thanks for bringing him back. I hope he was a lot of help. Just ask if you need anything else,");
			output("”</i> she says, sliding the key back onto her ring.");
			
			if(pc.hasItemByClass(KordiiakLeash)) pc.destroyItemByClass(KordiiakLeash);
			else if(pc.accessory is KordiiakLeash) pc.accessory = new EmptySlot();
			
			flags["MAJA_RENTING"] = undefined;
			break;
		case "nog’wich":
			output("The large horse-leopard you had left waiting at the door enters at your call, brushing against Maja before heading back into the pen area of its own volition. Maja smiles, going to let her back into her enclosure. She comes back a moment later with a huge smile.");
			output("\n\n<i>“");
			if(!korgiTranslate()) output("Many thankings. Little korgs will be happy. Many ridings again.");
			else output("Thanks for keeping her safe, the little ones will be happy to have their favorite riding nog back in the hold.");
			output("”</i>");
			
			if(pc.hasItemByClass(NogwichLeash)) pc.destroyItemByClass(NogwichLeash);
			else if(pc.accessory is NogwichLeash) pc.accessory = new EmptySlot();
			
			flags["MAJA_RENTING"] = undefined;
			break;
		case "grunch":
		case "shoulder grunch":
			output("Maja scowls as you bring the grunch back through the door, but takes it off your hands. She’s in the back room for under a minute before plodding back to her desk, sitting grumpily on her stool.");
			output("\n\n<i>“");
			if(!korgiTranslate()) output("Much thankings. So glad having grunch back,");
			else output("Gee thanks. I don’t know what I’d have done if that one didn’t return,");
			output("”</i> she snarks with a playful smile.");
			
			//Just purge all grunches, it's fiiiine. PC can't have both at once anyhow.
			if(beast == "grunch")
			{
				if(pc.hasItemByClass(GrunchLeash)) pc.destroyItemByClass(GrunchLeash);
				else if(pc.accessory is GrunchLeash) pc.accessory = new EmptySlot();
			}
			if(beast == "shoulder grunch")
			{
				if(pc.hasItemByClass(ShoulderGrunchLeash)) pc.destroyItemByClass(ShoulderGrunchLeash);
				else if(pc.accessory is ShoulderGrunchLeash) pc.accessory = new EmptySlot();
			}
			break;
		default:
			output("You return the rented animal to a grateful Maja.");
			break;
	}
	//(back to menu)
	clearMenu();
	addButton(0,"Next",repeatMajaApproach,true);
}

//Talks
public function talkToMaja():void
{
	clearOutput();
	showMaja();
	author("Gardeford");
	output("What will you talk to Maja about?");
	clearMenu();
	addButton(14,"Back",repeatMajaApproach,true);
	addButton(0,"Aliens",majaAliensTalk,undefined,"Aliens","Find out why Maja doesnt trust aliens.");
	addButton(1,"Taming",majaTamingTalk,undefined,"Taming","Ask Maja about beast taming and how she takes care of the animals.");
	addButton(2,"Space",majaSpaceTalk,undefined,"Space","Ask Maja what she thinks about space itself and if she’d ever think of traveling.");
}

//aliens
public function majaAliensTalk():void
{
	clearOutput();
	showMaja();
	author("Gardeford");
	output("<i>“");
	if(pc.isBimbo()) output("So like, why don’t you trust aliens? You guys are super fluffy and trustable. I can’t think of anyone who wouldn’t be nice to you.");
	else output("So why don’t you trust aliens? Did someone try to hurt you?");
	output("”</i> you ask, sitting in front of the stout korgonne’s desk. Maja narrows her eyes slightly, giving you a second look-over. She scoots closer to her desk and rests against the wooden frame.");

	//korg speak
	if(!korgiTranslate())
	{
		output("\n\n<i>“Want to give trustings. Not have many meets with outsiders. Only see sometimes when taming animals. Last time I ambush, but aliens win fight. Was expecting warm shares, almost hoping, but instead they jabbed with sharps and pokings all over. Kor’diiak came to Maja’s rescue, and carried back to hold. First hour there was nothing, but then came much heat. Like sharing warmth, but millions of sharings all at once!”</i> The stocky dog-girls tail begins to wag at the memory, flitting behind her as she continues her story.");
		output("\n\n<i>“Their sharpings filled me with alien drugs,”</i> she gives herself a tight hug, shaking her head. <i>“Didn’t want, but wanted. Warmings didn’t care about thinkings. When thinks returned me wasn’t me anymore. Maja’s chest is bigger than Maja, and,”</i> She hesitates for a brief second, sniffling, but the rest of the statement pours out. <i>“And alien sharp gave me ");
		if(silly) output("the ponos");
		else output("boy-korg parts");
		output(".”</i>");
	}
	//fix speak
	else
	{
		output("\n\n<i>“I want to trust you. I don’t meet many outsiders. The rare occasions I do see them are when I’m out taming new animals. The last group I saw looked pretty weak, so I decided to ambush them. I got my ass kicked, but I’d heard stories of aliens who prefer to just mate after a good fight instead of doing nastier things, so I wasn’t too sad about it. Instead they started jabbing be with needles, all over my chest and above my crotch. I was weary from the battle so I couldn’t stop them, but luckily one of the kor’diiaks came back and scared them off,”</i> she hugs herself tight, shaking her head as she continues.");
		output("\n\n<i>“The aliens drugs were already in my system when they brought me back. At first I just felt kind of numb, but then I got hotter than I’ve ever felt. I lost my ability to focus on anything but the pleasure. Even the cave air on my fur felt sexual. I passed out for who knows how long, and when i woke up I was this! I used to have a nice, firm chest, but now I have pillows that are almost bigger than my body. And if that wasn’t bad enough, that stupid drug gave me a,”</i> she hesitates for a brief second, sniffling, but the rest of her words pour out. <i>“A dick”</i>");
	}
	//merge
	output("\n\nSuddenly the thick skirt she wears even down here in the warm caves makes a bit more sense. You ");
	if(pc.isBimbo()) output("jump into a hug that almost knocks the poor girl off her feet.");
	else if(pc.isBro())
	{
		if(pc.tallness >= 12*5 && pc.PQ() >= 60) output("lift");
		else output("lock");
		output(" the saddened dog-girl in a tight embrace.");
	}
	else output("put a comforting hand on the dog-girl’s shoulder.");

	output("\n\n<i>“");
	if(pc.isBimbo()) 
	{
		output("Those people sound like the worst! You shouldn’t be forced into things you don’t want... But it can’t be all bad. Having both parts");
		if(pc.isHerm()) output(" is");
		else output(" sounds like");
		output(" fun!");
	}
	else if(pc.isBro()) output("Cheer up. It can’t be all bad,");
	else if(pc.isNice()) output("That’s terrible! That kind of thing is illegal on core planets like this. But it’s not all bad, is it? Plenty of people who live with both parts down there nowadays,");
	else if(pc.isMischievous()) output("People like that make me sick. Those kinds of drugs shouldn’t be tossed around like toys. It can’t be all bad though, can it? Having both parts probably makes you super popular around here!");
	else output("Those people sound like they need a good beating. You’re alright though, right? Having both parts is nothing to cry about,");
	output("”</i> you say, trying to sound reassuring. Maja stares at you in awed disbelief for a moment, eyes wide and still a little blurry from her recounting.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("N-no, korgonne not like this in normal times. Lots of alien with both parts, but korgonne never. Other females say is wierd or laugh, would rather have alien with both parts than korgonne. Males worry kids will be weird, too scared even for warm shares,");
	else output("N-no, korgonne never have this kind of thing happen naturally. At least not in our clans records, and I’ve never heard tales of it elsewhere. The men here are too frightened that their pups will turn out this way to even consider me an option, and the other girls would rather have exotic alien cock if they’re going to go for someone with both parts,");
	output("”</i> she whines, still looking like she’s surprised you’re still listening.");

	if(flags["TUUVA_25AFF"] != undefined) 
	{
		output("\n\n<i>“");
		//tuuva affection low:
		if(tuuvaAffection() < 50) output("The blacksmith");
		else output("Tuuva");
		output(" has a dick as well, and the other korgonne don’t seem to have any extra concerns about her,”</i> you mention. Maja blushes, reaching down to fiddle with the hem of her skirt.");

		output("\n\n<i>“");
		if(!korgiTranslate()) output("T-tuuva not care what other korgs think. Also has normal korg dick. Maja has weird korg dick. Too much drugs,");
		else output("T-tuuva doesn’t care what other people think; she got a normal sized dick. I ended up with this,");
		output("”</i> she explains, lifting the hem of her dress for a moment. The action reveals a pair of volleyball sized testes and a sheath fit for ");
		if(silly) output("fucking excalibur holy shit");
		else output("a claymore");
		output(". At full length you imagine the thing must be as big as a smaller korgonne’s whole torso, head included. She drops her skirt, dusting it with her hands.");
	}
	output("\n\n<i>“Well, what about you? How do you feel about ");
	if(!korgiTranslate()) output("warm shares");
	else output("sex");
	output(" with exotic aliens?”</i> You ask, shifting into a position that shows off more of your assets. To your delight, you see the embarrassed korgonne’s thick skirt begins to tent slightly. She averts her eyes, trying to meet yours, but the damage is already done. Her breath quickens, and you imagine her fantasizing about the two of you in bed, or right here. She continues to harden till you can see the pointed tip of her cobalt cock peeking out from under the leather, lifting it up almost level with the desk.");
	output("\n\n<i>“I... uhh... whoa. ");
	if(flags["SEXED_MAJA"] == undefined) output("Maja hasn’t shared warmth");
	else output("I haven’t been with anyone");
	output(" since this happened. M-maybe when ");
	if(!korgiTranslate()) output("chores finished");
	else output("I finish my work for the day");
	output(" we could... Maybe... Mmm,”</i> a shudder runs through her body, and you see her slowly begin to pull herself together.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("C-can Maja help with anything else?");
	else output("I-is there anything else I can help you with in the meantime?");
	output("”</i> she asks, tail wagging behind her.");
	processTime(25);
	flags["MAJA_TRUST_TALK"] = 1;
	//(back to menu)
	clearMenu();
	addButton(0,"Next",talkToMaja);
}

//Taming
public function majaTamingTalk():void
{
	clearOutput();
	showMaja();
	author("Gardeford");
	output("<i>“");
	if(pc.isBimbo()) output("So, like, how do you tame those big scary monsters all by yourself? Isn’t that suuuuper dangerous?");
	else output("So how do you tame a kor’diiak all by yourself? No offense, but it seems like it would be dangerous to do alone.");
	output("”</i> you ask. The stacked korgonne grins proudly, leaning against her desk.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("No more alone! Tame kor’diiaks give Maja many helpings. Easier to make wilds listen when tame friends help to convince,");
	else output("I’m not alone out there! It’s much easier to tame more of them now that I have a good amount of helpers. The tame kor’diiaks can keep their wild counterparts calm enough to train,");
	output("”</i> she explains, thinking for a moment before continuing.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("In old times lots of korg ancestors needed for tamings. Ancestors fight with tooth and spear. Sometimes die, but before aliens coming kor’diiak were strongest weapon. Still strong, but aliens bring many weapon. Some better than kor’diiak, but maybe not so reliable,");
	else output("We used to need whole hunting parties to tame them, but nowadays it’s just my family line. For now that’s just me, I guess. Most tribes don’t even bother with animal tamers nowadays. Alien weapons are a much easier way to defend yourself, though maybe not quite as reliable sometimes,");
	output("”</i> she says with a smirk.");
	output("\n\n<i>“Well what about all the animals you have now. How do you keep up with taking care of all of them?”</i> you ask, satisfied with her answer to your initial question.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("That easy! Any korg could do, but Maja best at keeping happy. Animals know Maja since tamings or bornings. Hunter korgs leave unused meat here for kor’diiaks. Meat get split into many portion, much good to eat. Nog’wich eat cave moss and smallish crab things. Big nog’wich need many foodings, but crab things are nuisance. Show up all over cave. Grunch eat rock I think, don’t really know,");
	else output("Oh it’s nothing really. Taking care of them is easier than catching them. Any korgonne could do it, but I’m the best at keeping them happy. The others don’t know which kor’diiak likes the stomachs and which like the intestines left over from the hunts. They don’t know which of the nog’wich prefer lighter lichens compared to heavy clumps. Grunch just eat rocks I think, so they could probably do that just as well, but that doesn’t count. It probably sounds really dumb but there isn’t much to it when you’ve been doing it since you were a kid,");
	output("”</i> She smiles wistfully, locking eyes with you again after a moment of thought.");

	output("\n\n<i>“Anything else?”</i>");
	processTime(25);
	//(Back to talk menu)
	flags["MAJA_TAMING_TALK"] = 1;
	clearMenu();
	addButton(0,"Next",talkToMaja);
}

//Space
public function majaSpaceTalk():void
{
	clearOutput();
	showMaja();
	author("Gardeford");
	output("<i>“So what do you think about space, apart from the aliens. Do you think you’d ever travel to other planets?”</i> You ask, taking a seat ");
	if(pc.isTaur()) output("against");
	else output("on");
	output(" a crate of collected moss. The stocky korgonne takes a moment to think of an answer, plopping down at her desk while she does so.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("Hmm. A few korg talk of wanting to visit stars. See sights, taste foods, share warmings with aliens. Many reasons to go. Maja talk to other korg at trading post, nothing to talk about but aliens and planets. Bold talk of sneakings on alien ships. Probably just boastings, everyday korg not brave enough for far travels,");
	else output("Well... I’ve heard some others talk about wanting to see other planets, or even just go out on a spaceship for a while. Find out what the galaxy has to offer. They want to see the sights, taste the food, make love to the aliens. I heard some other korgonne at one of the trading posts who wouldn’t stop talking about stowing away on an alien ship and popping out when it’s too late for them to turn back. For most of them im sure it’s just talk. Most korgonne I know are too invested in the hold,");
	output("”</i> she muses, her tail bobbing back and forth slowly.");

	output("\n\n<i>“They do seem happy here, but that’s not quite what I asked. ");
	if(!korgiTranslate()) output("Everyday korgs");
	else output("Most korgonne");
	output(" can do what they want. I want to know what <i>You</i> think,”</i> you insist, locking eyes with the stocky korgonne. She flushes slightly, fidgeting with her paws.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Maja couldn’t. Too much need. Animals need, tribe needs. Can’t go, even if want,");
	else output("I couldn’t. Too many people rely on me here. The animals, the tribe.. Even if I wanted to go, I just can’t,");
	output("”</i> she replies. She flushes deeper, but perks up as she continues.");

	//if pc is puppo preg:
	if(pc.hasPregnancyOfType("KorgonnePregnancy")) 
	{
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Maybe Maja could do spacings when " + (silly ? "puppers" : "pups") + " are grown,");
		else output("Maybe when I teach our pups how to take care of the animals I could give it a try,");
		output("”</i> she smiles sheepishly, eyeing your [pc.belly].");
	}
	//else:
	else
	{
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Maybe Maja could do spacings if mating happens, but not yet,");
		else output("Maybe if I had a family to teach about training the animals I could visit another planet, but no luck yet,");
		output("”</i> she tries to sound cheerful, but her ears droop a little.");
	}
	//merge
	output("\n\n<i>“Anyway, can ");
	if(!korgiTranslate()) output("Maja");
	else output("I");
	output(" help with anything else?”</i>");

	processTime(25);
	flags["MAJA_SPACE_TALK"] = 1;
	clearMenu();
	addButton(0,"Next",talkToMaja);
}

//Sexytimes
//normal
public function majaSexyTimes():void
{
	clearOutput();
	showMaja(true);
	author("Gardeford");
	//pc in heat
	if(pc.inHeat())
	{
		output("<i>“Are chores still... you done?”</i> you sputter. What were you going to say? Some clever quip is swimming around at the tip of your tongue, but the throbbing ache in your [pc.vaginas] robs the concentration from your mind. You stagger closer to the korgonne shopkeeper, breathing heavily and using her desk for support. A vague, minty scent tickles your [pc.clit] as much as your nose, promising more to come.");
		output("\n\nYou finally manage to focus on Maja, only to see her leaning against the cave wall, a spilled bag of grains at her feet. Her cobalt blue cock is almost fully hard, tenting her skirt so heavily that you can see the bulbous knot at its base. She pants, trying to keep her gaze level with your eyes, but straying down to your crotch.");
		if(!pc.isCrotchExposed()) output(" When did you pull your [pc.crotchCover] down?");
		else output(" when did you remove your equipment?");

		output("\n\n<i>“");
		if(!korgiTranslate()) output("[pc.name] smells so good. Can we have matings?");
		else output("Oh gods you smell <i>good</i>. I can’t stop thinking about... mating, breeding, fucking!");
		output("”</i> she whines, her turgid dick throbbing harder with each word. <b>Breeding sounds like a really good idea</b>");
		pc.changeLust(5);
	}
	else 
	{
		if(pc.isBimbo()) output("<i>“Are your chores done yet? I’d love to " + (silly ? "nom on" : "get a taste of") + " that peppermint pecker you’ve got hidden away.”</i>");
		else if(pc.isBro()) output("<i>“You stretch, leaning heavily over the counter. <i>“Wanna fuck?”</i>");
		else if(pc.isNice()) output("<i>“If you feel like taking a break I think I could help you relieve some stress.”</i>");
		else if(pc.isMischievous()) output("<i>“You know, if you took a break we could have hot, steamy warmth shares right now.”</i>");
		else output("<i>“If you finished your job quicker we could be fucking right now.”</i>");
		output(" The overencumbered dog-girl drops the bag of grains she had been lugging toward the wall, turning red as her tail thrashes furiously behind her.");

		output("\n\n<i>“");
		if(!korgiTranslate()) output("Maja");
		else output("I");
		output(" can take ");
		if(korgiTranslate()) output("a ");
		output("break,”</i> she manages, quickly waddling over to bar the door before undoing the belted straps that hold up her skirt. The tip of her cobalt blue cock pokes out from its sheath, obviously as excited as she is for what’s to come. Two nearly volleyball sized furry gonads sway with her movement, bouncing gently as she scoots back to her desk.");
		output("\n\n<i>“What did you have in mind?”</i>");
	}
	processTime(2);
	pc.changeLust(5);
	majaSexMenu();
}

public function majaSexMenu():void
{
	var ppMaja:PregnancyPlaceholder = majaPlaceholder();
	
	clearMenu();
	addButton(0,"WorshipDick",worshipMajasBitchBreakingBoner,undefined,"WorshipDick","Service maja with your mouth and hands. There’s a lot there to work with.");

	if((pc.hasCock() && pc.cockThatFits(ppMaja.vaginalCapacity(0)) >= 0) || pc.hasHardLightEquipped()) addButton(1,"Pitch Dick",penisRouter,[pitchDickingToMaja,ppMaja.vaginalCapacity(0),true],"Pitch Dick","Give her a good dicking.");
	else if(pc.hasCock()) addDisabledButton(1,"Pitch Dick","Pitch Dick","Your penis won’t fit in there.");
	else addDisabledButton(1,"Pitch Dick","Pitch Dick","You need a penis that will fit inside Maja OR a hardlight strap-on to do this scene.");

	if(pc.hasCock()) addButton(2,"Frotjob",penisRouter,[majaFrotjob,90000000,false],"Frotjob","Hey, there’s enough room in there for your dick too!");
	else addDisabledButton(2,"Frotjob","Frotjob","You need a penis to do this.");

	if(pc.hasVagina()) 
	{
		if(pc.inHeat()) addButton(3,"Heat Fuck",heatFuckMaja,undefined,"Heat Fuck","<b>A REALLY good idea.</b>");
		else addButton(3,"Catch Dick",catchMajasCockYaSlut,undefined,"Catch Dick","Take Maja’s monster inside you.");
	}
	else 
	{
		addDisabledButton(3,"Catch Dick","Catch Dick","You’d need to have a vagina to take Maja’s dick in it.");
	}
	if(pc.isTaur()) addDisabledButton(4,"HJ+RideHer","Give Handjob & Ride Her","Alas, your exotic 'tauric body prevents you from engaging in this.");
	else if(!pc.hasVagina()) addDisabledButton(4,"HJ+RideHer","Give Handjob & Ride Her","If you want to do this, <b>you will absolutely need a pussy.</b>");
	else addButton(4,"HJ+RideHer",vaginaRouter,[majaHandjobAndRide,ppMaja.cockVolume(0),0,0,true],"Give Handjob & Ride Her","Get down and dirty with Maja.");
	addButton(14,"Back",repeatMajaApproach,true);
}

//Worship
//compatible for all genders, taurs/snek, etc
public function worshipMajasBitchBreakingBoner():void
{
	clearOutput();
	showMaja(true);
	author("Gardeford");
	
	var ppMaja:PregnancyPlaceholder = majaPlaceholder();
	
	output("<i>“Scoot yourself up onto that table for me,”</i> You command. The brown-furred dog-girl complies immediately, hopping up to sit at the tables edge, her maleness bobbing in the open air. An adorable sense of anticipation paints her features, complemented by her rapidly wagging tail. You [pc.move] close enough to ");
	if(pc.isNaga()) output("coil up");
	else if(pc.hasKnees()) output("kneel");
	else output("sink down");
	output(" in front of her. Up close, you can see the pulsing muscle of her knot. The bulging gemstone of dickflesh is still mostly soft at this point, but you imagine it will grow as large or bigger than her balls when you get started.");

	output("\n\n<i>“Having a dick isnt so bad, is it? I couldn’t do this, otherwise,”</i> you say, punctuating your statement with a kiss to the base of her knot and a lick that ends with another kiss at the crown. Hints of mint mix with the musky smell of her dick and swim around to stimulate the pleasure centers of your brain. When you reach the top you’re delighted to see Maja trembling with lust, her chest heaving with every breath.");

	output("\n\nThe turgid shaft seems to grow even larger as you work, only stopping when it nearly pokes the lust-lost dog-girl in the chin. In fact, you’re certain if she looked down she could suck herself off. The thought works its way through your head, and you debate acting on it. You could reach up and pull her down atop her own cock with one hand. But no, this cock is <b>yours</b> for now. The minty musk puppeteering your actions twists the idea around, and you rise to press closer to her body.");

	output("\n\nWith single-minded fervor, you grasp the back of her neck, burrowing through her fur to nibble at her exposed throat. Two feet of bestial cockmeat throbbs in time with her heartbeat, squished between her monstrous breasts and your own [pc.chest]. You can feel the moans rising through her as you nestle into her fur, and she hugs tightly to your head as you continue to grind. You pinch each of her nipples between two fingers, pulling the golden-furred titflesh into a tighter embrace");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Much good feels! Unh, very goods");
	else output("Ohh fuck! I can feel it in my whole body");
	output(",”</i> she yips, muscles clenching as you slip your [pc.lips] around her cockhead. The twin tastes of meat and mint mix with the salty pre-cum fountaining from her tip, and you greedily lick and suckle the soft point. Her breasts bounce in the air as you release them, using both hands to coddle her expanding knot. The bulging meat swells as you massage it, swiftly matching the size of her melon-thick balls.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Maja’s... Already,");
	else output("I... I’m already,");
	output("”</i> she shouts, making a weak attempt to pull your head further onto her cock. You freeze, preparing for a deluge of cum as she drops back onto the table, muscles locking in a brain freezing orgasm. Anticipation pumps signals to your throat with every throb of her sapphire slutprick, and you find yourself gulping empty air at the prospect of drinking her spunk.");
	output("\n\nBut ");
	if(flags["SEXED_MAJA"] != undefined) output("the cum doesn’t come");
	else output("nothing happens");
	output(". Maja groans as you continue to suck, teeth clenching as her body is jolted by smaller shocks of pleasure. The cum isn’t coming, but her orgasm doesn’t seem to be stopping either. She grunts out something you can hardly make out between the moans of pleasure, and you painstakingly pop yourself off her cock to listen more closely.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("Stuck! Cum stuck! Helpings please,");
	else output("My knot! Please! It won’t stop,");
	output("”</i> she pleads in a desperate whine. You jerk back into motion, continuing to massage the now watermelon sized knot in Maja’s cock. Instantly, the action rewards you with a blast of hot, musky cum that showers your face and [pc.chest]. You lick up as much as you can reach with your [pc.tongue], but more gushing spurts erase any progress you make. For her part, the korgonne shopkeeper mumbles a few unintelligible burbles of orgasmic thanks, twisting on the table as pleasure racks her frame.");

	output("\n\nYou quickly seal your [pc.lips] back around her cockhead, not wanting to lose any more of the musky elixir. Even as you swallow jet after jet, the cum left on your face fills your senses with pheromones. Enticing smells that cloud your mind and beg you to keep drinking, all the while chastising your mouth for keeping such liquid delights to itself. You breathe deeply, holding the scent inside for as long as you can, and let her cum build up in your mouth.");

	output("\n\nBaser urges war inside you as your cheeks fill with thick, creamy cum, till eventually you’re forced off the seemingly endless tap. A last spurt covers your eyelids with jizz as you pull away, masking your sight. You swallow once before gasping for air, the remainder of the musky cum gushing over your [pc.chest] and down your [pc.belly]. You grasp at it with your hands, licking your palms in between breaths.");

	output("\n\nIt takes your brain a moment to register the lack of cock, and you reach out blindly, cherishing the sheer length of Maja’s mast in your hands once again. You grope along the rest of her body with one hand, numbly recognizing her loud panting and sweltering heat. Her whines have decreased in intensity, but you can feel the twinges of pleasure as you stroke her. The knot at her base is still swollen at least twice its normal size, and your job isn’t over.");

	output("\n\nYou nuzzle the exhausted korgonne’s balls, rubbing your face in the exquisitely soft fur of her most sensitive parts. The action serves the double purpose of clearing your eyes and filling the turgid pole between your fingers with renewed vigor. Minty musk is thick at the base as well, and you can’t help but leave a kiss where sheath meets meat. The kiss becomes a thorough tongue-bath, with extra attention to the knot bringing a steady stream of jizz dribbling down her sapphire schlong.");

	output("\n\nYour ascent is slow work, made slower by the driving need to show attention to her every inch. As you near the top ");
	if(pc.biggestTitSize() >= 8) output("you squish your [pc.breasts] together, rubbing the saliva soaked length as you continue.");
	else output("you lament the size of your [pc.chest], but still give her saliva soaked length the best rub-down you can manage.");
	output(" It should be easy to catch the slow flowing ");
	if(silly) output("korg kum");
	else output("cum");
	output(", but in your addled euphoria you wind up wearing as much as you swallow. Some of the cock-juice drips back onto Maja, wicking into her fur till it leaves her soaked.");

	output("\n\nYou nibble briefly on the soft point of her tip, bobbing your head at her top while you gather cum. You pause your knot massage briefly, pulling back with a mouthful of heady cream. The taste enthralls your taste-buds, and you take a moment to savor it before continuing. Maja grunts weekly as you pull her into a kiss, swallowing the cocktail of your saliva and her cum without resistance. If anything she kisses you back with more strength than she’s shown so far. Your tongues mash together in a timeless dance, and she licks your face to clean up the excess jizz that wasn’t wiped away earlier.");

	output("\n\nAll the while you can feel her turgid shaft throbbing against your [pc.skinFurScales], the knot swelling slowly beneath your [pc.belly]. With some difficulty, you wrench yourself away from her sloppy kisses. Your face, while now cleaned of the korgonne shopkeeper’s cum, drips with her saliva. Her cock needs you, beckoning you from between her pillowy breasts with gentle throbs. Maja’s thighs spread farther, almost unconsciously, inviting you to take her sapphire schlong as deeply as you can.");

	//pc can deepthroat or has a [wsan deepthroat item] in inventory
	if(pc.canDeepthroat())
	{
		output("\n\nThe thought of declining such an invitation doesn’t even register, and your [pc.lips] are swiftly sealed around her cock once again. This time you don’t dawdle at her tip like a curious virgin, instead taking her azure love lance straight to the back of your throat. The impact gives you pause, and you look down the rest of her length. Still so much to go.");
		//if needs item: So much you won’t be able to take...
		//output("\n\nBut wait! You pull back a moment, scrambling for your [pc.gear] and pulling out the container of (wsan deepthroat item). You can barely keep your hands from shaking as you drink down the whole thing. Waiting to feel any kind of change is hell, so you all but dive back onto maja’s cock. The results are immediately evident, letting her length begin to push easily into you. Sucking down every inch of her seems more like a well deserved reward than a daunting task.
		output(" <B>So much more you can fit inside.</b>");

		output("\n\nYou press on, taking a deep breath as you let the molten meat sink deeper into your mouth. Your jaw strains as the korgonne doggy-cock thickens and throbs, but the feeling passes as you quickly adjust to the length. It might be tougher if you had gone faster from the start, but that would stop you from relishing the taste of her every inch. With every inch, a sublime fullness grows within you. If only you had something to fill your other hole");
		if(pc.hasVagina()) output("s");
		output(".");

		if(pc.hasTailCock())
		{
			output("\n\nBut wait, you do have something! Almost without thinking about it, your [pc.tailCock] flies into action, thrusting into your [pc.vagOrAss] with reckless abandon. The action elicits a moan that comes out in a choked grunt. Maja shares in the moan, shifting and pumping her hips. Another inch slides into your mouth, bringing you ever closer to her crotch.");
		}
		else if(pc.hasTailCunt() && pc.hasCock()) output("\n\nBut wait, there is something you can do! Almost without thinking, your [pc.tailVagina] springs onto [pc.cockBiggest], and your hips begin to buck with reckless abandon. The action elicits a moan that comes out in a choked grunt. Maja shares in the moan, shifting and pumping her hips. Another inch slides into your mouth, bringing you ever closer to her crotch.");
		else 
		{
			output("\n\nBut alas, you have nothing. One hand reaches down to your crotch, ");
			if(pc.hasCock()) 
			{
				output("grasping ahold of your [pc.cockBiggest] and jerking it with reckless abandon");
			}
			else 
			{
				output("thrusting into your " + (pc.hasVagina() ? "[pc.vaginas]" : "[pc.asshole]") + " with as many fingers as you can manage");
			}
			output(". The feeling just isn’t the same, but it assauges the need a little. Your actions still elicit a choked moan, and Maja shares it, shifting and pumping her hips. Another inch slides into your mouth, bringing you ever closer to her crotch.");
		}
		output("\n\nBefore you know it, your lips and nose bump into her knot. The motion sends a wave of wet heat directly into your stomach. This time you have no intention of half-assing the attempt, and compress her knot between your palms. Every irrelevant muscle in Maja’s body slackens as her release pours from her in spurting torrents. A sigh of utter relief is all she can manage, panting on the desk with her eyes rolling back into her head. It would seem she’s finally spent.");

		output("\n\nThe size of her knot seems to confirm this, returned to no more than a palm sized bump on her length. You begin your careful extraction from her rod, coaxing a few final squirts from her spent sex and pulling away from it with an audible pop. The feeling of warm fullness remains even after you gather your breath. You give the exhausted dog-girl a few more playful tugs, but her dick quickly retreats into its sheath, leaving only an inch of pointed tip to the open air. To your delight, a pool of minty juices saturates the desk beneath her hefty balls.");

		output("\n\nWith all of your oxygen deprived thoughts directed at the feeling of her orgasm, it would appear you entirely missed your own.");
		if(pc.hasGenitals())
		{
			var cumQ:Number = pc.cumQ();
			output(" A ");
			if((pc.hasCock() && cumQ < 15) || pc.wettestVaginalWetness() < 3) output("few drops");
			else if((pc.hasCock() && cumQ < 1000) || pc.wettestVaginalWetness() < 5) output("puddle");
			else output("lake");
			output(" of sexual fluid spreads out around your ");
			if(pc.isNaga()) output("coils");
			else output("[pc.feet]");
			output(". It’s not enough to stain the stone structure of the cavern, but Maja ");
			if((pc.hasCock() && cumQ < 15) || pc.wettestVaginalWetness() < 3) output("might not even notice");
			else if((pc.hasCock() && cumQ < 1000) || pc.wettestVaginalWetness() < 5) output("won’t have that much trouble compared to the cleaning she already does");
			else output("might need some help cleaning");
			output(".");
		}
		output(" You rise, washing your face in a basin of water along the wall by the door, and gather your things.");

		processTime(30);
		pc.loadInMouth(ppMaja);
		pc.loadInMouth(ppMaja);
		pc.loadInMouth(ppMaja);
		if(pc.hasCock() && pc.hasTailCunt()) feedCuntSnake(ppMaja);
		pc.orgasm();
	}
	//pc cant deepthroat
	else
	{
		output("\n\nThe thought of declining such an invitation doesn’t even register, and your [pc.lips] are swiftly sealed around her cock once again. This time you don’t dawdle at her tip like a curious virgin, instead taking her azure love lance straight to the back of your throat. The impact gives you pause, and you look down the rest of her length. Still so much to go. So much you won’t be able to take...");
		output("\n\nNot that something like that is going to get you down. If you can’t deepthroat the whole thing you’ll just have to make do with what you have. You wrap your arms and [pc.chest]");
		if(pc.biggestTitSize() <= 0) output(", for what it’s worth,");
		output(" around Maja’s stiffening rod, giving her a makeshift hugjob in addition to the blowjob. The cock-stricken korgonne groans in answer to your actions, but her throbbing knot makes her approval instantly apparent.");

		output("\n\nIn this position you hit her knot with every downward motion, and struggle to keep up with the spurting torrents of canid seed. The sheer amount forces you to split your thoughts between two things. Continue to move, and keep swallowing. The liquid lust pouring down your throat is almost an acceptable replacement for raw dickmeat, filling you with a sense of warm fullness. Your vision blurs as you focus, the world melting into deep blue and golden brown.");
		output("\n\nYou’re jolted back into reality when the tip of Maja’s azure lance audibly pops from your mouth. Your arms squeeze tighter in momentary panic, fearing that some nebulous other has come to take away ");
		if(silly) output("your two foot jizz dispenser");
		else output("the source of your warmth");
		output(". Instead, you find her knot shrunken to a more normal size, and her cock slipping steadily back into her sheath. You give it a few goodbye tugs, letting the last few jets of cum splatter onto your [pc.chest]. To your delight, a pool of minty juices spread over the table from underneath the exhausted korgonne’s hefty balls. After pushing yourself up, you gather your things and wash your face in a small basin by the door.");
		processTime(30);
		pc.loadInMouth(ppMaja);
		pc.loadInMouth(ppMaja);
		pc.loadInMouth(ppMaja);
		
	}
	//merge
	output("\n\nMaja is totally wiped out, only managing to bark softly in her half-sleep as you rub behind her ears. One of her arms flops unconsciously, grasping for some object of her dreamed desires. You leave her to her sleep, heading back out to the hold proper and flipping a small sign hanging on the door to what you assume is a closed symbol.");
	//close shop for 1 hr!
	pc.createStatusEffect("MAJA_FUCK_RECOVERY");
	pc.setStatusMinutes("MAJA_FUCK_RECOVERY",60);
	//(pass 30m)(shop closed for 1 hour, trying to enter gives “looks like Maja hasn’t recovered yet”)(small chance(10%?) to put pc in heat)
	//heat chance?
	if(pc.hasVagina() && !pc.isFullyWombPregnant() && pc.fertility() > 0 && !pc.inHeat() && rand(5) == 0)
	{
		// Heat effects
		// v1 - fertility boon
		// v2 - minimum lust boost
		// v3 - libido boost
		// v4 - tease bonus!
		pc.createStatusEffect("Heat", 5, 25, 10, 3, false, "LustUp", "Your body is begging for impregnation, increasing your libido and fertility but also your ability to tease.\n\n+500% Fertility\n+25 Minimum Lust\n+10 Libido\n+3 Tease Damage", false, 28800, 0xB793C4);
		AddLogEvent(ParseText("The lingering, all-consuming scent of Maja’s cock on your lips leaves you with a nagging sense that you really <i>should have had her knock you up.</i> Twinges in your [pc.vaginas] confirm that <b>your body has slipped into heat!</b> You’ll need to get knocked up <i>as soon as possible</i> or you won’t be able to think around <i>big, mouth-wateringly musky dicks</i> like Maja’s. You feel a little wet just thinking about it!"));
		pc.lust(5);
	}
	IncrementFlag("SEXED_MAJA");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Heat fuck
public function heatFuckMaja():void
{
	clearOutput();
	showMaja(true);
	author("Gardeford");
	
	var ppMaja:PregnancyPlaceholder = majaPlaceholder();
	
	output("You spin around as quickly as you can, all but falling ");
	if(pc.isNaga()) output("into a jumble of coils");
	else if(pc.isGoo()) output("into a puddle of goo");
	else output("to your knees");
	output(". You jut your posterior needfully toward Maja, pulling your [pc.butts] to the side to make more room. The korgonne caretaker hastens to undo her clothing, leaving the heavy skirt and confining leather top forgotten in a pile on the cave floor. She staggers toward your fertile offering, focused laser-straight on your sex. If you weren’t as eager or more so than her, the hungry stare on her face might have made you fear for the safety of your pelvis.");
	output("\n\nHer prick meets you before the rest of her, ");
	if(pc.ass.looseness() == 5) 
	{
		output("pushing between your [pc.butts]. Its trajectory would have taken it’s tip to rest above your ");
		if(pc.isTaur()) output("haunches");
		else output("lower back");
		output(", but you feel her pointed tip slip into your [pc.asshole]. Before her rut rattled mind can register whats going on, a foot and a half of korgmeat slams into your [pc.butt]. The only thing stopping it is quick muscle action on your part and the greater size of her knot. Like hell will any of her thick, minty pup-seed end up anywhere except your womb. She seems to notice her error, but still gives a few instinctual thrusts before she can will herself to pull out and line up with the right hole.");
		pc.buttChange(ppMaja.cockVolume(0));
	}
	else
	{
		output("sliding up through your [pc.butts]. God she’s long. Once she gets a grip on you she pauses, seeming to realize that she’s not inside you yet. She gives a few instinctual hipthrusts before she manages to pull back enough to do any lining up. With each thrust your heart flutters, only to be let down in an instant.");
	}
	output("\n\nYou expect to be tortured with some agonizing foreplay, rubbing her tip on your clit or some other nonsense, and squirm at the thought. Luckily the huge-peckered puppy-girl has no such intentions. Pillowy boobs plop onto your ");
	if(pc.isTaur()) output("haunches");
	else output("back");
	var x:int = pc.smallestVaginaIndex();
	output(" as her azure staff plunges into your soaking wet [pc.pussyNoun " + x + "]. ");
	if(pc.vaginas[x].looseness() <= 2) 
	{
		output("Her pointed tip renders her able to penetrate even your ");
		if(pc.vaginas[x].looseness() <= 1) output("immense");
		else output("great");
		output(" tightness. Some part of your brain, shouted into submission by the primal desire, thinks that something of this size should hurt. Instead, you feel nothing but lances of pure bliss as the first few inches of her length piston into you.");
	}
	else if(pc.vaginas[x].looseness() <= 4) output("Her pointed tip easily penetrates your entrance, spreading your insides and molding them to her shape. Furry balls slap against your thighs as she pistons her hips, splashing wetly in the juices that flow from your [pc.pussy " + x + "]. Lances of pleasure spread through your body, alternating between filling every inch of you and leaving you empty.");
	else output("The entirety of her slides into you, a key to unlock the door to your fertile womb. Buffeting waves of bliss flood through your mind as her knot pushes in and out of your [pc.pussy " + x + "]. You can hear her grunting with the effort of thrusting as you clench tight to keep her inside.");
	pc.cuntChange(x,ppMaja.cockVolume(0));

	output("\n\nYou want to shout something, proclaim your dominance or submission, but it all jumbles in your throat, coming out in guttural moans. Maja answers with moans of her own, kneading your back with her paws. Her nipples rub against your [pc.skinFurScales] as she moves, gemstone nubs thicker than your thumb. Beneath the golden fur she’s feverishly warm, but in the blaze of your heat it feels like an icy reprieve.");

	output("\n\nStrings of mini-orgasms wipe thoughts from your head with every impact of her mammoth meatstick, allowing only the shortest concepts to take form. Love, good, cum, swirl in your mind but two prevail over all the others - a pair of thoughts so intense you can feel them echoing in every nerve: Seed. Breed! Your eyes cross as they assert themselves over your reason, backed by a minty musk that hangs in a dense cloud around you.");

	output("\n\nMaja doesn’t seem any more in control of her baser urges than you are. She slumps against you, panting and thrusting wildly with no conscious coordination. All that prevents her from slipping out of you is her own sheer length. The sight of your heat must have kicked off some breeding instinct in the poor animal tamer, reducing her to nothing more than a slave led by her thick, yummy breeding stick. You can feel it throbbing inside you, building up to the release that will finally satiate your need.");

	output("\n\n<i>“F-fuck,”</i> the word slips from your mouth in a grunt, hardly heard over the wet slapping and raucous moans. You can feel Maja’s orgasm building up, sure that she feels the same. Her thrusts are growing deeper, the tip of her azure lance lingering at your womb for seconds on end, ready to dump her load and fill you with korgonne pups. When it’s too late to turn back, she stops thrusting, lying on top of you and holding her breath as she pulls herself as far as she can into your [pc.pussy " + x + "].");

	//tightness 1-2
	if(pc.vaginas[x].looseness() <= 2) 
	{
		output("\n\nWarmth floods your body as she cums, grinding her knot against your hips to draw the seed through. With the muscular seal left exposed, so much of her bountiful lust spurts right back out of your tight cunt. You struggle to prevent as much waste as you can, your body wracked with orgasmic surges as each jet of cum floods your womb. The molten ardor is flushed out by the strength of your contractions, but she seems to have an endless supply to keep it full. Maja licks ");
		if(pc.isTaur() || pc.tallness >= 5*12) output("your back");
		else output("the nape of your neck");
		output(" in a sloppy kiss.");
	}
	//tightness 2-5
	else if(pc.vaginalCapacity(x) < ppMaja.cockVolume(0))
	{
		output("\n\nWarmth floods into you as she cums, seed coming in quick spurts as her knot slaps into your [pc.butt] and grinds against your hips. With her knot still outside, most of the liquid lust is pushed back. It runs down your [pc.hips] in creamy rivulets, pooling beneath you. The waste is agonizing, but Maja seems to have an endless supply to keep your womb full of puppy-cum. She licks ");
		if(pc.isTaur() || pc.tallness >= 5*12) output("your back");
		else output("the nape of your neck");
		output(" in a sloppy kiss, pumping her hips all the while.");
	}
	//tightness 4-5 and high stretchiness
	else
	{
		output("\n\nThe motion slides her knot fully into your [pc.vagina " + x + "]. Her head pushes so far inside that you can see it pressing against your stomach. You rub the bulge with your hands, still a little awestruck, lowering your guard just long enough to feel the full flood of warmth as her seed gushes into your womb. Her knot pulses as your cunt-seal milks the cum out, each throbbing vibration only increasing the strength of your orgasmic contractions. With her knot inside you, the copious spurts have no place to go, and your belly swells slightly from the influx of jizz. Maja licks ");
		if(pc.isTaur() || pc.tallness >= 5*12) output("your back, her legs hanging in the air as she pumps in place.");
		else output("the back of your neck, clutching tightly to your waist.");
		output(" It doesn’t seem like she’s going anywhere.");
		pc.cuntChange(x,ppMaja.cockVolume(0));
	}
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Much good... Maja was good girl?");
	else output("Wow... that was... Wow! Was I good?");
	output("”</i> Maja croaks, her voice ragged from moaning. She doesn’t seem fully recovered, but you don’t feel much better. Well, that’s not totally true. You feel fucking amazing, but the cloud of minty musk seems to be clearing from your head. Every thought you have is no longer focused on the <b>hot, impregnating seed swimming in your womb</b>. The musk might not be clearing as fast as you thought.");
	output("\n\n<i>“Yeah, good girl,”</i> you respond, reaching back to scratch the exhausted dog-girl behind the ears. Content for the moment, you let Maja rest atop your back while you get a little yourself. A few micro-orgasms jolt you from your relaxation as her sapphire fuckstick retracts into its sheath, inching out of your [pc.vagina " + x + "] with aching slowness.");

	output("\n\nThe two of you wake at about the same time, separating from each other with a sticky squelch. You stretch, feeling stiff from sleeping on the cave floor. A bath would be nice right about now, or a hot shower. Maja plops down behind her desk, pulling on her clothes and looking utterly fulfilled. You smile, retrieving your [pc.gear] and shaking any last kinks from your muscles.");
	if(!pc.isPregnant() && pc.vaginalCapacity(x) > ppMaja.cockVolume(0)) output(" You rub your belly, musing at your semi-pregnant appearance.");

	//(pass 45m)(if pc stretchy then stuffed)(return to maja menu)
	processTime(45);
	pc.orgasm();
	pc.lust(5);
	if(pc.vaginalCapacity(x) < ppMaja.cockVolume(0))
	{
		ppMaja.removePerk("Fixed CumQ");
		ppMaja.createPerk("Fixed CumQ",400,0,0,0);
	}
	pc.loadInCunt(ppMaja,x);
	IncrementFlag("SEXED_MAJA");
	clearMenu();
	addButton(0,"Next",repeatMajaApproach,true);
}

//Frotjob
public function majaFrotjob(x:int):void
{
	clearOutput();
	showMaja(true);
	author("Gardeford");
	output("<i>“");
	if(pc.isNice()) output("Would you l");
	else output("L");
	output("ie back on the table for me");
	if(pc.isNice()) output("?");
	else output(".");
	output(" I want to try something with those magnificent melons of yours,”</i> you ");
	if(pc.isNice()) output("ask");
	else output("say");
	output(". Maja scoots herself up onto the desk, swinging her legs over to hang off in front of you. She undoes the straps of her skirt, leaving the heavy leather under her butt to provide some cushion on the wooden table. The inside is lined with fur even softer to the touch than her own, and feels pleasantly springy despite the tool-packed pockets on its exterior.");

	output("\n\n<i>“Sure! ");
	if(silly) output("What are we gonna do on the table, Steele-chan?");
	else if(!korgiTranslate()) output("What want do, [pc.name]?");
	else output("What did you have in mind, [pc.name]?");
	output("”</i> the gold-furred korgonne asks, undoing the strips that hold together her top. Her breasts, suddenly freed from confinement, fall to the sides ");
	if(silly) output("with an audible Pomf");
	else output("with a noticeable jiggle");
	output(". You rub your chin to think it over. ");
	if(flags["MAJA_FROTJOBBY"] == undefined) output("You’re almost certain her tits are big enough to sandwich both her dick and your own, but there’s no guarantee without trying it.");
	else output("You know her tits are big enough for your plans, but leaving her in suspense is too good to pass up.");
	output(" First though, you’ll need her warmed up a little.");

	output("\n\nYou cup her balls in both hands, gently fondling the volleyball sized orbs. These puppies are bigger than the average human’s breast, and fluffier than the rest of her. Maja gasps as you continue, lifting her sensitive parts up to tease her feminine lips. She’s slick with wetness already, and your fingers only expedite her lust. Inch by inch, her sapphire sword slides from its sheath, filling the air with the heavy scent of mint. Her knot pushes itself out last, still relatively small at this point, but throbbing with anticipation as the whole of her length plops down between her breasts.");

	output("\n\n<i>“The way I see it, you’ve got enough cushion here for us both,”</i> you explain, trying to get a hold on her massive mammaries. The task is harder than you thought it would be. You’d planned for another quip, but your hands sink into her pillowy titflesh, unable to keep a grip on her soft fur. You marvel at modern technology for a moment. They feel like she’s had them this big her whole life, and if they were any softer you’d worry about your dick getting a good night’s sleep instead of a good time.");
	output("\n\nFinally, you resort to pinching her thick nipples between your thumb and forefinger. The beryl buds provide an excellent hold, and the action elicits a surprised yip from their owner. You scoot up closer, letting one teat go long enough to ");
	if(!pc.isCrotchExposed()) output("pull down your [pc.crotchCover]");
	else output("remove your gearbelt");
	output(". [pc.EachCock] plops down onto her slick doggy-cock, already half hard and still stiffening. You reposition your hands, pulling her breasts together with your forearms so that both of your cocks are wrapped snugly in doughy boob.");

	output("\n\n<i>“See? I knew they’d fit,”</i> you say, rocking your hips forward. Maja moans as your length grinds against her own, thrusting into the enveloping velvet of her boobjob. At this point you can see pre leaking in a slow fountain from her tip, coming in small gouts with every forward push. The slick liquid quickly wicks to her fur, and you make sure to catch some of it between her titanic endowments.");

	output("\n\nThe warm wetness leaves her whole chest smelling of mint, a musky mix you’re sure will soak into your crotch. With your combined pre-cum to provide lube, the fluffy softness of her fur transforms into a slippery chest cunt. A chorus of wet slaps greet your ears as your hips piston into her, her chest jiggling furiously with every impact.");
	var cumQ:Number = pc.cumQ();
	if(pc.cocks[x].cLength() >= 24) 
	{
		output(" Your [pc.cockHead " + x + "] peeks out of her cleavage as you hump, ");
		if(silly) output("booping");
		else output("bumping");
		output(" the korgonne tamer on the chin. She looks down, attempting to look at what’s happening. You use the opportunity to pull a little closer, guiding Maja’s head so your [pc.cock " + x + "] slides easily into her open mouth.");
		
		output("\n\n<i>“Mmm,”</i> she moans as her hot tongue caresses your [pc.cockHead " + x + "]. Once she’s had a taste, she doesn’t want to let you go. You pull free with a loud smack and a distressed whine from the dick-hungry dog-girl. She frantically licks at your cock with each pump of your hips, stopping only to swallow when she gathers a mouthful of your pre. You feel her turquoise ");
		if(silly) output("torpedo");
		else output("tool");
		output(" throb as she drinks, ready to explode at any moment.");

		output("\n\n<i>“No reason to keep you waiting,”</i> you grunt, increasing your speed and grinding hard against her length. Her eyes go wide and she chokes on a moan as your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("[pc.butt]");
		output(" slam");
		if(pc.balls < 2) output("s");
		output(" into her knot. You’ve felt it swelling larger and larger since you started, and now it reaches critical mass. Gouts of hot seed splash over her neck and onto her face, but you don’t have time to stop. You can feel your own orgasm approaching fast.");

		output("\n\n<i>“Oh gods,”</i> you cry, your thrusts slowing for a moment as lances of pleasure streak through your muscles. While you’re frozen at the end of a thrust, Maja steals the opportunity to suction cup herself right back onto your [pc.cockNoun " + x + "]. Her tight lips are enough to coax out your release, and you join her in unfocused bliss.");

		if(cumQ < 75) output("\n\nShe vacuums every drop of cum from your [pc.cockNoun " + x + "] the second it spurts from your tip. You try to will even a little more cum out of your spent [pc.balls], but all that comes are a few dry throbs. Luckily the insensate dog-girl doesn’t seem to care, her own gouts of mint cream occupying her as she sucks mindlessly on your [pc.cockHead " + x + "].");
		else if(cumQ < 400) output("\n\nShe slurps hungrily at your [pc.cum] as it jets from your [pc.cockNoun " + x + "]. A few jets fill up her mouth, and she savors your taste with a few slow swallows. All the while her own cream cannon pelts her under the chin with gout after gout of liquid lust. She seems too engrossed in sucking yours to notice, and takes the shots in her stride.");
		else if(cumQ < 1000) output("\n\nShe gulps down your cum as it spurts, inhaling your ivory elixir as she bobs her head on your [pc.cockHead " + x + "]. Your output doesn’t quite match hers, but the difference is hardly noticeable. She alternates flawlessly between swallowing your cream and getting blasted under the chin by her own.");
		//Megacumultra deluxe:
		else output("\n\nShe makes an attempt to contain your seed, cheeks bloating as she swallows the first few pulses. Your flood of cum overwhelms her after that, forcing her to cease her ministrations. Ropes of thick cream mix with her own, basting her face with a mint and [pc.cumNoun] batter. The insensate dog-slut doesnt seem to care, licking away at her fur and the pair of cocks before her.");
	}
	else
	{
		output("\n\nYou nibble on Maja’s turquoise teats as you hump away, delighting in the pleasured whines that pour out of your partner. She tosses and turns as she edges closer to orgasm, and her snout bumps against the throbbing tip of her equine sized erection. The sight of it gives you an idea.");
		output("\n\nYou grasp the korgonne animal tamer by the hair, pulling her right down onto her own cock. Her passionate throes abate, replaced by a single minded drive to suck. Her azure lance throbs twofold at her own ministrations, growing even hotter to the touch. She seems utterly lost to your pounding hips, coming to her senses long enough to plead for you to slow down when your thrusting dislodges her suckling.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("No! No take, only suck! More suck, please?");
		else output("Please! I want to drink more!");
		output("”</i> she whines, trying to grasp at you but unable to reach around her titanic tits.");

		output("\n\n<i>“More, you say? If you’re sure you can handle it there’s no reason to keep you waiting,”</i> you reply, pulling her back onto her cock and grinding harder against her length. She chokes out a moan and her eyes widen as your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("[pc.butt]");
		output(" slap");
		if(pc.balls < 2) output("s");
		output(" her knot. Her knot swells to even greater size, pushing you up a little as Maja’s entire body tenses in orgasm. You can feel your own approaching fast, eager to join in on the cock crazy korgonne’s frenzied bliss.");

		output("\n\nAt first she tries to drink her own cum as your kneading momentum frees it from her knot, but the flow rapidly becomes too great. Minty jizz pours from her cheeks, overflowing and pooling behind her head. She throws her head back, howling with pleasure as gouts of pearly cream buffet her chin.");

		output("\n\n<i>“Bad dog! You wanted more, so drink it all up,”</i> you shout, pushing the insensate animal tamer’s face into the pool of her own cum. She licks as best she can, trying to clean up her mess even as she continues to add to it. The sight of her hysteric attempts to follow your orders brings you over the edge, and you stop thrusting as you hug Maja’s bountiful bust as tightly as you can.");

		if(cumQ < 25) output("\n\nYou aren’t about to be impregnating any chest-cunts, but you try your best. Your [pc.cum] quickly wicks into her fur, joining the creamy coating of her minty pre-cum. [pc.EachCock] throbs a few more times, shooting dry into the warm depths of her cleavage.");
		else if(cumQ < 400) output("\n\nYou fill her slick cleavage with more than just mint-scented pre-cum. [pc.EachCock] throbs as spurts of [pc.cum] coat her fur, too thick to wick away into her fur.");
		else if(cumQ < 1000) output("\n\n[pc.EachCock] fills her chest-cunt to the brim, painting the inside of her cleavage [pc.cumColor]. Some of your [pc.cum] leaks from the top of her chest, flowing down to join her pool.");
		else output("\n\nYou fill her chest-cunt with more seed than even her O-cups can handle, matching her torrent ounce for ounce. [pc.EachCock] pulses as [pc.cum] pours out of her cleavage, joining the pool below her head. It’s all you can do to retain your composure as the torrent comes to a close.");
	}
	output("\n\nMaja’s mountains fall to the side as your muscles slacken, unable to hold them up anymore. Steamy cum drips down their sides as she pants, still licking at the puddle beneath her. You stretch as you extract yourself from the sticky mess, delighted to see a similar puddle of juices pooled around her butt. A few errant spurts still pulse from her cock, but her knot has returned to a more reasonable size, and the massive member has begun sliding back into her sheath.");
	output("\n\n<i>“Good girl. Make sure you clean up your mess and then you can have a nice nap. You earned it,”</i> you coo, patting the oversexed dog-girl on one bountiful breast. Her tail wags vigorously at your praise, and her licks fill with renewed purpose. You duck in and give her a kiss on the cheek before gathering your gear and heading back into the hold. You flip the open sign on your way out the door. Maja’s going to need a little rest.");
	//(pass 30 min)(maja out for 1.5 hr)(place pc just outside maja door)
	processTime(30);
	pc.orgasm();
	//disable for 1.5 hrs!
	pc.createStatusEffect("MAJA_FUCK_RECOVERY");
	pc.setStatusMinutes("MAJA_FUCK_RECOVERY",90);
	IncrementFlag("SEXED_MAJA");
	clearMenu();
	addButton(0,"Next",move,"KORGII T41");
}

//Pitch dickin’
//Supports hardlights!
public function pitchDickingToMaja(x:int):void
{
	clearOutput();
	showMaja(true);
	author("Gardeford");
	
	var ppMaja:PregnancyPlaceholder = majaPlaceholder();
	
	output("<i>“How about you hop up on the table and show me that cute butt of yours? I imagine your pussy’s feeling neglected after those huge balls moved in,”</i> you ask");
	if(!pc.isCrotchExposed()) output(", already beginning to remove your [pc.crotchCover]");
	output(". Maja gives you a brief smile, but her swiftly wagging tail betrays how excited she is. It almost knocks over a bowl of animal treats on one corner of the desk, but the dextrous korgonne manages to catch it in her cleavage before it can fall. Her massive mammaries jiggle enticingly as she replaces the bowl.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("Yes! Maja not reach good anymore. Too much in the way. Using dick not too bad, but pussy fun too,”</i> She states,");
	else output("You have no idea! I guess it’s not all that bad needing to masturbate with the dick, but I still miss being able to reach my pussy without using a brush. N-not that I’ve used the scrubbing brushes to masturbate or anything. J-just get started already,”</i> she fumbles,");
	output(" undoing the hook on her leather skirt. She plucks some bulkier objects from the pockets before draping the entire thing over the midsection of the desk. The skirts inside face is coated with soft fur, providing a perfect cushion for the stocky dog-girl as she pulls herself up. Her kneeling position gives you a perfect view of her golden furred backside.");

	output("\n\nSure enough, her azure lips glisten between her bouncy buttocks. Slick juices already coat her fur, and the scent of minty musk tickles your senses. You can see her cunt twitching needfully already, begging to be plugged. From the look of it, she won’t need any foreplay to get ready, but where’s the fun in that. Before you do anything with her pussy, you reach out to gently fondle her volleyball-sized testes.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("Nooo! [pc.name] said pussy, no dick,");
	else output("Hey! You said you were gonna help me with my pussy, you don’t need to- ungh - touch there,");
	output("”</i> she complains. You ignore her for the moment, letting your fingers brush over the silk-soft spheres between her most intimate parts. Her complaint dissolves into a slightly grumpled harumph, the sincerity of which is challenged by the furious wagging of her tail. Her balls are nice and firm beneath the fur, resting easily on her thighs.");

	output("\n\n<i>“");
	if(pc.isBimbo()) output("I knowww, but like, your balls are just so... There! And like, what kind of person would I be if I filled up your delicious pussy and just left your big strong dick to fend for itself?”</i> you ask,");
	else output("I know you’re all ready to go, but I’ve gotta make sure your two-hander doesn’t hit the table. Besides, you’ve got the perfect sheath right here,”</i> you explain,");
	output(" caressing the length of her azure lance as it grows to its full length. You guide the pointed tip right into the bottom of her cleavage, grinning as her hips buck at the sudden penetration. To your delight, even more juices flow from her pussy, and the scent of fruity mint fills the air around you.");

	output("\n\nWith her cock taken care of, you return to kneading her golden furred buttocks. There isn’t much time before the heavy cloud of musk turns you into a fuck-hungry cuntslave, and you intend to spend every second of it teasing the poor animal tamer. Her cerulean gemstone of a clit pokes out just above her balls, big enough for you to lean in and pinch it gently between your teeth. Juice covers your face, steaming hot in the temperate cave. You hold your breath as you rub your nose in her sopping cunny, knowing that your next breath will bring the sweet obliteration of your restraint. You roll her clit on your [pc.tongue] till you run out of air, finally inhaling her scent in a frantic gasp.");

	output("\n\nThe minty aroma isn’t quite as debilitating as you thought it would be. It does a good job of overwhelming your senses, but you seem to still be in control of your faculties. You stick out your [pc.tongue], ready to resume tongue-fucking her turquoise cock-cave, only to meet empty air. Lazily, you drop your gaze to her crotch, and find your [pc.cockOrStrapon " + x + "] already lined up. The " + (x >= 0 ? "[pc.cockHead " + x + "]" : "head") + " teases at her lips, ready to fill her up. When did that happen?");

	output("\n\nNo use worrying about it now. Your hands are still kneading delicious doggy-butt, the perfect handholds to pull yourself into her molten slit. She rocks forward as you thrust, the tip of her cock slipping through her breasts till the tip inches out the top. Once you get her started, instinct takes over. It doesn’t matter that there’s no cunt for her to fuck, her hips pump all the same, wetting her chest with pre as she bucks.");
	pc.cockChange();

	output("\n\nYou, on the other hand, have the real thing. Steamy korgonne cunt clenches down on your length as you pull back, gladly pulling you deeper on the return trip. Maja looks back over her shoulder, trying to focus on you but unable to do anything but groan and tremble with pleasure, her tongue lolling out of her mouth. Not slowing for a second, you cup her head in one hand and lean in for a kiss. The fuck-drunk dog-girl returns your affections with sloppy enthusiasm, leaving your chin dripping with her saliva.");

	output("\n\n<i>“Guh-gonna cumming,”</i> she manages when you finish, clenching the fluffy skirt beneath her with both hands. Shuddering tremors run through her entire body, and your [pc.cockOrStrapon " + x + "] practically splashes against her ass as her wetness reaches a peak. You can feel the thick bump of her prostate as you thrust, and that gives you an idea. You let her finish her first orgasm, muscles clenching and moans catching in her throat, before immediately rushing into a second assault.");

	//pc has another dick smaller than the first that fits
	var y:int = -1;
	if(pc.cockTotal() > 1) y = pc.cockThatFits2(ppMaja.vaginalCapacity(0));
	if(pc.cockTotal() > 1 && y >= 0 && y != x)
	{
		output("\n\nYou pull her asscheeks aside, revealing the bright blue pucker of Maja’s asshole. Her tail begins to frantically shake as you line your second member up to her tight ring. The heat of it is astounding, even with only your tip touching her ass. You meet some resistance as you start to push forward, but once you clear the entrance you’re able to press easily into her depths.");
	}
	//pc has a one dick that fits and a tailcock
	else if(x >= 0 && pc.hasTailCock())
	{
		output("\n\nYou pull her asscheeks open, revealing the bright blue pucker of Maja’s asshole. Her tail begins to frantically shake as you line your own up to poke at her tight ring. Sensation floods into your body through [pc.oneTailCock], particularily the astounding heat of her entrance against its tip. There’s a little resistance, but the strong muscles in your " + (pc.tailCount == 1 ? "tail pushes" : "tails push") + " easily into her depths once you ");
		if(silly) output("breach the gates.");
		else output("press inside.");
	}
	//only one dick:
	else output("\n\nYou pull her asscheeks open, revealing the bright blue pucker of Maja’s asshole. Her tail frantically wags as you tease around the entrance with two fingers. The heat of her is astounding, burning feverishly on your [pc.skinFurScales]. Theres hardly any resistance as you slip your digits into her ass, rubbing her walls as you search for pleasure points.");
	//merge
	output("\n\nMaja half chokes on a moan that squeezes its way through her clenched teeth, squirting fem-cum that splatters your thighs as her prostate is sandwiched between");
	var totalCocks:int = 0;
	if(x >= 0)
	{
		totalCocks += pc.cockTotal();
		if(pc.hasTailCock()) totalCocks += pc.tailCount;
	}
	if(totalCocks >= 2) output(" " + (totalCocks == 2 ? "both" : "two") + " of your cocks");
	else output(" your [pc.cockOrStrapon " + x + "] and fingers");
	output(". You can hear her cock spattering the underside of her breasts and the tightly bound passage of her cleavage, and see ropes of pearly cream fire off almost into the cave wall behind the desk when her cockhead clears the top.");

	var cumQ:Number = pc.cumQ();
	//2dick or tail
	if(y >= 0 || (x >= 0 && pc.hasTailCock()))
	{
		output("\n\nThe musky scent of her cum brings you over the edge. You hilt inside both the cum-drained korgonne’s holes, pushing her down onto her jizz-soaked skirt as you cum. ");
		if(cumQ < 25) output("You drain everything you have into Maja’s pussy and ass, filling them to the best of your ability. The strength of her orgasmic contractions rings more out of you than you would’ve thought possible.");
		else if(cumQ < 400) output("You fill Maja’s pussy and ass with [pc.cum], enough that the strength of her orgasmic contractions pushes a little of it back out. It’s hard to keep from wasting such good seed, but you do your best to keep her plugged.");
		else if(cumQ < 1000) output("You flood Maja’s ass and pussy both with your [pc.cum], enough to leak back out and drip down her thighs while still leaving her full. You keep her plugged up as best you can, but either way she’ll come out of this full of seed.");
		else output("Seed pours into Maja from both ends, flooding her womb and ass before almost immediately pouring back out to join the puddle beneath her. Your [pc.cum] mixes with her own, ");
		if(pc.fluidColorSimple(pc.cumType) != "white") output("blending the pearly white with [pc.cumColor]");
		else output("indistinguishable once it splashes down");
		output(".");
	}
	//fingers
	else
	{
		output("\n\nThe musky scent of her cum brings you over the edge. You hilt inside Maja’s korgonne cunt, kneading her prostate with your first two fingers and pushing her onto her jizz-soaked skirt as you cum. ");
		if(x >= 0)
		{
			if(cumQ < 25) output("You drain everything you’ve got into the still cumming dog-slut, furiously finger fucking her butt when you finish, dragging her orgasm out as long as you can.");
			else if(cumQ < 400) output("You fill the still cumming dog-slut’s womb, relishing in the tightness as she clenches around your [pc.cock " + x + "] and fingers.");
			else if(cumQ < 1000) output("You flood the shuddering dog-slut’s womb, trying to plug her up as best you can while some of your [pc.cum] dribbles down her hips. Her asshole clenches tightly around your fingers in an attempt to push them away from her sensitive spots.");
			else output("You fill the dog-girl tamers womb with enough seed to overflow. It washes over your hips and joins the puddle beneath her, the force of it too strong for you to do anything but join her in muscle clenching euphoria.");
		}
		else output("You tremble against the shuddering dog-slut’s womb, unable truly ejaculate and yet thanks to your turgid piece of technology able to feel the sensation of unleashing a massive, phallus-draining orgasm deep inside her.")
	}
	//merge
	output("\n\nYou collapse atop Maja, giving her some weak scratches behind the ears and a kiss on the cheek. She gives you a groan of encouraging acknowledgement, too exerted to pull herself out of the puddle beneath her. You’re content to sit there, petting and rubbing her while she recovers. The exhausted korgonne stretches after the short rest, and you stand to let her get up.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Maja take bathings, need much clean.");
	else output("I think I’ll go take a bath. I need to clean my skirt anyway.");
	output("”</i> she says, giving you a sheepish smile before she waddles back into the holding area. You gather your equipment, replacing it before heading back into the hold proper.");
	//(pass 1hr)(put back outside tamelings)
	processTime(60);
	pc.orgasm();
	//disable for 30m!
	pc.createStatusEffect("MAJA_FUCK_RECOVERY");
	pc.setStatusMinutes("MAJA_FUCK_RECOVERY",30);
	IncrementFlag("SEXED_MAJA");
	
	clearMenu();
	addButton(0,"Next",move,"KORGII T41");
}

//Catch dicking
public function catchMajasCockYaSlut():void
{
	clearOutput();
	showMaja(true);
	author("Gardeford");
	
	var x:int = pc.smallestVaginaIndex();
	var ppMaja:PregnancyPlaceholder = majaPlaceholder();
	
	output("<i>“Why don’t you show me what you can do with that bitch-breaker of yours,”</i> you say");
	if(!pc.isCrotchExposed()) output(", removing your [pc.crotchCovers] into a pile on the desk");
	output(". Once you’re undressed, you ");
	if(pc.isTaur()) output("lean against the table");
	else output("spin around and hop up onto the table");
	output(". Maja waddles around, looking unsure.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("No good at dominance. Much hard, dick does all thinking,");
	else output("I’m not the greatest at dominant stuff anymore. All the blood goes straight to my dick and it’s hard to think,");
	output("”</i> she apologizes, steepling her paws and fidgeting with her skirt strap.");

	output("\n\n<i>“I never said you’d be the dom,”</i> you purr, hooking a finger through the fretting korgonne’s belt and pulling her close. You can feel her hardening even through the thick leather, growing larger with each passing moment. The poor girl panics as she tries to undo her skirt, nearly hyperventilating as her fingers slip off the clasp. You sigh, pulling her down by the ring on her top and holding her there with a kiss. Some of the stress drains from her, but judging by the thunk you hear beneath the desk you imagine she’s still tense where it matters.");

	output("\n\nYou push Maja back from the table, batting her hands to the side and easily unclasping the belt on her skirt. Her sea-blue doggy dick springs up, happy to be free from confinement. Pulsating throbs push back at you as you grip the hefty dogmeat, asking, begging you for release. In time you may well oblige, but you ");
	if(silly) output("cum");
	else output("come");
	output(" first. A fitful whine escapes the animal tamer’s lips as you brush the head of her cock over your exposed [pc.pussyNoun " + x + "]. A dripping stream of pre flows endlessly from her oversized rod, ");
	if(pc.vaginas[x].wetness() <= 1) output("and you make use of it to paint your nethers into a perfect picture of lust.");
	else
	{
		output("and you mix it into your already ");
		if(pc.vaginas[x].wetness() < 4) output("dripping");
		else output("soaking");
		output(" nethers.");
	}

	output("\n\n<i>“Now, work those hips for me,”</i> you command, lining the suggestible slut’s pointed prick up with the entrance to your [pc.pussy " + x + "]. She obeys, stepping forward and pushing with her hips. A ");
	if(pc.vaginas[x].looseness() <= 2) output("hiss of air escapes your lips as the end of her cock works its way into your tight passage. She won’t be impaling you anytime soon, but the squishier apex of her manhood has no trouble squeezing its way inside.");
	else if(pc.vaginas[x].looseness() < 5) output("pleased gasp escapes your lips as she pushes her way inside you. You clench tightly around her, feeling every inch of her as it fills you.");
	else output("sigh of pleasure leaves your throat as her massive manhood slides into you. She almost slips as she thrusts her hips, meeting no resistance till her partially swollen knot bumps into your [pc.butt]. Only then do you let your muscles clench, trapping her in the warm embrace of your insides.");
	pc.cuntChange(x,ppMaja.cockVolume(0));

	output("\n\nThe poor girl tries her best, humping away at you with as much force as she can muster. Unfortunately, she intermittently lapses in her efforts as preorgasmic shudders run through her body. It doesn’t take too much effort for you to get a good grip on Maja’s firm buttocks, guiding her through the motions till she’s back up to speed. You give one of her plush melons a squeeze with your free hand, delighting in the jiggle that runs through it with each of her thrusts. You wedge two fingers beneath the heavy leather strap, pinching one of her sapphire nipples to keep her aware.");

	output("\n\n<i>“Good girl, nng. Keep moving like that. Such a good girl,”</i> you nestle in close, whispering sweet encouragement directly into her fluffy ears. Your words fill her with vigor, and she redoubles her efforts, even increasing in speed. You fight to suppress shudders of your own, struggling to stay in control as her azure lance sends spiking jolts of pleasure through your [pc.hips].");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("Maja best girl!");
	else output("I know I am!");
	output("”</i> she half-moans into your ear, Pulling away from your caressing hands long enough to kiss you. Hot saliva drips down your cheeks as your [pc.tongue] mingles with hers, kept warm by furious panting and feverish need. You take a second to unclasp and tear away her top, replacing the uncomfortable sensation of tough leather with soft, pillowy breast.");

	if(pc.biggestTitSize() <= 1) output("\n\nThe saucer-sized areola around her thick nipples all but completely encompass your own [pc.chest]. They fill the space between your bodies, close enough to lean down and nibble the soft flesh beneath the shock of white fur in her cleavage. Raw need glows in her gaze, and you can see it rearing up to explode.");
	else if(pc.biggestTitSize() <= 5) output("\n\nHer chest dwarfs your own, weighing on your [pc.breasts] like titanic loaves of bread. The squishy orbs compress enough for you to lean down and nibble at the soft flesh beneath her fur. Raw need grows in her eyes, and you can see it building to an overflow.");
	else if(pc.biggestTitSize() <= 50) output("\n\nYour chests press tightly together, and you moan as her sapphire nipples rub roughly against your own [pc.nipples]. The compression of flesh brings her tits close enough to nibble, and you nip at the flesh beneath the white shock of fur in her cleavage. You can see the raw need growing in her gaze, almost ready to burst.");
	else output("\n\nYour chests are too big to press together! Her nipples brush against yours for a moment before her bust slides forward, coming to rest around your face. The world around you is drowned in titflesh, numbing the sounds of sex into a low drone. You can hardly see anything through the dark void of her cleavage, with only the dimly glowing orb of savicite on her headband illuminating the raw need in her eyes.");

	output("\n\nShe reaches the pinnacle of ecstasy first. A soft grunt escapes her lips as you feel the first rope of alien seed spurt into your womb. The sensation of it brings you over the edge as well, the fluid heat spreading molten bliss through your body. ");
	if(pc.vaginas[x].looseness() < 3) output("Your thighs milk the cum from her knot, clenching tightly in the throes of your own orgasm. The two of you share swift kisses between thought-stealing gushes of aqueous ardor. You pull her close, only to black out a moment later as lightning strikes of lust burn through your consciousness. Her minty cream mixes with your [pc.girlCum], splashing against her legs as it floods back out. Your insides are too full to hold anymore, but she doesn’t seem to care.");
	else if(pc.vaginas[x].looseness() < 5) output("More cum jets from her overfull knot, splashing back out as she pulls back for each thrust. The two of you share swift kisses between throes of orgasmic euphoria, holding each other close as lightning flashes burn away your consciousness.");
	else output("Hot cum continues to fill you, flooding in as your [pc.vagina " + x + "] milks it from her swollen knot. The two of you are stuck fast now, giving each other swift kisses between stomach filling gushes of mint cream. Between blackouts, you see your stomach take on a nearly pregnant appearance.");

	output("\n\nMaja recovers first, her cerulean cock retreating into its sheath. She pushes herself up on shaky arms, giving you a affectionate lick on the cheek as she rises. You push yourself up onto your elbows, accepting her hand when she offers to help you to your feet. A quick stretch does wonders for your shoulders, but does little to assuage the dull ache in your hips. Plentiful streams of ");
	if(silly) output("korg kum");
	else output("korgonne jizz");
	output(" still run down your legs, ");
	if(pc.vaginas[x].looseness() >= 5) output("though most of it stays packed into your overstuff womb.");
	else output("leaving pearlescent puddles on the cave floor.");
	output("\n\n<i>“See? Knew you could do it,”</i> you mumble, patting the korgonne cutie on the head. Her ears perk up, but she doesn’t pause from drunkenly gathering her discarded clothes. You join her, gathering your things and getting ready to head out.");

	output("\n\n<i>“Gonna need a wash,”</i> she says, staring at the cum-slicked skirt in a stupor. Her twitching ears and wagging tail are the only response you get to your praise. You make your way out of the store, stopping to flip the small sign at the entrance to closed. Maja might need a little break to get washed up.");

	//(move to outside tamelings)(pass 1hr)(looseness 5 pcs get stuffed)
	processTime(60);
	//disable 30m
	pc.createStatusEffect("MAJA_FUCK_RECOVERY");
	pc.setStatusMinutes("MAJA_FUCK_RECOVERY",30);
	pc.orgasm();
	if(pc.vaginas[x].looseness() < 5)
	{
		ppMaja.removePerk("Fixed CumQ");
		ppMaja.createPerk("Fixed CumQ",400,0,0,0);
	}
	pc.loadInCunt(ppMaja,x);
	IncrementFlag("SEXED_MAJA");

	clearMenu();
	addButton(0,"Next",move,"KORGII T41");
}

//[UN.IMPL'd/OCTOBER] Maja Handjob + Ride
//[Make Love]
// Tooltip1: Get down and dirty with Maja.
// Tooltip2: If you want to do this, <b>you will absolutely need a pussy.</b>
// Tooltip3: Alas, your exotic 'tauric body prevents you from engaging in this.
// Requires Pussy. No Taurs, sorry.
// Reminder: use vaginaRouter
public function majaHandjobAndRide(x:int):void
{
	clearOutput();
	showMaja(true);
	author("William");

	output("<i>Her,</i> you think. That’s what you have in mind. Not her cock. Not her tits. Not even her balls. Just her.");
	output("\n\nMaja’s snout is curved into a nervous smile, expressing her lack of composure. Crisp, minty pheromones waft up off her excited loins - a primal aroma that fills the air. Scintillating, refreshing, and distinctly animalistic. You blink and look to her face, and she demurely turns away, tiny throbs drumming through a bright blue cock that’s begun to emerge from its sheath. Hard labor scuffs her cheeks, grime clings to her hair. Sweat accrues in her fluffy bosom.");
	output("\n\nThe hermaphrodite korg wears fatigue like a supermodel wears a designer dress - she’s gorgeous.");

	// first time
	if(flags["MAJA_MADE_LOVE"] == undefined)
	{
		output("\n\n<i>“" + (!korgiTranslate() ? "Why starings strongly, [pc.name]? Not knowing alien’s sharing habits...":"Why are you staring intently, [pc.name]? Is that how all aliens mate? I’m not familiar with this...") + "”</i>");
		// pc Bimbo
		if(pc.isBimbo()) output("\n\nGiggling and bounding forward, you burrow your face into Maja’s breasts, giving the stout beast-tamer a big hug and reassuring yet very lewd smile. <i>“Yup,”</i> you nod so hard your neck starts to get sore - thank goodness for big boobies! <i>“Totes is, sweetie. You’ve got an awesome body, there’s just so much to look at and appreciate! No reason to feel ashamed when you’ve got huge tits and a fat cock!”</i>");
		// pc Bro
		else if(pc.isBro()) output("\n\nGrunting appreciatively, you move forward and wrap an arm around Maja’s shoulders, squeezing her boobs. <i>“You look good,”</i> you husk, roughly squeezing her nipples. <i>“Sound better.”</i>");
		// pc Kind,Misch,Hard
		else output("\n\n<i>“It is, sort of,”</i> you chuckle, stepping forward and running a hand through the korgonne’s cheekfur. <i>“There’s more to sharing heat than bumping the other person.”</i> Your fingers curl around the jutting cyan pebbles capping her wobbly chest. <i>“You have to get to know them. Appreciate them for who they are and what they have.”</i> All the while, you’re leaning in closer, kissing her neck, letting your hot voice wash up the korg’s nape, <i>“Let them know how beautiful they really are.”</i>");
		// merge
	}
	// repeat time
	else
	{
		output("\n\n<i>“" + (!korgiTranslate() ? "Starings so hard again... makings heat, [pc.name].":"You’re staring hard again, like before, [pc.name]... it’s warming...") + "”</i>");
		// pc Bimbo
		if(pc.isBimbo()) output("\n\n<i>“Hard not to stare!”</i> you admit, jumping forward to wrap your face in the korgonne’s heavenly bosom. <i>“You’re so cute! I could go on and on and on and on and on talking about how much I love what you’re packing! Buuut...”</i> You lick your lips, catching a whiff of fresh dickmusk and very nearly losing your train of thought. <i>“...Ummm... you’re super hot!”</i>");
		// pc Bro
		else if(pc.isBro()) output("\n\n<i>“Guess I should stare harder,”</i> you grunt, giving one beryl nipple a good squeeze, enjoying the tactility of her creasing teat. <i>“Makes you look hotter.”</i>");
		// pc Kind,Misch,Hard
		else output("\n\nThe smile you give her makes her grow another few inches, both up top and bottom, and it’s super adorable how she’s trying not to make it obvious. <i>“Can’t deny it works, right?”</i> you giggle, lavishing that little spot behind her ears with affectionate scratches. <i>“There’s a lot I like about you, and you shouldn’t feel embarrassed.”</i>");
	}
	// merge
	output("\n\nHer tail starts to wag, and that’s when you make your move, licking the korgi’s soft cerulean lips. It’s a high pleasure to bring her into a passionate, intensely wet kiss. Her heart’s pounding so fast that it ripples through her heaving boobs, pressed square to your [pc.chestNoun]. Muscle-packed arms wrap around your waist, soothingly warm fur rubbing your [pc.skinFurScales], delighting in a tender embrace not often experienced. She’s letting you set the pace, melting into your embrace, getting harder, and puffier.");
	if(!pc.isCrotchExposed() && !pc.isChestExposed()) output("\n\nYou break the kiss only to rasp, <i>“Undress me.”</i> Maja moans into your throat, questing hands undoing your kit piece by piece. Once, you had to help her find a piece, but after that, she had you buck naked in less than thirty seconds.");
	output("\n\nAn immense and <b>firm</b> presence appears, jabbing into your [pc.belly], made all the warmer by sensational lovemaking. Maja’s burgeoning dog-cock stretches up your naked torso, spearing into her pillowy cleavage. Instead of groping her ass, your [pc.hands] turn their attentions to her semi-erect phallus, capturing the enormous organ in a double-handed grip. Aiming her cannon down, you pump the canid shaft to full hardness, letting out a moan of your own when her fuzzy palms stroke circles into your [pc.butts].");
	output("\n\nMaja’s cock is so big that you can’t touch your index fingertip to your thumb; it’s impossible to encircle. The tracts of her smooth blue shaft are laced with outsized veins that never relax, venting blood into a rapidly-ripening breeding mass. At the root of her dick, just before her sheath, is her knot, fattening in the palm of your hand, lusty palpations motivating its purposeful growth. Just beneath is her wide, pheromone-drenched ballsack, containing two testicles instead of the korgonne’s single standard gonad - it’s overflowing with sperm. The short woman’s bulbous scrotum draws your fondling digits deep into the sweaty, musky terrain, as though it were a cozy for your [pc.hands]. You can smell pussy, too: heady feminine fragrance interweaves with strong, potent masculinity, a buffet for the senses.");
	output("\n\nRunning up and down the fleshy heat of her turgidity, pearly pre dribbles from the tamer’s irrepressible phallus, adding a squelching frisson to your fervid handjob. Torrents of heat pass through her dilated cumvein, eased out by alternating caresses. The feel of her appealingly large manhood leaves you so breathless that your lips end up parting. Breaths washing over one another, you both give in to emotion, wholly possessed by the shared desire of release. Maja’s found your [pc.pussy " + x + "]" + (pc.hasCock() ? ", brushing your [pc.cocksLight] in the process":"") + ", and tweaks your [pc.clit] with a bestial grip strength.");
	output("\n\nShe slowly humps; forward earns her bloating bitch-breaker a hard grab, reverse gives her tapered crown an orgasmic flexing. Two mammals enthusiastically grind their sweaty bodies together; in the midst of blissful writhe you learn each other’s particular rhythms. Lengthy moans are pulled. Heavy, sibilant titters vibrate through [pc.skinFurScalesColor] [pc.skinFurScalesNoun] and tawny-beige pelt. Pussies seep glistening lubricants, and when orgasm hits, when Maja’s seed comes crashing up to spray across the room, you become hyper-aware of each bead trickling down your inner thigh.");
	output("\n\nYou squeeze on Maja’s knot; keening, violent lurches fire off a sticky volley. Pints of rushing seed surge through the korgonne’s firmness, long thick arcs of bubbly virility shooting up the walls, flailing through the air as her length bounces. Male climax plays havoc on the tribeswoman’s brain, and you nearly orgasm a second time from the raw <b>pressure</b> of the little herm’s spermy cascade. Her brisk, cool pheromones are driving you wild, and you pump a little faster, coaxing out the first of her oceanic loads even as rivulets of [pc.girlCum] paste her cunt-clawing paw, delighting in that powerful tension draining from her massive nuts.");
	output("\n\nIt takes a minute for Maja to finally calm down, and the storefront is a mess. She’ll have to clean it up. But it’s gonna have to wait: she’s still erect.");
	output("\n\nAnd you’re hornier than ever.");
	processTime(30);
	pc.changeLust(150);
	clearMenu();
	addButton(0,"Next",majaLovemaking2,x);
}

public function majaLovemaking2(x:int):void
{
	clearOutput();
	showMaja(true);
	author("William");
	output("Locked by the lips, you and Maja stumble in the direction of her bedding, falling into her personal cozy away from the world. She polishes your neck with long, wet licks, bright cobalt lips peppering moist and appreciative kisses as she moves, pure, overwhelming arousal in every smooch. On top, you’re pawing at her bust" + (pc.hasCock() ? ", compressing her shuddering tits around your [pc.cocksLight] and hers":" around her own throbbing mast") + ", cummy moisture leaking into her spongy fur. Tenderised by one orgasm already, she spunks again, blasting milky-white ropes of steaming jism through her cleavage and over her head.");
	output("\n\nMaja sprawls, cock pulsing under your crotch. The sapphire points of her nipples shiver to your fingers’ rapt attention. She cries out again, her fat dick spewing half-cum half-pre onto her face. Jacking that oversized length makes noisy squishing sounds that magnify the next frothy load - she just can’t stop cumming! Everything you do is a blissful bombardment on her nerves, detonating caches of boiling-hot lust in the animal tamer’s supple curves, speeding along yet more slutty wetness to accumulate in her canine features. Simmering and twitching and oozing, her tongue begins to loll, so you relent, delighting in your partner’s sub-vocal growls and lyrical moanings as she attempts to catch her third wind.");
	output("\n\nCurrents of bliss crackle through her gargantuan member, pulsing in thick fur. It’s easy to forget where you are, sinking into the hot softness that is this fervid korgonne, in a dark and snug place. Staring up with flat green eyes, Maja smilingly says, <i>“" + (!korgiTranslate() ? "[pc.name] very helping... wise mating, knowing every about Maja. Wanting give back.":"[pc.name]... you seem to know everything about me, how to make me happy... please let me do something for you, too.") + "”</i>");
	output("\n\nThe padded paws on your [pc.hips] stroke with uncertainty, stimulating your muscles. She looks to your crotch then up again, snout widening. So you scoot up and over until your [pc.pussiesIsAre] hovering just above her nose, the faint illumination from your codex refracting in the dripping threads of fresh nectar. Puddling girl-lube flows onto the stocky woman’s teal lips, leaving her squirming and panting, and her tail thumping just under her waist." + (pc.hasCock() ? " [pc.CumColor] droplets sag from your [pc.cockHeads] too, joining the effluence drenching her cerulean mouthpiece. <i>“Just like me...”</i> she quietly quips.":""));
	output("\n\nMaja slips a hand");
	if(pc.balls > 0) output(" under your ballsack");
	else if(pc.hasCock()) output(" under your [pc.cockNoun]");
	else output(" into your nethers");
	output(" and strokes the");
	if(pc.vaginalPuffiness(x) > 0) output(" puffy");
	output(" folds of your aroused cunt, genuine joy triggering you to release another wave of glistening [pc.girlCumNoun]. The korgonne’s large fingers explore your sapphic fields, letting her other arm surprise your [pc.ass] with similar appreciation, squeezing, rubbing, rolling, and pinching your left butt-cheek until you’re arching needfully. [pc.LegNoun] buckling, you collapse onto her muzzle, straight into the path of a curving azure tongue, long and perfect for lapping up a drink, its biological purpose turned to massaging your yielding labia, opening your [pc.vaginaColor " + x + "] sex with insistent licks.");
	output("\n\nA wave of fatigue grips you, so you grip her head, [pc.thighs] trembling to the swish and swash of oral service. Palm-sized fingers squeeze your [pc.skinFurScales] harder, delivering a harsh ‘thwack!’ of a slap, the kind that lets beasts know who their mistress is; her tongue plunges inside at the same time, affirming the authority imprinted on your [pc.ass]. That heavy hand squeezes so, so tightly that your body mimics the sensation, winding up and finally snapping. Orgasm washes through your [pc.pussiesLight]; she thrusts her nose deeper, her muzzle the closest thing your clenching cunny has to something phallic and milkable; parting your kneading innards, her wonderfully <b>long</b> and sinfully <b>rough</b> tongue easily brings you to the elongated climax you so generously gave to her.");
	output("\n\nCascades of [pc.girlCum] gush helplessly. More than that, it’s like you’re experiencing multiple orgasms at a time. [pc.GirlCumColor] slime catches her jaw, soaks her brow, stuffs her cheeks to overflowing, and the result of her vigorous licks is another hollow quake felt to the point of your [pc.clit], and you cum helplessly, no matter where she aims. Writhing in ecstasy, convulsing in twitching climax, it seems Maja’s");
	if(flags["MAJA_MADE_LOVE"] == undefined) output(" starting to gain a lot of confidence with you.");
	else output(" self-belief has enjoyed a hearty injection of confidence since she met you.");
	output("\n\nWhen you rouse and slide back, the dog-woman eyes you seductively. She looks very silly with all that pussy-drool masking her, but very satisfied too. ");
	if(pc.biggestTitSize() >= 1) 
	{
		output("Suddenly, the korgonne leans forward, seizing your [pc.breasts] and [pc.nipples]. Your sight blossoms into a vibrant sea of pleasure. You move closer on instinct, giving her the chance to enjoy all that you have to offer, loving it the most when your [pc.nippleColor] buds are pinched and tweaks are added at random.");
		if(pc.canLactate()) output(" All the pressing finally expresses a thin arc of [pc.milk]. On reflex, Maja opens wide to catch it, not wasting a single drop of your milk. <i>“" + (pc.isPregnant() ? "Close to birthing,":"Like pregnant,") + "”</i> she laughs. <i>“Good taste.”</i>");
	}
	output("\n\n<i>“" + (!korgiTranslate() ? "[pc.name]... still needings... me too, but boy-korg parts too fat...":"You’re still horny, [pc.name]... and I am too. I’m sorry that my cock is too big...") + "”</i>");

	if(pc.isBimbo()) output("\n\nToo big!? Naw, no such thing!");
	else if(pc.isBro()) output("\n\nWho does she think she’s talking to? Too big... sheesh.");
	else output("\n\nAh, now <b>there’s</b> an idea!");

	output("\n\nThe temperature in the room rises as you slither back, tugging Maja’s dick from between her cleavage. Two blue feet of sensitized dog-cock loom close to you, the pole big enough to euphorically hug, not quite big enough for a whore to perform with. You lick at the undervein, tasting her salt and musk, not even caring how much this beastly boner is going to stretch you. You grope her ballsack, feeling the bloatedness, making her shift all that sperm-packed fur around you. <i>“[pc.name]?”</i> she asks hesitantly, mouth slightly ajar.");
	output("\n\nLifting up to a squat, you make suckling love to the korgonne’s cock, groaning into her mast, gripping the stern meat, giving the head long, sensuous licks, jerking the hose - phallic obsession. You plant your [pc.lips] to the weakest spots and squeeze them against the girthy profusion, attaching yourself like a vacuum on your trip downward, whereupon your [pc.tongue] lays the most luscious licks on her knot. If you concentrate hard enough, you can identify bits of your own residue in there.");
	output("\n\nThe suction of your mouth closes around Maja’s nutsack soon after, fluffy mini-kegs enlarged past the point two hands could hold one. All it takes is more lascivious licking to restart her production; you throw in a nice and horny <i>“mmm”</i> as you sup her ballsweat, and her gurgling orbs clench. You fondle the creamy cushions as you give them their tongue bath, glorying in that pillowy warmth, losing yourself to the mind-melting sweetness of thirsty ball worship, roaming the gigantic, summitless hills for an unknown period of time, topping the performance off with a contented sigh that you <b>know she heard,</b> judging by the way her now-slippery testes just rose.");
	output("\n\nCyan cock quivers from your touch, webs of herm-goo dripping from the pointed tip. That rich mixed scent only an endowed herm can have makes your mouth water, and with your errant thoughts silenced by her minty pheromones, you climb the mountain and position the pointed crown to your [pc.pussy " + x + "]. The sordid tunnel fruitlessly clamps down on nothing, because you nosed your furry lover’s cunt-breaking totem into its sodden gates. The anticipation in the fragrant air is suffocating.");
	output("\n\nNot so much that she doesn’t sense your intention.");
	processTime(30);
	clearMenu();
	addButton(0,"Next",majaLovemaking3,x);
}

public function majaLovemaking3(x:int):void
{
	clearOutput();
	showMaja(true);
	author("William");

	// first time
	if(flags["MAJA_MADE_LOVE"] == undefined)
	{
		output("<i>“" + (!korgiTranslate() ? "[pc.name]! Too big, won’t fit. Please no self-hurtings!":"[pc.name], it’s too big! Don’t hurt yourself!") + "”</i>");
	}
	// repeat time
	else output("<i>“" + (!korgiTranslate() ? "[pc.name]... it’s so big... but if okay with size please being careful.":"It’s so big, [pc.name]... please be careful, I don’t want you to get hurt.") + "”</i>");
	// merge
	output("\n\nPreparation is important. The longer you tease her awkward fuck-club of a boner with the promise of sweet, bare twat, the more heat her dick spurts. Mons-coating wads of pre burst from her tip as you drum the obscene organ into your clitoral hood. High volumes are flung out, gathering into globs that immediately drip off, or, if you rub hard enough, get pushed inside, glazing your damp delta in ooey gooey goodness.");
	if(pc.wetness(x) < 2) output(" You’re going to need it - you’re not wet enough on your own to handle this korgonne’s truncheon.");
	else if(pc.wetness(x) < 4) output(" You’re a wet [pc.boyGirl] for sure, but not even your amped glands can coat this beast without assistance.");
	else output(" Finally, a challenge worthy of your significant squirting abilities. Maja’s dick-spit has lubed your entrance up, and your fuck-juice waterfalls her fatness in enough lubrication to encase smaller pricks in a thick layer of gloss. This is a pairing made in the korgonne’s great forge.");

	output("\n\nHigh on Maja’s scent, you stroke her tummy and cock, gradually ceding control to Uveto’s gravity. Your breath catches in your throat when her taper skewers your [pc.pussy " + x + "], the fist-sized crest splitting you open so that the girthier shaft can have an easier time. You bite your lip, high-pitched whines echoing in the back of your throat. Taking your fluffy mate’s mammoth is not going to be a quick or painless process, and that’s exactly why it’s going to feel so good. Suddenly, your body contracts upon the intrusion, spilling waves of [pc.girlCumVisc] lubricant onto the head of the trespassing monster, but it does little to impede the progress of a physical instrument that mother nature designed to effectively breed the tightest of holes.");

	// pc Low Vaginal Looseness
	if(pc.looseness(x) < 3)
	{
		output("\n\nRippling acres of vaginal tightness are biblically parted by Maja’s staff. The first of far too many cobalt inches gape your willing pussy, stretching your kegel muscles and rounding them out to the shape of the korgonne’s chemically-endowed member. It took until meeting her to realize how <b>empty</b> you were, and how your body had been silently crying out for a hypersexualized schlong to wear it as a sexual ornament. Intoxicating hormonal urge is right there behind it, filling your veins, which are also echoing your cunt’s previous perception of stimulation deprivation. You’re being molded in real-time around this penis, its powerful ascent on a channel of lubricated bliss something you’ll forever relish, even if it does ruin you for others.");
	}
	// pc Med Vaginal Looseness
	else if(pc.looseness(x) < 5)
	{
		output("\n\nGiving up control over your descent was a move that should have whores taking notes, but that’s not what makes riding a dick special. Your pussy is trained for big insertions, yet there’s that subtle contrast of being too tight and too loose that Maja’s cock plays with, molds like clay. She’s breaking you in for her, and for her alone, adjusting your [pc.vaginaColor " + x + "] interior to clut in the places that please <i>her</i> the most. It’s ruining you, meticulously, sensually, doing wonderful things to the torrid trench gaped like a laquine broodmother’s juicy nexus.");
	}
	// pc High Vaginal Looseness
	else
	{
		output("\n\nYour [pc.pussy " + x + "] is no stranger to big, heavy rods flattening it into a useless, worn out fuck-tunnel. It can only derive pleasure from being stuffed by dense dongs, bulging boners, meaty members; it requires obscene expressions of masculinity to reward, to welcome into its wet, sized-out embrace - other pussies couldn’t serve them anyway. Maja is positively bewildered by the ease at which she stuffs your yielding box full of her colossal girth. Once she accepts how made-for-dicking you really are, she shudders, rocking her hips to drive that satisfaction into your dick-starved nerves.");
	}
	var knotty:Boolean = false;
	// pc Low Vaginal Capacity
	if(pc.vaginalCapacity(x) < 120) output("\n\nFor Maja’s sake you do your absolute best not to show pain as that slab of korgonne-meat forcing its way into your body. Hyperventilations race up and down your neck, burning from the intense discomfit. Her tapering pries open the reflexively tensing path to your womb, turning your cunt into its personal (if inadequate) cum-box. Soon, it can go no further: it presses on the" + (pc.isPregnant(x) ? " sealed entrance to your womb, your cervix angrily denying entrance":" entrance to the most powerful and important organ in your reproductive system. A tiny bit more force, and she’ll flood your ovaries") + ". It does hurt, no fucking doubt, but that masochistic sensation of being filled out, having your hips widened by half an inch with each [pc.raceShort]-breaking throb of her pussy-destroying dick... that’s heaven. She can’t knot you, but that’s fine - this is enough.");
	// pc Med Vaginal Capacity
	else if(pc.vaginalCapacity(x) < 600) 
	{
		output("\n\nMaja’s mastiff is far in excess of sizes you’re comfortable with. At first there’s a little uncertainty: you’re penetrated without pain, cuntlips pinned wide around veiny dog-cock, a full foot of thick dickmeat plunged inside. She cries out, ever-present lust overwhelming her composure. Stocky hips buck, thrusting through clutching walls and to the" + (pc.isPregnant(x) ? " sealed gates of your womb":" yawning gates of your womb") + ", incredible and merciless force trespassing on sacred ground. She’s bottomed out, insofar as your anatomy will allow, within spitting distance of her knot.");
	}
	// pc High Vaginal Capacity
	else 
	{
		output("\n\nMaja is cross-eyed starstruck by your [pc.pussyNoun " + x + "]’s accommodations. <i>“Impossible!”</i> she cries in sudden ecstasy, watching the bulk of her canid mallet disappear into your magical cunny. As your body sinks down, your brain rises in pure pleasure, that simmering feeling from before transforming into a full-body sensation of molten desire. Your [pc.ass] slaps into her balls with a lurid squish of sexual finality, your [pc.pussiesLight] smacking wetly into her crotch. If she wanted to fuck her knot straight into you while you ride, she could. The poor korgonne swoons in utter disbelief, her penis pumping brutish amounts of pre-seed into your gut.");
		output("\n\nShe’s finally met someone in this galaxy who can show her a world of pleasure she never knew.");
		knotty = true;
	}
	var ppMaja:PregnancyPlaceholder = majaPlaceholder();
	pc.cuntChange(x,ppMaja.cockVolume(0));
	// merge
	output("\n\nAs addictive as this feeling of fullness is, you start to move, slowly and languidly. Sliding up Maja’s hyper-turgid rigor, reality is bisected by crackling bliss. [pc.Hands] clutching the korgonne’s muscular waist, you descend the shaft, innards tightening down on her heated maleness. Smashing" + (!pc.isPregnant(x) ? " her cock-head into your womb’s door":" your loins to hers") + ", jouncing up and down on the herm-dog causes you to whimper; clear slime leaks from your strained slit in thick beads. Unneeded muscles go dormant, slackening to force you to fuck her in a specific posture, [pc.butts] vibrating from the accelerating fuck.");
	output("\n\nMaja fucks you on her own strength, twisting her hips to imprint her phallus around your abdominals. Her paws find strength again, pinching your [pc.clits]" + (pc.hasCocks() ? " and jerking your bobbing [pc.cocksLight]":"") + "; her nostrils flare, assaulted by the scent of a needy breeder. That otherworldly tightness continues to swell; blood pounds in your ears, grotesque firmness throbs in your completely-clogged recesses - you merely whimper. The only thing a body as wrecked as yours can do, consciousness wrought by enough extreme input to fry modern-day circuit breakers, is cum helplessly, again, and again, mini-orgasms riding atop the improbably-large pillar pounding your core.");
	output("\n\nBlack tendrils creep into your periphery, changing to white and blue on every fall. Every shift in hue is accompanied by the lurid stirrings of juice inside you, struggling to flow, but you’re never left empty for more than a second. Constant, firm pressure drives deep, rough pleasure into your sopping [pc.vaginaColor " + x + "] wetness, banging a once-sumptuous place into a used-up penile gutter. Maja’s breaths come out steamy clouds, laced with animalistic urges she can no longer deny.");
	output("\n\nA threatening growl boils out of her maw, dominant and lustful. Maja reaches up to your torso and yanks you down into a hug, burrowing your [pc.face] into her bountiful front, bending her legs and railing you full of more ecstatic weight than your mind knows what to do with. Inhuman fingers dig into your [pc.skinFurScales] and scalp, gripping tighter than a creature in deep rut. The korgonne ups her pace, fangs gritted, training your overflowing honeypot one dewy screw at a time.");
	output("\n\nNeither of you manage to speak - words wouldn’t matter here. Raw desire and livid emotion reigns, powering into your desperate quim");
	if(pc.vaginalPuffiness(x) > 0) output(", gloriously engorged petals swallowing" + (knotty ? " up everything to the knot":" her knot up") + ", boobs deforming into your flesh, jetting jumps of spooge acting as apertif to a sloppy creampie. Coruscating nerves propel her to orgasm, swabbed and smoothed by every monstrous thrust.");
	output("\n\nClimax isn’t far. Her big, sticky balls are pulsing at the rear of your [pc.thighs], magnificent spunk-sacks roiling against your nethers. Ample testicular squish <b>churns</b> with every muff-stuffing pitch, liquid burden ready to twitch out into your spent, fluttering pussy.");
	if(pc.biggestTitSize() >= 1 && pc.canLactate()) 
	{
		output(" Maja reaches down and seizes one of your boobs, popping the milky cork on" + (pc.totalNipples() == 2 ? " both":" all") + " nipples in sequence, getting your body to let down its bounty in maddening manner.");
	}
	output("\n\nClimax hits in a moment of pure, instinctual passion. You’re first to blow, cascades of [pc.girlCum] spattering across the curvature of her sack. ");
	if(pc.hasCock())
	{
		output("[pc.Cum] fires into the dark crevice between your smushed chests, stuttering spurts of male delight. ");
	}
	//lowMedCapacity:
	if(!knotty) output("Urethra-straining quantities of seed explode into you afterward. Alas, Maja is unable to tie the knot, but in this position, held safe and secure in the tamer’s arms, her genes aren’t wasted.");
	else output("In those split-seconds before Maja’s phallus-fattening detonations blast into your womb, she slams your ass down onto her crotch, forcing you to take that bulbous knob of rut-flesh. You can feel it squishing around inside ensuring not a single drop of DNA is wasted.");
	output("\n\nTides of korgonne spunk buffet your womb, clenched muscle parting for considerable fluid bounty. Gouts of seed" + (pc.isPregnant(x) ? " crash against your in-use womb":" deliver right to the door of your ovaries, flooding your fallopian tubes") + ". You loose a wall-shuddering scream for only a second, Maja dragging you into another kiss. Her doughy ‘nads unspool rope after rope of curve-enhancing jizz, pressing against your rump in the most explosive moments. Your belly" + (pc.bellyRating() < 20 ? " swells up to leviathan-like proportions, plump with children as well as fresh sperm":" groans outwards, fresh nut expanding your curves to better house your partner’s magnificent output") + ".");
	output("\n\nRaging ropes of molten stickiness rush ceaselessly. Gushing seed permeates every inch of your pregnable puss, ballooning your gut and forcing your biology to work overtime in siphoning away all that it possibly can. Maja’s got enough cream to impregnate the entire hold twice over, and, Void, fuck... it’s all being pumped into you. Cum oozes everywhere, billions of swimmers tickling your baby-tube, further ejaculations pushing the old puddles of gloop further into your cum-thirsty quim.");
	output("\n\nYou sigh, and then groan, then sigh some more, fatigue dining on your waning endurance. Maja rolls you over to the side, positioning you between the wall of her sleeping nook and, of course, her, kissing you lightly on the nose. When your eyes shut, they stay shut.");
	processTime(35);
	pc.orgasm();
	pc.loadInCunt(ppMaja,x);
	if(pc.canLactate()) pc.milked();
	clearMenu();
	addButton(0,"Next",finishingWivMaja,x);
}

public function finishingWivMaja(x:int):void
{
	clearOutput();
	showMaja(true);
	author("William");
	output("There’s something to be said about being able to sleep in the arms of a shy yet capable lover like Maja, here in her room, cuddling furtive in a warm mountain hold on a frozen ball of ice floating in the ocean of stars. Far away from civilization. Even further away from responsibility, from things you’d rather not deal with, keeping her cock warm in that creased cleft between your legs. You can’t recall the last time you slept so well.");
	output("\n\nEyes opened, you feel like you could disappear in the woman’s emerald-green gaze. <i>“Good wakings, [pc.name],”</i> she says. Her passionate smile begs for a kiss - the next two or three minutes are spent making out, cuddling in the afterglow in this inky space. <i>“" + (!korgiTranslate() ? "Had many happying feels. [pc.name]...":"I’ve never been happier, [pc.name]...") + "”</i>");
	output("\n\nYou chucklingly answer with a smile.");
	output("\n\nMaja withdraws her softened tool from your depths, all flavors of cooled effluence flecking her sheath. Her knot had calmed and deflated during your tranquil nap. A pudding of thick, gooey pleasure pours from you, all the excess your body couldn’t contain. The beastmaster is close at your side as you get your things together, rubbing your [pc.belly] affectionately, saying nothing, sincerely invested in your health and well-being.");
	output("\n\nOf course, you can’t stay here forever. You have a place in the galaxy that you can’t give up. Not yet.");
	output("\n\n<i>“" + (!korgiTranslate() ? "[pc.name] soon visitings? Maja be here, and wishing good tidings.":"Will you visit again soon, [pc.name]? I’ll be here, and I’ll be wishing for your success.") + "”</i>");
	output("\n\nBefore you turn to leave, you squeeze her palm, hoping your");
	if(pc.isBimbo()) output(" face-splitting beam");
	else if(pc.isBro()) output("broad grin");
	else output("heart-felt smile");
	output(" embeds itself in her mind.");
	output("\n\nYou’ll try to make time.");
	processTime(15);


	IncrementFlag("MAJA_MADE_LOVE");
	IncrementFlag("SEXED_MAJA");
	pc.createStatusEffect("MAJA_FUCK_RECOVERY");
	pc.setStatusMinutes("MAJA_FUCK_RECOVERY",30);

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
