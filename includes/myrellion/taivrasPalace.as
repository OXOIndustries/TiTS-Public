import classes.Items.Miscellaneous.GemSatchel;
//flags["CRYSTAL_GOO_DEFEAT"] - 1 = HP, 2 = LUST, 3 = you fucked her after winning (or got egged)

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
	output("Several of the huntresses leap forward from one side, jabbing their spears at your chest.\n");
	attack(foes[0],pc,true,1);
	output("\n");
	attack(foes[0],pc,true,1);
	output("\n");
	attack(foes[0],pc,true,1);
	output("\n");
	attack(foes[0],pc,true,1);
	output("\n");
	attack(foes[0],pc,true,1);
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
		//Hacky way to force backstab proc!
		pc.createStatusEffect("Blind");
		applyDamage(foes[0].meleeDamage(), foes[0], pc, "melee");
		pc.removeStatusEffect("Blind");
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
		if(!pc.hasStatusEffect("Aphro")) pc.createStatusEffect("Aphro",5,4,0,0,false,"Icon_DrugVial","An aphrodisiac is in your blood, exciting you over time! It should fade quickly... unless you get redosed.",true,0);
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
	output("The huntresses form a tighter ring, shoulder to shoulder, and brace their spears against you. It’s almost impossible to move now, and <b>hitting the huntresses is going to be damn hard.</b>");
	//+50% dodge vs ERRYTHING.
	foes[0].createStatusEffect("Evasion Boost",50,0,0,0,false,"Icon_DefUp","The nyrea have created a wall of spears, granting them a 50% evade chance!",true,4);
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
	showName("NYREAN\nGUARDS");
	output("<i>“Enough, enough,”</i> the lead guard says, stumbling to a knee and leaning heavily on her spear. <i>“We yield... no more, please.”</i>");
	output("\n\nThe other nyrea similarly show their submission, throwing down their spears and kneeling - those who can still manage to stand, anyway. You don’t want to risk staying here too long, or the guards might try and jump you: there’s far too many for you to keep an eye on all of them!\n\n");
	flags["PRAETORIAN_RESPAWN"] = 12;
	variableRoomUpdateCheck();
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
	//Play <i>“Incubator Goo”</i> encounter on first entry.
	if(flags["CRYSTAL_GOO_DEFEAT"] == undefined)
	{
		incubatorGooEncounter();
		return true;
	}
	//if not NyreaKing:
	if(9999 == 9999)
	{
		output("\n\nThe crystal-coated broodmother is ");
		//Lustbeat
		if(flags["CRYSTAL_GOO_DEFEAT"] == 3) output("moaning and groaning in the corner, still locked in the throes of pleasure even after you had your way with her");
		//by physical:
		else output("cowering in the corner, arms and crystal plates wrapped protectively around her belly full of eggs");
		output(".");
	}
	//if NyreaKing & did Goofite:
	else
	{
		if(flags["CRYSTAL_GOO_DEFEAT"] != undefined) output("\n\nYou can see some gooey slop on the stone floor, near the little hatch Taivra’s pet broodmother goo lives in. You suppose she’s been out lately... probably so your mate could pump her full of a new batch of royal eggs.");
		//if NyreaKing & skipped Goofite:
		else output("\n\nYou can see some gooey slop on the stone floor, near one of the big carpets on the stone floor just under a gloryhole in the wall beside her bed.");
	}
	if(flags["LOOTED_TAIVRAS_BEDROOM"] == undefined) addButton(0,"Search",searchTheQueensChambers,undefined,"Search","Maybe you’ll find something useful in the queen’s chambers?");
	else addDisabledButton(0,"Search","Search","You already searched this room, discovering a silver key and sack of gems.");
	
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
	output("\n\n(<b>Gained Key Item: Silver Key</b> - This must open something somewhere in the royal complex.)\n\n");
	flags["LOOTED_TAIVRAS_BEDROOM"] = 1;
  	pc.createKeyItem("Silver Key",0,0,0,0);

  	//Add Silver Gate Key to Key Items
	//Add Gem Satchel to inventory. Worth about ~10k Creds when sold.
	//sumbody get on dis
	quickLoot(new GemSatchel());
}



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

public function showIncuGoo():void
{
	showName("GOO\nINCUBATOR");
	showBust("GOOCUBATOR");
}

//Incubator Goo Encounter
//PC gets ambushed by a crystal goo stuffed with eggs, locked in Taivra's personal sex dungeon.
public function incubatorGooEncounter():void
{
	clearOutput();
	//showIncuGoo();
	output("As you enter the side chamber, you’re greeted by the smell of sweet perfumes wafting off of a dozen colorful candles surrounding a richly adorned bed with silken sheets and a tall canopy. You must have stumbled into the bedroom of the palace’s queen! There’s gotta be some awesome loot in here somewhere, and maybe a hint as to where the locals have stuffed your probe... and what happened with your cousin.");
	output("\n\nYou spend a few moment scouring the room, following the smooth curves of the stone walls with your hand as you poke through the queen’s belongings. The search quickly leads you to a girthy hole chiseled into the wall, clearly artificial in its perfectly circular, smooth shape. It almost looks like a... like a glory hole, set about at crotch height for a nyrean woman.");
	output("\n\nCocking an eyebrow, you ");
	if(pc.tallness >= 60) output("squat down to look into");
	else output("look straight into");
	output(" the hole. It’s about two inches of solid stone, leading up to a solid green surface beyond it. At least, it looks solid at first glance, but as you stare at it, the green ripples like gelatin, catching the light in just the right way to make it glisten radiantly.");
	output("\n\n<i>“Helloooo...?”</i> an almost girlish voice says from the other side of the hole between jiggles of the strange green substance. <i>“You just gonna, like, keep me waiting aaaall day?”</i>");
	output("\n\nWell, are you?");
	processTime(2);
	//[Use Gloryhole] [Step Back]
	clearMenu();
	if(pc.hasCock())
	{
		addButton(0,"Use G.Hole",useDatGloryhole,undefined,"Use Gloryhole","Well, that’s what it’s there for, right? Stick your dick right into the gloryhole and see what’s in store.");
		addButton(1,"Step Back",stepBackFromGloryHoles,undefined,"Step Back","No way you’re sticking your dick in there. Who knows what’s on the other side?");
	}
	else
	{
		addDisabledButton(0,"Use G.Hole","Use Gloryhole","You don't have the equipment to do that.");
		addButton(1,"Step Back",stepBackFromGloryHoles,undefined,"Step Back","You don’t exactly have the right equipment to slot in there...");
		addDisabledButton(1,"Step Back","Step Back","");
	}
}

