//Author: Savin

//Add to Room Descript:
public function queensRoadBonusShit():Boolean
{
	//Not Talked: 
	if(flags["MET_SEIFYN"] == undefined)
	{
		output("\n\nA young ");
		if(CodexManager.entryUnlocked("Nyrea")) output("nyrea ");
		else output("alien ");
		output("woman with spiky black hair pulled back into a ponytail is standing behind one of the stalls, hawking her wares with a song-like voice, trying to entice the passing crown of ");
		if(CodexManager.entryUnlocked("Nyrea")) output("nyrea ");
		else output("women like her ");
		output("and other deep-dwellers.");
		addButton(0,"Merchant",approachSeifynFirstTime,undefined,"Merchant","See what the very vocal merchant girl has to offer.");

	}
	else 
	{
		output("\n\nSeifyn is standing behind her stall, hawking her wares in her loud, lyrical voice. Seeing you nearby, her tune seems to get a little brighter.");
		addButton(0,"Seifyn",repeatSeifynMeeting,undefined,"Seifyn","See what Siefyn’s got to offer you.");
	}
	return false;
}

//[Merchant]
//Tooltip: See what the very vocal merchant girl has to offer.
//First Time
public function approachSeifynFirstTime():void
{
	clearOutput();
	showSeifyn();
	output("You wander over to the girl’s stall, just as she’s leaning over the counter to try and entice a passing ");
	if(CodexManager.entryUnlocked("Wetraxxel")) output("wetraxxel");
	else output("black-plated bug-man");
	output(" with a curved sword that looks too big for her, and too small for him. He grunts brusquely at her, four-part mandibles opening to reveal a row of sharp fangs. The merchant girl recoils, until she notices you approaching and recovers with a wide smile on her cyan-painted lips.");

	if(!CodexManager.entryUnlocked("Nyrea"))
	{
		output("\n\nYour Codex beeps as you get close. <i>“Warning: nyrea encountered. This species’ females are known to be extremely hostile, and may attempt to use unsuspecting travelers as breeding stock or as incubation space for her eggs. Caution is recommended, especially around the species’ pseudo-penis.”</i>");
		CodexManager.unlockEntry("Nyrea");
	}
	output("\n\nThe way she’s leaning over her stall’s counter, you’re treated to a good look at the insectile woman: she’s a being of cream-pale skin and dark tan chitin that forms long gloves and leggings for her, and a natural corset that hefts up her handsome little C-cups. She’s wearing only a fur-padded chainmail bra and a short cloth skirt that doesn’t quite reach her knees... and is probably giving the people behind her a particularly excellent view while she’s leaned forward.");
	output("\n\nShe’s got a head of pitch black spiney hair pulled back into a ponytail down her back, and a pair of very long, tapered ears that play host to almost a dozen piercings each. The woman smiles brightly as you walk up to her stall.");
	output("\n\n<i>“Hey, you’re new!”</i> she chirps, setting the curved blade on the counter and crossing her arms. <i>“One of those star-walkers, right? C’mon over, I bet I’ve got just the thing for you!”</i>");
	output("\n\nThe nyrea girl makes a sweeping gesture towards her array of wares: primitive weapons, vials of liquids ranging from clear to sludge-like and opaque, and even a small rack of clothes and jewelry. She’s got a little of everything, it looks like.");
	output("\n\n<i>“I’m Seifyn, by the way,”</i> she says, black eyes following you as you peruse her wares. <i>“I buy and sell pretty much anything. Weapons, armor, drugs... anything you need, I’ve got. Or can get, anyway.”</i>");
	output("\n\nYour eyes, however, find themselves more and more on the wares she’s got herself - the firm breasts held by her chain bikini-top, and the flared hips straining the band of her skirt. She’s pretty cute, all things considered...");
	output("\n\nYou introduce yourself with a smile, and glance at what she’s got on offer.");
	flags["MET_SEIFYN"] = 1;
	processTime(4);
	//Her Menu
	seifynMenu();
}

