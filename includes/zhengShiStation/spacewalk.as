//[Space Walk]
//Take a walk on the surface of the asteroid.
//Already done TT: You already fixed the power coupling. No need to go out there again.
//No helmet TT: You could do this if you wanted your insides to get sucked out of your eye sockets. Otherwise, you’d better find a helmet to go with that space suit.

public function spacewalkGoooo():void
{
	clearOutput();
	if(silly) showName("\nSPAAAAACE");
	else showName("\nSPACEWALK");
	author("Savin");

	/*output("You spend a few minutes setting your kit aside and stuffing yourself into the space suit hanging up on the rack. Luckily it’s made to resize automatically to the wearer’s form, as whoever wore it last was clearly {PC taur/naga: not of your bestial proportions");
	//PC huge: much smaller than you were //PC smol: much larger than you //PC normal: differently proportioned than you are}. With a little stretching and a little pulling, you’re able to force the space suit to conform more or less to your body shape and affix the big glass bubble helmet to the metal collar around your shoulders.*/
	output("A flickering HUD pops into existence once you secure the air seal, showing power levels and oxygen reserves.");

	output("\n\nEverything looks good, and so you active the suit’s mag-boots and punch the cycle button on the exterior airlock. There’s a thunderous hiss all around you as the air is slowly drained out, leaving you to rely on the suit’s internal tanks, before the outer door beeps and unlocks; you head a metal rumbling as the bars slide out, permitting you to open her up.");
	output("\n\nYou throw the door open and take a ponderous, magnetized step forward. The catwalk bolted to the asteroid’s surface sucks your boot back down almost as soon as you free it from the airlock, making you work for every step. The catwalk’s long and winding, hugging the surface around craggy outcroppings and blasted chunks of crevaceous crust. After perhaps twenty minutes of stomping across the platforms, you come to a section where large, plastic tubes poke out from within the asteroid’s body, running along the surface for maybe twenty yards before retreating underground.");
	output("\n\nOne of them has been ripped open, exposing a power coupling that’s spilled its internal wiring all over itself and floating out into space. Something <i>big</i> must have nicked it. Now whatever the device is supposed to be powering isn’t getting any juice... maybe the elevator? If so, this is your ticket to getting down into the heart of this station.");
	processTime(15);
	clearMenu();
	addButton(0,"Next",spacewalkSuccess);
}

public function spacewalkSuccess():void
{
	clearOutput();
	showName("\nOH NO!");
	showBust("EXCAVATION_ROBOT");
	author("Savin");
	moveTo("ZSM SPACE");
	output("You close the distance and set to work, pulling the wires free of the torn bits of plastic and looking to assess the damage.");
	output("\n\nBefore you can finish the job, though, you notice a shadow growing larger, looming over you. You look up just in time to see a massive mechanical spider crawling down from a rocky outcropping overhead, crunching rock beneath its myriad black legs as it scuttles towards you. A pair of red eye-like sensors, one on top of the other, scan over you before a pair of clawed grappler arms spring up from the metal beast’s back, snapping at you menacingly!");
	output("\n\nThere’s no sound out here in the black, but as the beast hurls itself towards you, the comms in your suit’s helmet spring to life with a horrific howl of high-pitched static. The creature’s broadcasts are more deafening than its roar could ever be, leaving you gritting your teeth.");
	output("\n\nYou draw your [pc.weapon] and brace yourself. Better not let let this thing get too close, or else you’re going to end up dead!");
	processTime(2);
	
	var tEnemy:ExcavationRobot = new ExcavationRobot();
	tEnemy.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.victoryScene(pcIsVictoriousVsMiningBottle);
	CombatManager.lossScene(pcIsDefeatedByMiningBot);
	CombatManager.displayLocation("E. ROBOT");
	
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

/*The Spider-Crab-Murderbot Fight
This robot has like 1,000 HP and some shields on top, as well as heavy armor. It is highly vulnerable to electrical attacks, but any Paralysis/Stun effects against it is downgraded to a Stagger. No stunlocky bossy. This thing should hit like a truck with massive Physique, but it’s got no Reflexes or INT/WIL to speak of. AIM is okay.

output("\n\nDue to fighting in space, the PC takes a -{some big number} penalty to Evasion and Reflexes.");
*/

public function pcIsDefeatedByMiningBot():void
{
	showBust("EXCAVATION_ROBOT");
	author("Savin");
	output("The robot slams you right in the chest with one of its tree-trunk arms, hard enough to disconnect your magboots from the walkway. You scream as you’re thrown backwards, floating through the darkness away from the asteroid. The mining robot doesn’t need to follow through - why would it? You’re no longer a threat, indeed you’re all but a floating corpse already. You’ve got no tether and no external jets: you’re at the mercy of the gravitational winds. The robot scrabbles off back the way it came, and you... you just go floating away, never to be seen again.");
	badEnd();
	//<b>GAME OVER</b>
}

//PC is Victorious
public function pcIsVictoriousVsMiningBottle():void
{
	showBust("EXCAVATION_ROBOT");
	author("Savin");
	flags["ZHENG_SPACEWALKED"] = 1;
	output("The robot staggers backwards under the force of your assault, screeching over the comms and flailing its grappling arms until with a bellow of static, it goes crashing off the side of the walkway and off into the aether. You’re left to watch as the mining robot tumbles through space, off and away into the asteroid belt, never to be seen again.");
	output("\n\nWith the imminent threat dealt with, you return your attention to the damaged power coupling. It’s a simple fix once you find the problem - just a wire that needs some repair. After defeating the mining bot, there’s plenty of spares floating around within reach.");
	output("\n\n");
	eventQueue.push(beatBotFixWire);
	CombatManager.genericVictory();
}

public function beatBotFixWire():void
{
	clearOutput();
	showName("JOB’S\nDONE");
	output("With your job done, you turn around. Do you stomp back into the airlock... or walk around into the hangar you landed in?");

	clearMenu();
	addButton(0,"Airlock",move,"ZSM YY18");
	addButton(1,"Hangar",fastSpacewalkToHangar);
}