//Greeting
//Store Description
public function darkChrysalisStorefront():void
{
	if(pc.statusEffectv1("Dark Chrysalis Closed") != 0)
	{
		output("\n\nThe Dark Chrysalis is closed with a lit “Come Back Later” sign. You suspect its proprietor is preoccupied.");
		flags["NAV_DISABLED"] = NAV_EAST_DISABLE;
		return;
	}
	if(!seraRecruited() && seraAtNursery())
	{
		output("\n\nNo lights are on in the Dark Chrysalis - not even its pornographic “Come Back Later” sign. Perhaps Sera is out somewhere.");
		flags["NAV_DISABLED"] = NAV_EAST_DISABLE;
		return;
	}
	
	if(!seraRecruited() && pc.hasStatusEffect("Dark Chrysalis Closed"))
	{
		output("\n\nThe Dark Chrysalis is closed. Even its “Doing a Slut” sign is dark. You suspect its proprietor is sleeping off a heavy hangover.");
		flags["NAV_DISABLED"] = NAV_EAST_DISABLE;
	}
	else
	{
		if(isHalloweenish() && pc.breastRows[0].breastRating() >= 1 && seraIsMistress() && flags["SERA_HALLOWEEN_LOCKED"] == undefined)
		{
			output("\n\n<i>As fitting for the time of the year many shops have outfitted their storefronts with spooky decorations. From rather-cute-than-spooky to cases where you can’t be sure whether a person actually died there or not, all kinds of decorations can be found. Similarly, most store clerks and passersby present themselves in costumes fitting for the occasion.</i>");
			output("\n\nThe Dark Chrysalis, a shop that specializes in targeted, cosmetic transformatives is doing business to the east. <i>You notice a small group of costumed people quickly hurrying away from the shop for whatever reason.</i>");
		}
		else output("\n\nThe Dark Chrysalis, a shop that specializes in targeted, cosmetic transformatives is doing business to the east.");
		flags["NAV_DISABLED"] = undefined;
	}
	
	pc.removeStatusEffect("Sera at Nursery");
}
public function darkChrysalisIsOpen():Boolean
{
	if(seraRecruited()) return true;
	if(seraAtNursery() || pc.hasStatusEffect("Dark Chrysalis Closed")) return false;
	return true;
}

public function showSera(nude:Boolean = false):void
{
	showBust(seraBustDisplay(nude));
	showName("\nSERA");
}
public function seraBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "SERA";
	
	if(9999 == 0)
	{
		if(chars["SERA"].skinTone == "bright pink") sBust += "_PINK";
		if(!chars["SERA"].hasCock()) sBust += "_VAG";
		if(seraAtTavros())
		{
			sBust += "_MOM";
			nude = false;
		}
	}
	if(nude) sBust += "_NUDE";
	
	return sBust;
}

// Boost Sera's raunchiness.
public function seraLustGain(minPassed:int = 60):void
{
	chars["SERA"].lust(Math.round(minPassed / 30));
	if(chars["SERA"].ballFullness < 100) chars["SERA"].ballFullness += (1.5 * minPassed);
	if(chars["SERA"].ballFullness > 100) chars["SERA"].ballFullness = 100;
	if(chars["SERA"].lust() >= 100) chars["SERA"].minutesSinceCum += minPassed;
}
public function serasBodyIsReady():void
{
	chars["SERA"].maxOutLust();
	chars["SERA"].ballFullness = 100;
	chars["SERA"].cumQualityRaw = 1;
	//chars["SERA"].minutesSinceCum = 9000;
}

public function seraBonusFunction():Boolean
{
	flags["NAV_DISABLED"] = undefined;
	
	if(seraRecruited())
	{
		mods4UChrysalisBonus();
		return false;
	}
	if(flags["SERA_ACQUIRED_DATE"] != undefined && (GetGameTimestamp() - flags["SERA_ACQUIRED_DATE"] > 180))
	{
		seraIsRepoed();
		return true;
	}
	
	output("The interior of this shop is difficult to make out thanks to a combination of dim lighting and a smoky haze that smells vaguely of walnuts. Looking around, you manage to locate the source of the illumination - four custom glowbulbs pumping out an unnatural-looking blue-black aura. The walls are covered in shelves with dozens of perverted-looking nicknames, many of them demonic in theme, and the lone counter in the back of the store is similarly decorated.");
	
	if(flags["MET_SERA"] == undefined)
	{
		approachSera();
		return true;
	}
	else
	{
		if(flags["SERA_INCH_STEAL"] != undefined && ((flags["SERA_INCH_STEAL"] > 0 && flags["SERA_CREATE_VAG"] != undefined) || flags["SERA_INCH_STEAL"] >= 5) && !pc.hasStatusEffect("Sera's TailCock Cooldown") && rand(2) == 0)
		{
			showSera();
			output("\n\nSomething is off...");
			output("\n\nSera seems to be quite furious, her bosom heaving with labored breathing and sweat, almost certainly from having a shouting match like no other. She lays eyes on you, and makes a visible effort to calm herself. Through gritted teeth, she says <i>“Come. Here.”</i>");
			addButton(0, "Sera", seraInchStealingAintEasy, true);
			return false;
		}
		else if(flags["SERA_BREED_TIMER"] != undefined && (flags["SERA_BREED_TIMER"] + (24 * 60)) <= GetGameTimestamp())
		{
			return seraBreedingApproach();
		}
		else if(seraSpawnPregnancyBlurbs(pcSeraPregDays()))
		{
			showBust("SERA");
			return true;
		}
		//Halloween sub fun!
		else if(isHalloweenish() && pc.breastRows[0].breastRating() >= 1 && seraIsMistress() && flags["SERA_HALLOWEEN_HELPED"] == undefined && flags["SERA_HALLOWEEN_LOCKED"] == undefined)
		{
			seraTrickOrTreatEventIntro();
			return true;
		}
		//Repeat the halloween fun afterward :3
		else if(pc.breastRows[0].breastRating() >= 1 && seraIsMistress() && flags["SERA_HALLOWEEN_HELPED"] != undefined && rand(20) == 0)
		{
			seraTrickOrTreatEventIntro();
			return true;
		}
		else if(flags["SERA_TRIPLE_X_RATED"] != undefined && flags["SERA_TRIPLE_X_RATED"] > 0)
		{
			showBust("SERA");
			output("\n\nLounging over her counter, Sera’s scowl transforms into a wide, gleeful leer when you come in. She casually droops her thick cock across the black surface, brushes a nipple, and waits.");
		}
		else
		{
			showBust("SERA");
			output("\n\nSera is slouching at her countertop, looking rather bored. The mess she made when you first met her has since been cleaned up. Her bright eyes flick your way, but she doesn’t say a word just yet, waiting for you to approach her.");
		}
		addButton(0, "Sera", approachSera);
		
		if (saendraAtDarkChrysalis())
		{
			darkChrysalisSaendraInject();
			addButton(1, "Saendra", saendraTalkInDC);
		}
	}
	return false;
}

//Actual Intro Stuff
public function approachSera():void
{
	if(seraSpawnPregnancyApproach(pcSeraPregDays()))
	{
		seraMenu();
		return;
	}
	if(flags["MET_SERA"] == undefined)
	{
		showSera();
		flags["MET_SERA"] = 1;
		output("\n\nA ceramic trinket shaped like two fornicating imps goes flying by your shoulder to shatter above the doorframe, exploding into a storm of shimmering fragments. You duck aside of the debris and come up, eyes alert and searching.");
		output("\n\nThere’s a demon in this shop! ...And she’s naked? She’s standing between you and the counter, one clawed hand empty while the other hurls a vase into the back wall. The motion makes her tits sway pendulously. A half-erect phallus swings free between the tainted female’s thighs, nicely framing her visible netherlips. A complicated glowing harness encircles her form, shaping and curving her body into a classical hourglass form.");
		output("\n\n<i>“That fat... fucking... furry... WHORE!”</i> she screams, spinning to regard you. Her eyes are like pools of onyx around glowing amber orbs. Somehow, she manages to look threatening as she stalks forward on six-inch heels, a spaded tail whipping back and forth behind her. Nails that seem more like two inch claws close over your shoulders as she grabs hold of you. <i>“SHE STOLE MY SALE!”</i>");
		//Nice
		if(pc.isNice()) output("\n\nYou do your best to disentangle yourself without upsetting this creature any further. The last thing you need is to be assaulted by a creature out of fantasy.");
		//Mischievous
		else if(pc.isMischievous()) output("\n\nYou slyly slip free of her grip, careful to avoid cutting yourself on her razor-sharp claws. The last thing you need is a brawl with a succubus. Violence is wasted on such an alluring creature.");
		//Hard
		else output("\n\nYou push her arms off of you without a care. If she wants to get violent, you’ll drop her, but you certainly don’t feel like letting her shake you while she has her tantrum.");
		output("\n\nTurning away, the demon kicks her way past a half-dozen other broken knick-knacks to get to her counter. She slumps down on her countertop and exhales, drumming her fingers. <i>“Look, I’m sure you don’t care about any of that. Is there a mod you want? A big fat dick? Maybe some titties that the boys... or girls... will love?”</i> The fickle woman grins. <i>“The name’s Sera, and this is my shop: The Dark Chrysalis.”</i>");
		output("\n\nYou make a mental note not to steal any of her sales. What will you do in Sera’s shop?");
	}
	//Repeat Approach
	else
	{
		clearOutput();
		showSera();
		if(flags["SERA_NO_SEX"] == 1)
		{
			output("Sera glares at you and her expression quickly sours. The demoness doesn’t seem too thrilled about your presence.");
			output("\n\nHer piercing eyes peer into your soul as she asks, <i>“What the do you want this time?”</i>");
		}
		else if(seraIsMistress())
		{
			output("Sera leans over the counter, extends her index claw and presses it against your throat. She gently scratches it up to the bottom of your chin.");
			output("\n\n<i>“Mine,”</i> she says simply, smiling lazily.");
		}
		else
		{
			output("Sera leers openly at you, but her gaze quickly sours. The demoness is looking out the door at her competitor’s shop and scowling. <i>“You better buy something.”</i>");
			//Not yet talked about her being PO'ed
			if(flags["SERA_TALKED_ABOUT_BEING_PISSED_OFF"] == undefined) output("\n\nShe looks back and smiles knowingly. <i>“I knew you’d be back for some splices. What’ll it be? Something to make you bigger? Smaller? Give you four cocks?”</i>");
			//Talked about her being pissed
			else output("\n\nShe leans over, pressing her bare breasts into the counter and extends her index finger, placing it against your throat. She gently scratches it up to the bottom of your chin. <i>“Perhaps you just came here to get tamed in the bedroom?”</i> Sera giggles uncharacteristically.");
		}
		output("\n\nWhat are you here for?");
	}
	//Menu Options
	//[Appearance] [Mods] [Sex] [Pissed Off?]
	seraMenu();
}

public function seraMenu(toLeave:Boolean = false):void
{
	seraStoreSetup();
	
	clearMenu();
	addButton(0,"Appearance",seraAppearance);
	addButton(1,"Buy",buyItem);
	addButton(2,"Sell",seraSellCheck);
	if(flags["SERA_TALKED_ABOUT_BEING_PISSED_OFF"] == undefined)
	{
		addButton(3,"WhySoMad?",talkToSeraAboutWhyShesPissedOff);
		addDisabledButton(5,"Sex");
	}
	else if(pc.hasStatusEffect("Sera No Sex Cooldown") || flags["SERA_NO_SEX"] == 1 || (flags["SERA_NO_SEX"] == -1 && pc.hasCock() && pc.biggestCockLength() >= 12))
	{
		if(flags["SERA_NO_SEX"] == -1)
		{
			if(flags["SERA_TRIPLE_X_RATED"] > 0) addDisabledButton(3,"Talk","Talk","Sera doesn’t want to be seen talking to those who try to outdo her - Shrink your dick down to size before trying this!");
			addDisabledButton(5,"Sex","Sex","You’ve agreed to shrink your dick before trying this again!");
		}
		else if(pc.hasStatusEffect("Sera No Sex Cooldown"))
		{
			if(flags["SERA_TRIPLE_X_RATED"] > 0) addDisabledButton(3,"Talk","Talk","Sera doesn’t seem to be available to talk about anything at the moment.");
			addDisabledButton(5,"Sex","Sex","Sera doesn’t seem to be in the mood for sex at the moment. Maybe try back later.");
		}
		else
		{
			if(flags["SERA_TRIPLE_X_RATED"] > 0) addDisabledButton(3,"Talk","Talk","Sera doesn’t seem to be interested in having a conversation with you anymore.");
			addDisabledButton(5,"Sex","Sex","Sera doesn’t seem to be interested in having sex from you anymore.");
		}
	}
	else
	{
		if(flags["SERA_TRIPLE_X_RATED"] > 0)
		{
			addButton(3,"Talk",talkToSera);
			if(pc.statusEffectv1("Sera Breed No Sex") == 1) addDisabledButton(5, "Sex", "Sex", "You’ve convinced your mistress that she’d breed with you, so casual sex is probably out of the question...");
			else if(pc.hasVagina() && pc.isFullyWombPregnant() && pc.hasStatusEffect("Sera Breed No Sex")) addDisabledButton(5, "Sex", "Sex", "You are too pregnant for this!");
			else addButton(5,"Sex?",seraSexMenu,true,"Sex?","Ask your mistress if you are allowed to have sex with her.");
		}
		else addButton(5,"Sex?",seraSexMenu,true);
	}
	// If PC has unlocked one or all, option removed
	if(!seraSexXXXTFModsCheck() && flags["PURCHASED_FROM_SERA"] != undefined) addButton(6, "TFs?", seraSexXXXTFModsAsk, undefined, "Specialist Mods?", "Ask Sera about any other mods she might have on sale.");
	
	// Salary added to main menu
	if(flags["SERA_PARTY_INVITE"] >= 4)
	{
		// Becomes un-ghosted every seven days
		if((flags["SERA_SALARY_DATE"] + (7 * 24 * 60)) < GetGameTimestamp())
		{
			if(flags["SERA_SALARY_PAID"] == undefined) addButton(7, "Salary", seraGetSalary, undefined, "Salary", "Ask Sera about your weekly salary.");
			else addButton(7, "Salary", seraGetSalary, undefined, "Salary", "Collect your salary for the week.");
		}
		else
		{
			if(flags["SERA_SALARY_PAID"] == undefined) addDisabledButton(7, "Salary", "Salary", "You should probably wait until Sera earns enough before trying this.");
			else addDisabledButton(7, "Salary", "Salary", "You’ve already collected your salary for the week.");
		}
	}
	
	if(toLeave) addButton(14, "Leave", move, rooms[currentLocation].westExit);
	else addButton(14,"Back",mainGameMenu);
}

public function chrysalisInventory():Array
{
	var inventory:Array = [];
	
	inventory.push(new TerranTreats());
	inventory.push(new Estrobloom());
	inventory.push(new Tittyblossom());
	inventory.push(new Pussybloom());
	inventory.push(new Pussyblossom());
	inventory.push(new ManUp());
	inventory.push(new ManDown());
	inventory.push(new Condensol());
	inventory.push(new DendroGro());
	inventory.push(new Rainbotox());
	inventory.push(new Chocolac());
	inventory.push(new SweetTreat()); // 9999 - Temporary
	
	return inventory;
}
public function seraStoreSetup():void 
{
	chars["SERA"].keeperBuy = "While you’re accessing the shopping terminal, Sera produces a file and goes to work on her nails to keep them honed to a razor-like sharpness. You suppose there’s not much for her to do while she waits on you to make a purchase.\n";
	
	chars["SERA"].inventory = chrysalisInventory();
	
	// Galo
	if(flags["ZODEE_GALOQUEST"] != undefined && flags["PURCHASED_SERAS_GALO"] == undefined)
	{
		chars["SERA"].inventory.push(new GaloMax());
	}
	// XXX-Rated
	if(flags["SERA_UNLOCK_CLIPPEX"] != undefined)
	{
		chars["SERA"].inventory.push(new Clippex());
	}
	if(flags["SERA_UNLOCK_SEMENS"] != undefined)
	{
		chars["SERA"].inventory.push(new SemensFriend());
	}
	if(flags["SERA_UNLOCK_LUCIFIER"] != undefined)
	{
		chars["SERA"].inventory.push(new Lucifier());
	}
	// Other
	if(CodexManager.entryUnlocked("Muffstick"))
	{
		chars["SERA"].inventory.push(new Muffstick());
	}
	
	shopkeep = chars["SERA"];
}

