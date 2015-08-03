

//Add to the Gates of Taivra’s Palace square”</i>

public function taivrasPalaceSquareBonus():Boolean
{
	//if Praetorian fight not won:
	if(flags["FOUGHT_PRAETORIANS"] == undefined)
	{
		output("\n\nA pair of nyrea huntresses stand in front of the towering stone gates, under the light of a pair of <i>“torches”</i> filled with glowing blue fungus. The pair of women are clad in bands of metal armor in addition to their trademark bikini mail, and each holds a long spear in her hands. They look impassively at you, but make no move to attack.");
		//[Approach]
		addButton(0,"Approach",approachNyreanGuardsFirstTime,undefined,"Approach","Talk to the nyrea guards and see if you can get passage past the gate. You’re almost sure the coordinates you got for Dad’s probe lead to a position right near here...");
	}
	//{if PC has done Praetoran fite:}
	else
	{
		//KING NYREA!
		if(9999 == 0)
		{
			output("\n\nA pair of nyrean huntresses in light armor and carrying spears stand outside the gates, staring impassively into the corridor. When you approach, they awkwardly press their open palms to their hearts and bow. <i>“My liege,”</i> one of them says by way of greeting.");
		}
		//within 12 hours:
		if(flags["PRAETORIAN_RESPAWN"] != 0 && flags["PRAETORIAN_RESPAWN"] != undefined) output("\n\nA squad of armed and armored nyrean huntresses are scattered around the ground, recovering from the ass-kicked you gave them earlier. When they see you standing around, they either get small or play dead in a hurry.");
		//13+ hours, BEAT DUNGEON SOME OTHER WAY!
		else if(9999 == 0) 
		{
			output("\n\nThe gates are sealed, and nobody is standing outside. There doesn’t seem to be any way you can get the gate open without a lot of help...");
			//9999 make sure gate be sealed yo?
		}
		
		//13+ hours, PC hasn’t finished dungeon OR PC got rekt by the Praetorian last time:
		else
		{
			output("\n\nThe queen’s bodyguard seems to have recovered and are prepared to fight you off again!");
			//PC can’t advance past until they [Fight], which leads straight into another battle.
			clearMenu();
			addButton(0,"Fight",startCombat,"Nyrean Praetorians");
			return true;
		}
	}
	return false;
}

//[Approach]
//Talk to the nyrea guards and see if you can get passage past the gate. You’re almost sure the coordinates you got for Dad’s probe lead to a position right near here...
public function approachNyreanGuardsFirstTime():void
{
	clearOutput();
	showName("NYREAN\nGUARDS");
	output("You walk over to the guards, hoping to talk to them. Instead, the guardswomen plant their feet and cross their spears over the heavy stone gate, an unnecessary but obvious sign that you’re about to be refused passage.");
	output("\n\n<i>“Turn back, star-walker,”</i> one of the women says; the other twists her black lips into a distinct frown. <i>“Queen Taivra has decreed no more offworlders are to be permitted in the palace. Your kind have done us enough insult.”</i>");
	output("\n\n<i>“What?”</i> you ask. Definitely weren’t expecting that answer.");
	output("\n\nThe other guard grunts. <i>“Our queen was attacked by one of you space-creatures. One who said " + pc.mf("he","she") + " wished to talk diplomacy. We will not suffer such an insult again... you kind is no longer welcome here.”</i>");
	output("\n\nShit. Something tells you this sociopathic star-walker they’re talking about just might be your dear cousin " + chars["RIVAL"].mf("Jack","Jill") + "...");
	processTime(2);
	//[Leave] [Attack] [Persuade]
	clearMenu();
	addButton(14,"Leave",mainGameMenu);
	addButton(0,"Attack",attackDemAntBiyotches,undefined,"Attack","Unfortunately for these bitches, you need to get into that palace. If your cousin’s inside, so too must be the probe...");
	addButton(1,"Persuade",tryAndPerseudeFutaBugSlootsToMooooove,undefined,"Persuade","Try and talk your way into the nyrean camp. Surely the three of you could work something out...");

}