//[Step Back]
//if dick: No way you’re sticking your dick in there. Who knows what’s on the other side?
//Else: You don’t exactly have the right equipment to slot in there...
public function stepBackFromGloryHoles():void
{
	clearOutput();
	showIncuGoo();
	output("You take a wary step back, worried about what exactly you’ve just woken up. A moment later, you hear a wet slurping noise from through the alien gloryhole, and the feminine voice inside calls out <i>“Queenie, don’t tease me like that! C’mon already!”</i>");
	output("\n\nYou don’t exactly know how to respond to that, and in the couple of moments you spend flubbing for some response that will keep the creature placated, you hear something clicking behind the stone. You manage to scramble back just in time to avoid falling in as a trap door pops open from underneath a shaggy rug, and a glistening green figure pulls herself up from below.");
	output("\n\n");
	//if seen a Crystalgu b4:
	if(9999 == 0) output("You instantly recognize the familiar form of a ganrael, the planet’s crystal-hemmed goo race, but something’s very different about this specimen. ");
	else 
	{
		output("It’s a green goo-girl, just like Celise, but covered with bits of glistening crystal. Your Codex beeps, identifying it as a gan’rael, a myrellion native species. ");
		//CODEX UNLOCK!
	}
	output("She’s adopted a relatively humanoid form, probably based off of a gooey interpretation of the nyrea she’s living besides: she’s got two arms, a human-like head with big elfin ears, and a curvaceous body with big tits and hips that fold down into a solid base of goo instead of legs. Her crystals, though, are what tip you off to what you’re really dealing with here: a thick dome of emerald crystal has formed around her belly, shielding a massively pregnant gut filled to the brim with what looks like hundreds of fist-sized eggs! Her middle is hugely bloated, swollen with eggs and plated with as much crystal as the goo could possibly churn out, protecting her charges rather than herself.");

	output("\n\n<i>“You’re not the queen!”</i> she yelps, her purple eyes going wide with surprise. The goo’s arms go protectively around her crystal-armored belly, and you’re left to watch her slimy body jiggle, and all the countless eggs inside her shift listlessly in their gemstone shell. <i>“I-I won’t let you hurt my precious eggs!”</i>");

	output("\n\nUh-oh. You wave your hands, saying that ");
	if(pc.isAss()) output("if you’d wanted to hurt her, you’d have done so already");
	else output("you don’t want to hurt her");
	output(", but the goo’s eyes have already glazed over with protective rage - looks like you’ll have to knock her down!");

	processTime(5);
	clearMenu();
	addButton(0,"Next",startCombat,"Goocubator");
}

//[Use Gloryhole]
//Well, that’s what it’s there for, right? Stick your dick right into the gloryhole and see what’s in store.
public function useDatGloryhole():void
{
	clearOutput();
	showIncuGoo();
	flags["CRYSTAL_GOO_GLORYHOLED"] = 1;
	output("You shrug and ");
	if(pc.isCrotchGarbed()) output("drop trou and grab [pc.oneCock]");
	else 
	{
		output("grab ");
		if(pc.cockTotal() > 1) output("one of ");
		output("your unclad cock");
		if(pc.cockTotal() > 1) output("s");
	}
	output(". Whatever’s on the other side seems eager to do her duty behind the gloryhole, and you’re all too happy to enable it. With a few preparatory stokes, you bring your [pc.cock] up to full size and ");
	if(pc.tallness <= 50) output("grab the pillows off of the bed, giving yourself enough height to just barely get your wang into the head-height hole");
	//if normal size:
	else if(pc.tallness <= 76) output("guide your schlong into the waiting hole");
	//if bigPC:
	else
	{
		output("slip down ");
		if(pc.hasKnees()) output("onto your knees");
		else if(pc.isNaga()) output("into a serpentine coil");
		else output("as low as you can go");
		output(" to align your prick with the hole, and slide on in");
	}
	output(".");

	output("\n\nThe stone is cold, but it’s smooth and wet, the remnants of what could be years of sexual excess and lube smeared across the tunnel. You only need to endure the rocky gloryhole for a moment, though, before your [pc.cock] slides into the green substance waiting on the other side. Whatever it is, it’s delightfully warm and stickily wet, just like ");
	if(celiseIsCrew()) output("fucking Celise");
	else output("sliding your tool into a bowl of heated-up yoghurt");
	output(". The voice on the other side makes a delighted squeal, and you’re treated to a faint sucking sensation around your member, like the substance is drawing you in.");

	output("\n\nIs that a goo-girl on the other side? It has to be, you tell yourself");
	//if seen a Crystalgu b4:
	if(9999 == 0) output(" - probably a ganrael in the queen’s service");
	output(". The way the semi-liquid slurps and squeezes, sucks and caresses your cockflesh is amazing, better than any mouth or sex toy could ever be. An irrepressible grin spreads across your face as you sink every inch of your [pc.cock] into the gooey sheath on the other side of the hole, surrounding your manhood in a constant cavalcade of pleasures.");
	pc.cockChange();
	output("\n\n<i>“Wow, this feels totally different!”</i> the voice on the other side giggles, quivering wonderfully around your dick. <i>“Did you, like, get a whole new cock? Just for me, right?”</i>");
	output("\n\nShe still thinks you’re somebody else - the queen, you suppose! You try not to laugh as the goo-girl squirms excitedly around your prick, exploring every inch of her <i>“queen”</i>’s new shaft. All you need to is hang on, grabbing at the smooth stone walls to steady yourself as pleasure hammers through you, making your [pc.legOrLegs] tremble. This nyrean queen is clearly leading the good life if she’s got every day access to treatment like this!");
	output("\n\nYour [pc.hips] start to move, thrusting into the gooey clocksleeve on the other side of the gloryhole. The green girl coos happily, making a series of lusty moans to the rhythm of your pumping thrusts. <i>“Oooh, so gentle today!”</i> she murmurs, barely audible over the wet squelches of her body slurping up your cockflesh. <i>“Mmm, I bet you’ve got soooo many eggs for me today...”</i>");
	output("\n\nEggs? Well, it looks like your cover’s going to get blown about the same time as your nut. And the way she’s handling you, that’s going to be damn soon! You grit your teeth and try and hold back as long as you can against her slimy caresses, but this gloryhole goo is a supremely talented cocksucker who’s using her whole body to pleasure your [pc.cock]. You’d love to get a look at her blissed-out face about now, but have to content yourself with listening to her sultry, wet sounds echoing through the little tunnel.");
	output("\n\nA few minutes of the goo-girl’s tender caresses later, and you’re ready to blow - and she knows it! <i>“Gonna fill me with eggs now?”</i> she coos excitedly, wiggling wetly all over your length. <i>“C’mon, queenie, I’m practically empty!”</i>");

	output("\n\nWell, you can’t fill her up with cock-eggs, but you’ve got something else to fill her up with! You grunt and dig your fingers into the stone wall, announcing your impending orgasm with a feral growl of pleasure. The goo squeals as the first spurt of your [pc.cum] squirts into her, ");
	if(pc.cumQ() < 40) output("though her voice breaks into a cry of surprise as she realizes the cloud of [pc.cumColor] floating in her green belly isn’t exactly a clutch of nyrean eggs!");
	else if(pc.cumQ() <= 550) output("bloating her gooey body with a massive dose of [pc.cum]! She moans happily, jiggling up and down your shaft as you pump her full of cum. A normal girl would be drooling your spunk out around your cock, but a goo... she just drinks it all up!");
	//if hugecum: 
	else output("and again and again until the goo must be absolutely bloated with spooge - and you keep on going! She yelps and squirms around as you pump her with cum, enough to have made a normal girl look pregnant; as a goo, though, you imagine she’s just swelling up with all the extra fluid!");

	output("\n\nWith a heavy sigh, you step back from the gloryhole and drag your [pc.cock] out from the goo-girl’s insides in a wet, musky mess of goop and cum. It’s hard to resist the urge to crawl into the nearby bed and nap off the afterglow, but you’ve got a job to do. You gather your gear and get ready to go, but stop as you hear the goo-girl’s voice from inside the gloryhole, complaining loudly about the <i>“weird gunk”</i> inside her, and the distinct lack of eggs your orgasm filled her with. A moment later, one of the shaggy rugs in the queen’s chamber gets tossed aside as a trap door slams open, and the goo-girl hauls herself out.");

	output("\n\n");
	//if seen a Crystalgu b4:
	if(9999 == 0) output("You instantly recognize the familiar form of a ganrael, the planet’s crystal-hemmed goo race, but something’s very different about this specimen.");
	//else
	else output("It’s a green goo-girl, just like Celise, as you expected. Unlike your dad’s favorite pet, though, this one’s  covered with bits of glistening crystal. Your Codex beeps, identifying it as a gan’rael, a myrellion native species.");
	output(" She’s adopted a relatively humanoid form, probably based off of a gooey interpretation of the nyrea she’s living besides: she’s got two arms, a human-like head with big elfin ears, and a curvaceous body with big tits and hips that fold down into a solid base of goo instead of legs. Her crystals, though, are what tip you off to what you’re really dealing with here: a thick dome of emerald crystal has formed around her belly, shielding a massively pregnant gut filled to the brim with what looks like hundreds of fist-sized eggs! Her middle is hugely bloated, swollen with eggs and plated with as much crystal as the goo could possibly churn out, protecting her charges rather than herself. Beneath the gemstone shield, though, you see a ");
	if(pc.cumQ() < 40) output("small");
	else if(pc.cumQ() <= 550) output("big");
	else output("huge");
	output(" cloud of [pc.cumColor] swirling around inside her, coating the eggs as her goo wiggles around.");

	output("\n\n<i>“You’re not the queen!”</i> she yelps, her purple eyes going wide with surprise. The goo’s arms go protectively around her crystal-armored belly, and you’re left to watch her slimy body jiggle, and all the countless eggs inside her shift listlessly in their gemstone shell. <i>“Nobody’s allowed to use the queen’s goo but Taivra!”</i>");

	output("\n\nUh-oh. You wave your hands, saying that you didn’t mean any harm - she asked you to fuck her! But the goo’s eyes have already glazed over with protective rage - looks like you’ll have to knock her down!");

	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",startCombat,"Goocubator");
}

