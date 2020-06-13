/*Kally (Kally?) Idears
Easygoing, laid back bartender.
Wears this, basically.
13" wangus when hard. 12" when soft.
Will fuck almost anyone but only ever becomes emotionally attached to one person. (OH GOD IM MAKING THIS A WAIFU, ARENT I?)
Drops the occasional "eh?"
Fiercely protective of her establishment.
Modded cum - includes an alcohol-like, empathy boosting substance. Lends her cream a slightly nutty, hoppy flavor. Getting drunk on it tends to result in lots of "I love you, maaaaan" (Mixed in a lot of drinks!)
Went to Vesperia on an indentured service contract as a cook after hearing of her sister's exploits. Figured it was the only way to see a new planet.
Paid off her contract quickly, and with a little help from a mysterious gift in the mail (Bigass chunk of polished picardine), she opened up a bar on one of Vesperia's biggest trade hubs.
Obviously a "gift" from her sister to help her get started, but SHE DONT KNOW IT.
With success, she's slowly bought up the retail space around the lodge to expand it, adding additional bunks as well as a public bath styled after her homeworld's facilities.
Sent Kiro a humblebrag email about it. Is sad about her missing sister if the PC didn't rescue her. Or maybe Kiro eventually got rescued and is in a hospital or jail?
Scene where the PC can slip her a drink with cum in it, sending her into ball-swelling overdrive? (Resulting in the Incase picture)
"Milk From the Tap" scene?
Kiro Threesome?*/

/* TEST */

/*FLAGS:
	flags["KIRO_PHONE_EVENT"]			1  = WINGMANNED AND SENT TO RECIPIENT.
										2  = SENT TO KALLY!
										-1 = FUCKED THIS SHIT, YOU'RE OUT.
	flags["KIRO_KALLY_THREESOMES"]		   = NUMBER OF TOTAL THREESOMES
	flags["KALLY_FAP_2_KIRO"] 			1  = CAUGHT KALLY FAPPING TO KIRO
*/

public function showMabbs():void
{
	showBust("MABBS");
	showName("\nMABBS");
}

public function showKallyAndKiro(nude:Boolean = false):void
{
	if(nude) showBust(kiroBustDisplay(nude),"KALLY_NUDE");
	else showBust("KALLY",kiroBustDisplay(nude));
	showName("KALLY\n& KIRO");
}
public function showKallyAndKiroAndVixette(nude:Boolean = false):void
{
	var vixette:String = "FOX-BOT";
	if(flags["KIRO_KALLY_TEAM_MILKED"] != undefined) vixette = "VIXETTE";
	if(nude) showBust(kiroBustDisplay(nude),"KALLY_NUDE","VIXETTE_NUDE");
	else showBust("KALLY",kiroBustDisplay(nude),"VIXETTE");
	showName("KALLY, KIRO,\n& " + vixette);
}
public function kallyBustString(nude:Boolean = false):String
{
	if(nude) return "KALLY_NUDE";
	else return "KALLY";
}

public function showKally(nude:Boolean = false):void
{
	if(nude) showBust("KALLY_NUDE");
	else showBust("KALLY");
	showName("\nKALLY");
	author("Nukinoxo");
}

public function kiroKallyThreesomes(arg:Number = 0):Number
{
	if(flags["KIRO_KALLY_THREESOMES"] == undefined) flags["KIRO_KALLY_THREESOMES"] = 0;
	if(arg != 0) 
	{
		flags["KIRO_KALLY_THREESOMES"] += arg;
	}
	return flags["KIRO_KALLY_THREESOMES"];
}

public function kiroKallyThreesomeUnlockPoints():Number
{
	var counter:Number = 0;
	if(flags["KIRO_HOT_SIS"] == 1) counter++;
	if(flags["KALLY_KISSED_KIRO"] == 1) counter++;
	if(flags["KIRO_INCEST_TEASED"] == 1) counter++;
	if(flags["KALLY_FAP_2_KIRO"] != undefined) counter++;
	if(flags["KIRO_PHONE_EVENT"] == 2) counter++;
	return counter;
}

public function kiroKallyThreesomesAvailable():Boolean
{
	return (kiroKallyThreesomes() > 0 && flags["KALLY_3SOME_TALK"] != undefined && flags["KIRO_3SOME_REACTION"] != undefined);
}

public function kallySexedCount(arg:int = 0):Number
{
	if(flags["KALLY_GENERIC_SEX_ENCOUNTER"] == undefined) flags["KALLY_GENERIC_SEX_ENCOUNTER"] = 0;
	if(arg != 0)
	{
		flags["KALLY_GENERIC_SEX_ENCOUNTER"] += arg;
	}
	var counter:Number = flags["KALLY_GENERIC_SEX_ENCOUNTER"];
	if(flags["KALLY_BROED"] != undefined) counter += flags["KALLY_BROED"];
	if(flags["KALLY_DRUNK_SNOWBALL_FUCKED"] != undefined) counter += flags["KALLY_DRUNK_SNOWBALL_FUCKED"];
	if(flags["KALLY_BIMBO_TAPPED"] != undefined) counter += flags["KALLY_BIMBO_TAPPED"];
	counter += kiroKallyThreesomes();
	return counter;
}

public function drinkFromTapKally():Number
{
	var drinks:Number = 0;
	
	if(flags["KALLY_BIMBO_TAPPED"] != undefined) drinks += flags["KALLY_BIMBO_TAPPED"];
	
	return drinks;
}

public function kallyIsAway():Boolean
{
	if(pc.hasStatusEffect("Kally Cummed Out")) return true;
	return false;
}

//Kally Repeats
public function kallyBonusRoomTexts():Boolean
{
	//Check for kallySchlick!
	sisterSchlickProcChance();

	if((flags["KIRO_MET_KALLY"] == 3) && MailManager.isEntryViewed("kirodatemeet") && (roamingKiroAvailable() || crewKiroAvailable())) 
	{
		kiroKallyBarMeetOverride();
		return true;
	}
	//Kally's isnt there!
	if(kallyIsAway())
	{
		output("\n\nA small sign sits on the empty bar: ‘Break Time’");
	}
	else if(flags["KIRO_3SOME_REACTION"] == -1)
	{
		showBust("KALLY");
		output("\n\nKally stays busy behind the bar, not bothering to look your way. The cushy kui-tan is wearing her typical barmaid outfit and busy mixing drinks for her thirsty patrons.");
		addButton(0,"Kally",approachKally);
	}
	//Kally sisterfap!
	else if(isKallySisterSchlicking())
	{
		output("\n\n<b>The bar itself is empty for the moment</b>. A glowing neon placard sits on the countertop, declaring that the kui-tan bartender is out to lunch");
		if(hours < 10 || hours >= 14) output(", current time be damned");
		output(". What could she be up to?");
		if(!pc.hasKeyItem("Kally's Bedroom Key") && flags["TRIED_KALLY_DOOR"] != undefined) addButton(0,"Search Bar",searchKallysBar);
	}
	//Picardine reveal scene!
	else if(pc.hasStatusEffect("KallyKiro") && !pc.hasStatusEffect("Wait For Kally Break") && (roamingKiroAvailable() || crewKiroAvailable()))
	{
		if(pc.statusEffectv1("KallyKiro") == 0) kallyHonestKiroEruption();
		else kallyKiroKissEruption();
		addButton(0,"Kally",approachKally);
		if(kiroIsCrew()) addButton(1,"Kiro",crewKiroAtKallysBar,undefined,"Kiro","Kiro is here, if you wanted to talk.");
		else addButton(1,"Kiro",approachKiroAtTheBar,undefined,"Kiro","That tanuki pirate with the giant balls you rescued is here.");
		return false;
	}
	else
	{
		//Inroom Bonus Appearance
		//Not Met
		if(flags["MET_KALLY"] == undefined)
		{
			showBust("KALLY");
			output("\n\nA thick-bodied kui-tan is mixing drinks behind the bar, wearing a dress with more rustic charm than fashion sensibility. Her lips are graced by the kind of easy smile that only ever seems to appear on those who enjoy their work.");
			addButton(0,"Bartender",approachKallyFirstTime);
		}
		//Met
		else
		{
			showBust("KALLY");
			output("\n\nKally smiles at you from behind the bar, but makes no move to approach. The cushy kui-tan is wearing her typical barmaid outfit and busy mixing drinks for her thirsty patrons.");
			addButton(0,"Kally",approachKally);
		}
	}
	if(MailManager.isEntryUnlocked("del_moved")) delBonus(1);
	else if(MailManager.isEntryUnlocked("del_moved_light")) shittyDelBonus(1);
	//Special Kiro bar event!
	if(flags["KALLY_FAP_2_KIRO"] != undefined && flags["KIRO_PHONE_EVENT"] == undefined && (roamingKiroAvailable() || crewKiroAvailable()) && kiroKallyThreesomes() == 0 && rand(5) == 0)
	{
		output("\n\nKiro was here... She left to use the bathroom,");
		if(timesGloryholesUsed() > 0 || timesGloryholesWorked() > 0) output(" probably to dump a discrete load in the gloryholes,");
		output(" but <b>she abandoned something in her hurry: a palm-sized codex-type device.</b>");
		addButton(2,"Kiro’s Codex",examineKirosCodex,undefined,"Kiro’s Codex","Take a look at Kiro’s abandoned codex.");
	}
	else roamingBarEncounter(2);
	
	var NPCs:Array = [];
	if (sylvieInBar()) NPCs.push(sylvieRoomBonuses);
	if (ushameeAtBar()) NPCs.push(ushameeCanadiaBarBonus);
	if (NPCs.length > 0) NPCs[rand(NPCs.length)](3);
	
	if(kaedeBlurb4KuiCountryBarAndGrilllll(4)) return true;
	mabbsBonus(5);
	jesseBarBonus(7);
	
	return false;
}

//Approach
//Not Met
public function approachKallyFirstTime():void
{
	clearOutput();
	showKally();
	output("You ");
	if(!pc.isTaur() && !pc.isNaga() && !pc.isGoo()) output("pull up a seat at the bar");
	else output("sidle up alongside the bar and settle onto one of the cushioned platforms designed for exotic body types like your own");
	output(". Business at the moment is slow enough to lend you plenty of personal space - and the barkeep’s personal attention.");
	output("\n\n<i>“Welcome to the Kui Country Lodge and Bar. I’m Kally. Something to drink, " + pc.mf("Mister","Miss") + "...?”</i>");
	output("\n\n<i>“[pc.name],”</i> you answer. <i>“What’s good?”</i>");
	output("\n\nKally’s enormous, poofy tail wags nimbly, narrowly avoiding toppling a tower of glassware behind her when she turns to gesture as taps and bottles. <i>“House specials are Nutty Nookies, Kui Creamers, Vesperian Vapors, and Royal Red." + (pc.isSmashed() ? ".. Oof, you don’t look too peachy, maybe you should sober up first?" : " What’ll it be?") + "”</i>");
	flags["MET_KALLY"] = 1;
	kallyBarMenu();
}

public function approachKally():void
{
	clearOutput();
	showKally();
	//Bad Kally approach
	if(flags["KIRO_3SOME_REACTION"] == -1)
	{
		output("No matter how you try to get her attention, Kally never approaches you. After a few particularly spirited attempts, a few burly looking patrons approach you.");
		output("\n\n<i>“Why don’t you find another bar, friend,”</i> one grunts.");
		output("\n\n<i>“Yeah pal, hit the a gate and find yourself a place to drink where you won’t bother the ladies working there.”</i>");
		output("\n\n<i>“We’re trying to be nice about this, buddy.”</i>");
		output("\n\nThere’s enough people here that any kind of fight would be unwise. You step away from the bar before things get rough, satisfying the locals for now. At least they didn’t shove you out the door.");
		processTime(1);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//Met, Not Kiro Introduced
	else if(flags["KIRO_MET_KALLY"] == undefined)
	{
		output("The moment you come up to the bar, Kally prances over with her tail bouncing along behind. <i>“Welcome back, [pc.name]. Hope the rush is treating you well. What can I get you? " + RandomInCollection(["Kui Creamers","Nutty Nookies","Vesperian Vapors","Royal Reds","Doe-Eyed Draughts","Pneumatic Pilsners"]) + " are selling pretty well. Peer pressure can’t be wrong... right?”</i>");
	}
	//CUT OFF
	else if(pc.isSmashed())
	{
		output("Kally smiles so sweetly at you when you approach that you nearly melt, leaning on the bar for support. Was she always so adorable? It’s no wonder you keep coming back for drinks when the woman who serves them is so goddamn huggable. And if you hugged her, you could feel her nipples rubbing against you; they look so hard. It must be hell for her to keep that shirt on. Her skirt’s no better. One edge is clearly ascending, lifting the ruffled fabric upward on the back of a cylindrical length. The edge of the bar keeps you from getting a better look, sadly.");
		output("\n\n<i>“I’m gonna have to cut you off, rush-[pc.boyGirl]. Any more and you’re going to pass out or get a little too handsy for a civilized establishment.”</i> Kally blinks, but to you it looks more like she’s fluttering her eyelashes. <i>“We can talk some more when you’re a little more sober.");
		if(flags["KIRO_MET_KALLY"] != undefined) 
		{
			if(flags["KALLY_3SOME_TALK"] == undefined) output(" I bet my sister wouldn’t mind you loving on her a little right about now.");
			else output(" I wouldn’t mind sharing a little loving with you and my sister right now, if you can talk her into it. Just gotta put up my ‘break’ sign. Then we can really break you in.");
		}
		output("”</i>");
		output("\n\nThat’s the best idea you’ve heard all week.");
	}
	//Met, drunk, have had special drinks
	else if(pc.isDrunk() && pc.hasStatusEffect("Adorahol"))
	{
		showImage("KallyLewdBar");
		output("Kally giggles when you come up to the bar, wobbling slightly. <i>“");
		if(flags["KALLY_3SOME_TALK"] == undefined) output("You better be careful with your drinks, spacer. I might have to cut you off soon.");
		else 
		{
			output("You better be careful with your drinks, spacer, or my sister’s going to talk you into ");
			if(pc.legCount > 1 && pc.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE) || pc.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output("walking bow-legged");
			else if(pc.hasCock()) output("a surprise prostate examination");
			else output("swallowing enough seed to drown a galotian")
			output(".");
		}
		output("”</i>");
		output("\n\nYour heart flutters at the knowledge that she cares about your wellbeing, and you barely manage to fight off the urge to give her a hug and apologize for loving the drinks (and the person that serves them) so much. <i>“You’re the bartender. The awesome bartender. It’s your call.”</i>");
		output("\n\nTwitching her ears and tail, the kui-tan smiles back at you, proving that for all her professional poise, she’s about as resistant to your drunken flattery as an ausar in heat. Her nipples are practically jutting at you, so prominent...");
		output("\n\nLaughing, Kally twists back and forth, letting her big ol’ boobs bounce back and forth, slapping into each other wildly enough that you nearly go dizzy trying to follow their dark chocolate tips. You put a hand to your head and straighten to meet her eyes once more, noting how they seem almost luminous in the bar’s dimmed lighting.");
		output("\n\n<i>“I hope you enjoyed the show.”</i> Kally giggles. <i>“");
		if(flags["KALLY_3SOME_TALK"] == undefined) output("You’ve been such a wonderful patron that I couldn’t help but give you a little treat, but this might have to be your last one, okay?");
		else output("You’ve got the ‘nuki fever bad, but that’s okay. You can look as much as you want while I’m working, and touch as much as you want when I’m not. You just can’t drink as much as you want. It’s getting close to cut-off time.");
		output("”</i> She whirls to grab a glass, sending her boobs bouncing once more.”</i>");
		output("\n\nThat sounds okay, as long as she’s the one to cut you off.");
		//+lust
		pc.changeLust(10);
	}
	//Met, buzzed, have had <i>“special”</i> drinks
	else if(pc.isBuzzed() && pc.hasStatusEffect("Adorahol"))
	{
		output("Kally is so pretty when she’s smiling at you... like right now. She brushes a stray lock out of hair out of her eyes, letting you see the sparkling windows to her soul. <i>“Hey, [pc.name]. The drinks treating you all right?”</i>");
		output("\n\nYou nod, stealing a glance at the half hard length swaying between her legs and her easily-visible nipples. It’s so nice that she doesn’t even try to hide that she’s into you!");
		output("\n\nKally slides her hand up your arm, over your shoulder, along the curve of your neck to your chin, and gently lifts your gaze back up to her face. <i>“");
		if(flags["KALLY_3SOME_TALK"] == undefined) output("I’m not on the menu, " + pc.mf("stud","hotness") + ", but I’d love to get you another drink, if you think you can handle it.”");
		else output("I can’t while I’m working, but if you could talk Kiro into it, I could be persuaded to take a break... assuming you could handle both of us.");
		output("</i>");
		output("\n\nOh yeah, you can handle it. You could handle her too, if she’d let you.");
	}
	//Post threesome talk
	else if(kiroKallyThreesomes() > 0 && flags["KALLY_3SOME_TALK"] == undefined)
	{
		output("Kally walks up to you, shaking her head. <i>“You really are a massive slut, eh?”</i> She shakes her head. <i>“I guess you would have to be to catch my sister’s eye.”</i>");
		output("\n\nYou ");
		if(pc.isBimbo()) output("gleefully nod, licking your lips. <i>“Yeaaaah... isn’t it the best?”</i>");
		else if(pc.isNice()) output("look shamefully down at the countertop. <i>“I was trying to help, if you can believe that.”</i>");
		else if(pc.isMischievous()) output("flash her your winningest smile. <i>“There’s nothing wrong with a little slutting around between friends, my dear.”</i>");
		else output("shrug. <i>“You can call me whatever you want, but we both know you’re the one desperate to plow your sister.”</i>");
		output("\n\nKally ");
		if(pc.isBimbo()) output("giggles");
		else if(pc.isNice()) output("hooks a finger under your chin and smiles at you");
		else if(pc.isMischievous()) output("chuckles just hard enough to send a delightful wobble through her lace-bound chest");
		else output("smirks right back at you");
		output(". <i>“Well, whatever it takes. I’ll just have to slut it up right alongside you.”</i> Kally adjusts her corset to sit a little lower, the tips of her nipples barely peeking over the top. Bending over, she pulls a tube of temporarily plumping lip-gloss and puckers. <i>“When Kiro sees me, she needs to see someone she wants to fuck, not the annoying step-sister she remembers.”</i> One coat of shine is applied, and the kui-tan’s mouth gains a glossy angel bow. <i>“Oooh! It tingles.”</i> She looks in the mirror and shakes her head. <i>“Not slutty enough.”</i> The determined bar owner smears two more coats across her increasingly cushiony lips, lacquering them in a glassy shine. They look almost excessively plush and naturally pouty. If Kiro thrusted too hard during a blowjob, she’d bounce right off.");
		output("\n\nYou look on, too shocked to interrupt.");
		output("\n\n<i>“Well, what do you think?”</i> Kally musses her hair and tosses it over a shoulder, cocking one hip to the side as confidently as she can. She’s chewing on one of her temporarily expanded lips, but her gaze is rapacious, sizing you up like a piece of meat.");
		output("\n\n");
		if(pc.hasCock())
		{
			if(pc.lust() >= 66)
			{
				output("A surge of stiffness reinforces your already hardened penis");
				if(pc.cockTotal() > 1) output("es");
			}
			else
			{
				output("A surge of blood engorges your penis");
				if(pc.cockTotal() > 1) output("es");
			}
		}
		else if(pc.hasVagina())
		{
			output("A trickle of wetness ");
			if(pc.legCount > 1) output("between your [pc.legs]");
			else output("makes itself known");
		}
		else output("A flush of welcome warmth suffuses you");
		output(" as she leans closer, presenting you with a very fuckable mouth. <i>“");
		if(pc.isBimbo())
		{
			output("Like, super fuckable.");
			if(pc.hasCock()) output(" Do you wanna give me a blowjob... for practice or something?");
			else if(pc.hasVagina()) output(" Do you wanna practice eating out... for practice or something?");
			else output(" If I had a dick or something, I’d really want your lips on it.");
		}
		else if(pc.isNice()) output("Uhh... really, um... fuckable?");
		else if(pc.isMischievous()) output("Sexy enough that Kiro is going to have to run to the gloryholes every five minutes while you’re working.");
		else output("Eminently fuckable.");
		output("”</i>");
		output("\n\nEars waggling, the Tanuki-girl pulls you into an enormous hug. <i>“Thank you for all of this - for bringing us together, for breaking the ice, and being so cool with ");
		if(flags["KIRO_BF_TALK"] == 1) output("me banging your girlfriend");
		else output("us having a little step-sister side-action");
		output(". I’m usually pretty busy behind the bar, but if you ever want to do something like that little gloryhole adventure again, set it up with Kiro, and I’ll find a way to be there.”</i>");
		output("\n\nKally kisses you before allowing you to escape the hug, long and deep. There’s even a bit of tongue. By the time she releases you, you’re both flushed and breathing heavily.");
		output("\n\n<i>“Kiro sure knows how to pick ‘em, huh?”</i>");
		output("\n\nNow it’s your turn to smile. <i>“She sure does.”</i>");
		processTime(5);
		flags["KALLY_3SOME_TALK"] = 1;
		if(flags["KIRO_KALLY_EMAIL"] == undefined && flags["KIRO_3SOME_REACTION"] != -1) flags["KIRO_KALLY_EMAIL"] = GetGameTimestamp();
		clearMenu();
		addButton(0,"Next",function():void {
			clearOutput();
			showKally();
			output("Kally touches herself up with a bit more gloss, accidentally tarting herself up a little more in the process, before turning back your way, ecstatic. <i>“So what can I get my second favorite slut?”</i>");
			kallyBarMenu();
		});
		return;
	}
	//Met, Kiro Introduced
	else
	{
		//1
		if(rand(10) == 0)
		{
			output("Kally bounces up well before you ");
			if(!pc.isTaur() && !pc.isNaga() && !pc.isGoo()) output("find a seat");
			else output("lean up on the bar");
			output(". <i>“Hey there good lookin’. Never woulda thought my sister would let a treasure out of her sight, but I guess there must be something special about you. What can I getcha?”</i>");
		}
		//2
		else if(rand(9) == 0)
		{
			output("Kally wiggles in excitement as you prance up. <i>“How’s it going, [pc.name]? You keepin’ Kiro out of trouble?”</i> She laughs at your stricken expression, wiping the bar with a wet rag. <i>“Nah, I know that’s impossible. That girl finds danger like scrappers find wrecks. What can I do for you?”</i>");
		}
		//3
		else if(rand(8) == 0)
		{
			output("Kally leans forward, putting a dangerous amount of cleavage on display. <i>“You hear about that Black Void slave convoy the UGC hit yesterday? Hundreds of rodenians, a few dozen ausar, and damn near a thousand galotians buried in the hold. I can’t believe shit like that is still going down in this day and age. You watch yourself out there, okay? Don’t let yourself get captured by scumbags like that while you’re on the fringe.”</i>");
			output("\n\nYou nod.");
			output("\n\n<i>“That’s what I’m talking about. Now, what can I get you?”</i>");
		}
		//4
		else if(rand(7) == 0)
		{
			output("Kally brightens at the sight of you. <i>“Kiro told me about your adventure - how you’re racing to get your inheritance or something.”</i> She wipes the bar so quickly that her breasts threaten to jostle out of her top. <i>“You’re the closest thing to a celebrity to come in here. Now let me get you a drink so I don’t waste your time. I’m not letting you blame me if some scumbag finds whatever you’re looking for first.”</i>");
		}
		//5
		else if(rand(6) == 0)
		{
			output("Kally catches you sneaking a glance at her exposed cleavage and smiles, pressing her arms in on either side to make the chocolate curves threaten to spill out of containment. <i>“Somebody’s got a case of the ‘nuki fever, huh?”</i> A mischievous twinkle glints in her eye as she laughs");
			if(pc.isAss()) output(" at your rapidly reddening face");
			else output(" at your guilty expression");
			output(". <i>“");
			if(kiroKallyThreesomes() > 0) output("Kiro and I like to share anyway.");
			else output("Don’t worry, Kiro’s not the type to expect monogamy - just don’t expect it back. That fuzzy slut can barely take ten steps without falling into pussy.");
			output(" Now what can I get you?”</i>");
		}
		//6
		else if(rand(5) == 0)
		{
			output("Kally grabs a clean glass at your approach, smiling affectionately in your direction. <i>“Good to see you, [pc.name].”</i> Her bushy tail wags behind her, betraying just how pleased she is to see you. <i>“You keep being such a sweetheart to me and my family, and I might just have to start serving you free drinks. Now what’ll it be?”</i>");
		}
		//7
		else if(rand(4) == 0)
		{
			output("Kally’s rounded ears perk up at your approach. The rest of her perks up soon after, breasts bouncing from sudden motion. <i>“Hey, [pc.name]. You hear about that new rush race that just got discovered?”</i>");
			output("\n\nYou tilt your head quizzically.");
			output("\n\nShe taps excitedly on the counter. <i>“Psychic mermaids. Can you believe it? Psychic... fucking... mermaids. They don’t even have to swim. I hear they levitate with their minds! Who knows what they could bring to the UGC!”</i> She looks around, making sure nobody else is within earshot. <i>“What do you think a psychic handjob feels like?”</i>");
			output("\n\nYou shrug");
			if(pc.libido() > 70 || pc.isBimbo() || pc.isBro()) output(", smiling inwardly");
			output(".");
			output("\n\n<i>“I bet it’s good.”</i> Kally shakes her head, banishing the faraway look from her eyes. <i>“I’m sure you didn’t come here to listen to me ramble. What can I get you?”</i>");
		}
		//8
		else if(rand(3) == 0)
		{
			output("Kally looks particularly frazzled at the moment, but she still manages to greet you the moment you get to the bar. You respond in kind, then ask her what’s bothering her.");
			output("\n\n<i>“The worst part about working around Vesperia is the goddamned taurs");
			if(pc.isTaur()) output(" - no offense");
			output(". If you think males and herms have filthy bathrooms, you should try dealing with the fucking taurs. Half a goddamn hour just to clean up after one drunk bastard who wouldn’t be bothered to aim his goddamn horse-cock. If I can get it in a bowl, so can he, damnit.”</i>");
			output("\n\nWhile you’re chuckling at her poor fortune, she just shakes her head. <i>“Anyway, can I get you a drink?”</i>");
		}
		//9
		else if(rand(2) == 0) 
		{
			output("Kally looks... different. Her posture is terrible, like she’s barely managing to stand up, but she’s smiling bright enough for an artificial sun. When she sees you, she makes an effort to straighten, then flows over to lean on the counter, sighing contentedly. <i>“Hey there.”</i>");
			output("\n\n<i>“Hi yourself.");
			if(!pc.isBimbo()) output(" You okay?");
			else output(" Somebody got laaaaaaaiiiid!");
			output("”</i>");
			output("\n\nGiggling, the kui-tan barkeep shakes her head. <i>“");
			if(!pc.isBimbo()) output("I’m fiiiine.");
			else output("Noooo! ...Close though.");
			output("”</i> She pulls a stool out from under the counter and plops herself down on it, the curves of her ass wrapping just slightly around the tiny seat. <i>“I just had to release some pressure... from the uh... kegs.”</i> She winks, then giggles. <i>“Lots of pressure. Felt like it took hours.”</i> She giggles again, voice still husky. <i>“So what can I get you?”</i>");
		}
		//10
		else
		{
			output("Kally doesn’t even look at you when you walk up! Her eyes are fixed squarely across the room, on a blushing doe, presently guzzling down her fourth foamy drink, if the empty glasses around her are anything to go by.");
			output("\n\nYou clear your throat.");
			output("\n\n<i>“Ohhh, sorry ‘bout that! Guess I had a chocolate moment there, huh [pc.name]?”</i> Kally adjusts her skirt, but it’s plain as day that her cock is halfway to hard. <i>“There’s just something rewarding about seeing a satisfied patron enjoying the drinks you work so </i>hard<i> to prepare. Now what can I get you?”</i>");
			if(flags["KALLYS_SECRET_INGREDIENT"] != undefined)
			{
				output("\n\nYou try not to roll your eyes. She’s clearly getting off on watching cute girls drink her cum-laced drinks.");
				if(pc.libido() >= 80 || pc.isBimbo()) output(" But then again, wouldn’t you?");
			}
		}
	}
	processTime(1);
	kallyBarMenu();
}

public function kallyBarMenu():void
{
	clearMenu();
	if(!pc.isSmashed() && !pc.hasStatusEffect("KALLY_FORCE_CUTOFF")) addButton(0,"Buy Drink",buyADrinkFromKally);
	else addDisabledButton(0,"Buy Drink","Buy Drink","You’re so drunk she won’t serve you any more.");
	addButton(1,"Appearance",kallyAppearance);
	if(!pc.hasStatusEffect("Tapped Kally") && pc.isBimbo()) addButton(5,"Suck Kally",kallyNeedsTappedByBimbos,undefined,"Suck Kally","Kally looks... and smells... like she needs some relief. Who better to help than you?");
	else if(pc.isBro() && pc.hasCock())
	{
		addButton(5,"Eat Pussy",kallyGetsEatenOutByBroz,undefined,"Eat Pussy","You know that deep down, all Kally wants to do is taste your dick and offer her pussy.");
	}
	else if(pc.isBro()) addDisabledButton(5,"Eat Pussy","Eat Pussy","Something tell you she isn’t going to let you just pick her up and start eating her pussy unless you’ve got the biggest, nicest smelling cock in the bar.");
	else if(pc.isBimbo()) addDisabledButton(5,"Suck Kally","Suck Kally","She’s still cooling off from your last attempt!");
	else addDisabledButton(5,"Seduce Kally","Seduce Kally","You’d need to be extremely oversexed to so brazenly seduce Kally - like a bimbo or brute.");
	if(kallySexedCount() > 0 && pc.hasCock() && pc.cockThatFits(900) >= 0) 
	{
		if(pc.lust() >= 33)	addButton(6,"Hotdog&Fuck",kallyHotdogNFuck,undefined,"Hotdog & Fuck","Use her big squishy booty to warm up before taking her to pound town.");
		else addDisabledButton(6,"Hotdog&Fuck","Hotdog & Fuck","You aren't turned on enough right now.");
	}
	else if(kallySexedCount() == 0) addDisabledButton(6,"Hotdog&Fuck","Hotdog & Fuck","This isn't the way to begin an intimate relationship with her.");
	else if(pc.hasCock()) addDisabledButton(6,"Hotdog&Fuck","Hotdog & Fuck","Not even Kally can handle that behemoth.");
	else addDisabledButton(6,"Hotdog&Fuck","Hotdog & Fuck","You need a penis for this.");

	addButton(14,"Leave",mainGameMenu);
}

//Appearance
public function kallyAppearance():void
{
	clearOutput();
	showKally();
	showImage("KallyLewdBar");
	output("Kally is very much a typical kui-tan, and bears the features typical of that race - fur, rounded ears, a face with a short muzzle, and an enormous, ringed tail. Unlike the rest of her race");
	if(flags["KIRO_MET_KALLY"] != undefined) output(" and her step-sister");
	output(", her facial fur is an eggshell white that continues all the way down into her top, highlighting traditionally attractive features marred only by the slightest bit of extra fat in her cheeks. She has bright red eyes, tinged by the slightest pinkish hue, enough to make her gaze more a curiosity than frightening.");
	output("\n\nHer figure is just broad enough that you know she’s eating well without any of her curves settling in the wrong places. Her hips are wide and her ass voluptuous. It’s big enough to make the back half of her skirt flip dangerously high when she walks. Were it not for the stabilizing influence of her tail, she’d likely moon anyone lucky enough to walk behind her.");
	output("\n\nKally’s breasts are similarly expansive. They’re big, heavy mounds, barely bundled up in a diaphanous top, then propped up by a corset with the laces loose enough to show a hint of belly pudge. Even with the corset, it’s clear they’re not quite as perky as " + (flags["KIRO_MET_KALLY"] != undefined ? "her younger sister’s" : "they could be") + ". They’re far too soft to ride as high as New Texan’s rack but by far lovely enough to display an incredible line of cleavage given the chance, and their owner knows it. She carries herself with the confidence and poise of a woman who has been hit on innumerable times and knows it. And appreciates it.");
	output("\n\nBetween her legs swings a long, blunted prick, not quite equine but not quite normal for a kui-tan either. She’s obviously done some modding - enough that it never seems to retract back into its sheath. Nor does she seem to mind that it’s always visible beneath the hem of her skirt, swaying in a clear advertisement of her hermaphroditic sexuality. At the same time, she never seems to go out of her way to advertise it, seemingly happy to be who she is, where she is.");
	processTime(1);
	kallyBarMenu();
	addDisabledButton(1,"Appearance","Appearance","You’re looking at that right now.");
}

//Buy Drink
//Bit o boozy flavor + bit o drunky flavor + option to talk. Get too drunk, and wake up somewhere?
public function buyADrinkFromKally():void
{
	clearOutput();
	showKally();
	output("Kally hands you a drink menu and waits patiently for your response.");
	if(flags["KALLYS_SECRET_INGREDIENT"] == undefined) output(" A lot of them are marked with tiny hearts. What’s up with that?");
	
	//[Kui Creamers] [Nutty Nookies] [Vesperian Vapors] [Royal Reds] [Doe-Eyed Draughts] [Pneumatic Pilsners] [Hearts]
	kallyDrinkDisplay();
	kallyDrinkMenu();
}

//Hearts - Required For Heart* Drinks
public function askKallyAboutHearts():void
{
	clearOutput();
	showKally();
	output("You ask her about the heart indicators.");
	output("\n\n<i>“Oh, those drinks don’t have any alcohol in them.”</i> Kally grins happily. <i>“Instead, they have a 100% organic-produced alcohol substitute. It acts on the brain similarly, so you’ll still get a buzz if that’s what you’re after, but it’s a much more nuanced chemical. I’ve taken to calling in Adorahol, on account of the specific kind of drunk it gets people who over-imbibe.”</i>");
	output("\n\nYou eye the drinks suspiciously, then look back at her. <i>“What kind of drunk?”</i>");
	output("\n\nThe bartender’s tail wiggles behind her, as if it’s so full of exciting news that it’ll burst out of her fluffed-up fur at any second. <i>“Affectionate, empathetic drunk! You know how you’ll sometimes get those types who start telling everybody how they love them and buy the whole bar drinks? Usually that’s a fleeting thing, but with Adorahol, that’s the <i>whole</i> thing. People get lovey-dovey drunk. It’s why I’ve never had to break up a fight since I’ve opened up this place. The worst case of property damage I’ve ever had to deal with was a moosetaur trampling a half dozen chairs when he tried to stumble over to his wife for a surprise hug.”</i>");
	output("\n\n<i>“");
	if(pc.isBimbo()) output("That sounds awesome! I’m gonna drink like, ten of those! Where can I get this stuff?");
	else output("Is it safe? Where do you even get it from?");
	output("”</i>");
	output("\n\nKally leans low and close. <i>“It has to be milked out. The best way to synthesize it is actually inside the body, so they came up with a new mod a few years back that’ll let almost any species produce it for consumption, if you don’t mind it carrying a bit of flavor from the fluids it’s mixed with. Don’t get me started on how expensive it was.”</i> Kally rolls her eyes. <i>“If I wasn’t able to write the whole mess off as a tax deduction, this place would be a whole lot less jolly.”</i>");
	//[Who’s Milk?] [But Is It Safe?] [Okay - Requires Previous topics]
	processTime(3);
	clearMenu();
	addButton(0,"Who’s Milk?",whoseMilkIsAdoraholKally,undefined,"Who’s Milk","But who is milking this stuff out?");
	addButton(1,"Is It Safe?",butIsAdoraholSafe,undefined,"Is It Safe?","Ask her if it is safe.");
}

//But Is It Safe?
public function butIsAdoraholSafe():void
{
	clearOutput();
	showKally();
	output("<i>“But is it safe?”</i>");
	output("\n\nKally nods emphatically. <i>“About as safe as normal booze. It’ll still knock out some brain cells and up your odds for cancer. And you still shouldn’t fly your ship or anything while you’re on it. Xenogen has been fighting red tape on this stuff for decades. There’s been more than ample time to simulate and test it to death.”</i>");
	output("\n\nThat doesn’t sound so bad.");
	processTime(1);
	//Menu with safe grayed out
	clearMenu();
	addButton(0,"Who’s Milk?",whoseMilkIsAdoraholKally,undefined,"Who’s Milk","But who is milking this stuff out?");
	addDisabledButton(1,"Is It Safe?","Is It Safe?","You just did this.");
}

//Who’s Milk
public function whoseMilkIsAdoraholKally():void
{
	clearOutput();
	showKally();
	output("<i>“Who’re you milking for it? I don’t see any");
	if(pc.bovineScore() >= 3) output(" other");
	output(" cows around?”</i>");
	output("\n\nThe raccoon-like alien looks sheepish. <i>“I didn’t actually say it came out with milk, just that it was </i>milked out<i>.”</i> Despite her shame at admitting it, Kally’s nipples become hard enough to see through her silky shirt’s fibers. <i>“We aren’t New Texas, after all, with dairy sluts lined up just pining to have their hooters drained.”</i> She shakes her head, but there’s a note of fondness in her voice. She sounds like she’d love to visit, given the chance.");
	output("\n\nYou note that she still hasn’t told you who she’s milking for this stuff... or how exactly it works. Is it like milking venom or webbing?");
	if(pc.isBimbo()) output(" Maybe it’s cum. Maybe she wrings her dick out into every drink she serves. Your mouth waters.");
	else output(" Part of you suspects that it could be something more openly sexual.");
	output(" You pry for more information.");

	output("\n\nKally makes sure no one is close enough to hear and wrings her padded paws. Satisfied that nobody will hear, she mutters something quiet enough to be unintelligible.");
	output("\n\n<i>“What?”</i>");
	output("\n\nYou lean closer, trying to hear her better.");
	output("\n\nA red-tinged blush creeps up her ears. She must be absolutely crimson under her fur. <i>“It’s me... I mean my cum.”</i>");
	output("\n\n");
	if(pc.isBimbo()) output("You lick your lips.");
	else output("You rock back in your seat.");
	output("\n\n<i>“Well, I can make way more than anyone short of a gush-addicted cow, so why not? I got all the tests and licensing for distributing it as food-grade so long as I’m open about it. Haven’t failed an inspection once.”</i> She straightens up, tail thwacking against the floor behind her. <i>“It actually tastes pretty great now, even straight from the tap. Only downside is that I can’t serve it to other kui-tan without setting them off.");
	if(flags["KIRO_MET_KALLY"] != undefined) output(" You ever see how Kiro’s balls swell up after she gives a blowjob? It’s nuts!");
	else output(" See, swallowing ejaculate tends to make us overproduce our own for a short time.");
	output(" If I gave them any, I’d need a crew of dedicated moppers just to clean up the mess.”</i>");

	output("\n\nSo the drinks marked with hearts have cum in them. Kui-tan cum. From Kally. That’s also sort of alcoholic.");
	if(pc.isBimbo()) output(" Your heart flutters. This place sounds like heaven!");

	//Options added to drink discussion menu. Not required.
	processTime(2);
	//[Gross -Permanently disable those drinks] [Just You?]
	clearMenu();
	if(pc.isBimbo()) addDisabledButton(0,"Gross","Gross","That sounds too yummy to be considered gross to you!");
	else addButton(0,"Gross",grossStuffKally,undefined,"Gross","Tell her you think it’s gross.");
	addButton(1,"Just You?",justKallyMakesEverything,undefined,"Just You?","So she makes it herself?");
}

//Gross
public function grossStuffKally():void
{
	clearOutput();
	showKally();
	output("<i>“Gross!”</i> you exclaim, disbelieving.");
	output("\n\nKally smirks. <i>“Huh. Wouldn’t have thought a rusher would be so closed minded.”</i> She tosses a rag over her shoulder and shifts some of the aforementioned drinks away from you. <i>“I’ll be sure to keep your menu entirely to the traditional stuff, if that’s your speed. Just don’t be surprised when some of the regulars give you shit for it.”</i>");
	flags["KALLYS_SECRET_INGREDIENT"] = -1;
	processTime(1);
	clearMenu();
	addButton(0,"Next",buyADrinkFromKally);
}

//Just You?
public function justKallyMakesEverything():void
{
	clearOutput();
	showKally();
	output("<i>“Just you? You make enough for this whole bar?”</i>");
	output("\n\nKally giggles bashfully, swishing her skirt around, her limp cock twitching subtly. <i>“Yup. That’s the beauty of being a kui-tan. I can just drink a little bit of the stuff myself, and my balls start swelling up into beach balls.”</i> Her nipples clearly jut through her shirt. <i>“The one time I dared try to get drunk on my own product, I wound up stuck on my nuts, like I had waterbeds for balls. If I didn’t have the milker within arms reach, I might have even gotten trapped like that - or drowning myself trying to get it out. Can you imagine how humiliating that would be - needing to be rescued from your cum-obsessed body?”</i>");

	//Saved Kiro
	if(flags["RESCUE KIRO FROM BLUEBALLS"] != undefined && flags["RESCUE KIRO FROM BLUEBALLS"] == 1)
	{
		output("\n\nShe wouldn’t be the first kui-tan you’ve met to have that problem.");
		if(flags["KIRO_MET_KALLY"] != undefined) output(" It must run in the family.");
	}
	//Else
	else 
	{
		output("\n\nYou can only imagine how one would rescue someone from such an insane situation.");
		if(pc.libido() >= 80 || pc.isBimbo()) output(" It sounds kind of hot, to be honest.");
	}
	//Merge, no new PG
	output(" <i>“Yeah...”</i>");

	output("\n\nKally pats your hand, and smiles. <i>“So yeah, I’m my own best cash cow, and I’ll admit, I get a bit of a thrill seeing cute spacers like you guzzling down my special ingredient by the pint.”</i> Her skirt is obviously lifting a little at this point, but she makes no move to hide it. <i>“Any other questions, or would you like to try a Nutty Nookie?”</i>");
	flags["KALLYS_SECRET_INGREDIENT"] = 1;
	kallyDrinkDisplay();
	kallyDrinkMenu();
}

public function kallyDrinkDisplay():void
{
	output("\n\n<b><u>\\\[Price] Name</u></b>");
	if(flags["KALLYS_SECRET_INGREDIENT"] != undefined) output("\n<i>(Asterisks indicate items that contain the secret ingredient. Pretend they are hearts!)</i>");
	output("\n\\\[ 6\\\] *Doe-Eyed Draught");
	output("\n\\\[ 7\\\] *Nutty Nookie");
	output("\n\\\[10\\\]  Vesperian Vapor");
	output("\n\\\[12\\\]  Royal Red");
	output("\n\\\[20\\\]  Pneumatic Pilsner");
	output("\n\\\[22\\\] *Kui Creamer");
}

public function kallyDrinkMenu():void
{
	clearMenu();
	if(pc.credits >= 6) 
	{
		if(flags["KALLYS_SECRET_INGREDIENT"] == -1) addDisabledButton(0,"*Doe-Eyed D","Doe-Eyed Draught","You are not interested in this drink.");
		else if(flags["KALLYS_SECRET_INGREDIENT"] != undefined) addButton(0,"*Doe-Eyed D",kallyDrinkPurchase,"Doe-Eyed Draught","Doe-Eyed Draught","Doe-Eyed Draught is a local microbrew produced in-house and flavored with our special additive. The warm amber beer bears a slight, hoppy flavor with a hint of almond. Sure to have you looking doe-eyed after a few drinks! 14% alcohol equivalency by volume.\n\nPrice: 6 Credits");
		else addDisabledButton(0,"*Doe-Eyed D","Doe-Eyed Draught","That marking is suspicious. You should ask about it.");
	}
	else addDisabledButton(0,"*Doe-Eyed D","*Doe-Eyed Draught","You can’t afford that.\n\nPrice: 6 Credits");
	if(pc.credits >= 7) 
	{
		if(flags["KALLYS_SECRET_INGREDIENT"] == -1) addDisabledButton(1,"*N. Nookie","Nutty Nookie","You are not interested in this drink.");
		else if(flags["KALLYS_SECRET_INGREDIENT"] != undefined) addButton(1,"*N. Nookie",kallyDrinkPurchase,"Nutty Nookie","Nutty Nookie","A rich, nutty beer with a flavor that’s best described as chocolatey. Nutty Nookie’s aren’t for the faint of heart, as they contain 13% alcohol equivalency by volume and a generous helping of our secret ingredient to lend it a thicker, warmer afterglow.\n\nPrice: 7 Credits");
		else addDisabledButton(1,"*N. Nookie","Nutty Nookie","That marking is suspicious. You should ask about it.");
	}
	else addDisabledButton(1,"*N. Nookie","Nutty Nookie","You can’t afford that.\n\nPrice: 7 Credits");
	if(pc.credits >= 10) 
	{
		addButton(2,"V. Vapor",kallyDrinkPurchase,"V. Vapor","Vesperian Vapor","Like its namesake, a Vesperian Vapor is a light, crisp drink with a hint of citrous flavor hiding just beneath its bubbly effervescence. Contains 7% alcohol by volume.\n\nPrice: 10 Credits");
	}
	else addDisabledButton(2,"V. Vapor","Vesperian Vapor","You cannot afford that.\n\nPrice: 10 Credits");
	if(pc.credits >= 12) 
	{
		addButton(3,"Royal Red",kallyDrinkPurchase,"Royal Red","Royal Red","A foamy, crimson-colored beer with a bitter taste and the faintest hint of cherry. Royal Red is a common beer brewed locally on Vesperia. Contains 8% alcohol by volume.\n\nPrice: 12 Credits");
	}
	else addDisabledButton(3,"Royal Red","Royal Red","You cannot afford that.\n\nPrice: 12 Credits");
	if(pc.credits >= 20) 
	{
		addButton(4,"P. Pilsner",kallyDrinkPurchase,"Pneumatic Pilsner","Pneumatic Pilsner","Has a kick like a launch catapult and an afterglow like an engine nozzle. Imported from breweries on Tallax. 16% alcohol by volume.\n\nPrice: 20 Credits");
	}
	else addDisabledButton(4,"P. Pilsner","Pneumatic Pilsner","You cannot afford this.\n\nPrice: 20 Credits");
	if(pc.credits >= 22) 
	{
		if(flags["KALLYS_SECRET_INGREDIENT"] == -1) addDisabledButton(5,"*Kui Creamer","Kui Creamer","You are not interested in this drink.");
		else if(flags["KALLYS_SECRET_INGREDIENT"] != undefined) addButton(5,"*Kui Creamer",kallyDrinkPurchase,"Kui Creamer","Kui Creamer","Incredibly creamy with a mild sweetness that goes just right with a cold night by a warm fire. Kui Creamers are taken as a pair of shots. 21% alcohol equivalency by volume, with a concentration of our secret ingredient that’ll leave your heart fluttering.\n\nPrice: 22 Credits");
		else addDisabledButton(5,"*Kui Creamer","Kui Creamer","That marking is suspicious. You should ask about it.");
	}
	else addDisabledButton(5,"*Kui Creamer","Kui Creamer","You cannot afford this.\n\nPrice: 22 Credits");
	if(flags["KALLYS_SECRET_INGREDIENT"] == undefined) 
	{
		addButton(6,"Hearts?",askKallyAboutHearts,undefined,"Hearts?","Ask Kally about the menu items marked with hearts (asterisks).");
	}
	else addDisabledButton(6,"Hearts?","Hearts?","You already asked Kally about the heart indicators on her menu.");
	addButton(14,"Back",backToKallyMain);
}

public function backToKallyMain():void
{
	clearOutput();
	showKally();
	output("Kally’s tail wags curiously. <i>“Well, what can I do for you?”</i>");
	kallyBarMenu();
}

public function addLoveyDoveWithAlcohol():void
{
	if(!pc.hasStatusEffect("Adorahol")) pc.createStatusEffect("Adorahol",1,0,0,0,false,"Icon_Wine","You’re feeling more affectionate that you otherwise would, no doubt the result of Kally’s ‘special’ drinks.",false,0,0xB793C4);
	else pc.addStatusValue("Adorahol",1,1);
}

public function kallyDrinkPurchase(drink:String):void
{
	clearOutput();
	showKally();
	var special:Boolean = false;
	switch(drink)
	{
		case "Doe-Eyed Draught":
			pc.imbibeAlcohol(28);
			special = true;
			addLoveyDoveWithAlcohol();
			pc.credits -= 6;
			break;
		case "Nutty Nookie":
			pc.imbibeAlcohol(26);
			special = true;
			addLoveyDoveWithAlcohol();
			pc.credits -= 7;
			break;
		case "V. Vapor":
			pc.imbibeAlcohol(14);
			pc.credits -= 10;
			break;
		case "Royal Red":
			pc.imbibeAlcohol(16);
			pc.credits -= 12;
			break;
		case "Pneumatic Pilsner":
			pc.imbibeAlcohol(32);
			pc.credits -= 20;
			break;
		case "Kui Creamer":
			pc.imbibeAlcohol(42);
			special = true;
			addLoveyDoveWithAlcohol();
			pc.credits -= 22;
			break;
	}
	if(pc.hasStatusEffect("Adorahol") && pc.isDrunk() && special && flags["KALLYS_SECRET_INGREDIENT"] == 1 && CodexManager.entryViewed("Kui-Tan") && rand(2) == 0)
	{
		kallyDrunkDraino();
		return;
	}

	output("You swipe the creds over to Kally. She swiftly rushes off to make your drink, returning with ");
	if(drink != "Kui Creamer") output("an ice cold glass of " + drink);
	else output("shot glasses of " + drink);
	output(". ");
	switch(drink)
	{
		case "Kui Creamer":
			output("You take them one after the other, surprised at how pleasant they taste. There’s no real alcoholic kick, just the smooth heat of Kally’s creamy drinks.");
			break;
		case "Nutty Nookie":
			output("It goes down slow but smooth, leaving you with a warm, rich feeling settling into your stomach.");
			break;
		case "V. Vapor":
			output("It’s a lovely drink that you can take your time with, swirling the beverage around in your glass in between sips.");
			break;
		case "Royal Red":
			output("The thick head clings to your upper lip with every sip, but you lap it up after every swallow. It’s bitter, just like the drink, and subtly flavorful.");
			break;
		case "Doe-Eyed Draught":
			output("You suck down a long pull of the opaque amber beverage. It’s good. Damned good. You take another few swallows before slapping it down and belching, remembering your manners too late to excuse yourself. The bartender grins.");
			break;
		case "Pneumatic Pilsner":
			output("You knock back a gulp of it and nearly screw up your face from the sharp, alcoholic kick. It feels like it uses your tonsils for a punching bag and sandpapers the inside of your throat, leaving both raw from the intense beating. Nevertheless, as you drink it, you begin to appreciate the warm glow spreading through your body.");
			break;
	}
	if(pc.hasStatusEffect("Adorahol") && (pc.isBuzzed() || pc.isDrunk()))
	{
		//Adoradrunk
		if(pc.isBuzzed())
		{
			output("\n\nKally looks like she’s breathing sort of heavily, but she studiously turns away while you drink, instead looking over the bar. She swings back with an impish smile. <i>“I guess nobody else needs anything. Wanna have a chat while you savor that flavor?”</i> She bends over to lean on the bar. You can see straight down hear low-hanging cleavage. She doesn’t even stop you when you look");
			if(pc.hasHair() && pc.hairLength > 2) output(", just tousles your hair");
			output(". <i>“You’re sweet, but why not speak up while you enjoy the view?”</i>");
		}
		//Drunk
		else
		{
			output("\n\nKally wipes a moist spot on the bar, watching you out of the corner of her eye. She’s not doing a very good job wiping up. A ring of condensation from an old drink is right next to her, and she hasn’t even grazed it.");
			output("\n\nThen something <i>thumps</i> underneath the bar.");
			output("\n\nLurching back, the sheepish kui-tan bends forward and catches her elbows on the bar. Her surprise quickly vanishes beneath an interested expression, and her tail swishes back in forth in the air behind her upturned rump. You can almost make out the curves of her cushy heiny through her skirt. She tilts her head to lean her cheek on her palm and suggests, <i>“Let’s talk, " + pc.mf("handsome","cutey") + ". I’m not... uh... I don’t need to go anywhere for a little while.”</i>");
			output("\n\nShe’s cute when she’s flustered, and it’s even cuter how her eyes dilate a little when you lick the residue from your lips.");
		}
	}
	//Not drunk
	else
	{
		output("\n\nKally wipes at a moist spot on the bar. <i>“");
		if(special) 
		{
			output("I told you it’d be good.");
			if(drinkFromTapKally() <= 0) output(" Sometime you should try some from the tap.");
			else output(" You should get another dose from the tap sometime.");
		}
		else output("Only the best for my customers.");
		output("”</i> She surveys the bar, then looks back at you with a smile. <i>“Looks like I have a free moment. Wanna talk?”</i>");
	}
	processTime(4);
	kallyTalkMenu();
}

//Talkshit (Appended to Buy Dranks)
//See above for lead up text.
//Each talk kicks back to the main - gotta drink to talk!
public function kallyTalkMenu():void
{
	clearMenu();
	//Own Bar?
	addButton(0,"Own Bar?",askKallyAboutOwningHerBar,undefined,"Own Bar?","Ask her if she owns the bar or just works here.");
	//You’re Cute
	addButton(1,"You’re Cute",tellKallyShesCute,undefined,"You’re Cute","Flirt with the bartender.");
	//Rush?
	addButton(2,"Rush?",talkToKallyAboutTheRush,undefined,"Rush?","Ask her what she thinks about the rush.");
	//Galotians
	addButton(3,"Galotians",askKallyAboutGalotians,undefined,"Galotians","Ask her what she thinks about galotians.");
	//New Texas
	if(flags["LANDED_ON_TEXAS"] != undefined) addButton(4,"New Texas",talkToKallyAboutNewTexas,undefined,"New Texas","Ask her what she thinks about New Texas.");
	else addDisabledButton(4,"Locked","Locked","You need to know more about the universe to ask this.")
	//Mhen’ga
	addButton(5,"Mhen’ga",talkToKallyAboutMhenga,undefined,"Mhen’ga","Ask her what she thinks about Mhen’ga.");
	//Tarkus
	if(flags["UNLOCKED_JUNKYARD_PLANET"] != undefined) addButton(6,"Tarkus",talkToKallyAboutTarkus,undefined,"Tarkus","Ask her what she thinks about Tarkus.");
	else addDisabledButton(6,"Locked","Locked","You need to know more about the universe to ask this.")
	//Ausar
	addButton(7,"Ausar",askKallyAboutAusar,undefined,"Ausar","Ask her what she thinks about the ausar.");
	//Kiro (Requires Unlock)
	if(flags["KIRO_MET_KALLY"] != undefined) addButton(8,"Kiro",kallyTalksAboutKiro,undefined,"Kiro","Ask her if she admires her sister.");
	else addDisabledButton(8,"Locked","Locked","You have not unlocked this topic. Shhh. It’s a sekrit.");

	if(pc.hasStatusEffect("KallyKiro")) addDisabledButton(9,"Picardine","Picardine","You already told her about the picardine. You’re just waiting to see the reaction.");
	else if(flags["KIRO_KALLY_PICARDINE_QUEST"] == 1 || flags["KIRO_KALLY_PICARDINE_QUEST"] == 2) addButton(9,"Picardine",tellKellyPicardine,undefined,"Picardine","Tell Kally that her sister sent her that Picardine!");
	else if(flags["KIRO_KALLY_PICARDINE_QUEST"] == 3 || flags["KIRO_KALLY_PICARDINE_QUEST"] == -2) addDisabledButton(9,"Picardine","Picardine","You already told her about this. There’s nothing more to add.");
	else if(flags["KIRO_KALLY_PICARDINE_QUEST"] == -1) addDisabledButton(9,"Picardine","Picardine","You already discussed this with Kiro and decided not to dwell on it.");
	else if(flags["KIRO_KALLY_PICARDINE_QUEST"] == undefined) addDisabledButton(9,"Locked","Locked","You don’t know enough to discuss this topic. Perhaps you should talk to her about other things first.");
	else addDisabledButton(9,"Locked","Locked","You don’t know enough to discuss this topic, but you’re pretty sure it somehow relates to her relationship with Kiro.");

	if(MailManager.isEntryUnlocked("del_moved")) addButton(10,"Delilah",askKallyAboutDelilah,undefined,"Delilah","Ask Kally about her new employee, Delilah.");
	else addDisabledButton(10,"Locked","Locked","Kally has no other employees to ask about.");
	
	addButton(14,"Back",backToKallyMain);
}

// Delilah
public function askKallyAboutDelilah():void
{
	clearOutput();
	showKally();
	processTime(5);
	output("<i>“So you bought Del?”</i>");
	output("\n\nKally leans over on the bar and waggles a furry finger at you. <i>“I don’t own Del. I own her contract. Slavery’s illegal, you know!”</i> She shakes her head sadly, then brushes a shimmering lock of chocolate hair out of her eyes. <i>“Truth be told, I needed an extra hand and saw an opportunity to help somebody else out of a shitty situation. When I heard what she’d been through, I couldn’t let her go back to that, [pc.name]. She’s been pumped full of so many mods and so many dicks that as soon as she got in the door, she was reaching under my skirt to suck my dick.”</i>");
	output("\n\nThat sounds an awful lot like Delilah.");
	output("\n\nLooking over your shoulder, Kally fixes her eyes on the slutty shemale. She chews her ebony lip, sighing heavily. <i>“It took the better part of a day to get her to stop fucking the customers in the main room, and I had to call in a favor from Sylvie, our resident peace-keeper, to keep her out of jail.”</i> She shudders from tail to tits. <i>“The poor thing seemed to think that complementary orgasms were a major part of customer satisfaction.”</i>");
	output("\n\n");
	if(pc.isBimbo()) output("Wait... they aren’t? You can’t think of a thing more satisfying than getting to hand out a few dozen orgasms.");
	else output("You wisely don’t mention your own contribution to her state.");
	output("\n\n<i>“But she’s doing really well now,”</i> Kally says, fidgeting. <i>“I’ve never seen someone work quite so hard, or be quite so eager to please. Sometimes, I’ll have something that needs taken care of, and she’ll be right there, on top of it, before I have a chance to react. And her hands! So quick and dexterous, coaxing out every drop...”</i> ");
	if(kiroKallyThreesomes() > 0) output("Kally waves languidly at Del, then adds, <i>“Her gag reflex is pretty much gone too. She gets all moody if I don’t let her milk me herself. I’m not so cruel as to deny her a safe way to indulge her lusts.");
	else output("Her tail waves back and forth nervously, and Kally stammers, <i>“...from the bottles! She’s very efficient!");
	output("”</i>");
	output("\n\n<i>“Right,”</i> you say, ");
	if(kiroKallyThreesomes() > 0) output("smiling lecherously at the kui-tan.");
	else if(flags["MET_DEL_SHEMALE"] != undefined) output("knowing all too well how much Del loves getting her face stuffed full of the kui-tan’s meat.");
	else output("now convinced that the kui-tan is getting blowies on the regular from her new employee.");
	output("\n\nGrabbing a rag, Kally wipes up a wet patch on the bar in a hurry. <i>“So I’m helping her get back on her feet. If she can stick to the plan I recommended her, she’ll be a free woman before long. It’s the least I can do.”</i>");
	output("\n\nDelilah shimmies up next to you, depositing a few empty glasses upon the bar with a wiggle and a wink. <i>“Mistress Kally, could you help me get some Kui Creamers from the back? You know I can’t get them on my own...”</i>");
	output("\n\nKally’s tail sticks straight up, and something thuds heavily into one of the coolers beneath the bar. <i>“M-maybe later. Check on tables six and eight, and if I’m free after, we can make up a whole bunch.”</i>");
	output("\n\nDel licks her lips, kisses your cheek, and spins away, ass wiggling outrageously.");
	output("\n\n<i>“So uh, I’d better get back to work,”</i> Kally says. While Del had you distracted, Kally shifted pose to lean over the counter, hiding the rest of her body behind the obscuring wall of her generous tits, but there’s no concealing the rigid tips of her nipples.");
	kallyBarMenu();
}

//Own Bar?
//Ask about owning bar. Tells how she got here.
public function askKallyAboutOwningHerBar():void
{
	clearOutput();
	showKally();
	processTime(7);
	output("<i>“");
	if(pc.isBimbo()) output("So you like, own this joint?");
	else if(pc.isBro()) output("You own this?");
	else if(pc.isNice()) output("So you own this place?");
	else if(pc.isMischievous()) output("You own this place, or are you just delightful eye candy?");
	else output("You own this place?");
	output("”</i>");
	output("\n\nKally vigorously nods, setting her curls bouncing behind her. <i>“Yup! Owner and sole proprietor. Took me long enough, but I’ve finally made it. You wouldn’t believe how expensive space on a trading station like this one is. If you think buying a ship is bad, getting station space that you can call your own is a nightmare.”</i>");
	output("\n\nYou ask her how she got the money together then.");
	output("\n\n<i>“Getting the money for the bar was pretty easy. It was getting off Jitafore that was hard.”</i> Kally tosses a dirtied rag behind the bar and pulls a new one out from beneath the counter. She sets back to scrubbing while she talks. <i>“There wasn’t a lot going on where I was from. So after my step-sister took off, I guess I figured I’d do the same. No skills to speak of outside of housework, but I managed to score an indentured servitude contract as a cook on Vesperia.”</i>");
	output("\n\nMost people in this galaxy wouldn’t be so happy to become an indentured servant, and you let her know.");
	output("\n\nRolling her eyes, the chubby kui-tan quips, <i>“Most people aren’t me. Most people won’t scrimp and save. Most people will take extensions to eat better food or wear better clothes. Most people don’t have discipline.”</i> Kally thumps her fist on the bar for emphasis. <i>“I did my job, and I did it damned well - well enough to earn an upward adjustment on my contract pay rate. That’s one of the nice things about Vesperia; they have some really strict rules about compensating indentured servants fairly. It’s why I made sure I wound up here.”</i>");
	output("\n\nYou nod amiably and play with your glass, letting her talk.");
	output("\n\n<i>“I was paid off in a year and a half instead of four.”</i> Kally’s voice is strong and prideful. <i>“And I took a bonus to keep on at the restaurant. Got a few promotions along the way, saving every cred. At the time, I wanted a ship to call my own. Figured I’d see the galaxy, like my little sister was doing.”</i> She shrugs. <i>“Then I started learning how to bartend.”</i> Her tail wiggles happily. <i>“Nobody ever told me how fun it was. It makes people just as happy or happier than cooking with way, wayyyyy less effort. And I get to hang out with my customers while I do it.”</i>");
	output("\n\n<i>“So you wanted a bar?”</i> you ask.");
	output("\n\n<i>“Yup.”</i> Kally adjusts her shirt to keep it from slipping over a shoulder. <i>“Which meant saving a lot more. This place is expensive, and after the whole indentured thing, I didn’t want to be on the hook to anyone for monthly payments.”</i> She gets a faraway look in her eyes. <i>“And then I had all the credits I needed...”</i>");
	output("\n\nYour confusion must be showing, because Kally grins, ears wiggling.");
	output("\n\n<i>“Yeah. I guess somebody out there likes me, because a week after I whined on the extranet about having to save for five more years, I got a mystery package in the mail - with a chunk of polished Picardine big enough to buy a room outright.”</i> Kally shrugs. <i>“Never figured out where it came from, but it was legal so far as I could tell. Had this place two weeks later.”</i>");
	output("\n\n<i>“This whole place?”</i> This room is decent sized, but there’s obviously a few other areas.");
	output("\n\nKally shakes her head. <i>“Not the whole place. Just the main room. In hindsight, it wasn’t my best idea. We didn’t have our own bathroom till I was able to buy out the place next door and convert it.”</i> She chuckles to herself. <i>“We’ve had steady business ever since, especially since nobody else on station can stock the drinks I make.”</i> ");
	if(flags["KALLYS_SECRET_INGREDIENT"] == undefined) output("Her grin seems a little too mischievous.");
	else output("She gives you a wink.");
	output("\n\nMakes sense.");
	output("\n\n<i>“Oh, looks like you’ve " + (pc.isSmashed() ? "reached your limit. Best sober up and maybe we can chat again?" : "run out. Can I get you anything else?") + "”</i>");
	if(flags["KIRO_KALLY_PICARDINE_QUEST"] == undefined) flags["KIRO_KALLY_PICARDINE_QUEST"] = 0;
	kallyBarMenu();
}

//You’re Cute
public function tellKallyShesCute():void
{
	clearOutput();
	showKally();
	processTime(1);
	//Drunk
	if(pc.hasStatusEffect("Adorahol") && pc.isDrunk())
	{
		output("<i>“You’re ");
		if(pc.isBimbo()) output("sooo ");
		output("cute!”</i>");
		output("\n\nKally smirks, but the inside edges of her ears pinkens. <i>“Awww...”</i>");
		output("\n\n<i>“You are!”</i> The words spill out on their own. You’re far too inebriated for any kind of mental filter.");
		output("\n\nThe kui-tan rubs the back of her neck and chews on her lip. <i>“You’re such a fucking sweetie, you know that?”</i> She shakes her head, curls bouncing behind her. <i>“Sometimes, people get drunk in here and they tell me things like that, and I’m not sure how to feel about it. On one hand, it’s definitely a lip-loosener.”</i> A smirk springs across her visage. <i>“For mouths and... other places. But on the other hand, it seems to breed a sort of lazy licentiousness. I can’t go a night without people like you tittering your way through a dozen compliments.”</i> She pouts. <i>“A girl can’t know what to think!”</i>");
		output("\n\nYou grab one of her hands and squeeze. <i>“I mean it. You’re");
		if(pc.isBimbo()) output(", like");
		output(", incredibly cute. I just wanna cuddle you.”</i>");
		output("\n\nKally pulls your palm up to her cheek and leans into it. <i>“Really?”</i>");
		output("\n\n<i>“Totally.”</i>");
		output("\n\nThe sugary sweet bartender takes your arm and pulls it down, dragging your fingers along her cheek, chin, and to the nape of her neck. <i>“Then I think I can let you have a little treat.”</i> She guides your hand further south across silky fur to edge of her blouse, then slides you lower, letting your fingers cup a pillowy soft melon. You squeeze before you know what you’re doing, but Kally just smiles and secures your other hand, placing it upon her other breast. <i>“One more, then it’s back to work,”</i> she coos.");
		output("\n\nYou can’t stop yourself. You caress her tits and thumb at her nipples, reveling in their supple glory. Kally doesn’t stop you from enjoying yourself, but she does make little sighs of enjoyment, only pulling your hands away after you’ve turned one grope into a dozen.");
		output("\n\n<i>“Down [pc.boyGirl],”</i> the fuzzy club owner commands. She tugs her top to smooth the ruffles you’ve lent it, and shakes her hair, breathing a little more heavily than a few moments ago. <i>“");
		if(flags["KALLY_3SOME_TALK"] == undefined) output("Why don’t we see if there’s anything I can do for you that doesn’t require a bedroom, hrmm?");
		else output("If you rounded up my sister, I could be talked into giving you a little more time with the girls.");
		output("”</i>");
		pc.changeLust(5);
	}
	//Buzzed (or normal drunk)
	else if(pc.isBuzzed() || pc.isDrunk())
	{
		output("<i>“You’re ");
		if(pc.isBimbo()) output("sooo ");
		output("cute!”</i>");
		output("\n\nKally waves your words away, but there’s a warm smile hidden behind. <i>“You’re far from the first to tell me that - especially after a few drinks.”</i>");
		output("\n\nYou press on. <i>“But you like it!”</i>");
		output("\n\n<i>“Maybe I do,”</i> the bartender giggles, <i>“but maybe I’m too busy doing my job to take flirty [pc.boyGirl]s like you for a ride.");
		if(flags["KIRO_MET_KALLY"] != undefined) 
		{
			if(flags["KALLY_3SOME_TALK"] == undefined) output(" Maybe I’m not going to mess up my sister’s good thing just so I can have a little fun.");
			else output(" Get Kiro involved, and it’d be worth my while.");
		}
		output("”</i> She grabs your hand in her paws and gently traces the back of it. <i>“But you are a real sweetheart. You are. And so long as you’re sweet to me, I’ll be sweet to you.”</i> Her hands are warm around yours. <i>“You’re a treat, [pc.name]. Don’t let anyone tell you different. Now is there anything I can do for you... that won’t get me fined for indecency?”</i>");
	}
	//Not drunk
	else
	{
		output("<i>“You’re cute.”</i>");
		output("\n\nKally smirks, <i>“");
		if(flags["KALLY_3SOME_TALK"] == undefined) output("And I’m a damned good bartender too. You gotta have something more interesting to talk about, right?");
		else output("And I’m a fantastic lay too, but while I’m working, let’s stick to talkin’. Awright?");
		output("”</i>");
	}
	kallyBarMenu();
}

//Rush?
//Thoughts on the rush. Excited. Worried about frontier crime and slave trafficking.
public function talkToKallyAboutTheRush():void
{
	clearOutput();
	showKally();
	processTime(3);
	output("<i>“So what do you think of the rush?”</i>");
	output("\n\nKally shrugs and adjusts her top after her boobs stop bouncing. <i>“Hard to say. The thing about rushes is that there’s just so much happening. We go our whole lives seeing archive footage of them from the distant past, watching industrial machinery spinning up for a decade. Corporations, pirates, and plucky adventurers like yourself all charge out there, hoping to strike it rich. Some of you are legit. Some aren’t. Riddle me this - what do you think of illicit slavery being up 1300%?”</i>");
	output("\n\nThat’s a lot. You raise your eyebrows.");
	output("\n\n<i>“That’s just based off what they catch. The real number could be much higher. All these new planets full of sapients. None of them UGC citizens. They don’t have IDs or technology, just wide-eyes, nubile bodies, and heads full of naivete.”</i> Kally shakes her head. <i>“And the only thing the government cares about is making sure we don’t stumble face-first into an alien empire. They might fine some companies in twenty years, maybe blow a few of the dumber pirates out of the sky, but it’ll be too late to change anything for poor species like the zil or raskvel. Word is those little lizard-girls make talented whores.”</i>");
	output("\n\n<i>“Really?”</i> you ask.");
	output("\n\n<i>“Really.”</i> Kally leans close. <i>“Ever hear of Beth Carver? That bitch has her fingers in damn near every pie in the galaxy. One of her recruiters tried to trick me into a contract with them.”</i> She snorts. <i>“Fat chance. Lucky for me, I learned to read, and I learned to research. No way I would feed myself into that snake’s jaws. You want my advice, you stay away from any place with the Carver name on it - Beth’s Broads, Carver’s Cuties - any of ‘em.”</i>");
	output("\n\nYou nod solemnly.");
	output("\n\n<i>“Good. Sorry to be such a downer. There’s a lot of great stuff out there - races getting uplifted. Farmers on the verge of starvation getting a better life thanks to UGC.”</i> Kally pats the bar. <i>“Gotta take the good with the bad, I guess.”</i> She adds, <i>“You ever get the chance to run one of those megacorps, maybe do us little guys and gals a favor and treat the little guys better.”</i>");
	kallyBarMenu();
}

//Kiro (Requires Unlock)
//No threesomes: Talks about she admires her
public function kallyTalksAboutKiro():void
{
	clearOutput();
	showKally();
	processTime(3);
	output("<i>“You really admire your sister?”</i> ");
	if(pc.isBimbo()) output("Who wouldn’t? She’s like, the best at sex, next to a bimbo or New Texan.");
	else output("Kiro didn’t seem to think she would.");
	output("\n\nKally flips her bar rag over her shoulder and leans across the bar. <i>“Hell yeah I do. Is she an outlaw? Sure. Is she a pirate? You bet. A murderer and a rapist? I don’t think so. Look her up on the e-net. Plenty of injuries, a merc stupid enough to frag himself on his ordinance, but no mass murder, not even when it would make her life easier. And take a peek at all those supposed rapes. Every one of them, an attractive woman. Not a single injury outside of a strained orifice... well, aside from the one that broke her arm after she slipped in cum and fell.”</i>");
	output("\n\nYou raise an eyebrow, but that does jive with what you’ve seen and heard about Kiro.");
	output("\n\n<i>“Void, I respect the hell out of her.”</i> Kally’s eyes sparkle. <i>“She was a backwater nothing with a sister who gave her endless trouble. There was zero chance that either one of us would get out and about on our own, but she did it. She did it with nothing more than guts, wit, and an idea.”</i> She picks up a shot glass and spins it around. <i>“Truth is, I wouldn’t be here talking to you if it wasn’t for her giving me the idea to try it myself. My way might have been more legal, but if I made the wrong choices, signed up with the wrong people, I could’ve wound up a slave. The paperwork would call me an indentured servant while a corporation turned me into a whore. We both gambled. She pulled the slots till she won big. I spent my time, building up a few winnings in blackjack. Not as quick, but more stable and less at the whim of lady luck.”</i>");
	//Bro
	if(pc.isBro()) output("\n\nYou grunt agreeably.");
	//Bimbo
	else if(pc.isBimbo()) output("\n\nYou kind of space out halfway through the gambling analogies, mentally replacing the complicated games your own, funner types of games - like trying to guess which bar bro could give you the biggest load. <i>“Mmm-hmm...”</i>");
	//Else
	else output("\n\nYou quip, <i>“Kiro always struck me as more of roulette player.”</i>");
	//Merge
	output("\n\n<i>“Besides, [pc.name], she’s my sister.”</i> Kally flips the tiny glass into the air and deposits it neatly onto a stack of its peers. <i>“Even if she had done something monstrous, I’d have to be the one to try and turn her around.”</i> She shakes her head ruefully. <i>“Not sure how I’d pull that one off, though. That girl is as thick-headed as an Ausari Bull-Beetle. Now,”</i> she cocks her head, <i>“" + (pc.isSmashed() ? "sober up and maybe we can chat some more, okay?" : "can I get you another drink?") + "”</i>");
	kallyBarMenu();
}

//Galotians
//Talks about how fun they are - and how she met Galos, the original Galotian. Kinda sad they aren’t smarter.
public function askKallyAboutGalotians():void
{
	clearOutput();
	showKally();
	processTime(3);
	output("<i>“Ever meet a Galotian?”</i>");
	output("\n\nKally’s eyes get a faraway look in them. <i>“Yeah. It was a while back, but a race like that leaves an impression.”</i> She busies herself scrubbing at the bar. Are her nipples getting hard? <i>“You ever hear of Galos?”</i>");
	if (CodexManager.entryViewed("Galotians"))
	{
		output("\n\nWasn’t that the first galotian to make contact with UGC researchers? <i>“Sounds familiar...”</i>");
	}
	else output("\n\nYou shake your head in the negative.");
	output("\n\n<i>“She’s basically like their queen or something. She came in here about a year back on a diplomatic mission. Stayed the night before she went down to the planet proper.”</i> The corners of her mouth lift. <i>“I didn’t know those goo-girls could be that smart. Word on the extranet said they were barely-sapient cum-suckers, fit only for releasing unsated breeding pressures. She isn’t. Or at least, she’s more than that.”</i> A hint of a blush rises up to the insides of her ears. <i>“And she has an absolute fortune in gemstones floating inside her! Whenever she moves, she glows brighter than any disco ball.”</i>");
	output("\n\nYou steer the topic back a few sentences. <i>“What kind of mission was she on?”</i>");
	output("\n\n<i>“Oh,”</i> Kally exhales dreamily, <i>“she was campaigning for relaxed immigration to Vesperia for galotians. Apparently most of her race is pretty terrible with paperwork, which leads to arrests... which usually leads to indentured servitude or black market slavery. I hope it works out for her. She was a real sweety. Seemed to actually care what happened to her people. You don’t see a lot of that in this galaxy.”</i>");
	output("\n\nInteresting. <i>“So overall, you like them?”</i>");
	output("\n\nKally leans close. <i>“I liked her, and I </i>adored<i> what that syrupy body of hers did in the bedroom. So yes, I like galotians. They can shape their bodies into the hottest possible shape, fuck better and more flexibly than anyone else in the known universe, and will give you a smile every step of the way.”</i> She sighs wistfully. <i>“I just wish the rest of the universe would quit treating them like toys.”</i> Straightening, the bartender looks over her establishment. <i>“" + (pc.isSmashed() ? "And it looks like you’ve had enough to drink. Sober up and maybe we can chat again?" : "Anything else I can get you?") + "”</i>");
	kallyBarMenu();
}

//New Texas
//Loves the place in theory but has her misgivings about the Treatment. Bitches about it forcing attitudes with hormones but also bitches about nature doing the same. Fucked a cow-boy before, and never cum harder - unless she’s fucked the PC.
public function talkToKallyAboutNewTexas():void
{
	clearOutput();
	showKally();
	processTime(6);
	output("<i>“Ever go to New Texas?”</i>");
	output("\n\nKally’s eyebrows rise. <i>“Yeah, once. I actually won a contest to visit one of the nicer tourist ranches. No way I could’ve afforded it otherwise.”</i> She snorts. <i>“I wouldn’t mind going back if I ever find myself with twenty thousand extra credits and nothing better to spend them on.”</i>");
	output("\n\n");
	if(flags["LANDED_ON_TEXAS"] == undefined) output("That’s a staggering amount for a bartender.");
	else output("Weird. You got invited for free.");
	output("\n\n<i>“Nice place though. Clean air, rustic scenery, and people almost too sexy and friendly to be believed. Every woman looks like a fetish model, and every man like he does nothing but lift weights and fuck day in and day out.”</i> The kui-tan shakes her head, but one of the ruffles on her skirt lifts higher than the rest. <i>“It’s hard to argue with the results, but the Treatment seems like pretty insidious stuff. It’s one thing to hit puberty and have your body’s hormones force you into thinking about sex. It’s quite another to design something like that artificially, then expect every single person on an entire planet to take it.”</i>");
	if(pc.isBro()) output("\n\nYou grunt and flex the muscles in your arm, trying to see if turning her on will get her to talk about the funner stuff.");
	else if(pc.isBimbo()) output("\n\nYou giggle. <i>“Trust me, the Treatment is way cool. I’m so much happier like, all the time now!”</i>");
	else output("\n\nYou stroke your chin and nod.");
	output("\n\nKally shakes her head. <i>“");
	if(!pc.isBimbo()) output("Yeah, ");
	else output("But ");
	output("the whole planet is just so damned happy. They don’t have problems with depression, loneliness, or getting their citizens to pitch in and work. Have you seen the males? They practically pop boners at the idea of raising a barn. I’ve never seen so many straining overalls in one place at once, or so many people unconcerned by how cum-stained their clothes were.”</i> Breathing heavily, the bartender wrings her hands. <i>“I’d be lying if I didn’t admit to getting a few bull rides myself. You ever get fucked so hard that walking up the boarding ramp to your ship is a challenge?”</i>");
	if(pc.mf("","f") != "f") output(" She glances your way. <i>“Oh right. Probably not.”</i>");
	output("\n\nYou look her up and down. The curvy woman is most definitely aroused by the discussion but doing a good job of controlling herself. The flushes at the edge of her fur, rigid nipples, and slightly tented skirt are the only giveaways.");
	output("\n\n<i>“I guess I’ll give the place a pass. There’s worse things than choosing to genetically alter your nature, though I think they’d all be a lot better off if they let their people pick which version they get instead of having what amounts to a transformation lottery.”</i> Shaking her head, Kally explains, <i>“Most of the girls seem about as cum-crazed as your average galotian, and some of the males wind up as these cute, demure little guys. They don’t get nearly enough love.”</i> She licks her lips. <i>“Not nearly enough love.”</i>");
	output("\n\nYou raise an eyebrow, but Kally swiftly changes the topic of conversation. <i>“" + (pc.isSmashed() ? "Now look, you’re drinking yourself into a stupor. Sober up and maybe we can chat again?" : "So, can I get you another drink?") + "”</i>");
	kallyBarMenu();
}

//Mhen’ga
//Worried about the cunt-snake infestation and what it could mean. Curious about venus pitchers and if they’re actually intelligence.
public function talkToKallyAboutMhenga():void
{
	clearOutput();
	showKally();
	processTime(7);
	output("<i>“Any thoughts on that Mhen’ga world?”</i>");
	output("\n\nShuddering, Kally nods sadly. <i>“I’ve got a lot of thoughts on that world, like how we’re ruining it one step at a time. Aside from trampling over the native peoples and their customs, a whole lot of non-native species have already moved in. Luckily, the planet’s jungles seem to do a good job of keeping down the invaders, but cunt snakes grow like weeds there. I even heard there are zil infested with five or six of the things. If it gets much worse, the UGC is liable to classify the whole system as Tainted Space and require rigorous decontamination protocols for anyone who wants to leave.”</i>");
	output("\n\n<i>“So you don’t care for cunt-snakes?”</i>");
	if(pc.hasCockTail() || pc.hasCuntTail())
	{
		output(" You do your best to keep your little budd");
		if(pc.tailCount > 1) output("ies");
		else output("y");
		output(" hidden.");
		if(pc.hasCockTail()) output(" Cockvines are probably close enough to earn potential ire.");
	}
	output("\n\nKally shrugs. <i>“I think they’re a little weird, I guess. I’m not going to ban anyone who has one... unless they start trying to hide eggs in the bar or something. I just don’t like the idea of spreading things like that to people who don’t even have the medical technology to deal with it. Like, if one jumped out, bit me, and merged into my spine, I could sit here and jack off with it a few times, have a laugh, then head down to medical and get it removed. Some tribesman in the jungle doesn’t have that option.”</i>");
	output("\n\nYou nod. <i>“Makes sense.”</i>");
	if(pc.hasCockTail() || pc.hasCuntTail()) 
	{
		output(" Behind you, your parasitic tail");
		if(pc.tailCount > 1) output("s relax");
		else output(" relaxes");
		output(", sliding back out into view.");
	}
	output("\n\n<i>“The zil could make for good galactic citizens if they didn’t say ‘hi’ by trying to force-fuck each other. Naleen are a little primitive, but I could see them finding plenty of work once they acclimate to the rest of the universe. Not sure about venus pitchers, though.”</i> Kally wipes a smudge off the side of a glass. <i>“Scientists haven’t even figured out if they’re properly sapient yet. Everybody who tries to communicate with them either triggers their instinct to hide or winds up fucking them so much that they forget to pretend they’re supposed to be doing research.”</i>");
	if(flags["TIMES_CAUGHT_BY_ELDER_VENUS_PITCHER"] != undefined) output("\n\n<i>“Yeahhh,”</i> you answer dreamly, fondly remembering your own encounter.");
	else output("<i>“Yeah,”</i> you grunt, glad you never fell for such a ploy.");

	output("\n\nKally taps a finger. <i>“What else... oh! Those tentacle girls! I can’t recall the name, but the ones with the wiggly skirts and ball-swelling breastmilk? I’m not sure about them either. The last article I remember reading mentioned that they might not actually be a native species, though. So there must have been some kind of ancient colony ship that landed there - that or they used to have warp gate technology.”</i> She snorts. <i>“I’m not sure anybody but the ausar could whip up tech like that, though.”</i> Her musings trail off, and she notices your empty drink vessel. <i>“" + (pc.isSmashed() ? "I think you’ve had enough drinks in you now. Sober up and maybe we can chat again?" : "Hope you enjoyed your drink. What next?") + "”</i>");
	kallyBarMenu();
}

//Tarkus
//Planet is shit. It’s a wonder it stayed together. Wants a raskvel to work for her.
public function talkToKallyAboutTarkus():void
{
	clearOutput();
	showKally();
	processTime(3);
	output("<i>“Ever been to Tarkus?”</i>");
	output("\n\nKally laughs. <i>“That midden heap? No. Never.”</i>");
	output("\n\n<i>“Really? Why?”</i>");
	output("\n\n<i>“Really.”</i> The puzzled kui-tan looks like she can’t quite believe you. <i>“The place is literally a junkyard. What’s more, it’s obviously two different chunks of planet glued together by technology none of the indigenous races even seem to have a proper understanding of. And rumor is there’s defective sex-bots running around everywhere. Raskvel are cute, don’t get me wrong, but they should probably stop trying to fix fuck-machines and do something to improve their situation. Last I heard, the most civilized bunch of them were living in an old, terran colony ship like a bunch of squatters.”</i>");
	output("\n\nThat’s... not far off from the truth. You nod.");
	output("\n\n<i>“Yeah, I won’t be visiting that place any time soon. Maybe someday I’ll get to meet a raskvel or gabilani though. I’ve always wondered what it’s like for the shorter races. Most everyone in this place is on the other side of the spectrum.”</i> She tilts her head toward a group of enormous bull moosetaurs. <i>“Good thing we’re nice and snug here on Canadia Station, huh? Now so long as a pack of sydians don’t show up to chew their way through the hull" + (pc.isSmashed() ? "... eh, maybe you should sober up then we can chat again?" : ", what can I get you?") + "”</i>");
	kallyBarMenu();
}

//Ausar
//They must get cold. So weird that they’re basically almost terrans. Thinks they’re the smartest race in the galaxy, though.
public function askKallyAboutAusar():void
{
	clearOutput();
	showKally();
	processTime(6);
	var isHuman:Boolean = pc.isHuman();
	output("<i>“What do you think about ausar?”</i>");
	output("\n\n<i>“Buncha smart bitches.”</i> Kally chuckles. <i>“Seriously though, I don’t know if I’ve ever seen a brainier bunch than those puppies. Between ");
	if(isHuman) output("you");
	else output("the");
	output(" terrans and the ausar, ");
	if(isHuman) output("you’ve");
	else output("they’ve");
	output(" created more technology that the universe depends on than anyone else. Warp gates? I still can’t wrap my head around how those things work, and don’t even get me started on Light Drives.”</i> She shakes her head. <i>“I almost wish I could go back in time and kiss every single one of the scientists that let us travel between the stars.”</i> Her lips curl. <i>“If any of them invent working teleportation or portal technology, I’ll do more than that.”</i>");
	output("\n\nYou rock back in surprise. <i>“Really?”</i>");
	if(pc.isBimbo() || pc.libido() >= 70) output(" You should get to work on figuring that out, ASAP.");
	output("\n\nShaking her head, Kally demurs, <i>“Well, maybe? I’d have to make sure they weren’t some kind of scumbag. And that we had compatible biology. That’s another nice thing about ausar - they have those big ol’ knots, just like kui-tan.”</i> She pauses, <i>“Well, normal kui-tan. I got a little gene-work done not long after my sister, but I still love the feel of a big bulb stretching my pussy.”</i> Flashing her teeth in an expansive grin, she adds, <i>“I guess that’s why both ausar and kui-tan both like fucking humans. ");
	if(isHuman) output("You");
	else output("They");
	output(" may not have a real knot, but ");
	if(isHuman) output("you");
	else output("they");
	output(" make up for it with those big, round heads. It’s like a knot that strokes back and forth along the whole length of your pussy while you fuck!”</i>");
	output("\n\n");
	if(pc.isBimbo()) output("You start groping yourself as you listen to the increasingly sordid descriptions. Rubbing your nipples makes it so much easier to listen to.");
	else if(pc.isBro()) output("You reach down and adjust your stiffening crotch. After you finish, you let your hand remain, squeezing with every sordid detail.");
	else if(pc.libido() < 33) output("You blush beet red.");
	else if(pc.libido() < 66) output("You blush but don’t bother trying to hide it.");
	else output("It’s hard to maintain your composure with the fuzzy bartender being lewd. Your eyes kind drifting away from her face and into the snug-looking valley that is her cleavage.");
	output("\n\nSeeing your reaction, Kally shakes her head, laughing softly. <i>“Got a little off topic there, eh? Well no worries. You just " + (pc.isSmashed() ? "take a break and sober up, then maybe we can chat again?" : "let me know if there’s anything a little more appropriate I can do for you.") + "”</i>");
	kallyBarMenu();
}

//1- landing pad
public function kiroKallyCanadiaLPBonus():void
{
	if(!roamingKiroAvailable() && !crewKiroAvailable()) return;
	kiro.ballSizeRaw = 10;
	if((flags["KIRO_MET_KALLY"] == undefined || flags["KIRO_MET_KALLY"] == 0) && MailManager.isEntryViewed("kirodatemeet"))
	{
		showKiro();
		if(kiroIsCrew())
		{
			output("\n\nKiro follows you down the ramp in her trademark red dress, doing her best to smooth out the skirt’s edge. Her balls are as small as you’ve ever seen them. You’d barely notice them beneath the sheer fabric if you weren’t looking for them.");
			output("\n\nYou flash a friendly smile. <i>“");
			if(pc.isBimbo()) output("Omigosh, did you dress up all pretty for me?");
			else if(pc.isNice()) output("Looking pretty great there, Kiro.");
			else if(pc.isMischievous()) output("You got a hot date you’re planning to introduce me to, or are you just trying to seduce me? Because it might be working.");
			else output("Finally got tired of tripping over your balls, huh?");
			output("”</i>");
			output("\n\nKiro fidgets slightly, her typical confidence nowhere to be found, but she manages to smile back all the same. <i>“It’s my sister. I’ll explain on the way.”</i>");
		}
		else
		{
			output("\n\nKiro stops flirting with a svelte, four-legged mechanic the moment you step off your ship, tapping something into a wrist-mounted display that leaves the deer-like woman grinning at her own Codex-style tablet. The kui-tan sashays over in her trademark red dress, doing her best to smooth out the skirt’s edge. Her balls are as small as you’ve ever seen them. You’d barely notice them beneath the sheer fabric if you weren’t looking for them.");
			output("\n\nYou flash a friendly smile. <i>“");
			if(pc.isBimbo()) output("Omigosh, did you dress up all pretty for me?");
			else if(pc.isNice()) output("Looking pretty great there, Kiro.");
			else if(pc.isMischievous()) output("You got a hot date you’re planning to introduce me to, or are you just trying to seduce me? Because it might be working.");
			else output("Finally got tired of tripping over your balls, huh?");
			output("”</i>");
			output("\n\nKiro fidgets slightly, her typical confidence nowhere to be found, but she manages to smile back all the same. <i>“It’s my sister. I’ll explain on the way.”</i>");
		}
		flags["KIRO_MET_KALLY"] = 0;
	}
}

//2 - airlock
public function kiroKallyCanadiaAirlockBonus():void
{
	if(!roamingKiroAvailable() && !crewKiroAvailable()) return;
	if((flags["KIRO_MET_KALLY"] == 0 || flags["KIRO_MET_KALLY"] == 1) && MailManager.isEntryViewed("kirodatemeet"))
	{
		showKiro();
		output("\n\nKiro adjusts her hair using a wrist-mounted holocam, then nods, apparently satisfied with the arrangement of her chocolate locks. <i>“My sister... well, step-sister... anyway, we used to be pretty close, back in the day, but when I fucked off from Jitafore, I fucked off </i>hard<i>.”</i> Kiro jerks her thumb over her shoulder to emphasize just how quickly she blew off her home planet. <i>“I left my family, including Kally, and any chance of honor behind so that I could be more than what I was.”</i> Kiro pauses, lost in thought. <i>“I didn’t even get to say goodbye. Stars, I wonder what she looks like now...”</i>");
		flags["KIRO_MET_KALLY"] = 1;
	}
}

//3 - Hallway
public function kiroKallyCanadiaHallwayBonus():void
{
	if(!roamingKiroAvailable() && !crewKiroAvailable()) return;
	if((flags["KIRO_MET_KALLY"] == 1 || flags["KIRO_MET_KALLY"] == 2) && MailManager.isEntryViewed("kirodatemeet"))
	{
		showKiro();
		output("\n\nYou glance sidelong at Kiro as you round a bend in the hall. <i>“Surely you stayed in touch though. How else would you have gotten an invite to the bar?”</i>");
		output("\n\nThe relatively conservatively dressed kui-tan chortles at that and shakes her head. <i>“Not at all. That’s the thing about crossing over into void-banditry. You have to harden yourself up to do it. You can’t be sitting there wondering what someone is going to think of you. You can’t afford to care. You find your friends and your wrecking crews, and you flip the rest of the universe the bird.”</i> Tightening her hand into a fist, Kiro admits, <i>“I think it was easier to ‘forget’ to contact Kally than to take the chance that she’d hate me for what I do. To take the chance that I’d have to push her away forever.”</i>");
		flags["KIRO_MET_KALLY"] = 2;
	}
}

//4 - Outside the bar
public function kiroKallyCanadiaBarBonus():void
{
	if(!roamingKiroAvailable() && !crewKiroAvailable()) return;
	if((flags["KIRO_MET_KALLY"] == 2) && MailManager.isEntryViewed("kirodatemeet"))
	{
		showKiro();
		output("\n\nYou ask, <i>“Then how’d you get the invite?”</i>");
		output("\n\nKiro glances at you, then pulls you to a recessed area alongside the door, away from the station’s other residents. <i>“She found </i>me<i>, or at least one of my extranet accounts. Not that I put a lot of effort into hiding my presence there, but it still came as a shock. And if she found me online, then she’s doubtless found all the articles about my exploits. That means that she’s either accepting of my profession, or this is the most elaborate sting operation we’re likely to bumble into in our short lifetimes.”</i> Her inky lips split in a manic grin. <i>“Let’s just do this.”</i>");
		output("\n\nKiro straightens up, squares her shoulders, and charges into the bar before you can possibly talk her out of it, nearly slamming the door double on its hinge.");
		output("\n\nWell, you didn’t come all this way to sit this out. You follow after");
		if(pc.hasEquippedWeapon()) output(", hand on your [pc.weaponStat]");
		else output(" with caution");
		output(".");
		flags["KIRO_MET_KALLY"] = 3;
	}
}

//Meeting
public function kiroKallyBarMeetOverride():void
{
	clearOutput();
	showKallyAndKiro();
	output("By the time you step into the Kui Country Bar and Lodge, Kiro and another kui-tan - obviously the aforementioned Kally - have seen each other. The former relaxes almost instantly, while the latter drops a mug of foamy beer from nerveless fingers. They almost look like biological sisters! Both share the features you would expect from kui-tan, but there’s more to it than that. They have the same wide hips and large busts, and their faces are similar enough that one could probably pass for the other with a bit of colorizing makeup. The only real difference is Kally’s plusher, slightly chubbier build and mildly darker fur. Likely she’s been sampling her own drinks and kitchen wares alike.");
	output("\n\n<i>“Kally!”</i> the slutty pirate calls, years of distance and worry forgotten.");
	output("\n\nThe other kui-tan smiles and walks out from behind the bar in a daze, clearly surprised to see her sister after all these years. <i>“Kiro...”</i> Kally looks her sister up and down, equal parts shocked and pleased to see her sibling. <i>“I sent the invitation so long ago. I had almost given up all hope that you would come.”</i> She glances your way, then back to her sister. <i>“Or that you’d bring such a " + pc.mf("handsome","lovely") + " [pc.boyGirl]friend with you.”</i>");
	if(flags["KIRO_GF"] == undefined)
	{
		output("\n\n[pc.BoyGirl]friend? That’s new. Your eyes dart toward Kiro’s, meeting her halfway. She seems as surprised as you, and... nervous? She must be blushing under all that fur. The fuzzy pirate hastily turns back to her sibling, clearing her throat. <i>“Uh, yeah. Sorry about that. Things have been hectic.”</i> She rubs the back of her neck, clearly uncomfortable.");
	}
	else
	{
		output("\n\n[pc.BoyGirl]friend? She’s a perceptive lass. Your eyes dart toward Kiro’s, meeting her halfway. She seems as surprised by Kally's keen eye as you, and... nervous? She must be blushing under all that fur. The fuzzy pirate hastily turns back to her sibling, clearing her throat. <i>“Uh, yeah. Sorry about that. Things have been hectic.”</i> She rubs the back of her neck, clearly uncomfortable.");
	}
	output("\n\n<i>“Oh, where are my manners!”</i> The bartending raccoon-girl circles behind the two of you, wrapping an arm around you and her sister both. <i>“Have a seat over in the corner. I’m sure you’re both tired from the road. I’ll get you some drinks, and we can catch up. You must have some fantastic stories to share, Sis.”</i> She stares meaningfully at Kiro even as she pushes the both of you toward a secluded booth.");
	output("\n\nKiro gulps.");
	processTime(3);
	clearMenu();
	addButton(0,"Next",kiroKallyMeetingPart1);
}

public function kiroKallyMeetingPart1():void
{
	clearOutput();
	showKiro();
	output("Kiro looks over her shoulder to make sure her sister is out of earshot, then leans low and whispers, <i>“You got my back on this, right?”</i>");
	//[Nod] [Laugh] [No]
	clearMenu();
	addButton(0,"Nod",notAtKiroAboutHavingBack);
	addButton(1,"Laugh",laughAtKiroAboutHavingBack,undefined,"Laugh","The idea of you not having her back is so insane that you can’t help but laugh.");
	addButton(2,"No",noDiceKiroNotHelping,undefined,"No","Tell her that you won’t lie for her. If she wants her sister to like her, she should be honest.");
}

//Nod:
public function notAtKiroAboutHavingBack():void
{
	clearOutput();
	output("You nod seriously. It’s the least you can do.");
	output("\n\n<i>“Good.”</i>");
	kallyShowsUpAfterKiroChoiceMoment();
}

//Laugh
public function laughAtKiroAboutHavingBack():void
{
	clearOutput();
	output("You chuckle softly, more amused by her awkwardness than anything else.");
	output("\n\n<i>“I’m not fucking around here, [pc.name]. I need to know you’ve got my back on this one.”</i> Kiro sucks in her breath. <i>“Please.”</i>");
	output("\n\n");
	if(pc.isNice()) output("You reassure her that you’re there for her, all humor aside.");
	else if(pc.isMischievous()) output("You laugh all the harder, but make sure to nod while you’re doing it.");
	else output("You sigh, cutting into your good humor. <i>“Who the fuck do you think you brought here Kiro? If I wasn’t going to help, I would’ve found something better to do.”</i>");
	output("\n\nHer reddish brown eyes search your face for a long moment. Then, apparently satisfied, Kiro relaxes. <i>“Good.”</i>");
	processTime(1);
	kallyShowsUpAfterKiroChoiceMoment();
}

//No
public function noDiceKiroNotHelping():void
{
	clearOutput();
	output("<i>“No.”</i>");
	output("\n\nKiro rocks back in her chair, eyes wide with terror. <i>“W-what?!”</i>");
	output("\n\n<i>“");
	if(pc.isNice()) output("I’m not going to help you lie to your sister, if that’s what you intend. Just relax and be yourself. It’s the only way you’re going to have any kind of normal relationship with her.");
	else if(pc.isMischievous()) output("Rebuilding a relationship on a bed of lies is only a good idea if you want it to crumple after a few months. Besides, I’m sure a sweet thing like you can charm her sister, no lying necessary.");
	else output("You can tell your own damned lies. If she asks me anything, I’m feeding her the truth. And you should too, if you don’t want her fucking off after she sees through the bullshit.");
	output("”</i> You reach across the table to ");
	if(pc.isNice()) output("lend her a comforting hand");
	else if(pc.isMischievous()) output("ruffle her meticulously groomed locks");
	else output("grab her by the wrist, conveying your conviction with everything from your serious stare to the strength of your grip");
	output(".");
	output("\n\nThe tanuki-like alien sags back, apparently convinced. <i>“You better be right about this, [pc.name].”</i>");
	processTime(2);
	kallyShowsUpAfterKiroChoiceMoment();
}

//Merge
public function kallyShowsUpAfterKiroChoiceMoment():void
{
	showKallyAndKiro();
	output("\n\nThe sound of clinking glasses approaching interrupts any further attempts at communication. Kiro stiffens, then makes an effort to relax into a more natural posture.");
	output("\n\n<i>“Sorry about the wait!”</i> Kally cheers, setting three bubbling concoctions down in front of you - two chocolate-colored ones for her and her sister, and a lighter, amber brew for you. <i>“I had to mix up the house special for your [pc.boyGirl]friend, Kiro.”</i>");
	output("\n\nKiro seems about as confused as you feel. Why wouldn’t she get the best drink?");
	output("\n\nThe chubbier tanuki explains, <i>“A lot of kui-tan are allergic to the secret ingredient. Causes lots of swelling.”</i> Kally nods sagely, smiling happily. <i>“Not a problem for the locals, but if Kiro or I started pounding it down, we’d probably need to be hooked up to medical equipment for a few hours.”</i>");
	output("\n\n<i>“What if I kissed [pc.name] with the residue on [pc.hisHer] lips?”</i> Kiro shifts a few inches away from you and your apparently tainted glass.");
	output("\n\nPatting the jumpy pirate’s paw, Kally giggles her way through an answer, <i>“It’ll be fine. You’d have to drink at least a mouthful for anything to go wrong. Just don’t douse [pc.himHer] in it and give [pc.himHer] a tongue bath.”</i>");
	processTime(3);
	clearMenu();
	addButton(0,"Next",kiroKallyMeetingPart2);
}

public function kiroKallyMeetingPart2():void
{
	clearOutput();
	showKallyAndKiro();
	output("<i>“Kally!”</i> Kiro shouts, seemingly aghast at her sister’s suggestion.");
	output("\n\nMidway through a sip of her ale, the accused raccoon-woman seems utterly astonished by the prudish reaction. <i>“What?”</i> she asks, wiping a bit of foam from her lips. <i>“Don’t pretend you haven’t done things a thousand times more depraved. You may have thought you left me behind on our little world, but I saved every snippet I could find about you on the extranet. Kiro, you once raided a convent-cruiser and deflowered half the nuns onboard. I wouldn’t be surprised if at least one was pregnant too.”</i> She belches, sending her sizeable rack jiggling. While every bit as big as Kiro’s, it’s just a little bit softer and a lot more prone to errant wobbling. <i>“Hell, you fucked your way to freedom after getting captured by an all-galotian gang. I could throw that holo up on a projector in a back room, if you’d like to see.”</i>");
	output("\n\nKiro slowly, ever so slowly, closes her mouth. Then, in a moment of pure brilliance, she hastily lifts her glass and begins to drink, begging you for help with her eyes.");
	output("\n\nHow do you answer?");
	processTime(3);
	clearMenu();
	//[Lewd Boast] [Helpfully]
	addButton(0,"Lewd Boast",helpKiroWithABoast);
	addButton(1,"Helpfully",helpAKiroOut);
}

//Lewd Boast
public function helpKiroWithABoast():void
{
	clearOutput();
	showKallyAndKiro();
	//-40 kiro trust.
	kiroTrust(-40);
	//Track if boasted. Maybe easier to get in Kally’s panties.
	flags["KIRO_KALLY_BOASTED"] = 1;
	output("<i>“Those are just the public stories,”</i> you calmly reply. <i>“In private, Kiro’s");
	if(pc.isBimbo()) output(" like,");
	output(" a fucking sex-bomb.”</i>");
	output("\n\nYour hermaphroditic buddy spits out her drink, giving you a moment to savor your own. It’s fucking delicious - chocolatey with hints of nuts and hops.");
	output("\n\nYou carry right on, trying not to laugh. <i>“");
	if(flags["KIRO_ORGIED"] != undefined) output("Trust me, I’ve been in an orgy with her. Your sister can fuck like a freight train.");
	else if(flags["PUMPED_KIRO_PUSSY"] != undefined) output("Trust me, Kiro’s way kinkier than the stories make her seem. She let me pump her pussy up till it looked like it belonged on a fetish site, and the moans she made could’ve made a New Texan cum from the sound alone.");
	else output("Trust me, Kiro’s a fucking wonder. Whatever you heard about her and her dick, it doesn’t do it justice. She wears that horse-dick better than any stallion I’ve ever met, and just telling you about the things she can do with it would make your toes curl.");
	output("”</i>");
	output("\n\nKiro glares daggers at you and raises a finger angrily-");
	output("\n\n<i>“Oh, I’m sure.”</i> Kally winks you before smiling at her sister. <i>“Kiro, you’re my sister. I love you. Just because you’ve swindled half the galactic population out of their panties doesn’t mean I’ll stop loving you.”</i> She gently grabs Kiro’s upraised hand and closes her own around it. <i>“Besides, I’ve grown up a lot too, even if it took me a little longer to admit it.”</i>");
	output("\n\nKiro opens her mouth, smacks it closed, opens it again, and closes it once more. She shakes her head before finally saying, <i>“You’re sure? Okay, but just for the record, those nuns were the cock-thirstiest girls I’ve ever met, and the galotians... well, they’re galotians.”</i>");
	output("\n\nLaughing, Kally agrees. <i>“Galotians!”</i> She raises her cup in a toast. <i>“To the universe’s happiest, most wonderful cum-dumps. May every one of them meet the endless virility of a kui-tan!”</i>");
	processTime(4);
	kallyKiroIntroMergeAfterBoastOrNot();
}

//helpfully
public function helpAKiroOut():void
{
	clearOutput();
	showKallyAndKiro();
	output("<i>“I don’t think we need to watch anything,”</i> you answer");
	if(pc.libido() >= 70 || pc.isBimbo() || pc.isBro()) output(", despite very much wanting to sneak a peek at it down the road");
	output(".");
	output("\n\nKiro sags with relief but continues to resolutely swallow her drink.");
	output("\n\n<i>“Let’s face it, galotians are notorious cum-dumps. It wouldn’t surprise me if they pinned poor Kiro down and had their way with her - only to get more of that legendary kui-tan volume than they bargained for,”</i> you supply as helpfully as you can. <i>“And Kiro doesn’t exactly seem like the type to force herself on a nun! Sure, her cock was probably hard and dripping at the sight of all those delicious, supposedly pious sisters, but I bet every one she took asked her for it.”</i> You put a reassuring hand on Kiro’s shoulder. <i>“I think Kiro is just surprised to see you so... ");
	if(pc.isBimbo()) output("like, totally fuckable and stuff. For the record, I’m totes up for letting you watch us have a little tongue fun.");
	else output("flirty. I got the impression from Kiro that you’d be the type to scold her for sluttery, not imagine us tonguing each other off.");
	output("”</i>");
	output("\n\nKiro looks like she wishes she could climb into the bottom of her drink and hide, but with no ability to shrink herself down, she settles for setting down her drink and leaning into your supportive touch.");
	output("\n\nRaising an eyebrow, Kally wisely says nothing, relying on the silence to draw a statement from her sister’s own lips.");
	output("\n\n<i>“[pc.name] is right... mostly. The galotians didn’t have to do very much forcing with the state I was in, and neither did the rahn leading them. It wound up being about as consensual as sex can get when you start out tied to a support beam.”</i>");
	output("\n\nThe chubby bartender smiles and leans in, chin propped on her palm as she listens with obvious interest.");
	output("\n\nKiro, taking this for approval, gains in volume and gusto. She sits up proud and straight when she gets to the part about the nuns. <i>“The nun thing started out as a mistake. I didn’t have scanners good enough to know what kind of cargo that freighter was packing, and I didn’t know enough about terran-style religions to recognize the religious overtones of the name.”</i> She shakes her head, grinning sardonically. <i>“Needless to say, they didn’t have anything worth stealing unless I wanted to rob a bunch of idiot girls who only wanted to save the galaxy with lip service.”</i>");
	output("\n\nKally cocks an eyebrow even higher. <i>“So you’re saying you didn’t force yourself on a bunch of foolish, young virgins? Really?”</i>");
	output("\n\nSnorting, the freebooting tanuki answers, <i>“No. Though, though I will admit that I did take them back, one at a time, and let them know that I’d fuck them if they wanted. Even let them pretend that I raped them, if it would keep them out of trouble with their church.”</i> Her tail twitches excitedly beside you. Kiro’s so lost in her story that she’s entirely forgotten her attempts to conceal her sexual escapades from her sibling. <i>“Those girls can </i>fuck<i>. Most of them went for anal - something about it not counting - and hot damn did they get loud. I’ve never made anyone shriek with pleasure so easily or so often. Well, aside from [pc.name], maybe.”</i>");
	output("\n\nKally smiles warmly. <i>“You know, I worried that you might have actually done it, like the stories said.”</i>");
	output("\n\n<i>“Nope! I even made off with some new extranet contacts after I left. I guess you could say I left a positive impression. Got pervy holos in the mail for weeks. Last I heard, one of them even got some augmentations herself and got into the holocam-girl business. I guess she figured there was more to life than denying yourself the little joys and decided to sample as many of them as she could. She’s more famous than me now, I hear.”</i> Kiro leans back, expression slowly sobering as she realizes just how much her enthusiasm for storytelling has given away.");
	output("\n\nGrinning, Kally raises her cup in a toast, <i>“To the sexually repressed, and getting over their misplaced mores!”</i> She looks like she’s talking about herself as much as the nuns. <i>“May their future fucks make up for their wasted youths!”</i>");
	processTime(5);
	kallyKiroIntroMergeAfterBoastOrNot();
}

//Merge 2 branches
public function kallyKiroIntroMergeAfterBoastOrNot():void
{
	output("\n\nAfter a slight pause, you and Kiro lift your glasses, clapping them happily against Kally’s before taking big swigs of the delightful brews.");
	output("\n\nKiro finishes first, wiping a bit of foam on her forearm. <i>“I never thought you’d be okay with the things I did, Kally. Not one bit. I mean robbing a bunch of corporate fatcats and thugs is one thing, but I saw how you looked at people back home.”</i> She shakes her head. <i>“The tongue-lashing you gave to those two seventh years you caught kissing in the bathroom at school was legendary. People wouldn’t even hold hands around you after that!”</i>");
	output("\n\nYou take a sip, watching Kally’s gaze turn inward.");
	output("\n\n<i>“It was all a big act,”</i> the bartender admits, curling her poofy tail into her lap and leaning heavily on it. <i>“I was just as horny as you in school, and I hated it. Hated how it made me feel, how it made it impossible to talk to anyone I found particularly attractive.”</i> Her fingers dig in tighter. <i>“So I pushed it down. I pushed it down hard, and I took it out on anyone who reminded me of it. Even you, sis.”</i> She brushes the corner of her eye, not quite crying but close. <i>“I blamed myself when you left. Figured I drove you away.”</i>");
	output("\n\nKiro grabs her sister’s hand and squeezes. <i>“You didn’t drive me away. Not entirely, anyway. I wanted to see the galaxy. I wanted to meet galotians - and fuck them, I’ll admit. It’s been a fantasy since puberty. I wanted to look out at the stars from the cockpit of my own ship and make a name for myself as something more than a grit-grubbing farm-girl.”</i> Kiro squeezes tighter. <i>“I wish I could’ve stayed closer with you, like we were when we were kids, but I was afraid. I should’ve kept in touch when I left. It was wrong to push you away like that.”</i>");
	output("\n\n<i>“I was wrong to give you so much hell about that pocket pussy I found in your room.”</i>");
	output("\n\nBoth kui-tan are smiling at this point. If the table weren’t between them, they’d probably be locked in a hug.");
	output("\n\n<i>“That thing sucked anyway. I’ve got a much, much better model nowadays.”</i>");
	output("\n\nKally casts her gaze your way and smiles wide enough for you to count her teeth. <i>“I bet...”</i>");
	processTime(5);
	clearMenu();
	addButton(0,"Next",kiroKallyMeetingPart3);
}

public function kiroKallyMeetingPart3():void
{
	clearOutput();
	showKallyAndKiro();
	output("The two long separated kui-tan spend a few minutes catching up when an irritable grunt from the bar tugs Kally’s attention away.");
	output("\n\n<i>“Looks like my break is over. Come see me at the bar if you wanna talk some more. And this time, you’d better stay in contact when you blast-off, Space-Girl.”</i>");
	output("\n\nKiro giggles. <i>“Sure thing, Ice Queen.”</i>");
	output("\n\n<i>“Nobody calls me that anymore.”</i>");
	output("\n\n<i>“Oooh, is it getting chilly in here?”</i> Kiro grabs you and pulls you into her lap, wrapping her arms around you. <i>“We better snuggle together for warmth!”</i>");
	output("\n\nKally rolls her eyes, but you catch her lips curving upward in a grin as she ambles back to her job.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",kiroKallyMeetingPart4);
}

public function kiroKallyMeetingPart4():void
{
	clearOutput();
	showKiro();
	output("<i>“Whew,”</i> Kiro sighs. You feel the beginnings of an erection nudging up against your butt. <i>“Thanks for backing me up on this.");
	if(flags["KIRO_KALLY_BOASTED"] != undefined) output(" I could’ve done without you trying to make things worse, but I guess it all worked out in the end.”</i>\n\nKiro trusts you a lot less!");
	else 
	{
		output(" I’m not sure I could’ve done this without you. You’re the best ");
		if(flags["RESCUE KIRO TECHSPEC MACHINE FIX"] == 1) output("fuck-machine repair[pc.manWoman]");
		else output("fuck-buddy-slash-hero");
		output(" I could ask for.”</i>");
	}
	output("\n\nYou wiggle back and forth, feeling her balls start to swell as well.");
	output("\n\n<i>“Ungh! Get off of my lap before you give me a real rager, you slut!”</i> Kiro pushes you off her lap and back onto the bench. Her poor dress is already starting to tent. <i>“So, uh... what did you think?”</i>");
	output("\n\nNow’s your chance to ask her a few questions, though she looks like she’s ready to dart off to the bar at any second. Better make it quick.");
	processTime(2);
	clearMenu();
	//[Boyfriend?] [She’s Hot] [Other Sisters?] [Nun’s Number] [Done]
	//Pick 2, then Kiro leaves
	postKallyMeetingTalksMenu();
}

//[Boyfriend]
//Become official BF/GF
public function kiroBFGFConvo():void
{
	clearOutput();
	showKiro();
	//Bimbo
	if(pc.isBimbo()) 
	{
		output("<i>“So like, I’m your [pc.boyGirl]friend, or something? We can still fuck other people, right?”</i> You ");
		if(pc.hasHair()) output("twirl your hair");
		else output("suck on a finger");
		output(", trying to mull over the social implications.");
	}
	//Bro
	else if(pc.isBro()) output("<i>“So, I’m your [pc.boyGirl]friend now, huh?”</i> you ask, looking Kiro dead in the eye.");
	//Nice/Misch
	else if(pc.isNice() || pc.isMischievous()) output("<i>“So, I guess I’m your [pc.boyGirl]friend now,”</i> you offer, smiling warmly at Kiro.");
	//Hard
	else output("<i>“I’m going to hold you to that whole [pc.boyGirl]friend thing,”</i> you offer confidently.");
	//High trust:
	if(kiroTrust() >= 90)
	{
		output("\n\nKiro spits out a mouthful of beer and rocks back in her chair. A long moment stretches into awkwardness before she answers, stroking her tail. <i>“I guess so.”</i> She chews a lip, then looks meaningfully at you. <i>“I don’t know if I’d consider it with anyone else, but you’re the real deal, [pc.name]. I’ve never met someone I can trust like you. You’re dependable. You’re good in bed, and you’ve saved my life to boot.”</i> Kiro sets down her drink, leaning forward, close enough to kiss. <i>“I don’t know about that ridiculous ‘L’ word, but I think you’re about the only [pc.boyGirl]friend I’d ever tolerate.”</i> Kiro puts a hand over yours. <i>“Besides, where else am I going to find someone cool enough to let me bang whoever I want?”</i>");
		output("\n\nYou dart forward, giving her a quick smooch before the lusty tanuki can react. <i>“I’m glad.”</i>");
		output("\n\nKiro draws back, smiling. She must be hiding a incandescent blush beneath her chocolaty fur. <i>“That’s enough, you flirt.");
		if(kallyKiroMeetingTalksOkay()) output(" Do you need something else, or can I go hang with my sis?");
		output("”</i>");
		flags["KIRO_GF"] = 1;
	}
	//Low trust
	else
	{
		output("\n\nKiro spits out a mouthful of beer and rocks back in her chair. <i>“After that bullshit with my sister? After I asked you to back me up and you tried to paint me as the lewdest, lustiest, most fuck-obsessed pirate this side of the milky way?”</i> Kiro shakes her head, chocolate locks bouncing. <i>“No. Look, [pc.name], I like you. I really do, but if anything is going to come out of this, I need to be able to trust that you’ll have my back. Whatever you were doing back there wasn’t watching my back, it was just you fucking around”</i> Kiro looks at you, deadpan. <i>“You wanna be my [pc.boyGirl]? Don’t treat me like a game.”</i>");
		if(kallyKiroMeetingTalksOkay()) output("\n\nShe drums her fingers on the table. <i>“Anything else before I go see my sis?”</i>");
	}
	flags["KIRO_BF_TALK"] = 1;
	processTime(5);
	postKallyMeetingTalksMenu(false);
}

public function kallyKiroMeetingTalksOkay():Boolean
{
	var talks:Number = 0;
	if(flags["KIRO_BF_TALK"] == 1) talks++;
	if(flags["KIRO_HOT_SIS"] == 1) talks++;
	if(flags["KIRO_OTHER_SIBLINGS"] == 1) talks++;
	if(flags["KIRO_NUN_NUMBER"] == 1) talks++;
	return (talks < 2);
}
public function postKallyMeetingTalksMenu(showText:Boolean = true):void
{
	if(kallyKiroMeetingTalksOkay())
	{
		if(showText) output("\n\nShe drums her fingers on the table. <i>“Anything else before I go see my sis?”</i>");
		clearMenu();
		if(flags["KIRO_BF_TALK"] == 1 || flags["KIRO_GF"] != undefined) 
		{
			if(pc.mf("m","f") == "m") addDisabledButton(0,"Boyfriend?","Boyfriend?","You already had this discussion.");
			else addDisabledButton(0,"Girlfriend?","Girlfriend?","You already had this discussion.");
		}
		else
		{
			if(pc.mf("m","f") == "m") addButton(0,"Boyfriend?",kiroBFGFConvo,undefined,"Boyfriend?","Press for a proper reaction on what Kally called you.");
			else addButton(0,"Girlfriend?",kiroBFGFConvo,undefined,"Girlfriend?","Press for a proper reaction on what Kally called you.")
		}
		if(flags["KIRO_HOT_SIS"] == 1) addDisabledButton(1,"She’s Hot","She’s Hot","You already talked about this.");
		else addButton(1,"She’s Hot",kallyIsHotKiroSays,undefined,"She’s Hot","Tell Kiro you think she has a hot sister.");
		if(flags["KIRO_OTHER_SIBLINGS"] == 1) addDisabledButton(2,"Siblings?","Siblings?","You already talked about this.");
		else addButton(2,"Siblings?",askAbootOtherKiroSisters,undefined,"Siblings?","Ask Kiro if she has other siblings.");
		if(flags["KIRO_NUN_NUMBER"] == 1) addDisabledButton(3,"Nun’s #?","Nun’s #?","You already talked about this.");
		else addButton(3,"Nun’s #?",getTheNunsNumberFromKiro,undefined,"Nun’s #?","Ask Kiro if she still has that nun pornstar’s contact information.");
		addButton(14,"Done",kiroWrapUpFunction);
	}
	else
	{
		clearMenu();
		addButton(0,"Next",kiroWrapUpFunction);
	}
}

//[She’s Hot]
public function kallyIsHotKiroSays():void
{
	clearOutput();
	showKiro();
	output("<i>“She’s hot,”</i> you observe");
	if(pc.isBimbo() || pc.isBro()) output(", trying to keep your fingers out of your crotch");
	else output(", smiling");
	output(". <i>“Like, really hot. You can’t tell me you weren’t thinking about getting her into the sack.”</i>");
	output("\n\nKiro’s gaze jumps up. <i>“What? Uh...”</i>");
	output("\n\nYou lean forward, gently pressing against her. <i>“Come ooon. You had to notice.”</i>");
	output("\n\nKiro’s face may as well be made of stone. <i>“I don’t know what you’re talking about.”</i>");
	flags["KIRO_HOT_SIS"] = 1;
	processTime(1);
	clearMenu();
	addButton(0,"Okay",okayKiroYourSisAintHot,undefined,"Okay","Don’t rock the boat.");
	addButton(1,"Push Her",pushKiroToWannaFuckHerSis,undefined,"Push Her","There’s no way Kiro doesn’t think her sis is a stone cold fox. Push her until she admits it.");
}

//[Ok]
public function okayKiroYourSisAintHot():void
{
	clearOutput();
	showKiro();
	output("<i>“Okay.”</i> You shrug, mulling over the other conversation topics.");
	postKallyMeetingTalksMenu();
}

// [Push Her]
public function pushKiroToWannaFuckHerSis():void
{
	clearOutput();
	showKiro();
	output("<i>“She has a dick swinging out to here,”</i> You extend your hand ");
	if(pc.hasKnees()) output("out to your [pc.knee]");
	else output("about halfway down your [pc.leg]");
	output(", <i>“and tits bigger than a galotian whore’s!”</i> You cup your hands around your ");
	if(pc.biggestTitSize() >= 7) output("own mammoth endowments. <i>“We both know you like ‘em chesty. Why else would I be here?”</i> You bounce your tits in your palms, almost as enthralled by your quivering breastflesh as the momentarily hypnotized tanuki.");
	else if(pc.biggestTitSize() >= 1) output("breasts which, though less visually bombastic make up for it in pert shapeliness. <i>“We both know you can’t keep your eyes off a nice pair of boobs. I’ve seen what happens to your dick when you look at mine.”</i>");
	else output("chest, pretending to wrap your palms around an enormous pair of knockers. <i>“We both know how much you like big-boobed sluts. How many times have I seen you chasing after one in the bar? How many times has that totem pole between your thighs gained a few levels from the mere sight of a three-breasted clubslut?”</i>");
	output("\n\nThe more you go on, the more Kiro’s composure fades. By the time you finish your little tirade, her eyes are shining brightly, and more importantly, a cylindrical distention has climbed up her dress to rest between her boobs. She starts to protest until you reach your [pc.foot] out beneath the table, gently rubbing a pair of balls that feel much bigger than they looked on the walk in.");
	output("\n\n<i>“Admit it, your sister grew up to be a hottie.”</i> ");
	if(pc.hasToes()) output("You curl your toes, rubbing in a small circle.");
	else output("You rub her balls in small circles, sometimes slipping up to tease the sheath hidden beneath her dress.");
	output(" <i>“Admit it or I won’t stop.”</i>");
	output("\n\n<i>“Gluh?”</i> Kiro groans, a little confused, too obsessed with the feelings radiating up her cock to pay attention.");
	output("\n\n");
	if(pc.isNice()) output("You feel a little bad pushing her like this, but it’ll be for the best.");
	else if(pc.isMischievous()) output("If she were only more honest with herself and her urges, she wouldn’t be in this situation!");
	else output("Could she be more dense?");
	output(" <i>“Admit your sister is a smoking hottie, or I’ll make you flood this whole place. ");
	if(pc.hasToes()) output("With my toes.");
	else output("With nothing more than a few under-the-table strokes.");
	output("”</i>");
	output("\n\nShuddering in pleasure and self-denial, Kiro whimpers, <i>“She’s hot.”</i> You slide up, watching the front of her dress dampen with pre. <i>“She’s so hot, but I shouldn’t... I shouldn’t want to fuck her. But I do!”</i> The last word comes out as a drawn-out whine, accompanied by her pumping her hips against you.");
	output("\n\nYou have to draw back to keep things from getting out of hand, leaving Kiro panting. <i>“I knew you had it in you.”</i>");
	output("\n\n<i>“You... you’re going to... have some Kiro in you the minute we go somewhere private,”</i> the lusty kui-tan growls. <i>“I’m going to fuck you till you’re walking bow-legged, you cheeky fucking cock-tease.”</i>");
	processTime(6);
	pc.changeLust(15);
	flags["KIRO_INCEST_TEASED"] = 1;
	clearMenu();
	addButton(0,"Let’s Go",letsGoButtfuckMeKiro,undefined,"Let’s Go","Let her get her revenge in right now.");
	addButton(1,"No",nobuttfuxForMeThanks,undefined,"No","Get out of a rough reaming. Kiro might not be happy about it.");
}

//[Let’s Go]
public function letsGoButtfuckMeKiro():void
{
	clearOutput();
	showKiro();
	output("<i>“I thought you’d never ask!”</i> you cheer, prancing toward the door and your parked ships beyond. <i>“" + (kiroIsCrew() ? "The":"Your") + " bedroom in five minutes?”</i>");
	output("\n\nKiro’s eyes fix on your wiggling ass, staring hard enough for you to feel her lusty gaze from across the room. <i>“Sooner than that.”</i> She slams down her drink and stands up, every step falling faster than the last until she’s chasing you through the station tunnels.");
	processTime(3);
	flags["BF_STORAGE"] = currentLocation;
	clearMenu();
	addButton(0, "Next", roughButtfuckFromKiroGo,true);
	//Pass 3 minutes, start hard buttfuck scene in Kiro’s ship.
}

//[No]
public function nobuttfuxForMeThanks():void
{
	clearOutput();
	showKiro();
	//Bimbo
	if(pc.isBimbo()) output("You giggle. <i>“Oh, I can’t wait, but didn’t you want to like, hang out with your sister? She might be sad if you disappear into the bathroom to spend the rest of the day reaming me like an eager fuck-puppet.”</i>");
	//else
	else output("<i>“I thought you wanted to get to know your sister’s bar, not waste half the day fucking in a bathroom?”</i>");
	output("\n\nKiro’s eyes narrow dangerously. <i>“Fine.”</i> She takes a swig of a drink. <i>“Whatever.”</i>");
	//-10 trust!
	kiroTrust(-10);
	processTime(1);
	postKallyMeetingTalksMenu();
}

//[Other Sisters?]
//Just get some info
public function askAbootOtherKiroSisters():void
{
	clearOutput();
	showKiro();
	output("<i>“");
	if(pc.isNice()) output("Have any other sisters?");
	else if(pc.isMischievous()) output("So is there a whole gaggle of hotties in your family, or just you and your sister?");
	else output("’Got any other siblings?");
	output("”</i>");
	output("\n\nKiro smirks knowingly. <i>“");
	if(kiroTrust() < 90) output("Wouldn’t you like to know? It sure would be a shame if I didn’t tell you ‘cause of that stunt you pulled earlier, wouldn’t it, huh?”</i> Kiro takes a slow sip of her drink, eyeballing you over the rim of her glass. <i>“You’ll just have to settle for knowing the two coolest kui-tan on this side of the core.”</i>");
	else
	{
		output("What’s the matter? Knowing the two coolest kui-tan on this side of the core not enough for you?”</i>");
		output("\n\n");
		if(pc.isBimbo()) output("She seems <i>super</i> insecure. Could she, like, be worried that you wouldn’t want to fuck her any more if she has hotter sisters? <i>“You’re not getting jealous and stuff, are you?”</i>");
		else if(pc.isNice()) output("You lean forward, resting your chin on your hands. <i>“Maybe I’m just so into this cute pirate chick that I wouldn’t mind meeting her family.”</i>");
		else if(pc.isMischievous()) output("<i>“Why Kiro, you sound worried.”</i> You lean back and stretch languidly. <i>“Thinking the big, bad Captain Steele might just steal a sister’s heart the way [pc.heShe] stole yours?”</i> You put your hands behind your head and sigh. <i>“Don’t worry. I’ll do my best to repress my raw, unfettered charisma.”</i>");
		else output("Her bluster is just a poor attempt to cover for her own insecurities. <i>“Kiro, I’m not going to try and fuck my way through your family.”</i> You pause, then add in the name of honesty, <i>“Unless they </i>really<i> want a piece.”</i>");
		output("\n\nKiro ");
		if(!pc.isBimbo() && pc.isNice()) output("awkwardly circles her fingers along the whorls of the table’s grain, babbling, <i>“That’s um... yeah. You’re too nice.”</i> She sucks in a breath of air, steadying herself. <i>“Too nice for a girl like me.”</i> The pirate shakes her head, dismissing whatever thoughts lurked beneath that admission.");
		else output("slaps a hand against the table, laughing. The effect is somewhat diminished by how the cushiony pads on her paw dampen the sound of the impact. Mock-wiping a tear from the corner of her eye, she answers, <i>“Not at all, but it is nice to have a " + (flags["KIRO_GF"] != undefined ? "[pc.boyGirl]friend" : "drinking buddy") + " just as full of shit as I am.”</i> She coughs to clear her throat.");
	}
	//Merge, no new PG
	output("\n\n<i>“Honestly though, it’s just me and my sister. Our line isn’t exactly known for being the most fertile, if you can believe it. Naturally horny, sure, but heat doesn’t really hit us as strongly as most kui-tan.”</i> She takes a swig from her glass and pats her balls. <i>“You can imagine why I saw the appeal in Throbb.”</i>");
	output("\n\nYou do your best to hide the stunned look on your face. Kiro and excessive virility are so perfectly intertwined in your mind that you have to consciously make an effort to retract your slackened jaw. Glancing over your shoulder at the chubby sister, you ask, <i>“Really?");
	if(pc.isBimbo()) output(" But you’re such a great cummer!");
	output("”</i>");
	output("\n\nScoffing, the pirate shakes her head. <i>“Nah, that’s just my mods. I had hoped my sister didn’t fall into the same trap, but she’s obviously had some work done. Kui-tan dicks don’t usually swing so low, or have a blunt tip.”</i> She chews her lip. <i>“Not entirely sure if we have similar tastes or if she really, really liked what she was seeing in those holos.”</i> She sucks down a long pull of her drink. <i>“That said, she seems to be more in control than I am. No troublesome boners, not even when she talks to that slutty-looking ‘taur. Sis has got it all figured out.”</i>");
	output("\n\nShe certainly seems put together.");
	flags["KIRO_OTHER_SIBLINGS"] = 1;
	if(kallyKiroMeetingTalksOkay()) output("\n\n<i>“Anything else?”</i>");
	processTime(7);
	postKallyMeetingTalksMenu(false);
}

//[Nun’s Number]
//Find out it’s Atha.
public function getTheNunsNumberFromKiro():void
{
	clearOutput();
	showKiro();
	output("<i>“So, any chance you’d share that nun’s number?");
	if(pc.isBimbo()) output(" I bet the three of us would be super good in bed together?");
	else if(pc.isBro()) output(" Bet she’s a good fuck.");
	else if(pc.isNice()) output(" Maybe we could run a train on her.");
	else if(pc.isMischievous()) output(" Maybe we could get an objective opinion on which one of us is better in bed. Winner gets to fuck the loser. The nun could watch.");
	else output(" Could be fun.");
	output("”</i>");
	output("\n\nKiro’s glossy, ink-toned lips curl mischievously at the suggestion, matched in their approval by the slowly growing length of her too-obvious dick. <i>“Libido suppressing drugs are no match for you, you know that, [pc.name]? I do everything possible to keep my dick down and under control, and two sentences out of your mouth have me popping out of my sheath faster than if you had aphrodisiac breath mints.”</i> She shakes her head sadly. <i>“I took that number in confidence, [pc.name]. Strange as it may sound, when you’re a freebooting pirate, trust that you’ll hold true to your word is one of the most valuable commodities. I made a promise, and even though she’s some kind of extranet porn sensation, I’m going to hold to it. No amount of jacking off strange penises on camera can change that.”</i> Her eyes flick down. <i>“And neither will handsome heir" + pc.mf("s","esses") + " with extraordinarily fuckable asses.”</i>");
	//Seen Atha
	if(flags["LATEST_LETS_FAP"] != undefined) output("\n\nIs she talking about Atha? It certainly sounds like Atha. She never mentioned being in a convent in her videos, but would she?");
	//Not seen Atha
	else output("\n\nWhat a shame.");
	flags["KIRO_NUN_NUMBER"] = 1;
	processTime(3);
	postKallyMeetingTalksMenu();
}

//Done
public function kiroWrapUpFunction():void
{
	clearOutput();
	showKiro();
	output("Draining the last dregs of her drink, Kiro lets out a chest-jiggling belch. <i>“Go figure Ice Queen Kally would stock the coldest, best beer.”</i> She slides out of the booth and up onto her heels in one fluid, graceful movement, her erection apparently withdrawn back into her sheath, out of the way. <i>“I’m gonna get another and make sure none of these creeps give her a hard time. Thanks");
	if(kiroTrust() < 100) output(", I guess");
	output(". I won’t forget ");
	if(kiroTrust() >= 90) output("this, hero.");
	else output("that you showed up, at least, [pc.name].");
	output("”</i>");
	output("\n\nYou’re left alone in the bar for the first time since your arrival. You could sit around and get drinks, or you could mingle with the locals, maybe even get to know Kally a little better. And Kiro’s still here too! Decisions, decisions...");
	flags["KIRO_MET_KALLY"] = 4;
	flags["MET_KALLY"] = 1;
	//TO MAIN MENU! EVENT CUMPLETE
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Rough Buttfuck
//Chains off of the threesome stuff in Kiro’s early talks. In Kiro’s ship. Supposed to leave the PC bow-legged.
public function roughButtfuckFromKiroGo(threesomeTalkIntro:Boolean = false):void
{
	clearOutput();
	showKiro(true);
	//flags["BF_STORAGE"] = currentLocation;
	if(threesomeTalkIntro)
	{
		if(!kiroIsCrew()) moveTo("KIROS SHIP QUARTERS");
		else moveTo("SHIP INTERIOR");
		if(flags["KIRO_MET_KALLY"] == 3) flags["KIRO_MET_KALLY"] = 4;
		if(flags["MET_KALLY"] == undefined) flags["MET_KALLY"] = 1;
	}
	//Lead off from talking. Didn't do the forcey version.
	if(!threesomeTalkIntro && kiroRoughButtfucks() == 0)
	{
		output("Kiro ");
		if(pc.tallness < kiro.tallness - 10) 
		{
			output("tosses you on the bed");
			if(!pc.isAssExposed() && !pc.isCrotchExposed()) output(" before you can wiggle the whole way out of your clothes.");
		}
		else 
		{
			output("pulls on your hand and spins you about");
			if(!pc.isAssExposed() && !pc.isCrotchExposed()) output(", interrupting your attempts to get out of your clothes,");
			output(" pushing you at the last second so that you land face-down in her bedding.");
		}
		output(" She piles on right after. Fur, boobs, balls, and lust smother you from all sides.");
		if(!pc.isAssExposed() && !pc.isCrotchExposed()) output(" The half-undone clothes come off with one rough pull.");
		output(" Her breath is hot in your ear as she wrestles you into place, pressing your nose into sheets that smell ");
		if(pc.isBimbo()) output("delightfully like cum. Mmm... you wish your sheets smelled half this wonderful.");
		else if(kiroRoughButtfucks() >= 2) output("vaguely of sweat and stale cum. Exactly like you expect to smell by the time she’s done with you.");
		else output("a little more like stale cum than you’d prefer, but you know from experience your opinion can change once Kiro starts to have her way with you.");
	}
	//Repeat Intro
	else if(kiroRoughButtfucks() > 0)
	{
		//Done this scene more than 4x
		if(kiroRoughButtfucks() >= 4)
		{
			output("Your cheeks blush with shame and lust. Why do you keep coming back for this? Just thinking about what she’ll do to you makes it hard to do anything but simper. Your voice barely comes out above a whisper. <i>“Kiro... could you fuck my ass again, please?”</i> You turn around, presenting it to her. <i>“And maybe spank me? I’ve been a bad [pc.boyGirl], I think.”</i>");
		}
		//Bimbo
		else if(pc.isBimbo()) output("<i>“Could you like, fuck my ass super dooper hard again? And do the spanking thing again. It was...”</i> you squirm in desire, <i>“...totally amazing.”</i>");
		//Bro
		else if(pc.isBro()) output("<i>“Fuck my ass,”</i> you demand, <i>“and do it hard.”</i> You look at her over your shoulder. <i>“If you don’t, I’m doing it to you.”</i>");
		//Nice
		else if(pc.isNice()) output("<i>“Could you... fuck me in the ass again?”</i> Your breath catches in your throat when you try to explain the full depth of your request, <i>“And don’t... don’t be gentle. Do me hard.”</i>");
		//Mischievous
		else if(pc.isMischievous()) output("<i>“So what would I have to do to get a repeat anal apocalypse?”</i> You cover your own uncertainties beneath your usual veneer of confidence and mischief. <i>“Would sending your sister a holo of us fucking be enough, or would I need to make you cum all over the table in a bar?”</i>");
		//Hard
		else output("<i>“Think you’ve got another good, hard butt-fuck left in you?”</i> you ask. <i>“If not, I’m sure I can find someone else...”</i>");
		//Merge
		output("\n\nThe chocolate-furred kui-tan’s ebony lips curl into a confident smile. Her palm snaps out, slapping into your ass hard enough to carry you over into her sheets. You tumble in, surprised.");
		if(kiroRoughButtfucks() >= 6) output(" No matter how many times you do this, the ease with which the confident pirate guides you into her bed never ceases to amaze you.");
		output(" The sheets still smell of cum, more strongly than the last time. You’re probably partly to blame for their sorry state. The omnipresent musk tickles into your nostrils as you lie there, promising that you’ll soon smell just as filthy and used as the rogue’s ill-treated bedding.");
		if(kiroRoughButtfucks() >= 6) output(" You’re such a naughty little cum-rag!");
	}
	//Lead off threesome setup:
	else if(threesomeTalkIntro)
	{
		output("Kiro crashes into you");
		if(!pc.isAssExposed() && !pc.isCrotchExposed()) output(" before you finish undressing");
		output(" and tackles you to the bed in a pile of fur, boobs, balls, and lust.");
		if(!pc.isAssExposed() && !pc.isCrotchExposed()) output(" She yanks the half-undone clothes off you with one rapid pull.");
		output(" Her breath is hot in your ear as she wrestles you into place, pressing your nose into sheets that smell ");
		if(pc.isBimbo()) output("delightfully like cum. Mmm... you wish your sheets smelled half this wonderful.");
		else if(kiroRoughButtfucks() >= 2) output("vaguely of sweat and stale cum. Exactly like you expect to smell by the time she’s done with you.");
		else output("a little more like stale cum than you’d prefer, but you know from experience your opinion can change once Kiro starts to have her way with you.");
	}
	//Merge Intros
	output("\n\n<i>“You think you’re so clever, don’t you slut?”</i> Kiro grabs you by the neck, tight enough for you to feel the points of her claws ");
	if(pc.hasScales()) output("clicking against your [pc.skinFurScales]");
	else output("pricking at your [pc.skin]");
	output(". ");

	//Post-sistershist-intro:
	if(threesomeTalkIntro) 
	{
		output("<i>“You think you can just rub ol’ Kiro’s dick, and get her to do whatever you want. Play her like a fiddle, tease her until she’s as depraved as you.”</i> She climbs off you and swats your ass hard enough to leave a bright red imprint of her alien palm");
		if(pc.hasFur() || pc.hasScales() || pc.hasChitin()) output(" beneath your [pc.skinFurScalesNoun]");
		output(". <i>“Well it’s time to pay the piper, bitch, and this piper is gonna lay some pipe.”</i>");
	}
	//Else
	else
	{
		output("<i>“You think you can come in here and get me to fuck you exactly how you want. Well, I have news for you...”</i> Kiro leans low enough for you to feel her teeth against your [pc.ear], <i>“you might be able to get me started, but there’s nothing you can do to stop me.”</i> She slaps your ass with her other hand, hard enough to leave a bright red imprint of her alien palm");
		if(pc.hasFur() || pc.hasScales() || pc.hasChitin()) output(" beneath your [pc.skinFurScalesNoun]");
		output(". <i>“From here on out, you’re going to be my toy. You’ll do what I say, take my cock when and where I want you to, and love every second of it.”</i>");
	}
	//Merge
	output("\n\nYou whine from the stinging impact, trying to ignore the way it makes your heart beat faster.");
	output("\n\n<i>“Ass up, slut!”</i> Kiro slaps you again, keeping your face pinned to the pillow with one hand while the other doles out punishment.");
	output("\n\nYou do your best to lift it up from your half-immobilized position, but it must not be fast enough. Kiro starts laying into your [pc.butt], paddling you while you struggle to get it the rest of the way into the air.");
	output("\n\n<i>“I don’t see that pucker yet, skank!”</i> She spanks you harder. The stinging impacts blend together into a red haze of heat, pain, and ");
	if(kiroRoughButtfucks() > 0) output("familiar");
	else output("bizarrely...");
	output(" arousal. You can’t avoid Kiro’s palm. You can barely hold your ass up, the way she’s keeping you pinned. Drool collects on the sheets when you forget to swallow, smearing the side of your face. You pant and quiver, aware only of the raining blows and your muscles’ straining attempts to raise your ");
	if(!pc.hasFur() && !pc.hasScales() && !pc.hasFeathers()) output("cherry red heiny");
	else output("raw, stinging donk");
	output(" so high that Kiro can’t help but stare directly into your ");
	if(pc.ass.looseness() >= 5) output("gaping, rhythmically clenching");
	else output("clenching");
	output(" asshole.");

	output("\n\nThe tears won’t stop streaming down your face, ");
	if(pc.isHerm()) 
	{
		output("yet your [pc.cocks] and [pc.vaginas] are aglow with need, slick from the molten arousal leaking from your feminine furnace");
		if(pc.totalVaginas() > 1) output("s");
		output(".");
	}
	else if(pc.hasCock())
	{
		output("yet your [pc.cocks] ");
		if(pc.totalCocks() == 1) output("is");
		else output("are");
		output(" harder than ");
		if(pc.cockTotal() == 1) output("an iron bar");
		else output("iron bars");
		output(".");
	}
	else if(pc.hasVagina())
	{
		output("yet your [pc.vaginas] ");
		if(pc.totalVaginas() == 1) output("is");
		else output("are");
		output(" sopping wet");
		if(pc.wettestVaginalWetness() >= 4) output(", dripping so freely that Kiro surely smells how badly you need her.");
		else 
		{
			output(", so glossed in your own liquid need that Kiro can’t help but see the curves of your tempting bean");
			if(pc.totalClits() > 1) output("s");
			output(".");
		}
	}
	else output("yet the spasmodic tremors running through your ring won’t stop. Every whipcrack of fingers on butt only serves to remind you of how thoroughly you’re about to be reamed.");
	output(" Then, as suddenly as they began, Kiro’s blows cease, replaced by the tender touch of her fingers upon your ripened bottom.");

	//Anal luby
	if(pc.ass.wetness() >= 1)
	{
		output("\n\n<i>“Wow,”</i> the lusty pirate coos as she massages the tenderized flesh. <i>“");
		output("I don’t even have to use lube, huh?”</i> She dips a finger inside to gather the lubricant from your walls, then holds it up to the light, staring at her own glossy digit. <i>“You really are a slut. You know that, right?”</i> She wipes the dirtied digit off ");
		if(pc.hasCock()) output("on [pc.oneCock], making you jerk your hips.");
		else output("on your [pc.hips], giggling when you give an overeager jerk.");
		output(" <i>“");
		if(kiroRoughButtfucks() > 0)
		{
			output("You must really like it when I plow you back here, huh?");
			if(pc.hasVagina()) output(" A silly little thing like you doesn’t even need a vagina. A slippery, filthy hole is good is the best a skank like you deserves.");
			else output(" Did you ever consider getting a vagina? ...Oh, what am I saying? Why would a filthy skank like you get a vagina when you have a far filthier hole modded into a perfect little cock-holster?");
		}
		else output("You must let all those rush the monsters fuck you back here! Let’s see how they stack up next to a real woman...");
		output("”</i>");
	}
	//Else, gaping ass, no new PG.
	else if(pc.ass.looseness() >= 4)
	{
		output("\n\nYou really are quite the anal slut, aren’t you?”</i> She runs a finger teasingly along your widespread rim, marvelling at the size of it. <i>“");
		if(kiroRoughButtfucks() >= 4) output("I guess our little bedroom romps are having an effect, though maybe you’re using some toys too. Or giving some undiscovered monsters a go, letting your butthole do the discovering for you.");
		else output("I bet you let all the rush monsters take you. Maybe some toys, too.");
		output(" Gape like this takes effort.”</i> She hooks a finger into each side and pulls you wide. <i>“You have to be dedicated to taking monster dicks in your backdoor if you want an ass that looks like this.”</i> Grinning mischievously, Kiro spits inside, sending a shock of slippery pleasure straight up your spine. <i>“");
		if(kiroRoughButtfucks() == 0) output("You ever wanna give that up and replace my milker, just let me know...");
		else output("Or you could just come back every night and be my little cocksleeve...");
		output("”</i>");
	}
	//Else cock
	else if(pc.hasCock())
	{
		output("\n\n<i>“You really want this, don’t you?”</i> She flicks [pc.oneCock], making it twitch and ooze. <i>“Does getting your prostate milked by a ");
		if(pc.hasCock() && 21 > pc.longestCockLength()) output("bigger, better dick");
		else output("perfect penis");
		output(" feel that good for you, that ");
		if(kiroRoughButtfucks() > 1) output("you keep asking me to");
		else output("you’ll willingly let me");
		output(" stretch you out back there?”</i> She grabs your rump again and kneads it like dough, marveling at the ");
		if(pc.tone < 40) output("excessive softness");
		else if(pc.tone < 60) output("supple softness");
		else if(pc.tone < 80) output("toned padding");
		else output("sculpted musculature");
		output(". <i>“");
		if(kiroRoughButtfucks() > 0) output("Your poor prostate must be halfway to being flat by now.");
		else output("I’m going to flatten your prostate, you know");
		output(". You must have been so careful, keeping your ass out of the hands of those fearsome rush monsters, only ");
		if(!silly) output("so that you could give it to me instead.");
		else output("to fall into the lap of the Dread Pirate Kiro...");
		output("”</i>");
	}
	//Else
	else
	{
		output("\n\nYou really want this, don’t you?”</i> She continues to rub and squeeze on your [pc.butt], simultaneously building the tension and giving you a chance to recover from the savage spanking. <i>“");
		if(kiroRoughButtfucks() > 0) output("I’m going to keep breaking this in again and again. However long it takes.");
		else output("I’m going to break this in, hard.");
		output(" You’re going to simper and moan while I absolutely ruin your asshole. The moment I pull out, it’s going to hang wide open, begging for my cock, with nothing but my warm spunk to fill it to the brim.");
		if(kiroRoughButtfucks() > 0) output(" This time it might even stay that way.");
		output("”</i> She teasingly runs a claw-tip around your ring. <i>“But I suppose that’s what you want...”</i>");
	}
	//merge
	output("\n\nPulling herself up behind you, Kiro finally allows her heavy prick to swing down onto your [pc.butt]. It hits with a wet slap. Pre-cum spurts from the blunted tip on contact, leaking up the small of your back while she drags her equine member back into position. The veins are big enough to make it dance across your [pc.asshole] as it goes. You’ve never felt quite so anxious... or empty. Then, Kiro’s flattened crown slips into position, ");
	if(pc.ass.looseness() >= 4) output("resting on the edge of your anal precipice.");
	else output("resting on the edge of a hole that suddenly feels entirely too small for such a tree trunk.");
	//Lubed!
	if(pc.ass.wetness() >= 1) 
	{
		output("\n\nBetween your asshole’s innate slickness and the lake of pre Kiro is discharging over it, she’s able to slip right on in. One second, you’re biting your [pc.lipChaste] and whimpering with need. The next, you’re moaning from the sudden shock of sensation, feeling her fat tip push past your straining sphincter. Your own internal squeezing actually pulls her deeper, dragging what feels like several feet of dick up into your intestines, but when you look back, you realize it must only be a few inches.");
		//Buttchange
		pc.buttChange(kiro.cockVolume(0));
		output("\n\nKiro grins savagely, meeting your widened eyes. <i>“Just try and relax.”</i> And then she’s thrusting in, battering open any resistance in her path. Her cock plows right through your poor, self-lubricated anus, abusing the natural slickness to rearrange your bowels with ease.");
		if(pc.hasCock()) output(" It’s almost enough to make your cock squirt on the spot, the way her girthy dick rubs against your prostate, dragging its impressive veins against the tiny pleasure-organ.");
		output(" She’s so forceful, plunging in without a care for your comfort. Her virile totem ");
		if(!pc.isPregnant())
		{
			output("brazenly distends your belly");
			if(pc.tone < 50 && pc.thickness > 75) output(" in spite of your squishy body’s attempts to conceal it");
			output(".");
		}
		else output("actually shifts your " + (pc.hasVagina() ? "womb" : "anally-pregnant mass") + " forward, making your belly bulge that much more obscenely.");
		output("\n\nWith a wet clap, her swelling balls smack into your lube-and-pre smeared asscheeks.");
	}
	//Gaped
	else if(pc.ass.looseness() >= 4)
	{
		output("\n\nShe doesn’t wait for you to get ready. She doesn’t even wait for enough pre to accumulate to prepare the way. She merely thrusts inside, trusting your body’s meager moisture and your well-stretched asshole to let her in. Oh stars, does she ever thrust inside! Inch after inch of meaty kui-tan phallus slips inside, just fat enough to truly open up your backdoor. It feels so nice being filled again that the only sound you make is a long, slow, contented sigh.");
		output("\n\n");
		if(!pc.isPregnant()) output("When your belly bulges with the shape of it");
		else
		{
			output("When your ass gets so full that your");
			if(pc.totalVaginas() > 1) output(" wombs are");
			else if(pc.hasVagina()) output(" womb is");
			else output(" anally-pregnant mass is");
			output(" shifted forward, bulging your belly further");
		}
		output(", your sigh deepens. Kiro fills you up so perfectly, so completely, that even when her balls clap against your sore cheeks, you wish she could go further, if only to extend your own ecstasy. Her animalistic sheath bunches up against your ruined derriere as she pushes harder, flattening your [pc.butt] if only to squeeze an extra inch worth of pleasure from her gaped cocksleeve.");
		pc.buttChange(kiro.cockVolume(0));
		output("\n\nWith a liquid gurgle, you can actually hear her balls filling, hanging lower with each passing second. She must really like the subtle pressure of your capacious walls!");
	}
	//Else - got the capacity
	else if(pc.analCapacity() >= kiro.cockVolume(0))
	{
		output("\n\nThe tanuki-girl puts the whole of her weight into the opening stroke, but to her shock, your [pc.asshole] opens right up for her. What once seemed a tighter asshole reveals its true nature - a well trained, capacious tunnel that may well very well be designed to delight in enormous insertions. Kiro’s cock slides into your butt like an oiled-up dick into a dripping-wet pussy, no extra lubricants needed.");
		output("\n\nYour internal folds massage the equine phallus’s every feature, cradling the pulsing veins, gleefully hugging the distention of its medial ring. You moan and clench with your ");
		if(pc.hasPlumpAsshole()) output("puffy ");
		output("donut, wrapping your ");
		if(pc.hasPlumpAsshole()) output("pillowy ");
		output("butthole tighter around the intruder, if only to spike Kiro’s pleasure higher. She fills you like nothing else, a rod of singular girth culminating in a puffy, expansive crown, wide enough to massage your walls with every movement. Its violent lurches may as well be the motions of a high-powered vibrator for how wondrous they feel.");
		output("\n\nFuzzy nuts clap against your [pc.butt]. You’ve taken Kiro to the hilt, her sheath scrunched up against taut pucker, and balls feel like they’re <i>boiling</i> with unspent spunk.");
		pc.buttChange(kiro.cockVolume(0));
	}
	//Else - TOIGHT LIKE A TOIGA
	else
	{
		output("\n\nFuck, that smarts! She puts the whole weight of her hips into her penetrating stroke, instantly buckling your [pc.asshole], forcing it to stretch so wide around her enormous horse-cock that you worry she’s going to tear something. The thick veins encircling it are actually large enough to catch at times, briefly slowing her progress, but with a quick hitch of her hips, she plows on in");
		if(pc.hasCock()) output(", nearly making your [pc.cocks] squirt from the pulsing ribs sliding across your tightly-squeezed prostate");
		output(". Kiro’s medial ring definitely stops her progress, an act of defiance she answers with a growl.");
		output("\n\n<i>“It’s going in.”</i> The kui-tan’s clawed fingers grab your [pc.hips] hard enough to hurt. <i>“Whether you relax or not.”</i>");
		output("\n\nYou whimper and do your best to relax. At the same time, Kiro pulls back, dragging an inch or two of length free. You feel like every fold of skin, perhaps every single nook and cranny of her cock, is tantalizing your oversensitive anal nerves. Your muscles clench hard from a spasm of pain mixed with a hint of pleasure, battling your attempt to relax. After a moment spent trying to secure their compliance, you give up, knowing full well that Kiro is going to stretch you open anyway.");
		output("\n\nThat moment, your ass finally relaxes, and Kiro feels it too. She thrusts in, popping the ring through before you know what’s going on. Your body clamps down in shock, but it’s too late. Kiro’s past the halfway point. Her cock is burrowing deep into your body. There’s nothing to stop it now, nothing to stop it from rearranging your intestines or bulging your belly. Nothing to stop her from turning you into a panting, crying cock-sleeve. She slaps your ass for good measure just before she bottoms out, reveling in the absurd tightness of an ass too small to ever accommodate her girth.");
		//Buttchange
		pc.buttChange(kiro.cockVolume(0));
		output("\n\nWith a wet clap, her swelling balls smack into your tender asscheeks, audibly churning as they brew what promises to be a massive load of ‘nuki cum.");
	}
	//Merge
	output("\n\n<i>“Ahhh, good slut,”</i> Kiro groans, shifting her hips in small, slow circles as she adjusts to the warmth of your backdoor. <i>“You know,”</i> she begins to pump in and out, <i>“");
	if(kiroRoughButtfucks() > 0) 
	{
		output("I never expected you to come back for more of this");
		if(kiroRoughButtfucks() > 4) output(", let alone this many times");
		output(", but you really seem to like it!");
	}
	else output("I wouldn’t have thought an ass could feel as good as my milker, but yours is fucking divine!");
	output("”</i> The kui-tan pumps her hips harder, sawing six inches of her dick and out of you. After a score or so of strokes, she adds an extra inch, then another, tugging her distending dickhead through nearly two feet of your intestines in no time at all.");
	output("\n\nSometimes she slaps your ass.");
	if(pc.hasHair()) output(" Other times she grabs your [pc.hair].");
	else output(" Other times she pauses, grabbing your cheeks and pulling them wide so that she can see your [pc.asshole] buckling from her girth.");
	output(" Positioned as you are, you can’t see what’s coming. You don’t get to see Kiro gather her strength for an especially hard push or raise her arm for a careless slap upon your battered butt. Your choices fall away under the sensory barrage until the only one remaining is base, automatic reactions.");
	output("\n\nYou cry out.");
	output("\n\nSometimes you moan, trailing off into simpering whimpers.");
	output("\n\nThrough it all, Kiro fucks your ass. She fucks your ass like it’s her property, and the most ");
	if(kiroRoughButtfucks() == 0) output("disgusting");
	else if(!pc.isBimbo() && kiroRoughButtfucks() < 5) output("disturbingly erotic");
	else output("amazing");
	output(" part of it is just how hot it makes you. On some level, you know it probably shouldn’t");
	if(pc.isBimbo()) output(", but you’re like, way too hot not to fuck in every possible hole, multiple times a day if necessary");
	else output(", but there’s no match for the way this makes you feel");
	output(". Kiro fucks you hard enough to smack your forehead into the headboard. She doesn’t give an apology, and you don’t ask for one; you’re too busy being dazed and aroused, helplessly teetering on the edge of a climax.");
	output("\n\nHer sheets are just so slippery! Your cheek won’t stop sliding on them. They’re too slick from the spit-reconstituted cum, and you keep drooling more. Kiro must approve of the sight, because you feel her cock tremble inside you. It’s a change that brings you some small measure of satisfaction. She’s getting off on fucking you silly! You coo with desire but are immediately interrupted by Kiro doubling her pace, hilting herself into you with such force that it hurts the tenderized cheeks to either side of Kiro’s new favorite fucktunnel.");
	processTime(30);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",roughButtfuckFromKiroPart2);
}

public function roughButtfuckFromKiroPart2():void
{
	clearOutput();
	showKiro(true);
	output("Panting, Kiro pulls out. Her flare surges, already expanding, but she doesn’t dare touch the hair-trigger bomb. Instead, she grabs you two-handed, and rolls you over onto your back");
	if(pc.legCount == 2) output(", catching a [pc.leg] in each hand");
	output(".");
	if(pc.hasCock())
	{
		output(" Wow, your [pc.cocks] ");
		if(pc.cockTotal() == 1) output("is");
		else output("are");
		output(" leaking like crazy! Your prostate is getting a hell of a milking!");
	}
	else if(pc.hasVagina()) 
	{
		output(" Wow, your [pc.vaginas] ");
		if(pc.totalVaginas() == 1) output("is");
		else output("are");
		output(" fucking drenched. Your crotch is more drenched than a swimming pool in a monsoon.");
	}
	output("\n\n<i>“I wanna watch your belly swell up");
	if(pc.bellyRating() >= 30) output(" even more");
	output(",”</i> Kiro admits, ");
	if(pc.legCount > 1) output("shifting one of your [pc.legs] up onto her shoulder and ");
	output("guiding herself back into place. Her flare catches for a second, treating you to the sight of the raccoon-herm’s eyes crossing in pleasure. She forces it in without further issue, owing to your ");
	if(pc.ass.looseness() >= 4) output("gaping, slicked");
	else if(pc.buttRating() >= 10) output("enormous");
	else output("recently gaped");
	output(" backdoor.");

	output("\n\nJust because the flare slips in without much complaint doesn’t mean you don’t feel it. Far from it. You can’t help but shudder at every inch of progress it makes through your pre-slicked channel, awash in the sensation of it massaging across every nerve ending on the way.");
	if(pc.hasCock()) output(" It squishes your prostate hard enough to make your squirt a long, thick rope across your belly, even without cumming.");
	else if(pc.hasVagina()) output(" It presses firmly enough that you can feel it all the way in your [pc.vaginas], rubbing the walls of your juicing, achingly empty dick-holsters against one another. If only Kiro’s sister were here; she could fuck your pussy!");
	output("\n\nKiro grabs hold of your neck and pins you in place once more, moaning as she makes several powerful, hitching thrusts inside you. What they lack in coordination, they make up for in passion... and cum. You can feel it boiling up out of her, distending her urethra, adding a new dimension of dick to rub against your intestines. Blooms of liquid heat expand deep within you, one pulse after another. They ramp up the tightness within your guts, but also your pleasure.");
	output("\n\nYou whine along with Kiro’s moans, realizing too late that you’re actually starting to cum. You’re cumming almost entirely from having your bowels bathed in ‘nuki-spunk. Spooge floods into you");
	if(pc.hasCock()) output(" and out of you, splattering over your [pc.face] and [pc.chest]");
	output(".");
	if(pc.hasVagina()) output(" [pc.GirlCum] squirts over Kiro’s belly, and the lust-lost kui-tan barely musters the effort to drop a paw onto your mound, casually pressing on your most sensitive places.");
	output(" Both of you watch your [pc.belly] getting bigger. There’s no other way to describe it. You’re swelling up like a balloon, and with each fresh pulse of growth, Kiro’s smile seems happier (and her cock thicker). She cums in you until you lose count of the number of sperm-spraying ejaculations. When the pressure becomes so great that it sprays out of your ass in [pc.cumVisc] rivers, Kiro climaxes all the harder, reveling in having her spunk-suffused balls bathed in their own orgasmic effluvia.");
	output("\n\nThe salty stuff drenches her bed, your [pc.thighs], your [pc.butt]... and continues to soak through her sheets and mattress. It rises all the way up to your neck");
	if(pc.hasHair()) output(" and [pc.hair]");
	output(". Blissed out, you just try to enjoy it. Never mind that more and more of Kiro is hidden by the curve of your ");
	if(pc.bellyRating() >= 30) output("increasingly ");
	output("pregnant-looking belly.");
	if(pc.isPregnant()) output(" Weren’t you already pregnant? With an insipid giggle, you decide that you’re at least double-pregnant now.");
	output(" Your whole middle wobbles and sloshes with Kiro’s motions. You’ve never felt fuller.");
	output("\n\nEven when Kiro pulls out, that sense of complete fullness remains, dulling into a sort of sexual and nutritious satiation. If you burped, it’d probably taste like her cum.");
	if(pc.isBimbo()) output(" Mmm, cum burps! You giggle and gather some of the white goop, slowly sucking it from your fingertips to savor the taste.");

	output("\n\nKiro stretches, her cock slowly retracting into her sheath. She’s breathing hard but relaxed, like every ounce of tension has been massaged out of her body. <i>“I’m gonna go get a shower. You can come join me when you get tired of lying in puddled jizz like a ");
	if(flags["LANDED_ON_TEXAS"] != undefined) output("New Texan ");
	output("whore.”</i>");
	output("\n\nDo you join her?");
	processTime(10);
	pc.orgasm();
	pc.loadInAss(kiro);
	pc.loadInAss(kiro);
	pc.applyCumSoaked();
	clearMenu();
	addButton(0,"Yes",yesKiroLetsShower);
	addButton(1,"No",noKiroLetsNotShower);
}

//[Yes]
public function yesKiroLetsShower():void
{
	moveTo(shipLocation);
	clearOutput();
	showKiro(true);
	output("You both do your best to clean up. Kiro seems particularly affectionate after all that, letting you know ");
	if(kiroRoughButtfucks() == 0) output("that you don’t have to let her abuse you like that if you don’t want to");
	else output("that you’re an incredible submissive when you want to be");
	output(". But do you really?");
	output("\n\n" + (kiroIsCrew() ? "You return":"You return to the bar") + " smelling fresh and clean, even if the inside of your [pc.belly] knows the true, sordid tale.");
	processTime(14);
	IncrementFlag("KIRO_ROUGH_BUTTFUCK");
	if(!kiroIsCrew())
	{
		currentLocation = flags["BF_STORAGE"];
		flags["BF_STORAGE"] = undefined;
	}
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[No]
public function noKiroLetsNotShower():void
{
	moveTo(shipLocation);
	clearOutput();
	showKiro(true);
	output("You slink out of the " + (kiroIsCrew() ? "shower":"ship and back to your own") + ", trailing Kiro’s cum behind you as you go.");
	if(!kiroIsCrew())
	{
		output(" Everyone you pass can see and smell what she did to you. The ");
		if(rooms[currentLocation].planet.indexOf("PLANET: ") != -1) output("planet");
		else output("station");
		output(" is sure to be abuzz with tales of just how cum-drenched you were - and who did it to you.");
		if(pc.exhibitionism() >= 33) output(" Why does that make your stomach all fluttery?");
	}
	IncrementFlag("KIRO_ROUGH_BUTTFUCK");
	if(!kiroIsCrew()) 
	{
		currentLocation = "SHIP INTERIOR";
		flags["BF_STORAGE"] = undefined;
	}
	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function kiroRoughButtfucks():Number
{
	if(flags["KIRO_ROUGH_BUTTFUCK"] == undefined) return 0;
	else return flags["KIRO_ROUGH_BUTTFUCK"];
}

//Kally Needs Tapped Scene
public function kallyNeedsTappedByBimbos():void
{
	clearOutput();
	showKally();
	output("Kally’s horny. Never mind her lifting skirt, you can <i>smell</i> it on her. The scents of the dozens of other bar patrons are so easy to filter out, nothing at all like the kui-tan’s pheromonal bouquet. Her balls smell like a warm hearth and earthy peat tinged, mingled with a hint of her exotic, alien sweat, brewed up after a long day of work behind the bar, but they’re nothing next to the cloud of olfactory invitation rolling off her cock. You could smell a hint of it from the other side of the room. Here? There’s no doubt that the only thing keeping Kally from jacking herself off is an impressive amount of mental control mixed with supreme professionalism.");
	output("\n\nIn short, just sniffing her cock is " + (pc.hasVagina() ? "getting you <i>wet</i>" : "making you tingle with arousal") + ".");
	if(pc.wettestVaginalWetness() >= 4)
	{
		output(" Your over-enthusiastic puss");
		if(pc.totalVaginas() > 1) output("ies are");
		else output("y is");
		output(" creating rivers of fuckability down your [pc.legOrLegs]");
		if(pc.legCount > 1) output(", urging you to spread them as wide as possible and show off the glossy sheen");
		output(".");
	}
	output(" That dick is like candy for your nose, an impressive appetizer that has your mouth watering and tongue moistening your [pc.lips]. Letting her go on working like that wouldn’t just be a shame - it’d be one of the worst disasters in the whole galaxy.");
	output("\n\nYou lean closer, putting on your smokiest expression");
	if(pc.biggestTitSize() >= 1) output(", showing off your [pc.chest] to best effect");
	output(". <i>“Heyyyy, Kally.”</i> You ");
	if(pc.hasHair() && pc.hairLength > 2) output("twirl your hair and chew on your lip");
	else output("slide a finger down your jawline and toward your chest");
	output(". A dreamy sigh escapes your lips, making room for another heavy inhalation of kui-tan dick-musk. <i>“You need any help, behind the bar?”</i> Your eyes flick down just in time to catch the sight of her skirt bouncing higher.");

	//First Time
	if(flags["KALLY_BIMBO_TAPPED"] == undefined)
	{
		output("\n\nKally stares at your mouth, which you’re all too happy to shape into a perfect ‘o’ and slowly lick your way around. <i>“Uhh...”</i> Her knees knock together, but even they can’t suppress the tide rising under her skirt. <i>“No. No, I’m good.”</i> She steps forward to hide it under the bar, bumping a few glasses in the process. Smacking cups around with her dick is about as unsubtle as it gets.");
		output("\n\n<i>“Come on, Kally,”</i> you coo. <i>“Have a little fun.”</i> You draw little figure eights on the fur on the back of her hand with your finger. <i>“I can hide under the bar.”</i> You bat your eyelashes. <i>“And I’ll be super quiet.”</i>");
		output("\n\nYou know you’ve won the moment you hear her dick slap into the underside of the bar’s polished hardwood. The impact sounds <i>juicy</i>.");
		output("\n\n<i>“Uhhnghhhh... okay-okay. Quick, under here.”</i>");
		output("\n\nThe buzz of a magnetic seal releasing sounds, and Kally lifts a previously seamless segment of the bar into the air. Her dick hangs heavily in the empty space, high enough that the only thing her skirt can hide is her useless (but mouth-watering) sheath.");
	}
	//Repeat
	else
	{
		output("\n\nKally actually <i>whimpers</i> at that. It’s all she can do to keep her cock from jumping out from under the counter and slapping messily on top of it. Instead, her dick smacks heavily into the underside. The impact sounds wet enough to fill a shot glass, a thought that has your mouth already watering.");
		output("\n\n<i>“Ug-ummm... okay.”</i> Kally clicks a button, disengaging a mag-seal that lifts a portion of the bar into the air.");
		output("\n\nHer cock is right there. It bows upward far enough that skirt is near useless, just as bunched up around the base as her succulent sheath.");
	}
	//Merge
	output("\n\nIt bobs the moment your eyes meet it. The veins, glistening and black, throb enticingly, begging you lavish them with your tongue until you can feel her heart beat against your tongue.");
	output("\n\nYour hand thrusts out on its own to grab hold, seemingly of its own volition. That’s the great thing about your current state: you don’t have to think about how to be good at sex. It just happens. Your middle finger rubs just below the fattened prickhead, and the index strokes the veiny underside. Kally is butter in your hands. She stumbles back when you push your way behind the bar. Slapping the ‘close’ button an afterthought. Once the pneumatic hiss fades and the snap of the maglocks re-engaging reaches your ears, a cheshire grin envelops your features. Kally’s not getting away until those balls have been properly drained.");
	output("\n\nYou kiss her full on the lips, all while effortlessly continuing to stroke her down below. <i>“I’m going to slip somewhere a little more comfortable,”</i> you whisper, breaking away, <i>“Just make sure you remember where your cock is buried when the time comes.”</i> You suck her tongue into your mouth, give it a lick, then slowly let it slide out as you pull away, cheeks hollowed.");
	output("\n\nYou’re pleased to note that the bartender is breathing heavily on your way down. Her pudgy tummy is breathing in and out so rapidly that the shadows from her breasts appear in continual motion, fluttering back and forth you nearly as fast as your hand across her turgid member. You tug her forward as your own body slides back. The space you just entered through provides ");
	if(pc.isNaga() || pc.isDrider() || pc.isTaur() || pc.isGoo()) output("barely enough room for your unusual body to squeeze into");
	else output("more than enough room for you to squeeze into");
	output(" now that it’s closed. The only thing you’d change to make it a better blowjob nook would be floor padding.");
	output("\n\nNow, to get to work.");
	processTime(6);
	pc.changeLust(33);
	clearMenu();
	addButton(0,"Next",tapKallysKegAsBimboII);
}
public function tapKallysKegAsBimboII():void
{
	clearOutput();
	showKally();
	IncrementFlag("KALLY_BIMBO_TAPPED");
	pc.createStatusEffect("Tapped Kally",0,0,0,0,true,"Icon_Wine","",false,1000);
	output("It’s a good thing you enjoy your work.");
	if(pc.felineScore() >= 3) output(" You audibly purr in excitement.");
	else if(pc.canineScore() >= 3) output(" A low growl of desire wells up out of the back of your throat before you remember to muffle it.");
	else output(" A quiet hum of contentment wells up out of the back of your throat before you remember to muffle it.");
	output(" Before you start sucking, it’s important to breathe properly. That or it’s important to remind yourself just how goddamn good this dick smells. One of the two. Now that you’re in a confined space, you’re practically hotboxing yourself with its needy aroma. Every breath is tinged with the flavor of dick and every exhalation a reminder that you haven’t swallowed the real thing yet.");
	output("\n\nKally steps a little closer. Between her thick dick and thicker thighs, the light is almost completely blocked. What little you can see here in the shadows is a faint reflection off the top of the kui-tan’s cock, revealing the smallest amounts of dribbling pre. You close your eyes and zero in on the smell of it. It’s no surprise when your [pc.lipsChaste] meet cock, nor is it when they slowly open, dragging their pillowy softness over the entirety of Kally’s crown. That little bit of pre, when mixed with your spit, allows them to glide with the same ease as the slickest cunt");
	if(pc.wettestVaginalWetness() >= 4) output(", though you doubt anything could match your lubricious nethers");
	output(".");
	output("\n\nYou don’t make the mistake of opening too wide. You don’t remember why; you just do it. Your lips stay nice and tight around the cock, your mouth dilated just enough to keep your teeth from grazing the tender skin. Then you slide forward, accepting her inside. She is <i>thick</i>. Thick enough that it feels like she’s too wide for your meager tongue. Thick enough that her fat dick must have your [pc.lips] shaped into an absolutely obscene shape. Your average terran would never be able to accomplish such a feat, and for that matter, most kui-tan couldn’t either.");
	//Random
	//Kiro kiss +1 (one time threesome point)
	if(flags["KIRO_MET_KALLY"] != undefined && rand(3) == 0)
	{
		output("\n\n<i>“You alright, Kally?”</i> a familiar voice asks from up above.");
		output("\n\nYou dutifully continue to work her shaft");
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(", uncoiling your tongue to slither out and lick around the inner edges of her sheath");
		output(".");
		output("\n\nKally groans and leans over the countertop, throwing you further into shade. <i>“Y-yeah. Just a little frazzled.”</i>");
		output("\n\nGrabbing her balls in both hands, you gently squeeze them.");
		output("\n\n<i>“Ung!”</i> Kally grunts, one hand clawing at the hardwood just inches above your head.");
		output("\n\nThe other voice laughs. This time, when it talks, it’s almost too quiet for you to hear. <i>“[pc.name] is blowing you ");
		if(flags["KIRO_INTERRUPT_KALLYBEEJ"] == undefined) output("right now");
		else output("again");
		output(", isn’t [pc.heShe]?”</i>");
		output("\n\nThat sounds like Kiro! A gush of fresh saliva releases itself into your mouth at the thought of her and her dick. You gently massage Kally’s balls, partially wanting to tell her that it’s okay to tell Kiro and partly just wanting her to start oozing into your maw.");
		output("\n\n<i>“Uhh... uhh... yeah.”</i> Kally sighs heavily, though whether from resignation or arousal, you cannot tell.");
		output("\n\nYou take her deep, intent on finding out.");
		output("\n\nThis time she moans, low and lewd. She’s definitely enjoying herself.");
		output("\n\nKiro leans on the bar next to her sister. You can tell from how it creaks the moment it starts supporting the weight of her and her impressive bust-line. <i>“");
		if(flags["KIRO_INTERRUPT_KALLYBEEJ"] == undefined) output("I wondered why [pc.heShe] wasn’t sucking me off yet. Must have wanted to try and melt the Ice Queen.”</i> You can <i>hear</i> Kiro’s smirk. <i>“[pc.HeShe] always was a sucker for a challenge. Did [pc.heShe] succeed?");
		else output("Figures that it’d take [pc.name] to make the Ice Queen melt. Did you even make [pc.himHer] work for it?”</i> You can <i>hear</i> Kiro’s smirk. <i>“If I know [pc.himHer], [pc.heShe]’s got you by the dick. It doesn’t matter if you’re horny or not, that hot piece of Steele ass shows up, licking [pc.hisHer] lips, and all the blood in your body just pours right into your dick. Am I right?");
		output("”</i>");
		output("\n\n<i>“Yesss,”</i> Kally hisses, barely managing not to moan.");
		output("\n\nYou bob faster and keep squeezing on Kally’s balls. Even if you hadn’t heard that kui-tan liked that, you’d be able to tell by the way her cock jerks and pulses in your mouth whenever you give her nuts firm squeezes. Pre is pouring out now. You delight in milking it out of her.");
		output("\n\n<i>“Do you think,”</i> Kiro pauses, leaning further forward, <i>“that if I nibbled on your ear right now, you’d pump every drop of cum in your body into [pc.himHer]? Like some kind of bimbofied, two-" + (isAprilFools() ? "dogecoin" : "credit") + " slut?”</i>");
		if(flags["KIRO_INTERRUPT_KALLYBEEJ"] != undefined) output(" A silent second passes. <i>“That trademark scowl doesn’t work when your eyes keep threatening to roll back. You know what’s going to happen, and you aren’t going to do anything about it. You’re just gonna sit there and cum, like a slut.”</i>");
		output("\n\nKally’s balls are getting bigger in your hands. With each depraved suggestion, they’re swelling. The longer you knead them, the more they fill your hands, the more pre-cum she oozes on the tongue. You gulp down a load and suck her into your throat, rippling muscles around her dick without an ounce of conscious control. They just start squeezing, your throat transforming from useful orifice into cum-squeezing dick-holster.");
		output("\n\nHere it comes. Her dick swells slightly. Where once it was hard, it’s now rock hard. Your nose flares, drinking in the scent of her overwhelming passion. Then you hear it. You hear Kally moan. It’s quiet, maybe a little muted, but it is undoubtedly the moan of a girl falling into ecstasy over getting her ear nipped by her sister");
		if(flags["KIRO_GF"] == undefined) output(" while a slutty acquaintance");
		else output(" while her sister’s [pc.boyGirl]friend");
		output(" goes to town on her below the bar. Her sack gets so tight that it lifts her weighty balls, now the size of grapefruits, up higher.");

		output("\n\nThen they shrink, one rhythmic pulse at a time.");
		output("\n\nThose same pulses arrive in the ‘nuki’s dick a split-second later, prying your [pc.lips] still wider. Her cum barrels through her urethra and into your throat. There, it’s free to squirt out like water from a firehose, splashing down into your belly with aplomb. You can faintly hear your stomach gurgling, just like you can faintly smell her nutty jism in the back of your nose, but most importantly, you can feel just how good of a job you’ve done.");
		output("\n\nEvery single jet of kui-tan cream is an affirmation of your status as a premiere cock-sucker and blast of bubbly bimbo bliss in your brain. To a [pc.boyGirl] like you, cum is part declaration of a job well done and part hard-wired signal that you should be cumming right alongside your partner. Sparks of jizzy ecstasy travel down your spine to your groin, bubbling through your [pc.groin]. At first, it’s simple, lusty pleasure. But as you devour the last dregs of Kally’s seed, it gets harder and harder to control yourself.");
		output("\n\nYour [pc.hips] jerk madly.");
		if(pc.hasVagina()) 
		{
			output(" Your [pc.vaginas] flutter");
			if(pc.totalVaginas() == 1) output("s");
			output(".");
		}
		if(pc.hasCock()) 
		{
			output(" Your [pc.cocks] spasm");
			if(pc.cockTotal() == 1) output("s");
			output(" sympathetically, drooling [pc.cum] that’s so thick it may as well be maple syrup.");
		}
		if(!pc.hasGenitals()) 
		{
			output(" Your [pc.asshole] spasms.");
		}
		output(" Your throat seizes in one last effort to drain Kally, milking out one big, last squirt, and then you’re cumming too. You’re a good, cummy little cock-sucker, creaming yourself to the feeling of having your belly full of warm, alien seed.");
		//Threesomed
		if(kiroKallyThreesomes() > 0)
		{
			output("\n\nThe sounds of wet, passionate kissing fade into exhausted panting. Did Kiro just make out with her sister? You slowly slide off the cock, lapping the spunky residue from your lips and floating on a little post blowjob euphoria.");
			output("\n\n<i>“Did you give [pc.himHer] a good snack?”</i> Kiro asks from so far away she might as well be in the clouds.");
			output("\n\nKally sighs, reaching down to ");
			if(pc.hasHair()) output("ruffle your hair");
			else output("pet your head");
			output(". <i>“Yeah, I gave her a nice little snack.”</i>");
			output("\n\nThe pirate seems pleased by that. <i>“Good girl. I wonder which one of you is the better cock-sucker, though?”</i> Her feet pad away, and Kally doesn’t bother trying to answer. While she recovers, you have plenty of time to clean her cock.");
		}
		//Not Threesomed
		else
		{
			output("\n\nThe sound of raucous laughter echoes from above. <i>“");
			if(flags["KIRO_INTERRUPT_KALLYBEEJ"] == undefined) output("You’re such a quick shot! That’s what all those years of repression’ll get you, Sis - a cock that goes off before the fun even starts. What’s more - you just blew your load while thinking about me.”</i> Kiro chortles again. <i>“That’s almost incest, Sis. Maybe you are the pervier one.");
			else output("You did it again! Do you just sit there squirming in [pc.name]’s mouth until I show up, waiting to blow your load until you can score a look at your sexy sister?”</i> Kiro chortles. <i>“Maybe I should stop calling you Ice Queen and start calling you Incest Queen... and see just how many holos of my adventures you have saved.");
			output("”</i>");
			output("\n\nKally’s retort is so quiet you almost miss it. <i>“I-I’m not into incest!");
			if(flags["KIRO_INTERRUPT_KALLYBEEJ"] != undefined) output(" You just want me to be, you... you slattern!");
			output(" Besides! We're not <b>really</b> related, <b>step</b>-sis!");
			output("”</i>");
			output("\n\nYou slowly slide off the cock, lapping the spunky residue from your lips and floating on a little post-blowjob euphoria.");
			output("\n\n<i>“From over here, it looked like you were pretty into the idea. Either way, no skin off my back. Just make sure [pc.name] can walk when you’re done. I want a shot at [pc.hisHer] ass later.”</i> Kiro pads away, leaving you all alone with Kally... and her slick dick.");
			output("\n\nA few long strokes of your tongue clean every drop of residue from its surface.");
		}
		IncrementFlag("KIRO_INTERRUPT_KALLYBEEJ");
		processTime(25);
		pc.loadInMouth(kally);
		addLoveyDoveWithAlcohol();
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",kallyBimboBeejedGenericEpilogue);
	}
	//shots - balls enormous and massive cumshot
	else if(rand(2) == 0)
	{
		output("\n\n<i>“");
		if(flags["KALLY_BIMBO_CUMCASCADE"] == undefined) output("Normally I could never drink one of these on a shift, but if you’re going to be down there...");
		else output("Ooh, is this your way of telling me you want me to give you another cum-cascade?");
		output("”</i> Kally grabs a shot glass and pours something thick and white inside. <i>“Bottoms up!”</i> She knocks it back, then giggles. <i>“");
		if(flags["KALLY_BIMBO_CUMCASCADE"] == undefined) output("I guess you still have to wait for your drink. Don’t worry, it’s coming.");
		else output("This feels so good... I wish I could get away with doing it more often.");
		output("”</i> She refills her shot and knocks it back. This time she burps afterward. <i>“Fuck yes. I have the best mods.”</i> Her hand reaches down and grabs hold of your arm, lifting it up until your palm rests against the downy-soft fur on her nutsack. <i>“");
		if(flags["KALLY_BIMBO_CUMCASCADE"] == undefined) output("That’s going to get very, very full soon. It’ll be your job to empty it. Got it?");
		else output("Can you feel it, [pc.name]? I’m filling up, brewing up gallons of my own private reserve, all for you. Think you can handle it?");
		output("”</i>");
		output("\n\nYou nod as much as the dick in your mouth will allow.");
		output("\n\n<i>“Good.”</i> Kally grabs a second shot glass and fills both. She inhales them before you can do anything to question or protest. <i>“");
		if(flags["KALLY_BIMBO_CUMCASCADE"] == undefined) output("See, in addition to having tasty cum packed with an alcohol analogue... I’m a kui-tan.");
		else output("See, it’s starting.");
		output("”</i> She pats her belly. <i>“");
		if(flags["KALLY_BIMBO_CUMCASCADE"] == undefined) output("When I drink spunk - just about any spunk - my body goes into-oh! Oh! ...Overdrive.");
		else output("That sordid warmth, dripping down inside me, drooling into my balls. Oh! I can feel my sack stretching!");
		output("”</i> Her balls already feel heavier in your hands. <i>“I’ll make so much cum!”</i> She giggles, then pours herself two more shots. <i>“Two more for the road!”</i> Her balls are already as big as softballs, and the hint of pre you’ve been tasting becomes a nutty-tinged dribble, like she’s making cum too fast for her balls to contain.");
		output("\n\nThe want you smelled before? It transforms into pure, pheromonal need. You slide your lips down her cock... and back up, then down again. Already, her balls are as big as grapefruits. Big enough that it’s easier to let their own weight press them against your fingers than try to heft them upward yourself. Ballflesh burbles and grows, sloshing and just starting to wobble with newfound, liquid weight. You play with it, letting it wobble in your palms, squeezing and swallowing when she squirts pre into your throat.");
		output("\n\n<i>“Aww, yeah,”</i> Kally purrs. <i>“I’m glad the bar’s slow. I can enjoy this.”</i> A hand gently ");
		if(pc.hasHair()) output("drags its fingers through your [pc.hair].");
		else output("slides over your head.");
		output(" <i>“You’re so goddamned sweet, [pc.name].”</i> She hiccups, making her expanding balls wobble in your grip. <i>“So sweet. You just come in here to spread pleasure, don’t you?”</i> Her other hand joins the first, affectionately stroking you. <i>“And all you want... all you want is cum.”</i> She giggles, obviously feeling a little tipsy. <i>“I’ll give you lots of cum. Seed. Uh... what’s that other word? Oh yeah. Jizz.”</i> Kally’s dick spurts pre-cum deep into your throat. <i>“You’ll be full of jizz. Like a keg, but for jizz.”</i>");
		output("\n\nYou flick your tongue out along the bottom of her dick. Kally’s balls plump and wobble like somebody poured a gallon of fluid into them, all at once. They’re easily as big as watermelons now - big enough that they’re almost resting in your lap - big enough that your hands seem small by comparison. You explore the fuzzy cum-tanks, rubbing and stroking, sometimes squeezing hard enough for your fingers to vanish into the plush fur.");
		output("\n\n<i>“Ohhh, I love that.”</i> The kui-tan momentarily tightens her grip, then relaxes, digits fluttering with uncoordinated pleasure. <i>“You’re so good at this! You’re awesome, and I’m sorry this is gonna get you so cum-drunk, but it’ll be so much fun.”</i> Her balls are getting bigger with every word. It’s easier to press into them from the front than try to reach down to the bottom. <i>“You can... oooh, wiggle your tongue some more!”</i>");
		output("\n\nYou do.");
		output("\n\n<i>“You can sleep it off in my room.”</i> Kally whimpers in ecstasy. The pre-cum is pouring out of her like a faucet. You swallow her dick into your throat just so that you don’t have to gulp it down anymore, letting your new, bimbofied instincts cut in, transforming your throat into a tunnel of pleasure. It ripples around Kally’s quivering member just before her balls touch the floor. <i>“We can snuggle in my fucking bed and whisper things in each other’s ears.”</i> Her hips pump weakly once, then falter as her balls lift her feet into the air.");
		output("\n\n<i>“H-how is your mouth so good?”</i> Kally whimpers, digging her heels into the sides of her balls. <i>“How do you suck better than the greediest glory hole slut?”</i> Her dick quivers, and you feel the texture of the fluids gushing into your middle change slightly, thickening. <i>“Ohh, you are so good. So good.”</i> Her hands stroke you passionately, lovingly, and she orgasms. Kally’s climax is almost calm. Yes, her dick is pumping - stars is it ever. Cum is splashing into your stomach so fast that you wonder if you stand a chance of taking it all. Your [pc.belly] is already ");
		if(pc.bellyRating() >= 40) output("bulging more than normal.");
		else output("starting to bulge.");
		output("\n\nMore than the taste of it, more than the scent of Kally’s nutty cum in the back of your nostrils, you get off on knowing you’re bringing her off. Every squirt of jism into your throat seems to transform into a bubble, float up into your head, and pop ecstatically. Fizzy pink ecstasy swells right alongside your bulging middle.");
		output("\n\nMeanwhile, Kally’s balls deflate. <i>“Ohhh, you are so good. So fucking good. I love this.”</i> Her urethra bulges obscenely, carrying a huge spurt. <i>“I love your throat.”</i> Her fingers clench ");
		if(pc.hasHair()) output("in your [pc.hair]");
		else output("against your [pc.skinFurScales]");
		output(". <i>“I love you.”</i> She whimpers at the declaration, her balls sloshing. That big cumshot? It never seems to stop. <i>“I fucking love you, and I love what you’re doing to me.”</i>");
		output("\n\nThere’s so much inside you by this point that you look fat with cum. You may as well be pregnant with it, for how your middle is bulging. It’s tight, and hard, and hot, and you can’t stop yourself from loving it. You can’t stop yourself from joining in and orgasming. It’s as inevitable of the bubbly shocks of bliss bursting in your brain. The pleasure mounts alongside the expanding curve of your middle, higher and fatter and electrifying and so fucking tight! Your eyes roll back at the same time that Kally’s cum backs up in up your throat and starts pouring out of your nose.");
		output("\n\nSo much sensation! Everything is overloading - spunk and nerves both. It’s so hot that you");
		if(pc.hasVagina())
		{
			output(" start squirting all over the floor");
			if(!pc.isSquirter()) output(", even though you’re far from a squirter yourself");
		}
		else if(pc.hasCock()) output(" yourself, start cummming all over the floor");
		else output("r [pc.asshole] is forced to cum along with her");
		output(". Your body is little more than Kally’s used condom, and it loves it so much that you black out.");
		processTime(20);
		pc.orgasm();
		for(var y:int = 0; y < 10; y++)
		{
			pc.loadInMouth(kally);
			addLoveyDoveWithAlcohol();
		}
		clearMenu();
		addButton(0,"Next",kallyCumCascade4BimbosCompletion);
	}
	//Mix drinks and fail
	else
	{
		output("\n\n<i>“Two Kui Creamers, please,”</i> a voice with a sharp, clipped accent orders.");
		output("\n\nIf there wasn’t a cock in your mouth, you’d be smiling. The only thing better than one fuckable spunk raccoon in your mouth would be two. You salivate so hard that spit foams around your lips.");
		output("\n\n<i>“Uh...”</i> Kally’s voice is syrupy thick with pleasure. <i>“Sure thing. I’d love to.”</i> The sentence is clipped short, like she wanted to add ‘sexy’ to the end. She pivots at the waist, inadvertently thrusting herself forward, forcing you to take a few inches ahead of schedule.");
		output("\n\nStars, you love getting face-fucked.");
		output("\n\nYou grab hold of her cushy, squeezable ass and throw yourself as far forward as you can. Your throat dilates perfectly, taking dick like it was meant for it. Then the muscles start squeeze and ripple, acting on impulses you can’t even consciously control. When there’s a cock in your throat, your body milks it. It’s as much a fact of life as the color of space or the air-fuel ratio for primitive thrusters. You yank your head back after a second, then slam back home, kissing her sheath and exploring the musky dick-pocket with your tongue. Kally is barraged by two separate, yet equally intense sensations, alternating every time she has the chance to get used to one.");
		output("\n\nGlasses clink up above as Kally struggles to complete her work. <i>“Enjoying yourself?”</i>");
		output("\n\n<i>“You know it!”</i> the other voice replies. <i>“Vesperians know how to live!”</i>");
		output("\n\nYou hear a drink spill, then snort when a waterfall of creamy booze soaks Kally’s exposed sheath and splashes against your nose. It makes the base of her dick taste <i>delicious</i>.");
		output("\n\n<i>“Are you okay?”</i> Concern is evident from the tone of the visitor’s voice.");
		output("\n\nKally’s dick throbs in your mouth, and ribbons of pre-cum slide down the central channel of your cock-curved tongue into your throat. Yum.");
		output("\n\n<i>“Wha-? Oh yeah. I’m fiiine.”</i> The bartender bucks her hips against you again, briefly choking you on dick.");
		output("\n\n<i>“You sure?”</i> The voice sounds unconvinced. <i>“You seem like you’re having a hard time.”</i>");
		output("\n\nKally shakes her head so vigorously that the motion ripples all the way down her pudgy from. A few splashes later, the drinks are obviously done. <i>“You’re super sweet for worrying. Here, enjoy the cream. It’s on the house.”</i>");
		output("\n\nYou fondle Kally’s balls aggressively, just as anxious to get at her cream as her customer.");
		output("\n\n<i>“Uh!”</i> She lurches and thickens in your mouth. Her balls swell slightly, but she doesn’t cum. Not quite yet. <i>“Fuck, you’re sexy.”</i>");
		output("\n\n<i>“Huh?”</i> the strange voice says from a little farther away.");
		output("\n\nNow Kally stiffens everywhere else. <i>“Uh... um... aw fuck it.”</i> She leans over the counter, pumping her hips backward, then slowly forward, driving into your mouth. Pre-cum dribbles over your chin in the brief moment it escapes your maw. <i>“You’re a hottie. I just wanted you to know.”</i>");
		output("\n\nFootsteps approach the bar once more. <i>“And you’re adorable.”</i> She giggles. <i>“Here’s my contact. We could hang out when you’re off work, knock back a couple of these Creamers.”</i>");
		output("\n\nYou swear the intensity Kally’s dickscent doubles by the end of that sentence. Her cock is putting off pheromones like smoke from a metal foundry. It takes every bit of willpower you have not to abandon her balls and");
		if(pc.hasVagina()) output(" stuff both hands into your sodden twat");
		else if(pc.hasCock())output(" rub one off yourself");
		else output(" stuff both hands into your needy ass");
		output(". You settle for burying your nose in her sheath and taking a big ol’ sniff. Lust lends your fingers the frenetic energy to knead her swelling balls faster than before, and her sack tightens. She’s on the edge!");
		output("\n\n<i>“Yes!”</i> Kally enthuses. <i>“Fuck yes!”</i> Somehow, her dick doesn’t erupt just yet.");
		output("\n\nHer compatriot giggles at that. <i>“I’ll look forward to it. See you later, cuteness.”</i> Those same steps fade away, and with it Kally’s restraint.");
		output("\n\nThe climax-crazed bartender reaches under the bar to grab hold of your ");
		if(pc.earType == GLOBAL.TYPE_VULPINE || pc.earType == GLOBAL.TYPE_CANINE || pc.earType == GLOBAL.TYPE_FELINE || pc.earType == GLOBAL.TYPE_LAPINE) output("ears");
		else if(pc.hasHair()) output("[pc.hair]");
		else output("head");
		output(". Any trace of gentleness left with her customer. She yanks you down, burying your nose so deep in her sheath that you can’t even breathe. Then she finally, blessedly cums. Her spunk pumps directly into your belly, squirting out in enormous gushes that make your stomach audibly burble. You don’t care that you can taste it. With every bulge of her urethra against your tongue, you feel a sympathetic rush of bimbofied pleasure. Your body, so primed to be used, heats up with every spurt and every squirt. Struggling to breathe, you douse your sinuses in kui-tan cock aroma, and the pleasure peaks.");
		output("\n\n");
		if(pc.hasVagina()) output("[pc.GirlCum] splatters the floor below.");
		if(pc.hasCock())
		{
			if(pc.hasVagina()) output(" [pc.Cum] joins it not longer after.");
			else output("Your [pc.cum] splatters the floor below.");
		}
		if(pc.hasGenitals()) output(" You’re making almost as much of a mess of the floor as Kally is making of your throat. ");
		output("Spunk coats every inch of your esophagus, and the only feeling it gives you is pleasure. Your eyes roll back while your mouth is used as cheap fucktoy, and just like a cheap fuck-toy, your muscles continue to stimulate the kui-tan the whole way through her orgasm. Even when she runs dry, you milk her for more, wringing out the last few drops of nutty delight.");
		output("\n\nYou slump backward the second the horny kui-tan lets you go, breathing heavily. Her cock is slick with your spit and her residual cum. Yummy, yummy cum. You find time between gasping for breath to lap up the creamy residue, polishing Kally until she’s completely spit-shined. Only then are you truly satisfied.");
		output("\n\nNeither of you moves for a minute or two. It would seem you’ve both been drained, both literally and figuratively by the ordeal. At least everything tastes like cum and smells like cock.");
		processTime(20);
		pc.loadInMouth(kally);
		addLoveyDoveWithAlcohol();
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",kallyBimboBeejedGenericEpilogue);
	}
}

public function kallyCumCascade4BimbosCompletion():void
{
	moveTo("CANADA9");
	
	clearOutput();
	showKally();
	output("You wake up in a strange bed with a strange, but very pleasant fullness in your belly. Kally’s there too, though she’s midway through slipping back into her waitress outfit.");
	output("\n\n<i>“Oh, you’re awake!”</i> The kui-tan smiles warmly at you. <i>“I was a little worried after you blacked out in the bar, but my stars, you look so beautiful with your belly like that. How do you feel?”</i>");
	output("\n\nThat’s like, a really good question. How <i>do</i> you feel? You look down at your belly, discovering the ultra-pregnant bulge before you. It’s surprisingly sexy... and Kally gave it to you. You stagger up on your [pc.feet] and stumble toward her, losing your balance halfway. She catches you, of course. She’s so wonderful.");
	output("\n\n<i>“I feel great!”</i> You hiccup, then giggle madly. <i>“You can cum so much! It’sh awesome!”</i> The room wobbles, but Kally’s got you. You hug her back. <i>“I love you.”</i> It’s true. You love her so much. But how can you show her? <i>“Should shuck your cock again?”</i>");
	output("\n\nKally smiles warmly - so warmly. <i>“I think you’ve had enough. You’re drunk, dear. On my cum. It’s sort of alcoholic. Well, not really alcohol. It’s like alcohol, only it makes you a little more... lovey dovey than normal.”</i> She pets you, walking you back to bed. <i>“You lie down in bed and rest up until you feel good to enough to move around on your own. It’s the least I can do to pay you back. I </i>never<i> get to cut loose like that.”</i>");
	output("\n\nSlumping into the warm covers, you giggle and reach out, batting at her dick. It trembles and drips. Silly cock.");
	processTime(55);
	clearMenu();
	addButton(0,"Next",kallyCumCascade4BimboEpilogue);
}

public function kallyCumCascade4BimboEpilogue():void
{
	clearOutput();
	showName("MORNING\nAFTER");
	showBust("");
	output("When you next stir, you’re still drunk, but at least you can stand without falling over. What a ride!");
	IncrementFlag("KALLY_BIMBO_CUMCASCADE");
	processTime(135);
	sleepHeal();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Next]
public function kallyBimboBeejedGenericEpilogue():void
{
	clearOutput();
	showKally();
	output("Kally has you wait until nobody is looking, then sends you out to stand on the other side of the bar. She looks so relieved, but the cloud of fuck-pheromones around her doesn’t diminish in the slightest. That or you’re just more receptive to her. Your [pc.skin] feels a little more flush than mere post-coital bliss would explain.");
	if(flags["KALLYS_SECRET_INGREDIENT"] == undefined) output(" Is her cum alcoholic?");
	else output(" Right, her cum is alcoholic.");
	output(" You stifle a burp and giggle, waving at Kally.");
	output("\n\nHer tail wiggles back and forth, and she gifts you a wink. What a woman!");
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Pussy Snack (Bro Scene)
public function kallyGetsEatenOutByBroz():void
{
	clearOutput();
	showKally();
	output("Pshh. Kui-tan. The whole lot of them prance around with their dicks and balls hanging out, even the women. They’re too damned dick obsessed to remember why they have a vagina, and Kally’s no different. The silly herm has hers hanging low, swinging below the hem of her skirt like anyone would prefer her silly sausage over the glimmering treasure behind. She doesn’t realize how much pleasure that silken pocket could give, both to her and every member-toting male on this station.");
	output("\n\nYou wrinkle your nose, and breathe deep. Half hidden beneath the pheromonal storm of horny, vesperian mares, drunken leithans, and every other sapient of breeding age is the spicy, unmistakably feminine scent of Kally’s vagina. It’s difficult to separate from her other, more masculine pheromones - the ones that make it seem like a good idea to have an arm-wrestling competition for every girl in the room, but then she bends over. The moment her balls cease to block the way, your nostrils flood with the potent scent of concentrated pussy - wet, long-denied pussy that has been so long ignored it’s practically virginal.");
	output("\n\nBlood surges");
	if(!pc.isCrotchExposed()) output(" into your [pc.lowerGarment]");
	else output(" into your crotch");
	output(". The air is suddenly too warm and your skin too tight. You roll your shoulders, feeling the capable muscles flexing below your skin, ready to leap into action and take that which could be yours.");
	output("\n\n<i>“You doing okay there, big [pc.guyGirl]?”</i> Kally leans over, concerned and simultaneously unconcerned what her magnificent cleavage is doing to your [pc.cocks].");
	output("\n\nYou grunt noncommittally and reach down to adjust yourself, not even trying to hide the motion. You’re pleased to note that Kally’s eyes follow right along. Satisfied with the position of your burgeoning boner");
	if(pc.cockTotal() > 1) output("s");
	output(", you wave that same hand in front of her face. <i>“My eyes are up here.”</i>");
	output("\n\nKally’s sniffs the air once, then twice. The second time, her eyelids flutter, and she mouths, <i>“Oh wow...”</i>");
	output("\n\nRight, the pheromones: easy to forget until you’ve got a girl going gaga over how good your dick smells.");
	output("\n\nPropping herself up on the bar, unconcerned with her tits threatening to spill out into your lap, Kally sighs dreamily. <i>“Sorry about that, " + pc.mf("big fella","sugar") + ". Guess I’m just easily distracted today.”</i>");
	output("\n\nYou wave your hand dismissively in front of her. <i>“Don’t sweat it.”</i> Never mind that your fingers shine with residual crotch-sweat.");
	output("\n\n<i>“Mmmm.”</i> Kally’s nose twitches, trying to take as many samples of your masculine bouquet as possible. <i>“You sure I can’t look?”</i> she purrs sweetly, rubbing up against you (but still angling her nose at your cock-scented fingertips).");
	output("\n\n<i>“Not unless I can get under that skirt,”</i> you grunt. After a moment, you think to add, <i>“And I don’t mean that dick you got dangling. I want to see what it is that skirt is hiding.”</i>");
	output("\n\nKally’s brow wrinkles. <i>“...but the bar.”</i>");
	output("\n\nYou shrug and adjust yourself once more, sure to slide your entire palm against [pc.oneCock]. Kally is all eyes when your hand re-emerges, nicely greased with dicksweat. You wiggle it in front of her. She grabs it with both hands and presses her nose into your palm, sniffing heavily. <i>“The bar will be fine for a few minutes.”</i>");
	output("\n\nHer tongue shoots out, licking your hand. You let her lap up cockmusk and grin when she starts tonguing your fingers. She hasn’t even seen your dick yet, and she’s already got it on her breath. Kally doesn’t care. She sucks hard. One finger at a time, she cleans your entire hand until not a square inch remains unvarnished by the kui-tan’s saliva. Then she sucks some more. You have to pull your arm away to get her to stop, extricating your middle finger with a lewd ‘pop.’");
	output("\n\n<i>“Kally.”</i> You point down. A very ");
	if(!pc.isCrotchExposed()) output("powerful-looking bulge is making itself known.");
	else output("powerful-looking erection is presenting itself.");
	output(" <i>“Break time.”</i> Fuck, you are <i>sick</i> of talking.");
	output("\n\nKally shudders. <i>“Okay.”</i> She bites her lower lip and pulls out a small ‘Break Time’ sign. She hops up onto the bar, rolling herself into your arms. <i>“Give me a break.”</i>");
	output("\n\nYou growl powerfully. She coos, nuzzling into you, sniffing. You could probably break her in half over your dick right now. She’s basically a big, fuzzy pillow.");
	if(flags["KALLY_BROED"] == undefined)
	{
		output("\n\nLooking around, you realize you have no idea where to take her.");
		output("\n\n<i>“That way. Take me that way and give me that goddamn dick.”</i>");
	}
	else
	{
		output("\n\nLooking around, you swiftly remember where to take her.");
		output("\n\n<i>“You’re bad.”</i> Kally giggles. <i>“So bad.”</i>");
	}
	output(" She wiggles so that her head is drooping toward your crotch. Eager hands delve below the belt and grab hold, feeling you up the same way a blind woman might explore your face with her fingertips. Meanwhile, her dick juts into the air like a totem pole, flipping her skirt up so that the entire bar can see. She doesn’t appear to mind.");
	processTime(6);
	pc.changeLust(20);
	clearMenu();
	addButton(0,"Next",kallyBroCunnilingus2);
}
public function kallyBroCunnilingus2():void
{
	clearOutput();
	showKally();
	moveTo("CANADA8");
	output("The cock-thirsty kui-tan somehow manages to unlock her room for you. Then she realizes how rich her own hands have grown with dickmusk and sniffs them, lavishing them with licks when she needs to reluctantly exhale. She’s a ragdoll in your arms, which is all girls need to be, really. They can’t be expected to maintain things like muscle control when a big ol’ dick is splitting them out, driving every thought out of their silly little brains.");
	output("\n\nYou flip her around so that her legs are up in the air, spread wide by gravity as much as their own libidinous desires. Her dick ");
	if(pc.biggestTitSize() >= 2) output("threads its way through your cleavage");
	else output("presses against your chest");
	output(", her balls rolling over your collarbone. Just above and behind is the treasure you’ve been seeking: Kally’s pussy.");
	output("\n\nIt’s drenched. You’d expect nothing less. The lips are dark chocolate-colored and nestled amidst an incredibly puffy mound, all smoother than silk and gleaming with needful moisture. To your eyes, it’s like an ambrosial fountain. Your heartbeat is suddenly thudding in your head. Your cock is so hard that it feels painfully tight, about to burst. One thought thunders to the forefront: <i>EAT PUSSY</i>.");
	output("\n\nYou do. Wrapping an arm around her waist, you clap your free hand to her ass and push the oozing cunny closer. Your tongue ");
	if(!pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("thrusts out to sample");
	else output("snakes out and wiggles across her expansive mons");
	output(". She tastes like sex. Not like human sex, not like food, just like the act of sex condensed into a flavor. It’s hot, maybe a tiny bit spicy, you suppose, but it is also deeply intriguing, demanding you roll your muscular appendage across the sodden slit to glean a deeper appreciation for it.");
	output("\n\nYou do so.");
	output("\n\nMuscles below your belt clench. The veins in your arms stand out from the effort of holding up the chubby bartender and from your own excitement. You lavish her pussy in pleasure, working up and down every inch of the outer gates before even considering the plunge inside. She’s juicy enough that by the time you swallow one mouthful, a fresh dribble of fluid is leaking out. That’s fine, you figure. Sex is better messy.");
	//Pants
	if(!pc.isCrotchExposed()) 
	{
		output("\n\nMeanwhile, Kally stops huffing your dick-scent off her fingers long enough to free your [pc.cocks] from ");
		if(pc.cockTotal() > 1) output("their");
		else output("its");
		output(" irksome confinement. Your [pc.lowerGarments] fall away, fully exposing your proud endowment");
		if(pc.cockTotal() > 1) output("s");
		output(". The kui-tan gasps, then whimpers with excitement. More trickles of cunt-juice escape her drenched snatch, begging you to plug her with your tongue.");
	}
	//No pants
	else
	{
		output("\n\nMeanwhile, Kally stops huffing your dick-scent off her fingers long enough to realize that your [pc.cocks] ");
		if(pc.cockTotal() > 1) output("are");
		else output("is");
		output(" right there in front of her. She doesn’t need it secondhand. She can get the real thing. The kui-tan whimpers with excitement. More trickles of cunt-juice escape her drenched snatch, begging you to plug her with your tongue.");
	}
	output("\n\nA shudder of pleasure rolls through your hips when Kally starts nuzzling your [pc.cock], but you’re as stable as a rock from the waist up. You close your eyes and dive back in, luxuriating in her rich taste, slowly spreading the folds with you’re tongue. They’re so fattened with lust that it actually takes a fair amount of effort to spread them open. They squish between your organ and her thighs like lewd cushions, drawing a gasp of pleasure from the silly dick-girl.");
	output("\n\nNo wonder you didn’t see her clit. You have to really go digging to find it, relying on touch more than sight. It’s buried deep in her slit, a chubby little bundle of nerves too short and too recessed to be found by a less skillful lover. The whimpers your dick-dazzled lover makes when you touch it are music to your ears. The fluids she squirts are a reward finer than any wine. You flick her clitty with the tip of your [pc.tongue] rapaciously, stopping to circle it from time to time.");
	output("\n\nYou know that your skillful lovemaking is forcing her to experience stupifying levels of pleasure. If it wasn’t, she’d be sucking your dick, not rubbing her face against it and moaning, creaming both of them in a facial of her own making. To you, it’s just extra lube. If you rock your hips just right, you can catch a sensitive spot against her tongue. She’ll get a real facial in a little bit, once you’re done savoring her cunt.");
	output("\n\nAnd what a cunt it is! It squeezes down on your tongue and fountains her musky desire against your [pc.lipsChaste]. If you withdraw, it seems to swell upward, making itself appear even lewder in hopes of rubbing against something. You kiss it, sweet thing that it is, then thrust inside, deep. Your tongue swirls in circles, gathering up her liquid sex. Pleasing her is automatic. On some level, you suppose you were made for this. Squirt after squirt, you milk her for every drop of feminine bliss she can provide. You milk her until her tongue is limp against your [pc.cock] and she’s barely managing to moan.");
	output("\n\nYou milk Kally until your face is glossier than her cunt, and her bedroom reeks of pussy. Then you work her some more. She takes deep breaths of your crotch’s pheromonal soup, then cums again, the hardest time yet. You hear her jizz splash against her face and feel it drip down your own dick. More importantly, her slit squeezes tighter than a naleen’s coils. It threatens to choke your mouth’s muscle completely off. The pressure is agonizing. Then it relaxes completely, too spent to so much as quiver with an aftershock.");
	processTime(25);
	pc.changeLust(200);
	clearMenu();
	addButton(0,"Next",kallyBroCunnilingus3);
}

public function kallyBroCunnilingus3():void
{
	clearOutput();
	showKally();
	output("You toss Kally onto her bed. She’s a fucking mess. From her tits up, she’s painted nearly white. Her eyes are half-closed, and she’s giggling and blowing cum-bubbles. If anyone else found her like this, they’d think her little more than a brainless cum-slut. In short, she’s as beautiful as you’ve ever seen her.");
	output("\n\nYou grin, grab hold of ");
	if(pc.cockTotal() > 1) output("a");
	else output("your");
	output(" still-turgid mast");
	if(pc.cockTotal() > 1) 
	{
		output(", taking ");
		if(pc.cockTotal() == 2) output("your other");
		else output("another");
		output(" in your other hand");
	}
	output(", and smack it down onto her inky lips. Predictably, her nostrils flare, and her useless prick dribbles a puddle of white into her navel. She opens wide a second later, wet tongue an inviting carpet for you to slide across.");
	output("\n\nIt doesn’t take you long to cum, not ever holding yourself back for so long, not with the inviting reek of her cunt clouding every breath you take. A few thrusts into the sloppy slut’s mouth, and you’re nutting. You pump your [pc.cum] straight into the back of her maw. She swallows, more out of instinct than desire");
	if(pc.cumQ() >= 400) output(", but not even that keeps you from flooding her poor maw. [pc.CumColor] fuckbatter squirts out of the corners of her mouth, mixing with hers to create an erotic slurry");
	output(".");
	output("\n\nOnce finished, you wipe yourself off on her forehead, then present the still-slick shaft to her for inspection. She groans and trembles. Then, as if in a daze, she starts to lick you clean. Her tongue swirls lovingly over each vein until you’re perfectly spit-shined.");
	output("\n\nFor someone so un-enhanced, she’s a damned good fuck. Do you kiss her before you go?");
	processTime(10);
	pc.orgasm();
	if(!pc.hasStatusEffect("Kally Cummed Out")) pc.createStatusEffect("Kally Cummed Out",0,0,0,0,true,"Icon_Wine","",false,30,0xB793C4);
	IncrementFlag("KALLY_BROED");
	clearMenu();
	addButton(0,"Yes",yesCumKissKally);
	addButton(1,"No",noCumKissForKally);

}

//[No]
public function noCumKissForKally():void
{
	clearOutput();
	showKally();
	currentLocation = "CANADA5";
	output("You take one last look at your handiwork, then head back to the bar. From somewhere behind you, you hear the sounds of deep sniffing, following behind furious masturbation. Sounds like she’s going for round two.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Yes]
public function yesCumKissKally():void
{
	clearOutput();
	showKally();
	currentLocation = "CANADA5";
	output("You grab her by the hair and crane her head back. Once perfectly positioned, you kiss her on the lips. She’s a little slimy and more than a little fucked-silly, but she manages to kiss you back. You give her some tongue to fully express your affection to the complaint kui-tan, and she returns in kind. The girl can kiss!");
	output("\n\nYou break away before you start to get too worked up and head on out. She’ll doubtless need time to recover... and clean herself up.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Tell Kally Picardine
public function tellKellyPicardine():void
{
	clearOutput();
	showKally();
	//Bro
	if(pc.isBro()) output("<i>“Hey, got news for you,”</i> you growl.");
	//Bimbo
	else if(pc.isBimbo()) output("<i>“Guess what I found out!”</i> you announce in sing-song.");
	//Nice
	else if(pc.isNice()) output("<i>“I found something out for you, if you want to hear about it,”</i> you offer.");
	//Misch
	else if(pc.isMischievous()) output("<i>“I charmed a little birdie into giving me some juicy information. You might like it,”</i> you suggest.");
	//Hard
	else output("\n\n<i>“I have some news for you.”</i> You put it out there, waiting to see if she’ll bite.");
	//Merge
	output("\n\nKally leans in. <i>“Don’t hold back, [pc.name]. If it’s worth bringing up, it’s worth talking about, eh?”</i>");
	output("\n\nYou spill the beans. <i>“");
	if(pc.isBro()) output("Kiro sent the Picardine.");
	else if(pc.isBimbo()) output("Your sister mailed you that Picardine rock! She looooves you.");
	else output("That Picardine chunk that bought you this place? Kiro sent it to you.");
	output("”</i>");
	output("\n\nKally gasps. It’s so high pitched and girlish that you have a hard time believing it came from the mature kui-tan. <i>“Really!? Kiro did that?”</i>");
	output("\n\n");
	if(pc.isBro()) output("You nod.");
	else if(pc.isBimbo()) output("You beam right back at her. <i>“Ya-huh!”</i>");
	else output("You nod and smile right back at her.");

	output("\n\n<i>“Stars and starbursts! I had my suspicions, but when she didn’t bring it up before, I figured it must have been someone else. Nope!”</i> Kally laughs. <i>“Little sis can be taciturn when she wants to be. That sneaky vixen had me just as fooled as the wives she’s charmed into her bed.”</i> She grins at you. <i>“Present company excluded, of course.”</i>");
	if(!pc.isBimbo()) output("\n\n<i>“Of course.”</i>");
	else output("\n\n<i>“Totally.”</i>");

	output("\n\nWiping a tear from her eye, Kally abruptly leans over the bar and scoops you up into her arms, hugging you so tightly that you feel completely enveloped in silky fur and soft bosom. <i>“Thank you so much. I know it couldn’t have been easy to drag out of her.”</i> The bartender laughs and lets you go, shaking her head. <i>“She can be a real twat when she wants to hold something back. Trust me, I know.”</i>");
	output("\n\nYou laugh with her.");
	output("\n\nKally’s good humor evaporates a moment later. She chews her lip as a thought suddenly occurs to her. <i>“What if I react the wrong way, and it drives her away? It took me years to get her to see me again. What if this makes things awkward, and she leaves forever?”</i> She turns to you, desperate. <i>“You’ve spent more time with her than I have, these past few years. What should I do?”</i> Her eyes are wide, a little scared. <i>“How can I show her how much I appreciate this?”</i>");
	processTime(3);
	//[Blow Her] [Kiss Her] [Be Honest] [Don’t]
	clearMenu();
	addButton(0,"Blow Her",tellKallySheShouldBlowKiro);
	addButton(1,"Kiss Her",tellKallyToKissHerSisterItsTotallyNotIncestAndOkay);
	addButton(2,"Be Honest",tellKallyToBeSerious);
	addButton(3,"Don’t",dontTellKiroAboutPicardine);
}

//Don’t
public function dontTellKiroAboutPicardine():void
{
	clearOutput();
	showKally();
	output("<i>“Don’t. Bringing it up would just make her uncomfortable.”</i> You add, <i>“I just thought you’d like to know.”</i>");
	output("\n\nKally’s eyes fall. <i>“Oh.”</i> They brighten again. <i>“It is nice to know, even if I have to keep up the secret.”</i> A glint of mischievous wonder twinkles at the corner of her eye. <i>“I guess, in a way, we’re all sort of together on this. It’s a secret we all share, even if secretly. Thank you for telling me, [pc.name]. I know it couldn’t have been easy.”</i>");
	processTime(1);
	
	flags["KIRO_KALLY_PICARDINE_QUEST"] = -2;
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Blow Her
public function tellKallySheShouldBlowKiro():void
{
	clearOutput();
	showKally();
	output("You shrug. <i>“Give her a blowjob. She loves those.”</i>");
	output("\n\nKally rocks back, mouth agape. <i>“I’m not fucking around here, [pc.name]. I have to let her know how great a sister she is without scaring her away.”</i>");
	output("\n\nIt was worth a try...");
	processTime(2);
	clearMenu();
	addDisabledButton(0,"Blow Her","Blow Her","Nope, this won’t work.");
	addButton(1,"Kiss Her",tellKallyToKissHerSisterItsTotallyNotIncestAndOkay);
	addButton(2,"Be Honest",tellKallyToBeSerious);
	addButton(3,"Don’t",dontTellKiroAboutPicardine);
}

//Be Honest
public function tellKallyToBeSerious():void
{
	clearOutput();
	showKally();
	output("<i>“");
	if(pc.isBimbo()) output("Just tell her! She acts tough, but she, like, loooves it!");
	else if(pc.isBro()) output("Be honest.");
	else output("Just tell her the truth. You guys are more alike than you know. She was just as nervous.");
	output("”</i>");
	output("\n\nKally stares at you for a second. Her expression is a little distant, thoughtful. <i>“Damn... you might be right. I’m just going to have to do it and trust that Kiro’ll trust me back.”</i> She shakes her head. <i>“I shouldn’t have needed prompting for this. Sorry to rope you in.”</i>");
	if(!pc.isAss()) output("\n\nYou assure her that it’s no problem.");
	else output("\n\nYou accept her apology.");
	output("\n\n<i>“Right,”</i> Kally sighs, straightening up. <i>“Give me a little time to get myself psyched up, and I’ll tell her.”</i>");
	processTime(2);
	//Triggers the delayed honesty variant below, similar to the kiss her scene.
	pc.createStatusEffect("KallyKiro",0,0,0,0);
	pc.createStatusEffect("Wait For Kally Break",0,0,0,0,true,"Icon_Wine","",false,60,0xB793C4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Kiss Her
public function tellKallyToKissHerSisterItsTotallyNotIncestAndOkay():void
{
	clearOutput();
	showKally();
	output("<i>“Why not a kiss?”</i> It’s a bold strategy.");
	if(silly) output(" Let’s see how it plays out.");
	output("\n\nKally tilts her head, looking at you uncertainly. <i>“That’s certainly an... adventurous take on it.”</i> She shrugs. <i>“I guess it’s as good as an idea as any other. It might keep her from obsessing on the news itself overmuch.”</i> She shakes her head. <i>“You really think it’s a good idea?”</i>");
	processTime(1);
	//[Yes][No]
	clearMenu();
	addButton(0,"Yes",yesKissKiroKally);
	addButton(1,"No",noKallyThatKissSuggestionWasJustAPrankBro);
}

//[Yes]
public function yesKissKiroKally():void
{
	clearOutput();
	showKally();
	output("You nod.");
	output("\n\n<i>“Okay,”</i> Kally lamely agrees. <i>“You’re the expert. I’ll guess I’ll give it a try on my next break.”</i> She gives you a wan smile.");
	pc.createStatusEffect("KallyKiro",1,0,0,0);
	pc.createStatusEffect("Wait For Kally Break",0,0,0,0,true,"Icon_Wine","",false,60,0xB793C4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[No]
public function noKallyThatKissSuggestionWasJustAPrankBro():void
{
	clearOutput();
	showKally();
	output("<i>“Probably not...”</i>");
	output("\n\nKally nods. <i>“Yeah... what to do...?”</i>");
	clearMenu();
	addDisabledButton(0,"Blow Her","Blow Her","If kissing won’t work, blowing definitely won’t.");
	addDisabledButton(1,"Kiss Her","Kiss Her","You just ruled this idea out.");
	addButton(2,"Be Honest",tellKallyToBeSerious);
	addButton(3,"Don’t",dontTellKiroAboutPicardine);
}

//Kissed Her
//At bar after kiss suggestion
public function kallyKiroKissEruption():void
{
	showKallyAndKiro();
	output("\n\n<i>“Kiro, can we talk for a minute?”</i> Kally is leaning over the bar, beckoning her sister close.");
	output("\n\n<i>“Sure,”</i> the lawless tanuki ambles over a little nervously. <i>“Usually when the Ice Queen came calling for me, it was to get mom and dad to nail my ass to the wall.”</i>");
	output("\n\nKally smirks. <i>“No such luck this time, sis. I just wanna talk without having to shout over the rest of the bar.”</i>");
	output("\n\n<i>“Then you’re lucky I’m in an obliging mood,”</i> Kiro replies, a little more self-assuredly. <i>“What’s up?”</i> Her tail wags slowly behind her.");
	output("\n\nKally smiles warmly. <i>“[pc.name] told me, about the Picardine.”</i> She grabs Kiro before she can pull away. <i>“And [pc.heShe] also told me to do this.”</i> Darting forward, she plants a kiss, square on her sister’s lips. Kiro’s tail stiffens. Every hair is on end; it looks near twice its normal size. Kally tilts her head. Was that a flash of tongue from the corner of her mouth? Kiro tenses, further, then relaxes, kissing back. They stay like that for what must be the better part of a half minute until a cat-call startles them apart.");
	output("\n\nBoth are blushing up to the tips of their ears.");
	output("\n\n<i>“Wh-what was that about?”</i> Kiro asks, confused and visibly half-hard. Luckily, the edge of the bar is hiding her shameful erection from her step-sibling.");
	output("\n\nKally seems pleased that Kiro hasn’t run off yet, though there is no concealing her own hardening teats through the fabric of her top. <i>“It was a thank you, Kiro.”</i> She pauses, then grins. <i>“And I guess one final declaration that the prudish, nagging big sister you grew up with, put that behind her, and accomplished her dreams... with your help.”</i> She squeezes Kiro’s hands one last time. <i>“Thank you. And I think you’ve earned whatever free drinks you want... for life.”</i>");
	output("\n\nKiro shakes her head. <i>“You don’t owe me anyth-”</i>");
	output("\n\n<i>“No.”</i> Kally shakes her head. <i>“It isn’t for the Picardine. That was a gift. It’s for coming back into my life, and for being a good sister.”</i>");
	output("\n\nKiro spends a moment looking dumbfounded, then she dives forward and wraps her older, squishier sister up in as much of a hug as the bar will allow. Both sisters are crying now.");
	output("\n\n<i>“I love you.”</i>");
	output("\n\n<i>“I love you too.”</i>");
	output("\n\n<i>“Promise you won’t leave again?”</i> Kally sniffles.");
	output("\n\nKiro smiles sweetly, then kisses her sister on the cheek. <i>“Not like before, but jobs still need doing.”</i>");
	output("\n\nThe bartender pulls back, wiping her cheeks. <i>“Just so long as you don’t give up the ghost on any of them.”</i>");
	output("\n\nKiro’s tail wiggles. <i>“Sure thing... now about those free drinks?”</i>");
	output("\n\n<i>“Scoundrel.”</i> Kally smirks, then spins off to get a drink.");
	output("\n\n<i>“You know it.”</i>");
	output("\n\nAwww, how sweet!");
	pc.removeStatusEffect("KallyKiro");
	flags["KALLY_KISSED_KIRO"] = 1;
	flags["KIRO_KALLY_PICARDINE_QUEST"] = 3;
	processTime(3);
}

//Honest Told Her
public function kallyHonestKiroEruption():void
{
	showKallyAndKiro();
	output("\n\n<i>“Kiro, can we talk for a minute?”</i> Kally is leaning over the bar, beckoning her sister close.");
	output("\n\n<i>“Sure,”</i> the lawless tanuki ambles over a little nervously. <i>“Usually when the Ice Queen came calling for me, it was to get mom and dad to nail my ass to the wall.”</i>");
	output("\n\nKally smirks. <i>“No such luck this time, sis. I just wanna talk without having to shout over the rest of the bar.”</i>");
	output("\n\n<i>“Then you’re lucky I’m in an obliging mood,”</i> Kiro replies, a little more self-assuredly. <i>“What’s up?”</i> Her tail wags slowly behind her.");
	output("\n\nKally smiles warmly. <i>“I know about the Picardine. [pc.name] told me, and I couldn’t be happier.”</i> She catches Kiro’s paws in her own before the nervous ‘nuki does anything rash. <i>“Relax, I don’t bite.”</i>");
	output("\n\nThe younger sibling is still clearly nervous and uncomfortable at the situation if the jerky shifting of her tail is any indication. <i>“Yeah... right.”</i>");
	output("\n\n<i>“Seriously, Kiro. Deep down, I think I always knew.”</i> Kally lets her sister’s hands go, and smiles. <i>“Sometimes you get one of those hunches in your gut, and you can’t believe it. Not without evidence, but you know. You know even when your sister’s so damn good at holding things back that you start doubting yourself.”</i> Kally smirks. <i>“You sneaky scamp.”</i>");
	output("\n\nKiro shakes her head, chocolate curls bouncing. Her eyes are closed. <i>“No way.”</i> They open, fixing on Kally. <i>“There wasn’t anything short of a psychic that could tie me to that rock.”</i> She pulls away. <i>“You didn’t develop psychic powers, did you? Fuck, you aren’t reading my thoughts right now are you?”</i>");
	output("\n\nThe curvaceous bartender slugs her little sister’s arm. <i>“Knock it off, will ya? I’m still your big sister. No mind powers necessary to figure out that pirates mail back a cut off their booty to help out their families. You’re a long way from the first.”</i>");
	output("\n\nKiro rubs her arm, the pain distracting her from her nerves. <i>“Okay, okay. Just don’t start trying to pay me back with a cut of your earnings. It was a gift, not a loan.”</i>");
	output("\n\nKally sticks out her tongue. <i>“Sorry, but as you’re elder I’m going to have to demand that you get free drinks for life...”</i> For a second, she seems about to change her mind, then adds, <i>“...or until the tab gets close to that rock.”</i> The bar-owner smiles at that. <i>“You’d probably kill yourself before you managed that one.”</i>");
	output("\n\nShaking her head, the lawless kui-tan casts a look your way. She’s trying to look angry, but you can see the corner of her mouth lifting as she answers, <i>“I can live with that.”</i>");
	output("\n\nKally leans over, scooping Kiro up into a deliciously squishy-looking hug. <i>“I love you, Kiro.”</i>");
	output("\n\n<i>“I love you too, you big oaf. Now lemme go!”</i> Kiro yells, struggling weakly. Moisture beads at the corners of both their eyes.");
	output("\n\n<i>“Promise not to bolt?”</i> Kally squeezes tighter.");
	output("\n\nKiro blows a raspberry against her familiar foe’s cheek. <i>“Only if you promise to get me one of those drinks! Leggo!”</i>");
	output("\n\n<i>“Deal!”</i>");
	output("\n\nThey split apart, all traces of tension gone. Those two are as close as they’re going to get");
	if(kiroKallyThreesomeUnlockPoints() > 0) output(" short of a little quasi-incestual encouragement");
	output(".");
	pc.removeStatusEffect("KallyKiro");
	flags["KIRO_KALLY_PICARDINE_QUEST"] = 3;
	processTime(4);
}

//Catch Kally Sisterschlicking
public function isKallySisterSchlicking():Boolean
{
	return (pc.hasStatusEffect("KALLY_SCHLICK"));
}
public function sisterSchlickProcChance():Boolean
{
	if(!kallyIsAway() && !pc.hasStatusEffect("KALLY_SCHLICK") && flags["KALLY_FAP_2_KIRO"] == undefined && kiroKallyThreesomeUnlockPoints() >= 1 && flags["KIRO_KALLY_PICARDINE_QUEST"] == 3 && rand(5) == 0)
	{
		if(!pc.hasStatusEffect("KALLY_SCHLICK"))
		{
			pc.createStatusEffect("KALLY_SCHLICK",0,0,0,0);
			pc.setStatusMinutes("KALLY_SCHLICK",60);
		}
		return true;
	}
	return false;
}

//Kally's room locked
public function kallyDoorBonus():void
{
	if(isKallySisterSchlicking())
	{
		output("\n\nMuted moans can be heard through ");
		if(flags["KALLY_BROED"] != undefined) output("Kally’s ");
		else output("the eastern ");
		output("door.");
		if(flags["KALLY_BROED"] != undefined) output(" Y");
		else output(" You’re pretty sure it’s Kally’s voice, but y");
		output("ou can’t quite make out what she’s moaning.");
		
		flags["NAV_DISABLED"] = NAV_EAST_DISABLE;
		
		//buttons
		if(flags["KALLY_FAP_2_KIRO"] == undefined) addButton(1,"Open Door",openKallysDoor);
		if(flags["TRIED_KALLY_DOOR"] != undefined) 
		{
			addButton(2,"Search",searchKallysDoor);
			addButton(3,"Hack",hackDatDoorYo);
		}
		return;
	}
	
	if(flags["KALLY_FAP_2_KIRO"] == undefined)
	{
		output(" The door of the eastern room seems to be locked.");
		flags["NAV_DISABLED"] = NAV_EAST_DISABLE;
	}
	else
	{
		output(" And, of course, Kally’s room is to the east.");
		flags["NAV_DISABLED"] = undefined;
	}
}

public function openKallysDoor():void
{
	clearOutput();
	showName("LOCKED\nDOOR");
	showBust("");
	//Try open - no key
	if(!pc.hasKeyItem("Kally's Bedroom Key")) 
	{
		if(flags["TRIED_KALLY_DOOR"] == undefined) 
		{
			output("You quietly try the handle, but it doesn’t budge. The security pad embedded in the frame blinks red, indicated that the door is locked. You’ll either need to hack it or find a keycard if you want in.");
			flags["TRIED_KALLY_DOOR"] = 1;
		}
		else output("It’s still locked. You’ll need to find the keycard if you want in.");
	}
	else
	{
		//Have passcard
		output("You pull out the passcard and swipe it past the sensor. Bingo! A green light flashes alongside the quiet hum of the magnetic lock decoupling. Now to perform your best peeping Tom impression.");
		clearMenu();
		addButton(0,"Next",actuallyPeeptime);
		return;
	}
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Search
public function searchKallysDoor():void
{
	clearOutput();
	showName("\nSEARCHING...");
	showBust("");
	output("Maybe she keeps a hidden key somewhere around the door in case she loses hers. You painstakingly turn over the area around the door to little avail. There’s no doormat to secret a card beneath, and no fixtures to hide anything in. If she does have a hidden spare, it’s hidden too well for you to locate.");
	output("\n\nPerhaps behind the bar?");
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//Search Bar
public function searchKallysBar():void
{
	clearOutput();
	showName("BAR\nSEARCH");
	showBust("");
	output("Looking around to make sure nobody is watching, you ");
	if(pc.RQ() >= 75) output("gracefully leap");
	else if(pc.RQ() >= 25) output("leap");
	else output("less than gracefully tumble");
	output(" over a vacant segment of the bar. It’s a good thing the Kui Country Bar and Lodge doesn’t get very much business. Nevertheless, there are a truly dazzling amount of surfaces to search. You crouch down and start by popping open the cabinets one after another. Booze... booze... lube... condoms.... Is Kally running a bar or a brothel? You decide to skip over the machines responsible for making ice and producing exotic flavorings, and the shelves full of liquor are equally useless.");
	output("\n\nA gleam of reflected light off the " + (isAprilFools() ? "dogecoin" : "credit") + " terminal catches your eye, but so too does the rumpled shape of a forgotten handbag. Which will you search?");
	processTime(3);

	clearMenu();
	addButton(0,"Terminal",searchKallysTerminal);
	addButton(1,"Bag",searchThePurse);
}

public function searchThePurse():void
{
	clearOutput();
	showName("SEARCH\nHANDBAG");
	showBust("");
	output("You sneak over to the handbag and pop it open. Nothing in there but some crumpled gum, a pack of condoms, tissues, some value-brand cookies.... Maybe there is a lot in there. You dig deeper through the mess, and with your persistance, you are rewarded.");
	output("\n\n(<b>Key Item Gained:</b> Kally’s Bedroom Key!)");
	pc.createKeyItem("Kally's Bedroom Key");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Terminal]
public function searchKallysTerminal():void
{
	clearOutput();
	showName("TERMINAL\nSEARCH");
	showBust("");
	output("You creep up to the terminal, fingers wiggling, and pop it open. Credits rattle in their plastic tray. A loud chime dings. More importantly, a commanding voice thunders, <i>“What do you think you’re doing back there?”</i>");
	output("\n\nA moosetaur so tall her antlers nearly scrap the ceiling is glaring down at you, her hands balled into fists at her side. She’s dressed in the traditional bright red of the Vesperian Tauric Police force, and very clearly unhappy. <i>“Thievery is a very serious crime.”</i>");
	processTime(1);
	clearMenu();
	addButton(1,"Lie",lieToZeCop);
	addButton(0,"Run!",runAwayFromDeertaur);
}

//[Run!]
public function runAwayFromDeertaur():void
{
	clearOutput();
	showName("FUCK THE\nPOLICE");
	showBust("");
	output("You run to the far side of the bar, leap over the polished wood surface, and take off at a sprint for your ship. The cumbersome local cop has barely pivoted by the time you’re barreling down Canadia Station’s hallways. You spare a glance over your shoulder and cheer with joy when you see nothing but offended-looking tourists and truckers. You’re home free. You bolt into the airlock, and...");
	output("\n\nTHUNK! The doors on either side slam closed. You pound on it with your fists to no avail.");
	output("\n\n<i>“Not just a thief, but a stupid thief too. Nothing a few years in a Vesperian rehabilition center can’t fix.”</i> The bodiless voice emanates from a comms panel.");
	output("\n\nNo! Your quest... your inheritance! You try everything to break free, but these doors are made to endure impacts from space debris traveling at near lightspeed. The best you can manage is to scratch up the once shining surface.");
	processTime(10);
	clearMenu();
	addButton(0,"Next",getCoppedSon);
}
public function getCoppedSon():void
{
	clearOutput();
	showName("\nJAILED!");
	showBust("");
	output("Vesperian Jail isn’t all that bad. You’re given all the opportunity you need to educate yourself, and the daily therapy sessions really help you come to peace with losing out on the claim to your inheritance or a stake in the rush riches. The [pc.fullName] that walks free a year and a half later is almost a whole new [pc.manWoman].");
	output("\n\nThe tale of your life from this point on is a long and convoluted one, but it is no longer <i>this</i> story.");
	
	pc.credits = 0;
	pc.removeEquipment();
	pc.armor = new ComfortableClothes();
	
	days += 450;
	processTime(40 + rand(1400));
	
	badEnd();
}

//[Lie]
public function lieToZeCop():void
{
	clearOutput();
	showName("\nFIBBIN’");
	showBust("");
	output("<i>“It’s not what it looks like.”</i> You rack your brain for a plausible story.");
	output("\n\nThe moosetaur cop crosses her arms and glares. <i>“Really? Do enlighten me.”</i>");
	output("\n\n<i>“Well,”</i> you try to play your nervousness off as a whole other kind of nervousness, <i>“we were having a little fun back in her room, and she remembered she forgot to lock down the cash register. I volunteered to check for her.”</i> You put on your best sheepish expression. <i>“I figured she’d the extra time would swell up those kui-tan balls a little more, ya know? I’ve read some stories...”</i>");
	output("\n\n<i>“Nope! That’s enough!”</i> Waving her hand at you, the red-coated officer seems like she can’t get you to stop talking fast enough. <i>“Just lock it up and get back to her. The sooner you finish up, the sooner these good people can get their next round of drinks.”</i>");
	output("\n\n<i>“Sure.”</i> You lift her room key and dramatically slam the terminal’s cash drawer closed. <i>“I swear, she’d forget her dick if it wasn’t bolted on.”</i>");
	output("\n\n<i>“Go.”</i>");
	output("\n\nYou’d better get going before she thinks too hard about your story!");
	processTime(3);
	pc.addMischievous(5);
	output("\n\n(<b>Key Item Gained:</b> Kally’s Bedroom Key!)");
	processTime(4);
	pc.createKeyItem("Kally's Bedroom Key");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Hack - Tech speccies auto succeed.
public function hackDatDoorYo():void
{
	clearOutput();
	showName("\nHACKING!");
	showBust("");
	if(pc.characterClass == GLOBAL.CLASS_ENGINEER) 
	{
		output("You’re familiar with this model of locking mechanism from a repair job you had before this mad quest was thrust into your lap. Most installers don’t bother to clear out the default password to access its firmware settings. After a quick search on your Codex, you’ve got the default password - and complete control over the lock. A single press, and the magnetic locks release.");
		output("\n\nNow to perform your best peeping Tom impression.");
		processTime(6);
		clearMenu();
		addButton(0,"Next",actuallyPeeptime);
	}
	//Int-based success
	else if(pc.IQ() >= 60) 
	{
		output("Busting out your trusty Codex, you do a quick search on the make and model of the lock. Amazingly, it’s lacking in brute force protection. You put together a quick script to slam a few gigabytes of login attempts through its verification routines... and get in five seconds later. Simple setups like this are the reason why most militaries require 512 digit passcodes backed by secondary life signature checks. A single press, and the magnetic locks release.");
		output("\n\nNow to perform your best peeping Tom impression.");
		processTime(6);
		clearMenu();
		addButton(0,"Next",actuallyPeeptime);
	}
	//Int-based fail
	else
	{
		output("Busting out your trusty Codex, you get ready to do something... hacky. You look at the lock, then the screen... then back at the lock. Oh! It has a model number on the side. Maybe that’ll help out. You type it in, but there are so many search results! Oh, slamazon.ship is having a sale on them actually! You could");
		if(pc.isBimbo()) output(" like,");
		output(" save a ton of credits by buying one right now!");
		output("\n\n...Finding a passcard might be a better plan.");
		processTime(2);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Actual Peeptimes
public function actuallyPeeptime():void
{
	flags["NAV_DISABLED"] = undefined;
	clearOutput();
	showKallyAndKiro(true);
	showName("KALLY\nFAPPING!");
	output("As quietly as you can, you open the door an inch and press your eye to the crack. Kally is just inside, naked and slouched in a comfy-looking chair, one hand wrapped around her dick, the other half-hidden beneath her fluffy nutsack. Her eyes are glued to an obscenely pornographic hologram. In it, two gooey girls, a dark green galotian and a purple rahn are working over a chocolate-furred kui-tan... with a horse-dick.");
	output("\n\n...Is that Kiro?");
	output("\n\nThe galotian has her ‘victim’ completely at her mercy. All four limbs, and the fluffy tail too, are trapped in gooey psuedopods, forcing the raccoon-girl into an uncomfortably supine position, dick jutting straight up. The rahn is taking full advantage of the situation. Her gelatinous dick is lodged deep in the kui-tan’s straining asshole, bathed in dribbling pussy-juice. Just above, the gel woman’s gleaming purple lips are sealed tight to tip of two feet of equine engorgement. She can barely swallow fast enough to keep up with the bulging rod. Each pump of her wobbling hips makes the tanuki’s urethra visibly distend with the fruits of a thorough prostate milking.");
	output("\n\n<i>“Oh f-f-fuck, Kiro!”</i> Kally moans, stuffing a fist deep in her cunt. She’s so wet you can hear the squelch all the way on the other side of the door. <i>“Yess!”</i>");
	output("\n\nIt <i>is</i> Kiro!");
	output("\n\nThe corporeal sister lets go of her dick long enough to twist a control knob, and the whole projection inches closer to her, placing her so close to her sibling’s shaft that if Kiro were real, she’d feel Kally’s breath. Passionate whines slip from her throat, and she resumes stroking herself off. Bubbles of creamy jism form on her tip, then roll down her meaty length, greasing her fingers as they stroke. Her other arm plunges deep, and Kally’s back arches. She stops stroking and croons, <i>“Fuck me Kiro!”</i> while ribbons of pre-jizz drool out of her. Somehow, she holds herself back from climax, delighting in riding the edge. <i>“Fuck me deep, sis!”</i>");
	output("\n\nMeanwhile, the projected Kiro is straining violently against her bonds, thrusting hard enough to throw the rahn off her spurting dick, but not hard enough to do anything about the ovipositor pumping whitish rahn eggs deep into her rectum. Kiro’s egg-fattened belly wobbles when she heaves again. This time, one of her legs breaks the greedy galotian’s surface tension. She snaps her paw around into the rahn’s side and sends her flying. Never mind that the sudden withdrawal of the ovipositor causes Kiro to squirt a gallon of cream into the air.");
	output("\n\n<i>“You sluts are into pregnancy? Fine.”</i> The audio quality lends Kiro’s voice an angry buzz. Ripping an arm free, she scoops a palmful of her own seed into her mouth and swallows. <i>“Then let’s get you pregnant.”</i> Kiro rolls over onto the goo-girl, ignoring the fact that two of her limbs are still trapped inside her. White-glazed eggs slip out of Kiro’s well-fucked asshole and splatter on the ground, just out of frame. <i>“The thing about being a kui-tan is that swallowing cum makes me really... really horny.”</i> She gathers more out of her fur and swallows. <i>“And it makes my balls feel full enough to flood a swimming pool.”</i> Kiro thrusts herself into the shuddering puddle of goo. <i>“I’m pretty sure galotians aren’t good at much of anything when they’re a pool sized cum-balloon.”</i>");
	output("\n\nBack in the real world, Kally hums, <i>“Mmmm...”</i> twisting her wrist to press on a place deep within herself. <i>“...could you fill up my tub?”</i> She seems a little out of it at this point, paying less attention to the video than her own nearly incestual fantasies. Her nipples are so hard they’re clearly visible from your hiding place at the door. <i>“Give me a nice cum-bath... yeah.”</i> Kally gently fingers the taut sheath at the base of her straining, thirteen-inch member, whimpering in pleasure.");
	output("\n\nKiro’s digitized voice growls, <i>“Take it! Take it slut!”</i> as she humps away, balls visibly engorging with every thrust. They bounce and wobble atop the poor galotian who seems incapable of doing anything more than vocalizing her delight. The purple rahn stumbles back into the frame, rubbing her side. From this angle, you can see that all the cum she’s already swallowed has fattened her nicely. She drops to the ground and starts jacking off her ovipositor to the sight of her cohort being drilled. Eggs spurt out with every stroke, adding to the pile that already escaped Kiro.");
	output("\n\nMeanwhile, Kiro’s balls have grown so large that they press through the goo-girl and sit on the floor, slightly hampering her thrusts. <i>“This is what greedy - mmm - whores like you - AH! - g-get!”</i> Her galotian-stained nutsack trembles and visibly shrinks.");
	output("\n\nKally quietly agrees, <i>“I’m such a greedy whore!”</i> and pushes her fist as deep as can, almost up to the elbow. An alabaster bomb goes off on the projection, transforming the rich green galotian into a lighter green, far less coherent mess.");
	output("\n\nKiro cries, <i>“You gooey sluts are such good cum-dumps!”</i>");
	output("\n\nKally nods, eyes rolling back, and spasms without touching anything above her sheath. Her cum, somehow even whiter than the holo-projected stuff, arcs through the air, slapping down into her heaving tits at the same moment the next part of her volley launches. <i>“God yes! All over me!”</i> Kally cries, whimpering and jizzing, her hips twitching as her fist-stuffed cunt tries to milk nonexistent sperm from her arm. She lets go of her dick and starts smearing in into her boobs. Whenever her fingers brush a nipple, she gasps and spurts even harder.");
	output("\n\nThree or four dozen eruptions later, the thoroughly glazed bartender sags like a puppet with her strings cut. She slowly extricates her fist from her nethers, wincing when it finally pops free. Kally sighs heavily and clicks off the feed with the only part of her clean enough to touch the controls - her pinky toe. <i>“...And she thinks she’s the pervert.”</i>");
	output("\n\nYou make your exit before she recovers enough to notice you, more aware of just why Kally was so pleased to see Kiro.");
	pc.removeStatusEffect("KALLY_SCHLICK");
	IncrementFlag("KALLY_FAP_2_KIRO");
	pc.createStatusEffect("Kally Cummed Out");
	pc.setStatusMinutes("Kally Cummed Out",10);
	variableRoomUpdateCheck();
	processTime(20);
	pc.changeLust(35);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Kally and Kiro Gloryhole Meeting
public function kallyAndKiroGloryholeThreesomeMeeting():void
{
	clearOutput();
	showName("WORKIN’\nGLORYHOLES");
	showBust("");
	//Kiro shows up first.
	//Kally shows up after.
	output("The door in the stall to your left opens and closes. Strange, you didn’t hear anyone approach.");
	output("\n\n<i>“Ahhh, gloryholes. Nice. I guess the Ice Queen really did melt.”</i>");
	output("\n\nIs that... Kiro?");
	output("\n\nSeconds later, a familiar-looking horse-dick works its way through a hole barely big enough for its girth. It looks a lot like Kiro’s - smells a lot like her too. It firms and lengthens, bobbing forward quickly enough to brush your cheek.");
	output("\n\n<i>“It’s your lucky day, slut,”</i> Kiro announces from the other side of the divider. <i>“You get to empty my balls. I guess you won the lottery.”</i> More of the musky length pushes in, glossy with eager sweat. <i>“I know a few cock-suckers that’d even pay for the privilege.”</i>");
	output("\n\nShe doesn’t know it’s you! You decide to play along, grabbing her in one hand, fingers splayed almost worshipfully against the veiny equine length. Pre-cum forms a bead at the tip, then rolls down the underside to splash against your sensuously caressing digits. It’s even warmer than Kiro’s cock. You add your second hand to the mix, circling your thumb around the blunted head before squeezing the rest of your fingers around the shaft. It flexes against your grip and squirts a shot-glass worth of almost-clear pre-seed onto your collarbone.");
	output("\n\nKiro groans, <i>“You like it quiet, I guess? Just you and the dick?”</i> She grunts, dribbling more pre. <i>“Then go get it, girl. People like us, we can let our bodies do the talking.”</i>");
	output("\n\nYou smile and give the ludicrously endowed tanuki a playful squeeze, milking a dribble out onto your tongue. You smack your lips after and swallow noisily, loud enough for her to hear you on the other side of the wall. Her prick thumps heavily with her speeding heart, harder and thicker, signaling her approval, so you do it again. This time, you close your [pc.lips] around the flare and gently suckle, wagging your tongue back and forth against the underside, reveling in the salty tang of the sweat, the heady aroma of her musk. Enough leaks out of her to fill your cheeks, forcing you to swallow after a few seconds of savory delight.");
	output("\n\nPopping off, you gasp for air, then go right back in. This time, you push three or four inches past the place you stopped before you start sucking, and this time, you feel it flare, just a little, against your [pc.tongue]. So you go deeper, your hands fondling all the while. You swallow more cock");
	if(!pc.isBimbo()) output(", as much as your gag reflex will allow");
	else output(", endlessly grateful to be so wired for oral pleasure that you can take it right into your throat");
	output(", bathing Kiro in warm, wet heat. And she loves it. You can tell by the way she throbs against you and the slight twitches of her hips driving it deeper. You can read it in the spurts and dribbles that you swallow, greedy as a galotian whore.");
	output("\n\nThen you hear the stall on the other side close and latch. Another person?");
	processTime(15);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",kiroAndKallyGloryholeSupremo2);
}

public function kiroAndKallyGloryholeSupremo2():void
{
	clearOutput();
	showName("WORKIN’\nGLORYHOLES");
	showBust("");
	output("The new arrival doesn’t say a word, just sticks a dark brown dick through the other side. It’s blunted at the tip like Kiro’s, but only about a foot long, still partway flaccid.");
	if(flags["KALLY_BIMBO_TAPPED"] != undefined) output(" It looks like Kally’s...");
	output("\n\nYou suppose you always knew this could happen. Two customers, both wanting to blow a hot load down your throat or all over you. You’ll just have to spread the love around. Reaching over with one cummy hand, you start stroking the flaccid newcomer. Your fingers are so filmy with Kiro’s pre-cum that they glide over the new prick like a well-oiled machine. In no time, it begins to stiffen, the base fattening, lifting the drooping front half its own pressurizing need. You help it out by picking it up, then popping off of Kiro to give it a wet kiss. The hermaphroditic Tanuki isn’t forgotten, of course - you’ve still got a hand on her, milking her ever-oozing member to drizzle your shoulders.");
	output("\n\nOooh! The new dick tastes <i>nice</i>. Similar to Kiro’s, yes, but with a charming, undercurrent that has your mouth watering for more. You take it deeper, easily. It’s not quite as thick as Kiro’s, but as it fully engorges, it comes close - despite only gaining an inch or so of length. The new visitor is clearly a shower, not a grower. But that’s fine. You bob back and forth a few times, loving how it surges upward, begging for more attention. You love it so much that you bob deeper");
	if(!pc.isBimbo()) output(", struggling to take seven or eight inches");
	else output(", taking it until your lips are pressing back through the hole");
	output(".");
	output("\n\nAnd then you hear the moan, sonorous, feminine, and almost as familiar as Kiro’s.");
	output("\n\n<i>“Is that you, Kally?”</i> Kiro asks from the other side, trying to suppress a moan of her own. Her dick, already rock hard, firms into solid steel.");
	output("\n\nYou pop off, looking back and forth between the two dicks. This whole time, you’ve been jacking off both kui-tan sisters?");
	output("\n\nKally whimpers back, <i>“K-Kiro?”</i> She pulls halfway out, slipping through your lubed-up fingers before the pleasure overwhelms her, compelling her to thrust back in. Her balls slap against the stall with a wet clap. <i>“I... what?”</i> The tip of Kally’s dick flares powerfully.");
	output("\n\nThey seem almost ready to bolt, despite being more turned on than ever. That just won’t do! Grabbing both just below their blunt heads, you lean back out of the way and guide them down, pressing the two flaring tips together. They kiss - a slimy, messy exchange of copious dick-leakage. Long strings of clear sister-love drizzle the floor as you wiggle the shafts to slide their most sensitive places back and forth against one another.");
	output("\n\nKiro pants, <i>“Is that your dick? Oh fuck, am I rubbing on your dick?”</i>");
	output("\n\n<i>“Ah! Yes! God, yes it is! Why does it feel so good?”</i> Kally’s whole cock flexes, bucking in your hands. <i>“And you’re so... wet!”</i>");
	output("\n\nIf they think that’s wet, you’ll give them wet. Sticking out your [pc.tongue], you gather a nicely-sized puddle of drizzling girl-goo and smear it up the side of the cock-joint. Then, you wrap your [pc.lips] around both and suckle from the side, gently pumping your hands. The flow thickens enough for you to fill your mouth and cheeks before you pull off and noisily swallow, signaling your contentment with a wet, ‘mwah!’");
	output("\n\nKiro loves it, judging by how hard she’s pressed herself against the other side of the gloryhole. Her sheath is bulged the whole way through. You slip a pinky inside whenever your stroking takes you close enough to reach it, teasing her most sensitive recesses.");
	output("\n\n<i>“Kally, who the fuck do you have working this thing? I’m too close. She’s gonna make me cum!”</i>");
	output("\n\nKiro’s flare is definitely getting bigger, the veins on the side more prominent. You lift her expanding crown over her sister’s, letting her glaze the slightly smaller shaft in her pleasure.");
	output("\n\nKally pants heavily, whimpering as the hot sex-juices slide down her length. <i>“I dunno! That’s kind of... kind of the point of gloryholes. Stars, you have so much cum, Kiro!”</i>");
	output("\n\nNow the smaller sister is flaring, her stubbier dick thickening delightfully under your caresses. You massage the elder’s liquid love into the shining skin, peppering her with kisses along the way. The poor dear so obviously adores being bathed in her sibling’s excited fluids.");
	output("\n\nKiro’s voice cracks into a higher register as she tries to retort, <i>“Fuck it. You really like this, don’t you? You just showed up a minute ago, and you’re already flaring!”</i>");
	output("\n\nYou smush their oozy, anxious dicks back together, pumping the hot, dripping lengths faster and faster.");
	output("\n\n<i>“What? No I, uh... I - oh god yes, like that!”</i> Kally moans, shuddering. <i>“Yes! I want this, okay? Is that okay?”</i> She takes a deep, ragged breath. <i>“I know it’s weird and stupid, but I can’t stop thinking about you and your big, stupid dick. Just cum already! It’s not like it's really incest... not if we’re just soaking some stupid slut!”</i>");
	output("\n\nBoth of them are throbbing between your fingers, urethras flooding with pre. The walls shudder from the force of the two herms pressing against them, trying to get as much of their dicks into your hands as possible.");
	processTime(15);
	pc.changeLust(25);
	clearMenu();
	addButton(0,"Next",kiroAndKallyGloryholeSupremo3);
}

public function kiroAndKallyGloryholeSupremo3():void
{
	clearOutput();
	showName("WORKIN’\nGLORYHOLES");
	showBust("");
	output("<i>“Oh, sis,”</i> Kiro pants, <i>“how didn’t I see this coming? [pc.name] did, I guess, but... wow.”</i>");
	output("\n\nKally giggles. <i>“I don’t know, but aren’t you weirded out or something?”</i>");
	output("\n\n<i>“I’ve done weirder. Besides, I can’t think of a hotter girl to rub dicks with. I mean... your tits, Kally. I could drown those things in spunk - just say the word. And let me sample one of those jizzy beers you serve your regulars first!”</i>");
	output("\n\n<i>“You... oooh... you knew?”</i>");
	output("\n\nKiro laughs, <i>“Yeah, I figured it out. Ah-AH! Oooo... You ready for a cum bath, Slut Queen?”</i>");
	output("\n\nA moan sounds from the other side of the wall.");
	output("\n\n<i>“H-here it comes! Don’t you steal it for yourself, glory-whore!”</i>");
	output("\n\nAs if it would matter. With these two, there’ll be more than enough to paint the whole stall. Peppering Kiro’s cock with kisses, you favor it with the bulk of your attention, watching it swell magnificently, the incredible tool puffing up in the long moment before climax. The urethra bulges obscenely, thicker than you’ve seen it before, and it erupts. A liter of Kiro’s heady goo splats into the far wall, curtains of it cascading across her step-sister’s dick.");
	output("\n\nLike some kind of contact aphrodisiac, the cum is enough to instantly push Kally over the edge. She joins her lawless sister in release. You lift her spasming length to line it up to Kiro’s, smushing the two tips tight enough together that the high-pressure spooge sprays out in a ring, soaking you, the ceiling, the floor, and everything in between. Two voices babble in pleasure, mouthing words of love and ecstasy. You jack them hard, earning two squeals of delight and twin fountains of juicy release - one so thick and virile that it almost glues your fingers together, and the other so creamy and delicious that it makes guzzling it a delight.");
	output("\n\nAfter both are so thoroughly painted that they may as well be albinos, you aim them higher. Kiro’s spurts are by far the larger, but Kally only appears a slouch when compared to an obscene specimen of orgasm prowess. Their streams mix in the air and rain down over you, bathing you in the twin tanuki’s climax, and the concoction gets absolutely everywhere: ");
	if(pc.hasHair()) output("your [pc.hair], ");
	output("your [pc.chest], your [pc.legs], your [pc.belly]. Not even your nethers escape the sensuous drizzle, but that’s just fine. You massage the sticky sperm over your most sensitive places, moaning as they continue their perverted painting.");
	output("\n\n<i>“[pc.name]?”</i> Kiro groans, still hosing you down. <i>“Is that you?”</i>");
	output("\n\nYou cry out, fingers pumping, lewdly squishing, <i>“Yessss!”</i>");
	output("\n\nAnd the orgasmic onslaught redoubles. Spooge backs up the drain, forming a lake that spreads through the bathroom. You cum yourself, joining right in alongside them.");
	processTime(10);
	pc.applyCumSoaked();
	pc.loadInMouth(kiro);
	pc.loadInMouth(kally);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",kiroAndKallyGloryholeSupremo4);
}

public function kiroAndKallyGloryholeSupremo4():void
{
	clearOutput();
	showKallyAndKiro();
	output("You squeeze every last drop out of the kui-tan sisters. Being flaccid and droopy isn’t enough to stop you from milking a few last ropes out of them. But it is enough for Kiro and Kally to pull out after, and enough for them to force the door open and help you to your [pc.feet].");
	output("\n\n<i>“Thought you could pull one over on me, huh?”</i> the saucey space pirate growls.");
	output("\n\nKally sheepishly tucks herself under her skirt. <i>“Well, [pc.heShe] did, didn’t [pc.heShe]?”</i>");
	output("\n\nYou flash a grin, though with a mountain of Kiro and Kally cum painting your face, you may as well be a ghost.");
	output("\n\n<i>“Yeah, [pc.heShe] did.”</i> Shaking her head, lawless raccoon-woman shrugs. <i>“So what does this mean for us?”</i>");
	output("\n\nThe bartender, still in her work clothes, clutches tight to the hem of the skirt. <i>“I guess it means we’re super good at making each other cum.”</i>");
	output("\n\nKiro laughs. <i>“I guess it does.”</i> She glances sideways at her blushing step-sibling. <i>“You really did like that, didn’t you?”</i>");
	output("\n\nShyly, Kally nods.");
	output("\n\nSnorting, the brazen tanuki declares, <i>“Then I guess between you and [pc.name], I won’t be needing to use the gloryhole anymore.”</i>");
	output("\n\nYou quirk an eyebrow, and Kally giggles, <i>“Unless we want to give [pc.himHer] another bath.”</i>");
	output("\n\n<i>“Exactly.”</i>");
	output("\n\nThey both lean in to kiss you on the cheek, in the process collecting the tiniest amount of their shared sperm, then depart. You swear you can see their balls starting to bulge beneath the bottoms of their clothes as they leave.");
	kiroKallyThreesomes(1);
	if(flags["KIRO_KALLY_EMAIL"] == undefined && flags["KIRO_3SOME_REACTION"] != -1) flags["KIRO_KALLY_EMAIL"] = GetGameTimestamp();
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

/*
public function indexCheck():void
{
	var x:int = 0;
	x = pc.cockThatFits(500,"volume");
	trace("TEST 0 OVER. X = " + x);
	x = pc.cockThatFits(500,"volume",[0]);
	trace("TEST 1 OVER. X = " + x);
	x = pc.cockThatFits(500,"volume",[1]);
	trace("TEST 2 OVER. X = " + x);
	x = pc.cockThatFits(500,"volume",[1,2]);
	trace("TEST 3 OVER. X = " + x);
}*/

//Get Double-Teamed {Kiro gets butt, Kally gets cunt}
public function kiroKallyDoubleTeamPCCauseShesABigFutaSlutLoverYeahThatsWhatFenLikesToWriteBecauseHeHasShitTaste():void
{
	clearOutput();
	showKallyAndKiro(true);
	//Nonbimbo Intro.
	if(!pc.isBimbo()) 
	{
		output("<i>“Fuck me already,”</i> you breathily demand");
		if(!pc.isCrotchExposed()) output(", shucking your [pc.lowerGarments] out of the way");
		output(". <i>“Both of you.”</i> Twirling, you pull the twin tanukis close, intentionally pinning their throbbing lengths against your [pc.skinFurScales] and wriggling enticingly, teasing them with sensuous friction.");
	}
	//Bimbo Alt Intro... Bintro?
	else
	{
		output("<i>“Hey,”</i> you husk, laying a hand on each sister’s enormous tentpole, <i>“Do you think you could, like, put them both in at the same time?”</i> Your fingers flutter teasingly, slipping and sliding across the sides of the broad, pulsating veins. <i>“One in each hole...”</i>");
	}
	//Merge
	output("\n\n<i>“Dibs on [pc.hisHer] pussy,”</i> Kally calls with alarming suddenness. <i>“Can’t let you ruin it with that monster-cock of yours.”</i>");
	output("\n\nKiro slaps her sister’s ass, hard. <i>“I didn’t hear any complaints from you.”</i> She pivots to grab hold of your [pc.butts] and spread them wide open. <i>“Besides, I wanted to play with this ");
	if(pc.hasPlumpAsshole()) output("puffy cock-holster");
	else if(pc.ass.looseness() >= 4) output("gaped-out slut-hole");
	else if(pc.ass.looseness() >= 2) output("flexible little asshole");
	else output("tight little asshole. Somebody’s gotta break it in");
	output(".”</i>");
	output("\n\nKally’s hands join her sister’s in fondling you, ");
	if(pc.biggestTitSize() < 1)
	{
		output("running over your ");
		if(!pc.isChestExposed()) output("increasingly ");
		output("bare chest, admiring the shape of it. She pauses to tweak your [pc.nipples]");
		if(pc.hasDickNipples()) output(" and giggles when she feels the hardness contained within.");
		else if(pc.hasNippleCunts()) output(" and giggles when the shock of sensation from the concealed cunts sends you staggering.");
		else if(pc.canMilkSquirt()) output(" and giggles when a squirt of [pc.milk] hits her.");
		else output(" and giggles when you twist in her grip, stuck on the edge between pleasure and pain.");
	}
	else
	{
		output("squeezing your ");
		if(!pc.isChestExposed()) output("increasingly ");
		output("bare chest. The supple pads of her fingers feel nice as she gently gropes and hefts you, admiring the exquisitely soft tissues of your mounds even as her roving digits press down on the sensitive flesh of your [pc.nipples]. She nuzzles in between them, eyes glittering happily.");
		output("\n\nHer cock glitters too - from a coating of leaking pre-cum.");
	}
	output("\n\n<i>“Go ahead,”</i> Kiro urges. <i>“Fuck [pc.name]. Take [pc.hisHer] pussy.”</i> She reaches around and, finding your lips, spreads them wide for Kally. <i>“[pc.HeShe] is begging for it. Look at [pc.hisHer] face!”</i>");
	output("\n\nYou’re not making any face... until Kiro finds [pc.oneClit] to rub. Then your mouth falls open, and you grind yourself against the chubby sister, pressing your weeping slit against her inhuman tool. The cocky pirate lets you go before you crush her hand between your pelvises, its mission accomplished.");
	output("\n\nKally’s eyes widen as she takes in the sight of you. Her fingers tighten reflexively against your [pc.chest], almost painfully so. <i>“All right then. You asked for this...”</i>");
	processTime(10);
	pc.changeLust(25);
	clearMenu();
	addButton(0,"Next",kiroKallyDoubleTeamPCCauseShesABigFutaSlutLoverYeahThatsWhatFenLikesToWriteBecauseHeHasShitTaste2);
}
public function kiroKallyDoubleTeamPCCauseShesABigFutaSlutLoverYeahThatsWhatFenLikesToWriteBecauseHeHasShitTaste2():void
{
	clearOutput();
	showKallyAndKiro(true);
	output("Kally’s blunt tip nudges into your folds, pausing as its owner gets situated. She shifts around a few times, feeling for the optimal angle. Once, she brushes against [pc.oneClit]. You whimper meaningfully, and the hermaphroditic alien takes that as the signal to proceed. Her bulging, horse-like dick barrels right into your passage");
	var x:int = rand(pc.totalVaginas());
	if(pc.vaginalCapacity(x) < kally.cockVolume(0) * 0.5) output(", splitting you almost painfully wide open. You wince from the thick member’s onslaught, but that pain soon turns to pleasure.");
	else if(pc.vaginalCapacity(x) < kally.cockVolume(0) * 2) output(", delivering a sense of exquisite relief the moment it spreads you open, perfectly filling that sense of vacuous need. Kally is just the right size to please you. Not so big as to leave you aching and not so small as to leave you wanting for more.");
	else output(", able to slither in without a single mote of discomfort. Your swelling lady-lips wrap around it with almost too much ease. Your entrance is all but made to please enormous monster-pricks. Kally’s more modest horse-dick could never fill it entirely, no matter how eagerly she smashes it against your tingling loins.");
	output(" The self-lubricating length doesn’t even need your [pc.vagina " + x + "] to juice itself - the lucky girl-cock exudes so much slick pre that your folds are all but bathed in it by the end of the first stroke.");

	//Kally cuntchange
	pc.cuntChange(x,kally.cockVolume(0));

	output("\n\nKiro stops Kally by wrapping her tail around the back of you and pinning her inside.");
	output("\n\nThe chubby bartender groans and whines, <i>“Hey, don’t cock-block me...”</i>");
	output("\n\n<i>“Just because you wasted your teen years making yourself as pent-up as possible doesn’t mean you need to hump every hole like a horny teenager.”</i> Kiro grabs her sister by the hips, using her to pull herself into position behind you. <i>“Let me get in there before you start humping away like some stupid ausar slutpuppy in heat.”</i>");
	output("\n\nYou feel Kally’s dick throb inside you with each degrading thing her sister says, especially when she mentions slutpuppies in heat, but you don’t have a chance to comment on it. Kiro’s member, much larger than the one dick-deep in your [pc.vagina " + x + "] has announced its presence to your [pc.asshole] with a sloppy, pre-laden kiss.");
	if(flags["BUTTSLUTINATOR"] != undefined) output(" You’re so glad you got to spend time in the buttsluttinator, giving yourself the kind of ass that needs a dick like that inside of it. You clench just thinking about it.");
	else if(pc.ass.looseness() >= 4 || pc.analCapacity() >= 800) output(" You’re utterly grateful to have such a wonderfully capacious, well-trained anus.");
	else if(pc.analCapacity() >= 200) output(" You’re almost concerned about fitting it inside. You just aren’t as well-trained back there as you could be, but you’ll make it fit.");
	else 
	{
		output(" You’re a little scared at taking such a huge thing in your tight hole. Your ass clenches from the thought alone.");
		output("\n\nThe sound of Kiro squirting something all over her dick can be heard from behind. Lube? She’s already soaked. Maybe it’s something that’ll help you stretch wide enough to take it... ");
	}
	output("\n\n<i>“Relax,”</i> Kiro commands with an unsubtle slap to your [pc.butt]. <i>“Or brace yourself, if you want to make this a challenge for me. Either way my dick is gonna bend you into shape.”</i>");
	output("\n\nYou do your best, but there’s no preparing for Kiro’s enormous dickhead. It presses against you");

	if(pc.ass.looseness() >= 4 || pc.analCapacity() >= 800) output(", catching for a moment on the edge of your ring before the lubed up bitch-breaker has its way with your intestinal tract");
	else output(", pushing harder and harder by the second. She rocks her hips back and forth, each time forcing you a little wider, your ring a little more open. At last, you feel something inside you give, and the herm burrows deep into your intestinal tract");
	output(". It’s an incredible sensation, feeling that column of hot, dripping fuck-meat sliding deeper into you by the second, pinning some of your most sensitive nerves against another dick less than a quarter inch away.");
	if(pc.hasCock())
	{
		output(" Your own [pc.cocksLight]");
		if(pc.cockTotal() == 1) output(" jerks and spurts");
		else output(" jerk and spurt");
		output(" a fickle spray of [pc.cum] into Kally’s tits the moment she passes by your prostate. There’s not enough room inside you for all the seminal fluid and the two enormous herm-dicks!");
	}
	//Kiro buttchange
	pc.buttChange(kiro.cockVolume(0));
	output("\n\nKally thrusts again, even though she has nowhere to go, squeezing ");
	if(pc.hasCock()) output("your prostate between the sisters’ shafts");
	else output("the sisters’ shafts as tightly together as she can");
	output(". <i>“Is that... your dick, Kiro?”</i> She twitches her hips, still pinned by Kiro’s tail, trying to create some friction, anything to soothe her own pent-up needs.");
	output("\n\nKiro shifts to grab you under the armpits, pinning you in place, your back arched to press your [pc.vagina " + x + "] into her sister’s fat, equine fuckstick. <i>“Yeah that’s me.”</i> Another three or four inches of her seemingly endless cock slide into you, rearranging your abdomen to make room. <i>“And that’s still me.”</i>");
	output("\n\nMoaning, Kally leans ");
	if(pc.tallness >= kally.tallness + 6) output("up");
	else if(pc.tallness >= kally.tallness - 6) output("forward");
	else output("down");
	output(" to kiss you, at first gently, but increasingly frenetically as the seconds pass. She stuffs her tongue past your [pc.lipsChaste] hungrily, forcing you to return the feverish french before she starts slobbering her way down your throat.");
	output("\n\nAny coordination falls apart the moment Kiro bottoms out inside you, replaced with your own raw passion, amplified by the feeling of being taken in two sensitive holes simultaneously, pinned between two hyper-sexed kui-tan who may as well be in a permanent state of rut. The restraining tail uncurls from the cushy bartender, allowing her to begin fucking you in earnest. She doesn’t waste a second. Still kissing you, her thighs jackhammer back and forth, thrusting into you so hard that her crotch audibly claps into yours, followed a quarter second later by her jiggly butt-cheeks wobbling together with thunderous force.");
	output("\n\n<i>“It’s like your milker, and we’re frotting, and I’m gonna stuff [pc.name] full, and you’re right there,”</i> Kally babbles, thrusting in so hard that her sheath bunches up against your [pc.clits] and juices splatter out in a cock-shaped arc. <i>“Come on Kiro! Start thrusting! I wanna grind on youuuuuu~!”</i> She goes right back to planting kisses all over your face and licking your jaw, heedless of her own animalistic affections.");
	output("\n\nDeep inside you, you feel her starting to flare, just a little bit.");
	output("\n\nKiro chuckles and draws herself halfway out, sure to keep it angled to press against her incestuous sister through the lining of your anus. Then, she slams herself back in, aided by her own sensuous leakings. She bathes every wrinkle and bend in your back door in wet-hot kui-tan cream, all before she orgasms; a girl as productive as her can leave you feeling creampied after a few dozen thrusts, to say nothing of what happens when she finally does go off.");
	processTime(20);
	pc.changeLust(80);
	clearMenu();
	addButton(0,"Next",kiroKallyDoubleTeamPCCauseShesABigFutaSlutLoverYeahThatsWhatFenLikesToWriteBecauseHeHasShitTaste3,x);
}

public function kiroKallyDoubleTeamPCCauseShesABigFutaSlutLoverYeahThatsWhatFenLikesToWriteBecauseHeHasShitTaste3(x:int):void
{
	clearOutput();
	showKallyAndKiro(true);
	output("Together, the tanuki sisters take you from each end, one dick in each end of you sawing in and out, kissing somewhere in the middle. Their thick veins pulse and throb along with their fluttering hearts, letting you feel every quiver of ecstasy that rockets through their shafts. You feel more sex-toy than [pc.manWoman], bombarded with too much delicious pleasure to do much more than wriggle and clench. You’re lifted clean off your [pc.feet], which is fine, you figure. Your [pc.feet] ");
	if(pc.legCount == 1) output("was");
	else output("were");
	output(" just twitching and jerking anyway.");
	output("\n\n<i>“You - ungh! - you okay, [pc.name]?”</i> Kiro asks, a note of concern in her voice. Her hips feel like they’re starting to pound into you even harder, like she’s getting off on the idea of fucking the sense right out of your silly little head.");
	output("\n\nKally’s still trying to fuck you raw, make out with you, and grope the closest available surface all at once, so it’s a wonder that you manage to respond at all.");
	output("\n\n<i>“Yeah...”</i> Both dicks slip in at the same time, hard. The fat flares alternate pulsating, thickening together. <i>“Yes!");
	if(!pc.isBimbo()) output(" Definitely yes! Don’t stop!”</i>");
	else output(" Def... uhh - Yes! More! Fuck my mouth too, Kally!”</i>");
	output("\n\nTheir paws switch grip to holding onto each others asses, and the lusty tanuki-women instinctively fall into a perfectly synchronised rhythm. Not even a decade light-years apart can erase the sisters’ shared history, the deep and intimate knowledge of one another that can only come from years of cohabitation. It becomes impossible to pick apart the individual sensations. You’re only aware of hot, hard lengths thrusting into you, folds flattened by obscenely swollen dickheads. Juices dribble and squirt, sloshing around in your deepest recesses. Sweaty, pre-drenched nutsacks slip and slide against one another");
	if(pc.balls > 0 && pc.ballDiameter() >= 6) output(" and your own");
	output(". And all over, you feel the silky-soft fur sliding over your [pc.skinFurScales], the press of two warm, lusty forms turning you into a Steele-sandwich.");
	output("\n\nKiro shudders once, nearly falling of sync. <i>“Y-you gonna cum soon, Kally?”</i> A thick spurt of juice ");
	if(pc.hasCock()) output("hoses down your halfway flattened prostate");
	else output("sprays deep inside you");
	output(". <i>“How is [pc.name] always better than I think [pc.heShe]’d be? Oh </i>staaars<i>! I think I need to... need to cum...”</i> Kiro’s voice trails off. Then, out of nowhere, she bites your neck hard, her cock flaring hard inside you.");
	output("\n\nKally, on being talked to, seems to gain a measure of control over her tongue - but not her voice. Her voice pitches upward, shifted higher with every flutter of pussy-muscle around her aching rod. <i>“Oh please... please tell me I can cum.”</i> She kisses the other side of your neck. <i>“Kiro, can I cum in [pc.himHer]?”</i> She doesn’t even think to ask you");
	if(pc.isBimbo()) output(", which is fine, because you’re so blissed out that the only thing your brain seems capable of thinking about is the shape of cocks, and where you could fit more of them. Your fingers twitch, and you briefly wish the girls had extra horse-cocks for you stroke, to coat your fingers with their rich, buttery lust.");
	else output(", which is probably for the best, considering the state you’re in. It’s hard to summon up much more than gleeful cries of ‘yes’ and ‘so good’!");
	output("\n\n<i>“Let’s do it, sis!”</i> Kiro calls. So much pre shoots off in your asshole that you’d think it was cum, were it anyone else. <i>“Three!”</i> They thrust hard enough to bounce you in the air, catching you on the squelching slide down their doubled-up dicks. <i>“Two!”</i> Kally whimpers and flares, her thrusts faltering. Kiro pushes hard enough to nearly topple the three of you over, but the quivering bartender catches up at the last second. <i>“One!”</i> Their rhythm breaks apart as they near their peaks. Instead of big, confident strokes, they bottom out and make tiny, shuddering, micro-thrusts, determined to keep as much of you wrapped around their turgid poles as possible.");
	output("\n\n<i>“Cuuuuuum!”</i> Kiro moans, giving in to her own command the moment it leaves her mouth. Your [pc.vagina " + x + "] and [pc.asshole] stretch the moment the lusty raccoon-girls’ urethras distend with seed, pushing you beyond any hope of restraint. You throw your head back and give in, fluttering around the delicious, animalistic members, your pleasure climbing higher and higher and higher. The moment that heavenly wetness explodes inside you - from both sides - every muscle in your body goes taut, your nerves overloaded. It’s like despite the rough fucking, despite the gallons of seed spreading inside you, you feel like you can perceive every single sperm wriggling against your walls, complimenting you on a job well done.");
	output("\n\nAnd there’s so much cum! It never seems to stop. Not when it’s slopping out between your legs, drenching Kiro and Kally from the waist down. Not when your gut audibly churns with cream filling, distending your belly as it floods up into your stomach. The alabaster delight pours in in an endless river, sliding up your channel");
	if(!pc.isPregnant(x)) output(" and into your womb. You feel it settle inside your uterus, the heavy, liquid pleasure rolling around as it transforms you into a vessel for spunk. And through it all, you can feel her flare, so swollen, so completely overtaken by orgasm, that it has expanded to the point that it forms a clear outline on your expanded middle.");
	else output(" all the way to your blocked-off womb. You feel it strain you mightily, then vent back out, the rushing fluids only serving to coax Kally to cum that much harder, her flare wide enough to make an imprint on the surface of your fluid-filled midsection.");
	output("\n\nThe sisters climax for so long (and so messily) that you reach two more pussy-shattering climaxes by the time they finish. And even then, just feeling that hot, kui-tan goo sliding out of you is enough to make you whimper and quiver all over again.");
	//Loads in holes, go!
	processTime(25);
	pc.loadInAss(kiro);
	pc.loadInCunt(kally,x);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",kiroKallyDoubleTeamPCCauseShesABigFutaSlutLoverYeahThatsWhatFenLikesToWriteBecauseHeHasShitTaste4,x);
}

//[Next]
public function kiroKallyDoubleTeamPCCauseShesABigFutaSlutLoverYeahThatsWhatFenLikesToWriteBecauseHeHasShitTaste4(x:int):void
{
	clearOutput();
	showKallyAndKiro();
	output("After an indeterminate amount of time, you awake in Kiro’s bed, the sisters on either side of you. They’re both cuddling in, rubbing their hands over the jizz-inflated dome of your belly, sometimes reaching across to fondle the other’s length.");
	output("\n\n<i>“How was that?”</i> Kally asks, looking very relieved.");
	output("\n\nKiro retorts, <i>“Mind-blowing, I’m sure.”</i> She nips your [pc.ear] and springs up out of a very messy-looking bed.");
	output("\n\nYou open your mouth only to release a massive, cum-flavored belch. Sheepishly, you decide a nod will work better.");
	output("\n\n<i>“Good,”</i> Kally seems relieved. <i>“I wasn’t sure you’d be okay, all swollen like that.”</i> She kisses your tummy, then gives it one last rub. <i>“Why don’t you relax until that gets small enough for you to walk. I’ve got to head back to work.”</i>");
	output("\n\nYou try to sit up, but only manage to release another jizz-flavored burp in the process. Gallons of the sister-spunk feel like they’re leaking out of you, but your belly is still so big!");
	output("\n\nLooks like you’ll have to wait...");
	//[Next]
	processTime(30);
	clearMenu();
	addButton(0,"Next",kiroKallyDoubleTeamPCCauseShesABigFutaSlutLoverYeahThatsWhatFenLikesToWriteBecauseHeHasShitTaste5);
}

public function kiroKallyDoubleTeamPCCauseShesABigFutaSlutLoverYeahThatsWhatFenLikesToWriteBecauseHeHasShitTaste5():void
{
	clearOutput();
	showName("WALK\nOF SHAME");
	showBust("");
	output("You wobble back to " + (!kiroIsCrew() ? "the bar":"your ship") + " a brief while later, pregnant with cum, but no longer immobilized.");
	kiroKallyThreesomes(1);
	if(flags["KIRO_KALLY_EMAIL"] == undefined && flags["KIRO_3SOME_REACTION"] != -1) flags["KIRO_KALLY_EMAIL"] = GetGameTimestamp();
	//[Next] - end :3
	clearMenu();
	if(!kiroIsCrew()) addButton(0,"Next",move,"CANADA5");
	else addButton(0,"Next",enterShip);
}

public function examineKirosCodex():void
{
	clearOutput();
	showName("\nCODEX");
	output("You scoop up her KihaCorp SS7 Comm, delighted to discover that it isn’t even locked. She was in the middle of a rather racy exchange with");
	
	if(pennyIsCumSlut() && rand(3) == 0) output(" - is that Penny? You peer closer for a better look at the genitally-augmented fox. A holo-preview of her bobbing up and down on her bestial rod loops hypnotically.");
	else if(rand(2) == 0) output(" a gryvain. Nearly a dozens of slutty exhortations to milk out an enormous load are marked as <i>“read”</i> on the log.");
	else output(" a cute (if flat-chested) ausar. A new message pops up showing off a pussy gaped around a toy’s enormously inflated knot.");
	if(timesGloryholesUsed() > 0 || timesGloryholesWorked() > 0) output(" No wonder Kiro ran for the gloryholes.");
	else output(" No wonder Kiro ran off. She’s probably jacking off a big enough load to clog a taur-sized toilet.");

	output("\n\n");
	showImage("KiroLowPOV");
	output("Fourteen different varieties of dick-pics are queued up in the selector, some drizzled in enough ‘nuki-jizz to look more like a frosted dessert than a blunt-headed tool. Kiro seems to have forgotten to hit ‘send’ before prancing off for some release.");
	output("\n\nYou could be a total pal and send the meticulously holo-documented wangs off to their intended recipient... or you could have some fun by changing the address to an unintended third party... like Kally.");
	if(kiroKallyThreesomeUnlockPoints() < 3) output(" That’d be a total dick move, though.");
	else output(" That might be just what they need to finally break the sexual tension between them. It’s thick enough that you’d need a plasma torch and a few hours to cut through it.");
	output(" Or you could just go back to what you were doing. No point in tooling around with Kiro’s love life");
	processTime(1);
	//[Send] [Send Kally] [Neither]
	clearMenu();

	addButton(0,"Send",sendKirosNudesToHerFuckbro,undefined,"Send","Go ahead and send the nudes. Maybe she changed her mind about sending them before she left, but you have a hunch both parties will appreciate you pressing the button.");
	addButton(1,"Send 2 Kally",sendKirosNudesToKally,undefined,"Send 2 Kally","Surely Kally can appreciate Kiro’s fine form in the buff. Maybe it’ll even spark something between them?");
	addButton(2,"Neither",fuckThisShitImOutKiroKally,undefined,"Neither","Leave the codex. It’s not your problem.");
}

//[Send]
public function sendKirosNudesToHerFuckbro():void
{
	clearOutput();
	showName("HELPING\nOUT");
	output("With a bit of a chuckle, you hit the button to send off the pictures and swagger back to your table before the lusty pirate catches you messing with her comm. A wingman’s job is never done!");
	flags["KIRO_PHONE_EVENT"] = 1;
	pc.addMischievous(4);
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Send Kally]
public function sendKirosNudesToKally():void
{
	clearOutput();
	showKally();
	showName("MATCH-\nMAKER!");
	output("You make a few choice edits to the address field, and voila! You hear a chime from across the bar as you retreat to your seat.");
	output("\n\nKally, oblivious to your subterfuge, reaches under the counter to procure her codex. Her fuzzy digits flit across the screen, then jerk to a stop. The kui-tan’s entire body tenses like a taut wire. She bites one cushy lower lip, then slowly - ever so slowly - the corners of her mouth rise in a smile. The chubby raccoon-girl’s tail swishes back and forth fast enough to create a breeze, her fingers nimbly pirouetting over the display as she crafts a response. You pretend to mind your own business when she does a quick scan of the room, turning your attention back to her just in time to see her take the Codex below the bar - and lift the hem of her skirt.");
	output("\n\nKiro’s comm buzzes. Then it buzzes again. Kally sighs happily and bends over, tail upraised high enough that you can easily make out the wet lips of her pussy - and the rivulets of moisture traveling down her balls. When she comes back up, she’s breathing heavily and her computer is safely stowed.");
	flags["KIRO_PHONE_EVENT"] = 2;
	processTime(5);
	clearMenu();
	addButton(0,"Next",sendKirosNudesToKally2);
}

public function sendKirosNudesToKally2():void
{
	clearOutput();
	showKallyAndKiro();
	output("Kiro emerges from the bathroom, with nicely drained balls, and a confident swagger in her step. A frown clouds her face when she sees her comm sitting unattended on the table, like she can’t believe she just left it sitting out. She shakes her head and sits down, grabbing the petite device in one paw and thumbing through her new messages.");
	output("\n\nHer gasp is loud enough to draw the attention of every patron in the room, and if that wasn’t bad enough, her recently emptied dick is quite visibly pushing out of its sheath, making it quite clear just what kind of missive the lusty raccoon-girl received. She whimpers and looks to the bar, to her sister Kally, then back at the phone.");
	output("\n\nKally winks, and Kiro looks like she’s ready to faint. A few seconds later, she winks back, as if she totally meant to send her sibling more than a dozen pictures of her own throbbing hardness. Her dick throbs mightily beneath her dress. If she’s not careful, it’ll rip right through.");
	output("\n\nSomewhere beneath two sets of brown-furred cheeks, you’re sure epic blushes are brewing.");
	if(kiroKallyThreesomeUnlockPoints() >= 3) output(" They’re definitely ready for a threesome. You just need something to push them into actual action.");
	else output(" There’s definitely a spark there, but maybe you need to do a bit more before you can guide them into a threesome.");
	output("\n\nMission accomplished.");
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Neither]
public function fuckThisShitImOutKiroKally():void
{
	clearOutput();
	showName("\nNOPE");
	output("You decide to avoid this interpersonal land-mine and walk away. Still, you keep an eye on it to make sure nobody else takes it.");
	if(pc.isNice()) output(" It’s the nice thing to do.");
	else if(pc.isMischievous()) output(" Pranks are one thing; theft is another.");
	else output(" If anybody is going to fuck with her, it’s gonna be you.");
	flags["KIRO_PHONE_EVENT"] = -1;
	pc.addNice(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Req's hugs fullish balls and dick!
public function kiroAndKallyGoToGetMilkedThreesome():void
{
	clearOutput();
	showKallyAndKiro();
	moveTo(shipLocation);
	author("Sir Fensalot");
	//Milking Parlor Fun~
	if(!kiroIsCrew())
	{
		output("When you look between Kally and Kiro with a flirtatious look in your eyes, the curvy bartender smiles warmly. Her eyes dart between her sister and you, languidly following the exquisitely curved arc of your [pc.sack] before focusing in on Kiro’s well-emptied pouch. <i>“You really ought to take better care of your ");
		if(flags["KIRO_GF"] == 1) output("[pc.boyGirl]");
		output("friend, sis.”</i> Kally produces two plastic to-go cups from beneath the polished counter and starts to fill one from the tap. <i>“If [pc.heShe] swells up any bigger, [pc.heShe]’s liable to pop.”</i>");
	}
	else
	{
		moveTo("CANADA5");
		output("Just as you start to make the suggestion, Kiro grabs you by the arm and tugs you toward the exit. <i>“Come on, Angel. I can tell what you’re wanting, and I have a hunch there’ll be some on-station fun.”</i>");
		output("\n\nAt least the trip is quick.");
		output("\n\nYou breeze into Kally’s bar arm and arm. Kiro quickly flags down her step-sister, who arrives with a knowing smile and two plastic to-go cups. She quickly starts to fill one from the tap below the polished counter. <i>“You really ought to take better care of your " + (flags["KIRO_GF"] == 1 ? "[pc.boyGirl]":"") + "friend, sis. If [pc.heShe] swells up any bigger, [pc.heShe]’s liable to pop.”</i>");
	}
	output("\n\n<i>“That’s what we came to you for,”</i> Kiro says. <i>“I figured you might have a good use for all this stored-up Steele-cream.”</i> She pats your sack as if it was a cherished puppy, finishing with a soft rub.");
	output("\n\nKally smirks while she fills up the second cup. You note the fragrant aroma of Nutty Nookie. <i>“Nah, not personally... but I know a joint a floor down that caters almost exclusively to hyper-swollen kui-tan");
	if(!pc.hasPerk("'Nuki Nuts")) output("... and I guess anybody with more nut than they know what to do with.");
	output(".”</i> She passes one cup to Kiro and flicks a switch on her way around the bar, causing a bright pink hologram to flicker into existence. It reads, ‘Out to Lunch.’");

	//First time
	if(flags["KIRO_KALLY_TEAM_MILKED"] == undefined)
	{
		output("\n\nKiro swishes her drink, eyeballing it suspiciously. <i>“Unless you’ve got a cloaking device in that skirt, I don’t think either of us can fulfill that criteria...”</i>");
		output("\n\n<i>“That’s why I poured us drinks, silly. These are my own private stock, made with a triple-dose of my secret ingredient - modded kui-tan cum. My modded cum, to be precise.”</i> Kally whispers the last part to her sister as she lifts her cup in a mock toast. <i>“By the time we finish these, we’ll be struggling to fit through doorways and begging for release.”</i>");
		output("\n\nLaughing, the lewd law-breaker lifts her boozy vessel to clink it against her sister’s, an act robbed of any class by the cheap plasticy crinkle the cups make on contact. <i>“Please, I figured out your secret ingredient ages ago, but if you wanted me to swallow a load of your jizz, you could have just invited me back to your room.”</i> Staring deeply into her sister’s eyes, Kiro gulps down half of the sperm-infused beverage. She licks her lips and smiles. <i>“Not bad, but next time, you’re drinking my cum.”</i>");
		output("\n\nKally brazenly squeezes the darker-hued tanuki-girl’s crotch while taking her own answering swig. It’s a slower, smaller sip, but still enough to maker her burp when all’s said and done. <i>“Mmm... if you’re not careful you’re going to get stuck in the elevator. Come on.”</i> She grabs her older sister’s free hand and tugs her toward the door. <i>“You too, [pc.name]. Don’t let those nuts slow you down.”</i>");
		output("\n\nKiro hooks her tail around your waist as she’s lead away, taking you with her.");
	}
	//Repeat
	else
	{
		output("\n\nKiro swishes her drink around the cup, regarding it fondly. <i>“I wish I could drink more of this stuff...”</i>");
		output("\n\n<i>“Then it’s a good thing you like to visit my bar, isn’t it?”</i> Kally wraps her arm around her younger sister and clinks her cheap travel cup into Kiro’s. <i>“If you still want more after this little trip, I’ll pour you another - but you’ll have to promise you won’t get in trouble your nuts blow up bigger than your ship.”</i>");
		output("\n\nLaughing, the lewd law-breaker roughly gropes her sister’s pillowy bosoms. <i>“And leave you all alone in here? I don’t think so.”</i> She lifts the cup to her lips and greedily swallows, gulping for three solid seconds before daring to stop. Her tongue flicks out to collect the leftover foam from her lips. <i>“Stars, I need to get you to brew a batch of this with some [pc.name]-spunk and some of mine mixed in, just so you can drink it.”</i>");
		output("\n\nKally whimpers, nipples stiffening, and lifts her own cup to her mouth. She takes a small, shuddering sip, clearly imagining guzzling her sister’s cum-laced beer by the gallon. <i>“Mmm, that sounds nice.”</i> She burps meekly, not even trying to escape Kiro’s callously fondling fingertips. In fact, she leans in closer against the rough-and-tumble pirate, her plush curves wobbling slightly. <i>“We’d better go before we start dragging on the floor again...”</i>");
		output("\n\nTwo poofy, striped tails swing in from other side, pulling you tight to the joint between their asses. <i>“Come on, angel...”</i> Kiro coos. <i>“Let’s go get milked together,”</i> Kally finishes.");
	}
	//[NEXT]
	processTime(10);
	pc.changeLust(15);
	clearMenu();
	addButton(0,"Next",kiroAndKallyGoToGetMilkedThreesome2);
}

public function kiroAndKallyGoToGetMilkedThreesome2():void
{
	moveTo("CANADAELEVATOR");
	
	clearOutput();
	showKallyAndKiro();
	author("Fen’s Horse-Cock");
	output("You’re all but dragged to the elevator by the two handsy kui-tan. In between sips of their semen-laced beverages, they snuggle close to you, trading kisses and hugs. Plush, warm breasts smush against you from the right. Silky fur slides across your [pc.belly] from the left. Below, you can feel the sisters’ swelling sacks reacting to their drinks, roiling with alien virility. In the confined space of the elevator, their murmurs of ardor and desire reverberate against the walls until they seem a single purr of desire.");

	//Repeat
	if(flags["KIRO_KALLY_TEAM_MILKED"] != undefined)
	{
		output("\n\n<i>“You know, we could’ve waited to drink these until </i>after<i> we got there,”</i> Kiro points out, groaning and shifting to make room for nuts that could easily be mistaken for a pair of cantaloupes.");
		output("\n\nKally caresses one slowly, adoringly. She takes a huge swig of her drink, then staggers back as her own sack pulses with fresh volume, peaking below the hem of her skirt. <i>“But then I wouldn’t get to see you, the great Kiro Tamahime, get all horny, and slutty, and needy just because her balls are dragging on the floor and her dick is leaking so much pre-cum that her dress turns see-through. Oh... oh... stars...”</i>");
		output("\n\nGrinning from ear to ear, Kiro takes an answering drink, swallowing for a solid three seconds. When she lowers it, her nipples are as stiff and prominent through her dress as they can possibly be. What’s more, it looks like she’s trying to smuggle a solid marble column around in the middle of the aforementioned garment. <i>“[pc.name]... you’re going to have to make sure we make it to the Spunk Bunker.”</i> She shivers, nutsack creeping past the halfway point of her thighs. <i>“Because apparently we both think it’s fun to try to get all cum-drunk on the long walk over.”</i>");
		output("\n\n");
		output("They finish their cups together, two sets of ink-black lips smiling sensuously, dotted with amber foam. Like two oppositely charged magnets, they sweep into each other’s arms, kissing fervently, tails and hips wiggling. Kiro reaches out to pull you into the mix. Her pupils are dilated from arousal, and when you turn to Kally, hers are a perfect match. Three sets of lips mash together for one heedless kiss, one set slipping on another while a third is forced to the side for a moment before plunging back in. A tangle of tongues slide and wriggle into a slutty coil in the middle, sloppy and wet.");
		output("\n\nThe elevator dings, and you reluctantly pull yourself away, a dizzyingly randy kui-tan under each arm.");
	}
	//First time
	else
	{
		output("\n\n<i>“So where are we going?”</i> Kiro asks, groaning and shifting to make room for a pair of nuts suddenly the size of cantaloupes.");
		output("\n\nKally caresses one slowly, adoringly. She sips her drink to buy herself more time for ball fondling. <i>“To the Spunk Bunker.”</i> She squeezes, then shudders and wobbles as her own testes experience a sudden surge of growth. The swell of her fuzzy pouch peeks under the hem of her skirt. <i>“It’s a... a... mmm... a specialty parlor for protein scavenging life forms - galotians, rahn, and the like.”</i>");
		//Bimbo
		if(pc.isBimbo()) 
		{
			output("\n\n<i>“But... ummm...”</i> It’s hard to think with these two delicious hermaphrodites so close and yet so torturously unfucked. You rub your [pc.butt] into Kiro’s bulge and grab hold of Kally’s skirt-shrouded rod for support. <i>“Aren’t we like, getting rid of cum?”</i>");
			output("\n\nKiro grabs you by the elbows and presses her dick harder against you, empty cup discarded. <i>“They... mmm...”</i> Her hips shiver, and she gives up on talking to kiss your neck.");
			output("\n\n<i>“They offer the best, most efficient milking on station, so long as you don’t mind them serving your spunk as the main course...”</i> Kally presses into you from the front, tail wiggling behind. The kui-tan sisters’ nuts sandwich yours in the middle, hot, heavy, and more than a little sweaty with excitement. <i>“You don’t mind feeding a few hundred sexy goo-girls, do you?”</i>");
			output("\n\nThat sounds like the next best thing to getting to fuck them all yourself. You nod eagerly, and the elevator dings.");
		}
		//Bro
		else if(pc.isBro())
		{
			output("\n\n<i>“Whoah.”</i> You put up your hand warningly. You don’t recall agreeing to go guzzle jizz with a bunch of galotians.");
			output("\n\nKiro smirks and takes your hand, guiding it to her heaving chest. She’s breathing fast, her heart thudding heavily behind her lovely tits. <i>“We aren’t going there to eat, angel.”</i> You slip a finger into her dress and pinch the wriggling raccoon’s nipple until she’s whining in eager delight. Her hips shiver with barely repressed passion. <i>“We’re going there to... to...”</i> She can’t finish her sentence any more than you can stop yourself from hungrily groping her.");
			output("\n\n<i>“We’re going to get milked, and the Bunker is going to sell every drop it can wring out of the three of us... and they’re even better at it than you... or Kiro’s milker.”</i> Kally presses into her step-sibling hard enough to make the younger sister’s bloating balls bounce against your own expansive cum-reserves. <i>“That sound more your speed?”</i>");
			output("\n\nTheir words sound fantastic, and the pheromones they’re putting out smell even better - like a kennel full of kui-tan breeders in heat. <i>“Yes.”</i> You breathe deep. Every breath is more laden with chemical signals of desire than the one before, more decadent and sensuous. Part of you wants to keep them in the elevator to play with, just to see how strong their musk will get.");
			output("\n\nThe elevator dings.");
		}
		//Neither
		else
		{
			output("\n\nYou and Kiro look at each other and smile, realizing exactly who is going to be providing the next week’s worth of drinks for this establishment. The tanuki-girl is a little too busy groaning and wiggling beneath her sister’s talented fingertips to comment, leaving you to answer. <i>“And they pay for cum?”</i>");
			output("\n\nShaking her head, the curvaceous bartender tries to gather herself. <i>“No... they don’t pay for cum. They just don’t charge you for the privilege of using their facility... if you can...”</i> She gasps as Kiro grabs her by the dick and pulls her tight, passionately kissing at the nape of her neck.");
			output("\n\n<i>“If you can produce cum like a pent-up kui-tan?”</i> you supply");
			if(pc.isMischievous()) output(", grinning roguishly");
			output(".");
			output("\n\nKally nods and loops her tail back around you, pulling you in close. <i>“Yeah...”</i> She nips her sister’s ear, then kisses you square on the [pc.lips], tongue probing hungrily. The flavorful residue of her exotic beer lingers on her lips, mixing with her own inhuman taste. Hands explore bodies, caressing soft-furred breasts. Heavy ballsacks slide against one another, lurching with spasms of powerful growth, sloshing as more and more seed pools in the capacitive flesh.");
			output("\n\nThe elevator dings before a full-blown cum-cascading orgy can break out. Very reluctantly, you make a half-assed attempt to make yourselves decent, though there is no covering either sisters’ nuts.");
		}
	}
	processTime(10);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",kiroAndKallyGoToGetMilkedThreesome3);
}

public function kiroAndKallyGoToGetMilkedThreesome3():void
{
	moveTo("SPUNKBUNKERCORRIDOR");
	
	clearOutput();
	showKallyAndKiro();
	author("Fenoxo");
	output("Their beers finished, the sisters stagger out, two increasingly spunk-inflated mynxes who can barely keep their hands off themselves, let alone each other - or you. Kally makes an effort to at least point you on the right path through the station’s winding corridors.");
	if(flags["KIRO_KALLY_TEAM_MILKED"] != undefined) output(" She doesn’t really need to. You’ve been there enough that you know the way by heart, but you appreciate the gesture all the same.");
	output(" Kiro seems past the point of caring, desensitized by a life of lawlessness to the point that the idea of hotdogging herself to orgasm with her sister’s swollen sack in public is a perfectly acceptable way to spend an afternoon.");
	output("\n\nShe tugs sharply at the hem of her tailored dress in a vain attempt to free the turgid length trapped inside, but with her own rock-hard tumescence and taut, revealing clothes work together to keep her trapped for the moment. You watch Kiro wriggle and squirm. At this rate, she isn’t going to make it to the Spunk Bunker. You grab her by the wrist, pulling it away from her crotch, and drag her faster.");
	output("\n\nThis would be easier if you weren’t so turned on, if your [pc.balls] weren’t so egregiously weighed down with cum. Part of you wants to join her.");
	if(pc.exhibitionism() >= 66) output(" A big part of you, if you want to listen to your exhibitionist tendencies.");
	else 
	{
		output(" No amount of rules, regulations, or shame can compete with the aching need swaying ");
		if(pc.legCount > 1) output("between your [pc.legs].");
		else output("below your [pc.cocks].");
	}
	output(" But no matter how badly you may want to drench Kiro’s fluffy fur in a thick layer of [pc.cumNoun], ");
	if(flags["KIRO_KALLY_TEAM_MILKED"] != undefined) output("you know that a far better release is just a short walk away");
	else output("you promised to get the sister’s to the milking parlor, and surely a professional dick-milking place will provide a better, more satisfying cum than an impassioned public rut.");
	output("\n\nAs you round the first corner on your journey, Kally stumbles, taken off balance by her own bow-legged waddle. Her sloshing nuts have grown so large that her knees pinch in on them slightly whenever she tries to step. From the look on her face, it doesn’t hurt. It doesn’t hurt at all. She keeps biting her lip and whimpering in bliss. Sometimes she clenches her thighs, squeezing out a fat blob of pre. Her skirt doesn’t do a thing for her modesty. It’s about as effective at hiding her attributes as a plate glass privacy fence. Everyone you pass can see the plush-bodied kui-tan painting her watermelon-sized nads in glossy cream.");
	output("\n\nKally bats her eyelashes and smiles up at you, taking your hand and laying it against her shaft. The girthy tool is warm to your touch and slicked by its own passionate leakings. It thickens powerfully on contact, lurching upward to nuzzle into your palm.");
	output("\n\n<i>“Mmmm,”</i> the curvy kui-tan coos. <i>“You sure I can’t just slip this inside you on the way over?”</i> She pumps her hips against your hand and discharges a glob of pre hard enough for it to splatter on the floor below.");
	output("\n\nKiro snorts and slaps your ass. <i>“If anybody gets to dump a load in [pc.name], it’s me.”</i>");
	output("\n\nYou ");
	if(pc.isNice()) output("laugh good naturedly. <i>“What kind of friend would I be if I let you make bad decisions while you’re cum-drunk?”</i>");
	else if(pc.isMischievous()) output("smirk playfully. <i>“Who’s to say I don’t just mount you on my dick and swagger down the hall. I bet I could make your belly bigger than your balls by the time we got there.”</i>");
	else output("smirk. <i>“You turn into a real slut when you’re cum-drunk, you know that?”</i>");
	output("\n\nBoth sisters let out breathy giggles at your retort, no doubt imagining a variety of situations where the three of you are jizzing into an even larger variety of each other’s holes. Kiro’s titters are cut short by a sharp, almost pained gasp. Her balls are dangling about halfway down to her shins, the sack stretched taut, little more than shrink-wrapping for the pair of ludicrously virile orbs. She looks to her sister and then to you, eyes wide and pupils dilated wider. <i>“I... need to cum. Can I cum?”</i> She runs a hand through her increasingly slippery crotch-fur, fingertips massaging the tender flesh beneath. <i>“Just a little bit?”</i>");
	processTime(13);
	pc.changeLust(20);
	clearMenu();
	addButton(0,"Next",kiroAndKallyGoToGetMilkedThreesome4);
}

public function kiroAndKallyGoToGetMilkedThreesome4():void
{
	clearOutput();
	showKallyAndKiro(true);
	author("Fenoxo");
	output("Kally reaches across to slap Kiro’s tits. <i>“No! If I can’t... can’t cum... you can’t either!”</i>");
	output("\n\nThe pirate’s cock reacts in typical Kiro fashion: by squirting a torrential volley of pre-spunk in between her tits. The trapped horse-cock’s flare is easily visible, jutting from the middle of her cleavage, and it gets more visible with every passing second. The upper portions of her dress become quite transparent once suitably soaked, displaying rich chocolate nipples and pebbly equine flare with equal ease. The sex-addicted tanuki-girl rubs at her sore boob. Her juices squish around so loudly that you wonder if they can hear it from inside a nearby shop. Hell, there’s a visible lake of the stuff, trapped between tits and tool, and it’s only getting bigger. Soon it’s going to spill out over Kiro’s plunging neckline.");
	output("\n\nYou pity the poor station janitor.");
	output("\n\n<i>“Bitchy Ice Queen,”</i> Kiro whimpers, stealing glances at Kally’s nuts as she stumbles on. Both sisters are still growing, both in size and eagerness. If they aren’t careful, they just barely touch the station’s smooth deckplates. The older sibling’s directions are hard to understand with all the ecstatic sighs and <i>‘fuck’</i>s she interrupts herself with, but it sounds like you’re closing in your destination. Good thing, too. If you the trip took too much longer, you’d have to drag the kui-tan along on their beanbag chair-sized nads. In four or five minutes, their feet wouldn’t touch the ground.");
	output("\n\nOne thing becomes clear as you close in on the neon-lit “Spunk Bunker” sign: the more over-sized the girls’ nuts get, the more deferential to your opinion they become. Neither seems the least offended by your casual guidance, nor by their sibling’s biting criticisms. Kally rolls her hips against your own and never stops trying to entice you into giving her a handjob. Kiro is just as bad and twice as wanton, grinding herself against you from the other side, letting the pre-spunk spill down your side so that she can hump you all the easier. She grouses when you spin her forward, making her push her bloated ballsack through the door on her tippy toes, but her protest seems half-hearted, like she does so more out of habit than genuine feeling. She’s just happy you’re paying attention.");
	//Nuki nutted up yourself
	if(pc.hasStatusEffect("Egregiously Endowed") || pc.hasStatusEffect("Ludicrously Endowed") || pc.hasStatusEffect("Overwhelmingly Endowed"))
	{
		output("\n\nYou know exactly how they feel. When your balls get this swollen, it’s so hard to think straight. All you want to do is cum and cum any way you can, but it’s so hard to remember that you can masturbate it all out yourself when there’s someone else around. If you hadn’t had the time to get used to being in this state, you’d probably be on the floor right now, dick-deep in one of the sisters and bathing her womb in so much [pc.cumVisc] [pc.cumNoun] that you pump her up like an inflatable mattress. You’d fuck in public. You’d fuck on the floor. Hell, you’d lick Kiro’s asshole if it meant getting to cum.");
	}
	//Bro
	else if(pc.isBro())
	{
		output("\n\nFuckin’ silly skanks. A little bit of jizz in their drinks and they turn into submissive whores. They’ll do whatever you say. They don’t fuckin’ care as long as long as you keep touching them, keep instructing them, and keep promising that they’re going to have the best orgasm of their lives. You wonder how long you could keep them like that, pent up and needful, always thinking that relief is right around the corner when in reality you just want to see how big their balls will swell.");
	}
	//Bimbo
	else if(pc.isBimbo())
	{
		output("\n\nOmigosh, they’re so cute like this! It’s like they’ve gone a little bit bimbo themselves, all horny and vapid and just aching for someone to strum on their little clitties on give those enormous, horsey fucksticks of theirs a nice, wet suck. That someone could be you, but you prooooomised you’d get them milked at this weird store for some reason. It had better be awesome, because these adorable raccoon-girls deserve the biggest, messiest climax possible. Your mouth waters at the thought, and you belatedly wonder if they’ll let you lick whatever equipment they use clean.");
	}
	//Else
	else output("\n\nIt must be a quirk of kui-tan physiology. After they get to a certain amount of need, they become submissive rather than aggressive, attempting to entice others to give them relief rather than forcing the issue themselves. You briefly wonder if it was an evolutionary adaptation to prevent instances of rape or lucky happenstance. Either way, Kiro and Kally are definitely sinking deep into submission, submerging their egos beneath the tide of spunky ardor. It’s a little worrisome but cute in its own way. You know as soon as they get some relief, they’ll be back to their sassy selves. You may as well enjoy the attention while they’re so uninhibited.");
	//Merge
	output("\n\n<i>“Spunk-slut,”</i> Kally belatedly retorts, stumbling in the door after Kiro, her balls audibly dragging on the ground behind her. <i>“She’d probably suck me off if you told her to. Mmmm, I bet she’d probably leak a few gallons in the process.”</i> Her dick is dribbling steadily now, but you’re inside the Spunk Bunker now - you can get these girls (as well as yourself) some relief.");
	processTime(7);
	pc.changeLust(10);
	//[Next]
	clearMenu();
	addButton(0,"Next",kiroAndKallyGoToGetMilkedThreesome5);
}

public function kiroAndKallyGoToGetMilkedThreesome5():void
{
	moveTo("SPUNKBUNKER");
	
	clearOutput();
	showKallyAndKiroAndVixette(true);
	author("Fenoxo");
	output("The inside of the Spunk Bunker is underwhelming. There’s no neon lights at the door. There was barely a sign. Hell, you don’t even see any patrons. It’s just a small, sterile-looking room, covered from floor to ceiling in a material that reminds you vaguely of white latex. A matte black desk hovers a few feet off the floor, and behind it stands a high-grade sex-bot, complete with enormous breasts and hyper-sexualized parody of a vixen’s muzzle.");
	if(flags["KIRO_KALLY_TEAM_MILKED"] != undefined) output(" You swear she licks her glistening, artificial lips at the sight of your party. Vixette seems hungry.");
	else if(flags["MET_GIANNA"] != undefined) output(" Maybe an anthropomorphic companion android. One of Gianna’s cousins?");
	else if(flags["MET_BESS"] != undefined) output(" Maybe a distant relative of [bess.name].");
	else if(flags["MET_SEXBOTS_ON_TARKUS"] != undefined) output(" Hopefully she doesn’t malfunction like the ones on Tarkus.");
	else output(" Like a more advanced, more perverted version of a V-Ko. Okay, maybe the only thing they have in common is both being robot women, but it reminds you all the same.");

	//First time
	if(flags["KIRO_KALLY_TEAM_MILKED"] == undefined) 
	{
		output("\n\n<i>“Hello Mistress Kally,”</i> the shapely android chirps. <i>“I see you’ve brought two wonderfully... exquisitely... scrumptious looking friends.”</i> She licks her lips, revealing a long purple tongue that glitters like an amethyst serpent in the artificial light. <i>“Are you all here for a milking, or are they just going to help you with your... donation.”</i> A convincingly high-pitched whine escapes her throat.");
		output("\n\n<i>“A milking... please!”</i> Kally cries.");
		output("\n\n<i>“Why couldn’t they have installed my AI core into the milkers?”</i> the slutty robo-vixen sighs forlornly, staring at each of your bulging crotches in turn. <i>“Please tell me you’re all getting milked. Please.”</i>");
		output("\n\nKiro nods, stroking herself. At long last, she finally manages to free her dick from her dress. It glitters with moisture, dripping thick webs of excitement to the floor.");
		output("\n\n<i>“Oh fuck yes. Right this way, please.”</i>");
	}
	//Repeat
	else
	{
		output("\n\n<i>“Hello, Kally, Kiro, and [pc.name],”</i> the shapely android chirps. <i>“Mmm, you look every bit as beautiful and virile as the first day I laid eyes on you three.”</i> She fans herself, amethyst tongue curling out and licking along the length of her vulpine muzzle. <i>“I must admit, I sampled some of your... mmm, product while I was doing some cleaning. Simply exquisite. Kally most of all, of course.”</i> She gazes adoringly in the tanuki’s direction, artificial eyes somehow displaying pure, wanton carnality. <i>“Will you all be getting milked again? It’s free, of course.”</i>");
		output("\n\nKally moans, <i>“Oh god, please. Yes!”</i>");
		output("\n\n<i>“That’s my favorite ‘nuki-slut,”</i> the saucy robo-vixen purrs. <i>“Right this way. We’ll milk out all that yummy cummy for you. Again and again, as many times as it takes.");
		if(silly) output("1000 times, Kally. 1000 years of milking your cum dry. Forever and ever. We’ll be around forever, Kally. Milking your cum for six more seasons, Kally.”</i> She burps. <i>“Kally and Kiro, forever and ever. W-W-W-Dot-F-E-N-O-X-O-Dot-C-O-M forever! Over and over! For every minute and every day!");
		output("”</i>");
	}
	processTime(5);
	pc.changeLust(5);
	//[Next] Ze milking!
	clearMenu();
	addButton(0,"Next",kiroAndKallyGoToGetMilkedThreesome6);
}

public function kiroAndKallyGoToGetMilkedThreesome6():void
{
	clearOutput();
	showKallyAndKiroAndVixette(true);
	author("Fenoxo");
	output("The foxy sexbot opens a hidden door and leads you into a similarly bare side room. Once again, the walls, floor, and ceiling are all a sort of segmented white latex. Easy to clean, and easy to forget about in the throes of passion. Four recessed holes are spaced evenly along the eastern wall. Phosphorescent holograms glow and pulse above them, briefly describing the type of experience they offer. There are other sockets and hatches hidden elsewhere, though they are not offered to you.");
	output("\n\nThe closest one, explained in bright pink, is described as being as tight and as talented as the unholy fusion of a New Texan cow-girl and a horny rahn. The hole is lined with a puffy simulacrum of a slit with the barest hint of a bubble-gum pink interior. It’s soaking wet and smells just as fruity as it looks.");
	output("\n\nThe next hole in the light is framed in bright green lettering, “Kyvaryan Sting-Pleaser.” Smaller text explains that this milker is meant to simulate a semen-harvesting plant from Kyvaria, known for its unique, non-aphrodisiac venom. It causes the unusual experience of ejaculating without orgasm, at least at first. In time, the sensation of expelling large quantities of seed inevitably leads to a proper climax.");
	output("\n\nThird is a yellow proclamation of “Electro-sensory Stim.” The orifice embedded in the wall doesn’t even look like a real pussy, just a narrow slit in a light-blue, rubber-like material. There’s also a warning: <i>“Not to be used by gelatinous life forms.”</i>");
	output("\n\nAnd at the very end of the row is a scarlet sign just begging for you to give it a try: “The Succubus.” There’s no explanation of the mechanism at play, just a liability waiver insisting that the Spunk Bunker is not responsible for any damage to the user’s psyche or genitalia. It goes on to add that they are also not liable for changes to the user’s genome, virility, or personality. Beneath all the glowing warnings is a perfect example of terran pussy, rendered in cute purple. It must be some kind of high grade synthetic skin, because it absolutely looks like the real deal. It’s even wet.");
	output("\n\nThe sex-bot grabs Kally and Kiro by the dicks, pumping their drooling tools with long loving strokes, their goopy pre-seed rolling over her dexterous fingers to splatter on the ground. <i>“You are welcome to choose the hole of your pleasing.”</i> Her eyes flicker, the glowing irises shaping themselves into cutesy little hearts. <i>“Take as much time as you need to decide.”</i> She pulls them together so that she can milk the slick fluids from one sister onto the other. <i>“There is no rush.”</i>");
	output("\n\nThe sisters seem content to enjoy the robotic greeter’s attentions until you make a selection. Which hole will you use?");

	//Bubble-gum pink Rahn/Cow-girl cunt. Sweet and fruity. Strong suction. Makes dick a little bigger.
	//“Kyvaryan Sting-Pleaser.” - Ejaculate from venom BEFORE climax.
	//Blue. Electro-sensory stim with prostate action. Simulates a wide array of sensations before inducing climax via prostate shock. No goos.
	//Purple “The Succubus” - Very ordinary (if high grade pleasure tube) operated by psychic, pleasure-feeding being with access to high grade //pharmaceuticals.
	//KIRO - Scented Lady - pheromones misted in face, inducing faux rut.
	//KALLY - KIRO REPLICA
	processTime(10);
	clearMenu();
	addButton(0,"Neon Pink",rahnMilkerFunTimes,"pink","Neon Pink","As tight and as talented as the unholy fusion of a New Texan cow-girl and a horny rahn. The hole is lined with a puffy simulacrum of a slit with the barest hint of a bubble-gum pink interior. It’s soaking wet and smells just as fruity as it looks.");
	addButton(1,"Sting-Pleaser",rahnMilkerFunTimes,"green","Sting-Pleaser","Simulates a semen-harvesting plant from Kyvaria, known for its unique, non-aphrodisiac venom. It causes the unusual experience of ejaculating without orgasm, at least at first. In time, the sensation of expelling large quantities of seed inevitably leads to a proper climax.");
	if(!pc.isGoo()) addButton(2,"Electro-Sense",rahnMilkerFunTimes,"blue","Electro-Sensory Stim.","The orifice embedded in the wall doesn’t even look like a real pussy, just a narrow slit in a light-blue, rubber-like material. There’s also a warning: <i>“Not to be used by gelatinous life forms.”</i>");
	else addDisabledButton(2,"Electro-Sense","Electro-Sensory Stim.","This is not safe for gelatinous life forms.");
	addButton(3,"Succubus",rahnMilkerFunTimes,"purple","Succubus","There’s no explanation of the mechanism at play, just a liability waiver insisting that the Spunk Bunker is not responsible for any damage to the user’s psyche or genitalia. It goes on to add that they are also not liable for changes to the user’s genome, virility, or personality. Beneath all the glowing warnings is a perfect example of terran pussy, rendered in cute purple. It must be some kind of high grade synthetic skin, because it absolutely looks like the real deal. It’s even wet.");
}

public function pickSpunkBunkerCock():Number
{
	var x:int = 0;
	for(x = 0; x < pc.cockTotal(); x++)
	{
		if(pc.cocks[x].thickness() >= 1.5 && pc.cocks[x].thickness() < 7) return x;
	}
	return pc.smallestCockIndex();
}

public function rahnMilkerFunTimes(arg:String):void
{
	clearOutput();
	showKallyAndKiroAndVixette(true);
	author("Fenoxo");
	var x:int = pickSpunkBunkerCock();
	var cumQ:Number = pc.cumQ();
	//Rahn cunt
	if(arg == "pink")
	{
		output("You choose the pretty, pink entrance over the technological and biological marvels on offer. ");
		if(!pc.isCrotchExposed()) output("A few quick tugs frees your [pc.cock " + x + "] from confinement. ");
		output("It’s wet, so wet that you can see a few drops of moisture hanging from the entrance. As you near, the opening dilates automatically, the lips blossoming like the petals of a flower. The bubble-gum color fades into a rich vermillion further inside. You can see the walls flex and clench enticingly, beckoning you forward.");
		output("\n\n<i>As if you needed any encouragement.</i>");
		output("\n\nYou");
		if(pc.totalCocks() > 1)
		{
			output(" push your other penis");
			if(pc.cockTotal() > 2) output("es");
			output(" out of the way and");
		}
		output(" gently insert your [pc.cockHead " + x + "] into the candied cunt. It’s surprisingly warm and delightfully slick. Better still is the suction tugging you deeper into its velvet clutches, dragging you through the wonderfully textured walls. Nubs and ripples caress you along the way. That rhythmic, pulsing suction causes more blood to pool in your [pc.cock " + x + "]. It feels bigger and harder than it should be, so girthy that for a moment the tunnel’s enclosure seems claustrophobic. Then you get bigger too, absolutely stuffing the cream-puff cunny with cock.");
	}
	//"Kyvaryan Sting-Pleaser." - Ejaculate from venom BEFORE climax.
	else if(arg == "green")
	{
		output("You choose the green, waxy-looking entrance over the more technological marvels on offer. ");
		if(!pc.isCrotchExposed()) output("A few quick tugs frees your [pc.cock " + x + "] from confinement. ");
		output("As you press against the verdant faux-cunt, you are struck by the texture: it doesn’t feel anything like it looks. It reminds you of a slippery version of felt. You could thrust in with ease, but you take the time to admire the spreading lips. They’re gorgeously ruffled, almost neon green at the fringes but rich emerald on the inside.");
		if(CodexManager.entryUnlocked("Venus Pitchers")) output("\n\nYou are briefly reminded of the venus pitchers of Mhen’ga.");
		else output("\n\nIf fucking plant pussies counted as botany, the galaxy would have a whole lot more scientists.");

		output("\n\nYou");
		if(pc.totalVaginas() > 1)
		{
			output(" push your other penis");
			if(pc.cockTotal() > 1) output("es");
			output(" out of the way and");
		}
		output(" gently insert your [pc.cockHead " + x + "] into the horticultural hole. It’s cool to the touch but delightful low-friction. You slide in without the aid of any juices");
		if(cumQ >= 200) 
		{
			output(", save for your ");
			if(cumQ >= 2000) output("ever-dribbling ");
			output("pre");
		}
		output(". The passage is smooth but tight. You can feel it deform to accommodate your shape with every inch you plunge inside, providing an airtight embrace that feels like it never wants to let you go. The petaly lips cup your [pc.knotOrSheath " + x + "] as soon as you bottom out");
		if(pc.hasKnot(x)) output(", curling around the rounded canine organ");
		output(".");
	}
	//Blue. Electro-sensory stim with prostate action. Simulates a wide array of sensations before inducing climax via prostate shock. No goos.
	else if(arg == "blue")
	{
		output("You choose the innocent-looking blue slit over the more attractive marvels on offer. ");
		if(!pc.isCrotchExposed()) output("A few quick tugs frees your [pc.cock " + x + "] from confinement. ");
		output("As you press against the sapphire fucktube, you are surprised by the basic texture. You’d expect to find something like this for ten credits online, not in a lavish, cum-harvesting facility. A trickle of oily lubricant soaks your questing dicktip at least. The electrodes probably won’t activate until you thrust inside.");
		output("\n\n<i>You’re eager to find out if they can justify the sub-par material.</i>");
		output("\n\nYou");
		if(pc.totalCocks() > 1)
		{
			output(" push your other penis");
			if(pc.totalCocks() > 2) output("es");
			output(" out of the way and");
		}
		output(" gently insert your [pc.cockHead " + x + "] into the rubber twat. It provides a passable sensation - not too hot, not too cold, but still a bit to rigid and unfeeling for your tastes - at first. Then you must trip a sensor or something because your [pc.cock " + x + "] lights up like a christmas tree. Microscopic sparks of electric current sparkle across your [pc.dickColor " + x + "] dickskin, providing a tangled mixture of pleasure and pain that you could study for eons and fail to untangle.");
	}
	//Purple “The Succubus” - Very ordinary (if high grade pleasure tube) operated by psychic, pleasure-feeding being with access to high grade pharmaceuticals.
	else
	{
		output("You choose the devious purple pussy over the other exotic choices on offer. ");
		if(!pc.isCrotchExposed()) output("A few quick tugs frees your [pc.cock " + x + "] from confinement and has it ready to go. ");
		output("The innocuous-looking entrance reacts to your proximity by spreading its lips before you even make content, revealing a pink-tinted interior that seems to wink at you even as its clit engorges. You jerk to a stop at the sight, but the pussy just keeps getting wetter and wetter. The lips visibly puff up. The clit turns a deeper purple, almost black, and grows until it’s nearly an inch long. This sinful slit seems to be doing everything it can to beckon you into its velvety folds.");
		output("\n\n<i>As if you needed any encouragement.</i>");
		output("\n\nYou");
		if(pc.totalCocks() > 1)
		{
			output(" push your other penis");
			if(pc.totalCocks() > 1) output("es");
			output(" out of the way and");
		}
		output(" gently insert your [pc.cockHead " + x + "] into the luscious cunny. It’s... amazing. The lubricant is somehow better than any natural pussy you’ve ever fucked. It’s hyper-slick without denying you any of the texture of the walls’ clutching caresses. You feel like you could thrust in and just keep sliding until your whole body disappeared inside, but that couldn’t possibly happen, at least not with such a small hole in the wall!");
		output("\n\nBottoming out comes as a surprise. Slapping your [pc.sheath " + x + "] into the wall is good, but you wish you had a bigger, longer cock to keep feeding into it. ");
		if(pc.hasKnot(x)) output("Your [pc.knot " + x + "] didn’t even put up a fight, just slid right in, unnoticed. ");
		output("The milker’s texture is just so <i>sublime</i> that you can barely focus on coordinating your hips. You’re tempted to just sit there and wriggle against the wall, but you bravely decide to give actually fucking it a try. Surely you can stand up to one little sex toy!");
	}
	//Kiro
	output("\n\n<i>“That looks okay... but do you have something a bit more like a real pussy?”</i> Kiro asks your robotic host. <i>“Something that’ll really make me feel like I’ve got this hot bitch embedded in the wall?”</i> She grabs Kally’s ass in both hands and swats it. The sharp crack of the impact reverberates through the milking room.");
	output("\n\n<i>“Ooh!”</i> Kally gasps in surprise, dick throbbing into the android’s hand.");

	output("\n\nThe slutty robo-vixen approximates a smirk, still stroking both girls. Ropes of pre-cum thick enough to knock up a terran dribble off her knuckles. <i>“Of course. We have a special hole for girls like you. This way.”</i> She gives a meaningful tug, knuckles wrapping tight around Kiro’s medial ring, leading the cocky herm around by her too-hard dick. A short distance away, a panel in the wall opens up by wireless command.");
	output("\n\nYou smell it more than hear or see it. Instantly, the room is awash in the scent of pussy. There’s no other word for it. Sopping wet cunt fills the air, worse than an entire sorority ODing on Breeder’s Bliss. You can see Kiro’s nostrils flare alongside her dick. Kally too is affected. Her eyelids droop and cuntjuice splatters the floor between her thighs. Even you feel the pheromones’ siren call, demanding you hump the fuckable little dick-milker hard enough to break through the wall. You try.");

	//Kally
	output("\n\n<i>“Vixette!”</i> Kally whines. <i>“Please!”</i>");
	output("\n\n<i>“Dear me!”</i> exclaims the fox-like robot. <i>“I did not mean to leave you in such a state.”</i> She pumps faster, squeezing out shot-glass sized globs of preseed. They roll across smooth latex knuckles before splattering into a growing puddle on the floor. <i>“Your usual hole is ready and pre-warmed for use. Allow me.”</i> The grinning sexbot lovingly massages the herm’s length as she guides her into position on the other side. Once more the wall reveals a secret, cunt-concealing compartment. The vagina inside is puffy and black... very familiar looking.");
	output("\n\nAs Kally sinks into it, sighing with a mixture of anxiousness and relief, it strikes you just where you’ve seen a pussy like that before: on the other tanuki-girl. It’s exactly like Kiro’s cunt, down to the smallest, slobbering detail. Were the freebooting kui-tan paying attention to anything beyond her own squelching thrusts and spurting dick, she might have teased Kally about it. Instead the chubby bartender is free to glide into a simulated copy of her sister’s cunt, though she at least has the good sense to be bashful about it when she sees you watching.");

	//Hole fucking. It’s great.
	//Pink pussy
	if(arg == "pink")
	{
		output("\n\nYou can understand how Kiro can be so distracted. With the smell of two horny herm-sisters compounded by the artificial pheromones soaking Kiro’s cock, it’s difficult to focus on anything but fucking. You slap your [pc.hips] into the wall again and again, belatedly grateful that the latex padding is positioned to provide you with cushions on either side of your pink-tinged cock-holster. Its constant sucking makes your thrusts the hardest (and the loudest) of the your sperm-packing trio, but it also makes your backstrokes the slowest. Pulling back too quickly is painful.");
		output("\n\nYour [pc.cockNoun " + x + "] is obscenely bloated. The veins are swollen like a tangle of circus balloons. No amount of sinful squeezes or seductive strokes will calm your raging tumescence. The longer you spend in the hole, dripping and spurting and grunting your way toward orgasm, the more hopelessly engorged you find yourself. This pussy isn’t just part of a milking device. It’s a cock-pump too! You groan at the sight of your enlarged phallus and gasp at the sensations of your hyper-sensitized nerves dragging along the soaking wet walls.	");
	}
	//Planters ‘nut-drainers
	else if(arg == "green")
	{
		output("\n\nYou can understand how Kiro can be so distracted. With the smell of two horny herm-sisters compounded by the artificial pheromones soaking Kiro’s cock, it’s difficult to focus on anything but fucking. You slap your [pc.hips] into the wall again and again, belatedly grateful that the latex padding is positioned to provide you with cushions on either side of your alien cock-holster. It’s finally starting to moisten enough for you to make lewd-sounding ‘schluck’s when you tug back and thrust back in. The excess lube allows you to go absolutely wild, humping with reckless, animal abandon.");
		output("\n\nThe rougher you are, the wetter it gets.");
		output("\n\nYou feel the vaunted venom a few minutes after it starts moistening. At first, it manifests as a gentle tingle, like your [pc.cockNoun " + x + "] is being massaged by thousands of microscopic fingers. You gasp with joy and revel in the libertine decadence of it all. Then it spreads deeper inside you, carried by your traitorous bloodstream to infect the rest of your body. Goosebumps break out over every inch of you");
		if(pc.hasFur() || pc.hasFeathers() || pc.hasScales()) output(", raising your [pc.skinFurScales] straight up");
		output(". Your [pc.skin] flushes. A violent, wrenching surge hits your gut, nearly doubling you over, not in pain but in pleasure.");
		output("\n\nAs soon as it finishes, it starts again, a little milder this time, answered by flutters of nearby musculature that make your [pc.cockNoun " + x + "] violently seize and spurt. It’s making you cum... and you aren’t even orgasming! The wall-mounted plant-puss only gets wetter as your body obeys its venomous instructions, releasing measured squirts of [pc.cumNoun] deep into collection tube.");
	}
	//Blue e-stimcunny
	else if(arg == "blue")
	{
		output("\n\nYou can understand how Kiro can be so distracted. With the smell of two horny herm-sisters compounded by the artificial pheromones soaking Kiro’s cock, it’s difficult to focus on anything but fucking. You slap your [pc.hips] into the wall again and again, belatedly grateful that the latex padding is positioned to provide you with cushions on either side of your power-packed dicksleeve. The waves of coruscating stimulation begin to vary once you start fucking in earnest, shaping the fields of electric pleasure to complement your body’s hard work.");
		output("\n\nYour [pc.cockNoun " + x + "] is so hyperstimulated that the feeling of the tube itself all but disappears, leaving nothing but the electricity coursing along your cock for company. You would probably stop thrusting entirely if the sharpened shocks weren’t so effective at encouraging you to thrust. Whoever programmed this thing is a genius. You might even love them. They’ve lassoed your [pc.cockNoun " + x + "] in lightning, and every tug upon that electron-laden yoke is a new experience in pleasure. Sometimes it is a moment of dazzling ecstasy. Other times it feels like the tickles of feather. During one thrust, you swear you can feel bands being tied tight around your dick, but when you pull out there is nothing but conductive lube and turgid, drooling length.");
	}
	//SUCCUBUTTSLUT
	else
	{
		output("\n\nYou can understand how Kiro can be so distracted. With the smell of two horny herm-sisters compounded by the artificial pheromones soaking Kiro’s cock and your magic cunt’s unholy stimulation, it’s difficult to focus on anything but mechanically pistoning. You slap your [pc.hips] into the wall again and again, belatedly grateful that the latex padding is positioned to provide you with cushions on either side of your spellbinding dicksleeve.");
		output("\n\nThen you feel a pinch, just below your [pc.cockHead " + x + "]. It’s gone before you can pull out, but by the time you’re pulled halfway back, you’ve already forgotten it, intent once more upon satisfying your desire for new heights of pleasure. You hump the so-called “succubus” rhythmically, obediently even, giving it all the dick it could ever want and getting rewarded with pleasure. You swear you can feel hands squeezing you through the walls of the pussy, jerking you off for being a <i>very, very good [pc.boyGirl].</i> They know just how to touch and just how to squeeze. You bite your lip and moan out loud, your audience forgotten. The only things in the room that matter are you dick and that perfect, amethyst pussy.");
		output("\n\nYou worship it as best you can, sure to bury your bone as deep as you can into its folds, grinding your pelvic region into its fattened clitty. You find yourself treating it like a lover, a woman you’ve lusted after for years only to finally bed her. It pinches you again, but <i>that’s fine.</i> The <i>pain makes the pleasure all the sweeter</i>, your dick all the harder - bigger too. Those luscious folds are pulled tight by your swelling cockflesh. <i>Wonderful.</i> The blissful feelings increase apace with your swelling tumescence, rewarding you as you are remade into a more perfect servant.");
	}
	//Kiro gets Kally’s attention, then starts kissing you. Kally comes in and kisses back. Kiro gives butt-fingering apology for PC getting kiss-cucked.
	output("\n\n<i>“Hey, slut!”</i> Kiro calls.");
	output("\n\nYou and Kally both look her way.");
	output("\n\nKiro is still pounding away, palms flat on the wall and tongue lolling. Nevertheless, she manages a dopey-looking smile. <i>“Not you, slut. My sister-slut! Mmm... Kally. Yeah, Kally!”</i> At the mention of her sister, you see her titanic testes visible churn in their tightly-stretched sack, working overtime to brew up a little more sperm.");
	output("\n\nKally bites her lower lip uncertainly, but her from the neck down, her body mounts the faux sister-slit all the harder. Reluctantly, she nods in acknowledgement, not trusting herself with words.");
	output("\n\n<i>“Watch this!”</i>");
	output("\n\nA furry hand grabs you by the neck and pulls you into a passionate kiss. You melt into it. Your dick feels too great to protest the sudden intrusion of Kiro’s tongue, the way it plunges through your [pc.lips] to wrestle with your own. Her exotic-tasting saliva assails your tastebuds, lightly-flavored with hints of her creamy beer. You push back against her in a sinful battle of twisting tongues and sordid gasps, spit intermingling in the passionate exchange. Below, your [pc.cock " + x + "] clenches warningly, nearly overloaded with excitement.");
	output("\n\nThe kiss is rudely broken by the sudden appearance of an interloper: Kally. The bustier sister has leaned over from her side of the milking parlor and pulled Kiro away - and into her own lips. The pirate doesn’t care, not so long as she’s kissing somebody. Her tail wags, slapping your [pc.butt] repeatedly. They make out right in front of you, leaving you to watch the near incestuous display of sapphic desire. You could light a candle by the molten heat of the ardor.");
	output("\n\nSomething prods your [pc.asshole] while you’re distracted by the fucking and face-sucking, wiggling in mischievous circles. Kiro gives you a smarmy look out of the corner of her eye, and in that moment of dawning realization, her finger pops inside. It squirms playfully until Kally’s kiss becomes particularly forceful, then it thrusts hard up into your prostate.");

	//PC Orgasm numero uno
	//pinksuckiecunt
	if(arg == "pink")
	{
		output("\n\nWhite hot pleasure explodes inside you. It starts in your ass, where Kiro’s finger is busily rubbing, then pools in your twitching balls before climbing up through your middle in a burst of pressure and ecstasy. Your dick throbs painfully as the [pc.cumNoun] flows through its blood-fattened length. The candied cunt around it slurps you in deep, up to the [pc.sheath " + x + "].");
		if(pc.hasKnot(x)) output(" Your [pc.knot " + x + "] is no issue for the bubblegum cunny. It sucks in just as easily as the rest, betraying the pussy’s artificial elasticity.");
		output(" Twitching and trembling, you begin to unload the fruits of your inflated nutsack into the ravenous tube. Kiro’s finger is there the whole time, trying to make you writhe.");
	}
	//Venomcunt
	else if(arg == "green")
	{
		output("\n\nWhite hot pleasure explodes inside you. Between the constant clenching and relaxing of your entire reproductive system and Kiro’s busy rubbing of your prostate, you are driven past all reason and into clutching, spraying ecstasy. Your dick throbs powerfully, forcing out a thicker jet of [pc.cumNoun] than before. The drug-dispensing cunt squelches wetly");
		if(pc.hasKnot(x) || pc.hasSheath(x)) output(" around your [pc.sheathOrKnot " + x + "]");
		output(".");
		if(pc.hasKnot(x)) output(" It has no problem with the orgasm-expanded flesh. The tunnel is apparently as elastic as it is tight.");
		output(" Twitching and trembling, you continue to unload the fruits of your inflated nutsack into the ravenous tube. Kiro’s finger is with you the whole time, trying its damnedest to make you writhe.");
	}
	//Bluecuntshocker
	else if(arg == "blue")
	{
		output("\n\nWhite hot pleasure explodes inside you. Runners of lightning-borne pleasure surge up the root of your [pc.cock " + x + "], into your spine, and into your head. Your [pc.asshole] seizes around Kiro’s finger, forcing it even harder into your quivering prostate. Your whole body seems to throb in beautiful, orgasmic agony as you erupt into the blue-tinged tube, launching the first heavy spurt out of your inflated nutsack and into the cum-hungry wall. Twitching and trembling, you hand over control of your body to the electrostim’s pulses, letting it guide the timing of your climactic spasms, every muscle clenching to the guiding shocks.");
	}
	//CUMMIES FOR SUCCUBUTS SLUT. CUNT.
	else
	{
		output("\n\nMore pinches poke your rigid, obedient fuckstick at the apex of a particularly pleasant thrust, and you are suddenly aware of the sheer weight of your balls. They’re so heavy and so full that you don’t know how you got this far, not with your sack stretched taut by the gallons of seed trapped inside. They press against your [pc.thighs], so swollen with a gift for your slick mistress, and they’re getting so much <i>weightier</i>. She... it... did something to make your [pc.balls] start producing even more.");
		output("\n\nThe floor squeaks against your expanding ballskin, and you widen your stance to accommodate the titanic sack. It isn’t enough. The sloshing tanks are spreading your [pc.thighs] apart until you’re about to lose all traction, but Kiro is right there to help you <i>be helplessly obedient.</i> She pushes you back into that <i>perfect pussy</i>, prostate first.");
		output("\n\nIt’s too much. You can’t <i>be a good [pc.boyGirl] anymore</i>. Nobody could withstand this unholy pleasure without giving in. You try to hold back the [pc.cumVisc] tide so that your body can continue to be molded into the perfect jizzvessel, but there is no fighting the ecstasy. You nearly burst into tears before the pleasure wipes away any negative emotions. The hands wringing your dick stroke you affectionately, forgivingly.");
		output("\n\n<i>You can come back and serve again.</i> Maybe you’ll last longer.");
		output("\n\n[pc.Cum] launches into the succubus’s slutty cunt. Volley after volley erupts from your body, not even beginning to drain the titanic reservoir that has built up in your balls. For a moment, you actually believe that this thing is alive, and that you’re somehow feeding an actual succubus. You don’t care if there is a real succubus in the wall - she’s making you cum so hard... so goddamn hard!");
	}
	//Kiss intro
	output("\n\n<i>“Kiss [pc.himHer], Kally. [pc.HeShe]’s cumming!”</i> Kiro barks, watching your face slacken with pleasure.");
	output("\n\nYour tongue lolls for a second before Kally’s face is on top of you, slurping it into her mouth as she slides her lips onto yours. Your [pc.cock " + x + "] squirts hard enough to be heard through the wall.");
	if(pc.cockTotal() > 1)
	{
		output(" Your extra penis");
		if(pc.cockTotal() > 2) output("es");
		output(" join it in unloading onto the glossy wall, layering on a fresh coat of [pc.cumColor].");
	}
	if(pc.hasDickNipples()) output(" [pc.CumGem] rives cascade out of your [pc.dickNipples]. The sympathetic boobgasm, kiss, and suckling spunk-extraction nearly make you black out.");
	if(pc.isSquirter()) 
	{
		output(" A veritable bucket full of cunt-juice puddles ");
		if(pc.legCount > 1) output("between your [pc.legs]");
		else output("the floor below");
		output(", but the dick-slurping machinery and Kally’s fervent lip-lock hold you up.");
	}
	
	if(pc.ballFullness < 100) pc.ballFullness = 100;
	
	//Pinkgasm
	if(arg == "pink")
	{
		output("\n\nThe pink-hued pussy sucks harder the more cum you offer it until it feels like it’s pulling the spunk from your [pc.balls] directly. It isn’t a constant suction, more a pulsing, rhythmic vacuuming of the insides of your testes. You can’t stop yourself from ejaculating. The plastic cunt compels your nuts to clench, and Kiro’s finger coaxes the wave of orgasmic goo the rest of the way out of your body in an explosion of pleasure. They’re like fireworks, going off one after another to a bombastic display completely beyond your control.");
		output("\n\nAll you can do is suck on Kally’s face and try to stay conscious while your body is stroked through a blissful hell.");
	}
	//Plantdrugasm
	else if(arg == "green")
	{
		output("\n\nThe green-hued pussy somehow gets wetter the more you cum, until it feels like it’s pumping the spunk from your [pc.balls] autonomously. Your spurts refuse to slow, refuse to thin. They come out in heavy ejaculations that guarantee every drop is going to be milked from your [pc.sack] before long. Kiro’s finger is even more troublesome than her sister’s mouth. The two together are like bliss-bombs going off in your brain, detonating one after another to deny you even the tiniest ounce of sense.");
		output("\n\nAll you can do is suck on Kally’s face and try to stay conscious while your body is stroked through a blissful hell.");
	}
	//Shockgasm
	else if(arg == "blue")
	{
		output("\n\nThe sapphire slit feels better the more you cum, your blissful juices mixing with the conductive lube into a slurry of rampant sexually. The shocks intensify to the point where Kiro can feel them through your prostate, making her finger spasm against the sensitive butt-button. You’re cumming harder than you can remember, spraying spraying like a firehose. Fireworks of shocking delight go off in your mind, spiderwebbing from neuron to neuron until it’s difficult to think anything but <i>ohmygoditfeelssogood!</i>");
		output("\n\nAll you can do is suck on Kally’s face and try to stay conscious while your body is electrically stimulated through a blissful hell.");
	}
	//Succugasm
	else
	{
		output("\n\nIt doesn’t end. No matter how much seed you shoot from your hyper-swollen balls, your orgasm never winds down. All is warm, slick pussy and the beautiful embrace it grants your spasming member, the feel of your urethra dilating again and again with the torrential outflows of [pc.cum]. You cum, and you cum, and you cum, but your balls won’t return to normal. Their enormous weight is a constant reminder of just how much more you can feed into the purple slit, how completely you can stuff the perfect being trapped in the wall.");
		output("\n\nMore tiny pricks assail your [pc.cock " + x + "], and it grows bigger still, the better to unleash the tinal wave within. Your mind all but shuts down under the onslaught of pleasure. The most you manage is sucking on Kally’s face and maintain a vague sort of happiness over being so <i>obedient</i>.");
		pc.ballFullness += 500;
	}
	
	cumQ = pc.cumQ();
	
	//Kally cums
	output("\n\nThe chubby bartender moans into your mouth a moment before breaking the kiss. You blink open your orgasm-dazzled eyes in time to see her shudder from head to toe.");
	output("\n\n<i>“Kiiiiiroooo~!”</i> she cries, arching her back and wagging her tail. <i>“I’m c-c-cumming!”</i>");
	output("\n\n<i>“Then kiss me, slut!”</i> Kiro barks.");
	output("\n\n");
	showImage("KiroKallyKiss");
	output("Kally’s face lights up like a Christmas tree, and a sound reminiscent of a flash flood carries through the latex-sheathed wall. She nearly pulls herself out of her custom pussy trying to get at Kiro’s face, revealing a length that madly twitches and pulses, urethra distended with fat globules, medial ring so inflated it may as well be a medial wall. Pushing that thing into the puffy pussy must be hellishly stimulating. Indeed, when she thrusts herself back home (after securing Kiro’s tongue in her maw), her spunk-stuffed nuts visibly shrink, releasing a fresh torrent of creamy herm-juice into the wall.");

	//Kiro cums
	output("\n\nKiro’s eyes snap wide open, then go unfocused, eyelids slack and drooping. Her finger even stops wiggling in your [pc.asshole], giving your sore prostate a little relief. Fluids audibly gurgle as they surge through her hyper-developed reproductive system, and she slaps her hips <i>wetly</i> against the wall, nuts wobbling and sloshing as they deflate.");
	output("\n\nThey’re shrinking faster than Kally’s. Faster than yours even. Kiro has spent so much time training her body to dump enormous loads into milking machines that she’s vastly more efficient at it than either of you. Her urethra must be enormously dilated to hose out her spunk at such an alarming rate, to say nothing of how strong her pelvic muscles must be to pump it all along. She makes it look easy, tonguing her sister and squirting, making soft little moans into Kally’s mouth.");

	//Special post-gasm epilogues.
	//Normal:
	if(arg != "purple") output("\n\nAll three of you empty your spunk-swollen balls into your respective receptacles over the course of several moan-filled minutes. Gallons of creamy ‘nuki goo launch themselves into the industrial dick-drainers, mixed with your own potent Steele seed. The concealed storage tanks, elsewhere in the facility must be filling to capacity; trickles of [pc.cumNoun] are backwashing out around your [pc.cockBiggest]. Kiro and Kally too have small waterfalls of alien seed mixing into the puddles of pussyjuice between their thighs.");
	//Succubuts interruptus
	else output("\n\nIt seems to last forever, but eventually, your floor-dragging sack begins to shrink back to its normal size. The smaller they get, the less hypnotic your milker seems, the more you can establish your own rhythm and remember that you’re here to have fun with Kiro and Kally, not pledge your soul to some extradimensional pleasure being. That was... <i>fun</i>. No... it was <i>awesome</i>. Better than fun. Wow.");
	
	StatTracking.track("spunk bunker/cum milked", cumQ);
	
	//merge
	output("\n\nThe robotic fox fans herself while you finish up, reveling in the slurping wall-cunt’s incessant suckling upon your hyper-sensitized mast. <i>“Wow... thank you. Mistress Kally... uh...”</i> A silvery tongue licks its lips distractedly. <i>“Lovely... delicious... creamy... buhhh...”</i> Unable to stop herself, the vixen drops to her knees between Kally’s legs and laps at the leaking cream. <i>“So good. Mmmm... thank you so much for your generous contributions.”</i>");
	output("\n\nKiro drags near two feet of swollen dick from the pheromonal cunt, still leaking jism. Her balls have shrunk down to the size of apples - no longer immobilizingly swollen but still enough to make a galotian’s mouth water. <i>“Yeahhh... this was a great idea Kally.”</i> She notices the robot polishing her sister’s nads and smearing the excess goo across her chassis. <i>“Oh! I see you made a friend.”</i>");
	output("\n\n<i>“Mmmhmmm,”</i> Kally purrs, pulling her ass back onto Vixette’s sculpted face, slowly extricating her chubby prick from a pearlescent replica of Kiro’s cunt. <i>“She’s a real sweety. You guys want to be cleaned off? Vixette loves the taste of jizzy dick, doncha?”</i>");
	output("\n\nThe foxdroid answers by ducking around Kally’s freshly-emptied sack to suck her filthy, cum-drenched cock.");
	output("\n\nKiro shrugs and glances at you sidelong. <i>“I guess I got a few minutes. What do you say, [pc.name]? Wanna see if we can get three dicks down this bitch’s throat at once?”</i>");
	processTime(45);
	for(var y:int = 0; y < 2; y++)
	{
		pc.orgasm();
	}
	pc.ballFullness = 0;
	IncrementFlag("KIRO_KALLY_TEAM_MILKED");
	IncrementFlag("KIRO_KALLY_THREESOMES");
	if(flags["KIRO_KALLY_EMAIL"] == undefined && flags["KIRO_3SOME_REACTION"] != -1) flags["KIRO_KALLY_EMAIL"] = GetGameTimestamp();
	pc.orgasm();
	clearMenu();
	addButton(0,"Yes",yesVixetteCumSlurpies,arg,"Yes","Make Vixette clean you off.");
	addButton(1,"No",noVixetteCumSlurpies,arg,"No","Don’t let Vixette clean you off.");
}

//[No]
public function noVixetteCumSlurpies(arg:String):void
{
	clearOutput();
	moveTo(shipLocation);
	showKallyAndKiroAndVixette();
	author("Fenoxo");
	output("You politely inform the sister’s that you should probably be on your way.");
	output("\n\nKiro shrugs, nonplussed. <i>“Suit yourself. Just make sure you swell those nuts back up. Milkings are always more fun with friends.”</i>");
	output("\n\nYou");
	if(!pc.isCrotchExposed()) output(" pull up your [pc.crotchCovers] and");
	output(" say your goodbye, trying to ignore the sound of Kiro cramming her dick down the fox’s throat alongside her sister. It is one of the <i>lewdest</i> things you’ve ever heard.");
	teamMilkingAfterEffects(arg);
	processTime(13);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function teamMilkingAfterEffects(arg:String):void
{
	var x:int = pickSpunkBunkerCock();

	if(arg == "pink")
	{
		//Make dicks bigger!
		var hungBonus:Number = 0;
		if(pc.hasPerk("Hung")) hungBonus++;
		if(pc.hasPerk("Mini")) hungBonus -= 0.75;
		if(pc.cocks[x].cLength() < 30 && pc.cocks[x].thickness() < 6.5) 
		{
			if(pc.cockLengthUnlocked(x, pc.cocks[x].cLength()+ 1 + hungBonus)) 
			{
				pc.cocks[x].cLength(1+hungBonus);
				output("\n\n<b>Your [pc.cock " + x + "] is hanging a little longer and stronger thanks to the pink pussy’s insiatible slurping, the better to fill it in the future.");
			}
			else output("\n\nYou lose any extra length and girth that the pink pussy’s vacuum-pumping might have lent you.");
		}
		else output("\n\nYou lose any extra length and girth that the pink pussy’s vacuum-pumping might have lent you. <b>You’re already huge!</b>");
	}
	else if(arg == "blue")
	{
		//Refractory boost!
		if(pc.refractoryRate < 3)
		{
			output("\n\nThe residual tingle in your reproductive anatomy hints that all that shocking has energized... something. <b>A bio-scan with your Codex indicates that your refractory period has shortened...</b>");
			pc.refractoryRate += 0.25;
		}
		else if(pc.refractoryRate < 10)
		{
			output("\n\n<b>The tingling delights coursing through your hyper-virile anatomy leave you feeling like you’re making [pc.cumNoun] even faster than before.</b> You’ll be ready for another trip here in no time at all!");
			pc.refractoryRate++;
		}
		else
		{
			output("\n\nYou didn’t think it possible, but <b>all the tingles and after-shocks running through your body feel like they’ve pushed your reproductive system into overdrive</b>. You can actually notice your [pc.balls] getting heavier with each passing second, like they can’t refill fast enough.");
			pc.refractoryRate += 3;
		}
	}
	else if(arg == "green")
	{
		var newlined:Boolean = false
		if(pc.libido() < pc.libidoMax())
		{
			pc.slowStatGain("libido",1);
			if(pc.libido() < 50) pc.slowStatGain("libido",1);
			if(pc.libido() < 30) pc.slowStatGain("libido",1);
			if(pc.libido() < 15) pc.slowStatGain("libido",1);
			output("\n\n<b>A lingering sense that you should spend more time cumming remains long after you’ve left the milking parlor.</b>");
			newlined = true;
		}
		if(pc.cumMultiplierRaw < pc.ballEfficiency)
		{
			pc.cumMultiplierRaw++;
			if(pc.cumMultiplierRaw < pc.ballEfficiency - 20) pc.cumMultiplierRaw += 4;
			if(pc.cumMultiplierRaw < pc.ballEfficiency - 100) pc.cumMultiplierRaw += 10;
			if(pc.cumMultiplierRaw < pc.ballEfficiency - 200) pc.cumMultiplierRaw += 40;
			if(!newlined) output("\n\n");
			else output(" ");
			output("<b>You feel like all that venom is making you better at emptying your [pc.balls]. More of this, and you’ll wind up spraying every drop in one go!</b>");
		}
	}
	else
	{
		//50% chance of moderate
		if(rand(2) == 0)
		{
			pc.boostCum(30);
			pc.ballSize(4);
			output("\n\n<b>You come away from the experience with bigger-feeling balls and a taut sack.</b> Whatever the “Succubus” did to you, it left you with the potential to feed it even more the next time...");
		}
		//25% chance of big cum density boost and small ballgain
		else if(rand(2) == 0)
		{
			pc.boostCum(300);
			pc.ballSize(4);
			output("\n\nYour balls churn, growing denser as the drugs they’ve been exposed to finalize their changes. They’re a little bigger too! <b>You’ll definitely be making bigger cum-shots now!</b>");
		}
		//25% chance of yuge ballgain
		else
		{
			pc.ballSize(35);
			output("\n\n<b>Your balls are so much bigger than before!</b> What did the “Succubus” pump into you?");
		}
	}
}

//Yes
//Vixette Triple BJ Cleanup Job
public function yesVixetteCumSlurpies(arg:String):void
{
	clearOutput();
	showKallyAndKiroAndVixette(true);
	author("Fenoxo");
	var x:int = pickSpunkBunkerCock();
	output("You nod your assent and point your [pc.cumNoun] and lube stained dick toward the slutty foxbot. <i>“");
	if(pc.isBro()) output("Fuck yeah!");
	else if(pc.isBimbo()) output("Oooh, yeah! I bet she’ll love it");
	else if(pc.isNice()) output("I’m game if she is.");
	else if(pc.isMischievous())
	{
		output("Yeah ");
		if(pc.cockTotal() >= 3) output("but once I get all three down");
		else 
		{
			output("but once I grow ");
			if(pc.cockTotal() == 2) output("another");
			else output("two more");
		}
		output(", there won’t be any room for you guys.");
	}
	else output("Sure, if you two think you can keep from busting another nut in her belly. I’m not paying the bill for a raptured android stomach.");
	output("”</i>");
	output("\n\nKiro grins, then looks to Kally, who has already threaded the full, turgid length of her cock into Vixette’s maw. <i>“Guess I’m riding shotgun. Open wider, slut.”</i> She tabs the upturned vixen’s nose, or at least the part of her face molded to resemble a nose. <i>“Wider. This is a lot of cock.”</i>");
	output("\n\nThe mechanical fox’s eyes briefly shift to appear as glowing purple hearts, then her mouth opens wide, wider than most girls ever could. A broad, flat tongue lolls out, cupping the underside of Kally’s dick for a moment before twisting to the side to lasso Kiro. The cocky pirate doesn’t give the ‘bot a chance to suck her in. Instead, she grabs herself by the root and rudely thrusts herself into the gynoid’s defenseless orifice, sighing in pleasure as her enormous horse-dick slides into place alongside her sister’s, sandwiching the tongue between them.");
	output("\n\n<i>“Ahhh,”</i> Kiro sighs.");
	output("\n\nKally whimpers, eyes fluttering, cock visibly thickening against her sister’s incestuously rubbing shaft. <i>“Mmmhhmm...”</i>");
	output("\n\nThe sexdroid’s face shows nothing but glee at her situation, but her eyes look your way intently, begging you to join them. Her tongue even manages to disentangle itself and loll out the side of her suckling maw, flapping your way as if to say, <i>“Come on in, the water’s fine.”</i>");
	output("\n\nTaking your sloppy, [pc.cumNoun]-coated dick in hand, you push your dick against the sisters’. Their spent lengths are every bit as hot and wet as your own, alien heartbeats thudding against yours as you slide yourself down, forcing the eager cum-slut’s glossy lips to spread just a little bit more. You pop in a second later, and Kally coos excitedly. Her eyelids flutter bashfully as you grind deeper into Vixette’s slutty muzzle, stuffing your [pc.cock " + x + "] in alongside her own. Her nose wrinkles. The corners of her lips twist upward as much as her stretched-out mouth will allow, an attempt at a smile. She must have some sense of smell or taste, something that lets her measure the musky depravity in which she’s subsumed herself.");
	output("\n\nKally giggles nervously once you’ve completely secured yourself. Kiro favors you with a knowing wink as she lays a sensuous kiss on her sister’s lips. Down below, Vixette’s tongue leaps into action, swirling from dick to dick, climbing over them as a tree-inhabiting snake might traverse jungle foliage. It flicks across your [pc.cockHead " + x + "] and laps at the tiniest creases and crevices, even scooping a few dregs of jism from your urethra. Vixette’s eyes have once more taken on the appearance of hearts, growing bigger the moment until at last, her servos seize, sending her heavy silicone jugs jiggling. Her eyes flash white, and she collapses, mouth limply sliding from a trio of immaculate cleaned cocks.");
	if(flags["VIXETTE_MOUTHGASMED"] == undefined)
	{
		output("\n\nKiro looks concerned for the robovixen.");
		output("\n\n<i>“She’s fine,”</i> Kally explains. <i>“She just cross-wired her sexual pleasure subroutines to trigger from the taste of cum. Smell too, I guess. I think she just came so hard she blacked out... or whited out, I guess. She’ll be up and running again in a sec-”</i>");
		output("\n\n<i>“Mmmmm... thank you so much!”</i> Vixette purrs, rolling on the ground and stroking her mammoth mounds in the aftershocks of android ecstasy. <i>“You really are the best, Kally.”</i>");
		output("\n\nKiro clears her throat.");
		output("\n\n<i>“You too, Kally 2.”</i>");
		output("\n\n<i>“Close enough, I guess.”</i>");
	}
	else
	{
		output("\n\nKiro leans over the robovixen. <i>“She really loves cum, I guess.”</i> The raccoon-girl looks your way and smiles playfully before grabbing two big handfuls of the foxy android’s enormous mounds. Her fingers all but disappear into the pliant boobflesh, silicone rolling and bouncing just beneath synthetic skin and metallic fiber. <i>“Goddamn, these are fucking tits. You ever think about getting an enhancement, Kally?”</i> She lets her dick drag through the sterile cleavage, rolling it playfully between the plush pillows. <i>“My dick would punch a hole in the bar every time I came to visit, I swear.”</i>");
		output("\n\nVixette stirs while Kally nervously looks at her own bust. The fox-bot’s eyes light up with pleasure. <i>“Mmmm... thank you so much, Kally.”</i>");
		output("\n\n<i>“I’m not Kally,”</i> Kiro huffs, folding her arms across her chest in annoyance.");
		output("\n\nVixette paws at the kui-tan’s dick apologetically. <i>“Mmmhmm, if you say so, Kally 2. And uh... that [pc.race]. You were all wonderful.”</i> She turns to look straight at Kally once more, eyes transformed into a pair of playful-looking pixel kittens. <i>“You’ll come back soon?”</i>");
	}
	processTime(15);
	pc.changeLust(5);
	clearMenu();
	addButton(0,"Next",vixetteCleaningEnd,arg);
}
public function vixetteCleaningEnd(arg:String):void
{
	clearOutput();
	showKallyAndKiro();
	author("Fenoxo");
	showImage("kiroAndKallyTogether");
	output("The three of you say your goodbyes and make your way back to the landing pad with significantly lightened pouches and flushed cheeks. Kally leans on Kiro for support most of the way, something the younger sibling is all too happy to allow.");
	if(pc.isBimbo()) output("\n\nSo cyuuuuute!");
	teamMilkingAfterEffects(arg);
	processTime(5);
	clearMenu();
	moveTo(shipLocation);
	IncrementFlag("VIXETTE_MOUTHGASMED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function kiroXKallyEmailShow():void
{
	clearOutput();
	showKallyAndKiro(true);
	output("<i>“...Is it on?”</i> The voice is Kally’s. Worry undercuts her typically carefree tone.");
	output("\n\n<i>“What’s the matter? Is the Ice Queen freezing up at the prospect of screwing on camera?”</i> Kiro sounds almost <i>too</i> pleased. <i>“I thought you outgrew all your hangups.”</i>");
	output("\n\nA holographic projection of the two tanukis pops into being above your ");
	if (InShipInterior()) output("console");
	else output("Codex");
	output(". Kally is leaning toward the projector array curiously - you suppose to look at their recording device. Kiro peers over her chubby sister’s shoulder with a lecherous grin, rubbing her back mischievously. Both are clearly topless, and though Kally’s crotch remains half obscured by a skirt, a pair of cunt-crushing boners have it tented high enough for you to see the bartending hermaphrodite’s nuts - thanks to Kiro’s clever positioning.");
	output("\n\nKiro winks to the camera. <i>“Of course it’s on! I bet our ");
	if(pc.tallness < 5*12+5) output("little");
	else if(pc.tallness < 7 * 12) output("lovely");
	else output("gigantic");
	output(" Angel can see both of these just fine.”</i> She reaches down two grab two big handfuls of jiggling ‘nuki-tit.");
	output("\n\nGasping in surprise, Kally straightens, back arching and skirt lifting. A dribble of off-white pre-cum glistens along the underside of veiny member, sloughing onto Kiro’s flare as it playfully seesaws between Kally’s thighs. The bartender blinks her eyes closed and moans, <i>“Ohhhhh... okay.”</i> Her hips slide back, dragging her swelling balls and rigid horse-cock along her sister’s sinfully slick shaft. They’re both leaking profusely by this point. Bubbles of pre-cum dangle from their tips, partway suspended by waves of gooey excitement clinging to the ruffles of Kally’s skirt.");
	
	output("\n\n<i>“Kally here,”</i> Kiro slaps her sister’s ass, earning a coo and squirt of surprise, <i>“thought we could do a little something for you, since you did so much for us.”</i> Short-clawed fingers dance across hardening nipples. Poor Kally squirms in place, flushed and panting, but does nothing to evade her sister’s torturous touches. <i>“And when I suggested we shoot our own bit of amateur porno for you...”</i>");
	
	output("\n\n<i>“I agreed!”</i> Kally gasps, stretching back to wrap her own arms around Kiro’s neck, holding her close. <i>“I hope you like this recording.”</i> She groans, watching the camera as Kiro continues to toy with her. <i>“This never would have happened without you, and-”</i> Her voice jumps an octave as Kiro pinches both nipples, hard.");
	
	output("\n\n<i>“-you’d better not share this anywhere or I’m coming after you,”</i> Kiro finishes. <i>“Now Kally, I think we both agreed that doing it ausar-style would look the best on camera, didn’t we?”</i>");
	
	output("\n\n<i>“Y-yeah,”</i> Kally purrs, playfully jerking her hips while squeezing on Kiro’s cock with her thick thighs, sealing the bestial rod into a prison of silk-furred flesh. <i>“But this already feels so goooood! Can you bear to pull out, love?”</i>");
	
	output("\n\nThe big-dicked scalawag grunts. <i>“That’s cheating.”</i> She strains, but between the neck-lock and thigh-pin, the heavier sister keeps Kiro from going very far. <i>“You promised I could nut in your womb!”</i>");
	output("\n\n<i>“Not until you say it back!”</i> Kally whimpers, undoubtedly pleasured by the struggling dick pinned to her mons, cock, and balls, yet somehow she holds tight.");
	
	output("\n\nKiro looks confused. <i>“Say what back?”</i> Her tail swishes back and forth anxiously.");
	
	output("\n\n<i>“Love.”</i>");
	
	output("\n\n<i>“I’m going to </i>love<i> cumming dick-deep in your sweet pussy.”</i>");
	
	output("\n\nKally scowls, turning to glare directly at her sister. <i>“Seriously? That’s the best you can do?”</i>");
	
	output("\n\nA kiss lands full on the blustering bartender’s lips, silencing her mid-tirade. When it breaks, Kiro mouths, <i>“Gotcha, love.”</i> Her eyes twinkle with mirth and a little more. <i>“I just wanted to see your face when I told you I love you.”</i>");
	
	output("\n\nThe genuine, true smile that explodes onto Kally’s face warms your ");
	if(pc.isAss()) output("even your ");
	else output("racing ");
	output("heart. Moisture beads at the corners of her eyes, and the deathgrip she had on her sister loosens. <i>“W-was that so hard?”</i> She bends over, thighs relaxing, though her fluffy raccoon tail snuggles Kiro’s.");
	
	output("\n\n<i>“Wasn’t hard at all,”</i> Kiro retorts, kissing Kally’s between the shoulder blades. Her cock slides out with an audible ‘schliiick.’ <i>“Almost as easy as you.”</i>");
	
	output("\n\n<i>“Hey!”</i> Kally briefly grumps before her eyes go wide. A furry hand grabs the camera and shifts it a little to the side so that you can see Kiro’s swollen prick-head prodding at the chubby ‘nuki’s lust-thickened cunt-lips. Pre drools down her thighs, matting the fur.");
	
	output("\n\nKiro lets go of the camera, grinning happily as she grabs two big fistfuls of furry, kui-tan buttcheek, her digits nearly vanishing into squishy ass. <i>“Don’t pretend you aren’t fucking that cute moose-cop I’ve seen hanging around every chance you get. I bet she sucks down a few gallons of your cum a day, doesn’t she?”</i>");
	
	output("\n\nKally squirms, half-formed denial on her lips right up until Kiro shifts her hips forward, spreading the other tanuki wide around her big, fat horse-dick. All of perhaps six inches have slid in, but the effects are plenty visible. Kally’s plump, gloss-covered lips (did she put that on for Kiro or for the recording?) fall open. Her eyes drift closed, and a slutty, whorish moan rips out of her throat.");
	
	output("\n\n<i>“You fuck that moose, don’t you?!”</i> Kiro barks.");
	
	output("\n\n<i>“Yes!”</i> Kally doesn’t even seem conscious that of the words leaving her mouth, not while another four inches of dick are gliding into her soaking cunt.");
	
	output("\n\n<i>“And you’d fuck [pc.name], wouldn’t you?”</i> Kiro is really driving in now.");
	
	output("\n\nKally arches her back and slaps her fist down on the bed. <i>“Yes! Fuck yes!”</i>");
	
	output("\n\n<i>“And you want your own sister to fuck you harder, don’t you?”</i>");
	
	output("\n\n<i>“Yesyesyes!”</i> Kally cries, pushing back to pop Kiro’s medial ring into her greedy slot. One-handed, she squeezes one of her own tits, hard.");
	
	output("\n\n<i>“Goddamn, I love you Kally,”</i> Kiro purrs, holding position to let Kally slurp up the rest of her throbbing-hard cock. <i>“Such a sweet woman... with such a fuckable body... and a per-perfect pussy. You fuck that moose-girl as much as you want.”</i>");
	
	output("\n\n<i>“O-okay! I will!”</i> You can barely make out the pirate’s sheath beyond the well-rounded globes of Kally’s ass.");
	
	output("\n\n<i>“I know you will, cutie.”</i> Kiro thrusts hard, clapping her hips into place. The weighty slap of one set of super-human testes impacting another sets off a bit of audible churning. You can literally hear the seed slosh from the sack-squeezing pressure. <i>“Because you’re my sister, and my lover, and this...”</i> she reaches around to grip Kally’s dick, <i>“had better get to cum dick-deep in </i>somebody<i> if I’m not around to drain it. Got it?”</i>");
	
	output("\n\nKally whimpers and sputters gouts of seed onto the bed and Kiro’s fingers. It’s thicker and less translucent than it ought to be. All the excitement has left her oozing sperm into her oh-so-copious pre. <i>“I love you tooo!”</i> Kally cries, moments before adding, <i>“Please fuck me already!”</i>");
	
	output("\n\nHalf panting, half giggling, Kiro gathers up the freely spilling pre-seed in her hand and begins to stroke Kally. <i>“Are you sure you wouldn’t rather get off from squeezing down on me while I jack you off?”</i> The sloppy sound of a handjob aided by a gallon worth of lube rings crystal-clear through the speakers. <i>“Stars, you get so fucking slutty with a cock in your pussy.”</i>");
	
	output("\n\n<i>“Pleaaaaase!”</i> Kally begs. She looks back over her shoulder, pleadingly, pouting for all of a second before the pleasure makes her moan and lick her lips. <i>“You promised you’d fuck me!”</i>");
	
	output("\n\n<i>“Did I?”</i> Kiro, showing remarkable restraint, gathers some of Kally’s pre in her other hand and brings it to the moaning kui-tan’s maw. <i>“If you swallow this, I might.”</i>");
	
	output("\n\nTongue flashing, the horny tanuki-girl sucks three fingers into her mouth at once, slurping to get at the lingering bits in the crevices. A second later, she’s popping off to hit the pinky, then the thumb. Then she’s smearing her nose and lips into Kiro’s palm to harvest the last drops.");
	
	output("\n\n<i>“Fuuuuck, that’s so hot!”</i> Kiro’s hips slip back, and she grabs onto Kally to pound back in. It’s an artless, vicious stroke, the kind you’d expect from a barnyard animal in rut, not a caring lover. <i>“You know that shit’s gonna make your balls swell, but you sucked it down, just like your twat is sucking my cock down.”</i> When she bottoms out, a slight distention appears in the fluff on Kally’s belly, flaring and rounded. When she pulls back, a cascade of pre washes out, making both herm’s balls shine brightly.");
	
	output("\n\n<i>“It won’t matter if you fuck me hard enough,”</i> Kally says, clutching at increasingly slippery sheets. <i>“Fill my cunt, and you’ll empty my nuts. I promise! It’s so good!”</i> While her balls may have already been swelling from excitement, they lurch into a whole new growth spurt, swiftly passing Kiro’s considerable size to leave the cocky pirate in the dust.");
	
	output("\n\nKiro seems to take being usurped as the big ball queen as a challenge. Somehow, she finds the strength to plow Kally even harder. Sharp slaps accompany every thrust, sending rippling quakes through the bent-over woman’s backside all the way up to her tits. Two sets of balls sway like pendulums, occasionally bumping into one another, though Kally’s are soon big enough to envelop Kiro’s in a squishy, scrotal embrace.");
	
	output("\n\n<i>“Yes!”</i> Kally gasps, clutching at her chest with one hand, unable to control the other. Her thighs twitch and jiggle, and waterfalls of pussy-juice and pre-cum wash out with every backstroke. She pinches a nipple, and her pre-cum turns pure white, flowing out in a stream that seems to double in strength with every thrust Kiro makes. <i>“S-so close!”</i> Passing the size of cantaloupes, the kui-tan’s balls shudder and wobble. The earlier sloshing sounds have become a muted tidal roar.");
	
	output("\n\nKiro’s eyes go wide, and the distention in Kally’s middle thickens. It rhythmically pulsates from the heavy flows of excitement jetting into the chocolate-furred tanuki-girl. <i>“Then cum for me, slut!”</i>");
	
	output("\n\nThat word seems to trigger something in Kally, as she begins to push back hard, using every ounce of her fuckable form to try and bring Kiro to her peak first. <i>“You first! Don’t you want to fuck me till my belly’s fatter than a pregnant woman’s, then make me cream all over it?”</i> She moans, dick flaring. She’s almost there. <i>“Cum inside me! Then... I’d have to... to cum!”</i>");
	
	output("\n\nKiro is the clear loser... or winner, of the exchange. Roaring in primal delight, she slams hilt-deep and puts every ounce of her strength into holding Kally as deeply into her crotch as possible. That cock-shaped belly-bulge balloons with a tide of barely-contained spunk, welling up to the size of a watermelon in an instant. Gout after gout of impassioned seed sprays from one kui-tan into the other.");
	
	output("\n\nIt’s mid-way through the second womb-inflating squirt that Kally’s dick goes off. One moment, it’s bobbing heavily beneath its own weight and drooling white. The next, it’s spraying kui-tan cream like a firehose, splattering the bed’s headboard and wall, cascading in circular waves six feet in every direction. Kally brays in incoherent pleasure while Kiro grunts behind her. Her belly swells large enough to support the rest of her, pushing her tits up to present the perfect line of cleavage. Below, her balls pulsate and shrink, releasing many times their own volume in alcoholic jism in seconds.");
	output("\n\nWith Kally’s dick pinned into the sheets by her now-pregnant belly, the cum has nowhere to go but down. Some washes back out, joined by the pearl streamers that spray out of her impaled slit, but most is forcibly impregnated into the sheets and mattress. With each movement, cum bubbles out of the violated furnishings. At the edges of your view, you can see white rising in a small lake. Puddles form around elbows and knees.");
	output("\n\nAnd with a simultaneous, satisfied sigh, the girls flop into their sides, frosting themselves in their own leftovers. Neither seems to register the self-induced bukkake. Either it’s a common enough occurrence or they’re too satisfied to care. Kiro, still embedded in Kally, cradles her swollen sister’s middle and gentle strokes it, moaning softly.");
	output("\n\n<i>“I love you,”</i> Kally murmurs.");
	output("\n\n<i>“I love you too, you big slut,”</i> Kiro answers, kissing Kally’s ear.");
	output("\n\nAfter a few seconds of cuddling, Kally asks, <i>“What about the holo? Should I turn it off?”</i>");
	output("\n\n<i>“No... let it run. Let’s stay like this a while. I’ll just cut the holo here before we send it. Say bye, Kally!”</i> Kiro stretches past the chubby raccoon-girl’s cum-inflated middle to fondle her dick.");
	output("\n\n<i>“Mmm... bye!”</i>");
	
	output("\n\nThe holo ends, leaving you to wonder whose room they decided to destroy while filming that.");
	if(pc.lust() >= 50) 
	{
		output(" Also, you’d best clean up the mess you made in the process.");
		pc.orgasm();
	}
	else pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Extra Kally Scenes
//By QuestyRobo
//Hotdog and Fuck
//Requires a dick.
//Requires you to have had sex with Kally before. (done Eat Pussy a few times, or any of her three/foursome scenes with Kiro/Sylvie/Del)
public function kallyHotdogNFuck():void
{
	clearOutput();
	showKally(true);
	author("QuestyRobo");
	var x:int = pc.cockThatFits(900);
	if(x < 0) x = pc.smallestCockIndex();
	/*
	output("You ask for a drink menu and Kally passes it over. You’re not quite sure what you want to order, but Kally is patient, up until a rather large group enters the bar.");
	output("\n\n<i>“Sorry, hun, I gotta deal with these guys. You can go ahead and find a place to seat yourself, I’ll be right with you.”</i> She struts out from behind the counter and hurries over to the seated party, notepad in hand.");

	output("You take a seat and decide that you’re fine enough just observing Kally for the moment. ");*/

	output("Stars, why does ");
	if(pc.isBro()) output("that slut");
	else output("she");
	output(" even bother wearing a skirt? Not only are her dick and balls swinging freely in the breeze, but every slight sway of her hips knocks it out of the way enough to see the fat, jiggling globes of her chocolate-hued ass. [pc.EachCock] swells");
	if(!pc.isCrotchExposed()) output(", tenting your [pc.crotchCover]");
	else output(", standing proud and shameless in the open air of the bar");
	output(" as you watch her swing her sweet rear around.");

	output("\n\n");
	if(pc.isBro()) output("Kally is such a skank. You bet anything that if you worked her over the right way you could get her to serve drinks naked. Maybe when you get control of the company, you could buy this place out and fill it with nothing but big-assed drink-sluts, perhaps even keep her for your personal harem. Oh the possibilities! ");
	output("Eventually Kally sees you staring. Instead of acting even a bit embarrassed, she just smiles and comes closer, putting a bit of extra swing in her step for show.");

	output("\n\n<i>“Ready to order something, sugar?”</i> The sultry ");
	if(silly) output("trash panda");
	else output("kui-tan");
	output(" says as her eyes drift toward your ");
	if(!pc.isCrotchExposed()) output("distended garments");
	else output("brazenly exposed [pc.cocks]");
	output(".");

	if(pc.isBro())
	{
		output("\n\nInstead of saying anything immediately, you roughly grab her ass, squeezing her bubbly cheek like you own in. Kally gasps but doesn’t resist even as your hand wanders toward her honeypot. <i>“You. Bed. Now.”</i> You command as you stare straight into her foggy eyes.");
		output("\n\n<i>“O-okay, sounds good, hun.”</i> She says almost drooling onto her notepad. <i>“J-just let me...”</i>");
		output("\n\nYou interrupt her before she can finish. <i>“Now.”</i> You couldn’t care less about whatever crap she has to do, you wanna fuck! Kally babbles incoherently under her breath as you stand up and lead her by the ass. You do give her just enough time to slap a note on the counter saying ‘Break Time’, but that’s all you give her before you whisk her away to the back rooms, catcalls and faint cheering erupting behind you.");
	}
	else
	{
		output("\n\n<i>“Hmm, there was this one thing I saw that really caught my eye.”</i> You scoot toward her, making sure to emphasize your ");
		if(!pc.isCrotchExposed()) output("straining bulge");
		else output("[pc.cocks]");
		output(". <i>“I’m sure you saw it, but it was this big, juicy, delicious looking treat that I’m just dying to get my hands on.”</i> Kally stares you dead in the eye while you hungrily praise her booty.");
		output("\n\n<i>“You mean this, hun?”</i> She swings around and pushes her jiggling ‘nuki butt out just enough that it peaks from under her too-short skirt.");
		output("\n\n<i>“Yeah. I’d like a big helping of that.”</i>");
		output("\n\nShe purrs, <i>“coming right up, sugar. Just come on back and you can have as much as you want.”</i> You can see her cock tent her skirt before she walks off. Her breeding hips sway enticingly as she heads over to the counter. She leans over way more than she needs to as she puts down a ‘Break Time’ sign, letting you see her full moon as well as her drooling gash.");
		output("\n\nYou practically jump out of your seat and start following her. Kally looks back at you with her smokiest look as she leads you to the back rooms, catcalls erupting as you leave the bar.");
	}
	output("\n\nKally");
	if(pc.isBro()) output(" slips off of your hand and");
	output(" throws herself against the door of her room, pressing her hands against it before reaching back and pulling up her skirt. <i>“Oh dang, I can’t find my keys. Could you help about a bit here? Don’t be afraid to get <b>real</b> deep in there.”</i> She bounces her booty a few times for emphasis, sending the dusky masses jiggling out of control. It’s too tempting to resist, and you take the reigns immediately. Your hands sink into the bubbly buns, barely even stopping their momentum before they settle down in your grasp.");
	output("\n\nYou grope her rear, feeling the pliable flesh ripple with every movement. It’s warm and soft like a pair of luxury pillows; so much like them that you decide it’s only right to have your head between them. Kally moans as you motorboat her cheeks, feeling their sheer mass cradle and smother your face as they jiggle around it.");
	output("\n\nIt’s impossible to ignore just how much Kally is getting off from this. Her cock is rock-hard and drooling pre onto the ground, and her puffy pussy mound is soaked in her juices. You decide that that’s too tempting an offer to pass up, and dive right in. Her moans punch up an octave as you put your [pc.tongue] to work. The outer lips are thick, but plush enough that you can push into them with just your tongue. Diving through the fat mons gets you into her honeypot proper, where your tongue is utterly drenched in her juices.");
	output("\n\nYou sit there, eating her out while your hands go back to work on her booty, for a few minutes before the pressure ");
	if(!pc.isCrotchExposed()) output("down below");
	else output("from your achingly hard [pc.cocks]");
	output(" becomes too much. But taking her right now just wouldn’t feel right; you haven’t even gotten into her room yet. Your busy hands give you an idea though. You ");
	if(!pc.isCrotchExposed()) output("pull off your clothes as fast as possible before ");
	output("grab");
	if(!pc.isCrotchExposed()) output("ing");
	output(" [pc.oneCock] and flop");
	if(!pc.isCrotchExposed()) output("ping");
	output(" it down between her cheeks.");

	output("\n\nPressing her grandiose ass around your dick feels utterly heavenly. The way the mountains of warm flesh and soft fur wrap around you so perfectly almost makes you never want to leave! There’s just enough resistance when you start to thrust to make it pleasurable, but not enough to impede you in any real way. You plant your feet and start plowing her asscheeks for real");
	//big donger:
	if(pc.cocks[x].cLength() >= 18) output(", marveling at how your sheer length is too much for even her massive tush to contain");
	output(". Kally huffs and stumbles against her door as you rail her booty, struggling to stay on her feet in the face of your onslaught and her own lust.");

	output("\n\n<i>“D-dang, sugar, you’re a real ass lover aren’t you? Hold on here, let’s get in so you can really dig in there.”</i> Kally pulls out a small key from her cleavage and unlocks the door. She pushes the door open and spills in as you refuse to let go of her ass. The stumbling slut falls forward onto her bed, letting her rear and still erect dick spill over the edge.");

	output("\n\nYou resume your assfucking immediately, not even giving her time to adjust. She groans against her sheets as her cock leaks more and more against the side of the bed. One of your thrusts passes over her anus, stimulating the entrance while denying it what it really wants. Each pass over elicits another twitch out of her cock and another splash of increasingly white pre.");
	output("\n\nIf the volume of pre-jizz coming draining out of her, and her increasingly desperate gasps are any indication, she’s right on the verge of orgasm. Rather than spare her the <i>“shame”</i> of cumming first, you decide to drive her right over the edge. You bring your hand down and deliver a series of hearty slaps to her jiggling bubble butt. She yelps out, but if the way her cock strains is any indication, she’s enjoying it.");

	output("\n\n<i>“W-wait, stop doing that or I’m gonna...”</i> One more slap cuts her off as her balls tighten and swell right before her hermhood sprays liters of ‘nuki cum onto her floor. Not content to let her settle, you decide it’s time for the main event. You pull your [pc.cock " + x + "] out of the warm confines of her ass and spear yourself into her pussy without a second thought.");
	pc.cockChange();

	output("\n\nShe cries out as you plow into her before her orgasm even finishes. Her pussy is so drenched and ready by this point that you don’t even need to hold back. You bang her so hard that the whole bed shakes, and her slutty ass jiggles like a bowl of jelly.");

	output("\n\n<i>“Come on, sugar, you can’t even g-give me a minute to calm down here.”</i>");

	if(pc.isBro()) output("\n\nYou grunt as you continue to plow her. Why should <i>you</i> wait for her?");
	else output("\n\n<i>“Nope,”</i> you say playfully as you continue to fuck her.");
	output(" Kally’s eyes start to cross as she barrels into another orgasm, just as her first one was trailing off. Her balls pulse again, eager to expel more of their creamy load, even after shrinking a good amount after her first orgasm. Her pussy squeezes down on your [pc.cock " + x + "], begging for you to cum already.");

	output("\n\nYou push through her resistance, telling her through action that you’ll cum at your own pace. Of course you’re already pretty close, but that’s not the point! You fuck her as hard as possible, feeling your orgasm start to loom over you. If you’re going down then you’re taking her with you! You can already feel her hurtling towards a third climax. Almost there.");

	output("\n\nHer cunt tightens up as you keep thrusting, hearing her moans grow louder and more frequent. Your own orgasm is coming at you just as fast, and it’s a race at this point to see who’ll cum first. You feel it cresting, just about to burst, when Kally suddenly cries out. Her spent and sore cock spews one last spray of cum as she limply twitches on her bed. You sigh in relief as your own orgasm blooms.");

	output("\n\n");
	if(pc.cumQ() < 100) 
	{
		output("Your sore cock liberally bastes the walls of her honeypot [pc.cumColor]. You go and go until your [pc.balls] ");
		if(pc.balls <= 1) output("is");
		else output("are");
		output(" spent, and your [pc.legOrLegs] refuse");
		if(pc.legCount == 1) output("s");
		output(" to hold you up anymore.");
	}
	else if(pc.cumQ() < 2000)
	{
		output("You pump what feels like every drop of liquid in your body into Kally. Her pudgy belly swells out even more as your flood of seed settles in her womb. She does a remarkable job keeping it all in, but even she can’t keep all of it, and streams of [pc.cum] leak out of her pussy. Your [pc.legOrLegs] give");
		if(pc.legCount == 1) output("s");
		output(" out as your orgasm wanes.");
	}
	else
	{
		output("Kally groans out as she feels your inhuman production go to work. Her belly bloats out in seconds, filling to capacity and then stretching far enough to strain believability. You’ve yet to find a normal person who could take the entirety of one of your super-massive loads, and Kally is no exception. [pc.cum] flows out of her in flooding waves that stain the floor of her room with deep, [pc.cumColor] puddles. Your cum-soaked [pc.legOrLegs] give");
		if(pc.legCount == 1) output("s");
		output(" out under you as your expansive orgasm trails off.");
	}
	output("\n\nYou collapse onto Kally, your body either unable or unwilling to move off of her");
	if(pc.hasKnot(x)) output(", not like your knot would let you get too far anyway");
	output(". Kally is even worse off. You don’t even think she’s awake. Her breath is heavy and ragged, and her legs are still twitching from the aftershocks of your orgasm. When you finish recovering");
	if(pc.hasKnot(x)) output(" and your knot deflates");
	output(", you try and get her up to minimal success.");

	output("\n\n<i>“Let me cool off, hun. I’ve been in the oven too long.”</i> She lazily drones out before passing out again. Oh well. ");
	if(!pc.isCrotchExposed()) output("You pick up your discarded [pc.crotchCovers] from the hallway outside and make yourself decent once more. ");
	output("Since Kally isn’t getting up anytime soon, you decide to take your leave, ");
	if(pc.isBro()) output("giving her ass one last slap before you do.");
	else output("giving her a quick kiss on the cheek before you do.");
	kallySexedCount(1);
	//[Next]
	processTime(45);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	if(!pc.hasStatusEffect("Kally Cummed Out")) pc.createStatusEffect("Kally Cummed Out",0,0,0,0,true,"Icon_Wine","",false,30,0xB793C4);
}

//Drunk Draining
//Triggers when you drink one of Kally's "special" drinks near to, or when she cuts you off. A new scene will play where you can choose to kiss her and spit the drink into her mouth.
//Requires you to know about her "special ingredient"
public function kallyDrunkDraino():void
{
	clearOutput();
	showKally();
	author("QuestyRobo");
	output("Kally whips you up another drink, knocking it down on the counter in front of you. You’re utterly out of it at this point, and Kally has to actually step in and steady your hand so you don’t spill your drink all over yourself.");
	output("\n\n<i>“Alright, sugar, I think I’m gonna cut you off after this one. You’re gettin’ a little loose here.”</i>");
	output("\n\nYou ‘awwww’ and drunkenly beg for just one more. She shakes her head. <i>“Nuh uh. You finish that one off and I’ll get you some juice to calm down with.”</i>");
	output("\n\nShe goes to serve up another customer, leaving you with your last drink.");
	output("\n\nA wicked thought comes to your mind. You know exactly what would happen if you were to share some of this delicious drink with Kally. If you did that, you’d get a nice, <i>big</i> helping straight from the tap.");
	output("\n\nOr you could just finish your drink and get on with your day, like a well adjusted member of society.");
	processTime(30);
	clearMenu();
	//[Kiss] This can’t possibly be a bad idea!
	//[Finish] Just finish your drink like a normal person.
	addButton(0,"Kiss",kallyCumKissySurprise);
	addButton(1,"Finish",kallyFinishDrunkDrain);
}

//Finish
public function kallyFinishDrunkDrain():void
{
	clearOutput();
	showKally();
	author("QuestyRobo");
	output("You knock back your booze, letting out a hearty belch as you slam the glass down. Kally chuckles and pours out a glass of orange juice, placing it down in front of you while she swipes your old glass away.");
	output("\n\n<i>“On the house, hun. If you wanna’ wind down a bit more, we could talk about something.”</i>");
	processTime(1);
	pc.createStatusEffect("KALLY_FORCE_CUTOFF");
	pc.setStatusMinutes("KALLY_FORCE_CUTOFF",120);
	//Go to Kally’s Talk menu
	kallyTalkMenu();
}

//Kiss
public function kallyCumKissySurprise():void
{
	clearOutput();
	showKally();
	author("QuestRobo");
	output("<i>“Hey Kallllly?”</i> You call over the busy ‘nuki, crooking your finger in order to add emphasis as you take a swig of your nutty drink.");
	//First:
	if(flags["KALLY_DRUNK_SNOWBALL_FUCKED"] == undefined) 
	{
		output(" She gives a puzzled look but comes over anyway.");
		output("\n\n<i>“Need somethin’?”</i> You motion her in closer. She rolls her eyes and leans in, at which point you ambush her with a kiss, spitting the drink you stored in your mouth into hers. Her eyes go wide for a second before her face twists into a smug smirk. Instead of shoving you off she goes in harder, ravishing your [pc.lipsChaste]. She pops off your lips, and her smirk grows wider.");
		output("\n\n<i>“Alright sweet thing. If you want another drink that bad, how about we go in back and I’ll give you one from my, unf, ‘private reserves’? Don’t worry, there’s <b>loads</b> of the stuff, so you can be as greedy as you want!”</i> She wraps one hand around your shoulder, and sinks the other down beneath her skirt.");
	}
	else
	{
		output("\n\nShe rolls her eyes, very much aware of what you’re planning this time. Instead of ignoring you, or even calling you out, however, she struts over to you. The scheming bartender smiles down at your intoxicated form.");
		output("\n\nShe shakes her head and sighs, <i>“Alright, let’s get this over with,”</i> before grabbing you by the head and shoving your [pc.lipsChaste] into hers. Her tongue dives into your mouth, scooping out every last drop of cum-laced booze she can find before pulling off with a husky sigh, and then a shuttering moan as her cum cascade begins.");
		output("\n\n<i>“The things I do for a piece of that ass.”</i>");
	}
	output("\n\nShe leads you down the bar to the end, where she exits. When she comes from behind it, the whole bar is treated to the sight of her balls obscenely spilling out underneath her skirt. The twin orbs slosh and throb as Kally throws up a <i>“Break Time”</i> sign. She yelps as they jump several inches in size, seemingly spurred on by the wandering eyes of the bar patrons. She roughly grabs your arm and brings you in close. There’s a distinct look of embarrassment on her face as she does so. <i>“Mmmpf! Come on, let’s get out of here while I can still walk!”</i> The ballooning bartender drags you away from the main area and toward her room.");

	output("\n\nHer gait widens awkwardly as you approach, her legs stretched wide by her swelling sack. <i>“I don’t know if it’s just you or if that was a <b>real</b> nice batch, but my girls are going nuts down there!”</i> When you reach the door Kally unlocks it and then practically kicks it in. She hurls you toward the bed, letting you flop down onto it under your own cumbersome weight.");
	currentLocation = "CANADA8";
	generateMap();
	clearMenu();
	addButton(0,"Next",kallyKissCumSurprise2);
}

public function kallyKissCumSurprise2():void
{
	clearOutput();
	showKally(true);
	output("Kally moves up to the side of the bed in front of you and groans under her breath as her balls undergo another growth spurt, swelling past her knees. <i>“Ugghh. You want a drink, sugar? Tap’s right here.”</i> Her beast-dong juts out in front of you, desperately erect and ");
	if(kally.cumQ() < 8000)  output("dripping");
	else if(kally.cumQ() < 16000) output("drooling");
	else output("leaking");
	output(" her heady pre.");

	output("\n\n");
	if(pc.isBimbo()) 
	{
		output("You squeal excitedly and open your mouth as wide as possible, pointing at your open maw and nodding your head excitedly. Kally licks her lips at the sight of your eagerness. <i>“I knew you’d be up for it. You’re always so thirsty, aren’t you?”</i> You nod even harder, opening your mouth so hard that your jaw starts to hurt. <i>“Alright, settle down there, we’ll get ya served up quick.”</i> She puts her cock right up against your [pc.lips], causing your eyes to start drifitng into your skull just from the smell right before she rears back and gets ready to thrust in. Here it comes!");
	}
	else 
	{
		output("That is why you did this in the first place, right? You open your mouth as far as you can");
		if (kiroSexed()) output(", thankful that Kally is nowhere near as massive as her sister,");
		output(" and look up at her with puppy - dog eyes. Kally licks her lips, <i> “Hun, I can promise to hold back all I want, but you give me that kinda look, I can’t even lie to ya. Take a deep breath and get ready, I’m coming in !” </i> She presses her cock against your [pc.lips] and rears back to thrust in.");
	}
	output("\n\nYou choke as you feel her length spear into your throat");
	if(pc.canDeepthroat()) output(", uninhibited by any sort of stupid gag reflex");
	else output("with ease as your inebriated state has weakened your gag reflex to uselessness");
	output(". Kally sits there for a moment, her thighs and still-expanding balls twitching against your face as she sputters. <i>“D-damn. Sorry, Steele! I didn’t mean to bottom out that quick. Guh. Fuck it! You’re good with that right? Cause I don’t think my big ol’ hips are gonna slow down!”</i>");
	output("\n\nShe grabs you by the ");
	if(pc.hasHair()) output("[pc.hair]");
	else output("back of the head");
	output(", extracts her cock from your mouth, giving you a scant second to get your breath back, before ramming back in with a loud groan. True to her word, her next thrust is just as impactful as the last one. Your face is repeatedly smothered in the dark fur of her crotch as she pounds you relentlessly. Spit flies all around the room, flung out by the sheer force of her facefucking.");
	output("\n\nYou wonder what happened to make her so ravenous, until you feel the bed shake. Looking down as best as you can, you can see that Kally’s balls are almost touching the floor at this point! She’s desperate to cum, and do it while she can still move. Darting your eyes back up, you see that hers have almost completely screwed into her head, and that her tongue is lolling out, completely uncontrolled.");
	output("\n\n<i>“D-damn it! Sorry hun, but there’s soooooooo much cum, I can’t help it!”</i> Through her brutal face reaming, you can feel the flow of her pre quickly getting thicker and more voluminous. Her shaft is following suit, throbbing and pulsing as it grows thicker, getting ready for what’s shaping up to be an immense climax. <i>“C-cumcumcummingcumming! Take my cum you sluuuuuuuuuuuuuut!”</i> She yells as she bottoms out in your throat and starts pumping her load into your stomach.");
	output("\n\n");
	//Base Kally:
	if(kally.cumQ() < 16000) output("You feel her underside bulge against your tongue as her urethra dilates and expels huge blasts of her intoxicating cum into your gut. Each one feels like an atomic bomb, sending numbing, blissful sensation quaking throughout your whole body. You’d be complaining about her not pulling out right now if you didn’t feel like you could breathe her jizz. It doesn’t even matter to you that your [pc.belly] looks like a blimp, it’s all worth it to get a taste of that sweet ‘nuki nookie juice!");
	else output("Her whole dick bloats as her overloading virility blasts through it. Your [pc.belly] balloons out to capacity on the first shot. By the third, you look like a living waterbed, and she just keeps going! <i>“Da-damn it, Kiro! Why did these stupid drugs have to work so weeeeeeeell!”</i> Her voice raises higher and higher as she struggles to cope with her own output. Thankfully, with the sheer amount of alcohol swimming around in your system, you’re not even uncomfortable. Everything is so light and warm that you feel like a stiff breeze could just carry you off, and that’d be fine.");
	output("\n\nWilling as you are to take her loads, it soon becomes physically impossible. Kally’s cock is forced out of your mouth by the pressure, as you cough up gouts of her alcoholic jizz. The rest of her orgasm is spent painting you");
	if(kally.cumQ() >= 16000) output(" and the room");
	output(" white with the remains of her extensive climax. You’re so drunk that you can’t even see straight, all you can hear is the sound of cum splashing down to the floor; at least until Kally starts shouting.");

	output("\n\n<i>“Are you serious!”</i> It’s a struggle, but you manage to drag your eyes up and focus them enough to see what she’s yelling about. Her sack is still massive, though not nearly as much as before, and it’s starting to fill again. The almost hungry way she looks at you, not to mention her still raging erection, tell you that this is nowhere near over. She moves behind you and gets on the bed. You’re not able to turn your head to see what she’s doing, but it’s easy to tell when you feel her hands grab your [pc.ass]");
	output("\n\nSorry, hun, but I’m gonna pop if I don’t drain these puppies some more!”</i> She scoops up some cum off of you and you can hear her slicking up her cock with it. Her tip presses against your [pc.anus] and not even a few seconds pass before she drives it in. Your drunk state combined with her copious lubrication make the trip painless, which is good because she doesn’t intend to go easy on you.");
	output("\n\nKally rams your ass like a wild beast, never even bothering to warm you up. Her colossal sack slams into your booty with each thrust, sending the both of them jiggling wildly. Eventually it becomes big enough that it just sits there, weighing against you as it engorges even more. Kally is completely lost at this point, every thought in her mind melting away as she chants <i>“f-fuckcumfuckgottacumcumgottacuuuuuuuuuuuuuum!”</i> You yourself are too far gone to care either. At this point you’re having trouble even staying conscious, despite Kally banging so hard on your backdoor.");
	output("\n\nThe combination of her last orgasm, combined with the ferocity of her fucking sends her over the edge very quickly. She bottoms out as her voice pitches up a few octaves. Her cum flows through your body, joining up with the reservoir already sitting in your gut to give you a full-body feeling of warm fullness.");
	output("\n\nIt’s all too much for you to handle. Your eyelids feel like lead, and there’s no way you can stay awake, even while Kally seems to be rearing up for round three.");
	processTime(20);
	pc.orgasm();
	pc.loadInMouth(kally);
	processTime(20);
	pc.applyCumSoaked();
	pc.loadInAss(kally);
	processTime(15);
	//Doing it this way to let some of the drunkeness spam happen
	eventQueue.push(endKallyDrunkoMouthyButtFuntimes);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function endKallyDrunkoMouthyButtFuntimes():void
{
	clearOutput();
	showKally();
	output("You wake up stars know how long later with a raging headache. You’re still in Kally’s room, but it’s nowhere near as flooded as it was while you were going at it, so you can surmise that at least an hour has gone by. You’re also still tipsy, but it seems like she did a good job draining you so you’re not wasted all day");
	if(pc.bellyRating() >= 50) output(" (you still have a good belly on you though)");
	output(".");
	output("\n\nKally walks out of the bathroom with a soaked mop and freshly emptied bucket in hand. She smiles when she sees that you’re awake. <i>“Morning, hun. Just got done cleaning up. Don’t worry, wasn’t anything I haven’t had to deal with on my own, other than draining you out, of course.");
	//first time, haven’t fucked Kally before:
	if(kallySexedCount() == 0) output(" I’m normally not so loose when it comes to drunk barflys, but most of them aren’t as pushy as you. Not that I mind that, so long as we keep it back here.”</i> She shoots you a sultry look while her cock visibly pulses under her skirt. <i>“");
	output("Anyway, I gotta go take these back down to the janitor’s closet. You just take a load off and come down when you’re ready.”</i> She steps out of the room, leaving you to stew over.");
	output("\n\nAfter a few minutes of drunken lounging you drag yourself out of Kally’s bed and downstairs, where the busy bartender gives you a knowing wink before getting back to work.");
	currentLocation = "CANADA5";
	generateMap();
	processTime(120);
	IncrementFlag("KALLY_DRUNK_SNOWBALL_FUCKED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

