import classes.Items.Recovery.PyriteIssuedStim;

//flags["WARGII_PROGRESS"]
//		-2 = rejected, AND the timer expired.
//		-1 = rejected. RIP.
//		undefined = nonstart
//		1 = given door greeting message
//		2 = inside the hold, fightahn
//		3 = you winned!
//
//WARGII_MILO_SOLUTION	
//		0 = mercy (let them out)
//		1 = harsh (enslave)
//		2 = middle (1 year prison)
//
//flags["WARGII_DOOM_TIMER"]
//		1 = turned Ula down.
//		2 = been to the elevator since turning Ula down - WARGII_PROGRESS flips from -1 to -2 next time you return
//
//flags["WARGII_NENNE_SAVED"]
//flags["WARGII_TUUVA_SAVED"]
//flags["WARGII_HEIDRUN_SAVED"] 
//flags["WARGII_LUND_SAVED"]
//flags["WARGII_MAJA_SAVED"]
//flags["WARGII_KIONA_SAVED"]
//		1 = saved character

//flags["WARGII_FIGHTS_RAN"] = #  of fights ran from.
//flags["WARGII_FIGHTS_WON"] = pretty fuckin obvious

//flags["WARGII_NORAN_REWARD"]
//		1 = Got the prize ring for not running.


public function wargiiEncounterStuff():Boolean
{
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	//Just reuse Uveto's shit. It doesnt matter much really.
	IncrementFlag("TUNDRA_STEP");
	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if(flags["TUNDRA_STEP"] >= 5 && rand(4) == 0) {
		//Reset step counter
		flags["TUNDRA_STEP"] = 0;
		
		//Actual encounters:
		choices.push(warLionFightGoooo);
		choices.push(milodanInfiltratorEncounter);
		choices.push(encounterMiloTemptress);
		if(!pc.hasStatusEffect("FDruggedKorgTimer")) choices.push(helpDruggedKorgonne);
		if(!pc.hasStatusEffect("MDruggedKorgTimer")) choices.push(dosedKorgiMaleEncounter);
		
		//Run the event
		choices[rand(choices.length)]();
		return true;
	}
	//No enemy encounter, chance of finding healiedoos
	else if(flags["TUNDRA_STEP"] >= 2 && flags["TUNDRA_STEP"] < 4)
	{
		if(pc.HP()/pc.HPMax() < 0.5 && rand(3) == 0 && !pc.hasItemByClass(HealingPoultice)) 
		{
			getAHealyItemInWargii(true);
			return true;
		}
		else if(pc.energy()/pc.energyMax() < 0.5 && rand(3) == 0 && !pc.hasItemByClass(PyriteIssuedStim))
		{
			getAHealyItemInWargii(false);
			return true;
		}
	}
	//Bonus flavor stuff
	if(rand(2) == 0)
	{
		output("\n\n" + RandomInCollection(["You hear a scream from somewhere in the distance.","A denser pocket of smoke causes you to cough softly.","A tuft of fur floats by, dislodged in a scrap.","A pair of voices lift in faint, orgasmic cries as far away combatants satisfy the lusts their struggles have sparked in each other.","Dust falls from the ceiling as the dull thud of an explosion rumbles through the hold.","Quiet pops of faraway gunfire startle you, then stop as abruptly as they started.","A feather-lined dart crunches under your [pc.foot]. A few others diligently hang onto the wall, trying to dispense their payloads into solid stone. You’ll have to be careful not to step on any of the needles...","A small pile of shell casings rests against the wall, wafting hints of their acrid propellant into the air.","An unconscious korgonne male sleeps flat on his back - and naked. He’s covered from head to toe in pussy juice and cum... and judging by the state of his hyper-swollen knot and seed-dribbling cock-head, he’s not going to be any good for anything but fucking for a long time... assuming anyone could even rouse him. It looks like there’s a tranq dart still stuck in his neck. Poor guy.","An unconscious korgonne woman lies on the floor with cum streaming from a very packed pussy. She snores audibly, tranquilized by the dart in her neck.","You spot a laser weapon’s battery-mag resting on the floor, completely emptied.","An empty magazine with a jagged crack through the side sits on the ground, discarded. Looking closer, you can see the korgonne spearpoint wedged into it.","Someone tossed out a spent stimpen... and an emptied vial of Throbb. You try not to think about what would necessitate such a combination as you kick them out of your way.","The high-pitched keen of an energy weapon discharging at maximum power carries surprisingly well through the hold’s stonework. You almost wish it didn’t.","Distant war-cries and the clang of metal on metal keep you on your toes.","The faint, staccato ‘thump’ of a flash-bang going off reminds you that the battle is still raging.","A feline howl of displeasure echoes to you, bringing a smile to your [pc.lipsChaste]."]));
	}
	else if(rand(10) == 0 && flags["WARGII_MAJA_SAVED"] == 2)
	{
		//possible encounter from then on
		output("\n\nYou run into a cluster of korgonne with a kor’diiak. A group of milodan are tied up along the wall, relieved of their weaponry. The korgonne bristle as they see you, toting their captors weapons haphazardly, but quickly point in the direction of the throne room as they see who you are. You give the group a curt nod and head off. Happy to have avoided an unneeded confrontation.");
	}
	return false;
}

public function getAHealyItemInWargii(HP:Boolean = true):void
{
	output("\n\n");
	if(!HP) quickLoot(new PyriteIssuedStim());
	else quickLoot(new HealingPoultice());
	flags["TUNDRA_STEP"] = 3;
}