//Goo Incubator Fite
//Crystal Goo is a primarily lust-based fight, though if the PC Gloryholed her, she’ll start with 0 Lust (like the PC will!). Like Celise, she’s highly resistant to physical damage (though not immune) but very vulnerable to Lust.
//Rather than a HEALTH bar, she has an ARMOR bar: the battle ends if the PC can break her crystal shield. Crystal goo is, of course, fairly MIRRORED. She’s probably the weakest fight in the dungeon, maybe just Level 7.

//Fight Text
//You’re fighting a Crystal Goo Incubator!

//The crystal-armored goo-girl in front of you is a mass of green slime in the vague form of a nyrean woman, with oversized hips and a huge pair of glistening breasts that bounce around with every movement. Her body is covered with small flecks and plates of natural emerald crystal, but unlike most of her race, the vast majority of her crystal is concentrated around her hugely swollen belly, forming a perfect, smooth dome. Underneath the protective shell of crystal are what must be hundreds of white, fist-sized eggs, floating listlessly in their gooey womb. {A misty cloud of [pc.cumColor] billows around the eggs, clinging to several of the outliers. If they weren’t fertilized already, then you’ve certainly (got a few new kids on the way // fixed that for most of them // inseminated every egg in that goo’s belly with your god-like load of cum)}. The gooey incubator looks at you with wild eyes, her arms clutching her eggy belly protectively. Looks like this artificial momma will do anything to protect her clutch!

//Goo Abilities
public function gooCubatorAI():void
{
	if(!pc.hasStatusEffect("Grappled"))
	{
		if(foes[0].HP() < 150 && !foes[0].hasStatusEffect("Goo Shield")) crystalShieldGoo();
		else if(!pc.hasStatusEffect("Blind") && rand(6) == 0) gooSpitShit();
		else if(rand(7) == 0) gooeyGrappleStuff();
		else if(rand(4) == 0) bellyTeaseGOOO();
		else if(rand(3) == 0) gooeyTentagrope();
		else gooTendrilSlap();
	}
	else keepOnGropinOn();
}

//Goo Tendril Slap
//Moderate bludgeoning attack
public function gooTendrilSlap():void
{
	output("The goo-girl gives a shrill warcry and lunges at you, a thick tendril of goo forming from her shoulder and lashing at you.");
	if(combatMiss(foes[0],pc)) output("\nYou manage to block the attack, deflecting the swing away.");
	else
	{
		output("\nThe egg-laden woman catches you off-guard and smashes her gooey tentacle into your chest! The force of the blow leaves you reeling, and covered in wet slime.");
		applyDamage(foes[0].meleeDamage(), foes[0], pc, "melee");
	}
	processCombat();
}

//Goo Slpit
//Blinding attack. Only works if Shields are down.
public function gooSpitShit():void
{
	output("The gooey incubator swings one of her arms at you, as fast as her heavily laden body will let her. Rather than strike at you directly, though, a clump of goop flings off of her body and hurtles towards you!");
	if(pc.shields() > 0) output("\nThe goo splatters on your shields, drooling down to the ground like a bug caught on a windshield.");
	else if(rangedCombatMiss(foes[0],pc)) output("\nThe goo splatters harmlessly on your chest. What was the point of that!?");
	else
	{
		output("\nThe gooey blob beans you right in the face! You yelp in surprise as the warm slime splatters across your face, bathing everything in a weird green light - <b>you’re blinded by the goo</b>!");
		pc.createStatusEffect("Blind",rand(3)+1,0,0,0,false,"Blind","You're blinded and cannot see! Accuracy is reduced, and ranged attacks are far more likely to miss.",true,0);
	}
	processCombat();
}

//Belly Tease
//Lust attack. Way higher effect vs. PCs with cocks + high Virility
public function bellyTeaseGOOO():void
{
	output("Your opponent bounces around you, moving with inhuman twists and turns that would break a creature with bones. But for her, it seems like she’s flowing around her crystal-clad belly, deforming and reforming every few moments in a myriad of ways that emphasize her hugely pregnant stomach. A pair of gooey arms wrap around it, fingers tracing over the perfectly smooth gemstone as her pseudo-hips thrust out beneath it.");
	//If PC saves...
	if(pc.willpower()/2 + rand(20) + 1 >= 18)
	{
		output("\nIs that supposed to turn you on?");
	}
	else if(!pc.hasCock())
	{
		output("\nYou find the alien display disquietingly erotic, an invitation to join with the gooey incubator and share in the joys of egg-swelling motherhood...");
		applyDamage(new TypeCollection( { tease: 13 } ), foes[0], pc, "minimal");
	}
	//if cock + success:
	else {
		output("\nThe alien dance is alluring in the best of ways, inviting you to cover over and slide your cock ");
		if(flags["CRYSTAL_GOO_GLORYHOLED"] == 1) output("back ");
		output("into her gooey nethers and fertilize her massive store of nyrean eggs. Hundreds of them are floating inside her, begging for a cock to seed them. It’s hard to resist the urge to give her what she wants....");
		applyDamage(new TypeCollection( { tease: 16 } ), foes[0], pc, "minimal");
	}
	processCombat();
}