//[Attack]
//Unfortunately for these bitches, you need to get into that palace. If your cousin’s inside, so too must be the probe...
public function attackDemAntBiyotches():void
{
	clearOutput();
	showName("NYREAN\nGUARDS");
	output("<i>“I’m going in. Like it or not,”</i> you tell the guards, drawing your [pc.weapon].");
	output("\n\nThe guards lower their spears at you, and one of them grabs a rope behind her, leading into the wall. A bell resounds inside, and a moment later the gate is creaking open and several more nyrean huntresses are pouring out. And suddenly, your odds look a little less great...");
	processTime(1);
	//[Fight!]
	clearMenu();
	addButton(0,"Next",startCombat,"Nyrean Praetorians");
}

//[Persuade]
//Try and talk your way into the nyrean camp. Surely the three of you could work something out...
public function tryAndPerseudeFutaBugSlootsToMooooove():void
{
	clearOutput();
	showName("NYREAN\nGUARDS");
	output("<i>“Come on, can’t we work something out?”</i> you ask, putting on your most diplomatic smile.");
	output("\n\nThe two guards exchange a glance, and one of them puts a hand on her hip. <i>“Hmm, at least this one understands parley. Very well, perhaps we could convince the queen to see you. If you have something of sufficient value...");
	processTime(1);
	clearMenu();
	//[Leave] [Sex] [Plat190] [Credits]
	addButton(14,"Leave",mainGameMenu);
	addButton(0,"Sex",sexYourWayIntoTaivras,undefined,"Sex","Sacrifice your dignity for diplomacy... fuck the guards to get in.");
	addButton(1,"Credits",bribeTaivrasGateGuards,undefined,"Credits","Offer to give the guards some credits. Surely they like good old bribery down here...");
}