//Repeat Greeting
//Tooltip: See what Siefyn’s got to offer you.
public function repeatSeifynMeeting():void
{
	clearOutput();
	showSeifyn();
	output("<i>“Hey, [pc.name]!”</i> Siefyn says, flashing you a broad, blue-painted smile as you approach. <i>“Welcome back. I’ve got a full stock for you today: weapons, armor, drugs, anything you need! Take a look and tell me if anything piques your interest!”</i>");
	processTime(1);
	//Her menu
	seifynMenu();
}

public function seifynMenu():void
{
	showSeifyn();
	clearMenu();
	addButton(0,"Buy",seifynShopScreen,true);
	addButton(1,"Sell",seifynShopScreen,false);
	addButton(2,"Talk",seifynTalkMenu);
	addButton(14,"Leave",mainGameMenu);
}

public function showSeifyn():void
{
	showName("\nSEIFYN");
	showBust("SEIFYN");
}

public function seifynShopScreen(buy:Boolean = true):void
{
	shopkeep = chars["SEIFYN"];
	chars["SEIFYN"].keeperBuy = "“You wanna buy something? Great! Take a look around, let me know if anything catches your interest!”</i>\n";
	//List prices and whatnot. Back should go back to SEIFYN's main menu.
	//Sell Menu
	chars["SEIFYN"].keeperSell = "<i>“Wanna offload something? I buy all sorts of stuff - especially star-walker stuff! One of your magic swords or guns could make a fortune down here!”</i>\n";
	chars["SEIFYN"].keeperGreeting = "RUH ROH! SOMETHING WENT WRONG.";
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	if(buy) buyItem();
	else sellItem();
}


/*
//Seifyn’s Stuff
//Can Buy, Sell, and Talk. Sief’s sold items are a little cheaper than they are elsewhere - after all, she’s for-fucking-ever away from anything. Gotta do what you can to make a buck!

output("\n\n//Red Myr Venom");

*/

//Talk
public function seifynTalkMenu(arg:Function = undefined):void
{
	showSeifyn();
	clearMenu();
	//Credits
	if(arg == seifynCreditTalk) addDisabledButton(0,"Credits","Credits","You just had this discussion.");
	else addButton(0,"Credits",seifynCreditTalk,undefined,"Credits","You have to admit, it’s a little surprising that she’s willing to take credits. How are they useful to her?");
	//Nyrea
	if(arg == seifynNyreaTalk) addDisabledButton(1,"Nyrea","Nyrea","You just had this discussion.");
	else addButton(1,"Nyrea",seifynNyreaTalk,undefined,"Nyrea","Ask about her species.");
	//Taivra
	//PC has done the Nyrea talk. Hasn’t done the Nyrea Palace dungeon.
	if(arg == seifynTaivraTalk) addDisabledButton(2,"Taivra","Taivra","You just had this discussion.");
	else if(flags["SEIFYN_NYREA_TALK"] == 1 && 9999) addButton(2,"Taivra",seifynTaivraTalk,undefined,"Taivra","Ask about the nyrean queen she mentioned.");
	else if(9999) addDisabledButton(2,"Taivra","Taivra","Maybe you should ask about the Nyrea first.");
	else addDisabledButton(2,"Taivra","Taivra","Seifyn doesn't want to discuss this with you.");
	addButton(14,"Back",seifynMenu);
}