//Gooey Tentacles
//Several light lust attacks. Gropegropegrope.
public function gooeyTentagrope():void
{
	output("The goo-girl reaches out with one of her arms, which breaks apart as it moves, becoming a dozen small, slender tendrils of viridian slime. You stumble back, but the goo’s reach seems unlimited, and she’s quickly rubbing her tentacles all over you, groping at your [pc.crotch], and smearing your [pc.chest] with slimey caresses.");
	for(var x:int = 0; x < 4; x++)
	{
		if(pc.willpower()/2 + rand(20) + 1 >= 21) output("\nSomehow, you manage to grit your teeth and ignore her inhuman advances!");
		else 
		{
			output("\nThe alien attention leaves your cheeks burning, and your whole body flushing with arousal. The things you could do to a gooey beauty like this...");
			applyDamage(new TypeCollection( { tease: 4 } ), foes[0], pc, "minimal");	
		}
	}
	processCombat();
}

//Partial Envelop
//Goo wraps around PC, grappling them. If it lasts for 3 turns, the goo cums and loses a lot of lust.
public function gooeyGrappleStuff():void
{
	output("<i>“Don’t fight me!”</i> the goo purrs, sliding towards you on her thick, legless lower body. Her belly bounces as she moves, hundreds of eggs gently rattling against the perfect crystal dome her arms are shielding. <i>“The queen will be SO MAD if you hurt her eggs... so why not, like, just stop already? I’ll let you play with me if you do...”</i> she offers, a seductive smile spreading on her emerald lips.");
	output("\n\nBefore you can answer, the goo lunges forward, sliding past your defenses and splattering her lower body around your [pc.legs], molding her goop around you! Her arms slip around you, trying to completely pull you into her! ");
	if(pc.reflexes()/2 + rand(20) + 1 >= foes[0].physique()/2 + 13)
	{
		output("\n\nYou push her back, forcing the goo-girl to give you some much-needed distance. She pouts, crossing her arms. <i>“You’re gonna regret this!”</i>");
	}
	else
	{
		output("\n\nYou try to push her back, but can’t find proper purchase! Before long, almost your entire body has been smothered in emerald slime - all that’s left is the crystal ball of the girl’s distended gut pressing against your [pc.belly], and her face just inches from yours. Her slime squirms and presses all around you, rubbing at your groin and ass and chest in all the right ways, with no sign of letting up! <b>You’re grappled!</b>");
		applyDamage(new TypeCollection( { tease: 5 } ), foes[0], pc, "minimal");
		foes[0].lust(3);
		pc.createStatusEffect("Grappled",0,35,0,0,false,"Constrict","You're pinned in a grapple.",true,0);
	}
	processCombat();
}

//Continue Enveloping if PC doesn’t escape:
public function keepOnGropinOn():void
{
	if(pc.statusEffectv4("Grappled") >= 3)
	{
		didntEscapeFromGooInThreeTurns();
		return;
	}
	output("The goo girl is firmly affixed to you, rubbing her crystal belly against you like some sort of alien dry hump while the rest of her gooey body gropes at you, ");
	if(pc.biggestTitSize() >= 1) output("squeezing your [pc.chest] and ");
	output("slipping tendrils of goo around your crotch.");

	output("\n\n<i>“This is soooo much better!”</i> she giggles, her voice fading into an unintelligible moan. She’s getting off on this - and she’s doing everything she can to make sure you do, too.");

	if(pc.willpower()/2 + rand(20) + 1 >= 21) output("\nYou struggle as hard as you can, refusing to give in to your carnal desires!");
	else
	{
		applyDamage(new TypeCollection( { tease: 5 } ), foes[0], pc, "minimal");
		output("\nAnd it’s working! Pleasure rushes through you, making you pant and gasp as the gooey vixen massages your entire body.");
	}
	foes[0].lust(3);
	//Stick rounds in #4
	pc.addStatusValue("Grappled",4,1);
	processCombat();
}

//PC Doesn’t Escape for 3 turns
public function didntEscapeFromGooInThreeTurns():void
{
	output("Your attempts at escape seem completely useless, and your struggles only prove to excite the amorous goo-girl further. The more your limbs squirm in her sticky embrace, the louder her lusty moans become, and the more you see her bloated belly sway ponderously against your gut, rolling her huge clutch of eggs around. The feeling of all those eggs moving inside her must be maddeningly pleasurable, as her slimy exterior spurts moisture all over you [pc.chest].");
	output("\n\n<i>“Gonna... gonna...”</i> she mewls, rubbing faster against you. <i>“Gonna...!”</i>");
	output("\n\nShe can’t quite find the words to give voice to her ecstasy, and ends up settling on a high-pitched scream that reverberates off the stone walls. Her goo releases you, letting you tumble to the ground as she climaxes herself into a gooey, incoherent mess. Your eyes are drawn to the crystal dome around her belly, shielding her hundreds of pearly eggs from the rest of her body’s near-collapse into a formless pile of slime. The gemstone orb rolls around like a punted beachball on a bed of lube.");
	output("\n\nShe only stays that way for a moment, though, before she reforms herself into a familiar form, hefting up her crystal belly and protectively shielding it back in her gut. <i>“Aww, you didn’t cum?”</i> she whines, looking horribly disappointed. <i>“Guess I’ll have to, like, try harder!”</i>");
	foes[0].orgasm();
	applyDamage(new TypeCollection( { tease: 5 } ), foes[0], pc, "minimal");
	pc.removeStatusEffect("Grappled");
	processCombat();
}

//Crystal Shield
//Buffs physical defense for a few turns. Only used when at low HP
public function crystalShieldGoo():void
{
	output("<i>“Oooww, you’re hurting me!?”</i> the goo whines, more in surprise than pain, it seems. <i>“Don’t you dare hurt my eggs!”</i>");
	output("\n\nThe look of bubbly determination that she’s been sporting twists into a grimace of concentration. A few moments later, the various small flecks of crystal floating around her body start to move through her, coalescing around one of her arms. They become a crystelline buckler, held together by a viscous layer of goo. <i>“Never gonna get through this!”</i> she declares with a shake of her hips.");
	foes[0].createStatusEffect("Goo Shield",0,0,0,0,false,"Icon_DefUp","With her crystal shield, the goo will be much tougher to drop through violent means!",true,0);
	foes[0].armor.defense += 20;
	foes[0].armor.hasRandomProperties = true;
	processCombat();
}

