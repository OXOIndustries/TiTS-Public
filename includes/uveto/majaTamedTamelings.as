public function showMaja(nude:Boolean = false):void
{
	var nudeS:String = "";
	if(nude) nudeS = "_NUDE";
	showBust("MAJA"+nudeS);
	showName("\nMAJA");
}
public function majaTrust():Boolean
{
	return false;//9999
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
		if(9999 == 0) output("smiles excitedly");
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
	addButton(0,"Appearance",majaAppearance,undefined,"Appearance",(kGAMECLASS.silly ? "Take a gander at that fiiiine ass doggo." : "Take a look at Maja."));
	//[rent](ask Maja what beasts she has available for rent)
	addButton(1,"Rent",majaRentButton,undefined,"Rent","Ask Maja what beasts she has available for rent.");
	//[return](return your rented animal)
	if(canReturnMajaPet()) addButton(2,"Return",returnPetToMaja,undefined,"Return","Return the rented beast to its home.");
	else addDisabledButton(2,"Return","Return","You need to have rented a beast and have its leash on hand in order to return it.");
	//[talks](talk with Maja{, and maybe get on her better side}.[sex]({maybe you should get her to trust you before asking about sex./Help Maja out with her own beast.}
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
	if(silly) output("thicc");
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

		output("\n\n");
		if(!majaTrust()) 
		{
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
	addItemButton(0, new KordiiakLeash(), purchaseTameling,new KordiiakLeash());
	addItemButton(1, new NogwichLeash(), purchaseTameling,new NogwichLeash());
	if(flags["MAJA_RENTING"] != undefined)
	{
		output("\n\n<b>You will not be able to rent a new animal until you return the old one.");
		setButtonDisabled(0);
		setButtonDisabled(1);
	}
}

public function purchaseTameling(arg:ItemSlotClass):void
{
	clearOutput();
	showMaja();
	author("Gardeford");
	flags["MAJA_RENTING"] = arg.description;
	output("Maja goes vanishes into the back and returns with your brand-new rental pet.\n\n");
	pc.credits -= arg.basePrice;
	eventQueue.push(majaRentButton);
	quickLoot(arg);
}

public function canReturnMajaPet():Boolean
{
	//Bear:
	if(flags["MAJA_RENTING"] == new KordiiakLeash().description)
	{
		if(pc.hasItemByClass(KordiiakLeash) || pc.accessory is KordiiakLeash) return true;
	}
	//Cathorse
	if(flags["MAJA_RENTING"] == new NogwichLeash().description)
	{
		if(pc.hasItemByClass(NogwichLeash) || pc.accessory is NogwichLeash) return true;
	}
	return false;
}
public function returnPetToMaja():void
{
	clearOutput();
	showMaja();
	author("Gardeford");
	output("You return the rented animal to a grateful Maja.");
	if(flags["MAJA_RENTING"] == new KordiiakLeash().description)
	{
		if(pc.hasItemByClass(KordiiakLeash)) pc.destroyItemByClass(KordiiakLeash);
		else if(pc.accessory is KordiiakLeash) pc.accessory = new EmptySlot();
	}
	//Cathorse
	if(flags["MAJA_RENTING"] == new NogwichLeash().description)
	{
		if(pc.hasItemByClass(NogwichLeash)) pc.destroyItemByClass(NogwichLeash);
		else if(pc.accessory is NogwichLeash) pc.accessory = new EmptySlot();
	}
	flags["MAJA_RENTING"] = undefined;
	clearMenu();
	addButton(0,"Next",repeatMajaApproach,true);
}

//Talks
/*

output("\n\n[Aliens](Find out why Maja doesnt trust aliens.)[Taming](Ask Maja about beast taming and how she takes care of the animals)[Space](Ask Maja what she thinks about space itself and if she’d ever think of travelling)");

output("\n\n//aliens");
output("\n\n<i>“{bimb:So like, why don’t you trust aliens? You guys are super fluffy *and* trustable. I can’t think of anyone who wouldn’t be nice to you./else: So why don’t you trust aliens? Did someone try to hurt you?}”</i> you ask, sitting in front of the stout korgonne’s desk. Maja narrows her eyes slightly, giving you a second look-over. She scoots closer to her desk and rests against the wooden frame.");

output("\n\n//korg speak");

output("\n\n<i>“Want to give trustings. Not have many meets with outsiders. Only see sometimes when taming animals. Last time I ambush, but aliens win fight. Was expecting warm shares, almost hoping, but instead they jabbed with sharps and pokings all over. Kor’diiak came to Maja’s rescue, and carried back to hold. First hour there was nothing, but then came much heat. Like sharing warmth, but millions of sharings all at once!”</i> The stocky dog-girls tail begins to wag at the memory, flitting behind her as she continues her story.");

output("\n\n<i>“Their sharpings filled me with alien drugs,”</i> she gives herself a tight hug, shaking her head. <i>“Didn’t want, but wanted. Warmings didn’t care about thinkings. When thinks returned me wasn’t me anymore. Maja’s chest is bigger than Maja, and,”</i> She hesitates for a brief second, sniffling, but the rest of the statement pours out. <i>“And alien sharp gave me (silly: the ponos/else:boy-korg parts).”</i>");

output("\n\n//fix speak");

output("\n\n<i>“I want to trust you. I don’t meet many outsiders. The rare occasions I do see them are when I’m out taming new animals. The last group I saw looked pretty weak, so I decided to ambush them. I got my ass kicked, but I’d heard stories of aliens who prefer to just mate after a good fight instead of doing nastier things, so I wasn’t too sad about it. Instead they started jabbing be with needles, all over my chest and above my crotch. I was weary from the battle so I couldn’t stop them, but luckily one of the kor’diiaks came back and scared them off,”</i> she hugs herself tight, shaking her head as she continues.");

output("\n\n<i>“The aliens drugs were already in my system when they brought me back. At first I just felt kind of numb, but then I got hotter than I’ve ever felt. I lost my ability to focus on anything but the pleasure. Even the cave air on my fur felt sexual. I passed out for who knows how long, and when i woke up I was this! I used to have a nice, firm chest, but now I have pillows that are almost bigger than my body. And if that wasn’t bad enough, that stupid drug gave me a,”</i> she hesitates for a brief second, sniffling, but the rest of her words pour out. <i>“{silly: The Ponos/else:A dick}”</i>");

output("\n\n//merge");

output("\n\nSuddenly the thick skirt she wears even down here in the warm caves makes a bit more sense. You {bimb:jump into a hug that almost knocks the poor girl off her feet./bro:{lift/lock} the saddened dog-girl in a tight embrace/else:put a comforting hand on the dog-girl’s shoulder.}");

output("\n\n<i>“{bimb:Those people sound like the worst! You shouldn’t be forced into things you don’t want... But it can’t be all bad. Having both parts{pc herm: is/else: sounds like fun}!/bro:Cheer up. It can’t be all bad,/nice:That’s terrible! That kind of thing is illegal on core planets like this. But it’s not all bad, is it? Plenty of people who live with both parts down there nowadays/misch:People like that make me sick. Those kinds of drugs shouldn’t be tossed around like toys. It can’t be all bad though, can it? Having both parts probably makes you super popular around here!/hard:Those people sound like they need a good beating. You’re alright though, right? Having both parts is nothing to cry about,} you say, trying to sound reassuring. Maja stares at you in awed disbelief for a moment, eyes wide and still a little blurry from her recounting.");

output("\n\n<i>“{N-no, korgonne not like this in normal times. Lots of alien with both parts, but korgonne never. Other females say is wierd or laugh, would rather have alien with both parts than korgonne. Males worry kids will be weird, too scared even for warm shares,/N-no, korgonne never have this kind of thing happen naturally. At least not in our clans records, and I’ve never heard tales of it elsewhere. The men here are too frightened that their pups will turn out this way to even consider me an option, and the other girls would rather have exotic alien cock if they’re going to go for someone with both parts,”</i> she whines, still looking like she’s surprised you’re still listening.");

output("\n\n<i>“Well, what about you? How do you feel about {warm shares/sex} with exotic aliens?”</i> You ask, shifting into a position that shows off more of your assets. To your delight, you see the embarrassed korgonne’s thick skirt begin to tent slightly. She averts her eyes, trying to meet yours, but the damage is already done. Her breath quickens, and you imagine her fantasizing about the two of you in bed, or right here. She continues to harden till you can see the pointed tip of her cobalt cock peeking out from under the leather, lifting it up almost level with the desk.");

output("\n\n<i>“I... uhh... whoa. {Maja hasn’t shared warmth/I haven’t been with anyone} since this happened. M-maybe when {chores finished/I finish my work for the day} we could... Maybe... Mmm,”</i> a shudder runs through her body, and you see her slowly begin to pull herself together.");

output("\n\n<i>“{C-can Maja help with anything else?/I-is there anything else I can help you with in the meantime?}”</i> she asks, tail wagging behind her.");

output("\n\n(back to menu)");

output("\n\n//Taming");

output("\n\n<i>“{Bimb:So, like, how do you tame those big scary monsters all by yourself? Isn’t that suuuuper dangerous?/else: So how do you tame a kor’diiak all by yourself? No offense, but it seems like it would be dangerous to do alone.}”</i> you ask. The stacked korgonne grins proudly, leaning against her desk.");
*/