//Credits
//You have to admit, it’s a little surprising that she’s willing to take credits. How are they useful to her?
public function seifynCreditTalk():void
{
	clearOutput();
	showSeifyn();
	output("When you broach the subject of credits, Siefyn gets a huge smile and reaches under her stall’s counter, producing a huge, bulky cash register that’s had some kind of Confederate-tier tech bolted onto the side. <i>“I stole this from some gold myr shop,”</i> she announces proudly, patting the register’s tin top. <i>“My friends and I found this when we went up to the myr tunnels to loot. You can find all sorts of cool stuff the myr leave behind, especially back when they were fighting all the time. We found a shop that got abandoned near the edge of a town. Must have been recent; there were these glowing figures floating above - star-walker technology! Still had this sitting inside it, and I figured it might be useful if any of your star-walkers every made it down here. Guess I was right!”</i>");
	output("\n\nInteresting, though that still doesn’t explain how she actually gets any use out of it.");
	output("\n\n<i>“Oh, well, I trade them with some of the explorers and traders that work in the upper caves. They can spend your credits when they go back up, and I get first dibs on star-walker items they bring back. It’s a really good deal!”</i> she grins, waving a hand over a small collection of modern knick-knacks on her shelves. <i>“I’ve never been up to the surface myself, but a lot of the huntresses get close. Some of them can trade with the red myr - they’ve got some nyrea from another continent in their army, I guess, and they don’t mind doing business with us.”</i>");
	output("\n\nOut of curiosity, you ask, <i>“What kind of currency do you normally use down here?”</i>");
	output("\n\nSiefyn shrugs. <i>“Barter, mostly. A lot of us trade in gemstones and crystals, and everybody likes gold and platinum, though we don’t have a proper mine anywhere nearby. Every time we find one, one of the stupid myr armies rushes down and kicks us out. Queen Taivra ");
	if(9999 == 0) output("has been");
	else output("was");
	output(" pushing for us to make coins, like the myr do, but a lot of the huntresses ");
	if(9999 == 0) output("are still resisting her rule");
	else output("resisted her rule right to the bitter end");
	output(". I guess we’ll just keep trading for now.”</i>");
	processTime(7);
	seifynTalkMenu(seifynCreditTalk);
}