//PC Defeated by Guu: Absorbed and Incubated
public function loseToRoyalIncuGoo():void
{
	//Bad end! PC gets turned into an extra incubator so goobutt can have EVEN MORE EGGS. Also fucked forever and ever by wriggling goo.
	//if by lust:
	if(pc.lust() >= pc.lustMax())
	{
		output("The goo’s rubbing and teasing you is simply too much - you have to have a piece of this viridian vixen! You drop your [pc.weapon], letting it clatter to the floor as you stagger towars the gooey beauty.");
	}
	//if by physical:
	else output("Even as hesitant a warrior as she is, the goo is simply too much for you! You slump against one of the walls, your [pc.weapon] clattering to the ground beside you as you surrender to the pain the gooey bombshell’s caused you.");

	output("\n\n<i>“Ahh! Yay, I win!”</i> she cheers, bouncing around excitedly. <i>“That means you belong to me now, right? That’s what Queen Taivra said, like, forever ago when she made me her personal egg bitch. Hehe, I used to be big and tough, too, but look at me now!”</i>");
	output("\n\nShe beams at you, rubbing her hands all around the crystal sphere suspended in her gooey gut. <i>“I’m the best egg bitch in the whole wide world, Taivra said. She’ll be so proud of me for catching you... I bet she’ll give me a hundred more eggs - a thousand!”</i>");
	output("\n\nThe idea of being stuffed with even more eggs seems to make the victorious goo absolutely giddy. She bounces with excitement, making her egg-laden belly tumble weightlessly inside her goo until she suddenly turns her attentions to you, a huge grin plastered on her face. <i>“Do you like eggs? I hope so, cuz Queen Taivra likes to stuff all of her pets with her eggs. She makes soooo many! But now </i>I<i> have a pet... and I can stuff you with eggs, just like Taivra! No wait, that I wouldn’t have as many.... uh, I know!”</i> she grins, bouncing your way and looming over you. <i>“I’ll use you to help keep all of my eggs warm! You can make me nice and thick and perfect for all my eggs to get big and strong in.”</i>");

	output("\n\nYou gulp nervously as the goo-girl leans in close, her cute little nose almost brushing up against you. She just stares at you for a long moment, long enough to make you wonder if she’s really looking at you... until you see the gooey tendrils starting to grow out of her back, reaching towards you. You’re powerless to resist as the tentacles wrap around your limbs, pulling you up towards the goo-girl’s slimy embrace with startling strength. Emerald goo surges around you, spreading out across your body in a slow tidal wave of hot, wet alien sludge. She envelopes more and more of you, grasping at all of your exposed flesh until your face is pressing against hers, and her crystal-clad belly is grinding against your ");
	if(!(pc.armor is EmptySlot)) output("[pc.armor].");
	else output("[pc.skinFurScales].");

	output("\n\n<i>“Just relax and let me swallow you up!”</i> she giggles, pressing green goop to your face. The stuff blinds you for a moment, before your vision coalesces into one of a viridian sheen, like looking at the world through a sloshing pair of green beer goggles. You’re sure every inch of you is inside the giddy goo-girl, and as you weakly struggle, you find yourself incapable of breaking free. You can move your limbs freely, but the goo just moves with you, perfectly melding to your body shape. You start to scream, but opening your mouth to the goo proves a mistake - she floods your mouth with herself, forming a thick, wriggling appendage for you to suck on. You instinctively know what the goo-girl wants, and your tongue flicks across the morphing shaft keeping your jaw wide open.");

	output("\n\nMore goo floods under your equipment, ripping it off of you with startling dexterity. You’re quickly left naked, surrounded by discarded possessions, with goo teasing at the rim of your [pc.asshole]");
	if(pc.hasVagina()) output(" and the lips of your [pc.vaginas]");
	output(". There’s no resisting her, now - no point in trying to hold on to your dignity anymore. All you can do is moan as the goo-girl invades your body from both sides, filling every hole she can find with thrusting probes of green goop. The sensation is instantly overwhelming, making you screech into your mouthfull of your viridian mistress.");

	output("\n\n<i>“Hehe, you feel so good inside!”</i> the goo coos, jiggling inside you. <i>“Mmm, I’m gonna keep you forever and ever!”</i>");

	output("\n\nThe goo shifts around you, binding your arms to your side like a wrestler’s grapple. You squirm helplessly, but your movements are so restricted - and your body so wracked with unwanted pleasures - that you only serve to get the giggling goo-girl off! She moans and gropes at the vague outline of her tits, slowly sliding across the chamber’s floor towards the trap door she spring out of when you first saw her.");

	output("\n\nIn the blink of an eye, you’re squeezed through a tunnel in the floor and into a cramped, dark chamber behind the queen’s walls. Nobody will hear your screams here, muffled in the goo with only the gloryhole to shine a flicker of light into your world. Hundreds of eggs press against you, nestling between your warmth and the solid embrace of stone.");

	output("\n\n<i>“Welcome home,”</i> the goo purrs from all around you. <i>“I bet the queen will be here to fill me full of my daily eggs soon. If you’re lucky... and make me cum a bunch first... I might let some of her precious eggs slip into you, too!”</i>");

	output("\n\nSomething tells you that no matter what you do, you’re going to spend the rest of your life being pumped full of the nyrean queen’s many, many eggs...");
	badEnd();
}

//PC Beats Guu
public function pcBeatsGoo():void
{
	clearOutput();
	if(foes[0].HP() <= 0) 
	{
		flags["CRYSTAL_GOO_DEFEAT"] = 1;
		output("<i>“Don’t hurt my eggs!”</i> the goo shrieks, curling into an almost literal ball around the crystal orb she’s formed around her belly. <i>“I-I won’t let you!”</i>");
		output("\n\nYou sigh and try to explain again that you didn’t come here to hurt her damn eggs");
		if(flags["CRYSTAL_GOO_GLORYHOLED"] == 1) output(" - if you had, you wouldn’t have pumped her full of cum first");
		output("! She still scrambles backwards as you approach her, leaving a trail of emerald slime on the floor that nearly makes you trip over yourself. She’s certainly a sloppy little creature... and one entirely at your mercy, now. Maybe you could assuage the poor thing’s fears in a way she’d really understand...");
	}
	//By Lust
	else
	{
		flags["CRYSTAL_GOO_DEFEAT"] = 2;
		output("<i>“Nooooo!”</i> the goo whines, wiggling and jiggling her exaggerated figure hypnotically. <i>“O-only the queen’s allowed to have me!");
		if(flags["CRYSTAL_GOO_GLORYHOLED"] == 1) output(" You already filled me with all this creamy stuff!");
		output("”</i>");
		output("\n\nFor a lusty goo-girl like her, she’s put up an awful lot of resistance to your advances. She must really love her queen... or at least, love getting pumped full of so many eggs she can barely move. You’ll just have to show her what you can do...");
		output("\n\nThe goo slumps against the wall, desperately running her hands around her belly and pumping her fingers into her own goo. She looks pleadingly at you, whining and moaning and squirming everywhere - poor thing’s so aroused, and where’s her queen to help her. She seems to know there’s nobody else to help her, and so her big purple eyes settle on you.");
	}
	output("\n\n<i>“P-please...”</i> she whines, squirming around helplessly around her crystal-clad belly.");
	output("\n\nWhat do you do?\n\n");
	clearMenu();
	//[Fuck Her] [Get Egged] [Leave]
	if(pc.lust() >= 33)
	{
		if(pc.hasCock()) addButton(0,"Fuck Her",pcFuckDatGooWivCockVictory,undefined,"Fuck Her","The goo-girl’s entire body might as well be a huge pussy, ready to be fucked anywhere you like. Shove your cock{s} right on in and fill her with cum!");
		else addDisabledButton(0,"Fuck Her","Fuck Her","You need a cock to jam one inside of her.");
		if(pc.hasGenitals()) 
		{
			if(pc.findEmptyPregnancySlot(0) == -1) addDisabledButton(1,"Get Egged","Get Egged","You don't have any room for eggs.");
			else addButton(1,"Get Egged",getEggedByCrystalGoo,undefined,"Get Egged","You can only imagine how amazing it would feel to have the bubbly bimbo goo-girl pump you full of her eggs.");
		}
		else addDisabledButton(1,"Get Egged","Get Egged","You need genitals for this act.");
	}
	else
	{
		addDisabledButton(0,"Fuck Her","Fuck Her","You aren't aroused enough to even consider this.");
		addDisabledButton(1,"Get Egged","Get Egged","You aren't aroused enough to even consider this.");
	}
	if(pc.armor is GooArmor || pc.destroyItemByName("Goo Armor",1)) addButton(14,"Leave",armorGooVictoryShits);
	else addButton(14,"Leave",genericVictory);
}