//Sell Routing
public function seraInDebt():Boolean
{
	if(flags["SERA_PARTY_INVITE"] != undefined && flags["SERA_PARTY_INVITE"] >= 4) return false;
	if(flags["SERA_REPAID_LOAN"] != undefined) return false;
	if(flags["SERA_BUSINESS_SETUP"] != undefined && (days - flags["SERA_BUSINESS_SETUP"] >= 365)) return false;
	return true;
}
public function seraDebtCheck():Boolean
{
	if(pc.statusEffectv1("Sera Credit Debt") > 9000)
	{
		clearOutput();
		showSera();
		
		var timeLeft:int = pc.getStatusMinutes("Sera Credit Debt");
		
		output("You ask the demoness if she would be willing to purchase any of your items.");
		output("\n\nSera looks at you a moment and flips open her sales terminal, taking a quick glance at her numbers for the week. <i>“Umm, how about... no.”</i>");
		output("\n\nYou give her a disapproving look.");
		if(!seraRecruited())
		{
			output("\n\n<i>“Hey, I don’t know how it is on </i>your<i> star in the galaxy, but in the world I live in: if I don’t have the cash, I can’t buy your junk.”</i> She gives a knowing scoff. <i>“Are you </i>trying<i> to run me under? I have a business to run here - I’m not a bank!”</i>");
		}
		else
		{
			output("\n\n<i>“No more unloading your shit on me for a while now,”</i> Sera warns. <i>“I may be out of debt now, but this is still a business, not a charity shop.”</i>");
		}
		output("\n\nYou try to interject, but she answers your response with her own. <i>“Look, money is tight here, so give me...");
		if(timeLeft >= (5 * 24 * 60)) output(" about a week or so from now");
		else if(timeLeft >= (3 * 24 * 60)) output(" a few days or so from now");
		else if(timeLeft >= (2 * 24 * 60)) output(" a couple more days");
		else if(timeLeft >= (12 * 60)) output(" until tomorrow");
		else output(" some more hours until my account clears");
		output(" and then ask again, okay?”</i> After recomposing herself, she continues with a forced grin, <i>“In the meantime, if you have some expendable " + (isAprilFools() ? "dogecoins" : "credit chits") + ", feel free to browse my </i>lovely<i> inventory....”</i>");
		
		processTime(2);
		clearMenu();
		addButton(0, "Buy", buyItem);
		addButton(14, "Never Mind", shop, shopkeep);
		return true;
	}
	return false;
}
public function seraSellCheck():void
{
	shopkeep = chars["SERA"];
	chars["SERA"].keeperSell = "You ask the demon-lady if she would be willing to purchase any of your items.";
	chars["SERA"].keeperSell += "\n\n";
	if(pc.statusEffectv1("Sera Credit Debt") > 3000) chars["SERA"].keeperSell += "Sera winces a bit and looks at you. ";
	chars["SERA"].keeperSell += "<i>“Sure, I’ll buy any resellable drugs you might have - but I’m not made of money so don’t think I’ll be buying from you willy-nilly like some other shopkeepers. Debt’s a fucking bitch, you hear?”</i>";
	chars["SERA"].keeperSell += "\n\nWhat would you like to sell?\n";
	sellItem();
}
//Appearance
public function seraAppearance():void
{
	clearOutput();
	showSera();
	
	if(!chars["SERA"].hasCock() || chars["SERA"].skinTone == "bright pink") output("Despite the modifications you’ve given her, Sera continues to look more like a six-foot, one inch tall demon than anything else.");
	else output("Sera looks like a six-foot, one inch tall demon more than anything else.");
	output(" A set of ridged horns, glowing with phosphorescent luminescence, curl outwards from her forehead.");
	if(chars["SERA"].skinTone == "bright pink") output(" Her skin is a bright, girly pink, accentuating her femininity.");
	else output(" Additionally, her skin is a mild purple that only serves to further her unholy air.");
	output(" Black sclera ring her golden, glowing irises, split by lizard-like pupils. Above them, a row of gleaming, metal piercings line her brow. Her slightly upturned nose is unremarkable, aside from the single stud in her left nostril. Pale blue hair cascades around her visage like fine silk tapestries arranged to tastefully frame her face.");
	if(seraRecruited()) output("\n\nA silver slave collar rings her neck, complete with an innocuous lead hasp at the back; a tasteful, permanent reminder of her status. Ornamental pentagonal plates grow out of her shoulders. Matching, blue-glowing bracers and armbands complete her ensemble, but your eyes spend little time looking at her outfit when it frames her other assets so exquisitely.");
	else output("\n\nA choker of black-lined, blue-glowing conduits rings her neck, matched on her torso by a sable corset dotted by hard metal and glowing, technological baubles. Pentagonal plates have grown out of her shoulders, though you cannot tell if they exist as armor or ornamentation. Matching, blue-glowing bracers and armbands complete her ensemble, but your eyes spend little time looking at her outfit when it frames her other assets so beautifully.");
	output("\n\nBig breasts that would easily fill an EE-cup bra and then some sit high and proud on her chest, obviously the result of some kind of artificial or biological enhancement. They’re nicely rounded and capped with a pair of " + chars["SERA"].nippleColor + " nipples that are ever so slightly pebbled in the");
	if(seraRecruited()) output(" open");
	else output(" air-conditioned station");
	output(" air. They’re the kind of boobs that just beg to be fondled");
	if(flags["SERA_PREGNANCY_TIMER"] >= 200) output(", an impression heightened by the fact they are now heavy and swollen with milk, her " + (chars["SERA"].skinTone != "bright pink" ? "navy" : "magenta") + " areola spreading.");
	else if(!seraRecruited()) output(", and Sera’s open display of them shows just how much she knows it");
	output(".");
	output("\n\n");
	if(chars["SERA"].hasCock()) output("A foot-long cock, maybe a bit longer, dangles down between her toned thighs, backed up by a pair of balls that sit on the upper end of the terran norm when it comes to size. ");
	output("Sera’s ass is nothing to sneeze at either; it’s large, nicely rounded, and crowned with a prehensile, spaded tail.");
	if(seraRecruited()) output(" The spade at the end seems a little big and bulgy, reminiscent of a cock head.");
	else output(" She spanks a cheek with it when she catches you looking, sending a kinetic ripple across her crack. At the same time, the spade at the end seems a little bigger and bulgier, perhaps engorged by the contact.");
	
	if(flags["SERA_PREGNANCY_TIMER"] >= 30)
	{
		output("\n\n");
		if(flags["SERA_PREGNANCY_TIMER"] <= 90) output("Her taut belly seems very smooth yet a little curved.");
		else if(flags["SERA_PREGNANCY_TIMER"] <= 160) output("Her usually-taut belly has taken on a slight curve. On her exquisitely crafted body, it stands out more than it ordinarily would.");
		else if(flags["SERA_PREGNANCY_TIMER"] <= 210) output("She’s touting a fair-sized baby bump, her belly swollen with growing pregnancy. It looks odd upon a sex demon, and the fact she keeps touching it suggests she’s very aware of that.");
		else if(flags["SERA_PREGNANCY_TIMER"] <= 251) output("Sera has grown into her pregnancy, her hips and boobs widening to accommodate her beachball of a belly, and she doesn’t look quite as strange as she did. Perhaps as a result there’s a calmer, more accepting air to her; she waddles around with an almost proud, aloof air.");
		else output("She looks just about ready to pop, the curve of her belly protruding way out in front of her, milk-swollen boobs resting on top. The demon-morph is flushed and rather moody looking, evidently unhappy about having to sit down every two dozen steps or so.");
	}
	
	if(seraRecruited())
	{
		output("\n\nSilk fishnets and garters join her technological-looking frilly corset to her shapely legs. Her feet are perched upon toe-covering, six-inch stilettos, but when she walks in them it’s as if it’s the most natural thing in the world, perhaps counterbalanced by her tail.");
		output("\n\n<b>");
		if(chars["SERA"].lust() < 33) output("She eyes you with an insolent smirk, completely relaxed.");
		else if(chars["SERA"].lust() < 66) output("She seems slightly on edge; her tail flicks this way and that fretfully, and her slit eyes dart around the room, distracted.");
		else output("She looks flushed. She bites her lip and drums her fingers on her thigh with an air of frustration. When you affect to look away from her you can see her touch her erect nipples impulsively in the corner of your eye. It’s obvious she’s currently very pent up and aroused.");
		output("</b>");
	}
	else
	{
		output("\n\nStrappy thigh-highs and garters join her technological-looking corset to her shapely legs. Her feet are perched upon toe-covering, six-inch platform heels, but she walks in them as if it were the most natural thing in the world, perhaps counterbalanced by the tail you noticed earlier");
		if(flags["SERA_STUCK_IT_ALL_IN_BUTT"] > 0 || flags["SERA_TIT_FUCK_LUCKY_DIP"] > 0) output("--or because of the jag of gleaming, navy horn you know she’s got growing down from each heel, natural and rather alarming demonic stilettos");
		output(".");
		output("\n\nAll in all, Sera appears to be the kind of woman who enjoys everything sexuality has to offer and pursues it aggressively.");
	}
	
	processTime(1);
	
	clearMenu();
	if(seraRecruited()) addButton(0,"Next",approachServantSera);
	else addButton(0,"Next",approachSera);
}

//Why Is Sera Pissed Off?
public function talkToSeraAboutWhyShesPissedOff():void
{
	clearOutput();
	showSera();
	flags["SERA_TALKED_ABOUT_BEING_PISSED_OFF"] = 1;
	output("You ask, <i>“So what got you so pissed off at your neighbor?”</i>");
	output("\n\nSera rolls her eyes as if it were obvious. <i>“Well, this short little green guy was in here looking for some male enhancement, and he’s loaded, right?”</i> She gestures towards her terminal. <i>“I’ve got this custom mod all lined up that would be exactly what he wants. Literally perfect. It’s a horse-cock so big that it’s practically a cum cannon, okay? And this is a mod that’s one shot guaranteed - it always delivers as advertised.”</i> Her hand curls up and makes masturbating motions. <i>“He’d love it, but he wants to shop around.”</i>");
	output("\n\nYou nod. <i>“What happened?”</i>");
	output("\n\n<i>“That panda bitch sold him some junky furrification shit!”</i> Sera screams. <i>“She talked him into getting some cheap horse-mod that might not even work, and it might even give him a fucking muzzle.”</i> She gestures with her hands. <i>“Long face and all. Those things are only a grand tops, though. Of course, he bought one and got a stallion cock on the first try. So Jade makes another couple credits, and I get robbed of a sale that could pay the rent on this place for a year.”</i> Sera snarls and slams her fist down on the countertop. <i>“He had the nerve to come in here, slap me in the thigh with it, call me a rip-off artist, and flutter out on those little wings of his.”</i>");
	output("\n\nThe bare-chested demoness sighs. <i>“So that’s what’s bothering me. I missed out on a huge sale, and somewhere on station, a sap who got lucky is telling everyone that my mods are a waste of money. Odds are that he should’ve wound up looking like an ass from those splices.”</i>");
	output("\n\nYour only response is to mutter, <i>“Damn....”</i>");
	output("\n\nSera smiles wryly. <i>“Yeah. Anyway, sorry I almost brained you with a sculpture on your way in.”</i> She looks you up and down once more. <i>“Ehh, you would’ve been fine anyway. I’ll have to throw a little harder if you ever torque me off.”</i> The smile she flashes you looks more like she’s baring her teeth at you. <i>“Now, what can I do for you?”</i>");
	
	processTime(3);
	//Toggle scene off, show menu.
	seraMenu();
}