//Nyrea
//Ask about her species.
public function seifynNyreaTalk():void
{
	clearOutput();
	showSeifyn();
	output("<i>“Mind if I ask you about the nyrea?”</i> you ask.");
	output("\n\n<i>“Sure, I guess,”</i> Siefyn says, resting her elbows on the counter and her chin in her hands.");
	if(9999) output(" <i>“Though if you want to know about our town, you should probably ask Queen Taivra.”</i>");

	output("\n\nYou drag your eyes off the tops of her breasts peeking through between her arms and ask your first question that pops into your head. <i>“So how come none of you are attacking me? All the nyrea outside have been pretty hostile.”</i>");
	output("\n\nShe pouts, pursing her blue lips at you. <i>“We’re not </i>all<i> like that, you know. I mean, a lot of us are - especially the females. Some of them can be kind of crazy - but not all of us. Queen Taivra ");
	if(9999) output("has made a real town out of us. Spent years gathering us all into her harem before settling down here, and put us to work making a village we could all be proud of!");
	else output("tried to make a town out of us. Before she died//left, anyway. Spent years gathering us all into her harem before settling down here, and put us to work making a village we could all be proud of!");
	output("”</i>");
	output("\n\nWait a second. You’d chalk that up to a translator microbe error, but... <i>“Do you mean </i>you’re<i> not a female?”</i> you ask, glancing down at the nyrea’s girl’s full chest.");
	output("\n\n<i>“Oh! I-I guess you’ve never met a nyrean male, have you?”</i> she chuckles nervously, running a hand through her long, spine-like hair. <i>“Yeah, I’m a male. Sorry, sometimes I forget most other races work, um... differently.”</i>");

	//if Codex not read:
	if(!CodexManager.entryViewed("Nyrea")) 
	{
		output("\n\nSo, does that mean she has a dick?");
		output("\n\n<i>“Ew, no!”</i> Siefyn grimaces, waving her hands. <i>“Dicks are for girls!”</i>");
	}
	output("\n\n<i>“So, how exactly </i>do<i> nyrea work, then?”</i> you press, hoping you’re not about to offend the only merchant who can do business with you for miles around.");
	output("\n\nYou see a faint red blush rise on the merchant-girl... boy’s?... cheeks. <i>“Um, uh... wow, I don’t think I’ve ever been asked that by anybody but my daughters. O-okay, if you don’t know...”</i>");
	output("\n\nShe blushes even darker, prompting you to tell her she doesn’t have to explain  if she doesn’t want to. You could always read your Codex...");
	output("\n\n<i>“No, no, it’s okay!”</i> she says, forcing a laugh. <i>“Well, um, like I said, I’m a nyrean male. It’s fine to talk about us males with ‘she’ and ‘her’ and all that, by the way. That’s how our language treats us, anyway. So, males like me have a, uh, genital slit between our legs...”</i>");
	output("\n\nAs she’s speaking, Siefyn crosses her legs, brushing a hand along her skirt from just below the band and up along her stomach, tracing her long fingernails across the dark tan plates of her corset. <i>“Near our stomachs, we’ve got a bunch of sperm sacs, kind of like where someone like a wetraxxel might have her womb. The sacs get ruptured during sex, and the female sucks up the sperm by the bucketful. A lot of females make us use our sac stores to incubate their eggs, too. They’ll oviposit us at the same time they’re draining our sperm, use the sacs that’re left like cushions to protect the eggs we’ve just fertilized.”</i>");
	output("\n\n<i>“That sounds... incredibly painful.”</i>");
	output("\n\n<i>“It’s not!”</i> Seifyn assures you, now laying her hand flat across her belly. <i>“Most females aren’t very gentle about it... and usually don’t give us little males much of a choice about it... but it’s still the most amazing feeling in the world. I’ve never felt so... so complete as when I’ve been with a belly full of eggs. And the pleasure of the act is overwhelming. I’ve lost consciousness more than once when a female’s decided to ‘gift’ me with her get. I just wish more females were kind about it. So many of them are like Queen Taivra: they don’t take no for an answer.”</i>");
	output("\n\nYou nod your understanding, such as it is, and ask her to talk more about nyrean women.");
	output("\n\n<i>“Female nyrea are bigger and more aggressive than us males - and they’ve got the dicks, too. Females have big shafts they absorb sperm and lay eggs through. Sometimes at once. They’re wonderful when they’re gentle and kind, but most of them are just dominate by their libidos. That’s why Queen Taivra ");
	if(9999 == 0) output("didn’t");
	else output("doesn’t");
	output(" allow many females around here. Almost everyone in town here is a male, actually. Not many females can keep it in their pants, especially when their eggs are swollen up and desperate to be fertilized.”</i>");
	output("\n\nSounds like there’s a pretty pitched battle of the sexes among nyrea.");
	output("\n\n<i>“And amid them, too,”</i> Siefyn says with a chuckle, the blush finally fading from her cheeks. <i>“Females can be really territorial, especially about their mates. They fight for dominance all the time, and we usually end up calling most of them betas, and the really strong ones alphas. The ones who win the fights a lot, and get to have a lot of subservient males and females to carry their eggs.”</i>");
	output("\n\n<i>“So females can get forced to carry eggs too?”</i>");
	output("\n\nSiefyn nods. <i>“They can oviposit pretty much anywhere: a male’s genital slit, the vagina of any other race, even, uh, asses... anywhere warm and snug she can lodge her eggs, really. Some alphas really fetishize breaking in beta females to fill full of eggs. I have to admit, I kind of get a thrill seeing some female that tried to grab me months ago walking through the market with a bellyful. What comes around, right?”</i>");
	flags["SEIFYN_NYREA_TALK"] = 1;
	processTime(13);
	seifynTalkMenu(seifynNyreaTalk);
}