//Fuck Her
//PC must have a cock.
//Tooltip: The goo-girl’s entire body might as well be a huge pussy, ready to be fucked anywhere you like. Shove your cock{s} right on in and fill her with cum!
public function pcFuckDatGooWivCockVictory():void
{
	clearOutput();
	flags["CRYSTAL_GOO_DEFEAT"] = 3;
	output("With the goo-girl lying in a defeated, jiggling heap on the ground, completely at your mercy... your mind starts to wander. How could you take advantage of this wriggling heap of a broodmare? As you think over the many, many options her alien body presents, you start to peel off your [pc.gear]. The goo’s big, purple eyes roll towards you, looking up from her cowering. Her arms are still wrapped protectively around her crystal belly, but you see her gaze settle on your [pc.cockBiggest] with a look of abject hunger in her eyes. Looks like ");
	if(flags["CRYSTAL_GOO_GLORYHOLED"] != 1) output("she wants what you’re packing, even if her queen might take offense");
	else output("she enjoyed round one. Now to see if she’s ready for round two...");

	output("\n\nGiving her a lascivious grin, you sashay over to the cowering goo. As you move, your hand wraps around your ");
	if(pc.cockTotal() == 1) output("[pc.cockBiggest]");
	else output("biggest cock");
	output(", showing off what you’re packing to the sex-addled goo. She’s shameless about her approval, licking her lips and groping at one of her huge boobs. Her whole body quakes excitedly when you stop just inches from her, though her arms stay firmly where they were. Even as lustful as she is, the poor thing’s not willing to risk her hundreds of delicate charges. Admirable, in its alien way.");

	output("\n\nSquatting down in front of her, you run a hand across the slimy surface of the ganrael’s body, brushing your fingertips across her beachball bosom... before you sink them into her porous body. The goo-girl squeals as your fingers push into her tit, arching her back in a universal sign of pleasure. Oh, she’s <i>sensitive</i>! You wiggle your fingers, basking in her moans and cries: she’s just like one big, body-wide clit, ripe for you to play with. With a grin, your other hand comes into play, pushing slowly between the gooey babe’s faintly-outlined thighs, as near as you can tell to where a flesh-and-blood girl’s pussy would be.");

	pc.cockChange();

	output("\n\n<i>“Stop teasing meeee,”</i> the goo manages to whine between throaty moans. One of her arms finally shoots off of her precious cargo-crystal, grabbing your [pc.cockBiggest] and trying to pull you into her. You give her what she wants, rocking your [pc.hips] forward into the blob of her lower body, right beneath the bulb of her crystal belly. ");
	if(pc.cockTotal() > 2) output("All of your cocks slide");
	else if(pc.cockTotal() > 1) output("Both of your cocks slide");
	else output("Your cock slides");
	output(" right into her, easily spreading out her gooey exterior and gliding into a bed of hot, wet warmth. Damn, she’s hot! Hot enough to make you wince, but the way she sucks you into her gooey interior more than makes up for the momentary discomfort. Fucking her is like fucking ");
	if(pc.cockTotal() == 1) output("a");
	else output(num2Text(pc.cockTotal()));
	output(" onahole");
	if(pc.cockTotal() > 1) output("s");
	output(" filled with steaming-hot gel, perfectly melding to your cock");
	if(pc.cockTotal() > 1) output("s");
	output(" and making the wettest squelching noises as you start to thrust.");

	output("\n\n<i>“That’s better,”</i> you hear her moan, just loud enough to hear. <i>“You’re gonna give me lots of eggs, right?”</i>");

	output("\n\nYou chuckle, grabbing her tits and thrusting ");
	if(pc.balls > 1) output("balls ");
	output("deep. You can’t exactly pump her full of eggs this way, but damned if you can’t make sure every last one of hers is nice and fertilized! If she gets this much pleasure just from having all those eggs in her, you can’t imagine how much she’ll get off from giving birth! Just your fingers wriggling around inside her tits seemed like enough to make her a fuck-hungry mess - what would a hundred eggs popping out of her do?");

	output("\n\nYou suppose you won’t get to see that, but for now, you can focus on making sure she cums her brains out the old fashioned way! Your hips do the talking, thrusting hard and fast into her quivering body. She rocks back with every thrust, bouncing around like mad and desperately holding onto her crystal-clad belly. The eggs inside her roll around with the impacts, which only adds to her pleasure. Her screams echo deafeningly off the stark stone walls, surrounding you in a cacophony of sultry noises. It sounds more like you’re in a brothel than a royal palace, all thanks to the over-sexed goo - and your own grunts as her alien body starts to drive you towards climax.");

	output("\n\nNo way you’re letting her get the better of you, though: you’re gonna make her cum first, dammit! You’d think ");
	if(pc.cockTotal() == 1) output("a hard dick");
	else output(num2Text(pc.cockTotal()) + " hard dicks");
	output(" spearing her again and again would be enough, but this busty slut’s been through more than you can imagine. You’ll have to pull out every stop to bring her to the heights of pleasure. Luckily, her being nothing more than a pile of goo and crystal gives you plenty of options...");
	output("\n\nYou move your hands from her tits, keeping all your fingers buried to the knuckle in goo and tracing lines down her body until you reach the crystal barrier protecting her gravid belly. She shrieks when you touch the crystal armor’s inside, whether in pleasure or surprise you can’t tell. Either way, she doesn’t - or can’t - stop you as your hands reach deep inside her, teasing out inch after inch of sensitive goo around the smooth ball of crystal. The area around her gemstone armor seems ten times more tender than the rest of her, and the more you run your fingers across it, the higher the pitch her screams reach.");
	output("\n\nHer pleasure spurs you on, making you fuck your [pc.cocks] deeper and higher inside her, tracing your way through your captive lover’s body until your [pc.cockBiggest] is battering the bottom of her crystal belly. The stone is wonderfully smooth, and even hotter than the rest of her, a burning sphere of ecstasy that drives you and her wild as you fuck it.");
	output("\n\n<i>“Gonna... gonna...”</i> the goo stammers, too busy screaming her pleasure to form more than that single word. You grin ear to ear and thrust harder, pistoning your hips against her glistening belly. Her body goes wild, squirming madly around you as she rockets over the edge and all but deforms around your [pc.cocks]. She collapses against the stone floor, flooding in a messy green pile around you as you too find orgasm in the goo’s warm embrace, flooding her porous body with [pc.cumNoun]. Your spunk floods out in billowing clouds, caking the gemstone bulb of her belly in a sticky mess.");
	output("\n\nSated, your head flops heavily between the goo-girl’s huge breasts. You need a few minutes to catch your breath after that - time the goo seems all too willing to provide, as her slimy exterior wraps around your [pc.legs] and arms, pulling you close. She moans softly, wiggling happily as your load of spunk disseminates like ink through water. It’s almost hypnotic, watching it settle over her clutch of eggs, burying into her hundreds of young. Looks like you’re going to be a daddy...");
	output("\n\nA few minutes later, you find the stamina to pick up and grab your gear, leaving the goo-girl in a pile of barely-humanoid good masturbating herself in a puddle of your spunk. Now that’s a sight to see!\n\n");
	processTime(15);
	gooVictoryPostGooCheck();
}