// Talk
public function talkToSera():void
{
	// Requires: PC has used every talk option, has activated threesome at least once, select talk
	if(flags["SERA_TALKS_PAST"] != undefined && flags["SERA_TALKS_PRESENT"] != undefined && flags["SERA_TALKS_DEMONS"] != undefined && flags["SERA_TALKS_FURRIES"] != undefined && flags["SERA_IN_JARDI_THREESOME"] > 0 && flags["SERA_PARTY_INVITE"] == undefined)
	{
		// Party Invite
		seraSexPartyIntro();
		return;
	}
	
	clearOutput();
	author("Nonesuch");
	showSera();
	
	output("You ask if it’s alright to just talk.");
	output("\n\n<i>“It’s cheap,”</i> she replies. She leans back on her chair and gazes at you sidelong. <i>“What’s on your pretty little mind?”</i>");
	
	seraTalkMenu();
}
public function seraTalkMenu():void
{
	if(seraRecruited())
	{
		seraBitcheningTalkMenu();
		return;
	}
	
	clearMenu();
	// [Early life] [Recent life] [Demons] [Furries]
	addButton(0, "Early Life", seraTalkTopics, "early life");
	addButton(1, "Recent Life", seraTalkTopics, "recent life");
	addButton(2, "Demons", seraTalkTopics, "demons");
	addButton(3, "Furries", seraTalkTopics, "furries");
	if(flags["SERA_PARTY_INVITE"] < 1) addButton(4, "Party", seraSexPartyIntro, "party", "Party", "Follow up with Sera’s invitation.");
	else if(flags["SERA_PARTY_INVITE"] == 2) addButton(4, "Party?", seraSexPartyConclusion, undefined, "Party?", "Ask Sera how she thinks the networking went.");
	
	// [Breed?]
	// Unlocks in talk options after PC has used sex option once, and has at least used the "early life" and "recent life", and has a vagina
	if((flags["SERA_COCK_STEELE_VAG"] != undefined || fuckedSeraBefore()) && flags["SERA_TALKS_PAST"] != undefined && flags["SERA_TALKS_PRESENT"] != undefined)
	{
		if(!pc.hasVagina()) addDisabledButton(5, "Breed?", "Breed?", "You’ll probably need a vagina before asking for this...");
		// [Priapin]
		// If Priapin in inventory and PC has activated initial [Breed] scene, add [Priapin] option to initial sex "beg" screen
		else if(flags["SERA_TIMES_BRED"] != undefined)
		{
			if(pc.hasItemByClass(Priapin)) addButton(5, "Priapin", seraPriapinAction, "intro", "Breed Using Priapin", "You brought the fireworks this time.");
			else addDisabledButton(5, "Priapin", "Breed Using Priapin", "You need a Priapin medipen in order to breed with her again.");
		}
		else if(pc.hasStatusEffect("Sera Talk Breed")) addDisabledButton(5, "Breed", "Breed", "You’ve already tried this! Give her some time off the topic, then try again later.");
		else addButton(5, "Breed?", seraBreedingIntro, undefined, "Breed?", "Would she be interested in knocking you up? Test the waters.");
	}
	
	addButton(14, "Back", seraMenu);
}
public function seraTalkTopics(response:String = ""):void
{
	clearOutput();
	author("Nonesuch");
	showSera();
	
	switch(response)
	{
		case "early life":
			output("You ask where she came from.");
			output("\n\n<i>“Earth, believe it or not,”</i> the tall succubus says. <i>“Terra Firma itself. Can be a pretty shitty place if you aren’t well off, but my parents were. Well off enough to send me to an all-girl Church of the One school, anyway. Think I can still do a Hail Marianne.”</i>");
			output("\n\n<i>“You’re religious?”</i>");
			output("\n\n<i>“What do you think?”</i> she sneers, displaying her sharp teeth at you, her horns gently glowing green. <i>“Look, I don’t care what you or anyone else believes. Ol’ fossil-planting sky magician ain’t got nothing on the illusions some people live under. But I " + (!seraRecruited() ? "hate - HATE" : "hated - HATED") + " – people telling me what to do and think, and that’s all that organized religion is.”</i>");
			output("\n\nShe pauses.");
			output("\n\n<i>“I did like some of the imagery, though. In the old scripture. Sin, and temptation, and - the concept of a fall from grace resulting in new, dirty knowledge and ideas and above all </i>power<i>. Yeah, I liked that a lot.”</i> She drums her fingers on the " + (!seraRecruited() ? "counter" : "sheets") + " and sighs. <i>“But apart from that, fucking hated it. Everything I’ve ever done has been about getting away from my upbringing. The rules, the rosaries, the bible lessons, what you were supposed to think about them rather than what you actually did, my mom making me eat cigarettes, the uptight biddies who ran the place, the fucking uniform...”</i>");
			output("\n\nYou can’t help but " + ((!pc.isBimbo() && !pc.isNice()) ? "snicker" : "giggle") + " to yourself as a thought occurs. Several parts of Sera glow at you balefully.");
			if(!seraRecruited()) output("\n\n<i>“Laugh it up,”</i> she growls. <i>“That image you’ve got in your head right now? The white blouse, school skirt and pigtails? That’s you, next time we fuck.”</i>");
			else output("\n\n<i>“Don’t even f- flipping well think about it,”</i> she snarls.");
			processTime(5);
			flags["SERA_TALKS_PAST"] = 1;
			seraTalkMenu();
			addDisabledButton(0,"Early Life");
			break;
		case "recent life":
			output("You ask how she came to be on " + (!seraRecruited() ? "the s" : "Tavros S") + "tation.");
			output("\n\n<i>“I had to get away from Earth,”</i> she says. <i>“Away from my parents. My dad used to stage interventions. Fly out to wherever I was bunking, and drive me back to their big clean house in their big clean suburb. Every time was a new page turned, a new 12 step plan of how I was going to become a clean-living productive member of society, and hopefully in due course a submissive housewife to a coke snorting businessman strung out on Mayjay, just like my mom.”</i>");
			output("\n\nThe demon girl laughs, almost sounding nostalgic.");
			output("\n\n<i>“I used to get calls from her, every month. ‘You aren’t still smoking dear? Have you found yourself a job? How about a nice boy, dear?’ Why yes mother I’ve found a couple of nice boys in fact, I’m holding their leashes right now.”</i> She cackles to herself, and sighs. <i>“They forced me to do the business course. They did do that. And with that, and my own savings, I came out here when the frontier rush began, and set up " + (!seraRecruited() ? "this place" : "the Chrysalis") + ".”</i>");
			output("\n\n<i>“Did you use your family’s money to do it?”</i> you ask. Sera’s eyes narrow.");
			output("\n\n<i>“Hell fucking no,”</i> she spits. <i>“Here’s a life lesson for you, " + (!seraRecruited() ? "pet" : "[pc.master]") + ": the richer a man is, the more tight-fisted he becomes. My dad would never have allowed me to own a place like this, and even if he did he’d know exactly where I was, and he’d have his thumb on me at all times. I did " + (!seraRecruited() ? "this" : "it") + " all with my money, and with loans." + (!seraRecruited() ? "" : " And I don’t care... I don’t fucking well care...") + "”</i>");
			if(!seraRecruited())
			{
				output("\n\nYou think about bringing up your own dad, but decide that would probably be a bad idea right now. Instead, you ask if she misses Earth.");
				output("\n\n<i>“Sometimes,”</i> she admits. She toys with a dreamcatcher’s dangling phalluses, set near her chair. <i>“It’s still a wonderful world, though you don’t really realize that until you’ve been to a few others. And it was a bit of a wrench leaving all my bitches behind. But even there I think I needed a fresh start, and it’s not so hard to find new ones. You don’t even need to look. You display what you are and adopt the right attitude, they come to you.”</i> She grins at you, pleased and possessive.");
			}
			else
			{
				output("\n\nHer eyes swim slightly.");
				output("\n\n<i>“...I don’t care,”</i> she repeats, once she’s taken a deep breath, <i>“that this is pretty much exactly what dad said would happen. It might have been a colossal fuck up, but it was </i>my<i> colossal fuck up. I would rather be here");
				if(pc.hasCock()) output(" sucking dick");
				else if(pc.hasVagina()) output(" being force-fed pussy");
				else output(" kneeling for sex");
				output(" than in a Dark Chrysalis owned by him.”</i> She looks you in the eye defiantly. <i>“That’s the truth.”</i>");
				output("\n\nYou think about saying something about her language, but ultimately decide that might be a bit cruel");
				if(pc.isAss()) output(" even for you");
				output(". Instead, you ask if she misses Earth.");
				output("\n\n<i>“Sometimes,”</i> the demon-morph admits. She absentmindedly draws patterns on the sheets with a claw. <i>“It’s still a wonderful world, though you don’t really realize that until you’ve been to a few others. And it was a bit of a wrench leaving all my bitches behind. But even there I think I needed a fresh start, and it’s not so hard to find new ones.”</i>");
				output("\n\n<i>“It isn’t,”</i> you agree. <i>“Got to pay good credits for the really juicy ones, though.”</i>");
				output("\n\n<i>“You’re such an assh- asinine person,”</i> she snaps, though she’s sporting a small grin as she says it.");
			}
			processTime(6);
			flags["SERA_TALKS_PRESENT"] = 1;
			seraTalkMenu();
			addDisabledButton(1,"Recent Life");
			break;
		case "demons":
			output("You ask how she came to look the way she does.");
			output("\n\n<i>“It wasn’t easy,”</i> Sera says, her cerulean lips curling into a smile, your question clearly pleasing her. <i>“It began with penis envy, pure and simple. Coming of age in an all-girl’s religious school – you know how many of them I wanted to bang? All that uptightness, all that starch, all those things you weren’t allowed to talk about, with no release to it all, goddamn... every time a classmate started to fret about something like the font of the school magazine, I just wanted to bend her over my table and make her think about nothing but how good it is to get royally rammed for the rest of the day. And eventually, fingers weren’t enough. So I sold my jet-bike, and used the money for a mod.”</i>");
			if(chars["SERA"].hasCock()) output(" She slides her hand along her veiny shaft fondly.");
			else output(" She smiles in fond, poignant memory.");
			output("\n\n<i>“Wasn’t as big as " + (chars["SERA"].hasCock() ? "this" : "it got to be") + " then. But it was big enough to make me the most popular girl in the final year. Even the cliquesters and girls who took the One thing seriously, who’d call me a slut or Satan’s bitch in the corridor... they’d come. And come. And come. That was the best, when they did. When I made them say my name. Almost made up for the rest of my childhood, that did.”</i> She sighs blissfully" + (chars["SERA"].hasCock() ? ", turgid with memory" : "") + ".");
			output("\n\n<i>“And the demon stuff?”</i> you supply.");
			output("\n\n<i>“Hmm? Well, after that it became a bit of an obsession. I loved biblical imagery, and I loved that feeling I had in that final year, of being an irresistible corruptive influence... the fact that it wound my parents up to no end was just a pleasing side-effect. If they’d known I would grow horns by the time I was twenty, maybe they wouldn’t have blown a gasket quite so hard when I got a piercing at fifteen. Fortunately many other people had the same urges as me long ago, so finding demon mods wasn’t hard. Refining it, though, becoming exactly what I wanted... that was difficult.”</i> She thins her lips, absently touching the pale glow on her ivory horns.");
			output("\n\n<i>“You’ve got to be so careful, dosing yourself with mods, getting exactly the effect you need. First time I took the phosphorous mod I ended up glowing on my tits and back too – took me forever to find something that reversed it just enough for it to stay on my horns. And Lucifier was only a temp-mod back then, so I had to hit the right combo of incubus and succubus boosters so that I kept a body to die for whilst growing out a nice, big dick. Tough. And expensive.”</i> She pauses for a moment, introspective.");
			if(silly)
			{
				output("\n\n<i>“You could have just save scummed,”</i> you murmur.");
				output("\n\n<i>“You what?”</i> You shake your head, grinning it away. She glares at you suspiciously for a moment longer before continuing.");
			}
			output("\n\n<i>“Once that was right, I got Permaperk – keeps your ass and tits up where they belong.”</i> She jumps in her " + (!seraRecruited() ? "seat" : "bed") + ", allowing her big, impossibly pert breasts to bounce and palpitate mesmerically. <i>“Always sold separately to the boob boosters, just to make you pay twice. Finally, I invested in this.”</i> She touches the metal harness which curls around her frame. <i>“Fucking hard to maintain as perfect a body as this once you’ve got it. This does the work for me – keeps my gene mods in balance, whittles off fat molecules and puts them where they belong. Pricey as hell, but worth it. I");
			if(!seraRecruited()) output(" gotta advertise this shop");
			else if(flags["SERA_MERCHANT"] != undefined) output(" gotta advertise my business");
			else output(" had to advertise my shop");
			output(" through myself, after all.”</i>");
			if(!seraRecruited())
			{
				output("\n\nYou’ve listened to all this with a growing sense of disquiet.");
				output("\n\n<i>“How badly are you in debt?”</i> you say quietly. The pleased smile runs right off Sera’s face.");
				output("\n\n<i>“That’s none of your business,”</i> she answers tersely. <i>“You are my fuck toy, not accountant. But just so we’re clear, I am fine. So long as this shop is a success. And it will be.”</i>");
				output("\n\nYou may have gained an insight into why she hates Fur Effect so much.");
			}
			else
			{
				output("\n\n<i>“No wonder you wound up in so much debt!”</i> you exclaim, shaking your head.");
				output("\n\n<i>“And you’re the benefactor of it all, aren’t you?”</i> she shoots back. <i>“Alright, so now I’m someone’s pet slut. I still look like what I always dreamed of, how I feel inside.");
				if(!chars["SERA"].hasCock() || chars["SERA"].skinTone == "bright pink")
				{
					output(" Your totally stupid modifications aside.”</i>");
					output("\n\n<i>“You look way cuter");
					if(chars["SERA"].skinTone == "bright pink") output(" in pink");
					if(!chars["SERA"].hasCock() && chars["SERA"].skinTone == "bright pink") output(" and");
					if(!chars["SERA"].hasCock()) output(" without that big ugly dick");
					output(",”</i> you assert. <i>“And it suits you a lot better for where you are now.”</i>");
					output("\n\nShe doesn’t have a response to this, except to look sullen and blush.");
				}
				else
				{
					output(" Once my term with you is over, I will still have that.”</i>");
					output("\n\n<i>“If,”</i> you point out, <i>“I don’t decide to modify you to suit my own tastes before then. Terms of the contract allow it.”</i>");
					output("\n\nShe doesn’t have a response to this, except to look sullen and blush.");
				}
			}
			processTime(10);
			flags["SERA_TALKS_DEMONS"] = 1;
			seraTalkMenu();
			addDisabledButton(2,"Demons");
			break;
		case "furries":
			output("You ask why she hates furries so much.");
			output("\n\n<i>“They’re just... ugh!”</i> She grasps the air in anger with her claws. <i>“They’re using fucking wax crayons whilst other people are trying to make art. Look, I’m not hung up on animal features per se - they can be nice in moderation.");
			if(!seraRecruited())
			{
				if(pc.earType == GLOBAL.TYPE_CANINE || pc.earType == GLOBAL.TYPE_FELINE)
				{
					output(" Those fluffy ears, for example? Perfect for a cute ");
					if(pc.earType == GLOBAL.TYPE_FELINE) output("kitty slut");
					else output("slut puppy");
					output(" such as yourself.");
				}
				output("”</i>");
				output("\n\n<i>“");
			}
			else
			{
				output(" ");
			}
			output("And some aliens can’t help naturally looking gross. But the people who use those mods, they’re almost always some utter cretin who is so hopeless at human interaction they’ve fallen in love with an animal to the point where they want to BE the animal - See, animals can’t ever tell you you reek of B.O. and that you’re all clingy and weird - So then they spend their life savings on a dozen doses of the same mod and wallop it down. Bang! Now they’re a walking sperm whale or whatever the fuck. Then they show off their disgusting muzzles and snouts to each other, pretending they’re gene mod veterans. But there’s no craftsmanship.");
			if(seraRecruited()) output(" Then you’ve got people like the bitch who had her shop opposite mine.");
			output("”</i>");
			output("\n\n");
			if(!seraRecruited()) output("<i>“Then you’ve got people like the bitch across the way.”</i> ");
			output("She gestures contemptuously");
			if(!seraRecruited()) output(" out of the door");
			output(".");
			output("\n\n<i>“Enablers. Freaking aliens who do the same damn thing! She wants to be a panda but her race isn’t even mammal, she doesn’t have nips.");
			if(!seraRecruited())
			{
				if(chars["JADE"].breastRows[0].nippleType != GLOBAL.NIPPLE_TYPE_TENTACLED) output(" Does she try and find something that would give her them? Of course she fucking doesn’t! So now she’s got weird-ass featureless blobs of meat hanging off her pasty chest.");
				else output(" She actually needs someone like you to come along and tell her how weird those featureless blobs of meat hanging off her pasty chest look!");
			}
			else
			{
				if(chars["JADE"].breastRows[0].nippleType != GLOBAL.NIPPLE_TYPE_TENTACLED) output(" Did she try and find something that would give her them? Of course she fucking didn’t! So now she’s got weird-ass featureless blobs of meat hanging off her pasty chest.");
				else output(" She actually needed someone like you to come along and tell her how weird those featureless blobs of meat hanging off her pasty chest looked!");
			}
			output(" Least she got the fat bit right,”</i> she finishes in an angry mutter. <i>“Not that she actually intended that.”</i>");
			// Furry:
			if(pc.isNaga() || pc.isTaur() || pc.isDrider() || pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED) || !InCollection(pc.skinType, [GLOBAL.SKIN_TYPE_SKIN, GLOBAL.SKIN_TYPE_GOO, GLOBAL.SKIN_TYPE_FEATHERS]))
			{
				if(!seraRecruited())
				{
					output("\n\n<i>“So, uh...”</i> you say, hesitantly. Sera looks at you with a strange mix of contempt and fondness.");
					output("\n\n<i>“If I had a problem with you looking like someone who works in a kiddie amusement park you would know about it by now, sweetheart,”</i> she says. She leers at you toothily. <i>“I actually </i>like<i> you that way. Working out the aggression on one of the clowns themselves? More satisfying than I thought.”</i>");
				}
				// Furry AND submitted:
				else if(seraIsMistress())
				{
					output("\n\n<i>“Funny how these things work out, isn’t it,”</i> you smirk. She glares daggers at you.");
					output("\n\n<i>“If you enslaved me just because of what I said to you before,”</i> she snarls, <i>“that makes you the smallest muzzle-mutant in existence. Which is some achievement. No offence, ‘[pc.master]’.”</i>");
				}
				// Furry AND did not submit:
				else
				{
					output("\n\n<i>“Funny how these things work out, isn’t it,”</i> you smirk. She glares daggers at you.");
					output("\n\n<i>“It’s a f- gosh darn riot,”</i> she snaps. <i>“I love being the sex slave of someone who makes me dry heave every time they enter the room.”</i>");
				}
			}
			processTime(4);
			flags["SERA_TALKS_FURRIES"] = 1;
			seraTalkMenu();
			addDisabledButton(3,"Furries");
			break;
	}
}

//Sex
public function seraSexMenu(display:Boolean = false):void
{
	initSeraFuckFlags();
	if(display)
	{
		clearOutput();
		showSera();
		// If PC gets normally fucked twice, chooses sex again
		// Further, it's not really fair that players could get locked out of the additional content completely based on that one quick decision. Could the "next step" scene repeat every third time the "Sex?" option is chosen instead?
		if((((flags["TIMES_RODE_BY_SERA"] + flags["SERA_STUCK_IT_ALL_IN_BUTT"]) >= 2) || timesFuckedSera() >= 5) && (timesFuckedSera() % 2 == 0) && flags["SERA_TRIPLE_X_RATED"] == undefined)
		{
			author("Nonesuch");
			output("Sera smirks to herself when she sees you hovering. You look away, pretending to be interested in a collection of particularly disgusting ornaments on a shelf. After you’ve let a few moments go by, you steal another look at her. She’s still gazing at you, brilliant yellow eyes running up and down your frame, that proprietary smile still on her face. You feel a small thrill when she finally disengages herself from the counter and slowly walks across to you, dick and hips swinging.");
			output("\n\n<i>“You keep coming back,”</i> she says, without preamble. Her high breasts press into you as she bends into your side, breathing into your ear. <i>“Which means you like the way we do it.”</i> A warm hand has found its way between your [pc.thighs], sliding upwards. <i>“I’m almost impressed, meat. Most don’t come back for seconds, never mind thirds");
			if(timesFuckedSera() > 5) output("--or " + num2Ordinal(timesFuckedSera()) + "s, for that matter");
			output(". Takes a certain kinda... mindset.”</i> You close your eyes as she");
			if(pc.hasGenitals())
			{
				if(!pc.isCrotchExposed()) output(" undoes your [pc.lowerGarments]");
				if(pc.hasCock())
				{
					if(pc.hasStatusEffect("Genital Slit")) output(", parts your genital slit");
					output(" and grasps your [pc.cockBiggest]");
				}
				else output(" and slides a finger along your [pc.vagina], her sharp nails pressing into your sensitive [pc.skin]");
			}
			else output(" grabs one of your [pc.butts], her sharp nails pressing into your [pc.skin]");
			output(". <i>“Perhaps the slut is interested in taking things to the next level, hmm?”</i>");
			processTime(3);
			clearMenu();
			addButton(0, "Yes", letSeraFuckYouXXXpac, "yes");
			addButton(1, "No", letSeraFuckYouXXXpac, "no");
			return;
		}
		// Repeats
		else if(flags["SERA_TRIPLE_X_RATED"] < 4)
		{
			output("Sera smirks to herself when she sees you. You feel a small thrill when she rounds the desk to press her body against you. Her high breasts press into you as she bends into your side, breathing into your ear.");
			output("\n\n<i>“Welcome back whore,”</i> Sera asks, grabbing hold of you by the");
			if(pc.hasCock()) output(" crotch");
			else output(" other asscheek");
			output(". <i>“Are you still interested in taking things to the next level?”</i>");
			processTime(2);
			clearMenu();
			addButton(0, "Yes", letSeraFuckYouXXXpac, "yes");
			addButton(1, "No", letSeraFuckYouXXXpac, "no");
			return;
		}
		// Post-subservience
		else if(seraIsMistress())
		{
			output("Sera smirks to herself when she sees you. You feel a small thrill when she rounds the desk to press her body against you. The coolness of her armor contrasts palpably with the warmth of her exposed breasts and tumescent, girthy tool. Her hand unabashedly roams across your [pc.butt], squeezing a cheek with an easy grope, pushing you against her just a little bit more firmly.");
			output("\n\n<i>“You wanna fuck, pet?”</i> Sera asks, grabbing hold of you by the");
			if(pc.hasCock()) output(" crotch");
			else output(" other asscheek");
			output(". <i>“You know the drill, if you want something, you need to beg for it...”</i>");
			
			pc.lust(5);
		}
		// Default
		else
		{
			output("You gulp noisily, about to speak when Sera rounds the desk to press her body against you. The coolness of her armor contrasts palpably with the warmth of her exposed breasts and tumescent, girthy tool. Her hand unabashedly roams across your [pc.butt], squeezing a cheek with an easy grope, pushing you against her just a little bit more firmly.");
			output("\n\n<i>“You wanna fuck, meat?”</i> Sera asks, grabbing hold of you by the");
			if(pc.hasCock()) output(" crotch");
			else output(" other asscheek");
			output(". <i>“I don’t mind, but if we fuck, you’re on the bottom. I like to screw hard, fast, and wet. I don’t have a problem riding you into the dirt, but you better be willing to bark when I say bark and spread ‘em on command. Got it?”</i>");
		}
	}
	//OPTIONS
	clearMenu();
	if(pc.lust() >= 33)
	{
		if(seraIsMistress())
		{
			addButton(0, "Fuck Me", seraSexXXXRouter);
			if(pc.hasCock())
			{
				if(flags["SERA_INCH_STEAL"] == undefined) addButton(1, "My Cock?", seraInchStealingIntro, "ask her", "Something For Your Cock", "Ask Sera if she can do something with your [pc.cockBiggest].");
				else addButton(1, "Shrink Me", seraInchStealingIntro, "shrink me", "Shrink Your Cock", "Ask Sera to shrink your [pc.cockBiggest].");
			}
			else
			{
				if(flags["SERA_INCH_STEAL"] == undefined) addDisabledButton(1,"Locked", "Locked", "You need a penis for this!");
				else addDisabledButton(1,"Shrink Me", "Shrink Your Cock", "You need a penis for this!");
			}
		}
		else addButton(0,"Fuck Me",letSeraFuckYou,undefined);
	}
	else
	{
		addDisabledButton(0,"Fuck Me","Fuck Me","You aren’t turned on enough for this.");
		if(seraIsMistress() && pc.hasCock() && flags["SERA_INCH_STEAL"] != undefined) addDisabledButton(1,"Shrink Me", "Shrink Your Cock", "You aren’t turned on enough for this.");
	}
	addButton(14,"Back",approachSera);
	trace("COCK VOLUME:" + pc.cockVolume(0) + " SERA CAPACITY: " + chars["SERA"].vaginalCapacity(0));
}