//Ula can not be visibly preggo
//On entering the hold
public function wargiiHoldProcOhShiiiiit():void
{
	clearOutput();
	//show korgi male
	author("Fenoxo");
	showBust("KORGONNE_MALE_WHITE","KORGONNE_MALE_TAWNY");
	output("One of the guards stops you at the door. <i>“" + (!korgiTranslate() ? "<b>Ula want talking to you.</b> Not sure what seeing in, but not my place judge.":"<b>Ula wants to talk to you.</b> I don’t understand what she sees in you, but it’s not my place to judge.") + "”</i> His fur bristles. <i>“Get on then.”</i>\n\n<b>Visiting Ula is going to start something...</b>");
	flags["WARGII_SETUP"] = 1;
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Upon entering Ula’s room:
public function startWargiiQuestOnEnterUlaRoom():void
{
	clearOutput();
	showUla();
	author("Fenoxo");
	flags["WARGII_SETUP"] = undefined;
	flags["WARGII_PROGRESS"] = 1;
	output("<i>“[pc.name]! " + (korgiTranslate() ? "I’m so relieved!":"Such relief!") + "”</i> Ula rushes forward, sweeping you up in a big hug. <i>“" + (!korgiTranslate() ? "No time for warm shares!":"No time for cuddling!") + "”</i> She pushes you back to arms length and stares " + (pc.tallness >= 5*12+5 ? "up ":"") + "at you with big green eyes. <i>“" + (!korgiTranslate() ? "Clan Chief peace-meeting with milodan tribe, but Ula not trusting. Thinking catdog trap. Not first time they try, but he old now. Am much stalling, but father much tired of wait. Can [pc.name] follow and make with safe?":"The Clan Chief is going to a peace summit with a milodan tribe, but I don’t trust them. The whole thing reeks of a trap. This isn’t the first time they’ve tried, but he’s old now, and he won’t wait any longer - no matter how I stall. Can you follow and keep him safe?") + "”</i>");
	processTime(3);
	clearMenu();
	addButton(0,"Agree",helpUlaWithKorgStuff);
	addButton(1,"Don’t",dontWargiiStuff);
}

//Wargii Score
public function wargiiScore():Number
{
	var score:Number = 0;
	if(flags["WARGII_NENNE_SAVED"] != undefined) score += 10;
	if(flags["WARGII_TUUVA_SAVED"] != undefined) score += 10;
	if(flags["WARGII_HEIDRUN_SAVED"] != undefined) score += 10;
	if(flags["WARGII_LUND_SAVED"] != undefined) score += 10;
	if(flags["WARGII_MAJA_SAVED"] != undefined) score += 10;
	if(flags["WARGII_MAJA_SAVED"] == 2) score += 5;
	if(flags["WARGII_KIONA_SAVED"] != undefined) score += 10;

	if(flags["WARGII_FIGHTS_RAN"] != undefined) score -= flags["WARGII_FIGHTS_RAN"] * 5;
	if(flags["WARGII_FIGHTS_WON"] != undefined) score += flags["WARGII_FIGHTS_WON"] * 3;
	if(score > 100) score = 100;
	if(score < 0) score = 0;
	return score;
}

public function wargiiH8Bonus():Boolean
{
	flags["NAV_DISABLED"] = NAV_WEST_DISABLE;
	return wargiiEncounterStuff();
}

public function wargiiJ10Bonus():Boolean
{
	flags["NAV_DISABLED"] = NAV_NORTH_DISABLE;
	return wargiiEncounterStuff();
}

public function wargiiR20Bonus():Boolean
{
	flags["NAV_DISABLED"] = NAV_SOUTH_DISABLE;
	return wargiiEncounterStuff();
}

public function wargiiR22Bonus():Boolean
{
	flags["NAV_DISABLED"] = NAV_NORTH_DISABLE;
	return wargiiEncounterStuff();
}

public function wargiiJ6Bonus():Boolean
{
	flags["NAV_DISABLED"] = NAV_SOUTH_DISABLE;
	return wargiiEncounterStuff();
}

public function tamedTamelingsWarBonus():Boolean
{
	if(flags["WARGII_MAJA_SAVED"] != 2) output("Various bags and crates of animal feed are littered along the back wall to feed the creatures further into the shop. Carts, leashes, and reins hang from the walls in abundance, but without anyone to mind the shop, you’re left with nothing to do but admire the supplies.");
	else output("Various bags and crates of animal feed are littered along the back wall to feed the creatures further into the shop - except those same creatures have been unleashed into the hold.");
	if(flags["WARGII_MAJA_SAVED"] == 1)
	{
		majaTamelingFreething();
		return true;
	}
	return wargiiEncounterStuff();
}
public function wargiiBeastCagesBonus():Boolean
{
	if(flags["WARGII_MAJA_SAVED"] != 2) output("Many larger beasts occupy these stables. Six-legged bear-like creatures with jagged horns jutting from their heads mill about in large pens. Smaller beasts, though plenty large enough to ride sit in fenced-in alcoves.");
	else output("The larger beasts have all been turned loose. Cage doors swing wide open. The only evidence of the six-legged bear-like creatures that once lived here are copious, unshoveled piles of dung.");
	output(" Metal-handled shovels lie stacked against the far wall as you come to a dead end. The curving tunnel to the south provides an exit, should you need to escape an angry milodan.");
	return wargiiEncounterStuff();
}

//[Don’t]
//Starts a timer. After 2 days, when the PC is off Uveto, the whole town gets locked down
public function dontWargiiStuff():void
{
	clearOutput();
	showUla();
	author("Fenoxo");
	output("<i>“I can’t.”</i> ");
	if(pc.isNice()) output("You feel like an ass for saying it.");
	else if(pc.isMischievous()) output("You shrug in feigned helplessness.");
	else output("You present a facade that brooks no argument.");
	output("\n\nUla’s knees knock together nervously. <i>“No! No-no-no... " + (!korgiTranslate() ? "Can’t wait-make! Father-Chief leave any time now. Needs more guards. Dumb longfur think worth risk. Think he so old it not big deal if Milodans lie and slay.":"I can’t make him wait! He’ll leave any time now. He needs more guards. The dumb longfur thinks it’s worth the risk - that he’s so old that it won’t matter much if they’re lying and slay him.") + "”</i> She looks on the verge of tears. <i>“" + (!korgiTranslate() ? "He dumb, but still father. Please. Please, [pc.name]. Please guard? You strong. You brave. Not let them steal heat. Not let them leave cold. Beggings.":"He’s dumb, but still my father. Please. Please, [pc.name]. Please guard him? You’re strong and brave. Don’t let him die. I’m begging...") + "”</i>");
	processTime(5);
	clearMenu();
	addButton(0,"Help",helpUlaWithKorgStuff);
	addButton(1,"Double Nope",dubbleNopeWargii);
}

//[Double Nope]
public function dubbleNopeWargii():void
{
	clearOutput();
	showUla();
	author("Fenoxo");
	output("You step away from the distraught princess. <i>“" + (pc.isNice() ? "I’m sorry, but n":"N") + "o. I can’t.”</i>");
	output("\n\nUla balls up her little fists, tears streaming down her cheeks, and spins away. She runs down the hall bawling the entire way.");
	processTime(3);
	output("\n\nYou hope you don’t regret this.");
	pc.addHard(5);
	//reject stuff
	flags["WARGII_PROGRESS"] = -1;
	flags["WARGII_DOOM_TIMER"] = 1;
	clearMenu(); //make sure this proper triggers THE END OF TIMES.
	addButton(0,"Next",mainGameMenu);
}

//[Help]
public function helpUlaWithKorgStuff():void
{
	clearOutput();
	showUla();
	author("Fenoxo");
	output("You agree to help.");
	output("\n\nUla is " + (pc.tallness < 5*12 ? "on you":"climbing up you") + " in seconds. She grabs you by the cheeks and plants a big wet kiss on your lips" + (pc.tallness >= 5*12 ? " before sliding back down":"") + ", tail wagging. <i>“" + (!korgiTranslate() ? "Was knowing you help. You come and listen and watch over Chieftain with core magics. Make sure dumb fang-cats not lie.":"I knew you’d help. Follow the Chieftain, [pc.name]. Watch over him with your core magic. Make those dumb fang-cats regret deception.") + "”</i> Her ears flop down. <i>“" + (!korgiTranslate() ? "Bad feeling this trap. Safe being, please.":"Somehow, I <b>know</b> this is a trap. Be safe, please.") + "”</i> The wide-eyed dog-girl looks back as a heavily armed procession rounds a corner. <i>“" + (!korgiTranslate() ? "Not let Chieftan know either. He proud, think Ula silly-being.":"Don’t let the Chief know either. He’s proud, and would resent your presence. He think’s I’m being silly.") + "”</i>");
	output("\n\nYou let her know that it won’t be easy, but you’ll try.");
	output("\n\nA regal-looking cluster of korgonne passes by shortly after. At its regimented center is the chieftain, dressed in full expeditionary gear with a bit of ceremonial flair and surrounded by a half-dozen stiff-backed guards. Traditional spears and bows are the order of the day, ornamented with inlaid savicite gems and intricate scrollwork. The closest korgs glower at you while their cohorts do their best to pretend you don’t exist. The Chieftain himself comes to a lumbering stop next to his daughter. A heated exchange ensues, both royal korgs trading impassioned whispers like spearthrusts.");
	output("\n\nJudging by the expression on Ula’s face, she takes the worst of it. The old dog cleanly shatters whatever argument she was making like glass. Her tail sags in defeat, finally silenced by a dismissive wave of her father’s palm. Nodding gruffly, the Chief barks a command to his retinue, and they resume marching, leaving Ula to wallow in defeat. She stumbles back against the wall next to her as her father leaves, lacing her fingers together in raw nervousness");
	output("\n\nThe teary-eyed korgonne turns to you for comfort, drawing you in to one last, fluffy hug. Minutes tick by, locked in her embrace. She sniffles a time or two before glancing back up in bleary-eyed determination. <i>“" + (!korgiTranslate() ? "You need go. Chieftain not move that fast but no take chance. No lose in snow.":"You need to go. The Chief doesn’t move that fast, but I can’t risk you losing him in the snow.") + "”</i>");
	output("\n\nUla releases you into the snowfields of Uveto.");
	flags["WARGII_ULA_PROMISED"] = 1;
	pc.addNice(2);
	processTime(15);
	clearMenu();
	addButton(0,"Next",followingTheChiefToKorgii);
}

public function followingTheChiefToKorgii():void
{
	clearOutput();
	author("Fenoxo");
	showBust(korgChiefBustString(),"KORGONNE_MALE_WHITE","KORGONNE_MALE_TAWNY");
	showName("\nTRACKING");
	currentLocation = "UVGR G8";
	flags["TUNDRA_STEP"] = 1;
	generateMap();
	
	addUvetoCold();
	
	output("The Chieftan’s retinue isn’t as easy to track through the snow as you might have expected. They are obviously practiced at surviving the rugged tundras of Uvetan wilderness. Their path avoids softer snowpack where tracks might be more evident, moving instead to less malleable ice and rock. When they do leave tracks, the rearguard brushes them down with some kind of tool to conceal the shapes of their footprints. If you hadn’t had the opportunity to follow them from the very start, you’d never have noticed their track.");
	output("\n\nFor well over one hour, you trudge after the fluffy procession, enduring Uveto’s hellish weather as best you can. You thought yourself stealthy, but more than once, you catch the sharp eye of a distant korgonne staring back at you impassively. The guards make no move to stop you, but neither do they care for your presence. You’re an outsider, a distant one who they consider to be trifling in matters beyond [pc.hisHer] ken.");
	output("\n\nYou keep your distance. When the trekking dog-folk come to a stop in the shadow of an icy cliffside, you set up a short ways away: close enough to keep an eye on the proceedings but far away enough not to draw attention to yourself, should a keen scout happen to discover your vantage point.");
	processTime(15);
	clearMenu();
	addButton(0,"Next",wargiiAmbushles);
}

public function wargiiAmbushles():void
{
	clearOutput();
	//showchiefandmilos
	showName("\nAMBUSH");
	showBust("WAR_ALPHA",korgChiefBustString(),"WAR_LION");
	output("You are not prepared for the arrival of the Milodans. Neither is Ula’s father.");
	output("\n\nThe saber-cats appear at the crest of the ridge with snarling grins and full sets of modern military equipment - including body armor. A score of the up-armed milos leap from the cliff to an apparent demise only for the blue-tinged exhausts of their jetpacks to grant them a graceful landing in snow below. In their hands are military-grade weapons of every shape and size: heavy missile launchers, railguns, lasers, and even a multitude of grenades. Fizzing shields are apparent around them, as are the trademarked stamps of Pyrite Heavy Industries logos.");
	output("\n\nUh oh.");
	output("\n\n<i>“Foolish korgs!”</i> the leader bellows. His compatriots advance, arrows sparking from the invisible barriers that surround them. <i>“So easy to fool, and so easy to kill!”</i> He bellows cruelly.");
	output("\n\nUla was right. The Chieftan doesn’t stand a chance. You doubt you can save him; there’s simply too many of the well-armed barbarians. Perhaps you could return to the hold to warn them of what’s coming. You doubt this is an isolated incident. Then again, you promised Ula you would watch over her father.");
	output("\n\nDo you try to save Ula’s father or warn the hold?");
	processTime(30);
	clearMenu();
	addButton(0,"Warn Hold",warnTheHoldAboutZeAmbush);
	addButton(1,"Save Chief",saveTheChiefo);
}

//[Warn Hold]
public function warnTheHoldAboutZeAmbush():void
{
	clearOutput();
	showName("WARN\nTHE HOLD");
	//milo images
	showBust("MILODANMALE","MILODANMALE");
	output("You retreat for the hold before the growing army of felines discover you. The haunting sight of two bodyguards falling to explosive blasts haunts your frenzied run back. Thoughts of cowardice chase you more effectively than any foe, at war with the pragmatic knowledge that you could not have change the outcome in the slightest. Still, defeat of any kind carries its own unique sting.");
	output("\n\nThe rumble of whining engines and the bass hum of antigravity repulsors interrupt your thoughts. A flat-bottomed transport craft wooshes past you to the north. It holds more milodans than you saw back at the ambush - at least forty - and Ula’s father lies near the front, cuffed and unconscious. A double-barreled gun on the back houses a grinning milo in thick goggles. Artillery like that could punch a hole straight through the hold’s wall - or obliterate the door outright.");
	output("\n\nAnother transport follows. There’s an army of the crude cat-men, and they’re buzzing straight to Korg’ii Hold.");
	output("\n\nYou run faster.");
	processTime(50);
	clearMenu();
	addButton(0,"Next",arriveAtKorgiliciousLand);
}

//[Intervene]
//Save Chief
public function saveTheChiefo():void
{
	clearOutput();
	showBust("MILODANMALE","MILODANMALE");
	output("With a roar of challenge, you crest the hill you concealed yourself behind and rush for the assembled milodans. Puffs of snow splash behind you, churned by your impelling fury.");
	output("\n\nThe long-toothed cats barely react to your presence. Two of the Chieftan’s guards fall to explosive charges while the ring of advancing barbarians closes in, stun-rods in hand. At their leader’s direction, two of the least-equipped warriors break off to intercept you. Apparently you aren’t worth the presence of heavier weaponry.");
	output("\n\nNevertheless, you’ll have to fight!");
	processTime(4);
	clearMenu();
	//Fight two normal milos at once.
	//Win, normal scene choices for male milos
	//Loss: die
	var tEnemy:MilodanMale = new MilodanMale();
	tEnemy.wargiiQuestConfigure();
	tEnemy.long = "This milodan is decked out in a light suit of combat armor. He brandishes a shock baton in one hand and a laser pistol in the other. Both look brand new and undamaged, ready to dish out plenty of pain. The brute beneath all the weaponry is a typical example of his species: tall and corded with thick ropes of muscle. Large fangs jut over his lower lip as he circles you, looking for an opening.";
	var tEnemy2:MilodanMale = new MilodanMale();
	tEnemy2.wargiiQuestConfigure();
	tEnemy2.long = "Like his cohort, this milodan wears a brand new suit of combat armor. The plates are sturdy but ill-fitting and lighter than the more heavily armed specimens subduing the chieftain. He is of similar build and temperament, with longer, thinner canines and a keen glint in his eye."
	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy,tEnemy2);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(winningAintEasy);
	CombatManager.lossScene(loseToDubbleMiloshit);
	CombatManager.displayLocation("MILODANS");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

public function loseToDubbleMiloshit():void
{
	if(pc.HP() <= 1) output("Your stance is wobbly and shaken; you lose your balance and fall halfway to the ground, too injured to stand upright. You try and keep your eyes on your opponent, but that one weakness was all they needed; you feel a sharp, blunt sting against the back of your head, and then... nothing.");
	else output("Your stance is wobbly and shaken - not because you’re wounded or you’re too exhausted to keep going, but because you’re just so horny. The Milodan in front of you look so delicious in [enemy.hisHer] armor, and you can smell [enemy.hisHer] overbearing musk from where you are. You close your eyes as you imagine you spending time with the warriors some other way, when you feel a blunt, stinging pain at the back of your head.");
	clearMenu();
	addButton(0,"Next",wargiiBadEnds);
}

public function winningAintEasy():void
{
	eventQueue.push(takeDownThemMiloBois);
	CombatManager.genericVictory();
}

//Actual win-scene
public function takeDownThemMiloBois():void
{
	clearOutput();
	showName("\nVICTORY");
	author("Fenoxo");
	output("The moment you have a chance to look past the fallen forms of your enemies, you’re shocked to see that the other battle has already concluded. Ula’s father is down. The Chieftain of Korg’ii Hold is slung over the milodan leader’s back like a sack of potatoes. As he climbs onto a hovering transport with more of his victorious countrymen - a full forty of them. The engines hum to life as it launches past you - directly toward Korg’ii Hold. Worse, another fully loaded transport rolls out from behind a rock to follow the first.");
	output("\n\nA milodan army is bearing down on the hold, and you can’t possibly beat them back. Do you return to try to help or leave the korgonne to their fate?");
	processTime(2);
	addButton(0,"Rush Back",rushBack2Help);
	addButton(1,"Leave",leaveDemBitchesToDooooom);
}

//Leave em
public function leaveDemBitchesToDooooom():void
{
	clearOutput();
	output("Well... you tried. You don’t know how the korgonne could possibly defeat a force like that, but you hope they manage.");
	//dump into snowarea
	flags["WARGII_PROGRESS"] = -2;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Rush back
public function rushBack2Help():void
{
	clearOutput();
	showName("TO\nTHE HOLD");
	output("You rush back through thickening snows, hoping against hope that the korgs’ stout walls and even stouter wills can prove a match for snarling muscle and blast-belching firearms. If the milodans get a chance to settle in... there will be no dislodging them - not without an army and significant bloodshed.");
	output("\n\nYou run faster.");
	processTime(10);
	clearMenu();
	addButton(0,"Next",arriveAtKorgiliciousLand);
}

//[Next] from rush back or retreat to warn the hold.
public function arriveAtKorgiliciousLand():void
{
	clearOutput();
	showName("KORG’II\nHOLD");
	output("Billowing clouds of smoke wreathe the distant spire long before you’re close enough to discern the source. They’re dark and black, twisting up like burnt, skeletal fingertips, trying to drag the hold down into the icy mires below. No matter how fast you move, it doesn’t seem fast enough. The bustling tribal city is burning.");
	output("\n\nYou crest a hilltop.");
	output("\n\nKorg’ii Hold’s perfectly concealed, fluted entrance lies in a thousand shattered pieces, scattered amongst the blackened snow. Stolen spears lie stacked in heaps, their owners nowhere to be seen. The distant snaps of small arms fire sputter like popping corn from within, echoing across the tundra. The gateway may be lost, but the korgs must be fighting on inside!");
	output("\n\nA fresh plume of smoke erupts from a concealed window.");
	output("\n\nYou rush in, grateful the invaders didn’t think to post a rearguard. To battle!");
	processTime(10);
	//Sets that you're in the middle of the quest. disables encounters via disableExploreEvents()
	flags["WARGII_PROGRESS"] = 2;
	clearMenu();
	addButton(0,"Next",arriveAtKorgiliciousLandGo);
}
public function arriveAtKorgiliciousLandGo():void
{
	removeUvetoCold();
	move("WARGII B12");
}

public function wargiiBadEnds():void
{
	var enemiess:Array = CombatManager.getHostileActors();
	while(enemiess.length > 1) CombatManager.removeHostileActor(enemiess[1]);
	clearOutput();
	clearMenu();
	//Cocky Stuff
	if(pc.hasCock() && (!pc.hasVagina() || rand(2) == 0))
	{
		showBust("ALVELLA","HEIDRUN","HEIDRUN");
		showName("MILODAN\nCAMP");
		author("QuestyRobo");
		output("You drift back to consciousness after some amount of time. Your eyes are still far too blurred to make sense of anything, but you can hear a pair of milodans chattering nearby.");
		output("\n\n<i>“Alvella wants [pc.himHer] too? Does she really need all of these prisoners? There’s barely enough for the rest of us!”</i>");
		output("\n\n<i>“Quit whining, we’ll have them back after she’s done with them.”</i>");
		output("\n\n<i>“Greeeat, we get her leftover freaks. Call me prudish, but I’ll take the fuckslaves that don’t have teeth in their vaginas.”</i>");
		output("\n\n<i>“Stop being so dramatic. I think they’re waking up.”</i>");
		output("\n\nYour vision clears just in time to see one of them walk up to you and grab you by your new leash. <i>“Sad we gotta give you over to that freakjob. You would have made a good stud.”</i> She pulls your leash, dragging you through the milodan camp toward a large tent in the distance. There’s not much you can do, since your arms are completely bound as well. You go past many milodans, most of whom are taking gleeful advantage of their newly captured korg. It’s a woeful reminder of your failure to help protect the hold. There’s also other, odder sights; strange creatures that look similar to the captured korgonne, but have obviously been altered heavily. You shudder as you realize that these must be the freaks that the guard was talking about, and that you’re being placed in the ‘care’ of the person who created them.");
		output("\n\nThe milodan parts the entrance to the tent and tosses you in haphazardly. <i>“Pray she has different plans for you, outsider,”</i> the guard says before departing. It’s a <i>really</i> bad sign when the barbaric raiders are praying for your safety.");
		output("\n\nThe inside of the tent looks like a mad scientist’s lab. There’s tables with vial after vial of strange, bubbling fluid, scattered notes with almost insane ramblings on them, and cages filled with captured, drugged korgs. A scrawny, nerve-wracked milodan in a heavily stained lab coat walks in from an entrance on the other side of the tent, cursing under her breath until she sees you. Her fur is ragged and obviously poorly tended to, and her pupils are dilated like she’s been sampling her own experiments. She’s nude aside from the coat, allowing you to see her overly-swollen, drooling pussy.");
		output("\n\n<i>“Good, good, they brought me the outsider!”</i> She skitters up to you, getting uncomfortably close as she looks you over. <i>“Yes, perfect! I’m Alvella, the, uh, ‘head researcher’ for the tribe. I’ve... let’s say, taken it upon myself to help our gracious, Pyrite benefactors experiment with these lovely chemicals they’ve provided us with.”</i> She rubs her hands together and chuckles as she looks over at the tables of roiling chems. <i>“That’s where you come in. See, I’ve been experimenting with mixing savicite into some of these concoctions. The problem is, these stupid korgonne are practically immune to the stuff. That’s why I need you, my precious little, non-yappy-little-dog-shit friend.”</i>");
		output("\n\nYou open your mouth to say something, but she yanks on your leash and drags you over to one of the cages before you can get a word in. Inside is a group of female korgonne, all of them drugged into mindless lust; their bodies’ pumped up to whorish proportions. You look back up at Alvella just in time to see her flicking the end of a needle filled with a swirling mix of glowing pink and green.");
		output("\n\n<i>“Righty, bottoms up!”</i> She means that oddly literally; she grabs hold of your [pc.ass], hoists it up, and jams the needle in. Boiling heat surges through your body from the point of injection. Every square inch of [pc.skinFurScales] that gets overlaid by the heat trembles in uncontrollable lust. You groan out loud as your mind is assaulted by the soup of lust-inducing chemicals, the potent concoction rewiring your brain chemistry to lock out anything but thoughtless rut!");
		output("\n\nThe trapped, bimboed-up korgs go from tragic to mouth-watering. Your [pc.cocks] spring" + (pc.cockTotal() == 1 ? "s":"") + " to hardness with such eagerness that your lust-dulled mind doesn’t even bother registering the shift; in fact, you’re already struggling to remember what it’s like not to be drowning in lust!");
		output("\n\n<i>“I see my little savicite cocktail is working just as intended! At least the initial effects. Good. Hopefully that convinces Pyrite I’m not just doing this because I get off to it... I totally am, though, but that’s just a bonus!”</i>");
		output("\n\nYour vision blurs around the edges, zeroing in on the korg sluts that you’re tortuously separated from by the cage that increasingly feels like it’s restraining you more than them. You press yourself up against the bars and thrust through, smiling and drooling as you see the bloated sluts rush toward you.");
		if(pc.cockTotal() > 1) 
		{
			output("\n\nThe gaggle of groggy girls pour over your multitude of members. They yip and bark mindlessly as they squabble over your sausages. Eventually one decides to say ‘screw it’ and rams [pc.oneCock] down her throat, keeping it all to herself. The others seemed a bit surprised, but soon snap out of it as they bump each other in order to scarf down your other cock" + (pc.cockTotal() > 2 ? "s":"") + ".");
			output("\n\nYou let out a whorishly loud groan as the feeling of each of your over-stimulated " + pc.mf("","wo") + "manhoods being sucked deep into the unnaturally warm and tight maws of the korg bitches. Whatever she gave them seems to have turned their mouths into perfect fuck-holes! The others cry out in disappointment as their sisters refuse to share even an inch of your meat.");
			if(pc.balls > 0) output(" They decide to sate themselves by sucking on your [pc.balls]. It’s an act that seems supremely pleasurable to the little sluts, and you can hear them closing in on orgasm within seconds.");
			else output(" With nothing else for you to offer them, they settle in to eating out their luckier sisters. Lurid wet noises ring out from in the cage, both from the ones receiving and the ones giving. It seems like these girls have been chemically groomed to orgasmically enjoy oral.");
		}
		else
		{
			output("\n\nThe mob of maddened mutts crowd around your [pc.cock], wrapping their red-hot hands and tongues around your member. Every part of them is boiling with lust, yearning for any sort of sexual release. You almost feel like they’re going to squeeze you through the bars by your dick, with how hard they’re yanking at it. One of them finally gets a bright idea: She pushes past all of her fellow sluts and spears herself on your cock, locking out the others.");
			output("\n\nIt dawns on you just how many are in there as they all crowd around your crotch, their overripe bodies tripping and stumbling over each other. The sight of them fighting over your [pc.cockNounSimple] drives your arousal even higher, as if getting deepthroated by the most perfect fuckhole you’ve ever felt! Intentionally or not, Alvella has turned these girls into perfect little fuck-toys, and you love it!");
		}
		output("\n\nYou pull back and thrust into the slutty dog maw" + (pc.cockTotal() > 1 ? "s":"") + ", throwing them back with the sheer force of it. Every muscle in your body feels like it just went through an hours-long workout and is just burning for more! The tendons in your arms bulge out as you grip the bars of the cage as tightly as possible and thrust in again. The korgs don’t seem to mind; if anything, your forcefulness is egging them on even more.");
		output("\n\nAlvella smiles and starts writing down something on her clipboard while rubbing her thighs together. <i>“Ah yes, here comes the rest of the effect - ahead of projections too! We might be ready to move you to the potent dosages.”</i>");
		output("\n\nYou largely ignore everything the little twerp is saying at this point, but there’s one word in there that seems to latch on: <i>Potent</i>. The word alone triggers the most debased fantasies. Visions of being a virile sex god, knocking up droves of women with a single orgasm, somehow being so virile that the <i>smell</i> of your cum can put a bun in their oven. The fantasies feel so real that it almost feels like your [pc.balls] " + (pc.balls <= 1 ? "is":"are") + " actually plumping up!");
		output("\n\nThe drug has hit some kind of second wind, and it’s making you feel like a wild animal. You buck against the bars and the sucking slut-mouths, feeling your body growing stronger and more virile as your mind recedes into the background of orgiastic delight. Hurtling towards orgasm, you hear a faint creaking. It doesn’t register until you feel the cage wall you’re up against start to give way. You erupt as the wall tears down, the korgonne sluts on your [pc.cocksLight] unfortunately scattering so as not get crushed.");
		output("\n\nThat doesn’t mean they’re done with you - far from it. You cum like a firehose, splattering the cold ground with what feels like gallons of supercharged [pc.cumNoun]. The resourceful little pups quickly flip you over, scooping up every drop of ejaculate, stuffing their needy little pussies with the distressingly wasted ");
		if(pc.cumQ() < 300) output("blanket");
		else if(pc.cumQ() < 2000) output("wave");
		else output("tide");
		output(" of sperminess.");

		output("\n\nThey don’t even give you time to rest! In seconds you feel their overheating bodies clambering all over you; Their massive breasts feel like plush, pre-heated pillows; their fat little pussies drag across your bare [pc.skinFurScales], feeling almost like hot irons. The boiling pussy-juice of ragingly horny korg’ii science-slaves drools over you in a wonderfully arousing shower.");

		output("\n\nThey waste no time in seizing" + (pc.hasCocks() ? " each of":"") + " your still raging-hard [pc.cocks] and ride " + (!pc.hasCocks() ? "it":"them") + " down to the base. The rest make do with the rest of your body, planting their fat pussies and fatter asses on your face. You start eating them out with the eagerness of a starving animal, enough so that, by the time you blow your load in one" + (pc.hasCocks() ? " set of":"") + " sluts, you’ve primed at least three more with a series of oral-induced orgasms.");
		output("\n\nYou lie there on the ground, smothered in pumped-up bitches all looking for a dose of your seeming endless, freshly enhanced love juice, and you’re more than happy to deliver. When you’re done giving them one round of [pc.cum], stuffing them so full that their bellies already look weighed down with a full litter, they almost immediately come back for seconds, and thirds, and stars know how many more times. Every orgasm seems to be even larger than the last as the constant stimulation seems to have triggered something in the drug she gave you. Your body expands massively, and your virility even more so. Your mind has long since broken, leaving nothing but pure animal instinct.");
		output("\n\nAlvella simply stands off to the side, breathing heavily as she shakily writes down notes. Eventually she drops the act, and her clipboard, and starts jilling off to the display.");
		output("\n\n<i>“F-f-fuck! I never expected it to be this potent at such low dosages. I’m gonna be riiiiiiiiiiiiiiiiiiiiiiiich!”</i> You note her orgasm, hell, you can almost taste it, but that’s something to deal with later. For now, and for the next however many hours, your only focus is the horny harem of huskies you’ve gathered.");
		output("\n\nTime fades into meaninglessness as you get off for what you think might be the fifth or sixth time. You barely even keep track anymore. It all just turns to mush, and you quickly lose track of even your consciousness.");
		for(var x:int = 0; x < 7; x++) { pc.orgasm(); }
		pc.libido(150);
		pc.lust(100);
		pc.physique(50);
		pc.intelligence(-30);
		pc.willpower(-30);
		pc.reflexes(-20);
		pc.aim(-20);
		pc.HPMod = 2500;
		pc.HP(2500);
		removeUvetoCold();
		processTime(42);
		addButton(0,"Next",maleBreederWargiiBadEnd2);
	}
	else
	{
		author("B");
		showName("\nCAPTIVE");
		showBust("MILODANMALE");
		// Continue here if the PC loses to a Milodan via HP
		if(pc.lust() < 33 && pc.libido() < 50 && flags["WARGII_BADEND_FUCKED"] == undefined)
		{
			//output("Your stance is wobbly and shaken; you lose your balance and fall to one knee, too injured to stand upright. You try and keep your eyes on your opponent, but that one weakness was all they needed; you feel a sharp, blunt sting against the back of your head, and then... nothing.");
			output("When you awake, " + (currentLocation == "UVGR G8" ? "you’re in a warm, windowless room you don’t recognize":"you’re exactly where you were before you lost the fight") + ", but there’s nobody around you. The Milodan warrior is gone" + (fightHasCaptive() ? ", as is the Korgonne captive they were hauling off":"") + ". Your body aches and cries in pain whenever you try to move, but even when you do, you realize that your wrists are bound behind your back" + (!pc.isNaga() ? ", and your ankles to each other":", and your [pc.leg] up against your spine") + ". You’ve also been stripped of your belongings, including your weapons" + (!pc.isNude() ? " and armor":"") + ".");
			output("\n\nWhat shakes you awake is the stomping of heavy, armored boots coming in your direction. You flinch with each one and gasp when a pair of Milodan feet enter your vision. You don’t muster the strength or the courage to lift your head up.");
			output("\n\nSo he does it for you: a rough, forceful paw slaps you on the forehead, then grips you on your scalp, as he tips your head back. You wince in pain as your neck creaks through your injuries; you hiss through clenched teeth as you’re forced to look your assailant in the eye. From your angle, you make out his thick, sturdy form, pressing against his armor, and your eyes fall onto his own calm-but-stern gaze.");
			output("\n\nHe kneels down to you, and his other paw crassly grips you by your jaw. He turns your head from side to side, and he tuts at your imperfections and bruises. You feel vulnerable and violated: this beast and his kin have defeated you, and now you’re on your bound as he inspects you the way you would a package of ground beef.");
			output("\n\n<i>“" + (!InCollection(pc.race(),"korgonne","half-korgonne","korgonne-morph") ? "Not Korgonne,":"Korgonne,") + " but...”</i> he whispers to himself as he evaluates you. You try to build up the fluids to spit at him, but even though you’ve got more than enough, the muscles in your face are too weak to do it.");
			output("\n\nBoth of his hands release you, and you sigh in relief as the kinks in your neck calm down – but then you feel the hard steel of his thick boot against your ribs. You cry out in pain as he kicks you over, onto your back, and then his hands are upon you once more, but everywhere: from your chin, to your [pc.chest], to your [pc.belly], and then to your crotch. You’ve never felt more invaded, but every time you struggle or flail, he delivers a stinging slap across your face.");
			output("\n\nThe Milodan " + (pc.hasCock() ? "gropes at your [pc.cock], cupping at your meat, his cold claws scratching uncaringly at your sensitive flesh. Then, he dips further down as he ":"") + "rudely palms and thrusts at your [pc.vagina], testing your female genitals for himself. You clench in fear at what’s going to come next, expecting the worst, but, as soon as he discovers that you indeed have feminine parts, his investigation halts.");
			output("\n\n<i>“You’ll do,”</i> he says gruffly, followed by another, softer, shove at your side, flipping you back over and onto your front. He tests the knots keeping your limbs in place by yanking at your limbs to see if they’ll come undone. Your body screams in pain at the treatment, but every time you try and cry out in pain, you feel a sharp ‘thwap!’ against your head, and the instruction to keep quiet is not lost on you. But when even that is too much effort, he withdraws a second rope and wraps it around your head and mouth. In some perverse way, it’s a thankful reprieve when he gags you. That way, your shouts of pain are too muffled to bother him....");
			output("\n\nWhen you’re adequately bound, the Milodan hefts you" + (pc.tallness >= 72 ? ", with some effort,":"") + " onto his shoulder and begins marching you to somewhere else in the hold.");
			if(currentLocation == "UVGR G8")
			{
				currentLocation = "KORGII D10";
				generateMap();
				removeUvetoCold();
			}
			processTime(35);
			addButton(0,"Next",bsFemaleFeelbadWargiiBadEnd2);
		}
		// Continue here if the PC loses to a Milodan via lust
		else
		{
			//output("\n\nYour stance is wobbly and shaken - not because you’re wounded or you’re too exhausted to keep going, but because you’re just so horny. The Milodan in front of you look so delicious in their armor, and you can smell their overbearing musk from where you are. You close your eyes as you imagine you spending time with the warriors some other way, when you feel a blunt, stinging pain at the back of your head.");
			output("When you awake, you’re " + (currentLocation != "UVGR G8" ? "exactly where you were before you lost the fight":"back in the hold proper") + ", but there’s nobody around you. The Milodan warrior is gone" + (fightHasCaptive() ? ", as is the Korgonne captive they were hauling off":"") + ". You have a bit of a bump on your head, but otherwise, you’re fine – and <i>ragingly</i> horny. Although you’ve been stripped of your possessions, your limbs are unbound and free; apparently, the Milodan warrior you were facing off with did not consider you a threat." + ((pc.lust() >= pc.lustMax() || flags["WARGII_BADEND_FUCKED"] != undefined) ? " It probably had something to do with how you succumbed to your baser desires in the fight.":""));
			pc.lust(200);
			if(currentLocation == "UVGR G8")
			{
				currentLocation = "KORGII D10";
				generateMap();
				removeUvetoCold();
			}
			output("\n\nThat said, you have a number of iridescent green jewelry hanging off you in parts that weren’t there before. They feel... <i>really</i> good to the touch; when you run your fingers on one, a delightful shock courses through your body, splitting to head towards your head and towards your crotch. You wonder how it would feel to drive this rock up against your-");
			output("\n\nThe silence of the room you’re in is broken by the stomping of heavy, armored boots coming in your direction. You look in the direction it’s coming from, and you’re face-to-face with another Milodan – a male, and different from the one you just fought. Your heart leaps into your throat, and your [pc.vagina] clenches reflexively, when you look up at that hunky, sexy piece of warrior.");
			output("\n\nYou crawl your way to his feet and you crane your neck up at him submissively: your vision swims with everything about him, from the way his powerful, all-natural wild-man muscles bulge at his thighs and along his biceps. The chest of his armor bulges with his pecs, and your mouth waters at what his abdominals must look like beneath that armor and that fur. You breathe through your nose, and you take in the wafting, masculine musk he’s broadcasting – you squint at his crotch, imagining that he <i>isn’t</i> wearing a codpiece, and that bulge is all real.");
			output("\n\nHis gloved hand pats you on the head, and you lean into it. His grip is firm, yet gentle and guiding; your gaze goes from his wrist, to his bulging arms, to his strong shoulders, and to his face. He gazes at you impetuously, judging you the way you would judge a package of ground beef, and your [pc.legOrLegs] quiver" + (pc.legCount == 1 ? "s":"") + " in delight, that such an attractive specimen would consider you.");
			output("\n\n<i>“" + (!InCollection(pc.race(),"korgonne","half-korgonne","korgonne-morph") ? "Not Korgonne,":"Korgonne,") + " but...”</i> he whispers to himself as he evaluates you. Your breath catches in your lungs; you hope that, whatever imperfection it is you have, isn’t enough to deter this Adonis from accepting you.");
			output("\n\nWith an insistent-but-not-too-forceful shove, he directs you onto your back. You roll over, and spread your limbs, your hands behind your head and your [pc.hips] swished to one side. The strong Milodan grunts in approval as his hands inspect your body: from your neck, to your [pc.chest]" + (pc.biggestTitSize() >= 1 ? " (and you thrust your torso into his hands – an invitation he takes gladly, giving your chest several hearty gropes)":"") + ", to your [pc.belly], to your limbs, and to your crotch.");
			output("\n\nThe Milodan " + (pc.hasCock() ? "gropes at your [pc.cock], yanking at your meat, making you gasp in delight at the hopes that this wonderful, powerful conqueror would have his way with you, but he doesn’t. Then, he dips further down as he ":"") + "palms and thrusts at your [pc.vagina], testing your female genitals for himself. You chew at your [pc.lipsChaste] in anticipation and you " + (pc.legCount > 1 ? "splay your legs wider, giving him more room to work with":"thrash to one side, giving him as much unobstructed access to your body as possible") + ", but, teasingly, as soon as he’s... confident that you have feminine parts, he pulls back.");
			output("\n\n<i>“You’ll do nicely,”</i> he says gruffly, followed by another, softer shove at your side, directing you to flip back onto your front. You do so gladly, on your hands and knees, resuming your earlier position. To reward you for your subservience, your warrior wraps a loose rope around your neck; it’s loose enough to hang off you limply, but secure enough to ensure you won’t leave.");
			output("\n\n<i>“Crawl,”</i> he demands with a tug, and you do so: anything for your captor. Your [pc.hips] grind against each other with each crawl forward, your [pc.vagina] dripping with arousal, your juices leaking down your thighs in submissive pleasure. Your gaze is hypnotized by your Milodan’s own gait, his muscular glutes and thick thighs dancing in front of you; you can’t resist, and you lunge forward, planting your face into his powerful butt and giving his left cheek a thick lick through the nylon of his armor.");
			output("\n\nHe grunts in surprise, but chuckles, and gives your leash another yank. You idly wonder just how this encounter is going to end....");
			processTime(30);
			pc.lust(100);
			processTime(35);
			addButton(0,"Next",bsFemaleFeelbadWargiiBadEndForLustyThots2);
		}
	}
}

public function bsFemaleFeelbadWargiiBadEndForLustyThots2():void
{
	currentLocation = "KORGII V39";
	generateMap();
	
	clearOutput();
	author("B");
	showName("\nCAPTIVE");
	showBust("MILODANMALE_NUDE");
	output("You’re led to the lowest level of the hold. You’re taken to a room where a number of the other korgonne are tied up and being held, but you’re led past them, deeper into the basement; the sound of the other whimpering korgonne and the general noise of conflict above you start to drown out with how deep into the ground you’re going.");
	output("\n\nYour final destination is some sort of room you haven’t seen before, and is unoccupied, but has another milodan warrior, just as towering and sexy, standing near it. Your milodan lead and the guard converse for a moment; you don’t understand their language, but after a few sentences, things get a bit heated, until the standing guard gives up and walks away. As he does, he gives you a judgmental, evaluating eye.");
	output("\n\nYou’re led into the room. It’s dark, too dark to see too deeply into it, but it’s warm and you don’t feel the dirt on your hands" + (pc.hasKnees() ? " and knees":"") + " as you crawl through it.");
	output("\n\nWhen you’re deep enough that the two of you are obscured from the light of the hold, your Milodan captor hurriedly strips naked, his armor clanking to the floor with several loud thuds. You can’t see him through the dark, unfortunately, but you get something better: his eager, horny, impatient hands" + (!pc.isCrotchExposed() ? ", <i>ripping</i> through your [pc.crotchCoverUnder], and":"") + " slapping on your [pc.ass] with a loud clap. You barely have time to flinch before the Milodan has his face buried into your cleft, his nose and mouth against your [pc.vagina], and drawing in a huge, wet lungful of your girlish need through his nostrils.");
	output("\n\nYour [pc.tongue] lolls from your mouth as you dissolve underneath his eagerness. He’s unfocused and unskilled: his tongue laps at you in huge swaths, from your [pc.asshole] to your [pc.clit], and he focuses on nothing and no single part of you. But that’s beside the point: knowing that you’re beneath this powerful idol of masculinity, his mouth thirsty for everything you have, just robs you of all your strength: you’re nothing but a means for him to work out his sexual needs and frustrations, and right at this moment, that’s all you could want.");
	output("\n\nAs good as a mouthful of you is, it isn’t enough to satisfy him, and his toned, thick, muscular body flops onto yours, his stomach at your back. You can feel how tense his muscles are through his short, bristly fur, giving your imagination something to work with. Then, demanding your attention further, his cock is inside you, buried down to his already-bloated knot; you hiss in delight and your own body tenses at the intrusion.");
	var miloboi:MilodanMale = new MilodanMale();
	pc.cuntChange(0,miloboi.cockVolume(0));
	output("\n\nYou’re given no opportunity to adjust, and he power fucks you into the floor of the hold. You lay flat, your limbs giving out beneath you both, your fingers clawing at the stone and leaving scratch marks wherever your hands reach. You beg him to give you more, to fuck you harder – you are his prize for subjugating not just the hold, but <i>you</i>, and the proper reward for a warrior like himself is a puppet with nary a thought beyond how they could service their puppeteer further.");
	output("\n\nIn some part of your mind, you know it’s wrong to think this way. Several floors above you, the conflict is probably still going. The Milodan have forcibly taken over the Korg’ii hold, and using borrowed technology at that. But you can’t help it! When you lost that fight because you let your hormones get the better of you, you knew that you were always powerless to stop a takeover in the face of such brutal power, physical and sexual, that the Milodan displayed. When your Milodan’s knot slips into you and his cum floods your womb, you decide, ultimately, you’ve made the better choice.");
	output("\n\nNeither of you rest. Despite the ballooning warmth in your belly, the Milodan needs only a breath before his energy kicks back up, and he resumes his frantic fucking. Your body drags along the stone floor with your treatment, and you both leave a long, slimy trail of cum the whole way across. It’s wonderful. You can only hope that <i>all</i> the Milodan are so sexually potent.");
	processTime(30);
	pc.loadInCunt(miloboi,0);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",bsFemaleFeelbadWargiiBadEndForLustyThots3);
}

public function bsFemaleFeelbadWargiiBadEndForLustyThots3():void
{
	clearOutput();
	author("B");
	showName("\nCAPTIVE");
	showBust("MILODANMALE_NUDE");
	output("It’s been three years since the subjugation of the Korg’ii hold. Or... you think. It could very well have been much longer. Time flies when you’re enjoying yourself as much as you have.");
	output("\n\nEver since the night of their insurgence, you, and the rest of the Korgonne woman, have had the predictable job of being a pleasure puppet and breeding slave for your new Milodan masters. Well, in your case, the words ‘puppet’ and ‘slave’ might be a little inappropriate: you have never once resisted when a female grabs you by " + (pc.hasHair() ? "the hair":"the back of your head") + " and shoves you face-first into their crotch, or when a male knocks you over, in the middle of a crowded room, to mount you right then and there. You’ve been languid and receptive and <i>very</i> willing the entire time. And to make things easier for everyone, you’re absolutely <i>riddled</i> with Savicite piercings all over your body: in your [pc.ears]; your [pc.nipples]; your [pc.lips]; and anywhere they couldn’t pierce, they decorated with hoops and bracelets. You’re always horny, just the way you like it.");
	output("\n\nYou learn to recognize some of the males as they approach you. Some of them display their dominance and comfort with you and your compliance by treating you roughly: they yank at your body and push you around and stick their dicks in orifices before you have a chance to brace yourself. Some of them are benevolent masters, treating you like a person rather than a rag; they don’t fuck you so much as mate with you, and they show their compassion by holding you, and kissing you, and going down on you to ensure your own orgasm." + (pc.hasCock() ? " Some of them would even give you a reach-around for your otherwise-totally-neglected [pc.cocks] as they pounded you. ":"") + "You’re open and willing to all of it... but, you decide, it’s okay to have preferences.");
	output("\n\nYou were overjoyed when you started showing signs of pregnancy. Your duties did not stop or slow, of course, and you performed admirably throughout it and each pregnancy after. Your rougher masters showed you some mercy, and the gentler ones would entertain you by giving your swollen belly compassionate rubs. You fantasized about your cubs, and you prayed that they would be as powerful and providing as whoever its father was.");
	output("\n\nIt takes the female Korgonne of the previously-occupied hold some time longer than you to accept their position in the new caste. The Milodan would frequently put you among them in their breeding rooms and orgies, and the Korgonne were more than willing to let you take their position whenever a Milodan came looking for a good time and you were available. ");
	output("\n\nYou can’t fault them, of course – the Milodan had taken their home. But, in the rare moments where you aren’t high off your own overdriven hormones, you have to admit that life here isn’t <i>so</i> bad. The sex is incredible, of course: you’re surrounded by all the muscled, hunky, statuesque warriors with stamina like bulls and cocks like third limbs all day, every day, and that alone is often enough to placate you. But, that said, you’re fed well and you have a bed of your own (not that you’ve ever slept in it alone). You’re given the shelter of the hold as your permanent homestead. All your primary needs are met.");
	output("\n\nRight now, you’re in the same room you’ve first tasted the pleasures the barbarous Milodan can provide. It’s since been lit well, and it’s been furnished with all the needs a harem of women could need, including lots of plush pillows and throw-things, and lots of pitchers of fresh water. But, in the throes of your duty, all the amenities in the room are forgotten.");
	output("\n\nIn front of you is a mass of rippling, hard Milodan muscle; thick forearms and thighs frame against a powerful set of six-pack abdominals, all clenching in effort as a hard, leaking Milodan prick fucks your throat. Your eyes flutter up at your master; he watches you with some bemused, almost bored expression; you’ve performed your services so often for so many Milodan that it’s almost become routine for some of them. You constantly try to mix it up, and in this case, you crane your neck down and slip out your [pc.tongue], giving your master’s balls a wet lick. It works, in that it breaks his expression, but it’s obvious you’ll need to do better than that.");
	output("\n\nUnderneath you is another one, his hands gripping your waist as his cock fucks you in your [pc.asshole]. While it’s uncommon for a Milodan to want your ass instead of your fertile cunt, it’s not unusual. His mouth is hungrily clamped onto your left tit, sucking at the milk you’ve been leaking nonstop since your first cub: your [pc.belly] is rounded with another pregnancy, and, judging by how long it’s been and how gravid you feel, you’re confident that there’s more than one kid inside you right now.");
	output("\n\nYou cum helplessly at your submission to these two perfect masculine forms, and at the idea that you’ll be birthing more of their perfect cubs, and that another perfect cock will slide into you and give you more. It’s all you could ever want. Losing that one fight three years ago was the best thing that could have happened to you. You want for nothing, and you have everything.");
	output("\n\nIn your quaking orgasm, the Milodan beneath you accidentally slides free from your asshole. He reaches between you two, gripping at his cock and flopping it against your [pc.vagina], and then decides that he’s had enough of your ass. He thrusts into your pussy, ready to douse your womb with another load.");
	output("\n\nIt’s all you could ever want....");
	
	days + 255+rand(10);
	processTime(120);
	var miloboi:MilodanMale = new MilodanMale();
	var y:int = 0;
	for(var x:int = 0; x < 20; x++)
	{
		pc.loadInMouth(miloboi);
		pc.loadInAss(miloboi);
		for(y = 0; y < pc.totalVaginas(); y++) { pc.loadInCunt(miloboi,y); }
	}
	pc.applyCumSoaked();
	pc.orgasm();
	badEnd();
}

public function bsFemaleFeelbadWargiiBadEnd2():void
{
	currentLocation = "KORGII V39";
	generateMap();
	
	clearOutput();
	author("B");
	showName("\nCAPTURED");
	showBust("MILODANMALE_NUDE");

	output("You’re taken to an area at the bottom of the hold, where a number of Korgonne are tied up and being held. Your [pc.legOrLegs] " + (pc.legCount == 1 ? "is":"are") + " untied from your wrists" + (pc.legCount > 1 ? ", but themselves not from each other":"") + ", so you still couldn’t hope to run or fight, even if you had the strength. You all have the same afraid, beaten, exhausted expression: some of you are strong enough to keep from crying, while others don’t try to hide how afraid they are. And, you notice, all the Korgonne are women – they must be keeping the men in some other room. If they’re keeping them at all.");
	output("\n\nYou’re kept down there for a few hours. The number of Korgonne with you pile up over time as the Milodan continue to sack the hold and capture its residents. Although there’s no door to your room, it’s guarded at all times by two Milodan huntsmen, each of them armed and armored with Pyrite Industries tech. The general noise of conflict – shots firing, metal clashing, warriors shouting, and occasionally the wet splash of something – floods into the room unimpeded the whole time, and every time you hear the footsteps of a Milodan warrior approaching, everyone in the room freezes in hesitation at what might come next, or who might be joining you.");
	output("\n\nSome of you scare yourselves to sleep, yourself included, although you each jostle awake whenever a new female Korgonne is added to the pile. You’ve lost track of the time, but you assume it’s nighttime when, terrifyingly, the noise of the conflicts stop. There are no more shots fired and no more shouting. Someone has won, and given how many women there are in this room with you, you could probably guess who.");
	output("\n\nThe sound of heavy boots marching off-sync from each other bounce off the walls. The lot of you huddle together, hoping in some way that you’d be able to protect each other from whatever comes, but you’re all too beaten and exhausted to do anything, even collectively, and you all know it.");
	output("\n\nHalf a dozen Milodan warriors enter the room, each of them wearing the same Pyrite Industries heavy-duty uniform. Some of them are smiling. Some of them <i>start</i> to smile when they enter the room, seeing what’s in it. Some of them are ambivalent. All of them are male.");
	output("\n\nThe one in front appears to be their leader, or at least one of the most seasoned warriors, given the scars on his face and his notable bulk compared to the others. He inspects the group of women in front of him appreciatively, and then looks over his shoulder and barks some order to another warrior. The Milodan that received the order frowns in frustration, but obeys his order, and posts himself in the corner of the room, right next to the only way in or out.");
	output("\n\n<i>“Our reward, boys,”</i> the leader says, and, giddy and in-sync, every warrior but the one posted next to the door begins to strip naked. Their armor and weapons stock up into a pile next to the still-armored soldier. You all watch wordlessly as the five remaining Milodan warriors shed themselves down to their loincloths, and then, those are tossed aside as well, bearing themselves to you all.");
	output("\n\nThe women in the room all know better than to scream when the five warriors descend upon them: rather, they whimper in fear and defeat, and when one of them is selected by a Milodan warrior and his rude, dirty, intrusive paws, they bite into their lips to try and stifle themselves, more afraid of what would happen if they <i>do</i> make too much noise.");
	output("\n\nYou’re not sure if you’d rather sit there and watch what comes next, to spare yourself the indecency and the shame, or if you’d rather go first and get it over with.");
	output("\n\nUnfortunately for you, the largest Milodan warrior takes a liking to your " + (!InCollection(pc.race(),"korgonne","half-korgonne","korgonne-morph","milodan","milodan-morph") ? "exotic ":"") + "form, and you aren’t given the luxury of choosing.");
	processTime(240);
	clearMenu();
	addButton(0,"Next",bsFemaleFeelbadWargiiBadEnd3);
}

public function bsFemaleFeelbadWargiiBadEnd3():void
{
	clearOutput();
	author("B");
	showName("\nCAPTURED");
	showBust("MILODANMALE_NUDE");
	output("It’s been three years since then. Or... you think it has. Although you’ve since been given permission to wander the hold as you like, you rarely ever see the light of day, and timekeeping has been a bit of a challenge.");
	output("\n\nEver since the night of their insurgence, you, and the rest of the korgonne women, have had the predictable job of being a pleasure puppet and breeding slave for your new milodan masters. The first few nights were the hardest: after the ‘war,’ all the milodan males were so hyped up from the combat, and there were so many more of them than there were Korgonne females (and yourself), that it was a solid two or three days of nonstop fucking.");
	var miloboi:MilodanMale = new MilodanMale();
	pc.cuntsChange(miloboi.cockVolume(0));

	output("\n\nNonstop dicks in your [pc.vaginas]; nonstop cocks in your mouth; and nonstop cum dripping off your body. As soon as one virile male finished inside you, he was replaced with another, for seventy-two hours straight. When there were more males than holes for them to fuck, they would either stand to the side and stroke themselves, keeping themselves excited for their turn, or they would leave and disappear somewhere – towards, you assumed, where they kept the korgonne males.");

	output("\n\nYou learned to recognize some of the males as they approached you. Some of them were rough with you: they pulled at your [pc.skinFurScales] and yanked at your limbs and paid no mind to your protests or whines, and you learned to flinch at their sight and fear them. Some of them were gentle, almost romantic with the way they held you, and kissed you, and played with your [pc.clit] as they fucked you, in an effort to get you off, and you learned to appreciate and sometimes even yearn for them.");
	if(pc.hasCock()) output(" Some of them would even give you a reach-around for "+ (pc.hasCocks() ? "one of ":"") + " your otherwise-totally-neglected [pc.cocksNounSimple] as they pounded you.");
	output("\n\nOf course, all of the women showed signs of pregnancy at roughly the same time. As soon as it became obvious, the warriors all began to treat you a little more gently, but your ‘duties’ remained no-less frequent.");
	output("\n\nAfter your first cub was born, the room that you had become so familiar with was suddenly too crowded, and no proper place to raise a proud Milodan child, so the warriors allowed you to leave and explore the hold. To the Milodan’s credit, you’ve never actually seen them kill anyone, but then, you’ve been trapped in that room for some time, so they’ve had plenty of opportunity to clean up.");
	output("\n\nYou’ve gotten used to your position as broodmare within the newly-christened Milodan hold, and on some level you know that the other Korgonne women have adjusted to it as well. It’s a pretty simple duty: often, you just do whatever you want all day, but if any Milodan, male or, sometimes, female, wants you to pleasure them, you either sink to your knees, or you bend over, depending on what they’re in the mood for.");
	output("\n\nHonestly, life isn’t <i>so</i> bad: you’re fed; you’re given a warm place to sleep; you get to experience the joy of your child growing into a strong, dutiful provider for yourself and others in the hold; and you belong in a community of others that think likewise. You even started to enjoy the sex.");
	output("\n\nRight now, you’re standing in a designated ‘rump room’ near the entrance to the hold with several other women – a room that means something decidedly different in Milodan culture. You’re expecting a group of hunters to return with a fresh catch of meat, and your men are going to need some ‘tension relief’ to wind down a good hunt – a service you’re now happy to provide.");
	output("\n\nAnd, on cue, the door to the hold is opened, allowing the hunting party to make their way back in. They’re all in good spirits, and they’re each holding a substantial amount of food for the hold to properly skin, dress, and cook. You’ll all be eating well for at least a few days with this catch alone. Your hard workers deserve a reward.");
	output("\n\nYou recognize one of the hunters immediately. Your favorite one. You two rarely exchange words, and you don’t know his name. All you know is that he treats you gently; he cares about your pleasure; and, if you’re honest, you find him handsome, compared to the others. When he enters the rump room, you eagerly help him out of his Pyrite Industries armor, getting him as naked as you are.");
	output("\n\nHis musk fills your nostrils, particularly when you sink to your knees and untie his loincloth, revealing his bulging sheath and bouncing balls. His gentle hand rests on your head, and you lean in, pressing your nose against his growing shaft and inhaling as you draw your [pc.tongue] against his heavy balls, arousing him further.");
	output("\n\nOn top of everything else this particular Milodan has going for him, he smells and tastes the best, too....");

	days += 225;
	processTime(50);

	var y:int = 0;
	for(var x:int = 0; x < 20; x++)
	{
		pc.loadInMouth(miloboi);
		pc.loadInAss(miloboi);
		for(y = 0; y < pc.totalVaginas(); y++) { pc.loadInCunt(miloboi,y); }
	}
	pc.applyCumSoaked();
	badEnd();
}

public function maleBreederWargiiBadEnd2():void
{
	clearOutput();
	showBust("ALVELLA","MILODANMALE",tuuvaBustString(true));
	showName("\nALVELLA");
	output("You wake up sometime later, chained up, lacking your harem, and achingly hard. This displeases you. You were the king of those little bitches, damn it! How dare they take your property! Something interrupts your thoughts, something... you don’t even know. It’s like you’re forgetting something. Bits of your old life are trying to reach out to you, but you shake them away. They’re too unrecognizable to you to mean anything at this point. You just want some more bitches to fuck. Should you even want anything else?");
	output("\n\nAlvella walks in with a pair of bodyguards. <i>“Well, congratulations. Pyrite looooooved the data we got from you, and they’ve already started to license out the formula. Of course, that’s not the only one we’re testing out right now. Since you took so well to the last one, I’ve decided to take you out to our ‘special product’ testing. Boys.”</i> She motions the two bodyguards to get you. They grab a heavy leash wrapped around your neck and pull you up. You chuckle as you loom over them, their impressive stature seeming almost child-like compared to you. The drug she gave you has turned you into a real goliath, with " + (!pc.hasCocks() ? "a cock":"cocks") + " to match. You swear you can <i>feel</i> their jealousy.");
	output("\n\nYou grin at Alvella, remembering the promise you made to yourself to <i>“deal”</i> with her. She puts on a show of disinterest, but she’s a terrible actress. Her thighs rub together, she grows so flush that you can tell even through her fur, and her eyes dart at your hugely-enhanced [pc.cockNounSimple]. Oh yeah, you’re going to have fun with this bitch.");
	output("\n\nThey drag you out of the tent and into an open area out back. You see more korgonne around you, chained to an almost ludicrous degree. Do they really think these little twerps need to be strapped down so hard? Pussies. You see another pair of milodan guards walking up to one of the prisoners and attempting to take them, with no small amount of trouble. " + (flags["MET_TUUVA"] != undefined ? "It’s no wonder they’re having problems, you recognize the unusually small korg as none other than Tuuva.":"She’s a tiny little thing, but the amount of muscle on her definitely explains how she’s giving them trouble.") + " Even through the muzzle they put on her, you can tell she’s screaming and cussing like a little firebrand. Of course, she’s covered in enough bindings to keep an elephant held down, so she can’t do much more than make it annoying for them. They take her out to the middle of the area and one of them pulls out a vial of blue liquid.");
	output("\n\n<i>“Here’s my crowning achievement. The bitches are great for breeding stock: strong-built, even before my ‘enhancements’ and fertile enough to keep up. But the men? Small, weak, barely enticing for anyone with access to even a single milodan male. As such I’ve been left with most of them. Of course, herms like this one were quite the surprise. I wish I could have gotten both of them, but one of those fat priestess whores snatched up the other one before I had my pick!”</i> You can tell she’s pissed off, but all this talk of enhancements is making you wonder if you can turn this loudmouth little twig into grade A breeding material.");
	output("\n\n<i>“Anyway, I couldn’t just dump the little twerps. I’m not heartless. So, I devised a formula to give them a ‘little boost’ to make them more appealing.”</i> She points over to a rack of korg males that you hadn’t noticed. At least, you <i>think</i> they’re korgonne. Like you, they’re massive, muscular, and hung, even more so, in fact. Bullshit! But they’re also feral looking, with oddly-shaped muzzles, huge fangs, and long, ragged fur. They almost look like some kind of hybrid between a korgonne and a milodan with an extra, healthy dose of crazy.");
	output("\n\n<i>“I figured, if they were too weak compared to our own men, why not just infuse our best traits into them to make them more attractive?”</i> As she finishes, you hear one of the transformed males snarl and beat against his bindings with surprising effectiveness. It takes two guards to subdue him before he either hurts himself or actually breaks out. <i>“... I may have gone too far in some places. But I happen to know some women who love the hyper-aggressive type. That brings me to you and her. You’re very special subjects, so I’ve taken the time to prepare some specialized concoctions for the two of you. Of course I haven’t tested these yet, but that’s what she’s for.”</i>");
	output("\n\nThe milodans rip off " + (flags["MET_TUUVA"] != undefined ? "Tuuva’s":"the little korgonne’s") + " muzzle, exposing themselves to her ranting for a brief moment before one grabs her face and holds her mouth open while the other dumps the liquid down her throat. She tries to spit it out, but her mouth is slammed shut by one while the other holds her nose. She panics as she realizes that her only choices are to swallow or pass out. She apparently chooses the latter, but as her eyes start to flicker, you see her swallow, resistance failing. The two brutes let go, causing her to fall limply to the ground as she gasps for breath.");
	output("\n\nA minute passes, and the two men as well as Alvella seem confused at the lack of changes. " + (flags["MET_TUUVA"] != undefined ? "Tuuva":"the korg") + " is just lying there, recovering from her near-asphyxiation.");
	output("\n\n<i>“Well. That’s disappointing. Maybe some of the additives neutralized the base components? All right, take her back. I’ll reconfigure the formula and we’ll...”</i> She’s interrupted by an ear-piercing shriek from " + (flags["MET_TUUVA"] != undefined ? "Tuuva":"the captured korgonne") + ". She shoots up straight as a board, howling into the air as she begins shifting before your eyes.");
	output("\n\nHer muscles bulge out, slowly turning the already burly bitch into a beefed-up bruiser. The morphing korg’s height increases at a similar rate, taking her from tot to titan and even further beyond. The chains restraining her start to strain, not just from her sheer bulk, but from what must be a massive amount of strength she’s exerting. Her breasts fill out so much that a chain crossing over them buckles and snaps, sending mangled links flying across the field. The rock-hard [tuuva.cockNoun] dangling from her crotch bulges to over twice its normal size as it grows rapidly. It’s well over four feet by the time it’s done.");
	output("\n\nAs ridiculously big as it is, it seems like it’s going to be fitting for her new stature and form. The ever more beastly bitch’s transformation takes on a stranger note as her snout elongates and her teeth grow into bestial fangs. Her eyes start to glow, her pupils shrinking into thin slits. Long horns sprout from her head, and her hands and feet grow massive talons. By the time she’s done, she looks like a cross between a hound and a dragon, and her chains are barely holding on.");
	output("\n\n<i>“My my, I didn’t expect the frostwyrm blood to have such a pronounced effect! I suppose it’s only fair, given how hard it was to get.”</i> " + (flags["MET_TUUVA"] != undefined ? "Tuuva":"the beastly hybrid") + " roars in anger as her obscene cock drools pre like a faucet. <i>“Oh dear, she’s already pent up. Bring the royal sow out; I’m not sure any of the other sluts could handle this.”</i>");
	output("\n\nAs the fluffy dragon-mutt howls and rips against her restraints, the milodan guards dash away, ducking into another tent just as the straining of the chains reaches its peak. She busts out, scattering ripped chain links across the field.");
	output("\n\nYou reel back a bit, expecting the beast to charge you, but instead she stops. The titan looks over herself and chuckles. <i>“Tuuva... <b>big! TUUVA BIG</b>!”</i> She looks over at Alvella and starts marching over, cracking her knuckles together and getting ready to beat the little bitch’s head in. Alvella doesn’t seem too bothered by it. She simply reaches into her jacket pocket, pulls out a pair of nose plugs, and inserts them. You wonder what she’s up to, until both you and Tuuva are suddenly overcome by an intoxicating scent.");
	output("\n\nThe focus in Tuuva’s eyes drains out in seconds as her cock somehow gets harder and spits opaque pre several feet in front of her. Your own body feels almost super-naturally horny. You’ve never been this hard! You look around for the source of the smell, for something to fuck! Your jaw drops when you finally see the source. The two guards who went off earlier come out of the tent, nose plugs in, escorting the biggest bombshell you’ve ever seen.");
	output("\n\nThe thought going through the back of your mind is <i>“What did they do to Ula?”</i> but that thought never manages to even dent the much more prevailing thought of breeding that bitch into the ground! Whatever they did to the men, they’ve done something worse to the former princess. She’s massive, not as big as Tuuva, but larger than you, with breasts that could completely smother a normal korg and hips and thighs that make a lot of tree trunks look skinny. But what really draws your attention is her pussy. It’s obscenely fat, with a clit that’s massive, throbbing, and begging to be touched. It’s positively drooling fluids, and you can tell <i>that’s</i> where the intoxicating smell is coming from.");
	output("\n\n<i>“T-T-TUUVA FUCK!”</i> The drago-korg jumps Ula, knocking the two milodans flat on their asses as she pins the bimbo bitch to the ground and plugs her with over two feet of cock in one go. You drool as Tuuva roars in triumph. You want a piece for that! You try and rush toward them, but Alvella yanks your chain, keeping you in place, much to your rage.");
	output("\n\n<i>“Medicine first, then treats.”</i> She dangles a similar-looking vial to what they gave to Tuuva. If it’s anything like what they gave to her, you don’t know if there’ll be anything left of you if you take it. Do you really want to give up your humanity, become a near-mindless beast, just to get some pussy? Well, you’re already drinking it, so there’s your answer.");
	output("\n\nYou can <i>feel</i> it just from it going down your throat. Every cell the liquid touches feels like it was struck by lightning, and your muscles are already starting to tighten. You jump when it finally hits your gut. Your body swells with a speed that takes your breath away. Stars, the power is so amazing! You flex your still swelling muscles and manage to shatter the chains like nothing. Your already massive [pc.cockNounSimple] grows to obscene proportions, hosing thick pre that’s growing more and more potent by the second.");
	output("\n\nYou don’t even wait for your body to finish. You rush over to Ula, hoist her up while Tuuva is still balls deep in her pussy, and ram your monster-cock in her ass. The pumped princess moans out as she’s ravaged by two raging beasts. Any thoughts you had before are replaced by bestial commands as your [pc.cockNounSimple] spears Ula. You’ve become so virile that if you were in her pussy, she’d be knocked up multiple times over just from your pre. Alas, Tuuva gets first dibs on breeding, but it’s not like Ula’s going to be doing anything else from now on.");
	pc.cockChange();
	output("\n\nAlvella watches on, flat on her ass, four fingers buried in her pussy. The look on her face is pure rapture, like she’s completely lost her mind. The same is true for the men. They’re all achingly erect, so eager for pleasure that they even start fucking each other. Taking a whiff of the air, it’s easy to tell what’s causing this. The three of you rutting is kicking up a cloud of pheromones so thick that you can almost taste it with each breath.");
	output("\n\nThe camp turns into an orgy pit, with you, Ula, and Tuuva at the center. When you’ve had your fill of her, you move on immediately, grabbing a male milodan and ramming him as far down your dick as possible. He doesn’t mind, even as his gut forms into the shape of your [pc.cockNounSimple]. He just keeps jerking himself off, coating himself in layers of his own ejaculate as you flatten his prostate, forcing him to orgasm back-to-back. You fill him up like a balloon, tossing him off when your [pc.cum] starts flowing out of his overfilled ass, and letting the rest of your orgasm spill over whoever happens to be there.");
	output("\n\nYou run through another dozen partners; man, woman, doesn’t matter as long as you get off. The bimbo korgs got out at some point, only adding to the sheer chaos. At some point, you notice Tuuva calling you over, Alvella strung over her shoulder, filled to the brim. You walk over, another korg bitch still stuck on your dick.");
	output("\n\nTuuva holds up a pink injection needle in front of Alvella’s face. <i>“Want?”</i>");
	output("\n\n<i>“Y-y-yes, YES YES! IT’S ALL I’VE EVER WANTED! I WANT TO BE YOUR BRAINLESS LITTLE CUMDUMP!”</i> Tuuva jams the needle into her ass, and it starts to work immediately. The scrawny little twerp babbles as she fills out, gaining curves that you find far more fitting of someone like her. Before she even finishes, Tuuva rams her down on her cock, spreading her cheeks to give you access to her ass.");
	output("\n\nThis is the life.");
	processTime(120);
	pc.orgasm();
	pc.libido(100);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",maleBreederWargiiBadEnd3);
}

public function maleBreederWargiiBadEnd3():void
{
	clearOutput();
	showBust("ALVELLA","MILODANMALE",tuuvaBustString(true));
	showName("\nALVELLA");
	output("Sometime between the start of the camp-wide orgy and when anyone actually bothered to check up on you, the universe lost track of you. No one knows what happened or where any of you went. Search parties were sent out, but none ever even got close.");
	output("\n\nYou and Tuuva took your new collection of fuckboys and bitches and started up your own tribe, far away from civilization. You fucked, you bred, you hunted. There was no concern left for anything else in your mind. Your dad’s quest had long since fallen from thought, as did even your memories of life before this.");
	output("\n\nOnly the tribe matters now.");
	badEnd();
}