//Get Egged
//PC gets pumped full of nyrean eggs. Use Carrying Royal Eggs shit (below) if the PC gloryholed the googirl. Else, use Renvra’s unfertilized eggshit. Whoo, recycling.
//Tooltip: You can only imagine how amazing it would feel to have the bubbly bimbo goo-girl pump you full of her eggs.
//Req: Genitals
public function getEggedByCrystalGoo():void
{
	clearOutput();
	flags["CRYSTAL_GOO_DEFEAT"] = 3;
	output("By the way things look, this poor ganrael girl’s been completely addicted to the pleasure of getting pumped full of eggs day after day after day. You can only imagine what she’s experienced, but with her at your mercy, you think you could help yourself to a sample. The thought of pinning the goo down and forcing her to pump some of her eggy bounty into you sends a shiver of anticipation through you.");
	output("\n\nYou start to slowly set aside your gear, running hands over yourself to emphasize your ");
	if(pc.biggestTitSize() >= 1) 
	{
		output("bust");
		if(pc.hasGenitals()) output(" and your ");
	}
	if(pc.hasCock()) output("[pc.cocks]");
	else if(pc.hasVagina()) output("[pc.vaginas]");
	output(" before turning around and giving yourself a slap on the ass in the go’s direction, drawing her attention from her cowering in the corner. Her big, purple eyes grow wide as she drinks in your naked form; seeing that you’ve captured her gaze, you give her a lusty smile and swish your hips enticingly, using your body to replace the goo’s fear with something a little more palatable to your advances. She makes a pathetic little moan, rubbing her arms around the swollen, hard surface of her crystal belly - apparently a very pleasurable motion, if the way she jiggles and groans afterwards is any indication.");
	output("\n\nNow that she’s a little more open to you, you shimmy over to the fallen goo while groping and stroking yourself, putting on a show all the way until you’re right beside her.");
	output("\n\n<i>“W-what’re you...”</i> the goo starts to say, trailing off as you slip down to ");
	if(pc.legCount != 1) output("straddle her amorphous lower body");
	else output("press your lower body into her gooey form");
	output(", leaning in close to her.  <i>“You’re not gonna hurt my eggs, are you?”</i>");

	output("\n\n<i>“No,”</i> you assure her, reaching gingerly down to run your hand across her plated belly. You don’t want to hurt them - you want to give them a wonderful new home. Her eyes go inhumanly wide");
	if(silly) output(" like an anime character’s");
	output(", and you feel her gooey hands mold themselves around yours, guiding you to more pleasurable spots on her belly.");

	var x:int = -1;
	if(pc.hasVagina()) x = rand(pc.totalVaginas());
	output("\n\n<i>“The queen told me to take care of them,”</i> the goo-girl whines between moans, but she doesn’t stop you as you grasp her slimy body, stroking it out until you’ve shaped a vaguely phallic pillar of goop from her groin. You keep jacking off the growing spire of veridian goo, guiding it from just below her crystalline belly towards your [pc.vagOrAss " + x + "]. Your defeated foe moans, bucking her vaguely-defined hips in response to your touch. Her resistance, such as it was, evaporates into lusty cries and obscenes jiggles that make her pendulous breasts and huge belly shake maddeningly. You can’t resist the urge to bury your face in her chest, smothering yourself in bouncy, warm goo. She’s so soft, just firm enough to keep you from sinking completely inside her. Not that you think she’d mind that, if the way your free hand’s fingers penetrating even her side make her squeal and gasp when you move them. Her whole body must be like a pussy, mindbreakingly sensitive to anything that finds its way inside.");

	output("\n\nNo wonder those eggs are so amazing for her! Imagine having a hundred cocks inside you, edging you all day every day, rubbing incessantly against every sensitive spot inside your [pc.vagOrAss " + x + "] - that’s what the goo-girl must feel from her belly full of eggs! It might not feel so intense for you, but realizing what’s got the goo so pleasure-crazed only makes you more eager for her to pump you full of ‘em.");

	output("\n\nYou squeeze the pillar of goo in your hand, stroking it until it presses against your [pc.vagOrAss " + x + "]. Chewing your lip, you start to press your [pc.hips] down onto the cock - or more accurately, ovipositor - you’ve shaped out of the broodmare’s body, whispering sweet nothings between commands to hold herself still: you need her nice and hard to actually side inside you! She whimpers with pleasure, squirming haplessly underneath you, but her rod stays nice and firm, letting you push yourself down on it until with a gasp, you feel warm wetness flood into you.");
	output("\n\nWith a groan of pleasure, you slide down her artificial goo-cock, letting as much of her slimy body pour into your [pc.vagOrAss " + x + "] as you can. And she gives you plenty! Once the dam breaks, she floods like water through your clenching hole, using the first sliver of goo like a beachhead to stretch you out, growing and growing her tendril inside you until it’s as thick as a proper cock, and then some. You grit your teeth and moan, grinding your [pc.hips] into the gooey girl’s lap as she fucks you wide open.");
	if(x >= 0) pc.cuntChange(x,200);
	else pc.buttChange(200);

	output("\n\nNow that she’s got a thick, pulsing probe of goo snaking inside you, the goo-girl’s got a perfect vector to start pumping you full of those magnificent little eggs. Each of them looks a little less than fist-sized, certainly thicker around than your average cock! You can’t wait to feel them pushing through your [pc.vagOrAss " + x + "], stretching you wide again and again");
	if(x < 0) output(" like the biggest set of lubed-up anal beads you’ve ever seen");
	output(". You give the girl’s crystal belly a gentle pat and tell her to get to it: you <i>need</i> those eggs inside you.");

	output("\n\nShe whines at your request, clearly sad to be forced to disgorge her ovi-load... but she knows she’s been beaten. To the victor go the spoils, after all. After a moment of hesitation, she finally seems to lose her resistance, and you see the clutch of eggs inside her start to shift downwards toward her squirming ovi-cock. A shiver of anticipation slips down your spine as you bury your face deeper into her slimy cleavage, trying to relax your quivering muscles around the goo inside you, opening wide to make way for the eggs.");

	output("\n\nIt’s almost hypnotic, watching a stream of eggs dislodge from the near-perfect crystal casing pressing against your [pc.belly]. Several of eggs start the long journey through the goo-girl’s body towards your ");
	if(x >= 0) output("crotch");
	else output("ass");
	output(", and just like you’d thought, feeling all those fist-sized orbs rolling through her porous body makes the goo-girl squeal with pleasure. Every inch of her vacuous insides is as sensitive as a normal girl’s G-spot, and the eggs inside her tumble end over end through a pulsating channel that makes sure that as much goo as possible gets rubbed again and again by passing eggs.");

	output("\n\nEventually, after what seems like an eternity of agonizing anticipation, the first of the eggs finally finds its way into the viridian ovipositor you’ve forced the goo-girl to create. You bite your lip, trying to relax yourself as the egg begins its journey upwards through her tendril and into you. Her wriggling inside you reaches a fever pitch, thrashing her gooey tentacle around in your ");
	if(x < 0) output("ass");
	else output("pussy");
	output(" like she’s trying to stretch you out to make room for her charges.");
	if((x >= 0 && pc.vaginalCapacity(x) >= 500) || (x < 0 && pc.analCapacity() >= 500)) output(" Not that she needs to: you’re pretty sure you could stuff all those eggs inside you, no problem!");
	output(" You brace for impact, feeling the gentle but firm pressure on your ");
	if(x >= 0) output("pussy lips");
	else output("anal ring");
	output(" as the goo-girl fucks the first egg in.");

	output("\n\nGetting egged feels exactly as good as you’d imagined, a cascade of pleasure radiating up from your [pc.vagOrAss " + x + "], turning your muscles to liquid. The egg pushes in, spreading your hole wide open and gliding in through a tube of pure, wet, gooey lube. Your stomach lurches as the egg tumbles in along the tentacle’s slimey expanse. The sensation is overwhelming, eliciting a silent cry of pleasure from you; your limbs contract around the goo’s soft body, going limp as your body surrenders to the egging. A second soon joins the first in stretching out your ");
	if(x >= 0) output("womb");
	else output("bowels");
	output(", pushing through your failing defenses on a sloppy trail of wriggling goo.");

	output("\n\nEgg after egg pushes into you, bloating your belly in a ");
	if(pc.skinType == GLOBAL.SKIN_TYPE_GOO) output("gooey");
	else if(pc.hasScales()) output("scaly");
	else if(pc.hasFur()) output("furry");
	else output("fleshy");
	output(" counterpart to the goo-girl’s own. You both moan and cry out, engulfing each other in ecstasy as the queen’s clutch transfers from the gooey broodmare’s body to yours.You lose count of how many eggs pass through your [pc.vagOrAss " + x + "], but it feels like at least ");
	var eggCount:int = 5 + rand(6);
	output("! You’re left panting and gasping as the last egg squirms inside you, settling in among its sisters.");

	output("\n\n<i>“Y-you’ll take care of them, right?”</i> the goo murmurs, still wriggling her egg-bloated cock inside you. Even if you wanted to answer, your mounting orgasm prevents you, leaving you with only gasps and moans into her gooey chest. She takes that as an implied yes, it seems, as her limbs wrap around you, holding you tight as her slimy ovi-cock packs the eggs in tightly, leaving them slathered in hot goo before slowly pulling out of you.");

	output("\n\nYou take a few moments to recover before slowly rolling off of the goo-girl, running your hands across your gravid belly. Oh, that felt amazing... and now you’ve got a host of the queen’s ");
	if(flags["CRYSTAL_GOO_GLORYHOLED"] == 1) output("fertilized ");
	output("eggs rolling around in your ");
	if(x >= 0) output("womb");
	else output("gut");
	output(". Maybe you’ll have some royal daughters before long...");
	//99999 set up some pregger shit
	processTime(16);
	pc.orgasm();
	//[Next]
	gooVictoryPostGooCheck();
}

