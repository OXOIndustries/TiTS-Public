import classes.Items.Treasures.MiniatureGiantBabyKordiiak;

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
	output(" hips and a tight, round butt keep her skirt on her waist despite the weight of her tools." + (flags["SEXED_MAJA"] != undefined ? " You know for a fact that the heavy skirt also hides two feet of beryl bitch-cock and a pair of hefty volleyballs to match.":"") + " Her arms can hardly reach past her titanic endowments, leaving her oddly off balance whenever she reaches for objects around the room. Her tail seems about average compared to the other korgonne you’ve seen, wagging happily as she goes about her work.");
	output("\n\n" + (flags["SEXED_MAJA"] == undefined ? " You don’t know what the stocky beast-tamer is packing down below, and the skirt she wears is heavy enough to obscure even a guess.":" You know precisely what lies beneath that heavy skirt. Nigh on two whole feet of sapphire doggycock, and a pair of volleyball-sized cream spheres to supply it. Her original sex remains hidden behind them, a puffy cerulean slit with a clit the size of a small jewel."));
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
		output("You pull out a few credit chits, prepared to give the stocky korgonne whatever kind of payment she needs for riding the animals. Maja gives you a confused look, glancing at the chits and back up to you.");
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
		output("<i>“I’d like to take a kor’diiak out,”</i> you say, handing Maja a credit chit. She gives the small piece of tech a thoughtful look, stowing it in a small box on her desk. She separates a large silver key from her ring and scurries to the back pens. A minute later she comes back, leading one of the hulking bear-like creatures by a thick-roped collar. It huffs inquisitively in your direction, and Maja transfers the leash to your hands.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Here go! Kor’diiak will do a protect. Big scary to bad guys. He make sure many get home safe, so you make sure he get home safe.”</i>");
		else output("Here you are, this big guy ought to protect you out on the ice. Or anywhere cold really. He’s helped a lot of korgonne get back safe from hunts. He’ll have your back, so you make sure to have his.”</i>");
	}
	else if(arg is NogwichLeash)
	{
		output("<i>“I think I’ll take a nog’wich today,”</i> you say handing maja a credit chit. She takes the small tech chip and stows it away in a small box on her desk, giving an approving nod as she closes it. She takes her key ring and scurries off into the back room, coming back a few minutes later with a horse-sized nog’wich on a fine leather leash. The creature eyes you up and down before brushing against you and purring. From such a large creature the effect if more like an engine.");
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
		if(pc.isHerm()) output("is");
		else output("sounds like fun");
		output("!");
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
	if(9999 == 0) 
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