public function initSeraFuckFlags():void
{
	if (flags["SERA FUCKED PCS TAILCUNT"] == undefined) flags["SERA FUCKED PCS TAILCUNT"] = 0;
	if (flags["TIMES_RODE_BY_SERA"] == undefined) flags["TIMES_RODE_BY_SERA"] = 0;
	if (flags["SERA_STUCK_IT_ALL_IN_BUTT"] == undefined) flags["SERA_STUCK_IT_ALL_IN_BUTT"] = 0;
	if (flags["SERA_URETHRA_TAILFUCKS"] == undefined) flags["SERA_URETHRA_TAILFUCKS"] = 0;
}

public function fuckedSeraBefore():Boolean
{
	if (flags["FUCKED SERA"] != undefined) return true;
	
	if (timesFuckedSera() > 0) return true;
	
	return false;
}

public function timesFuckedSera():Number
{
	var totalSex:Number = 0;
	
	if (flags["SERA FUCKED PCS TAILCUNT"] != undefined) totalSex += flags["SERA FUCKED PCS TAILCUNT"];
	if (flags["TIMES_RODE_BY_SERA"] != undefined) totalSex += flags["TIMES_RODE_BY_SERA"];
	if (flags["SERA_STUCK_IT_ALL_IN_BUTT"] != undefined) totalSex += flags["SERA_STUCK_IT_ALL_IN_BUTT"];
	if (flags["SERA_URETHRA_TAILFUCKS"] != undefined) totalSex += flags["SERA_URETHRA_TAILFUCKS"];
	
	if (flags["SAEN_X_SERA_THREESOME"] != undefined) totalSex += flags["SAEN_X_SERA_THREESOME"];
	
	if(flags["SERA_INCH_STEALING_SEX"] != undefined) totalSex += flags["SERA_INCH_STEALING_SEX"];
	if(flags["SERA_INCH_STEALING_HELP"] != undefined) totalSex += flags["SERA_INCH_STEALING_HELP"];
	if(flags["SERA_EXHIBITION_BLOWJOB"] != undefined) totalSex += flags["SERA_EXHIBITION_BLOWJOB"];
	if(flags["SERA_IN_JARDI_THREESOME"] != undefined) totalSex += flags["SERA_IN_JARDI_THREESOME"];
	if(flags["SERA_FACE_RIDE_TRAINING"] != undefined) totalSex += flags["SERA_FACE_RIDE_TRAINING"];
	if(flags["SERA_TIT_FUCK_LUCKY_DIP"] != undefined) totalSex += flags["SERA_TIT_FUCK_LUCKY_DIP"];
	if(flags["SERA_PARTY_FUCKED"] != undefined) totalSex += flags["SERA_PARTY_FUCKED"];
	if(flags["SERA_TAILED"] != undefined) totalSex += flags["SERA_TAILED"];
	
	if(flags["SERA_BITCHENING_RIDE"] != undefined) totalSex += flags["SERA_BITCHENING_RIDE"];
	if(flags["SERA_BITCHENING_BUTTFUCK"] != undefined) totalSex += flags["SERA_BITCHENING_BUTTFUCK"];
	if(flags["SERA_BITCHENING_SEXED"] != undefined) totalSex += flags["SERA_BITCHENING_SEXED"];
	if(flags["SERA_WAKEUP_SEX"] != undefined) totalSex += flags["SERA_WAKEUP_SEX"];
	
	return totalSex;
}

public function letSeraFuckYou():void
{
	flags["FUCKED SERA"] = 1;
	
	var choices:Array = new Array();
	//Get Giant Dick Urethrally Tail-filled while eating her out
	//You get the gist
	if(pc.biggestCockVolume() >= 140) choices[choices.length] = getGiantDickTailfilledWhileEatingSeraOut;
	//Get Rode and Pegged/Fucked
	//Sera goes 100% crazy femdom on you. I forgot the pegging, sorry Savin.
	if(pc.cockThatFits(chars["SERA"].vaginalCapacity()) >= 0) choices[choices.length] = getRodeFemdomStyleBySera;

	//Tail usage!
	if(pc.hasCuntTail()) choices[choices.length] = getTailUsedBySera;

	//Savin's omnigender buttfux
	choices[choices.length] = catchEverythingInYoButtBySavinForSeraDogcock;

	//Sera Cockvine Scene
	//Add to existing pool of PC-has-submitted scenes if PC has tail-cock
	//if(pc.hasParasiteTailCock()) choices[choices.length] = seraCockvineScene;

	//pick one
	choices[rand(choices.length)]();
}