public function gooVictoryPostGooCheck():void
{
	clearMenu();
	if(pc.armor is GooArmor || pc.destroyItemByName("Goo Armor",1)) addButton(0,"Next",armorGooVictoryShits);
	else genericVictory();
}

//Post Goo-Battle: Nova Upgrade!
//PC has Armor Goo equipped or in inventory.
//Play after PC is done with guu post-fite. Armor Goo gets a permanant +2 Defense bonus, and counts as Mirrored.
public function armorGooVictoryShits():void
{
	clearOutput();
	//show armorbutt?
	showName("GOO\nARMOR");
	showBust("GRAYGOO");
	output("<i>“Oh, hey,”</i> [goo.name] says, poking her head out. <i>“that crystal stuff she made was really cool, huh?”</i>");
	output("\n\nYou pause, taken aback by your normally-passive suit of goo’s sudden outburst. Still, you nod: the crystal on that ganrael broodmare was certainly useful to her.");
	output("\n\n<i>“Could I, um... get a sample, maybe?”</i> [goo.name] asks sweetly, reaching her head around on a stalk of gray goop to give you a puppy-dog look. <i>“I bet I could replicate it! Make myself an even better bodysuit for you!”</i>");
	output("\n\nWell, if she can give you an edge in combat, you can hardly pass that up. You turn back to the moaning pile of defeated goo-broodmare and crouch down beside her, letting [goo.name] go to work. The bubbly gray goo hops ");
	if(pc.armor is GooArmor) output("off of you");
	else output("out of your pack");
	output(" and burbles over to the egg-laden slut, reaching a silvery hand down to run a few fingers along her crystal-armored belly. <i>“Oooh, it’s pretty!”</i> [goo.name] giggles, <i>“And hard, too! Hmm, bio-crystal like this... just really hardened body cells. Interesting! Hmm, analysis shows a complexe biological process going on all through her body, turning old cells crystal, pushing them together to form shards... I can totally do that!”</i>");
	output("\n\nSometimes it’s easy to forget [goo.name] was <i>supposed</i> to be a medical program, before whatever went wrong with the grey goo turned her into a flighty bimbo. Makes you wonder what happened to the ganrael girl to make her into such a mindlessly loyal egg-slut. This nyrean queen must really be something...");
	output("\n\nAs you’re musing to yourself, you see [goo.name] hop off of the defeated ganrael and scoot back over to you. As she moves, bit of her shoulders and legs begin to bubble and morph, changing into gray facsimiles of crystal armor plates. They seem sturdy, too - enough so that your bubbly bodysuit invites you to punch them as hard as you can. You give them a few good smacks, and [goo.name] just giggles and quivers from the impacts. The gooey crystal shifts back in her body when you hit them, but pop back a moment later. You’re not sure just how effective they’d be at stopping a bullet, but they’d certainly give a fist-fighter something to think about.");
	output("\n\n<i>“Like my new look?”</i> [goo.name] grins, twirling around to show off a growing number of spikey grey crystal plates forming on her chest and back, forming pauldrons and a solid breastplate. You’re sure that, when it comes time to have a little fun, the plates could easily be absorbed back into her. But here in a place rife with danger, well, she almost looks like a sexified version of a proper knight now!");
	output("\n\nShe giggles at the praise and bounds back to you. <i>“Ready to go, [pc.name]!”</i>\n\n");

	//9999 check with Geddy on if it'd be better to edit the armor's data values or make a new armor item and hot-swap.
	processTime(6);
	clearMenu();
	genericVictory();
}

/*
output("\n\nCarrying Royal Eggs");

output("\n\nNyrean Egg Carrying");
output("\n\n//Nyrean pregnancy lasts 7+/-2 days. The PC’s belly becomes fairly gravid, and their movement speed and evasion is reduced (or whatever standard preg debuffs there are, I dunno).");

output("\n\nOther stuff we need to define a pregnancy:");

output("\n\nMinimum Quantity: 5");
output("\n\nMaximum Quantity: 10");