//[Sex]
//Sacrifice your dignity for diplomacy... fuck the guards to get in.
public function sexYourWayIntoTaivras():void
{
	clearOutput();
	showName("NYREAN\nGUARDS");
	output("<i>“No,”</i> one of the guards scowls when you offer to let them have their way with you. <i>“We’ve an entire village of virile males down below. Exotic... and attractive... as you are, pleasures of the flesh aren’t worth the queen’s ire.”</i>");
	output("\n\n<i>“If that’s the best you have to offer, begone,”</i> the other guard says.");
	processTime(1);
	//[Next] back to map
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Credits]
//Offer to give the guards some credits. Surely they like good old bribery down here...
public function bribeTaivrasGateGuards():void
{
	clearOutput();
	showName("NYREAN\nGUARDS");
	output("You pull out your credit stick invitingly, only to receive confused looks from the guards. <i>“What’s that?”</i> one asks, snatching it and looking it over. <i>“Some kind of weapon?”</i>");
	output("\n\n<i>“No, no,”</i> you say, condensing an economics lesson into as few words as possible: you tell her that credits are star-walker money, and they can buy whatever they want that way.");
	output("\n\nThe other guard grabs the credstick out of the first’s hand and shoves it back into yours. <i>“Your money isn’t worth much down here,”</i> she says. <i>“We trade in gemstones and precious minerals. Not... imaginary money.”</i>");
	output("\n\nGemstones? Minerals? ");
	processTime(2);
	if(!pc.hasKeyItem("Platinum 190")) 
	{
		output("Where’re you going to get some of those?");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	else 
	{
		output("Oh, is that what they want...?");
		clearMenu();
		addButton(0,"Plat. 190",offerTaivraGuardsPlat190,undefined,"Plat. 190","Offer your chunk of Platinum 190. Surely these ladies can appreciate the rare beauty of precious metals!");
		addButton(4,"Back",mainGameMenu);
	}
}

//[Plat190]
//Offer your chunk of Platinum 190. Surely these ladies can appreciate the rare beauty of precious metals!
public function offerTaivraGuardsPlat190():void
{
	clearOutput();
	showName("NYREAN\nGUARDS");
	output("<i>“How about this?”</i> you ask, taking the chunk of gleaming platinum out of your pack.");
	output("\n\nThe huntresses’ eyes go wide, and one of them takes hold of the shard of ore and looks it over. <i>“It’s beautiful,”</i> she says, waving her comrade over. <i>“Where did you get this?”</i>");
	output("\n\nYou grin and explain that you found the shard in the heart of a dead, alien planet that had been sewn together from two other half-planets. It’s a rare and awesomely expensive isotope of platinum - surely it would fetch a good price down here in the depths, or if they try to sell it to an off-worlder.");
	output("\n\n<i>“This will do nicely,”</i> one of the guards smiles, slipping the platinum shard into a pouch on her belt. <i>“Very well, follow us. We can take you to the queen’s chambers, but I cannot guarantee she’ll want to listen to whatever you have to say.”</i>");
	output("\n\n<i>“Follow us,”</i> the other says, pushing the front gate open and beckoning you on.");

	//[Next] //To <i>“Meeting the Queen,”</i> as if you’d done the whole fucken dungeon. YA CHEETER.
	processTime(15);
	clearMenu();
	addButton(0,"Next",mainGameMenu,9999);
	pc.removeKeyItem("Platinum 190");
}

//Spear Flurry
//Several light Penetrating attacks.

public function spearFlurryNyreaShit():void
{
	output("Several of the huntresses leap forward from one side, jabbing their spears at your chest.");
	rangedAttack(foes[0],pc,true,1);
	output("\n");
	rangedAttack(foes[0],pc,true,1);
	output("\n");
	rangedAttack(foes[0],pc,true,1);
	output("\n");
	rangedAttack(foes[0],pc,true,1);
	output("\n");
	rangedAttack(foes[0],pc,true,1);
	processCombat();
	//{You manage to dodge, block, and parry every attack they send your way! // You block and dodge most of the attacks, but a few still manage to get through, hammering you down. // You try to defend yourself, but most if not all of the strikes get through, battering you brutally.}
}

//Backstab
//One heavy Penetrating attack that inflicts a bleeding/some crippling condition
public function nyreaGroupBackstabby():void
{
	output("Several of the huntresses attack you for the front, jabbing and stabbing and pushing you back. As they do, though, you ");
	if(combatMiss(foes[0],pc))
	{
		output("just barely notice another nyrea attempting to stab you in the back. You quickly spin around and shove her back, preventing the attack.");
	}
	else
	{
		output("fail to notice one of their sisters behind you grabbing a dagger and leaping to attack you, sinking the dagger into ");
		if(pc.shields() <= 0) output("you");
		else output("your shields");
		output(".");
		applyDamage(foes[0].meleeDamage()+20, foes[0], pc, "melee");
	}
	foes[0].energy(-10);
	processCombat();
}

//Posion Blade
//Light Penetrating attack, moderate Lust (Chemical) damage. Shields must be down.
public function poisonBlade():void
{
	output("One of the nyrea takes a pouch of some pulsating pink fungus from her belt and smears it all over the tip of her long spear. Once she’s done, the huntress leaps forward and lunges at you with her spear. ");
	if(combatMiss(foes[0],pc))
	{
		output("You manage to grab her spear before it can hit you, and you quickly snap the head off, tossing the poison aside.");
	}
	else
	{
		output("You try and dodge, but her sisters give you no room to maneuver; you end up getting sliced by it! Hissing with pain, you recoil and grab your bloodied [pc.skinNoun]... and quickly begin to feel the poison boiling through you, making your body burn with unbidden arousal.");
		applyDamage(new TypeCollection( { drug: 15, kinetic: foes[0].meleeDamage() } ), foes[0], pc, "minimal");
		//4 rounds of lust damage!
		if(!pc.hasStatusEffect("Aphro")) pc.createStatusEffect("Aphro",5,4,0,0,false,"APHRO_ICON","An aphrodisiac is in your blood, exciting you over time! It should fade quickly... unless you get redosed.",true,0);
		else 
		{
			output(" <b>The chemical in your blood is getting stronger!</b>");
			pc.addStatusValue("Aphro",1,3);
			pc.setStatusValue("Aphro",2,4);
		}
	}
	foes[0].energy(-5);
	processCombat();
}

//Spear Butt
//Bonk with spear for moderate Bludgeon damage. Chance to stun.
public function nyreanSpearButt():void
{
	output("One of the nyrea spins her spear around before swinging the blunt end at you like a club.");
	if(combatMiss(foes[0],pc)) output("\nYou dodge out of the way, narrowly avoiding a crushing blow.");
	else 
	{
		output("\nYou don’t manage to dodge in time, and get a thunderous wallop on the head for your trouble! You stagger back, clutching your aching head.");
		if(foes[0].physique()/2 + rand(20) + 1 > pc.physique()/2 + 10 && !pc.hasStatusEffect("Stunned"))
		{
			output(" <b>You are stunned!</b>");
			pc.createStatusEffect("Stunned",2,0,0,0,false,"Stun","You cannot act for one turn!",true,0);
		}
		applyDamage(foes[0].meleeDamage(), foes[0], pc, "melee");
	}
	foes[0].energy(-5);
	processCombat();
}

//Spear Wall
//Dramatically increases the Praetorians’ Dodge vs. Melee for a few turns
public function spearWallGoooo():void
{
	output("The huntresses form a tighter ring, shoulder to shoulder, and brace their spears against you. It’s almost impossible to move now, and getting closer to the huntresses is going to be damn hard.");
	//+50% dodge vs ERRYTHING.
	foes[0].createStatusEffect("Evasion Boost",50,0,0,0,false,"EVASION_BOOST_ICON","The nyrea have created a wall of spears, granting them a 50% evade chance!",true,4);
	foes[0].energy(-20);
	processCombat();
}

public function praetorianAI():void
{
	if(!foes[0].hasStatusEffect("Evasion Boost") && foes[0].energy() >= 20 && (rand(4) == 0 || foes[0].HP() < 100)) spearWallGoooo();
	else if(foes[0].energy() >= 5 && rand(6) == 0) nyreanSpearButt();
	else if(foes[0].energy() >= 5 && rand(4) == 0) poisonBlade();
	else if(foes[0].energy() >= 10 && rand(3) == 0) nyreaGroupBackstabby();
	else spearFlurryNyreaShit();
}

//PC Loses to the Praetorian
//Not a bad end! Huntresses gang-bang you and dump you in town. Have to attempt Praetorian fight again. Lose some credits, of course.
public function loseToPraetorianNyreaGangbangu():void
{
	clearOutput();
	showName("NYREAN\nGUARDS");
	output("You stumble to your [pc.knees], ");
	if(pc.lust() >= pc.lustMax()) output("too horny to resist the buxom babes trying to bring you down");
	else output("so badly beaten by the horde of guards that you can barely lift your arms up to fight back anymore");
	output(". A couple of the insectile amazons grab your [pc.weapon] and toss it aside; another grabs your ");
	if(!pc.isNude()) output("equipment and tears it");
	else output("gear and rips it");
	output(" aside, leaving you bare naked on the warm subterranean stone.");

	output("\n\n<i>“Another impertinent star-walker,”</i> the guard leader grouses, glowering down at you. <i>“Worse than the last, even.”</i>");

	output("\n\n<i>“We should teach... her? Him? Whatever this one is... a lesson,”</i> a second guard says, hooking her thumbs under the chain string of her bikini bottom. With a flick of her wrists, the nyrea drops her panties, letting the forearm-sized shaft of her ovipositor-slash-cock flop free between her legs.");
	output("\n\nYour eyes go wide as the prick-toting babe steps over to you and cups your chin, forcing you to look up and her, and rubs her ovi-cock against your cheek. The first huntress follows her sister’s example, grabbing the other nyrea’s ass playfully as she approaches you. She drops her undergarments and pushes you down onto ");
	if(pc.hasKnees() && !pc.isTaur()) output("your hands and knees");
	else output("the ground");
	output(", moving around behind you and pressing her flared prick to the ring of your [pc.asshole]. Other huntresses gather up, undressing and starting to stroke themselves while the lead pair get ready to spit roast you.");

	output("\n\n<i>“For the queen!”</i> the huntress in front of you whispers, barely audible, before grabbing the back of your head and forcing her cock down your throat. Your eyes bulge, and your body stiffens as your mouth is battered by her feline spines, and the turgid ball of her animalistic knot presses against your lips. Your throat is straining hard around her dick, bulging brutally and throbbing hard enough to make you moan like a bitch in heat.");

	output("\n\nBehind you, the other guard follows her example, pressing her hips forward against your exposed backside. You squeal, desperately trying to resist her anal assault, but ultimately succumbing to her strength: you feel your [pc.asshole] pop open with one final, brutal thrust, and then the nyrea is sliding into you, raking her nubby spines across your anal walls. Your gut bulges in response, straining to take the massive insertion. Around you, the other nyrea cheer and laugh, urging their sisters on with lurid shouts. All you can do is try and bear it, to endure the mix of pleasure and pain as you’re savagely violated.");
	pc.buttChange(foes[0].cockVolume(0));

	output("\n\nThe other huntresses gathered around you close the circle, jacking themselves off and drooling their vibrantly-colored pre all over you. Hands start to grab and grope at you, slapping your [pc.butt] and pinching your [pc.nipples]. A couple of them grab your [pc.hands], forcing you to stroke their ovipositor-cocks while their sisters pound you from front and back. Your eyes roll back, succumbing to pleasure; there’s nothing you can do but try to endure.");

	output("\n\nFor a moment, you think you’re blessed: the two huntresses abusing your mouth and ass cum quickly, splashing your throat and bowels with hot, sticky juices. The ones that are using your hands join them soon, splashing your cheeks and back with long ropes of their strange lubricant. You let out an exhausted sigh as the pair of huntresses pull out of you, letting you flop to the ground in a limp, well-fucked pile... only for another pair to hop in and take their places, letting others grab your hands");
	if(pc.hasCuntTail())
	{
		output(", your tail-cunt");
		if(pc.tailCount > 1) output("s");
		output(", any part of you they can use to get themselves off");
	}
	output(". Your [pc.asshole] is forced open again, and your mouth is soon home to another ovi-cock that mercilessly stretches your throat open.");

	output("\n\nAgain and again, the huntresses take their turns abusing your body, fucking you raw until you’re all but insensate, covered from head to [pc.foot] in their cum and reeking of sex. Every huntress takes her turn with you, some more than once, all jeering and laughing until they’ve had their fill of your helpless body. You lose track of how many times you cum");
	if(pc.hasCock()) output(", painting the ground beneath you [pc.cumColor] with your spunk");
	output(". Finally, the last of the cock-wielding amazons finishes with you, shoving you down onto your belly and into the puddle of spooge that’s formed underneath you.");

	output("\n\n<i>“That’s what you get for challenging the queen,”</i> the lead nyrea growls, stuffing herself back into her armor. <i>“You’re lucky she told us not to harm you offworlders - too much, anyway. You’re no longer welcome here, so take this as a lesson and begone.”</i>");

	output("\n\nThe other huntresses murmur their agreement, and you feel hands grabbing your [pc.legs] and starting to drag you away.");

	//3-4 loads in mouth and similar amount in butt?
	pc.loadInAss(foes[0]);
	pc.loadInAss(foes[0]);
	pc.loadInAss(foes[0]);
	pc.loadInAss(foes[0]);
	pc.loadInMouth(foes[0]);
	pc.loadInMouth(foes[0]);
	pc.loadInMouth(foes[0]);
	pc.loadInMouth(foes[0]);
	processTime(35);
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	currentLocation = "2I11";
	addButton(0,"Next",loseToPraetorianNyreaPt2);
}

//[Next]
public function loseToPraetorianNyreaPt2():void
{
	clearOutput();
	showName("NYREAN\nGUARDS");
	var lostCreds:int = 0;
	if(pc.credits > 0) 
	{
		if(10 > pc.credits * .2) lostCreds = 10;
		else lostCreds = pc.credits * 0.2;
		if(pc.credits < lostCreds) lostCreds = pc.credits;
	}
	output("You end up getting dumped back in the nyrea village you passed through, not far from the merchant row. The guards give you a few more harsh words and a little more teasing before they go");
	if(lostCreds > 0) output(" - and they even liberate you of " + num2Text(lostCreds) + " credits, too");
	output(". Several commoners look on with wide eyes as you’re dumped off, and the guards return to the palace.");

	output("\n\nYou groan and stagger back to your [pc.footOrFeet], thankful the nyrea left you your equipment. Gonna have to try again if you want to face your cousin and find the probe...\n\n");
	//[Next] //To map
	genericLoss();
}

//PC Victory vs. Praetorian
//Disables Praetorian fight for 12 hours. If PC clears dungeon, never fight them again. Otherwise they recover eventually.
public function spankDaShitOuttaPraetorians():void
{
	clearOutput();
	showName("NYREAN_GUARDS");
	output("<i>“Enough, enough,”</i> the lead guard says, stumbling to a knee and leaning heavily on her spear. <i>“We yield... no more, please.”</i>");
	output("\n\nThe other nyrea similarly show their submission, throwing down their spears and kneeling - those who can still manage to stand, anyway. You don’t want to risk staying here too long, or the guards might try and jump you: there’s far too many for you to keep an eye on all of them!\n\n");
	flags["PRAETORIAN_RESPAWN"] = 12;
	//Back to map. Praetorian fight can’t occur again for several hours.
	genericVictory();
}


//Palace Interior Descriptions
public function gateExteriorBonusNyreaVillage():Boolean
{
	output("You stand before a large, stone gate. Beyond it, you can hear the sounds of talking, and smell the alluring aroma of cooked meat.");

	//If not open: [Open Gate]
	return taivrasPalaceSquareBonus();
}
//Room 2E11 Gate Interior
public function taivrasGateInteriorBonus():Boolean
{
	output("The interior of the palace gates is a well-lit cavern with a high, vaulted roof and several pillars bearing fungal lanterns. A small guard post is set up just past the gates, a little room hollowed out of the rock and outfitted with a dozen or so chairs.");
	//if KingNyrea: 
	//9999 - maybe disable these if this is where the praetorian fight actually happens?
	if(9999 == 0) output(" Several of your nyrea warriors are milling around here, ready to stave off an enemy attack.");
	//elseif beat Praetorian:
	else if(9999 == 0) output(" The place has been cleared out, thanks to your forceful entrance.");
	return false;
}

//Room 2E13 Palace Thoroughfare
public function palaceThoroughfareBonus():Boolean
{
	output("A long tunnel runs east to west, T-boning north back towards the gates. A painted mural decorates the southern wall, showing ");
	if(flags["MET_TAIVRA"] != undefined) output("Queen Taivra");
	else output("an especially buxom, powerful-looking huntress");
	output(" wielding a spear and driving back a horde of horrible worm-like creatures in a darkened cavern. Several naked, afraid male nrea cling to her plated legs, cowering behind the amazonian warrior woman.");
	return false;
}

//Room 2C13 Queen’s Fountain
public function queensFountainBonusShit():Boolean
{
	output("This large, circular chamber has passages leading north, south, and east, each a squared-off tunnel with a simple silk curtain acting as a door. The center of the room is dominated by a natural fountain: a caldera of stone eroded in a perfect bowl shape in the floor, and filled with water that trickles down from a crack in the cavern’s ceiling.");

	//if PC is NyreaKing, 12 hours have passed since dungeon victory:
	if(9999 == 0) output("\n\nQueensguard, Taivra’s personal bodyguard, is standing here. Her shield is sitting on the ground beside her, and both hands are on the hilt of her sword. She favors you with a slight nod, saying <i>“My " + pc.mf("king","queen") + ",”</i> by way of greeting. It looks like she’s recovered nicely from the fight.");
	return false;
}

//Room 2C15 Queen’s Chambers
public function queensChambersBonus():Boolean
{
	output("You stand in a lavish bedchamber, staring at a more than king-sized canopied bed with lush pink silken sheets and blankets. A rack of simple swords and spears line the walls, none of which are worth your attention. A few pieces of art - sculptures, mostly - adorn the tops of a dresser and nightstand, as does a large fungus-filled lantern that glows with a soft blue light.");
	//Play <i>“Incubator Goo”</i> encounter on first entry.9999

	//if not NyreaKing:
	if(9999 == 0)
	{
		output("\n\nThe crystal-coated broodmother is ");
		//Lustbeat
		if(9999 == 9999) output("moaning and groaning in the corner, still locked in the throes of pleasure even after you had your way with her");
		//by physical:
		else output("cowering in the corner, arms and crystal plates wrapped protectively around her belly full of eggs");
		output(".");
	}
	//if NyreaKing & did Goofite:
	else
	{
		if(9999 == 9999) output("\n\nYou can see some gooey slop on the stone floor, near the little hatch Taivra’s pet broodmother goo lives in. You suppose she’s been out lately... probably so your mate could pump her full of a new batch of royal eggs.");
		//if NyreaKing & skipped Goofite:
		else output("\n\nYou can see some gooey slop on the stone floor, near one of the big carpets on the stone floor just under a gloryhole in the wall beside her bed.");
	}
	return false;
}

//[Search]
//Maybe you’ll find something useful in the queen’s chambers?
public function searchTheQueensChambers():void
{
	clearOutput();
	showName("\nSEARCHING...");
	output("You spend a few minutes tossing the room, looking for anything of value. Your search reveals several interesting finds: some sex toys made for the nyrea’s unique biology, some handcuffs and gags, and what looks like primitive pornography etched in stone tablets. Clearly the queen’s got a kinky side...");
	output("\n\nMore important to your quest, though, you find hidden away in her nightstand a <b>silver key</b> and a <b>satchel full of gemstones</b>. These will probably turn quite a profit...");
	output("\n\n(<b>Gained Key Item: Silver Key</b> - This must open something somewhere in the royal complex.)");
  	pc.createKeyItem("Silver Key",0,0,0,0);

  	//Add Silver Gate Key to Key Items
	//Add Gem Satchel to inventory. Worth about ~10k Creds when sold.
	//9999 sumbody get on dis
}

/*

output("\n\nGem Satchel");
output("\n\n//Tooltip: This is a satchel full of sparkling green gemstones. You could make a tidy profit selling this to a merchant - they don’t have much practical application, after all.");
*/

//Room 2C9 Stairway
public function taivrasStairwellBonus():Boolean
{
	output("A curving path connects the rest of the palace grounds to a large set of stairs, leading up to a pair of heavy stone doors flanked by brilliantly glowing blue lanterns. Through the door, you can hear the sounds of pleasure echoing, moans and cries of sexual ecstasy. Several of them, in fact.");
	//if Princess Defeated:
	if (9999 == 9999) output(" You’re surprised the harem is still going, even after freeing them from the queen’s daughter.");
	return false;
}

//Room 2A9 Harem Chamber
public function haremChamberBonusFunc():Boolean
{
	output("The harem chamber is a wide open stone room covered with pillows, cushions, and other comforts for the feminine males kept within it. An all but obscene amount of bondage gear - leather, cuffs, whips, and chains, plus no small number of dildoes and plugs - sit in racks along the walls. Several dozen <i>“male”</i> nyrea - all with plump bosoms, girly figures, and drooling vaginal slits - make up their queen’s harem.");

	//Post Princess battle:
	if(9999 == 0)
	{
		output("\n\nThe harem is currently taking their lusts and aggression out on the nyrean princess. Moans and cries of pleasure echo through the chamber, and the floor is covered with writhing bodies and squirting cum.");
	}
	//PC is KingNyrea:
	if(9999 == 0)
	{
		output("\n\nYour nyrea harem is lounging around on the cushions and couches. They do nothing to conceal their nudity as you observe them - indeed, some actively flaunt it, running their hands over hefty tits or spreading their pussy-lips invitingly. Others are busy with each other, groping and kissing and grinding their unique sexes against each others’ chitinous bodies.");
	}
	//[Use Harem] [Free Them] (see Princess and Harem stuff below)
	//9999 - check for conflicts between king nyrea & post princessbeat stuff
	return false;
}


//Room 2G15 Gateway
public function gatewayBonusFunc():Boolean
{
	output("You’re standing before a huge, imposing steel gate bearing the symbol of the queen: a shield with a spear pierced through it, and what looks like several tentacles wrapped around them both. The gate is currently ");
	if(9999 == 9999) output("sealed, barring your path. You’ll need to find a key to get the big, meaty padlock off of it.");
	else output("standing open, allowing you to enter the queen’s throne room.");
	output(" To your surprise, the gate isn’t guarded.");
	return false;
}

//Room 2E17 Throneroom
public function taivrasThroneBonusFunc():Boolean
{
	//PC executed Taivra:
	if(9999 == 0)
	{
		output("Queensguard, despite her wounds, is kneeling over the body of her queen and weeping quietly. As you demanded, she’s gathered the remnants of her soldiers - those who haven’t deserted into the caves - and ordered them to dismantle the queen’s throne from around your father’s probe, ready to deliver the probe outside for a Steele Tech team.");
	}
	//PC spared Taivra:
	else if(9999 == 0)
	{
		output("Queen Taivra is sitting on the edge of her throne’s dias, tending to the wounds her bodyguard suffered at ");
		if(9999 == 9999) output("your hands");
		else output("at Dane’s hands");
		output(". As you demanded, some of her warriors are dismantling her probe-throne, getting ready to dump it out into the village. The queen glowers at you, not in hatred, but in what you would almost call admiration. Clearly your ability to best her has made an impression on the nyrean queen.");
	}
	//PC is KingNyrea:
	else if(9999 == 0)
	{
		//First 12 hours after fight:
		if(9999 == 0)
		{
			output("Your newly-minted mate is sitting on the edge of her throne’s dias, tending to the wounds her bodyguard suffered at ");
			if(9999 == 9999) output("your hands");
			else output("at Dane’s hands");
			output(". As you demanded, some of her warriors are dismantling her probe-throne, getting ready to dump it out into the village. Taivra looks at you with something between fear and admiration, and she keeps her hands well clear of her weapons.");
		}
		//Thereafter
		else 
		{
			output("Queen Taivra is sitting on her throne, one leg crossed over the other and a great spear held in her hand. Her mass of tentacle cocks are busily breeding several beta huntresses, sprawled out on their backs at the foot of her throne with their hollow ovipositors erect and penetrated, being filled with their queen’s seed. Taivra looks almost bored, even with twelve cocks simultaneously fucking a dozen huntresses at once.");
			output("\n\n<i>“[pc.name],”</i> she says with a faint smile, not interrupting her mating. <i>“You desire something, my " + pc.mf("king","queen") + "?”</i>");
		}
	}
	return false;
}