//Taivra
//Ask about the nyrean queen she mentioned.
//PC has done the Nyrea talk. Hasn’t done the Nyrea Palace dungeon.
public function seifynTaivraTalk():void
{
	clearOutput();
	showSeifyn();
	output("<i>“So, you’re part of this Queen Taivra’s harem?”</i> you ask, thinking back to your previous conversation.");
	output("\n\n<i>“Sort of,”</i> Siefyn says, absently fiddling with the strap on her chain bikini top. <i>“Queen Taivra keeps a harem of her favorite girls in the palace - in the big cave with the gate west of here. Technically, here harem is maybe... I want to say two hundred of us? She spent years rounding us up from the caves here before she founded the town. We’ve all been forced to pleasure her at least once. Most of us have carried her eggs, too. But after that, she’s usually quite content to let us live out here in peace.”</i>");
	output("\n\nLooking the cute nyrea cunt-boy up and down, you ask <i>“So you’re not exactly intimate with your queen?”</i>");
	output("\n\nShe laughs at that, a hearty chuckle that makes her small breasts bounce in thoroughly pleasing way. <i>“No, no... I barely know her. Once a month or so, she’ll come down through the village to visit a male she misses, or to lay a clutch in one of her beta females, but she rarely leaves her palace anymore. I haven’t shared her bed in years, honestly. I was bathing in the lake when, all of a sudden, she and several of her guards arrived. She barely recognized me... not that that stopped her from making me fertilize a clutch of eggs on the spot. And carry them for her.”</i>");
	output("\n\nSo Siefyn’s a father, then?");
	output("\n\n<i>“Several times over!”</i> she says proudly, patting her plated belly. <i>“I’ve given Queen Taivra four clutches, plus two more I was forced into by other huntresses before I was mated by the queen. I’ve sired forty-two children - not a bad little brood, if I do say so myself!”</i>");
	output("\n\nThat’s a pretty incredible number. <i>“Did you raise them all?”</i>");
	output("\n\n<i>“As far as we nyrea do. We grow up quickly... I nurse my young for a few weeks, then let them grow as they will after that. They’re ready to hunt for themselves about three months after they hatch, and most of them have left me after that. They’d be ready to breed only a month or so later, after all. We age very quickly compared to the myr... and your race, too, by the look on your face!”</i> she laughs. <i>“I admit, I miss my daughters sometimes, but I don’t think I could handle the stress of protecting forty-two children for years and years like myr do. It’s too dangerous here for that.”</i>");
	output("\n\n<i>“Even in the village?”</i>");
	output("\n\nShe shrugs. <i>“Well, I don’t really get to see the queen’s children. When we lay a clutch of hers, one of the betas swoops down from the palace and takes them to the queen’s harem chamber for her nurses to raise. That’s... kind of heartbreaking, every time, but I understand why. Queen Taivra loves her children so much, and they’re so much safer there. Most still end up leaving the village in the end, especially the females, but more and more of our children are starting to stay here... to settle down, just like their sires did.”</i>");
	output("\n\n<i>“Some of my daughters actually live here in the village. Only a few, but it’s so nice to have them nearby. We’re not... close... but I like seeing them safe all the same. I guess it’s the best I can really ask for,”</i> she says, oddly cheery.");
	output("\n\n<i>“If most of your children end up leaving... could you leave if you wanted to?”</i>");
	output("\n\nSeifyn blinks, staring at you for a long moment. <i>“I... I guess? I could pack my bags and sneak off in the night if I wanted to. I doubt Taivra would send her betas out to chase me down if I did, but... why would I? Life’s not perfect in the village, but it’s a lot safer that living on my own out in the caves. I have a home here. A bed, a shop of my own, even friends. I remember sleeping on rocks all alone, having to keep one eye open for a horny female... or some other creature... trying to jump me in my sleep. Even if I was incredibly careful, somebody could just come up and overpower me, and there’d be nothing I could do about it. I’d trade all of that fear and anxiety for having to bear children for and give service to a woman I barely know any day.”</i>");
	if(flags["SEIFYN_TAIVRA_TALK"] == undefined) 
	{
		output("\n\nThere’s not much left of Siefyn’s normally cheerful disposition by this point. She’s leaning far foward over her counter, arms crossed and eyes down on the stone floor of the marker. A few nearby merchants have stopped to glance at her... you hadn’t even noticed how loud her voice had grown.");
		output("\n\nYou");
		if(pc.isAss()) output("’re about to step back");
		else if(pc.isBimbo()) output(" ask if a good fuck would cheer her back up");
		else output(" comfort her");
		output(", when another nyrean male walks over to her and puts a hand on her shoulder, rousing Siefyn enough to turn her around.");
		output("\n\n<i>“You alright, father?”</i> the nyrea asks with a concerned smile.");
		output("\n\n<i>“V-vesryn?”</i> the merchant blinks. <i>“I’m fine, sweetie. I was just talking to [pc.name] here... I guess I upset myself. Just bad memories.”</i>");
		output("\n\nThe other nyrea - one of Siefyn’s daughters - gives you a reproachful look and squeezes her father’s shoulder. You decide to let the two of them catch up, and quietly walk back into the crowd.");
		flags["SEIFYN_TAIVRA_TALK"] = 1;
		processTime(16);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	seifynTalkMenu(seifynTaivraTalk);
}