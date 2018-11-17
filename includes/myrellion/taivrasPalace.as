import classes.Characters.NyreanPraetorians;
import classes.Characters.Princess;
import classes.Characters.Queensguard;
import classes.Characters.Taivra;
import classes.Creature;
import classes.GameData.CombatManager;
import classes.Items.Miscellaneous.GemSatchel;
//flags["CRYSTAL_GOO_DEFEAT"] - 1 = HP, 2 = LUST, 3 = you fucked her after winning (or got egged)

public function showTaivra(nude:Boolean = false):void
{
	if (nude) showBust("TAIVRA_NUDE");
	else showBust("TAIVRA");
	if(!inCombat() || pc.HP() <= 0 || pc.lust() >= pc.lustMax() || enemy.HP() <= 0 || enemy.lust() >= enemy.lustMax()) showName("QUEEN\nTAIVRA");
	else 
	{
		showName("FIGHT:\nQUEEN TAIVRA");
		if(flags["FREED_DANE_FROM_TAIVRA"] == 1) showBust("TAIVRA",daneBustDisplay());
	}
}
public function showQueensguard():void
{
	showName("\nQUEENSGUARD");
	showBust("QUEENSGUARD");
}
public function showPraetorians(nude:Boolean = false):void
{
	if(inCombat()) showName("FIGHT: NYREAN\nGUARDS");
	else showName("NYREAN\nGUARDS");
	if(!nude) showBust("PRAETORIAN","PRAETORIAN","PRAETORIAN");
	else showBust("PRAETORIAN_NUDE","PRAETORIAN_NUDE","PRAETORIAN_NUDE");
}

public function metTaivra():Boolean
{
	if(flags["BEAT_TAIVRA_TIMESTAMP"] != undefined || flags["KING_NYREA"] != undefined || flags["MET_TAIVRA"] != undefined) return true;
	return false;
}

public function reclaimedProbeMyrellion():Boolean
{
	// Used for checking whether or not the probe was reclaimed!
	// Coordinates to next planet seems to be taken after the probe has been reclaimed/touched.
	// After getting the lucky bucks
	if(flags["MYRELLION_PROBE_CASH_GOT"] != undefined) return true;
	// For marrying Taivra
	if(flags["BEAT_TAIVRA_TIMESTAMP"] == undefined && flags["KING_NYREA"] != undefined && flags["TAIVRA_NEW_THRONE"] > 0) return true;
	// For beating Taivra (Leave/Kill/Subjugate)
	if(flags["BEAT_TAIVRA_TIMESTAMP"] != undefined) return true;
	// else
	return false;
}

public function nyreaDungeonFinished():Boolean
{
	//Are you king? No.
	if(flags["KING_NYREA"] == undefined)
	{
		if(flags["BEAT_TAIVRA_TIMESTAMP"] == undefined) return false;
	}
	//Anything else? Fuck yes it finished.
	return true;
}
public function nyreaDungeonGateOpen():Boolean
{
	if(pc.hasPerk("Nyrean Royal")) return true;
	//Has taivra been down 12+ hours? If yes, seal the gates
	if(flags["BEAT_TAIVRA_TIMESTAMP"] != undefined)
	{
		if(flags["BEAT_TAIVRA_TIMESTAMP"] + (12 * 60) <= GetGameTimestamp()) return false;
	}
	//Otherwise, Gate is open if praetorians are in recovery mode
	else if(flags["FOUGHT_PRAETORIANS"] != undefined)
	{
		if(flags["PRAETORIAN_RESPAWN"] != undefined && flags["PRAETORIAN_RESPAWN"] + (12 * 60) > GetGameTimestamp()) return true;
	}
	return false;
}

//Add to the Gates of Taivra’s Palace square
public function taivrasPalaceSquareBonus():Boolean
{
	author("Savin");
	//Officially become King Nyrea!
	if(!pc.hasPerk("Nyrean Royal") && flags["KING_NYREA"] == 1 && flags["BEAT_TAIVRA_TIMESTAMP"] + (12 * 60) <= GetGameTimestamp())
	{
		nyreaKingReturnGreeting();
		return true;
	}
	//KING NYREA!
	else if(pc.hasPerk("Nyrean Royal"))
	{
		output("\n\nA pair of nyrean huntresses in light armor and carrying spears stand outside the gates, staring impassively into the corridor. When you approach, they awkwardly press their open palms to their hearts and bow. <i>“My liege,”</i> one of them says by way of greeting.");
	}
	//Not royal at all
	else
	{
		//Gate sealed for defeating Taivra
		if(flags["BEAT_TAIVRA_TIMESTAMP"] != undefined && flags["BEAT_TAIVRA_TIMESTAMP"] + (12 * 60) > GetGameTimestamp())
		{
			output("\n\nThe gates are sealed, and nobody is standing outside. There doesn’t seem to be any way you can get the gate open without a lot of help...");
			if(flags["KING_NYREA"] == 1) output("\n\n<b>Perhaps you should wait a day or so for the new power structure to sort itself out before returning.</b>");
		}
		//if Praetorian fight not won:
		else if(flags["FOUGHT_PRAETORIANS"] == undefined)
		{
			output("\n\nA pair of nyrea huntresses stand in front of the towering stone gates, under the light of a pair of <i>“torches”</i> filled with glowing blue fungus. The pair of women are clad in bands of metal armor in addition to their trademark bikini mail, and each holds a long spear in her hands. They look impassively at you, but make no move to attack.");
			//[Approach]
			addButton(0,"Approach",approachNyreanGuardsFirstTime,undefined,"Approach","Talk to the nyrea guards and see if you can get passage past the gate. You’re almost sure the coordinates you got for Dad’s probe lead to a position right near here...");
		}
		// if PC has done Praetoran fite:
		else
		{
			//within 12 hours:
			if(flags["PRAETORIAN_RESPAWN"] != undefined && flags["PRAETORIAN_RESPAWN"] + (12 * 60) > GetGameTimestamp()) output("\n\nA squad of armed and armored nyrean huntresses are scattered around the ground, recovering from the ass-kicking you gave them earlier. When they see you standing around, they either get small or play dead in a hurry.");
			//13+ hours, PC hasn’t finished dungeon OR PC got rekt by the Praetorian last time:
			else
			{
				output("\n\nThe queen’s bodyguard seems to have recovered and are prepared to fight you off again!");
				//PC can’t advance past until they [Fight], which leads straight into another battle.
				clearMenu();
				configurePraetorianFight();
				addButton(0,"Fight",CombatManager.beginCombat);
				return true;
			}
		}
	}
	return false;
}

public function configurePraetorianFight():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new NyreanPraetorians());
	CombatManager.victoryScene(spankDaShitOuttaPraetorians);
	CombatManager.lossScene(loseToPraetorianNyreaGangbangu);
	CombatManager.displayLocation("NYREA GUARDS");
	
	flags["FOUGHT_PRAETORIANS"] = 1;
}

//[Approach]
//Talk to the nyrea guards and see if you can get passage past the gate. You’re almost sure the coordinates you got for Dad’s probe lead to a position right near here...
public function approachNyreanGuardsFirstTime():void
{
	clearOutput();
	showPraetorians();
	author("Savin");
	output("You walk over to the guards, hoping to talk to them. Instead, the guardswomen plant their feet and cross their spears over the heavy stone gate, an unnecessary but obvious sign that you’re about to be refused passage.");
	output("\n\n<i>“Turn back, star-walker,”</i> one of the women says; the other twists her black lips into a distinct frown. <i>“Queen Taivra has decreed no more offworlders are to be permitted in the palace. Your kind have done us enough insult.”</i>");
	output("\n\n<i>“What?”</i> you ask. Definitely weren’t expecting that answer.");
	output("\n\nThe other guard grunts. <i>“Our queen was attacked by one of you space-creatures. One who said [rival.heShe] wished to talk diplomacy. We will not suffer such an insult again... your kind is no longer welcome here.”</i>");
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
	showPraetorians();
	author("Savin");
	output("<i>“I’m going in. Like it or not,”</i> you tell the guards, [pc.readyingWeapon].");
	output("\n\nThe guards lower their spears at you, and one of them grabs a rope behind her, leading into the wall. A bell resounds inside, and a moment later the gate is creaking open and several more nyrean huntresses are pouring out. And suddenly, your odds look a little less great...");
	processTime(1);
	//[Fight!]
	clearMenu();
	configurePraetorianFight();
	addButton(0,"Next",CombatManager.beginCombat);
}

//[Persuade]
//Try and talk your way into the nyrean camp. Surely the three of you could work something out...
public function tryAndPerseudeFutaBugSlootsToMooooove():void
{
	clearOutput();
	showPraetorians();
	author("Savin");
	output("<i>“Come on, can’t we work something out?”</i> you ask, putting on your most diplomatic smile.");
	output("\n\nThe two guards exchange a glance, and one of them puts a hand on her hip. <i>“Hmm, at least this one understands parley. Very well, perhaps we could convince the queen to see you. If you have something of sufficient value...”</i>");
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
	showPraetorians();
	author("Savin");
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
	showPraetorians();
	author("Savin");
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
		addButton(14,"Back",mainGameMenu);
	}
	var gems:int = 0;
	//Check if PC has any "GEM" type items.
	for(var x:int = 0; x < pc.inventory.length; x++)
	{
		if(pc.inventory[x].type == GLOBAL.GEM) gems++;
	}
	if(gems == 0) addDisabledButton(1,"Gems","Gems","You don’t have any gems.");
	else if(gems == 1) addButton(1,"Gem",giveDemAGem,gems,"Gem","Offer the gem you’re carrying.");
	else addButton(2,"Gems",giveDemAGem,gems,"Gems","Maybe they’d be interested in one of the gems you’re carrying...");
}

public function giveDemAGem(gems:int):void
{
	clearOutput();
	showPraetorians();
	output("You take out a pouch ");
	if(gems > 1) output("laden with gemstones");
	else if(pc.hasItemByClass(GemSatchel)) output("laden with gemstones");
	else output("with a gemstone");
	output(" and offer them to the guards, hoping to appeal to their avarice. The guards approach, their dark eyes glinting with greed as you reveal your briberous payload. When they get a good look at the stones, though, their lips curl, and the lead guard plants her hands on her hips.");
	output("\n\n<i>“Is that it?”</i> she scowls, squinting at your offering. <i>“No, no, I’m not going to risk Queen Taivra’s wrath for </i>that<i>,”</i> she scoffs, shoving your hand back.");
	output("\n\n<i>“We can get those anywhere,”</i> the other nyrea says. <i>“Come on, if you want to buy your way in, cough up something really </i>unique<i>. Something special!”</i>");
	output("\n\nSomething special, huh? Maybe some precious metals or gems from another world would suit them better...");
	clearMenu();
	addButton(14,"Back",bribeTaivrasGateGuards);
}

//[Plat190]
//Offer your chunk of Platinum 190. Surely these ladies can appreciate the rare beauty of precious metals!
public function offerTaivraGuardsPlat190():void
{
	clearOutput();
	showPraetorians();
	author("Savin");
	output("<i>“How about this?”</i> you ask, taking the chunk of gleaming platinum out of your pack.");
	output("\n\nThe huntresses’ eyes go wide, and one of them takes hold of the shard of ore and looks it over. <i>“It’s beautiful,”</i> she says, waving her comrade over. <i>“Where did you get this?”</i>");
	output("\n\nYou grin and explain that you found the shard in the heart of a dead, alien planet that had been sewn together from two other half-planets. It’s a rare and awesomely expensive isotope of platinum - surely it would fetch a good price down here in the depths, or if they try to sell it to an off-worlder.");
	output("\n\n<i>“This will do nicely,”</i> one of the guards smiles, slipping the platinum shard into a pouch on her belt. <i>“Very well, follow us. We can take you to the queen’s chambers, but I cannot guarantee she’ll want to listen to whatever you have to say.”</i>");
	output("\n\n<i>“Follow us,”</i> the other says, pushing the front gate open and beckoning you on.");
	//[Next] //To <i>“Meeting the Queen,”</i> as if you’d done the whole fucken dungeon. YA CHEETER.
	processTime(15);
	clearMenu();
	addButton(0,"Next",queenTaivrasThrone,true);
	pc.removeKeyItem("Platinum 190");
	flags["PLAT190 USED AS NYREA BRIBE"] = 1;
}

//PC Loses to the Praetorian
//Not a bad end! Huntresses gang-bang you and dump you in town. Have to attempt Praetorian fight again. Lose some credits, of course.
public function loseToPraetorianNyreaGangbangu():void
{
	showPraetorians(true);
	author("Savin");
	output("You stumble to your [pc.knees], ");
	if(pc.lust() >= pc.lustMax()) output("too horny to resist the buxom babes trying to bring you down");
	else output("so badly beaten by the horde of guards that you can barely lift your arms up to fight back anymore");
	output(". A couple of the insectile amazons grab your [pc.weapon] and toss it aside; another grabs your ");
	if(!pc.isNude()) output("equipment and tears it");
	else output("gear and rips it");
	output(", leaving you bare naked on the warm subterranean stone.");

	output("\n\n<i>“Another impertinent star-walker,”</i> the guard leader grouses, glowering down at you. <i>“Worse than the last, even.”</i>");

	output("\n\n<i>“We should teach... her? Him? Whatever this one is... a lesson,”</i> a second guard says, hooking her thumbs under the chain string of her bikini bottom. With a flick of her wrists, the nyrea drops her panties, letting the forearm-sized shaft of her ovipositor-slash-cock flop free between her legs.");
	output("\n\nYour eyes go wide as the prick-toting babe steps over to you and cups your chin, forcing you to look up and her, and rubs her ovi-cock against your cheek. The first huntress follows her sister’s example, grabbing the other nyrea’s ass playfully as she approaches you. She drops her undergarments and pushes you down onto ");
	if(pc.hasKnees() && !pc.isTaur()) output("your hands and knees");
	else output("the ground");
	output(", moving around behind you and pressing her flared prick to the ring of your [pc.asshole]. Other huntresses gather up, undressing and starting to stroke themselves while the lead pair get ready to spit roast you.");

	output("\n\n<i>“For the queen!”</i> the huntress in front of you whispers, barely audible, before grabbing the back of your head and forcing her cock down your throat. Your eyes bulge, and your body stiffens as your mouth is battered by her feline spines, and the turgid ball of her animalistic knot presses against your lips. Your throat is straining hard around her dick, bulging brutally and throbbing hard enough to make you moan like a bitch in heat.");

	output("\n\nBehind you, the other guard follows her example, pressing her hips forward against your exposed backside. You squeal, desperately trying to resist her anal assault, but ultimately succumbing to her strength: you feel your [pc.asshole] pop open with one final, brutal thrust, and then the nyrea is sliding into you, raking her nubby spines across your anal walls. Your gut bulges in response, straining to take the massive insertion. Around you, the other nyrea cheer and laugh, urging their sisters on with lurid shouts. All you can do is try and bear it, to endure the mix of pleasure and pain as you’re savagely violated.");
	pc.buttChange(enemy.cockVolume(0));

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

	output("\n\nThe other huntresses murmur their agreement, and you feel hands grabbing your [pc.legOrLegs] and starting to drag you away.");

	//3-4 loads in mouth and similar amount in butt?
	
	for (var i:int = 0; i < 4; i++)
	{
		pc.loadInAss(enemy);
		pc.loadInMouth(enemy);
	}
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
	author("Savin");
	var lostCreds:int = 0;
	if(pc.credits > 0) 
	{
		if(10 > pc.credits * .2) lostCreds = 10;
		else lostCreds = pc.credits * 0.2;
		if(pc.credits < lostCreds) lostCreds = pc.credits;
	}
	output("You end up getting dumped back in the nyrea village you passed through, not far from the merchant row. The guards give you a few more harsh words and a little more teasing before they go");
	if(lostCreds > 0) 
	{
		output(" - and they even liberate you of " + num2Text(lostCreds) + " credits, too");
		pc.credits -= lostCreds;
	}
	output(". Several commoners look on with wide eyes as you’re dumped off, and the guards return to the palace.");

	output("\n\nYou groan and stagger back to your [pc.footOrFeet], thankful the nyrea left you your equipment. Gonna have to try again if you want to face your cousin and find the probe...\n\n");
	//[Next] //To map
	CombatManager.genericLoss();
}

//PC Victory vs. Praetorian
//Disables Praetorian fight for 12 hours. If PC clears dungeon, never fight them again. Otherwise they recover eventually.
public function spankDaShitOuttaPraetorians():void
{
	showPraetorians();
	author("Savin");
	output("<i>“Enough, enough,”</i> the lead guard says, stumbling to a knee and leaning heavily on her spear. <i>“We yield... no more, please.”</i>");
	output("\n\nThe other nyrea similarly show their submission, throwing down their spears and kneeling - those who can still manage to stand, anyway. You don’t want to risk staying here too long, or the guards might try and jump you: there’s far too many for you to keep an eye on all of them!\n\n");
	flags["PRAETORIAN_RESPAWN"] = GetGameTimestamp();
	variableRoomUpdateCheck();
	//Back to map. Praetorian fight can’t occur again for several hours.
	CombatManager.genericVictory();
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
	author("Savin");
	output("The interior of the palace gates is a well-lit cavern with a high, vaulted roof and several pillars bearing fungal lanterns. A small guard post is set up just past the gates, a little room hollowed out of the rock and outfitted with a dozen or so chairs.");
	//if KingNyrea: 
	//maybe disable these if this is where the praetorian fight actually happens?
	if(pc.hasPerk("Nyrean Royal")) output(" Several of your nyrea warriors are milling around here, ready to stave off an enemy attack.");
	//elseif beat Praetorian:
	else output(" The place has been cleared out, thanks to your forceful entrance.");
	//SPOILS! Happens on entering the interior gate room
	//Not a menu-producing event. Append to description?
	if(pc.hasPerk("Nyrean Royal") && (flags["NYREAN_SPOILS"] == undefined || flags["NYREAN_SPOILS"] + (7 * 24 * 60) < GetGameTimestamp()))
	{
		getRoyalSpoils();
		return true;
	}
	return false;
}

//Room 2E13 Palace Thoroughfare
public function palaceThoroughfareBonus():Boolean
{
	author("Savin");
	output("A long tunnel runs east to west, T-boning north back towards the gates. A painted mural decorates the southern wall, showing ");
	if(metTaivra()) output("Queen Taivra");
	else output("an especially buxom, powerful-looking huntress");
	output(" wielding a spear and driving back a horde of horrible worm-like creatures in a darkened cavern. Several naked, afraid male nyrea cling to her plated legs, cowering behind the amazonian warrior woman.");
	return false;
}

//Room 2C13 Queen’s Fountain
public function queensFountainBonusShit():Boolean
{
	author("Savin");
	output("This large, circular chamber has passages leading north, south, and east, each a squared-off tunnel with a simple silk curtain acting as a door. The center of the room is dominated by a natural fountain: a caldera of stone eroded in a perfect bowl shape in the floor, and filled with water that trickles down from a crack in the cavern’s ceiling.");
	variableRoomUpdateCheck();
	//if PC is NyreaKing, 12 hours have passed since dungeon victory:
	if(queensguardAtFountain()) 
	{
		addButton(0,"Queensguard",queensGuardRepeatApproaches);
		output("\n\nQueensguard, Taivra’s personal bodyguard, is standing here. Her shield is sitting on the ground beside her, and both hands are on the hilt of her sword. She favors you with a slight nod, saying <i>“My " + pc.mf("king","queen") + ",”</i> by way of greeting. It looks like she’s recovered nicely from the fight.");
	}
	return false;
}

public function queensguardAtFountain():Boolean
{
	if(pc.hasPerk("Nyrean Royal") && flags["QUEENSGUARD_STAB_TIME"] != undefined && flags["QUEENSGUARD_STAB_TIME"] + (12 * 60) < GetGameTimestamp()) return true;
	return false;
}

//Room 2C15 Queen’s Chambers
public function queensChambersBonus():Boolean
{
	author("Savin");
	output("You stand in a lavish bedchamber, staring at a more than king-sized canopied bed with lush pink silken sheets and blankets. A rack of simple swords and spears line the walls, none of which are worth your attention. A few pieces of art - sculptures, mostly - adorn the tops of a dresser and nightstand, as does a large fungus-filled lantern that glows with a soft blue light.");
	//Nyrean Kingdude!
	if(pc.hasPerk("Nyrean Royal"))
	{
		//if NyreaKing & did Goofite:
		if(flags["CRYSTAL_GOO_DEFEAT"] != undefined) output("\n\nYou can see some gooey slop on the stone floor, near the little hatch Taivra’s pet broodmother goo lives in.");
		//if NyreaKing & skipped Goofite:
		else output("\n\nYou can see some gooey slop on the stone floor, near one of the big carpets on the stone floor just under a gloryhole in the wall beside her bed.");
		if(pc.hasCock())
		{
			if(pc.lust() >= 33) addButton(1,"Gloryhole",useRepeatGloryhole,undefined,"Use Gloryhole","Well, that’s what it’s there for, right? Stick your dick right into the gloryhole and treat yourself to your queenly mate’s favorite evening pastime.");
			else addDisabledButton(0,"Gloryhole","Use Gloryhole","You’re not aroused enough to consider this.");
		}
		else addDisabledButton(0,"Gloryhole","Use Gloryhole","You don’t have the equipment to do that.");
	}
	//Play <i>“Incubator Goo”</i> encounter on first entry.
	else if(flags["CRYSTAL_GOO_DEFEAT"] == undefined)
	{
		incubatorGooEncounter();
		return true;
	}
	//if not NyreaKing:
	else
	{
		output("\n\nThe crystal-coated broodmother is ");
		//Lustbeat
		if(flags["CRYSTAL_GOO_DEFEAT"] == 3) output("moaning and groaning in the corner, still locked in the throes of pleasure even after you had your way with her");
		//by physical:
		else output("cowering in the corner, arms and crystal plates wrapped protectively around her belly full of eggs");
		output(".");
	}
	if(flags["NYREAN_SPOILS"] != undefined) { /* No need! */ }
	else if(flags["LOOTED_TAIVRAS_BEDROOM"] == undefined) addButton(0,"Search",searchTheQueensChambers,undefined,"Search","Maybe you’ll find something useful in the queen’s chambers?");
	else if(flags["LOOTED_TAIVRAS_BEDROOM"] == 0) addButton(0,"Gem Sack",searchTheQueensChambers,undefined,"Gem Satchel","Take the sack of gems.");
	else addDisabledButton(0,"Search","Search","You’ve already searched this room, discovering a silver key and sack of gems.");
	return false;
}

//[Search]
//Maybe you’ll find something useful in the queen’s chambers?
public function searchTheQueensChambers():void
{
	clearOutput();
	if(flags["LOOTED_TAIVRAS_BEDROOM"] == undefined)
	{
		showName("\nSEARCHING...");
		author("Savin");
		output("You spend a few minutes tossing the room, looking for anything of value. Your search reveals several interesting finds: some sex toys made for the nyrea’s unique biology, some handcuffs and gags, and what looks like primitive pornography etched in stone tablets. Clearly the queen’s got a kinky side...");
		output("\n\nMore important to your quest, though, you find hidden away in her nightstand a <b>silver key</b> and a <b>satchel full of gemstones</b>. These will probably turn quite a profit...");
		output("\n\n(<b>Gained Key Item: Silver Key</b> - This must open something somewhere in the royal complex.)\n\n");
		//Add Silver Gate Key to Key Items
		pc.createKeyItem("Silver Key",0,0,0,0);
		processTime(5);
	}
	flags["LOOTED_TAIVRAS_BEDROOM"] = 1;
	//Add Gem Satchel to inventory. Worth about ~10k Creds when sold.
	//sumbody get on dis
	var gems:GemSatchel = new GemSatchel();
	lootScreen = lootTaivrasGemsCheck;
	itemCollect([gems]);
}
public function lootTaivrasGemsCheck():void
{
	if(pc.hasItemByClass(GemSatchel))
	{
		mainGameMenu();
		return;
	}
	
	clearOutput();
	output("Not having room for it, you place the satchel full of gems back where it was.");
	flags["LOOTED_TAIVRAS_BEDROOM"] = 0;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Room 2C9 Stairway
public function taivrasStairwellBonus():Boolean
{
	author("Savin");
	output("A curving path connects the rest of the palace grounds to a large set of stairs, leading up to a pair of heavy stone doors flanked by brilliantly glowing blue lanterns. Through the door, you can hear the sounds of pleasure echoing, moans and cries of sexual ecstasy. Several of them, in fact.");
	//if Princess Defeated:
	if (flags["PRINCESS_DEFEATED"] != undefined) output(" You’re surprised the harem is still going, even after freeing them from the queen’s daughter.");
	return false;
}

//Room 2A9 Harem Chamber
public function haremChamberBonusFunc():Boolean
{
	author("Savin");
	output("The harem chamber is a wide open stone room covered with pillows, cushions, and other comforts for the feminine males kept within it. An all but obscene amount of bondage gear - leather, cuffs, whips, and chains, plus no small number of dildos and plugs - sits in racks along the walls. Several dozen “male” nyrea - all with plump bosoms, girly figures, and drooling vaginal slits - make up their queen’s harem.");

	//Post Princess battle:
	if(flags["PRINCESS_DEFEATED"] != undefined)
	{
		output("\n\nThe nyrean princess is down in the middle of her swarming harem, pinned by some of that very same bondage gear to the wall. Her eyes are glassy and fogged, her lips flopping and confused, yet her unseemly prick is still rock hard and oozing a thick, purple paste as if recently used. The harem males aren’t giving her much rest, it seems.");
		//output("\n\nThe harem is currently taking their lusts and aggression out on the nyrean princess. Moans and cries of pleasure echo through the chamber, and the floor is covered with writhing bodies and squirting cum.");
		addButton(0,"Join Orgy",genericPostVictoryPrincessOrgyFuck,undefined,"Join Orgy","You’ve little doubt the harem slaves would welcome their liberator into the orgy.");
	}
	//PC is KingNyrea:
	else if(pc.hasPerk("Nyrean Royal"))
	{
		output("\n\nYour nyrea harem is lounging around on the cushions and couches. They do nothing to conceal their nudity as you observe them - indeed, some actively flaunt it, running their hands over hefty tits or spreading their pussy-lips invitingly. Others are busy with each other, groping and kissing and grinding their unique sexes against each others’ chitinous bodies.");
	}
	else return princessBonus();
	//[Use Harem] [Free Them] (see Princess and Harem stuff below)
	//check for conflicts between king nyrea & post princessbeat stuff
	return false;
}


//Room 2G15 Gateway
public function gatewayBonusFunc():Boolean
{
	author("Savin");
	output("You’re standing before a huge, imposing steel gate bearing the symbol of the queen: a shield with a spear pierced through it, and what looks like several tentacles wrapped around them both. The gate is currently ");
	if(flags["UNLOCKED_TAIVRAS_GATE"] == undefined && flags["KING_NYREA"] == undefined)
	{
		if(!pc.hasKeyItem("Silver Key")) 
		{
			output("sealed, barring your path. You’ll need to find a key to get the big, meaty padlock off of it.");
			addDisabledButton(0,"Use Key","Use Key","You don’t have the key.");
		}
		else 
		{
			output("sealed, barring your path. Luckily, you found a key!");
			addButton(0,"Use Key",unlockedTaivrasGate,undefined,"Use Key","Put that big ol’ silver key you found to use.");
		}
	}
	else output("standing open, allowing you to enter the queen’s throne room.");
	output(" To your surprise, the gate isn’t guarded.");
	return false;
}

public function unlockedTaivrasGate():void
{
	clearOutput();
	showName("\nUNLOCKED!");
	author("Savin");
	output("The lock gives way to the Silver Key with a satisfying click. You can move on!");
	flags["UNLOCKED_TAIVRAS_GATE"] = 1;
	variableRoomUpdateCheck();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Room 2E17 Throneroom
public function taivrasThroneBonusFunc():Boolean
{
	author("Savin");
	if(flags["BEAT_TAIVRA_TIMESTAMP"] == undefined && flags["KING_NYREA"] == undefined)
	{
		queenTaivrasThrone(false);
		return true;
	}
	//PC executed Taivra:
	else if(flags["KILLED_TAIVRA"] != undefined)
	{
		output("Queensguard, despite her wounds, is kneeling over the body of her queen and weeping quietly. As you demanded, she’s gathered the remnants of her soldiers - those who haven’t deserted into the caves - and ordered them to dismantle the queen’s throne from around your father’s probe, ready to deliver the probe outside for a Steele Tech team.");
	}
	//PC is KingNyrea vis Peace:
	//First 12 hours after fight:
	else if(flags["KING_NYREA"] != undefined && flags["BEAT_TAIVRA_TIMESTAMP"] == undefined && flags["QUEENSGUARD_STAB_TIME"] != undefined && flags["QUEENSGUARD_STAB_TIME"] + (12 * 60) > GetGameTimestamp())
	{
		output("Your newly-minted mate is sitting on the edge of her throne’s dias, tending to the wounds her bodyguard suffered at Dane’s hands. Taivra looks at you with something between fear and admiration, and she keeps her hands well clear of her weapons. Your father’s probe remains where it was, acting as your wife’s throne. It flashes occasionally, reacting to your presence.");
		taivrasGuardsBonusBlurb();
	}
	//PC spared Taivra:
	else if(flags["KING_NYREA"] == undefined)
	{
		output("Queen Taivra is sitting on the edge of her throne’s dais, tending to the wounds her bodyguard suffered at Dane’s hands.");
		if(flags["BEAT_TAIVRA_TIMESTAMP"] != undefined) output(" As you demanded, some of her warriors are dismantling her probe-throne, getting ready to dump it out into the village.");
		output(" The queen glowers at you, not in hatred, but in what you would almost call admiration. Clearly your ability to best her has made an impression on the nyrean queen.");
	}
	//PC is KingNyrea:
	else
	{
		//First 12 hours after a bitch got shanked
		if(flags["QUEENSGUARD_STAB_TIME"] != undefined && flags["QUEENSGUARD_STAB_TIME"] + (12 * 60) > GetGameTimestamp())
		{
			output("Your newly-minted mate is sitting on the edge of her throne’s dais, tending to the wounds her bodyguard suffered at Dane’s hands.");
			if(flags["BEAT_TAIVRA_TIMESTAMP"] != undefined) output(" As you demanded, some of her warriors are dismantling her probe-throne, getting ready to dump it out into the village.");
			output(" Taivra looks at you with something between fear and admiration, and she keeps her hands well clear of her weapons.");
			taivrasGuardsBonusBlurb();
		}
		// (N.B. Change the code so that it triggers the salvage scene next time you hit the surface. Maybe disable the chambers and throne buttons on Taivra’s menu until you do just to enforce that she’s a little irked with you?)
		else if(flags["TAIVRA_NEW_THRONE"] == 0)
		{
			output("The area where Queen Taivra’s “throne” once was has been blocked off, with the queen herself behind it, probably waiting until she attains the new one you’ve purchased for her. Perhaps you should return after retrieving it?");
			addDisabledButton(0,"Taivra","Taivra","You’ve ordered Taivra a new throne. You can’t seem to interact with her until she gets it.");
		}
		// (N.B. This is just a one-off uveto-unlocked probe returned thing to tie the whole thing up.)
		else if(flags["TAIVRA_NEW_THRONE"] == 1)
		{
			queenTaivrasNewThrone();
			return true;
		}
		//Thereafter
		else 
		{
			// Egg-stuffed Beta Special
			if(flags["TAIVRA_FERTILE"] > 0 && (flags["TAIVRA_FERTILE"] + (12 * 60)) < GetGameTimestamp())
			{
				taivrasEggStuffedBeta();
				return true;
			}
			
			output("Queen Taivra is sitting on her throne, one leg crossed over the other and a great spear held in her hand. Her mass of tentacle cocks are busily breeding several beta huntresses, sprawled out on their backs at the foot of her throne with their hollow ovipositors erect and penetrated, being filled with their queen’s seed. Taivra looks almost bored, even with twelve cocks simultaneously fucking a dozen huntresses at once.");
			output("\n\n<i>“[pc.name],”</i> she says with a faint smile, not interrupting her mating. <i>“You desire something, my " + pc.mf("king","queen") + "?”</i>");
			addButton(0,"Taivra",taivraRepeatScenes);
		}
	}
	return false;
}
public function taivrasGuardsBonusBlurb():void
{
	output("\n\n<b>You should come back in a day or so if you’d like to interact her. Hopefully someone will remember to tell the gate guards about you. It’d suck to have to fight them again on the way out - but it might happen.</b>");
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
	author("Savin");
	output("As you enter the side chamber, you’re greeted by the smell of sweet perfumes wafting off of a dozen colorful candles surrounding a richly adorned bed with silken sheets and a tall canopy. You must have stumbled into the bedroom of the palace’s queen! There’s gotta be some awesome loot in here somewhere, and maybe a hint as to where the locals have stuffed your probe... and what happened with your cousin.");
	output("\n\nYou spend a few moments scouring the room, following the smooth curves of the stone walls with your hand as you poke through the queen’s belongings. The search quickly leads you to a girthy hole chiseled into the wall, clearly artificial in its perfectly circular, smooth shape. It almost looks like a... like a glory hole, set about at crotch height for a nyrean woman.");
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
		addDisabledButton(0,"Use G.Hole","Use Gloryhole","You don’t have the equipment to do that.");
		addButton(1,"Step Back",stepBackFromGloryHoles,undefined,"Step Back","You don’t exactly have the right equipment to slot in there...");
	}
}

//[Step Back]
//if dick: No way you’re sticking your dick in there. Who knows what’s on the other side?
//Else: You don’t exactly have the right equipment to slot in there...
public function stepBackFromGloryHoles():void
{
	clearOutput();
	showIncuGoo();
	author("Savin");
	output("You take a wary step back, worried about what exactly you’ve just woken up. A moment later, you hear a wet slurping noise from through the alien gloryhole, and the feminine voice inside calls out <i>“Queenie, don’t tease me like that! C’mon already!”</i>");
	output("\n\nYou don’t exactly know how to respond to that, and in the couple of moments you spend flubbing for some response that will keep the creature placated, you hear something clicking behind the stone. You manage to scramble back just in time to avoid falling in as a trap door pops open from underneath a shaggy rug, and a glistening green figure pulls herself up from below.");
	output("\n\n");
	//if seen a Crystalgu b4:
	if(CodexManager.entryUnlocked("Ganrael")) output("You instantly recognize the familiar form of a ganrael, the planet’s crystal-hemmed goo race, but something’s very different about this specimen. ");
	else 
	{
		output("It’s a green goo-girl, just like Celise, but covered with bits of glistening crystal. Your Codex beeps, identifying it as a ganrael, a myrellion native species. ");
		//CODEX UNLOCK!
		CodexManager.unlockEntry("Ganrael");
	}
	output("She’s adopted a relatively humanoid form, probably based off of a gooey interpretation of the nyrea she’s living besides: she’s got two arms, a human-like head with big elfin ears, and a curvaceous body with big tits and hips that fold down into a solid base of goo instead of legs. Her crystals, though, are what tip you off to what you’re really dealing with here: a thick dome of emerald crystal has formed around her belly, shielding a massively pregnant gut filled to the brim with what looks like hundreds of fist-sized eggs! Her middle is hugely bloated, swollen with eggs and plated with as much crystal as the goo could possibly churn out, protecting her charges rather than herself.");

	output("\n\n<i>“You’re not the queen!”</i> she yelps, her purple eyes going wide with surprise. The goo’s arms go protectively around her crystal-armored belly, and you’re left to watch her slimy body jiggle, and all the countless eggs inside her shift listlessly in their gemstone shell. <i>“I-I won’t let you hurt my precious eggs!”</i>");

	output("\n\nUh-oh. You wave your hands, saying that ");
	if(pc.isAss()) output("if you’d wanted to hurt her, you’d have done so already");
	else output("you don’t want to hurt her");
	output(", but the goo’s eyes have already glazed over with protective rage - looks like you’ll have to knock her down!");

	processTime(5);
	clearMenu();
	configureGoocubatorFight();
	addButton(0,"Next",CombatManager.beginCombat);
}

public function configureGoocubatorFight():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(goocubator);
	CombatManager.victoryScene(pcBeatsGoo);
	CombatManager.lossScene(loseToRoyalIncuGoo);
	CombatManager.displayLocation("GOO");
}

//[Use Gloryhole]
//Well, that’s what it’s there for, right? Stick your dick right into the gloryhole and see what’s in store.
public function useDatGloryhole():void
{
	clearOutput();
	showIncuGoo();
	author("Savin");
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
	else output("sliding your tool into a bowl of heated-up yogurt");
	output(". The voice on the other side makes a delighted squeal, and you’re treated to a faint sucking sensation around your member, like the substance is drawing you in.");

	output("\n\nIs that a goo-girl on the other side? It has to be, you tell yourself");
	//if seen a Crystalgu b4:
	if(CodexManager.entryUnlocked("Ganrael")) output(" - probably a ganrael in the queen’s service");
	output(". The way the semi-liquid slurps and squeezes, sucks and caresses your cockflesh is amazing, better than any mouth or sex toy could ever be. An irrepressible grin spreads across your face as you sink every inch of your [pc.cock] into the gooey sheath on the other side of the hole, surrounding your manhood in a constant cavalcade of pleasures.");
	pc.cockChange();
	output("\n\n<i>“Wow, this feels totally different!”</i> the voice on the other side giggles, quivering wonderfully around your dick. <i>“Did you, like, get a whole new cock? Just for me, right?”</i>");
	output("\n\nShe still thinks you’re somebody else - the queen, you suppose! You try not to laugh as the goo-girl squirms excitedly around your prick, exploring every inch of her <i>“queen”</i>’s new shaft. All you need to do is hang on, grabbing at the smooth stone walls to steady yourself as pleasure hammers through you, making your [pc.legOrLegs] tremble. This nyrean queen is clearly leading the good life if she’s got every day access to treatment like this!");
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
	if(CodexManager.entryUnlocked("Ganrael")) output("You instantly recognize the familiar form of a ganrael, the planet’s crystal-hemmed goo race, but something’s very different about this specimen.");
	//else
	else
	{
		output("It’s a green goo-girl, just like Celise, as you expected. Unlike your dad’s favorite pet, though, this one’s covered with bits of glistening crystal. Your Codex beeps, identifying it as a ganrael, a myrellion native species.");
		CodexManager.unlockEntry("Ganrael");
	}
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
	configureGoocubatorFight();
	addButton(0,"Next", CombatManager.beginCombat);
}

//PC Defeated by Guu: Absorbed and Incubated
public function loseToRoyalIncuGoo():void
{
	author("Savin");
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
	output("\n\nThe idea of being stuffed with even more eggs seems to make the victorious goo absolutely giddy. She bounces with excitement, making her egg-laden belly tumble weightlessly inside her goo until she suddenly turns her attentions to you, a huge grin plastered on her face. <i>“Do you like eggs? I hope so, cuz Queen Taivra likes to stuff all of her pets with her eggs. She makes soooo many! But now </i>I<i> have a pet... and I can stuff you with eggs, just like Taivra! No wait, that I wouldn’t have as many... uh, I know!”</i> she grins, bouncing your way and looming over you. <i>“I’ll use you to help keep all of my eggs warm! You can make me nice and thick and perfect for all my eggs to get big and strong in.”</i>");

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
	
	processTime(25 + rand(16));

	pc.removeAll();
	for (var i:int = 0; i < 24; i++)
	{
		if (pc.hasVagina())
		{
			for (var vi:int = 0; vi < pc.vaginas.length; vi++)
			{
				pc.cuntChange(vi, goocubator.cockVolume(0), false);
				pc.loadInCunt(goocubator, vi);
			}
		}
		pc.buttChange(goocubator.cockVolume(0), false);
		pc.loadInAss(goocubator);
	}
	
	badEnd();
}

//PC Beats Guu
public function pcBeatsGoo():void
{
	author("Savin");
	if(enemy.HP() <= 0) 
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
	output("\n\n<i>“P-please...”</i> she whines, squirming helplessly around her crystal-clad belly.");
	output("\n\nWhat do you do?\n\n");
	clearMenu();
	//[Fuck Her] [Get Egged] [Leave]
	if(pc.lust() >= 33)
	{
		if(pc.hasCock()) addButton(0,"Fuck Her",pcFuckDatGooWivCockVictory,undefined,"Fuck Her","The goo-girl’s entire body might as well be a huge pussy, ready to be fucked anywhere you like. Shove your [pc.cockNounSimple] right on in and fill her with cum!");
		else addDisabledButton(0,"Fuck Her","Fuck Her","You need a cock to jam one inside of her.");
		if(pc.hasGenitals()) 
		{
			if(pc.findEmptyPregnancySlot(Creature.PREGSLOT_ANY) == -1) addDisabledButton(1,"Get Egged","Get Egged","You don’t have any room for eggs.");
			else addButton(1,"Get Egged",getEggedByCrystalGoo,undefined,"Get Egged","You can only imagine how amazing it would feel to have the bubbly bimbo goo-girl pump you full of her eggs.");
		}
		else addDisabledButton(1,"Get Egged","Get Egged","You need genitals for this act.");
	}
	else
	{
		addDisabledButton(0,"Fuck Her","Fuck Her","You aren’t aroused enough to even consider this.");
		addDisabledButton(1,"Get Egged","Get Egged","You aren’t aroused enough to even consider this.");
	}
	if(hasGooArmorOnSelf() && !hasGooArmorUpgrade("ganrael")) addButton(14,"Leave",armorGooVictoryShits);
	else addButton(14,"Leave",CombatManager.genericVictory);
}

//Fuck Her
//PC must have a cock.
//Tooltip: The goo-girl’s entire body might as well be a huge pussy, ready to be fucked anywhere you like. Shove your cock{s} right on in and fill her with cum!
public function pcFuckDatGooWivCockVictory():void
{
	clearOutput();
	author("Savin");
	flags["CRYSTAL_GOO_DEFEAT"] = 3;
	output("With the goo-girl lying in a defeated, jiggling heap on the ground, completely at your mercy... your mind starts to wander. How could you take advantage of this wriggling heap of a broodmare? As you think over the many, many options her alien body presents, you start to peel off your [pc.gear]. The goo’s big, purple eyes roll towards you, looking up from her cowering. Her arms are still wrapped protectively around her crystal belly, but you see her gaze settle on your [pc.cockBiggest] with a look of abject hunger in her eyes. Looks like ");
	if(flags["CRYSTAL_GOO_GLORYHOLED"] == undefined) output("she wants what you’re packing, even if her queen might take offense");
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
	output("\n\nSated, your head flops heavily between the goo-girl’s huge breasts. You need a few minutes to catch your breath after that - time the goo seems all too willing to provide, as her slimy exterior wraps around your [pc.legOrLegs] and arms, pulling you close. She moans softly, wiggling happily as your load of spunk disseminates like ink through water. It’s almost hypnotic, watching it settle over her clutch of eggs, burying into her hundreds of young. Looks like you’re going to be a daddy...");
	output("\n\nA few minutes later, you find the stamina to pick up and grab your gear, leaving the goo-girl in a pile of barely-humanoid goo masturbating herself in a puddle of your spunk. Now that’s a sight to see!\n\n");
	processTime(15);
	pc.orgasm();
	gooVictoryPostGooCheck();
}

//Get Egged
//PC gets pumped full of nyrean eggs. Use Carrying Royal Eggs shit (below) if the PC gloryholed the googirl. Else, use Renvra’s unfertilized eggshit. Whoo, recycling.
//Tooltip: You can only imagine how amazing it would feel to have the bubbly bimbo goo-girl pump you full of her eggs.
//Req: Genitals
public function getEggedByCrystalGoo():void
{
	clearOutput();
	author("Savin");
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
	output(" before turning around and giving yourself a slap on the ass in the goo’s direction, drawing her attention from her cowering in the corner. Her big, purple eyes grow wide as she drinks in your naked form; seeing that you’ve captured her gaze, you give her a lusty smile and swish your hips enticingly, using your body to replace the goo’s fear with something a little more palatable to your advances. She makes a pathetic little moan, rubbing her arms around the swollen, hard surface of her crystal belly - apparently a very pleasurable motion, if the way she jiggles and groans afterwards is any indication.");
	output("\n\nNow that she’s a little more open to you, you shimmy over to the fallen goo while groping and stroking yourself, putting on a show all the way until you’re right beside her.");
	output("\n\n<i>“W-what’re you...”</i> the goo starts to say, trailing off as you slip down to ");
	if(pc.legCount != 1) output("straddle her amorphous lower body");
	else output("press your lower body into her gooey form");
	output(", leaning in close to her. <i>“You’re not gonna hurt my eggs, are you?”</i>");

	output("\n\n<i>“No,”</i> you assure her, reaching gingerly down to run your hand across her plated belly. You don’t want to hurt them - you want to give them a wonderful new home. Her eyes go inhumanly wide");
	if(silly) output(" like an anime character’s");
	output(", and you feel her gooey hands mold themselves around yours, guiding you to more pleasurable spots on her belly.");

	var bEmptyVagina:Boolean = false;
	var holeIdx:int = -1;
	
	// prefer an empty hole
	if (pc.hasVagina())
	{
		for (var vi:int = 0; vi < pc.vaginas.length; vi++)
		{
			if (!pc.isPregnant(vi))
			{
				bEmptyVagina = true;
				holeIdx = vi;
			}
		}
	}
	
	var bEmptyAss:Boolean = !bEmptyVagina;
	
	var holeTag:String;
	if (bEmptyVagina) holeTag = "[pc.vagina " + holeIdx + "]";
	else holeTag = "[pc.asshole]";
	
	output("\n\n<i>“The queen told me to take care of them,”</i> the goo-girl whines between moans, but she doesn’t stop you as you grasp her slimy body, stroking it out until you’ve shaped a vaguely phallic pillar of goop from her groin. You keep jacking off the growing spire of veridian goo, guiding it from just below her crystalline belly towards your "+ holeTag +". Your defeated foe moans, bucking her vaguely-defined hips in response to your touch. Her resistance, such as it was, evaporates into lusty cries and obscene jiggles that make her pendulous breasts and huge belly shake maddeningly. You can’t resist the urge to bury your face in her chest, smothering yourself in bouncy, warm goo. She’s so soft, just firm enough to keep you from sinking completely inside her. Not that you think she’d mind that, if the way your free hand’s fingers penetrating even her side make her squeal and gasp when you move them. Her whole body must be like a pussy, mindbreakingly sensitive to anything that finds its way inside.");

	output("\n\nNo wonder those eggs are so amazing for her! Imagine having a hundred cocks inside you, edging you all day every day, rubbing incessantly against every sensitive spot inside your "+ holeTag +" - that’s what the goo-girl must feel from her belly full of eggs! It might not feel so intense for you, but realizing what’s got the goo so pleasure-crazed only makes you more eager for her to pump you full of ‘em.");

	output("\n\nYou squeeze the pillar of goo in your hand, stroking it until it presses against your "+ holeTag +". Chewing your lip, you start to press your [pc.hips] down onto the cock - or more accurately, ovipositor - you’ve shaped out of the broodmare’s body, whispering sweet nothings between commands to hold herself still: you need her nice and hard to actually side inside you! She whimpers with pleasure, squirming haplessly underneath you, but her rod stays nice and firm, letting you push yourself down on it until with a gasp, you feel warm wetness flood into you.");
	output("\n\nWith a groan of pleasure, you slide down her artificial goo-cock, letting as much of her slimy body pour into your "+ holeTag +" as you can. And she gives you plenty! Once the dam breaks, she floods like water through your clenching hole, using the first sliver of goo like a beachhead to stretch you out, growing and growing her tendril inside you until it’s as thick as a proper cock, and then some. You grit your teeth and moan, grinding your [pc.hips] into the gooey girl’s lap as she fucks you wide open.");
	if(bEmptyVagina) pc.cuntChange(holeIdx,200);
	else pc.buttChange(200);

	output("\n\nNow that she’s got a thick, pulsing probe of goo snaking inside you, the goo-girl’s got a perfect vector to start pumping you full of those magnificent little eggs. Each of them looks a little less than fist-sized, certainly thicker around than your average cock! You can’t wait to feel them pushing through your "+ holeTag +", stretching you wide again and again");
	if(bEmptyAss) output(" like the biggest set of lubed-up anal beads you’ve ever seen");
	output(". You give the girl’s crystal belly a gentle pat and tell her to get to it: you <i>need</i> those eggs inside you.");

	output("\n\nShe whines at your request, clearly sad to be forced to disgorge her ovi-load... but she knows she’s been beaten. To the victor go the spoils, after all. After a moment of hesitation, she finally seems to lose her resistance, and you see the clutch of eggs inside her start to shift downwards toward her squirming ovi-cock. A shiver of anticipation slips down your spine as you bury your face deeper into her slimy cleavage, trying to relax your quivering muscles around the goo inside you, opening wide to make way for the eggs.");

	output("\n\nIt’s almost hypnotic, watching a stream of eggs dislodge from the near-perfect crystal casing pressing against your [pc.belly]. Several of eggs start the long journey through the goo-girl’s body towards your ");
	if(bEmptyVagina) output("crotch");
	else output("ass");
	output(", and just like you’d thought, feeling all those fist-sized orbs rolling through her porous body makes the goo-girl squeal with pleasure. Every inch of her vacuous insides is as sensitive as a normal girl’s G-spot, and the eggs inside her tumble end over end through a pulsating channel that makes sure that as much goo as possible gets rubbed again and again by passing eggs.");

	output("\n\nEventually, after what seems like an eternity of agonizing anticipation, the first of the eggs finally finds its way into the viridian ovipositor you’ve forced the goo-girl to create. You bite your lip, trying to relax yourself as the egg begins its journey upwards through her tendril and into you. Her wriggling inside you reaches a fever pitch, thrashing her gooey tentacle around in your ");
	if(bEmptyAss) output("ass");
	else output("pussy");
	output(" like she’s trying to stretch you out to make room for her charges.");
	if((bEmptyVagina && pc.vaginalCapacity(holeIdx) >= 500) || (bEmptyAss && pc.analCapacity() >= 500)) output(" Not that she needs to: you’re pretty sure you could stuff all those eggs inside you, no problem!");
	output(" You brace for impact, feeling the gentle but firm pressure on your ");
	if(bEmptyVagina) output("pussy lips");
	else output("anal ring");
	output(" as the goo-girl fucks the first egg in.");

	output("\n\nGetting egged feels exactly as good as you’d imagined, a cascade of pleasure radiating up from your "+ holeTag +", turning your muscles to liquid. The egg pushes in, spreading your hole wide open and gliding in through a tube of pure, wet, gooey lube. Your stomach lurches as the egg tumbles in along the tentacle’s slimy expanse. The sensation is overwhelming, eliciting a silent cry of pleasure from you; your limbs contract around the goo’s soft body, going limp as your body surrenders to the egging. A second soon joins the first in stretching out your ");
	if(bEmptyVagina) output("womb");
	else output("bowels");
	output(", pushing through your failing defenses on a sloppy trail of wriggling goo.");

	output("\n\nEgg after egg pushes into you, bloating your belly in a ");
	if(pc.skinType == GLOBAL.SKIN_TYPE_GOO) output("gooey");
	else if(pc.hasScales()) output("scaly");
	else if(pc.hasFur()) output("furry");
	else output("fleshy");
	output(" counterpart to the goo-girl’s own. You both moan and cry out, engulfing each other in ecstasy as the queen’s clutch transfers from the gooey broodmare’s body to yours.You lose count of how many eggs pass through your "+ holeTag +", but it feels like at least ");
	var eggCount:int = 5 + rand(6);
	output(String(eggCount) + "! You’re left panting and gasping as the last egg squirms inside you, settling in among its sisters.");

	output("\n\n<i>“Y-you’ll take care of them, right?”</i> the goo murmurs, still wriggling her egg-bloated cock inside you. Even if you wanted to answer, your mounting orgasm prevents you, leaving you with only gasps and moans into her gooey chest. She takes that as an implied yes, it seems, as her limbs wrap around you, holding you tight as her slimy ovi-cock packs the eggs in tightly, leaving them slathered in hot goo before slowly pulling out of you.");

	output("\n\nYou take a few moments to recover before slowly rolling off of the goo-girl, running your hands across your gravid belly. Oh, that felt amazing... and now you’ve got a host of the queen’s ");
	if(flags["CRYSTAL_GOO_GLORYHOLED"] == 1) output("fertilized ");
	output("eggs rolling around in your ");
	if(bEmptyVagina) output("womb");
	else output("gut");
	output(". Maybe you’ll have some royal daughters before long...");
	output("\n\n");
	//set up some pregger shit
	
	if (flags["CRYSTAL_GOO_GLORYHOLED"] == 1)
	{
		(pc as Creature).createStatusEffect("Goo Gloryholed", 0, 0, 0, 0, true, "", "", false, 0);
	}
	
	if (bEmptyVagina) pc.loadInCunt(enemy, holeIdx);
	else pc.loadInAss(enemy);
	
	processTime(16);
	pc.orgasm();
	
	//[Next]
	gooVictoryPostGooCheck();
}

public function gooVictoryPostGooCheck():void
{
	clearMenu();
	if(hasGooArmorOnSelf() && !hasGooArmorUpgrade("ganrael")) addButton(0,"Next",armorGooVictoryShits);
	else CombatManager.genericVictory();
}

//Post Goo-Battle: Nova Upgrade!
//PC has Armor Goo equipped or in inventory.
//Play after PC is done with guu post-fite. Armor Goo gets a permanant +2 Defense bonus, and counts as Mirrored.
public function armorGooVictoryShits():void
{
	var isRoyal:Boolean = (enemy == goocubator);
	
	clearOutput();
	author("Savin");
	//show armorbutt?
	//showName("GOO\nARMOR");
	//showBust("GRAYGOO");
	showGrayGooArmor();
	output("<i>“Oh, hey,”</i> [goo.name] says, poking her head out, <i>“that crystal stuff she made was really cool, huh?”</i>");
	output("\n\nYou pause, taken aback by your normally-passive suit of goo’s sudden outburst. Still, you nod: the crystal on that ganrael");
	if(isRoyal) output(" broodmare");
	output(" was certainly useful to her.");
	output("\n\n<i>“Could I, um... get a sample, maybe?”</i> [goo.name] asks sweetly, reaching her head around on a stalk of gray goop to give you a puppy-dog look. <i>“I bet I could replicate it! Make myself an even better bodysuit for you!”</i>");
	output("\n\nWell, if she can give you an edge in combat, you can hardly pass that up. You turn back to the moaning pile of defeated");
	if(isRoyal) output(" goo-broodmare");
	else output(" crystal goo");
	output(" and crouch down beside her, letting [goo.name] go to work. The bubbly gray goo hops ");
	if(pc.armor is GooArmor) output("off of you");
	else output("out of your pack");
	output(" and burbles over to the");
	if(isRoyal) output(" egg-laden slut");
	else output(" downed foe");
	output(", reaching a silvery hand down to run a few fingers along her crystal-armored belly. <i>“Oooh, it’s pretty!”</i> [goo.name] giggles, <i>“And hard, too! Hmm, bio-crystal like this... just really hardened body cells. Interesting! Hmm, analysis shows a complex biological process going on all through her body, turning old cells into crystals, pushing them together to form shards... I can totally do that!”</i>");
	output("\n\nSometimes it’s easy to forget [goo.name] was <i>supposed</i> to be a medical program, before whatever went wrong with the gray goo turned her into a flighty bimbo.");
	if(isRoyal) output(" Makes you wonder what happened to the ganrael girl to make her into such a mindlessly loyal egg-slut. This nyrean queen must really be something.");
	output("..");
	output("\n\nAs you’re musing to yourself, you see [goo.name] hop off of the defeated ganrael and scoot back over to you. As she moves, bits of her shoulders and legs begin to bubble and morph, changing into gray facsimiles of crystal armor plates. They seem sturdy, too - enough so that your bubbly bodysuit invites you to punch them as hard as you can. You give them a few good smacks, and [goo.name] just giggles and quivers from the impacts. The gooey crystal shifts back in her body when you hit them, but pop back a moment later. You’re not sure just how effective they’d be at stopping a bullet, but they’d certainly give a fist-fighter something to think about.");
	output("\n\n<i>“Like my new look?”</i> [goo.name] grins, twirling around to show off a growing number of spikey gray crystal plates forming on her chest and back, forming pauldrons and a solid breastplate. You’re sure that, when it comes time to have a little fun, the plates could easily be absorbed back into her. But here in a place rife with danger, well, she almost looks like a sexified version of a proper knight now!");
	output("\n\nShe giggles at the praise and bounds back to you. <i>“Ready to go, [pc.name]!”</i>\n\n");

	if(pc.armor is GooArmor && flags["GOO_ARMOR_CRYSTAL_UPGRADE"] == undefined)
	{
		flags["GOO_ARMOR_CRYSTAL_UPGRADE"] = 1;
		pc.armor.hasRandomProperties = true;
		pc.armor.defense += 2;
		pc.armor.resistances.addFlag(DamageFlag.MIRRORED);
	}
	//what if pc has it somewhere in inventory...
	//Find it in inventory... and upgrade. Fuck it, if the PC has multiple, upgrade 'em all. Fekkin' cheaters.
	for(var x:int = 0; x < pc.inventory.length; x++)
	{
		trace("LOOKING FOR GOO ARMOR. @: " + pc.inventory[x].longName);
		if(pc.inventory[x].shortName == "Goo Armor" && flags["GOO_ARMOR_CRYSTAL_UPGRADE"] == undefined)
		{
			flags["GOO_ARMOR_CRYSTAL_UPGRADE"] = 1;
			pc.inventory[x].hasRandomProperties = true;
			pc.inventory[x].defense += 2;
			pc.inventory[x].resistances.addFlag(DamageFlag.MIRRORED);
		}
	}
	processTime(6);
	clearMenu();
	CombatManager.genericVictory();
}

/*
output("\n\nCarrying Royal Eggs");

output("\n\nNyrean Egg Carrying");
output("\n\n//Nyrean pregnancy lasts 7+/-2 days. The PC’s belly becomes fairly gravid, and their movement speed and evasion is reduced (or whatever standard preg debuffs there are, I dunno).");

output("\n\nOther stuff we need to define a pregnancy:");

output("\n\nMinimum Quantity: 5");
output("\n\nMaximum Quantity: 10");
*/

//Queen Taivra's Throneroom
//PC gets sucked into cutscene as soon as they enter the chamber the first time. 
public function queenTaivrasThrone(plat190:Boolean = false):void
{
	clearOutput();
	author("Savin");
	currentLocation = "2E17";
	generateMapForLocation(currentLocation);
	showTaivra();

	output("You reach the bottom of the winding stairs and push through a silken curtain, stepping into a broad square chamber at the heart of the nyrean palace. You’re instantly greeted by the sounds of sex, the wet beating of flesh on flesh echoing off the stone walls in a cacophony of sensuality. As your eyes adjust to the glare of bright blue lanterns hanging from pillars along the walls, your gaze settles on a room lavishly decorated with animal hide rugs and silky tapestries hanging from behind the Greek-style pillars, showing images of nyrea warriors battling cthonic abominations from an old-Earth artist’s nightmares.");
	output("\n\nYour eyes wander up to the far end of the room, to a dias upon which sits a huge black throne, surrounded by writhing bodies. A nyrea woman sits lazily on the throne, one leg crossed over the other, a spear resting at her side. She wears the same chainmail bikini as the other huntresses you’ve seen, though she wears a long red cape hanging down from her leather-padded shoulders, and her fur-lined bottom gives way behind her to a squirming mass of green tentacles. Each tentacle moves on its own accord, wiggling around the nyrean queen’s hips and down to the prone bodies of a dozen huntresses, all naked with their pseudo-penises erect and penetrated: her betas are being vigorously cock-fucked, their tumescent shafts bulging and throbbing as the queen’s tentacles violate them, spreading her seed into their alien wombs.");
	output("\n\n<i>“I believe I commanded that I was not to be disturbed,”</i> the regal huntress says, her voice a low murmur over the cries of her writhing submissives. Her claw-nailed fingers tighten around the haft of her spear, and you feel her black eyes sizing you up, drinking in every inch of your body.");
	if(plat190) output("\n\n<i>“We’re sorry, my queen. The off-worlder was very... persuasive,”</i> one of the guards whimpers, retreating towards the curtain. You give your escort a look, just in time to see them scampering off back the way they came.");
	output("\n\nThe queen tsks her tongue and turns her attention from you to another figure on the dias, standing behind the throne. Another nyrea, but unlike her sisters, is clad in glistening steel plates from head to toe and carrying a blade and shield. Very unhuntress-like. <i>“My dear Queensguard,”</i> the queen says, leaning back on her throne, <i>“Kindly show this-”</i>");
	output("\n\n<i>“[pc.name]!”</i> a familiar voice shrieks from the shadows near the throne, cutting the queen off mid-sentence. At the foot of the dais, though, are a pair of metal cages meant more for an animal than a person. Your cousin and [rival.hisHer] bodyguard, Dane, are held captive inside them. <i>“Get us out of here, cousin [pc.name]! This stupid wanna-be queen grabbed us - she’ll get you next. Hurry!”</i>");
	output("\n\n<i>“<b>SILENCE!</b>”</i> the armored nyrea, Queensguard, bellows, slamming her kite shield against [rival.name]’s cage. Your cousin shrinks back with a yelp of surprise. Dane growls, his four arms grabbing the bars and straining against them. <i>“Queen Taivra will suffer no further insult from you, worm.”</i>");
	output("\n\n<i>“Do you know who I am!?”</i> [rival.name] yells back, glowering at the knightly nyrea. <i>“Do you know who my </i>father<i> is? Let us go and give me that probe your skank ass is sitting on and </i>maybe<i> he won’t burn your stupid planet to ashes!”</i>");
	output("\n\nBeyond them, the queen chuckles and raps her claw-like nails on the arms of her throne. Now that you look at it, [rival.name] is right... the back of this Queen Taivra’s throne is a matte black, flickering with electronic lights. They must have recovered the probe when it landed!");
	output("\n\n<i>“Enough,”</i> Taivra sighs, fixing her gaze on you once more. <i>“I see you are related to my new pets... [pc.name]. Cousins? I suppose that answers the who and the why of this unexpected interruption.”</i>");
	output("\n\nShe waves the hand not wielding her towering spear across the dozen huntresses sprawled at her feet, all moaning and squirming as the queen’s bushel of tentacle cocks fuck their strange sexes. <i>“Your cousin has already attempted to usurp my throne, star-walker. [rival.HeShe] very likely would have assassinated me in the process. And now you have ");
	if(plat190) output("clearly bribed");
	else output("fought your way through");
	output(" my guards. I can see now your kind really is nothing but trouble. How you’ve duped the myrmedion into accepting you, I can’t imagine.”</i>");
	output("\n\n<i>“So,”</i> she says, leaning forward in her seat and smiling at you with purple-painted lips. <i>“I do hope you have something to say for yourself. Before my darling bodyguard puts you in a cage with your cousin, that is.”</i>");
	flags["MET_TAIVRA"] = 1;
	processTime(5);
	//[Fight] [Rivals] [Peace] [Probe]
	taivraTalk(plat190);
}

public function taivraTalk(plat190:Boolean):void
{
	clearMenu();
	author("Savin");
	addButton(0,"Fight",startFightingQueenButt,plat190,"Fight","No need to drag this out. Time to kick the queen’s ass.");
	if(flags["TAIVRA_RIVAL_TALK"] == 1) addDisabledButton(1,"Rivals","Rivals","You’ve already mentioned this.");
	else addButton(1,"Rivals",explainRivalnessToTaivra,plat190,"Rivals","Try and explain that you and your cousin are rivals - you’re anything but in league with each other!");
	if(flags["TAIVRA_DEAL_UNLOCKED"] == undefined) addButton(2,"Peace",talkOfPeace,plat190,"Peace","Tell the nyrean queen you come in peace. Now that you’re talking to someone in charge, maybe you can work out a deal.");
	else addDisabledButton(2,"Peace","Peace","You’ve already discussed this!");
	if(pc.isMischievous()) addButton(3,"Probe",probeTouch,plat190,"Probe","You’re here for the probe. Nothing more, nothing less. You’ll do whatever it takes to make the queen happy in order to get it.");
	else addDisabledButton(3,"Probe","Probe","This option is for mischievous characters only.");
	if(flags["TAIVRA_DEAL_UNLOCKED"] == 1) addButton(4,"Deal",dealWithTaivra,plat190,"Deal","You’ve convinced Queen Taivra to listen to your deal. Better make a damn good offer, or else you’ll probably be in for a fight to get that probe.");
	else addDisabledButton(4,"Deal","Deal","You’ve got to convince her to make a deal before you can figure out what kind of deal to cut.");
}

//Fight
//No need to drag this out. Time to kick the queen’s ass.
//+small PC Hardness
public function startFightingQueenButt(plat190:Boolean = false):void
{
	clearOutput();
	author("Savin");
	showBust("TAIVRA","QUEENSGUARD");
	showName("TAIVRA &\nQUEENSGUARD");
	pc.addHard(4);
	output("You [pc.readyWeapon] and flash the queen a dangerous smile. You’ve got nothing to say to her.");
	output("\n\n<i>“At least this one is honest about [pc.hisHer] intentions,”</i> Taivra chuckles. <i>“Unfortunately, I’m a bit too preoccupied to play at the moment. Queensguard, my dearest, why don’t you show this star-walker what happens to regicides.”</i>");
	output("\n\nThe heavily armored bodyguard gives the queen a brisk nod and steps between you and her mistress, raising her steel shield. <i>“With pleasure, my queen. Offworlder, defend yourself!”</i>");
	processTime(1);
	//[Fight!]
	clearMenu();
	configureQueensguardFight();
	addButton(0, "Next", CombatManager.beginCombat);
}

public function configureQueensguardFight():void
{	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new Queensguard());
	CombatManager.victoryScene(spankedQueensguardsAss);
	CombatManager.lossScene(loseToQueensTaivra);
	CombatManager.displayLocation("QUEENSGUARD");
	
	pc.createStatusEffect("Cage Distance", 2, 0, 0, 0, false, "Icon_RadioSignal", "You’re a good ways away from Dane and your cousin’s cage. It’ll take a lot of work to reposition yourself to break them out.", true, 0);
}

//Rivals
//+small PC Mischievous
//Try and explain that you and your cousin are rivals - you’re anything but in league with each other!
public function explainRivalnessToTaivra(plat190:Boolean = false):void
{
	clearOutput();
	showTaivra();
	pc.addMischievous(4);
	author("Savin");
	output("<i>“Wait, wait,”</i> you say, putting your hands up in a disarming gesture. <i>“Look, you’ve got it all wrong. Me and this " + chars["RIVAL"].mf("bastard","bitch") + " are enemies! We’re on the same side here, Queen Taivra.”</i>");
	output("\n\nThe queen’s eyes cock upwards at that, and she reclines in her chair with a hearty chuckle. <i>“Is that so? And why should I beleive you, [pc.name]? Your cousin came to me under a promise of peace, only to try and make off with my throne like a common thief. [rival.HeShe] came very close to killing several of my guards before we could subdue [rival.himHer] and [rival.hisHer] bodyguard. If you are truly enemies, simply leave. I will keep your cousin out of your hair... forever.”</i>");
	output("\n\n<i>“Way to throw us under the bus, you jerk!”</i> your cousin whines from [rival.hisHer] cage.");
	output("\n\nDane actually laughs, turning to the queen and saying <i>“[pc.HeShe] wants the probe too, you know. ");
	//if didn’t beat Dane:
	if(flags["WHUPPED_DANES_ASS_ON_MHENGA"] == undefined) output("This one’s not much of a rival, though, queenie. Good for a fuck, though. Why don’t you let [pc.himHer] and my boss here trade places, huh?”</i>");
	else output(" Better watch your step, queenie. This one’s a real handful. Better let us take the probe and go, or you’re gonna get the ass kicking of a lifetime.”</i>");

	output("\n\n<i>“Unlikely,”</i> the queen scoffs, turning her attention back to you. <i>“Anything else?”</i>");
	flags["TAIVRA_RIVAL_TALK"] = 1;
	//Other options remain.
	processTime(3);
	taivraTalk(plat190);
}



//Peace
//Tell the nyrean queen you come in peace. Now that you’re talking to some one in charge, maybe you can work out a deal
//+PC Kindness
public function talkOfPeace(plat190:Boolean = false):void
{
	clearOutput();
	showTaivra();
	pc.addNice(4);
	author("Savin");
	output("<i>“I come in peace, Queen Taivra,”</i> you urge her. <i>“All I need is to touch your throne. It’s a device my father dropped on this planet, you just... got it by accident. If I touch it, I’ll get the data I need, and we can all walk away happy.”</i>");
	output("\n\n");
	//if PC has a high Kindness rating:
	if(pc.isNice()) 
	{
		output("<i>“Hmm,”</i> the queen murmurs, sizing you up for a good long moment. <i>“I believe you, [pc.name]. Strange as that may seem, you have an honest demeanor about you. Quite contrary to your cousin... it suits you.”</i>");
		output("\n\n<i>“So... can we make a deal?”</i> you ask, taking a hesitant step forward. Queensguard makes no movement to stop you.");
		output("\n\nThe queen smiles. <i>“Perhaps. Among my kind, there is a saying: ‘triumph brings the spoils of conquest.’ You are an unwelcome guest, but an honest one... I will give you the chance to earn your father’s treasure, with honor. Something your cousin lacks entirely.”</i>");
		output("\n\n<i>“That’s not quite what I had in mind,”</i> you say, taking a step back as Queensguard turns her attentions to you. <i>“I’ve got plenty of honor, but I don’t want a fight here. Like I said, I come in peace.”</i>");
		output("\n\nThe queen blinks, surprised. <i>“You refuse honorable combat? A strange race, yours... different from any I’ve encountered here. So rare to see someone who prefers an open hand than a clenched fist");
		if(plat190) output(", especially one who would subvert my guards rather than fight [pc.hisHer] way inside");
		output(". Very well, I will hear what you propose. Though I will not give you your device for free, you understand. After all, you’ve ");
		if(!plat190) output("forced");
		else output("manipulated");
		output(" your way inside my home. That alone demands some recompense...”</i>");
		processTime(3);
		//Add [Deal] option to dialogue
		flags["TAIVRA_DEAL_UNLOCKED"] = 1;
		taivraTalk(plat190);
		return;
	}
	//if PC instead has a low Kindness rating:
	else
	{
		output("<i>“I don’t believe you, off-worlder,”</i> the queen sighs, leaning back and crossing her legs again. <i>“Queensguard, take [pc.himHer]. I tire of seeing star-walkers run free.”</i>");
		output("\n\n<i>“By your command, my queen,”</i> the heavily armored warrior says, stomping forward and placing herself between you and the queen. You suppose this was inevitable, after all...");
		processTime(1);
		//[Fight!]
		clearMenu();
		configureQueensguardFight();
		addButton(0,"Fight",CombatManager.beginCombat);
		return;
	}
}

//Probe
//You’re here for the probe. Nothing more, nothing less. You’ll do whatever it takes to make the queen happy in order to get it.
//PC must be moderately Mischievous to get this option.
//+PC Mischievous
public function probeTouch(plat190:Boolean = false):void
{
	clearOutput();
	showTaivra();
	pc.addMischievous(2);
	author("Savin");
	output("<i>“Look,”</i> you say, giving the queen that famous Steele smile. <i>“I just want to touch the probe. That’ll give me everything I need, and you and I can go our separate ways. My cousin here? Fuckin’ asshole, through and through. Not really surpised good ol’ [rival.name] tried to rip you off, but we come from totally different sides of the road. [rival.HisHer] dad spend a century ripping mine off at every opportunity; a real scumbag. The real Steeles have been dealing with their bullshit for ages, and I’m sorry you and your, uh, friends here all got caught up in the family squabble.”</i>");
	output("\n\nYou take a couple steps forward, putting on your best company " + pc.mf("man","girl") + " air. If Dad taught you anything, it’s how to get what you want - and what’s the big difference between a boardroom and a creepy underground bugfolk palace? Aside from all the weapons, anyway.");
	output("\n\n<i>“So, what can I do to make it up to you?”</i> you ask with a smile, not shying away from letting your eyes wander over the queen’s largely bare body - and the mass of tentacle cocks pounding her harem’s cock-holes. You can only imagine the behemoth she’s probably packing under that chainmail bikini bottom, too... Knowing how this part of the galaxy seems to work, you can only imagine what the queen might want from you, after all.");
	output("\n\nTaivra chuckles, resting her spear across her knees and steepling her fingers. <i>“My, my, this one has quite the silver tongue. Don’t you think, dearest?”</i>");
	output("\n\n<i>“Aye, my queen,”</i> Queensguard snaps robotically, shifting her gaze between you and your caged-up cousin.");
	output("\n\n<i>“I have a few harem girls that think you star-walkers could very well be the greatest thing this planet has ever seen - you’re some sort of saviors who will give us all peace and prosperity and rivers of gold, I’m sure. I took little stock in that silliness, especially after your cousin decided to try and take my throne. But perhaps, as you say, this " + chars["RIVAL"].mf("boy","girl") + " is just a bad murrock fruit, hmm? Very well, [pc.name], I will hear you out. Though I hope you make your offer a good one - even if you are sincere, you have broken into my home. Caused no end of damage on your way in, I’m sure");
	if(plat190) output(" - or at the very least, seem to have corrupted the loyalty of my guardswomen");
	output(".");

	output("\n\nDamn, you’re good.");
	processTime(4);
	dealWithTaivra(plat190);
}



//Deal
//You’ve convinced Queen Taivra to listen to your deal. Better make a damn good offer, or else you’ll probably be in for a fight to get that probe.
//Open up list of sub-options. PC gets 2 tries before we get a “Bad Deal” intro to the fight, below.
public function dealWithTaivra(plat190:Boolean = false):void
{
	//[Sex] [Credits] [Alliance] [Princess] [Weapons] [Back]
	clearMenu();
	if(flags["TAIVRA_DEAL_ATTEMPTS"] == 2) 
	{
		addButton(0,"Next",badDealWithTaivra);
		return;
	}
	addButton(0,"Sex",offerTaivraSexUSloot,undefined,"Sex","Maybe you could offer your body up as an incentive to the randy queen...");
	if(pc.credits >= 20000) addButton(1,"Credits",offerTaivraCredits,plat190,"Credits","Offer to pay her for the probe. Give her what it’s worth to the company, and you’ll break out even. Everybody likes money, right?");
	else addDisabledButton(1,"Credits","Credits","You don’t have a decent amount of credits to offer.");

	if(flags["OFFERED_TAIVRA_AN_ALLIANCE"] == undefined) addButton(2,"Alliance",offerTaivraAnAlliance,plat190,"Alliance","Offer Queen Taivra an alliance. There’s not much you can do to cement it beyond your word at this point, but being the partner of an interstellar business mogul is a hell of an advantage when your world is on the brink, and you’re just a stone age tribe. Steele Tech could offer her help, protection...");
	else addButton(2,"Partnership",partnershipWithTaivra,plat190,"Partnership","Your father was the biggest interstellar playboy in the galaxy. He left a trail of lovers in his wake. What are you, if not your father’s child? You offered the nyrea partnership, so make it official: take Queen Taivra as your wife, with all the responsibility and vulnerability that brings.");

	if(flags["PRINCESS_DEFEATED"] != undefined) addButton(3,"Princess",princessChoice,plat190,"Princess","Offer to take the rambunctious princess under your care. Marry her, if you have to. Surely Taivra wouldn’t object to her daughter being at the side of a galactic super-star like you’ll soon be.");
	else addDisabledButton(3,"Locked","Locked","You haven’t met who you need to meet to unlock this option.");
	addButton(4,"Weapon",giveTaivraGunsForPeace,plat190,"Weapons","Offer the nyrean queen futuristic weapons from Steele Tech. Imagine going from the literal stone age to rocking modern ray guns. Goodbye, balance of power... Though you’ll be trading your reward for recovering the probe in exchange for the guns.");
}
public function taivraDealTick():void
{
	if(flags["TAIVRA_DEAL_ATTEMPTS"] == undefined) flags["TAIVRA_DEAL_ATTEMPTS"] = 0;
	flags["TAIVRA_DEAL_ATTEMPTS"]++;
}

//Sex
//Maybe you could offer your body up as an incentive to the randy queen...
public function offerTaivraSexUSloot(plat190:Boolean = false):void
{
	clearOutput();
	showTaivra();
	author("Savin");
	output("<i>“Surely we can come to some kind of... mutually beneficial arrangement,”</i> you offer, taking a playful step forward and running a hand across your body, emphasizing your crotch and chest for the queen’s perusal.");
	output("\n\nTaivra stares flatly at you, scowling. <i>“Is that the best you can offer, offworlder? Pleasures of the flesh?”</i> she asks, sweeping a hand across the throne-full of mewling betas around herself. <i>“Surely you realize I have more sex at hand than even a Gold Myr queen. I’m sure you have some very interesting skills, and perhaps unique... parts... meant for pleasure, but I’m not so easily swayed. Hmpf, if you star-walkers all negotiate like that, perhaps you belong on this planet after all.”</i>");
	processTime(1);
}


//Weapons
//Offer the nyrean queen futuristic weapons from Steele Tech. Imagine going from the literal stone age to rocking modern ray guns. Goodbye, balance of power... Though you’ll be trading your reward for recovering the probe in exchange for the guns.
public function giveTaivraGunsForPeace(plat190:Boolean = false):void
{
	clearOutput();
	author("Savin");
	output("<i>“You’re a queen among a race that seems to me like it’s all about fighting. Fighting to mate, for dominance, for territory. Am I right?”</i>");
	output("\n\nThe queen gives you a slight, almost imperceptible nod. <i>“I figured. But you carry spears and swords. The myrmedions above you have guns, they’ve got chemical weapons... even nukes, it looks like. That’s a hell of a difference in power. What if I arranged to have your people take delivery of a shipment of star-walker weapons: my father’s company has a whole line of non-military rifles and energy blades, perfectly legal for us to distribute to Rush-world races.”</i>");
	output("\n\nAdmittedly, you’ll be sacrificing your company payout from the probe for this, but hey. Better to leave heavily-armed friends behind than bitter enemies.");
	output("\n\n<i>“So how about it? I’ll need to take the probe, but after that, I think I can arrange a whole crate of laser pistols to be delivered to you. Sound good?”</i>");
	output("\n\nThe queen reclines, running a dark tongue across her purple lips. In his cage, Dane growls something about a <i>“prime director”</i> or some such, and how arming space barbarians with lasers will get you all killed.");
	output("\n\nAfter a long moment of deliberation, the queen chuckles and clicks the butt of her spear against the stone dais under her. <i>“You offer a compelling deal, but no. The moment this new government, the Scarlet Federation, hears about a group of nyrea with advanced weapons, we’ll have a battalion of soldiers knocking at our doors. They’ve pressganged thousands of nyrea from their home continent into service, as I understand. I can’t imagine they would make an exception for me, if they’ve already tamed more powerful nyrea warlords than me. I’d rather not draw attention to myself, at least not now.”</i>");
	output("\n\nDamn, you were sure she’d go for that one...");
	processTime(2);
	taivraDealTick();
	dealWithTaivra(plat190);
}

//Princess
//PC must have beaten the Nyrea Princess
//+PC Hardness
//Offer to take the rambunctious princess under your care. Marry her, if you have to. Surely Taivra wouldn’t object to her daughter being at the side of a galactic super-star like you’ll soon be.
public function princessChoice(plat190:Boolean = false):void
{
	clearOutput();
	showTaivra();
	author("Savin");
	output("<i>“How about I marry your daughter? She and I have already been introduced, and-”</i>");
	output("\n\n<i>“No,”</i> Taivra snaps, narrowing her eyes. <i>“Furthermore, I will have you flogged if you laid a hand on my daughter. Taivris may be the eldest of my brood, but as you may have noticed, [pc.name], I have a great many children. Several I will sire on you, in fact.”</i>");
	output("\n\nYou blink.");
	processTime(1);
	//Add “Bad Deal” here
	clearMenu();
	addButton(0,"Next",badDealWithTaivra);
}


//Credits
//PC must have 20,000 Credits
//Offer to pay her for the probe. Give her what it’s worth to the company, and you’ll break out even. Everybody likes money, right?
public function offerTaivraCredits(plat190:Boolean = false):void
{
	clearOutput();
	showTaivra();
	author("Savin");
	output("<i>“I can pay you for the probe,”</i> you offer, drawing your Codex. <i>“It’s worth a small fortune to me, I assure you.”</i>");
	output("\n\nQueen Taivra laughs at that - laughs right in your face. <i>“[pc.name], your money is less than worthless down here. I can’t buy arms and armor from my smith with anything less than gems and gold; I can’t trade with other tribes, other alphas. Your credits can’t be smelted down or made into beautiful things. No, I have no use for your money. Go talk to Seifyn outside - she’s the only one you’ll find in the deep caves interested in your imaginary credits.”</i>");
	processTime(1);
	taivraDealTick();
	dealWithTaivra(plat190);
}

//Alliance
//Offer Queen Taivra an alliance. There’s not much you can do to cement it beyond your word at this point, but being the partner of an interstellar business mogul is a hell of an advantage when your world is on the brink, and you’re just a stone age tribe. Steele Tech could offer her help, protection...
public function offerTaivraAnAlliance(plat190:Boolean = false):void
{
	clearOutput();
	showTaivra();
	author("Savin");
	output("<i>“How about you and I partner up, my queen?”</i> you suggest, with a flourished " + pc.mf("bow","curtsy") + ". <i>“A formal alliance between my company, Steele Tech, and your tribe. I’m sure we can both help each other, now and in the future. Surely you can see the advantage of having an interstellar partner looking out for you - look what it’s done for the gold myr.”</i>");
	output("\n\n<i>“Your ");
	if(pc.isMischievous()) output("silver tongue");
	else output("eagerness to please");
	output(" continues to impress me, [pc.name],”</i> Taivra laughs. <i>“Still, I have interrogated your cousin somewhat since [rival.hisHer] capture. You do not own this... Steele Tech. You don’t command its resources, as you claim. Not without this probe of mine, and many more like it.”</i>");
	output("\n\nYou try to keep your cool. <i>“That’s right,”</i> you grin, <i>“exactly right. I need your help now, but once I have all of the probes...”</i>");
	output("\n\n<i>“Ha! What would compel you to return to me, once you’ve left? What proof do I have that you will honor your side of the bargain? As you no doubt know, I would have little recourse once you’d left... even outside of the deep caves here on the planet, my reach is greatly diminished. On another world, in the shadow of some distant star... would you even think of our bargain?");
	if(pc.isNice()) output(" You seem a " + pc.mf("man","woman") + " of your word, yet I find it hard to believe a mere clan of cave dwellers such as us would matter compared to the wonders and dangers of your world.");
	output("”</i>");

	output("\n\nShe makes a good point, but the way she’s looking at you... the way she hasn’t called her bodyguard to start dismembering you... Queen Taivra knows this could be a good deal. She wants something from you, and you’re so close... but what more could you offer her?");

	//Replace option with [Partnership]. Doesn’t count towards “Bad Deal”
	flags["OFFERED_TAIVRA_AN_ALLIANCE"] = 1;
	processTime(4);
	dealWithTaivra(plat190);
}

//[Partnership]
//+EXP equal to Taivra’s value
//Your father was the biggest interstellar playboy in the galaxy. He left a trail of lovers in his wake. What are you, if not your father’s child? You offered the nyrea partnership, so make it official: take Queen Taivra as your wife, with all the responsibility and vulnerability that brings.
public function partnershipWithTaivra(plat190:Boolean = false):void
{
	clearOutput();
	showTaivra();
	author("Savin");
	output("<i>“I offered to partner up with you,”</i> you suggest, taking a confident stride forward with your most charming smile on full display. <i>“But a partnership goes both ways. Responsibility, vulnerability, power over the other. You interrogated my cousin, like you said. Surely that means you know just how wealthy and powerful I’ll be when my quest is done.”</i>");
	output("\n\nThe queen smiles. <i>“I do, yes. Though the thought of a stellar empire does boggle the mind...”</i>");
	output("\n\n<i>“Hey, wait, what’re you doing!?”</i> [rival.name] shrieks from [rival.hisHer] cage. <i>“You can’t do this, [pc.name], are you insane? And it’s going to be my company anyway!”</i>");
	output("\n\n<i>“Shut up, [rival.name],”</i> you say off-handed, barely looking your cousin’s way. A few more steps take you right to the edge of the queen’s dias, and you kneel down before the amazonian woman. She makes a slight gesture, and the prostrate bodies of her betas quickly clear out, scampering off out of the throne room. Her many tentacle cocks, still dripping with juice and seed, recoil under the arms of her throne, and Taivra leans forward with eager anticipation. You both know how this has to end, now, and the queen clearly appreciates every second of foreplay before you reveal your plan.");
	output("\n\n<i>“Queen Taivra. Though this is the first time we’ve met, you’ve stuck me with awe of you beauty, your cunning, your regal power. I know that, together, a mega-corporation and a legion of nyrea could do great things - for us both. Your people have alphas and betas and harems, but among mine, we also have " + pc.mf("","husbands and ") + "wives who share power equally. I-”</i>");
	output("\n\n<i>“You </i><b>are</b><i> insane!”</i> [rival.name] yells, until Queensguard slams her shield against your cousin’s cage. <i>“What’re you...”</i>");
	output("\n\n<i>“-don’t have a ring on me,”</i> you continue, smiling up at the queen, <i>“but the Codex here can make it official. Legal and binding. So, will you-”</i>");
	output("\n\n<i>“Oh, shut up already,”</i> Taivra laughs, grabbing you by ");
	if(pc.tallness <= 72) output("the collar");
	else output("the shoulder");
	output(" and pulling you almost into her lap. <i>“You have a remarkable dedication to peace, [pc.name]. Willing to give up so much power just to touch a stone... or have you just fallen in love at first sight, hmm?”</i>");

	output("\n\nYou’re so close you could almost reach out and touch the probe. Instead, though, you cup the queen’s cheek and smile, drawing the two of you a little closer.");

	output("\n\n<i>“You are very impressive, [pc.name],”</i> the nyrean queen smiles, letting you get as close as you like, until your [pc.lips] are almost touching her slender purple mouth. You feel her hand roaming across your body, exploring the form of her new lover for a moment before settling firmly on your crotch. <i>“In many ways... so long as you will not begrudge me of my dalliances - and I of course will do the same - I believe we have an arrangement. One that, I hope, will be quite profitable... and pleasurable... for us both.”</i>");

	output("\n\nYou lean in and kiss her, binding your fate with a woman you’ve only just met. You could have fought her, as you have many others before her. You might have even won. But somehow, you feel that you’ve found the lesser of every evil here today. And as Taivra said, you’ll be sure to make this relationship as pleasurable as you can - you think to yourself, as one of your hands snakes up her firm chest, dipping under the fur-lined mail of her top to squeeze a breast. Taivra moans softly, and your Codex chirps something about a new marriage license being ready at the nearest Confederate legal office. Wherever that is. For now, you’re content to enjoy the fruits of your new union.");

	processTime(8);
	pc.lust(14);
	
	rewardXP(1000);
	
	//[Next]
	clearMenu();
	addButton(0,"Next",youMarriedAnEvilChick);
}

public function youMarriedAnEvilChick():void
{
	clearOutput();
	showTaivra();
	showName("DANE &\nQUEENSGUARD");
	showBust(daneBustDisplay(true),"QUEENSGUARD");
	author("Savin");
	output("<i>“RUN FOR IT!”</i> a voice booms behind you, just as you and Taivra are about to seal the metaphorical deal. You scramble to your ");
	if(pc.legCount > 1) output("[pc.feet]");
	else output("full height");
	output(" and look back, just in time to see Dane lumbering to his full height, your cousin scrambling off behind him. The pair of huntresses standing behind the cages leap towards him, but are quickly swept aside by his bulging arms - thrown against the walls with heavy thuds.");

	output("\n\nThe alabaster ausar is utterly naked, stripped of his gear and bruised from his capture, but he’s grinning like a mad dog all the same. The veins on his arms bulge as he flexes his corded muscles, flipping the pieces of primitive weaponry down to his lower arms to hold like daggers. <i>“You should’ve killed me when you had the chance. This time you won’t get a chance to jump me in the dark.”</i>");
	output("\n\n<i>“Slaves should learn their place,”</i> Queensguard answers, lowering her shield into place and readying her sword. <i>“If they cannot fathom that, then they will be fed to the deeps, piece by piece.”</i> She advances steadily, one plated boot in front of the other warily moving to intercept Dane.");
	output("\n\n<i>“That’s all you’ve got? Not even a gun?”</i> Dane grins, cracking a pair of his knuckles.");
	output("\n\nConfusion briefly crosses Queensguard’s face. <i>“You are naked with naught but a broken weapon. I have no need of a dishonorable star-blaster.”</i>");
	output("\n\n<i>“If you had a gun, you might have had a chance.”</i>");
	output("\n\nYou wouldn’t have thought a guy as big as Dane could lunge so far and so fast if you hadn’t tangled with him once already, and the armored nyrea clearly doesn’t share that experience. She only has time for her eyes to widen in surprise before Dane crashes into her in a flash of albino fur and pounding fists, driving her back half a pace. The broken haft of the spear shatters on impact with her armor-plated side, visibly denting the plate. Knuckles deflect off Queensguard’s helm, leaving lines of blood behind where the sharp metal ripped into Dane’s knuckles.");
	output("\n\nFor all his power and speed, it’s clear that your cousin’s bodyguard is more a brawler than a trained fighter. He doesn’t try to avoid harrowing slashes from Queensguard’s sword, relying on the awkward positioning to rob the strength from her blows and his thick fur to keep her from cutting too deeply. Dane’s left forearms are soon matted red with blood from a half-dozen surface cuts, but none so deep as to stop him from grabbing hold of his foe’s shield in two hands, wrenching it powerfully to the side.");
	output("\n\nQueensguard is no brawler. She’s a fighter, used to tackling her Queen’s enemies in one-on-one confrontations. She lets her arm slide out of the shield’s strap and spins with the momentum, twisting around for a vicious, back-handed slice. A diagonal rent opens up across Dane’s chest, deep enough to reveal two or three blood-drenched bones but not quite deep enough to bring down the mighty ausar. His rage filled blood leaves steaming, crimson puddles on the ground between them.");
	output("\n\nDane staggers a half-step back from the pain, but he doesn’t drop the shield. He leans further back, sweeping the shield up and into the underside of Queenguard’s polished blade. The clang of metal on metal reverberates through the cavernous chamber as the two bodyguards struggle. The nyrea barely keeps her grip on her weapon, but Dane never needed to disarm her, just take away her biggest defense - the shield - and open her up to a strike.");
	output("\n\nThe metal spearpoint flashes as Dane’s fist carries it forward into the dented section of the nyrea’s armor. The impact reminds you of the sound of the industrial steel punches in one of your father’s factories. Dane’s hand comes away empty, the only evidence of his strike a rent in his foe’s armor and a protruding bit of wood. Thick purple blood oozes down the plate covering Queensguard’s legs, staining them with visible defeat.");
	output("\n\n<i>“Told you that you should’ve brought a gun,”</i> Dane snarls, kicking the nyrea square in the chest. She drops like a sack of bricks and curls into a ball, wincing from what must be terrible abdominal pain. <i>“Musta ruptured something other than your sperm sacks, huh? I guess not all the male nyrea get off on penetration.”</i>");
	output("\n\nDane doesn’t look much better off, but he’s still standing, somehow. He slips the shield onto his lower left arm and turns to you. <i>“Thanks for the distraction. A word of advice - don’t get into the bodyguarding game. Half the job is bleeding for the boss.”</i>");
	output("\n\n<i>“Enough of this!”</i> the shocked Queen cries, leaping to her feet and grabbing her spear. <i>“I will lay you low myself!”</i>");
	output("\n\nDane looks ready to rumble, to face down your new mate - and you too, if need be. But a shrill cry from the stairwell draws his attention, and with a grunt Dane is forced to retreat, rushing to save his cowardly ward.");
	output("\n\n<i>“After him!”</i> Taivra shouts at the handful of huntresses left in the room, who rush towards the stairs. The queen leaps up a moment later, but not to pursue your cousin or [rival.hisHer] brutal bodyguard: instead, she rushes to the side of the injured Queensguard, pressing her hands to her injured subject’s abdomen. <i>“Damn them - damn them all,”</i> Taivra grunts, ripping her cape off and tying it around the wounded knight’s injury. <i>“Be still, dearest... the healers will be here soon.”</i>");
	output("\n\nYou hope so. The last thing you need is your partnership getting fucked up by your cousin - one more thorn in your side thanks to [rival.name]. While the going’s good, you hop over to the throne and touch your hand to the side of the probe, activating it. A holographic Steele Tech logo flashes across its flatscreen interface, followed by a data readout that your Codex parses into a download of coordinates - the next probe! You have what you need for your quest now, though you’ve signed away a little of yourself to get it. Maybe you should stick around and talk to your... your wife.");
	output("\n\nOr get gone while the getting’s good.");
	flags["QUEENSGUARD_STAB_TIME"] = GetGameTimestamp();
	processTime(12);
	flags["KING_NYREA"] = 1;
	kGAMECLASS.output("\n\n(<b>Perk Gained: Nyrean Royal</b> - Reduces hostile nyrea attacks and deals increased tease damage to them!)");
	pc.createPerk("Nyrean Royal",0,0,0,0,"Reduces hostile nyrea attacks and deals increased tease damage to them!");
	flags["NYREAN_SPOILS"] = GetGameTimestamp();
	//Switch village over to kingmode instantly?
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Bad Deal
//When PC inevitably fucks up.
public function badDealWithTaivra():void
{
	clearOutput();
	showTaivra();
	author("Savin");
	showName("QUEENSGUARD\n& TAIVRA");
	showBust("QUEENSGUARD","TAIVRA");
	output("<i>“I think I’ve heard enough,”</i> Taivra yawns, leaning back in her seat and drumming her fingers on the haft of her spear. <i>“Queensguard, I tired of our intruder. [pc.name] clearly has nothing to offer me...”</i>");
	output("\n\n<i>“Aye, my queen,”</i> the dutiful nyrean knight answers, stepping between you and her queen. <i>“You had your chance, star-walker. A pity you squandered it.”</i>");
	output("\n\nYou guess this only could have ended one way. You [pc.readyWeapon] and level it at Queensguard. Time to show the queen what you’re made of.");
	output("\n\n<i>“Tear that bitch up!”</i> your cousin shouts, rattling [rival.hisHer] cage.");
	processTime(2);
	clearMenu();
	configureQueensguardFight();
	addButton(0,"Next",CombatManager.beginCombat);
}

//Special Combat Actions
//PC can move East/West, with west taking you towards Dane and Rival.
public function moveToCage():void
{
	clearOutput();
	if(pc.statusEffectv1("Cage Distance") >= 2) output("You try to work your way closer to the cage holding Dane and [rival.name] but only manage to close about half the distance.");
	else if(pc.statusEffectv1("Cage Distance") == 1) output("Working across the room, you close the rest of the way with Dane’s cage. <b>Maybe you can break him out?</b>");
	pc.addStatusValue("Cage Distance",1,-1);
	if (enemy is Queensguard) (enemy as Queensguard).queensguardLongUpdate(pc);
	CombatManager.processCombat();
}

//At the 3rd square, can [Breakout]
//Breakout
//Try and break Dane out - that big, burly ausar might just level the playing field!
public function breakOutDane():void
{
	clearOutput();
	author("Savin");
	if(enemy is Queensguard)
	{
		output("You’ve got a clear shot at Dane’s cage now, and the ausar knows it. <i>“Get me out of here!”</i> he growls, eyeing Queensguard dangerously. <i>“C’mon already!”</i>");
		output("\n\nYou take aim at the lock and strike!");
		// Unfortunately for you, the lock isn’t completely destroyed by your attack - you’ll need to try again! //else, [Next] to Dane Breakout Fen wrote
		showName("DANE &\nQUEENSGUARD");
		showBust(daneBustDisplay(true),"QUEENSGUARD");
		output("\n\nAs soon as you destroy the cage’s primitive lock, Dane is surging into action. The big ausar combat rolls into the door, smashing it fully open with his muscular bulk. His hands wrap around the haft of his warden’s spear, and with a simple tug, the weapon is liberated from the gape-mouthed nyrea. As big as Dane is, the spear looks like a toothpick in his hammer-thick hands. He growls, deep in his throat and snaps it in two, simultaneously backhanding the surprised cave-dweller into the wall with one of his free hands.");
		output("\n\nThe alabaster ausar is utterly naked, stripped of his gear and bruised from his capture, but he’s grinning like a mad dog all the same. The veins on his arms bulge as he flexes his corded muscles, flipping the pieces of primitive weaponry down to his lower arms to hold like daggers. <i>“You should’ve killed me when you had the chance. This time you won’t get a chance to jump me in the dark.”</i>");
		output("\n\n<i>“Slaves should learn their place,”</i> Queensguard answers, lowering her shield into place and readying her sword. <i>“If they cannot fathom that, then they will be fed to the deeps, piece by piece.”</i> She advances steadily, one plated boot in front of the other warily moving to intercept Dane.");
		output("\n\n<i>“That’s all you’ve got? Not even a gun?”</i> Dane grins, cracking a pair of his knuckles.");
		output("\n\nConfusion briefly crosses Queensguard’s face. <i>“You are naked with naught but a broken weapon. I have no need of a dishonorable star-blaster.”</i>");
		output("\n\n<i>“If you had a gun, you might have had a chance.”</i>");
		output("\n\nYou wouldn’t have thought a guy as big as Dane could lunge so far and so fast if you hadn’t tangled with him once already, and the armored nyrea clearly doesn’t share that experience. She only has time for her eyes to widen in surprise before Dane crashes into her in a flash of albino fur and pounding fists, driving her back half a pace. The broken haft of the spear shatters on impact with her armor-plated side, visibly denting the plate. Knuckles deflect off Queensguard’s helm, leaving lines of blood behind where the sharp metal ripped into Dane’s knuckles.");
		output("\n\nFor all his power and speed, it’s clear that your cousin’s bodyguard is more a brawler than a trained fighter. He doesn’t try to avoid harrowing slashes from Queensguard’s sword, relying on the awkward positioning to rob the strength from her blows and his thick fur to keep her from cutting too deeply. Dane’s left forearms are soon matted red with blood from a half-dozen surface cuts, but none so deep as to stop him from grabbing hold of his foe’s shield in two hands, wrenching it powerfully to the side.");
		output("\n\nQueensguard is no brawler. She’s a fighter, used to tackling her Queen’s enemies in one on one confrontations. She lets her arm slide out of the shield’s strap and spins with the momentum, twisting around for a vicious, back-handed slice. A diagonal rent opens up across Dane’s chest, deep enough to reveal two or three blood-drenched bones but not quite deep enough to bring down the mighty ausar. His rage filled blood leaves steaming, crimson puddles on the ground between them.");
		output("\n\nDane staggers a half-step back from the pain, but he doesn’t drop the shield. He leans further back, sweeping the shield up and into the underside of Queenguard’s polished blade. The clang of metal on metal reverberates through the cavernous chamber as the two bodyguards struggle. The nyrea barely keeps her grip on her weapon, but Dane never needed to disarm her, just take away her biggest defense - the shield - and open her up to a strike.");
		output("\n\nThe metal spearpoint flashes as Dane’s fist carries it forward into the dented section of the nyrea’s armor. The impact reminds you of the sound of the industrial steel punches in one of your father’s factories. Dane’s hand comes away empty, the only evidence of his strike a rent in his foe’s armor and a protruding bit of wood. Thick purple blood oozes down the plate covering Queensguard’s legs, staining them with visible defeat.");
		output("\n\n<i>“Told you that you should’ve brought a gun,”</i> Dane snarls, kicking the nyrea square in the chest. She drops like a sack of bricks and curls into a ball, wincing from what must be terrible abdominal pain. <i>“Musta ruptured something other than your sperm sacks, huh? I guess not all the male nyrea get off on penetration.”</i>");
		output("\n\nDane doesn’t look much better off, but he’s still standing, somehow. He slips the shield onto his lower left arm and nods respectfully to you. <i>“Thanks for the assist. A word of advice - don’t get into the bodyguarding game. Half the job is bleeding for the boss.”</i>");
		output("\n\n<i>“Enough of this!”</i> the shocked Queen cries. <i>“I will lay you low myself!”</i>");
		if(pc.isBimbo()) output("\n\nYou giggle at Dane. <i>“Got time for one more, hunk?”</i>");
		else if(pc.isNice()) output("\n\nYou smile at Dane. <i>“Ever taken down a queen before?”</i>");
		else if(pc.isMischievous()) output("\n\nYou favor Dane with a roguish grin. <i>“Don’t bleed out yet. There’s still a queen to take care of, remember?”</i>");
		else output("\n\nYou glance Dane’s way. <i>“You owe me. Think you can keep from passing out long enough to depose some royalty?”</i>");
		output("\n\nDane rolls his shoulders and silently nods, his cold glare locking on the creature responsible for his imprisonment. <i>“Yeah, I’m game.”</i>");
		pc.energy(40);
		pc.shields(pc.shieldsMax());
		//Pass 1 minute, +40 energy to queen and PC. Refill shields for both parties.
		flags["FREED_DANE_FROM_TAIVRA"] = 1;
		flags["QUEENSGUARD_STAB_TIME"] = GetGameTimestamp();
		clearMenu();
		addButton(0,"Next",spankedQueensguardsAss, true);
	}
	else
	{
		output("You’ve got a clear shot at Dane’s cage now, and the ausar knows it. <i>“Get me out of here!”</i> he growls, eyeing Taivra dangerously. <i>“C’mon already!”</i>");
		output("\n\nYou take aim at the lock and strike!");
		output("\n\nAs soon as you destroy the cage’s primitive lock, Dane is surging into action. The big ausar combat rolls into the door, smashing it fully open with his muscular bulk. His hands wrap around the haft of his warden’s spear, and with a simple tug, the weapon is liberated from the gape-mouthed nyrea. As big as Dane is, the spear looks like a toothpick in his hammer-thick hands. He growls, deep in his throat and snaps it in two, simultaneously backhanding the surprised cave-dweller into the wall with one of his free hands.");
		output("\n\nThe alabaster ausar is utterly naked, stripped of his gear and bruised from his capture, but he’s grinning like a mad dog all the same. The veins on his arms bulge as he flexes his corded muscles, flipping the pieces of primitive weaponry down to his lower arms to hold like daggers. <i>“You should’ve killed me when you had the chance. This time you won’t get a chance to have your pets jump me in the dark. Come on, [pc.name]. Let’s take her.”</i>");
		output("\n\nQueensguard valiantly struggles to her feet to interpose herself between her mistress and the near-rabid ausar, but she earns little more than a stunning backhand for her effort.\n\n<b>Together you can bring down the Queen!</b>");
		flags["FREED_DANE_FROM_TAIVRA"] = 1;
		pc.removeStatusEffect("Cage Distance");
		CombatManager.processCombat();
	}
}

//Queensguard wins: loseToQueensTaivra

//Queensguard Defeated
//PC solo’d dat bitch.
public function spankedQueensguardsAss(daneEndedIt:Boolean = false):void
{
	if (daneEndedIt)
	{
		setEnemy(CombatManager.getHostileActors()[0]);
	}
	clearOutput();
	author("Savin");
	if(enemy.HP() <= 0) 
	{
		output("With a groan of pain, Queensguard collapses to a knee, barely keeping herself upright with all her weight on her blade. She glowers up at you through the slit in her visor, panting hard and coughing up blood into the steel helm.");
		output("\n\n<i>“What... what </i>are<i> you!?”</i> she stammers, trying and failing to stand again.");
	}
	else
	{
		output("Queensguard falls to her knees, the resistance bleeding out of her in pitiful moans as she clutches at her restrictive plate armor, trying to tear the metal from her flushed flesh.");
		output("\n\n<i>“I... I can’t... I can’t...”</i> she cries out, looking between you and her queen.");
	}
	//Combine: + w/ Post Dane Breakout
	output("\n\n<i>“Enough!”</i> Queen Taivra bellows, rising to her feet for the first time since you entered her throne room. Her towering longspear sweeps forward, levelling dead at your chest. The writhing mass of bodies surrounding Taivra’s throne all moan and cry out as the tentacle-cocks buried inside them shift with their queen.");
	output("\n\nThe nyrea queen’s tentacles flare out behind her as she steps down from the dias. She gives her spear a menacing flourish, closing the distance with a fearsome confidence. <i>“Queensguard, stand down. It appears ");
	if(flags["FREED_DANE_FROM_TAIVRA"] == undefined) output("this off-worlder is too much for you.");
	else output("these star-walkers truly have no honor.");
	output(" Very well, it’s been much too long since I’ve bloodied my spear.”</i>");

	if(flags["FREED_DANE_FROM_TAIVRA"] == 1) output("\n\n<i>“You won’t get the chance!”</i> the over-sized ausar grunts.");
	processTime(2);
	clearMenu();
	
	if (flags["FREED_DANE_FROM_TAIVRA"] == 1) pc.removeStatusEffect("Cage Distance");
	
	if (daneEndedIt)
	{
		setEnemy(null);
		CombatManager.TerminateCombat();
	}
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new Taivra());
	CombatManager.victoryScene(whupTaivrasAss);
	CombatManager.lossScene(loseToQueensTaivra);
	CombatManager.displayLocation("QUEEN TAIVRA");
	
	addButton(0,"Next",CombatManager.beginCombat);
}

//PC Defeats Taivra
public function whupTaivrasAss():void
{
	author("Savin");
	output("The queen stumbles back, jabbing the tip of her spear into the ground and leaning hard against it. <i>“You... you fight like a beast,”</i> the queen groans, barely standing. Her harem gasps in shock, clutching at the queen’s legs as Taivra struggles not to stumble.");
	output("\n\n<i>“I yield, offworlder. I yield,”</i> she sighs, letting her spear clatter to the ground at your [pc.footOrFeet]. Without the long shaft to support her, Taivra slumps to the ground, sitting down at the edge of her throne’s dais. All of a sudden, the once-proud warrior queen looks a lot less self-assured. Almost humble in her defeat.");

	//if Dane Freed:
	if(flags["FREED_DANE_FROM_TAIVRA"] == 1)
	{
		output("\n\nYou hear a shout behind you. Grabbing your [pc.weapon], you spin around just in time to see Dane pulling [rival.name] through the curtain towards the palace’s gates. Shit! Some of the guards try and grab them, but the towering ausar throws them aside like grainsacks, and all you see is your erstwhile battle partner’s bare ass and tail bursting through the curtains.");
		output("\n\nYou sigh. Can’t leave the nyrea to go after them... not unless you want a repeat fight when you get back. You’ll have to settle up now, while you still can.");
		output("\n\nYou turn back to Taivra, and find that she’s dragged her injured bodyguard over to her: she’s pulled Queensguard’s helmet off and rested the knight’s head in her lap, stroking her black hair with one hand and binding her wounds with the other.");
	}
	//If Dane Not Freed:
	else
	{
		output("\n\nAs you’re thinking of all the things you could do with the beaten queen, you hear a roar and the rending of steel behind you. You [pc.readyWeapon] and spin around, just in time to see Queensguard lurching to her feet with sword drawn... and Dane looming over her, putting himself between you and the nyrea and your cousin as [rival.heShe] makes a break for the door.");
		output("\n\nThe alabaster ausar is utterly naked, stripped of his gear and bruised from his capture, but he’s grinning like a mad dog all the same. The veins on his arms bulge as he flexes his corded muscles, holding torn bits of his cage like daggers. <i>“You should’ve killed me when you had the chance. This time you won’t get a chance to jump me in the dark.”</i>");
		output("\n\n<i>“Slaves should learn their place,”</i> Queensguard answers, lowering her shield into place and readying her sword. <i>“If they cannot fathom that, then they will be fed to the deeps, piece by piece.”</i> She advances steadily, one plated boot in front of the other warily moving to intercept Dane. Looks like she’s already recovered from your battle.");
		output("\n\n<i>“That’s all you’ve got? Not even a gun?”</i> Dane grins, cracking a pair of his knuckles.");
		output("\n\nConfusion briefly crosses Queensguard’s face. <i>“You are naked with naught but a shard of steel. I have no need of a dishonorable star-blaster.”</i>");
		output("\n\n<i>“If you had a gun, you might have had a chance.”</i>");
		output("\n\nYou wouldn’t have thought a guy as big as Dane could lunge so far and so fast if you hadn’t tangled with him once already, and the armored nyrea clearly doesn’t share that experience. She only has time for her eyes to widen in surprise before Dane crashes into her in a flash of albino fur and pounding fists, driving her back half a pace. The broken chunk of metal bends on impact with her armor-plated side, visibly denting the plate. Knuckles deflect off Queensguard’s helm, leaving lines of blood behind where the sharp metal ripped into Dane’s knuckles.");
		output("\n\nFor all his power and speed, it’s clear that your cousin’s bodyguard is more a brawler than a trained fighter. He doesn’t try to avoid harrowing slashes from Queensguard’s sword, relying on the awkward positioning to rob the strength from her blows and his thick fur to keep her from cutting too deeply. Dane’s left forearms are soon matted red with blood from a half-dozen surface cuts, but none so deep as to stop him from grabbing hold of his foe’s shield in two hands, wrenching it powerfully to the side.");
		output("\n\nQueensguard is no brawler. She’s a fighter, used to tackling her Queen’s enemies in one on one confrontations. She lets her arm slide out of the shield’s strap and spins with the momentum, twisting around for a vicious, back-handed slice. A diagonal rent opens up across Dane’s chest, deep enough to reveal two or three blood-drenched bones but not quite deep enough to bring down the mighty ausar. His rage filled blood leaves steaming, crimson puddles on the ground between them.");
		output("\n\nDane staggers a half-step back from the pain, but he doesn’t drop the shield. He leans further back, sweeping the shield up and into the underside of Queenguard’s polished blade. The clang of metal on metal reverberates through the cavernous chamber as the two bodyguards struggle. The nyrea barely keeps her grip on her weapon, but Dane never needed to disarm her, just take away her biggest defense - the shield - and open her up to a strike.");
		output("\n\nThe metal chunk flashes as Dane’s fist carries it forward into the dented section of the nyrea’s armor. The impact reminds you of the sound of the industrial steel punches in one of your father’s factories. Dane’s hand comes away empty, the only evidence of his strike a rent in his foe’s armor and a protruding bit of wood. Thick purple blood oozes down the plate covering Queensguard’s legs, staining them with visible defeat.");
		output("\n\n<i>“Told you that you should’ve brought a gun,”</i> Dane snarls, kicking the nyrea square in the chest. She drops like a sack of bricks and curls into a ball, wincing from what must be terrible abdominal pain. <i>“Musta ruptured something other than your sperm sacks, huh? I guess not all the male nyrea get off on penetration.”</i>");
		output("\n\nDane doesn’t look much better off, but he’s still standing, somehow. He slips the shield onto his lower left arm and starts backpedaling as the queen screams and her remaining betas leap towards the ausar with vengeance on their minds. Dane grunts and falls back, covering your cousin’s escape until they’re both through the curtain and out of sight.");
		output("\n\nYou can’t even go after them - not unless you want a repeat fight when you get back. You’ll have to settle up now, and wait to deal with [rival.name] until another time...");
		output("\n\nCursing, you put your weapon away and turn back to Taivra. She’s pulled Queensguard’s helmet off and rested the knight’s head in her lap, stroking her black hair with one hand and binding her wounds with the other.");
		flags["QUEENSGUARD_STAB_TIME"] = GetGameTimestamp();
	}
	//Combine:
	output("\n\n<i>“Be still, dear,”</i> the queen whispers to her bodyguard, stroking the warrior’s hair. <i>“It’s not as bad as you think.”</i>");
	output("\n\nGlancing up at you, Taivra sighs wearily. <i>“I clearly underestimated you, [pc.name]. And the ruthlessness of your cousin’s guardian. A mistake I will not make again. But for now, I am at your mercy. Let my people go unharmed, and I will do whatever you wish.”</i>");
	output("\n\nFirst thing’s first: you step past the defeated nyrea and plant your hand on the probe, letting it read your DNA and confirm you as its rightful owner. Your Codex receives a data transfer a moment later, loaded out with the next set of coordinates you need to continue your quest! <b>Now that you have what you need, what do you do with the nyrea...?</b>");

	//[Fuck Taivra] [Kill Taivra] [Subjugate] [Leave]
	//Any option gets you a Taivra’s Spear. Killing Tairvra gets you a Reaper Mk. I Shield Generator. Regardless, Steele will have the probe taken into town for Steele Tech to retrieve it - get 20,00 Credits. Item descripts follow.
	clearMenu();
	if(pc.lust() >= 33) 
	{
		if(pc.hasGenitals()) addButton(0,"Fuck Taivra",fuckTaivra,undefined,"Fuck Taivra","Take your frustrations out on the nyrean queen. It’s the least you deserve for conquering her and her people.");
		else addDisabledButton(0,"Fuck Taivra","Fuck Taivra","You need genitals to fuck the Queen.");
	}
	else addDisabledButton(0,"Fuck Taivra","Fuck Taivra","You’re not aroused enough to consider this.");
	addButton(1,"Kill Taivra",killTaivraYouMonster,undefined,"Kill Taivra","The nyrea have been a constant threat on this planet, and would have done far worse. Kill the queen to keep her and her people from bothering you - and any other offworlder - ever again.");
	//Subjugate
	//PC must have either read the nyrea codex or talked to Seifyn about Queen Taivra. Must have solo’d Queensguard and Taivra.
	if(flags["FREED_DANE_FROM_TAIVRA"] == undefined)
	{
		if(CodexManager.entryViewed("Nyrea") || flags["SEIFYN_TAIVRA_TALK"] == 1) addButton(2,"Subjugate",subjugateQueenTaivra,undefined,"Subjugate","You know how the nyrea operate - especially Queen Taivra, it seems. Were your positions reversed, she’d have added you to her harem; maybe you should add the queen to yours? To the victor go the spoils, and you just single-handedly beat down her and her bodyguard.");
		else addDisabledButton(2,"Subjugate","Subjugate","You don’t know enough about the nyrea to try and seize control here.")
	}
	else addDisabledButton(2,"Subjugate","Subjugate","She’d never respect someone who needed help to defeat her.");
	addButton(14,"Leave",leaveTaivraLikeABaws,undefined,"Leave","You don’t need anything else from the nyrea. Take your leave.");
}

//Leave
//You don’t need anything else from the nyrea. Take your leave.
public function leaveTaivraLikeABaws():void
{
	clearOutput();
	showTaivra();
	author("Savin");
	output("<i>“I don’t want anything from you,”</i> you say simply, turning to leave.");
	if(!pc.isAss()) output(" <i>“It didn’t have to end this way.”</i>");

	output("\n\n<i>“Surprising,”</i> the queen says, her tone unreadable. <i>“Thank you, [pc.name]. You are more... magnanimous than I would have expected. More than I would have been, in your shoes. I offer you my spear, if you’d have it. A token of my thanks. It has served me well through two decades of battle. May it find your cousin’s heart someday.”</i>");
	output("\n\nA generous gift indeed. You pick up Taivra’s spear from the dias and give it an experimental twirl before tucking it under your arm. A fine weapon, indeed.");
	output("\n\n<i>“Have your people take the probe into the village. My company will retrieve it there,”</i> you instruct.");
	output("\n\nYou give the queen a curt nod and stride out of the room, making your way back out of the nyrean palace and back to the deep caves.");
	output("\n\nTime to see what the next planet has in store!\n\n");
	flags["BEAT_TAIVRA_TIMESTAMP"] = GetGameTimestamp();
	processTime(5);
	CombatManager.genericVictory();
}

//Kill Taivra
//The nyrea have been a constant threat on this planet, and would have done far worse. Kill the queen to keep her and her people from bothering you - and any other offworlder - ever again.
//Alpha Nyrea encounter rate drops to almost nothing. Betas suffer a slight encounter reduction up top, and a severe one in the deep caves. Taivra doesn’t own ALL the nyrea, after all, but her people won’t bother the PC again.
//PC gets spear, shield belt, and a satchel gemstones (see Queen’s Chamber). Also HUGE +Hardness Personality.
public function killTaivraYouMonster():void
{
	clearOutput();
	showTaivra();
	pc.addHard(15);
	author("Savin");
	output("You grab the queen’s spear and give it an experimental twirl before striding forwards. Queensguard tries to get up, tries to intercept you, but Taivra holds her down. <i>“Let it pass, dear,”</i> the queen whispers, turning to face you with a smile.");
	output("\n\n<i>“I could not have picked a worthier foe,”</i> she says, barely a whisper. <i>“Do as you will.”</i>");
	output("\n\nA moment later, and the deed is done. You rip your spear from Taivra’s chest and help yourself to the queen’s other belongings: her shield belt and the gemstones on her belt. Queensguard sobs quietly, cradling the body of her fallen ruler as you take what you want and depart. <i>“Have the probe brought to town, or I’ll come back and take it myself,”</i> you command. After all, Steele Tech is willing to pay a premium to recover them, apparently. None of the remaining nyrea dare to disturb you as you stride out of the dungeon, back onto the trail of your scumbag cousin.\n\n");
	flags["KILLED_TAIVRA"] = 1;
	flags["BEAT_TAIVRA_TIMESTAMP"] = GetGameTimestamp();
	processTime(5);
	enemy.inventory.push(new ReaperArmamentsMarkIShield());
	enemy.inventory.push(new GemSatchel());
	CombatManager.genericVictory();
}

//Fuck Taivra
//Take your frustrations out on the nyrean queen. It’s the least you deserve for conquering her and her people.
public function fuckTaivra():void
{
	clearOutput();
	showTaivra(true);
	author("Savin");
	output("You grab the defeated queen’s spear and level its jagged tip at her chest. She’d have made you her sex slave had you lost, so it’s only fair you at least get to sample her at least he once. You curtly tell her that you’ll leave her people in peace if she surrenders her body to you - a prospect she should be intimately familiar with.");
	output("\n\n<i>“I suppose you’ve earned it,”</i> the queen admits, beckoning one of her submissives over to tend to Queensguard. She stands after that, geting pushing the tip of your spear out of the way. <i>“I’ll come willingly. To my chambers, then?”</i>");
	output("\n\nOh, no. You want every last one of Taivra’s followers to see what happens when you get between a Steele and [pc.hisHer] prize. You grab the queen’s wrist and twist her around, shoving her down onto the dias at the foot of her throne. She grunts, biting back a yelp of surprise as she’s forced down, and your hands grab the hem of her mail panties. One good yank and she’s bared to the air, her full cheeks swaying and a forearm-length shaft of pink ovipositor dangling between her legs. You grin, seeing a dark ring of asshole winking at you between her cheeks, though no feminine sex in sight");
	//if read codex:
	if(CodexManager.entryViewed("Nyrea")) output(", as you would expect for her race");
	output(". She gives you a darkly reproachful look over her shoulder, but does not resist as you decide just how to take your pent-up lusts out on the amazonian insect...");
	processTime(4);
	clearMenu();
	if(pc.cockThatFits(enemy.analCapacity()) >= 0 && pc.hasCock()) addButton(0,"FuckHerAss",fuckTaivrasAss,undefined,"Fuck Her Ass","Taivra’s already bent over, ass in the air. Grab your cock and thrust into her tight-looking ass!");
	else addDisabledButton(0,"FuckHerAss","FuckHerAss","You must have an appropriately-sized phallus to do this.");
	addButton(1,"Take Tentacles",takeTentaclesForTaivra,undefined,"Take Tentacles","Take Taivra’s tentacles in every hole. Get the most out of all those wriggling parasites attached to her hind end.");
}

//Fuck Her Ass
//Taivra’s already bent over, ass in the air. Grab your cock and thrust into her tight-looking ass!
public function fuckTaivrasAss():void
{
	clearOutput();
	showTaivra(true);
	author("Savin");
	output("That ass looks absolutely irresistible, and is completely at your mercy. You lick your lips and sidle up behind the fallen queen, running your [pc.hand] along the smooth curve of her rump. The remnants of her collected harem look on with silent awe as the once-intractable queen submits to you. A few drag away her wounded bodyguard, tending to her wounds; others moan with arousal, their hands moving towards their own armored groins.");
	output("\n\n<i>“Get it over with, then,”</i> Taivra growls, her voice icy. Apparently she doesn’t appreciate the public embarrassment");
	if(pc.isAss() || pc.exhibitionism() >= 66) output(" though it gets you off like nothing else! Reaming the queen in full view of her elite guard... the idea sends a shiver of pleasure up your spine");
	else output("; then again, the idea of banging the queen in public, even for a good reason, makes your cheeks flush");
	output(". Your free hand, meanwhile, hefts up [pc.oneCock] as you slip down behind Taivra, angling your member towards her behind.");

	var x:int = pc.cockThatFits(enemy.analCapacity());
	if(x < 0) x = pc.smallestCockIndex();

	output("\n\nYou pause just before pushing in, realizing that this high and mighty warrioress is probably not quite used to getting pounded from behind: she’ll be tight, of that you’re sure, but the idea of going at her ass without lube is less than exciting. Lucky you, Taivra has plenty of means of providing what you need.");

	output("\n\nWith a devilish grin, you draw your hand up from the queen’s firm behind to the twelve thick, green bases growing from her back just above her ass. She gasps, gritting her teeth as your hand slips up the stalk of one of her tails, thumb rubbing against the cock-like crown. You start to stroke it, caressing the tumescent green shaft until it beads with creamy white pre. Twisting the viney cock-tail around, you point it at the clenched ring of the queen’s behind, stroking faster until she’s panting and rocking her hips, trying to hold back from your vigorous advances.");

	output("\n\n<i>“The sooner you cum, the faster we’re done,”</i> you whisper to her, quiet enough for the rest of her harem not to hear. You punctuate the command with a rough slap on her ass, making the muscular flesh bounce. Taivra growls like a wild animal, snarling with her head held high - defiant even as you feel her tail-cock bulge and throb in your hand. She gasps, and the parasitic tail-prick spurts a thick stream of cum across the channel of her crack, smearing her behind with her own hot seed. You breathe in deep, smelling the musky aura of sweat and sex radiating off of the disgraced, cum-drenched queen.");

	output("\n\nNow that her booty has been thoroughly blasted with spunk, you grab a second of her bushel of tentacles and start to massage it. Post orgasm, the queen seems even more sensitive than before, digging her nails against the stone and moaning openly, unable to hide her pleasure and embarrassment. You can’t help but laugh as her stoicism is eroded into helpless cries of pleasure. You take the head of this second cock-tail and rub it through the mess of spooge drooling off of Taivra’s ass, lubing up the first inches of the shaft in as much of the sticky, hot tail-semen as possible before pressing the slick crown against her dark hole.");

	output("\n\nThe queen gasps as you force her tail into her tail-hole, eyes going wide as she’s made to violate herself. The cum-slathering makes the penetration relatively easy, and with a little elbow grease you’re able to feed more and more of the tentacle-like appendage into her asshole until she’s nearly hilted herself. You pull back after that, dragging foot after foot of squirming tendril back out until just the cockhead remains inside.");

	output("\n\nAny hint of resistance in the warrior woman is long gone now, and all twelve of her tentacle dicks are throbbing and drooling around her; even her ovi-cock is at full mast and leaking a brightly-colored mix of juices onto the stone beneath her. If you didn’t know better, you’d say Taivra was enjoying her punishment... how embarrassing! You doubt the proud amazon will ever live this down....");

	output("\n\nA few more pumps into her butt and the queen screeches, thrusting her hips back and cumming - this time from both ends! Her huge ovipositor erupts in a colorful geyser of sticky fem-juices, and her bundle of tail-cocks all shoot their individual loads of white seed, blasting her hips, ass, and the floor with cum. More importantly, though, the tentacle rammed up her butt pops its nut inside, basting the insides of her ass with the best lube there is.");

	output("\n\nTaivra pants and gasps, her chest heaving against her padded bra. <i>“You...”</i> she starts to say, trailing off into a high-pitched moan as you drag her spent tendril from her rump, letting it pop free with a wet squelch; her ass drools a steady trickle of whiteness after you remove the parasitic plug, splattering onto her thighs and chitin plates.");

	output("\n\n<i>“That’s better,”</i> you grin, letting her tentacles go free and grabbing your own [pc.cock " + x + "] and press its [pc.cockHead " + x + "] into the sloppy mess you’ve left on Taivra’s ass. She grunts and pointedly looks away, refusing to humor you. Now that’s just rude. You slap her ass, digging your fingers in until she sucks in a sharp breath - and a particularly messy wad of her tail-cum spurts out of her thoroughly abused hole.");

	output("\n\nStill groping the queen’s rump, you shift your [pc.hips] forward, pressing your cockhead into her sloppy asshole. After two loads of cum have basted it, there’s not much her hole can do to resist you: the tight ring of flesh gives way easily, letting you glide into the tight, hot passage of Taivra’s queenly ass. She squeezes hard around you, arching her back and trying hard to suppress a cry of pleasure as you slide inch after inch of cockflesh into her.");
	if(pc.cockTotal() > 1)
	{
		output(" Your other cock");
		if(pc.cockTotal() == 2) output(" pushes");
		else output("s push");
		output(" up against her taut cheeks, drooling ");
		if(pc.cockTotal() == 2) output("its");
		else output("their");
		output(" excitement all over the queen’s sullied flesh, begging for a hole to fuck. Too bad Taivra doesn’t have a normal cunt...");
	}
	output(" You can feel the nyrean queen trying as hard as she can to push against you, instinctively fighting to repel your anal assault.");
	pc.cockChange();

	output("\n\nShe fails, of course, too wet and loosened up to put up more than a token resistance. You just ease forward, pushing your hips against her taut behind until your ");
	if(pc.cockVolume(x) >= 1000) output("inhumanly large member is so deep inside the queen that her stomach bulges between her chitin plates, her body straining to take the mammoth member you’re forcing in");
	else if(pc.cockVolume(x) >= 500) output("huge cock is buried inside her, stretching her body to the limits. Taivra’s lips twist in a silent scream of pleasure, fingers trying to claw trenches into the stone dias you’ve bent her over on.");
	else 
	{
		output("cock is fully buried in her vice-like passage, letting you press your pelvis");
		if(pc.balls > 0) output(" and [pc.balls]");
		output(" against her up-raised ass.");
	}
	output(" The queen manages to eek out a groan, barely keeping herself on all fours - her arms look about ready to give, and you can feel her legs quivering against your ");
	if(pc.legCount > 1) output("own");
	else output("lower body");
	output(". You’re not anywhere near done with her, though, and so grab her neck and push her down onto her belly, letting you get completely overtop her and start to really pound the bitch.");

	output("\n\nYour hands grab her shoulders, using your [pc.legOrLegs] to pin Taivra down. Your hips do the rest, rising and falling in short, hard strokes, pounding the clenching cheeks of the queen’s behind with all the force you can muster. The queen moans and grunts, squirming like an eel under you, but can’t get any traction to escape: she’s utterly at your mercy, and you’re sure to take advantage in full! Your thrusting hips crash against her behind, echoing wet slaps off the stony walls, and forcing out drooling spurts of tail-cum around your pistoning prick. Stars above, she’s tight... a perfect, hot, wet vice that squeezes you so tightly... you grit your teeth, trying to hold on - to get the most from your royal cock-sleeve.");

	output("\n\nYour vigor pays off as the queen finally shrieks, and her whole body tenses. The writhing mass of tentacles flopping around you swell with a second wave of orgasmic energy, and you feel her wanna-be horsecock erupt all over your [pc.legOrLegs], spraying you and the floor around you with her alien juices. Her tail-cocks cum a moment later, a dozen firehoses of white cream spraying all over you, over Taivra... the stuff gets absolutely everywhere! You chuckle, slapping the queen’s ass and driving your [pc.cock " + x + "] in to the hilt before you give in to your pleasures.");

	output("\n\nWith a feral grunt, you feel your own resistance crumbling in the face of rising orgasm. Your ");
	if(pc.balls > 0)
	{
		output("[pc.balls] ");
		if(pc.balls == 1) output("clenches");
		else output("clench");
		output(", and a moment later your ");
	}
	output("[pc.cock " + x + "] erupts inside Taivra’s ass, flooding the nyrea’s well-fucked bowels with [pc.cumNoun].");
	if(pc.cockTotal() > 1)
	{
		output(" Your other cock");
		if(pc.cockTotal() == 2) output(" blasts");
		else output("s blast");
		output(" Taivra’s backside with even more of your spunk, utterly bathing the defeated queen in your seed.");
	}
	output(" Around you, other nyrea moan and jeer - some actually cheer as their queen is ");
	if(pc.cockTotal() > 1) output("covered and ");
	output("filled with cum. You can see Taivra’s cheeks burn with shame and outrage, but she silently takes it all, just gritting her teeth and clenching her fists until you’ve pulled out and wiped your cock clean on her thighs.");

	output("\n\n<i>“Have someone take the probe out to the village. My people will pick it up,”</i> you command, turning away and grabbing your discarded gear. <i>“Or I’ll be back.”</i>");

	output("\n\nTaivra makes no sign that she heard you, but something tells you that she’ll do what you want. You grab her spear, a sign of your conquest, and start heading for the curtain. You make your way out of the nyrean palace, ready for the next phase of your journey.");

	output("\n\nWonder what’ll be guarding the next probe...\n\n");
	pc.orgasm();
	flags["FUCKED_TAIVRA"] = 1;
	flags["BEAT_TAIVRA_TIMESTAMP"] = GetGameTimestamp();
	processTime(30);
	CombatManager.genericVictory();
}

//Take Tentacles
//Take Taivra’s tentacles in every hole. Get the most out of all those wriggling parasites attached to her hind end.
public function takeTentaclesForTaivra():void
{
	clearOutput();
	showTaivra(true);
	author("Savin");
	var x:int = -1;
	if(pc.hasVagina()) x = rand(pc.totalVaginas());
	output("You slink forward, dropping your [pc.gear] by the wayside and smiling down at the defeated huntress. Her body is simply amazing, firm and toned in all the right places, but curvy and fuckable in all the others. Her breasts are full, heaving underneath her padded bra, and her panties bulge with the throbbing haft of her tremendous ovipositor cock. But that’s only the icing on her cake: your eyes are drawn to the wriggling mass of green vines attached to the base of her spine, bundled around the top of her rump before billowing out behind her like her tattered cape.");
	output("\n\nNice and easy, you wrap your hand around a few of her tentacles and run them through your fingers, making the woman moan throatily. Her hips wiggle invitingly, an unconscious gesture of approval as your fingers find their way to her cock-like tips. <i>“I can’t decide if you’re gentle... or a vicious beast,”</i> the queen murmurs, rolling onto her belly and letting you play with her tentacles. Surprisingly demure for the once-haughty queen. Her betas cheer and start to grope at themselves, getting ready to enjoy the show of a lifetime. Suddenly, you’re not sure if you’re about to publicly humiliate the queen, or just excite her court into a rutting frenzy.");
	output("\n\nEither way, though, you’re going to have a good time.");
	output("\n\nThe green tendrils squirm in your grasp, beading with watery white pre as you stroke them. You’re not sure if these things change much when they’re erect, but you want to make sure they’re as stiff as they’re going to be when you get down to it. You’re not satisfied until you’ve gotten your hands on all twelve of her tentacle cocks, stroking and caressing, even letting your mouth find a few of their crowns to kiss and suck them.");
	if(pc.isBimbo()) output(" You tell yourself you want to lube ‘em up, but really you find yourself deep throating the throbbing lengths, barely able to tear yourself away from them when another demands your attention.");
	output(" Your hands eventually find their way between the queen’s legs, following the curves of her ass down to the tumescent shaft of her ovipositor cock.");

	output("\n\nTaivra gasps as you grab her dick, sucking in her breath as you massage her shaft from the knotty base to her spiny tip. Your hand comes back covered in brightly-colored, hot slime - the nyrean equivalent of fem-lube, no doubt. You grin to yourself and reach down between your " + (pc.legCount > 1 ? "[pc.legs]" : "[pc.thighs]") + ", smearing the sticky substance all over your [pc.vagOrAss " + x + "], using Taivra’s own juices to lube yourself up. Grinning happily, you grab a few of Taivra’s squirming tails into a bushel and drag them back towards your slicked-up hole, finally ready to have some fun!");

	output("\n\nLooking over her shoulder at you, the queen flashes you a surprisingly lustful purple-lipped smile. <i>“I wonder how many you can take?”</i>");

	output("\n\nThat sounds like a challenge - one you just might take. You beat her in battle, so what about beating her in the bedroom. Or the throne room, as the case may be. You squeeze her tentacles’ bodies, just enough to remind her who’s in charge even if you’re the one getting penetrated. A moment later and you feel three slender cockheads pressing against your [pc.vagOrAss " + x + "], each one wriggling and pushing independently from the others like they’ve all got minds of their own - and all trying to bury themselves in your welcoming hole.");

	output("\n\nYou struggle to keep them under control, slowly guiding the three slender shafts until their crowns are stretching the ");
	
	if(x < 0) output("rim");
	else output("lips");
	output(" of your [pc.vagOrAss " + x + "]. Biting your lips to hold back a moan of pleasure, you slowly guide the tendrils into your lubed-up hole. They keep on squirming all the way, grinding against your ");
	if(x >= 0) output("vaginal");
	else output("anal");
	output(" walls, searching out sensitive places to rub themselves on like bloodhounds - in the blink of an eye your restraint evaporates, and you’re left panting and moaning like a cheap ausar whore. The three serpentine cock-tendrils spread out, stretching you out as far as they can");
	if((x >= 0 && pc.looseness(x) >= 4) || (x < 0 && pc.ass.looseness() >= 4)) output("... which is a hell of a lot");
	output(".");
	if((x >= 0 && pc.looseness(x) >= 4) || (x < 0 && pc.ass.looseness() >= 4)) output(" More tentacles move in after that, slipping into the gaping hole to join their brothers.");
	output(" The sensation is overwhelming, making you scream as the tentacles explore every inch of your hole, refusing to give you a moment’s respite until they’re buried deep enough inside to make your gut bulge.");

	if(x >= 0) pc.cuntChange(x,1000);
	else pc.buttChange(1000);

	output("\n\nAn open mouth is practically an invitation to a woman with a bushel of tentacle cocks. Before you can close your lips, you’ve suddenly got two tendrils rushing towards your throat. You gag and sputter, drooling spittle around the two thrusting shafts that are trying to open up your clenching throat.");
	if(x >= 0) output(" Still more tentacles squirm around your [pc.butt], using their surprising strength to spread your cheeks and start to press in. Even if you wanted to stop them - and you don’t - you’re not sure you could anymore. So much for you being in command... Tentacles go everywhere after that, ramming every cock into every hole on offer, trading out when one’s near to cumming or another’s been left out of the action too long.");
	if(x >= 0) pc.buttChange(1000);

	output("\n\n");
	if(pc.hasCock()) 
	{
		output("One of her tendrils even finds its way to your [pc.cocks], wrapping around ");
		if(pc.cockTotal() == 1) output("your member");
		else output("them");
		output(" as deftly as a lover’s hand, squeezing and stroking until your prick");
		if(pc.cockTotal() == 1) output(" crowns with pre-cum. ");
		else output("s crown with pre-cum. ");
	}
	output("Tavria just smiles at you, rocking her hips and thrusting her tentacles as hard as she can into your spasming holes. For all her power, the queen is a creature of pleasure, exerting forces on you like nothing you’ve felt before. Under such a sensuous assault, you can’t help but cum - and cum hard. Your body convulses around the queen’s tentacles, squeezing and cumming and screaming your pleasure to the heavens.");

	output("\n\nLimp like a ragdoll, you flop listlessly back. Tentacles squirm in and around you, blasting you with streaks of pearly tail-spunk at the same time they baste your insides. All you can do is moan and buck your [pc.hips] against the thrusting parasites, eager for all the cum you can siphon off the queen.");

	output("\n\nWhen your climax has passed, and the queen’s cocks have stopped pumping you full of spunk, you slowly manage to pull yourself up. Tentacles pop wetly out of you, indignantly squirting spunk onto your asscheeks and face as you grab your gear. Breathlessly, you tell Taivra to deliver the probe to the village outside - your people will come get it later.");

	output("\n\n<i>“Of course, [pc.name],”</i> she murmurs, rolling onto her back. You shoot her a look, and indignantly grab her spear - if there’s one thing to cement your victory, it’s capturing your opponent’s weapon. You take a few cum-sodden steps towards the door before she finally calls after you that she’ll honor your request. You smile, and out you go. Nothing else dares to oppose you as you make your way out of the palace, back past the guard post at the gate and out into the deep caves.");

	output("\n\nTime to find out what your dad has in store for you next!\n\n");
	flags["FUCKED_BY_TAIVRA"] = 1;
	flags["BEAT_TAIVRA_TIMESTAMP"] = GetGameTimestamp();
	//[Next]
	CombatManager.genericVictory();
}

//Subjugate
//PC must have either read the nyrea codex or talked to Seifyn about Queen Taivra. Must have solo’d Queensguard and Taivra.
//You know how the nyrea operate - especially Queen Taivra, it seems. Were your positions reversed, she’d have added you to her harem; maybe you should add the queen to yours? To the victor go the spoils, and you just single-handedly beat down her and her bodyguard.
//Else: You don’t know enough about the nyrea to try and seize control here // After what happened with Dane, something tells you that Taivra would probably stab you in the back if you stick around.

public function subjugateQueenTaivra():void
{
	clearOutput();
	showTaivra();
	author("Savin");
	output("You kick Taivra’s fallen spear up into your hand, giving the long haft a few experimental twirls. The blade cuts the air around you, so light and quick that it feels like a whirlwind of steel around you. A fine weapon, one clearly built for a queen" + pc.mf("... or a king","") + ".");
	output("\n\nThe fallen queen looks up at you, her eyes as unfathomably dark as a pair of black holes. Striding forward, you swing the longspear around until its tip rests squarely under Taivra’s chin, dangerously close to her unprotected throat. Grinning triumphantly at the queen, you say <i>“I’ve heard a lot about you nyrea. The way you dominate those who you beat in battle.”</i>");
	output("\n\nTaivra nods slowly. <i>“That is how I built this city, yes. Subjecting lesser huntresses, males... any nyrea I found weaker than myself, that I could force to work in my name.”</i>");
	output("\n\nThen this shouldn’t come as much of a surprise to her, should it? From what you’ve seen, Taivra must have brought hundreds of her fellow nyrea under her sway over the years. About time somebody did the same to her: an idea she picks up on quickly as you remove the spear tip from her throat.");
	output("\n\nSighing, Taivra admits <i>“I did put myself at your mercy, didn’t I, [pc.name]? You have shown honor and courage thus far - more so than your worm of a cousin by far. Admirable traits I did not expect to see in a star-walker. Traits I could learn to live with. Literally, if need be.”</i> Her purple-painted lips twitch into something resembling a smile. <i>“Very well, [pc.name]. If I have your word my subjects will be treated fairly, left unharmed... I will submit.”</i>");
	output("\n\nYou give the queen a nod of agreement, and setting the butt of your newfound spear on the ground, reach out to shake on it. A gesture she’s clearly unfamiliar with, as Taivra hesitates a moment before clasping your hand in both of hers and kissing your knuckles. <i>“So be it. From this day forward, you have my word: I am yours, [pc.name]: my harem, my spear, and my body. Everything I have, I give to you.”</i>");
	output("\n\nYou accept her surrender eagerly, squeezing the queen’s hand. You wonder briefly if the nyrea have any concept of marriage as Terrans do, or if all they understand is their harems - domination through violence. ");
	if(pc.isNice()) output("Perhaps you’ll be the first to show them....");
	else output("Either way, it seems Taivra’s harem is yours now!");
	output(" You smile down at your new mate, eager to get the chance to take advantage of her willingness. You doubt you’ll ever find a more experienced partner, after all. The things she probably knows... mmm.");

	output("\n\nYou shake yourself out of your momentary reverie, long enough to tell Taivra to have the probe taken out of her village: you can make a hefty profit off of it thanks to Dad’s company, after all. She agrees, just as one of her submissives arrives with bandages for Queensguard.");
	output("\n\n<i>“We’ll talk later, [pc.name],”</i> she says quietly. <i>“I can only imagine how eager you are to... claim your prizes.”</i>");
	output("\n\nMore than one prize, too. After all, you’ve got the coordinates you need for the next leg of your quest!\n\n");
	flags["KING_NYREA"] = 1;
	//Should make queen nyreabuns ready to go immediately
	flags["BEAT_TAIVRA_TIMESTAMP"] = GetGameTimestamp() - (60 * 13);
	flags["QUEENSGUARD_STAB_TIME"] = GetGameTimestamp();
	processTime(12);
	CombatManager.genericVictory();
}

//Bad Ends
//PC is defeated by Queensguard or Taivra (w/ Dane)
public function loseToQueensTaivra():void
{
	author("Savin");
	//Defeat by Queensguard Intro
	if(enemy is Queensguard)
	{
		output("You stagger back under the armored nyrea’s rain of blows, desperately dodging sword swipes and shield strikes until your [pc.foot] catches on an uneven stone and suddenly you’re falling back, screaming until your head cracks on the rocky floor. Your world spins, vision erupting in stars; your [pc.weapon] is kicked painfully from your hands by ruthless steel. When your vision clears, you see the lethal point of Queensguard’s blade leveled at your throat, a hair’s breadth from slicing you open.");
		output("\n\n<i>“Yield,”</i> she growls from beneath her helm. <i>“Yield or die.”</i>");
		output("\n\nYou raise your hands, admitting your defeat. Queensguard gives you a slight, almost imperceptible nod, and several of the queen’s other soldiers rush out from the shadows to grab your [pc.gear], stripping you of all your equipment. A moment later and you’re left completely naked, shivering in the subterranean cold. A pair of soldiers heft you up and drag you forward as Queensguard steps dutifully aside, leaving you to face the queen.\n\n");
	}
	//Defeat by Taivra, has freed Dane Intro
	else
	{
		if(flags["FREED_DANE_FROM_TAIVRA"] == 1)
		{
			output("Even with Dane by your side, you find it impossible to stand up to the nyrean queen. The snowy-haired ausar valiantly deflects flurries of spear-thrusts, trying to grab at the queen’s haft but never able to get a grip on it until his hands are torn and bloodied. Taivra’s assault drives him back, sending the warrior dog tumbling back into you - the two of you go tumbling to the ground with a tangle of limbs and tail");
			if(pc.tailCount > 1) output("s");
			output(" and angry shouts.");
			output("\n\nBy the time you realize Dane’s cracked his skull and blacked out, it’s too late to push the unconscious (you hope!) ausar before Taivra’s on you, slamming down on you like a bag of furious bricks. A leather-clad knee drops hard on your neck, pinning you down and choking you while her spear is hiked into a short grasp and leveled squarely at your eye.");
			output("\n\n<i>“I believe you’re done, [pc.name],”</i> she growls, her jagged spear-tip hovering menacingly. <i>“Drop your weapons and yield.”</i>");
			output("\n\nWith a heavy sigh, you release your [pc.weapon]. A few of the beta nyrea still in the room leap forward and secure your equipment. They roll Dane off you and pull you up, ripping off your [pc.gear] until you’re naked and shivering on your [pc.knees] before the queen.\n\n");
		}
		else
		{
			pcBeatByTaivraOneOnOneManoEManoLady();
			return;
		}
		//Combine:
	}
	output("<i>“A shame you did not live up to my expectations, [pc.name],”</i> Taivra sighs, reclining on her throne. <i>“I hoped for more... ah, well. I suppose you star-walkers are all alike in the end: weak.”</i>");
	output("\n\nThe queen sighs, running her fingers along the haft of her spear. <i>“What am I to do with you? Have you join my harem? I once only accepted the strong as my mates, warriors like Queensguard in her prime. Though that was many years ago. Now... I suppose I have so many betas, a few star-walkers won’t be so out of place.”</i> She turns to her guards and commands them, <i>“Take the four-armed one to the healers. Have him tended to. And the cousin, the little blonde slut. Give [rival.himHer] to me. I think it’s time these two Steeles learned their new place.”</i>");
	output("\n\nThe guards nod briskly, and a few moments later Dane is hauled off, and [rival.name] is dragged over to take the huge ausar’s place, forced onto [rival.hisHer] knees beside you.");
	output("\n\n<i>“Way to go, you dumb shit,”</i> [rival.name] snaps under [rival.hisHer] breath. <i>“Now we’re stuck here!”</i>");
	output("\n\nMaybe if [rival.name] hadn’t tried to merc the queen in the first place, none of this would have EVER happened. Your cousin sneers, but [rival.hisHer] reply is cut off by the queen’s commanding voice:");
	output("\n\n<i>“Come here, you two. No, don’t stand. You haven’t earned that right. Crawl.”</i>");
	output("\n\nYou and [rival.name] exchange a glance, both of you apparently half-considering some act of rebellion before a pair of guards smack your [pc.butt] with the butts of their spears, shoving you forward. With a wince of pain, you and [rival.name] both start crawling like beaten dogs towards the stone dias. The queen’s betas scoot out of the way, the pile of writhing mid-coistus bodies getting as far as they can on the short leash of Taivra’s tail-cocks still thrusting into their drooling ovipositors.");
	output("\n\nAs you approach, Taivra slowly rises to her feet and lets the heavy chain panties fall from her wide hips, clattering to the ground at your fingertips and revealing the throbbing shaft of her ovi-cock: as thick around as your arm, its flared head ringed with spiny pleasure-nubs around an X-shaped slit beading with moisture. Her harem moans around her, tails thrusting faster and harder as the queen’s excitement mounts.");
	output("\n\n<i>“You two might have been rivals once, but I’ll not tolerate fighting in my harem. If you want to live, put your childish feud aside and work together. If you make me cum, maybe I won’t put you in cages for the rest of your lives.”</i>");
	output("\n\nThe queen’s words are more of a threat than enticement, a clear command that you and your cousin have to work together if you’re going to make it through what promises to be a long imprisonment.");
	output("\n\n<i>“Gross,”</i> [rival.name] uncremoniously delcares, curling [rival.hisHer] nose. <i>“I’m not-”</i>");
	output("\n\n[rival.HisHer] gripes are cut off by a swift slap from Taivra, a crack of chitin on flesh that echoes painfully through the throne room. Several nyrea cheer or jeer, shouting curses as your cousin’s blonde hair billows around [rival.hisHer] head, and [rival.hisHer] hand goes to [rival.hisHer] cheek, touching it with wide, horrified eyes.");
	output("\n\n<i>“Maybe you liked it better in your cage, worm?”</i> Taivra growls. <i>“Or would you prefer death?”</i>");
	output("\n\n[rival.name] looks bat at the queen with tear-stained eyes, bitterly biting [rival.hisHer] lip. You’d laugh, if circumstances were just a little different. Now, though, the queen’s gaze turns to you, and you are drawn forward your [pc.lips] nearly brush Taivra’s ovipositor-cock. You reach back, grabbing [rival.name]’s shirt collar and yank [rival.himHer] forward. [rival.HeShe] stumbles, making you drag [rival.himHer] up to sit beside you, on the other side of Taivra’s mighty egg-layer.");

	output("\n\nYour cousin looks at you with absolute hatred... or is it defeat? Either way, [rival.hisHer] tongue snakes out of [rival.hisHer] lips and slowly reaches out to touch the flank of Taivra’s pink shaft. That’s better - no way you’re doing this alone. Taivra gives you an ever-so-slight nod, and drinks in a deep, chesty breath as [rival.name]’s tongue caresses her cock. You follow suit, breathing a sigh before submitting to your new mistress. There’s no coming back from this, a small part of your mind tells you: the rest of your life will be spent here on your [pc.knees], worshipping Queen Taivra’s powerful body. That’s what happens to people like you and [rival.name] on this word: the losers, the ones not strong enough to stand up to someone like Taivra.");
	output("\n\nYou deserve this.");

	output("\n\nForcing yourself to accept your fate, you lean in to join your cousin in oral worship of the queen’s tremendous ovipositor. Your [pc.tongue] flicks across the pale pink cockflesh, taking your first taste of your new mistress. It’s... odd, not like you’d have imagined; the first thing to come to your mind is lemons, sweet but bitter enough to make you scrunch your nose.");

	output("\n\nThe queen chuckles at your reaction, running her long-nailed fingers ");
	if(pc.hasHair()) output("through");
	else output("over");
	output(" your [pc.hair]. Her grasp tightens on the back of your head, guiding you up and down the length of her shaft as she sits back down on her towering throne, reclining on your father’s glossy black probe as you and [rival.name] run your tongues all over her prick. Between long-lapping licks, your gaze settles over the crest of Taivra’s rounded shaft, locking eyes with your cousin. You can see the hatred burning in [rival.hisHer] eyes, glowering at you and the regal bug-woman looming over you. Beta nyrea squirm all around you, bodies writhing while the queen fucks them to the beat of your and [rival.name]’s tongues.");
	output("\n\nThe orgiastic picture must look like quite the hedonistic scene to the guards standing around - or more accurately, slumped against the walls feverishly touching themselves. You’re amazed the queen’s throne room hasn’t turned into a wall-to-wall carnal pit!");
	output("\n\nPerhaps they’re just waiting for their queen to have her pleasure first, like wild animals letting their alpha take the first share of the kill. You shudder to think that you and [rival.name] are going to passed around as the whole palace’s bitches, but there’s not much you could do to stop it now. All there is to do is keep licking and hope the queen shows you mercy... and maybe doesn’t for your cousin. You’d still get some small satisfaction seeing [rival.himHer] get railed by a rape-gang of nyrean warriors.");
	output("\n\nHey, [rival.heShe] tried to strafe you with a gunship once. Fair’s fair.");
	output("\n\nYou shake the thought and start licking harder, running your fingers around the nubby flare at the tip of Taivra’s cock. She moans, and a trickle of purple juice drools out of its X-shaped tip, smearing your fingers - and lubing up your ministrations. Your hand moves faster after that, smearing her excitement over her prick; the taste changes dramatically after that, much sweeter than before! Your motions pick up speed, spurred on by the pleasant taste and the struggles of your cousin. [rival.name] looks like [rival.heShe]’s trying to catch up to you, kissing and nibbling on the thick cockmeat between you. Everything’s got to be a contest between you, doesn’t it?");
	output("\n\nWell, you’re not going to be outdone here! Leaving the flanks of Taivra’s cock to your oh-so-determined cousin, you scoot around to sit right in front of the queen, planting yourself between your legs. You get an approving smile from her purple-painted lips, and one of her plated legs lifts up and onto your shoulder, gently guiding you in towards the broad cockhead you’re lusting after. You open wide, stretching your jaw around the vaguely-equine crown and start to slide your throat up her length.");
	output("\n\n<i>“Showoff!”</i> your cousin hisses under [rival.hisHer] breath, but Taivra just nods and arches her back - with fourteen people servicing her all at once, it’s amazing she’s not cumming already - this woman has to have remarkable sexual fortitude. You’ll just have to bring her to the edge yourself...");
	output("\n\nYou grab her cock in both hands and do your best to deepthroat your new mistress, taking as much as you can until her spiny crown batters the back of your throat. That catches her by surprise - Taivra grunts and thrusts her hips at you, grabbing at your cousin’s head and pushing [rival.himHer] deeper into her crotch, forcing [rival.himHer] to run [rival.hisHer] tongue all along the length of her cock until [rival.name]’s face is pressed between her legs, forcing to work at the very base of her shaft.");
	output("\n\nBetween the two of you - and a dozen sluts getting their ovipositors fucked by her tails - you see her will start to erode away into a chorus of soft moans and grunts. She’s squirming before long, her fingers digging painfully into your skull - and [rival.name]’s as well, if the way [rival.heShe]’s scowling and wincing with every hip-thrust is any indication. Lucky for [rival.himHer], you’re doing everything you can to bring Taivra to orgasm: using your mouth, tongue, and hands with all the skill you’ve accumulated over your adventures: every trick and technique you’ve picked up applied in rapid succession.");
	output("\n\nYour ministrations seem to pay off, as Taivra’s breath quickens, and her thrusts into the mewling harem around her approach a fever pitch. You push your [pc.tongue] forward, slipping it between the folds of her X-shaped slit, invading the hollow, heated tube of her ovipositor to tease her sodden insides. She moans, squeezing her muscular thighs around your [pc.face] like some sort of anchor to keep herself from racing over the edge.");
	output("\n\nShe doesn’t last much longer. With a roar of anguished pleasure, the queen throws her head back and lets loose her pent-ups lusts, blasting your throat with a geyser of alien fluids. Behind her, a dozen harem sluts arch their backs and scrape their fingers on the stone as their ovi-cocks are flooded with a deluge of cock-tail cum. The air around you becomes heavy with the smells of sex, Taivra alone putting off enough masculine musk from her ovipositor-flooding cum to make you think a dozen men were climaxing around you. And her fem-cum, too! She tastes so sweet, and her juices are so sticky that you feel like your mouth is being painted over by purple alien excitement.");
	output("\n\nHot cum drools from the corners of your mouth, pooling on the floor between your " + (pc.legCount > 1 ? "[pc.legs]" : "[pc.thighs]") + " as Taivra’s wilting cock pops out of your mouth. She grabs your cousin’s bonde head, pulling [rival.himHer] over and forcing [rival.himHer] to lick her crown clean. You grin at the disgust on [rival.hisHer] face, nose scrunched up and lips twisted as [rival.heShe]’s forced to lap up all the juices and spit coated Taivra’s cock.");
	output("\n\n<i>“I suppose that will do,”</i> Taivra says contentedly, reclining on her throne. Around her, her harem betas slump to the ground, extricating her tentacles from their bodies. <i>“Though not much in battle, you star-walkers seem to have some skill with your bodies, at least. If you think you can do that again... and again... perhaps I’ll keep you after all.”</i>");
	output("\n\nShe snaps her fingers, and you feel a pair of nyrean hands on your shoulders, pulling you towards the throne room’s doors.");
	output("\n\nAnd so ends the story of [pc.name] Steele, one true heir to Victor’s fortune. You’ll spend the rest of your life wondering what you could have been, had things been different. At least you have [rival.name] to commiserate with...");
	
	processTime(35 + rand(16));

	pc.removeEquipment();
	pc.loadInMouth(taivra);
	
	badEnd();
}

//PC is Defeat by Taivra in a Solo Fite
public function pcBeatByTaivraOneOnOneManoEManoLady():void
{
	clearOutput();
	showTaivra();
	author("Savin");
	output("The queen fights like a woman possessed ,driving you back with her spear until you’re tumbling off the dias, falling back with a scream. Your cousin shouts at you, but [rival.hisHer] words are lost as your head cracks on the stone, and a moment later, Taivra comes crashing down on you with her knee, pinning you down as her spear presses firmly against your throat.");
	output("\n\n<i>“You fight well, [pc.name],”</i> she purrs, her knee pushing painfully into your gut. <i>“And honorably, too. You’ve impressed me, star-walker. More than I thought one of your kind could have.”</i>");
	output("\n\nShe smiles, and her knees shift, moving to straddle you more than just pin you down. <i>“There’s a place by my side in the harem I’ve never been able to fill. Yield to me, [pc.name]. Swear fealty, and I will guarantee you a kingly life at my side.”</i>");
	output("\n\nGiven the choice of death or nobility, the choice isn’t much of one at all. You let go of your weapon and show your empty hands to the queen. Her smile widens, and she rises to her feet. <i>“A wise choice, [pc.name].”</i> She offers you a hand up, and a moment later you’re being hauled up and into the queen’s arms. Her hands wrap around your [pc.hips], and you’re suddenly aware of the heat of her body pressing against you, the sweat-sheened flesh and polished chitin as alluring as they are intimidating.");
	output("\n\n<i>“A wise choice indeed,”</i> Queen Taivra purrs, gesturing at her soldiers behind you. The nyrean guards grab Queensguard and drag her off to be tended to, and others gather around your cousin in [rival.hisHer] cage.");
	output("\n\n<i>“Let go of me!”</i> [rival.name] shrieks as [rival.heShe] is dragged out of the cage, kicking and screaming.");
	output("\n\nThe queen turns to you, one of her fingers ");
	//if loss by HP:
	if(pc.HP() <= 0) output("wiping the blood from a small cut her dancing spear has left on your shoulder");
	else output("teasing across one of your [pc.lips], gently turning your attention towards your struggling cousin.");
	output(" <i>“My first gift to you. Consider [rival.himHer] a reward for your valor. I was still deciding what to do with [rival.himHer] before your arrival. Perhaps you’d care to decide [rival.hisHer] fate? As I understand it, there’s a great deal of enmity between you two.");

	//[Execute] [Egg Slut] [Bed Warmer]
	clearMenu();
	addButton(0,"Execute",cousinGetsExecuted,undefined,"Execute","Have your cousin killed. If you can’t be CEO of Steele Tech, [rival.heShe] sure as hell can’t either!");
	addButton(1,"Egg Slut",cousinTurnsEggSlut,undefined,"Egg Slut","If your cousin tried to kill Taivra, the least [rival.heShe] can do is spend the rest of [rival.hisHer] existence making life. Have [rival.name] become an egg incubator for the harem.");
	addButton(2,"Bed Warmer",bedWarmerCuz,undefined,"Bed Warmer","You have to admit, even after all of this... you and your cousin have a certain connection. Have [rival.name] become your personal sex slave.");
}

//Execute
//Have your cousin killed. If you can’t be CEO of Steele Tech, [rival.heShe] sure as hell can’t either!
public function cousinGetsExecuted():void
{
	clearOutput();
	showRival();
	author("Savin");
	output("<i>“Kill [rival.himHer],”</i> you say, sneering at your helpless cousin.");
	output("\n\nTaivra chuckles and nods at a couple of her soldiers, who latch their arms on [rival.name]’s shoulder and start to pull [rival.himHer] away. <i>“Good choice, my new mate... better to have your rivals killed than risk their coming back to harm you later. I’ll have gallows erected in the village, and we’ll dispose of this worm.”</i>");
	output("\n\n[rival.name] screams a host of profanities, but is helpless to resist as [rival.heShe]’s dragged away to [rival.hisHer] doom. Taivra’s hand tightens around your waist as your rival is dragged off, until it’s almost painful. <i>“Now then, I believe it’s time you paid your fealty to me...”</i>");
	flags["COUSIN_EXECUTED"] = 1;
	clearMenu();
	addButton(0,"Next",badEndWithTaivraShit);
}

//Egg Slut
//If your cousin tried to kill Taivra, the least [rival.heShe] can do is spend the rest of [rival.hisHer] existence making life. Have [rival.name] become an egg incubator for the harem.
public function cousinTurnsEggSlut():void
{
	clearOutput();
	showRival();
	author("Savin");
	output("<i>“You nyrea like planting your eggs in people, don’t you?”</i> you say with a mischevious grin, looking your cousin’s lithe form up and down. <i>“I think [rival.name] here would look a lot better with a belly full of eggs... for the rest of [rival.hisHer] life.”</i>");
	output("\n\nTaivra chuckles, <i>“");
	if(pc.hasCock()) output("Many sired by you, I’m sure.");
	else output("Perhaps you’d rather your cousin bear your burden of eggs? A fitting fate, I suppose.");
	output(" Very well, I will order [rival.himHer] bathed and set aside with the rest of my favored incubators. A better life that that worm deserves, but one that is at least productive. You are both wise and magnanimous, my mate.”</i>");
	output("\n\n[rival.name] screams a host of profanities, but is helpless to resist as [rival.heShe]’s dragged away to [rival.hisHer] doom. Taivra’s hand tightens around your waist as your rival is dragged off, until it’s almost painful. <i>“Now then, I believe it’s time you paid your fealty to me...”</i>");
	flags["COUSIN_EGGSLUT"] = 1;
	clearMenu();
	addButton(0,"Next",badEndWithTaivraShit);
}

//Bed Warmer
//You have to admit, even after all of this... you and your cousin have a certain connection. Have [rival.name] become your personal sex slave.
public function bedWarmerCuz():void
{
	clearOutput();
	showRival();
	author("Savin");
	output("<i>“I want [rival.himHer],”</i> you say simply, drinking in your cousin’s lithe form. You’ve spent too long chasing that piece of tail across the galaxy, and now [rival.heShe]’s in your grasp. No way you’re letting an opportunity like this pass... sorry, Dad.");
	if(pc.hasCock() && chars["RIVAL"].hasVagina()) output(" Well, Dad’s gene pool was pretty messed up before, so there’s not much more damage you can do.");

	output("\n\n<i>“Ah, a warrior after my own heart,”</i> Taivra chuckles, her predatory smile only widening. <i>“A defeated foe is only as good as they can service you in bed, don’t you agree? A fate you’ll learn yourself, but for now, I will allow you this choice.”</i> She turns her attention to [rival.name] and motions to a couple of her soldiers. The nyrea grab [rival.name], ripping at [rival.hisHer] clothes and dragging [rival.himHer] towards the curtain at the foot of the throne room.");

	output("\n\n<i>“I’ll have your cousin bathed and prepared for you,”</i> Taivra promises. <i>“I hope your first mating will be as pleasant as ours shall.”</i>");
	output("\n\nYou feel one of the queen’s hands brush over your [pc.butt] at that, giving you just enough of a push towards the door to get you moving. It looks like your new queen is going to take advantage of your surrender sooner rather than later.");
	flags["COUSIN_BEDWARMER"] = 1;
	clearMenu();
	addButton(0,"Next",badEndWithTaivraShit);
}

//Combine, no new pg.
public function badEndWithTaivraShit():void
{
	clearOutput();
	author("Savin");
	if(flags["COUSIN_EXECUTED"] == undefined) showRival();
	else 
	{
		showTaivra();
		showBust("TAIVRA","RIVAL");
	}
	output("Your queen leads you in your cousin’s wake, out of the throne room and back through the palace. Nyrean warriors follow you, spears and armor clanking loudly. Taivra’s arm wraps around you, guiding you up the winding stairs and into a large room off of the main thoroughfare. The queen’s chambers - and yours, now, you think. The nyrean queen’s hands run across your bare flesh, caressing your ");
	if(pc.hasCock()) output("[pc.cocks]");
	if(pc.hasCock() && pc.hasVagina()) output(" and ");
	if(pc.hasVagina()) output("[pc.vaginas]");
	output(", giving you just enough of a squeeze to send a rush of an excitement through you.");

	output("\n\nHer plated hands guide you towards the bed and roughly pushes you onto your back, sending you tumbling onto the feather-soft silks. She’s on you in a moment, pinning you down with her knees - and her lips, as well. Amethyst lips press firmly to yours, and your lover moans throatily as you submit to her sensual domination. You should enjoy your reward, you decide: the queen has offered to give you a place of honor, but a place you will be for the rest of your life. You’ll never see your gear again");
	if(pc.hasEquippedWeapon()) output(", or your weapons");
	output(". No way to contact home, no way to fight your way out that wouldn’t have you as doomed as Dane and your cousin were.");

	output("\n\nThis is the end of your quest. Might as well make the most of it.");

	output("\n\nYou struggle with Taivra’s chain bikini until the heavy garments fall aside, dumping the pendulous mounds of her ivory breasts into your hands. A gentle squeeze earns you a murmurs of pleasure from the queen, and makes her writhing mass of green tentacle-cocks go wild with anticipation. <i>“Ah, you’re braver than most betas... as I hoped,”</i> the queen purrs between kisses, clearly enjoying the way your fingers clutch at her chest. <i>“Most just lie back and scream when I fuck them... when I breed them. After what you’ve been through, though, something tells me you know how to give as good as you get.”</i>");

	output("\n\nYou give her a squeeze of affirmation, and slip a hand down to pull the chain panties from her flared, egg-bearing hips. A hot slab of nyrean meat flops down onto your lap in its wake, its pleasure-nubs rubbing against your [pc.leg]. ");
	if(pc.hasCock()) output("However, despire her breeding stick’s looming threat against your groin, Taivra’s hips shift ever so slightly to rub her taut ass against the half-erect length of [pc.oneCock]. She flashes you a playful smile, and her hand reaches back to grab your prick. <i>“I’ll go easy on you, this first time,”</i> she teases, pumping your shaft. <i>“But don’t get used to it... beta.”</i>");
	else output("Taivra’s hips slowly shift back, dragging her burning-hot egg-layer down between your " + (pc.legCount > 1 ? "[pc.legs]" : "[pc.thighs]") + ". <i>“Don’t worry, I’m not carrying any eggs now. I want to get used to you, make sure you’re nice and broken in before I trust you with my young.”</i> As if to punctuate the point, you feel her nub-ringed pressing against your [pc.vagOrAss].");

	output("\n\nYour whole body tenses as the insectile queen hovers on the brink of penetration, making you wait in agonizing anticipation before fully making you hers.");

	output("\n\nA moment later, and you become a true member of her massive harem in an explosion of pleasure.");
	processTime(2000);
	pc.lust(pc.lustMax());
	clearMenu();
	addButton(0,"Next",soloTaivraBadEndPart2);
}

public function soloTaivraBadEndPart2():void
{
	clearOutput();
	showTaivra(true);
	author("Savin");
	output("The queen claims you as her second - the second most powerful and influential member of her harem, after herself. The next days are spent in ruts of lust and fiery passion. You’re sure the food the nyrea give you is spiked with some kind of aphrodisiac, as your desire flares to unbearable heights - you can’t keep your hands off of Taivra whenever she deigns to be near you, and you quickly become accustomed to your place on your knees, servicing the queen’s cock with your mouth, or bending over on the dias of the throne to let her stuff your [pc.vagOrAss] with her alien cum... and, later, her eggs.");
	output("\n\nWhen the queen is otherwise occupied, your attentions turn towards her myriad betas: dozens of lusty sluts, some with dicks and others with dripping pussies filled with semen, all eager for your touch.");
	//if BedWarmer Rival: 
	if(flags["COUSIN_BEDWARMER"] == 1) 
	{
		showBust("TAIVRA","RIVAL");
		output(" Your cousin, too, finds [rival.himHer]self at your mercy, a permanent fixture in your chambers by way of a solid steel chain and collar. Your first time together is... emotional, to say the least. There’s screaming, clawing, and eventually crying, but you have your way. Eventually [rival.name] learns to love [rival.hisHer] place - even thanks your for saving [rival.hisHer] life. It turns out that with a little effort and training, you couldn’t ask for a better ");
		if(pc.hasCock())
		{
			output("cock-warmer");
			pc.cockVirgin = false;
		}
		else if(rival.hasCock() && pc.hasVagina())
		{
			output("cock to fill your pussy");
			var x:int = rand(pc.vaginas.length);
			pc.cuntChange(x, rival.cockVolume(0), false);
			pc.loadInCunt(rival, x);
		}
		else output("mate");
		output(", as incestuous as your union is. More than once after a vigorous fuck session, when [rival.name] thinks you’re fast asleep, [rival.hisHer] head resting on your chest, you’re sure you hear [rival.himHer] say <i>“I love you.”</i>");
	}
	output("\n\nYou suppose a life spent in lust, fucking who you please between sexual service to a powerful and domineering queen, isn’t so bad after all. You never find out what your father had in store for you, but frankly... you’re not sure it matters. You have another cousin who might hear of her fortune some day, at your and [rival.name]’s expense. Obviously, you weren’t cut out for the job. But now you’ve found a better one, a career more suited to your talents and to the lust that grows hotter in you day after day.");
	output("\n\nSomething feels missing in you for the rest of your life. A destiny unfulfilled. But it’s an easy hole to ignore, surrounded by beautiful aliens");
	if(flags["COUSIN_BEDWARMER"] == 1) output(" and a cousin who so eagerly warms your bed at night");
	output(". You can’t say you’re too sad at night, especially when your loving queen takes you into her bed - nothing ever will make you feel more alive again as when Taivra claims you with her royal scepter, filling your body with the most amazing sensation, and new generations of life for your queen’s growing nation.");

	output("\n\nIt’s not so bad, in the end.");
	
	days += 2;
	processTime((20 * 60) + rand(16));
	
	pc.removeAll();
	pc.armor = new DressClothes();
	pc.armor.longName = "royal nyrea harem clothes";
	pc.armor.description = "a set of royal nyrea harem clothes";
	
	pc.libido(25);
	pc.lust(100);
	for (var i:int = 0; i < 28; i++)
	{
		if (pc.hasVagina())
		{
			for (var vi:int = 0; vi < pc.vaginas.length; vi++)
			{
				pc.cuntChange(vi, taivra.cockVolume(0), false);
				pc.loadInCunt(taivra, vi);
			}
		}
		pc.buttChange(taivra.cockVolume(0), false);
		pc.loadInAss(taivra);
		pc.loadInMouth(taivra);
		pc.orgasm();
	}
	
	badEnd();
}

//Post-Probe Resolution
//Once the PC leaves the palace for the first time after defeating Taivra...

//if PC isn't NyreaKing:
//>Seal the gates again. No guards, no way to get back into the palace. Just like the Tether. 
//>Remove Seifyn's [Taivra] talk. Replace with [Leadership]

//if PC IS the NyreaKing:
//>Remove the princess from the harem chamber. She's off plotting your and her mother's downfall.
//>Queensguard added to 2C13 after a few hours. 

//Either Way:
//>Add the "Probe Reclaimation" event when the PC enters the airfield for the first time:


//[Leadership] (ded Taivra vers.) 
//Replace Seifyn's [Taivra] talk.
//Ask Seifyn what's become of the village since you defeated Queen Taivra.

public function leaderShipDeadTaivraConvo():void
{
	clearOutput();
	showSeifyn();
	author("Savin");
	if(flags["KILLED_TAIVRA"] != undefined)
	{
		output("<i>“So, who’s in charge these days?”</i> you ask, glancing at the group of armed huntresses near the middle of the small village.");
		output("\n\nSeifyn sighs heavily, wrapping her arms around herself. <i>“Taivra’s eldest daughter. She’s the heir, after all... but she’s locked herself in the palace, surrounded by her elite guard. Barely comes out now, except to send soldiers to take mates or bring in food.”</i>");
		output("\n\nSounds like the princess has become something of a recluse since your door kicking adventures. <i>“So, how does she stack up to Taivra?”</i>");
		output("\n\n<i>“I wouldn’t know. She hasn’t... chosen me yet. But I hear she’s brutal, a real tyrant. I’m just trying to keep my head down, [pc.name]. I don’t want any trouble from her. I know I miss her mom, though. Wish it was one of mine that was on the throne... at least then I’d probably get to live in the palace. Definitely wouldn’t have to get mated again. Would be nice to choose my own for once, but I guess that’s not happening any time soon.”</i>");
		output("\n\nSiefyn sighs wistfully and rests her chin on her hands. <i>“Anyway... something else I can help you with, [pc.name]?”</i>");
	}
	//[Leadership] (Live Taivra vers.)
	else
	{
		output("<i>“So, how’s the queen doing?”</i> you ask with a grin, shooting a glance to the sealed doors of the palace.");
		output("\n\n<i>“You mean after you kicked her ass?”</i> Siefyn says, crossing her arms. <i>“She told us what happened. Gathered everyone up, said offworlders made a fool of her. Hurt her bodyguard. Something told me you might have been the one.”</i>");
		output("\n\nYou " + (pc.isMischievous() ? "shrug noncommittally. Maybe it was, maybe it wasn’t." : "admit that it was, yes.") + " Siefyn nods slowly. <i>“Well, she’s locked herself in her palace now. Says she doesn’t want anything else to do with off-worlders. I can see why, but... we need the trade. I don’t want to be the one with sticks and stones when the myr have magic guns from space.”</i>");
		output("\n\n<i>“So Taivra doesn’t want you trading with us now?”</i>");
		output("\n\n<i>“No, but...”</i> Siefyn chuckles, flicking back a stray lock of hair. <i>“You’re way too valuable to turn away.”</i>");
		output("\n\nUh-huh. You’re sure that’s what she says to all the star-walkers...");
		output("\n\nSiefyn sighs wistfully and rests her chin on her hands. <i>“Anyway... something else I can help you with, [pc.name]?”</i>");
	}
	//[Next]
	processTime(5);
	seifynTalkMenu(leaderShipDeadTaivraConvo);
}

//Probe Reclamation
//When PC first makes it to the DMZ airstrip after the dungeon. Find out Shade’s your half-sister if she’s still your friend.
public function probeReclamationShit():void
{
	clearOutput();
	showName("STEELE\nTECH");
	author("Savin");
	
	// (N.B. This is an alteration to the probe reclamation shit scene, mostly just some ifs to reflect the doghouse you’re in and the fact that the probe needs to be returned.)
	if(flags["TAIVRA_NEW_THRONE"] == 0) output("Rather eager to return to Taivra with the marvel of new technology you ordered, you start crossing the tarmac at a quick pace, eager to see her reaction to it.");
	else output("With your victory over the nyrea - and your cousin - fresh on your mind, you start crossing the tarmac with a relative skip in your step, eager to see what the next leg of your voyage has in store for you.");
	
	output("\n\nYou pause, though, when you see a Steele Tech freighter parked on the airfield beside your own vessel. Its cargo doors are down, and a pair of crewmen in the familiar black and yellow company jumpsuit are inspecting a familiar glossy-black hunk of space junk: your Dad’s probe! The company made good time in retrieving it, no doubt about it. You walk over and give the two burly men a wave, and head over to check in with them.");
	output("\n\n<i>“Ah, " + pc.mf("Mr.","Ms.") + " Steele,”</i> one of the pilots says with a grin, tipping his cap to you. <i>“Good work finding this old bird. The techs back at headquarters will have her shooting through the stars again in no time. Probably rewire her as an explorer or comm relay, I reckon.”</i>");
	output("\n\nThat’s good to hear. If there’s one thing that makes Steele Tech great, its that the company never lets anything go to waste. The company pilots chuckle when you mention it, and one jokes that he’s fairly certain ");
	if(9999 == 9999) output("that starship next to theirs must be old Tricky Vic’s original");
	else output("that old Tricky Vic’s original is still flying out there, somewhere");
	output(". You just grin.");
	
	output("\n\n<i>“Alright, " + pc.mf("Mr.","Ms.") + " Steele,”</i> one of them says, taking out a Codex just like yours. <i>“There’s an outstanding bounty on these old probes, as you know. Let’s get you paid up, huh?”</i>");
	output("\n\nA moment later and your own device beeps happily, alerting you to a new deposit of <b>20,000 credits</b> into your bank account. Score!");

	// <insert tech scene here, picking up after the line ‘as you know’>
	if(flags["TAIVRA_NEW_THRONE"] == 0)
	{
		output("\n\n<i>“No idea why you wanted this other one, but with the alterations to it and the value of the case still, looks like it’ll all wash out.”</i> He gestures to an identical probe being wheeled out of their vessel, one that has the expensive scanning tech removed and some expensive comfortability baked in.");
		output("\n\nYou thank the pair for their work and turn to start hauling the remodeled piece of throne down to the deep caves.");
		
		flags["TAIVRA_NEW_THRONE"] = 1;
	}
	else
	{
		output("\n\nYou thank the pair and turn to leave.");
	}
	
	pc.credits += 20000;
	processTime(4);
	flags["MYRELLION_PROBE_CASH_GOT"] = 1;
	
	clearMenu();
	// if Shade is still on-planet and not pissed/your enemy, continue. Else, [Next] to map
	if(shadeAtTheBar()) addButton(0,"Next",shadeHalfSisterShit);
	else addButton(0,"Next",myrellionProbeEnd);
}
public function myrellionProbeEnd():void
{
	if(flags["TAIVRA_NEW_THRONE"] == 1)
	{
		// (N.B. I think that all that’s needed here afterward is an if-branch to relocate you back to Taivra’s palace no matter how the kara/non-kara scene plays out.)
		if(flags["DEEP_CAVES_TAXI_UNLOCKED"] != undefined) processTime(120 + rand(31));
		else processTime(330 + rand(31));
		currentLocation = "2G17";
	}
	mainGameMenu();
}

//Unlock Uveto on GalMap, if it wasn’t already.
public function shadeHalfSisterShit():void
{
	// KQ2 variant
	if(flags["KQ2_QUEST_FINISHED"] != undefined)
	{
		KQ2shadeHalfSisterOhNoes();
		return;
	}
	
	clearOutput();
	showShade();
	author("Savin");
	output("...and just save yourself from face-planting into a familiar pair of breasts barely held back by a ballistic vest.");
	output("\n\n<i>“Woah, easy there,”</i> Shade laughs, giving you a gentle push out of her personal space. <i>“Going somewhere, kid?”</i>");
	output("\n\nYou laugh off the near-collision and say that you just found one of your dad’s probes, loaded with the coordinates you need for the next leg of your quest.");
	output("\n\n<i>“Well, good for you,”</i> she smiles with a playful punch on your shoulder. <i>“Guess that means you’re done with this war-torn shithole of a planet, huh?”</i>");
	output("\n\n<i>“It’s not that bad,”</i> you riposte, smiling at the amazonian cat-girl. <i>“It’s got some good people on it.”</i>");
	output("\n\nShe rolls her eyes at the obvious flirtation, but her arms settle under her impressive bust, subtly emphasizing the way her button-up shirt strains around it. <i>“Yeah, well, looks like I’m off, too. ");
	//Helped capture Shade
	if(flags["KARA_DEFEATED_WITH_SHADE"] == 1) output("Now that I’ve nailed that blue-haired bounty of mine, there’s not much reason to stick around. Turns out the locals don’t want off-world hunters rounding up military deserters like I’d thought.");
	else output("I just can’t find that stupid blue-haired bombshell I’m supposed to be tracking. Lost track of how long I’ve been looking for her, now... Guess I’ll phone it in.");
	output(" I think I’ve earned some R&R after all this time, maybe I’ll head back home for a couple weeks.”</i>");

	output("\n\n<i>“Home?”</i>");

	output("\n\n<i>“Uveto VII. I’ve got a house there, a little place in Irestead I managed to buy. I sort of fell in love with the planet the first time I was there, decided to put down roots... at least as much as somebody in my line of work can. ");
	//if Lovers: 
	if(flags["SEXED_SHADE"] != undefined) output("You should drop by sometime. I’ll show you around, make you dinner... maybe give you a few reasons to stay a while.");
	//elseif Fought Kara:
	else if(flags["KARA_DEFEATED_WITH_SHADE"] == 1) output("You’ve got skills, you know, [pc.name]. You should swing by sometime. I could show you a few things, get you some training at the Stormguard temple. You could be a real badass hunter if you put your mind to it.");
	else output("If you’re ever on-planet, look me up. I’ll buy you a drink.");
	output(" My daughter, Astra, lives there, too. I’ll introduce you: something tells me you’d get along." + pc.mf("","You remind me of her quite a bit"));
	output("”</i>");

	output("\n\nAs she’s speaking, Shade leans aside onto the Steele Tech probe, giving the pair of pilots a respectful nod. They start to return the gesture, right up until the probe bleeps and its screens start glowing.");

	output("\n\n<i>“Uh...”</i> Shade gulps, staring at the probe. <i>“Did I do something?”</i>");
	output("\n\nOne of the Steele Tech pilots jogs over, pulling his Codex back out. <i>“Hey, weren’t these things only supposed to turn on for you, " + pc.mf("Mr.","Ms.") + " Steele?”</i>");

	output("\n\n<i>“Yeah,”</i> you admit. <i>“Me or anybody with enough of my Dad’s DNA.”</i>");

	output("\n\n<i>“Oh, shit,”</i> Shade says, forcing a chuckle. <i>“That’s a hell of a bug.");
	if(pc.raceShort() == "kaithrit") output(" What, does it think I’m your mom or something?");
	else output(" What, does it think I’m your long-lost sister or something?");
	output("”</i>");

	output("\n\nThe company pilot punches a few buttons on his Codex and waves its scanner over the banged-up old probe, mumbling about that specific model of probe and software hiccups. After a moment, though, he scratches his stubbly chin and furrows his brow. You and Shade both look at him expectantly, but rather than assuring you it’s just some random bug in the century-old probe, he pushes another button and turns the scanner towards Shade.");

	output("\n\n<i>“Hey,”</i> Shade scowls. <i>“What gives?”</i>");

	output("\n\nYou feel a knot forming in your gut as the pilot’s Codex beeps at him, its screen flashing in his face.");
	if(flags["SEXED_SHADE"] != undefined) output(" Gulping, you reach over and take your lover’s hand, assuring her it’s probably just a bug... right?");

	output("\n\nAfter a couple more moments, the pilot makes a perplexed grunt and flips the Codex over and hands it to you screen-down. That alone is enough to make you worry - what the hell is going on? You take a peek at the Codex’s screen, where you see a bio-scanner readout showing your ");
	if(flags["SEXED_SHADE"] == undefined) output("kaithrit friend");
	else output("lover");
	output(" and all sorts of privacy-invading data: her age, blood type, a racial blurb about kaithrit... and a DNA analysis. Several computer-generated pinpoints cover the analysis, comparing several points on hers to your father’s - and yours. A red data readout in the corner gives what, to your untrained mind, is a meaningless series of compatibility notes summarized in big, bold capitals: <b>Chance of Close Relation: 98.356%</b>. Uh-oh...");

	output("\n\nYou curse your randy father under your breath, suddenly realizing what’s happened");
	if(flags["SEXED_SHADE"] != undefined) output("... and what you’ve done");
	output(". Why the hell couldn’t he have left a list of all his bastards somewhere!?");
	//if talked about her history:
	if(flags["SHADE_TALKED_ABOUT_FAMILY"] == 1) output(" Then again, maybe you should have seen this coming. She did say her father was a wealthy, mystery playboy. Even if she’s a full kaithrit, your dad never spent long as any one race. He could easily have been a cat-boy forty years ago or so, well before he started to get sick...");
	output("\n\nWith a sigh, you look between the revelatory Codex screen and Shade, sitting against the side of the probe with a hint of concern betrayed on her face. What do you say?");
	processTime(14);
	//[Reveal] [Hide]
	clearMenu();
	if(flags["SEXED_SHADE"] != undefined) addButton(0,"Reveal",revealShadesDad,undefined,"Reveal","Tell Shade the truth. She was able to activate the probe because, like you and [rival.name], she carries your father’s genes. More importantly, though, the two of you have been unknowingly incestuous.");
	else addButton(0,"Reveal",revealShadesDad,undefined,"Reveal","Tell Shade the truth. She was able to activate the probe because, like you and [rival.name], she carries your father’s genes.")
	if(flags["SEXED_SHADE"] != undefined) addButton(1,"Hide",hideShadesRelation,undefined,"Hide","Don’t tell Shade what your employee’s uncovered. No need to rock the cat-girl’s boat like that. Especially if you want to keep your affair with your new-found sister going.");
	else addButton(1,"Hide",hideShadesRelation,undefined,"Hide","Don’t tell Shade what your employee’s uncovered. No need to rock the cat-girl’s boat like that.");
}

//Reveal
//Tell Shade the truth. She was able to activate the probe because, like you and [rival.name], she carries your father’s genes. {if fucked: More importantly, though, the two of you have been unknowingly incestuous.}
//Small +Kindness. Remove Shade from Myrellion.
public function revealShadesDad():void
{
	clearOutput();
	showShade();
	author("Savin");
	output("You take a breath to steel yourself, and hand the Codex to Shade with all the relevant data on full display. She takes it warily, golden eyes scanning across the screen. The corners of her mouth twitch as she reads it, and looks up at you over the top of the screen.");
	//if Lover!Shade:
	if(flags["SEXED_SHADE"] != undefined) 
	{
		output("\n\n<i>“Oh... shit,”</i> she breathes, staring at you with wide eyes. <i>“Is this for real, [pc.name]?”</i>");
		output("\n\nYou nod slowly. It’s hard to know what to say in a situation like this");
		if(pc.isMischievous())
		{
			output("... other than <i>“Hey, sis, nice to meet you!”</i>\n\nWhich doesn’t earn you anything but a");
			if(flags["KQ2_QUEST_FINISHED"] != undefined) output(" fearsome");
			output(" scowl");
		}
		output(". Shade curses, setting the tablet down on top of the beeping probe. Her gaze drifts from you, and her fingers start to drum on the top of the probe. You try to ask if she’s alright, but when you approach with a comforting hand outstretched, Shade recoils onto her feet and turns away, her coat billowing back behind her.");
		output("\n\n<i>“I, uh, I need to go,”</i> she says hastily, striding off at just short of a run. You take a step to follow her, but the perplexed pilot puts a hand on your shoulder to stop you.");
		output("\n\nYou sigh, and let her go. You’re freaking out more than a little bit yourself... what a fucked-up little family your Dad’s left you!");
		output("\n\nA few moments later, as you’re getting ready to return to your vessel and have said farewell to the crew of the Steele Tech salvage ship, you turn back towards the tarmac just in time to see Shade’s ship launch out of one of the hangars, burning its engines hard as it hurtles into the sky. You sigh: perhaps you should give her some space... then again, she did mention where she was going: her home world of Uveto. If you want to talk things over, that’s where you need to go.");
		
		//[Next]
	}
	//Else:
	else
	{
		output("\n\n<i>“What the... what the fuck?”</i> Shade breathes, staring at you with wide eyes. <i>“Is this thing for real, kid?”</i>");
		output("\n\nYou nod. <i>“The Codex is loaded with the best bio-scanners in the galaxy. It looks like we’re...”</i>");
		output("\n\nShe rolls her eyes and laughs, cutting you off with an almost maniacal cackle. <i>“Of course. Fuckin’ of course we are, why not? After all, my mom always said my father was some big-shot rich playboy. I just never figured... well, I’d have thought he’d have been a kaithrit, at least.”</i>");
		output("\n\nYou shrug, explaining that your Dad had a knack for transforming into different species");
		if(pc.race() != pc.originalRace) output(", much like yourself");
		output(". He spent time as almost every race and sex at some point, you suppose he must have been a kaithrit at some point.");

		output("\n\nShade shakes her head and laughs again. <i>“When I met you, I thought, ‘no way [pc.heShe]’s THAT Steele... no way I just met a space trillionaire. And now you’re my " + pc.mf("brother","sister") + ", is that it? Shit.");
		//if PC defeated Kara:
		if(flags["KARA_DEFEATED_WITH_SHADE"] == 1) output(" Well, I should have know. I guess fighting skill must run in the family, huh?”</i> she grins. <i>“You and your... our... dad are adventurers, and I’m a bounty hunter.”</i>");
		else output(" Hey, at least I wasn’t drunk enough to try and fuck you back in the bar. Can’t say I didn’t think about it... how gross would that have been?”</i> she says with a nervous chuckle, running a hand through her silver hair.");

		output("\n\nIt’s a shame she never got a chance to meet her father, but after all you’ve been through with your cousin, you have to admit it’s nice to find a Steele that doesn’t want to fuck you out of your fortune. Of course, the moment you think it, a pang of paranoid flits through you. Shade wouldn’t...");
		output("\n\n<i>“Don’t worry,”</i> she laughs when you start to ask her. <i>“I don’t want your damn money, junior. Have you seen my ship? I do pretty well for myself on my own, and I prefer it that way. Wouldn’t have much use for a CEO spot on some mega-corp’s board. Too much responsibility. I prefer the free-wheeling hunter’s life myself, but good luck finding the rest of your probes. I’m sure... I’m sure our father wanted you to have it. Otherwise he would have at least introduced himself at some point, right?”</i>");
		output("\n\nShe almost seems sad when she says it, prompting you to reach out and put a hand on her shoulder. She flashes you a smile, and her green tail rubs at your [pc.leg]. The pair of Steele Tech pilots haul the probe up and into the hold of your ship, giving you a respectful nod as they retreat into their starship. You and Shade are left standing on the tarmac, you arm still wrapped on her shoulder.");
		output("\n\n<i>“I think I’m going to need a little time to parse this,”</i> she admits a few moments later, sighing and stepping out of your grasp. <i>“I’m glad you told me, though. This is... I never thought I’d know who my father was. I always wondered, though. And wondered if I had any siblings out there, somewhere. It’s nice to know.");
		if(flags["KARA_DEFEATED_WITH_SHADE"] == 1) output(" Especially that my " + pc.mf("brother","sister") + " is such a badass!");
		output("”</i>");

		output("\n\nShe gives you a smile and stuffs her hands into her coat pocket, starting to walk towards the hangar. <i>“I’m gonna... gonna take some time. Get my head around this on the way back home. Come by some time, I’ll... I’ll make you dinner. We can get to know each other a little better. You can tell me about my father, maybe.”</i>");

		output("\n\nYou tell her that you’d like that. Hopefully you’ll see her again soon.");
		output("\n\nShe waves as she walks, disappearing into the crowd of myr bustling about. Not long after, you see a huge, purple starship taking off from one of the hangars, blasting off into orbit. You shield your eyes from the brilliant burn of the engines and wave, sending her off on her homeward journey.");
		output("\n\nAnd you’ve got places to be, too. Time to track [rival.name] down.");
	}
	flags["UVETO_UNLOCKED"] = 1;
	//[Next]
	flags["TOLD_SHADE_SHES_YER_SIS"] = 1;
	flags["SHADE_ON_UVETO"] = 1;
	processTime(16);
	pc.addNice(2);
	clearMenu();
	addButton(0,"Next",myrellionProbeEnd);
}

//Hide
//Don’t tell Shade what your employee’s uncovered. No need to rock the cat-girl’s boat like that. {Especially if you want to keep your affair with your new-found sister going.}
//+Small Misch. bonus. Remove Shade from Myrellion.
public function hideShadesRelation():void
{
	clearOutput();
	showShade();
	author("Savin");
	output("You make a few over-acted <i>“hmm”</i>s and <i>“aahh”</i>s, staring at the screen with furrowed brows. After a few moments, you make a grand shrug and hand the Codex back to its owner, telling him to take the probe aboard his ship.");
	output("\n\n<i>“So...?”</i> Shade asks, hopping off the old black probe as the pilots start pushing it on its hover-platform and into the cargo hold of their ship. Her gaze turns suspiciously towards you.");
	output("\n\nYou flash her a disarming smile. <i>“Like I figured, the probe’s just old and bugged out,”</i> you lie. <i>“Couldn’t tell my DNA from a nyrea’s. We’ll get it fixed up before sending it back out.”</i>");
	output("\n\nShe nods slowly. You’re not sure if your ruse is working, but thankfully the cat-girl doesn’t challenge your story. Instead, she shoves her hands into her duster’s pockets and laughs. <i>“Well, that’s why I don’t buy much from Steele Tech. No offense.”</i>");
	output("\n\n<i>“None taken,”</i> you say, trying not to sigh with");
	if(flags["KQ2_QUEST_FINISHED"] != undefined) output(" overwhelming");
	output(" relief.");
	if(flags["KQ2_QUEST_FINISHED"] != undefined) output("\n\nShade nods at you and turns towards the northern tarmac. <i>“Alright, I’m out of here, [pc.name]. Maybe after I get settled back in, we’ll talk. Good luck with your probe, kiddo.”</i>");
	else output("\n\nShade winks at you and turns towards the northern tarmac. <i>“Alright, I’m out of here, [pc.name]. My offer stands, if you’re ever on Uveto. I’m heading back now, I guess. Good luck with your probe, kiddo.”</i>");
	output("\n\nShe waves over her shoulder, and her cunt-like tail winks its pink slit alluringly as she walks.");
	output("\n\nYou watch her go, until she’s lost in the crowd of myr on the tarmac. After that, you let go of a long-held breath and wipe your brow. You’re not sure if Shade believed you, but for now, you’ve got other things to worry about: there’s a new leg of your journey ahead of you!");
	flags["UVETO_UNLOCKED"] = 1;
	flags["TOLD_SHADE_SHES_YER_SIS"] = -1;
	flags["SHADE_ON_UVETO"] = 1;
	pc.addMischievous(2);
	processTime(7);
	clearMenu();
	addButton(0,"Next",myrellionProbeEnd);
}

//Dungeon Followup: Kingshit Nyrea
//Return to the Palace
//Play the first time the PC enters the dungeon after 12 hours have passed. Gains the Nyrean Monarch perk (aka KingNyrea).
public function nyreaKingReturnGreeting():void
{
	clearOutput();
	author("Savin");
	showPraetorians();
	showName("ROYAL\nSPOILS");
	output("As you make your way back into the nyrean palace, you see several of Taivra’s praetorian soldiers stepping out of their guardpost, all carrying their barbed longspears with crimson capes fluttering behind them. For a moment, you’re afraid that the queen’s intending to go back on her word - that her soldiers mean to challenge you again - until the group of soldiers slip onto their knees before you, bowing low.");
	output("\n\n<i>“Queen Taivra sent word of your agreement throughout her domain,”</i> their leader says. <i>“All her subjects know to treat you as if you were the queen herself. We are at your service, my " + pc.mf("lord","lady") + ".”</i>");

	output("\n\nNow that’s more like it. Certainly a step up from your first meeting with these soldiers... though you don’t recognize any from before. Clearly Taivra was none too pleased with their performance. You command the new gate guards to rise, and direct you to their mistress. You’re told you can find the queen in her throne room, and that she’ll no doubt be expecting you. Hopefully, now that things have calmed down after your cousin’s escape, you’ll have the chance to take advantage of your new privileges...");
	kGAMECLASS.output("\n\n(<b>Perk Gained: Nyrean Royal</b> - Reduces hostile nyrea attacks and deal increased tease damage to them!)");
	pc.createPerk("Nyrean Royal",0,0,0,0,"Reduces hostile nyrea attacks and deal increased tease damage to them!");
	flags["NYREAN_SPOILS"] = GetGameTimestamp();
	variableRoomUpdateCheck();
	generateMapForLocation(currentLocation);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Nyrean Monarch
//Grants a 10% tease bonus against enemy nyrea, and reduces the chance of finding hostile nyrea.

//Get Royal Spoils
//Play when PC enters the palace after first return trip. Up to 1/week. Gibs credits, based on level. Not a huge resource, but it’ll pay off for not being a violent prick all the time! Maybe 100/Level?
//Stockpiles weekly gains until PC picks them up.
public function getRoyalSpoils():void
{
	showBust("PRAETORIAN");
	showName("ROYAL\nSPOILS");
	author("Savin");
	output("\n\n<i>“Ah, my " + pc.mf("lord","lady") + ",”</i> a voice says as you enter the palace proper. You turn and see the captain of the gate guard jogging towards you. She gives you a respectful nod and produces a small pouch from her belt. <i>“Queen Taivra asked us to give you this when you arrived. Our mines and traders have been working tirelessly since your last visit. Prosperity reigns throughout the queenship, and we’re only expanding. Taivra has, of course, set aside some of our growing wealth for her mate.”</i>");
	output("\n\nYou take the pouch, and find several small green crystals jostling around inside. This will certainly fetch a tidy profit somewhere - maybe even in your little village down the tunnel. Smiling at the guard-captain, you pocket your royal gains. It’s good to be the " + pc.mf("king","queen") + "!");
	output("\n\n");
	
	processTime(5);
	flags["NYREAN_SPOILS"] = GetGameTimestamp();
	
	//PC gets a satchel of gemstones worth whatever, same item descript as the one found in Taivra’s chambers. [Next] into palace map.
	if(pc.inventory.length < pc.inventorySlots())
	{
		itemCollect([new GemSatchel()]);
		return;
	}
	
	var money:int = Math.min(10000, (pc.level * 100));
	output("(+" + money + " credits)");
	pc.credits += money;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Repeat Gloryhole Shenanigans
//Add [Use Gloryhole] to Queen Taivra’s chambers. PC can re-use the goo-girl gloryhole from before. No boss battle this time! :P
//Well, that’s what it’s there for, right? Stick your dick right into the gloryhole and treat yourself to your queenly mate’s favorite evening pastime.
public function useRepeatGloryhole():void
{
	clearOutput();
	showIncuGoo();
	author("Savin");
	output("Given your arrangement with Taivra, you figure you’re well within your rights to enjoy everything your subterranean palace has to offer. Especially the perfectly round, smooth stone gloryhole beside the royal bed, glistening with green goo. You slip off your [pc.gear] and approach the hole, grabbing your prick as you walk. You know the girl on the other side is thoroughly eager to do her duty behind the gloryhole, and you’re all too happy to enable it. With a few preparatory stokes, you bring your [pc.cock] up to full size and ");
	//if short: 
	if(pc.tallness < 60) output("grab the pillows off of the bed, giving yourself enough height to just barely get your wang into the head-height hole");
	//if normal size:
	else if(pc.tallness < 80) output("guide your schlong into the waiting hole");
	//f bigPC:
	else
	{
		output("slip down ");
		if(pc.isNaga()) output("into a serpentine coil");
		else if(pc.hasKnees()) output("onto your knees");
		else output("as low as you can go");
		output(" to align your prick with the hole, and slide on in");
	}
	output(".");

	output("\n\nThe stone is cold, but it’s smooth and wet, the remnants of what could be years of sexual excess and lube smeared across the tunnel. You only need to endure the rocky gloryhole for a moment, though, before your [pc.cock] slides into the green substance waiting on the other side. Whatever it is, it’s delightfully warm and stickily wet, just like ");
	if(celiseIsCrew()) output("fucking Celise");
	else output("sliding your tool into a bowl of heated-up yogurt");
	output(". The voice on the other side makes a delighted squeal, and you’re treated to a faint sucking sensation around your member, like the substance is drawing you in.");

	output("\n\n");
	//if not fought goo: 
	if(flags["CRYSTAL_GOO_DEFEAT"] == undefined) 
	{
		output("Is that a goo-girl on the other side? It has to be, you tell yourself");
		if(CodexManager.entryUnlocked("Ganrael")) output(" - probably a ganrael in the queen’s service");
	}
	else output("You smile as the familiar sensation of the ganrael broodmare’s gooey body surrounds you");
	output(". The way the semi-liquid slurps and squeezes, sucks and caresses your cockflesh is amazing, better than any mouth or sex toy could ever be. An irrepressible grin spreads across your face as you sink every inch of [pc.oneCock] into the gooey sheath on the other side of the hole, surrounding your manhood in a constant cavalcade of pleasures.");
	output("\n\n");
	//if not fucked before:
	if(flags["CRYSTAL_GOO_GLORYHOLED"] == undefined) 
	{
		output("<i>“Wow, this feels totally different!”</i> a voice on the other side giggles, quivering wonderfully around your dick. <i>“Did you, like, get a whole new cock? Just for me, right?”</i>");
		output("\n\nShe still thinks you’re somebody else - the queen, you suppose! You try not to laugh as the goo-girl squirms excitedly around your prick, exploring every inch of her <i>“queen”</i>’s new shaft.");
	}
	//elseif fucked before: 
	else
	{
		output("<i>“Oh, hi [pc.name]!”</i> the goo-girl squeals happily from the other side, her amorphous body exploring your prick as a means of identification. <i>“Mmm, just relax and let me take gooood care of you - Queen Taivra says I’ve gotta make sure you fertilize all of her precious little eggs floating around in here if you fuck me, so go ahead and blast me with spunk!”</i>");
	}
	output(" All you need to do is hang on, grabbing at the smooth stone walls to steady yourself as pleasure hammers through you");
	if(pc.legCount > 1) output(", making your [pc.legs] tremble");
	output(". Taivra is clearly leading the good life if she’s got every day access to treatment like this!");
	pc.cockChange();

	output("\n\nYour [pc.hips] start to move, thrusting into the gooey clocksleeve on the other side of the gloryhole. The green girl coos happily, making a series of lusty moans to the rhythm of your pumping thrusts. <i>“Oooh, you’re just treating me soooo right!”</i> she murmurs, barely audible over the wet squelches of her body slurping up your cockflesh. <i>“Mmm, yeah, gimme all that creamy cum...”</i>");

	output("\n\nThe way she’s handling you, that’s going to be damn soon! You grit your teeth and try and hold back as long as you can against her slimy caresses, but this gloryhole goo is a supremely talented cocksucker who’s using her whole body to pleasure your [pc.cock]. You’d love to get a look at her blissed-out face about now, but have to content yourself with listening to her sultry, wet sounds echoing through the little tunnel.");
	output("\n\nA few minutes of the goo-girl’s tender caresses later, and you’re ready to blow - and she knows it! <i>“Gonna fill me with [pc.cum] now?”</i> she coos excitedly, wiggling wetly all over your length. <i>“C’mon, I’m soooo ready for it!”</i>");
	output("\n\nWell, if she’s going to ask so nicely... you might as well give the squirming goo-girl what she wants! You grunt and dig your fingers into the stone wall, announcing your impending orgasm with a feral growl of pleasure. The goo squeals as the first spurt of your [pc.cum] squirts into her, ");
	if(pc.cumQ() < 50) output("leavig a little cloud of spooge billowing through her liquid-like body");
	else if(pc.cumQ() <= 1000) output("bloating her gooey body with a massive dose of [pc.cum]! She moans happily, jiggling up and down your shaft as you pump her full of cum. A normal girl would be drooling your spunk out around your cock, but a goo... she just drinks it all up!");
	//if hugecum: 
	else output("and again and again until the goo must be absolutely bloated with spooge - and you keep on going! She yelps and squirms around as you pump her with cum, enough to have made a normal girl look pregnant; as a goo, though, you imagine she’s just swelling up with all the extra fluid!");

	output("\n\nWith a heavy sigh, you step back from the gloryhole and drag your [pc.cock] out from the goo-girl’s insides in a wet, musky mess of goop and cum. <i>“Thanks for that, ");

	if(flags["CRYSTAL_GOO_GLORYHOLED"] == undefined) output("Taivra");
	else output("[pc.name]");
	output("!”</i> the girl calls out from inside her compartment, making series of wet squelches as she adjusts to the extra fluid floating inside her. <i>“Mmm, I love the taste of your ");
	if(flags["CRYSTAL_GOO_GLORYHOLED"] == undefined) output("new ");
	output("cum! Gimme some more, like, real soon, okay?”</i>");
	
	// First time!
	if(flags["CRYSTAL_GOO_GLORYHOLED"] == undefined)
	{
		output(" There is a slight pause, and then an emerald blob peeks out from the hole, forming itself into a human-like head with big elfin ears and an expression of intense suspicion.");
		output("\n\n<i>“Heyyy... you’re not the queen!”</i> she yelps, her purple eyes glaring at you. <i>“Nobody’s allowed to use the queen’s goo but Taivra!”</i>");
		output("\n\nHer gooey mass attempts to make its way toward you as you try your best to explain. Suddenly she freezes before completely grabbing your [pc.foot]. Taivra is standing behind you in a commanding stance.");
		output("\n\n<i>“My, my. It seems I have forgotten to introduce you to my pet,”</i> the queen says. Kneeling down, she gives the goo girl a pat. <i>“This is Beryl, my personal incubator - she tends to be a bit overprotective of my eggs, but I wouldn’t want it any other way...”</i>");
		output("\n\nHer loyal “pet” responds with a bubbly smile.");
		output("\n\n<i>“And this,”</i> Taivra directs the goo’s attention to you, <i>“is [pc.fullName], the new Nyrean Royal of the palace. [pc.HeShe] is allowed full access to my chambers, </i>including<i> my little pets.”</i> Looking at your slime-slicked cock, the queen smiles. <i>“Although it seems like you two were getting along just fine earlier.”</i>");
		output("\n\n<i>“Ohhh, okay! I’m sorry if I, like, scared you and stuff, [pc.name]!”</i> Beryl apologizes.");
		output("\n\nYou accept her apology, nodding with whatever energy you have left in you. Beryl then disappears into her home behind the gloryhole, lightly giggling as she goes.");
		output("\n\n<i>“Here,”</i> Taivra tosses you a towel from her royal drawer, <i>“Feel free to use my bed to rest in. I’ve trained her all too well so I know it will be wise thing to do.”</i>");
		output("\n\nAs she leaves the room, you follow her advice by drying yourself off and crawling into her big, soft bed to bask in the afterglow for a while...");
	}
	else output("\n\nYou’re sure you will. For now, though, there’s a big, soft bed calling your name. You dry yourself off and crawl in, content to bask in the afterglow for a while...");
	
	//[Next] //Pass ~1 hour
	processTime(60);
	pc.orgasm();
	IncrementFlag("CRYSTAL_GOO_GLORYHOLED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Fertilization stuff. Use for sorting Taivra pregger setup?
public function taivraFertilize():void
{
	if(pc.virility() <= 0) return;
	
	flags["TAIVRA_FERTILE"] = GetGameTimestamp();
}
public function taivraHasFertileEggs():Boolean
{
	//Did PC fertilize her?
	if(flags["TAIVRA_FERTILE"] > 0) return true;
	//Otherwise fertile 1/4 hours.
	else if(hours % 4 == 0) return true;
	return false;
}

//Queen Taivra Repeat Scenes
//Unlock after ~12 hours post-dungeon. Taivra is found in her throne room, naturally.
public function taivraRepeatScenes():void
{
	clearOutput();
	showTaivra();
	author("Savin");
	if(flags["TAIVRA_FERTILE"] == undefined) flags["TAIVRA_FERTILE"] = 0;
	//Some of Taivra’s sexytimes revolve around her having fertile eggs or not. If Steele’s cock-fucked her within the last 24 hours, she does; else, she has a 25% chance of having fertilized eggs. Non-fertile eggs implanted in the PC dissolve like normal, fertile ones go through Renvra’s pregnancy again.
	//Greeting Taivra
	output("You approach Taivra, stepping up onto the dias of her throne and between the tangle of limbs surrounding her. The dozen betas writhing around her moan softly, some reaching out to brush your [pc.legOrLegs] or thrusting their bare chests out at you, trying to entice you to join them. Taivra tsks her tongue at the rowdy bunch, and the mass of tentacle cocks thrusting into their ovipositors move a little bit faster, surrounding you in the wet, sultry sounds of sex.");

	output("\n\nTurning your attention back to the queen, you find her relaxed on her throne, smiling amicably at you with those dark purple lips of hers. <i>“Ah, [pc.name]. Anything I can do for you, my mate?”</i>");
	//Respect 41-70: [pc.name]! Come here,”</i> she says warmly, setting her spear aside and beckoning you closer. When you approach, she reaches up from her throne to brush a hand across your cheek. <i>“Is there something you desire, my mate?”</i> //Respect 71+: <i>“Welcome back, my love,”</i> she purrs, beckoning you closer. When you slip up beside her, Taivra reaches up from her throne to cup your cheek and pull you down into a passionate kiss. <i>“Care to sit with me a while, or was there something you desired?”</i>
	
	if(rand(10) == 0) taivraMidConvoEvents();
	processTime(2);
	
	taivraRepeatMenu();
}
public function taivraRepeatMenu():void
{
	//[Talk] [Chambers] [Throne Sex] [Appearance]
	clearMenu();
	if(pc.lust() >= 33) addButton(0,"Chambers",goToTaivrasChambersForSex,undefined,"Chambers","Ask Taivra if the two of you can retire to her chambers - a bit more intimate of a setting. (This means sex!)");
	else addDisabledButton(0,"Chambers","Chambers","You’re not really interested in a bedroom romp at the moment.");
	if(pc.lust() >= 33) addButton(1,"Throne Sex",taivraThroneSex,undefined,"Throne Sex","Don’t bother with privacy or modesty: join Taivra’s group of betas on her throne and enjoy the pleasure the queen can offer.");
	else addDisabledButton(1,"Throne Sex","Throne Sex","You’re not turned on enough for this.");
	addButton(2,"Appearance",queenTaivraAppearance,undefined,"Appearance","Take a gander at the queen.");
	
	// (N.B: Maybe this could take place after a certain amount of time or number of scenes with your new waifu? Makes sense that you’d notice any discomfort she might have after spending some time with her)
	// [Ask About the Throne]
	// Needs a few thousand credits -- maybe 5k?
	if(flags["KQ2_MYRELLION_STATE"] != 1 && !reclaimedProbeMyrellion() && flags["BEAT_TAIVRA_TIMESTAMP"] == undefined && flags["KING_NYREA"] != undefined)
	{
		if(flags["TAIVRA_THRONE_SEX"] >= 3)
		{
			if(pc.credits >= 5000) addButton(6,"Throne?",queenTaivraAskThrone,undefined,"Ask About the Throne","Try to reclaim the queen’s throne--or your father’s data probe to be more accurate. This will cost you 5000 credits.");
			else addDisabledButton(6,"Throne?","Ask About the Throne","Try to reclaim the queen’s throne--or your father’s data probe to be more accurate. You will need 5000 credits for this!");
		}
		else addDisabledButton(6,"Throne?","Ask About the Throne","Perhaps you should sex her on her throne a few times before trying to ask her about it.");
	}
	
	addButton(14,"Leave",mainGameMenu);
}

//Mid-Convo Events
//Play randomly when going back to Taivra’s menu. Only a 10% chance to play anything special at all.
public function taivraMidConvoEvents():void
{
	author("Savin");
	//Bust a Tentacle Nut (75%)
	if(rand(4) <= 2)
	{
		output("\n\nAs you’re talking with the queen, you notice her ever so slightly tense up. One of the sluts at her foot arches her back and desperately stifles a cry of pleasure, and you watch as a white paste burbles up from the X-shaped slit of her ovipositor. Taivra makes a slight, relieved sigh and draws her spent tentacle from her beta’s cockslit, letting the well-bred bitch stumble off in a leaking, moaning mess.");
		output("\n\nAnother beta is quickly marshalled in by one of the queen’s soldiers, and quickly finds herself squirming on the ground as the queen’s freshly-milked tentacle snakes its way down her egg-tube. Taivra flashes you a slight smile as she penetrates the beta, leaning back in her throne and crossing her legs.");
	}
	//Birth Announcement (20%)
	else if(rand(5) == 0)
	{
		output("\n\nAs you’re talking with Taivra, you hear a set of booted feet clattering in behind you. You cast a glance back, and see a young nyrean woman in Praetorian armor with a stone tablet tucked under her arm approaching. <i>“My queen. My " + pc.mf("lord","lady") + ",”</i> she says, bowing low to you and your mate. <i>“I’ve just gotten word from ");
		if(rand(3) == 0) output("the village");
		else if(rand(2) == 0) output("the harem chamber");
		else output("one of the guards");
		output(": a brood of royal eggs have just hatched. All healthy and nursing well.”</i>");

		output("\n\nTaivra smiles slightly. <i>“Ah, good. Let the bearer name them, as always. And send her a pouch of silver for their care.”</i>");
		output("\n\n<i>“Very good, m’lady,”</i> the herald says, bowing again and departing.");
		output("\n\nThe queen sighs and runs a hand along the bulge of her chain bikini bottom, as if to congratulate her ovipositor on another successful clutch out of so many you can barely imagine. <i>“My apologies, [pc.name]. Was there something else you wanted to say?”</i>");
	}
	//Battle Report (5%)
	else if(rand(100) <= 4)
	{
		output("\n\nAll of a sudden, you hear the clanking of armor on the stone floor behind you. You take a peek over your shoulder, in time to see ");
		if(flags["MET_CERRES"] == 1) output("Cerres");
		else output("Queensguard");
		output(" marching towards the throne.");

		output("\n\n<i>“Queen Taivra. [pc.name],”</i> she says, snapping a rigid salute. <i>“A band of scouts just returned from the eastern depths. They were ambushed by several ");
		if(rand(4) == 0) output("ganrael");
		else if(rand(3) == 0) output("nyrea from another village");
		else if(rand(2) == 0) output("wetraxxel warriors");
		else output("myr renegades");
		output(". Our scouts only took light casualties, but were forced to flee back to the city.”</i>");

		output("\n\nTaivra scowls. <i>“Again? Our enemies seem to be clawing at the gates more and more, [pc.name]. Queensguard, assemble a company of your best warriors and have the scouts retrace their steps. Find the enemy, and destroy them.”</i>");

		output("\n\n<i>“None shall escape my wrath,”</i> the knight promises, turning on a heel to leave.");

		output("\n\n<i>“And Cerres,”</i> Taivra says, stopping her favored warrioress in her tracks. <i>“Be careful.”</i>");
		output("\n\n<i>“I always am, my queen,”</i> she says firmly before stepping out of the throne room.");
		output("\n\nCurious, you ask Tiavra if attacks like that are common. She shakes her head sadly, rapping her fingers on the haft of her spear. <i>“More than I’d like, but... no. Most denizens of the deep are loners, not prone to working together like that. Few can challenge my soldiers.”</i>");
		output("\n\nThat’s good, you suppose.");
		output("\n\n<i>“We can talk tactics and military matters another time, my mate. In the meantime, did you have anything else to talk about?”</i>");
	}
}

//[Appearance]
//Take a gander at the queen.
public function queenTaivraAppearance():void
{
	clearOutput();
	showTaivra();
	author("Savin");
	output("Queen Tiavra is the archetypal specimen of a nyrean female: tall, strong, and voluptuous. She stands a hair shy of six feet tall, her body a mix of cream-pale skin untouched by the sun and black chitin plates that safeguard her limbs and chest like an underbust corset. Taivra has a long head of spiny black <i>“hair,”</i> tied into a braid down her back. Short bangs reveal a pair of dark near-black eyes that regard you with a mix of curiosity and amusement as the queen sees you staring. Her purple-painted lips curl into a faint smile, and she leans back in her throne in a way that emphasizes her ample E-cups bust beneath her chainmail bra.");
	output("\n\nA long, red cape drapes behind her from the leather shoulder pads she’s attached to the top of her chain armor, drawing your eyes down the queen’s supple body. Her broad, egg-bearing hips are clad in padded chainmail, just barely hiding the huge, pink ovipositor between her legs. When the queen pulls it out, her ovi-cock is easily two feet long and as thick around as a soda can; the slit is X-shaped, leading to a hollow shaft connected all the way to her womb full of eggs. The crown of her cock is surrounded by tiny, soft spines that make penetration excruciatingly pleasurable for any of her partners.");
	output("\n\nPerhaps her most distinctive feature, though, is the writhing mass of green tentacles growing from the base of her spine, just above her firm ass. She has twelve of them, each capped with a distinctly cock-shaped tip - and all of them are currently buried in the ovi-cock or ass of one of her beta huntresses, making sure the queen is constantly sexually sated.");
	output("\n\nBetween her tentacle-tails and her throbbing ovipositor, Taivra has a well-practiced ass built for taking eggs, right where it belongs.");
	clearMenu();
	addButton(0,"Next",taivraRepeatScenes);
}

// Taivra Married Throne/Probe Reclaimation, by Pancor
public function queenTaivraAskThrone():void
{
	clearOutput();
	showTaivra();
	author("Pancor");
	
	output("You lick your lips, hoping your wife won’t take this the wrong way before plunging forward like the intrepid star-explorer you are. Carefully, you ask about her throne, and more specifically how comfortable the hard surface is after a long day of breeding her harem.");
	output("\n\nThankfully, instead of getting angry, she just raises an eyebrow at you, not seeing where this is leading. <i>“It is fine, [pc.name]. It serves its purpose of looking suitably imposing, and I <b>am</b> the queen.”</i> She trails off, frowning slightly as she filters the implications of your statement through her mind. <i>“Why exactly do you ask, my mate?”</i>");
	output("\n\nSomething tells you that you should choose your next words with care. Even if you are married, you don’t doubt her ability to make your time down here very uncomfortable should you offend her martial pride.");
	output("\n\nVoice pitched low so the rest of the nyrea in the chambers don’t hear, you explain that you’ve noticed how there are times when she gets off her throne to retire to her chambers with you that she tends to walk stiffly. How you find sensitive spots on her back and rear that don’t correspond to having a good time. Your concern is purely for her health and comfort, like any good spouse would have.");
	output("\n\nShe seems to be mollified by your quick explanation, though you can tell that she’s not particularly fond of speaking of this here. <i>“You have a point, but what do you suggest we do about it? I am the strongest here, and showing that is important, even if most don’t realize it. The throne serves as a reminder of the bruises I left when I claimed them, to soften it is to soften my claim,”</i> she finishes, but the look of challenge in her eyes means that this might be a hard sell.");
	output("\n\nYou start off by reminding her of your partnership. How your power <b>is</b> her power, how altering and upgrading her throne serves not to diminish her image, but enhance it. You continue on in this vein for a bit, seeing her ire start to waver, before pulling out your codex and showing her how they can create furniture with upgrades for invisible cushions, heat, and targeted ultrasonic massage without even the slightest hint that they’re there.");
	output("\n\nShe rolls her eyes, fighting to conceal her interest in your technology. <i>“Well then. I suppose that it would only make sense for me to try and become familiar with the ‘marvelous’ advances you star-walkers have come up with, my mate. Don’t disappoint me, hmm?”</i>");
	output("\n\nYou agree and lean in to claim your wife’s lips in a kiss before she moves forward in her throne, summoning some of her soldiers to start disassembling it as you place the call in to SteeleTech to have a far more comfortable version made.");
	
	processTime(69);
	pc.lust(15);
	pc.credits -= 5000;
	
	flags["TAIVRA_NEW_THRONE"] = 0;
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
public function queenTaivrasNewThrone():void
{
	clearOutput();
	showTaivra();
	author("Pancor");
	
	output("Turning your attention back to the queen, you find her relaxed on her restored throne, smiling amicably at you with those dark purple lips of hers. <i>“Ah, [pc.name]! Come here,”</i> she says warmly, setting her spear aside and beckoning you closer. When you approach, she reaches up to pull you closer, where you can see she is currently enjoying the features of her new throne. <i>“I will admit, while I was reluctant at first, this proved to be a most excellent idea. Let me know if there is </i>anything<i> I can do to show my thanks.”</i>");
	
	processTime(4);
	pc.lust(5);
	
	flags["TAIVRA_NEW_THRONE"] = 2;
	
	taivraRepeatMenu();
}

//[Chambers]
//Ask Taivra if the two of you can retire to her chambers - a bit more intimate of a setting.
public function goToTaivrasChambersForSex():void
{
	clearOutput();
	author("Savin");
	currentLocation = "2C15";
	generateMapForLocation(currentLocation);
	showLocationName();
	showTaivra(true);
	output("With an alluring smile, you ask the nyrean queen if she’d care to retire to her chambers with you.");
	output("\n\nShe smiles and stands, taking a long-legged step towards you that pops her many tentacles out of her mewling betas. <i>“I’d like that very much,”</i> she purrs, wrapping a hand around your waist and pulling herself close. <i>“There’s not much requiring my attention at the moment, after all.”</i>");
	output("\n\nExcellent. You return Taivra’s gesture, putting your arm around her supple waist and letting your hand play across one of her thick, egg-bearing hips. You accompany her out of the throne room, up the stairs and through the slender corridor towards her chambers. A few soldiers and servants bow as you pass, pointedly not looking as your hand roughly grabs Taivra’s ass, and her tails wrap and rub at your [pc.leg] and [pc.butt].");
	output("\n\nBy the time you tumble into Tavira’s chambers, the two of you are tearing ");
	if(!pc.isNude()) output("each other’s");
	else output("Taivra’s");
	output(" clothes off, leaving your bodies bare and pressing against each other with burning lust. Her lips press against yours, pulling you towards her bed until you’re rolling onto the silken sheets, [pc.legOrLegs] wrapping around your lover. She comes out on top");
	if(pc.isAss()) output(" for now");
	output(", straddling you and cupping one of her big, firm breasts.");

	output("\n\n<i>“Tell me, what appeals to you offworlders?”</i> she purrs, grinding her hips against your crotch. Her words are a subtle affirmation that she’ll defer to you, letting you choose just how you’ll make love to your queenly lover...");
	processTime(7);
	
	queenTaivraSexMenu();
}
public function queenTaivraSexMenu(canLeave:Boolean = false):void
{
	clearMenu();
	//[Cowgirl] [Glory Fuck] [Tentacock Orgy] [Breed Her]
	addButton(0,"RideCowgirl",cowgirlWivTaivra,undefined,"Ride: Cowgirl","Roll Taivra over and mount her, riding her thick, throbbing ovipositor until she’s bloating you with eggs... or at least, with her sticky fem-cum.");
	
	if(pc.hasCock() && pc.cockThatFits(taivra.analCapacity()) >= 0) addButton(1,"Glory Fuck",gloryFuckTaivra,undefined,"Glory Fuck","Get Taivra to ram her cock into the gloryhole in her wall and fuck the jiggling goo inside while you slide your cock up the queen’s tight little behind.");
	else addDisabledButton(1,"Glory Fuck","Glory Fuck","You need a penis to access this scene.");
	
	if(pc.hasCock() && pc.cockThatFits(200) >= 0) addButton(2,"Breed Her",dockingBonerIntensifies,undefined,"Breed Her","Slide your cock into the queen’s ovipositor and flood her womb with your seed. The position might be a little awkward, but it’s worth it to make sure you have some royal offspring.");
	else addDisabledButton(2,"Breed Her","Breed Her","You need a dick that will fit inside her dick for this to work.");
	
	if(pc.hasHardLightEquipped()) addButton(3,"HL Anal",taivraHardlightFunzies,undefined,"Hardlight Anal","Use your hardlight-enabled underwear to pound Taivra’s asshole. Her cockvine ‘tails’ will be in striking range of <i>your</i> [pc.vagOrAss]!");
	else addDisabledButton(3,"HL Anal","Hardlight Anal","You need hardlight-enabled underwear for this.");
	
	if(canLeave) addButton(14,"Leave",taivraMorningEventLeave,undefined,"Leave","Ignore Taivra and take your leave.");
	else addDisabledButton(14,"Back","Back","There’s no way you’re getting out of here without satisfying your domineering partner at least once!");
}

//Cowgirl
//Roll Taivra over and mount her, riding her thick, throbbing ovipositor until she’s bloating you with eggs... {if all holes preggers: Or at least, with her sticky fem-cum.}
//vagOrAss scene
public function cowgirlWivTaivra():void
{
	clearOutput();
	showTaivra(true);
	author("Savin");
	var x:int;
	var isFull:Boolean = true;
	if (taivraHasFertileEggs()) {		
		x = pc.findEmptyPregnancySlot(Creature.PREGSLOT_VAG);
		if (x >= 0) isFull = false;
		else if (!pc.isPregnant(3)) {
			isFull = false;
			x = -1;
		}
	}
	if (isFull) {
		x = pc.cuntThatFits(chars["TAIVRA"].cockVolume(0));
		if (pc.hasVagina() && x < 0) x = pc.biggestVaginaIndex();
		else if (!pc.hasVagina()) x = -1;
	}
	output("You reach up and run your hands over Taivra’s big hips, purpose-built to pass the thick, smooth orbs of her eggs. You can just imagine the clutch already growing in the thoroughly-fertile nyrea’s womb, ready to be pumped into you. It’s hard not to wonder if Taivra’s been fertilized... and if you’ll be popping out some royal heirs before long.");
	output("\n\nExcited by the thought, you secure your hands on your lover’s waist and roll her over, putting the queen on her back and taking her place on top, straddling her breeder’s hips and reaching down to caress her horse-sized ovipositor.");
	output("\n\n<i>“Mmm, aggressive, aren’t we?”</i> your queen purrs, obviously not displeased. She smiles, caressing your [pc.hips]. <i>“I like that...”</i>");
	output("\n\n<i>“Good,”</i> you answer, leaning in and kissing her forcefully, thrusting your [pc.tongue] into the warrior woman’s mouth and jousting with her own. You feel her giggling under you, holding you close and kissing back, even as her many tails curl around your [pc.butt] and her hands play across your bare ass, her tongue twisting around and caressing your own. You grab one of her ample breasts, squeezing hard enough to make Taivra gasp and squirt a few droplets of her sweet milk around your fingers.");
	output("\n\nHer ovipositor is hot and throbbing against your thigh, demanding your attention. Rising up on your ");
	if(pc.hasKnees()) output("[pc.knees]");
	else output("[pc.legOrLegs]");
	output(", you grab Taivra’s thick alien dong and stroke it to full hardness as you align the flat head with your [pc.vagOrAss " + x + "]. The pressure against your hole is immense and instantaneous, her girth more like a horse’s than anything a girl her size should be packing! You start to press down, but Taivra’s hands stop you, firmly holding up your [pc.butt]. <i>“How about a little lube, first? I think things might be a little more pleasurable for us both that way...”</i>");
	output("\n\nYou give her a quick nod, and the queen reaches into her nightstand to retrieve a small vial of a familiar green goop - doubtless shed from her gloryhole goo-girl. Taivra drinks in a deep whiff of it before reaching down and smearing the vial’s contents onto the X-shaped slit of her huge dick. You smell it too: the sweetly musky, wet odor of goo that she slathers onto her prick and your thighs, all around your waiting hole.");
	output("\n\nWith a lusty smile, Taivra presses her cockhead against your [pc.vagOrAss " + x + "], letting the hefty glaze of goo on both your bodies ease her initial entry. A moan escapes your lips as you lower yourself down onto her royal rod, Taivra’s hips thrusting up to meet you in a moment of overwhelming pressure... and then echoing screams of pleasure as she pushes inside you. You’re hit with a sudden fullness, completely and totally stretching your [pc.vagOrAss " + x + "] around Taivra’s blunted cockhead. You can feel her spiny pleasure-nubs digging into your tender flesh, scraping along your inner walls until you’re screaming with ecstasy, rubbing your [pc.butt] on the queen’s thighs as moisture drools down onto her lap.");
	if(x >= 0) pc.cuntChange(x,chars["TAIVRA"].cockVolume(0));
	else pc.buttChange(chars["TAIVRA"].cockVolume(0));

	output("\n\nTaivra gives you a bestial growl of pleasure and reaches up to ");
	if(pc.biggestTitSize() >= 1) 
	{
		output("grab your [pc.breasts], roughly grabbing and squeezing your boobs");
		if(pc.canMilkSquirt()) output(" until [pc.milk] squirts from your teats");
		else output(" and nipples");
	}
	//if flatchest:
	else
	{
		output("pinch at your [pc.nipples]");
	}
	output(". Your lover pulls you close against her own chest, holding you deep on her throbbing, drooling ovi-cock. Her knot presses against your ");
	if(x >= 0) output("pussylips");
	else output("asscheeks");
	output(", hot and heavy against the entrance to your hole... but never trying to push in.");

	output("\n\nTaivra clearly doesn’t want you to just sit there and take a ");
	if(x >= 0) output("womb");
	else output("belly");
	output("-full of eggs, and so you start to move your [pc.hips]. With a moan of enjoyment, you slowly rise up, dragging Taivra’s spines back through your [pc.vagOrAss " + x + "], letting them tease and rub at your spasming, tender channel. You can feel her cock throbbing inside you, her heartbeat causing her shaft to grow and spurt its dark, viscous lube into your ");
	if(x >= 0) output("twat");
	else output("asshole");
	output(", adding her own juices to the mix of spit");
	if(x >= 0) output(" and your own pussyjuices");
	else if(pc.ass.wetness() >= 1) output(" and your unnaturally lubed ass");
	else output(" slathered in your behind");
	output(".");
	//if hole isn’t preggers:
	if((x == -1 && !pc.isPregnant(3)) || (x >= 0 && !pc.isPregnant(x))) output(" After a moment you realize that your queen’s cock is getting you ready to carry her eggs, packing your hole with as much of her sticky juice as she can!");

	output("\n\nYou give Taivra a wink over your shoulder and start to really bounce, determined to milk out every drop of her fem-cum before you reach your limit.");
	if(pc.hasCock()) output(" She returns your affection, wrapping her plated fingers around [pc.oneCock] and starting to stroke you off to the same rhythm as your rising hips.");
	output(" The more you ride her, the more Taivra’s cock throbs, and her tentacle-tails squirm around you, trying to worm their ways in after her ovipositor. But you’re both too focused on her cock, the way she’s so close to cumming already - and you’re not far behind.");

	//if hole isn’t preggers: 
	if((x == -1 && !pc.isPregnant(3)) || (x >= 0 && !pc.isPregnant(x))) 
	{
		output("\n\nTaivra’s head rolls back, bellowing a feral roar of pleasure as the crown of her ovipositor erupts in what feels like a geyser of wet head, following by a firm pressure straining your hole - an egg! Your eyes wide, lips curling in a silent scream as wet bumps pop into your ");
		if(x < 0) output("bowels");
		else output("womb");
		output(", one after the other. You feel incredibly full, hands wrapping around your [pc.belly] as the royal eggs flood inside you.");
		if(pc.hasCock()) output(" Between the sudden pressure of eggs stretching you out and the queen’s skillful handjob, you can’t help but cum! <i>“That’s it, join me!”</i> Taivra groans, stroking faster as the first jet of [pc.cumNoun] erupts onto Taivra’s belly and breasts, covering her in your seed. <i>“I want you to feel every bit of pleasure I do...”</i>");
		output("\n\nWhen the final egg settles inside you, you feel so bloated and worn out by the ordeal that it’s hard not to just fall asleep on the queen’s lap. She chuckles and wraps her arms around your swollen belly, giving you a surprisingly tender hug. <i>“");
		//if fertile eggs:
		if(taivraHasFertileEggs()) output("Take care of these for me, won’t you, love? Take them out to the stars, show them a world I’ll never see...");
		else output("Don’t worry, love, they’ll dissolve soon enough. Can’t have you waddling around with a belly full of empty eggs... at least, not without me there to enjoy it.");
		output("”</i>");
	}
	//if hole is already preggers:
	else
	{
		output("\n\nTaivra grunts and thrusts herself deep into you, gliding through your lube-glazed walls until her knot presses hard against your hole. You cry out as the queen hammers her hips up into your ass, ramming her thick bitch-breaker home into your [pc.vagOrAss " + x + "]. Your cries turn into a scream of ecstasy as you’re stretched to the limit, tied on Taivra’s throbbing mass of nyrean knot and left able to do nothing but rock on her lap, grinding the mass of flesh in your battered hole");
		if(pc.hasCock()) output(" until you cum, shooting a thick rope of spunk across the queen’s belly and the bottoms of her breasts, marking her with seed");
		output(". Your lover’s fem-cum floods into you, pumping your ");
		if(x < 0) output("gut");
		else output("womb");
		output(" with her creamy, hot fem-cum.");
		output("\n\nYou relax in Taivra’s lap after that, breathing hard as her thick ovipositor slowly deflates inside of you, dragging her spines through your [pc.vagOrAss " + x + "] one last time before you’re free - and drooling moisture out of your thoroughly-fucked hole.");
	}
	//9999 loadInAss/etc?
	//Hole aint preggers? KNOCK DAT UP~
	if((x == -1 && !pc.isPregnant(3)) || (x >= 0 && !pc.isPregnant(x))) 
	{
		// workaroundy thing I added for the goocubater
		if(taivraHasFertileEggs()) pc.createStatusEffect("Goo Gloryholed");
		//put load in orifice and knock up appropriately.
		if (x == -1) pc.loadInAss(taivra);
		else pc.loadInCunt(taivra, x);
		// Can remove it here, or the pregnancy will clean it up later too
		if (pc.hasStatusEffect("Goo Gloryholed")) pc.removeStatusEffect("Goo Gloryholed");
	}
	processTime(33);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",unifiedPostSexTaivraShits);
}

//Glory Fuck
//Get Taivra to ram her cock into the gloryhole in her wall and fuck the jiggling goo inside while you slide your cock up the queen’s tight little behind.
public function gloryFuckTaivra():void
{
	clearOutput();
	showTaivra(true);
	author("Savin");
	var x:int = pc.cockThatFits(chars["TAIVRA"].analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("Rather than taking your lover on the bed, you ask if she’d like to spice things up... and get a little use out of her gooey gloryhole. As you pose the question, you wrap your fingers around your [pc.cock " + x + "], starting to stroke yourself to the thought of shoving the haughty queen against the wall and railing her tight little ass.");
	output("\n\n<i>“You have quite the imagination,”</i> the queen purrs, right before you decide to say fuck it and grab her around the waist, hauling her up and staggering towards the wall. She giggles like a schoolgirl, wrapping her chitinous legs around your waist and her many tails rubbing against you. You grunt with the surprising weight of the warrior woman, hefting up across the chambers in your arms until her back slams against the smooth stone wall above her royal gloryhole. She moans, squeezing your whole body and leaning in to kiss you fiercely, running her hands along your back and her tongue across your own. You kiss back, shifting your grip on the queen to grab her tight ass, squeezing the fleshy cheeks and spreading them apart. She gasps, arching her back as one of your fingers teases around Taivra’s dark hole - just enough to give the queen a momentary thrill before you set her down and spin her around, pushing her face-first into the wall.");
	output("\n\n<i>“Like it rough, do you?”</i> Taivra teases, her tentacle-tails coiling around your [pc.hips] and pulling you flush against her out-thrust behind. It’s your turn to moan as the queen grinds her ass against your [pc.cock " + x + "], catching your shaft between her cheeks. She gives you a playful wink over her shoulder, and you see one of her hands disappear into the gaping gloryhole.");
	output("\n\n<i>“Eep!”</i> a girlish voice squeals from inside, followed by a squishing wet sound. Taivra’s hand returns covered in drooling viridian goo, and she reaches back to grab your [pc.cock], lubing you up with warm, greasy goo. A shiver of pleasure wracks you as Taivra strokes your shaft, making sure to slather every inch of your throbbing cockflesh in her gooey lube. You grin and return the favor, reaching around the queen’s powerful thighs to grasp her half-hard horse-like erection, roughly jerking it off and lifting its heavy weight up towards the smooth rim of the gloryhole.");
	output("\n\nNow the fun begins!");
	output("\n\nWith a thrust of your hips, you ram Taivra into the hole, and force the first inches of your cock into her eager hole. The queen groans, and the goo-girl through hole squeals as the royal scepter splashes into her body, thrusting in to the hilt as you let your weight push Taivra in. The queen moans and squirms, biting her lip to contain a cry as her clenching asshole is forced open by your [pc.cock " + x + "].");
	pc.cockChange();
	output("\n\n<i>“G-gentle,”</i> she manages to grunt, painted fingers scratching on the stone wall. <i>“I’m... I’m not used to this...”</i>");
	output("\n\nYou’re sure her betas tell her that all the time. Wonder if she listens, then...");

	output("\n\nStill, you ease up your assault, staying half-buried in the spasming anal hole you’re ravishing to let your queen adjust to you. Big, bad alpha that she is, Taivra must not be used to getting assfucked, and she’s tight enough to prove it. You have trouble getting the rest of your prick in, rocking your hips back and forth to ease yourself in nice and slow to let the lube do its job. While you do, Taivra moans and makes short, jerky little thrusts of her own into the goo-filled gloryhole. A delicious squishing sound echoes out from the hole, and the queen’s ass clenches wonderfully around your [pc.cock " + x + "] - she’s clearly starting to feel whatever’s going on on the other side of her chamber walls, and that only serves to make your slow fucking all the better.");
	output("\n\nWith a great deal of effort, you finally ");
	if(pc.cockVolume(x) <= chars["TAIVRA"].analCapacity()) 
	{
		output("hilt yourself in Taivra’s ass");
		if(pc.hasKnot(x)) output(", letting your growing knot press between her cheeks");
		output(".");
	}
	else output("have as much dick inside the queen as you can possibly imagine, so much so that her stomach is starting to visibly distend. Nyrea may be made for fucking, but even their greatest warrior can only take so much!");
	output(" Your lover’s belly is pressed flush with the stone, her whole body sandwiched between yours and the unyielding stone. Pistoning hips drive her crotch deep into the gloryhole, battering against her firm cheeks. As deep in as you are, your [pc.cock " + x + "] is enveloped in a spasming, wet, hot vice that feels like it’s working tirelessly to drain the cum from your throbbing manhood. Better yet, you’re certainly having the same effect on your moaning queen, fucking her tender ass until she’s ready to bust a nut of her colorful fem-cum into the goo-hole.");
	output("\n\nThe thought of making your queen cum from your rough ass-fucking spurs you on to thrust harder, ignoring the queen’s wordless cries as you build up speed and force. With that kind of treatment, and God knows what’s going on through the gloryhole, it doesn’t take long for Taivra to reach her limit. She pushes hard back against you");
	if(pc.cockVolume(x) <= chars["TAIVRA"].analCapacity() && pc.hasKnot(x)) output(", enough to make your [pc.knot " + x + "] batter its way into her ass");
	output(", and lets loose a bestial roar that reverberates off the smooth stone walls and through your bones. Her asshole clenches like a fist around your shaft, and you suddenly feel a massive pressure near the [pc.cockHead " + x + "] of your prick - even through the lust hazing your mind, you realize you’re feeling <i>eggs</i> pumping out of her belly and through her thick ovipositor. The voice through the gloryhole squeals happily as the queen pumps her full of her tiny spawn, and Taivra herself keeps growling and grunting like an animal as she orgasm... and draws you over the edge with her.");

	output("\n\n");
	//if xboxheug cumvol:
	if(pc.cumQ() >= 2000) 
	{
		output("Your overactive [pc.balls] ensure");
		if(pc.balls <= 1) output("s");
		output(" that you bloat the queen’s stomach until she looks absolutely pregnant with your cum. Taivra goes limp in your arms, slumping forward with her arms around her gut as your inhuman orgasm bloats her like a water balloon.");
	}
	//Moderate cumvol: 
	else if(pc.cumQ() >= 200) output("Your [pc.cock " + x + "] blasts a huge, thick wad of cum into the queen’s thoroughly-abused asshole. Taivra’s eyes roll back, and her arms clutch at her bloated belly now churning with hot, sticky seed.");
	//elseif low cum:
	else output("Your [pc.cock " + x + "] discharges a nice, hot wad of [pc.cumNoun] into the queen’s well-fucked ass, milked out by pleasurable contractions and sliding pressure as the queen thrusts limply into the gloryhole, trying to get as much pleasure as she can as she blows her eggs deep into the goo on the other side.");

	output("\n\nWith a heavy sigh");
	if(pc.hasKnot(x)) output(", you wait for your [pc.knot] to deflate before");
	output(" you slowly pull out of Taivra. When your crown finally wiggles free, you’re treated to the truly glorious sight of a ");
	if(pc.cumQ() >= 2000) output("torrent");
	else if(pc.cumQ() >= 200) output("stream");
	else output("trickle");
	output(" of [pc.cumColor] pouring out of her ass and down her thighs, forming a little puddle between her legs. Without you to support her, Taivra slumps forward like her legs are about to give out on her, and her softening ovi-cock flops out of the wall with a spurt of purple juices.");
	output("\n\n<i>“Ugh,”</i> she groans, reaching back to rub her battered, sperm-coated ass. <i>“I suppose this must be what one of my betas feel like...”</i>");
	processTime(17);
	pc.orgasm();
	//Fertilize queen eggs?
	clearMenu();
	addButton(0,"Next",unifiedPostSexTaivraShits);
}

//Breed Her
//Slide your cock into the queen’s ovipositor and flood her womb with your seed. The position might be a little awkward, but it’s worth it to make sure you have some royal offspring.
//PC must have a cock that fits inside her ovipositor. Fertilizes her eggs for the Cowgirl / Thronesex scenes.
public function dockingBonerIntensifies():void
{
	clearOutput();
	showTaivra(true);
	author("Savin");
	var x:int = pc.cockThatFits(200);
	if(x < 0) x = pc.smallestCockIndex();
	output("Your eyes are drawn to the thick, heavy shaft of Taivra’s ovipositor: a tube of tender meat that leads straight to her egg-laden womb, ready to be fertilized. Your queen sees where your gaze is going, and she smiles and runs an alluring hand along her half-hard ovi-cock. <i>“A pity you star-walkers are so different from us... I’d love to just spread your " + (pc.legCount > 1 ? "[pc.legs]" : "[pc.thighs]") + " and ram this inside your boy-pussy to drain out all you cum. Our offspring would be so wonderfully strong, after all. Conquerors and queens, every one of them.”</i>");
	output("\n\nYou return her smile, reaching up to run your fingers across the queen’s prick and the nubby spines around her crown. She gasps as your thumb caresses her fleshy slit, gently pushing in one the folds of sensitive skin around her X-shaped slit before slipping inside her, teasing the inner walls of her thick shaft. She’s sultry-hot inside, walls covered with slimy lubricants that let you glide across her flesh. Every inch must be as sensitive as a clit, as Taivra instantly sucks in a sharp breath, hands digging into the bedding beside you as pleasure takes her. The way her cock opens up for you, only gently massaging your exploring digit, you realize her horse-sized ovi-cock feels just like a tight little pussy. Maybe you could fuck it like one...");
	output("\n\nThe positioning is going to be awkward as hell, what with the sheer size of Taivra’s... less than feminine parts, and your need to thrust - something tells you being on bottom here’s only going to make the awkwardness of everything that much worse.");
	output("\n\nFeeling your [pc.cock " + x + "] stiffening against her thigh, Taivra grunts and reaches down to give you a little of your own medicine, stroking your prick and moving her hips ever so slightly, letting your cockflesh grind against the smooth, warm chitin on her legs. <i>“Something on your mind, love?”</i>");
	output("\n\nYou give her a cheeky grin and hook a hand under your lover’s arm. In the blink of an eye, she’s on her back under you, breasts jiggling heavily with the impact as you settle overtop her. Her black eyes go wide, and you feel her fingers slipping off your tumescent member and onto her own - she’s figured out what you’re up to, and as you crawl your way up her body, until your [pc.butt] is resting on her quivering bust.");
	output("\n\n<i>“This... is this how you star-walkers breed?”</i> she asks, a hint of nervousness in her voice. You give her a wink and turn around, aligning your [pc.cock " + x + "] with the flared, spine-crested crown of your queen’s ovipositor. A tiny trickle of purple lube peeks out from her four-part slit to greet you, letting you easily slide your [pc.cockHead " + x + "] between her folds. As you do, you gleefully realize that every wiggle of your [pc.hips] sends quakes through Taivra’s huge breasts, even squished between your ass and her chest as they are. The queen gasps with every motion, both from the impending penetration and the shockwaves of jiggling pleasure you’re battering her tits with. Oh, this is going to be fun!");
	output("\n\nYour hips piston forward, rocking forward on Taivra’s oh-so-soft breasts and guide your prick into the welcoming embrace of her tremendous cock. She’s like a lubed-up onahole, hot and smooth and perfectly molding to the shape of your [pc.cock " + x + "]; every inch brings another moan from the lustful queen, making her squirm like a fresh virgin underneath you. <i>“Oh, fuck. Oooohhh, go slow go slow,”</i> she begs, tearing into the sheets with her long nails, desperately trying to hold on.");
	output("\n\nYou heed the queen’s request - for now - and slow your steady penetration to a crawl, letting her adjust to the unnatural girth stretching out her ovipositor. Her hips buck desperately, reacting on base, animal instinct as you slowly hilt yourself inside the queen’s cock");
	if(pc.hasKnot(x)) output(", pushing in until your [pc.knot " + x + "] is touching her crown");
	output(". Her shaft contracts hard around you, alternating between desperate attempts to repel the invasion, or sucking you in like a Galotian hooker. Her body can do nothing but take you, and the raw, bestial submission seems to only excite the queen more - her shaft floods with the slimy purple fem-cum you’ve come to know and love by now, filling every tiny space your cock isn’t with a steady flow of her alien juices, letting it pour out around your prick");
	if(pc.hasKnot(x)) output(" until you finally thrust in again, using your [pc.knot " + x + "] to block the flow before you’re utterly drenched");
	output(".");

	output("\n\nAll that’s left to do is breed your queen’s fertile womb... but where’s the fun in jumping right to the end? You’ve got the queen in a position of submission she’s not used to, giving her pleasures no other huntress could give her. With a smile, you grab the queen’s legs by the knees, hefting them up and driving your cock deep inside her.");
	output("\n\nTaivra screams, arching her back and clawing at your [pc.butt]; her cock grinds down on your shaft, trying to get a grip on you but so utterly soaked with her cum that you just slide through her clenching muscles with ease. Your pistoning hips keep the queen in a state of constant, overwhelming sensation - hammering her cock and bouncing on her breasts - until at least with a shrill cry you feel her cumming - and hard! The wetness in her cock-sheath redoubles in the blink of an eye, gushing towards her opening and ");
	if(pc.hasKnot(x)) output("slamming into your hilted bitch-breaker, causing the front of Taivra’s cock to blimp out in a soggy cum-bubble around your [pc.knot " + x + "]");
	else output("splattering across you, smearing your [pc.belly] in a rush of musky purple fem-spunk. You laugh and recoil from the explosive orgasm, trying not to get hit in the face with the queen’s vibrantly-colored girl-spunk");
	output(". Taivra’s hand clamp down on your [pc.butt], long nails digging painfully into your [pc.skinFurScales] as she bellows her pleasure for the whole palace to hear. You feel her tits bounce against your thrusting rump, and her ovi-dick squeezing down like a lurid sleeve around your [pc.cock " + x + "] as if it were trying to milk you for every drop.");

	output("\n\nAnd by now, you’re more than happy to let her succeed. Still thrusting as fast and hard as you can, you let the queen’s orgasming cock-sleeve milk you until you join her in climax, blasting a ");
	if(pc.cumQ() < 6) output("thin, wispy rope of [pc.cumNoun] down her sodden egg-tube, adding to the deluge flooding her prick.");
	else if(pc.cumQ() < 500) output("nice, thick wad of [pc.cumNoun] right down Taivra’s soaked ovi-prick, flooding her womb with seed.");
	else output("torrent of [pc.cumNoun] down Taivra’s ovipositor, flooding her already-soaked slit with seed until her womb is bloated with your cum. She cries out as her belly swells with seed, utterly soaking her eager womb.");

	output("\n\nYou sigh and lean forward, catching your breath as the last twitching drops of cum drool out of your [pc.cock " + x + "]. Underneath you, Taivra flops back, all the energy suddenly gone out of her; her hands caress her full belly and breasts, enjoying the feeling of her body in the afterglow. Slowly, you pull yourself out of her, letting loose a small flood of mixed fluids onto her belly and your thighs before you flop down beside her.");
	//Fertilize those eggs for a day.
	taivraFertilize();
	pc.clearRut();
	processTime(19);
	pc.orgasm();
	//[Next]
	clearMenu();
	addButton(0,"Next",unifiedPostSexTaivraShits);
}

//Unified Post-Sex Scene
public function unifiedPostSexTaivraShits():void
{
	clearOutput();
	showTaivra(true);
	author("Savin");
	output("A few minutes later, and you find yourself sitting up against the headboard of the royal bed, watching the shapely hips and ass of your royal lover swishing about as she pours out some sweet-smelling liquid into a pair of gemstone mugs. She returns to bed, long legs making her flaccid ovi-cock bob heavily between them until she’s snuggled up beside you, offering you a glass.");
	output("\n\n<i>“I have to admit,”</i> she smiles, nestling her cheek on your shoulder, <i>“that was... not something I could get with another huntress. I find I’m quite enjoying our... partnership.”</i>");
	output("\n\nShe certainly seems to. You smile and put a hand around her shoulders, pulling the queen close and sipping on your... wine? Whatever this is, it’s quite nice. You’re content to lay and rest awhile, enjoying the afterglow with your mate, but Taivra soon finishes her drink and swings her legs out of bed, reaching for her armored bra. She does have a palace to rule, after all... and doubtless a few dozen betas who need wombs full of parasitic spunk, knowing her.");
	output("\n\nThe queen gives you a knowing wink and gets dressed, with what little clothes she feels she needs, before slipping out of the room and leaving you to relax.");
	processTime(45);
	
	IncrementFlag("TAIVRA_CHAMBER_SEX");
	
	//[Next]
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Throne Sex]
//Don’t bother with privacy or modesty: join Taivra’s group of betas on her throne and enjoy the pleasure the queen can offer.
//Respect -1. Slut.
//Big +Exhibitionism
public function taivraThroneSex():void
{
	clearOutput();
	showTaivra();
	author("Savin");
	output("<i>“Got room for one more?”</i> you ask, already starting to pull your [pc.gear] off as you close the distance with Taivra and her harem of moaning betas. You ");
	if(pc.hasCock()) output("start to stroke your cock, lustily looking your amazonian queen over.");
	else output("let your gaze wander over your amazonian queen, up her toned thighs to the chainmail bikini barely holding back her monster ovi-cock.");
	output("\n\n<i>“Wouldn’t you prefer to retire to our chambers, my mate?”</i> Taivra asks, though you notice a tell-tale shift beneath her armored panties. You shake your head at her, wading in between the orgiastic submissives getting tail-fucked around her throne. <i>“No? Tsk, very well... I suppose I can sate your lusts. What else are mates for, after all.”</i>");
	output("\n\nGlad to have your queen’s approval, you toss aside the rest of your gear and approach, wondering just what you could convince her to do...");
	processTime(2);
	clearMenu();
	//[Footjob] [Lap Ride]
	if(pc.hasCock()) addButton(0,"Footjob",cockFootsies,undefined,"Footjob","Have Taivra put her smooth, chitinous feet to use on your cock. Doubtless, her harem will get in on the action too.");
	else addDisabledButton(0,"Footjob","Footjob","You need a penis to get a footjob.");
	addButton(1,"Lap Ride",lapRideDatQueenAllPublicLike,undefined,"Lap Ride","No need to be fancy: crawl into your queen’s lap and let her ram that massive ovipositor into you.");
}

//[Footjob]
//Have Taivra but her smooth, chitinous feet to use on your cock. Doubtless, her harem will get in on the action too.
public function cockFootsies():void
{
	clearOutput();
	showTaivra();
	author("Savin");
	output("<i>“Since you’re already so busy... how about you just get me off with your feet,”</i> you suggest, indicating your crotch that’s already just a scant few inches from her crossed legs.");
	output("\n\nOne of her eyebrows raises slightly, but the queen shifts slightly in her throne and chews one of her painted lips. <i>“You offworlders certainly have strange tastes.");
	if(flags["TAIVRA_FOOTJOBBED"] != undefined) output(" Though I certainly can see the appeal...");
	output("”</i> She reaches down to run her hands through the spiny hair of a few of her betas, gently turning their attentions from her thrusting tail-cocks to your [pc.cock]. <i>“Alright, girls, put those tongues of yours to good use. Make my plates sparkle, and maybe I won’t waste your wombs on these filthy little tentacle eggs. For a while, anyway.”</i>");
	output("\n\nThe closest beta whimpers and wraps her hands around one of Taivra’s feet, immediately shoving her mouth against the chitinous underside and licking from heel to toe. Two or three other girls clamber over, struggling to do more than crawl with the queen’s cocks still thrusting into their own thick ovipositors. Taivra leans back in her throne as the squirming submissives gang up around her feet, lifting them both up and giving her dark limbs a thorough tongue-bathing.");
	output("\n\nWhile most of her harem busies themselves lathering their queen’s smooth feet in slick spit, a pair of them crawl over to you with lust in their eyes, tongues wetting their lips as their dark eyes fix on your [pc.cock]. You doubt they’ve ever seen a proper cock aside from their queen’s tails, much less had the chance to have one do anything but rail their wombs. You pat your thigh and urge them forward, letting the pair wrap their hands around your [pc.cock] and start to explore your manhood. A shiver of pleasure works its way up your spine as their smooth, cold digits play around your [pc.cockHead]");
	if(pc.balls > 0) output(" and reach down to cup your [pc.balls]");
	output(", squeezing and caressing your tender [pc.cockColor] skin.");

	output("\n\nSmiling down at them, you run your hands through their spine-like black hair, gently guiding their faces into your groin. They take the hint, and one of them opens wide to get her lips around your [pc.cockHead] while the other’s tongue lolls out, flicking across your sensitive underside.");
	output("\n\n<i>“Skillful, are they not?”</i> Taivra murmurs proudly, clearly enjoying her tongue-bath more than a little. <i>“Get [pc.himHer] nice and hard, girls... I’ll need something firm to grab onto.”</i>");
	output("\n\nThe two betas are well ahead of her on that count, slurping and licking with ravenous abandon. ");
	if(pc.libido() >= 90) 
	{
		output("You don’t bother to mask your enjoyment, but thrust your hips into one of the submissive sluts’ mouths, face-fucking her while her partner desperately licks your shaft. Between the two of them, eager and aggressive as they are, you decide to give the pair a little present: the first taste of your seed. With a muted grunt, you plant your hips against the girl’s lips and let loose, filling her mouth with [pc.cum]. Her black eyes go wide, and a trickle of [pc.cumColor] drools out from the sides of her mouth around your prick.");
		output("\n\n<i>“Don’t make a sound,”</i> you whisper, giving her a wink. Nobody else needs to know, you figure - you’d hate to make Taivra jealous of a random beta. The girl gags and swallows weakly, popping off your cock and letting her partner go throat-deep on you. You’re hard again in moments, ready to be handed off to the queen.");
	}
	//elseif not megalibido:
	else output("You try desperatley to hold back as the two betas pleasure you, butting all their hard-earned skills to make sure you’re as hard as you’ve ever been before surrendering your cock to their queen.");
	output("\n\nSatisfied with her betas’ efforts, Taivra dismisses them with a snap of her fingers that sends them scrambling off to the far reaches of her throne’s dias, leaving you and the queen as alone as you can be while she’s still tentacle-fucking their ovi-slits. Taivra lavishes you with an alluring, amethyst-lipped smile and a crook of her finger, beckoning you towards her spread legs and the spit-glistened black chitin of her feet.");
	output("\n\nYou close the distance, letting your rock-hard dick bob hypnotically until it’s gliding between the arches of her chitinous feet. She pushes her feet together as you settle between them, trapping your meat between her sinfully smooth, thoroughly lubed-up chitin plates. <i>“Need something to hold onto?”</i> she teases as her feet glide from base to crown, and pleasure makes your whole body shudder. You think she’s joking, until your queen outstretches her hands, taking yours in hers and squeezing you tightly - as tight as her black feet around your prick, pulling you in until most of your weight is supported by the amazonian queen and her throne.");
	output("\n\nHer feet move slowly at first, taking their time in tracing your throbbing prick from base to crown. <i>“Does this feel... good?”</i> Taivra asks, and if you didn’t know better, you’d say she sounded almost bashful. <i>“I’ve ");
	if(flags["TAIVRA_FOOTJOBBED"] == 1) output("only ever done this for you");
	else output("never done something like this before");
	output(".”</i>");

	output("\n\nYou give the queen an encouraging nod, telling her that it feels more than good. She smiles and starts to move her legs faster, using her knees to piston her feet along your slick shaft. It’s hard to do anything but moan and buck your [pc.hips] against her chitinous limbs, enjoying the sensation of her perfectly smooth, firm toes and heels squeezing you wonderfully. You’d never have expected a bug-girl footjob to feel like this, like lubed-up latex gliding across your [pc.cock].");
	output("\n\nIt doesn’t take long for Taivra’s gliding feet to bring you to the edge, leaving you panting and moaning as her feet work faster and faster, working tirelessly to milk out your [pc.cum]. <i>“Don’t hold back now,”</i> she murmurs, squeezing your hands. <i>“Cum, so I can take you back to our chambers and have the real thing.”</i>");
	output("\n\nYou can’t say no to that, and promptly find your [pc.cock] is swelling with seed, ready to burst all over the queen’s black feet. A few more seconds and you slam your hips forward into her arches, grunting with feral lust as a burst of [pc.cum] sprays from your [pc.cockHead] and all over Taivra’s black chitin and the pale flesh of her thighs.");
	if(pc.cumQ() >= 1000) output(" More and more sprays out of your dick until the queen’s legs are covered in [pc.cum], and her throne is left slathered in your spunk.");
	output("\n\nTaivra chuckles, keeping her feet moving until you’ve emptied your [pc.balls] all over her. <i>“Very nice, my mate. I’m sure my betas will have a good time cleaning up your mess. Perhaps a few will even try and put your seed to good use, hmm?”</i>");
	output("\n\nAs if on cue, one of her submissives moan, a jet of fem-cum spurting out around Taivra’s tail-cock.");
	output("\n\n<i>“Now, shall we take this back somewhere private? Or is there something else?”</i>");
	//[Next]
	processTime(22);
	pc.orgasm();
	flags["TAIVRA_FOOTJOBBED"] = 1;
	IncrementFlag("TAIVRA_THRONE_SEX");
	pc.exhibitionism(2);
	clearMenu();
	addButton(0,"Next",taivraRepeatScenes);
}

//dildo in Queen Taivra's ass while her tails impreg/assfuck PC [tbd title]
//fuck taivra in the ass with a razor dildo OHGODWHYZEIK
//get fucked by her tail
//tooltip: Use your hardlight-enabled underwear to pound Taivra's asshole. Her cockvine 'tails' will be in striking range of <i>your</i> {(vag)sex/(else)ass}!
//disabled tooltip, missing dildo: You need hardlight-enabled underwear for this.
public function taivraHardlightFunzies():void
{
	clearOutput();
	showTaivra(true);
	author("Zeikfried");
	output("Taivra watches as you ");
	if(!(pc.armor is EmptySlot)) output("strip your gear and ");
	output("activate the hardlight projection on your [pc.lowerUndergarment], which takes the shape of a large cock after a moment of humming.");
	if(pc.isBimbo()) output(" <i>“Like, I wanna put this in your big bubble-butt an’ get you off,”</i> you chirp.");
	else if(pc.isBro() || pc.isAss()) output(" <i>“Turn around and get ready to take this,”</i> you order.");
	else output(" <i>“I’d like to stick this in you; I think it’ll be fun.”</i>");

	output("\n\nHer nonchalant expression doesn’t change for your suggestion. <i>“Oh?”</i> It’s easy to tell from her demeanor that she’s not shy about playing with or having something inside her ass. As she lowers her cloak from her graceful shoulders and turns around, the plethora of infesting cockvines writhe with excitement, conditioned by her thoughts. She drops the cloak and bends over, showing off her assets proudly.");

	output("\n\nTaivra’s naked rear practically glows in the dim light - with her pale curves and long white legs, and the ruddy stalk of her egg-cock between them, she looks like a strange, lunar moth. Her parasitic tails fan out over her, giving antennae to the illusion. She waggles at you, beckoning. <i>“Well?”</i> the queen says, pregnantly.");

	output("\n\nYou tug your underwear into a snug fit and then ");
	if(!pc.isTaur()) output("place your hands on her ass");
	else output("raise your fore[pc.legsNoun] and rest them on her shoulders");
	output(". The alien shivers under you, and her flaccid egg-cock takes on half an erection from anticipation. When the tip of your toy contacts her hole, she starts a bit, then relaxes into you. The toy slides inside the nyrea’s smooth anatomy without a hitch.");

	//if PC has pussy
	if(pc.hasVagina())
	{
		output("\n\nSomething touches the hem of your [pc.lowerUndergarment]. You freeze, ");
		if(pc.isTaur()) output("trying to feel out what it is... it");
		else output("staring down at Taivra’s cockvines... one");
		output(" noses at you and pushes at the fabric, warm and insistent. Another prehensile coil pulls the hem away, and the first glides in the opening. It sneaks to your sex like a serpent finding its burrow, nudging at your labia. With a sudden lurch, the cockvine infiltrates your [pc.vagina]. You shiver, and Taivra laughs.");
		pc.cuntChange(0,chars["TAIVRA"].cockVolume(0));
	}
	//if PC has no pussy
	else
	{
		output("\n\nTaivra’s tails whip around your [pc.ass], clasping you firmly to the queen’s trembling posterior. Before you can guess that she’s trying to hold you close, one of the parasitic pricks begins nosing at the hem of your underwear, right at the small of your back. It rubs and rubs, pushing by little bits until it manages to open a gap between the fabric and your skin, and a second tail slips through. Your ");
		if(!pc.isBimbo() && pc.lust() < 80) output("alarm");
		else output("arousal");
		output(" rises as this new intruder probes your [pc.cheeks] and slides down your crack - but Taivra seems only amused. The cockvine finds your [pc.asshole], secreting a slimy stream of pre-lube from its vegetable glans and smearing it around. You barely have time to brace before it forces its way inside, oozing parasitic fluid; the nyrean queen sighs in pleasure as the cock slides into you.");
		pc.buttChange(chars["TAIVRA"].cockVolume(0));
	}
	//merge
	output("\n\n<i>“Well... get started”</i>, the haughty royal says. You wince and try to acclimate yourself to the slippery, warm cock that’s making its home inside you, but Taivra isn’t having any of it. She bumps you with her ass, intentionally pushing you deeper onto her viny prick, goading you to punish her own hole in revenge. She refuses to stop jostling, bumping you until you give up and let the cockvine have its way; it begins merrily thrusting inside you as soon as you relax. [pc.LegOrLegs] and spine shaking from the penetration, you begin trying to push your sex-toy into the nyrea’s asshole.");

	output("\n\nTaivra seems into it; she stretches out and places her hands on the opposite wall for more resistance. You bugger her hole with steady strokes, and she quivers and shakes as your photonic prong teases her ring. The queen shakes her head side to side; not as a symptom of disapproval, but as a mere muscle reflex to let out her emotions. She’s in control of the fuck - whenever she wants to, she buckles her arms and lets your momentum carry her closer to the wall, pressing her tits against it, feeling the closeness of your body and looking back at you with lusty eyes, flipping her hair about as her head lolls.");

	//hair-pulling branch; only if PC is not nice or is bro // Copy to clipboard as it’s used often
	if(!pc.isNice() || pc.isBro())
	{
		//first time seeing this
		if(flags["TAIVRA_HAIRPULLED"] == undefined)
		{
			output("\n\nTaivra twists her head in a spasm of pleasure and her stiff quill-ponytail ");
			if(!pc.isTaur()) output("clips your nose");
			else output("scrapes your chest");
			output(" again - one time too many. With ");
			if(!pc.isAss() && !pc.isBro()) output("a nervous");
			else output("an angry");
			output(" hand, you grab it. The nyrean queen’s revelry stops as she turns to look.");
			output("\n\n<i>“Bold...”</i> Taivra says coldly, glaring over her shoulder.");

			output("\n\nYou immediately realize that you can’t turn back. If you apologize or try to play it off like an accident, you’re going to be the new bottom bitch in her harem - ");
			if(pc.libido() >= 75) output("fun, but");
			else output("and");
			output(" you don’t fancy the permanent change of address. The only way to get through this is to be dominance incarnate.");

			output("\n\nYou set your jaw and jerk Taivra’s head back as you slide your dildo home on the latest push. <i>“What’s wrong? Be a good bottom.”</i>");

			output("\n\nTaivra grunts and grits her teeth at the anal stim, and bows her head; the smooth spines fall through your fingers like coins, but you reach out again and grab her ponytail, closer to the base. With a rude yank, you pull her head up again, interrupting a breath.");

			output("\n\n<i>“Gha...”</i> she gasps, unable to form sentences. Her ass must be ringing with pleasure, because she repeats this gurgle several more times while thrusting into your crotch on reflex. Her thick prick bobs between her legs, swollen and useless, dripping with egg-lube.");

			output("\n\n<i>“");
			if(pc.isBimbo()) output("Don’t pretend you don’t love it, honey,”</i>");
			else if(pc.isBro()) output("See?”</i>");
			else output("See, isn’t that nice? That’s what comes from being obedient,”</i>");
			output(" you cajole. Taivra sputters and doesn’t answer, but the grinding of her jaw tells you enough. You stir her plump, pale ass again, waiting for her resolve to break. She tries to resist, but the pounding in her asshole and the bending of her back force her chest inexorably down, toward the floor. You wait until her dangling breasts touch dirt, and then push her head level with them.");

			output("\n\n<i>“");
			if(pc.isBimbo()) output("Like, you can really feel it from this angle, right?”</i>");
			else output("It’s nicer from this position, isn’t it?”</i>");
			output(" you say confidently. Taivra looks like she wants to speak, but can’t because her chin is being forced into the ground... and, you fancy, because of the excellent teasing you’re giving her asshole. You hold her there, working her with your hips, until you can feel her jaw trying to open, then let her up just a bit. She spits something inaudible into the dust - you can tell it’s too long to be the affirmative you want.");
			output("\n\n<i>“Sorry?”</i> you ask, pivoting your hips up to drag hard along the ring of her slick hole. Taivra’s bloated egg-cock shudders, flicking lubrication on your [pc.legOrLegs]. The shudder travels along her spine as you pull out again, shaking her body until it reaches her head, which she shoves into the dirt in embarrassment as a lewd sigh escapes her.");
			output("\n\n<i>“Well?”</i>");
			output("\n\nHer voice is like a mouse’s. <i>“It feels good,”</i> Taivra finally admits.");
			output("\n\n<i>“And? Do I know the best positions?”</i>");
			output("\n\n<i>“Yes...”</i> she mumbles meekly.");
			output("\n\n<i>“Louder,”</i> you demand.");
			output("\n\n<i>“You know the best positions,”</i> Taivra agrees, hurriedly.");
			output("\n\n<i>“");
			if(pc.isBimbo()) output("Yeah? For who?”</i>");
			else output("For whom?”</i>");
			output(" This is accompanied with a stronger stroke, one that nearly pulls the breath from her with her answer.");
			output("\n\n<i>“For me! You know the best position for me!”</i> the fallen queen cries, her contralto voice quavering.");
			output("\n\n<i>“");
			if(pc.isBimbo()) output("Like, r");
			else output("R");
			output("emember it,”</i> you say sweetly, rewarding her with a bit of tenderness.");
			if(pc.isBimbo() || pc.isBro()) output(" <i>“And like, don’t be such a bitch next time. Just go with it, ‘k?”</i>");
			else output(" <i>“Embrace it. Love the feeling of being controlled.”</i>");
			output("\n\n<i>“Yes,”</i> she agrees, ashamed. But despite the shame, she pushes her ass up, a tool to her own lust. You jerk her head around, pushing and pulling to align her back for the best teases... and the best poses to show off her eye-candy body. Slowly, she begins to give in to the ecstasy - her voice pipes up in cute moans and grunts, heedless of the dignity of her rank.");
		}
		//repeat hair-pulls
		else
		{
			output("\n\nWith the way Taivra is debasing her pale, white ass on your pricey prong, another session of sub-training might be just the thing to push her to new depths of pleasure. You reach out a hand for her hair again - the alien queen shudders in anticipation as it appears in the corner of her vision.");
			output("\n\n<i>“Ohh yeah,”</i> Taivra moans, when your fingers close around her quills. She stiffens up to resist you; clearly her secret submission kink is smouldering. Just as clearly, you’re the only ‘male’ she can risk indulging without starting gossip. You wrap your fist around and give her hair a good yank, feeling her resistance turn to meek acquiescence as you ‘overpower’ her. Her thick cock bobs under her, swelling with perverted lusts as she accepts her role anew.");
			output("\n\n<i>“Nngh,”</i> she grunts, stiffening her neck for another round of resistance and submission. <i>“Again!”</i>");
			output("\n\nYou laugh");
			if(!pc.isAss()) output(" inwardly");
			output(" at her queer ‘dominant submissive’ attitude, her barked orders on how best to debase and control her. But there’s no threat anymore - she’s totally in your power, even if she wants to dictate exactly how to punish her asshole. You could push her beautiful body into the ground, but she’s practically throwing it down already, tilting her ass into the air and trying to replicate the feeling you gave her last time. Well... maybe you can help her become a better sub, just a bit.");
			if(!pc.isAss()) output("\n\n<i>“Be quiet,”</i>");
			else output("\n\n<i>“Shut your mouth,”</i>");
			output(" you demand.");
			if(!pc.isBro()) output(" Taivra looks annoyed. You add, <i>“...unless you want to swallow dirt.”</i>");

			output("\n\nChoking up on her ponytail, you force the queen of the nyrea to the floor, face turned to the side and pristine neck rolling in the chamber filth. Her gorgeous breasts press against the ground, pushed outwards by her struggles and becoming visible around the sides of her hourglass frame.");
			output("\n\n<i>“Ungh, yes!”</i> Taivra groans. <i>“That’s it!”</i> Her ass presses into you; she’s on tiptoe, putting the most elevation between her soot-smeared face and her round, white booty. The neglected egg-cock between her legs lashes and wobbles with each pounding you give her, flecking your lower half with nyrean fem-cum.");
			output("\n\nShe looks good beneath you, stretched out and ass high like a breeding animal. Even her squeal is perfect. You pull on her hair once more, eager to hear her high-pitched rutting sounds.");
		}
		//merge 1st and repeat of not-nice/bro
		output("\n\nAbruptly, the little stem tying Taivra’s quills comes apart in your hand and her feral mane slips your grip. Her head rolls, but she just as quickly raises it again - even jabs it toward you.");
		output("\n\n<i>“What... don’t stop!”</i> she cries obliviously.");
		if(!pc.isBro() && !pc.isAss()) output("\n\nHesitantly, shying from the tips, ");
		else output("Callously, ");
		output("you reach out and knit your fingers through her stiff pelage. The roots are thick; pressing your palm to her scalp and gathering a handful of them, you can control the movement of her head far better than you could with her ponytail. You jerk her head back until you can see her pupil in the corner of her eye, mad with lust and slaved to her needs. Her mouth spreads in a wild smile when you make eye contact, and she presses her ass into you to beckon your affections again. <i>“Yeah... do it!”</i> she grunts.");
		output("\n\nYou ");
		if(!pc.isAss()) output("gladly");
		else output("gleefully");
		output(" oblige, clenching your fist on her alien mane and pulling her head up like an unruly mare’s. Taivra grunts as her neck bends, and her asshole tightens in reflex - or submissive joy. The faint hum and vibration of the device in your underwear intensifies as it has to work harder to keep the projection intact.");
		IncrementFlag("TAIVRA_HAIRPULLED");
	}
	//if not on hair-pull path (nice and not bro)
	else
	{
		output("\n\n<i>“Come on,”</i> Taivra grunts. <i>“Use some technique or something.”</i>");
		output("\n\n<i>“Technique?”</i> you grunt back.");
		output("\n\n<i>“Yeah,”</i> she replies. <i>“Something exotic. Remind me why I keep you around. Or are you satisfied to let your machine do the work?”</i>");
		output("\n\nYour cheek tingles with shame - not least because she’s treating you like one of her harem boytoys. ‘Keep you around’, indeed! You pump your hips and strain against the brace of vines, irritated by the imperviousness of this woman and intent on showing her who’s in charge.");
		output("\n\nTaivra laughs. <i>“That’s not technique. You’re just pushing harder. If that’s all you can do...”</i> She presses her queenly ass into you infuriatingly. <i>“...you could at least put some effort into it!”</i>");
		output("\n\nThe nyrea’s big, white butt jostles you as she shoves, using the chamber wall for leverage, smugly teasing herself with your toy while she pushes you around to show off her own strength. You endure it, annoyed, while she slaps against your crotch, but can’t hold steady for long. Taivra’s jostling gets worse and worse until, fuming, you stop resisting and let her force your crotch all the way back, almost out of her hole - and then you jam it home!");
		output("\n\nTaivra shudders as your dildo spears her. <i>“Ah, so you are a proper female after all, and not a pretty harem boy!”</i> she taunts. She pushes you back again, harder; you answer her with another forceful penetration. Soon, the two of you are in a rhythm of push-counterpush, with Taivra thrusting so hard she nearly forces you out of her hot hole and you pumping right back in with enough power to reset her ass for another push. Her parasitic prick waits in position, penetrating you in turn whenever Taivra shoves you back. For your part, you intensify on every thrust, eager to show the randy queen you’re her superior in sex as well as combat.");
	}
	//merge all
	output("\n\nTaivra’s shudders and tension grow and grow as you turn her bottom half to jelly. Her knees buckle intermittently, though she always recovers right away, too greedy to miss a stroke from your toy. Her cock is constantly drooling now, and something may be shifting in the base - it’s hard to tell, since the only time you can feel it is when she slams into you. Your " + (pc.legCount > 1 ? "[pc.legs] are" : "[pc.leg] is") + " drenched in nyrean egg-lube, and a powerful, alien scent of Taivra and sex fills the room. Her pace increases, forcing you to keep up until her ass is a wobbling, jiggling blur on your rod.");
	output("\n\n<i>“Cumming!”</i> moans the alien queen. She stops pushing her ass at you and stiffens, paralyzed by orgasm. Her virile egg-prick convulses, dropping a splash of {pinkish} fluid onto the floor... and then, jogged loose by the pounding, eggs. Plop, plop, plop, they drop, right into the mess of nyrea goo. Taivra’s spine locks as the eggs pass down her urethra, little visible bulges, and then distend her cum-slit to drop free. Her quivering body delivers extra-thick globs of fluid to ease their expulsion with enviable pulses of orgasmic delight.");
	//if pc has pussy
	if(pc.hasVagina())
	{
		output("\n\nThe cock pounding your [pc.vagina] goes still suddenly, then shoves deeply into you and erupts in sticky, slimy seed. Propelled by the jerks of symbiotic dick, the sperm feels almost alive as it’s pushed into your deepest, most intimate places, seeking a place to fertilize. The perverted perambulation triggers complementary spasms in your pussy, which buckles in orgasm and greedily dips into the sperm, oblivious to its parasitic nature.");
		if(pc.wettestVaginalWetness() >= 3) output(" Gushes of fem-cum run through the tendrils wrapped around your leg, watering Taivra’s trellis of sex-plants like fondly-cared-for climbing vines.");
	}
	//else no pc pussy
	else output("\n\nThe wriggling parasite in your [pc.asshole] spasms and jerks, delivering loads of warm cockvine spunk, sticky and slimy inside you. It feels almost alive as it squishes around, looking for a place to fertilize; even though you know it won’t find one, the imagination of it fills your mind with fevered, lewd images and you tingle all over. Your sphincter clenches as hard as it can with the still-writhing cock inside, knotting with tension in orgasm.");

	//merge to finish
	output("\n\nThe two of you stand, locked together by a cage of stiff cockvines, until Taivra’s climax dwindles into a puddle of nyrea all over the floor. Slowly, her muscles relax. She looks back at you thoughtfully as her spent vine withdraws from your gooey hole.");
	output("\n\n<i>“Not bad, I suppose. Mostly toward the end.”</i>");
	output("\n\nYou huff, but she smiles primly before you speak. <i>“You may get off me now. I look forward to seeing you again.”</i>");
	output("\n\nWait, really? That was almost a compliment. You fumble and deactivate the hardlight from your underwear, getting plenty of her wild cock’s splattered egg-cum on your hand in the act, and the projection disappears from her ass with a ‘bwoop’. She starts a bit as the sci-fi toy is suddenly replaced with cold emptiness - a small revenge. Recovering quickly, she gives you a chaste kiss on the cheek and motions you toward the door; you ");

	//(hair-puller)
	if(!pc.isNice() || pc.isBro()) output("grab her hair and kiss her better, trapping her tongue in yours, then ");
	output("pick up your things.");
	if(!(!pc.isNice() || pc.isBro())) output(" A small confusion settles upon you as you leave. It occurs to you that showing Taivra who was boss by working her over like you did was exactly what she wanted - she was just too proud to admit her desire to be dominated. Maybe she’s not as undiplomatic as all that, after all.");
	output("\n\nAs you leave, a stolid-faced chamber guard enters to check on the queen. You can hear Taivra instructing her to find space in the incubator for the eggs you squeezed out - and to make sure there’s room for any future ‘unscheduled additions’.");
	//do cockvine load in PC's vag or ass with cockvine pregnancy chance if in vag
	//do pc orgasm, pass time, put PC wherever he usually goes after sex with Taivra
	//end
	if(pc.hasVagina()) pc.loadInCunt(chars["COCKVINE"],0);
	else pc.loadInAss(chars["COCKVINE"]);
	processTime(20);
	pc.orgasm();
	
	IncrementFlag("TAIVRA_CHAMBER_SEX");
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Lap Ride]
//No need to be fancy: crawl into your queen’s lap and let her ram that massive ovipositor into you.
//vagOrAss scene
public function lapRideDatQueenAllPublicLike():void
{
	clearOutput();
	showTaivra(true);
	author("Savin");
	var x:int = -1;
	if(pc.hasVagina()) x = rand(pc.totalVaginas());

	output("You just stride up to Taivra, reclining on her throne, and climb on top");
	if(pc.legCount > 1) output(" to straddle her spread legs");
	else output(" of her, aligning your crotch with hers");
	output(". Your hand plays across her mailed breast, giving the queen a lusty smile as you grind your [pc.vagOrAss " + x + "] along her thigh, stopping just short of her armored panties.");

	output("\n\n<i>“Oh, you’re going to make all of my poor betas jealous,”</i> Taivra teases, nevertheless reaching around to grab a handful of your [pc.butt], squeezing until your gasp with pleasure.");

	output("\n\n<i>“Good,”</i> you answer, leaning in and kissing her forcefully, thrusting your [pc.tongue] into the warrior woman’s mouth and jousting with her own. You feel her giggling under you, holding you close and kissing back, even as her many tails keep thrusting deep into her other, less important mates. You have the full attention of Queen Taivra, feeling her hands play across your bare ass, her tongue twisting around and caressing your own. Your hand snakes down from her ample chest with a parting squeeze, tracing your fingers down her taut, battle-scarred belly and to the padded hem of her panties.");

	output("\n\nOne good yank and the heavy chain is out of the way, letting the lengthy probe of Tavira’s ovipositor spill out against your thighs, throbbing hotly against your [pc.skinFurScales]. <i>“All yours, [pc.name],”</i> she purrs, rocking her hips just enough to make the hard pillar of ovi-cock grind on your flesh. <i>“Come and get it.”</i>");

	output("\n\nYou do so, rising up on your [pc.knees] and grabbing Taivra’s thick alien dong, stroking it as you align the flat head with your [pc.vagOrAss " + x + "]. The pressure against your hole is immense and instantaneous, her girth more like a horse’s than anything a girl her size should be packing! You start to press down, but Taivra’s hands stop you, firmly holding up your [pc.butt]. <i>“How about a little lube, first? I think things might be a little more pleasurable for us both that way...”</i>");

	output("\n\nCan’t deny that logic - especially when Taivra beckons over a couple of her harem sluts. The pair scamper over and kneel between their queen’s legs, immediately starting to lavish her oversized egg-layer with their tongues. Your lover’s clearly got her betas well-trained! Taivra rolls her head back and moans, arching her back into the two horny beta’s oral ministrations. They’ll have her ready to go in seconds, but you want a piece of that action!");

	output("\n\nWith a little awkwardness, you twist around in Taivra’s lap and pat your thighs to get the betas’ attention. Their big black eyes look up at you and your [pc.vagOrAss " + x + "], and with a few encouraging words, you urge them to ply their talented tongues on your hole, too. The pair slowly reach their tongues out towards your ");
	if(x >= 0) output("bare crotch");
	else output("presented backside");
	output(", sending a shiver through you as their soft, wet mouths begin to lather up your waiting hole for their queen. You chew your [pc.lip] and stroke their hair, pulling the girls deeper and deeper into your [pc.vagOrAss " + x + "], letting them get you dripping wet before Taivra waves them off with an impatient grunt, reaching around your [pc.leg] to grasp her throbbing ovi-cock and angling it back towards your drooling hole.");

	output("\n\n<i>“I think that’s enough of that,”</i> she purrs, pressing her cockhead against your [pc.vagOrAss " + x + "], letting the hefty glaze of spittle on both your bodies ease her initial entry. A moan escapes your lips as Taivra’s supporting hands lower your butt down, helping you to descend on her royal rod. A long moment of pressure gives way to a sudden fullness, completely and totally stretching your [pc.vagOrAss " + x + "] around Taivra’s blunted cockhead. You can feel her spiny pleasure-nubs digging into your tender flesh, scraping along your inner walls until you’re screaming with ecstasy, rubbing your [pc.butt] on the queen’s thighs as moisture drools down onto her lap.");
	if(x >= 0) pc.cuntChange(x,chars["TAIVRA"].cockVolume(0));
	else pc.buttChange(chars["TAIVRA"].cockVolume(0));

	output("\n\nA sudden, sharp pain shoots through your [pc.ear], abating into a faint hint of pleasure as you feel Taivra’s teeth on your [pc.skinFurScales]. Her hands ");
	if(pc.biggestTitSize() >= 1) 
	{
		output("grab your [pc.breasts], roughly grabbing and squeezing your boobs");
		if(pc.canMilkSquirt()) output(" until [pc.milk] squirts from your teats");
		else output(" and [pc.nipples]");
	}
	else output("run across your [pc.chest], rubbing and pinching at your [pc.nipples]");
	output(". Your lover pulls you close against her own chest, running her breasts along your back, holding you deep on her throbbing, drooling ovi-cock. Her knot presses against your ");
	if(x >= 0) output("pussylips");
	else output("asscheeks");
	output(", hot and heavy against the entrance to your hole... but never trying to push in.");

	output("\n\nTaivra clearly doesn’t want you to just sit there and take a ");
	if(x >= 0) output("womb");
	else output("belly");
	output("-full of eggs, and so you start to move your [pc.hips]. With a moan of enjoyment, you slowly rise up, dragging Taivra’s spines back through your [pc.vagOrAss " + x + "], letting them tease and rub at your spasming, tender channel. You can feel her cock throbbing inside you, her heartbeat causing her shaft to grow and spurt its dark, viscous lube into your ");
	if(x >= 0) output("twat");
	else output("asshole");
	output(", adding her own juices to the mix of spit");
	if(x >= 0) output(" and your own pussyjuices");
	else if(pc.ass.wetness() >= 1) output("and your unnaturally lubed ass");
	else output("slathered in your behind");
	output(".");
	//if hole isn’t preggers: 
	if((x == -1 && !pc.isPregnant(3)) || (x >= 0 && !pc.isPregnant(x))) output(" After a moment you realize that your queen’s cock is getting you ready to carry her eggs, packing your hole with as much of her sticky juice as she can!");

	output("\n\nYou give Taivra a wink over your shoulder and start to really bounce, determined to milk out every drop of her fem-cum before you reach your limit.");
	if(pc.hasCock()) output(" She returns your affection with a quick reach-around, wrapping her plated fingers around [pc.oneCock] and starting to stroke you off to the same rhythm as your rising hips.");
	output(" The more you ride her, the more Taivra’s cock throbs, and the more the harem girls sprawling around her moan and cry with pleasure as her tail-cocks thrust into them, starting to cum one after the other, filling their wombs with parasitic seed. The queen’s got a very different load waiting for you, however...");

	//if hole isn’t preggers:
	if((x == -1 && !pc.isPregnant(3)) || (x >= 0 && !pc.isPregnant(x))) 
	{
		output("\n\nTaivra’s head rolls back, bellowing a feral roar of pleasure as the crown of her ovipositor erupts in what feels like a geyser of wet head, following by a firm pressure straining your hole - an egg! Your eyes wide, lips curling in a silent scream as wet bumps pop into your ");
		if(x < 0) output("bowels");
		else output("womb");
		output(", one after the other. You feel incredibly full, hands wrapping around your [pc.belly] as the royal eggs flood inside you.");
		if(pc.hasCock()) output(" Between the sudden pressure of eggs stretching you out and the queen’s skillful handjob, you can’t help but cum! <i>“That’s it, join me!”</i> Taivra groans, stroking faster as the first jet of [pc.cumNoun] splatters across the dias of her throne. <i>“I want you to feel every bit of pleasure I do...”</i>");
		output("\n\nWhen the final egg settles inside you, you feel so bloated and worn out by the ordeal that it’s hard not to just fall asleep on the queen’s lap. She chuckles and wraps her arms around your swollen belly, giving you a surprisingly tender hug. <i>“");
		//if fertile eggs:
		if (taivraHasFertileEggs())
		{
			output(" Take care of these for me, won’t you, love? Take them out to the stars, show them a world I’ll never see...");
			// workaroundy thing I added for the goocubater
			pc.createStatusEffect("Goo Gloryholed");
		}
		else
		{
			output(" Don’t worry, love, they’ll dissolve soon enough. Can’t have you waddling around with a belly full of empty eggs... at least, not without me there to enjoy it.");
		}
		
		//put load in orifice and knock up appropriately.
		if (x == -1) pc.loadInAss(taivra);
		else pc.loadInCunt(taivra, x);
		
		// Can remove it here, or the pregnancy will clean it up later too
		if (pc.hasStatusEffect("Goo Gloryholed")) pc.removeStatusEffect("Goo Gloryholed");
	
		output("”</i>");
	}
	else
	{
		output("\n\nTaivra grunts and thrusts herself deep into you, gliding through your lube-glazed walls until her knot presses hard against your hole. You cry out as the queen hammers her hips up into your ass, ramming her thick bitch-breaker home into your [pc.vagOrAss " + x + "]. Your cries turn into a scream of ecstasy as you’re stretched to the limit, tied on Taivra’s throbbing mass of nyrean knot and left able to do nothing but rock on her lap, grinding the mass of flesh in your battered hole");
		if(pc.hasCock()) output(" until you cum, shooting a thick rope of spunk across the throne’s dias");
		output(". Your lover’s fem-cum floods into you, pumping your ");
		if(x < 0) output("gut");
		else output("womb");
		output(" with her creamy, hot fem-cum.");
	}
	output("\n\nYou relax in Taivra’s lap after that, breathing hard as her thick ovipositor slowly deflates inside of you, dragging her spines through your [pc.vagOrAss " + x + "] one last time before you’re free - and drooling moisture out of your thoroughly-fucked hole.");
	output("\n\n<i>“I suppose I can’t convince you to retire with me to my chambers, love?”</i> Taivra murmurs, gently stroking her sodden prick as you dislodge yourself from her. <i>“That only got me ready for a proper fuck...”</i>");
	
	processTime(22);
	pc.exhibitionism(2);
	pc.orgasm();
	IncrementFlag("TAIVRA_THRONE_SEX");
	
	//[Next]
	clearMenu();
	addButton(0,"Next",taivraRepeatScenes);
}

// Egg-Stuffed Beta
// Play after the PC fertilizes Queen Taivra's eggs, and before she naturally does away with them. When the scene plays, she is emptied of eggs and ready to be fertilized again. Scenes procs when entering Taivra's throne room.
public function taivrasEggStuffedBeta(response:String = "intro"):void
{
	clearOutput();
	showTaivra(true);
	author("Savin");
	clearMenu();
	
	switch(response)
	{
		case "intro":
			output("When you enter Taivra’s throne room, you see that for once, her tails aren’t buried in a clump of submissives mewling at her feet. Instead, she’s sitting alone at the throne save for a single naked beta resting sideways in her lap. The lesser huntress has the typically voluptuous and well-hung form for her race, save for a gravid belly. Her gut is swollen with uneven weight, and both she and Taivra absently run their hands across the slightly-lumpy flesh of the beta’s stomach.");
			output("\n\n<i>“Ah, [pc.name]!”</i> Taivra says as you approach, relaxing regally on her throne. <i>“You’re just in time to meet the mother of our children. Say hello, dearest.”</i>");
			output("\n\n<i>“Y-your majesty,”</i> the beta murmurs demurely, giving you as deep a bow as she can over her distended belly. <i>“It’s a great honor.”</i>");
			if(flags["FUCKED_TAIVRAS_BETA"] == undefined) output("\n\nYou give Taivra a confused look. What’s going on here?");
			output("\n\nYour royal mate gives you a purple-lipped smile, stroking her beta’s spiny hair. <i>“I just finished giving our loyal submissive here the clutch of eggs </i>you<i> gave me. A lovely new batch of royal heirs.”</i>");
			output("\n\nIs that right?");
			if(flags["FUCKED_TAIVRAS_BETA"] == undefined) output(" You suppose that’s to be expected, though you were kind of hoping you’d get to see Taivra carry them.");
			output("\n\nTaivra laughs lightly, idly running a finger along the soft flesh of her beta’s ovipositor. Though obviously unused in the queen’s service, the organ is still juicy from a recent orgasm and stained with purple slime.");
			if(flags["FUCKED_TAIVRAS_BETA"] == undefined) output(" <i>“Don’t be silly, darling. It wouldn’t do for the queen to be seen like this,”</i> she pats the beta’s belly for emphasis. <i>“Besides, this frees up room in my womb for your next load of " + pc.mf("kingly", "queenly") + " seed. You’ll give me more soon, I hope?”</i>");
			else output(" <i>“You just worry about giving me another load of your " + pc.mf("kingly", "queenly") + " seed, darling, and I’ll have betas lined up along the royal road with bellies stuffed just like this.”</i>");
			output("\n\nWhether from the thought of you having your way with her alien quim-cock again, or from fantasizing about stuffing more worshipful submissives with eggs, the queen leans back in her chair and utters a deep, sultry moan. Her legs spread slightly, revealing her naked ovipositor starting to rise from its half-hard state, jumping with Taivra’s sudden arousal.");
			output("\n\n<i>“First, though,”</i> she smirks, snapping her fingers in the beta’s face. <i>“Shouldn’t you be doing something, broodless?”</i>");
			output("\n\nThe young huntress starts with a gasp, scrambling heavily out of Taivra’s lap. She crawls onto her knees between the queen’s legs, nuzzling her face into Taivra’s crotch and starting to lick. With a veteran cock-worshipper’s expertise, she runs her tongue back and forth along Taivra’s tender underside, balancing the heft of queenly cock on her lips until they find their way to the flared crown and wrap lovingly around it.");
			output("\n\nTaivra smiles and reaches down, playfully teasing one of her beta’s long ear. <i>“Good girl. As for you, love,”</i> she adds, propping a foot up on the huntress’s back and folding her hands in her lap, looking to you with a lovely smile. <i>“See anything you’d like?”</i>");
			
			processTime(7 + rand(5));
			if(flags["FUCKED_TAIVRAS_BETA"] == undefined) flags["FUCKED_TAIVRAS_BETA"] = 0;
			pc.lust(15);
			
			// [Maybe Later] [Fuck Beta]
			addButton(0, "Later", taivrasEggStuffedBeta, "later", "Maybe Later", "You’ll come back when Taivra’s done.");
			if(pc.hasCock())
			{
				if(pc.virility() <= 0) addDisabledButton(1, "Fuck Beta", "Fuck Beta", "You need to be producing virile seed to do this!");
				else if(pc.lust() >= 33) addButton(1, "Fuck Beta", taivrasEggStuffedBeta, "fuck beta", "Fuck Beta", "Make sure those eggs are nice and fertilized while the beta babe’s busy with your mate. Bend her over and take her ass.");
				else addDisabledButton(1, "Fuck Beta", "Fuck Beta", "You need a penis for this!");
			}
			else addDisabledButton(1, "Fuck Beta", "Fuck Beta", "You need a penis for this!");
			break;
		case "later":
			output("<i>“Maybe later,”</i> you say, taking a step back towards the door.");
			output("\n\nTaivra sighs with mock disappointment, though it quickly turns into a stifled moan as her beta takes her to the base. <i>“As you wish, [pc.name]. Until next time.”</i>");
			
			processTime(1);
			
			//addButton(0, "Next", move, "2G17");
			addButton(0, "Next", move, rooms[currentLocation].eastExit);
			break;
		case "fuck beta":
			var x:int = rand(pc.cocks.length);
			
			output("Grinning mischievously, you shrug off your [pc.gear] and approach the throne. You need to make sure those eggs are completely fertilized, after all.");
			output("\n\n<i>“Naturally,”</i> Taivra purrs, patting the beta’s back with her foot.");
			output("\n\nThe lesser huntress immediately raises her firm rump in the air, presenting herself to her alien " + pc.mf("king", "queen") + ". Her nyrean phallus hangs half-hard beneath her, seemingly resigned to its uselessness; her ass, however, winks invitingly. The black hole has already been stretched out by your royal mate, still agape from Taivra ovipositing her.");
			output("\n\nThe way she’s been opened out, you’re easily able to slide three fingers in, exploring the quivering depths of the bug-girl’s hole. You don’t even need lube here: Taivra took care of that, and the beta’s still wet as a pussy back here from her alpha’s egg-laden cum. Your fingers come away sticky with Taivra’s juices, but the beta’s egg-hole remains alluringly open.");
			output("\n\nSince your hand’s already wet, you grab your [pc.cock " + x + "] and spread the extra lubrication around your crown before angling it down into the beta’s waiting ass. She gives off a pathetic little whine around as your prick glides into her, but her own throbs and leaks between her legs, smearing her thighs with purple cream. Tavira smirks and reaches over, taking your other hand in hers.");
			output("\n\n<i>“Meet you halfway,”</i> she purrs, using her legs to guide the beta’s head down until the egg-stuffed slut’s lips press against Taivra’s swelling knot. You take that as your cue to push inwards, slowly but insatiably sinking inch after inch of cockmeat into your shared beta’s ass. The only thing that stops you is");
			if(pc.cLength(x) >= 30) output(" her belly bulging with so much cockmeat that you can feel the royal eggs squirming around your crown, and some small part of you hopes at least one of the thick, throbbing things you’re poking is indeed Taivra’s cock.");
			else if(pc.hasKnot(x)) output(" your knot pressing into the gaping embrace of the incubatrix’s ass. She’s so gaped-out that you slide in with little effort, less to tie her and more to give her that extra thrill of an even thicker penetration. You slide back out with ease.");
			else output(" your hips pressing up against the bug-slut’s behind, proof that your entire pride is snugly sheathed inside her.");
			output(" Your mate smiles and the beta moans, a husky, needy sound uttered around a mouthful of royal cock.");
			
			pc.cockChange();
			
			output("\n\n<i>“Good girl,”</i> Taivra repeats, using her legs to stroke the other nyrea’s plated back. <i>“Take every inch like a proper royal cock-cozy.”</i>");
			output("\n\nThe beta mewls, but even the faint praise from her mistress seems to get her off. You feel her hole tightening around your girth, and her own cock splatters the stone floor with a pool of musky juices. Considering how Taivra’s been treating your “royal cock-cozy,” something tells you she’ll be licking up the mess before too long. Feeling just the faintest pang of sympathy, you reach your lube-slicked hand down and grab the beta’s throbbing ovipositor. She gasps and shivers, clenching down that much harder around you.");
			output("\n\n<i>“Such a kind [pc.master],”</i> Taivra chuckles, her last word fading into a lusty moan. The beta’s hands clutch around her queen’s knot, massaging the turgid bitch-breaker as lovingly as she might a lover’s breast. Good girl, indeed. You give her a few more tender strokes of encouragement, slowly working until the rhythm of your reach-around matches the steady pace of your ass-fucking. Between your hand and cock, and Taivra’s cooing praise, the poor beta just can’t help herself. Her back arches sharply and her half-hard egg-layer erupts again, drooling more and more viscous girl-cum onto herself and the floor. Her ruined ass even approaches something you might almost describe as “tight,” clenching around your thrusting member.");
			output("\n\nSomehow, the little beta manages to start thrusting back against you, grinding her plump booty against your [pc.hips] like she’s trying to cram even more of your girth inside her. You grunt in appreciation, wrenching your hand free of Taivra’s to give her a rough smack on the ass. Her rump jiggles with the impact, getting her that much tighter... and moving that much faster, eagerly humping your turgid length until between the two of you you’ve built up a vigorous pace of rough ass-fucking, hammering that ass like a piledriver and making her love every second of it. The beta’s egg-swollen belly sways pendulously every time your hips hammer her behind, swaying with the great weight of your royal spawn... and adding even more to the poor slut’s overwhelming arousal. You quickly lose track of how many times her flaccid egg-layer squirts its feminine load, over and over until she’s just shooting blanks and dribbling constantly, too insensate from the pleasure to do anything but fuck and moan.");
			output("\n\nThat, and squeeze your dick like every fiber of her being has been turned exclusively to your pleasure, massaging your [pc.cock " + x + "] in ways a girl this ruined shouldn’t be able to. Now that she’s so into it, you can barely believe that she just had a horse-sized ovipositor blow its eggy load in her bowels. Her sphincter contracts and caresses around every inch of cockflesh you can feed her, practically begging for more -- or for a second royal load.");
			output("\n\nWhether you want to or not, the glorious anal milking she’s putting out leaves little room to do anything but seed her bowels once again. If any of Taivra’s eggs weren’t fertilized before, you’re about to make sure they are now! Growling with primal need, you let her build you up to the peak of climax before ramming yourself in to the hilt");
			if(pc.hasKnot(x)) output(", knotting the suddenly-tight slut");
			output(" and letting nature take its course. Your hand digs into her ass, holding her steady until the rush of seed you can feel in your loins reaches the crown of your cock, then goes bursting forth in a rapturous eruption. The beta squeals with delight, and even Taivra gasps, clutching her sub’s head down on her crotch and probably blowing her own load in unison with yours.");
			output("\n\nYou leave yourself hilted in the submissive’s ass for a long, long time, just slowly rocking your hips and letting her wild contractions milk out every drop of royal cum you have to give.");
			if(pc.cumQ() >= 20000) output(" If you thought her belly looked bloated before... she’s so stuffed with your cum that you’ve got no idea how she’s going to stand up, now!");
			output(" She accepts every little spurt of your climax with eagerness, moaning and squeezing until your orgasm fully abates, and you find yourself slowly withdrawing from her thoroughly abused, broken-in egg-hole.");
			output("\n\n<i>“Poor thing’s completely out of it,”</i> Tavira chuckles, popping her softening ovi-cock out of the beta’s cum-drenched lips. The sub whimpers and slowly rolls onto her side, leaking from both ends and blissfully clutching her swollen belly. <i>“Mmm, you really do know just how to treat a horny huntress, don’t you, love?”</i>");
			output("\n\nYour queenly mate gives you a playful smile and pulls you up onto her throne’s dais beside her, leaning up to plant a kiss on your lips. When she breaks it, Taivra brushes her lips from yours up to your ear, just long enough to whisper, <i>“My heart’s racing, thinking about you doing that to me...”</i>");
			output("\n\nShe gives you a little nip on the ear and reclines into her throne, crossing her legs in a way that might make her look positively regal... if it weren’t for the soft breeder resting on her slickened thighs. <i>“I’ll make sure our brood’s bearer is well taken care of, [pc.name]. Why don’t you go and catch your breath, and we can see about making sure your mate is, too.”</i>");
			output("\n\nThis private, flirtatious side of your royal mate fades as the throne room doors open again and her guards return, doubtless drawn by the climactic cries from within. You gather your gear and step back, giving your queen a knowing wink.");
			
			// Reset Taivra's preg timer.
			flags["TAIVRA_FERTILE"] = 0;
			IncrementFlag("FUCKED_TAIVRAS_BETA");
			pc.clearRut();
			processTime(30 + rand(21));
			pc.orgasm();
			
			//addButton(0, "Next", mainGameMenu);
			addButton(0, "Next", move, rooms[currentLocation].eastExit);
			break;
	}
}

// Appears if you sleep in the queens bed after marrying her
public function taivraMorningEvent():void
{
	clearOutput();
	showTaivra(true);
	author("Stygs");
	output("As you slowly open your eyes, you realize that the room has become a lot darker than you remember. The only light now seems to stem from some fungi patches on the wall, filling the chamber with an eerie gloom. While trying to figure out what happened, you suddenly become aware of someone else moving next to you.");
	output("\n\n<i>“Ah, [pc.name]. Finally awake?”</i> says a familiar voice in the gloom right next to you. Shifting around, you see the silhouette of Queen Taivra lying in the silken blankets besides you, an old book in her hands and a smile on her face.");
	output("\n\n<i>“I have to admit, you star walkers have a surprisingly deep sleep.”</i> she says, putting the book away and slowly turning to face you. ”</i>I feared I would have had to leave again before you woke up.”</i>");
	if (flags["TAIVRA_OLD_BOOK"] == undefined)
	{
		output("\n\nYou tell her you are surprised to see her read a book. <i>“Oh, that?”</i> the nyrean queen suddenly breaks into laughter. <i>“Don’t tell me you’re surprised I can read? Did you think we were illiterate savages just because we live underground?”</i> ");
		output("\n\nShe pauses for a moment before she continues, now a somber tone in her voice. <i>“To be truthful, most of my private library stems from the myr, traded or raided from the surface. As far as I can tell, our people never cared much about writing or the arts.”</i>");
		output("\n\nYou quickly apologize and explain that you didn’t intend to insult her; you just didn’t expect her to be able to read in the darkness.");
		flags["TAIVRA_OLD_BOOK"] = 1;
	}
	else output("\n\nIt takes her a moment to note the confused look on your face.");
	output(" <i>“Ah, of course”</i> your lover answers, <i>“I tend to forget that offworlders are not as adapted to the twilight of the caves as we are.”</i>");
	output("\n\nWithout a further word, Taivra gets up and steps over to a lantern in the center of the room, opening its blinds. In a moment’s notice, the chamber is flooded with a pleasant blue light. <i>“Better now, my dear? Can’t have you stumbling around in the dark.”</i>");
	output("\n\nWith the light illuminating her now, you can’t fail to notice that she isn’t wearing any of her usual attire – nor can you fail to notice the quivering tentacles behind her, giving away her excitement despite the otherwise calm demeanor.");
	output("\n\nA moment later she’s back to lying beside you with a lecherous smile on her face. <i>“So, [pc.name], I hope you’re not planning on leaving anytime soon.”</i> she coos, slowly cupping one of her breasts to accentuate her statement while one of her tentacles starts wrapping around your [pc.legOrLegs]. It’s pretty obvious what she expects from you are this point.");
	output("\n\nSo, how do you want to make love to your royal ");
	if (flags["BEAT_TAIVRA_TIMESTAMP"] == undefined) output("spouse?");
	else output("partner?");
	processTime(5);
	pc.createStatusEffect("Taivra Bed Event Cooldown", 0, 0, 0, 0, true, "", "", false, 1440);
	
	// Remeber to update goToTaivrasChambersForSex too if you change anything here
	queenTaivraSexMenu(true);
}

public function taivraMorningEventLeave():void
{
	clearOutput();
	showTaivra(true);
	author("Stygs");
	output("As much as you want to spend more time with your alien wife, you have an important race to win. After all, who knows what your rival is doing right now...");
 	output("\n\nQueen Taivra is obviously very displeased with your decision, but having met [rival.name] herself, it doesn’t take much to convince her. You are quick to assure her that you will come back as soon as your quest allows it.");
	output("\n\nAs the queen leaves the room, you can’t help but feel ")
	if(pc.isNice()) output("a pang of guilt for the poor betas");
	else if(pc.isMischievous()) output("a bit of pity for those in her harem");
	else output("malicious glee thinking about the slaves");
	output(" that are now going to serve as your substitutes.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

/*
9999
////Taivris xpak idea:
>Challenging you over ascension. Can let her be your "heir."
Taivra be like, <i>“If she’s so desperate to be the one to inherit your star-borne throne as well as mine, why don’t you tell my ambitious princess to present herself to her mother’s chosen mate for breeding? As the mother of your blood heirs, she’d guarantee herself a place at your side, no? Or perhaps she could stop sniveling from my harem chambers and challenge me for your hand! I’ve been waiting for years, but I’m starting to think Taivris is perfectly content to let me die of old age first. Tsk, if she keeps that up, you off-worlders might almost think we’re civilized!”</i> 
*/

//Queensguard Repeat Scenes
//Unlock after ~12 hours post-dungeon. QG is found next to the fountain near the queen’s chambers.
public function queensGuardRepeatApproaches():void
{
	clearOutput();
	showBust("QUEENSGUARD");
	showName("\nQUEENSGUARD");
	author("Savin");
	//First Time Greeting
	//if(flags["MET_CERRES"] == undefined)
	// {
		output("Seeing the wounded nyrean knight standing beside the fountain, you decide to go over and check on your subject.");
		output("\n\nAbnormally for her, you suspect, her helmet is resting on the stone beside her, revealing a pale, battle-scarred face and a head of short, spiky black hair falling just over her oddly amethyst-colored eyes. Hearing you approach, she blinks away a thousand-yard stare and turns to face you, gauntlets respectfully abandoning the planted hilt of her sword.");
		output("\n\n<i>“My " + pc.mf("lord","lady") + ",”</i> she says with a slight nod of her head.");
		output("\n\n<i>“Queensguard, isn’t it?”</i> you ask. That can’t actually be her name, can it?");
		output("\n\nShe answers with a faint smile, planting one of her armored hands on her side. <i>“Most of Queen Taivra’s subjects, and more importantly, her enemies, know me by that name,”</i> she says with a hint of pride. <i>“I know of your arrangement with my queen, so of course you may call me Cerres, if you wish. That is my given name.”</i>");
		output("\n\nYou notice that her breastplate’s been patched with an off-color plate of steel, hiding the injury Dane left her with during your cousin’s escape. She doesn’t seem any worse for wear, despite having been on the verge of death at the time. Taivra must have a truly talented healer at her disposal, and you find yourself asking the knight if her wounds have fully healed.");
		output("\n\n<i>“They have. Thank you, my " + pc.mf("lord","lady") + ",”</i> she answers crisply. <i>“The injury looked worse than it was. Debilitatingly painful, but not life-threatening. A bit of crystal goo and some medical herbs were enough to get me back on my feet, though I don’t think I’ll be doing much fighting for a while.”</i>");
		output("\n\nA shame, you tell her. Her fight with Dane was certainly something to behold - she’s a great warrior, even among nyrean huntresses.");
		output("\n\nShe smiles faintly at that, resting a hand back on the hilt of her very un-huntresslike sword. <i>“I’m no huntress, though you’re kind to say so. We males don’t take that title, no matter how well it may fit.”</i>");
		output("\n\nWait, Queensguard’s a... a male? That’s certainly new - you’ve never seen a male nyrea as anything but a submissive in your time on Myrellion. Still, with skills like hers, you imagine Queensguard must fought her way to the top and earned her place. Taivra doesn’t seem like the type to keep pets as mere gimmicks.");
		output("\n\nMaybe there’s more to Queensguard than a mere soldier after all...");
		flags["MET_CERRES"] = 1;
	// }
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


/*Princess Deets
Female Nyrea w/Harem of Slave Boys
Barbed Hair with Citrine adornments.
Small for girl Nyrea 5’8”
Eyes
Huge, erogenous ears
Bigger than normal tits: G-cup - purple nips!
Smaller than normal cock - 8” long?

Princess Deets
Her Rooms
Room 2C9 Stairway
Room 2A9 Harem Chamber
Princess Beaten Bonus
Princess Bonus
Resist
Fight Princess!
Bad End
Combatuuu Victoryuuuuuu
Leave
Cowgirl Dat Bitch & Make Out With Her Harem
Buttfuck The Princess While She Fucks A Loyal Harem Whatever
[Unfinish] Harem Polishjob + Princess Bukkake
Generic Orgy Join*/


public function showPrincess():void
{
	if(inCombat()) showName("FIGHT:\nPRINCESS");
	else showName("NYREAN\nPRINCESS");
	if(inCombat()) showBust("PRINCESS_BANDOLEER");
	else showBust("PRINCESS");
}

//Princess Bonus
public function princessBonus():Boolean
{
	showPrincess();
	output("\n\nThe nyrean princess, wearing a crown of citrine embedded into her head-spikes, lounges amongst the males, holding a pair of them against her breasts while another two bob up and down along an eight-inch, flaring shaft.");
	output("\n\nAt the sight of you, she pushes the topmost set away, leaving the busy bottoms to continue orally polishing her rod. <i>“How dare you intrude upon the royal harem!”</i> She releases a gooey wad into a suckling mouth, seemingly unperturbed by her own irritation. With a haughty huff, she gazes at you with lust-lidded eyes. <i>“Unless you’ve come to join the harem. Is that it, star-walker? I suppose you are cute enough to hold a few eggs...”</i>");
	output("\n\nYou didn’t come here for that, but that wouldn’t be such a bad end to your adventures. Do you join her harem or resist?");
	clearMenu();
	addButton(0,"Join",loseToPrincessYeGit,true,"Join","Give up your quest and join her harem.");
	addButton(1,"Resist",resistPrincessYouSloot,undefined,"Resist","Looks like you’ll have to put this overblown princess in her place.");
	return true;
}

//Resist
public function resistPrincessYouSloot():void
{
	clearOutput();
	showPrincess();
	//Bimbo
	if(pc.isBimbo()) output("<i>“Like, maybe you should join my harem,”</i> you suggest with a sensuous sway of your [pc.hips]. <i>“I bet I’m the funnest boss you’ll ever have!”</i> After a lengthy pause, you add, <i>“And I even like your lady-dick, and stuff.”</i>");
	//Nice
	else if(pc.isNice()) output("<i>“No, I don’t think so.”</i> Looking at the too-meek <i>“males,”</i> you have a hard time seeing yourself in their position. Even if they’re having a great time, you couldn’t throw away your inheritance for that. <i>“Sorry, but I’m not the type to volunteer for that sort of thing.”</i>");
	//Mischievous
	else if(pc.isMischievous()) output("<i>“Oh, I’m not really looking for employment right now, but if you take it up with my agent after I’m free, we might be able to work something out.”</i> You favor her with a devilish grin. <i>“Though I might have an opening for you, if you wanna see the other side of the coin.”</i>");
	//Hard
	else output("<i>“I don’t think so, bitch,”</i> you retort. <i>“Just stay out of my way. I’m a little too busy to handle your frippery at the moment.”</i>");
	output("\n\nThe nyrea’s face goes pink with rage. <i>“You... you insolent whelpling! I’ll show you your place - on your knees with a belly full of eggs.”</i> She stamps a chitin-plated boot on the floor hard enough to make her tits bounce distractingly and fixes you with what’s clearly meant to be a soul-searing scowl. It looks more like a child’s petulant pout.");
	output("\n\nClearly, not all nyrea are as fearsome as those in the tunnels.");
	output("\n\n<i>“Wipe that grin off your face! I’ll put them in your ass too!”</i> The nyrean princess adds, sucking in a huge breath of air for more. <i>“Only your ass! You’ll be my little anal eggpot!”</i>");
	output("\n\nYou ignore her, looking around the room while she wears herself out.");
	output("\n\nThe sound of glass shattering against the wall alerts you to your mistake. You can actually feel a piece of moist glass bounce off your ");
	if(!(pc.armor is EmptySlot)) output("[pc.armor]");
	else output("[pc.butt]");
	output(". The princess is standing there wearing two bandoleers covered in red vials - and another two doses of red myr venom are in her cute, balled-up fists.");
	output("\n\nFuck. You’ll have to fight this tart. Princess or not, she’s a nyrea. She can probably take some damage.");
	processTime(3);
	clearMenu();
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new Princess());
	CombatManager.victoryScene(beatUpPrincessYeSlut);
	CombatManager.lossScene(loseToPrincessYeGit);
	CombatManager.displayLocation("PRINCESS");
	
	addButton(0,"Next",CombatManager.beginCombat);
}

public function loseToPrincessYeGit(willing:Boolean = false):void
{
	if(willing) clearOutput();
	showPrincess();
	//Bad End
	//Willingly join her harem
	if(willing)
	{
		output("Is there really any point in continuing this useless farce? You shrug and tell her you’ll join up.");
		output("\n\n<i>“How sweet,”</i> the princess titters while uncapping a vial of red venom. <i>“I require a test of loyalty from an incubator-to-be, of course.”</i> She extends the vial to you. <i>“Drink up, and commit yourself to your new life. I assure you, you will not want for food or sex again.”</i>");
		output("\n\nBottoms up! You knock back the aphrodisiac without giving yourself time for second thoughts. It burns with its own kind of quiet, soulful heat, relaxing your muscles while making your [pc.skin] tingle like a gigantic erogenous zone.");
		output("\n\n<i>“There there, little eggpot,”</i> the princess coos. <i>“You’ll make an excellent addition to my harem.”</i>");
	}
	//HP Loss
	else if(pc.HP() <= 0)
	{
		output("Somehow, you’ve managed to exhaust yourself against an opponent who hasn’t even tried to damage you. You slump to the ground, unable to rise, prostrate before her chitin-plated feet. A pointed toe presses under your chin, lifting your gaze up to your captor’s dangling cock. The x-shaped slit in the center is distended with a burgeoning droplet of light purple excitement.");
		output("\n\n<i>“Drink up, little eggpot,”</i> the princess coos while bending over you, uncapping a vial and holding it to your lips.");
		output("\n\nAt first, you try to keep the stuff out of your mouth, but then your lips are tingling with excitement, slowly going limp against the polished surface of the glass. You doubt you could hold them closed if you wanted to, and it feels so good, besides.");
		output("\n\n<i>“There there,”</i> coos your captor while replacing the empty vial with another. <i>“Now, doesn’t fighting me seem pointless?”</i>");
	}
	//Lust loss
	else
	{
		output("\n\nThere’s no resisting her and her venom, not in an enclosed space where she can pelt you endless amounts of the intoxicating venom, not when she’s so pretty and your body aches for the touch of a lover, and certainly not when your muscles feel like jello. The princess could probably pour you into a mold for all the resistance you would offer.");
		if(pc.isGoo()) output(" Good thing you’re made of goo, eh?");
		output("\n\n<i>“There there, little eggpot,”</i> the princess coos with something approximating warmth, but it does little to calm your nerves. At best, it’s comparable to the hot tubs favored by the natives of Uveto, filled with water just warm enough to avoid freezing solid.");
	}
	//Merge
	output("\n\nThe selfish prattle still sounds like music to your ears. Your former foe’s eyes are sparkling gemstones, her skin finer than the finest woven silk. You feel oddly compelled to touch and caress it, to submit yourself wholly to her pleasure. Why? You briefly ponder the question, but your whole body feels so good, practically thrumming with dull, red heat, that the only thing that makes any sense at all is holding yourself against her and allowing her to use you as she will.");
	output("\n\n<i>“You can call me Princess or Mistress. I don’t really care which, so long as you don’t dare to disgrace yourself by offering my proper name,”</i> Princess explains");
	if (!pc.isNude()) output(" while carelessly stripping away your [pc.gear]. She smiles when you help her pull away the offending garments, giving her better access to your form");
	else output(" while brazenly appraising your nude form");
	output(". She smiles when you stroke your hands along your body, accentuating the lewdest sections of your body for her pleasure.");
	output(" <i>“But do you really need to use your mouth for talking?”</i> She presents the throbbing hard length of her alien cock to you, stopping only to pour a vial of crimson aphrodisiac across it. It stiffens immediately, throbbing powerfully a scant few inches away from you while its precious coating drips away.");
	output("\n\nYou try to think of a reason to talk... but her cock is <i>right there</i>. You lick your lips, fumbling for words, but now your lips are all slick, practically ready to slip around Princess’ egg-depositor. Fuck, what did you want to say? Your eyes flick to her nub-lined flare, and any less-than-obscene notions flee your " + pc.mf("mind","pretty little head") + ". Words seem so distant, like half-shrouded figures buried behind a wall of too-thick mist, and every time you reach out for one, Princess’ nubby flare is right there, clear as day and tastier than the sweetest lollipop.");
	output("\n\nThe wet sound of your tongue slurping across its surface reaches your ears before you’re conscious of what you’re doing, what your body is doing, but it feels too good to stop. Your tongue fizzles and pops with the crimson-coated flavor of Princess’ all-too-lewd flesh. Sparkles of erotic electricity radiate from your flexing, licking muscle down to ");
	if(pc.hasToes()) output("your curling toes");
	else output("the very tips of your [pc.footOrFeet]");
	output(", priming your hips to thrust and grind, your back to arch, and your eyelids to flutter dreamily. Your [pc.lips] part around the deliciously welcome intrusion on their own. Slack-jawed, you’re shocked by how right it feels.");
	output("\n\nPrincess giggles and grabs you by");
	if(pc.hasHair()) output(" your [pc.hair]");
	else output(" the back of your head");
	output(", forcing another two inches of her myr-spit-infused prong into your gape-mouthed gullet. <i>“Not bad for a first-timer.”</i> Her slightly glazed eyes shine down at you, the purple of her iris nearly entirely devoured by her too-wide pupil. <i>“Suck it well enough, and I might even let you cum. Is that something you want?”</i>");
	output("\n\nYou gurgle your assent around the ever-increasing amount of cock in your throat. You’d lost track of your own needs while tending to the royal shaft’s insistent ache, but now that it’s been given voice, you remember just how flushed with libidinous urges your form has become. ");
	if(pc.hasCock() && pc.hasVagina()) output("It feels like cascades of moisture are drizzling down between your [pc.thighs], mixing in a dual-gendered puddle of generalized fuck-juice. A few stiff jerks or skillful, penetrative thrusts, and you’d cum your brains out.");
	else if(pc.hasVagina()) 
	{
		output("It feels like a cascade of moisture is pouring out from between your [pc.thighs], ");
		if(pc.wettestVaginalWetness() < 4) output("staining them with the fruit of your unsatisfied longing");
		else output("collecting in a fragrant puddle below");
		output(". All you’d have to do is stick a finger or two inside, and you could probably cum your brains out.");
	}
	else if(pc.hasCock()) output("It feels someone replaced [pc.eachCock] with a length of tungsten carbide pipe and then pressurized it to the breaking point. A few quick strokes, and you feel like you’d be spurting gallons of [pc.cum] onto your equipment, the floor – anywhere your captor asked you to.");
	else output("It feels sort of like hunger, only more sensuous, like your whole body is yawning wide open and begging for something to fill it. All it’d take is a finger or two, and you’d be cumming your brains out.");
	output(" You’re sure of it, but Princess hasn’t told you to do anything but suck. Your tongue undulates rhythmically along the intruding length while your [pc.lips] seal vacuum tight. Anything would be fun right now, but nothing quite as fun as earning an orgasm.");
	output("\n\nYou’re going to get that cum if it kills you.");
	output("\n\nExcited flesh surrounds you and your mistress. Any hint of resistance from the harem has died out, replaced with the numb acceptance and an idle desire to enjoy captivity as much as they can. Fingers caress the nyrean Queen-to-be’s happily thrusting form while sweaty palms caress and cup ");
	if(pc.biggestTitSize() <= 5 && pc.hipRating() <= 8) output("what curves they can find on your body");
	else output("your exquisite curves");
	output(". It’s a sublime sensation, immersing yourself in a sea of pliant flesh and welcoming caresses while your mouth is so brazenly used. The next thrust, you surprise Princess by taking her to the root, inviting her nub-tipped prick to see just how welcoming you can be.");
	output("\n\n<i>“Keep it up and you’ll earn that orgasm, slave,”</i> Princess offers mid-thrust.");
	output("\n\nYou look gratefully up at her, or what you can see of her past her exquisitely rounded breasts. Thanking her is out of the question. The only sound getting out of your well-fucked gullet is a seemingly endless cacophony of wet gurgles and sloppy slaps of flesh on flesh. Princess’ prick has flushed pink under the layers of bubbling spit, and the head has only grown over the course of your fellatio, forcing you to stretch your jaw wide in order to abide the royal rod.");
	output("\n\nIt’s surprising that it fits as well as it does. Not even the pulsing, pointed nubs on its tip can slow your eager, slurping cock-sucking. Creamy blobs of goo issue forth into your waiting and willing throat, one after another. Princess’ fingers pull tight against your [pc.hair], pulling hard throughout her orgasmic convulsions, seating your [pc.lips] firmly against her hairless abdomen while she repeatedly glazes the inside of your throat.");
	output("\n\nYour eyelashes flutter in enjoyment through it all. Though you get precious little contact to your erogenous zones (not even from the other slaves’ caresses), you feel a deep-seated contentment in bringing someone else to such a state of complete ecstasy, radiating little thrills of pleasure all the way out to where your fingertips are wrapped around Princess’ quivering thighs. You squeeze her affectionately. Nevermind what came before; she’s beautiful, lovely, and making you feel such powerful desire that you can barely comprehend it.");
	output("\n\nMid-swallow, you realize that you think you love her.");
	output("\n\nEventually, Princess stops wasting her fluids on your humble belly and pulls out, spilling one last string of condensed sexual desire across your chin. You take a swipe at it and miss, then forget it when a spunky burp erupts from your mouth. Blushing, you lick your lips and look uncertainly at your Mistress.");
	output("\n\nShe’s flopped backwards onto the bed and allowed an eager harem ‘boy’ to climb atop her still-stiff pole. She’s bucking and moaning with feverish intensity, surrounded by the cooing forms of a dozen of her compatriots in servitude. You make your way over to join them, awaiting your promised reward.");
	processTime(80);
	pc.lust(1000);
	clearMenu();
	addButton(0,"Next",princessBadEndPartDeus);
}

//[Next]
public function princessBadEndPartDeus():void
{
	clearOutput();
	showPrincess();
	output("You did get your reward later that night - along with what felt like a dozen eggs, but by that point, you were too far gone to consider an attempt at escape. Exhausted from the fight, the sex, and group massages, you were incapable of anything but sleep, and even then, your dreams were plagued with alien dicks and hundreds of warm hands caressing your body.");
	output("\n\nYou hardly wanted to wake. The dreams were too incredible to abandon for consciousness. How could you throw that away for something as banal as bleary eyes and awareness?");
	output("\n\nBut then Princess’ cock was on your lips. Your mouth tingled hotly and your eyelids fluttered closed. You may have had to wake, but you could live the dream if you wanted.");
	output("\n\nYou wanted to very much.");
	//[Next]
	processTime(100);
	
	pc.removeAll();
	var princess:Creature = new Princess();
	if(pc.hasVagina())
	{
		for(var x:int = 0; x < pc.vaginas.length; x++)
		{
			pc.loadInCunt(princess, x);
			pc.cuntChange(x, princess.cockVolume(0), false);
		}
	}
	pc.buttChange(princess.cockVolume(0), false);
	for(var i:int = 0; i < 12; i++)
	{
		if(pc.hasVagina()) pc.loadInCunt(princess, rand(pc.vaginas.length));
		pc.loadInAss(princess);
		pc.loadInMouth(princess);
		pc.orgasm();
	}
	
	clearMenu();
	addButton(0,"Next",princessBadEndPartTrees);
}

public function princessBadEndPartTrees():void
{
	clearOutput();
	showPrincess();
	output("Your quest is over, abandoned for endless nights of aphrodisiac-fueled debauchery and a parade of anally-incubated nyrea eggs.");
	badEnd();
}

//Combatuuu Victoryuuuuuu
public function beatUpPrincessYeSlut():void
{
	showPrincess();
	flags["PRINCESS_DEFEATED"] = 1;
	//Lust, somehow	
	if(enemy.lust() >= enemy.lustMax())
	{
		output("The nyrean princess sways almost drunkenly, her knees quivering with need. One hand dips down to stroke her lube-leaking cock as she stares at you, wide-eyed with lust and amazement. <i>“How...? How are you so fucking hot?!”</i>");
		output("\n\nShe drops to her knees, grunting like a beast and panting at the sight of you. Her other hand none-too-gently gropes her pliant breastflesh, kneading her healthy bosom with almost bruising enthusiasm. Her fingers twine about a pebbly, too-hard nipple as she arches her back in your direction. <i>“Please! F-f-fuck me! I’m yours!”</i>");
		output("\n\nHer harem looks on with longing, gleaming eyes. You have a hunch that even if you don’t take her, they will.");
	}
	//HP!
	else
	{
		output("The nyrean princess collapses to the floor and nearly bounces off her too-plush ass. Her fingers scrabble against the worked stone in an attempt to drag herself away from you, but all she manages to do is break a half-dozen of her vials between herself and the floor, slicking her back with a thick coat of the potent red venom. <i>“Noooo,”</i> she whines while her cock surges. Her pale skin flushes, and the reedy tone of her whining turns husky and breathless in the span of a half-dozen heartbeats.");
		output("\n\n<i>“I-I was supposed to be on top,”</i> the fallen nyrea sullenly gripes as her hands explore her blushing mammaries. The nipples pop out from between her fingers, almost begging to be sucked on. <i>“Please... j-just go! I didn’t mean to ah-ah-attack you, I swear!”</i> Alien lubricant drools from her flaring dicktip onto her taut belly.");
		output("\n\nIt’s normally difficult to get a read on someone with such black, featureless eyes, but in this case, the royal nyrea’s diminishing fear and still-mounting arousal are clearly broadcast by the relaxing of her brow and the way her mouth has shifted to a half-open pout. Her pale cheeks are blushed nearly crimson, coloring more deeply with every passing second. She looks away, but steals glances back at you a second later and licks her lips.");
		output("\n\nThere’s nothing for you here... well, besides a too-turned on princess - if princesses had eight inch cocks that looked like the love children of horse-cocks and kaithrit dongs.");
		output("\n\n<i>“Fuck me!”</i> the over-aroused alien abruptly cries while quivering on the floor. Somehow, she’s peeled her bandoleer off in order to better display her juicy tits to your eyes. <i>“I don’t care anymore! Just fuck me!”</i>");
		output("\n\nSo she wants it now? What do you do? If you don’t take her yourself, her harem will as soon as you turn your back. They’re watching the two of you with feverish looks in their eyes.");
	}
	output("\n\n");
	//menu!
	clearMenu();
	if(pc.hasVagina()) addButton(0,"RideCowgirl",cowgirlDatBitch,undefined,"Ride Cowgirl","Ride her cow-girl style before letting the harem have their turn.");
	else addDisabledButton(0,"RideCowgirl","Ride Cowgirl","You need a vagina in order to do this.");
	if(pc.hasCock() && pc.cockThatFits(enemy.analCapacity()) >= 0) addButton(1,"Buttfuck",buttFuckPrincessWhileSheFucks,undefined,"Buttfuck","Violate the princess the same way she planned to violate you.");
	else addDisabledButton(1,"Buttfuck","Buttfuck","You need a penis that’ll fit in her butt in order to do this.");
	if(pc.hasCock() && pc.biggestCockLength() >= 36) addButton(2,"PolishJob",haremPolishjob,undefined,"PolishJob","You’re way too big to fuck the princess")
	addButton(14,"Leave",leavePrincess2Harem,undefined,"Leave","Leave her to the not-so-tender affections of her harem.");
}

public function leavePrincessRoom():void
{
	currentLocation = "2C09";
	generateMapForLocation(currentLocation);
}

//Leave
//Exit the room
public function leavePrincess2Harem():void
{
	clearOutput();
	showPrincess();
	output("The moment you turn to leave the room, there is a flurry of movement from behind you. A dozen dickless nyrean ‘girls’ swarm your fallen foe, dragging her up into the bed. You spare a glance her way as they snap her arms and legs into the bondage equipment and fit a ring around her quivering dick. She looks like she wants to protest, but her lips barely manage a throaty, eager moan.");
	output("\n\nThe sounds of vigorous sex start when you close the door. At least she has her harem for company.\n\n");
	leavePrincessRoom();
	CombatManager.genericVictory();
}

//Cowgirl Dat Bitch & Make Out With Her Harem
//GO GO GO!
public function cowgirlDatBitch():void
{
	clearOutput();
	showPrincess();
	output("You step up and grab the princess beneath her arm, levering her up onto the bed while she quivers and blubbers. Her body hasn’t stopped oozing distilled sexual need. In fact, she lubricates even more freely at your rough handling, staining herself with her own glittering pre-cum. Batting her eyes, the princess implores you: <i>“Please...”</i>");
	//Nice
	if(pc.isNice())
	{
		output("\n\nYou pat her cock, feeling it throb against your palm, slick and juicy. <i>“Of course. Not all of us are as uncaring as you.”</i> Her hips lift to press back against you, and you smile back down at her. <i>“We’re both a little hot and bothered, aren’t we?”</i>");
	}
	//Mischievous
	else if(pc.isMischievous())
	{
		output("\n\nYou grin down at her. <i>“Please what? Please forgive me for being such an incredible bitch?”</i>");
		output("\n\n<i>“Please fuck me!”</i> the big-breasted dickgirl answers, lifting her hips to waggle her cock at you.");
		output("\n\nYou cock your head and consider your answer, drumming her dick as if you were distracted by deep thought. <i>“Not the answer I was looking for, but I suppose it’ll do, won’t it?”</i>");
	}
	//Hard
	else
	{
		output("\n\n<i>“Shut up and be thankful you turned me on too.”</i> You give her trembling cock a dismissive little flick and watch her jump in surprise. <i>“Now you just lie there, and let me wring some relief out of that undersized pecker of yours. Got it?”</i>");
		output("\n\nIt really isn’t small - average by modern human standards even - but you aren’t going to tell her that. Besides, the other nyrean dickgirls you’ve seen have been bigger.");
	}
	//Merge
	output("\n\n<i>“Yes!”</i> your fallen foe pants while grabbing her breasts and hefting them, lifting them to better present their pebbly purple teats for examination. Her heavy mammary mounds bounce and jiggle, compressing around the princess’s pretty little fingers until they’re almost entirely devoured in bountiful boob. Her eyelashes flutter, and her pale skin shines in the light. She’s a delectable fruit, just waiting to be plucked.");
	output("\n\nYou mount the bed in a swift");
	if(pc.isNaga()) output(", slithering");
	output(" motion");
	if(pc.legCount > 2) output(", not bothering to try and arrange all your [pc.legs] on a bed built for bipeds");
	output(". The princess squeaks meekly and looks at you with two parts excitement and one part confusion. She’s undoubtedly wondering why you haven’t mounted her just yet.");
	output("\n\nSmiling to yourself, you inch your way higher, dragging your [pc.vaginas] across your alien prize’s legs");
	if(pc.wettestVaginalWetness() >= 4) output(", coating them in a slick sheen of your ever-present lubrication");
	else if(pc.wettestVaginalWetness() >= 2)
	{
		output(", leaving ");
		if(pc.totalVaginas() == 1) output("a stream");
		else output("streams");
		output(" of liquid excitement to mark your travels");
	}
	else output(", dribbling bits of excited moisture along the way");
	output(". The higher you get, the faster the princess’s breathing becomes. You catch her chewing on her lower lip and staring at you with a look of undisguised lust, her nostrils flaring like a panicked doe’s.");
	output("\n\nYou’ve climbed high enough up <i>“Mount Royal Bitch”</i> to fondle her breasts if you wanted to, but instead, you press your fingers into the space between them. The nyrea gasps in surprise, then coos as you drag them lower, following the midpoint of her body down to the divot of her belly button. You idly circle it, feeling her pulse increase the closer you come to her still-pulsing member, mere inches away. Your own heartbeat is hammering in your chest now, excited by the presence of such a such a pretty, quivering piece of girl pinned beneath you - as well as by the way her meat swells and jumps at your near touches.");
	output("\n\nShe would probably go off if you touched her the right way, and that’s just fine. You cast a glance at her bandoleer of red myr venom and bare your teeth. She’ll stay hard more than long enough to take care of you, no matter how many times she gets off along the way.");
	output("\n\n<i>“P-p-please,”</i> the nyrea whimpers once more, shifting her hips to try to butt her nub-covered, blunt tool against your dancing fingers, desperate for any kind of stimulation.");
	output("\n\nTsking softly, you pull your fingers away, dragging them up an inch or two away, just far enough away that your captive, dickgirl princess can’t get at them. <i>“Patience, dear. ");
	if(!pc.isAss()) output("Let’s enjoy this, hmm?");
	else output("Let me enjoy this.");
	output("”</i>");
	output("\n\nWhimpers are all the answer you get.");
	output("\n\nThat’s fine by you. Pushing off the mattress for leverage, you drag your hips higher, sliding upward until the crease of [pc.oneVagina] is pressed tight against the trembling, girlish length.");
	if(pc.hasCock()) 
	{
		output(" Your [pc.cockBiggest] flops down atop it");
		if(pc.cumQ() >= 1000) output(", mixing its own clear pre in with the princess’s");
		output(".");
	}
	output(" Her urethra bulges beneath you, pumping out bullets of musky, lubricating fluid. It can’t be actual pre-cum, given what your Codex had to say about nyrean biology, but it’s certainly slippery enough to be indistinguishable from that early ejaculate.");
	var x:int = rand(pc.totalVaginas());
	output("\n\nYour breath catches in your throat as you rise higher on her length. Your folds spread across her like a butterfly’s wings and flutter just as quickly. The bumps on her head prod at [pc.oneClit] as you mantle onto her flaring crown, making you moan as you position her squarely in your entrance. The princess throws back her head and matches your moan pitch for pitch. Her eyes are closed, but her body squirms against yours. Her fingers reach out for your [pc.chest] to touch your [pc.skinFurScales], absently squeezing and stroking in the moments leading up to penetration.");
	output("\n\nYou let her grope you; it only makes you that much hotter, your [pc.vagina " + x + "] that much wetter. Beginning to relax your [pc.legOrLegs], you watch the nyrea’s face, enjoying the way her lips fall open, the way her lashes twitch nervelessly. Her fingers falter, but that’s just fine - her blunted tip is spreading you open");
	if(pc.vaginas[x].looseness() >= 4) output(" all too easily. Sometimes it’s nice to be a little gaped");
	output(". It’s so warm and so hard inside you, forcing your flesh to yield around it as it presses into you. Pampered royalty or not, her dick is something else.");
	output("\n\nThe pleasure robs you of most of your higher faculties by the time you’ve taken three quarters of her inside you. Your eyelids drift closed, and your arms cross the space between your bodies in an instant, grabbing hold of the nyrea’s tremendous tits and giving them an eager, passionate squeeze. She gropes right back");
	if(pc.biggestTitSize() < 1) output(", even though you’ve little more than [pc.nipples] for her to play with");
	output(", turning the space between your sweating, rutting bodies into a lattice of searching arms and stimulating fingertips.");
	pc.cuntChange(x,enemy.cockVolume(0));
	output("\n\nFuck, she’s got great tits! They’re so goddamn soft, with nary a blemish to be found. They seem almost virginal in their suppleness. Her nipples are like overripe, purple cherries, demanding to be licked and sucked. In a fit of lust-driven decision making, you lean down to do just that, letting the rest of her eight-inch, egg-laying cock sink deeply into your passage. Your eyes nearly cross from the pleasure, but you manage to seal your lips around a nipple all the same, tonguing it with such vigor that the princess squeals and shudders in delight. Her unbound breast jiggles in the most enticing way. If you weren’t squeezing your eyes closed from an overload of pleasure, it’d be nigh impossible to look away from the hypnotic sight.");
	output("\n\nBallooning inside you, the nyrea’s knot turns a mere pussy-filling experience into a slit-stretching symphony of delight. You can’t really pull off for another downstroke, not with that bulging sphere of erectile tissue locking you in place, but you can swivel your hips, twisting your passage in little rings around its over-swollen dance partner. Incredibly thick wetness floods over the deepest parts of you as you rock back and forth on the princess’s flaring she-cock.");
	output("\n\nShe’s cumming already!");
	output("\n\nPart of you wants to be mad that she’s hit her peak before you reached yours, but the hot liquid spurting against your walls has paroxysms of pleasure wracking your feminine flesh, and her fingers are ");
	if(pc.biggestTitSize() >= 1) output("squeezing your boobs tight");
	else output("teasing your [pc.nipples] well");
	output(" enough to make them feel aglow with flashes of violent pleasure. You moan and shake, swiveling your hips fast, dragging your [pc.clits] against the smooth, sweat-slicked skin of her crotch, revelling in the way her cock lurches upward with each ejaculation of purple-hued love.");
	output("\n\nThe nyrea’s breasts forgotten, you arch your back and grind your [pc.clits] against her, simultaneously pushing her endlessly orgasming rod into the deepest parts of your folds. The too-thick flare wrings bolts of shining bliss from your drenched cunt-walls, and the knot tirelessly presses at your entrance, hammering against your flesh to the tune of the princess’s heartbeat.");
	output("\n\nShe isn’t just filling you with her alien jism - she’s filling you with pleasure, carrying you to the heights of ecstasy with every passionate pulse of her knotty ladycock. You whimper as you feel it coming, aware of her veins throbbing against you, your flesh clamped tight against them, and then, you cum.");
	output("\n\nYou scream like a banshee, twisting and thrashing against the eight-inch rod impaling your [pc.vagina " + x + "], helpless against the tide of orgasmic juice your alien lover floods you with and your own too-powerful bliss. Your can’t even manage to quell your quivering [pc.legOrLegs]. Instead, you continue to scream out your enjoyment to the princess’s entire harem, letting them know just how much you’ve enjoyed laying claim to their mistress.");
	processTime(33);
	pc.orgasm();
	pc.loadInCunt(enemy, x);
	flags["PRINCESS_DEFEATED"] = 2;
	//[Next]
	clearMenu();
	addButton(0,"Next",princessCowgirlPt2);
}

public function princessCowgirlPt2():void
{
	clearOutput();
	showPrincess();
	output("When you finally come down, the knot inside you has dwindled enough to let you pop free. Streamers of purple gunk cake your [pc.thighs], evidence of the lewd tryst, but at least you’ve scratched the pernicious itch inside you.");
	if(pc.totalVaginas() > 1)
	{
		output(" If only you had the time ");
		if(pc.lust() < 50 && pc.libido() < 80) output("and desire ");
		output("to do it again with your ");
		if(pc.totalVaginas() == 2) output("other pussy");
		else output("other pussies");
		output(".");
	}
	output("\n\nThe slave harem moves in the moment you leave their still-hard mistress, piling onto the bed with almost fanatical enthusiasm. Well... it’s not quite revenge, but at least they’re in charge for a change.\n\n");
	processTime(15);
	clearMenu();
	CombatManager.genericVictory();
}

//Buttfuck The Princess While She Fucks A Loyal Harem Whatever
//Weirdos.
public function buttFuckPrincessWhileSheFucks():void
//HEY! THIS CHICK FUCKS!
{
	clearOutput();
	showPrincess();
	var x:int = pc.cockThatFits(enemy.analCapacity());
	if(x < 0) pc.smallestCockIndex();
	//Low exhib
	if(pc.exhibitionism() < 33) output("The sight of so many harem slaves watching you use their mistress gives you pause, but then your arousal takes back over. They’re no strangers to wild, bedroom romps, and you’re finally going to get some relief for your aching hard [pc.cocksNounSimple " + x + "].");
	//Med-high exhib
	else output("The sight of so many harem slaves watching you sends even more excited thrills through your body. So many of them are going to watch you violate their mistress! [pc.EachCock] is hard enough to chop wood with at this point.");
	//Merge
	output("\n\n<i>“On the bed,”</i> you order while tossing your equipment aside. <i>“");
	if(pc.isNice()) output("I’m going to fuck your ass, but don’t worry. I’ll be gentle.");
	else output("I’m going to fuck your ass until you’re my little anal princess.");
	output("”</i>");
	output("\n\nWide-eyed, the princess drags herself up onto the bed. Her head-spikes are quivering with nervous energy, but her cock is still just as hard as it was before, if not harder. <i>“P-please... I’ve never... never...”</i>");
	output("\n\nHelping her into position, you finish for her, <i>“...ever got fucked in the ass so hard that your legs stop working?”</i>");
	output("\n\nShe bites a purple-painted lip and nods at you over her shoulder.");
	output("\n\n<i>“");
	if(pc.isNice()) output("Don’t worry. You’re going to love it.");
	else if(pc.isMischievous()) output("Trust me, a dick-girl like you is going to love it... especially with all that myr venom you took in.");
	else output("You’re in for a treat.");
	output("”</i> You swat her ass and watch her plush backside wobble. This bitch has probably never done a day of real work in her life, let alone seen any kind of combat. Her body has been molded by luxury and privilege, leaving her all soft curves and pliant flesh. In between her cushy asscheeks, a puckered, virginal butthole practically winks at you.");
	output("\n\nYour hand is on [pc.oneCock] before you know it, and you’re pressing it forward, threading it between the plump cheeks to rub against her convulsing ring. The way she’s twitching there, she must not have been lying. She’s truly nervous about the presence of your dick back there, and it shows in the way she clenches. For now, you content yourself on sawing back and forth through her ass-cleavage, helping yourself to a bit of a warm-up buttjob.");
	output("\n\nThe princess whimpers, but her rigid prick is practically pissing her purplish pre-cum onto the already cummy bedsheets. Reaching around her hip, you grab hold of it and give it a few quick pumps, making her flare expand and her knot bloom against your palm. <i>“Relax,”</i> you tell her as calmly as you can, then inspiration strikes. <i>“Once I get my dick in your ass, you can call one of your harem sluts over to tend to yours.”</i>");
	output("\n\nClosing her eyes, the princess bites her lip and nods. At first you don’t feel much difference when you prod at her asshole, but little by little, she starts to give around the [pc.cockHead " + x + "] of your [pc.cock " + x + "], letting you get a bit farther each time. Her sphincter gradually loosens around you, and you reward her with a firm squeeze on her alien prong. Back and forth, you slide through her cheeks to gently press at her anus, working her more and more open. Damn, she’s tight!");
	output("\n\nMaking excited little squeaks, the nyrean royalty finally relaxes enough for you to press inside. Once her unspoiled asshole opens up to you, it’s almost too easy to slide into its snug, dick-squeezing embrace. She pants as you bury yourself in to the hilt, and dribbles more of her pinkish-purple dickslime into her sheets. Her muscles ripple around you, squeezing you like a glove that was made to accept your [pc.cock " + x + "].");
	if(pc.cockTotal() > 1)
	{
		output(" Meanwhile, your ");
		if(pc.cockTotal() == 2) output("other penis juts");
		else output("other penises jut");
		output(" out of the top of her asscrack, drooling pre-cum as ");
		if(pc.cockTotal() == 2) output("it slides");
		else output("they slide");
		output(" back and forth through her excess of booty-flesh.");
	}
	output("\n\n<i>“Atta girl,”</i> you call as you adjust to her anal embrace. You aren’t sure if it’s nervous energy, her drug-fueled arousal, or simply the reflexive instincts of a nyrean asshole, but her butt is absolutely milking your cock. You aren’t even fucking it, and her plush derriere is begging for you to ");
	if(pc.balls > 0) output("nut");
	else output("cum");
	output(" inside. <i>“You’re a natural.”</i>");

	output("\n\nThe blushing princess coos, <i>“Thank you,”</i> in a quavering voice, and looks up at you questioningly. <i>“C-can I?”</i>");
	output("\n\nYou draw back and thrust in, your passage made easy by her sweat and your pre-cum, reveling in the way her ring squeezes you. <i>“I said you could, didn’t I?”</i>");
	output("\n\nYou enjoy a slow back and forth rhythm while your defeated foe receives her reward for being such an obedient butt-slut in the form of a quivering slave-girl. While she’s still lining up with her harem slave, you give an especially firm thrust into her cushy asshole, forcing her cock deep into the slave’s creamy cunt.");
	output("\n\nBoth moan like the sluts they are, surprised by an onslaught of sudden pleasure they had no way of preparing for. The princess’s no longer virginal asshole clenches around you in the same way that her slave’s pussy is doubtlessly squeezing down on her, and you join them, releasing a throaty, joyous moan.");
	output("\n\nA dozen pairs of eyes watch the whole sordid thing. Some of the harem <i>“girls”</i> feign disgust, but a great many are touching themselves, slipping fingers into needy-looking slits or tweaking nipples that have no business being that hard. Two of them are even stroking each other while they watch their sister get plowed by their lust-broken mistress. You grin their way and keep at it, picking up the pace so that the princess’s bouncing bottom visibly ripples from the impact of your [pc.hips].");
	output("\n\n<i>“Yes!”</i> the Princess cries in wild abandon, lost to a chorus of chemical pleasure signals coursing through her body and soul with every nonchalant thrust.");
	output("\n\nYou note that when you pull back, the princess doesn’t bob back up with you - her cock is firmly and fully embedded in the cooing slut, sealed in place by a canine knot as securely as riveted steel. There’s no evidence of any alien jism escaping the slut’s stretched lips, but why would there be? Your aphrodisiaced-up royal is more effective at plugging entrances than any cork, and far more enthusiastic. They both moan and quiver, jumping in pitch whenever your thickness is fully embedded, squeezing down on whatever internal organs produce their sticky-sweet spunk.");
	output("\n\nGrabbing the anal princess by the shoulders, you pull her lips away from her toy and use the leverage to spear her still deeper, plowing her backdoor so hard that it doesn’t even try to close up when you accidentally pull back too far. Her ass is gaping open, pink and gooey, practically begging for you to slide back in. You do just that, grunting with near-feral ardor now that your prey has given herself wholly over to your judgement.");
	output("\n\n");
	if(pc.balls > 1) output("Your [pc.balls] twitch and tighten against your loins as your climax nears");
	else output("[pc.EachCock] twitches and jumps with pleasant convulsions as your climax nears");
	output(". Slowing down would seem the obvious way to prolong your pleasure, but you’ve no time for that. Instead, you redouble the pace until the whole room seems to echo with the sound of meaty slaps of crotch on ass. You can feel the princess clamp down as she cums again, and this time, you’re too close to do anything but unload inside her, giving her squeeze-toy of a rectum the [pc.cumVisc] treat it deserves.");
	//Lil/nocum
	if(pc.cumQ() < 5) output("\n\nThough it feels like you must have squirted out gallons, when you pull out, there’s exactly zero evidence of your orgasm. Maybe you’d better give your [pc.balls] a chance to brew up some fresh [pc.cumNoun]?");
	//Normal cum to 100ml
	else if(pc.cumQ() < 100) 
	{
		output("\n\nRhythmic convulsions of your internal muscles work to push out squirt after squirt of [pc.cumNoun], layering ropes of [pc.cumColor] in neat little lines across the nyrea’s intestines. At last, ");
		if(!pc.hasKnot(x)) output("your body’s frenzied ejaculation pauses");
		else output("your [pc.knot " + x + "] recedes");
		output(", and you’re able to pull yourself out to admire your handiwork. A small trail of [pc.cum] leaks out of her asshole to slide down the princess’s leg.");
	}
	//High cum - 100ml to 500 ml
	else if(pc.cumQ() < 500)
	{
		output("\n\nPowerful contractions of your internal muscles wring out huge ropes of [pc.cumNoun], pouring out enough reproductive gunk to paint the majority of your butt-loving nyrea’s anal cavity. When ");
		if(!pc.hasKnot(x)) output("you finally stop adding to the [pc.cumColor] flood and ");
		else output("your [pc.knot " + x + "] finally recedes, and you ");
		output("pull out, you’re treated to the sight of a half-dozen streams of [pc.cum] rushing from the recently-violated asshole. Most dribble down her legs, but at least one trickles down the underside of her cock and into her squirming pet.");
	}
	//Very High cum! 501 to 2L
	else if(pc.cumQ() < 2000)
	{
		output("\n\nEruptions have more in common with your climax than most orgasms. Powerful contractions push out ropes of [pc.cumNoun] so thick that they seem more like waves, rolling in a biological tide across every fold of the princess’s cock-loving intestines. Your body doesn’t let up, not even when you can hear a sloshing and gurgling from deep inside her gut. By the time you pull out");
		if(pc.hasKnot(x)) output(" with a knotty ‘pop,’");
		else output(",");
		output(" she’s sporting some deep-packed creme filling. A small river runs out of her gaped rectum once you remove the only thing pinning it inside.");
	}
	//Kiro cum! SPLOOSH
	else
	{
		output("\n\nTerran religious texts often make references to great floods caused by forgotten deities. Had the authors of such tomes been given the opportunity to witness your ejaculation, they’d undoubtedly downgrade the events of their writings. The first wave of [pc.cum] comes in such massive quantities that you can hear it sloshing and gurgling through the defeated nyrea’s intestines. The second makes her belly visibly bulge, and each successive squirt only adds to her increasingly gravid appearance, gifting her with a belly so bulgy that it forces her and her toy apart, popping her knotted member free with an audible squelch.");
		output("\n\nWhen you finally pull out, a tidal wave of backwashing [pc.cum] washes off your [pc.cock " + x + "], and the princess lies there, cradling her distended midsection in pleased disbelief.");
	}
	//Merge
	output("\n\nThe slave harem moves in the moment you leave their still-hard mistress, piling onto the bed with almost fanatical enthusiasm. Well... it’s not quite revenge, but at least they’re in charge for a change.\n\n");
	processTime(22);
	pc.orgasm();
	flags["TOOK_PRINCESS_BUTTGINITY"] = 1;
	flags["PRINCESS_DEFEATED"] = 3;
	CombatManager.genericVictory();
}

//Harem Polishjob + Princess Bukkake
public function haremPolishjob():void
{
	clearOutput();
	showPrincess();
	//Get some help jacking your giant dong off on the princess.
	output("Now that you’re both turned on, there’s only one problem: there’s no way in hell your [pc.cock " + x + "] will fit inside her.");
	var x:int = pc.biggestCockIndex();
	if(pc.biggestCockLength() > enemy.tallness) output(" Hell, it’s bigger than she is!");
	output(" But where there’s a will, there’s a way.");
	output("\n\n<i>“You there!”</i> you call, waving your arm at the assembled slaves. <i>“Get over here. Your mistress is going to need some help taking care of something she started.”</i> To emphasize exactly what you mean");
	if(pc.isCrotchGarbed()) output(", you pull your [pc.lowerGarments] out of the way, revealing the sheer immensity of your phallic engorgement");
	else output(", you tug on your massively engorged phallus, suspending it just above the princess");
	output(". Your length bobs heavily in the air. Then, you drop it square onto the nyrean royalty, pinning her to the ground beneath a mountain of cock.");
	output("\n\nThe former harem mistress blubbers and gasps, her every motion a delight of pleasant friction against your [pc.cockColor " + x + "] dickskin. She makes to twist her head aside but stops halfway, suddenly stopping to stare at the girthy organ above. Her nostrils flare, and she tentatively leans up and slowly, nervously extends her tongue. The contact is but a single, enjoyable point of sensation for you, but for her, in her venom-addled mind, it’s a magnificent, perfectly erotic moment. She’s soon eagerly slurping and licking at every inch that she can access, stroking at the pulsating veins with loving, almost reverent attention.");
	output("\n\nQuiet footsteps call your attention back to the harem. Seeing their mistress’ enthusiasm, the slave-girls have come forward, prancing up to your [pc.cock " + x + "] on bare feet. Their eyes are wide with gratitude and intrigue, flicking between nervous smiles at your face and licentious glances at your boner. One wraps her svelte arms around you in a quivering hug. The others get to work, kneeling around the dick-stricken princess. They don’t need much encouragement to grab hold and start rubbing, leering knowingly at their pinned tormentor all the while.");
	//Nice
	if(pc.isNice()) 
	{
		output("\n\n<i>“Ahhh, that’s nice girls. She really made sure you knew your way around a dick, didn’t she?”</i>");
		output("\n\nTen pairs of submissive, downcast eyes dare to look at you, and their owners meekly nod. You can feel the one hugging you shaking her assent. Poor things.");
		output("\n\n<i>“Well, you’re free now. No one can make you stay here any longer, but I’d consider it a personal favor if you helped me out before you left.”</i> You pat the head of the girl hugging you, then groan as a dollop of pre-cum rolls out of your cockslit and into the princess’s sucking mouth.");
		output("\n\nThe nyrea with the largest chest sighs. <i>“We’ve nowhere else to go, but I think we can help the princess learn how to be a little nicer from all this.”</i> She grins wickedly and looks at the bondage gear. <i>“Once we finish thanking you, that is.”</i>");
	}
	//Mischievous
	else if(pc.isMischievous())
	{
		output("\n\n<i>“Ahhh, nice job girls, and I thought this bitch would be good at sucking cock. You guys are fucking pros!”</i>");
		output("\n\nTen pairs of cheeks blush in response.");
		output("\n\n<i>“I got an idea. Why don’t you guys make use of that bondage gear once I’m gone and teach her to be a little bit nicer? Play your cards right and you might even twist her into your secret little slavegirl.”</i>");
		output("\n\nThe nyrea with the largest chest grins. <i>“Do you think so?”</i>");
		output("\n\nGlancing at the cock-obsessed princess, you answer, <i>“Oh, I’m sure of it.”</i>");
	}
	//Hard
	else
	{
		output("\n\n<i>“Keep it up and I’ll gift-wrap this royal cunt for you, and serve her up on a silver platter!”</i> You cast your gaze over the assembled fuck-toys. <i>“Bitches like this don’t deserve fine-ass ladies like you.”</i> Peering around your dick, you look the princess in the eye. <i>“You’re gonna be the slut when we’re done here, you know that, right? I’m going to put these meek little slave-girls in charge of you and let them exact whatever sordid sorts of revenge you’ve inspired in their hot little minds.”</i>");
		output("\n\nThe harem slave with the biggest chest glances at the bondage equipment and grins wickedly. Twisted minds indeed.");
	}
	//Merge
	output("\n\nYou aren’t sure which part of this you like more - pinning this spoiled brat beneath a mountain of throbbing hard meat, the obsessive desire in her eyes, or the two dozen hands slaving against your oh-so-sensitive skin. It’d be impossible to pick a favorite even if you cared to. There’s no comparing the psychological thrill of the princess’s single-minded desire to the physical delight that you receive from the three tongues circling your [pc.cockHead " + x + "] or the slick fingers massaging the [pc.cockColor " + x + "] skin of your shaft.");
	//Balls
	if(pc.balls > 0)
	{
		output("\n\nEven your [pc.balls] ");
		if(pc.balls == 1) output("is");
		else output("are");
		output(" able to join in on the lusty celebration when the girl hugging you moves her fingers down to meet your [pc.sack]. At first, she gently cups the orb");
		if(pc.balls > 1) output("s");
		output(", smiling mischievously all the while. Her fingers are soft, and while her motions are less skillful than those attending to your [pc.cock " + x + "], they are nonetheless enthusiastic. You could get used to being pampered like this.");
	}
	//Elsepussy
	else if(pc.hasVagina())
	{
		output("\n\nEven your [pc.vaginas] ");
		if(pc.totalVaginas() == 1) output("is");
		else output("are");
		output(" able to join in on the lusty celebration. The girl hugging you evidently meant to contribute more than a simple embrace. Her fingers slither between your lips with consummate skill, the kind that can only be gained from long hours of practice with her sisters. Whether such training was voluntary or part of a show for her former mistress is entirely a mystery - likely one you’ll never have time to solve. What you do have time for is moaning and rocking your [pc.hips] against her brilliantly caressing digits.");
	}
	//Neither - sheath
	else if(pc.hasSheath(x))
	{
		output("\n\nBetter still, what started as a simple hug from a grateful nyrea has transformed into something far, far lewder. She’s moved her hands lower and lower while her sisters have kept your attention on the more distant end of your dick. Now, her hands are inside your sheath, gingerly exploring the musky, slickened surface of an oft-forgotten part of your cock. The pleasure is almost overwhelming. Any kind of stimulation in there is as rare as diamonds, leaving the nerves raw and ready, primed to drive crystalline stalagmites of ecstasy into your vulnerable consciousness.");
	}
	//Neither - nosheath
	else
	{
		output("\n\nBetter still, what started as a simple hug from a grateful nyrea has transformed into something far, far lewder. She’s moved her hands higher and higher while her sisters have kept your attention on the more distant end of your dick. Now, her fingers are playing with your [pc.nipples]");
		if(pc.hasLipples()) output(", gently caressing their puffy lips, letting you suck insistently upon them");
		else if(pc.hasFuckableNipples()) output(", slipping inside to fuck the pliable nipple-holes. How she knew they’d be so fuckable is a total mystery, but the raw bolts of pleasure firing from your titty-twats are a remarkable truth");
		else if(pc.hasDickNipples()) output(", peeling them back to expose the pricks within. How she knew you’d be packing more dick up there is a total mystery, but her teasing, perfect strokes are a total certainty");
		else output(", tugging and rubbing in equal measure. Just when her attentions start to become painful, she shifts her tack to treating them another way");
		output(". You arch your back. What else can you do in such a situation but thrust yourself forward to indulge in more pleasure?");
	}
	//Merge
	output("\n\nYou make sure that the busily stroking harem girls never lift your dick off the myr-drugged nyrea. You want to make sure she feels every eager pulse that runs through your rigid shaft. You want her to enjoy the heat of your flesh, the thickness of your veins, and the raw, overpowering scent of your cock. And she does. Her eyes are practically rolled back, and you can feel her much smaller cock dripping and jerking against your impressive pecker, spurting weak globs of purple cum from time to time, the red venom keeping her on the edge no matter how many orgasms she wastes in her service to you.");
	output("\n\nThe princess’s tongue slurps at the pre-cum that dribbles from your [pc.cockHead " + x + "] whenever she can get to it before her slaves, and she practically purrs after swallowing a particularly potent glob. They must all know that you’re getting closer to going off from the way you’re starting to drip and how hard your length has become.");
	if(pc.hasKnot(x)) 
	{
		output(" Your knot is already a little bigger");
		if (pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED)) output(", and y");
		else output(".");
	}
	else if(pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED)) output(" Y");
	if(pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED)) output("our flare bulges out warningly with each beat of your rapidly hammering heart.");
	output("\n\n<i>“Are you ready for a bath, princess?”</i> you ask by way of warning. The question is purely rhetorical of course; you’re going to bathe her in [pc.cum] regardless. You just wanted to make sure the slaves knew what was coming. They have to keep you aimed and on target, after all.");
	output("\n\nWhen she yanks her head back, still connected to your [pc.cockHead " + x + "] by a web of excessively copious pre-cum, and answers, <i>“YES!”</i> you go off.");
	//No new PG!
	//No cum
	if(pc.cumQ() < 5) output("\n\nYou’re both somewhat surprised when your bucking bronco of a cock only manages to expel a few drops into her still-open mouth. You had hoped for more, but perhaps you should’ve given your body a chance to brew up a fresh batch.");
	//Normalish cum 7-50
	else if(pc.cumQ() < 50) output("\n\nThe first strand of [pc.cumNoun] lands square in her still-open mouth, connecting her uppermost teeth to her wet tongue with a [pc.cumColor] rope. She closes her maw instinctively, which is fine by you. It makes it easier to paint the next few squirts across her cheeks, nose, and forehead. You even manage to place a drop on her citrine crown, spoiling it as effectively as you have her.");
	//High cum 50-250
	else if(pc.cumQ() < 250) output("\n\nThe first voluminous strand of [pc.cumNoun] splatters into her still-open mouth, flooding it beneath a wave of [pc.cumColor]. Her mouth closes instinctively, perhaps surprised to be suddenly full of reproductive melange, but that’s fine by you. It makes it easier to aim the rest of the shots from your cannon of a cock, splattering tsunamis of [pc.cumFlavor] spooge across her cheeks, nose, and forehead. You even manage to bury her alien hair and crown in a web of [pc.cum], spoiling any evidence of her royalty as effectively as you have the rest of her.");
	//Megacum 251-2000
	else if(pc.cumQ() < 2000)
	{
		output("\n\nThe first cannon-like shot from your [pc.cock " + x + "] hits the princess square in her still-open mouth, filling the open orifice from tonsils to lips with a heady reward for her efforts. There’s enough extra to roll down the sides of her cheeks when she instinctively tries to close her stuffed palate, forcing her to try and swallow the [pc.cumFlavor] payload. It’s quite a sight to see. A shame you bury the entire thing in a mask of [pc.cumColor] a second later.");
		output("\n\nEjaculations pour out of your dickslit like water from a hose, washing away each previous squirt with a whole new wave of [pc.cum]. The excess puddles around her hair, and the citrine of her crown is completely hidden, as thoroughly debauched as the princess herself. You spend yourself fully on the bukkaked royalty, pulling back to glaze the rest of her form as thoroughly as her face.");
	}
	//Hypercum
	else
	{
		output("\n\nThe first cannon-like shot from your [pc.cock " + x + "] hits the princess square in her still-open mouth, overwhelms that meager cavity, and splatters across the whole of her face. When it dies down, puddles of your [pc.cumNoun] have formed on her neck and collarbones, and her face is a mask of [pc.cumColor]. And that was just the first blast! You make sure the next drenches her hair and crown, spoiling her symbol of authority as thoroughly as the rest of her.");
		output("\n\nThe princess lies in a growing puddle as you hose her down. The harem helps you back up to evenly coat the rest of her, still squeezing and stroking to maximize the volume of your ejaculate. The royal breasts soon look like polished [pc.cumColor] globes. A flat belly becomes a canvas of [pc.cumVisc] spunk. And the princess’s cock? The princess’s cock is buried in your superior juices, lightly diluting them with her pathetic, pink-squirting production.");
	}
	//Merge
	output("\n\nYou struggle to remain standing as you climb down from your orgasmic high, letting the princess lick at your still-swollen [pc.cockHead " + x + "] a few moments more. Tender hands gradually migrate from your sensitive length to your arms and shoulders, helping you to seat yourself until you recover. Your equipment is placed at your feet, and a number of happy-looking harem girls take turns hugging or kissing at you. Sometimes they target your face, other times your cock. The only constant is their gratefulness.");
	output("\n\nThey take their cummy mistress up onto the bed - and into a bondage harness - while you’re getting ready to leave the chamber. At least they’re getting a chance to be on top!\n\n");
	processTime(33);
	pc.orgasm();
	flags["PRINCESS_DEFEATED"] = 4;
	CombatManager.genericVictory();
}

//Generic Orgy Join
//For defeated Princess!
//Slight exhibitionism gain
public function genericPostVictoryPrincessOrgyFuck():void
{
	clearOutput();
	showPrincess();
	output("Without preamble, you shuck your equipment and climb into the bed, joining the dozens of squirming limbs and sweat-soaked bodies currently abusing the princess-turned-fuck-toy. The nyrea react with shock and wariness at the sight of an outsider approaching them, but when they identify you as their savior, the one that turned the tables on their ovipositional overlord, they joyously embrace you, pulling you deep into the crowd.");
	output("\n\nYou’re awash in a sea of budding breasts and unrepentant sensuality. The libidinous caresses of hands big and small wash across your [pc.skinFurScales], pausing only to focus on a [pc.nipple] or fondle their way across your [pc.groin]. A lithe form embraces you from behind while a tongue licks at the lobe of your ear. Lips press against your own, and a tongue is daringly offered to the interior of your mouth. You fence with it, for a time, feeling your body grow hot with excitement and need.");
	output("\n\nThe fallen princess is close enough that you can touch her, if you wanted to. She trembles and bucks against her restraints and the lithe girl currently mounting her. With each crash of alien pussy on ovipositor, she pants, <i>“Yes,”</i> but her eyes are vacant, almost unseeing. She’s dosed up with enough red myr venom to throw an elephant into a rutting frenzy. You spot the cause: a red myr is among the harem, suckling her former mistress’ toes with a mischievous look on her face.");
	output("\n\nWhen she sees you staring, the crimson ant stops and asks, <i>“What? I like feet.”</i>");
	output("\n\nYou can’t really argue with that. A skillful touch ");
	if(pc.legCount > 1) output("between your [pc.legs]");
	else output("at the joining of your [pc.leg] with your [pc.hips]");
	output(" pulls your attention over and into another kiss, one so hot and soul-searing that you nearly forget the red entirely. Your eager fingers wrap around the new nyrea’s back to pull her more firmly against you, rubbing small circles against the smooth skin at the small of her back. She grinds against your hips");
	if(pc.hasCock()) output(", soon seating herself on [pc.oneCock]");
	else output(", soon pressing herself against [pc.oneVagina]");
	output(", rubbing her feverishly slick form for ever more friction.");
	output("\n\nInky eyes gaze into yours. Hands cross over your shoulders. Fingers slip over the increasingly sweat-slicked expanse of your [pc.butt]. You bump and grind, twitching your hips back against them. Groaning, you slither your tongue against endless onslaughts of alien muscle, bathing it in orgiastic bliss. Rather than battle the mounting ecstasy in an ill-fated attempt to hold out, you let it wash over you, twitching nervelessly in your lovers’ grasps. They bring you to heights of pleasure you can barely endure, let alone remember.");
	processTime(45);
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",genericPrincessOrgyFinisher);
}

//[Next]
public function genericPrincessOrgyFinisher():void
{
	clearOutput();
	showPrincess();
	output("You awaken on a cushion some time later. The nyrea are still at it, swapping in and out in shifts to ensure the hedonistic orgy never abates. Your gear hasn’t been messed with, and none make a move to stop you as you move along on your business.");
	processTime(33+rand(20));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