//Get Tail Used
public function getTailUsedBySera():void
{
	clearOutput();
	showSera();
	output("Your tail waves around your [pc.hips], as eager for a drop of cum as a snake salivating over its prey. Rather than reacting to your");
	if(pc.hasParasiteTail()) output(" parasitic hind-limb");
	else output(" [pc.tail]");
	output(" with disgust or revulsion, Sera simply smiles and extends her arm, letting the sinuously undulating length of vagina-capped flesh curl about her arm. She pets it while cooing affectionately, much as someone might do to a pet, a happy smile on her pierced face.");
	output("\n\n<i>“");
	if(pc.hasParasiteTail()) output("You’ve got a little tagalong, huh?");
	else output("Hmm, nice feature you have here--what mods did you use to get it?");
	output("”</i> the demoness purrs, slipping a finger into the moist entrance at its tip. Shudders of pleasure ripple up the tubular organ and into your spine where they diffuse through your body. A half-whimper, half-sigh slips out of your lips. Muscles clamp down about the invading digit automatically, pulling it deeper with noisy, squelching suckles, every rippling twist rubbing new, sensitive nerves against her. <i>“");
	if(pc.hasParasiteTail()) output("I never understood the prohibitions against these little girls.");
	else output("I love teasing girls like these until they reveal their true desires.");
	output(" All they want to do is get stuffed full of cum and make you feel good for it, right?”</i>");
	output("\n\nYou try to summon up some kind of response to her statement, but she slides her middle finger in next to her pointer, silencing you with a gag of feminine bliss.");
	output("\n\n<i>“Don’t bother talking, slut. I’m just here to use your body. Today, you’ve lucked out. I’m gonna drill this little cocksucker full until you’re lying on the ground unconscious while it feasts on jizz.”</i> Sera pauses to add a third finger. It feels too good for words. Your head is spinning, awash with pleasure. You bite your lip almost hard enough to draw blood, and when your jaw relaxes, a reedy exultation of desire is all that emerges. You grind your body against Sera, eager for more");
	if(!pc.isNude()) output(", even though the both of you are clothed.");
	else output(", even though she remains fully ‘clothed.’");
	output("\n\nSera laughs, haughty and throaty with her own desires. <i>“That’s the right attitude my little fuckmeat.”</i> Her cock is firm against your [pc.leg], just hard enough to leak a strand of pre-cum onto your [pc.skin]. Withdrawing her fingers, she leaves your clenching tail-quim all alone, dribbling [pc.girlCum] everywhere as it searches for something to stuff it, something that can feed it what it needs. The purple beauty ignores your searching slit to regard her dripping wet fingers. <i>“You got me all dirty.”</i>");
	output("\n\nShe thrusts the sopping digits at your mouth, smearing your musky drippings across your [pc.lips] like gloss. <i>“Clean up your mess. I’m not feeding that slovenly little hole until you do.”</i> Her fingers are insistent and her gaze imperious.");
	output("\n\nYou suckle her fingers, starting with the pads of her fingertips, claw-like nipples and all, slurping the excess cuntjuice free of the authoritative shop-owner’s digits with surprising eagerness. There’s something about her tone... the way she casually fingers you without worry. It makes you wet, and not just lubricated, but moisture-drooling fuck-me wet - the kind of wet that won’t go away until something warm and hard is thrust inside you again and again.");
	if(!pc.hasVagina()) output(" Is this what horny girls feel like?");
	else 
	{
		output(" Your [pc.vaginas] react");
		if(pc.totalVaginas() > 1) output("s");
		output(" similarly. You can feel it on your [pc.legOrLegs] and in the way you squish when you shift your hips.");
	}
	output(" The rhythmic pumping of your tongue against her fingers continues while you’re thinking about all this, on autopilot, lewdly cleaning every bit of your prodigiously slippery sauce from every nook and cranny.");
	output("\n\n<i>“Damn, you suck like a vacuum cleaner! I almost wanna stick it in your mouth instead!”</i> Sera teases. Her fingers slide free of your suckling maw, connected to your [pc.lips] by strands of clear saliva. Your mouth is pursed, horny and confused. Is she finally going to tend to your needy slit? The hungry tail is all over Sera, kissing her with its engorged lips, smearing lubricants across her unblemished skin. You wonder if she’s going to make you lick that off her with no small amount of anticipation, but she disappoints you by grabbing hold of your roving tail and holding it up to your face.");
	output("\n\nSera’s voice commands, <i>“Lick your pussy, pussy. I wanna see you tongue-deep in that snatch. You show me what you’d do to my cunt, and maybe I’ll fill yours. That’s what you need, isn’t it?”</i>");
	output("\n\nYou nod against the flush netherlips, moaning into your [pc.tailgina], the vibrations of your voice like tiny fingers vibrating against your aching flesh.");
	output("\n\nGrinding your tail’s clit harder into your [pc.face], Sera watches. Her hips twitch a little, grinding her boner against your [pc.thigh]. She’s obviously enjoying watching you almost as much as you’re enjoying the friction on your");
	if(pc.hasParasiteTail()) output(" parasitic ");
	else output(" tail-");
	output("pussy. Your [pc.tongue] flicks out, tracing up one side of your entrance and down the other. It skillfully circles your clit once, and then, you plunge it deeply inside yourself in an act of unrestrained auto-cunnilingus. The flavor is tangy and a little bit sweet on your taste buds.");
	if(pc.tailCount > 1) 
	{
		if(pc.tailCount == 2) output(" Your other");
		else output(" Another");
		output(" clit-capped length winds its way around your body. Sera all too happily switches them, changing out one set of glittering, soaked folds for another.");
	}
	output(" Inside, your [pc.tailgina] is literally wringing your tongue as it tries to draw it deeper and more completely inside.");
	output("\n\nSera, touching herself now, wraps her other arm around you. She doesn’t really need to guide your [pc.tails] at this point. The oozing wet gash is keeping itself firmly placed against your [pc.lips] and drinking in your [pc.tongue] so hard that you’d be sorely pressed to remove it anyway. You’re moaning like a whore and shaking like a leaf, every nerve raw and exposed to the rhythmic pulsations of exquisite pleasure that wrack your form. Your licks are transmitted with such force that you swear you can feel your tongue sliding over the pleasure centers of your brain, leaving you to writhe and lick all the harder.");
	output("\n\nLicking your ear, the haughty demoness starts to gently nibble. Her vibrant, blue lips seal around it in a kiss before breaking off. Her voice purrs like the rumble of a contented cheetah, <i>“Cum all over your face, slut.”</i>");
	output("\n\nYou moan, shaking, muscles convulsing as ecstasy blooms.");
	output("\n\n<i>“Show me you’re just a wanton piece of fuckmeat, waiting to be taken.”</i>");
	output("\n\nJuices rush to fill your mouth while your eyes roll back. Your [pc.legOrLegs] spasm");
	if(pc.legCount == 1) output("s");
	if(pc.hasVagina()) output(", soaked with juices");
	if(pc.hasCock()) output(", your cock" + (pc.cocks.length == 1 ? " unloads" : "s unload") + " into the open air");
	output(", your [pc.tailgina] ripples on your [pc.tongue], milking it, and you sag deeper into Sera’s grip, letting her hold you upright while what feels like gallons of [pc.girlCum] pour into your mouth. It’s the kind of orgasm that would normally knock you prone and gasping, well-fucked and unlikely to do anything but cuddle your way to a well-fucked sleep.");
	output("\n\nYou’re still trembling when Sera eases you down to the floor, aware of two things at that exact moment: how good you feel and just how hungry for sperm your well-used [pc.tailgina] is. Lucky for it, the shopkeeper is still horny.");
	output("\n\nYou feel fingers extract your [pc.tongue] from the soaked, prehensile length, the sound of its squelching departure making you shudder. Sera’s got a good grip on your oozing tail, and she lifts it up without much consideration for your state. She doesn’t stop until she’s got it held against the underside of her pre-drizzling member, letting the outflow tease you. It’s so close to feeding your hunger and yet so far away. You try to rise, but Sera’s heels press down on your [pc.chest].");
	output("\n\n<i>“No, no. You stay on the floor, slut. I want to watch you writhe while I fuck you.”</i> Her lip curls knowingly. <i>“Besides, I’d rather a set of willing holes like yourself didn’t get hurt from orgasming " + pc.mfn("him","her","it") + "self to the floor,”</i> Sera explains. Despite her attempt at a reasonable tone, the heel is pressing painfully against your sternum, pinning you there. The demoness will brook no disagreement, no refusal. She’ll accept nothing from you but submissive complacency. You slump back, giving it to her.");
	output("\n\n<i>“That’s my slut,”</i> she says while raising your tail’s entrance up higher to press against her turgid cockhead. A droplet of her lust spills into your tingly slit. You’re already aching for another orgasm, and at the touch of that single, lurid morsel, your [pc.tailgina] attempts to surge up and over, to completely engulf that wonderful shaft in squeezing ripples. Sera’s grip is firm, however. She looks down at you, noting the way you’re blushing and the way your [pc.tongue] hangs free of your [pc.lips]. <i>“Beg me.”</i>");
	output("\n\nYou slowly respond, <i>“...What?”</i>");
	output("\n\nSera vigilantly rubs your clingy mons against her tips, slicking it with wetness, letting your feminine organ swirl deliciously over her ready phallus. <i>“Beg me. Or would you rather I just tease you with the tip? It’s a slow day - I could do this for hours.”</i>");
	output("\n\nNo no no no no! You look up past her platform heels to her shapely, leather-wrapped legs, letting your eyes focus on her pulsating member. Your tail must be eager, but you can feel so much sympathetic hunger that you’re drooling. In that moment, you realize that you’d beg her to suck on it just as easily, even if it wouldn’t fill the void hanging behind your [pc.butt]. You wipe the drool on your shoulder and do the only sensible thing: you beg. These aren’t tentative, half-felt begs either. No, you need her to fuck your tail, and with your inhibitions shredded by the recent, wonderful orgasm, you’re free to tell her how you really feel and just how much you need her to thrust her cock inside you and fill you like the slutty, hungry whore that you are.");
	output("\n\nSera, pleased by your admission, leans against her desk and releases her grip on your tail. Free at last, the slavering, cock-hungry hole does what it was born and bred to do: it takes all twelve inches of the demoness’ length inside it and begins to please. The domineering woman’s knees knock together, barely able to support her under the onslaught of your cock-caressing inner folds. She’s clearly done this sort of thing before, because she positioned herself with the desk as a brace just in time. Her voice rises in pitch and volume, moaning loudly.");
	output("\n\nFor your part, it’s hard to do or think anything. You’re still reeling from the last climax, and your body and brain are being bombarded with so much ecstasy that it’s difficult to form coherent thoughts, let alone control the spasmodic twitches that have your body jerking like a puppet with its strings cut. Instead of trying to resist, you give in and let yourself be the fucktoy Sera wants you to be. You moan whorishly and guide your numb fingers to your [pc.nipples] to enhance the pleasure and the display for the dominant woman. Giving in, unsurprisingly, feels like a constant low-level orgasm, or is that just the feelings from your tail? It’s hard to care.");
	output("\n\nSera’s grip is white-knuckled on her counter, straining to keep her upright. Her hips are lurching, bucking in the air against a phantom lover’s ass, making your tail shake, whiplike. The bucking doesn’t dislodge your [pc.tailgina]. In fact, it makes it easier for it to do its job. It’ll slide off a little bit at the apex of each herky-jerky pump of the demon’s hips, but that just puts it in position to slurp back down her length with powerful inner muscles that make your tail so talented. You can feel your tail swallowing the pre that’s flowing out as easily as you can measure the pulsations of her swelling, near-orgasmic tool. She’s close. Very close.");
	output("\n\nSera’s voice, wild and uncontrolled, babbles, <i>“Fuck yes, I love you tail-cunted sluts! Fuck my cock, you cum-hungry whore! I’ve got a big, thick wad just waiting for you!”</i> Her balls lift in her sack, pulling tight as they convulse. Sera’s mouth falls open, interrupting her lusty tirade. She grunts, thrusting even harder - once, twice, and then a final time, hard enough to make you swoon with the feeling of it. Then, she’s cumming, and you’re in heaven, feeling the warm, thick goo roll out into your folds, marvelling at how good it tastes for your tail as its drawn deeper inside you.");
	output("\n\nYour own orgasm hits you, but this one is different. It isn’t just sexual pleasure; it’s pure, liquid satisfaction too, the scratching of an itch you didn’t even know you had until it was soothed. It’s marvelous and beautiful, and you’re twisting on the floor, rubbing your hands up and down your body in insensate pleasure, your tail ceaselessly working its muscles to suck every single drop of pearly pleasure from your more aggressive, domineering mate.");
	output("\n\nEven when the flow abates, your [pc.tailgina] won’t stop. It polishes Sera’s member with its juices while locking her own away. Oily wetness drips from her balls, but not a single droplet of white remains to be seen. You’ve drained her, completely and utterly, and you feel blessedly, totally full. You catch yourself rubbing your tummy contentedly before shrugging and continuing. What’s it matter? You’ve already acted like her needy bitch. She isn’t going to have any expectations from you beyond sexual service.");
	output("\n\nSlowly, the shuddering shopkeep pulls you off her length. The withdraw feels like it lasts forever, an eternity of inch after inch of thick cock rubbing you just right as it leaves your feminine embrace. All good things must come to an end, of course. Her head pops out, glossy and slowly shrinking. Sera can’t stop the shudder that goes through her body, but she does stand up after, resuming her authoritative stance. Her hand is still clutching your dripping tail.");
	output("\n\n<i>“Not bad, slut.”</i>");
	output("\n\nYou try to stop yourself from beaming, but the praise feels... good. You smile up at her.");
	output("\n\n<i>“But don’t let it go to your head. Don’t even think you’ve satisfied me. You’re looking at a girl that took two doses of Throbb and had the strength of will to quit the stuff. You’re looking at a woman capable of staggered refractory periods that doesn’t have to wait to go a second time.”</i> Sera leers at you, still obviously lusty. Her own tail appears in her other hand, the spade-like head elongated, swollen and distended. It blooms, peeling open like rose petals to reveal a second, six-inch long cock inside it. <i>“Ready for round three?”</i> she asks.");
	output("\n\nYour body is exhausted from the previous orgasms, but... you can’t bring yourself to say no to Sera. She’s radiant with confidence and alight with power, and you’re... you’re just a set of sloppy, fuck-soaked holes lying on the floor, ready to serve. Biting your lip, you nod.");
	output("\n\nSera smirks. <i>“Honestly, I shouldn’t have even bothered asking. I know your type.”</i> She pushes her exposed tailcock into your sopping wet, well-fucked entrance. It glides in without a hint of resistance, practically frictionless against your all-consuming wetness. Instinct kicks in at that point, and you feel yourself pressing down around it, contracting into the perfect pussy for the smaller member, whirling and twisting so that your drenched lips can spin while they suck.");
	output("\n\nYour eyes close with the image of Sera’s half-hard, dripping-wet cock still in your mind. You don’t really need to see to be her cocksleeve, and dealing with the sensations from your overstimulated tail and your eyes at the same time was a little bothersome. This way you can focus entirely on contorting your clinging lips to better serve Sera’s pleasure.");
	output("\n\n<i>“Damn, you’re a natural,”</i> Sera pants. <i>“This had better not be the last time you show your ass around here, bitch. I’ve got needs, and I want to give the rest of your body a spin next time.”</i> Her tail works powerfully against your own, pumping you hard and already oozing. <i>“I wonder if you’ll be able to hold all this in. You wouldn’t want to waste Mistress’ cum, would you?”</i>");
	output("\n\nYou shudder, shaking your head.");
	output("\n\nShe puts her boot back on your chest, growling and grunting. <i>“Good. H-here it... it’s coming!”</i> Her phallic tail jams itself in to the hilt and immediately spews out a long, thick rope. This spunk is a little different than her other cock’s - thicker and a little stickier, but you crave it all the same. She pumps shot after shot of yogurt-thick jism inside you, but your fatigued muscles just can’t keep up. Rivulets of mixed cum run out around the perfect seal.");
	output("\n\nSera makes ‘tsk-tsk’ noises with her mouth at the sight. <i>“I should’ve known you couldn’t take it all.”</i> She puts her boot on your cheek and presses your face into the ground. <i>“You’ll need to do better if you ever want to be my personal cum-dump, [pc.name].”</i> She lets you sit like that while the last few pulses shoot from her member, filling your cunt-like tunnel. Then, the demon-woman pulls out, leaving you thoroughly creampied. Turning away, she steps off you and moves in place behind her counter, but she isn’t done with you... not yet.");
	output("\n\n<i>“Gross. You’re filthy, [pc.name],”</i> Sera says with a distainful glance. <i>“You had better go clean up if you don’t want every passerby to think you’re a cum-craving cunt, just waiting to be filled. Unfortunately, I don’t have a wash in here. You’ve got a tongue though, right? Just lick it up.”</i> She’s looking at you expectantly. Something about her gaze makes your quim");
	if(pc.tailCount > 1 || pc.vaginaTotal() > 1) output("s");
	output(" clench, and a drop of goo dangles down from your juice-soaked entrance. You catch it in your mouth before it can dirty her floor and spend the next several minutes obediently licking out every drop that your tail failed to consume.");
	output("\n\nShe doesn’t seem to have any complaints about your face being covered in pussy juice. You do your best to wipe up anyway, but you’re sure you still smell vaguely of cunt. The satisfaction your [pc.tailgina] exudes makes it all worthwhile.");
	
	IncrementFlag("SERA FUCKED PCS TAILCUNT");
	
	pc.loadInCuntTail(chars["SERA"]);
	processTime(45+rand(15));
	sera.orgasm();
	pc.orgasm();
	pc.applyPussyDrenched();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Get Rode and Pegged/Fucked
//Sera goes 100% crazy femdom on you. I forgot the pegging, sorry Savin.
public function getRodeFemdomStyleBySera():void {
	clearOutput();
	showSera();
	var x:int = pc.cockThatFits(chars["SERA"].vaginalCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("You nod.");
	output("\n\n<i>“Good, get your ass on the floor behind the counter,”</i> Sera says, pointing to direct you.");
	output("\n\nWhat? Your incredulity must be painted on your face, because Sera smirks right back at you. <i>“I’m not gonna tell you again. If you want some of this,”</i> she gestures up and down her body, <i>“then you had better get ");
	if(!pc.isNude()) output("naked and ");
	output("on the floor. Otherwise, you can go spank it somewhere else.”</i> The purple-hued woman makes crude, jacking motions with her hand while she waits to see how you react.");
	output("\n\nWell, if the price for getting ridden cow-girl is having to obediently stretch out on the floor, so be it.");
	if(!pc.isNude()) output(" You strip out of your [pc.gear] without any concern and");
	else output("You");
	output(" walk to where she’s indicated and sit down. The floor is cold on your [pc.butt]. You barely manage to suppress an involuntary shiver before forcing yourself to lay out on the frigid deckplates. You’d think she could at least spring for some carpet if she was planning to fuck potential clients on the floor.");
	output("\n\nSera appears almost oblivious to your discomfort. She’s smiling down at you, licking her lips as her heels click and clack closer to you. She laughs and admits, <i>“");
	if(flags["TIMES_RODE_BY_SERA"] > 0) output("Already back in your place, meat? I suppose it isn’t that hard to train that wanton dick of yours.");
	else output("You know, I wasn’t sure you’d do that right here and now. What if someone walked in? You’d be laying there shivering while I haggle over mods with them. Maybe if you were lucky, I might have given you a few rubs with my heel. Gotta keep my meat warm.”</i> She smiles. <i>“Let’s get to your training then, shall we?");
	output("”</i>");
	output("\n\nYou color shamefully at her stinging words, and then she’s standing astride you, her cock and balls dangling but not so far that you can’t see her moist cleft. A single, pearl-like droplet of feminine lubricant slides down the backside of her sack, hanging there as she regards you. She looks almost regal from what you can see of her; her horns are like a curling, twisted crown, and her eyes, they glow with a powerful inner light. You lay hard and helpless before her, waiting for her to take you and do what she will with your body.");
	output("\n\nSera’s own member balloons as she looks at you. It’s difficult to tell exactly what she’s thinking, but by the way her mouth is crooked with amusement, you imagine it’s something debased. Her cerulean nipples perk up with her dick until all three are like hard points of arousal that jut from her body, proudly displacing her rapacious libido to you. She nonchalantly squats. Your eyes stick to what you can see of her ass and thighs like glue, so eager to feel her velvet cunt on [pc.oneCock] that you don’t even blink.");
	output("\n\nJust as you’re about to slip inside her simmering slit, she stops. You can feel the moist heat boiling off of her. The tangy scent of her moisture clearly reaches your nose, and you have to struggle not to thrust. You’re sure that if you did, the fickle, demonic shopkeeper would simply stand up and order you away. No, you grit your teeth and hold tight. She’ll fuck you soon.");
	output("\n\n<i>“Ohhh, I like this.... I haven’t even had to give you the order, and you’re already obeying me,”</i> Sera gloats. <i>“Look at you, muscles straining, jaw clenched, and close enough that you can feel the droplets falling on your crown, but... you just... can’t... move.... You know that I wouldn’t fuck you if I did - that I wouldn’t give your cock what it desires.”</i> She grabs your length with her hand and angles it down, away from the silken entrance that was just an inch away. <i>“But you can’t fuck me just yet.”</i>");
	output("\n\nYou gasp, <i>“Why!?”</i>");
	output("\n\n<i>“Why? Because I have something you want. I have a slippery, gene-modded twat that will feel soooo good. I have the one thing that lets me flip the switch in your brain from ‘well-intentioned individual’ to ‘obedient tool.’ If I wanted to, I could probably get you to lick the dirt from my heel, provided I was willing to touch you,”</i> Sera explains. <i>“Lucky for you, I do want to touch you, very much so in fact.”</i> She dabs a finger at her cleft then extends it to you, holding the glistening digit against your lips. <i>“See? Now be a dear and clean it, my horny little pet.”</i>");
	output("\n\nYou open your mouth and gently take Mistress’ finger into your mouth. There’s no other word for her at the moment - you’re underneath her, doing everything she commands you to do, all for the slim hope of coming sexual gratification. You may not have anticipated her being this assertive in her lovemaking, but you’ve come this far. No point in turning back when you’re this close to getting a good fuck. Besides, her flavor tastes rather nice on your [pc.tongue]. Maybe your arousal is coloring your perceptions, but who cares so long as you’re enjoying it. You slurp at it until the only moisture left on her intruding digit is your saliva.");
	output("\n\nSera uncharistically giggles. <i>“That’s a good pet. Perhaps I’ll be able to train you into something worthwhile after all.”</i>");
	output("\n\nPride at the praise wars with anger at the dehumanizing disdain, but ultimately, neither wins out. Instead, it’s pleasure that wins - pleasure that radiates from your [pc.cock " + x + "] as she sits down, straddling it. The knobby bump of her clit digs in, just below your [pc.cockHead " + x + "], and a surge of blood fills you until you feel beyond hard. ");
	if(silly) output("It’s so hard that the Old Spice Guy would tell you to look away. Your dick is now diamonds. ");
	else output("It’s so overfilled that it’s painful in intensity. ");
	output("Her twat is hot and wet. In your mind’s eye, it’s the most gorgeous, desirable slit you’ve ever seen, but that’s clearly just denial and need mixing together into submissive pleasure.");
	if(pc.cockTotal() > 1)
	{
		output(" Your other length");
		if(pc.cockTotal() > 1) output("s feel");
		else output(" feels");
		output(" wonderful as well, between your [pc.belly] and her thighs, but it’s nothing like the pleasure your lucky prick is getting.");
	}
	output("\n\n<i>“I take it you approve then? You want me to tease your dick until it jumps when I say jump, right?”</i> Sera asks. Her eyes glitter with mirth.");
	output("\n\nWith your hands balled into fists, you nod. It’s the only way you’re going to get her to go any further.");
	output("\n\nHer hips rock forward, dragging the sopping lips up your length before reversing direction. She’s working you with rhythmic, steady strokes, her fluids dripping down the sides of your need-swollen boner. A droplet of pre-cum rolls out of your [pc.cock " + x + "], closely followed by one from Mistress’ member.");
	
	var cumQ:Number = pc.cumQ();
	if(cumQ <= 250) output(" Hers is noticeably bigger than yours, and when it falls, it practically devours yours.");
	else if(cumQ <= 500) output(" Hers is about as big as yours, and the two droplets mix evenly into a smear on your [pc.belly].");
	else
	{
		output(" Hers is smaller than yours");
		if(cumQ >= 1500) output(" by a good margin");
		output(", and basically disappears into the giant-sized smear on your [pc.belly].");
	}
	output(" They’re followed after by more like them as you two of you enjoy yourselves.");
	output("\n\nYou pant happily, smiling up at Sera.");
	output("\n\nShe slaps your cheek, hard. <i>“Eyes down while you’re getting your treat, slut. If you can’t show deference, you can go stroke in the corner while you thank me for the lube.”</i>");
	output("\n\nYou turn your reddening cheek down and look away. <i>“Yes.”</i>");
	output("\n\nShe slaps the other side. <i>“Yes what?”</i>");
	output("\n\n<i>“Yes, Mistress.”</i> The words feel like defeat, but her gyrations come a little faster. Humiliatingly, you bite your lip and moan. It’s too hot not to.");

	output("\n\nSera grabs you by the neck and bends over so that her swaying, heavy tits brush against your ");
	if(pc.biggestTitSize() >= 2) output("own");
	else output("[pc.chest]");
	output(". With one hand, she covers your eyes. With the other, she firms her grip on your throat. Her lips meet yours hard enough that you nearly cut the insides of yours on your teeth, and then her long snake-like tongue is twirling over your gums. Her slit slides further up, her hips shift, and suddenly, your [pc.cockHead " + x + "] isn’t just warm but hot, wreathed in wet folds. She glides down you while kissing you, her grip as tight as her twat and the tongue-kiss.");

	output("\n\nShe breaks away, her lips still wet with mixed spit. You feel her come down to the hilt, soaked and clinging. Another moan rises off, but it’s a choked, weak little thing. Her grip on your neck is just tight enough to make it hard to talk but not enough to actually stop your breathing. Sera straightens to start fucking you, the steady rise and fall of her hips feeling like heaven to your over-focused consciousness. If she started choking you now, you probably wouldn’t resist. Her pussy feels too good to interrupt.");
	pc.cockChange(true,false);
	output("\n\n<i>“You like this, don’t you? ");
	if (flags["TIMES_RODE_BY_SERA"] > 0) output("Why do I even ask? You came back for more, like an obedient, well-trained puppy.");
	else output("If you didn’t before, you sure do now.");
	output("”</i> Sera moves faster, tits jiggling above you. You can only see them out of the corner of your eyes; you’re dutifully keeping your gaze averted, lest you draw her ire. It leaves you with nothing to focus on but the feelings and your own submission. You pant, breathing hard, gently nodding as much as her hand will allow.");
	output("\n\nSera’s free hand moves to your [pc.chest] and grabs a [pc.nipple], twisting cruelly.");
	if(pc.hasDickNipples()) output(" When a dick pushes out of the innocuous nipple, she just smirks and squeezes it too.");
	else if(pc.hasLipples()) output(" When she slows enough to realize they’re lips, she just flicks the lower one, making it pout.");
	else output(" When her finger disappears into the middle of it, she just thrusts a finger inside and pinches you from the inside-out.");
	output(" <i>“You fucking love this, don’t you, you masochistic bitch?”</i>");

	output("\n\nYou gurgle in the affirmative, your [pc.hips] jerking.");
	output("\n\n<i>“Good bitch,”</i> the demoness coos, picking up the pace until she’s bouncing her well-rounded ass off your crotch with reckless abandon. Her shop is filled with the wet slapping sounds of a lusty fuck, and her cock is absolutely oozing with need of its own. Neither of you is that far from release.");
	output("\n\nYou just hope that she cums first. A premature ejaculation on your part could make for a sore come-down.");
	output("\n\nSera howls, <i>“That’s it slut!”</i> She slaps your face once more, grinning cruelly. <i>“Lie there and take it!”</i> She twists at your nipple. <i>“How much are you willing to endure to blow in my cunt?”</i> She moans. <i>“Will you do anything to be my adoring fuck-slave?”</i>");
	output("\n\nFor a moment, you try to hold out, hoping she’ll cum before you have to answer, but like before, you give in. You shout, <i>“Anything, Mistress!”</i>");
	output("\n\nShe slaps you one more time and doubles her pace, screaming, <i>“Then cum for your Mistress, bitch! Cream her twat!”</i>");
	if(pc.balls > 1) output(" She cracks her tail against your [pc.balls], whiplike.");
	else output(" She cracks her tail against your taint, whiplike.");
	output(" <i>“Cum.”</i>");

	output("\n\nAs if you could resist. Your ");
	if(pc.balls > 0)
	{
		output("[pc.balls] unload");
		if(pc.balls == 1) output("s");
	}
	else output("body unloads");
	output(" the whole of your pent-up lust in one gigantic surge of pleasure, causing your eyes to roll back as her hand pinches tighter, cutting off your airflow. Your body thrashes wildly underneath her, barely registering the heat of her cum falling across your [pc.fullChest] and [pc.face]. Through your middle, your muscles spasm, pouring every drop of your lust into her");
	if(pc.hasKnot(x)) output(", swelling your knot inside her as large as it’s ever been");
	output(".");
	if(cumQ <= 500) { /* Nothing? */ }
	else if(cumQ <= 1000) output(" Her belly bulges slightly from the sheer quantity, but it only makes her cries that much more pleasure-filled.");
	else if(cumQ <= 5000) output(" Her belly expands to a pregnant dome from the quantity of [pc.cum] you’re shooting into her, but it only makes her cries that much more pleasure-filled.");
	else output(" Her belly bloats into a gravid dome, and her eyebrows grimace from painful discomfort. It doesn’t stop her cries from getting louder and more excited, however.");
	output("\n\nShortly after you go dry, her alabaster ejaculations slow, and Sera shudders, smiling. Her voice, surprisingly tender, coos, <i>“That’s a very, very good boy.”</i> Then, without another word, she ");
	if(pc.hasKnot(x)) output("attempts to rise, catching on your knot. Giving you a baleful look, she sighs. It’s at least five minutes before she finally manages to pop it out.");
	else output("rises up off of you, letting the [pc.cumColor] fluid glisten on her lips.");
	output(" You’ve nicely creampied Sera, and with a glance down at yourself, you realize she’s done a fabulous job marking you as well. You stand up on");
	if(pc.legCount == 1) output(" your");
	output(" wobbly [pc.legOrLegs], dripping wet with mixed juices.");
	output("\n\nSera is already in the process of throwing away a small towel, all evidence of the tryst already removed. Seeing you look at her, she rolls her eyes. <i>“Fine, you can have a towel.”</i> She hands one to you with condescending pat on the head. <i>“That’s a good bitch.”</i> Your [pc.cocks] twitch");
	if(pc.cockTotal() == 1) output("es");
	output(" in response. Luckily, she doesn’t see.");
	output("\n\nAfter you’re both suitably presentable, you walk back around the corner. Sera mirthfully asks, <i>“Is there anything I can do for you, pet?”</i> You flush as you consider your options.");
	IncrementFlag("TIMES_RODE_BY_SERA");
	processTime(35+rand(10));
	sera.orgasm();
	pc.orgasm();
	seraMenu();
}

//Get Giant Dick Urethrally Tail-filled while eating her out
//You get the gist
public function getGiantDickTailfilledWhileEatingSeraOut():void
{
	clearOutput();
	showSera();
	output("Sera casually strips your [pc.gear] from your body");
	if(pc.isNude()) output(", not that you bother to wear much at all");
	output(". Her hand traces down your [pc.belly] before pausing at your [pc.cockBiggest]. She grabs it slowly, almost hesitantly before pulling away.");
	if(pc.cockTotal() == 2) output(" Your other penis longs for a touch as well, but is ignored.");
	else if(pc.cockTotal() > 2) output(" Your other penises long to be touched as well, but are ignored.");
	output("\n\n<i>“You’re packing more than a little fuckmeat, eh fuckmeat?”</i> she asks, smiling. <i>“A dick this big is just about useless for screwing, if you ask me. It’s basically just a fucking ornament that lets every dom in a ten mile radius know that you’re compensating for being a ridiculous submissive.”</i>");
	output("\n\nYou dare to retort, <i>“That’s not true!”</i>");
	output("\n\nEyes like burning ice stare levelly at you, full of barely-concealed disbelief. <i>“Really? So if I promised to stroke your dick if you dropped down");
	if(pc.isBiped()) output(" on your knees");
	output(" and started eating me out, you wouldn’t do it? You’d stand up for yourself and show me what real pleasure was?”</i> Sera laughs and points at the floor. <i>“Down " + pc.mf("boy","girl") + ". Go on.”</i>");
	output("\n\nYou ball your fists and... get down, [pc.cocks] getting harder with each passing second. If you didn’t, she’d just shoot you down anyway. That’s how you justify it to yourself, anyway.");
	output("\n\n<i>“I knew it. Well, start licking, and I’ll see about starting that stroking I promised. A dick that mountainous does deserve a chance to go off.”</i> Sera hefts her weighty balls out of the way to expose a glistening, cerulean slit. <i>“Come and get it.”</i>");
	output("\n\nYou do, eagerly and immediately. You bury your nose in her box and set to work, kissing and licking her outer lips to get her worked up. Your [pc.cockBiggest] swells even bigger, ready for the promised strokes, but nothing happens. Just when you’re about to pull away, you feel something long looping around around your girthy tool. So much blood surges into your organ in response that you feel like you’re close to bursting. The cunt-muffled moan that emerges from you pleases Sera if the way she’s grabbing your head and pressing it against her entrance is any indication.");
	output("\n\n<i>“That’s a good, bitch. Lick that cunt. Show it why a good tongue is better than a big dick any day of the week.”</i> She nudges your pre-leaking boner with a toe. <i>“Silly " + pc.mf("boy","girl") + ". Now, about that stroking....”</i>");
	output("\n\nHer tail unwinds, releasing your length. You keep licking, figuring she’s going to start stroking. The truth turns out to far, far more unusual than that. Her spaded tail-tip appears on your leaking [pc.cockHeadBiggest], rubbing back and forth. You feel its smooth surface splitting apart, opening up. It exposes a veiny shaft that can’t be more than a few inches long. It doesn’t feel overly girthy either, but when she aligns it with your pre-pissing cock-slit, you realize that it’s more than thick enough for what she intends.");
	output("\n\nYou pull away to protest, only to have your face rammed back into the demonic cleft with a double-handed grip. The cock-tail follows her hands’ example and forcefully plows your [pc.cockBiggest] wide open. Luckily, you were horny enough that you’re full of pre-cum. The copious cock-juice makes the dick-on-dick penetration far less painful than you anticipated. In fact... feeling her sliding deeper feels kind of nice. Your [pc.cockBiggest] lurches approvingly.");
	
	pc.cockHoleChange(pc.biggestCockIndex());
	
	output("\n\nSera gloats, <i>“See? With a dick this big, it might as well be a pussy. It’s too huge to properly fuck anybody, so all it’s good for is slobbering over a more appropriately sized dong.”</i> She pushes her tail down until her veiny tail-prick is inside your base, then begins the long, slow slide back up. Pre-cum escapes your stuffed cumvein in huge dollops, squeezed out by the absurd penetration. You whine into Sera’s pussy, shuddering. It feels good - really good.");
	output("\n\n<i>“You’re really getting into this, meat.”</i> She moans, interrupting herself. The demon’s hips roll against you eagerly. <i>“Fuuuuck, that’s a good name for a big-dicked slut like you. Meat. It’s the only thing about you worth remembering, besides maybe your tongue.”</i> She pushes you against her by your [pc.hair]. <i>“Harder. I wanna cum from my cunt, not from fucking that bloated pussy you call a member.”</i> Sera’s pussy gets wetter on your tongue. She’s obviously getting off on the degradation. You’d be lying to yourself if her taunts weren’t making your [pc.cocks] jump, either.");
	output("\n\nThe demoness’ feminine tang is all over your [pc.tongue], and you’re thrusting it inside her as rapidly as your biology will allow. At the same time, you’re keeping your [pc.lips] spread wide enough that her clit stays nicely sealed inside, allowing you to suckle it. Sometimes you even manage to scrape your taste buds across its sensitive surface. When you do that, Sera almost instantly fills your maw with girlcum.");
	output("\n\nHer handling of your head is getting rougher and rougher. Pretty soon, she’s mashing your [pc.face] so hard against her box that it’s difficult to properly please her. She’s basically grinding herself off on your face. Meanwhile, her tail is pumping faster and faster. She may have acted like she didn’t want to cum with it, but with the way it’s fucking the inside of your cock, filling you with its own eager, pre-emptive syrup, you have to doubt it.");
	output("\n\nSera doesn’t take long to start a squirting, squelching orgasm, first gushing into your mouth and then into your [pc.cockBiggest]. There’s a flood of her tangy sauce bulging your cheeks and squirting out of the corners of your mouth even though you’re dutifully and instinctively swallowing. The sensations radiating from your giant member are so wonderful, and you’re so close to cumming, that when she explodes inside you, stretching you wider with the extra girth her passion lends, you start a climax all your own.");
	output("\n\nThe tailcock had a huge headstart on you, though. Your cum-tube is absolutely flooded with her alabaster stuffing before your own [pc.cum] can escape your [pc.balls]. You feel it pushing deeper into you with each pump, all the way until it meets the tide of your pending release. Hot, pleasant pressure overwhelms you as your muscles work to expel a double load. After a moment of confusing back and forth, the sperm-filled wave hits your [pc.cockBiggest], pushing Sera’s tiny tail-prick just in time let your uncorked [pc.cockHeadBiggest] blow.");
	
	var cumQ:Number = pc.cumQ();
	//light cum
	if(cumQ <= 200) output("\n\nThough the cum is almost all hers, it feels as good as if you made it all yourself. It splatters everywhere, but mostly over your [pc.legOrLegs].");
	//Medium cum
	else if(cumQ <= 1000)
	{
		output("\n\nThe eruption of mixed spunk ");
		if(pc.fluidColorSimple(pc.cumType) == "white") output("comes as an indistinguishable mass of white. You can’t tell where yours starts and hers begins, but there’s a lot of it, soaking your [pc.legOrLegs] and making a puddle on the floor.");
		else output("comes out as a swirling mix of [pc.cumColor] and white. The rainbow jism spatters across your [pc.legOrLegs], effectively painting");
		if(pc.legCount == 1) output(" it");
		else output(" them");
		output(" before starting a puddle below.");
	}
	//Big+ Cum
	else
	{
		output("\n\nThe eruption of mixed spunk ");
		if(pc.fluidColorSimple(pc.cumType) == "white") output("might be an indistinguishable mass of white, but there’s so much that you’re sure most of it is your own.");
		else output("materializes as a mix of [pc.cumColor], white, and every color in between, though most of it is your own.");
		output(" The first rope alone is enough to completely drench your [pc.legOrLegs], and each successive blast of [pc.cumColor]");
		if(pc.fluidColorSimple(pc.cumType) == "white") output(" and white");
		output(" fills a lake around your ankles.");
		if(cumQ >= 5000)
		{
			output(" It spreads across the entirety of the floor before");
			if(cumQ <= 10000) output(" stopping");
			else if(cumQ <= 20000) output(" rising to ankle height");
			else if(cumQ <= 40000) output(" rising to knee height");
			else output(" threatening to drown you both");
			output(".");
		}
	}
	//Merge
	output("\n\nYou slump over into the mess, still leaking trickles of whit");
	if(pc.fluidColorSimple(pc.cumType) == "white") output("e");
	else output("ish-[pc.cumColor]");
	output(", but Sera isn’t quite done with you. She sticks her tail in your face and says, <i>“Clean up your mess.”</i> Still dazed, you obey, polishing the diminutive rod with your tongue. It’s half-hard when she pops it out, but the spade closes back up around it. If you hadn’t just taken it past its hilt, you’d never suspect her demonic tail concealed such a tool.");
	output("\n\nSera walks away to clean herself. In seconds, she’s looking as fresh as a daisy while you look like a cum-stained wreck. She tosses the used towel your way and mans the counter, not caring in the slightest if you reek like her spooge by the time you’re done wiping.");
	output("\n\nThe only thanks you get is a <i>“Nice tongue-work, meat.”</i> when you hand the soiled fabric back to her. She tosses it in a chute without a second glance and looks to the door, bored with you and awaiting her next client.");
	if(cumQ >= 5000) output(" She’s lucky there are drains in the floor sucking away all the cum!");
	processTime(30+rand(10));
	pc.girlCumInMouth(chars["SERA"]);
	sera.orgasm();
	pc.orgasm();
	IncrementFlag("SERA_URETHRA_TAILFUCKS");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
	
//(Catch) Double (TRIPLE!?) Penetration
//Savin-sama-dono-chan
public function catchEverythingInYoButtBySavinForSeraDogcock():void {
	clearOutput();
	author("Savin");
	showSera();
	output("You nod your assent to the demon-morphed mistress’s demand, which earns you a small grin from her blue-sheened lips.");
	//If PC “cat” score > 3 and “dog” score < 4
	var isCat:Boolean = (pc.earType == GLOBAL.TYPE_FELINE || pc.catDog("nyan", "bork") == "nyan" || (pc.felineScore() > 3 && pc.canineScore() < 4));
	if(isCat)
	{
		author("Nonesuch & Savin");
		output(" <i>“Then prove it. Meow, little pussy.”</i> You hesitate a moment, not sure if she’s being serious, and her slim smile fades into a sneer. <i>“I said MEOW, slut.”</i>");
		
		if(flags["SERA_STUCK_IT_ALL_IN_BUTT"] == 0)
		{
			output("\n\nNo way you’re going to ACTUALLY meow like a little kitty for her. Sera merely crosses her arms under her pronounced, purple promontories, tsking her tongue. <i>“I guess you weren’t serious about wanting some of this,”</i> she says, her thick prick twitching between her supple thighs. <i>“Too bad.”</i>");
			output("\n\n<i>“Wait,”</i> you answer, putting out a hand to stop her from turning away from you. <i>“I didn’t... I mean, I do, but...”</i>");
			output("\n\nShe cocks an eyebrow at you, but her sneer slowly fades. <i>“Alright, meat, I’ll go easy on you this time. But next time...”</i>");
		}
		output("\n\n<i>“Meow!”</i> you answer");
		if(pc.hasTail()) output(", raising [pc.eachTail]");
		output(", approaching your mistress and lowering down to your knees.");
		output("\n\n<i>“Now there’s a good kitty cat,”</i> she teases, long fingers running " + (pc.hasHair() ? "through your hair" : "across your head") + " before hooking firmly behind your head, guiding your down until you’re kneeling before her, arms raised like a begging bitch. Seeing your debase yourself certainly seems to send a thrill through the demon-babe: her cock jumps to attention as you settle between her legs, raising up like a flagpole to loom over you, firm and throbbing in its immensity. <i>“Does pussy want a taste?”</i>");
		output("\n\nYour eyes roll up to gaze upon the majesty of Sera’s mammoth member as it hangs over you; the purple temptress releases her tensed cock-muscles just enough to let it her prick flop onto your face. You give a muted gasp as the hot, musky rod twacks you on the cheek, rolling off the side of your face to hang beside your mouth, primed for entry. Sera leans back against the counter, arms braced on the edge, tail wiggling with anticipation. <i>“C’mon, slut-kitty, open wide. Where this is going next, you’re gonna be thanking me for every second I let you suck my cock beforehand.”</i>");
	}
	// Default
	else
	{
		output(" <i>“Then prove it. Bark, little " + pc.mf("doggy", "bitch") + ".”</i> You hesitate a moment, not sure if she’s being serious, and her slim smile fades into a sneer. <i>“I said BARK, slut.”</i>");
		
		//if first-time:
		if(flags["SERA_STUCK_IT_ALL_IN_BUTT"] == 0)
		{
			output("\n\nNo way you’re going to ACTUALLY bark like a little doggy for her. Sera merely crosses her arms under her pronounced, purple promontories, <i>tsk</i>ing her tongue. <i>“I guess you weren’t serious about wanting some of this,”</i> she says, her thick prick twitching between her supple thighs. <i>“Too bad.”</i>");
			output("\n\n<i>“Wait,”</i> you answer, putting out a hand to stop her from turning away from you. <i>“I didn’t... I mean, I do, but...”</i>");
			output("\n\nShe cocks an eyebrow at you, but her sneer slowly fades. <i>“Alright, meat, I’ll go easy on you this time. But next time...”</i>");
			//End first-time variant
		}
		//Start here If PC is a cockslut OR PC is an Ausar-type:
		output("\n\n<i>“Woof!”</i> you answer, wagging ");
		if(pc.tailCount > 0) output("your [pc.tails]");
		else output("your [pc.butt] like a tail");
		output(" while approaching your mistress.");
		output("\n\n<i>“Now there’s a good puppy,”</i> she teases, long fingers running ");
		if(pc.hasHair()) output("through your hair");
		else output("across your bald pate");
		output(" before hooking firmly behind your head, guiding you down until you’re kneeling before her, arms raised like a begging bitch. Seeing you debase yourself certainly seems to send a thrill through the demon-babe: her cock jumps to attention as you settle between her legs, rising up like a flagpole to loom over you, firm and throbbing in its immensity. <i>“Does pup want a taste?”</i>");
		output("\n\nYour eyes roll up to gaze upon the majesty of Sera’s mammoth member as it hangs over you; the purple temptress releases her tensed cock-muscles just enough to let her prick flop onto your face. You give a muted gasp as the hot, musky rod twacks you on the cheek, rolling off the side of your [pc.face] to hang beside your mouth, primed for entry. Sera leans back against the counter, arms braced on the edge, tail wiggling with anticipation. <i>“C’mon, slut-puppy, open wide. Where this is going next, you’re gonna be thanking me for every second I let you suck my cock beforehand.”</i>");
	}

	output("\n\nYou gulp");
	//if PC is a buttslut:
	if(pc.ass.looseness() >= 3)
	{
		output(", but your [pc.asshole] twitches in eager response to her threat, ready and willing to be filled with a nice, thick cock. Your mind fills with a haze of lust, already imagining the filling fullness of her meat spreading your asshole wide, filling you with cum until it’s pouring out of you like a faucet.");
		if(pc.hasCock()) output(" Even your [pc.cocks] can’t help but spring to life at the thought, half-hard without so much as a touch");
	}
	output(".");

	output("\n\nThe insistent heat on your cheek demands attention, however. You nuzzle against Sera’s girthy manhood, rubbing ");
	if(!pc.hasBeard()) output("your smooth cheek");
	else output("your [pc.beard]");
	output(" against the soft flank of her prick, earning yourself a little twitch and hop from her dick as you make your way down towards her meaty crown. You try to take it slow, easing your way toward sucking the demon-girl off, but she angles her spaded tail at your behind, giving it an impatient poke to remind you that you’re on the clock, here.");
	output("\n\nYou hasten your journey towards her demonic crown, finally coming to rest your lips against her turgid cum-shaft, parted just enough so that your tongue can snake out, caressing her slit from stem to stern, eliciting a tiny gasp from her, which she quickly twists into a moan of raw, animal sexuality. <i>“That’s more like it, bitch,”</i> she teases, unceremoniously sliding her hips forward between your pursed lips, filling your mouth with her thick, hot schlong. But from where you’re sitting, that’s all that she’s getting in there: just the first few inches to fill your slavering gob. With a cruel smirk, the demoness grabs your [pc.hair] and rams you face-first down her rod, slamming all twelve inches down your gullet and into the cunt-tight confines of your throat. You gag and sputter around the sudden, violent intrusion, desperately trying to master your churning gag-reflex as your purple mistress face-fucks you, thrusting your head down her throbbing meatpole like a living onahole.");

	output("\n\nSera’s utterly merciless, fucking your throat so hard you can barely breathe, and it’s all you can do to try not to choke on her cock as it stretches your throat, so thick and big that you can feel the huge bulge it’s making in your neck as she pushes it in to the hilt, her hefty balls slapping wetly against your drool-slick chin. Her fingers cup your cheeks, nails digging into your tender [pc.skin] until it’s almost painful, holding you <i>just right</i> as she sighs with pleasure, feeling your throat convulse wildly around her massive member, trying to expunge it, desperate for cock-free air. You can see stars before she finally relents, letting you slide off her cock into a wet, horny mess on the floor, your chin and her prick utterly drenched with your saliva.");

	//if PC has a cock:
	if(pc.hasCock())
	{
		output("\n\n<i>“Oh, what’s this?”</i> Sera quips, looking down at you, hands on her hips and glistening cock dangling, looming over you, still slick and shining from the abuse it levied on your throat. <i>“Did my meat get a little hard from sucking cock?”</i>");
		output("\n\nYou look shamefaced");
		if(pc.legCount > 1) output(" between");
		else output(" at");
		output(" your [pc.legOrLegs], to the growing bulge of your erection ");
		if(pc.isCrotchGarbed()) output("straining against your [pc.lowerGarment]");
		else output("bare and plain for all to see");
		output(". She stifles a snicker at your ");
		if(pc.longestCockLength() <= 5.5) 
		{
			output("tiny, pathetic little cock");
			if(pc.cockTotal() > 1) output("s");
		}
		else if(pc.longestCockLength() <= 12) output("utterly unremarkable cock, so... boring, so average for its kind");
		else output("massive girth, barely able to get half-hard at this angle thanks to its mammoth size, utterly dwarfing her own");
		output(". <i>“Aww, you did. See, meat, I had you pegged the moment you walked in here: you’re an utter cock-whore. I bet you slink home after this and blow ten dudes on the way. Or do you only like girly-cocks, is that it? Does seeing a big, swinging dick under a nice pair of tits turn you on? Can you even jack it to normal porn? I bet you can’t. Hmm, maybe I’ll be nice and show this slutty thing a little love, huh? What do you think about that?”</i>");
		output("\n\nYou nod enthusiastically, only to regret your decision a moment later as one of Sera’s tall platform shoes clatters to the floor beside you. That heel of hers is hollow - from out of it she has withdrawn a bona fide horn stiletto, growing out of the base of her foot.");
		output("You gulp as the bestial appendage looms over your hardening members, its rounded tip just barely grazing the top of your shaft, sending a shuddering wave of pleasure through your body. Her foot reaches up, sole pressing into the base of your cock before pushing down and down, pinning your [pc.cock] to the floor, her vicious heel just barely grazing the [pc.cockHead]; a terrible, incredibly arousing threat. You wince as she half-crushes, half-jacks your dick, rolling her fore-foot and toes across your length. Pre-cum bubbles at your tip, cock twitching as she relentlessly “massages” your length, letting whole minutes go by until your mind is little more than a haze of lust, your hips humping back against her foot, trying desperately to cum but stymied by the agonizing, drifting point of her natural stiletto.");
		output("\n\n<i>“What, are you gonna cum just from getting your cock stepped on,”</i> she sneers, moving her foot faster, <i>“Or are you still just turned on from sucking me off? If that gets you so hard, you’re gonna love what comes next...”</i>");
		output("\n\nYou whimper as she foot-fucks your [pc.cock], harder and harder until it’s agony not to cum, your prick swelling with pent-up need beneath her pumping sole, drooling and sputtering out of your tip in a lake of wasted ejaculate. <i>“Tsk, slutty ");
		if(pc.longestCockLength() < 12) output("little ");
		output("cock,”</i> Sera teases, working her instep down to the tip, pressing it nearly flat on the desk, letting your surging cum build up for a long moment before letting go.");
		output("\n\nWith a shriek of pleasure, you let it all go, your cock erupting in a wave of seed to splatter across Sera’s foot and the deck below. She grimaces as you cum onto her, but says nothing, letting you ride out your longed-for orgasm until you’re nothing more than a quivering pile of lust on her deck, shuddering full-body into the powerful throes of pleasure. <i>“And now you got me dirty. Great job, meat.”</i> Sera crosses her dirtied leg over the other, letting her spunk-drenched high-heel hang in the air. <i>“You better clean that up, if you want me to even THINK about being gentle with that [pc.asshole] of yours. If you were smart, and that’s a big if, you might even slather me up with it. My cock’s gotten a little dry without that pretty mouth of yours to keep it warm.”</i>");
		pc.orgasm();
		//If PC isn't Sera's bitch yet: 
		if(flags["SERA_STUCK_IT_ALL_IN_BUTT"] == 0)
		{
			output("\n\nYou hesitate at the thought of slurping up your own cum, but... the prospect of her going in dry isn’t exactly appealing, either");
		}
		else output("\n\nYou eagerly crawl onto your hands and [pc.knees] before your demonic mistress, wiggling your hips in anticipation of what she’s about to do to you");
		output(". You lean down and cup her spunk-slathered foot, bringing it up to your tongue and licking across its soft, purple surface. You shudder at the taste of your own cum, utterly ");
		if(flags["SERA_STUCK_IT_ALL_IN_BUTT"] == 0) output("revolted");
		else output("turned on");
		output(" by the syrupy texture of your spunk. You spend a few long seconds polishing the horn of her stiletto to a fine shine, making sure not to swallow, before rising up to your [pc.knees] and wrapping your lips around her rock-hard demon wang, sucking her cock right back up and slathering it with your spunky lube. She gives a little moan of satisfaction as you fellate her, doubly so when your tongue starts spreading your thick cream across her length, but after a few moments, points an accusing finger to the tiny lake of sperm still splattered across the deck.");
		output("\n\n<i>“Don’t think I was letting you off THAT easy, meat. Drink up,”</i> she says, pushing you off her cock and down to the floor. With an obedient whimper, you all but put your nose in it, lapping up your hot, sticky seed and delivering it back to your mistress’s cock, coating her from tip to base in a sheen of semen. She gives you an approving smile as you go down for seconds, spending a good minute cleaning her deck with your tongue until it sparkles.");
		output("\n\n<i>“Gooood " + (!isCat ? "doggy" : "kitty") + ",”</i> she coos as you take her dick to the hilt, coating it with as much spunky, salivating lube as you can muster, trying to make things easier on yourself later.");
		//End PC cock Variant
		pc.loadInMouth(chars["PC"]);
	}
	output("\n\n<i>“Now it’s time for the main course,”</i> she grins, grabbing you by the hair and throwing you up against the counter. You gasp as the wind’s knocked out of you, doubling over the counter as the demon babe steps up behind you, flopping the shaft of her big, wet cock between the crack of your ass. You squirm as she locks her fingers into your [pc.hips], holding your ass dead steady, all but bending you over the counter as she gets ready to take her pleasure from your body. You can feel her sloppy, wet schlong trail down your cleft, a hefty foot-long slab of demon meat ready to pound you into the ground. At least she gave you the chance to lube it up!");
	output("\n\nInstinct kicks in, and you wince back as the head of her cock brushes against the tight-clenched ring of your [pc.asshole], sending a little shock through your body. You try your best to relax, letting yourself go in Sera’s strong, unyielding grasp; slowly, your sphincter relaxes, just enough to admit the thick, wet head of Sera’s crown. A low, desperate moan escapes your lips as your body reacts, ass spasming against the sudden, girthy intrusion but unable to push it back thanks to all the lube you’ve slathered it with. Sera’s hands dig into your flanks, relentless in her advance. All you can do is dig your fingers into the counter and grit your teeth, trying to relax and failing utterly as Sera batters her way into your ass.");
	pc.buttChange(chars["SERA"].cockVolume(0),true,true,false);

	//if PC is tight:
	if(pc.ass.looseness() <= 2) output("\n\n<i>“Ooooh, nice and tight back here,”</i> Sera comments, giving one of your cheeks a hard smack. <i>“Don’t tell me this is your first time, meat. Or do you only let the special dick-girls in back here?”</i>");
	//if PC is moderately loose:
	else if(pc.ass.looseness() <= 4) output("\n\n<i>“Aww yeah, now that’s what I’m talkin’ about. You had some Naughty Wyvern toys back here before, or are you just THAT much of a buttslut?”</i>");
	//if PC is MEGALOOSE: 
	else output("\n\n<i>“Hoooolyyyy shit, meat, what have you had back here? Been getting friendly with some centaurins, or are you more of a ‘get twenty dicks in my ass at once’ kind of " + pc.mf("guy","girl") + "? Shit, I might have to splice up again -- feelin’ kind of inadequate back here!”</i>");
	output("\n\nYou try to respond to the demoness’s teasing, but find your voice breaking into a high-pitched cry of pleasure as she slams into you, force-fucking all twelve inches of cock into your ass until her balls are slapping wetly against ");
	if(pc.balls > 0) output("your own");
	else if(pc.hasVagina()) output("your cooch");
	else output("your bare groin");
	output(". You give a last gasp of startled half-pleasure before collapsing onto the counter, breathing hard as your body adjusts to the massive, full feeling of such a thick cock inside you. A moment later, you’re pushed down against the cool glass, feeling the sweltering heat of the demoness’s body pressing against your back, her big, soft breasts fitting nicely between your shoulders -- and acting like a headrest as she pulls your head back, making you look up at her as she looms over you, gently rocking her hips to settle her cock deep inside your ass.")
	output("\n\n<i>“How’s it feel, slut? Like the feeling of me stretching your ass out?”</i>");
	output("\n\nYou try to nod, but her hand gripping your head refuses to budge, holding you still.");
	output("\n\n<i>“I can’t hear you, slut. And neither can my cock. Let us hear you say it, and maybe I’ll actually </i>fuck<i> you like you deserve.”</i>");
	output("\n\nYou hesitate for only a moment, only able to hold yourself back for that split second it takes her cock to twitch inside you before you cry out, <i>“F-fuck me! Fuck me, please!”</i>");
	output("\n\n<i>“Fuck you like what?”</i> Sera says, a hand caressing your cheek, turning your head to rest against her bountiful bosom.");
	output("\n\n<i>“Fuck me like a </i>whore<i>,”</i> you cry, bracing yourself against the counter again as the demoness smirks and lets you go.");
	output("\n\nHer hands return to your [pc.hips], and you feel the slow, laborious removal of her cock from your [pc.asshole], leaving you with the familiar feeling of cold emptiness as she pulls half way out of you -- only to ram back in at full force. You give a startled cry, back arching as Sera fucks you hard and fast, relentlessly pounding away at your hole like the dirty whore you are. She hooks an arm around your neck, pulling you up into a deep arch, holding your back against her heaving chest as her hips slap against your [pc.butt] again and again. You cry and moan, your [pc.hips] thrusting back to meet that glorious cock of their own volition, begging for more and more.");
	//If PC has a cooch:
	if(pc.hasVagina()) 
	{
		output("\n\nSuddenly, you feel another warm, hard pressure against your [pc.legOrLegs]. You yelp and look down, seeing Sera’s tail swishing");
		if(pc.legCount > 1) output(" between");
		else output(" around");
		output(" your [pc.legOrLegs]... and another cock where the spade ought to have been.");
		output("\n\n<i>“I know your type,”</i> Sera grins as the tail-cock lines up with your [pc.vagina], its length wriggling excitedly between the violent thrusts of her hips. <i>“A slut like you couldn’t be satisfied with just one cock, could you? So I brought you an extra one...”</i>");
		output("\n\nBetween the brutal ass-fucking you’re already getting, you don’t have much wiggle room to complain... even if you wanted to. And the thought of that other thick member doubling your pleasure quickly erodes any hope of resistance. Instead, you spread your [pc.legOrLegs] as best you can as the little tail-cock demands entrance to your sex. A yelp of pleasure escapes your mouth as the cock thrusts into you, spearing your [pc.vagina] right to the mouth of your womb, thrusting in without the faintest hint of a rhythm, driving you wild with its erratic thrusts between her hip-slapping ass-fucking.");
		pc.cuntChange(0,8,true,true,false);
	}
	//If PC has a tail-cock:
	if(pc.hasCockTail())
	{
		output("\n\n<i>“Oh, and you’ve got a little hard-on back here, don’t ya?”</i> Sera coos, grabbing your animalistic tail, fingers wrapping around your extra cock. You wince as her fingers brush your tender, exposed flesh, gripping the tail-cock tight for a few moments before wrapping it around her hip and leading it out of sight. You groan, back arching as you feel your cock being swallowed by something tight and hot, gobbling up your wriggling tail-prick to the hilt.");
		output("\n\n<i>“Mmm, I’ll let you in on a secret, meat: the trick to a dick-girl’s heart is riiiiight there,”</i> she moans, slapping your ass as your cock brushes up against something bulbous inside her.");
	}
	output("\n\nSuddenly, you feel a flood of warm wetness inside you. You cry out in pleasure as your ass");
	if(pc.hasVagina()) output(" and cooch are");
	else output(" is");
	output(" bombarded with an unannounced orgasm, signaled only by the suddenly frantic pounding of Sera into your ass, her breath heavy and hot on your back. You take it like a champ, barely buckling under her vigorous thrusts as she fills you with her demonic seed");
	if(pc.hasCockTail()) output(", and even giving it right back to her, thrusting your tail-cock into her ass until you join her in orgasm, the flood of hot cum on your prostate finally throwing you over the edge. You shoot your load deep up the demon’s ass, locking you into a cycle of ass-fucking and cumming until you’re both exhausted and panting and desperate for more");
	output(". Grabbing your ass, Sera finally manages to drag herself out of you, spunk drooling from your abused hole");
	if(pc.hasVagina()) output("s");
	output(" onto her floor.");

	output("\n\n<i>“Fucking nice, meat,”</i> she growls, giving you a harsh spank as her crown finally pops free from your behind with an echoing wet squelch. A heavy sigh escapes her lips as she leans back against the counter and pulls out a cigarette.");
	if(pc.hasCockTail()) output(" It takes her a moment longer to finally yank your tail-cock from her ass, though; and when she does, a nice little waterfall of cum drizzles down with it.");
	output("\n\n<i>“What’re you still doing here?”</i> she adds a moment later, interrupting your after-glow. <i>“Go on, get outta here before people start talking. Unless you want me to bend you over this counter again and open you up to my favorite customers? That’d draw in business.”</i>");
	//If PC isn't a bitch:
	if(flags["SERA_STUCK_IT_ALL_IN_BUTT"] == 0) output("\n\nYou shudder at the thought");
	else output("\n\nBefore you annoy the mistress, you hurriedly gather your things");
	output(" and run off.");
	IncrementFlag("SERA_STUCK_IT_ALL_IN_BUTT");
	processTime(40+rand(10));
	pc.loadInAss(chars["SERA"]);
	if(pc.hasVagina()) pc.loadInCunt(chars["SERA"],0);
	sera.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Sera Cockvine Scene
//Add to existing pool of PC-has-submitted scenes if PC has tail-cock
public function seraCockvineScene():void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	output("<i>“Oh, hello. What do we have here?”</i>");
	output("\n\nYou shiver as you feel the flat of a purple talon run up the length of your [pc.tail]. It reacts eagerly, swelling with lust and rearing up towards your mistress’s face.");
	output("\n\n<i>“Oh wow,”</i> she laughs, standing her curvy form over you and gazing into the thing’s moist slit. <i>“My cute little pet has got themselves infested with one of these new parasites I’ve been hearing about.”</i> She reaches out and grips the " + (pc.tailType == GLOBAL.TYPE_COCKVINE ? "cockvine" : "phallic tail") + " firmly, a few inches below the head.");
	output("\n\n<i>“You... know about these things, mistress?”</i> you manage. Pleasure flares along your tail as Sera shifts her grip up and down the lust-swollen appendage.");
	output("\n\n<i>“Uh, yeah?”</i> she snorts, whipping her own tail around, curling it around your neck with a practiced flick. <i>“One of them attached itself to some bimbo celebrity recently, and now everybody wants one.”</i> She undoes her tail suddenly, the pulpy spade slapping you sharply on the cheek as it departs. All the while her hand coils your [pc.cockTail], forcing more and more tight, floral lust down its shaft... <i>“Fucks me off to be honest. I pay top " + (isAprilFools() ? "dogecoin" : "credit") + " to get my own tail done, and then it turns out you can get one by bending over for some shrub? Typical. And typical cock-addicted </i>you<i>, letting one of these disgusting, creepy things slither themselves onto you. Ugh!”</i>");
	output("\n\nShe neither looks nor sounds disgusted. The tone of malicious delight that you’ve come to know so well is clear to hear, and her teal lips are split with a big, toothy sneer as she strokes and fondles your parasitic tail, make it coil and ripple with greedy lust. You groan as it darts, out of your control, batting Sera in the boob as it wriggles its way downwards. <i>Oh Void, please don’t do that...</i>");
	output("\n\n<i>“Ooh,”</i> coos the demon morph, grin widening. <i>“Does somebody smell something interesting?”</i> She parts her full, smooth thighs slightly; it takes all of your willpower to stop the [pc.cockTail] from burrowing eagerly past her thick, semi-erect dick towards the bare, damp hole it can sense back there.");
	output("\n\n<i>“I see how it is,”</i> murmurs Sera, reaching down to again take a firm grip of the throbbing tentacle, stroking its head like an unruly pet. <i>“You aren’t really in control of this thing, are you slut? And you </i>like<i> that. You like being weak and a slave to an alien creature’s lusts, having a dripping snake-dick attached to you that does whatever it pleases, when it pleases.”</i>");

	if(pc.willpower() + rand(20) + 1 >= 15)
	{
		output("\n\n<i>“No...”</i> you manage to groan. It’s really very difficult when she’s fondling your [pc.cockTail] so closely.");
	}
	else output("\n\nYou can’t say anything at all. It’s impossible when she’s fondling your [pc.cockTail] so closely.");
	output(" Sera smirks, before slowly leading the cock-vine back behind her male sex, brushing it against her soft inner thighs and pushing its head against her slightly parted pussy lips. Fierce excitement rockets down the ropy appendage, making you gasp slightly.");

	output("\n\n<i>“Let’s see, shall we?”</i> your mistress breathes, her luminescent eyes gazing imperiously down at you. <i>“I’m going to use this disgusting tail of yours to get some much-needed satisfaction - but bitches don’t get to cum inside me. If you can control yourself, I’ll reward you. If you can’t...”</i> she trails off, biting her lip. She releases her grip on your straining tail-cock, and it immediately thrusts itself into the warm, moist hole of her vagina.");

	output("\n\nSera coos, eyes half-closing as the thick dick-vine eagerly wriggles itself into her deep, tight tunnel, the writhing of it evidently sending pleasure vibrating through her. Your hands ball into fists on your [pc.knees] as the [pc.cockTail] does as it so desperately wants to do - thrust its bulging, tender head into a fertile hole, plough it good and then thoroughly seed it. But you are in control of it, you are! With a slight bark of effort, you flex those strange nerve ends at the bottom of your spine and grab hold of the reigns on the coiling, frenzied appendage. Slowly the thing stops shaking around wildly, and thrusts back and forth into your mistress’s slick pussy in a measured fashion.");
	output("\n\n<i>“Ahh,”</i> Sera sighs, somewhere between sighing arousal and slinking menace. The energetic pump of your tail-cock translates through her whole body, her big, perky boobs bouncing gently. <i>“So you can make it dance to your tune if you want! It just requires a little bit of incentive.”</i> She closes her hips, and her pliant cunt muscles suddenly clench up around the " + (pc.tailType == GLOBAL.TYPE_COCKVINE ? "cockvine" : "phallic tail") + "’s shaft, forcing a gasp past your [pc.lips]. The underlying current of green, alien lust flares up, and the tail-cock shivers right down its undulating shaft. Sera snickers, high pleasure plucking at her tones. <i>“Let’s see how we do once your mistress really gets what she needs, huh?”</i>");
	output("\n\nThe succubus rocks backward and forward on her heels, breasts blatting steadily against her corset as she wrings the cock-vine stuck in her wet tightness, steadily increasing in pace as her own excitement takes over. Good fucking void can she squeeze if she wants to - has she had work done to her female sex too? Her pussy seems to be able to grip your over-stimulated tail up and down, like the warmest, wettest, most skilful hand-job imaginable. Her reptilian eyes stay fixed on your face, glorying in the sadistic power she has assumed over you. You can’t stop the sexual anguish you feel showing there; your [pc.cockTail] is now absolutely desperate to spray its load in this wonderful, tight breeding hole it’s found, and only your own urging is preventing it. A single drop of sweat works its way down your temple and you moan.");
	output("\n\n<i>“Aww yeah, that’s it,”</i> gloats Sera, reaching down to jerk her own twelve-inch dick furiously a few inches away from your nose, utterly drunk on her own dominance. <i>“Hurts so good, doesn’t it? Fuck, I wish I could paint that expression on you 24/7.”</i> Her pussy ripples around you, femcum dripping down your unbelievably pent-up tentacle cock, and your own cry combines with Sera’s squawk of joy. She rides the bulging, tender flesh inside her with violent pushes of her hips, hand thwipping down her erect cock with savage flicks of the wrist. <i>“Hold onto it for just a little longer, slut...”</i> she groans. <i>“Just a little more...”</i>");

	// ++ Lust
	pc.lust(100);
	processTime(10);
	IncrementFlag("SERA_TAILED");
	
	clearMenu();
	//Medium willpower check. If succeed, display choice. If fail automatically go to <i>“release”</i>. If lust > 84% go to <i>“release”</i>.
	if(pc.willpower() + rand(20) + 1 >= 15)
	{
		//[Hold Back] [Release]
		addButton(0,"Hold Back",holdBackForSera,undefined,"Hold Back","Your mistress gave you an order. You can do this!");
		addButton(1,"Release",releaseCuntailonSera,undefined,"Release","It’s too good not to.");
	}
	else addButton(0,"Next",releaseCuntailonSera);
}

//Hold Back
//Tooltip: Your mistress gave you an order. You can do this!
public function holdBackForSera():void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	output("You grit your teeth, absolutely determined that your tail-cock isn’t going to cum inside your mistress’s pussy. For a moment you think it is going to get away from you - it’s utterly soaked and loaded with lust, entranced with the moistened honey-trap it’s stuck in - but you clamp down on it hard, denying it with all your will. You exhale raggedly as Sera throws her head back and cries out, her cunt rippling up and down your writhing [pc.cockTail], drops of clear lubricant squirting around her stuffed entrance. Several moments of gratuitous female orgasm cascades into a male one, and she crows as her over-sized cock swells up around her shifting fingers and shoots streamers of musky, pearly jizz onto your hot face. It barely even registers that you’re taking a load this way, even with her throbbing, dilated cockhead in your face; all of your attention is on your tender, bulging dick-tail, ruthlessly used but horribly denied. Alien desire sinks its fingers deep into your mind.");
	output("\n\nSera rides out the last of her double orgasm and then, with a deeply satisfied sigh, she casually reaches down and pulls your [pc.cockTail] out of her relaxed, dripping twat. It shivers with angry, pent-up lust, sending one throb after another down its lithe, sturdy body - but still, you are able to stop it pulling out of her taloned hand and attempt to bury into her pussy again.");
	output("\n\n<i>“Very well done,”</i> she croons, smiling toothily down at you. A glow of achievement spreads across your breast, and you grin back, warm cum oozing down your cheeks. <i>“All you needed was your owner telling you to do it for you to be able to! It’s what I like to see.”</i> Your grin turns into a round <i>“oh”</i> as Sera strengthens her grip on your bulging, slickened cock-vine, stroking the sensitized dick flesh. <i>“I’m guessing you want your reward now.”</i> Up and down, up and down goes her smooth, warm hand.... <i>“Do you? Does bitch want [pc.hisHer] cummies?”</i>");
	output("\n\n<i>“Yes mistress,”</i> is the only response you’re capable of giving.");
	output("\n\n<i>“Very well,”</i> the demon morph smirks. She increases the tempo at which she’s jerking your [pc.cockTail], whipping her grip up and down its thick length with the same energy she used to wanked herself; at the same time, she inexorably bends the tail around so that its moistened head is pointing at you. Utterly intoxicated with her touch, the " + (pc.tailType == GLOBAL.TYPE_COCKVINE ? "cockvine" : "tail") + " obeys her completely. Your moan is momentarily drowned out by a huge, warm gush of plant cum spraying you directly in the face; brilliant, overflowing release rocks your body as Sera breezily jerks you off, adding to the generous amounts of jizz she’s already plastered across your features. The back-up is such that she’s got more than enough to completely cover your face, gel your [pc.hair], artfully scribble across your [pc.chest]... a long, glorious, juicy orgasm, used to completely despoil you.");
	output("\n\nThe last pulse oozing onto the floor and a throaty giggle tell you, at last, you can wipe your eyes clear and look up. Sera lets your lolling, throbbing " + (pc.tailType == GLOBAL.TYPE_COCKVINE ? "cockvine" : "tail") + " fall from her hand and casually swaggers her purple butt back behind the counter, leaning on it to drink your drenched form in.");
	output("\n\n<i>“Hmm,”</i> she smirks contentedly, toying with her hair. <i>“A lustful tail-dick attached to you that </i>I<i> control. Very nice indeed. I think we’ll do this again. Regularly.”</i>");
	processTime(10);
	sera.orgasm();
	sera.orgasm();
	pc.orgasm();
	pc.applyCumSoaked();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Release
//Tooltip: It’s too good not to.
public function releaseCuntailonSera():void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	output("You just can’t help yourself. Or rather, you just can’t help the " + (pc.tailType == GLOBAL.TYPE_COCKVINE ? "cockvine" : "parasitic tail") + "; you cannot say no to that fiery alien lust wresting control from you. You clutch your [pc.knees], throw your head back and cry out as you let go and surge to orgasm, your [pc.cockTail] opening wide and fluming its thick seed into the clutch of Sera’s pussy. Too fixed upon her own high the demon-morph does nothing but hiss her disapproval, and continues to ride the spurting tentacle dick heedlessly. Denied for so long, it fills out the succubus’s fuck-pocket easily and spurts heavily around its own writhing girth, every pulse unutterably delicious. Somewhere in there Sera cums as well, her semen splattering in your face and pussy clamping up around your pulsating tail-cock, but you don’t care; it’s so good to sink back into that over-charged alien lust, bathe in that primal gratification of seeding a fertile womb... you’ve got to enjoy every moment of this, because when it ends...");
	output("\n\n<i>“So I was right then.”</i> Sera’s malicious tone slices straight through the wonderful, happy cloud that settles upon you after you’ve pulsed your last. The traitorous cock-vine oozes itself out of her thoroughly creamed pussy and flops down, leaving you alone to face the music. <i>“You can’t control it, even if your owner demands it. You really are a slave to your own lusts, aren’t you bitch?”</i>");
	output("\n\n<i>“I’m sorry, mistress,”</i> you try. <i>“I -”</i>");
	output("\n\n<i>“I don’t suppose I’d have it any other way though,”</i> Sera sighs, grimacing as she parts her thighs and looks down. <i>“If you weren’t such a spineless little " + pc.mf("worm","cum dump") + " you’d never put up with my abuse, would you? And then there’d be no fun at all.”</i>");
	output("\n\n<i>“So you aren’t mad?”</i> you say, staring at the off-white slime sliding down her flawless thighs.");
	output("\n\n<i>“Mad? Why? Because you got yourself infested with a parasite that is going to constantly get you into trouble? Naw,”</i> laughs the succubus. She ");
	if(!pc.hasHair()) output("pats you on the head");
	else output("rubs your [pc.hair]");
	output(" fondly. <i>“It means I get to punish you more often.”</i> She draws over a chair, sits herself down and fully opens her thighs, magisterially considering you kneeling in front of her.");
	output("\n\n<i>“You will begin by cleaning up the mess you made with your tongue - pussy and the floor. Then...”</i>");
	processTime(1);
	sera.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",releaseCuntTailOnSeraCleanup);
}

public function releaseCuntTailOnSeraCleanup():void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	//Time forward an hour
	processTime(50 + rand(11));
	pc.loadInMouth(chars["COCKVINE"]);
	//Reduce PC health by 5% and energy by 30%, move them to square outside Dark Chrysalis
	pc.HP(-5);
	pc.energy(-30);

	output("You lean against the wall outside the Dark Chrysalis a while later, gathering yourself. Your mouth is absolutely caked with the musky, slightly herbal tang of plant cum, and your [pc.ass] and back sting mightily from the whip welts that have been enthusiastically applied there. You can’t help but look venomously down at your [pc.cockTail], which is still throbbing with post-coital bliss. Next time, you swear to yourself. Next time, you’ll control it.");
	
	currentLocation = "9018";
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}